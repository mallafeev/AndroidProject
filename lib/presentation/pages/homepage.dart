import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmu_malafeev_pi31/components/extensions/context_x.dart';
import 'package:pmu_malafeev_pi31/data/utils/debounce.dart';
import 'package:pmu_malafeev_pi31/models/card_data.dart';
import 'package:pmu_malafeev_pi31/presentation/bloc/bloc.dart';
import 'package:pmu_malafeev_pi31/presentation/bloc/events.dart';
import 'package:pmu_malafeev_pi31/presentation/bloc/state.dart';
import 'package:pmu_malafeev_pi31/presentation/common/svg_objects.dart';
import 'package:pmu_malafeev_pi31/presentation/like_bloc/like_bloc.dart';
import 'package:pmu_malafeev_pi31/presentation/like_bloc/like_events.dart';
import 'package:pmu_malafeev_pi31/presentation/like_bloc/like_state.dart';
import 'package:pmu_malafeev_pi31/presentation/locale_bloc/locale_bloc.dart';
import 'package:pmu_malafeev_pi31/presentation/locale_bloc/locale_events.dart';
import 'package:pmu_malafeev_pi31/presentation/locale_bloc/locale_state.dart';
import 'package:pmu_malafeev_pi31/presentation/pages/datailpage.dart';
part '../widgets/card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final searchController = TextEditingController();

  @override
  void initState() {
    SvgObjects.init();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBlock>().add(const HomeLoadDataEvent());
      context.read<LikeBloc>().add(const LoadLikesEvent());
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() {
    context.read<HomeBlock>().add(HomeLoadDataEvent(search: searchController.text));
    return Future.value(null);
  }
  void _onLike(String? id, String name, bool isLiked){
    print("IDDDDD");
    print(id);
    if(id!=null){
      context.read<LikeBloc>().add(ChangeLikeEvent(id));
      _showSnackBar(context, name, !isLiked);
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: CupertinoSearchTextField(
                    controller: searchController,
                    placeholder: context.locale.search,
                    onSubmitted: (search) {
                      Debounce.run(() => context.read<HomeBlock>().add(HomeLoadDataEvent(search: search)));
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => context.read<LocaleBloc>().add(const ChangeLocaleEvent()),
                child: SizedBox.square(
                  dimension: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: BlocBuilder<LocaleBloc, LocaleState>(
                      builder: (context,state) {
                        return state.currentLocale.languageCode == 'ru' ? const SvgRu() : const SvgUs();
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
          BlocBuilder<HomeBlock, HomeState>(
              builder: (context, state) => state.error != null
                  ? Text(
                state.error ?? "",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.red),
              )
                  : state.isLoading
                  ? const CircularProgressIndicator()
                  : BlocBuilder<LikeBloc, LikeState>(
                  builder: (context, likeState) {
                    return Expanded(
                        child: RefreshIndicator(
                          onRefresh: _onRefresh,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: state.data?.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              final data = state.data?.data?[index];
                              return data != null
                                  ? _Card.fromData(
                                data,
                                onLike: _onLike,
                                isLiked: likeState.likedIds?.contains(data.id) == true,
                                onTap: () => _navToDetails(context, data),
                              )
                                  : const SizedBox.shrink();
                            },
                          ),
                        ));
                  }
              ))
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String name, bool isLiked) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          '${isLiked ? context.locale.liked : context.locale.disliked} $name',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        backgroundColor: Colors.pinkAccent,
        duration: const Duration(seconds: 1),
      ));
    });
  }

  void _navToDetails(BuildContext context, CardData data) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => DetailsPage(data)));
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmu_malafeev_pi31/data/repositories/fortnite_repository.dart';
import 'package:pmu_malafeev_pi31/presentation/bloc/bloc.dart';
import 'package:pmu_malafeev_pi31/presentation/like_bloc/like_bloc.dart';
import 'package:pmu_malafeev_pi31/presentation/locale_bloc/locale_bloc.dart';
import 'package:pmu_malafeev_pi31/presentation/locale_bloc/locale_state.dart';
import 'package:pmu_malafeev_pi31/presentation/pages/homepage.dart';
import 'package:pmu_malafeev_pi31/presentation/classes/skin.dart';
import 'components/locale/l10n/app_locale.dart';

void main() {
  runApp(const MyApp());
  changeSkinNames();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocaleBloc>(
      lazy: false,
      create: (context) => LocaleBloc(Locale(Platform.localeName)),
      child: BlocBuilder<LocaleBloc, LocaleState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              locale: state.currentLocale,
              localizationsDelegates: AppLocale.localizationsDelegates,
              supportedLocales: AppLocale.supportedLocales,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: RepositoryProvider<FortniteRepository>(
                lazy: true,
                create: (_) => FortniteRepository(),
                child: BlocProvider<LikeBloc>(
                  lazy: false,
                  create: (context) => LikeBloc(),
                  child: BlocProvider<HomeBlock>(
                    lazy: false,
                    create: (context) => HomeBlock(context.read<FortniteRepository>()),
                    child: const MyHomePage(),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}

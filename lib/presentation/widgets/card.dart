part of '../pages/homepage.dart';

typedef OnLikeCallback = void Function(String? id,String name, bool isLiked)?;

class _Card extends StatelessWidget {
  final String name;
  final String rarity;
  final String descriptionText;
  final String? imageUrl;
  final OnLikeCallback onLike;
  final VoidCallback? onTap;
  final String? id;
  final bool isLiked;
  const _Card(
      this.name, {
        required this.descriptionText,
        required this.rarity,
        this.imageUrl,
        this.onLike,
        this.onTap,
        this.id,
        this.isLiked = false,
      });

  factory _Card.fromData(CardData data, {OnLikeCallback onLike, VoidCallback? onTap, bool isLiked = false}) => _Card(
      data.name,
      descriptionText: data.descriptionText,
      rarity: data.rarity,
      imageUrl: data.imageUrl,
      onLike: onLike,
      onTap: onTap,
      isLiked: isLiked,
      id: data.id

  );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(minHeight: 140),
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              spreadRadius: 4,
              offset: const Offset(0, 5),
              blurRadius: 8,
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                child: SizedBox(
                  height: double.infinity,
                  width: 100,
                  child: Image.network(
                    imageUrl ?? '',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Placeholder(),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        descriptionText,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        "Rarity:${rarity}",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    bottom: 8,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      print("Like:");
                      print(isLiked);
                      print("ID:");
                      print(id);

                      onLike?.call(id,name,isLiked);

                      print('Icon tapped');
                      print("Like2:");
                      print(isLiked);
                      print("ID2:");
                      print(id);
                      },

                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: isLiked
                          ? const Icon(
                        Icons.favorite,
                        color: Colors.redAccent,
                        key: ValueKey<int>(0),
                      )
                          : const Icon(
                        Icons.favorite_border,
                        key: ValueKey<int>(1),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

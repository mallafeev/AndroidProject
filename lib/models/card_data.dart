class CardData {
  final String name;
  final String rarity;
  final String descriptionText;
  final String? imageUrl;
  final String? id;

  CardData(
    this.name, {
    required this.descriptionText,
    required this.rarity,
    this.imageUrl,
    this.id
  });
}

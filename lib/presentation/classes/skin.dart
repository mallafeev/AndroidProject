class FortniteSkin {
  final String imageUrl;
  final String name;
  final String description;
  final Rarity rarity;

  FortniteSkin({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.rarity,
  });
}

enum Rarity {
  unknown(0),
  Legendary(1),
  Epic(2),
  Rare(3),
  Common(4);

  final int value;

  const Rarity(this.value);
}

String getRarityString(Rarity rarity) {
  switch (rarity) {
    case Rarity.unknown:
      return 'Unknown';
    case Rarity.Legendary:
      return 'Legendary';
    case Rarity.Epic:
      return 'Epic';
    case Rarity.Rare:
      return 'Rare';
    case Rarity.Common:
      return 'Common';
    default:
      return 'Unknown';
  }
}

void changeSkinNames() {
  final List<FortniteSkin> skins = [
    FortniteSkin(
      imageUrl: 'assets/images/shark.png',
      name: 'Safety First Steve',
      description: 'Dont make him blow the whistle.!',
      rarity: Rarity.Epic,
    ),
    FortniteSkin(
      imageUrl: 'assets/images/raven.png',
      name: 'Raven',
      description: 'Brooding master of dark skies.',
      rarity: Rarity.Legendary,
    ),
  ];
  final Future aboba = printAboba();
  //print(aboba);
  final List<FortniteSkin> updatedSkins = [];

  for (var skin in skins) {
    updatedSkins.add(FortniteSkin(
      imageUrl: skin.imageUrl,
      name: '${skin.name} 2',
      description: skin.description,
      rarity: skin.rarity,
    ));
  }

  updatedSkins.forEach((FortniteSkin e) => print(e.name));
}

Future<void> printAboba() async {
  print("This is how work Future");
  await Future.delayed(const Duration(seconds: 2));
  print("This is how work Future");
}

class SoldFortniteSkin extends FortniteSkin {
  final int price;

  SoldFortniteSkin({
    required String imageUrl,
    required String name,
    required String description,
    required Rarity rarity,
    required this.price,
  }) : super(
          imageUrl: imageUrl,
          name: name,
          description: description,
          rarity: rarity,
        );
}

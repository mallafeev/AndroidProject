import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmu_malafeev_pi31/models/card_data.dart';

class DetailsPage extends StatelessWidget {
  final CardData data;

  const DetailsPage(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent, // Устанавливаем фон страницы
      appBar: AppBar(
        title: Text(data.name),
        backgroundColor: Colors.greenAccent, // Цвет AppBar под стиль
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Image.network(
                data.imageUrl ?? '',
                width: 500,
                height: 500,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                data.name,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.descriptionText,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  data.rarity,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

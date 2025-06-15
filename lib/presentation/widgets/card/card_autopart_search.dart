import 'package:flutter/material.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart.dart';
import 'package:san_andres_mobile/presentation/widgets/carousel/carousel_card.dart';

class CardAutopartSearch extends StatelessWidget {
  final AutopartSearchList autopart;
  const CardAutopartSearch({
    super.key,
    required this.autopart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              autopart.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text('Category: ${autopart.categoryName}'),
            Text('Brand: ${autopart.brandName}'),
            const SizedBox(height: 8),
            if (autopart.assets.isNotEmpty)
              SizedBox(
                height: 150,
                child: CarouselCard(assets: autopart.assets),
              ),
            const SizedBox(height: 8),
            if (autopart.infos.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Details:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ...autopart.infos.map<Widget>((info) => Text(
                        '${info.typeName}: ${info.value}',
                      )),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

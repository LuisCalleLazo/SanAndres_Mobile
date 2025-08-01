import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    return InkWell(
      onTap: () {
        context.push('/autoparts/detail-of-search', extra: autopart);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                autopart.name,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[900]),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text(
                    "Categoria",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(autopart.categoryName)
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Marca",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(autopart.brandName)
                ],
              ),
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
                      'Detalles:',
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
      ),
    );
  }
}

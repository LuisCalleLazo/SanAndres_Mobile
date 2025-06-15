import 'package:flutter/material.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart.dart';

class CarouselCard extends StatelessWidget {
  final List<AutopartAsset> assets;
  const CarouselCard({
    super.key,
    required this.assets,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: assets.length,
      itemBuilder: (context, index) {
        final asset = assets[index];
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              asset.asset,
              width: 150,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return SizedBox(
                  width: 150,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) => Container(
                width: 150,
                color: Colors.grey[200],
                child: const Icon(Icons.broken_image),
              ),
            ),
          ),
        );
      },
    );
  }
}

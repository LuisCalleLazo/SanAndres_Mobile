import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:san_andres_mobile/domain/entities/seller/seller.dart';

class CardAutoparSeller extends StatelessWidget {
  final SellerByAutopart seller;
  const CardAutoparSeller({
    super.key,
    required this.seller,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push("/autoparts/search-map");
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
            horizontal: 8, vertical: 4), // Fondo negro oscuro
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Foto del vendedor o icono
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 114, 7, 7), // Rojo guindo
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color.fromARGB(255, 110, 6, 6),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: seller.photo != null
                      ? Image.network(
                          seller.photo!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              _buildPlaceholderIcon(),
                        )
                      : _buildPlaceholderIcon(),
                ),
              ),
              const SizedBox(width: 12),
              // Información del vendedor
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nombre del vendedor y compañía
                    Text(
                      seller.nameSeller,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      seller.nameCompany,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Precios
                    _buildInfoRow(
                        'Precio al detal:', '${seller.retailPrice} Bs'),
                    _buildInfoRow(
                        'Precio al por mayor:', '${seller.wholesalePrice} Bs'),

                    // Ubicación
                    _buildInfoRow('Ciudad:', seller.city),
                    _buildInfoRow('País:', seller.country),

                    // Unidades disponibles (si aplica)
                    if (seller.unitsAvailable != null)
                      _buildInfoRow(
                          'Unidades disponibles:', '${seller.unitsAvailable}'),

                    // Teléfono
                    _buildInfoRow('Teléfono:', seller.phone),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholderIcon() {
    return const Center(
      child: Icon(
        Icons.person,
        size: 30,
        color: Colors.white,
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$label ',
              style: const TextStyle(
                color: Color.fromARGB(255, 116, 8, 8), // Rojo guindo
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

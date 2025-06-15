import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:san_andres_mobile/domain/entities/autoparts/autopart.dart';
import 'package:san_andres_mobile/domain/entities/seller/seller.dart';
import 'package:san_andres_mobile/presentation/provider/autopart_search_provider.dart';
import 'package:san_andres_mobile/presentation/services/input_controller_manager.dart';
import 'package:san_andres_mobile/presentation/widgets/card/card_autopar_seller.dart';
import 'package:san_andres_mobile/presentation/widgets/carousel/carousel_card.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_default.dart';
import 'package:san_andres_mobile/shared/data/autopart_seller.dart';

class DetailSearchAutopart extends StatefulWidget {
  static String name = "detail_search_autopart";
  final AutopartSearchList autopart; // Lista de vendedores

  const DetailSearchAutopart({
    super.key,
    required this.autopart, // Asegúrate de pasar esta lista al constructor
  });

  @override
  State<DetailSearchAutopart> createState() => _DetailSearchAutopartState();
}

class _DetailSearchAutopartState extends State<DetailSearchAutopart> {
  final InputControllerManager _inputManager = InputControllerManager();
  void _searchAutoparts() {
    final provider = context.read<AutopartSearchProvider>();
    provider.searchAutoparts(
      productName: widget.autopart.name,
      categoryId: widget.autopart.categoryId,
      brandId: widget.autopart.brandId,
      minPrice: _inputManager.getController("price_min_autopart").text,
      maxPrice: _inputManager.getController("price_max_autopart").text,
    );
  }

  void _clearFilters() {
    _inputManager.clearAll();
    _searchAutoparts();
  }

  @override
  Widget build(BuildContext context) {
    List<SellerByAutopart> sellers = sellersByAutoparts;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.autopart.name),
      ),
      body: Column(
        children: [
          // Parte superior (35% de la pantalla)
          ExpansionTile(
            title: const Text("Datos de autoparte"),
            leading: Icon(
              Icons.info,
              color: Colors.red[900],
            ),
            children: [
              Center(
                child: Text(
                  widget.autopart.name,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[900]),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text(
                    "Categoria:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(widget.autopart.categoryName)
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Marca:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(widget.autopart.brandName)
                ],
              ),
              const SizedBox(height: 8),
              if (widget.autopart.assets.isNotEmpty)
                SizedBox(
                  height: 150,
                  child: CarouselCard(assets: widget.autopart.assets),
                ),
              const SizedBox(height: 8),
              if (widget.autopart.infos.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Details:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ...widget.autopart.infos.map<Widget>((info) => Text(
                          '${info.typeName}: ${info.value}',
                        )),
                  ],
                ),
            ],
          ),

          // Parte de filtros
          ExpansionTile(
            title: const Text("Filtros"),
            leading: Icon(
              Icons.filter_alt,
              color: Colors.red[900],
            ),
            children: [
              Row(
                children: [
                  Expanded(
                    child: InputDefault(
                      label: "Minimo",
                      controller:
                          _inputManager.getController("price_min_autopart"),
                      type: TextInputType.number,
                      icon: Icons.price_change,
                    ),
                  ),
                  Expanded(
                    child: InputDefault(
                      label: "Maximo",
                      controller:
                          _inputManager.getController("price_max_autopart"),
                      type: TextInputType.number,
                      icon: Icons.price_change,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _searchAutoparts,
                      child: Text(
                        'Aplicar',
                        style: TextStyle(color: Colors.red[700]),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _clearFilters,
                      child: Text(
                        'Limpiar',
                        style: TextStyle(color: Colors.red[700]),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Parte inferior (ListView de vendedores)

          Expanded(
            child: ListView.builder(
              itemCount: sellers.length,
              itemBuilder: (context, index) {
                final seller = sellers[index];
                return CardAutoparSeller(seller: seller);
              },
            ),
          ),
        ],
      ),
    );
  }
}

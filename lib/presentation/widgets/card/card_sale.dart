import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:san_andres_mobile/presentation/widgets/text/text_decoration_dev.dart';

class CardSale extends StatefulWidget {
  const CardSale({super.key});

  @override
  State<CardSale> createState() => _CardSaleState();
}

class _CardSaleState extends State<CardSale> {
  void _showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return const MenuForItemSale(
          saleId: 1,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showOptions(context),
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 10,
        child: Container(
          height: 140,
          color: Colors.white60,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network(
                      'https://picsum.photos/id/1/600/250',
                      height: 100,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    const Text(
                      "Jose Luis Lazo Nina",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Fecha",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "2024 / 10 /12",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "200 Bs",
                          style: TextStyle(color: Colors.grey[700]),
                        )
                      ],
                    ),
                    TextDecorationDev(
                      bg: Colors.orange[300],
                      text: "Pendiente",
                      width: (MediaQuery.of(context).size.width * 0.5) - 30,
                    ),
                    TextDecorationDev(
                      bg: Colors.green[300],
                      text: "Cancelado",
                      width: (MediaQuery.of(context).size.width * 0.5) - 30,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Menu de 3 opciones por cada tarjeta de autoparte
class MenuForItemSale extends StatelessWidget {
  final int saleId;
  const MenuForItemSale({
    super.key,
    required this.saleId,
  });

  Future<bool?> _showDeleteDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmar eliminación'),
          content:
              const Text('¿Estás seguro de que quieres eliminar esta venta?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                'Cancelar',
                style: TextStyle(color: Colors.red[700]),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(
                'Eliminar',
                style: TextStyle(color: Colors.red[500]),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.edit, color: Colors.red),
            title: const Text('Editar Información',
                style: TextStyle(color: Colors.red)),
            onTap: () {
              context.push('/sales/edit');
            },
          ),
          ListTile(
            leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
            title: const Text('Generar recibo PDF',
                style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.table_rows_rounded, color: Colors.red),
            title: const Text('Generar recibo XLSX',
                style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete, color: Colors.red),
            title: const Text('Eliminar', style: TextStyle(color: Colors.red)),
            onTap: () async {
              final result = await _showDeleteDialog(context);
              if (result == true) {
                // onDelete();
              }
            },
          ),
        ],
      ),
    );
  }
}

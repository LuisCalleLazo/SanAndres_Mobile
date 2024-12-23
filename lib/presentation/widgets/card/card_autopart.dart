import 'package:flutter/material.dart';

class CardAutopart extends StatelessWidget {
  final int productId;
  final double productPrice;
  final String productCode;
  const CardAutopart({
    super.key,
    required this.productId,
    required this.productPrice,
    required this.productCode,
  });

  void _showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return MenuForItemAutopart(productId: productId);
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
              Image.network(
                'https://picsum.photos/id/1/600/250',
                height: 100,
                width: 150,
                fit: BoxFit.cover,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Código:",
                    style: TextStyle(
                      color: Colors.red[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    productCode,
                    style: TextStyle(color: Colors.grey[900]),
                  ),
                  Text(
                    "Precio:",
                    style: TextStyle(
                      color: Colors.red[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "$productPrice Bs",
                    style: TextStyle(color: Colors.grey[900]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Menu de 3 opciones por cada tarjeta de autoparte
class MenuForItemAutopart extends StatelessWidget {
  final int productId;
  const MenuForItemAutopart({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.photo_camera, color: Colors.red),
            title:
                const Text('Editar Fotos', style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit, color: Colors.red),
            title: const Text('Editar Información',
                style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete, color: Colors.red),
            title: const Text('Eliminar', style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
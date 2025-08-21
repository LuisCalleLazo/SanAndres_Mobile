import 'package:flutter/material.dart';
import 'package:san_andres_mobile/domain/entities/sales/sale_customer.dart';
import 'package:san_andres_mobile/domain/entities/sales/sale_item.dart';
import 'package:san_andres_mobile/shared/data/sale_item.dart';

class SaleItemsPage extends StatelessWidget {
  static String name = "sale_items";
  final SaleCustomer sale;
  const SaleItemsPage({
    super.key,
    required this.sale,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de Venta'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Encabezado con información de la venta
          _buildSaleHeader(context),

          // Lista de productos
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: saleItems.length,
              itemBuilder: (context, index) {
                return _buildSaleItemCard(saleItems[index]);
              },
            ),
          ),

          // Total de la venta
          _buildTotalFooter(context),
        ],
      ),
    );
  }

  Widget _buildSaleHeader(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Vendedor: ${sale.seller}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 8),
                Text(
                  _formatDate(sale.date),
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'ID Venta: ${sale.id}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaleItemCard(SaleItem item) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            // Imagen del producto
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.productImg,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey[200],
                    child: const Icon(Icons.image_not_supported),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),

            // Detalles del producto
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.productName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Precio unitario: ${item.unitPrice.toStringAsFixed(2)} Bs',
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Precio mayorista: ${item.wholesalePrice.toStringAsFixed(2)} Bs',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.green[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'TOTAL:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${sale.totalPrice.toStringAsFixed(2)} Bs',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }
}

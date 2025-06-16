import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';
import 'package:san_andres_mobile/domain/entities/sales/sale_customer.dart';
import 'package:san_andres_mobile/domain/entities/sales/sale_item.dart';
import 'package:share_plus/share_plus.dart';

class ReceiptSalePage extends StatefulWidget {
  static String name = "receipt_sale_page";

  const ReceiptSalePage({super.key});

  @override
  State<ReceiptSalePage> createState() => _ReceiptSalePageState();
}

class _ReceiptSalePageState extends State<ReceiptSalePage> {
  double _scaleFactor = 1.0;
  final sale = SaleCustomer(
    id: 123,
    seller: "Juan Pérez",
    sellerId: 1,
    date: DateTime.now(),
    totalPrice: 150.75,
  );

  final items = [
    SaleItem(
      id: 1,
      productName: "Producto A",
      productId: 101,
      productImg: "",
      unitPrice: 25.25,
      wholesalePrice: 20.00,
    ),
    SaleItem(
      id: 1,
      productName: "Producto A",
      productId: 101,
      productImg: "",
      unitPrice: 25.25,
      wholesalePrice: 20.00,
    ),
  ];

  Future<Uint8List> _generatePdf() async {
    final pdf = pw.Document();

    // Formateadores
    final dateFormat = DateFormat('dd/MM/yyyy HH:mm');
    final currencyFormat =
        NumberFormat.currency(symbol: '\$', decimalDigits: 2, locale: 'es_US');

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Encabezado
              pw.Center(
                child: pw.Text(
                  'RECIBO DE VENTA',
                  style: pw.TextStyle(
                    fontSize: 20,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Divider(),

              // Información de la venta
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('N° Recibo: ${sale.id}'),
                  pw.Text('Fecha: ${dateFormat.format(sale.date)}'),
                ],
              ),
              pw.SizedBox(height: 5),
              pw.Text('Vendedor: ${sale.seller}'),
              pw.SizedBox(height: 20),

              // Tabla de productos
              // ignore: deprecated_member_use
              pw.Table.fromTextArray(
                context: context,
                border: pw.TableBorder.all(),
                headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                headerDecoration:
                    const pw.BoxDecoration(color: PdfColors.grey300),
                headers: ['Producto', 'Precio Unitario', 'Precio Mayorista'],
                data: items
                    .map((item) => [
                          item.productName,
                          currencyFormat.format(item.unitPrice),
                          currencyFormat.format(item.wholesalePrice),
                        ])
                    .toList(),
              ),

              pw.SizedBox(height: 20),
              pw.Divider(),

              // Total
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Text(
                    'TOTAL: ${currencyFormat.format(sale.totalPrice)}',
                    style: pw.TextStyle(
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ],
              ),

              // Pie de página
              pw.SizedBox(height: 30),
              pw.Center(
                child: pw.Text(
                  '¡Gracias por su compra!',
                  style: pw.TextStyle(fontStyle: pw.FontStyle.italic),
                ),
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  Future<void> shareFile() async {
    final pdfBytes = await _generatePdf();
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/recibo_${sale.id}.pdf');
    await file.writeAsBytes(pdfBytes);

    await Share.shareXFiles([XFile(file.path)],
        text: 'Recibo de venta #${sale.id}');
  }

  void _zoomIn() {
    setState(() {
      _scaleFactor += 0.1;
    });
  }

  void _zoomOut() {
    setState(() {
      if (_scaleFactor > 0.1) _scaleFactor -= 0.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recibo de Venta"),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: shareFile,
          ),
        ],
      ),
      body: PdfPreview(
        build: (format) => _generatePdf(),
        initialPageFormat: PdfPageFormat.a4,
        allowSharing: true,
        canChangePageFormat: false,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _zoomIn,
            mini: true,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: _zoomOut,
            mini: true,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

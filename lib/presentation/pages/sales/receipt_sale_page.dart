import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:san_andres_mobile/presentation/widgets/buttons/btn_float_dev.dart';
import 'package:share_plus/share_plus.dart';

class ReceiptSalePage extends StatefulWidget {
  static String name = "receipt_sale_page";
  const ReceiptSalePage({super.key});

  @override
  State<ReceiptSalePage> createState() => _ReceiptSalePageState();
}

class _ReceiptSalePageState extends State<ReceiptSalePage> {
  String? pdfFilePath;
  double _scaleFactor = 1.0;

  @override
  void initState() {
    super.initState();
    fetchPdf();
  }

  Future<void> fetchPdf() async {
    try {
      final response = await http.get(
          Uri.parse('http://192.168.0.6:5000/api/v1/report/admins?type=2'));
      if (response.statusCode == 200) {
        // Guardar el archivo PDF en el almacenamiento local
        final dir = await getApplicationDocumentsDirectory();
        final file = File('${dir.path}/report.pdf');
        await file.writeAsBytes(response.bodyBytes);
        setState(() {
          pdfFilePath = file.path;
        });
      } else {
        throw Exception('Error al cargar el PDF');
      }
    } catch (e) {
      // ignore: avoid_print
      print("Error al obtener el PDF: $e");
    }
  }

  Future<void> shareFile() async {
    if (pdfFilePath != null) {
      try {
        // Crear una lista de XFile para compartir
        final List<XFile> files = [XFile(pdfFilePath!)];
        await Share.shareXFiles(files, text: 'Aquí tienes el reporte PDF');
      } catch (e) {
        // ignore: avoid_print
        print("Error al compartir: $e");
      }
    }
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
        title: const Text("Visor PDF"),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: shareFile,
          ),
        ],
      ),
      body: pdfFilePath == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width, // Ancho completo
                height: MediaQuery.of(context).size.height, // Alto completo
                child: Transform.scale(
                  scale: _scaleFactor,
                  child: PDFView(
                    filePath: pdfFilePath,
                    enableSwipe: true,
                    swipeHorizontal: false,
                    autoSpacing: false,
                    pageFling: true,
                    onRender: (pages) => print("Páginas renderizadas: $pages"),
                    onError: (error) => print("Error al cargar PDF: $error"),
                    onPageError: (page, error) =>
                        print("Error en la página $page: $error"),
                  ),
                ),
              ),
            ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BtnFloatDev(
            onPressed: _zoomIn,
            text: "",
            icon: Icons.add,
          ),
          BtnFloatDev(
            onPressed: _zoomOut,
            text: "",
            icon: Icons.remove,
          ),
        ],
      ),
    );
  }
}

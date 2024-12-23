import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class InputImage extends StatefulWidget {
  final String label;
  final IconData icon;
  final String? initialImageUrl;

  const InputImage({
    super.key,
    required this.label,
    required this.icon,
    this.initialImageUrl,
  });

  @override
  _InputImageState createState() => _InputImageState();
}

class _InputImageState extends State<InputImage> {
  File? _selectedImage;
  late String? _initialImageUrl;

  @override
  void initState() {
    super.initState();
    _initialImageUrl = widget.initialImageUrl;
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
          vertical: 8.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.image),
              const SizedBox(
                width: 15,
              ),
              Text(
                widget.label,
                style: const TextStyle(
                  color: Color.fromRGBO(255, 179, 0, 1),
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          GestureDetector(
            onTap: _pickImage,
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.orange[140],
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.amber),
              ),
              child: _selectedImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.file(
                        _selectedImage!,
                        fit: BoxFit.contain,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    )
                  : _initialImageUrl != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            _initialImageUrl!,
                            fit: BoxFit.contain,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(widget.icon, size: 40, color: Colors.amber),
                            const SizedBox(height: 8.0),
                            const Text(
                              'Selecciona una imagen',
                              style: TextStyle(color: Colors.amber),
                            ),
                          ],
                        ),
            ),
          ),
        ],
      ),
    );
  }
}

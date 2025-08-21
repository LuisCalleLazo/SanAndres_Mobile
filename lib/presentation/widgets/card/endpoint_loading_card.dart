import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class EndpointLoadingCard extends StatefulWidget {
  final String endpoint;
  final Future<Response> Function() loadFunction;
  final Color primaryColor;
  final bool isLastItem;
  final Function(bool success)? onCompleted; 

  const EndpointLoadingCard({
    super.key,
    required this.endpoint,
    required this.loadFunction,
    this.primaryColor = const Color(0xFF800020), // Color guindo por defecto
    this.isLastItem = false,
    this.onCompleted,
  });

  @override
  State<EndpointLoadingCard> createState() => _EndpointLoadingCardState();
}

class _EndpointLoadingCardState extends State<EndpointLoadingCard> {
  LoadingState _state = LoadingState.pending;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _state = LoadingState.loading);
    
    try {
      await widget.loadFunction();
      setState(() => _state = LoadingState.completed);
      widget.onCompleted?.call(true);
    } catch (e) {
      setState(() {
        _state = LoadingState.failed;
        _errorMessage = e.toString();
      });
      widget.onCompleted?.call(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(54, 0, 0, 0),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Icono de estado
                _buildStateIcon(),
                const SizedBox(width: 12),
                
                // Nombre del endpoint
                Expanded(
                  child: Text(
                    widget.endpoint,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            
            // Mensaje de error (solo si falló)
            if (_state == LoadingState.failed) ...[
              const SizedBox(height: 8),
              Text(
                _errorMessage,
                style: TextStyle(
                  color: Colors.red[700],
                  fontSize: 14,
                ),
              ),
            ],
            
            // Barra de progreso (solo cuando está cargando)
            if (_state == LoadingState.loading) ...[
              const SizedBox(height: 8),
              LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(widget.primaryColor),
                // ignore: deprecated_member_use
                backgroundColor: widget.primaryColor.withOpacity(0.2),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStateIcon() {
    switch (_state) {
      case LoadingState.pending:
        return Icon(
          Icons.pending_outlined,
          color: Colors.grey[500],
        );
      case LoadingState.loading:
        return SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(widget.primaryColor),
          ),
        );
      case LoadingState.completed:
        return Icon(
          Icons.check_circle_outline,
          color: widget.primaryColor,
        );
      case LoadingState.failed:
        return Icon(
          Icons.error_outline,
          color: Colors.red[700],
        );
    }
  }
}

enum LoadingState {
  pending,
  loading,
  completed,
  failed,
}
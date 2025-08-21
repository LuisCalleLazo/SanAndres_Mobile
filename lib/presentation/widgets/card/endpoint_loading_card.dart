import 'package:flutter/material.dart';

class EndpointLoadingCard extends StatelessWidget {
  final String endpoint;
  final LoadingState state;
  final String? errorMessage;
  final Color primaryColor;

  const EndpointLoadingCard({
    super.key,
    required this.endpoint,
    required this.state,
    this.errorMessage,
    this.primaryColor = const Color(0xFF800020),
  });

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
                _buildStateIcon(),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    endpoint,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            if (state == LoadingState.failed && errorMessage != null) ...[
              const SizedBox(height: 8),
              Text(
                errorMessage!,
                style: TextStyle(
                  color: Colors.red[700],
                  fontSize: 14,
                ),
              ),
            ],
            if (state == LoadingState.loading) ...[
              const SizedBox(height: 8),
              LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                backgroundColor: primaryColor.withValues(alpha: 0.2),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStateIcon() {
    switch (state) {
      case LoadingState.pending:
        return Icon(Icons.pending_outlined, color: Colors.grey[500]);
      case LoadingState.loading:
        return SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
          ),
        );
      case LoadingState.completed:
        return Icon(Icons.check_circle_outline, color: primaryColor);
      case LoadingState.failed:
        return Icon(Icons.error_outline, color: Colors.red[700]);
    }
  }
}

enum LoadingState { pending, loading, completed, failed }

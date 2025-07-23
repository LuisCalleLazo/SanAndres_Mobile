import 'package:flutter/material.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  final List<AutoPart> _autoParts = [
    AutoPart('Pastillas de freno', 45.00, 'Unidad', 'assets/brake_pads.png'),
    AutoPart('Filtros de aceite', 30.00, 'Unidad', 'assets/oil_filter.png'),
    AutoPart('Bujías', 20.00, 'Unidad', 'assets/spark_plug.png'),
    AutoPart('Filtros de aire', 25.00, 'Unidad', 'assets/air_filter.png'),
    AutoPart('Amortiguadores', 150.00, 'Par', 'assets/shock_absorber.png'),
    AutoPart('Baterías', 200.00, 'Unidad', 'assets/battery.png'),
    AutoPart('Juntas', 15.00, 'Juego', 'assets/gasket.png'),
    AutoPart('Muñones', 90.00, 'Par', 'assets/hub.png'),
  ];

  // Autopartes seleccionadas para cotización
  final Map<AutoPart, int> _selectedParts = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Barra de búsqueda
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.82,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SearchBar(
                    hintText: 'Buscar autopartes...',
                    leading: const Icon(Icons.search),
                    onChanged: (value) {
                      // Lógica de búsqueda podría implementarse aquí
                    },
                  ),
                ),
              ),
              if (_selectedParts.isNotEmpty)
                IconButton(
                  icon: Badge(
                    label: Text(_selectedParts.length.toString()),
                    child: const Icon(Icons.shopping_cart),
                  ),
                  onPressed: _showQuotationPreview,
                ),
            ],
          ),

          // Lista de categorías (simulada)
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCategoryChip('Frenos', Icons.car_repair),
                _buildCategoryChip('Motor', Icons.engineering),
                _buildCategoryChip('Suspensión', Icons.settings),
                _buildCategoryChip('Eléctrico', Icons.electric_bolt),
                _buildCategoryChip('Transmisión', Icons.speed),
              ],
            ),
          ),

          // Lista de productos
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: _autoParts.length,
              itemBuilder: (context, index) {
                final part = _autoParts[index];
                final quantity = _selectedParts[part] ?? 0;

                return _buildProductCard(part, quantity);
              },
            ),
          ),
        ],
      ),

      // Botón de generar cotización
      floatingActionButton: _selectedParts.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: _generateQuotation,
              label: const Text('Generar Cotización'),
              icon: const Icon(Icons.description),
            )
          : null,
    );
  }

  Widget _buildCategoryChip(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: FilterChip(
        label: Text(label),
        avatar: Icon(icon, size: 20),
        onSelected: (selected) {
          // Lógica de filtrado por categoría
        },
      ),
    );
  }

  Widget _buildProductCard(AutoPart part, int quantity) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _showProductDetails(part),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen del producto (usando icono como placeholder)
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[200],
                  child:
                      Icon(Icons.car_repair, size: 40, color: Colors.blueGrey),
                  // En una app real, usarías: Image.asset(part.imagePath)
                ),
              ),

              const SizedBox(height: 12),

              // Nombre del producto
              Text(
                part.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              // Precio y unidad
              Text(
                '${part.price.toStringAsFixed(2)} / ${part.unit} Bs',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),

              const Spacer(),

              // Selector de cantidad
              quantity > 0
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => _updateQuantity(part, quantity - 1),
                        ),
                        Text(
                          quantity.toString(),
                          style: const TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => _updateQuantity(part, quantity + 1),
                        ),
                      ],
                    )
                  : ElevatedButton(
                      onPressed: () => _updateQuantity(part, 1),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 36),
                      ),
                      child: const Text('Agregar'),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateQuantity(AutoPart part, int newQuantity) {
    setState(() {
      if (newQuantity > 0) {
        _selectedParts[part] = newQuantity;
      } else {
        _selectedParts.remove(part);
      }
    });
  }

  void _showProductDetails(AutoPart part) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  child:
                      Icon(Icons.car_repair, size: 50, color: Colors.blueGrey),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  part.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildDetailRow(
                  'Precio unitario', '${part.price.toStringAsFixed(2)} Bs'),
              _buildDetailRow('Unidad', part.unit),
              _buildDetailRow('Disponibilidad', 'En stock'),
              const SizedBox(height: 16),
              const Text(
                'Descripción:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Text(
                'Producto de alta calidad para todo tipo de vehículos. Garantía de 1 año contra defectos de fabricación.',
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _updateQuantity(part, (_selectedParts[part] ?? 0) + 1);
                  },
                  child: const Text('Agregar a cotización'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }

  void _showQuotationPreview() {
    final total = _selectedParts.entries.fold<double>(
      0,
      (sum, entry) => sum + (entry.key.price * entry.value),
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Resumen de Cotización',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              // Lista de productos seleccionados
              ..._selectedParts.entries.map(
                (entry) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(entry.key.name),
                      ),
                      Text('${entry.value} x ${entry.key.price} Bs'),
                      const SizedBox(width: 16),
                      Text(
                        '${(entry.key.price * entry.value).toStringAsFixed(2)} Bs',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),

              const Divider(height: 32),

              // Total
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${total.toStringAsFixed(2)} Bs',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Botones de acción
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Seguir agregando'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _generateQuotation();
                      },
                      child: const Text('Generar cotización'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _generateQuotation() {
    // Aquí iría la lógica para generar la cotización final
    // Podría ser enviar a otra pantalla, guardar en base de datos, etc.

    // Mostramos un diálogo de confirmación
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Cotización generada'),
          content: const Text(
              'La cotización ha sido creada exitosamente. ¿Deseas enviarla por correo?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Más tarde'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Lógica para enviar por correo
              },
              child: const Text('Enviar ahora'),
            ),
          ],
        );
      },
    );
  }
}

class AutoPart {
  final String name;
  final double price;
  final String unit;
  final String imagePath;

  AutoPart(this.name, this.price, this.unit, this.imagePath);
}

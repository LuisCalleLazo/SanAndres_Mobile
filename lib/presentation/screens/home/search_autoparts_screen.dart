import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:san_andres_mobile/presentation/services/api_client_secure.dart';

class SearchAutopartsScreen extends StatefulWidget {
  const SearchAutopartsScreen({super.key});

  @override
  State<SearchAutopartsScreen> createState() => _SearchAutopartsScreenState();
}

class _SearchAutopartsScreenState extends State<SearchAutopartsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();

  List<dynamic> _autoparts = [];
  bool _isLoading = false;
  bool _hasError = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchAutoparts();
  }

  Future<void> _fetchAutoparts() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      final Map<String, dynamic> queryParams = {};

      if (_searchController.text.isNotEmpty) {
        queryParams['ProductName'] = _searchController.text;
      }
      if (_categoryController.text.isNotEmpty) {
        queryParams['CategoryId'] = _categoryController.text;
      }
      if (_brandController.text.isNotEmpty) {
        queryParams['BrandId'] = _brandController.text;
      }
      if (_minPriceController.text.isNotEmpty) {
        queryParams['MinPrice'] = _minPriceController.text;
      }
      if (_maxPriceController.text.isNotEmpty) {
        queryParams['MaxPrice'] = _maxPriceController.text;
      }

      final response = await apiAuto.get(
        '/api/v1/search-autopart',
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        setState(() {
          _autoparts = response.data;
        });
      } else {
        throw Exception('Failed to load autoparts');
      }
    } on DioException catch (e) {
      setState(() {
        _hasError = true;
        _errorMessage = e.response?.data['message'] ?? 'Error fetching data';
      });
    } catch (e) {
      setState(() {
        _hasError = true;
        _errorMessage = 'An unexpected error occurred';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _clearFilters() {
    _searchController.clear();
    _minPriceController.clear();
    _maxPriceController.clear();
    _categoryController.clear();
    _brandController.clear();
    _fetchAutoparts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildFilterSection(),
        Expanded(
          child: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _hasError
                  ? Center(child: Text(_errorMessage))
                  : _autoparts.isEmpty
                      ? const Center(child: Text('No autoparts found'))
                      : _buildAutopartsList(),
        ),
      ],
    );
  }

  Widget _buildFilterSection() {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Product Name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _fetchAutoparts(),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _categoryController,
                    decoration: const InputDecoration(
                      labelText: 'Category ID',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _brandController,
                    decoration: const InputDecoration(
                      labelText: 'Brand ID',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _minPriceController,
                    decoration: const InputDecoration(
                      labelText: 'Min Price',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _maxPriceController,
                    decoration: const InputDecoration(
                      labelText: 'Max Price',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _fetchAutoparts,
                    child: const Text('Apply Filters'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _clearFilters,
                    child: const Text('Clear Filters'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAutopartsList() {
    return ListView.builder(
      itemCount: _autoparts.length,
      itemBuilder: (context, index) {
        final autopart = _autoparts[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  autopart['name'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text('Category: ${autopart['categoryName']}'),
                Text('Brand: ${autopart['brandName']}'),
                const SizedBox(height: 8),
                if (autopart['assets'].isNotEmpty)
                  SizedBox(
                    height: 150,
                    child: _buildImageCarousel(autopart['assets']),
                  ),
                const SizedBox(height: 8),
                if (autopart['infos'].isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Details:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ...autopart['infos'].map<Widget>((info) => Text(
                            '${info['typeName']}: ${info['value']}',
                          )),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildImageCarousel(List<dynamic> assets) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: assets.length,
      itemBuilder: (context, index) {
        final asset = assets[index];
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              asset['asset'],
              width: 150,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return SizedBox(
                  width: 150,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) => Container(
                width: 150,
                color: Colors.grey[200],
                child: const Icon(Icons.broken_image),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _minPriceController.dispose();
    _maxPriceController.dispose();
    _categoryController.dispose();
    _brandController.dispose();
    super.dispose();
  }
}

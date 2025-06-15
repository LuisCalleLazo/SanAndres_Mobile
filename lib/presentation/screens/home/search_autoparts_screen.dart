import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:san_andres_mobile/presentation/provider/autopart_search_provider.dart';
import 'package:san_andres_mobile/presentation/widgets/card/card_autopart_search.dart';

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

  @override
  void initState() {
    super.initState();
    _searchAutoparts();
  }

  void _searchAutoparts() {
    final provider = context.read<AutopartSearchProvider>();
    provider.searchAutoparts(
      productName: _searchController.text,
      categoryId: _categoryController.text,
      brandId: _brandController.text,
      minPrice: _minPriceController.text,
      maxPrice: _maxPriceController.text,
    );
  }

  void _clearFilters() {
    _searchController.clear();
    _minPriceController.clear();
    _maxPriceController.clear();
    _categoryController.clear();
    _brandController.clear();
    _searchAutoparts();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AutopartSearchProvider>(context);
    return Column(
      children: [
        _buildFilterSection(),
        Expanded(
          child: provider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : provider.hasError
                  ? Center(child: Text(provider.errorMessage))
                  : provider.autoparts.isEmpty
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
              onSubmitted: (_) => _searchAutoparts(),
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
                    onPressed: _searchAutoparts,
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
    final provider = Provider.of<AutopartSearchProvider>(context);
    return ListView.builder(
      itemCount: provider.autoparts.length,
      itemBuilder: (context, index) {
        final autopart = provider.autoparts[index];
        return CardAutopartSearch(autopart: autopart);
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

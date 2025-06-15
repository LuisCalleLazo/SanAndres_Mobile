import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:san_andres_mobile/presentation/provider/autopart_search_provider.dart';
import 'package:san_andres_mobile/presentation/services/input_controller_manager.dart';
import 'package:san_andres_mobile/presentation/services/value_notifier_manager.dart';
import 'package:san_andres_mobile/presentation/widgets/card/card_autopart_search.dart';
import 'package:san_andres_mobile/presentation/widgets/dropdown/dropdown_dev.dart';
import 'package:san_andres_mobile/presentation/widgets/inputs/input_default.dart';
import 'package:san_andres_mobile/shared/utils/select_items.dart';

class SearchAutopartsScreen extends StatefulWidget {
  const SearchAutopartsScreen({super.key});

  @override
  State<SearchAutopartsScreen> createState() => _SearchAutopartsScreenState();
}

class _SearchAutopartsScreenState extends State<SearchAutopartsScreen> {
  final InputControllerManager _inputManager = InputControllerManager();
  final ValueNotifierManager<int> _valueManager = ValueNotifierManager<int>();

  @override
  void initState() {
    super.initState();
    _searchAutoparts();
  }

  void _searchAutoparts() {
    final provider = context.read<AutopartSearchProvider>();
    provider.searchAutoparts(
      productName: _inputManager.getController("name_filter_autopart").text,
      categoryId: _valueManager.getNotifier("category_filter_autopart").value,
      brandId: _valueManager.getNotifier("brand_filter_autopart").value,
      minPrice: _inputManager.getController("price_min_autopart").text,
      maxPrice: _inputManager.getController("price_max_autopart").text,
    );
  }

  void _clearFilters() {
    _inputManager.clearAll();
    _valueManager.dispose();
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
      child: ExpansionTile(
        title: const Text("Filtros"),
        leading: Icon(
          Icons.filter_list,
          color: Colors.red[900],
        ),
        tilePadding: const EdgeInsets.all(5),
        children: [
          InputDefault(
            label: "Nombre autoparte",
            controller: _inputManager.getController("name_filter_autopart"),
            type: TextInputType.number,
            icon: Icons.price_change,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: DropdownDev(
                  items: [
                    SelectItems(id: 1, label: "label"),
                  ],
                  text: "Categoria",
                  value: _valueManager.getNotifier("category_filter_autopart"),
                  icon: Icons.category,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: DropdownDev(
                  items: [
                    SelectItems(id: 1, label: "label"),
                  ],
                  text: "Marca",
                  value: _valueManager.getNotifier("brand_filter_autopart"),
                  icon: Icons.branding_watermark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: InputDefault(
                  label: "Minimo",
                  controller: _inputManager.getController("price_min_autopart"),
                  type: TextInputType.number,
                  icon: Icons.price_change,
                ),
              ),
              Expanded(
                child: InputDefault(
                  label: "Maximo",
                  controller: _inputManager.getController("price_max_autopart"),
                  type: TextInputType.number,
                  icon: Icons.price_change,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _searchAutoparts,
                  child: Text(
                    'Aplicar',
                    style: TextStyle(color: Colors.red[700]),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton(
                  onPressed: _clearFilters,
                  child: Text(
                    'Limpiar',
                    style: TextStyle(color: Colors.red[700]),
                  ),
                ),
              ),
            ],
          ),
        ],
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
    _inputManager.dispose();
    _valueManager.dispose();
    super.dispose();
  }
}

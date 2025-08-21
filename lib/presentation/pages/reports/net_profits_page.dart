import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class NetProfitsPage extends StatelessWidget {
  static String name = "net_profits_page";
  const NetProfitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos quemados: Costo, Precio de venta y Cantidad vendida
    final products = [
      ProductProfit(
        'Pastillas de freno', 
        cost: 25, 
        salePrice: 45, 
        sold: 12, 
        color: Colors.blue
      ),
      ProductProfit(
        'Filtros de aceite', 
        cost: 15, 
        salePrice: 30, 
        sold: 9, 
        color: Colors.green
      ),
      ProductProfit(
        'Bujías', 
        cost: 8, 
        salePrice: 20, 
        sold: 2, 
        color: Colors.orange
      ),
      ProductProfit(
        'Filtros de aire', 
        cost: 10, 
        salePrice: 25, 
        sold: 1, 
        color: Colors.red
      ),
      ProductProfit(
        'Amortiguadores', 
        cost: 80, 
        salePrice: 150, 
        sold: 6, 
        color: Colors.purple
      ),
      ProductProfit(
        'Baterias', 
        cost: 120, 
        salePrice: 200, 
        sold: 6, 
        color: Colors.teal
      ),
      ProductProfit(
        'Juntas', 
        cost: 5, 
        salePrice: 15, 
        sold: 5, 
        color: Colors.amber
      ),
      ProductProfit(
        'Muñones', 
        cost: 45, 
        salePrice: 90, 
        sold: 4, 
        color: Colors.indigo
      ),
    ];

    // Calcular métricas
    final totalProfit = products.fold<double>(0, (sum, p) => sum + p.netProfit);
    final totalInvestment = products.fold<double>(0, (sum, p) => sum + p.totalCost);
    final totalRevenue = products.fold<double>(0, (sum, p) => sum + p.totalRevenue);
    final profitMargin = (totalProfit / totalRevenue * 100);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ganancias Netas de Autopartes'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSummaryCards(totalInvestment, totalRevenue, totalProfit, profitMargin),
            const SizedBox(height: 20),
            _buildProfitBarChart(products, context),
            const SizedBox(height: 20),
            _buildProfitabilityChart(products, context),
            const SizedBox(height: 20),
            _buildProductProfitList(products, context),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCards(double investment, double revenue, double profit, double margin) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                'Inversión Total',
                '${investment.toStringAsFixed(2)} Bs',
                Colors.blueGrey,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildSummaryCard(
                'Ventas Totales',
                '${revenue.toStringAsFixed(2)} Bs',
                Colors.blue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _buildSummaryCard(
                'Ganancia Neta',
                '${profit.toStringAsFixed(2)} Bs',
                profit >= 0 ? Colors.green : Colors.red,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildSummaryCard(
                'Margen de Ganancia',
                '${margin.toStringAsFixed(1)}%',
                margin >= 30 ? Colors.green : margin >= 15 ? Colors.orange : Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSummaryCard(String title, String value, Color color) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfitBarChart(List<ProductProfit> products, BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ganancia por Producto',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceBetween,
                  barTouchData: const BarTouchData(enabled: true),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              products[value.toInt()].name.split(' ').first,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                              ),
                            ),
                          );
                        },
                        reservedSize: 30,
                      ),
                    ),
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                      ),
                    ),
                  ),
                  gridData: const FlGridData(show: true),
                  borderData: FlBorderData(show: false),
                  barGroups: products
                      .asMap()
                      .entries
                      .map(
                        (e) => BarChartGroupData(
                          x: e.key,
                          barRods: [
                            BarChartRodData(
                              toY: e.value.netProfit,
                              color: e.value.netProfit >= 0 
                                  ? Colors.green[300]!
                                  : Colors.red[300]!,
                              width: 16,
                              borderRadius: BorderRadius.circular(4),
                            )
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfitabilityChart(List<ProductProfit> products, BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Margen de Ganancia por Producto',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceBetween,
                  barTouchData: const BarTouchData(enabled: true),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              products[value.toInt()].name.split(' ').first,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                              ),
                            ),
                          );
                        },
                        reservedSize: 30,
                      ),
                    ),
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                      ),
                    ),
                  ),
                  gridData: const FlGridData(show: true),
                  borderData: FlBorderData(show: false),
                  barGroups: products
                      .asMap()
                      .entries
                      .map(
                        (e) => BarChartGroupData(
                          x: e.key,
                          barRods: [
                            BarChartRodData(
                              toY: e.value.profitMargin,
                              color: e.value.profitMargin >= 30 
                                  ? Colors.green[300]!
                                  : e.value.profitMargin >= 15 
                                      ? Colors.orange[300]!
                                      : Colors.red[300]!,
                              width: 16,
                              borderRadius: BorderRadius.circular(4),
                            )
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductProfitList(List<ProductProfit> products, BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detalle por Producto',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ...products.map((product) => _buildProfitListItem(product)),
          ],
        ),
      ),
    );
  }

  Widget _buildProfitListItem(ProductProfit product) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: product.color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: product.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  product.name,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${product.netProfit.toStringAsFixed(2)} Bs',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: product.netProfit >= 0 ? Colors.green : Colors.red,
                    ),
                  ),
                  Text(
                    '${product.profitMargin.toStringAsFixed(1)}%',
                    style: TextStyle(
                      fontSize: 12,
                      color: product.profitMargin >= 30 
                          ? Colors.green 
                          : product.profitMargin >= 15 
                              ? Colors.orange 
                              : Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const SizedBox(width: 40),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Costo: ${product.cost.toStringAsFixed(2)} Bs',
                      style: const TextStyle(fontSize: 12),
                    ),
                    Text(
                      'Venta: ${product.salePrice.toStringAsFixed(2)} Bs',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Text(
                '${product.sold} unidades',
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          const Divider(height: 20),
        ],
      ),
    );
  }
}

class ProductProfit {
  final String name;
  final double cost;
  final double salePrice;
  final int sold;
  final Color color;

  ProductProfit(
    this.name, {
    required this.cost,
    required this.salePrice,
    required this.sold,
    required this.color,
  });

  double get totalCost => cost * sold;
  double get totalRevenue => salePrice * sold;
  double get netProfit => totalRevenue - totalCost;
  double get profitMargin => (netProfit / totalRevenue) * 100;
}
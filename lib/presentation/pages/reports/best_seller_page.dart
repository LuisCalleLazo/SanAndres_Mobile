import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BestSellerPage extends StatelessWidget {
  static String name = "best_seller_page";
  const BestSellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for best selling auto parts
    final bestSellers = [
      AutoPart('Pastillas de freno', 12, Colors.blue),
      AutoPart('Filtros de aceite', 9, Colors.green),
      AutoPart('Bujías', 2, Colors.orange),
      AutoPart('Filtros de aire', 1, Colors.red),
      AutoPart('Amortiguadores', 6, Colors.purple),
      AutoPart('Baterias', 6, Colors.teal),
      AutoPart('Juntas', 5, Colors.amber),
      AutoPart('Muñones', 4, Colors.indigo),
    ];

    // Sort by quantity sold
    bestSellers.sort((a, b) => b.quantitySold.compareTo(a.quantitySold));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Autopartes más vendidas'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 20),
            _buildBarChart(bestSellers),
            const SizedBox(height: 30),
            _buildPieChart(bestSellers),
            const SizedBox(height: 30),
            _buildTopSellersList(bestSellers, context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reporte de ventas',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          'Autopartes de mayor rendimiento por unidades vendidas',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey[600],
              ),
        ),
        const SizedBox(height: 8),
        const Divider(),
      ],
    );
  }

  Widget _buildBarChart(List<AutoPart> data) {
    return SizedBox(
      height: 300,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: data.first.quantitySold * 1.2,
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
                      data[value.toInt()].name,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  );
                },
                reservedSize: 40,
              ),
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
              ),
            ),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: const FlGridData(show: true),
          borderData: FlBorderData(show: false),
          barGroups: data
              .asMap()
              .entries
              .map(
                (e) => BarChartGroupData(
                  x: e.key,
                  barRods: [
                    BarChartRodData(
                      toY: e.value.quantitySold.toDouble(),
                      color: e.value.color,
                      width: 16,
                      borderRadius: BorderRadius.circular(4),
                    )
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildPieChart(List<AutoPart> data) {
    return SizedBox(
      height: 300,
      child: PieChart(
        PieChartData(
          sectionsSpace: 2,
          centerSpaceRadius: 40,
          sections: data
              .map(
                (e) => PieChartSectionData(
                  color: e.color,
                  value: e.quantitySold.toDouble(),
                  title: '${(e.quantitySold / _totalSales(data) * 100).toStringAsFixed(1)}%',
                  radius: 80,
                  titleStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildTopSellersList(List<AutoPart> data, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Productos mas vendidos',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 10),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: data
                  .map((part) => _buildListItem(part, data.indexOf(part) + 1))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListItem(AutoPart part, int rank) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: rank <= 3 ? Colors.amber : Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Text(
              '$rank',
              style: TextStyle(
                color: rank <= 3 ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              part.name,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Chip(
            // ignore: deprecated_member_use
            backgroundColor: part.color.withOpacity(0.2),
            label: Text(
              '${part.quantitySold} units',
              style: TextStyle(color: part.color),
            ),
          ),
        ],
      ),
    );
  }

  int _totalSales(List<AutoPart> parts) {
    return parts.fold(0, (sum, part) => sum + part.quantitySold);
  }
}

class AutoPart {
  final String name;
  final int quantitySold;
  final Color color;

  AutoPart(this.name, this.quantitySold, this.color);
}
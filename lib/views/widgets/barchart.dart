import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sappat_v1_flutter/constants/constants.dart';

class BarChartWidget extends StatelessWidget {
  final List<BarChartGroupData> barGroup;
  final double total;

  const BarChartWidget(
      {super.key, required this.barGroup, required this.total});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            getTooltipColor: (group) => Colors.transparent,
            tooltipPadding: const EdgeInsets.all(1),
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                (rod.toY).toStringAsFixed(0),
                h5, // Customize tooltip text
              );
            },
          ),
        ),

        alignment: BarChartAlignment.spaceAround,
        maxY: total,
        barGroups: barGroup,
        gridData: const FlGridData(show: false), // Hide the grid
        borderData: FlBorderData(show: false), // Hide the bounding box
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false), // Hide left labels
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false), // Hide right labels
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false, // Show top labels
              getTitlesWidget: (value, meta) {
                return Text(
                  value
                      .toInt()
                      .toString(), // Customize the title based on the value
                  style: const TextStyle(color: Colors.black, fontSize: 12),
                );
              },
            ),
          ),
          bottomTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false, // Hide bottom labels
            ),
          ),
        ),
      ),
    );
  }
}

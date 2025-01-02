import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatelessWidget {
  final List<PieChartSectionData> getPieChartSections;

  const PieChartWidget({super.key, required this.getPieChartSections});

  @override
  Widget build(BuildContext context) {
    return PieChart(PieChartData(
      sections: getPieChartSections,
      centerSpaceRadius: 40,
      sectionsSpace: 5,
      borderData: FlBorderData(
        show: false,
      ),
    ));
  }
}

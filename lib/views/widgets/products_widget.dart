import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sappat_v1_flutter/constants/constants.dart';
import 'package:sappat_v1_flutter/views/widgets/piechart.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key, required this.total, required this.sector});

  final double total;
  final Map<String, int> sector;

  @override
  Widget build(BuildContext context) {
    var fishPercent =
        "${(sector['Fisheries']! / total * 100).toStringAsFixed(2)}%";
    var agriPercent =
        "${(sector['Agriculture']! / total * 100).toStringAsFixed(2)}%";
    return Card(
        elevation: 100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Chip(
                  backgroundColor: Colors.blue,
                  label: Text(
                    "Player Products",
                    style: h4.copyWith(color: Colors.white),
                  )),
              const Text('Summary', style: TextStyle(fontSize: 9)),
              const SizedBox(height: defaultHeight - 10),
              SizedBox(
                  height: 200,
                  child: PieChartWidget(
                      getPieChartSections: getPieChartSections())),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround, // Distribute columns evenly
                children: [
                  Column(
                    children: [
                      const CircleAvatar(
                        radius: 5, // Radius of the circle
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                      Text("Fisheries",
                          style: h5.copyWith(
                            color: Colors.grey,
                          )),
                      Text("${sector['Fisheries']} ($fishPercent)", style: h4),
                    ],
                  ),
                  Column(
                    children: [
                      const CircleAvatar(
                        radius: 5, // Radius of the circle
                        backgroundColor: Colors.green,
                      ),
                      Text("Agriculture",
                          style: h5.copyWith(
                            color: Colors.grey,
                          )),
                      Text("${sector['Agriculture']} ($agriPercent)",
                          style: h4),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }

  List<PieChartSectionData> getPieChartSections() {
    return [
      PieChartSectionData(
        color: Colors.lightBlueAccent,
        value: sector['Fisheries']!.toDouble(),
        title: sector['Fisheries'].toString(),
        radius: 50,
        titleStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        badgeWidget: const Icon(
          Icons.water_drop,
          size: 30,
          color: Colors.lightBlueAccent,
        ),
        badgePositionPercentageOffset: 1.5,
      ),
      PieChartSectionData(
        color: green,
        value: sector['Agriculture']!.toDouble(),
        title: sector['Agriculture'].toString(),
        radius: 50,
        titleStyle: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        badgeWidget: const Icon(
          Icons.energy_savings_leaf,
          size: 30,
          color: green,
        ),
        badgePositionPercentageOffset: 1.5,
      ),
    ];
  }
}

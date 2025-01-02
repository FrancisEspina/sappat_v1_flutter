import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sappat_v1_flutter/constants/constants.dart';
import 'package:sappat_v1_flutter/views/widgets/barchart.dart';

class TopProductsWidget extends StatefulWidget {
  const TopProductsWidget(
      {super.key, required this.dashboardData, required this.total});
  final Map<String, dynamic>? dashboardData;

  final double total;

  @override
  TopProductsWidgetState createState() => TopProductsWidgetState();
}

class TopProductsWidgetState extends State<TopProductsWidget> {
  double products_total = 0;
  var products = {};
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    const Color.fromARGB(255, 245, 181, 6),
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.brown,
    Colors.lightBlue,
    Colors.teal,
  ];

  @override
  void initState() {
    var dashboardData = widget.dashboardData;
    super.initState();
    processTopProducts(dashboardData); // Calling the function in initState
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Chip(
              backgroundColor: Colors.blue,
              label: Text(
                "Top Products",
                style: h4.copyWith(color: Colors.white),
              ),
            ),
            const Text('Summary', style: TextStyle(fontSize: 9)),
            const SizedBox(height: 10), // Adjusted height to be static
            SizedBox(
              height: 200,
              child: BarChartWidget(
                  barGroup: _generateBarGroups(), total: products_total),
            ),
            const SizedBox(height: defaultHeight),
            Container(
              alignment: Alignment
                  .centerLeft, // Align the container content to the left
              margin: const EdgeInsets.only(
                  bottom: 16.0), // Adjust the value as needed
              child: Text(
                "Legend:",
                style: h5.copyWith(
                    color: Colors.grey, fontWeight: FontWeight.w900),
                textAlign: TextAlign.left, // This works well in most cases
              ),
            ),

            SizedBox(
              height: 100, // Constrain the height
              child: Wrap(
                spacing: 8.0, // Horizontal spacing between items
                runSpacing: 4.0, // Vertical spacing between lines
                alignment:
                    WrapAlignment.center, // Center the items horizontally
                children:
                    products.entries.toList().asMap().entries.map((entry) {
                  int index = entry.key; // This is the index
                  var productEntry = entry.value; // This is the MapEntry
                  return Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: colors[
                          index % colors.length], // Get color using index
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                    child: Text(
                      '${productEntry.key}', // Format key-value pair
                      style: h5.copyWith(fontSize: 7, color: Colors.white),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  void processTopProducts(dashboardData) {
    List<String> productsWithInstances = [];
    Map<String, int> productCounts = {};

    dashboardData['data'].forEach((data) {
      data['products'].forEach((product) {
        productsWithInstances.add(product);
      });
    });

    // Count occurrences of each product
    for (var product in productsWithInstances) {
      if (productCounts.containsKey(product)) {
        productCounts[product] =
            productCounts[product]! + 1; // Increment count if exists
      } else {
        productCounts[product] = 1; // Initialize count if new
      }
    }

    // Sort productCounts by value in descending order
    final sortedProductCounts = Map.fromEntries(
      productCounts.entries.toList()
        ..sort((a, b) {
          // Primary sort: by count (descending)
          int countComparison = b.value.compareTo(a.value);
          if (countComparison != 0) return countComparison;

          // Secondary sort: alphabetically by product name (ascending)
          return a.key.compareTo(b.key);
        }),
    );

    // Pass sorted data to createGraphs
    const int topN = 10;
    final topProducts = Map.fromEntries(
      sortedProductCounts.entries.take(topN),
    );
    products = topProducts;
    products_total =
        topProducts.values.reduce((a, b) => a > b ? a : b).toDouble() + 2;
  }

  List<BarChartGroupData> _generateBarGroups() {
    int colorIndex = 0; // Initialize index tracker
    return products.keys.map((key) {
      var percentage = products[key]!.toDouble();
      var color = colors[
          colorIndex % colors.length]; // Get color based on current index

      // Increment color index for the next bar
      colorIndex++;

      return _buildBarGroup(
          key, percentage.toInt(), percentage, widget.total.toInt(), color);
    }).toList();
  }

  BarChartGroupData _buildBarGroup(key, int x, double y, int total, color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: color,
          width: 20,
          borderRadius: BorderRadius.circular(5),
        ),
      ],
      showingTooltipIndicators: [0],
    );
  }
}

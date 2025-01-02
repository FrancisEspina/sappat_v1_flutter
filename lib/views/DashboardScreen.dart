import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sappat_v1_flutter/constants/constants.dart';
import 'package:sappat_v1_flutter/controllers/authentication.dart';
import 'package:sappat_v1_flutter/controllers/userRoutes.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:sappat_v1_flutter/views/widgets/barchart.dart';
import 'package:sappat_v1_flutter/views/widgets/geolocator.dart';
import 'package:sappat_v1_flutter/views/widgets/products_widget.dart';
import 'package:sappat_v1_flutter/views/widgets/top_products_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Map<String, dynamic>? dashboardData;
  Map<String, int> people = {
    'Producers': 0,
    'Processors': 0,
    'Traders': 0,
  };
  Map<String, int> sector = {
    'Agriculture': 0,
    'Fisheries': 0,
  };

  var colors = [Colors.green, Colors.orange, Colors.yellow];
  double total = 0;
  double dynamicTotal = 0;
  double products_total = 0;
  bool isLoading = true;
  bool hasError = false;
  final AuthenticationController auth = Get.find<AuthenticationController>();

  @override
  void initState() {
    super.initState();
    fetchDashboard(); // Fetch dashboard data when the widget is created
  }

  Future<void> fetchDashboard() async {
    dashboardData = await userDashboardData();
    processPeople(dashboardData?['data']);
    processSector(dashboardData?['data']);
  }

  void processSector(dashboardData) {
    setState(() {
      sector['Agriculture'] =
          dashboardData.where((item) => item['sector'] == 'Agriculture').length;

      sector['Fisheries'] =
          dashboardData.where((item) => item['sector'] == 'Fisheries').length;

      products_total = sector.values.reduce((a, b) => a + b).toDouble();
    });

    print(
        "SECTOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOR"); // For debugging purposes
    print(sector); // For debugging purposes
    print(products_total);
  }

  void processPeople(dashboardData) {
    setState(() {
      const roles = {
        'Producers': 1,
        'Processors': 2,
        'Traders': 3,
      };
      roles.forEach((key, roleId) {
        people[key] =
            dashboardData.where((item) => item['role_id'] == roleId).length;
      });
      total = people.values.reduce((a, b) => a + b).toDouble();
      dynamicTotal =
          people.values.reduce((a, b) => a > b ? a : b).toDouble() + 20;

      isLoading = false; // Indicate that loading is done
    });
    print(people); // For debugging purposes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                          vertical: verticalPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Hello!'),
                          // Text("LI", style: h1),
                          Text("${auth.user['user']['name']}", style: h1),
                          Chip(
                            label: Text(
                              "${auth.user['user_type']}",
                              style: h5.copyWith(),
                            ),
                          ),
                          const SizedBox(height: defaultHeight),
                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              children: [
                                Card(
                                    elevation: 100,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(defaultRadius),
                                    ),
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Chip(
                                              backgroundColor: Colors.blue,
                                              label: Text(
                                                "People",
                                                style: h4.copyWith(
                                                    color: Colors.white),
                                              )),
                                          const Text('Summary',
                                              style: TextStyle(fontSize: 9)),
                                          SizedBox(
                                            height: 200,
                                            child: BarChartWidget(
                                                barGroup: _generateBarGroups(),
                                                total: dynamicTotal),
                                          ),
                                          const SizedBox(
                                              height: defaultHeight - 10),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceAround, // Distribute columns evenly
                                            children: people.keys.map((key) {
                                              return Column(
                                                children: [
                                                  Text(key,
                                                      style: h5.copyWith(
                                                        color: Colors.grey,
                                                      )), // Display the key (e.g., 'Producers')
                                                  Text(
                                                      '${(people[key]! / total * 100).toStringAsFixed(1)}%',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight
                                                            .bold, // Thin weight
                                                      )), // Display the value for the key
                                                ],
                                              );
                                            }).toList(),
                                          )
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          ProductsWidget(total: products_total, sector: sector),

                          TopProductsWidget(
                              dashboardData: dashboardData,
                              total: products_total),
                          const GeolocatorWidget(),

                          SizedBox(
                            width: double.infinity, // Full width
                            child: ElevatedButton(
                              onPressed: () {
                                auth.logout();
                              },
                              child: const Text('Log Out'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  List<BarChartGroupData> _generateBarGroups() {
    var total = people.values.reduce((a, b) => a + b);
    return people.keys.map((key) {
      var percentage = people[key]!.toDouble();
      return _buildBarGroup(key, percentage.toInt(), percentage, total);
    }).toList();
  }

  BarChartGroupData _buildBarGroup(key, int x, double y, int total) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: key == 'Producers'
              ? green
              : key == 'Processors'
                  ? const Color.fromARGB(255, 255, 174, 0)
                  : const Color.fromARGB(255, 255, 209, 59),
          width: 50,
          borderRadius: BorderRadius.circular(10),
        ),
      ],
      showingTooltipIndicators: [0],
    );
  }
}

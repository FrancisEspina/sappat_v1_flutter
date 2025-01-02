import 'package:flutter/material.dart';
import 'package:sappat_v1_flutter/constants/constants.dart';
import 'package:sappat_v1_flutter/views/widgets/InputWidgets.dart';

class GeolocatorWidget extends StatefulWidget {
  const GeolocatorWidget({super.key});

  @override
  State<GeolocatorWidget> createState() => GeolocatorWidgetState();
}

class GeolocatorWidgetState extends State<GeolocatorWidget> {
  final TextEditingController _selectedLocation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10, // Adjusted elevation for realistic effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            defaultRadius), // Ensure defaultRadius is defined
      ),
      color: Colors.white,
      child: Padding(
        padding: padding, // Ensure padding is defined
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align items at the start of the row
          children: [
            Expanded(
              // Allows Column to take full width of Card
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Chip(
                    backgroundColor: Colors.blue,
                    label: Text(
                      "Map",
                      style: h4?.copyWith(color: Colors.white) ??
                          const TextStyle(
                              fontSize: 16,
                              color: Colors.white), // Ensure h4 is defined
                    ),
                  ),
                  const SizedBox(height: 8), // Add spacing
                  const Text("Summary", style: h5),
                  const SizedBox(height: 8), // Add spacing
                  InputWidget(
                      hintText: "Location",
                      controller: _selectedLocation,
                      obscureText: false),
                  const SizedBox(height: 8), // Add spacing

                  const Row(
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Align Columns at the top of the Row
                    children: [
                      Expanded(
                        flex: 2, // Set width proportion for this Column
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align items at the start of this Column
                          children: [
                            SizedBox(height: 8), // Add spacing
                            Text("Municipality/City", style: h5),
                            Text("Tacloban", style: h4),
                          ],
                        ),
                      ),
                      SizedBox(width: 10), // Space between Columns
                      Expanded(
                        flex: 1, // Set width proportion for this Column
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align items at the start of this Column
                          children: [
                            SizedBox(height: 8), // Add spacing
                            Text("Players", style: h5),
                            Text("10", style: h4),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1, // Set width proportion for this Column
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align items at the start of this Column
                          children: [
                            SizedBox(height: 8), // Add spacing
                            Text("Products", style: h5),
                            Text("18", style: h4),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

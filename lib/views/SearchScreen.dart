import 'package:flutter/material.dart';
import 'package:sappat_v1_flutter/constants/constants.dart';
import 'package:sappat_v1_flutter/controllers/searchRoutes.dart';
import 'package:sappat_v1_flutter/views/widgets/InputWidgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late bool isLoading;
  late String displayedText;
  late TextEditingController searchString;

  late var tableData;

  @override
  void initState() {
    super.initState();
    isLoading = false;
    displayedText = '';
    searchString = TextEditingController();
  }

  @override
  void dispose() {
    searchString.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: padding,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(40),
                          child: Image.asset(
                            '${assets}sappat_logo.png',
                            fit: BoxFit.fitWidth,
                            color: Colors.blue,
                            colorBlendMode: BlendMode.srcATop,
                          ),
                        ),
                        InputWidget(
                          hintText: "Search Business",
                          controller: searchString,
                          obscureText: false,
                        ),
                        const SizedBox(height: defaultHeight + 20),
                        SizedBox(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () async {
                              await _searchBusiness(searchString.text);
                            },
                            child: const Text('Search'),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          tableData.toString(),
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
  }

  Future<void> _searchBusiness(String searchString) async {
    var tableData = await searchBusiness(searchString);
    print(tableData);
    // Simulate a network request or some processing
    setState(() {
      displayedText = 'Search result for: ${tableData['actor_data']}';
      this.tableData = tableData['actor_data'];
    });
  }
}

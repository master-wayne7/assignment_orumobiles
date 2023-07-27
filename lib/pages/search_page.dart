import 'package:assignment/widgets/custom_drawer.dart';
import 'package:assignment/widgets/suggestions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../provider/suggestion_provider.dart';
import '../services/api_services.dart';
import 'notification_page.dart';

class SearchPage extends StatefulWidget {
  final String selectedCountry;
  final ValueChanged<String> onCountryChanged;
  const SearchPage(
      {super.key,
      required this.selectedCountry,
      required this.onCountryChanged});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  List<Widget> _buildOptionsList(List<dynamic> options) {
    return [
      SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: options.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Chip(label: Text(options[index])),
            );
          },
        ),
      ),
    ];
  }

  Widget bottomSheetContent(Map<String, dynamic>? data) {
    final filters = data;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ListTile(
            title: Text('Make'),
          ),
          ..._buildOptionsList(filters!['filters']['make']),
          const Divider(),
          const ListTile(
            title: Text('Condition'),
          ),
          ..._buildOptionsList(filters['filters']['condition']),
          const Divider(),
          const ListTile(
            title: Text('Storage'),
          ),
          ..._buildOptionsList(filters['filters']['storage']),
          const Divider(),
          const ListTile(
            title: Text('RAM'),
          ),
          ..._buildOptionsList(filters['filters']['ram']),
        ],
      ),
    );
  }

  void _openBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) => FutureBuilder(
        future: ApiService().getFilters(true),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While waiting for the future to complete, show a loading indicator.
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // If there's an error in fetching the data, show an error message.
            return Center(child: Text('Error fetching filters'));
          } else {
            // If the future completes successfully, build the bottom sheet content.
            return bottomSheetContent(snapshot.data);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final suggestionsProvider =
        Provider.of<SuggestionsProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        key: globalKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 110,
          backgroundColor: const Color.fromARGB(255, 44, 46, 67),
          centerTitle: false,
          flexibleSpace: Container(
            color: const Color.fromARGB(255, 44, 46, 67),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      // Leftmost Drawer with Custom Image Icon
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            globalKey.currentState!.openDrawer();
                            // Scaffold.of(context).openDrawer();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Image.asset(
                              'assets/images/drawer_logo.png', // Replace with your custom drawer icon image
                              width: 35,
                              height: 35,
                            ),
                          ),
                        ),
                      ),

                      // Brand Logo
                      Image.asset(
                        'assets/images/logo.png', // Replace with your brand logo image
                        width: 100,
                        height: 50,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                      ),

                      // Location Selector (DropdownButton)
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: DropdownButton<String>(
                          icon: const Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                          underline: Container(),
                          value: widget
                              .selectedCountry, // Replace with your selected country value
                          onChanged: (newValue) {
                            // Handle country selection here
                            widget.onCountryChanged(newValue!);
                          },

                          dropdownColor: const Color.fromARGB(255, 44, 46, 67),
                          items: const [
                            DropdownMenuItem(
                                value: 'India', child: Text('India')),
                            DropdownMenuItem(value: 'USA', child: Text('USA')),
                            DropdownMenuItem(value: 'UK', child: Text('UK')),
                            // Add more countries as needed
                          ],
                        ),
                      ),

                      // Notification Bell with Bubble
                      Stack(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.notifications_none,
                              size: 30,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              navigatorKey.currentState?.pushNamed(
                                NotificationScreen.route,
                              );
                              // Handle notification icon tap here
                            },
                          ),
                          Positioned(
                            top: 5,
                            right: 4,
                            child: Container(
                              height: 18,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 3,
                              ),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 44, 46,
                                    67), // Change the bubble color as needed
                                shape: BoxShape.circle,
                              ),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: Text(
                                    '5',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 44, 46, 67),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      color: Colors.white),
                  height: 40,
                  child: Center(
                    child: TextField(
                      onChanged: (value) {
                        if (value.isEmpty) {
                          suggestionsProvider.clearSuggestions();
                        } else {
                          suggestionsProvider.fetchSuggestions(value);
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Search with make and model',
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 106, 106, 106),
                        ),
                        suffixIcon: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[700],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {
                              _openBottomSheet();
                            },
                            child: const Icon(
                              Icons.filter_alt_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: const Suggestions(),
        drawer: const CustomDrawer(),
      ),
    );
  }
}

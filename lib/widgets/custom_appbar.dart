import 'package:assignment/pages/search_page.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../pages/notification_page.dart';

class CustomAppBar extends StatefulWidget {
  final String selectedCountry;
  final ValueChanged<String> onCountryChanged;

  const CustomAppBar({
    super.key,
    required this.selectedCountry,
    required this.onCountryChanged,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    onTap: () => Scaffold.of(context).openDrawer(),
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
                      DropdownMenuItem(value: 'India', child: Text('India')),
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
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: const BoxDecoration(
                            color: Colors
                                .white, // Change the bubble color as needed
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              '0', // Replace with the actual number of notifications
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
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SearchPage(
                      onCountryChanged: widget.onCountryChanged,
                      selectedCountry: widget.selectedCountry,
                    ))),
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  color: Colors.white),
              height: 40,
              child: Row(
                children: [
                  Icon(Icons.search),
                  Text(
                    'Search with make and model',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

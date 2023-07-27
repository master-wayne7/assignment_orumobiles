import 'package:assignment/widgets/mobile_card.dart';
import 'package:flutter/material.dart';

import '../model/mobile_model.dart';
import '../services/api_services.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final ApiService _apiService = ApiService();
  List<Mobile> _mobiles = [];
  int _currentPage = 1;
  final int _perPageLimit = 10;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchListings();
  }

  Future<void> _fetchListings() async {
    try {
      final listings =
          await _apiService.getListings(1, 10); // Fetch first 10 devices
      setState(() {
        _mobiles = listings.map((json) => Mobile.fromJson(json)).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Handle error
    }
  }

  Future<void> _fetchMobiles() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final newListings =
          await ApiService().getListings(_currentPage, _perPageLimit);
      List<Mobile> newMobiles =
          newListings.map((json) => Mobile.fromJson(json)).toList();
      setState(() {
        _mobiles.addAll(newMobiles);
        _currentPage++;
      });
    } catch (e) {
      // Handle error
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // ... Your other widgets

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (int i = 0; i < _mobiles.length; i += 2)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (i < _mobiles.length)
                Expanded(
                  child: MobileCard(mobile: _mobiles[i]),
                ),
              if (i + 1 < _mobiles.length)
                Expanded(
                  child: MobileCard(mobile: _mobiles[i + 1]),
                ),
            ],
          ),
        if (_isLoading)
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 44, 46, 67),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Loading More Data",
                ),
              ],
            ),
          ),
        if (!_isLoading)
          Material(
            child: Container(
              margin: EdgeInsets.all(10),
              height: 55,
              width: 180,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 80, 80, 80), width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  _fetchMobiles();
                },
                child: Center(
                  child: Text(
                    "Load More",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ),
            ),
          ),
        // TextButton(
        //   onPressed: () {

        //   },

        // ),
      ],
    );

    // ... Your other widgets
  }
}

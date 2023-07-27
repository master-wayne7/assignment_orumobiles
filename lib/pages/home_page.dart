import "package:assignment/widgets/carousel.dart";
import 'package:assignment/widgets/mobile_gallery.dart';
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "../widgets/custom_appbar.dart";
import "../widgets/custom_drawer.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> brandImage = [
    "assets/images/apple.png",
    "assets/images/samsung.png",
    "assets/images/mi.png",
    "assets/images/vivo.jpg",
    "assets/images/oneplus.png",
    "assets/images/oppo.png",
    "assets/images/motorola.png"
  ];

  String selectedCountry = 'India';

  Widget brandImageWidgets() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: 8,
      itemBuilder: (context, index) {
        if (index == 7) {
          return Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 219, 216, 216),
            ),
            height: 80,
            width: 80,
            child: const Center(
                child: Text(
              "Show all",
              style: TextStyle(fontSize: 11),
            )),
          );
        }
        return Container(
          padding: const EdgeInsets.all(2),
          margin: const EdgeInsets.all(5),
          color: Colors.white,
          height: 80,
          width: 80,
          child: Image.asset(brandImage[index]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          backgroundColor: const Color.fromARGB(255, 44, 46, 67),
          centerTitle: false,
          flexibleSpace: CustomAppBar(
              onCountryChanged: (value) {
                setState(() {
                  selectedCountry = value;
                });
              },
              selectedCountry: selectedCountry),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Buy Top Brands',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                  color: const Color(0xfffbfbfb),
                  height: 70,
                  width: double.infinity,
                  child: brandImageWidgets()),
              const Carousel(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Shop By',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                        width: 100,
                        color: Colors.white,
                        margin: const EdgeInsets.all(2),
                        child:
                            Image.asset("assets/images/menu-${index + 1}.png"));
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: RichText(
                      text: TextSpan(
                        text: 'Best Deals Near You  ',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: selectedCountry,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 235, 211, 0),
                                decoration: TextDecoration.underline,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Sort ",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(
                        CupertinoIcons.arrow_up_arrow_down,
                        color: Colors.grey,
                      ),
                    ],
                  )
                ],
              ),
              const MenuPage(),
            ],
          ),
        ),
        drawer: const CustomDrawer(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 15,
          backgroundColor: Colors.white,
          onPressed: () {
            // Add your floating action button action here
          },
          child: const CircleAvatar(
            radius: 26,
            backgroundColor: Color.fromARGB(255, 255, 204, 0),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 35,
            ),
          ),
        ),
        bottomNavigationBar: const ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          child: BottomAppBar(
            elevation: 15,
            color: Color.fromARGB(255, 44, 46, 67),
            child: SizedBox(
              height: kBottomNavigationBarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(
                          CupertinoIcons.home,
                          color: Colors.white,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(
                          CupertinoIcons.square_list,
                          color: Colors.grey,
                        ),
                        Text(
                          "Listings",
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        )
                      ],
                    ),
                  ),

                  Column(
                    children: [
                      SizedBox(
                        width: kBottomNavigationBarHeight,
                        height: kBottomNavigationBarHeight - 20,
                      ),
                      Text(
                        "Sell Now",
                        style: TextStyle(color: Colors.grey, fontSize: 10),
                      )
                    ],
                  ), // Spacer for FAB

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(
                          CupertinoIcons.briefcase,
                          color: Colors.grey,
                        ),
                        Text(
                          "Services",
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Icon(
                          CupertinoIcons.person,
                          color: Colors.grey,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

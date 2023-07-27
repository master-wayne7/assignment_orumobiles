import 'package:assignment/pages/notification_page.dart';
import 'package:assignment/services/firebase_api_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';
import 'provider/suggestion_provider.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    ChangeNotifierProvider(
      create: (context) => SuggestionsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: const HomePage(),
        navigatorKey: navigatorKey,
        routes: {
          NotificationScreen.route: (context) => const NotificationScreen(),
        },
      ),
    ),
  );
}

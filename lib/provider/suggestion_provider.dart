import 'package:flutter/material.dart';

import '../services/api_services.dart';

class SuggestionsProvider extends ChangeNotifier {
  Map<String, dynamic> _suggestions = {};

  Map<String, dynamic> get suggestions => _suggestions;

  void fetchSuggestions(String query) async {
    if (query.isEmpty) {
      _suggestions.clear();
      return;
    }

    try {
      Map<String, dynamic> suggestions = await ApiService().searchModel(query);
      _suggestions = suggestions;
      print("$_suggestions----------------------");
    } catch (e) {
      // Handle error
    }
    notifyListeners();
  }

  void clearSuggestions() {
    _suggestions.clear();
    notifyListeners();
  }
}

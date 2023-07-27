import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/suggestion_provider.dart';

class Suggestions extends StatefulWidget {
  const Suggestions({super.key});

  @override
  State<Suggestions> createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions> {
  @override
  Widget build(BuildContext context) {
    final suggestionsProvider = Provider.of<SuggestionsProvider>(context);
    final suggestions = suggestionsProvider.suggestions;

    return WillPopScope(
      onWillPop: () {
        suggestionsProvider.clearSuggestions();
        Navigator.pop(context);
        return Future.value(true);
      },
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: suggestions.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Brand",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 134, 134, 134),
                        fontSize: 12,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < suggestions['makes'].length; i++)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 7),
                            child: Text(suggestions['makes'][i]),
                          )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Mobile Models",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 134, 134, 134),
                        fontSize: 12,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < suggestions['models'].length; i++)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 7),
                            child: Text(suggestions['models'][i]),
                          )
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

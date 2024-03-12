import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saved Suggestions',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SavedSuggestionsScreen(),
    );
  }
}

class SavedSuggestionsScreen extends StatefulWidget {
  @override
  _SavedSuggestionsScreenState createState() => _SavedSuggestionsScreenState();
}

class _SavedSuggestionsScreenState extends State<SavedSuggestionsScreen> {
    final List<String> savedSuggestions = [
    "Tiger",
    "Elephant",
    "Lion",
    "Giraffe",
    "Zebra",
    "Monkey",
    "Panda",
    "Kangaroo",
    "Cheetah",
    "Dolphin",
    "Polar Bear",
    "Koala",
    "Rhinoceros",
    "Hippopotamus",
    "Gorilla",
    "Penguin",
    "Jaguar",
    "Sloth",
    "Crocodile",
    "Orangutan",
    "Chimpanzee",
    "Ostrich",
    "Octopus",
    "Bald Eagle",
    "Raccoon",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Suggestions'),
        elevation: 2,
      ),
      body: ListView.builder(
        itemCount: savedSuggestions.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(savedSuggestions[index]),
            onTap: () => _showConfirmationDialog(savedSuggestions[index]),
          );
        },
      ),
    );
  }

  Future<void> _showConfirmationDialog(String suggestion) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remove Suggestion?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to remove this suggestion: $suggestion?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Yes'),
              onPressed: () {
                setState(() {
                  savedSuggestions.remove(suggestion);
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

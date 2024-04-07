import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city '),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (value) {
              print('Submitted value: $value');
            },
            decoration: const InputDecoration(
              hintText: 'Enter a city name',
              border: OutlineInputBorder(),
              labelText: 'Search',
              suffixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.all(20),
            ),
          ),
        ),
      ),
    );
  }
}
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Country extends StatelessWidget {
  const Country({Key? key, required this.country}) : super(key: key);
  final Map country;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(country['name']['common']),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          children: const <Widget>[
            CountryCard(
              title: 'Capital',
            ),
            CountryCard(
              title: 'Population',
            ),
            CountryCard(
              title: 'Flag',
            ),
            CountryCard(
              title: 'Currency',
            ),
            CountryCard(
              title: 'Show on Map',
            ),
          ],
        ),
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  final String title;
  const CountryCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Center(
          child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      )),
    );
  }
}

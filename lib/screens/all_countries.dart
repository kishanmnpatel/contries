import 'package:countries/screens/Country.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Countries extends StatefulWidget {
  const Countries({Key? key}) : super(key: key);

  @override
  State<Countries> createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  late Future<List> countries;
  Future<List> getCountries() async {
    try {
      var response = await Dio().get('https://restcountries.com/v3.1/all');
      return response.data;
    } catch (e) {
      return [];
    }
  }

  @override
  void initState() {
    countries = getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('All Countries'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<List>(
          future: countries,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            Country(country: snapshot.data?[index])));
                  },
                  child: Card(
                    elevation: 6,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: Text(
                        snapshot.data?[index]['name']['common'],
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                );
              });
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

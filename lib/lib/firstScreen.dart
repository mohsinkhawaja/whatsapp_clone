import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'modelclass.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<modelclass> items = [];
  late List<modelclass> filteredItems = []; // For storing filtered items
  TextEditingController searchController = TextEditingController();

  Future<void> fetchData() async {
    final response =
    await http.get(Uri.parse("https://api.escuelajs.co/api/v1/products"));

    if (response.statusCode == 200) {
      final List<dynamic> decodedResponse = json.decode(response.body);
      setState(() {
        items = decodedResponse
            .map((data) => modelclass.fromJson(data))
            .toList();
        filteredItems = List.from(items); // Initialize filteredItems with all items initially
      });
    } else {
      throw Exception('Error loading API Data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void filterItems(String query) {
    setState(() {
      filteredItems = items
          .where((item) =>
          item.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home')),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 200,
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  filterItems(value); // Call filterItems function on text change
                },
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ],
      ),
      body: filteredItems.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: filteredItems.length,
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: Card(
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    filteredItems[index].images![0], // First image from images list
                    fit: BoxFit.cover,
                    height: 100,
                    width: double.infinity,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      filteredItems[index].title ?? '', // Accessing title from modelclass
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '\$${filteredItems[index].price}', // Accessing price from modelclass
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

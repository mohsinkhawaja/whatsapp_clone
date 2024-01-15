import 'package:flutter/material.dart';
import 'dart:async'; // Import if you're making API calls

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid View Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = []; // Replace String with your API data model

  // Fetch data from API (simulated with Future.delayed)
  Future<void> fetchData() async {
    // Simulated API call
    await Future.delayed(Duration(seconds: 2));
    // Replace this with actual API call and update 'items' list with fetched data
    setState(() {
      items = List.generate(20, (index) => 'Item $index'); // Replace with your API data
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View Example'),
      ),
      body: items.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: Card(
              elevation: 2,
              child: Center(
                child: Text(
                  items[index], // Replace this with your API data
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
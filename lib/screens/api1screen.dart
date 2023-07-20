import 'package:api/model/api1model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        products = jsonData.map<Product>((item) => Product.fromJson(item)).toList();
      });
    } else {
      // Handle error
      print('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.network(product.image),
            title: Text(product.title),
            subtitle: Text('Price: \$${product.price}'),
          );
        },
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: ProductsScreen(),
//   ));
// }

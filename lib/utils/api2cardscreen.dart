import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/api2model.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                imageUrl: product.image,
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              title: Text(product.title),
              subtitle: Text('${product.price} \$'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, color: Colors.orange),
                  Text('${product.rating}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'supplemental/asymmetric_view.dart';
import 'model/product.dart';
import 'model/products_repository.dart';

class HomePage extends StatelessWidget {
  final Category category;

  const HomePage({this.category:Category.all});
  @override
  Widget build(BuildContext context) {
    return (AsymmetricView(
        products: ProductsRepository.loadProducts(Category.all)));
  }
}
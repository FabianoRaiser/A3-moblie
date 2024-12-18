import 'package:colonial/src/widgets/location_card.dart';
import 'package:colonial/src/widgets/product_card.dart';
import 'package:colonial/src/widgets/search_card.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class Home extends StatelessWidget {
  final List<Produto> produtos;

  const Home({super.key, required this.produtos});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: LocationCard(),
        ),
        const SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.all(8.0),
          child: SearchCard(),
        )),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return ProductCard(
                id: produtos[index].id,
                name: produtos[index].name,
                imageLink: produtos[index].linkImagen,
                price: produtos[index].price,
                tag: produtos[index].tag);
          }, childCount: produtos.length),
        )
      ],
    );
  }
}

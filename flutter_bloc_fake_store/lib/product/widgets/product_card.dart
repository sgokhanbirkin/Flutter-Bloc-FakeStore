import 'package:flutter/material.dart';
import 'package:flutter_bloc_fake_store/feature/home/model/product_model.dart';
import 'package:kartal/kartal.dart';

import '../padding/page_padding.dart';
import '../utility/image/product_network_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, this.model}) : super(key: key);
  final ProductModel? model;
  @override
  Widget build(BuildContext context) {
    if (model == null) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const PagePadding.all(),
      child: Card(
        child: ListTile(
          contentPadding: const PagePadding.all(),
          title: SizedBox(
            height: context.dynamicHeight(0.5),
            child: ProjectNetwrokImage.network(
              src: model?.image,
            ),
          ),
          subtitle: Text(
            model.toString(),
            style: context.textTheme.headline6,
          ),
        ),
      ),
    );
  }
}

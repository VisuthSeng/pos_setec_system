import 'package:flutter/material.dart';
import 'package:pos_setec_system/data/model/category_model.dart';

class CategoryList extends StatefulWidget {
  final CategoryModel categoryModel;
  final int index;
  const CategoryList({
    super.key,
    required this.categoryModel,
    required this.index,
  });

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 192, 188, 188),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 30,
              child: Text(
                '${widget.index + 1}',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 13,
                    ),
              ),
            ),
            SizedBox(
              width: 150,
              child: Center(
                child: Text(
                  widget.categoryModel.name,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 14,
                      ),
                ),
              ),
            ),
            SizedBox(
              width: 100,
              child: Center(
                child: Text(
                  widget.categoryModel.listProduct.length.toString(),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 14,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

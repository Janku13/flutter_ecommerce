import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:flutter_ecommerce/src/config/app_data.dart' as appData;
import 'package:flutter_ecommerce/src/config/custom_colors.dart';
import 'package:flutter_ecommerce/src/screens/home/components/category_tile.dart';
import 'package:flutter_ecommerce/src/screens/home/components/item_tile.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(
              fontSize: 30.0,
            ),
            children: [
              TextSpan(
                text: 'Groo',
                style: TextStyle(
                  color: CustomColors.customSwatchColor,
                ),
              ),
              TextSpan(
                text: 'cers',
                style: TextStyle(
                  color: CustomColors.customContrastColor,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
              right: 15.0,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                badgeColor: CustomColors.customContrastColor,
                badgeContent: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: CustomColors.customSwatchColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                isDense: false,
                hintText: 'Search product',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: CustomColors.customContrastColor,
                  size: 21,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      30.0,
                    ),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    )),
              ),
            ),
          ),
          //category list
          const CategoryList(),
          //product grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 9 / 11.5),
              itemCount: appData.items.length,
              itemBuilder: (_, index) {
                return ItemTile(
                  item: appData.items[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  String selectedCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25),
      height: 40.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return CategoryTile(
            category: appData.categories[index],
            isSelected: selectedCategory == appData.categories[index],
            onPressd: () {
              setState(() {
                selectedCategory = appData.categories[index];
              });
            },
          );
        },
        separatorBuilder: (_, index) => const SizedBox(
          width: 10,
        ),
        itemCount: appData.categories.length,
      ),
    );
  }
}

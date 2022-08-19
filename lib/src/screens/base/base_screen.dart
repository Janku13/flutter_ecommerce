import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/config/custom_colors.dart';
import 'package:flutter_ecommerce/src/screens/cart/cart_tab.dart';
import 'package:flutter_ecommerce/src/screens/home/view/home_tab.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        // onPageChanged: (value) {
        //   setState(() {
        //     currentIndex = value;
        //   });
        // },
        controller: pageController,
        children: [
          const HomeWidget(),
          CartTabe(),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          pageController.jumpToPage(index);
        },
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: CustomColors.customSwatchColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withAlpha(100),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

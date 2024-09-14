import 'package:colonial/src/theme/colors.dart';
import 'package:colonial/src/utils/image_utils.dart';
import 'package:colonial/src/widgets/location_card.dart';
import 'package:colonial/src/widgets/product_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colonial App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amberAccent),
        primaryColor: const Color(0xFFE8B86D),
        hintColor: const Color(0xFFA1D6B2),
        cardColor: const Color(0xFFCEDF9F),
        fontFamily: '',
        useMaterial3: true,

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonsColor,
            iconColor: Colors.white
          )
        )
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Center(child: Image.asset(getImagePath('logo_colonial_small.png'), height: 50)),
      ),
      bottomNavigationBar: NavigationBar(destinations:
        const <Widget>[
          NavigationDestination(selectedIcon: Icon(Icons.home),icon: Icon(Icons.home_outlined), label: 'Inicio'),
          NavigationDestination(selectedIcon: Icon(Icons.shopping_cart),icon: Icon(Icons.shopping_cart_outlined), label: 'Carrinho'),
          NavigationDestination(selectedIcon: Icon(Icons.description),icon: Icon(Icons.description_outlined), label: 'Pedidos'),
        ],
        onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });
        },
        indicatorColor: primaryColor,
        selectedIndex: currentPageIndex,
      ),
        body: <Widget>[

          // Homepage
          ListView(
            padding: EdgeInsets.all(8.0),

            children: [
              LocationCard(),
              ProductCard(),
              ProductCard(),
              ProductCard(),
              ProductCard(),
              ProductCard(),
              ProductCard(),
              ProductCard(),
              ProductCard(),
              ProductCard(),
              ProductCard(),
            ],
          ),

          // Shopping Cart page
          Card(
            color: Colors.blue,
            margin: const EdgeInsets.all(8.0),
            child: SizedBox.expand(
              child: Center(
                child: Text("Carrinho"),
              ),
            ),
          ),

          // Previous Orders Page
          Card(
            color: Colors.blue,
            margin: const EdgeInsets.all(8.0),
            child: SizedBox.expand(
              child: Center(
                child: Text("Pedidos"),
              ),
            ),
          ),
        ][currentPageIndex]
    );
  }
}

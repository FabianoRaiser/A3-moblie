import 'package:colonial/src/controllers/shopping_kart_provider.dart';
import 'package:colonial/src/data/product_data.dart';
import 'package:colonial/src/screens/home.dart';
import 'package:colonial/src/screens/shopping_kart.dart';
import 'package:colonial/src/theme/colonial_theme.dart';
import 'package:colonial/src/theme/colors.dart';
import 'package:colonial/src/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ShoppingKartProvider(),
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colonial App',
      theme: colonialTheme,
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
          title: Center(
              child: Image.asset(getImagePath('logo_colonial_small.png'),
                  height: 50)),
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const <Widget>[
            NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'Inicio'),
            NavigationDestination(
                selectedIcon: Icon(Icons.shopping_cart),
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Carrinho'),
            NavigationDestination(
                selectedIcon: Icon(Icons.description),
                icon: Icon(Icons.description_outlined),
                label: 'Pedidos'),
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
          Home(produtos: produtosCatalog),

          // Shopping Cart page
          ShoppingKart(),

          // Previous Orders Page
          const Card(
            color: Colors.blue,
            margin: EdgeInsets.all(8.0),
            child: SizedBox.expand(
              child: Center(
                child: Text("Pedidos"),
              ),
            ),
          ),
        ][currentPageIndex]);
  }
}

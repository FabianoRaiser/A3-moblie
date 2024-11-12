import 'package:colonial/src/controllers/shopping_kart_provider.dart';
import 'package:colonial/src/controllers/user_provider.dart';
import 'package:colonial/src/models/product.dart';
import 'package:colonial/src/screens/home.dart';
import 'package:colonial/src/screens/login.dart';
import 'package:colonial/src/screens/orders.dart';
import 'package:colonial/src/screens/shopping_kart.dart';
import 'package:colonial/src/services/products_api.dart';
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
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ShoppingKartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: const MyApp(),
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
      home: const LoginScreen(),
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
  List<Produto> _produtos = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      final products = await getProdutos();
      setState(() {
        _produtos = products;
      });
    } catch (err) {
      print('Erro ao carregar produtos: $err');
    }
  }

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
          destinations:  <Widget>[
            const NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'Inicio'),
            NavigationDestination(
                selectedIcon: Icon(Icons.shopping_cart),
                icon: Consumer<ShoppingKartProvider>(builder: (context, cartProvider, _) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(Icons.shopping_cart_outlined),
                      if (cartProvider.itemCount > 0)
                        Positioned(
                          top: -5,
                          right: -5,
                          child: Badge(
                            label: Text('${cartProvider.itemCount}'),
                            backgroundColor: primaryColor,
                            textColor: Colors.white,
                            isLabelVisible: true,
                          ),
                        )
                    ],
                  );
                }),
                label: 'Carrinho'),
            const NavigationDestination(
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
          Home(produtos: _produtos),

          // Shopping Cart page
          ShoppingKart(),

          // Previous Orders Page
          Orders(),
        ][currentPageIndex]);
  }
}

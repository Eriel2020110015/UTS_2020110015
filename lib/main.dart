import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_eric_inzaghi_firdaus_2020110015/models/cart.dart';
import 'package:uts_eric_inzaghi_firdaus_2020110015/pages/auth_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Cart>(
      create: (context) => Cart(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AuthPage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_eric_inzaghi_firdaus_2020110015/currency_format.dart';
import 'package:uts_eric_inzaghi_firdaus_2020110015/models/cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, Cart data, child) {
        return Scaffold(
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  width: 1,
                  color: Color.fromARGB(255, 172, 172, 172),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  CurrencyFormat.converToIdr(data.totalPayment, 0),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  height: 65,
                  color: Colors.blue,
                  minWidth: 150,
                  child: const Text('Check Out'),
                )
              ],
            ),
          ),
          appBar: AppBar(
            title: const Text("Cart"),
          ),
          body: ListView.builder(
            itemCount: data.items.length,
            itemBuilder: (context, index) {
              final item = data.items[index];
              return Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  Provider.of<Cart>(context, listen: false).removeItem(index);

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('${item.product.title} dismissed')));
                },
                child: ListTile(
                  title: Text(item.product.title),
                  subtitle: Text(
                      "${CurrencyFormat.converToIdr(item.product.price, 0)} x ${item.qty}"),
                  trailing: Text(
                    CurrencyFormat.converToIdr(
                        item.product.price * item.qty, 0),
                    style: const TextStyle(fontSize: 14),
                  ),
                  leading: SizedBox(
                    height: 50,
                    width: 75,
                    child: Expanded(
                      child: Image.asset(
                        item.product.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

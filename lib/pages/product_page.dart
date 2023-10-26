import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:uts_eric_inzaghi_firdaus_2020110015/currency_format.dart';
import 'package:uts_eric_inzaghi_firdaus_2020110015/models/cart.dart';
import 'package:uts_eric_inzaghi_firdaus_2020110015/models/cart_item.dart';
import 'package:uts_eric_inzaghi_firdaus_2020110015/models/product.dart';

class ProductPage extends StatefulWidget {
  final Product product;

  const ProductPage({super.key, required this.product});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final TextEditingController qty = TextEditingController(text: '1');

  @override
  Widget build(BuildContext context) {
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
            SizedBox(
              width: 200,
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          qty.text = (int.parse(qty.text) + 1).toString();
                        });
                      },
                      height: 75,
                      child: const Icon(Icons.add),
                    ),
                  ),
                  SizedBox(
                    width: 75,
                    child: Expanded(
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        readOnly: true,
                        controller: qty,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                          labelText: '',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          if (int.parse(qty.text) > 1) {
                            qty.text = (int.parse(qty.text) - 1).toString();
                          }
                        });
                      },
                      height: 75,
                      child: const Icon(Icons.remove),
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                CartItem cartItem = CartItem(
                  widget.product,
                  int.parse(qty.text),
                );

                Provider.of<Cart>(context, listen: false).add(cartItem);
                Navigator.pop(context);
              },
              height: 65,
              color: Colors.blue,
              minWidth: 150,
              child: const Text('Add to Cart'),
            )
          ],
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Image.asset(
                    widget.product.image,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w900),
                ),
                Text(
                  CurrencyFormat.converToIdr(widget.product.price, 0),
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(widget.product.description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

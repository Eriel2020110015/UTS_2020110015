import 'package:flutter/material.dart';
import 'package:uts_eric_inzaghi_firdaus_2020110015/models/product.dart';
import 'package:uts_eric_inzaghi_firdaus_2020110015/pages/cart_page.dart';
import 'package:uts_eric_inzaghi_firdaus_2020110015/pages/product_page.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    var listProduct = <Product>[
      Product(0, "Mie Ayam", "images/mie_ayam.jpg", 5000,
          "Mie ayam dengan potongan daging ayam dan kuah gurih."),
      Product(1, "Nasi Goreng", "images/nasi_goreng.jpeg", 6000,
          "Nasi goreng dengan telur, udang, dan sayuran."),
      Product(2, "Soto Ayam", "images/soto_ayam.jpeg", 7000,
          "Soto ayam dengan potongan daging ayam, mie, dan kuah lezat."),
      Product(3, "Es Teh Manis", "images/es_teh_manis.jpeg", 3000,
          "Es teh manis segar untuk menemani hidangan Anda."),
      Product(4, "Es Jeruk", "images/es_jeruk.jpeg", 3500,
          "Es jeruk segar yang menyegarkan dalam cuaca panas."),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Our Product"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const CartPage(),
            ),
          );
        },
        child: const Icon(Icons.shopping_cart),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: .7,
                children: List.generate(listProduct.length, (index) {
                  return Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductPage(
                              product: listProduct[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border.symmetric(
                            horizontal: BorderSide(width: 1),
                            vertical: BorderSide(width: 1),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Image.asset(
                                listProduct[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 14,
                              ),
                              child: Text(listProduct[index].title),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  // store data when fetch
  List myData = [];

  // to show data on debuge console when print
  @override
  void initState() {
    super.initState();
    getData();
  }

  // fetch data use Future<void> getData() async
  Future<void> getData() async {
    // url fake rest api from internet
    var url = "https://dummyjson.com/carts";
    // make rp(respone) to get data in api from internet
    var rp = await http.get(Uri.parse(url));

    // check condition if it show in console it worked: 200 it mean it succesed
    if (rp.statusCode == 200) {
      // make local variable data for store or data that get
      var data = jsonDecode(rp.body);
      // use setState for show data when it success pleam pleam
      setState(() {
        // get data from cart list to store in array myData
        myData = data['carts']
            // use expand if json like this:
            // {
            //   "carts": [
            //     {
            //       "id": 1,
            //       "products": [ { "title": "Charger SXT RWD", ... }, { ... } ]
            //     },
            //     {
            //       "id": 2,
            //       "products": [ { "title": "iPhone 9", ... }, { ... } ]
            //     }
            //   ]
            // }
            .expand((cart) => (cart['products'] as List))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("🛒 Products"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: myData.isEmpty
          ? const Center(
              child: CircularProgressIndicator(), // loading processing
            ) // check condition if data true it show in body if not it vil vil like loading
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: myData.length, // check index in myData
              itemBuilder: (context, index) {
                // make final to access to data of product
                final product = myData[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            product['thumbnail'],
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product['title'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "Price: \$${product['price']}",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                "Quantity: ${product['quantity']}",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.shopping_cart_outlined),
                          color: Colors.teal,
                          onPressed: () {
                            // add to cart action
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

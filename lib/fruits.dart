import 'package:flutter/material.dart';
import 'package:no_api_shopping_app/vegetables.dart';
import 'package:o3d/o3d.dart';

import 'background.dart';
import 'bill.dart';
import 'items.dart';
import 'main.dart';

class Fruits extends StatefulWidget {
  const Fruits({super.key});

  @override
  State<Fruits> createState() => _FruitsState();
}

O3DController appleController = O3DController();
O3DController grapesController = O3DController();
O3DController watermelonController = O3DController();
O3DController mangoController = O3DController();

late List<String> fruitsOrder;

class _FruitsState extends State<Fruits> {

  final Map<String, int> itemCounts = {};

  void updateItemCount(String itemName, int count, int price) {
    setState(() {
      itemCounts[itemName] = count * price;
    });
  }

  void dataToBillScreen() {
    fruitsOrder = itemCounts.entries
        .where((entry) => entry.value > 0)
        .map((entry) => '${entry.key}: ${entry.value}')
        .toList();
    amount += itemCounts.isNotEmpty ? itemCounts.values.reduce((a, b) => a + b) : 0;
    print("Fruits amount : $amount");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Background(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Vegetables(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.arrow_back), color: Colors.white,),
                  const Padding(
                    padding: EdgeInsets.only(left: 52.0),
                    child: Text('Choose Fruits', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Items(
                          src: 'assets/apple.glb',
                          controller: appleController,
                          name: "Apple",
                          weight: '200g',
                          price: '₹150',
                          newChangedCounter: (count) => updateItemCount("Apple", count, 150),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Items(
                          src: 'assets/mango.glb',
                          controller: mangoController,
                          name: "Mango",
                          weight: '300g',
                          price: '₹100',
                          newChangedCounter: (count) => updateItemCount("Mango", count,100),
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Items(
                          src: 'assets/grapes.glb',
                          controller: grapesController,
                          name: "Grapes",
                          weight: '5g',
                          price: '₹100',
                          newChangedCounter: (count) => updateItemCount("Grapes", count, 100),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Items(
                          src: 'assets/watermelon.glb',
                          controller: watermelonController,
                          name: "Watermelon",
                          weight: '3Kg',
                          price: '₹30',
                          newChangedCounter: (count) => updateItemCount("Watermelon", count, 30),
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  }, child: const Text('Cancel',
                      style: TextStyle())),
                  ElevatedButton(
                      onPressed: () {
                        dataToBillScreen();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Bill(),
                          ),
                        );
                      },
                      child: const Text('Next',
                          style: TextStyle(fontWeight: FontWeight.w500))),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

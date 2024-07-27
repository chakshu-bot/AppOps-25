import 'package:flutter/material.dart';
import 'package:no_api_shopping_app/items.dart';
import 'package:no_api_shopping_app/main.dart';
import 'package:o3d/o3d.dart';
import 'package:no_api_shopping_app/background.dart';

import 'fruits.dart';

class Vegetables extends StatefulWidget {
  const Vegetables({super.key});

  @override
  State<Vegetables> createState() => _VegetablesState();
}

O3DController cabbageController = O3DController();
O3DController tomatoController = O3DController();
O3DController potatoController = O3DController();
O3DController cauliflowerController = O3DController();

late List<String> vegetablesOrder;
int amount = 0;

class _VegetablesState extends State<Vegetables> {

  final Map<String, int> itemCounts = {};

  void updateItemCount(String itemName, int count, int price) {
    setState(() {
      itemCounts[itemName] = count * price;
    });
  }

  void dataToBillScreen() {
    vegetablesOrder = itemCounts.entries
        .where((entry) => entry.value > 0)
        .map((entry) => '${entry.key}: ${entry.value}')
        .toList();
    amount += itemCounts.isNotEmpty ? itemCounts.values.reduce((a, b) => a + b) : 0;
   print("Vegetable amount : $amount");
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
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.arrow_back),color: Colors.white,),
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text('Choose Vegetables', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
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
                          src: 'assets/cabbage.glb',
                          controller: cabbageController,
                          name: "Cabbage",
                          weight: '1Kg',
                          price: '₹40',
                          newChangedCounter: (count) => updateItemCount("Cabbage", count, 40),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Items(
                          src: 'assets/tomato.glb',
                          controller: tomatoController,
                          name: "Tomato",
                          weight: '60g',
                          price: '₹80',
                          newChangedCounter: (count) => updateItemCount("Tomato", count, 80),
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
                          src: 'assets/potato.glb',
                          controller: potatoController,
                          name: "Potato",
                          weight: '80g',
                          price: '₹30',
                          newChangedCounter: (count) => updateItemCount("Potato", count,30),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Items(
                          src: 'assets/cauliflower.glb',
                          controller: cauliflowerController,
                          name: "Cauliflower",
                          weight: '1Kg',
                          price: '₹40',
                          newChangedCounter: (count) => updateItemCount("Cauliflower", count, 40),
                        )),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      child: const Text('Cancel', style: TextStyle())),
                  ElevatedButton(
                      onPressed: () {
                        dataToBillScreen();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Fruits(),
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

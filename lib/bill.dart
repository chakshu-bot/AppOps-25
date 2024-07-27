import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:no_api_shopping_app/background.dart';
import 'package:no_api_shopping_app/fruits.dart';
import 'package:no_api_shopping_app/vegetables.dart';

import 'main.dart';

class Bill extends StatelessWidget {
  const Bill({super.key});

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
                            builder: (context) => const Fruits(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.arrow_back), color: Colors.white,),
                  const Padding(
                    padding: EdgeInsets.only(left: 90.0),
                    child: Text(
                      'Total Bill',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 40),
                child: GlassContainer(
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.4),
                      Colors.white.withOpacity(0.1)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderGradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.1)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  blur: 20,
                  borderWidth: 1,
                  elevation: 3,
                  shadowColor: Colors.black.withOpacity(0.2),
                  frostedOpacity: 0.2,
                  height: 500,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: vegetablesOrder.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  vegetablesOrder[index],
                                  style: const TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              );
                            }),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: fruitsOrder.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  fruitsOrder[index],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                              );
                            }),
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                        indent: 16.0,
                        endIndent: 16.0,
                      ),
                      Text(
                        "Total : $amount",
                        style:
                            const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      child: const Text('Submit',
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

import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {

  final ValueChanged<int> changedCounter;

  const CounterWidget({super.key, required this.changedCounter});

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
      widget.changedCounter(counter);
    });
  }

  void decrementCounter() {
    setState(() {
      if(counter != 0){
        counter--;
        widget.changedCounter(counter);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          color: Colors.black,
          onPressed: decrementCounter,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            '$counter',
            style: const TextStyle(fontSize: 24.0),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          color: Colors.black,
          onPressed: incrementCounter,
        ),
      ],
    );
  }
}

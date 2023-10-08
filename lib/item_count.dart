import 'package:flutter/widgets.dart';

class ItemCount extends StatefulWidget {
  const ItemCount({super.key, required this.name});

  final String name;

  @override
  State<ItemCount> createState() => _ItemCountState();
}

class _ItemCountState extends State<ItemCount> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            count++;
          });
        },
        child: Text('${widget.name}: $count'));
  }
}

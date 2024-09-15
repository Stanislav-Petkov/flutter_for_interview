import 'package:flutter/material.dart';

class PositionedTiles extends StatefulWidget {
  const PositionedTiles({super.key});

  @override
  State<PositionedTiles> createState() => _PositionedTilesState();
}

class _PositionedTilesState extends State<PositionedTiles> {
  List<Widget> tiles = [];

  @override
  void initState() {
    super.initState();
    tiles = [
      const StatelessColorfulTile1(),
      const StatelessColorfulTile2(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: tiles,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTiles,
        child: const Icon(Icons.add),
      ),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class StatelessColorfulTile1 extends StatefulWidget {
  const StatelessColorfulTile1({super.key});

  @override
  State<StatelessColorfulTile1> createState() => _StatelessColorfulTile1State();
}

class _StatelessColorfulTile1State extends State<StatelessColorfulTile1> {
  final Color color1 = Colors.green;
  @override
  void initState() {
    if (mounted) {
      setState(() {});
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color1,
      child: const SizedBox(
        width: 100,
        height: 100,
      ),
    );
  }
}

class StatelessColorfulTile2 extends StatefulWidget {
  const StatelessColorfulTile2({super.key});

  @override
  State<StatelessColorfulTile2> createState() => _StatelessColorfulTile2State();
}

class _StatelessColorfulTile2State extends State<StatelessColorfulTile2> {
  final Color color1 = Colors.orange;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color1,
      child: const SizedBox(
        width: 100,
        height: 100,
      ),
    );
  }
}

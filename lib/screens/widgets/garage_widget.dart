import 'package:flutter/material.dart';

class GarageTab extends StatefulWidget {
  const GarageTab({super.key});

  @override
  State<GarageTab> createState() => _GarageTabState();
}

class _GarageTabState extends State<GarageTab> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Container(
        color: Colors.blue,
        child: const Center(
          child: Text(
            "Garage",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

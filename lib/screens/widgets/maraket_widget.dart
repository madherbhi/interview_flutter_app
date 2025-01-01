import 'package:flutter/material.dart';

class MaraketTab extends StatefulWidget {
  const MaraketTab({super.key});

  @override
  State<MaraketTab> createState() => _MaraketTabState();
}

class _MaraketTabState extends State<MaraketTab> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Container(
        color: Colors.red,
        child: const Center(
          child: Text(
            "Market",
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

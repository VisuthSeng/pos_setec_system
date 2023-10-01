import 'package:flutter/material.dart';

class SETECScreen extends StatelessWidget {
  const SETECScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Container(
          width: 200,
          height: 200,
          color: Colors.lightGreen,
          child: Image.asset(
            'asset/setec.png',
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          width: 350,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.greenAccent),
          child: const Center(
            child: Text(
              'SETEC POS SYSTEM',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

class SecundaryPage extends StatefulWidget {
  const SecundaryPage({super.key});

  @override
  State<SecundaryPage> createState() => _SecundaryPageState();
}

class _SecundaryPageState extends State<SecundaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Secundary Page'),
      ),
      body: const Center(
        child: Text(
          'Secundary Page!',
          style: TextStyle(
              color: Color(0xFF5A0F8F),
              fontSize: 20,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

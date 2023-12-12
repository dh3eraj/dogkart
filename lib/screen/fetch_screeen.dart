import 'package:flutter/material.dart';

class FetchScreen extends StatefulWidget {
  const FetchScreen({super.key});
  @override
  _FetchScreenState createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Fetch")),
    );
  }
}

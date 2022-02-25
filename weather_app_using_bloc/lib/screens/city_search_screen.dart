import 'package:flutter/material.dart';

class CitySearchScreen extends StatefulWidget {
  @override
  _CitySearchScreenState createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends State<CitySearchScreen> {
  final  _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Enter the City")),
      body: Form(
          child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                    labelText: "Enter City Name", hintText: "Example: Delhi"),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context, _controller.text);
              },
              icon: Icon(Icons.search))
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/add_place_screen.dart';
import 'package:provider/provider.dart';
import '../provider/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Places"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddPlaceScreen.routeName);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: Center(
          child: const Text("Got no places yet, Start Adding some"),
        ),
        builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0
            ? ch
            : ListView.builder(
                itemCount: greatPlaces.items.length,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(backgroundImage: FileImage(greatPlaces.items[i].image),),
                  title: Text(greatPlaces.items[i].title),
                  onTap: (){
                    // Go to detail Page...
                  },
                ),
              ),
      ),
    );
  }
}

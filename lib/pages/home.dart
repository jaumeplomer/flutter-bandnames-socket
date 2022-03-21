import 'package:flutter/material.dart';

import 'package:test1/models/band.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

List<Band> bands = [
  Band(id: '1', name: 'Van Halen', votes: 5),
  Band(id: '2', name: 'Queen', votes: 1),
  Band(id: '3', name: 'Guns and roses', votes: 2),
  Band(id: '4', name: 'Nirvana', votes: 4),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BandNames', style: TextStyle( color: Colors.black87) ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, i) => _bandTile(bands[i])  
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add),
        elevation: 1,
        onPressed: addNewBand
      ),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (  direction ) {
        print('direction: $direction');
        print('id: ${band.id}');
      },
      background: Container(
        padding: EdgeInsets.only( left: 8.0 ),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('Delete Band', style: TextStyle( color: Colors.white) ),
        )
      ),
      child: ListTile(
          leading: CircleAvatar(
            child: Text( band.name.substring(0,2) ),
            backgroundColor: Colors.blue[100],
          ),
          title: Text(band.name ),
          trailing: Text('${ band.votes }', style: TextStyle( fontSize: 20) ),
          onTap: () {
            print(band.name);
          },
        ),
    );
  }

  addNewBand() {

    final textController = new TextEditingController();

    showDialog(
      context: context,
      builder: ( context ) {
        return AlertDialog(
          title: Text('New Band name:'),
          content: TextField(
            controller: textController,
          ),
          actions: <Widget>[
            MaterialButton(
              child: Text('Add'),
              elevation: 5,
              textColor: Colors.blue,
              onPressed: () => addBandToList( textController.text)
            )
          ],
        );
      },
    );
  }

  void addBandToList(String name) {

      if (name.length > 1) {
          this.bands.add(new Band(id: DateTime.now().toString(), name: name, votes: 0));
          setState(() {});
      }
   
      Navigator.pop(context);
  }

}
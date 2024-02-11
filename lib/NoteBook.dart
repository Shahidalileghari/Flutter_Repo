import 'package:basics_flutter/Database_handler.dart';
import 'package:basics_flutter/Notes.dart';
import 'package:flutter/material.dart';

class NoteBook extends StatefulWidget {
  const NoteBook({super.key});
  State<NoteBook> createState() => _NoteBookState();
}

class _NoteBookState extends State<NoteBook> {

  DBhelper? helper;
  @override
  void initState(){
    super.initState();

    helper=DBhelper();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: const Column(
        children: [

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          helper!.insert(NotesModel(
              email: 'shahidali@gmail.com',
              description: "My first app",
              title: "NoApp", age: 22)
             ).then((value) {
               print("Data added");
          }).onError((error, stackTrace) {
            print("Error is here\t\t$error");
          });


        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

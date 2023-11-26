import 'package:flutter/material.dart';

class student extends StatefulWidget {
  const student({Key? key}) : super(key: key);

  @override
  State<student> createState() => _StudentState();
}

class _StudentState extends State<student> {
  final TextEditingController notesController = TextEditingController();
  List<String> notes = [];

 void saveNote() {
    String newNote = notesController.text.trim();
    if (newNote.isNotEmpty) {
      setState(() {
        notes.add(newNote);
        notesController.clear();
      });
    }
  }

 void deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class Notes'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Write Your Notes:',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            TextField(
              controller: notesController,
              decoration: InputDecoration(
                hintText: 'Input your Notes',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                saveNote();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
              ),
              child: Text('Save Note'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Your Notes:',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 5),
            for (int index = 0; index < notes.length; index++)
              Card(
                child: ListTile(
                  title: Text(notes[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteNote(index);
                    },
                  ),
                ),
              ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent, // Background color
              ),
              child: Text('Go Back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

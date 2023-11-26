import 'package:flutter/material.dart';

class teacher extends StatefulWidget {
  const teacher({Key? key}) : super(key: key);

  @override
  State<teacher> createState() => _TeacherState();
}

class _TeacherState extends State<teacher> {
  final TextEditingController notesController = TextEditingController();
  List<DateTime> examDates = [];

  void saveDate() {
    String newDate = notesController.text.trim();
    List<String> dateParts = newDate.split('-');
    DateTime parsedDate = DateTime(
      int.parse(dateParts[0]),
      int.parse(dateParts[1]),
      int.parse(dateParts[2]),
    );
    setState(() {
      examDates.add(parsedDate);
      notesController.clear();
    });
  }

  void deleteDate(int index) {
    setState(() {
      examDates.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam Schedule'),
        backgroundColor: Colors.blue[800],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Write Your Exam Dates:',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            TextField(
              controller: notesController,
              decoration: InputDecoration(
                hintText: 'Input your Exam Dates (Y-M-D)',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                saveDate();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[800],
              ),
              child: Text('Save Date'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Your Exam Dates:',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            for (int index = 0; index < examDates.length; index++)
              Card(
                child: ListTile(
                  title: Text(
                    '${examDates[index].year}-${examDates[index].month}-${examDates[index].day}',
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deleteDate(index);
                    },
                  ),
                ),
              ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
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


import 'package:flutter/material.dart';
import '../widgets/list_card.dart';
import '../widgets/dialog_box.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//4E6C50 for background
//395144 for card color and app bar
class _HomePageState extends State<HomePage> {
  final _textController = TextEditingController();

  //list of tasks
  List _items = [
    ['Groceries', false],
    ['Todo app build', false],
    ['Dishes', false],
  ];

  //list strucking management
  void onChanges(bool? value, int index) {
    setState(() {
      _items[index][1] = !_items[index][1];
    });
  }

  //onSaved
  void onSavedFunc() {
    setState(() {
      _items.add([_textController.text, false]);
      _textController.clear();
    });
    Navigator.of(context).pop();
  }

  //create tasks
  void createTask() {
    showDialog(
        context: context,
        builder: (context) => DialogBox(
              controls: _textController,
              onSaved: onSavedFunc,
              onCancel: () => Navigator.of(context).pop(),
            ));
  }

  //deletes task
  void deleteTask(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  void addTasks() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff395144),
        centerTitle: true,
        title: const Text(
          'MyDay',
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: const Color(0xffF0EBCE),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, i) {
          return ListCard(
            job: _items[i][0],
            value: _items[i][1],
            onchanges: (value) => onChanges(value, i),
            deleteTask: (context) => deleteTask(i),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        backgroundColor: const Color(0xff395144),
        onPressed: createTask,
        child: Icon(Icons.add),
      ),
    );
  }
}

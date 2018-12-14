import 'package:flutter/material.dart';

import 'package:todo_redux/models/model.dart';
import 'package:todo_redux/models/view_model.dart';

TextEditingController taskController = TextEditingController();
TextEditingController placeController = TextEditingController();
TextEditingController timeController = TextEditingController();

Map<String, IconData> categoryIconData = {
  "Business": Icons.work,
  "Personal": Icons.person,
};

Widget categoryIcon() {
  return Container(
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.blue,
    ),
    child: Icon(
      categoryIconData[_currentCategory],
      size: 50.0,
      color: Colors.white,
    ),
  );
}

class CategoryDropdown extends StatefulWidget {
  createState() => _CategoryDropdownState();
}

List<String> _categories = ["Personal", "Business"];
String _currentCategory = _categories[0];

class _CategoryDropdownState extends State<CategoryDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: DropdownButton<String>(
        value: _currentCategory,
        items: _categories.map(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(fontSize: 15.0),
              ),
            );
          },
        ).toList(),
        onChanged: (value) {
          setState(() {
            _currentCategory = value;
          });
        },
        isExpanded: true,
        hint: Text("Select Task Type"),
      ),
    );
  }
}

FocusNode textNode2 = new FocusNode();
Widget taskField(context) {
  return TextFormField(
    autofocus: true,
    controller: taskController,
    decoration: InputDecoration(labelText: "Task"),
    onFieldSubmitted: (String value) {
      FocusScope.of(context).requestFocus(textNode2);
    },
  );
}

Widget addButton(BuildContext context, ViewModel model) {
  return ButtonTheme(
    minWidth: double.infinity,
    child: RaisedButton(
      child: Text(
        "ADD  TODO",
        style: TextStyle(color: Colors.white),
      ),
      elevation: 4.0,
      padding: EdgeInsets.all(15.0),
      color: Colors.blue,
      splashColor: Colors.blueGrey,
      onPressed: () {
        model.onAddTodo(
          Todo(
              task: taskController.text,
              place: placeController.text,
              time: timeController.text,
              category: _currentCategory),
        );
        taskController.text = '';
        placeController.text = '';
        timeController.text = '';
        Navigator.pop(context);
      },
    ),
  );
}

Widget placeField() {
  return TextFormField(
    focusNode: textNode2,
    controller: placeController,
    decoration: InputDecoration(labelText: "Place"),
  );
}

class TimeField extends StatefulWidget {
  @override
  createState() => new TimeFieldState();
}

class TimeFieldState extends State<TimeField> {
  static TimeOfDay _time = new TimeOfDay.now();

  Future<Null> selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );

    if (picked != null) {
      setState(() {
        timeController.text = parseTime(picked);
        _time = picked;
      });
    }
  }

  static String parseTime(TimeOfDay time) {
    String hour = time.hourOfPeriod.toString();
    String minute = time.minute.toString();
    String hourTypeRaw = time.period.toString();
    String hourType = hourTypeRaw.substring(hourTypeRaw.length - 2);
    return "$hour:$minute $hourType";
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectTime(context);
      },
      child: Container(
        color: Colors.transparent,
        child: IgnorePointer(
          child: new TextFormField(
            controller: timeController,
            decoration: new InputDecoration(
              suffixIcon: new Icon(Icons.calendar_today),
              labelText: "Time",
            ),
          ),
        ),
      ),
    );
  }
}

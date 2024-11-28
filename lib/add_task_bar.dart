import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/constants/Theme.dart';
import 'package:todo/constants/style.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/home_screen.dart';
import 'package:todo/widgets/button.dart';
import 'package:todo/widgets/input_filed.dart';

import 'models/task.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final Taskcontroller _TaskController = Get.put(Taskcontroller());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:30 PM";
  String _starTime = DateFormat("hh:mm:a").format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int> RemindList = [
    5,
    10,
    15,
    20,
  ];
  String _selectedRepeat = "None";
  List<String> RepeatList = [
    "None",
    "Daily",
    "Weekly",
    "Monthly",
  ];
  int _selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Add Task",
              style: text.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            MyInputFild(
              title: "Title",
              hint: "Enter your title",
              controller: _titleController,
            ),
            MyInputFild(
              title: "Note",
              hint: "Enter your note",
              controller: _noteController,
            ),
            MyInputFild(
              title: "Date:",
              hint: DateFormat.yMd().format(_selectedDate),
              widget: IconButton(
                  icon: const Icon(
                    Icons.calendar_month,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    _getDateformUser();
                  }),
            ),
            Row(
              children: [
                Expanded(
                  child: MyInputFild(
                    title: "Start Time",
                    hint: _starTime,
                    widget: IconButton(
                      onPressed: () {
                        _getTimeForUser(isStarTime: true);
                      },
                      icon: const Icon(
                        Icons.access_time_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: MyInputFild(
                    title: "End Time",
                    hint: _endTime,
                    widget: IconButton(
                      onPressed: () {
                        _getTimeForUser(isStarTime: false);
                      },
                      icon: const Icon(
                        Icons.access_time_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            MyInputFild(
              title: "Remind",
              hint: "$_selectedRemind minute early",
              widget: DropdownButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  // style: subTitleStyle,
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedRemind = int.parse(newValue!);
                    });
                  },
                  items: RemindList.map<DropdownMenuItem<String>>((int value) {
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: Text(value.toString()),
                    );
                  }).toList()),
            ),
            MyInputFild(
              title: "Repeat",
              hint: _selectedRepeat,
              widget: DropdownButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  // style: subTitleStyle,
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedRepeat = newValue!;
                    });
                  },
                  items:
                      RepeatList.map<DropdownMenuItem<String>>((String? value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value!),
                    );
                  }).toList()),
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _colorPalette(),
                MyButton(label: "Create Task", onTap: () => _validateDate())
              ],
            )
          ]),
        ),
      ),
    );
  }

  _validateDate() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      _addTaskToDb();

      Get.back();
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
      log("message");

      Get.snackbar(
        "Required",
        "all fields are required !",
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(10),
        backgroundColor: pinkClr,
        colorText: Colors.white,
        icon: const Icon(
          Icons.warning_amber_rounded,
          color: Colors.white,
        ),
      );
    }
  }

  _addTaskToDb() async {
    await _TaskController.addTask(
        task: Task(
      note: _noteController.text,
      title: _titleController.text,
      date: DateFormat.yMd().format(_selectedDate),
      starTime: _starTime,
      endTime: _endTime,
      remind: _selectedRemind,
      repeat: _selectedRepeat,
      color: _selectedColor,
      isCompleted: 0,
    ));
    print("My id is " "$Value");
  }

  _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home_Screen()),
            );
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: Colors.grey[500],
          ),
        ),
      ),
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Center(
              child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[800]),
                  child: const Icon(Icons.person)),
            )),
      ],
    );
  }

  _colorPalette() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: text.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Wrap(
          children: List<Widget>.generate(3, (int index) {
            return GestureDetector(
              onTap: (() {
                setState(() {
                  _selectedColor = index;
                });
              }),
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                    backgroundColor: index == 0
                        ? PurpClr
                        : index == 1
                            ? pinkClr
                            : yellowClr,
                    radius: 14,
                    child: _selectedColor == index
                        ? const Icon(Icons.done, color: Colors.white, size: 16)
                        : Container()),
              ),
            );
          }),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }

  _getDateformUser() async {
    DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2123));
    if (pickerDate != null) {
      setState(() {
        _selectedDate = pickerDate;
      });
    }
  }

  _getTimeForUser({required bool isStarTime}) async {
    var pickedTime = await _showTimePicker();
    String formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("canceld");
    } else if (isStarTime == true) {
      setState(() {
        _starTime = formatedTime;
      });
    } else if (isStarTime == false) {
      setState(() {
        _endTime = formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(_starTime.split(":")[0]),
            minute: int.parse(_starTime.split(":")[1].split(" ")[0])));
  }
}
// spay

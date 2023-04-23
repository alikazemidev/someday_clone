import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:someday_clone/model/task.dart';

class TodaysTaskscreen extends StatefulWidget {
  const TodaysTaskscreen({super.key});

  @override
  State<TodaysTaskscreen> createState() => _TodaysTaskscreenState();
}

class _TodaysTaskscreenState extends State<TodaysTaskscreen> {
  int selectedIndex = 0;
  List<bool> taskCompleted = List.generate(5, (_) => false);
  List<Task> tasks = [
    Task('task 1', true),
    Task('task 2', true),
    Task('task 3', false),
    Task('task 4', true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2 + 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'add your task...',
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: () {},
                        child: const Text('Add'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Colors.amber.shade600,
        child: const Icon(
          CupertinoIcons.pencil,
          size: 30,
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'today'.toUpperCase(),
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text(
                      tasks[index].title!,
                      style: TextStyle(
                        decoration: taskCompleted[index] == true
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    const Spacer(),
                    Transform.scale(
                      scale: 1.5,
                      child: CheckboxTheme(
                        data: const CheckboxThemeData(
                          shape: CircleBorder(),
                        ),
                        child: Checkbox(
                          fillColor: MaterialStateProperty.all(Colors.green),
                          onChanged: (value) {
                            setState(() {
                              tasks[index].isCompleted = value!;
                            });
                          },
                          value: tasks[index].isCompleted,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

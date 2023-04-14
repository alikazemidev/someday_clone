import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodaysTaskscreen extends StatefulWidget {
  const TodaysTaskscreen({super.key});

  @override
  State<TodaysTaskscreen> createState() => _TodaysTaskscreenState();
}

class _TodaysTaskscreenState extends State<TodaysTaskscreen> {
  int selectedIndex = 0;
  List<bool> taskCompleted = List.generate(5, (_) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
        key: UniqueKey(),
        itemCount: 5,
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
                    Text('today $index'),
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
                              taskCompleted[index] = value!;
                            });
                          },
                          value: taskCompleted[index],
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

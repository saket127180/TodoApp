import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/todo.dart';
import 'package:todo_app/todo_provider.dart';

class AddTodoScreen extends ConsumerWidget {
  AddTodoScreen({super.key});

  final todoController = TextEditingController();
  int priority = 0;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            controller: todoController,
            decoration: InputDecoration(hintText: 'what needs to be done?'),
          ),
        ),
        SizedBox(
          height: 70,
          child: Center(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: colorList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      priority = index;
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorList[index],
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          )),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              final todo = Todo(
                title: todoController.text,
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                isDone: false,
                priority: priority,
              );
              ref.read(todoProvider.notifier).addTodo(todo);
              todoController.clear();
              Navigator.of(context).pop();
            },
            child: const Text('Add todo'))
      ]),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:bloc_practice/models/todos_models.dart';
import 'package:bloc_practice/screens/add_todo/add_todo_screen.dart';
import 'package:bloc_practice/screens/home/widgets/todo_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Pattern: To Do\'s'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddTodoScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Pending To Do\'s: ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: Todo.todos.length,
              itemBuilder: (BuildContext context, int index) {
                return TodoCard(
                  todo: Todo.todos[index],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

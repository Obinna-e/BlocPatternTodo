import 'package:bloc_practice/blocs/todos/todos_bloc.dart';
import 'package:bloc_practice/blocs/todos_filter/todos_filter_bloc.dart';
import 'package:bloc_practice/models/todos_filter_model.dart';
import 'package:flutter/material.dart';

import 'package:bloc_practice/models/todos_models.dart';
import 'package:bloc_practice/screens/add_todo/add_todo_screen.dart';
import 'package:bloc_practice/screens/home/widgets/todo_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
          bottom: TabBar(
            onTap: (tabIndex) {
              switch (tabIndex) {
                case 0:
                  BlocProvider.of<TodosFilterBloc>(context).add(
                    const UpdateTodos(todosFilter: TodosFilter.pending),
                  );
                  break;
                case 1:
                  BlocProvider.of<TodosFilterBloc>(context).add(
                    const UpdateTodos(todosFilter: TodosFilter.completed),
                  );
                  break;
              }
            },
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.pending,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.add_task,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _todos('Pending To Do\'s'),
            _todos('Completed To Do\'s'),
          ],
        ),
      ),
    );
  }

  BlocConsumer<TodosFilterBloc, TodosFilterState> _todos(String title) {
    return BlocConsumer<TodosFilterBloc, TodosFilterState>(
      listener: (context, state) {
        if (state is TodosFilterLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  'There are ${state.filteredTodos.length} To Do\'s in your ${state.todosFilter.toString().split('.').last} list')));
        }
      },
      builder: (context, state) {
        if (state is TodosFilterLoading) {
          return const CircularProgressIndicator();
        }

        if (state is TodosFilterLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.filteredTodos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return TodoCard(
                      todo: state.filteredTodos[index],
                    );
                  },
                )
              ],
            ),
          );
        } else {
          return const Text('Something went wrong!');
        }
      },
    );
  }
}

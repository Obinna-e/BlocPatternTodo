import 'package:bloc_practice/blocs/todos/todos_bloc.dart';
import 'package:bloc_practice/blocs/todos_filter/todos_filter_bloc.dart';
import 'package:bloc_practice/models/todos_models.dart';
import 'package:bloc_practice/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodosBloc()
            ..add(
              LoadTodos(
                todos: [
                  Todo(
                    id: '1',
                    task: 'Sample Todo 1',
                    description: 'This is a test To Do',
                  ),
                  Todo(
                    id: '2',
                    task: 'Sample ToDo 2',
                    description: 'This is a test To Do',
                  ),
                ],
              ),
            ),
        ),
        BlocProvider(
            create: (context) =>
                TodosFilterBloc(todosBloc: BlocProvider.of<TodosBloc>(context)))
      ],
      child: MaterialApp(
        title: 'Bloc Pattern - Todos',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: const AppBarTheme(
              color: Color(0xFF000A1F),
            )),
        home: const HomeScreen(),
      ),
    );
  }
}

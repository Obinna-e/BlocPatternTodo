import 'package:bloc_practice/blocs/todos/todos_bloc.dart';
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
        BlocProvider(create: (context) => TodosBloc()..add(LoadTodos()))
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

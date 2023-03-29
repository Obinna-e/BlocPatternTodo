import 'package:bloc/bloc.dart';
import 'package:bloc_practice/models/todos_models.dart';
import 'package:equatable/equatable.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodosLoading()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodos);
    on<DeleteTodo>(_onDeleteTodos);
    on<UpdateTodo>(_onUpdateTodos);
  }

  void _onLoadTodos(LoadTodos event, Emitter<TodosState> emit) {
    emit(
      TodosLoaded(todos: event.todos),
    );
  }

  void _onAddTodos(AddTodo event, Emitter<TodosState> emit) {}
  void _onDeleteTodos(DeleteTodo event, Emitter<TodosState> emit) {}
  void _onUpdateTodos(UpdateTodo event, Emitter<TodosState> emit) {}
}

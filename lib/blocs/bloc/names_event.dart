part of 'names_bloc.dart';

abstract class NamesEvent extends Equatable {
  const NamesEvent();

  @override
  List<Object> get props => [];
}

class LoadCounter extends NamesEvent {}

class AddName extends NamesEvent {
  final String name;

  const AddName({required this.name});

  @override
  List<Object> get props => [name];
}

class RemoveName extends NamesEvent {
  final String name;

  const RemoveName({required this.name});

  @override
  List<Object> get props => [name];
}

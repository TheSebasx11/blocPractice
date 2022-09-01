part of 'names_bloc.dart';

abstract class NamesState extends Equatable {
  const NamesState();

  @override
  List<Object> get props => [];
}

class NamesInitial extends NamesState {}

class NamesLoaded extends NamesState {
  final List<String> names;

  const NamesLoaded({required this.names});

  @override
  List<Object> get props => [names];
}

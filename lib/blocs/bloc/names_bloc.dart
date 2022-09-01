import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'names_event.dart';
part 'names_state.dart';

class NamesBloc extends Bloc<NamesEvent, NamesState> {
  NamesBloc() : super(NamesInitial()) {
    on<LoadCounter>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2));
      emit(const NamesLoaded(names: <String>[]));
    });
    on<AddName>((event, emit) {
      if (state is NamesLoaded) {
        final state = this.state as NamesLoaded;
        emit(NamesLoaded(names: List.from(state.names)..add(event.name)));
      }
    });
    on<RemoveName>((event, emit) async {
      if (state is NamesLoaded) {
        final state = this.state as NamesLoaded;
        emit(NamesLoaded(names: List.from(state.names)..remove(event.name)));
      }
    });
  }
}

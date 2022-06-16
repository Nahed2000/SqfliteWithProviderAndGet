

import 'package:data_base/bloc/event/crud_event.dart';
import 'package:data_base/bloc/state/crud_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../database/note_controller.dart';
import '../../model/note.dart';

class NoteBloc extends Bloc<CrudEvent, CrudState> {
  NoteBloc(CrudState initialState) : super(initialState) {
    on<CreateEvent<Note>>(_createEvent);
    on<ReadEvent>(_readEvent);
  }
  NoteController noteController = NoteController();
  List<Note> noteList = <Note>[];

  void _createEvent(CreateEvent<Note> event, Emitter emit) async {
    int newRowId = await noteController.create(event.object);
    if (newRowId != 0) {
      event.object.id = newRowId;
      noteList.add(event.object);
      emit(ListReadState<Note>(noteList));
    }
    String message = newRowId != 0 ? 'Created Success ' : 'Created Failed';
    emit(ProcessState(message, newRowId != 0, ProcessType.create));
  }

  void _readEvent(ReadEvent event, Emitter emit) async {
    noteList = await noteController.read();
    emit(ListReadState<Note>(noteList));
  }
}

import 'package:admin_ambient/data/datasource/notes_datasource.dart';
import 'package:admin_ambient/data/datasource/podcast_datasource.dart';
import 'package:admin_ambient/domain/models/notes_model.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  final NotesDataSource notesDataSource;
  final PodCastDataSource podCastDataSource;
  NotesCubit(this.notesDataSource, this.podCastDataSource)
      : super(NotesState());

  Future getAllNote() async {
    emit(state.copyWith(notesStateEnum: NotesStateEnum.loading));
    try {
      final resp = await notesDataSource.getAllNotes();
      List<NotesModel> list = resp.map((e) {
        Map<String, dynamic> map = e.data();
        map.addAll({"id": e.id});
        return NotesModel.fromFirebase(map);
      }).toList();
      emit(state.copyWith(
          notesStateEnum: NotesStateEnum.success, notelist: list));
    } catch (e) {
      emit(state.copyWith(notesStateEnum: NotesStateEnum.error));
    }
  }

  Future deleteNotes(String id) async {
    emit(state.copyWith(notesStateEnum: NotesStateEnum.loading));
    try {
      final bool resp = await notesDataSource.deleteNote(id);
      if (resp) {
        await getAllNote();
      }
    } catch (e) {
      emit(state.copyWith(notesStateEnum: NotesStateEnum.error));
    }
  }

  void currentNotes(NotesModel current) {
    emit(state.copyWith(currentNotes: current));
  }

  Future setNewNotes(
      {required String name,
      required String description,
      required String problem,
      required String author}) async {
    try {
      emit(state.copyWith(notesUploadEnum: NotesUploadEnum.loading));
      final Map? file = await getImage();
      if (file != null) {
        final url = await podCastDataSource.setImage(
            name: file["file"], fileBytes: file["bytes"]);
        final resp = await notesDataSource.setNewNotes(
            name,
            problem,
            description,
            author,
            url,
            DateFormat('d, MMM').format(DateTime.now()));
        if (resp) {
          await getAllNote();
          emit(state.copyWith(notesUploadEnum: NotesUploadEnum.success));
        } else {
          emit(state.copyWith(notesUploadEnum: NotesUploadEnum.error));
        }
      }
    } catch (e) {
      emit(state.copyWith(notesUploadEnum: NotesUploadEnum.error));
    }
  }

  getImage() async {
    final FilePickerResult? result = await FilePickerWeb.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );
    if (result != null && result.files.single.bytes != null) {
      String file = result.files.single.name;
      Uint8List fileBytes = result.files.single.bytes!;
      return {"file": file, "bytes": fileBytes};
    } else {
      return null;
    }
  }
}

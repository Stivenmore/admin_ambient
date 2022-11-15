part of 'notes_cubit.dart';

enum NotesStateEnum { success, error, loading, none }

enum NotesUploadEnum { success, error, loading, none }

class NotesState extends Equatable {
  late final NotesStateEnum notesStateEnum;
  late final NotesUploadEnum notesUploadEnum;
  late final List<NotesModel> notelist;
  late final NotesModel currentNotes;

  NotesState(
      {NotesStateEnum? notesStateEnum,
      List<NotesModel>? notelist,
      NotesModel? currentNotes,
      NotesUploadEnum? notesUploadEnum}) {
    this.notesStateEnum = notesStateEnum ?? NotesStateEnum.none;
    this.notesUploadEnum = notesUploadEnum ?? NotesUploadEnum.none;
    this.notelist = notelist ?? <NotesModel>[];
    this.currentNotes = currentNotes ??
        NotesModel(
            img: "",
            name: "",
            description: "",
            creator: "",
            episodes: [],
            time: "",
            id: "");
  }

  NotesState copyWith(
      {NotesStateEnum? notesStateEnum,
      List<NotesModel>? notelist,
      NotesModel? currentNotes,
      NotesUploadEnum? notesUploadEnum}) {
    return NotesState(
        notesStateEnum: notesStateEnum ?? this.notesStateEnum,
        notelist: notelist ?? this.notelist,
        currentNotes: currentNotes ?? this.currentNotes,
        notesUploadEnum: notesUploadEnum ?? this.notesUploadEnum);
  }

  @override
  List<Object?> get props =>
      [notesStateEnum, notelist, currentNotes, notesUploadEnum];
}

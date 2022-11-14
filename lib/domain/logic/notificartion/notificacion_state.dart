part of 'notificacion_cubit.dart';

abstract class NotificacionState extends Equatable {
  const NotificacionState();

  @override
  List<Object> get props => [];
}

class NotificacionInitial extends NotificacionState {}

class NotificacionLoaded extends NotificacionState {
  final List<UserModel> userModel;
  const NotificacionLoaded({required this.userModel});

  @override
  List<Object> get props => [userModel];
}

class NotificacionLoading extends NotificacionState {}

class NotificacionError extends NotificacionState {}

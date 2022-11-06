part of 'sign_in_and_sign_up_cubit.dart';

abstract class SignInAndUpState extends Equatable {
  const SignInAndUpState();

  @override
  List<Object> get props => [];
}

class SignInAndUpInitial extends SignInAndUpState {}

class SignInAndUpLoaded extends SignInAndUpState {
  final UserModel user;
  const SignInAndUpLoaded({required this.user});

  @override
  List<Object> get props => [user];
}

class SignInAndUpLoading extends SignInAndUpState {}

class SignInAndUpError extends SignInAndUpState {
  final String message;
  const SignInAndUpError({required this.message});

  @override
  List<Object> get props => [message];
}

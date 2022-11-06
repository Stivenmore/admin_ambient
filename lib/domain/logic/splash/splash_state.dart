part of 'splash_cubit.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashSuccess extends SplashState {}

class SplashError extends SplashState {}

class SplashLoading extends SplashState {}

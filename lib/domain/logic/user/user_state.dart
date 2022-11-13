part of 'user_cubit.dart';

enum StateUserModelEnum { none, error, loaded, loading }

enum StatePointsUp { none, error, loaded, loading }

enum StatePointsDown { none, error, loaded, loading }

class UserState extends Equatable {
  late final UserModel userModel;
  late final StateUserModelEnum stateUserModelEnum;
  late final StatePointsUp statePointsUp;
  late final StatePointsDown statePointsDown;
  UserState({
    UserModel? userModel,
    StateUserModelEnum? stateUserModelEnum,
    StatePointsUp? statePointsUp,
    StatePointsDown? statePointsDown,
  }) {
    this.userModel = userModel ??
        UserModel(
            nombre: "",
            email: "",
            transaction: <Transaction>[],
            recycler: <RecyclerModel>[]);
    this.stateUserModelEnum = stateUserModelEnum ?? StateUserModelEnum.none;
    this.statePointsDown = statePointsDown ?? StatePointsDown.none;
    this.statePointsUp = statePointsUp ?? StatePointsUp.none;
  }

  UserState copyWith({
    UserModel? userModel,
    StateUserModelEnum? stateUserModelEnum,
    StatePointsUp? statePointsUp,
    StatePointsDown? statePointsDown,
  }) {
    return UserState(
      userModel: userModel ?? this.userModel,
      stateUserModelEnum: stateUserModelEnum ?? this.stateUserModelEnum,
      statePointsDown: statePointsDown ?? this.statePointsDown,
      statePointsUp: statePointsUp ?? this.statePointsUp,
    );
  }

  @override
  List<Object?> get props =>
      [userModel, statePointsDown, statePointsUp, stateUserModelEnum];
}

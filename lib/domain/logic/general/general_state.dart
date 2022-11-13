part of 'general_cubit.dart';

class GeneralState extends Equatable {
  late final int currentPageDashboard;
  GeneralState({int? currentPageDashboard}) {
    this.currentPageDashboard = currentPageDashboard ?? 0;
  }

  GeneralState copyWith({int? currentPageDashboard}) {
    return GeneralState(
        currentPageDashboard:
            currentPageDashboard ?? this.currentPageDashboard);
  }

  @override
  List<Object?> get props => [currentPageDashboard];
}



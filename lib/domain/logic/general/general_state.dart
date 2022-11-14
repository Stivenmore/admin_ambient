part of 'general_cubit.dart';

class GeneralState extends Equatable {
  late final int currentPageDashboard;
  late final int pricepoint;
  GeneralState({int? currentPageDashboard, int? pricepoint}) {
    this.currentPageDashboard = currentPageDashboard ?? 0;
    this.pricepoint = pricepoint ?? 0;
  }

  GeneralState copyWith({int? currentPageDashboard, int? pricepoint}) {
    return GeneralState(
        currentPageDashboard: currentPageDashboard ?? this.currentPageDashboard,
        pricepoint: pricepoint ?? this.pricepoint);
  }

  @override
  List<Object?> get props => [currentPageDashboard, pricepoint];
}

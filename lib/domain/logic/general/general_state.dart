part of 'general_cubit.dart';

class GeneralState extends Equatable {
  late final int currentPageDashboard;
  late final int globalcurrentpage;
  late final int pricepoint;
  GeneralState(
      {int? currentPageDashboard, int? pricepoint, int? globalcurrentpage}) {
    this.currentPageDashboard = currentPageDashboard ?? 0;
    this.pricepoint = pricepoint ?? 0;
    this.globalcurrentpage = globalcurrentpage ?? 0;
  }

  GeneralState copyWith(
      {int? currentPageDashboard, int? pricepoint, int? globalcurrentpage}) {
    return GeneralState(
      currentPageDashboard: currentPageDashboard ?? this.currentPageDashboard,
      pricepoint: pricepoint ?? this.pricepoint,
      globalcurrentpage: globalcurrentpage ?? this.globalcurrentpage,
    );
  }

  @override
  List<Object?> get props =>
      [currentPageDashboard, pricepoint, globalcurrentpage];
}

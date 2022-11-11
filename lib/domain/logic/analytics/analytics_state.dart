part of 'analytics_cubit.dart';

enum AnalyticsStateEnumDay { none, error, success, loading }

enum AnalyticsStateEnumMonth { none, error, success, loading }

enum AnalyticsStateEnumYears { none, error, success, loading }

enum AnalyticsStateEnumUpdate { none, error, success, loading }

class AnalyticsState extends Equatable {
  late final AnalyticsStateEnumDay enumDay;
  late final List<UserModel> analyticsDayUser;
  late final AnalyticsStateEnumMonth enumMonth;
  late final List<UserModel> analyticsMonthUser;
  late final AnalyticsStateEnumYears enumYears;
  late final List<UserModel> analyticsYearsUser;
  late final AnalyticsStateEnumUpdate enumUpdate;
  late final List<UserModel> analyticsUpdateUser;
  late final bool avaiblePodcast;
  late final bool avaibleNotes;

  AnalyticsState({
    AnalyticsStateEnumDay? enumDay,
    List<UserModel>? analyticsDayUser,
    AnalyticsStateEnumMonth? enumMonth,
    List<UserModel>? analyticsMonthUser,
    AnalyticsStateEnumYears? enumYears,
    List<UserModel>? analyticsYearsUser,
    AnalyticsStateEnumUpdate? enumUpdate,
    List<UserModel>? analyticsUpdateUser,
    bool? avaiblePodcast,
    bool? avaibleNotes,
  }) {
    this.enumDay = enumDay ?? AnalyticsStateEnumDay.none;
    this.analyticsDayUser = analyticsDayUser ?? <UserModel>[];
    this.enumMonth = enumMonth ?? AnalyticsStateEnumMonth.none;
    this.analyticsMonthUser = analyticsMonthUser ?? <UserModel>[];
    this.enumYears = enumYears ?? AnalyticsStateEnumYears.none;
    this.analyticsYearsUser = analyticsYearsUser ?? <UserModel>[];
    this.enumUpdate = enumUpdate ?? AnalyticsStateEnumUpdate.none;
    this.analyticsUpdateUser = analyticsUpdateUser ?? <UserModel>[];
    this.avaibleNotes = avaibleNotes ?? false;
    this.avaiblePodcast = avaiblePodcast ?? false;
  }

  AnalyticsState copywith({
    AnalyticsStateEnumDay? enumDay,
    List<UserModel>? analyticsDayUser,
    AnalyticsStateEnumMonth? enumMonth,
    List<UserModel>? analyticsMonthUser,
    AnalyticsStateEnumYears? enumYears,
    List<UserModel>? analyticsYearsUser,
    AnalyticsStateEnumUpdate? enumUpdate,
    List<UserModel>? analyticsUpdateUser,
    bool? avaiblePodcast,
    bool? avaibleNotes,
  }) {
    return AnalyticsState(
        enumDay: enumDay ?? this.enumDay,
        analyticsDayUser: analyticsDayUser ?? this.analyticsDayUser,
        enumMonth: enumMonth ?? this.enumMonth,
        analyticsMonthUser: analyticsMonthUser ?? this.analyticsMonthUser,
        enumYears: enumYears ?? this.enumYears,
        analyticsYearsUser: analyticsYearsUser ?? this.analyticsYearsUser,
        enumUpdate: enumUpdate ?? this.enumUpdate,
        analyticsUpdateUser: analyticsUpdateUser ?? this.analyticsUpdateUser,
        avaibleNotes: avaibleNotes ?? this.avaibleNotes,
        avaiblePodcast: avaiblePodcast ?? this.avaiblePodcast);
  }

  @override
  List<Object?> get props => [
        enumDay,
        analyticsDayUser,
        enumMonth,
        analyticsMonthUser,
        enumYears,
        analyticsYearsUser,
        enumUpdate,
        analyticsUpdateUser,
        avaibleNotes,
        avaiblePodcast
      ];
}

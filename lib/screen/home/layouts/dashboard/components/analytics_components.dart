import 'package:admin_ambient/domain/logic/analytics/analytics_cubit.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/engagement/layouts/engagement_screen.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/performance/layouts/performace_dashboard.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/search/layouts/search_screen.dart';
import 'package:admin_ambient/screen/utils/global_functions/global_functions.dart';
import 'package:admin_ambient/screen/utils/responsive/responsive.dart';
import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalyticsComponents extends StatelessWidget {
  const AnalyticsComponents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnalyticsCubit analyticsCubit = context.watch<AnalyticsCubit>();
    Responsive responsive = Responsive(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          SizedBox(
            height: 390,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Performance(
                  update: analyticsCubit.state.enumUpdate,
                  model: analyticsCubit.state.analyticsUpdateUser,
                  avaibleNote: analyticsCubit.state.avaibleNotes,
                  avaiblePodcast: analyticsCubit.state.avaiblePodcast,
                ),
                const SizedBox(
                  width: 10,
                ),
                AnimatedContainer(
                  key: ValueKey(imageCalculateWidthSearch(responsive)),
                  duration: const Duration(milliseconds: 300),
                  height: 415,
                  width: imageCalculateWidthSearch(responsive),
                  decoration: BoxDecoration(
                    color: UniCodes.orangeperformance2,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: (responsive.width >= 771)
                      ? SearchScreen(responsive: responsive)
                      : null,
                )
              ],
            ),
          ),
          if (responsive.width < 771)
            const SizedBox(
              height: 20,
            ),
          if (responsive.width < 771)
            AnimatedContainer(
                key: ValueKey(imageCalculateWidthSearch(responsive)),
                duration: const Duration(milliseconds: 300),
                height: 415,
                width: 300,
                decoration: BoxDecoration(
                    color: UniCodes.cielperformance,
                    borderRadius: BorderRadius.circular(28)),
                child: SearchScreen(responsive: responsive)),
          const SizedBox(
            height: 20,
          ),
          const EngagementScreen()
        ],
      ),
    );
  }
}

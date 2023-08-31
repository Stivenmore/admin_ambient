import 'package:admin_ambient/domain/logic/analytics/analytics_cubit.dart';
import 'package:admin_ambient/domain/models/user_model.dart';
import 'package:admin_ambient/screen/home/layouts/dashboard/layouts/performance/layouts/components/analytics_success_body.dart';
import 'package:admin_ambient/screen/utils/animation/fade_animattion.dart';
import 'package:admin_ambient/screen/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class Performance extends StatefulWidget {
  final List<UserModel> model;
  final AnalyticsStateEnumUpdate update;
  final bool avaiblePodcast, avaibleNote;
  const Performance(
      {super.key,
      required this.update,
      required this.model,
      required this.avaibleNote,
      required this.avaiblePodcast});

  @override
  State<Performance> createState() => _PerformanceState();
}

class _PerformanceState extends State<Performance> {
  @override
  void initState() {
    context.read<AnalyticsCubit>().getAllLastUpdate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.update) {
      case AnalyticsStateEnumUpdate.error:
        return SizedBox(
          height: 330,
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
              child: Image.asset(
                "assets/404.jpg",
              ),
            ),
          ),
        );
      case AnalyticsStateEnumUpdate.none:
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade400,
          highlightColor: Colors.grey.shade100,
          child: SizedBox(
            height: 380,
            width: 300,
            child: AnalyticSuccessBody(
              model: const <UserModel>[],
              avaibleNote: widget.avaibleNote,
              avaiblePodcast: widget.avaiblePodcast,
            ),
          ),
        );
      case AnalyticsStateEnumUpdate.success:
        return FadeAnimation(
          300,
          Container(
            decoration: BoxDecoration(
                color: UniCodes.blueperformance,
                borderRadius: BorderRadius.circular(28)),
            height: 410,
            width: 280,
            child: AnalyticSuccessBody(
              model: widget.model,
              avaibleNote: widget.avaibleNote,
              avaiblePodcast: widget.avaiblePodcast,
            ),
          ),
        );
      case AnalyticsStateEnumUpdate.loading:
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade400,
          highlightColor: Colors.grey.shade100,
          child: SizedBox(
            height: 380,
            width: 300,
            child: AnalyticSuccessBody(
              model: const <UserModel>[],
              avaibleNote: widget.avaibleNote,
              avaiblePodcast: widget.avaiblePodcast,
            ),
          ),
        );
    }
  }
}

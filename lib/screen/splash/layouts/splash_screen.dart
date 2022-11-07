import 'package:admin_ambient/domain/logic/splash/splash_cubit.dart';
import 'package:admin_ambient/screen/utils/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context.read<SplashCubit>().getUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case SplashSuccess:
            Navigator.pushNamedAndRemoveUntil(context, '/home', ((route) => false));
            break;
          case SplashError:
            Navigator.pushNamedAndRemoveUntil(context, '/login', ((route) => false));
            break;
        }
      },
      child: SizedBox(
        height: responsive.height,
        width: responsive.width,
        child: Center(
          child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.0, end: 15.0),
              duration: const Duration(seconds: 10),
              builder: (context, double value, child) {
                return Transform.rotate(
                  angle: value,
                  child: const Icon(
                    Icons.star,
                    color: Colors.purple,
                    size: 28,
                  ),
                );
              }),
        ),
      ),
    );
  }
}

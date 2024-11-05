import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_tree/constants/colors.dart';
import 'package:monie_tree/services/navigation_service/navigation_service.dart';
import 'package:monie_tree/utils/utils.dart';
import '../../components/buttons/elevated_button.dart';
import 'bvn_signup_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  double _progress = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startGradientLoader();
  }

  void _startGradientLoader() {
    _timer?.cancel(); // Cancel any existing timer before starting a new one
    _progress = 0.0; // Ensure progress starts from 0.0
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      // Increased to 100ms
      setState(() {
        _progress +=
            0.01; // Adjusted to ensure the loader progresses more slowly
        if (_progress >= 1.0) {
          _progress = 1.0;
          _timer?.cancel();

          if (_currentPage < 2) {
            Future.delayed(const Duration(milliseconds: 200), () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
              _currentPage++;
              _startGradientLoader();
            });
          } else {
            _navigateToLoginScreen(); // Navigate to Login screen
          }
        }
      });
    });
  }

  void _navigateToLoginScreen() {
    _timer?.cancel(); // Cancel the timer before navigating
    context.go(AppPath.loginNewUser);
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer to avoid background tasks
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Stack(
            children: [
              PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                    _progress = 0.0;
                    _startGradientLoader();
                  });
                },
                children: [
                  // PAGE 1
                  Column(
                    children: [
                      SizedBox(height: 52.h),
                      Text(
                        'Modern banking made easy for everyone',
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Image.asset(
                        'assets/images/onboarding_one.png',
                        width: 1.sw,
                      ),
                    ],
                  ),
                  // PAGE 2
                  Column(
                    children: [
                      SizedBox(height: 52.h),
                      Text(
                        'Top-tier security for all your transactions',
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Image.asset(
                        'assets/images/onboarding_two.png',
                        width: 1.sw,
                      ),
                    ],
                  ),
                  // PAGE 3
                  Column(
                    children: [
                      SizedBox(height: 52.h),
                      Text(
                        'Best-in-class customer service experience',
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Image.asset(
                        'assets/images/onboarding_three.png',
                        width: 1.sw,
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 12.h,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    MyElevatedButton(
                      onPressed: () {
                        _timer?.cancel(); // Cancel timer on button press
                        navigateToRoute(context, const BvnSignUpScreen());
                      },
                      child: const Center(
                        child: Text("Register"),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    ElevatedButton(
                      onPressed: () {
                        _timer?.cancel(); // Cancel timer on button press

                        context.go(AppPath.loginNewUser);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor.withOpacity(0.12),
                        elevation: 0,
                        foregroundColor: primaryColor,
                        side: BorderSide(
                          color: lightGrey3,
                          width: 0.7.w,
                        ),
                      ),
                      child: const Center(
                        child: Text('Login'),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => Container(
                          margin: EdgeInsets.only(right: 4.w),
                          width: 1.sw / 3 - 20.w,
                          height: 3.h,
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: lightGrey11,
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                              if (_currentPage > index ||
                                  (_currentPage == index && _progress > 0))
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 100),
                                  width: (index < _currentPage)
                                      ? 1.sw / 3 -
                                          20
                                              .w // Fixed width for filled gradients
                                      : (1.sw / 3 - 20.w) *
                                          _progress, // Animate gradient fill
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      stops: [
                                        0.1,
                                        0.4,
                                        0.6,
                                        0.9,
                                      ],
                                      colors: [
                                        Color(0xFF15C781),
                                        Color(0xFF12CB79),
                                        Color(0xFF3791EB),
                                        Color(0xFF3E87FF),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 11.h),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/monietree_logo_alone.png",
                          width: 21.w,
                          height: 19.h,
                        ),
                        SizedBox(width: 4.w),
                        const Flexible(
                          child: Text(
                            "Welcome to MonieTree",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

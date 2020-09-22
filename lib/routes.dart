import 'package:flutter/widgets.dart';
import 'package:reboot/screens/complete_profile/complete_profile_screen.dart';
import 'package:reboot/screens/details/details_screen.dart';
import 'package:reboot/screens/forgot_password/forgot_password_screen.dart';
import 'package:reboot/screens/home/home_screen.dart';
import 'package:reboot/screens/login_success/login_success_screen.dart';
import 'package:reboot/screens/otp/otp_screen.dart';
import 'package:reboot/screens/sign_in/sign_in_screen.dart';
import 'package:reboot/screens/sign_in/sign_up/sign_up_screen.dart';
import 'package:reboot/screens/splash/initial_splash.dart';
import 'package:reboot/screens/splash/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreenInitial.routeName:   (context) => SplashScreenInitial(),
  SplashScreen.routeName:          (context) => SplashScreen(),
  SignInScreen.routeName:          (context) => SignInScreen(),
  ForgotPasswordScreen.routeName:  (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName:    (context) => LoginSuccessScreen(),
  SignUpScreen.routeName:          (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName:             (context) => OtpScreen(),
  HomeScreen.routeName:            (context) => HomeScreen(),
  DetailsScreen.routeName:         (context) => DetailsScreen(),
};

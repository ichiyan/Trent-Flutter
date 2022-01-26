import 'package:basecode/screens/BookingConfirmationScreen.dart';
import 'package:basecode/screens/BookingDetailsScreen.dart';
import 'package:basecode/screens/BookingScreen.dart';
import 'package:basecode/screens/ConversationScreen.dart';
import 'package:basecode/screens/DashboardScreen.dart';
import 'package:basecode/screens/DriverProfile.dart';
import 'package:basecode/screens/DriversListScreen.dart';
import 'package:basecode/screens/ForgotPasswordScreen.dart';
import 'package:basecode/screens/LoginScreen.dart';
import 'package:basecode/screens/LogoScreen.dart';
import 'package:basecode/screens/MessagesScreen.dart';
import 'package:basecode/screens/RegistrationScreen.dart';
import 'package:basecode/screens/SettingsScreen.dart';
import 'package:basecode/screens/SignupScreen.dart';
import 'package:basecode/screens/TrackerScreen.dart';
import 'package:basecode/screens/TransactionHistoryScreen.dart';
import 'package:basecode/screens/TruckCatalogScreen.dart';
import 'package:basecode/screens/TruckDetailsScreen.dart';
import 'package:basecode/screens/TruckSelectionScreen.dart';
import 'package:basecode/screens/CalendarScreen.dart';
import 'package:get/get.dart';

final List<GetPage<dynamic>> routes = [
  GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
  GetPage(name: DashboardScreen.routeName, page: () => DashboardScreen()),
  GetPage(name: RegistrationScreen.routeName, page: () => RegistrationScreen()),
  GetPage(name: SettingsScreen.routeName, page: () => SettingsScreen()),
  GetPage(
      name: ForgotPasswordScreen.routeName, page: () => ForgotPasswordScreen()),
  GetPage(name: MessagesScreen.routeName, page: () => MessagesScreen()),
  GetPage(name: ConversationScreen.routeName, page: () => ConversationScreen()),
  GetPage(name: DriversList.routeName, page: () => DriversList()),
  GetPage(name: DriverProfile.routeName, page: () => DriverProfile()),
  GetPage(name: LogoScreen.routeName, page: () => LogoScreen()),
  GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
  GetPage(name: SignupScreen.routeName, page: () => SignupScreen()),
  GetPage(
      name: TransactionHistoryScreen.routeName,
      page: () => TransactionHistoryScreen()),
  GetPage(name: SettingsScreen.routeName, page: () => SettingsScreen()),
  GetPage(name: BookingScreen.routeName, page: () => BookingScreen()),
  GetPage(
      name: TruckSelectionScreen.routeName, page: () => TruckSelectionScreen()),
  GetPage(
      name: BookingConfirmationScreen.routeName,
      page: () => BookingConfirmationScreen()),
  GetPage(
      name: BookingDetailsScreen.routeName, page: () => BookingDetailsScreen()),
  GetPage(name: TruckCatalogScreen.routeName, page: () => TruckCatalogScreen()),
  GetPage(
      name: TruckDetailsScreen.routeName,
      page: () => TruckDetailsScreen(
            truck: Get.arguments,
          )),
  GetPage(
      name: CalendarScreen.routeName,
      page: () => CalendarScreen(
            truck: Get.arguments,
          )),
  GetPage(name: TrackerScreen.routeName, page: () => TrackerScreen()),
];

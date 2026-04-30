import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// import '../../features/auth/presentation/otp_verification_screen.dart';
import '../../features/auth/presentation/registration_success_screen.dart';
import '../../features/auth/presentation/signup_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/welcome_screen.dart';
import '../../features/vehicle_profile/presentation/add_vehicle_screen.dart';
import '../../features/vehicle_profile/presentation/my_vehicle_screen.dart';
import '../../features/map/presentation/map_screen.dart';
import '../../features/map/presentation/pages/search_location_screen.dart';
import '../../features/map/presentation/pages/station_list_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/profile/presentation/edit_profile_screen.dart';
import '../../features/favorites/presentation/saved_stations_screen.dart';
import '../../features/bookings/presentation/booking_list_screen.dart';
import '../../features/bookings/presentation/slot_booking_screen.dart';
import '../../features/bookings/presentation/payment_screen.dart';
import '../../features/bookings/presentation/booking_success_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          final tab = int.tryParse(state.uri.queryParameters['tab'] ?? '0') ?? 0;
          return HomeScreen(initialIndex: tab);
        },
      ),
      GoRoute(
        path: '/map-search',
        builder: (context, state) => const MapScreen(),
      ),
      GoRoute(
        path: '/search-location',
        builder: (context, state) => const SearchLocationScreen(),
      ),
      GoRoute(
        path: '/station-list',
        builder: (context, state) => const StationListScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupScreen(),
      ),
      // GoRoute(
      //   path: '/verify-otp',
      //   builder: (context, state) => OtpVerificationScreen(
      //     email: state.extra as String? ?? '',
      //   ),
      // ),
      GoRoute(
        path: '/welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/add-vehicle',
        builder: (context, state) => const AddVehicleScreen(),
      ),
      GoRoute(
        path: '/registration-success',
        builder: (context, state) => const RegistrationSuccessScreen(),
      ),
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/edit-profile',
        builder: (context, state) => const EditProfileScreen(),
      ),
      GoRoute(
        path: '/my-vehicle',
        builder: (context, state) => const MyVehicleScreen(),
      ),
      GoRoute(
        path: '/saved-stations',
        builder: (context, state) => const SavedStationsScreen(),
      ),
      GoRoute(
        path: '/my-bookings',
        builder: (context, state) => const BookingListScreen(),
      ),
      GoRoute(
        path: '/booking-slot',
        builder: (context, state) => const SlotBookingScreen(),
      ),
      GoRoute(
        path: '/payment',
        builder: (context, state) => const PaymentScreen(),
      ),
      GoRoute(
        path: '/booking-success',
        builder: (context, state) => const BookingSuccessScreen(),
      ),
    ],
  );
}

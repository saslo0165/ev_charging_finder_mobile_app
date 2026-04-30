import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:permission_handler/permission_handler.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  HomeState build() {
    // Initial check for permission could be async, but for simplicity starting with false
    // and requesting on init or via method.
    return const HomeState(selectedIndex: 0, isLocationGranted: false);
  }

  void setSelectedIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  Future<void> requestLocationPermission() async {
    final status = await Permission.location.request();
    state = state.copyWith(isLocationGranted: status.isGranted);
  }
}

class HomeState {
  final int selectedIndex;
  final bool isLocationGranted;

  const HomeState({
    required this.selectedIndex,
    required this.isLocationGranted,
  });

  HomeState copyWith({
    int? selectedIndex,
    bool? isLocationGranted,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isLocationGranted: isLocationGranted ?? this.isLocationGranted,
    );
  }
}

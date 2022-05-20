import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardControllerProvider =
    StateNotifierProvider<DashboardController, int>((ref) {
  return DashboardController();
});

class DashboardController extends StateNotifier<int> {
  DashboardController() : super(0);

  setSelectedTabs(int index) {
    state = index;
  }
}

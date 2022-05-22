import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_mvvm_sample/model/count_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

final titleProvider = Provider<String>((ref) => 'Riverpod MVVM');
final messageProvider =
    Provider<String>((ref) => 'You hav pushed button this many times:');
final countProvider = StateProvider<int>((ref) => 0);

// カウントのロジック
final countDataProvider = StateNotifierProvider<CountNotifier, CountData>(
  (ref) => CountNotifier(),
);

class CountNotifier extends StateNotifier<CountData> {
  CountNotifier() : super(const CountData());

  void increase() {
    state = state.copyWith(
      count: state.count + 1,
      countUp: state.countUp + 1,
    );
  }

  void decrease() {
    state = state.copyWith(
      count: state.count - 1,
      countDown: state.countDown + 1,
    );
  }

  void reset() {
    state = state.copyWith(
      count: 0,
      countUp: 0,
      countDown: 0,
    );
  }
}

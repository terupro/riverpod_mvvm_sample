import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_mvvm_sample/view_model/count_provider.dart';

void main() {
  CountNotifier target = CountNotifier();
  setUp(() async {
    target = CountNotifier();
  });

  test('init', () async {
    expect(target.state.count, 0);
    expect(target.state.countUp, 0);
    expect(target.state.countDown, 0);
  });

  test('increase', () async {
    target.increase();
    expect(target.state.count, 1);
    expect(target.state.countUp, 1);
    expect(target.state.countDown, 0);

    target.increase();
    target.increase();
    target.increase();
    expect(target.state.count, 4);
    expect(target.state.countUp, 4);
    expect(target.state.countDown, 0);
  });

  test('decrease', () async {
    target.decrease();
    expect(target.state.count, -1);
    expect(target.state.countUp, 0);
    expect(target.state.countDown, 1);

    target.decrease();
    target.decrease();
    target.decrease();
    expect(target.state.count, -4);
    expect(target.state.countUp, 0);
    expect(target.state.countDown, 4);
  });

  test('reset', () async {
    target.reset();
    expect(target.state.count, 0);
    expect(target.state.countUp, 0);
    expect(target.state.countDown, 0);
  });
}

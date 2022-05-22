import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_mvvm_sample/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    // 0が3つ、1はない
    expect(find.text('0'), findsNWidgets(3));
    expect(find.text('1'), findsNothing);

    // プラスアイコンを1回押すと
    await tester.tap(find.byIcon(CupertinoIcons.plus));
    await tester.pump();

    // 0は1つ、1が2つになる
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNWidgets(2));

    // マイナスボタンを2回押すと
    await tester.tap(find.byIcon(CupertinoIcons.minus));
    await tester.tap(find.byIcon(CupertinoIcons.minus));
    await tester.pump();

    // -1は1つ
    expect(find.text('-1'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
  });
}

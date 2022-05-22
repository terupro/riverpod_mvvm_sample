import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_mvvm_sample/model/count_data.dart';
import 'package:riverpod_mvvm_sample/view_model/count_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _countProvider = ref.watch(countProvider);
    final _countNotifeir = ref.watch(countProvider.notifier);
    final _countDataProvider = ref.watch(countDataProvider);
    final _countDataNotifier = ref.watch(countDataProvider.notifier);
    final _countDataState = _countDataNotifier.state;

    return Scaffold(
      appBar: AppBar(title: Text(ref.read(titleProvider))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // リセット
          _countDataNotifier.reset();
        },
        child: const Icon(Icons.refresh_outlined),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(ref.read(messageProvider)),
          Text(
            _countDataState.count.toString(),
            style: const TextStyle(fontSize: 30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () {
                  // プラス
                  _countDataNotifier.increase();
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  // マイナス
                  _countDataNotifier.decrease();
                },
                child: const Icon(Icons.remove),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                _countDataProvider.countUp.toString(),
              ),
              Text(
                _countDataProvider.countDown.toString(),
              ),
            ],
          ),
        ],
      )),
    );
  }
}

import 'dart:async';
import 'package:rxdart/rxdart.dart';

class CounterBloc extends Object with Counter {
  final Counter _counter = Counter();

  // StreamController for counting feature
  final _counterController = BehaviorSubject<int>();

  // Retrieve data from the Stream
  Stream<int> get counterStream => _counterController.stream;

  void updateCounter() {
    _counter.increment();
    // Add data to the stream
    _counterController.sink.add(_counter.count);
  }

  dispose() {
    _counterController.close();
  }
}

class Counter {
  int count = 0;

  int increment() => count++;
}

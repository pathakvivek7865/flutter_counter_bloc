import 'package:flutter/material.dart';

import './blocs/counter_bloc_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterBloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Counter BLoC"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "You pressed the button this many times",
              textScaleFactor: 1.2,
            ),
            StreamBuilder(
              stream: counterBloc.counterStream,
              initialData: '0',
              builder: (context, snapshot) {
                return Text(
                  snapshot.data.toString(),
                  textScaleFactor: 4,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "Increment",
        onPressed: () {
          counterBloc.updateCounter();
        },
      ),
    );
  }
}

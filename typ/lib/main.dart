import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Throw your Phone'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

  DateTime? startTime;
  DateTime? endTime;
  bool isBeingThrown = false;
  final double GRAVITATIONAL_FORCE = 9.80665;
  final double DECELERATION_THRESHOLD = 10; // <---- experimental
  final double ACCELERATION_THRESHOLD = 0; // <---- experimental
  List<double> accelValuesForAnalysis = <double>[];

  @override
  void initState() {
    super.initState();

    _streamSubscriptions
        .add(accelerometerEvents.listen((AccelerometerEvent event) {
      if (event.z <= ACCELERATION_THRESHOLD && !isBeingThrown) {
        startTime = DateTime.now();
        setState(() {
          isBeingThrown = true;
        });
      } else {
        double z_total = pow(event.z, 2).toDouble();

        double totalXYZAcceleration = sqrt(z_total);

        // only needed because we are not using UserAccelerometerEvent
        // (because it was acting weird on my test phone Galaxy S5)
        double accelMinusGravity = totalXYZAcceleration - GRAVITATIONAL_FORCE;

        accelValuesForAnalysis.add(accelMinusGravity);
        if (accelMinusGravity > DECELERATION_THRESHOLD) {
          _throwHasEnded();
        }
      }
    }));
  }

  void _throwHasEnded() {
    endTime = DateTime.now();
    Duration totalTime = DateTime.now().difference(startTime!);
    double totalTimeInSeconds = totalTime.inMilliseconds / 1000;
    // this is the equation from the wired article
    double heightInMeters =
        (GRAVITATIONAL_FORCE * pow(totalTimeInSeconds, 2)) / 8;

    Widget resetButton = TextButton(
      child: Text("LONG PRESS TO RESET"),
      onPressed: () {},
      onLongPress: () {
        startTime = null;
        endTime = null;
        print(accelValuesForAnalysis.toString());
        accelValuesForAnalysis.clear();
        Navigator.pop(context);
        setState(() {
          isBeingThrown = true;
        });
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Throw End Detected"),
      content: Text("total throw time in seconds was: " +
          totalTimeInSeconds.toString() +
          "\n" +
          "Total height was: " +
          heightInMeters.toString() +
          " meters. \n"),
      actions: [
        resetButton,
      ],
    );

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox.expand(
        child: Container(
          color: Colors.green,
          //alignment: Alignment.center,
          child: SizedBox.expand(
            child: (!isBeingThrown)
                ? TextButton(
                    child: Text("GO!",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40)),
                    onPressed: () {},
                  )
                : Center(
                    child: Text("weeeeeeeeee!",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40)),
                  ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // cancel the stream from the accelerometer somehow!! ugh!!!
    for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }
}

import 'dart:async';
import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  late Stopwatch _stopwatch;
  late Timer _timer;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
  }

  @override
  void dispose() {
    _stopwatch.stop();
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (_) {
      setState(() {});
    });
  }

  void startStopwatch() {
    _stopwatch.start();
    setState(() {
      _isRunning = true;
    });
    startTimer();
  }

  void pauseStopwatch() {
    _stopwatch.stop();
    setState(() {
      _isRunning = false;
    });
    _timer.cancel();
  }

  void resetStopwatch() {
    _stopwatch.stop();
    _stopwatch.reset();
    setState(() {});
  }

  String formatDuration(Duration duration) {
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    final milliseconds =
        (duration.inMilliseconds % 1000 ~/ 10).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds.$milliseconds';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          formatDuration(_stopwatch.elapsed),
          style: TextStyle(fontSize: 48),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(_isRunning ? 'Pause' : 'Start'),
              onPressed: _isRunning ? pauseStopwatch : startStopwatch,
            ),
            SizedBox(width: 16),
            ElevatedButton(
              child: Text('Reset'),
              onPressed: resetStopwatch,
            ),
          ],
        ),
      ],
    );
  }
}

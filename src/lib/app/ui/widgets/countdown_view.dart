import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  final Duration duration;

  const CountdownTimer({Key? key, required this.duration}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _countdownTimer();
}

class _countdownTimer extends State<CountdownTimer> {
  Timer? countdownTimer;
  late Duration tmpDuration;

  @override
  void initState() {
    super.initState();

    tmpDuration = widget.duration;
    startTimer();
  }

  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => tmpDuration = widget.duration);
  }

  // Step 6
  void setCountDown() {
    const reduceSecondsBy = 1;
    if(mounted) {
      setState(() {
      final seconds = tmpDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        tmpDuration = Duration(seconds: seconds);
      }
    });
    }
  }

  Widget boxNumber(number) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(3),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(3)),
        color: Colors.redAccent,
      ),
      child: Text(
        '$number',
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    // final days = strDigits(tmpDuration.inDays);
    // Step 7
    final hours = strDigits(tmpDuration.inHours);
    final minutes = strDigits(tmpDuration.inMinutes.remainder(60));
    final seconds = strDigits(tmpDuration.inSeconds.remainder(60));
    return Row(
      children: [
        boxNumber(hours),
        const Text(':'),
        boxNumber(minutes),
        const Text(':'),
        boxNumber(seconds),
      ],
    );
  }
}

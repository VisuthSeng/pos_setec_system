import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SaleHeader extends StatefulWidget {
  const SaleHeader({
    super.key,
    required this.title,
    required this.subTitle,
    required this.widget,
  });

  final String title;
  final String subTitle;
  final Widget widget;

  @override
  State<SaleHeader> createState() => _SaleHeaderState();
}

class _SaleHeaderState extends State<SaleHeader> {
  late StreamSubscription<DateTime> _timerSubscription;
  final StreamController<DateTime> _timerStreamController =
      StreamController.broadcast();
  DateTime _currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    // Create a periodic timer that emits the current time
    _timerSubscription =
        Stream.periodic(const Duration(seconds: 1), (_) => DateTime.now())
            .listen((time) {
      setState(() {
        _currentTime = time;
      });
    });

    // Add the initial time to the stream
    _timerStreamController.sink.add(_currentTime);
  }

  @override
  void dispose() {
    _timerSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Color.fromARGB(255, 121, 241, 229),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              DateFormat('dd-MM-yy HH:mm:ss').format(_currentTime),
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 10,
              ),
            ),
          ],
        ),
        Expanded(flex: 1, child: Container(width: double.infinity)),
        Expanded(flex: 5, child: widget.widget),
      ],
    );
  }
}

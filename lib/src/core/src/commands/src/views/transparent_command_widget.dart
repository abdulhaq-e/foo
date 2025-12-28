import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TransparentCommandWidget extends StatefulWidget {
  final Color? backgroundColor;
  final void Function() commandExecutor;

  TransparentCommandWidget(
      {this.backgroundColor, required this.commandExecutor});

  @override
  State<TransparentCommandWidget> createState() =>
      _TransparentCommandWidgetState();
}

class _TransparentCommandWidgetState extends State<TransparentCommandWidget> {
  bool commandExecuted = false;

  @override
  void initState() {
    super.initState();
    print("init state here=====");
    if (!commandExecuted) {
      print(commandExecuted);
      widget.commandExecutor();
      commandExecuted = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor ?? Colors.white.withOpacity(0.1),
    );
  }

  // void _addPostFrameCallback(void Function() callback) {
  //   SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
  //     callback();
  //   });
  // }
}

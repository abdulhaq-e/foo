import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'transparent_widget.dart';

class CenteredDefaultLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          CircularProgressIndicator(), //Loading Indicator you can use any graphic
        ],
      ),
    );
  }
}

class DefaultLoadingIndicator extends StatefulWidget {
  DefaultLoadingIndicator();
  @override
  State<DefaultLoadingIndicator> createState() =>
      _DefaultLoadingIndicatorState();
}

class _DefaultLoadingIndicatorState extends State<DefaultLoadingIndicator> {
  // late final StreamSubscription<bool> _subscription;
  bool dialogShown = false;
  BuildContext? dialogContext;

  @override
  void initState() {
    // _subscription =
    //     widget.loadingStatus.asBroadcastStream().listen((isLoading) {
    //   if (!isLoading && dialogShown && dialogContext != null) {
    //     dialogShown = false;
    //     Navigator.of(dialogContext!).pop();
    //     Navigator.of(context).pop();
    //   }
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _addPostFrameCallback(context);
    return TransparentWidget();
  }

  void _addPostFrameCallback(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      await _showDialog(context);
    });
  }

  Future<void> _showDialog(BuildContext context) async {
    dialogShown = true;
    await showDialog(
        barrierDismissible: false, //Don't close dialog when click outside
        context: context,
        builder: (BuildContext dialogContext) {
          this.dialogContext = dialogContext;
          return Dialog(
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CircularProgressIndicator(), //Loading Indicator you can use any graphic
                ],
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    // _subscription.cancel();
    super.dispose();
  }
}

import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'begin_breath_box_widget.dart' show BeginBreathBoxWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class BeginBreathBoxModel extends FlutterFlowModel<BeginBreathBoxWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for exerciseTimer widget.
  int exerciseTimerInitialTimeMs = 0;
  int exerciseTimerMilliseconds = 0;
  String exerciseTimerValue = StopWatchTimer.getDisplayTime(0, milliSecond: false);
  FlutterFlowTimerController exerciseTimerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // State field(s) for initialTimerFourSecond widget.
  final initialTimerFourSecondInitialTimeMs = 4000;
  int initialTimerFourSecondMilliseconds = 4000;
  String initialTimerFourSecondValue = StopWatchTimer.getDisplayTime(
    4000,
    hours: false,
    minute: false,
    milliSecond: false,
  );
  FlutterFlowTimerController initialTimerFourSecondController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  void initializeExerciseTimer(int totalSeconds) {
    exerciseTimerInitialTimeMs = totalSeconds * 1000;
    exerciseTimerMilliseconds = exerciseTimerInitialTimeMs;
    exerciseTimerValue = StopWatchTimer.getDisplayTime(
      exerciseTimerInitialTimeMs,
      hours: false,
      minute: true,
      second: true,
      milliSecond: false,
    );
    exerciseTimerController = FlutterFlowTimerController(
      StopWatchTimer(
        mode: StopWatchMode.countDown,
        presetMillisecond: exerciseTimerInitialTimeMs,
      ),
    );
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    exerciseTimerController.dispose();
    initialTimerFourSecondController.dispose();
  }
}

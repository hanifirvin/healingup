import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'begin_breath_equal_widget.dart' show BeginBreathEqualWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class BeginBreathEqualModel extends FlutterFlowModel<BeginBreathEqualWidget> {
  ///  State fields for stateful widgets in this page.

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

  // State field(s) for exerciseTimer widget.
  late int exerciseTimerInitialTimeMs;
  int exerciseTimerMilliseconds = 0;
  String exerciseTimerValue = '00:00';
  FlutterFlowTimerController exerciseTimerController =
      FlutterFlowTimerController(StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond: StopWatchTimer.getMilliSecFromSecond(0),
  ));

  /// Initialization and disposal methods.

  void initializeExerciseTimer(int totalSeconds) {
    exerciseTimerInitialTimeMs = totalSeconds * 1000;
    exerciseTimerMilliseconds = exerciseTimerInitialTimeMs;
    exerciseTimerController = FlutterFlowTimerController(StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: exerciseTimerInitialTimeMs,
    ));
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    initialTimerFourSecondController.dispose();
    exerciseTimerController.dispose();
  }
}

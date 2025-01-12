import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'begin_breath_equal_model.dart';
export 'begin_breath_equal_model.dart';

class BeginBreathEqualWidget extends StatefulWidget {
  const BeginBreathEqualWidget({
    super.key,
    this.initialCycles,
    this.breathDuration = 4, // Duration in seconds for each breath phase (4s inhale/exhale)
    required this.breathType,
  });

  final int? initialCycles;
  final int breathDuration;
  final String breathType;

  @override
  State<BeginBreathEqualWidget> createState() => _BeginBreathEqualWidgetState();
}

class _BeginBreathEqualWidgetState extends State<BeginBreathEqualWidget>
    with TickerProviderStateMixin {
  late BeginBreathEqualModel _model;
  late AnimationController _breathAnimationController;
  late Animation<double> _scaleAnimation;
  int _currentCycle = 1;
  bool _isInhaling = true;
  String _breathingPhase = 'Bersiap';

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BeginBreathEqualModel());

    // Calculate total exercise duration and initialize timer
    final breathDuration = widget.breathDuration; // Total seconds for the exercise
    final totalCycles = widget.initialCycles ?? FFAppState().equalBreath;
    final totalSeconds = breathDuration * 2 * totalCycles; 
    _model.initializeExerciseTimer(totalSeconds);

    _breathAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.breathDuration),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _breathAnimationController,
      curve: Curves.easeInOut,
    ));

    // Start with initial countdown
    _model.initialTimerFourSecondController.onStartTimer();
    
    _breathAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isInhaling = false;
          _breathingPhase = 'Hembuskan';
        });
        _breathAnimationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        if (_currentCycle < (widget.initialCycles ?? FFAppState().equalBreath)) {
          setState(() {
            _currentCycle++;
            _isInhaling = true;
            _breathingPhase = 'Tarik Nafas';
          });
          _breathAnimationController.forward();
        } else {
          // Exercise completed
          setState(() {
            _breathingPhase = 'Selesai';
          });
          _completeExercise();
        }
      }
    });
  }

  void _completeExercise() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {  
        return AlertDialog(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          title: Text(
            'Latihan Selesai!',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: const Color(0xFF6264A7),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          content: Text(
            'Selamat! Anda telah menyelesaikan latihan pernafasan.',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Poppins',
                  color: const Color(0xFF2D2F4E),
                ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop(); 
                context.safePop(); 
              },
              child: Text(
                'Selesai',
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Poppins',
                      color: const Color(0xFF6264A7),
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          actionsAlignment: MainAxisAlignment.center,
        );
      },
    );
  }

  void _startBreathingExercise() {
    setState(() {
      _breathingPhase = 'Tarik Nafas';
      _isInhaling = true;
    });
    _model.exerciseTimerController.onStartTimer();
    _breathAnimationController.forward();
  }

  @override
  void dispose() {
    _breathAnimationController.dispose();
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xFF575A8C),
              size: 30.0,
            ),
            onPressed: () => context.pop(),
          ),
          title: Text(
            'Latihan Pernafasan',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: const Color(0xFF6264A7),
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Siklus $_currentCycle dari ${(widget.initialCycles ?? FFAppState().equalBreath)}',
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Poppins',
                      color: const Color(0xFF2D2F4E),
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              if (_model.initialTimerFourSecondMilliseconds == 0)
                FlutterFlowTimer(
                  initialTime: _model.exerciseTimerInitialTimeMs,
                  getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                    value,
                    hours: false,
                    minute: true,
                    second: true,
                    milliSecond: false,
                  ),
                  controller: _model.exerciseTimerController,
                  updateStateInterval: const Duration(milliseconds: 1000),
                  onChanged: (value, displayTime, shouldUpdate) {
                    _model.exerciseTimerMilliseconds = value;
                    _model.exerciseTimerValue = displayTime;
                    if (shouldUpdate) setState(() {});
                  },
                  onEnded: () {
                    setState(() {
                      _breathingPhase = 'Selesai';
                    });
                    _completeExercise();
                  },
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Poppins',
                        color: const Color(0xFF2D2F4E),
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              const SizedBox(height: 20),
              Text(
                _breathingPhase,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      fontSize: 32.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 40),
              Center(
                child: AnimatedBuilder(
                  animation: _breathAnimationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _isInhaling
                              ? const Color(0xFF6264A7).withOpacity(0.3)
                              : const Color(0xFF6264A7).withOpacity(0.7),
                        ),
                        child: Center(
                          child: Container(
                            width: 230,
                            height: 230,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF6264A7),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 40),
              if (_model.initialTimerFourSecondMilliseconds > 0)
                FlutterFlowTimer(
                  initialTime: _model.initialTimerFourSecondInitialTimeMs,
                  getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                    value,
                    hours: false,
                    minute: false,
                    milliSecond: false,
                  ),
                  controller: _model.initialTimerFourSecondController,
                  updateStateInterval: const Duration(milliseconds: 1000),
                  onChanged: (value, displayTime, shouldUpdate) {
                    _model.initialTimerFourSecondMilliseconds = value;
                    _model.initialTimerFourSecondValue = displayTime;
                    if (shouldUpdate) setState(() {});
                  },
                  onEnded: _startBreathingExercise,
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Poppins',
                        fontSize: 32.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

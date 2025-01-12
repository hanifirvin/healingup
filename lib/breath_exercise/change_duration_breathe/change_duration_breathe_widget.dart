import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'change_duration_breathe_model.dart';
export 'change_duration_breathe_model.dart';

class ChangeDurationBreatheWidget extends StatefulWidget {
  const ChangeDurationBreatheWidget({
    super.key,
    required this.breathType,
    required this.selectedCycles,
  });

  final String breathType;
  final int selectedCycles;

  @override
  State<ChangeDurationBreatheWidget> createState() =>
      _ChangeDurationBreatheWidgetState();
}

class _ChangeDurationBreatheWidgetState
    extends State<ChangeDurationBreatheWidget> {
  late ChangeDurationBreatheModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangeDurationBreatheModel());
    _model.selectedCycles = widget.selectedCycles > 0 ? widget.selectedCycles : 1;
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: FlutterFlowTheme.of(context).secondaryText,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        constraints: BoxConstraints(
          maxWidth: 400,
          maxHeight: MediaQuery.of(context).size.height * 0.7,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Siklus & Durasi',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).info,
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                    ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      buttonSize: 50.0,
                      icon: Icon(
                        Icons.remove_circle_outline,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        size: 32.0,
                      ),
                      onPressed: () {
                        if (_model.selectedCycles > 1) {
                          setState(() {
                            _model.selectedCycles--;
                          });
                        }
                      },
                    ),
                  ),
                  Flexible(
                    child: CircularPercentIndicator(
                      percent: functions.progressBarChangeDurationFunction(
                              _model.selectedCycles) ??
                          0.0,
                      radius: 85.0,
                      lineWidth: 6.0,
                      animation: true,
                      animateFromLastPercent: true,
                      progressColor: FlutterFlowTheme.of(context).primary,
                      backgroundColor: FlutterFlowTheme.of(context).lineColor,
                      center: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${_model.selectedCycles} Cycles',
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            functions.formatDuration(
                                functions.changeDurationTimeFunction(
                                    _model.selectedCycles,
                                    widget.breathType ?? '')),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      buttonSize: 50.0,
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        size: 32.0,
                      ),
                      onPressed: () {
                        if (_model.selectedCycles < 240) {
                          setState(() {
                            _model.selectedCycles++;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: 'CANCEL',
                    options: FFButtonOptions(
                      width: 130,
                      height: 45,
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: FlutterFlowTheme.of(context).error,
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      elevation: 2,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      if (widget.breathType == 'equal') {
                        FFAppState().update(() {
                          FFAppState().equalBreath = _model.selectedCycles;
                        });
                      } else if (widget.breathType == 'box') {
                        FFAppState().update(() {
                          FFAppState().boxBreath = _model.selectedCycles;
                        });
                      }
                      Navigator.pop(context, _model.selectedCycles);
                    },
                    text: 'SAVE',
                    options: FFButtonOptions(
                      width: 130,
                      height: 45,
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      elevation: 2,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
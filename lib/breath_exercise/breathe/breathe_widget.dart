import '/breath_exercise/change_duration_breathe/change_duration_breathe_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'breathe_model.dart';
export 'breathe_model.dart';

class BreatheWidget extends StatefulWidget {
  const BreatheWidget({super.key});

  @override
  State<BreatheWidget> createState() => _BreatheWidgetState();
}

class _BreatheWidgetState extends State<BreatheWidget> {
  late BreatheModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  void _showInfoDialog(BuildContext context, String title, String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text(
            title,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: const Color(0xFF5D629A),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          content: SingleChildScrollView(
            child: Text(
              description,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: const Color(0xFF2D2F4E),
                    fontSize: 16.0,
                  ),
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                'Tutup',
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Readex Pro',
                      color: const Color(0xFF5D629A),
                    ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BreatheModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
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
            onPressed: () async {
              context.pushNamed('home_dashboard_baru');
            },
          ),
          title: Text(
            'Latihan Pernapasan',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: const Color(0xFF5D629A),
                  fontSize: 24.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            children: [
              Container(
                height: 300.0,
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 8.0),
                child: InkWell(
                  onTap: () async {
                    context.pushNamed(
                      'begin_breath_equal',
                      queryParameters: {
                        'initialCycles': serializeParam(
                          FFAppState().equalBreath,
                          ParamType.int,
                        ),
                        'breathType': serializeParam(
                          'equal',
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF30B5AC),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: const BoxDecoration(
                                color: Color(0x8E48CDBF),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0),
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(30.0),
                                ),
                              ),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.equals,
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                size: 24.0,
                              ),
                            ),
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: const BoxDecoration(
                                color: Color(0x8E48CDBF),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0),
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(20.0),
                                ),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  _showInfoDialog(
                                    context,
                                    'Equal Breathing',
                                    'Equal Breathing (Sama Rata) adalah teknik pernapasan yang menyeimbangkan pikiran dan tubuh. '
                                    'Dalam teknik ini, Anda menarik dan menghembuskan napas dengan durasi yang sama.\n\n'
                                    'Manfaat:\n'
                                    '• Mengurangi stres dan kecemasan\n'
                                    '• Meningkatkan fokus dan konsentrasi\n'
                                    '• Membantu menenangkan pikiran\n'
                                    '• Cocok untuk pemula\n\n'
                                    'Cara Melakukan:\n'
                                    '1. Tarik napas selama 4 detik\n'
                                    '2. Hembuskan napas selama 4 detik\n'
                                    '3. Ulangi siklus sesuai kebutuhan',
                                  );
                                },
                                child: Icon(
                                  Icons.info_outline_rounded,
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Equal\nBreathing',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'Equal breathing cocok untuk relaksasi ringan dan menenangkan pikiran',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChangeDurationBreatheWidget(
                                    breathType: 'equal',
                                    selectedCycles: FFAppState().equalBreath,
                                  ),
                                ),
                              );
                              
                              if (result != null) {
                                setState(() {
                                  FFAppState().update(() {
                                    FFAppState().equalBreath = result;
                                  });
                                });
                              }
                            },
                            text: 'Ubah Durasi',
                            icon: const Icon(
                              Icons.access_time_rounded,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).noColor,
                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryBackground,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 300.0,
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 8.0),
                child: InkWell(
                  onTap: () async {
                    context.pushNamed(
                      'begin_breath_box',
                      queryParameters: {
                        'initialCycles': serializeParam(
                          FFAppState().boxBreath,
                          ParamType.int,
                        ),
                        'breathType': serializeParam(
                          'box',
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEA996E),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: const BoxDecoration(
                                color: Color(0xF2EA996E),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0),
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(30.0),
                                ),
                              ),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                Icons.square_outlined,
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                size: 24.0,
                              ),
                            ),
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: const BoxDecoration(
                                color: Color(0xF2EA996E),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0),
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(20.0),
                                ),
                              ),
                              child: InkWell(
                                onTap: () async {
                                  _showInfoDialog(
                                    context,
                                    'Box Breathing',
                                    'Box Breathing (Pernapasan Kotak) adalah teknik pernapasan yang digunakan oleh Navy SEAL untuk '
                                    'mengelola stres dan meningkatkan fokus dalam situasi intens.\n\n'
                                    'Manfaat:\n'
                                    '• Mengurangi stres akut\n'
                                    '• Meningkatkan konsentrasi\n'
                                    '• Mengontrol respons fight-or-flight\n'
                                    '• Menenangkan sistem saraf\n\n'
                                    'Cara Melakukan:\n'
                                    '1. Tarik napas selama 4 detik\n'
                                    '2. Tahan napas selama 4 detik\n'
                                    '3. Hembuskan napas selama 4 detik\n'
                                    '4. Tahan napas selama 4 detik\n'
                                    '5. Ulangi siklus sesuai kebutuhan',
                                  );
                                },
                                child: Icon(
                                  Icons.info_outline_rounded,
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Box\nBreathing',
                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'Box breathing cocok untuk situasi yang membutuhkan fokus intens atau saat menghadapi stres',
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChangeDurationBreatheWidget(
                                    breathType: 'box',
                                    selectedCycles: FFAppState().boxBreath,
                                  ),
                                ),
                              );
                              
                              if (result != null) {
                                setState(() {
                                  FFAppState().update(() {
                                    FFAppState().boxBreath = result;
                                  });
                                });
                              }
                            },
                            text: 'Ubah Durasi',
                            icon: const Icon(
                              Icons.access_time_rounded,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).noColor,
                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primaryBackground,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

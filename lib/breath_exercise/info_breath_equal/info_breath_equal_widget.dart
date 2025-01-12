import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'info_breath_equal_model.dart';
export 'info_breath_equal_model.dart';

class InfoBreathEqualWidget extends StatefulWidget {
  const InfoBreathEqualWidget({super.key});

  @override
  State<InfoBreathEqualWidget> createState() => _InfoBreathEqualWidgetState();
}

class _InfoBreathEqualWidgetState extends State<InfoBreathEqualWidget> {
  late InfoBreathEqualModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InfoBreathEqualModel());

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: true);
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
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
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
              context.pop();
            },
          ),
          title: Text(
            'Equal Breath',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: const Color(0xFF6264A7),
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
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AutoSizeText(
                                'Equal breathing melibatkan pernapasan dengan durasi yang sama untuk tarikan napas (inhale) dan hembusan napas (exhale). Contohnya, jika Anda menarik napas selama 4 detik, maka hembusan napas juga dilakukan selama 4 detik.\n\nPrinsip dasarnya adalah menciptakan harmoni dalam pernapasan untuk meningkatkan keseimbangan antara sistem saraf simpatik (yang mengaktifkan respons tubuh) dan parasimpatik (yang menenangkan tubuh).\n',
                                minFontSize: 14.0,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 200.0,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 40.0,
                                  color: const Color(0x00000000),
                                  child: ExpandableNotifier(
                                    controller:
                                        _model.expandableExpandableController,
                                    child: ExpandablePanel(
                                      header: Text(
                                        'METHOD',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.black,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      collapsed: Text(
                                        ' ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      expanded: Text(
                                        '1. Posisi Nyaman\nDuduk atau berbaring dalam posisi yang nyaman. Pastikan tubuh rileks, dan punggung tetap lurus jika duduk.\n\n2. Fokus pada Pernapasan\nTarik napas perlahan melalui hidung sambil menghitung dalam hati (misalnya, hitungan 4).\n\n3. Buang Napas dengan Durasi Sama\nHembuskan napas perlahan melalui hidung (atau mulut jika lebih nyaman) dengan durasi yang sama, misalnya 4 detik.\n\n4. Ulangi Pola\nTerus ulangi pola ini selama 5–10 menit atau lebih, tergantung pada kebutuhan Anda. Jika merasa nyaman, Anda bisa memperpanjang durasi (misalnya, 5 atau 6 detik untuk tiap fase).',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      theme: const ExpandableThemeData(
                                        tapHeaderToExpand: true,
                                        tapBodyToExpand: false,
                                        tapBodyToCollapse: false,
                                        headerAlignment:
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        hasIcon: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 200.0, 16.0, 16.0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Begin Exercise',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 50.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFF6264A7),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

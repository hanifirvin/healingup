import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'jurnal_page_model.dart';
export 'jurnal_page_model.dart';

class JurnalPageWidget extends StatefulWidget {
  const JurnalPageWidget({super.key});

  @override
  State<JurnalPageWidget> createState() => _JurnalPageWidgetState();
}

class _JurnalPageWidgetState extends State<JurnalPageWidget> {
  late JurnalPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => JurnalPageModel());

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
            'Jurnal',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(1.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed('tambah_jurnal_page');
                    },
                    child: FaIcon(
                      FontAwesomeIcons.edit,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                  child: StreamBuilder<List<JurnalRecord>>(
                    stream: queryJurnalRecord(
                      queryBuilder: (jurnalRecord) => jurnalRecord.where(
                        'patientId',
                        isEqualTo: currentUserUid,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<JurnalRecord> listViewJurnalRecordList =
                          snapshot.data!;

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewJurnalRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewJurnalRecord =
                              listViewJurnalRecordList[listViewIndex];
                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'edit_jurnal_page',
                                  queryParameters: {
                                    'judulJurnal': serializeParam(
                                      listViewJurnalRecord.judul,
                                      ParamType.String,
                                    ),
                                    'detailJurnal': serializeParam(
                                      listViewJurnalRecord.detail,
                                      ParamType.String,
                                    ),
                                    'sliderJurnal': serializeParam(
                                      listViewJurnalRecord.sliderValue,
                                      ParamType.double,
                                    ),
                                    'createdJurnal': serializeParam(
                                      listViewJurnalRecord.createdTime,
                                      ParamType.DateTime,
                                    ),
                                    'jurnalRef': serializeParam(
                                      listViewJurnalRecord.reference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        width: 80.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Image.network(
                                              () {
                                                if (listViewJurnalRecord
                                                        .sliderValue ==
                                                    1.0) {
                                                  return 'https://img.icons8.com/emoji/96/disappointed-face.png';
                                                } else if (listViewJurnalRecord
                                                        .sliderValue ==
                                                    2.0) {
                                                  return 'https://img.icons8.com/emoji/96/expressionless-face.png';
                                                } else if (listViewJurnalRecord
                                                        .sliderValue ==
                                                    3.0) {
                                                  return 'https://img.icons8.com/emoji/96/smiling-face.png';
                                                } else if (listViewJurnalRecord
                                                        .sliderValue ==
                                                    4.0) {
                                                  return 'https://img.icons8.com/emoji/96/grinning-face-emoji.png';
                                                } else {
                                                  return 'https://img.icons8.com/emoji/96/grinning-squinting-face--v2.png';
                                                }
                                              }(),
                                              width: 300.0,
                                              height: 200.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              listViewJurnalRecord.judul,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 5.0, 0.0),
                                                  child: Icon(
                                                    Icons.calendar_month_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                                Text(
                                                  DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                                                      .format(listViewJurnalRecord.dateTime!),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
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

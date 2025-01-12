import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'riwayat_konseling_model.dart';
export 'riwayat_konseling_model.dart';

class RiwayatKonselingWidget extends StatefulWidget {
  /// coba membuat riwayat konseling
  const RiwayatKonselingWidget({super.key});

  @override
  State<RiwayatKonselingWidget> createState() => _RiwayatKonselingWidgetState();
}

class _RiwayatKonselingWidgetState extends State<RiwayatKonselingWidget> {
  late RiwayatKonselingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RiwayatKonselingModel());

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
              context.pop();
            },
          ),
          title: Text(
            'Riwayat Konseling',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: const Color(0xFF4C4F81),
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                  child: Text(
                    'Riwayat Konsultasi Anda',
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Poppins',
                          color: const Color(0xFF4C4F81),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 16.0),
                  child: Text(
                    'Berikut adalah daftar riwayat konsultasi yang telah Anda lakukan',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                  child: FutureBuilder<List<SessionsRecord>>(
                    future: querySessionsRecordOnce(
                      queryBuilder: (sessionsRecord) => sessionsRecord
                          .where(
                            'patientId',
                            isEqualTo: currentUserUid,
                          )
                          .orderBy('createdAt', descending: true),
                    ),
                    builder: (context, snapshot) {
                      print('Found ${snapshot.data?.length ?? 0} sessions for user $currentUserUid');
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
                      List<SessionsRecord> listViewSessionsRecordList = snapshot.data!;

                      if (listViewSessionsRecordList.isEmpty) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.history,
                                  color: FlutterFlowTheme.of(context).secondaryText,
                                  size: 48.0,
                                ),
                                const SizedBox(height: 16.0),
                                Text(
                                  'Belum ada riwayat konsultasi',
                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context).secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewSessionsRecordList.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                        itemBuilder: (context, listViewIndex) {
                          final listViewSessionsRecord =
                              listViewSessionsRecordList[listViewIndex];
                          return Material(
                            color: Colors.transparent,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 4.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: listViewSessionsRecord.status == 'selesai'
                                            ? const Color(0xFF4CAF50)
                                            : const Color(0xFF5D629A),
                                        borderRadius: BorderRadius.circular(2.0),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  listViewSessionsRecord.createdAt != null
                                                      ? functions.formatDateIndonesian(listViewSessionsRecord.createdAt!)
                                                      : 'Tanggal tidak tersedia',
                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                        fontFamily: 'Readex Pro',
                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: listViewSessionsRecord.status == 'selesai'
                                                        ? const Color(0x1A4CAF50)
                                                        : const Color(0x1A5D629A),
                                                    borderRadius: BorderRadius.circular(16.0),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                                    child: Text(
                                                      listViewSessionsRecord.status,
                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                            fontFamily: 'Readex Pro',
                                                            color: listViewSessionsRecord.status == 'selesai'
                                                                ? const Color(0xFF4CAF50)
                                                                : const Color(0xFF5D629A),
                                                            letterSpacing: 0.0,
                                                            fontWeight: FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 8.0),
                                            Text(
                                              listViewSessionsRecord.doctorName,
                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                            if (listViewSessionsRecord.reviewRating != null)
                                              Padding(
                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.star_rounded,
                                                      color: const Color(0xFFFFC107),
                                                      size: 20.0,
                                                    ),
                                                    const SizedBox(width: 4.0),
                                                    Text(
                                                      listViewSessionsRecord.reviewRating.toString(),
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                            fontFamily: 'Readex Pro',
                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            const SizedBox(height: 8.0),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                print('Navigating to detail with sessionId: ${listViewSessionsRecord.reference.id}'); // Debug print
                                                context.pushNamed(
                                                  'detail_riwayat_page',
                                                  queryParameters: {
                                                    'sessionId': serializeParam(
                                                      listViewSessionsRecord.reference.id,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              text: 'Lihat Detail',
                                              options: FFButtonOptions(
                                                height: 36.0,
                                                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                                      fontFamily: 'Readex Pro',
                                                      color: const Color(0xFF5D629A),
                                                      letterSpacing: 0.0,
                                                    ),
                                                elevation: 0.0,
                                                borderSide: const BorderSide(
                                                  color: Color(0xFF5D629A),
                                                  width: 1.0,
                                                ),
                                                borderRadius: BorderRadius.circular(18.0),
                                              ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

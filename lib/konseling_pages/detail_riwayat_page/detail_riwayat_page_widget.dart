import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'detail_riwayat_page_model.dart';
export 'detail_riwayat_page_model.dart';

class DetailRiwayatPageWidget extends StatefulWidget {
  /// halaman yang menampilkan detail dari riwayat konsultasi
  const DetailRiwayatPageWidget({
    super.key,
    required this.sessionId,
  });

  final String? sessionId;

  @override
  State<DetailRiwayatPageWidget> createState() =>
      _DetailRiwayatPageWidgetState();
}

class _DetailRiwayatPageWidgetState extends State<DetailRiwayatPageWidget> {
  late DetailRiwayatPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailRiwayatPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.sessionId == null) {
      return const Scaffold(
        body: Center(
          child: Text('Session ID tidak valid'),
        ),
      );
    }
    print('Querying booking with ID: ${widget.sessionId}');
    return StreamBuilder<BookingRecord>(
      stream: BookingRecord.getDocument(
        BookingRecord.collection.doc(widget.sessionId),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final detailRiwayatPageBookingRecord = snapshot.data!;
        print('Found booking: ${detailRiwayatPageBookingRecord.bookingId}, created at: ${detailRiwayatPageBookingRecord.createdAt}');
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
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
                'Detail Riwayat',
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
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Informasi Konsultasi',
                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                  fontFamily: 'Poppins',
                                  color: const Color(0xFF4C4F81),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(height: 16.0),
                          Container(
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
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        detailRiwayatPageBookingRecord.createdAt != null
                                            ? functions.formatDateIndonesian(detailRiwayatPageBookingRecord.createdAt!)
                                            : 'Tanggal tidak tersedia',
                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                              fontFamily: 'Readex Pro',
                                              color: FlutterFlowTheme.of(context).secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: () {
                                            if (detailRiwayatPageBookingRecord.status == 'selesai') {
                                              return const Color(0x1A4CAF50);
                                            } else if (detailRiwayatPageBookingRecord.status == 'dibatalkan') {
                                              return const Color(0x1AFF5963);
                                            }
                                            return const Color(0x1A5D629A);
                                          }(),
                                          borderRadius: BorderRadius.circular(16.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                          child: Text(
                                            () {
                                              if (detailRiwayatPageBookingRecord.status == 'selesai') {
                                                return 'Selesai';
                                              } else if (detailRiwayatPageBookingRecord.status == 'dibatalkan') {
                                                return 'Dibatalkan';
                                              } else if (detailRiwayatPageBookingRecord.status == 'terjadwal') {
                                                return 'Terjadwal';
                                              }
                                              return detailRiwayatPageBookingRecord.status;
                                            }(),
                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                  fontFamily: 'Readex Pro',
                                                  color: () {
                                                    if (detailRiwayatPageBookingRecord.status == 'selesai') {
                                                      return const Color(0xFF4CAF50);
                                                    } else if (detailRiwayatPageBookingRecord.status == 'dibatalkan') {
                                                      return const Color(0xFFFF5963);
                                                    }
                                                    return const Color(0xFF5D629A);
                                                  }(),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16.0),
                                  Text(
                                    'Dokter',
                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context).secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    detailRiwayatPageBookingRecord.doctorName,
                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context).primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  Text(
                                    'Jadwal',
                                    style: FlutterFlowTheme.of(context).labelMedium.override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context).secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    '${functions.formatDateIndonesian(detailRiwayatPageBookingRecord.date!)} - ${detailRiwayatPageBookingRecord.time}',
                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context).primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  if (detailRiwayatPageBookingRecord.notes.isNotEmpty)
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 16.0),
                                        Text(
                                          'Catatan',
                                          style: FlutterFlowTheme.of(context).labelMedium.override(
                                                fontFamily: 'Readex Pro',
                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        const SizedBox(height: 4.0),
                                        Text(
                                          detailRiwayatPageBookingRecord.notes,
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                fontFamily: 'Readex Pro',
                                                color: FlutterFlowTheme.of(context).primaryText,
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/konseling_pages/review_sheet/review_sheet_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'detail_sesi_booking_model.dart';
export 'detail_sesi_booking_model.dart';

class DetailSesiBookingWidget extends StatefulWidget {
  const DetailSesiBookingWidget({
    super.key,
    required this.bookingId,
  });

  final String? bookingId;

  @override
  State<DetailSesiBookingWidget> createState() =>
      _DetailSesiBookingWidgetState();
}

class _DetailSesiBookingWidgetState extends State<DetailSesiBookingWidget> {
  late DetailSesiBookingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailSesiBookingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BookingRecord>>(
      future: queryBookingRecordOnce(
        queryBuilder: (bookingRecord) => bookingRecord
            .where(
              'bookingId',
              isEqualTo: widget.bookingId,
            )
            .where(
              'status',
              isEqualTo: 'terjadwal',
            )
            .where(
              'patientId',
              isEqualTo: currentUserUid,
            ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: const Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF4C4F81),
                  ),
                ),
              ),
            ),
          );
        }
        List<BookingRecord> detailSesiBookingBookingRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final detailSesiBookingBookingRecord =
            detailSesiBookingBookingRecordList.isNotEmpty
                ? detailSesiBookingBookingRecordList.first
                : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                'Detail Konseling',
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
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Informasi Sesi',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Tanggal:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      dateTimeFormat(
                                          'EEEE, d MMMM yyyy',
                                          detailSesiBookingBookingRecord!
                                              .date!,
                                          locale: 'id_ID'),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Waktu:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        detailSesiBookingBookingRecord.time,
                                        'waktu',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Durasi:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      '60 menit',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Psikolog:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Text(
                                      valueOrDefault<String>(
                                        detailSesiBookingBookingRecord
                                            .doctorName,
                                        'nama dokter',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ].divide(const SizedBox(height: 16.0)),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Catatan Keluhan',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    detailSesiBookingBookingRecord.notes,
                                    'keluhan',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ].divide(const SizedBox(height: 16.0)),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Status Sesi',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Status:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          4.0, 12.0, 4.0, 12.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent2,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              detailSesiBookingBookingRecord
                                                  .status,
                                              'terjadwal',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Sesi akan dimulai dalam:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    functions.getScheduledTime(
                                        detailSesiBookingBookingRecord
                                            .createdAt,
                                        detailSesiBookingBookingRecord.time,
                                        detailSesiBookingBookingRecord.date),
                                    'waktu',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ].divide(const SizedBox(height: 16.0)),
                            ),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final now = DateTime.now();
                          final sessionDate = detailSesiBookingBookingRecord.date;
                          final sessionTime = detailSesiBookingBookingRecord.time;

                          // Parse session time
                          final timeParts = sessionTime.split(':');
                          final sessionDateTime = DateTime(
                            sessionDate!.year,
                            sessionDate.month,
                            sessionDate.day,
                            int.parse(timeParts[0]),
                            int.parse(timeParts[1]),
                          );

                          // Only show cancel button if session is more than 1 hour away
                          if (detailSesiBookingBookingRecord.status == 'terjadwal' &&
                              sessionDateTime.difference(now).inHours > 1) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  var confirmDialogResponse = await showDialog<bool>(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return AlertDialog(
                                        title: const Text('Konfirmasi Pembatalan'),
                                        content: const Text(
                                            'Apakah Anda yakin ingin membatalkan sesi konseling ini?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext, false),
                                            child: const Text('Tidak'),
                                          ),
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext, true),
                                            child: const Text('Ya'),
                                          ),
                                        ],
                                      );
                                    },
                                  ) ??
                                      false;
                                  if (confirmDialogResponse) {
                                    await detailSesiBookingBookingRecord.reference
                                        .update({
                                      'status': 'dibatalkan',
                                      'canceledAt': FieldValue.serverTimestamp(),
                                    });
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Sesi konseling berhasil dibatalkan',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        duration: Duration(seconds: 4),
                                        backgroundColor: Color(0xFF4C4F81),
                                      ),
                                    );
                                  }
                                },
                                text: 'Batalkan Sesi',
                                icon: const Icon(
                                  Icons.cancel_outlined,
                                  size: 15,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 40,
                                  color: FlutterFlowTheme.of(context).error,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                      ),
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            );
                          }
                          return const SizedBox.shrink(); // Don't show button if within 1 hour
                        },
                      ),
                      if (((functions.getScheduledTime(
                                      detailSesiBookingBookingRecord.createdAt,
                                      detailSesiBookingBookingRecord.time,
                                      detailSesiBookingBookingRecord.date) ==
                                  'Mulai video call') &&
                              (detailSesiBookingBookingRecord.status ==
                                  'terjadwal')) ||
                          ((functions.getScheduledTime(
                                      detailSesiBookingBookingRecord.createdAt,
                                      detailSesiBookingBookingRecord.time,
                                      detailSesiBookingBookingRecord.date) ==
                                  'Waktu telah habis') &&
                              (detailSesiBookingBookingRecord.status ==
                                  'terjadwal')))
                        FFButtonWidget(
                          onPressed: () async {
                            if (functions.getScheduledTime(
                                        detailSesiBookingBookingRecord
                                            .createdAt,
                                        detailSesiBookingBookingRecord.time,
                                        detailSesiBookingBookingRecord.date) !=
                                    null &&
                                functions.getScheduledTime(
                                        detailSesiBookingBookingRecord
                                            .createdAt,
                                        detailSesiBookingBookingRecord.time,
                                        detailSesiBookingBookingRecord.date) !=
                                    '') {
                              if (functions.getScheduledTime(
                                      detailSesiBookingBookingRecord.createdAt,
                                      detailSesiBookingBookingRecord.time,
                                      detailSesiBookingBookingRecord.date) ==
                                  'Waktu telah habis') {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () =>
                                          FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.7,
                                          child: ReviewSheetWidget(
                                            userRef: currentUserReference!,
                                            bookingId: widget.bookingId!,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              } else {
                                context.pushNamed('calling_pages');
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Waktu tidak valid',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).error,
                                ),
                              );
                            }
                          },
                          text: valueOrDefault<String>(
                            () {
                              if (functions.getScheduledTime(
                                      detailSesiBookingBookingRecord.createdAt,
                                      detailSesiBookingBookingRecord.time,
                                      detailSesiBookingBookingRecord.date) ==
                                  'Mulai video call') {
                                return 'Mulai Video Call';
                              } else if (functions.getScheduledTime(
                                      detailSesiBookingBookingRecord.createdAt,
                                      detailSesiBookingBookingRecord.time,
                                      detailSesiBookingBookingRecord.date) ==
                                  'Waktu telah habis') {
                                return 'Review';
                              } else {
                                return '';
                              }
                            }(),
                            'Review',
                          ),
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 56.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFF4C4F81),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderRadius: BorderRadius.circular(28.0),
                          ),
                        ),
                    ].divide(const SizedBox(height: 24.0)),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

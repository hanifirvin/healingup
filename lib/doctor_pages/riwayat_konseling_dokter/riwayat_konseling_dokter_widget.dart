import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'riwayat_konseling_dokter_model.dart';
export 'riwayat_konseling_dokter_model.dart';

class RiwayatKonselingDokterWidget extends StatefulWidget {
  const RiwayatKonselingDokterWidget({Key? key}) : super(key: key);

  @override
  _RiwayatKonselingDokterWidgetState createState() =>
      _RiwayatKonselingDokterWidgetState();
}

class _RiwayatKonselingDokterWidgetState extends State<RiwayatKonselingDokterWidget> {
  late RiwayatKonselingDokterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RiwayatKonselingDokterModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  String formatDateIndonesian(DateTime date) {
    final List<String> namaBulan = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ];
    final List<String> namaHari = [
      'Senin', 'Selasa', 'Rabu', 'Kamis',
      'Jumat', 'Sabtu', 'Minggu'
    ];
    
    // Adjust weekday to match Indonesian format (Monday = 0)
    final int adjustedWeekday = (date.weekday - 1) % 7;
    
    return '${namaHari[adjustedWeekday]}, ${date.day} ${namaBulan[date.month - 1]} ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: const Color(0xFF5D629A),
          automaticallyImplyLeading: true,
          title: Text(
            'Riwayat Konseling',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
            child: StreamBuilder<List<BookingRecord>>(
              stream: queryBookingRecord(
                queryBuilder: (bookingRecord) => bookingRecord
                    .where('doctorId', isEqualTo: currentUserUid)
                    .orderBy('date', descending: true)
                    .orderBy('time', descending: true),
                limit: 50,
              ),
              builder: (context, snapshot) {
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
                final bookingRecords = snapshot.data!;
                if (bookingRecords.isEmpty) {
                  return Center(
                    child: Text(
                      'Belum ada riwayat konseling',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                  );
                }
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: bookingRecords.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                  itemBuilder: (context, index) {
                    final booking = bookingRecords[index];
                    return InkWell(
                      onTap: () async {
                        if (booking.status == 'terjadwal') {
                          context.pushNamed(
                            'detail_sesi_dokter',
                            queryParameters: {
                              'bookingId': serializeParam(
                                booking.bookingId,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 3.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 1.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 60.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: () {
                                    if (booking.status == 'selesai') {
                                      return const Color(0x1A4CAF50);
                                    } else if (booking.status == 'dibatalkan') {
                                      return const Color(0x1AFF5963);
                                    }
                                    return FlutterFlowTheme.of(context).accent1;
                                  }(),
                                  shape: BoxShape.circle,
                                ),
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: () {
                                    if (booking.status == 'selesai') {
                                      return const Color(0xFF4CAF50);
                                    } else if (booking.status == 'dibatalkan') {
                                      return const Color(0xFFFF5963);
                                    }
                                    return FlutterFlowTheme.of(context).primary;
                                  }(),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Icon(
                                      () {
                                        if (booking.status == 'selesai') {
                                          return Icons.check;
                                        } else if (booking.status == 'dibatalkan') {
                                          return Icons.close;
                                        }
                                        return Icons.schedule;
                                      }(),
                                      color: Colors.white,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        booking.patientName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: FlutterFlowTheme.of(context)
                                                  .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              '${formatDateIndonesian(booking.date!)} - ${booking.time}',
                                              style: FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: () {
                                                  if (booking.status == 'selesai') {
                                                    return const Color(0x1A4CAF50);
                                                  } else if (booking.status ==
                                                      'dibatalkan') {
                                                    return const Color(0x1AFF5963);
                                                  }
                                                  return const Color(0x1A5D629A);
                                                }(),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                  horizontal: 8.0,
                                                  vertical: 4.0,
                                                ),
                                                child: Text(
                                                  () {
                                                    if (booking.status == 'selesai') {
                                                      return 'Selesai';
                                                    } else if (booking.status ==
                                                        'dibatalkan') {
                                                      return 'Dibatalkan';
                                                    } else if (booking.status ==
                                                        'terjadwal') {
                                                      return 'Terjadwal';
                                                    }
                                                    return booking.status;
                                                  }(),
                                                  style: FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Readex Pro',
                                                        color: () {
                                                          if (booking.status ==
                                                              'selesai') {
                                                            return const Color(
                                                                0xFF4CAF50);
                                                          } else if (booking
                                                                  .status ==
                                                              'dibatalkan') {
                                                            return const Color(
                                                                0xFFFF5963);
                                                          }
                                                          return const Color(
                                                              0xFF5D629A);
                                                        }(),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ].divide(const SizedBox(width: 8.0)),
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
        ),
      ),
    );
  }
}

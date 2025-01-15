import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tentukan_jadwal_konseling_baru_model.dart';
export 'tentukan_jadwal_konseling_baru_model.dart';

class TentukanJadwalKonselingBaruWidget extends StatefulWidget {
  const TentukanJadwalKonselingBaruWidget({
    super.key,
    required this.doctorId,
    required this.doctorName,
  });

  final String? doctorId;
  final String? doctorName;

  @override
  State<TentukanJadwalKonselingBaruWidget> createState() =>
      _TentukanJadwalKonselingBaruWidgetState();
}

class _TentukanJadwalKonselingBaruWidgetState
    extends State<TentukanJadwalKonselingBaruWidget> {
  late TentukanJadwalKonselingBaruModel _model;
  List<String> availableTimeSlots = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TentukanJadwalKonselingBaruModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return StreamBuilder<List<BookingRecord>>(
      stream: queryBookingRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<BookingRecord> tentukanJadwalKonselingBaruBookingRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final tentukanJadwalKonselingBaruBookingRecord =
            tentukanJadwalKonselingBaruBookingRecordList.isNotEmpty
                ? tentukanJadwalKonselingBaruBookingRecordList.first
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
                'Tentukan Jadwal',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: const Color(0xFF585A96),
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
                padding:
                    const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StreamBuilder<List<UsersRecord>>(
                        stream: queryUsersRecord(
                          queryBuilder: (usersRecord) => usersRecord.where(
                            'uid',
                            isEqualTo: widget.doctorId,
                          ),
                          singleRecord: true,
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
                          List<UsersRecord> containerUsersRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final containerUsersRecord =
                              containerUsersRecordList.isNotEmpty
                                  ? containerUsersRecordList.first
                                  : null;

                          return Material(
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
                                    16.0, 16.0, 16.0, 16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 60.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .accent1,
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            child: Image.network(
                                              containerUsersRecord!.photoUrl,
                                              width: 60.0,
                                              height: 60.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                containerUsersRecord
                                                    .displayName,
                                                'display_name',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ].divide(const SizedBox(width: 16.0)),
                                    ),
                                    Text(
                                      'Pilih Tanggal Konsultasi',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 22.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 350.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .accent4,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: StreamBuilder<List<BookingRecord>>(
                                        stream: queryBookingRecord(
                                          queryBuilder: (query) => query
                                              .where('doctorId', isEqualTo: widget.doctorId)
                                              .where('status', isEqualTo: 'terjadwal'),
                                        ),
                                        builder: (context, snapshot) {
                                          // Handle loading state
                                          if (!snapshot.hasData) {
                                            return const Center(
                                              child: CircularProgressIndicator(),
                                            );
                                          }

                                          final existingBookings = snapshot.data!;
                                          
                                          return CalendarDatePicker(
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime.now()
                                                .add(const Duration(days: 30)),
                                            onDateChanged:
                                                (DateTime newSelectedDate) {
                                              // Reset time selection when date changes
                                              _model.dropDownValueController?.reset();
                                              
                                              // Get the day name for the selected date
                                              final dayName = _getDayName(newSelectedDate.weekday);
                                              
                                              // Check if doctor works on this day
                                              final isAvailableDay = containerUsersRecord!.availableDay
                                                  .contains(dayName);
                                              
                                              // Update available hours based on bookings
                                              final bookedTimes = existingBookings
                                                  .where((booking) =>
                                                      booking.date?.year == newSelectedDate.year &&
                                                      booking.date?.month == newSelectedDate.month &&
                                                      booking.date?.day == newSelectedDate.day)
                                                  .map((booking) => booking.time)
                                                  .toList();
                                              
                                              safeSetState(() {
                                                _model.calendarSelectedDay =
                                                    DateTimeRange(
                                                  start: newSelectedDate,
                                                  end: newSelectedDate,
                                                );
                                                
                                                // Only show available hours if the doctor works on this day
                                                availableTimeSlots = isAvailableDay
                                                    ? containerUsersRecord!.availableHours
                                                        .where((time) => !bookedTimes.contains(time))
                                                        .toList()
                                                    : ['Dokter tidak tersedia di hari ini'];
                                              });
                                            },
                                            selectableDayPredicate:
                                                (date) {
                                              // Get the day name
                                              final dayName = _getDayName(date.weekday);
                                              
                                              // Check if doctor works on this day
                                              final isAvailableDay = containerUsersRecord!.availableDay
                                                  .contains(dayName);
                                              
                                              if (!isAvailableDay) {
                                                return false;
                                              }
                                              
                                              // Get date constraints
                                              final (startDate, endDate) = _getWeekBounds();
                                              
                                              // Allow only dates within the current week bounds
                                              return !date.isBefore(startDate) && 
                                                     !date.isAfter(endDate);
                                            },
                                          );
                                        }
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 16.0)),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      FutureBuilder<List<UsersRecord>>(
                        future: queryUsersRecordOnce(
                          queryBuilder: (usersRecord) => usersRecord.where(
                            'uid',
                            isEqualTo: widget.doctorId,
                          ),
                          singleRecord: true,
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
                          List<UsersRecord> containerUsersRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final containerUsersRecord =
                              containerUsersRecordList.isNotEmpty
                                  ? containerUsersRecordList.first
                                  : null;

                          return Material(
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
                                    16.0, 16.0, 16.0, 16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Pilih Waktu Konsultasi',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 22.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .accent4,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: FlutterFlowDropDown<String>(
                                        controller: _model
                                                .dropDownValueController ??=
                                            FormFieldController<String>(null),
                                        options: _model.calendarSelectedDay != null
                                            ? availableTimeSlots
                                            : ['Pilih tanggal terlebih dahulu'],
                                        onChanged: (val) =>
                                            setState(() => _model.dropDownValue = val),
                                        width: 300.0,
                                        height: 50.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: FlutterFlowTheme.of(context)
                                                  .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Pilih Waktu Konsultasi',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor: FlutterFlowTheme.of(context)
                                            .alternate,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 16.0)),
                                ),
                              ),
                            ),
                          );
                        },
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
                                16.0, 16.0, 16.0, 16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Catatan Keluhan',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 22.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    hintText:
                                        'Tuliskan keluhan Anda di sini...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xFFE0E3E7),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                  maxLines: 5,
                                  minLines: 3,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ].divide(const SizedBox(height: 16.0)),
                            ),
                          ),
                        ),
                      ),
                      StreamBuilder<List<UsersRecord>>(
                        stream: queryUsersRecord(
                          queryBuilder: (usersRecord) => usersRecord.where(
                            'uid',
                            isEqualTo: widget.doctorId,
                          ),
                          singleRecord: true,
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
                          List<UsersRecord> buttonUsersRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final buttonUsersRecord =
                              buttonUsersRecordList.isNotEmpty
                                  ? buttonUsersRecordList.first
                                  : null;

                          return FFButtonWidget(
                            onPressed: () async {
                              if ((_model.calendarSelectedDay?.start != null) &&
                                  (_model.dropDownValue != null &&
                                      _model.dropDownValue != '') &&
                                  (_model.textController.text != '')) {
                                try {
                                  // Create new reference to get a new ID
                                  final bookingDocRef =
                                      BookingRecord.collection.doc();
                                  final newBookingId = bookingDocRef.id;

                                  // Create booking document with the new ID
                                  await bookingDocRef
                                      .set(createBookingRecordData(
                                    bookingId: newBookingId,
                                    date: _model.calendarSelectedDay?.start,
                                    time: _model.dropDownValue,
                                    notes: _model.textController.text,
                                    status: 'terjadwal',
                                    createdAt: getCurrentTimestamp,
                                    doctorId: widget.doctorId,
                                    doctorName: widget.doctorName,
                                    patientId: currentUserUid,
                                    patientName: currentUserDisplayName,
                                  ));

                                  await buttonUsersRecord!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'availableHours':
                                            FieldValue.arrayRemove(
                                                [_model.dropDownValue]),
                                      },
                                    ),
                                  });

                                  // Calculate notification time (15 minutes before session)
                                  final sessionDateTime = DateTime(
                                    _model.calendarSelectedDay!.start.year,
                                    _model.calendarSelectedDay!.start.month,
                                    _model.calendarSelectedDay!.start.day,
                                    int.parse(
                                        _model.dropDownValue!.split(':')[0]),
                                    int.parse(
                                        _model.dropDownValue!.split(':')[1]),
                                  );
                                  final notificationTime = sessionDateTime
                                      .subtract(const Duration(minutes: 15));

                                  // Get current user's document reference and filter multipleUser list
                                  final userRefs = FFAppState()
                                      .multipleUser
                                      .where((ref) => ref.id == currentUserUid)
                                      .toList();

                                  triggerPushNotification(
                                    notificationTitle:
                                        'Pengingat Sesi Konseling',
                                    notificationText:
                                        'Sesi konseling Anda akan dimulai dalam 15 menit pada pukul ${_model.dropDownValue}',
                                    scheduledTime: notificationTime,
                                    userRefs: userRefs,
                                    initialPageName: 'konseling_baru',
                                    parameterData: {},
                                  );

                                  // Notification for successful booking
                                  triggerPushNotification(
                                    notificationTitle:
                                        'Sesi booking berhasil dilakukan',
                                    notificationText:
                                        'sesi dilakukan pada pukul ${_model.dropDownValue} tanggal ${dateTimeFormat("d/M/y", _model.calendarSelectedDay?.start)}',
                                    scheduledTime: getCurrentTimestamp,
                                    userRefs: userRefs,
                                    initialPageName: 'konseling_baru',
                                    parameterData: {},
                                  );

                                  context.pushNamed(
                                    'after_booking_baru',
                                    queryParameters: {
                                      'bookingId': serializeParam(
                                        newBookingId,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Terjadi kesalahan saat membuat booking',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      duration:
                                          const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Mohon lengkapi semua data booking',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    duration:
                                        const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                              }

                              safeSetState(() {});
                            },
                            text: 'Ajukan Jadwal',
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 56.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFF6264A7),
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
                          );
                        },
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

  // Helper function to get day name
  String _getDayName(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Senin';
      case DateTime.tuesday:
        return 'Selasa';
      case DateTime.wednesday:
        return 'Rabu';
      case DateTime.thursday:
        return 'Kamis';
      case DateTime.friday:
        return 'Jumat';
      case DateTime.saturday:
        return 'Sabtu';
      case DateTime.sunday:
        return 'Minggu';
      default:
        return '';
    }
  }

  // Get the start and end of current week
  (DateTime, DateTime) _getWeekBounds() {
    final now = DateTime.now();
    final startOfToday = DateTime(now.year, now.month, now.day);
    
    // If it's Monday, start from today and allow the whole week
    if (now.weekday == DateTime.monday) {
      final endOfWeek = startOfToday.add(Duration(days: 6)); // Sunday
      return (startOfToday, endOfWeek);
    }
    
    // For other days, only allow remainder of the week
    final daysUntilSunday = DateTime.sunday - now.weekday;
    final daysToAdd = daysUntilSunday <= 0 ? 7 + daysUntilSunday : daysUntilSunday;
    final endOfWeek = startOfToday.add(Duration(days: daysToAdd - 1)); // Until Sunday
    return (startOfToday, endOfWeek);
  }

  // Get the end of current week (Sunday)
  DateTime _getEndOfWeek() {
    final now = DateTime.now();
    // Calculate days until next Sunday
    final daysUntilSunday = DateTime.sunday - now.weekday;
    // If today is Sunday, we want this Sunday not next week
    final daysToAdd = daysUntilSunday <= 0 ? 7 + daysUntilSunday : daysUntilSunday;
    return DateTime(now.year, now.month, now.day + daysToAdd);
  }

  // Get start of today
  DateTime _getStartOfToday() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }
}

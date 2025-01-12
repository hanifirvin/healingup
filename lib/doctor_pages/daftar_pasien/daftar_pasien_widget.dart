import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'daftar_pasien_model.dart';
export 'daftar_pasien_model.dart';

class DaftarPasienWidget extends StatefulWidget {
  const DaftarPasienWidget({super.key});

  @override
  State<DaftarPasienWidget> createState() => _DaftarPasienWidgetState();
}

class _DaftarPasienWidgetState extends State<DaftarPasienWidget>
    with TickerProviderStateMixin {
  late DaftarPasienModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DaftarPasienModel());

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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
            'Daftar Pasien',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Poppins',
                  color: const Color(0xFF6264A7),
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
                child: TextFormField(
                  controller: _model.textController,
                  focusNode: _model.textFieldFocusNode,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: false,
                    labelText: 'Cari nama pasien...',
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        letterSpacing: 0.0,
                      ),
                  maxLines: null,
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                  child: StreamBuilder<List<BookingRecord>>(
                    stream: queryBookingRecord(
                      queryBuilder: (bookingRecord) => bookingRecord
                          .where(
                            'status',
                            isEqualTo: 'terjadwal',
                          )
                          .where(
                            'doctorId',
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
                      List<BookingRecord> listViewBookingRecordList =
                          snapshot.data!;

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewBookingRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewBookingRecord =
                              listViewBookingRecordList[listViewIndex];
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: StreamBuilder<List<UsersRecord>>(
                              stream: queryUsersRecord(
                                queryBuilder: (usersRecord) =>
                                    usersRecord.where(
                                  'uid',
                                  isEqualTo: listViewBookingRecord.patientId,
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
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

                                return Container(
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 0.0,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        offset: const Offset(
                                          0.0,
                                          1.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  child: InkWell(
                                    onTap: () async {
                                      context.pushNamed(
                                        'detail_pasien_baru',
                                        queryParameters: {
                                          'bookingID': serializeParam(
                                            listViewBookingRecord.bookingId,
                                            ParamType.String,
                                          ),
                                          'patientId': serializeParam(
                                            listViewBookingRecord.patientId,
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          // Profile Image
                                          Container(
                                            width: 60.0,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              color: FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Builder(
                                              builder: (context) {
                                                if (containerUsersRecord?.photoUrl == null || 
                                                    containerUsersRecord!.photoUrl.isEmpty) {
                                                  return Container(
                                                    width: 60.0,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme.of(context)
                                                          .primaryBackground,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Icon(
                                                      Icons.person,
                                                      color: FlutterFlowTheme.of(context)
                                                          .secondaryText,
                                                      size: 30.0,
                                                    ),
                                                  );
                                                }
                                                return ClipRRect(
                                                  borderRadius: BorderRadius.circular(30.0),
                                                  child: Image.network(
                                                    containerUsersRecord!.photoUrl,
                                                    width: 60.0,
                                                    height: 60.0,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context, error, stackTrace) {
                                                      return Container(
                                                        width: 60.0,
                                                        height: 60.0,
                                                        decoration: BoxDecoration(
                                                          color: FlutterFlowTheme.of(context)
                                                              .primaryBackground,
                                                          shape: BoxShape.circle,
                                                        ),
                                                        child: Icon(
                                                          Icons.person,
                                                          color: FlutterFlowTheme.of(context)
                                                              .secondaryText,
                                                          size: 30.0,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      containerUsersRecord?.displayName,
                                                      'name',
                                                    ),
                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(4.0),
                                                    child: Text(
                                                      dateTimeFormat(
                                                        "relative",
                                                        listViewBookingRecord.createdAt!,
                                                      ),
                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                        fontFamily: 'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Card(
                                            clipBehavior: Clip.antiAliasWithSaveLayer,
                                            color: const Color(0xFF6264A7),
                                            elevation: 1.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(40.0),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Icon(
                                                Icons.keyboard_arrow_right_rounded,
                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
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

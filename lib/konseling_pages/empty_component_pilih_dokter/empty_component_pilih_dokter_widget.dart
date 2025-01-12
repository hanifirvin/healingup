import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'empty_component_pilih_dokter_model.dart';
export 'empty_component_pilih_dokter_model.dart';

class EmptyComponentPilihDokterWidget extends StatefulWidget {
  ///    Container
  ///    └── Column
  ///        └── Text ("Tidak ada dokter yang tersedia untuk hari
  /// [getCurrentDayInIndonesian]")
  const EmptyComponentPilihDokterWidget({super.key});

  @override
  State<EmptyComponentPilihDokterWidget> createState() =>
      _EmptyComponentPilihDokterWidgetState();
}

class _EmptyComponentPilihDokterWidgetState
    extends State<EmptyComponentPilihDokterWidget> {
  late EmptyComponentPilihDokterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyComponentPilihDokterModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Tidak ada psikolog yang tersedia untuk hari ${functions.getCurrentDayInIndonesian()}',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Poppins',
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

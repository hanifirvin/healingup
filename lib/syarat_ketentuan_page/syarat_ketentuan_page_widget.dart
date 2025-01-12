import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'syarat_ketentuan_page_model.dart';
export 'syarat_ketentuan_page_model.dart';

class SyaratKetentuanPageWidget extends StatefulWidget {
  const SyaratKetentuanPageWidget({super.key});

  @override
  State<SyaratKetentuanPageWidget> createState() =>
      _SyaratKetentuanPageWidgetState();
}

class _SyaratKetentuanPageWidgetState extends State<SyaratKetentuanPageWidget> {
  late SyaratKetentuanPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SyaratKetentuanPageModel());

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
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Ketentuan Pengguna',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 22.0,
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
            padding: const EdgeInsetsDirectional.fromSTEB(30.0, 15.0, 30.0, 15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                    child: Text(
                      'SYARAT DAN KETENTUAN PENGGUNA HEALINGUP',
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: 'Playfair Display',
                                color: const Color(0xFF6264A7),
                                fontSize: 28.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w800,
                              ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                    child: Text(
                      '(Terakhir diperbarui tanggal: 03 Agustus 2023)',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                    child: Text(
                      'MOHON UNTUK MEMBACA SELURUH SYARAT DAN KETENTUAN PENGGUNA SEBELUM MENGGUNAKAN SETIAP FITUR DAN/ATAU LAYANAN YANG TERSEDIA DALAM PLATFORM HEALINGUP.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse dignissim facilisis arcu, ut ultricies mi dignissim non. Suspendisse in tincidunt sapien. Etiam eleifend in nunc et vulputate. Suspendisse nibh sapien, suscipit vel varius at, cursus eget dui. Mauris posuere viverra libero, a ornare nulla interdum in. Nulla in tortor consectetur, pulvinar ante nec, ultricies eros. Nulla porta augue at lectus fringilla efficitur. Aliquam erat volutpat. Nunc ac maximus ante. Fusce placerat justo nec malesuada euismod. Nunc lobortis dignissim nibh. Nulla facilisi. Nulla vel volutpat neque. Vestibulum quis consequat dui. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus sagittis ligula sit amet dui varius, sit amet egestas ipsum lobortis.\n',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    'Integer id egestas neque, sit amet tempus nibh. Sed pharetra est massa, id lacinia eros cursus a. Integer finibus sem in metus tempus tincidunt. Etiam in feugiat mi. Aenean et blandit purus, vitae tristique sem. Proin at arcu augue. Aliquam cursus bibendum egestas. Mauris vel massa non neque iaculis iaculis. In et leo sed arcu ultricies convallis. Praesent quam magna, gravida eu elementum sed, maximus efficitur felis. Donec at eros congue justo finibus blandit. Integer mollis a augue ut interdum. Sed tincidunt nisl sit amet justo fermentum, sed laoreet tellus tincidunt. Nullam venenatis metus quis ipsum luctus, eu pharetra diam faucibus.\n',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    'Nam porttitor placerat nibh vel commodo. Etiam diam lorem, facilisis ac sodales in, scelerisque vitae lorem. Suspendisse id lectus mauris. Phasellus quis magna accumsan, pretium libero et, bibendum dui. Nunc dictum turpis massa, at congue tortor bibendum eget. Integer tincidunt nec leo euismod viverra. Vestibulum blandit tempor ante suscipit aliquam. Donec dignissim quam massa, id interdum nibh finibus vel. Sed pretium nulla quis sapien placerat varius. In vel lectus quis sapien pharetra dignissim in sed leo. Maecenas egestas sit amet libero a elementum.\n\n',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0.0,
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

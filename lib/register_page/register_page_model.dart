import '/flutter_flow/flutter_flow_util.dart';
import 'register_page_widget.dart' show RegisterPageWidget;
import 'package:flutter/material.dart';

class RegisterPageModel extends FlutterFlowModel<RegisterPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for daftar_nama widget.
  FocusNode? daftarNamaFocusNode;
  TextEditingController? daftarNamaTextController;
  String? Function(BuildContext, String?)? daftarNamaTextControllerValidator;
  // State field(s) for daftar_email widget.
  FocusNode? daftarEmailFocusNode;
  TextEditingController? daftarEmailTextController;
  String? Function(BuildContext, String?)? daftarEmailTextControllerValidator;
  // State field(s) for daftar_password widget.
  FocusNode? daftarPasswordFocusNode;
  TextEditingController? daftarPasswordTextController;
  late bool daftarPasswordVisibility;
  String? Function(BuildContext, String?)?
      daftarPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    daftarPasswordVisibility = false;
  }

  @override
  void dispose() {
    daftarNamaFocusNode?.dispose();
    daftarNamaTextController?.dispose();

    daftarEmailFocusNode?.dispose();
    daftarEmailTextController?.dispose();

    daftarPasswordFocusNode?.dispose();
    daftarPasswordTextController?.dispose();
  }
}

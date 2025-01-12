import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'daftar_pasien_widget.dart' show DaftarPasienWidget;
import 'package:flutter/material.dart';

class DaftarPasienModel extends FlutterFlowModel<DaftarPasienWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

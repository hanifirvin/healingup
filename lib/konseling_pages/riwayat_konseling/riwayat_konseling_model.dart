import '/flutter_flow/flutter_flow_util.dart';
import 'riwayat_konseling_widget.dart' show RiwayatKonselingWidget;
import 'package:flutter/material.dart';

class RiwayatKonselingModel extends FlutterFlowModel<RiwayatKonselingWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}

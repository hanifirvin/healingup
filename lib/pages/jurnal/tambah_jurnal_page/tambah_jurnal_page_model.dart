import '/flutter_flow/flutter_flow_util.dart';
import 'tambah_jurnal_page_widget.dart' show TambahJurnalPageWidget;
import 'package:flutter/material.dart';

class TambahJurnalPageModel extends FlutterFlowModel<TambahJurnalPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for judul widget.
  FocusNode? judulFocusNode;
  TextEditingController? judulTextController;
  String? Function(BuildContext, String?)? judulTextControllerValidator;
  // State field(s) for detail widget.
  FocusNode? detailFocusNode;
  TextEditingController? detailTextController;
  String? Function(BuildContext, String?)? detailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    judulFocusNode?.dispose();
    judulTextController?.dispose();

    detailFocusNode?.dispose();
    detailTextController?.dispose();
  }
}

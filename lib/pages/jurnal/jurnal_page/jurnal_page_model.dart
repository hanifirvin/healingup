import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'jurnal_page_widget.dart' show JurnalPageWidget;
import 'package:flutter/material.dart';

class JurnalPageModel extends FlutterFlowModel<JurnalPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.
  ScrollController? listViewController;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    listViewController?.dispose();
  }
}

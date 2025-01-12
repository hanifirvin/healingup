import '/flutter_flow/flutter_flow_util.dart';
import 'info_breath_equal_widget.dart' show InfoBreathEqualWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class InfoBreathEqualModel extends FlutterFlowModel<InfoBreathEqualWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
  }
}

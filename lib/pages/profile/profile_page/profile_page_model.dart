import '/flutter_flow/flutter_flow_util.dart';
import '/pages/toggle_dark_mode/toggle_dark_mode_widget.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for toggle_dark_mode component.
  late ToggleDarkModeModel toggleDarkModeModel;

  @override
  void initState(BuildContext context) {
    toggleDarkModeModel = createModel(context, () => ToggleDarkModeModel());
  }

  @override
  void dispose() {
    toggleDarkModeModel.dispose();
  }
}

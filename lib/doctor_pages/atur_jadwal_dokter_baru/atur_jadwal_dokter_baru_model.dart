import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'atur_jadwal_dokter_baru_widget.dart' show AturJadwalDokterBaruWidget;
import 'package:flutter/material.dart';

class AturJadwalDokterBaruModel
    extends FlutterFlowModel<AturJadwalDokterBaruWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  List<String>? get choiceChipsValues1 => choiceChipsValueController1?.value;
  set choiceChipsValues1(List<String>? val) =>
      choiceChipsValueController1?.value = val;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  List<String>? get choiceChipsValues2 => choiceChipsValueController2?.value;
  set choiceChipsValues2(List<String>? val) =>
      choiceChipsValueController2?.value = val;
  // Stores action output result for [Custom Action - sortAvailableDays] action in Button widget.
  List<String>? sortedDays;
  // Stores action output result for [Custom Action - sortAvailableHours] action in Button widget.
  List<String>? sortedHours;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}

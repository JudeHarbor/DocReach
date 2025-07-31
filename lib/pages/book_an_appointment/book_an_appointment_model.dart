import '/flutter_flow/flutter_flow_util.dart';
import 'book_an_appointment_widget.dart' show BookAnAppointmentWidget;
import 'package:flutter/material.dart';

class BookAnAppointmentModel extends FlutterFlowModel<BookAnAppointmentWidget> {
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

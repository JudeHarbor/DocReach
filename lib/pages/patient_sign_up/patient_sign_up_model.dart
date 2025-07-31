import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'patient_sign_up_widget.dart' show PatientSignUpWidget;
import 'package:flutter/material.dart';

class PatientSignUpModel extends FlutterFlowModel<PatientSignUpWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode;
  TextEditingController? emailAddressCreateTextController;
  String? Function(BuildContext, String?)?
      emailAddressCreateTextControllerValidator;
  // State field(s) for password_Create widget.
  FocusNode? passwordCreateFocusNode;
  TextEditingController? passwordCreateTextController;
  late bool passwordCreateVisibility;
  String? Function(BuildContext, String?)?
      passwordCreateTextControllerValidator;
  // State field(s) for password_CreateConfirm widget.
  FocusNode? passwordCreateConfirmFocusNode;
  TextEditingController? passwordCreateConfirmTextController;
  late bool passwordCreateConfirmVisibility;
  String? Function(BuildContext, String?)?
      passwordCreateConfirmTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordCreateVisibility = false;
    passwordCreateConfirmVisibility = false;
  }

  @override
  void dispose() {
    emailAddressCreateFocusNode?.dispose();
    emailAddressCreateTextController?.dispose();

    passwordCreateFocusNode?.dispose();
    passwordCreateTextController?.dispose();

    passwordCreateConfirmFocusNode?.dispose();
    passwordCreateConfirmTextController?.dispose();
  }
}

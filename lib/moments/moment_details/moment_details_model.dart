import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class MomentDetailsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for commentBox widget.
  TextEditingController? commentBoxController;
  String? Function(BuildContext, String?)? commentBoxControllerValidator;
  String? _commentBoxControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Type your comment';
    }

    if (val.length < 1) {
      return 'You need to type atleast one character ';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    commentBoxControllerValidator = _commentBoxControllerValidator;
  }

  void dispose() {
    commentBoxController?.dispose();
  }

  /// Additional helper methods are added here.

}

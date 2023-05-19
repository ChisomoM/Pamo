import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/no_performers_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/event_pages/event_list/event_list_widget.dart';
import '/profile_pages/profile_media_grid/profile_media_grid_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class OtherBizUserProfileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for eventList component.
  late EventListModel eventListModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    eventListModel = createModel(context, () => EventListModel());
  }

  void dispose() {
    eventListModel.dispose();
  }

  /// Additional helper methods are added here.

}

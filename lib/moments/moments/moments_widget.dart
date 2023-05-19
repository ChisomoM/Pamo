import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'moments_model.dart';
export 'moments_model.dart';

class MomentsWidget extends StatefulWidget {
  const MomentsWidget({Key? key}) : super(key: key);

  @override
  _MomentsWidgetState createState() => _MomentsWidgetState();
}

class _MomentsWidgetState extends State<MomentsWidget>
    with TickerProviderStateMixin {
  late MomentsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'toggleIconOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: Offset(1.0, 1.0),
          end: Offset(1.1, 1.1),
        ),
        ScaleEffect(
          curve: Curves.linear,
          delay: 300.ms,
          duration: 300.ms,
          begin: Offset(1.1, 1.1),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MomentsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Moments'});
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
              child: Text(
                'Moments',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Montserrat',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            actions: [],
            centerTitle: false,
            toolbarHeight: 75.0,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              StreamBuilder<List<MomentsRecord>>(
                stream: queryMomentsRecord(
                  queryBuilder: (momentsRecord) => momentsRecord.where(
                      'user_posting',
                      isNotEqualTo: currentUserReference),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 35.0,
                        height: 35.0,
                        child: SpinKitFadingFour(
                          color: FlutterFlowTheme.of(context).primary,
                          size: 35.0,
                        ),
                      ),
                    );
                  }
                  List<MomentsRecord> listViewMomentsRecordList =
                      snapshot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewMomentsRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewMomentsRecord =
                          listViewMomentsRecordList[listViewIndex];
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
                        child: FutureBuilder<int>(
                          future: queryCommentsRecordCount(
                            parent: listViewMomentsRecord.reference,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 35.0,
                                  height: 35.0,
                                  child: SpinKitFadingFour(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 35.0,
                                  ),
                                ),
                              );
                            }
                            int userPostCount = snapshot.data!;
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'MOMENTS_PAGE_userPost_ON_TAP');

                                context.pushNamed(
                                  'momentDetails',
                                  queryParams: {
                                    'momentRef': serializeParam(
                                      listViewMomentsRecord.reference,
                                      ParamType.DocumentReference,
                                    ),
                                    'commentNum': serializeParam(
                                      userPostCount,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.94,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            listViewMomentsRecord.userPosting!),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 35.0,
                                                height: 35.0,
                                                child: SpinKitFadingFour(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 35.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final userInfoUsersRecord =
                                              snapshot.data!;
                                          return Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Card(
                                                clipBehavior:
                                                    Clip.antiAliasWithSaveLayer,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          1.0, 1.0, 1.0, 1.0),
                                                  child: Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      valueOrDefault<String>(
                                                        userInfoUsersRecord
                                                            .photoUrl,
                                                        'https://i.pinimg.com/originals/f1/0f/f7/f10ff70a7155e5ab666bcdd1b45b726d.jpg',
                                                      ),
                                                      fit: BoxFit.fitWidth,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'MOMENTS_PAGE_Text_92ukbtnr_ON_TAP');

                                                              context.pushNamed(
                                                                'OtherBizUserProfile',
                                                                queryParams: {
                                                                  'user':
                                                                      serializeParam(
                                                                    listViewMomentsRecord
                                                                        .userPosting,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                  'userN':
                                                                      serializeParam(
                                                                    userInfoUsersRecord
                                                                        .displayName,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Text(
                                                              userInfoUsersRecord
                                                                  .displayName,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              dateTimeFormat(
                                                                  'relative',
                                                                  listViewMomentsRecord
                                                                      .postTime),
                                                              'Moments ago',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Color(
                                                                      0xFF57636C),
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                    FlutterFlowMediaDisplay(
                                      path: listViewMomentsRecord.postMedia,
                                      imageBuilder: (path) => Image.network(
                                        path,
                                        width: double.infinity,
                                        height: 408.0,
                                        fit: BoxFit.cover,
                                      ),
                                      videoPlayerBuilder: (path) =>
                                          FlutterFlowVideoPlayer(
                                        path: path,
                                        width: double.infinity,
                                        height: 408.0,
                                        autoPlay: false,
                                        looping: false,
                                        showControls: true,
                                        allowFullScreen: true,
                                        allowPlaybackSpeedMenu: true,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Text(
                                                listViewMomentsRecord.caption,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 16.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 8.0, 8.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Moments at: Comedy Show',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  ToggleIcon(
                                                    onPressed: () async {
                                                      final likesElement =
                                                          currentUserReference;
                                                      final likesUpdate =
                                                          listViewMomentsRecord
                                                                  .likes
                                                                  .contains(
                                                                      likesElement)
                                                              ? FieldValue
                                                                  .arrayRemove([
                                                                  likesElement
                                                                ])
                                                              : FieldValue
                                                                  .arrayUnion([
                                                                  likesElement
                                                                ]);
                                                      final momentsUpdateData =
                                                          {
                                                        'likes': likesUpdate,
                                                      };
                                                      await listViewMomentsRecord
                                                          .reference
                                                          .update(
                                                              momentsUpdateData);
                                                      logFirebaseEvent(
                                                          'MOMENTS_ToggleIcon_06ivdijr_ON_TOGGLE');

                                                      final userNotificationsCreateData =
                                                          createUserNotificationsRecordData(
                                                        time:
                                                            getCurrentTimestamp,
                                                        momentRef:
                                                            listViewMomentsRecord
                                                                .reference,
                                                        userRef:
                                                            listViewMomentsRecord
                                                                .userPosting,
                                                        senderRef:
                                                            currentUserReference,
                                                        notificationType:
                                                            'Like',
                                                      );
                                                      await UserNotificationsRecord
                                                              .createDoc(
                                                                  listViewMomentsRecord
                                                                      .userPosting!)
                                                          .set(
                                                              userNotificationsCreateData);
                                                      triggerPushNotification(
                                                        notificationTitle:
                                                            valueOrDefault<
                                                                String>(
                                                          '${currentUserDisplayName}liked your moment.',
                                                          'Your moment has been liked',
                                                        ),
                                                        notificationText:
                                                            valueOrDefault<
                                                                String>(
                                                          '${currentUserDisplayName}has liked your moment.',
                                                          'Your moment has been liked',
                                                        ),
                                                        notificationSound:
                                                            'default',
                                                        userRefs: [
                                                          listViewMomentsRecord
                                                              .userPosting!
                                                        ],
                                                        initialPageName:
                                                            'ListNotifications',
                                                        parameterData: {},
                                                      );
                                                    },
                                                    value: listViewMomentsRecord
                                                        .likes
                                                        .contains(
                                                            currentUserReference),
                                                    onIcon: Icon(
                                                      Icons.favorite_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor3,
                                                      size: 25.0,
                                                    ),
                                                    offIcon: Icon(
                                                      Icons.favorite_border,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                      size: 25.0,
                                                    ),
                                                  ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'toggleIconOnActionTriggerAnimation']!,
                                                  ),
                                                  Text(
                                                    '${valueOrDefault<String>(
                                                      listViewMomentsRecord
                                                          .likes.length
                                                          .toString(),
                                                      '0',
                                                    )}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        18.0, 0.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .mode_comment_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                      size: 24.0,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        '${valueOrDefault<String>(
                                                          formatNumber(
                                                            userPostCount,
                                                            formatType:
                                                                FormatType
                                                                    .compact,
                                                          ),
                                                          'Comments',
                                                        )}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .accent3,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.navBarModel,
                  updateCallback: () => setState(() {}),
                  child: NavBarWidget(
                    colorOne: FlutterFlowTheme.of(context).navBar,
                    colorTwo: FlutterFlowTheme.of(context).navBar,
                    colorThree: FlutterFlowTheme.of(context).primary,
                    colorFour: FlutterFlowTheme.of(context).navBar,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

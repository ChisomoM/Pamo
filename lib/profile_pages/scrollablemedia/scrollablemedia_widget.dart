import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'scrollablemedia_model.dart';
export 'scrollablemedia_model.dart';

class ScrollablemediaWidget extends StatefulWidget {
  const ScrollablemediaWidget({
    Key? key,
    this.media,
  }) : super(key: key);

  final String? media;

  @override
  _ScrollablemediaWidgetState createState() => _ScrollablemediaWidgetState();
}

class _ScrollablemediaWidgetState extends State<ScrollablemediaWidget> {
  late ScrollablemediaModel _model;

  int get pageViewCurrentIndex => _model.pageViewController != null &&
          _model.pageViewController!.hasClients &&
          _model.pageViewController!.page != null
      ? _model.pageViewController!.page!.round()
      : 0;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScrollablemediaModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 500.0,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
            child: PageView(
              controller: _model.pageViewController ??=
                  PageController(initialPage: 0),
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.96,
                    height: 408.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 6.0,
                          color: Color(0x3A000000),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: FlutterFlowMediaDisplay(
                      path: widget.media!,
                      imageBuilder: (path) => Image.network(
                        path,
                        height: 408.1,
                        fit: BoxFit.cover,
                      ),
                      videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
                        path: path,
                        width: 300.0,
                        autoPlay: false,
                        looping: false,
                        showControls: true,
                        allowFullScreen: true,
                        allowPlaybackSpeedMenu: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 0.95),
            child: smooth_page_indicator.SmoothPageIndicator(
              controller: _model.pageViewController ??=
                  PageController(initialPage: 0),
              count: 1,
              axisDirection: Axis.horizontal,
              onDotClicked: (i) async {
                await _model.pageViewController!.animateToPage(
                  i,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
              effect: smooth_page_indicator.SlideEffect(
                spacing: 4.0,
                radius: 16.0,
                dotWidth: 8.0,
                dotHeight: 8.0,
                dotColor: FlutterFlowTheme.of(context).accent2,
                activeDotColor: FlutterFlowTheme.of(context).primary,
                paintStyle: PaintingStyle.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

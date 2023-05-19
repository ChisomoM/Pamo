import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_media_grid_model.dart';
export 'profile_media_grid_model.dart';

class ProfileMediaGridWidget extends StatefulWidget {
  const ProfileMediaGridWidget({
    Key? key,
    this.media,
  }) : super(key: key);

  final String? media;

  @override
  _ProfileMediaGridWidgetState createState() => _ProfileMediaGridWidgetState();
}

class _ProfileMediaGridWidgetState extends State<ProfileMediaGridWidget> {
  late ProfileMediaGridModel _model;

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
    _model = createModel(context, () => ProfileMediaGridModel());
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
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _model.pageViewController ??=
            PageController(initialPage: 0),
        scrollDirection: Axis.horizontal,
        children: [
          FlutterFlowMediaDisplay(
            path: widget.media!,
            imageBuilder: (path) => Image.network(
              path,
              width: 300.0,
              height: 300.0,
              fit: BoxFit.cover,
            ),
            videoPlayerBuilder: (path) => FlutterFlowVideoPlayer(
              path: path,
              width: 300.0,
              autoPlay: false,
              looping: true,
              showControls: true,
              allowFullScreen: true,
              allowPlaybackSpeedMenu: false,
            ),
          ),
        ],
      ),
    );
  }
}

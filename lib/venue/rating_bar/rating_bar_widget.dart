import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rating_bar_model.dart';
export 'rating_bar_model.dart';

class RatingBarWidget extends StatefulWidget {
  const RatingBarWidget({
    Key? key,
    this.ratingBar,
  }) : super(key: key);

  final double? ratingBar;

  @override
  _RatingBarWidgetState createState() => _RatingBarWidgetState();
}

class _RatingBarWidgetState extends State<RatingBarWidget> {
  late RatingBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return RatingBar.builder(
      onRatingUpdate: (newValue) =>
          setState(() => _model.ratingBarValue = newValue),
      itemBuilder: (context, index) => Icon(
        Icons.star_rounded,
        color: FlutterFlowTheme.of(context).warning,
      ),
      direction: Axis.horizontal,
      initialRating: _model.ratingBarValue ??= widget.ratingBar!,
      unratedColor: FlutterFlowTheme.of(context).accent2,
      itemCount: 5,
      itemSize: 24.0,
      glowColor: FlutterFlowTheme.of(context).warning,
    );
  }
}

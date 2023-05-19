import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ticket_model.dart';
export 'ticket_model.dart';

class TicketWidget extends StatefulWidget {
  const TicketWidget({
    Key? key,
    this.price,
  }) : super(key: key);

  final double? price;

  @override
  _TicketWidgetState createState() => _TicketWidgetState();
}

class _TicketWidgetState extends State<TicketWidget> {
  late TicketModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TicketModel());
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
      decoration: BoxDecoration(
        color: Color(0x00FFFFFF),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 175.0,
              height: 35.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
              child: FlutterFlowCountController(
                decrementIconBuilder: (enabled) => FaIcon(
                  FontAwesomeIcons.solidMinusSquare,
                  color: enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
                  size: 30.0,
                ),
                incrementIconBuilder: (enabled) => FaIcon(
                  FontAwesomeIcons.solidPlusSquare,
                  color: enabled
                      ? FlutterFlowTheme.of(context).primary
                      : Color(0xFFEEEEEE),
                  size: 30.0,
                ),
                countBuilder: (count) => Text(
                  count.toString(),
                  style: GoogleFonts.getFont(
                    'Roboto',
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                  ),
                ),
                count: _model.countControllerValue ??= 0,
                updateCount: (count) async {
                  setState(() => _model.countControllerValue = count);
                  logFirebaseEvent('TICKET_CountController_wzva9ti8_ON_FORM_');
                  setState(() {
                    FFAppState().cartSum = FFAppState().cartSum + widget.price!;
                  });
                },
                stepSize: 1,
                minimum: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

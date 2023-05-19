import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_ticket_model.dart';
export 'add_ticket_model.dart';

class AddTicketWidget extends StatefulWidget {
  const AddTicketWidget({
    Key? key,
    this.tick,
    required this.eventRef,
  }) : super(key: key);

  final DocumentReference? tick;
  final DocumentReference? eventRef;

  @override
  _AddTicketWidgetState createState() => _AddTicketWidgetState();
}

class _AddTicketWidgetState extends State<AddTicketWidget> {
  late AddTicketModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddTicketModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<CartsRecord>>(
      future: queryCartsRecordOnce(
        queryBuilder: (cartsRecord) =>
            cartsRecord.where('user_ref', isEqualTo: currentUserReference),
        singleRecord: true,
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
        List<CartsRecord> containerCartsRecordList = snapshot.data!;
        final containerCartsRecord = containerCartsRecordList.isNotEmpty
            ? containerCartsRecordList.first
            : null;
        return Container(
          width: 330.0,
          height: 265.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderWidth: 1.0,
                      buttonSize: 40.0,
                      icon: Icon(
                        Icons.close_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 25.0,
                      ),
                      onPressed: () async {
                        logFirebaseEvent(
                            'ADD_TICKET_COMP_close_rounded_ICN_ON_TAP');
                        Navigator.pop(context, FFAppState().cart);
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                child: StreamBuilder<TicketsRecord>(
                  stream: TicketsRecord.getDocument(widget.tick!),
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
                    final columnTicketsRecord = snapshot.data!;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                columnTicketsRecord.ticketName,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  formatNumber(
                                    columnTicketsRecord.ticketPrice,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                    currency: '',
                                  ),
                                  textAlign: TextAlign.end,
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 18.0,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  columnTicketsRecord.ticketDescription,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Container(
                            width: 185.0,
                            height: 45.0,
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
                                color: enabled
                                    ? Color(0xDD000000)
                                    : Color(0xFFEEEEEE),
                                size: 35.0,
                              ),
                              incrementIconBuilder: (enabled) => FaIcon(
                                FontAwesomeIcons.solidPlusSquare,
                                color: enabled
                                    ? FlutterFlowTheme.of(context).primary
                                    : Color(0xFFEEEEEE),
                                size: 35.0,
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
                              updateCount: (count) => setState(
                                  () => _model.countControllerValue = count),
                              stepSize: 1,
                              minimum: 0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 18.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'ADD_TICKET_COMP_ADD_TO_CART_BTN_ON_TAP');

                              final ordersCreateData = createOrdersRecordData(
                                ticketName: columnTicketsRecord.ticketName,
                                price: columnTicketsRecord.ticketPrice,
                                quantity: _model.countControllerValue,
                                cartRef: containerCartsRecord!.reference,
                                ticketRef: widget.tick,
                                eventRef: widget.eventRef,
                                ticketId:
                                    'ticket${random_data.randomInteger(10, 155).toString()}',
                              );
                              var ordersRecordReference =
                                  OrdersRecord.collection.doc();
                              await ordersRecordReference.set(ordersCreateData);
                              _model.ticketItem =
                                  OrdersRecord.getDocumentFromData(
                                      ordersCreateData, ordersRecordReference);

                              final cartsUpdateData = {
                                ...createCartsRecordData(
                                  isActive: true,
                                  subTotal: functions.total(
                                      containerCartsRecord!.subTotal,
                                      columnTicketsRecord.ticketPrice),
                                ),
                                'item_count': FieldValue.increment(
                                    _model.countControllerValue!),
                                'orders': FieldValue.arrayUnion(
                                    [_model.ticketItem!.reference]),
                              };
                              await containerCartsRecord!.reference
                                  .update(cartsUpdateData);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Success',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 2000),
                                  backgroundColor: Color(0x00000000),
                                ),
                              );
                              Navigator.pop(context, FFAppState().cart);

                              setState(() {});
                            },
                            text: 'Add to cart',
                            options: FFButtonOptions(
                              width: 250.0,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

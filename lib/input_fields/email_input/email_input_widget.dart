import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'email_input_model.dart';
export 'email_input_model.dart';

class EmailInputWidget extends StatefulWidget {
  const EmailInputWidget({Key? key}) : super(key: key);

  @override
  _EmailInputWidgetState createState() => _EmailInputWidgetState();
}

class _EmailInputWidgetState extends State<EmailInputWidget> {
  late EmailInputModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmailInputModel());

    _model.textController ??= TextEditingController(text: currentUserEmail);
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return TextFormField(
      controller: _model.textController,
      onChanged: (_) => EasyDebounce.debounce(
        '_model.textController',
        Duration(milliseconds: 2000),
        () => setState(() {}),
      ),
      autofillHints: [AutofillHints.email],
      obscureText: false,
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Montserrat',
              color: FlutterFlowTheme.of(context).secondaryText,
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
            ),
        hintStyle: FlutterFlowTheme.of(context).bodySmall,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).lineColor,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4.0),
            topRight: Radius.circular(4.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).lineColor,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4.0),
            topRight: Radius.circular(4.0),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).error,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4.0),
            topRight: Radius.circular(4.0),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).error,
            width: 1.0,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4.0),
            topRight: Radius.circular(4.0),
          ),
        ),
        filled: true,
        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        suffixIcon: _model.textController!.text.isNotEmpty
            ? InkWell(
                onTap: () async {
                  _model.textController?.clear();
                  setState(() {});
                },
                child: Icon(
                  Icons.clear,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 14.0,
                ),
              )
            : null,
      ),
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Montserrat',
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
      keyboardType: TextInputType.emailAddress,
      validator: _model.textControllerValidator.asValidator(context),
    );
  }
}

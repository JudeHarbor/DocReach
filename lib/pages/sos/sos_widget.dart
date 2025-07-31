import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'sos_model.dart';
export 'sos_model.dart';

class SosWidget extends StatefulWidget {
  const SosWidget({super.key});

  static String routeName = 'sos';
  static String routePath = '/sos';

  @override
  State<SosWidget> createState() => _SosWidgetState();
}

class _SosWidgetState extends State<SosWidget> {
  late SosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SosModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Stack(
                    children: [
                      FlutterFlowGoogleMap(
                        controller: _model.googleMapsController,
                        onCameraIdle: (latLng) =>
                            _model.googleMapsCenter = latLng,
                        initialLocation: _model.googleMapsCenter ??=
                            LatLng(13.106061, -59.613158),
                        markerColor: GoogleMarkerColor.violet,
                        mapType: MapType.normal,
                        style: GoogleMapStyle.standard,
                        initialZoom: 14.0,
                        allowInteraction: true,
                        allowZoom: true,
                        showZoomControls: false,
                        showLocation: true,
                        showCompass: false,
                        showMapToolbar: false,
                        showTraffic: false,
                        centerMapOnMarkerTap: true,
                        mapTakesGesturePreference: false,
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.06, 0.66),
                        child: PointerInterceptor(
                          intercepting: isWeb,
                          child: FlutterFlowIconButton(
                            borderRadius: 60.0,
                            buttonSize: 120.0,
                            fillColor: Color(0xFFE5150B),
                            icon: Icon(
                              Icons.sos_rounded,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              currentUserLocationValue =
                                  await getCurrentUserLocation(
                                      defaultLocation: LatLng(0.0, 0.0));
                              await _model.googleMapsController.future.then(
                                (c) => c.animateCamera(
                                  CameraUpdate.newLatLng(
                                      currentUserLocationValue!.toGoogleMaps()),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
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

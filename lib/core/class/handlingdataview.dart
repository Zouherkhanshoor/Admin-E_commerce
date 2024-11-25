import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:test_app/core/class/status_request.dart';
import 'package:test_app/core/constant/imageasset.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loading, width: 300, height: 300))
        : statusRequest == StatusRequest.offlinefailuer
            ? Center(
                child: Lottie.asset(AppImageAsset.offline,
                    width: 500, height: 500))
            : statusRequest == StatusRequest.serverfailuer
                ? Center(
                    child: Lottie.asset(AppImageAsset.server,
                        width: 300, height: 300))
                : statusRequest == StatusRequest.failuer
                    ? Center(
                        child: Lottie.asset(
                        AppImageAsset.server,
                        width: 300,
                        height: 300,
                      ))
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAsset.loading, width: 300, height: 300))
        : statusRequest == StatusRequest.offlinefailuer
            ? Center(
                child: Lottie.asset(AppImageAsset.offline,
                    width: 500, height: 500))
            : statusRequest == StatusRequest.serverfailuer
                ? Center(
                    child: Lottie.asset(AppImageAsset.server,
                        width: 300, height: 300))
                : widget;
  }
}

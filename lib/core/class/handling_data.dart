import 'package:flutter/material.dart';

import 'status_request.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(child: Text('Loading'))
        : statusRequest == StatusRequest.offlinefailure
            ? const Center(child: Text('Offline'))
            : statusRequest == StatusRequest.serverfailure
                ? const Center(child: Text('Server'))
                : statusRequest == StatusRequest.failure
                    ? const Center(child: Text('no data'))
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
        ? const Center(child: Text('Loading'))
        : statusRequest == StatusRequest.offlinefailure
            ? const Center(child: Text('Offline'))
            : statusRequest == StatusRequest.serverfailure
                ? const Center(child: Text('Server'))
                : widget;
  }
}

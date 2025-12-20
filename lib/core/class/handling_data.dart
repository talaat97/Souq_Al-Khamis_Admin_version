import 'package:flutter/material.dart';
import 'package:souq_al_khamis_admin_version/core/constant/colors.dart';

import 'status_request.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _buildStateWidget(context),
    );
  }

  Widget _buildStateWidget(BuildContext context) {
    switch (statusRequest) {
      case StatusRequest.loading:
        return _buildLoadingState(context);
      case StatusRequest.offlinefailure:
        return _buildOfflineState(context);
      case StatusRequest.serverfailure:
        return _buildServerFailureState(context);
      case StatusRequest.failure:
        return _buildNoDataState(context);
      case StatusRequest.timeoutfailure:
        return _buildTimeoutState(context);
      default:
        return widget;
    }
  }

  // Loading State with Spinner
  Widget _buildLoadingState(BuildContext context) {
    return Center(
      key: const ValueKey('loading'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColor.primaryColor),
            strokeWidth: 3,
          ),
          const SizedBox(height: 20),
          Text(
            'Loading...',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColor.textSecondary,
                  fontSize: 16,
                ),
          ),
        ],
      ),
    );
  }

  // Offline State
  Widget _buildOfflineState(BuildContext context) {
    return _buildErrorState(
      context,
      key: 'offline',
      icon: Icons.wifi_off_rounded,
      title: 'No Internet Connection',
      message: 'Please check your connection and try again',
    );
  }

  // Server Failure State
  Widget _buildServerFailureState(BuildContext context) {
    return _buildErrorState(
      context,
      key: 'server',
      icon: Icons.cloud_off_rounded,
      title: 'Server Error',
      message: 'Something went wrong. Please try again later',
    );
  }

  // Timeout State
  Widget _buildTimeoutState(BuildContext context) {
    return _buildErrorState(
      context,
      key: 'timeout',
      icon: Icons.access_time_rounded,
      title: 'Connection Timeout',
      message: 'The request took too long. Please try again',
    );
  }

  // No Data/Empty State
  Widget _buildNoDataState(BuildContext context) {
    return Center(
      key: const ValueKey('nodata'),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox_rounded,
              size: 80,
              color: AppColor.neutralMedium.withOpacity(0.5),
            ),
            const SizedBox(height: 20),
            Text(
              'No Data Available',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: AppColor.textPrimary,
                    fontSize: 20,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'There is no data to display at the moment',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColor.neutralMedium,
                    fontSize: 14,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Error State Builder
  Widget _buildErrorState(
    BuildContext context, {
    required String key,
    required IconData icon,
    required String title,
    required String message,
  }) {
    return Center(
      key: ValueKey(key),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColor.errorColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 60,
                color: AppColor.errorColor,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: AppColor.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColor.neutralMedium,
                    fontSize: 14,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

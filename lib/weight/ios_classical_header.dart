import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_fq_mall/generated/i18n.dart';

class IosClassicalHeader extends ClassicalHeader {
  IosClassicalHeader({
    @required BuildContext context,
    headerFloat = false,
    vibration = true,
  }) : super(
          enableInfiniteRefresh: false,
          extent: 100,
          triggerDistance: 120,
          bgColor: headerFloat ? Theme.of(context).primaryColor : null,
          infoColor: headerFloat ? Colors.black87 : Colors.teal,
          float: headerFloat,
          enableHapticFeedback: vibration,
          refreshText: S.of(context).pullToRefresh,
          refreshReadyText: S.of(context).releaseToRefresh,
          refreshingText: S.of(context).refreshing,
          refreshedText: S.of(context).refreshed,
          refreshFailedText: S.of(context).refreshFailed,
          noMoreText: S.of(context).noMore,
          infoText: S.of(context).updateAt,
        );

  @override
  Widget contentBuilder(
      BuildContext context,
      RefreshMode refreshState,
      double pulledExtent,
      double refreshTriggerPullDistance,
      double refreshIndicatorExtent,
      AxisDirection axisDirection,
      bool float,
      Duration completeDuration,
      bool enableInfiniteRefresh,
      bool success,
      bool noMore) {
    return SafeArea(
        child: ClassicalHeaderWidget(
      key: key,
      classicalHeader: this,
      refreshState: refreshState,
      pulledExtent: pulledExtent,
      refreshTriggerPullDistance: refreshTriggerPullDistance,
      refreshIndicatorExtent: refreshIndicatorExtent,
      axisDirection: axisDirection,
      float: float,
      completeDuration: completeDuration,
      enableInfiniteRefresh: enableInfiniteRefresh,
      success: success,
      noMore: noMore,
    ));
  }
}

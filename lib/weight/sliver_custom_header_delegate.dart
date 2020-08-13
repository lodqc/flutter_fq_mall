import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;

  SliverCustomHeaderDelegate({
    this.collapsedHeight,
    this.expandedHeight,
    this.child,
  });

  @override
  double get minExtent => this.collapsedHeight;

  @override
  double get maxExtent => this.expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  Color getStickyHeaderBgColor(shrinkOffset) {
    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
        .clamp(0, 255)
        .toInt();
    return Color.fromARGB(alpha, 255, 255, 255);
  }

  Color getStickyHeaderTextColor(shrinkOffset) {
    if (shrinkOffset <= 50) {
      return Colors.transparent;
    } else {
      final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
          .clamp(0, 255)
          .toInt();
      return Color.fromARGB(alpha, 0, 0, 0);
    }
  }

  Color getStickyHeaderIconColor(shrinkOffset) {
    if (shrinkOffset <= 50) {
      return Colors.white;
    } else {
      final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255)
          .clamp(0, 255)
          .toInt();
      return Color.fromARGB(alpha, 0, 0, 0);
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: this.maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          child,
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              color: this.getStickyHeaderBgColor(shrinkOffset),
              child: Container(
                height: this.collapsedHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: this.getStickyHeaderIconColor(shrinkOffset),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      'Header Effect',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: this.getStickyHeaderTextColor(shrinkOffset),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.share,
                        color: this.getStickyHeaderIconColor(shrinkOffset),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
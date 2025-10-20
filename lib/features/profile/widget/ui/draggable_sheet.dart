import 'package:flutter/material.dart';
typedef SheetContentBuilder = Widget Function(BuildContext context, ScrollController scrollController);

/// Reusable `DraggableScrollableSheet` component.
/// 
/// Đây là một sheet kéo được (draggable) với các tuỳ chọn như:
/// - hiển thị handle (thanh kéo) ở đầu sheet
/// - header tuỳ chỉnh
/// - bo góc, màu nền, shadow
/// 
/// Tham số:
/// - [builder]: callback để xây dựng nội dung scrollable, nhận `BuildContext` và `ScrollController`.
/// - [initialChildSize]: kích thước ban đầu khi sheet hiển thị (0.0 - 1.0, mặc định 0.2).
/// - [minChildSize]: kích thước tối thiểu khi kéo xuống (0.0 - 1.0, mặc định 0.12).
/// - [maxChildSize]: kích thước tối đa khi kéo lên (0.0 - 1.0, mặc định 0.85).
/// - [snap]: bật/tắt chế độ snap khi kéo (mặc định false).
/// - [showHandle]: hiển thị thanh kéo nhỏ ở đầu sheet (mặc định true).
/// - [header]: widget header tuỳ chỉnh hiển thị trên nội dung scrollable.
/// - [backgroundColor]: màu nền của sheet (mặc định Colors.white).
/// - [topRadius]: bo góc ở phía trên của sheet (mặc định `Radius.circular(16)`).
///
/// Ví dụ sử dụng:
/// ```dart
/// ReusableDraggableSheet(
///   initialChildSize: 0.3,
///   maxChildSize: 0.8,
///   header: Text("Header"),
///   builder: (context, scrollController) {
///     return ListView.builder(
///       controller: scrollController,
///       itemCount: 20,
///       itemBuilder: (context, index) => ListTile(title: Text("Item $index")),
///     );
///   },
/// )
/// ```
class ReusableDraggableSheet extends StatelessWidget {
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;
  final bool snap;
  final bool showHandle;
  final Widget? header;
  final Color backgroundColor;
  final Radius topRadius;
  final SheetContentBuilder builder;

  const ReusableDraggableSheet({
    super.key,
    required this.builder,
    this.initialChildSize = 0.8,
    this.minChildSize = 0.12,
    this.maxChildSize = 0.85,
    this.snap = false,
    this.showHandle = true,
    this.header,
    this.backgroundColor = Colors.white,
    this.topRadius = const Radius.circular(20),
  })  : assert(minChildSize >= 0 && minChildSize <= 1),
        assert(initialChildSize >= 0 && initialChildSize <= 1),
        assert(maxChildSize >= 0 && maxChildSize <= 1);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      snap: snap,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.vertical(top: topRadius),
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 8, spreadRadius: 1),
            ],
          ),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showHandle)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 6),
                    child: Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                if (header != null)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: header,
                  ),
                if (header != null) const Divider(height: 1),
                Expanded(child: builder(context, scrollController)),
              ],
            ),
          ),
        );
      },
    );
  }
}

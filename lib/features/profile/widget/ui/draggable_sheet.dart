import 'package:flutter/material.dart';
typedef SheetContentBuilder = Widget Function(BuildContext context, ScrollController scrollController);

/// Reusable `DraggableScrollableSheet` component.
/// 
/// Đây là một sheet kéo được (draggable) với các tuỳ chọn như:
/// - hiển thị handle (thanh kéo) ở đầu sheet
/// - header tuỳ chỉnh
/// - bo góc, màu nền, shadow
/// - callback theo dõi thay đổi extent
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
/// - [onExtentChanged]: callback được gọi khi extent của sheet thay đổi.
/// - [controller]: DraggableScrollableController để điều khiển sheet.
///
/// Ví dụ sử dụng:
/// ```dart
/// ReusableDraggableSheet(
///   initialChildSize: 0.3,
///   maxChildSize: 0.8,
///   header: Text("Header"),
///   onExtentChanged: (extent) => print('Extent: $extent'),
///   builder: (context, scrollController) {
///     return ListView.builder(
///       controller: scrollController,
///       itemCount: 20,
///       itemBuilder: (context, index) => ListTile(title: Text("Item $index")),
///     );
///   },
/// )
/// ```
class ReusableDraggableSheet extends StatefulWidget {
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;
  final bool snap;
  final bool showHandle;
  final Widget? header;
  final Color backgroundColor;
  final Radius topRadius;
  final SheetContentBuilder builder;
  final ValueChanged<double>? onExtentChanged;
  final DraggableScrollableController? controller;

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
    this.onExtentChanged,
    this.controller,
  })  : assert(minChildSize >= 0 && minChildSize <= 1),
        assert(initialChildSize >= 0 && initialChildSize <= 1),
        assert(maxChildSize >= 0 && maxChildSize <= 1);

  @override
  State<ReusableDraggableSheet> createState() => _ReusableDraggableSheetState();
}

class _ReusableDraggableSheetState extends State<ReusableDraggableSheet> {
  late DraggableScrollableController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? DraggableScrollableController();
    _controller.addListener(_onExtentChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onExtentChanged);
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _onExtentChanged() {
    widget.onExtentChanged?.call(_controller.size);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: _controller,
      initialChildSize: widget.initialChildSize,
      minChildSize: widget.minChildSize,
      maxChildSize: widget.maxChildSize,
      snap: widget.snap,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.vertical(top: widget.topRadius),
            // boxShadow: const [
            //   BoxShadow(color: Colors.black26, blurRadius: 8, spreadRadius: 1),
            // ],
          ),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // if (widget.showHandle)
                //   Padding(
                //     padding: const EdgeInsets.only(top: 8.0, bottom: 6),
                //     child: Container(
                //       width: 40,
                //       height: 5,
                //       decoration: BoxDecoration(
                //         color: Colors.grey[300],
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //     ),
                //   ),
                if (widget.header != null)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: widget.header,
                  ),
                if (widget.header != null) const Divider(height: 1),
                Expanded(child: widget.builder(context, scrollController)),
              ],
            ),
          ),
        );
      },
    );
  }
}

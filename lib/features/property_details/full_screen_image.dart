import 'package:flutter/material.dart';
import 'package:manzel/core/constant/screen_size.dart';

class FullScreenViewer extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const FullScreenViewer({
    required this.images,
    required this.initialIndex,
    Key? key,
  }) : super(key: key);

  @override
  State<FullScreenViewer> createState() => _FullScreenViewerState();
}

class _FullScreenViewerState extends State<FullScreenViewer> {
  late final PageController _controller;
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _controller = PageController(initialPage: widget.initialIndex);

    // متابعة التمرير لتحديث currentIndex
    _controller.addListener(() {
      final page = _controller.page?.round();
      if (page != null && page != currentIndex) {
        setState(() {
          currentIndex = page;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return Center(
                  child: InteractiveViewer(
                    panEnabled: true,
                    minScale: 1.0,
                    maxScale: 4.0,
                    child: Image.asset(
                      widget.images[index],
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),

            // زر الإغلاق
            Positioned(
              top: 10,
              left: 10,
              child: CircleAvatar(
                backgroundColor: Colors.black54,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),

            // ✅ القائمة الجانبية للصور المصغرة مع التحديد والضغط للتغيير
            Positioned(
              bottom: 16,
              child: SizedBox(
                height: 100,
                width: screenWidth(context),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.images.length,
                    itemBuilder: (context, index) {
                      final isSelected = index == currentIndex;
                      return GestureDetector(
                        onTap: () {
                          _controller.jumpToPage(index);
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            border: isSelected
                                ? Border.all(color: Colors.green, width: 2)
                                : null,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                              widget.images[index],
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: 5,) ;},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

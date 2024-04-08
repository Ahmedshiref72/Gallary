import 'package:flutter/material.dart';
import '../../../../shared/resources/values_manager.dart';
import 'image_full_screen.dart';

class GridViewComponent extends StatelessWidget {
  GridViewComponent({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        mainAxisSpacing: AppPadding.p15,
        crossAxisSpacing: AppPadding.p15,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 3,
        children: List.generate(images.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ImageFullScreen(images: images, initialIndex: index),
              ));
            },
            child: Center(
              child: SizedBox(
                width: mediaQueryWidth(context) / AppSize.s1_5,
                height: mediaQueryHeight(context) / AppSize.s8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.s30),
                  child: Image.network(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}


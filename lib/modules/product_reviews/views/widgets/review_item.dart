import 'package:flutter/material.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:inspireui/inspireui.dart';

import '../../../../common/config.dart';
import '../../../../common/extensions/extensions.dart';
import '../../../../common/tools/image_resize.dart';
import '../../../../widgets/common/star_rating.dart';

const _kMaxImage = 3;

class ReviewItem extends StatelessWidget {
  const ReviewItem({
    super.key,
    required this.name,
    required this.showRatingStar,
    required this.rating,
    required this.date,
    required this.avatar,
    required this.title,
    required this.content,
    required this.images,
    this.verified = false,
    this.showAllImages = false,
  });

  final String name;
  final bool showRatingStar;
  final double rating;
  final List<String>? images;
  final String avatar;
  final String date;
  final String title;
  final String content;
  final bool verified;
  final bool showAllImages;

  List<String> get imagesUrls => images ?? <String>[];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.0,
        children: [
          Row(
            spacing: 10.0,
            children: [
              if (avatar.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: FluxImage(
                    imageUrl: avatar,
                    errorWidget: const Icon(Icons.account_circle, size: 30),
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              Text(
                name,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (verified)
                const Icon(Icons.verified, size: 15.0, color: Colors.green),
              if (showRatingStar)
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: SmoothStarRating(
                      allowHalfRating: true,
                      starCount: 5,
                      rating: rating,
                      size: 14.0,
                      borderColor: kRatingColor.borderStar,
                      spacing: 0.0,
                    ),
                  ),
                ),
            ],
          ),
          if (title.isNotEmpty)
            HtmlWidget(
              title,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          if (content.isNotEmpty) HtmlWidget(content),
          if (imagesUrls.isNotEmpty)
            Builder(
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Builder(
                    builder: (context) {
                      if (showAllImages) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 8.0,
                                mainAxisSpacing: 8.0,
                              ),
                          itemCount: imagesUrls.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => context.openImageGallery(
                                isDialog: true,
                                images: imagesUrls,
                                index: index,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: ImageResize(
                                  url: imagesUrls[index],
                                  fit: BoxFit.cover,
                                  isResize: true,
                                  size: kSize.small,
                                ),
                              ),
                            );
                          },
                        );
                      }

                      return SizedBox(
                        height: 120,
                        child: Stack(
                          children: [
                            Builder(
                              builder: (context) {
                                final firstMaxImages = imagesUrls
                                    .take(_kMaxImage)
                                    .toList();
                                return FlexSeparated.rowBuilder(
                                  itemCount: firstMaxImages.length,
                                  addExpanded: true,
                                  itemBuilder: (index) {
                                    return InkWell(
                                      onTap: () => context.openImageGallery(
                                        isDialog: true,
                                        images: imagesUrls,
                                        index: index,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                        child: FluxImage(
                                          imageUrl: firstMaxImages[index],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                  separationSize: 8.0,
                                );
                              },
                            ),
                            if (imagesUrls.length > _kMaxImage)
                              Positioned.directional(
                                textDirection: Directionality.of(context),
                                bottom: 8,
                                end: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                    vertical: 4.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withValueOpacity(0.7),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        size: 18,
                                        Icons.image,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        '+${imagesUrls.length - 3}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          Text(date, style: Theme.of(context).textTheme.labelSmall!),
        ],
      ),
    );
  }
}

class ReviewItemSkeleton extends StatelessWidget {
  const ReviewItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Skeleton(width: 150, height: 18),
        const SizedBox(height: 2.0),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Skeleton(width: 70, height: 15),
            Align(
              alignment: Alignment.bottomRight,
              child: Skeleton(width: 70, height: 15),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        const Skeleton(width: double.infinity, height: 100),
        Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Builder(
                builder: (context) {
                  return SizedBox(
                    height: 120,
                    child: Stack(
                      children: [
                        Builder(
                          builder: (context) {
                            return FlexSeparated.rowBuilder(
                              itemCount: _kMaxImage,
                              addExpanded: true,
                              itemBuilder: (index) {
                                return InkWell(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: const Skeleton(
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                );
                              },
                              separationSize: 8.0,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

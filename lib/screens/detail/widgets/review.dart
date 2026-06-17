import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:flux_ui/flux_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../common/config.dart';
import '../../../common/constants.dart';
import '../../../common/tools.dart';
import '../../../models/entities/review_payload.dart';
import '../../../models/index.dart' show Review, UserModel;
import '../../../services/index.dart';
import '../../../services/review_manager.dart';
import '../../../widgets/common/star_rating.dart';
import '../../../widgets/common/xfile_image_widget.dart';
import '../../base_screen.dart';

class Reviews extends StatefulWidget {
  final String? productId;
  final bool allowRating;
  final bool showYourRatingOnly;

  const Reviews(
    this.productId, {
    this.allowRating = true,
    this.showYourRatingOnly = false,
  });

  @override
  BaseScreen<Reviews> createState() => _StateReviews();
}

class _StateReviews extends BaseScreen<Reviews> {
  final services = Services();
  double rating = 0.0;
  final comment = TextEditingController();
  final title = TextEditingController();
  List<Review>? reviews;
  bool _isSending = false;
  List<XFile> _images = [];

  int get _maxPhoto => ReviewManager.instance.maxImage;

  bool get _allowImageReview =>
      ReviewManager.instance.enableReviewImage &&
      ServerConfig().isReviewImageSupported;

  /// Review title is supported on Shopify and ListPro.
  /// Required only for ListPro.
  bool get isReviewTitleSupported => ServerConfig().isReviewTitleSupported;
  bool get isReviewTitleRequired => ServerConfig().isListProType;

  @override
  void afterFirstLayout(BuildContext context) {
    getListReviews(context);
  }

  @override
  void dispose() {
    comment.dispose();
    title.dispose();
    super.dispose();
  }

  Future<void> _chooseImages() async {
    try {
      var limit = _maxPhoto - _images.length;
      if (limit < 1) {
        limit = 1;
      }
      final images = await ImageTools.pickMultiImage(limit: limit);
      _images = [..._images, ...images];
    } catch (e) {
      _images = [];
    }
    setState(() {});
  }

  void _onRemoveItem(int index) {
    final images = _images;
    images.removeAt(index);
    setState(() {
      _images = images;
    });
  }

  void updateRating(double index) {
    setState(() {
      rating = index;
    });
  }

  void _showMessage(String message) {
    Tools.showSnackBar(ScaffoldMessenger.of(context), message);
  }

  Future<void> sendReview() async {
    if (rating == 0.0) {
      _showMessage(S.of(context).ratingFirst);
      return;
    }
    if (comment.text.isEmpty) {
      _showMessage(S.of(context).commentFirst);
      return;
    }
    if (title.text.isEmpty && isReviewTitleRequired) {
      _showMessage(S.of(context).titleFirst);
      return;
    }
    final user = Provider.of<UserModel>(context, listen: false).user!;
    _isSending = true;
    setState(() {});
    // var data = {
    //   'review': comment.text,
    //   'reviewer': user.user!.name,
    //   'reviewer_email': user.user!.email,
    //   'rating': rating,
    //   'status': kAdvanceConfig.enableApprovedReview ? 'approved' : 'hold'
    // };
    String? image;
    if (_images.isNotEmpty) {
      var preparedImages =
          await ImageTools.compressAndConvertImagesForUploading(_images);
      image = preparedImages;
    }
    final reviewPayload = ReviewPayload(
      productId: widget.productId!,
      reviewerName: user.fullName,
      review: comment.text,
      reviewerEmail: user.email,
      rating: rating.toInt(),
      status: kAdvanceConfig.enableApprovedReview ? 'approved' : 'hold',
      image: image,
      shopDomain: ReviewManager.instance.judgeDomain,
      token: user.cookie,
      title: title.text,
    );
    try {
      await ReviewManager.instance.createReview(reviewPayload);

      _showMessage(
        (kAdvanceConfig.enableApprovedReview)
            ? S.of(context).reviewSent
            : S.of(context).reviewPendingApproval,
      );
      getListReviews(context);
      setState(() {
        rating = 0.0;
        comment.text = '';
        title.text = '';
        _isSending = false;
        _images.clear();
      });
    } catch (e) {
      setState(() {
        _isSending = false;
      });
      _showMessage(e.toString());
    }
  }

  void getListReviews(BuildContext context) {
    final userModel = Provider.of<UserModel>(context, listen: false);
    final productId = widget.productId;
    if (productId == null) return;

    ReviewManager.instance.getReviews(productId).then((onValue) {
      final reviewList = onValue.data;

      if (userModel.loggedIn && widget.showYourRatingOnly) {
        final userEmail = userModel.user!.email;
        reviewList?.retainWhere((element) => element.email == userEmail);
      }
      if (mounted) {
        setState(() {
          reviews = reviewList ?? [];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserModel>(context);
    final isRatingAllowed = (userModel.loggedIn) && (widget.allowRating);
    final isListingType = ServerConfig().isListingType;
    final theme = Theme.of(context);

    return IgnorePointer(
      ignoring: _isSending,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 4),
          if (reviews == null)
            SizedBox(height: 80, child: kLoadingWidget(context))
          else if (reviews!.isEmpty)
            widget.showYourRatingOnly
                ? const SizedBox()
                : SizedBox(
                    height: 80,
                    child: Center(child: Text(S.of(context).noReviews)),
                  )
          else
            Column(
              children: <Widget>[
                for (var i = 0; i < reviews!.length; i++)
                  _renderItem(context, reviews![i]),
              ],
            ),
          const SizedBox(height: 20),
          if (isRatingAllowed) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    S.of(context).yourRating,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SmoothStarRating(
                  label: const Text(''),
                  allowHalfRating: true,
                  onRatingChanged: updateRating,
                  starCount: 5,
                  rating: rating,
                  size: 28.0,
                  color: theme.primaryColor,
                  borderColor: theme.primaryColor,
                  spacing: 0.0,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsetsDirectional.symmetric(vertical: 15.0),
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 15.0,
                vertical: 5.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isReviewTitleSupported)
                    TextField(
                      controller: title,
                      maxLines: 2,
                      minLines: 1,
                      decoration: InputDecoration(
                        labelText: isReviewTitleRequired
                            ? S.of(context).writeTitle
                            : S.of(context).writeTitleOptional,
                      ),
                    ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: comment,
                          maxLines: 3,
                          minLines: 1,
                          decoration: InputDecoration(
                            labelText: S.of(context).writeComment,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (_images.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                            _images.length,
                            (index) => Container(
                              margin: const EdgeInsets.only(right: 10.0),
                              width: 100,
                              height: 100,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Stack(
                                  children: [
                                    XFileImageWidget(
                                      image: _images[index],
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional.topEnd,
                                      child: InkWell(
                                        onTap: () => _onRemoveItem(index),
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          margin: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            color: theme.colorScheme.surface,
                                          ),
                                          child: Icon(
                                            Icons.close,
                                            color: theme
                                                .colorScheme
                                                .inverseSurface,
                                            size: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (_allowImageReview && _images.length < _maxPhoto)
                          Column(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.camera_alt),
                                tooltip: '${_images.length}/$_maxPhoto',
                                onPressed: _chooseImages,
                              ),
                            ],
                          ),
                        Container(
                          height: 32.0,
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Center(
                            child: _isSending
                                ? SizedBox(
                                    width: 20.0,
                                    height: 20.0,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 1.0,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        theme
                                            .primaryColor
                                            .getColorBasedOnBackground,
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: sendReview,
                                    child: Text(
                                      S.of(context).send,
                                      style: theme.textTheme.labelLarge!
                                          .copyWith(
                                            color: theme
                                                .primaryColor
                                                .getColorBasedOnBackground,
                                          ),
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ] else if (isListingType && !userModel.loggedIn)
            Container(
              constraints: const BoxConstraints(minHeight: 32, maxHeight: 64),
              height: 50.0,
              child: RawMaterialButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(RouteList.login),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                elevation: 0,
                fillColor: theme.primaryColorLight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      S.of(context).loginToReview,
                      style: TextStyle(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _renderItem(BuildContext context, Review review) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(20),
        borderRadius: BorderRadius.circular(2.0),
      ),
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.0,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 10.0,
              children: <Widget>[
                if (review.avatar?.isNotEmpty ?? false)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: FluxImage(
                      imageUrl: review.avatar!,
                      errorWidget: const Icon(Icons.account_circle, size: 30),
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                if (review.name != null)
                  Expanded(
                    child: Text(
                      review.name!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                SmoothStarRating(
                  label: const Text(''),
                  allowHalfRating: false,
                  starCount: 5,
                  rating: review.rating,
                  size: 12.0,
                  color: theme.primaryColor,
                  borderColor: theme.primaryColor,
                  spacing: 0.0,
                ),
              ],
            ),
            if (isReviewTitleSupported && (review.title?.isNotEmpty ?? false))
              HtmlWidget(
                review.title!,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
            if (review.review?.isNotEmpty ?? false) HtmlWidget(review.review!),
            if (review.images.isNotEmpty)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    review.images.length,
                    (i) => InkWell(
                      onTap: () => context.openImageGallery(
                        isDialog: true,
                        images: review.images,
                        index: i,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: ImageResize(
                          url: review.images[i],
                          fit: BoxFit.cover,
                          height: 80.0,
                          width: 80.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            Text(
              review.createdAt.timeAgo(),
              style: const TextStyle(color: kGrey400, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}

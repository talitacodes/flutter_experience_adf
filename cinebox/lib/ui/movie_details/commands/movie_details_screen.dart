import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:cinebox/ui/movie_details/widgets/cast_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailsScreen extends ConsumerStatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends ConsumerState<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Filme"),
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 24,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 278,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CachedNetworkImage(
                      imageUrl: "",
                      placeholder: (context, url) {
                        return Container(
                          width: 160,
                          color: AppColors.lightGrey,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    "data",
                    style: AppTextStyles.titleLarge,
                  ),
                  RatingStars(
                    starCount: 5,
                    starColor: AppColors.yellow,
                    starSize: 14,
                    valueLabelVisibility: false,
                    value: 2.9,
                  ),
                  Text(
                    "data",
                    style: AppTextStyles.lightGreyRegular,
                  ),
                  Text(
                    "data",
                    style: AppTextStyles.regularSmall,
                  ),
                  Text(
                    "data",
                    style: AppTextStyles.titleLarge,
                  ),
                  CastBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

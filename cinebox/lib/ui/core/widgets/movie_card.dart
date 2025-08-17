import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieCard extends ConsumerStatefulWidget {
  final int id;
  final String title;
  final int year;
  final String imageUrl;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;
  const MovieCard({
    required this.id,
    required this.title,
    required this.year,
    required this.imageUrl,
    required this.isFavorite,
    this.onFavoriteTap,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovieCardState();
}

class _MovieCardState extends ConsumerState<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 140,
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                width: 148,
                height: 184,
                imageUrl: widget.imageUrl,
                imageBuilder: (context, imageProviver) {
                  return Container(
                    width: 148,
                    height: 184,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: imageProviver,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },

                errorWidget: (context, url, error) {
                  return Container(
                    width: 148,
                    height: 184,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey,
                    ),
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  );
                },
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
              ),
              SizedBox(height: 20),
              Text(
                widget.title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '${widget.year}',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightGrey,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 50,
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(30),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  size: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

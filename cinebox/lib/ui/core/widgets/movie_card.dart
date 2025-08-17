import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinebox/ui/core/commands/favorite_movie_command.dart';
import 'package:cinebox/ui/core/commands/remove_favorite_movie_command.dart';
import 'package:cinebox/ui/core/commands/save_favorite_movie_command.dart';
import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/widgets/loader_messages.dart';
import 'package:cinebox/ui/core/widgets/movie_card_view_model.dart';
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

class _MovieCardState extends ConsumerState<MovieCard> with LoaderAndMessage {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(favoriteMovieCommandProvider(widget.id).notifier)
          .setFavorite(widget.isFavorite);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isFavorite = ref.watch(favoriteMovieCommandProvider(widget.id));

    ref.listen(
      saveFavoriteMovieCommandProvider(widget.key!, widget.id),
      (_, next) {
        next.whenOrNull(
          error: (error, stackTrace) {
            showErrorSnackBar(
              "Desculpe não foi possível adicionar o filme aos favoritos",
            );
          },
        );
      },
    );

    ref.listen(
      removeFavoriteMovieCommandProvider(widget.key!, widget.id),
      (_, next) {
        next.whenOrNull(
          error: (error, stackTrace) {
            showErrorSnackBar(
              "Desculpe não foi possível remover o filme dos favoritos",
            );
          },
        );
      },
    );
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/movie_details', arguments: widget.id);
      },
      child: Stack(
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
                  onPressed:
                      widget.onFavoriteTap ??
                      () {
                        ref
                            .read(
                              movieCardViewModelProvider(
                                widget.key!,
                                widget.id,
                              ).notifier,
                            )
                            .addOrRemoveFavorite(
                              id: widget.id,
                              title: widget.title,
                              posterPath: widget.imageUrl,
                              year: widget.year,
                              favorite: !isFavorite,
                            );
                      },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite
                        ? AppColors.redColor
                        : AppColors.lightGrey,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final int sharedViews;
  final VoidCallback onViewsTap;

  const MovieCard({
    super.key,
    required this.movie,
    required this.sharedViews,
    required this.onViewsTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isList = constraints.maxWidth > 300;

        return Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.12),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: isList
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(width: 135, child: _buildPoster()),
                    Expanded(child: _buildDetails(context)),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: _buildPoster()),
                    _buildDetails(context),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildPoster() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          movie.image,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const ColoredBox(
            color: Color(0xFF24213A),
            child: Center(
              child: Icon(Icons.movie, color: Colors.white54, size: 42),
            ),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '★ ${movie.rating}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.black.withValues(alpha: 0.42),
            child: const Icon(
              Icons.bookmark_border_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          child: Container(
            padding: const EdgeInsets.all(6),
            color: Colors.black54,
            child: Text(
              '${movie.year}',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            movie.genre,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: onViewsTap,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                '$sharedViews views',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:io';

import 'package:field_colector/domain/entities/photo.dart';
import 'package:field_colector/features/records/widgets/sync_badge.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:field_colector/features/utilities/widgets/detail_section_title.dart';
import 'package:flutter/material.dart';

class RecordPhotosSection extends StatelessWidget {
  const RecordPhotosSection({super.key, required this.photos});

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    if (photos.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DetailSectionTitle('Fotos (${photos.length})'),
        const SizedBox(height: 8),
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: photos.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, i) {
              final photo = photos[i];
              return GestureDetector(
                onTap: () => _openViewer(context, i),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: _PhotoThumbnail(photo: photo),
                      ),
                    ),
                    Positioned(
                      left: 4,
                      bottom: 4,
                      child: SyncBadge(status: photo.syncStatus),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _openViewer(BuildContext context, int initialIndex) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => _PhotoFullscreenViewer(
          photos: photos,
          initialIndex: initialIndex,
        ),
      ),
    );
  }
}

class _PhotoThumbnail extends StatelessWidget {
  const _PhotoThumbnail({required this.photo});

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    final path = photo.localPath.trim();
    final file = path.isNotEmpty ? File(path) : null;
    if (file != null && file.existsSync()) {
      return Image.file(
        file,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _placeholder(photo),
      );
    }

    final url = photo.storageUrl.trim();
    if (url.isNotEmpty) {
      return Image.network(
        url,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return const Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        },
        errorBuilder: (_, __, ___) => _placeholder(photo),
      );
    }

    return _placeholder(photo);
  }

  Widget _placeholder(Photo photo) {
    return ColoredBox(
      color: AppColors.primary.withValues(alpha: 0.08),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            photo.filename.isNotEmpty ? photo.filename : photo.photoType,
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}

class _PhotoFullscreenViewer extends StatefulWidget {
  const _PhotoFullscreenViewer({
    required this.photos,
    required this.initialIndex,
  });

  final List<Photo> photos;
  final int initialIndex;

  @override
  State<_PhotoFullscreenViewer> createState() => _PhotoFullscreenViewerState();
}

class _PhotoFullscreenViewerState extends State<_PhotoFullscreenViewer> {
  late final PageController _controller;
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex;
    _controller = PageController(initialPage: widget.initialIndex);
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
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text('Foto ${_index + 1} / ${widget.photos.length}'),
      ),
      body: PageView.builder(
        controller: _controller,
        itemCount: widget.photos.length,
        onPageChanged: (i) => setState(() => _index = i),
        itemBuilder: (context, i) {
          final photo = widget.photos[i];
          return Center(
            child: InteractiveViewer(
              child: _PhotoThumbnail(photo: photo),
            ),
          );
        },
      ),
    );
  }
}

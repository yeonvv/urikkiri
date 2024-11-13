import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:urikkiri_beta/core/constants/animation_constants.dart';
import 'package:urikkiri_beta/core/constants/sizes.dart';
import 'package:urikkiri_beta/features/category/presentation/widgets/indicator_background.dart';
import 'package:video_player/video_player.dart';

class MediaContainer extends StatefulWidget {
  final bool isImage;
  final String mediaUrl;

  const MediaContainer({
    super.key,
    required this.isImage,
    required this.mediaUrl,
  });

  @override
  State<MediaContainer> createState() => _MediaContainerState();
}

class _MediaContainerState extends State<MediaContainer>
    with SingleTickerProviderStateMixin {
  VideoPlayerController? _videoPlayerController;
  late final AnimationController _animationController;
  bool _isVideoAvailable = false;

  bool _isVideoError = false;
  bool _isPlaying = false;
  bool _isMuted = true;

  void _initializeVideo() {
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.mediaUrl))
          ..initialize().then((_) {
            setState(() => _isVideoAvailable = true);
            _videoPlayerController!.setVolume(0);

            _videoPlayerController!.addListener(() {
              if (_videoPlayerController!.value.position ==
                  _videoPlayerController!.value.duration) {
                _videoPlayerController?.seekTo(Duration.zero);
                setState(() {
                  _isPlaying = false;
                  _animationController.reverse();
                });
              }
            });
          }).catchError((error) {
            setState(() => _isVideoError = true);
          });
  }

  @override
  void initState() {
    super.initState();

    if (!widget.isImage && widget.mediaUrl.isNotEmpty) {
      _initializeVideo();
    }

    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.0,
      duration: buttonAnimationDuration,
    );
  }

  void _togglePlayPause() {
    if (_isVideoAvailable && !widget.isImage) {
      if (_videoPlayerController!.value.isPlaying) {
        _videoPlayerController!.pause();
        _animationController.reverse();
      } else {
        _videoPlayerController!.play();
        _animationController.forward();
      }
      setState(() => _isPlaying = !_isPlaying);
    }
  }

  Positioned _playButton() {
    return Positioned.fill(
      child: IgnorePointer(
        child: Center(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.scale(
                scale: _animationController.value,
                child: AnimatedOpacity(
                  opacity: _isPlaying ? 0 : 1,
                  duration: buttonAnimationDuration,
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    width: 40,
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).primaryColorDark.withOpacity(0.9),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.play,
                        size: Sizes.size20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showFullScreen() {
    showDialog(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Scaffold(
            backgroundColor: Theme.of(context).primaryColorDark,
            body: Center(
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: widget.isImage ? () {} : _togglePlayPause,
                    child: widget.isImage
                        ? Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: InteractiveViewer(
                              child: Image.network(
                                widget.mediaUrl,
                                fit: BoxFit.contain,
                              ),
                            ),
                          )
                        : AspectRatio(
                            aspectRatio:
                                _videoPlayerController!.value.aspectRatio,
                            child: VideoPlayer(_videoPlayerController!),
                          ),
                  ),
                  Positioned(
                    top: Sizes.size10,
                    right: Sizes.size10,
                    child: IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.xmark,
                        size: Sizes.size24,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  if (!widget.isImage) _playButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _toggleMute() {
    if (_isVideoAvailable) {
      setState(() {
        _isMuted = !_isMuted;
        _videoPlayerController!.setVolume(_isMuted ? 0.0 : 1.0);
      });
    }
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isImage ? _showFullScreen : null,
      child: Padding(
        padding: EdgeInsets.only(bottom: widget.isImage ? 0 : Sizes.size20),
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: !widget.isImage ? 16 / 9 : 1,
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(Sizes.size8),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      width: constraints.maxWidth,
                      height: constraints.maxWidth,
                      alignment: Alignment.center,
                      child: widget.isImage
                          ? Image.network(
                              widget.mediaUrl,
                              fit: BoxFit.cover,
                              width: constraints.minWidth,
                              height: constraints.minHeight,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return const IndicatorBackground(
                                    isImage: true,
                                    isLoading: true,
                                  );
                                }
                              },
                              errorBuilder: (context, error, stackTrace) {
                                return IndicatorBackground(
                                  isImage: true,
                                  isError:
                                      widget.mediaUrl.isEmpty ? false : true,
                                );
                              },
                            )
                          : _isVideoAvailable
                              ? FittedBox(
                                  fit: BoxFit.fitHeight,
                                  child: GestureDetector(
                                    onTap: _togglePlayPause,
                                    child: SizedBox(
                                      width: _videoPlayerController!
                                          .value.size.width,
                                      height: _videoPlayerController!
                                          .value.size.height,
                                      child:
                                          VideoPlayer(_videoPlayerController!),
                                    ),
                                  ),
                                )
                              : IndicatorBackground(
                                  isImage: false,
                                  isLoading:
                                      widget.mediaUrl.isEmpty ? false : true,
                                  isError: _isVideoError,
                                ),
                    );
                  },
                ),
              ),
            ),
            if (!widget.isImage && !_isVideoError && _isVideoAvailable)
              _playButton(),
            if (!widget.isImage &&
                !_isPlaying &&
                !_isVideoError &&
                _isVideoAvailable)
              Positioned(
                bottom: Sizes.size10,
                right: Sizes.size10,
                child: GestureDetector(
                  onTap: _showFullScreen,
                  child: Container(
                    padding: const EdgeInsets.all(Sizes.size8),
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).primaryColorDark.withOpacity(0.7),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(Sizes.size5),
                      ),
                    ),
                    child: FaIcon(
                      FontAwesomeIcons.upRightAndDownLeftFromCenter,
                      size: Sizes.size14,
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                ),
              ),
            if (!widget.isImage &&
                !_isPlaying &&
                !_isVideoError &&
                _isVideoAvailable)
              Positioned(
                bottom: Sizes.size10,
                left: Sizes.size10,
                child: GestureDetector(
                  onTap: _toggleMute,
                  child: Container(
                    padding: const EdgeInsets.all(Sizes.size8),
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).primaryColorDark.withOpacity(0.7),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(Sizes.size5),
                      ),
                    ),
                    child: FaIcon(
                      _isMuted
                          ? FontAwesomeIcons.volumeXmark
                          : FontAwesomeIcons.volumeHigh,
                      size: Sizes.size14,
                      color: Theme.of(context).disabledColor,
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

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux_localization/flux_localization.dart';
import 'package:inspireui/inspireui.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../common/config.dart' show kLoadingWidget;
import '../../../common/config/models/video_config.dart';
import '../../../common/constants.dart';
import '../../../common/extensions/string_ext.dart';
import '../../../common/theme/index.dart';
import '../../../routes/flux_navigate.dart';
import '../../../screens/detail/widgets/video_placeholder.dart';

class FeatureVideoPlayer extends StatefulWidget {
  /// Video source
  final String url;

  /// Common video config
  final VideoConfig videoConfig;

  /// Initial video state
  final bool isPlaying;
  final Duration? startAt;
  final bool isFullScreen;
  final FeatureVideoController? controller;

  /// Callbacks
  final ValueChanged<int?>? durationCallback;
  final VoidCallback? onStart;
  final VoidCallback? onEnd;
  final Function(dynamic error, dynamic stacktrace)? onError;

  const FeatureVideoPlayer(
    this.url, {
    Key? key,
    this.videoConfig = const VideoConfig(),
    this.isPlaying = false,
    this.startAt,
    this.controller,
    this.durationCallback,
    this.onStart,
    this.onEnd,
    this.onError,
  }) : isFullScreen = false;

  const FeatureVideoPlayer.fullScreen(
    this.url, {
    Key? key,
    this.videoConfig = const VideoConfig(),
    this.isPlaying = false,
    this.startAt,
    this.controller,
    this.durationCallback,
    this.onStart,
    this.onEnd,
    this.onError,
  }) : isFullScreen = true;

  static FeatureVideoPlayer? fromHtmlYoutubeIframe({required Map attributes}) {
    final src = attributes['src'] ?? attributes['data-src'];
    if (src != null && src.isNotEmpty) {
      final uri = Uri.tryParse(src);
      final host = uri?.host.toLowerCase() ?? '';
      final isYouTubeHost =
          host.contains('youtube.com') || host.contains('youtu.be');

      if (!isYouTubeHost) {
        // Only handle YouTube iframes here; let others fall back.
        return null;
      }

      return FeatureVideoPlayer(
        src,
        videoConfig: const VideoConfig(autoPlay: false, isSoundOn: true),
      );
    }
    return null;
  }

  @override
  State<FeatureVideoPlayer> createState() => _FeatureVideoPlayerState();
}

class _FeatureVideoPlayerState extends State<FeatureVideoPlayer>
    with WidgetsBindingObserver {
  VideoConfig get videoConfig => widget.videoConfig;

  bool get isInitialized => _controller?.value.isInitialized ?? false;

  bool get isPlaying => _controller?.value.isPlaying ?? false;

  Duration? get videoDuration => _controller?.value.duration;

  bool get isYoutube => widget.url.isYoutubeLink();
  bool get showVideoPlaceholder => isWindows;

  VideoPlayerController? _controller;
  YoutubePlayerController? _youtubeController;

  bool initialized = false;
  double? aspectRatio;
  bool isSoundOn = false;
  int lastTap = DateTime.now().millisecondsSinceEpoch;
  bool isVideoAvailable = true;

  Timer? _timer;

  void _cancelTimer() {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
  }

  void _startTimer() {
    _cancelTimer();

    _timer = Timer(const Duration(milliseconds: 100), () async {
      if (isYoutube) {
        final playerState = await _youtubeController?.playerState;
        if (playerState == PlayerState.playing) {
          await _youtubeController?.pauseVideo();
        }
      } else {
        if (_controller?.value.isPlaying == true) {
          await _controller?.pause();
        }
      }
    });
  }

  Future<void> initVideoController() async {
    if (widget.url.startsWith('http')) {
      final uri = Uri.parse(widget.url);
      _controller = VideoPlayerController.networkUrl(uri);
    } else {
      _controller = VideoPlayerController.asset(widget.url);
    }

    await _controller
        ?.initialize()
        .then((value) {
          if (mounted) {
            // Ensure the first frame is shown after the video is initialized, even
            // before the play button has been pressed.
            setState(() {
              initialized = true;
            });
          }
        })
        .onError((error, stackTrace) {
          printError(error, stackTrace);
          widget.onError?.call(error, stackTrace);
        });
    widget.durationCallback?.call(_controller?.value.duration.inSeconds);

    // Try to set volume as soon as possible
    await _controller?.setVolume(videoConfig.isSoundOn ? 1.0 : 0.0);

    await _controller?.setLooping(videoConfig.enableLoop).then((_) {
      if (mounted) {
        setState(() {
          initialized = true;
          aspectRatio =
              videoConfig.aspectRatio ?? _controller?.value.aspectRatio;
        });
        if (videoConfig.autoPlay == true && widget.startAt == null) {
          _controller?.play();
          return;
        }
        if (widget.startAt != null && widget.isPlaying) {
          _controller?.play();
        } else {
          _controller?.pause();
        }
      }
    });
    await _controller?.seekTo(widget.startAt ?? Duration.zero);
  }

  Future _togglePlayPause() async {
    if (!showVideoPlaceholder) {
      if (isYoutube) {
        var playerState = await _youtubeController?.playerState;

        if (playerState == PlayerState.playing) {
          await _youtubeController?.pauseVideo();
        } else {
          await _youtubeController?.playVideo();
        }
      } else {
        if (_controller?.value.isPlaying == true) {
          await _controller?.pause();
        } else {
          await _controller?.play();
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    widget.controller?.togglePlayPause = _togglePlayPause;

    if (!showVideoPlaceholder) {
      if (isYoutube) {
        final videoId = YoutubePlayerController.convertUrlToId(widget.url);

        if (videoId == null) {
          isVideoAvailable = false;
          if (mounted) {
            setState(() {});
          }
          return;
        }

        _youtubeController = YoutubePlayerController.fromVideoId(
          videoId: videoId,
          autoPlay: videoConfig.autoPlay,
          params: YoutubePlayerParams(
            // Fix: https://github.com/sarbagyastha/youtube_player_flutter/issues/1112
            origin: 'https://www.youtube-nocookie.com',
            showControls: false,
            strictRelatedVideos: true,
            pointerEvents: PointerEvents.none,
            loop: videoConfig.enableLoop,
            showFullscreenButton: false,
            showVideoAnnotations: false,
            enableCaption: false,
            mute: videoConfig.isSoundOn == false,
          ),
        );

        widget.durationCallback?.call(
          _youtubeController?.metadata.duration.inSeconds,
        );
        return;
      }

      // Video player supports web version but I still disable it
      initVideoController();
      _controller?.addListener(_listener);
    }
  }

  void _listener() async {
    final currentPosition = _controller?.value.position;

    if (mounted) {
      if (isInitialized && currentPosition == Duration.zero && isPlaying) {
        widget.onStart?.call();
      }

      // Dont use `videoPlayerValue.isCompleted` because it does not update if video is looping
      if (isInitialized && currentPosition == videoDuration) {
        widget.onEnd?.call();
      }
    }
  }

  void setVolume(bool value) {
    if (mounted) {
      setState(() {
        isSoundOn = value;
      });
    }

    isSoundOn ? _controller?.setVolume(1.0) : _controller?.setVolume(0.0);
  }

  void setIsPlaying(bool status) {
    status == true ? _controller?.play() : _controller?.pause();
  }

  @override
  void dispose() {
    if (isYoutube) {
      _youtubeController?.close();
    } else {
      _controller?.removeListener(_listener);
      _controller?.dispose();
    }
    WidgetsBinding.instance.removeObserver(this);
    _cancelTimer();
    super.dispose();
  }

  void updateSystemUIOverlayStyle() {
    final isDarkTheme =
        widget.isFullScreen == true ||
        Theme.of(context).brightness == Brightness.dark;

    // If fullscreen video mode, always set light status bar
    context.updateSystemUiOverlay(isDarkTheme);
  }

  @override
  void didChangeDependencies() {
    updateSystemUIOverlayStyle();
    super.didChangeDependencies();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      updateSystemUIOverlayStyle();
    }
  }

  Widget playPauseButton(bool isPlaying) {
    return isPlaying
        ? const SizedBox.shrink()
        : Container(
            color: Colors.black26,
            child: const Center(
              child: Icon(
                CupertinoIcons.play_arrow_solid,
                color: Colors.white,
                size: 50.0,
                semanticLabel: 'Play',
              ),
            ),
          );
  }

  void updateVideoStatus() {
    if (videoConfig.holdToPlayPause == false) {
      if (isYoutube) {
        // TODO: Implement for youtube
      } else {
        _controller?.value.isPlaying == true
            ? _controller?.pause()
            : _controller?.play();
      }
    }
  }

  void onTapVolume() {
    isSoundOn = !isSoundOn;
    // If the sound button is pressed, the video widget is also pressed (change isPlaying value)
    updateVideoStatus();

    // Update state
    setVolume(isSoundOn);
  }

  void onTapFullScreen() async {
    // If fullScreen button is pressed, the video widget is also pressed (change isPlaying value)
    updateVideoStatus();

    final previousStatus = await FluxNavigate.push(
      MaterialPageRoute(
        builder: (_) => FeatureVideoPlayer.fullScreen(
          widget.url,
          videoConfig: videoConfig,
          isPlaying: _controller?.value.isPlaying == true,
          startAt: _controller?.value.position,
        ),
      ),
      context: context,
    );
    if (previousStatus != null) {
      setIsPlaying(previousStatus[0] ?? false);
      setVolume(previousStatus[2] ?? false);
      await _controller?.seekTo(previousStatus[1] ?? Duration.zero);
      updateSystemUIOverlayStyle();
    }
  }

  void onTapExitFullScreen() {
    // If the exit fullScreen button is pressed, the video widget is also pressed (change isPlaying value)
    updateVideoStatus();
    Navigator.pop(context, [
      _controller?.value.isPlaying,
      _controller?.value.position,
      isSoundOn,
    ]);
  }

  double _mathScale(Size size, double aspectRatio) {
    var maxH = 0.0;
    var maxW = 0.0;
    var minH = 0.0;
    var minW = 0.0;
    final sizeScreen = size;

    minH = sizeScreen.height;
    minW = minH * aspectRatio;
    maxW = sizeScreen.width;
    maxH = maxW / aspectRatio;

    if (minW > maxW) {
      final tempW = minW;
      minW = maxW;
      maxW = tempW;

      final tempH = minH;
      minH = maxH;
      maxH = tempH;
    }

    return maxH / minH;
  }

  @override
  Widget build(BuildContext context) {
    if (showVideoPlaceholder) {
      return const VideoPlaceholder();
    }

    if (!isVideoAvailable) {
      return VideoPlaceholder(message: S.of(context).canNotPlayVideo);
    }

    if (isYoutube == false) {
      final body = LayoutBuilder(
        builder: (_, constraints) {
          return VisibilityDetector(
            onVisibilityChanged: (VisibilityInfo info) {
              if (info.visibleFraction == 0) {
                _controller?.pause();
              } else if (videoConfig.autoPlay == true) {
                _controller?.play();
              }
            },
            key: ValueKey('mp4_player_iframe-${widget.url}'),
            child: Container(
              color:
                  videoConfig.backgroundColor ??
                  (widget.isFullScreen ? Colors.black : Colors.transparent),
              child: Center(
                child: Listener(
                  onPointerDown: (_) {
                    if (videoConfig.holdToPlayPause) {
                      _startTimer();
                    }
                  },
                  onPointerUp: (_) {
                    var now = DateTime.now().millisecondsSinceEpoch;
                    if (videoConfig.doubleTapToFullScreen) {
                      // https://api.flutter.dev/flutter/gestures/kDoubleTapTimeout-constant.html
                      if (now - lastTap < 300) {
                        _cancelTimer();
                        lastTap = now;
                        if (widget.isFullScreen) {
                          onTapExitFullScreen();
                        } else {
                          onTapFullScreen();
                        }
                        return;
                      }
                    }
                    if (videoConfig.holdToPlayPause) {
                      _cancelTimer();
                      _controller?.play();
                    }
                    if (videoConfig.tapToPlayPause) {
                      if (_controller?.value.isPlaying == true) {
                        _controller?.pause();
                      } else {
                        _controller?.play();
                      }
                    }
                    lastTap = now;
                  },
                  child: Stack(
                    children: [
                      if (isInitialized) ...[
                        Hero(
                          tag: 'video-$hashCode',
                          transitionOnUserGestures: true,
                          child: Builder(
                            builder: (context) {
                              if (_controller!.value.aspectRatio > 0.6) {
                                return Center(
                                  child: AspectRatio(
                                    aspectRatio: _controller!.value.aspectRatio,
                                    child: VideoPlayer(_controller!),
                                  ),
                                );
                              }

                              final failedLoadList = [null, double.infinity];
                              final size = MediaQuery.sizeOf(context);
                              final sizeScreen = Size(
                                failedLoadList.contains(constraints.maxWidth)
                                    ? size.width
                                    : constraints.maxWidth,
                                failedLoadList.contains(constraints.maxHeight)
                                    ? size.height
                                    : constraints.maxHeight,
                              );

                              final scaleVideo = _mathScale(
                                sizeScreen,
                                _controller!.value.aspectRatio,
                              );

                              return Center(
                                child: Transform.scale(
                                  scale: scaleVideo,
                                  child: AspectRatio(
                                    aspectRatio: _controller!.value.aspectRatio,
                                    child: VideoPlayer(_controller!),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        if (videoConfig.tapToPlayPause && _controller != null)
                          ValueListenableBuilder<VideoPlayerValue>(
                            valueListenable: _controller!,
                            builder: (context, value, child) {
                              return AnimatedSwitcher(
                                duration: const Duration(milliseconds: 50),
                                reverseDuration: const Duration(
                                  milliseconds: 200,
                                ),
                                child: playPauseButton(value.isPlaying == true),
                              );
                            },
                          ),
                        if (videoConfig.enableTimeIndicator)
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: VideoProgressIndicator(
                              _controller!,
                              allowScrubbing: true,
                            ),
                          ),
                        PositionedDirectional(
                          bottom: 0,
                          end: 0,
                          child: Row(
                            children: [
                              if (videoConfig.showVolumeButton)
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: onTapVolume,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Icon(
                                      isSoundOn
                                          ? Icons.volume_up
                                          : Icons.volume_off,
                                      color: Colors.white,
                                      size: 25.0,
                                    ),
                                  ),
                                ),
                              if (videoConfig.showFullScreenButton)
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: widget.isFullScreen
                                      ? onTapExitFullScreen
                                      : onTapFullScreen,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Icon(
                                      widget.isFullScreen
                                          ? Icons.fullscreen_exit
                                          : Icons.fullscreen,
                                      color: Colors.white,
                                      size: 25.0,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ] else if (videoConfig.showLoading)
                        Center(child: kLoadingWidget(context)),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );

      if (widget.isFullScreen) {
        return WillPopScopeWidget(
          allowExitApp: false,
          onWillPop: () async {
            context.updateSystemUiOverlay();

            return true;
          },
          child: body,
        );
      }

      return body;
    }

    if (_youtubeController == null) {
      return _LoadingWidget(backgroundColor: videoConfig.backgroundColor);
    }

    if (isMacOS) {
      // Youtube player does not work well on MacOS, so we will show placeholder instead
      return const VideoPlaceholder();
    }

    final size = MediaQuery.sizeOf(context);
    final width = size.width;

    return VisibilityDetector(
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction == 0) {
          _youtubeController?.pauseVideo();
        } else if (videoConfig.autoPlay == true) {
          _youtubeController?.playVideo();
        }
      },
      key: ValueKey('youtube_player_iframe-${widget.url}'),
      child: Listener(
        onPointerDown: (_) {
          if (videoConfig.holdToPlayPause) {
            _startTimer();
          }
        },
        onPointerUp: (_) async {
          // TODO: Implement for youtube
          // var now = DateTime.now().millisecondsSinceEpoch;
          // if (widget.doubleTapToFullScreen) {
          //   // https://api.flutter.dev/flutter/gestures/kDoubleTapTimeout-constant.html
          //   if (now - lastTap < 300) {
          //     _cancelTimer();
          //     lastTap = now;
          //     if (!widget.isFullScreen) {
          //       onTapFullScreen();
          //     } else {
          //       onTapExitFullScreen();
          //     }
          //     return;
          //   }
          // }
          if (videoConfig.holdToPlayPause) {
            _cancelTimer();
            await _youtubeController?.playVideo();
          }
          if (videoConfig.tapToPlayPause) {
            final playerState = await _youtubeController?.playerState;
            if (playerState == PlayerState.playing) {
              await _youtubeController?.pauseVideo();
            } else {
              await _youtubeController?.playVideo();
            }
          }
          // lastTap = now;
        },
        child: SizedBox(
          height: width * 0.8,
          width: width,
          child: YoutubePlayerControllerProvider(
            controller: _youtubeController!,
            child: Stack(
              children: [
                Positioned.fill(
                  child: YoutubePlayer(
                    controller: _youtubeController!,
                    aspectRatio: aspectRatio ?? 16 / 9,
                  ),
                ),
                if (videoConfig.tapToPlayPause)
                  Positioned.fill(
                    child: YoutubeValueBuilder(
                      builder: (context, value) {
                        return playPauseButton(
                          value.playerState == PlayerState.playing,
                        );
                      },
                    ),
                  ),
                if (videoConfig.enableTimeIndicator)
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: VideoPositionSeeker(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({this.backgroundColor});

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = width * 0.8;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(color: backgroundColor ?? Colors.black),
      child: Center(child: kLoadingWidget(context)),
    );
  }
}

class VideoPositionSeeker extends StatelessWidget {
  const VideoPositionSeeker({super.key});

  @override
  Widget build(BuildContext context) {
    var value = 0.0;

    return StreamBuilder<YoutubeVideoState>(
      stream: context.ytController.videoStateStream,
      initialData: const YoutubeVideoState(),
      builder: (context, snapshot) {
        final position = snapshot.data?.position.inSeconds ?? 0;
        final duration = context.ytController.metadata.duration.inSeconds;

        value = position == 0 || duration == 0 ? 0 : position / duration;

        return StatefulBuilder(
          builder: (context, setState) {
            return Slider(
              activeColor: const Color.fromRGBO(255, 0, 0, 0.7),
              value: value,
              onChanged: (positionFraction) {
                value = positionFraction;
                setState(() {});

                context.ytController.seekTo(
                  seconds: (value * duration).toDouble(),
                  allowSeekAhead: true,
                );
              },
              min: 0,
              max: 1,
            );
          },
        );
      },
    );
  }
}

class FeatureVideoController {
  Future<void> Function()? togglePlayPause;
}

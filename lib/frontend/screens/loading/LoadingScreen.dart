import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:word_game_project/backend/loading/BaseLoader.dart';
import 'package:word_game_project/frontend/ScreensManager.dart';
import 'package:word_game_project/frontend/common/Background.dart';
import 'package:word_game_project/frontend/common/BaseScreen.dart';
import 'package:word_game_project/frontend/common/BaseWidget.dart';
import 'package:word_game_project/frontend/common/Constants.dart';
import 'package:word_game_project/frontend/common/GradientText.dart';
import 'package:word_game_project/frontend/screens/ScreenState.dart';
import 'package:word_game_project/frontend/screens/loading/LoadingBar.dart';

class LoadingScreen extends BaseScreen {
  BaseWidget _background;
  BaseWidget _loadingBar;
  final BaseLoader _loader;

  GradientText _loadingPercentage;
  GradientText _loadingMsg;

  LoadingScreen(this._loader) {
    _background = new Background('screens/loading/background.jpg');
    _loadingBar = LoadingBar();

    _loadingPercentage = GradientText(
      kLoadingFontRatio,
      kLoadingLoadPerXRatio,
      kLoadingLoadPerYRatio,
      Colors.yellow,
      Colors.deepOrange,
    );

    _loadingMsg = GradientText(
      kLoadingFontRatio,
      kLoadingLoadMsgXRatio,
      kLoadingLoadMsgYRatio,
      Colors.yellow,
      Colors.deepOrange,
    );
  }
  @override
  void render(Canvas canvas) {
    _background.render(canvas);
    _loadingPercentage.render(canvas);
    _loadingBar.render(canvas);
    _loadingMsg.render(canvas);
  }

  @override
  void resize() {
    _background.resize();
    _loadingPercentage.resize();
    _loadingBar.resize();
    _loadingMsg.resize();

    _loadingMsg.setText("Loading...");
  }

  @override
  void update(double t) {
    _loader.update(t);
    _loadingPercentage.setText(_loader.getProgress().round().toString() + "%");
    _loadingBar.update(_loader.getProgress());

    if (_loader.isComplete()) {
      screensManager.setScreenState(ScreenState.MenuScreen);
    }
  }

  @override
  void onTapDown(TapDownDetails details) {
    // TODO: implement onTapDown
  }
}

import 'package:flutter/material.dart';
import 'package:spotify_app_ui/data/data.dart';

class CurrentTrackModel extends ChangeNotifier {
  Song? selected;

  void selectTrack(Song Track) {
    selected = Track;
    notifyListeners();
  }
}

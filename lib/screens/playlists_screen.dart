import 'package:flutter/material.dart';
import 'package:spotify_app_ui/data/data.dart';
import 'package:spotify_app_ui/widgets/widget.dart';

class PlayListScreen extends StatefulWidget {
  final Playlist playlist;
  const PlayListScreen({Key? key, required this.playlist}) : super(key: key);

  @override
  _PlayListScreenState createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  ScrollController? _scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 140.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                customBorder: const CircleBorder(),
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.chevron_left,
                    size: 28.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              InkWell(
                onTap: () {},
                customBorder: const CircleBorder(),
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.chevron_right,
                    size: 28.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton.icon(
              style: TextButton.styleFrom(
                  primary: Theme.of(context).iconTheme.color),
              onPressed: () {},
              icon: const Icon(
                Icons.account_circle_outlined,
                size: 30.0,
              ),
              label: const Text("Dev Buks")),
          const SizedBox(
            width: 8.0,
          ),
          IconButton(
              padding: const EdgeInsets.only(),
              onPressed: () {},
              icon: const Icon(
                Icons.keyboard_arrow_down,
                size: 30.0,
              )),
          const SizedBox(
            width: 20.0,
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [const Color(0xFFAF1018), Theme.of(context).backgroundColor],
              stops: const [0, 0.3]),
        ),
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
            controller: _scrollController,
            children: [
              PlayListHeader(
                playlist: widget.playlist,
              ),
              TrackList(track: widget.playlist.songs),
            ],
          ),
        ),
      ),
    );
  }
}

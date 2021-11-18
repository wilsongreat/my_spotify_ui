import 'package:flutter/material.dart';
import 'package:spotify_app_ui/data/data.dart';

class PlayListHeader extends StatelessWidget {
  final Playlist playlist;
  const PlayListHeader({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              playlist.imageURL,
              height: 200.0,
              width: 200.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Playlist",
                    style: Theme.of(context)
                        .textTheme
                        .overline!
                        .copyWith(fontSize: 12.0),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    playlist.name,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    playlist.description,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    "Created by ${playlist.creator} * ${playlist.songs.length},${playlist.duration}",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        _PlayListButton(followers: playlist.followers)
      ],
    );
  }
}

class _PlayListButton extends StatelessWidget {
  final String followers;
  const _PlayListButton({Key? key, required this.followers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              backgroundColor: Theme.of(context).accentColor,
              primary: Theme.of(context).iconTheme.color,
              textStyle: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(fontSize: 12.0, letterSpacing: 2.0)),
          child: const Text("Play"),
        ),
        const SizedBox(
          width: 8.0,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border),
          iconSize: 30.0,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
          iconSize: 30.0,
        ),
        const Spacer(),
        Text(
          "FOLLOWERS\n$followers",
          style: Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
          textAlign: TextAlign.right,
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:spotify_app_ui/data/data.dart';
import 'package:spotify_app_ui/models/current_track_model.dart';

class TrackList extends StatefulWidget {
  final List<Song> track;
  const TrackList({Key? key, required this.track}) : super(key: key);

  @override
  State<TrackList> createState() => _TrackListState();
}

class _TrackListState extends State<TrackList> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
        dataRowHeight: 54.0,
        headingTextStyle:
            Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
        showCheckboxColumn: false,
        columns: const [
          DataColumn(
            label: Text("TITLE"),
          ),
          DataColumn(
            label: Text("ARTISTE"),
          ),
          DataColumn(
            label: Text("ALBUM"),
          ),
          DataColumn(
            label: Icon(Icons.access_time),
          ),
        ],
        rows: widget.track.map((e) {
          final selected =
              context.watch<CurrentTrackModel>().selected?.id == e.id;
          // ignore: deprecated_member_use
          final textStyle = TextStyle(
              color: selected
                  ? Theme.of(context).accentColor
                  : Theme.of(context).iconTheme.color);
          return DataRow(
              cells: [
                DataCell(
                  Text(
                    e.title,
                    style: textStyle,
                  ),
                ),
                DataCell(
                  Text(
                    e.artist,
                    style: textStyle,
                  ),
                ),
                DataCell(
                  Text(
                    e.album,
                    style: textStyle,
                  ),
                ),
                DataCell(
                  Text(
                    e.duration,
                    style: textStyle,
                  ),
                )
              ],
              selected: selected,
              onSelectChanged: (_) =>
                  context.read<CurrentTrackModel>().selectTrack(e));
        }).toList());
  }
}

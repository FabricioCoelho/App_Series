import 'package:flutter/material.dart';
import 'package:flutter_application_1/rating_widget.dart';
import 'package:flutter_application_1/tv_show_model.dart';
import 'package:google_fonts/google_fonts.dart';

class TvShowCard extends StatelessWidget {
  const TvShowCard({super.key, required this.tvShow, required this.index});
  final TvShow tvShow;
  final int index;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: colorScheme.primary,
          child: Text(
            (index + 1).toString(),
            style: GoogleFonts.lobster(
              color: colorScheme.onPrimary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          tvShow.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          tvShow.stream,
          style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
        ),
        trailing: ratingWidget(number: tvShow.rating),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(tvShow.title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text('Streaming ${tvShow.stream}'),
                  Text('Rating ${tvShow.rating}'),
                  Text(tvShow.stream),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                  ),
                  child: Text(
                    'FECHAR',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

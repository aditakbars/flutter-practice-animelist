import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailPage extends StatefulWidget {
  final int item;
  final String title;
  const DetailPage({Key? key, required this.item, required this.title})
      : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Future<List<Episode>> episodes;

  @override
  void initState() {
    super.initState();
    episodes = fetchEpisodes(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black),
      ),
      body: Center(
          child: FutureBuilder(
        builder: (context, AsyncSnapshot<List<Episode>> snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors
                          .red, // Warna latar belakang diubah menjadi merah
                      foregroundColor:
                          Colors.white, // Warna teks diubah menjadi putih
                      child: Text(
                          '${snapshot.data![index].score.toStringAsFixed(1)}'),
                    ),
                    title: Text(snapshot.data![index].title),
                    subtitle: Text(snapshot.data![index].title_japanese),
                    trailing: Text('Episode ${index + 1}'),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }
          return const CircularProgressIndicator();
        },
        future: episodes,
      )),
    );
  }
}

class Episode {
  final String title_japanese;
  final String title;
  final double score;

  Episode({
    required this.title,
    required this.score,
    required this.title_japanese,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      title: json['title'],
      title_japanese: json['title_japanese'],
      score: json['score'],
    );
  }
}

Future<List<Episode>> fetchEpisodes(int id) async {
  final response =
      await http.get(Uri.parse('https://api.jikan.moe/v4/anime/$id/episodes'));

  if (response.statusCode == 200) {
    var episodesJson = jsonDecode(response.body)['data'] as List;
    debugPrint(episodesJson.toString());
    return episodesJson.map((episode) => Episode.fromJson(episode)).toList();
  } else {
    throw Exception('Failed to load episodes');
  }
}
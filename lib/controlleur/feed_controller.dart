import 'package:flutter/material.dart';
import 'package:france_bleu_rss/modele/article.dart';
import 'package:france_bleu_rss/modele/feed_parser.dart';
import 'package:france_bleu_rss/vue/list_vue.dart';

class FeedController extends StatelessWidget {
  final String url;

  const FeedController({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
        future: FeedParser().getFeed(url),
        builder: ((context, snapshot) =>
            ListVue(articles: snapshot.data ?? [])));
  }
}

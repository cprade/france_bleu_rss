import 'package:flutter/material.dart';
import 'package:france_bleu_rss/controlleur/feed_controller.dart';
import 'package:france_bleu_rss/modele/rss_type.dart';

class HomeController extends StatelessWidget {
  List<RssType> types = [
    RssType(type: "Infos", url: "https://www.francebleu.fr/rss/a-la-une.xml"),
    RssType(type: "Sport", url: "https://www.francebleu.fr/rss/sports.xml"),
    RssType(type: "Culture", url: "https://www.francebleu.fr/rss/culture.xml"),
  ];

  HomeController({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: types.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Mon flux RSS"),
            bottom: TabBar(
                tabs: types
                    .map((type) => Tab(
                          text: type.type,
                        ))
                    .toList()),
          ),
          body: TabBarView(
              children:
                  types.map((type) => FeedController(url: type.url)).toList()),
        ));
  }
}

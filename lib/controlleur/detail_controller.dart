import 'package:flutter/material.dart';
import 'package:france_bleu_rss/modele/article.dart';
import 'package:france_bleu_rss/vue/description_text.dart';
import 'package:france_bleu_rss/vue/image_view.dart';
import 'package:france_bleu_rss/vue/my_padd.dart';
import 'package:france_bleu_rss/vue/title_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailController extends StatelessWidget {
  final Article article;
  const DetailController({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padd(),
            TitleText(title: article.title),
            const Padd(),
            ImageView(imageUrl: article.imageUrl),
            const Padd(),
            const Divider(),
            const Padd(),
            DescText(description: article.description),
            const Padd(),
            ElevatedButton(
                onPressed: handleToWeb,
                child: const Text("Vers l'article complet"))
          ],
        ),
      ),
    );
  }

  handleToWeb() async {
    // Les cours Udemy utilisent canLaunch et Launch. Fonctionne en mettant canLaunchUrlString et launchUrlString
    if (await canLaunchUrlString(article.link)) {
      await launchUrlString(article.link);
    }
  }
}

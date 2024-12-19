import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/components/common/circular_loader.dart';
import 'package:news_app/components/common/headline_bar.dart';
import 'package:news_app/components/starter_screen/channel_circle.dart';
import 'package:news_app/components/starter_screen/sliders/most_popular_slider.dart';
import 'package:news_app/components/starter_screen/sliders/starter_header_slider.dart';
import 'package:news_app/core/controllers/news_controller.dart';
import 'package:news_app/model/channels.dart';

class StarterScreen extends StatelessWidget {
  const StarterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<NewsController>(
              builder: (newsController){
                final articles = newsController.journalNews;
                if (articles.isNotEmpty) {
                  return StarterHeaderSlider(articles: articles);
                } else {
                  return const CircularLoader();
                }
              }),
          const HeadlineBar(text: 'Top Channels'),
          SizedBox(height: 125,
            child: ListView.builder(
              itemCount: Channels.channelList.length,
              itemBuilder: (context,index) {
                final channel = Channels.channelList[index];
                return ChannelCircle(channel: channel);
              },
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const HeadlineBar(text: 'Most Popular'),
          GetBuilder<NewsController>(
              builder: (newsController){
                final articles = newsController.technology;
                if (articles.isNotEmpty) {
                  return MostPopularSlider(articles: articles);
                } else {
                  return const CircularLoader();
                }
          }),
        ],
      ),
    );
  }
}










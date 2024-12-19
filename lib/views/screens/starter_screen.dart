import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/components/common/headline_bar.dart';
import 'package:news_app/components/starter_screen/carousal_card.dart';
import 'package:news_app/components/starter_screen/channel_circle.dart';
import 'package:news_app/core/controllers/news_controller.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/model/channels.dart';
import 'package:news_app/utils/helper/format_helper.dart';
import 'package:news_app/utils/static/app_colors.dart';
import 'package:news_app/utils/static/app_dimension.dart';

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
                return articles.isNotEmpty ? CarouselSlider(
                  items: articles.map((article) => CarousalCard(article: article)).toList(),
                  options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1.0,
                      autoPlayAnimationDuration:const Duration(seconds: 1),
                      autoPlayCurve: Curves.linear,
                      reverse: false,
                      scrollDirection: Axis.horizontal

                  ),

                ) : const Center(child: CircularProgressIndicator(color: AppColors.mainColor,),);
              }),
          const HeadlineBar(text: 'Top Channels'),
          SizedBox(height: 125,
            child: ListView.builder(
              itemCount: Channels.channelList.length,
              // padding: const EdgeInsets.only(left: AppDimensions.defaultHorizontalPadding),
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
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top:10.0,bottom:10.0),
                    itemBuilder: (context,index) {
                      final article = articles[index];
                      return GestureDetector(
                      onTap:(){
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>webViewScreen(url:article['url'])));
                      },
                      child:Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                    width:double.infinity,height:220,
                                    margin: const EdgeInsets.only(bottom:10.0),
                                    decoration:BoxDecoration(
                                      borderRadius:const BorderRadius.all(Radius.circular(10.0)),
                                      image:DecorationImage(
                                        fit:BoxFit.cover,
                                        image:NetworkImage(article.urlToImage!),
                                      ),
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end:Alignment.topCenter,
                                        colors:[Colors.black.withOpacity(0.9),Colors.white.withOpacity(0.0)],
                                        stops: const [0.1,0.8],
                                      ),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end:Alignment.topCenter,
                                          colors:[Colors.black.withOpacity(0.6),Colors.white.withOpacity(0.0)],
                                          stops: const [0.0,0.5],
                                        ),
                                      ),
                                    )
                                ),
                              ],
                            ),
                            Text(article.title,style:const TextStyle(color:Colors.black,fontWeight:FontWeight.bold,fontSize: 22.0),maxLines: 2,overflow:TextOverflow.ellipsis,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: 200,
                                    child: Text(article.author != null ? "By: ${article.author}":  "By: N/A",style:const TextStyle(height:2.5,color:Colors.black,fontSize: 16.0),maxLines: 1,overflow:TextOverflow.ellipsis,)),
                                Text(FormatHelper.dateFormat(article.publishedAt),style:const TextStyle(height:2.4,color:Colors.black54,fontSize: 12.0)),
                              ],
                            ),
                          ],),
                      ),
                    );
                    },
                    separatorBuilder: (context,index)=>Padding(padding:EdgeInsets.only(bottom:8.0)),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount:5,
                  );
                } else {
                  return const Center(child: CircularProgressIndicator(color: AppColors.mainColor,),);
                }
          }),
          // GetBuilder<NewsController>(
          //     builder: (newsController){
          //       final articles = newsController.journalNews;
          //       if (articles.isNotEmpty) {
          //         return ListView.builder(
          //         itemCount: articles.length,
          //         padding: const EdgeInsets.only(left: AppDimensions.defaultHorizontalPadding),
          //         shrinkWrap: true,
          //         physics: const NeverScrollableScrollPhysics(),
          //         scrollDirection: Axis.vertical,
          //         itemBuilder: (context,index) {
          //           final article = articles[index];
          //           return GestureDetector(
          //           onTap:(){},
          //           child:Container(
          //             width: 100,
          //             padding: const EdgeInsets.symmetric(horizontal: 12.0),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Container(
          //                   width:60,height:60,
          //                   margin: const EdgeInsets.only(bottom:10.0),
          //                   decoration: BoxDecoration(
          //                     shape:BoxShape.circle,
          //                     image:DecorationImage(
          //                       fit:BoxFit.cover,
          //                       image:NetworkImage(article.urlToImage!),
          //                     ),
          //                   ),
          //                 ),
          //                 Text(article.title,style:const TextStyle(color:Colors.black,fontWeight:FontWeight.bold,fontSize: 16),maxLines: 2,overflow:TextOverflow.ellipsis,),
          //                 Text(article.publishedAt,style:const TextStyle(height:3.4,color:Colors.black45,fontSize: 11.0)),
          //                 Text(article.author ?? "N/A",style:const TextStyle(height:2.5,color:Colors.black,fontSize: 9.0),maxLines: 1,overflow:TextOverflow.ellipsis,),
          //               ],),
          //           ),
          //         );
          //         },
          //       );
          //       } else {
          //         return const Center(child: CircularProgressIndicator(color: AppColors.mainColor,),);
          //       }
          // }),
        ],
      ),
    );
  }
}





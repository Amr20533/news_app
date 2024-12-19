import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/utils/helper/format_helper.dart';
import 'package:timeago/timeago.dart' as timeago;

class CarousalCard extends StatelessWidget {
  const CarousalCard({
    super.key, required this.article,
  });
  final Article article;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap:(){
          // Navigator.push(context, MaterialPageRoute(builder: (context)=>webViewScreen(url: article['url'],)));
        },
        child:Container(
          width:350,
          decoration:const BoxDecoration(
            borderRadius:BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Stack(
            children: [
              Container(
                decoration:BoxDecoration(
                  borderRadius:const BorderRadius.all(Radius.circular(10.0)),
                  shape:BoxShape.rectangle,
                  image: DecorationImage(
                    fit:BoxFit.cover,
                    image:article.urlToImage != null ? NetworkImage('${article.urlToImage}') : const AssetImage('assets/placeHolder.png'),
                  ),
                ),
                child:Container(
                  decoration:BoxDecoration(
                      borderRadius:const BorderRadius.all(Radius.circular(10.0)),
                      gradient:LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: const [0.1,0.9],
                        colors:[Colors.black.withOpacity(0.9),Colors.white.withOpacity(0.0)],
                      )
                  ),
                ),
              ),

              Positioned(bottom:30,
                  child:Container(
                    width: 330,
                    margin: const EdgeInsets.symmetric(horizontal:10.0),
                    child: Text(article.title,style:const TextStyle(height:1.5,color:Colors.white,fontWeight:FontWeight.bold,fontSize: 14.0),maxLines: 1,overflow:TextOverflow.ellipsis,),
                  )),
              Positioned(bottom:10,left:10.0,
                  child:SizedBox(width:100.0,child: Text(article.author ?? "N/A",style:const TextStyle(color:Colors.white70,fontSize: 12.0),maxLines: 1,overflow:TextOverflow.ellipsis,))),
              Positioned(bottom:0,right:10.0,
                  child:Text(FormatHelper.timeAgoFormat(article.publishedAt),style:const TextStyle(height:3.4,color:Colors.white54,fontSize: 11.0))),
            ],
          ),
        ));
  }

}

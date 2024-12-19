import 'package:flutter/material.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/utils/helper/format_helper.dart';

class MostPopularTile extends StatelessWidget {
  const MostPopularTile({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
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
  }
}

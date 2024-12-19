import 'package:flutter/material.dart';
import 'package:news_app/model/channels.dart';
import 'package:news_app/views/web_view_screen.dart';

class ChannelCircle extends StatelessWidget {
  const ChannelCircle({
    super.key,
    required this.channel,
  });

  final Channels channel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> WebViewScreen(url: channel.urlTo)));
      },
      child:Container(
        width: 80,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width:60,height:60,
              margin: const EdgeInsets.only(bottom:10.0),
              decoration:BoxDecoration(
                shape:BoxShape.circle,
                image:DecorationImage(
                  fit:BoxFit.cover,
                  image:NetworkImage(channel.imageUrl),
                ),
              ),
            ),
            Text(channel.name,
              style:const TextStyle(color:Colors.black,fontWeight:FontWeight.bold,fontSize: 16),maxLines: 2,overflow:TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],),
      ),
    );
  }
}

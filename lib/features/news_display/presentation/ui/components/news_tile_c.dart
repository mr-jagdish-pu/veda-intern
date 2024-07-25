import 'package:flutter/cupertino.dart';

class NewsTileC extends StatelessWidget {
 final String about;
 final String image;
 final String headline;
 final String newsAgent;
 final DateTime publishedAt;
 final String content;
  const NewsTileC({super.key, required this.about, required this.headline, required this.newsAgent, required this.publishedAt, required this.image, required this.content, });

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Image.network(
            fit:BoxFit.fill,
              height: 80,

              width: 70,
              '$image'),
         SizedBox(width: 5,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$about'),
              SizedBox(width:mq-100 ,child: Text("$headline", maxLines: 2, overflow: TextOverflow.ellipsis,)),
              Row(
                children: [Text("$newsAgent"), Text('   14 min ago')],
              )
            ],
          )
        ],
      ),
    );
  }
}

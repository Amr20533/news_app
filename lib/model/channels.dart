class Channels{
  final String imageUrl;
  final String urlTo;
  final String name;

  Channels({required this.urlTo,required this.imageUrl, required this.name});
  static List<Channels> channelList = [
    Channels(imageUrl: 'https://download.logo.wine/logo/BBC_News/BBC_News-Logo.wine.png', name: "BBC News", urlTo: 'https://www.theguardian.com/international'),
    Channels(imageUrl: 'https://logos-world.net/wp-content/uploads/2023/04/Al-Jazeera-Logo-1996.png', name: "Al Jazeera", urlTo: 'https://logos-world.net/wp-content/uploads/2023/04/Al-Jazeera-Logo-1996.png'),
    Channels(imageUrl: 'https://th.bing.com/th/id/OIP.PvDLy0KxPgO342J6ASzjTAAAAA?rs=1&pid=ImgDetMain', name: "France 24", urlTo: 'https://edition.cnn.com/'),
    Channels(imageUrl: 'https://macmiller.com/wp-content/uploads/2018/08/wall-street-journal.png', name: "The Wall Street Journal", urlTo: 'https://www.wsj.com/?msockid=311b6257b0696324336b770db1156220'),
    Channels(imageUrl: 'https://brandlogos.net/wp-content/uploads/2014/10/cnn-logo.png', name: "CNN", urlTo: 'https://edition.cnn.com/'),
    Channels(imageUrl: 'https://yt3.ggpht.com/-uYnyeu0wFpQ/AAAAAAAAAAI/AAAAAAAAAAA/VU2Ct3J_ZQw/s900-c-k-no/photo.jpg', name: "Sky News", urlTo: 'https://news.sky.com/'),
    Channels(imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/Fox_News_Channel_logo.svg/1200px-Fox_News_Channel_logo.svg.png', name: "Fox News", urlTo: 'https://www.foxnews.com/?msockid=311b6257b0696324336b770db1156220'),
    Channels(imageUrl: 'https://th.bing.com/th/id/R.e6899f6afb803c86cf34c990bbe330a5?rik=oqDeP0kVKQFQzg&pid=ImgRaw&r=0', name: "RT (Russia Today)", urlTo: 'https://www.rt.com/'),
    Channels(imageUrl: 'https://yt3.ggpht.com/-BIRGQdn8D10/AAAAAAAAAAI/AAAAAAAAAAA/7-RyubTGoH8/s900-c-k-no/photo.jpg', name: "The Guardian", urlTo: 'https://www.theguardian.com/international'),
  ];
}

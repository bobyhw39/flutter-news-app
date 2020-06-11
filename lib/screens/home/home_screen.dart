import 'package:flutter/material.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/screens/details/details_news_screen.dart';
import 'package:news_app/services/api/api_services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ApiServices _apiServices = ApiServices();
  Future<List<dynamic>> futureTop;
  Future<List<dynamic>> futureCovid19;
  Future<List<dynamic>> futureSports;


  @override
  void initState() {
    // TODO: implement initState
    futureTop = _apiServices.topNews();
    futureCovid19 = _apiServices.covid19();
    futureSports = _apiServices.sports();
    super.initState();
  }

  topNews(newslist){
    return FutureBuilder<List<Articles>>(
        future: newslist,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          if(snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator(),);
          }
          // By default, show a loading spinner.
          List<Articles> articles = snapshot.data ?? [];
          return ListView.builder(
              itemCount: articles.length,
              itemBuilder:(context,index){
                Articles article = articles[index];
                return new ListTile(
                  leading: CircleAvatar(backgroundImage: NetworkImage(article.urlToImage), backgroundColor: Theme.of(context).accentColor,),
                  title: Text(article.title),
                  onTap: () {
                    Navigator.pushNamed(
                        context,
                        DetailsNewsScreen.routeName,
                        arguments: article
                    );
                  },
                );
              });
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: "Top"),
              Tab(text: "Coronavirus",),
              Tab(text: "Sports"),
            ],
          ),
          title: Text('News'),
        ),
        body: TabBarView(
          children: [
            topNews(futureTop),
            topNews(futureCovid19),
            topNews(futureSports),
          ],
        ),
        drawer: Drawer(

        ),
      ),
    );
  }
}


//class HomeScreen extends StatelessWidget {

//}

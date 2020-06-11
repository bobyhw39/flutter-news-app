import 'package:dio/dio.dart';
import 'package:news_app/models/news_response.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ApiServices{

  final String baseUrl = "http://newsapi.org/";
  final String apiKey = "PLACE YOUR API KEY HERE";

  Future<List<Articles>> topNews() async {
    var response = await http.get(
      // Encode the url
        Uri.encodeFull(baseUrl+"v2/top-headlines?country=id&category=business&apiKey="+apiKey),
        // Only accept JSON response
        headers: {"Accept": "application/json"}
    );

    var list = (json.decode(response.body)['articles']) as List;

    List<Articles> articleList = list.map((i) => Articles.fromJson(i)).toList();

    return articleList;
  }

  Future<List<Articles>> covid19() async {
    var response = await http.get(
      // Encode the url
        Uri.encodeFull(baseUrl+"v2/everything?q=corona&sortBy=publishedAt&apiKey="+apiKey),
        // Only accept JSON response
        headers: {"Accept": "application/json"}
    );

    var list = (json.decode(response.body)['articles']) as List;

    List<Articles> articleList = list.map((i) => Articles.fromJson(i)).toList();

    return articleList;
  }

  Future<List<Articles>> sports() async {
    var response = await http.get(
      // Encode the url
        Uri.encodeFull(baseUrl+"v2/everything?q=sports&sortBy=publishedAt&apiKey="+apiKey),
        // Only accept JSON response
        headers: {"Accept": "application/json"}
    );

    var list = (json.decode(response.body)['articles']) as List;

    List<Articles> articleList = list.map((i) => Articles.fromJson(i)).toList();

    return articleList;
  }


}

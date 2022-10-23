import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hasantunahanak_biz/home/model/github_repo.dart';
import 'package:hasantunahanak_biz/home/model/user.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'https://hasantunahanak-web-default-rtdb.europe-west1.firebasedatabase.app/';
const repoUrl = 'https://api.github.com/users/hasantunahan/repos';

class HomeViewModel {
  final StateSetter setState;
  HomeViewModel({required this.setState});

  ValueNotifier<bool> loading = ValueNotifier<bool>(false);
  ValueNotifier<User> myUser = ValueNotifier<User>(User());
  ValueNotifier<List<GitHubRepo>> repos = ValueNotifier<List<GitHubRepo>>([]);

  void changeLoading({required bool value}) {
    loading.value = value;
  }

  Future<void> fetchUser() async {
    try {
      final res = await http.get(Uri.parse('$baseUrl/user.json'));
      if (res.statusCode == HttpStatus.ok) {
        final jsonValue = jsonDecode(res.body);
        myUser.value = User.fromJson(jsonValue);
      }
    } catch (e) {
      changeLoading(value: false);
    }
  }

  //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
  Future<void> fetchGithubRepo() async {
    List<GitHubRepo> list = [];
    try {
      final res = await http
          .get(Uri.parse(repoUrl), headers: {"Authorization": "Bearer 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"});
      if (res.statusCode == HttpStatus.ok) {
        final jsonValue = jsonDecode(res.body);
        List<dynamic> values = jsonValue;
        for (var element in values) {
          final Map<String, dynamic> value = element;
          repos.value.add(GitHubRepo.fromJson(value));
        }
      }
    } catch (e) {
      changeLoading(value: false);
    }
  }

  Future<void> fetchAll() async {
    changeLoading(value: true);
    await Future.wait([
      fetchUser(),
      fetchGithubRepo(),
    ]);
    changeLoading(value: false);
  }
}

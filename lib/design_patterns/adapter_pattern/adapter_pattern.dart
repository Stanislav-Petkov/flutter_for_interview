import 'dart:convert';

class PostAPI1 {
  String getYouTubePosts() {
    return '''
    [
      {
        "title":"YouTube Video 1",
        "description":"Description for Video 1"
      },
      {
        "title":"Another YouTube Video 2",
        "description":"Another Description for Video 2"
      }
    ]
    ''';
  }
}

class PostAPI2 {
  String getMediumPosts() {
    return '''
    [
      {
        "header": "Medium Post 1 Header Content",
        "bio": "Bio for Medium Post 1"
      },
      {
        "header": "Another Medium Post 2",
        "bio": "Another Description for Medium Post 2"
      }
    ]
    ''';
  }
}

abstract class IPostAPI {
  List<Post> getPosts();
}

class Post {
  final String title;
  final String bio;

  Post({required this.title, required this.bio});
}

/// ADAPTER
class PostAPI1Adapter implements IPostAPI {
  final api = PostAPI1();

  @override
  List<Post> getPosts() {
    final data = jsonDecode(api.getYouTubePosts()) as List;
    return data
        .map((e) => Post(title: e['title'], bio: e['description']))
        .toList();
  }
}

class PostAPI2Adapter implements IPostAPI {
  final api = PostAPI2();

  @override
  List<Post> getPosts() {
    final data = jsonDecode(api.getMediumPosts()) as List;
    return data.map((e) => Post(title: e['header'], bio: e['bio'])).toList();
  }
}

class PostAPI implements IPostAPI {
  final api1 = PostAPI1Adapter();
  final api2 = PostAPI2Adapter();

  @override
  List<Post> getPosts() {
    return api1.getPosts() + api2.getPosts();
  }
}

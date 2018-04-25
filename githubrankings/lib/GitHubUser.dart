class GitHubUser {
  final String name;
  final int position;
  final int contributions;
  final int public;
  final int private;
  final String bio;
  final int followers;
  final int repositories;
  final int organizations;
  final String join;
  final String avatar;


  GitHubUser({
    this.name,
    this.position,
    this.contributions,
    this.public,
    this.private,
    this.bio,
    this.followers,
    this.repositories,
    this.organizations,
    this.join,
    this.avatar
  });

  factory GitHubUser.fromJson(Map<String, dynamic> json) {
    return new GitHubUser(
      name: json['name'],
      position: json['position'],
      contributions: json['contributions']
    );
  }
}
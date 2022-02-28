// Profile Model has dummy data as well because the mock server url
// is not consistent and has request limits which might cause issues.
class Profile {
  String menuTitle = "Flyingwolf";
  String name = "Simon Baker";
  String rating = "2250";
  String won = "34";
  String played = "04";
  String percent = "26%";
  String avatarUrl = "https://cdn.game.tv/images/meet-tourney/game.tv-logo.png";

  Profile(
    this.menuTitle,
    this.name,
    this.rating,
    this.won,
    this.played,
    this.percent,
    this.avatarUrl,
  );
  Profile.empty();
}

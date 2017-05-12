JSONObject jsonObj;

/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  jsonObj = loadJSONObject("film.json");
  String title = jsonObj.getString("title");
  String dir = jsonObj.getString("director");
  int year = jsonObj.getInt("year");
  float rating = jsonObj.getFloat("rating");
  println(title + " by " + dir + ". " + year);
  println("Rating: " + rating);
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
}
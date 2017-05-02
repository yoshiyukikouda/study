JSONObject weather;

/*
* 初期処理
* 初回のみ実行
*/
void setup() {
  float temp = getTemp("cincinnati.json");
  println(temp);
}

/*
* 描写処理
* 実行中は繰返し実行
*/
void draw() {
}

float getTemp(String fileName) {
  JSONObject weather = loadJSONObject(fileName);
  return weather.getJSONArray("list").getJSONObject(0).getJSONObject("main").getFloat("temp");
}
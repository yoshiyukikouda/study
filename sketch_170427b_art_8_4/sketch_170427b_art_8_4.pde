// グローバル変数
FractalRoot pentagon;
int _maxlevels = 5;
float _strutFactor = 0.2;

/*
* 初期処理
*/
void setup() {
  size(1000, 1000);
  smooth();
  pentagon = new FractalRoot();
  pentagon.drawShape();
}

/*
* ポイントオブジェクトクラス
*/
class PointObj {
  // クラス内変数
  float x;
  float y;

  /*
  * コンストラクタ
  */
  PointObj(float ex, float why) {
    x = ex;
    y = why;
  }
}

/*
* フラクタルルート図形のクラス
*/
class FractalRoot {
  // クラス内変数
  PointObj[] pointArr = new PointObj[5];
  Branch rootBranch;
  
  /*
  * コンストラクタ
  */
  FractalRoot() {
    // 変数の初期化
    float centX = width / 2;
    float centY = height / 2;
    int count = 0;

    // 360度を72度ずつ進み、算出したポイント位置を配列に保持する
    for (int i = 0; i < 360; i += 72) {
      float x = centX + (400 * cos(radians(i)));
      float y = centY + (400 * sin(radians(i)));
      pointArr[count] = new PointObj(x, y);
      count++;
    }
    // 保持したポイント位置を基にルート木のオブジェクトを生成
    rootBranch = new Branch(0, 0, pointArr);
  }
  
  /*
  * 図形の描写
  */
  void drawShape() {
    // ルート木の描写
    rootBranch.drawMe();
  }
}

/*
* 木クラス
*/
class Branch {
  // クラス内変数
  int level;                    // 木の深さ
  int num;                      // 
  PointObj[] outerPoints = {};  // 図形の点位置
  PointObj[] midPoints = {};    // 図形の点の中点位置
  PointObj[] projPoints = {};   // 中点から対角線上の外側図形の点位置までを計算して算出した点の位置

  Branch[] myBranches = {};

  /*
  * コンストラクタ
  */
  Branch(int lev, int n, PointObj[] points) {
    level = lev;
    num = n;
    outerPoints = points;
    midPoints = calcMidPoints();
    projPoints = calcStrutPoints();
    if ((level + 1) < _maxlevels) {
      // 指定した深さに到達するまで、子の木オブジェクトを生成
      Branch childBranch = new Branch(level + 1, 0, projPoints);
      myBranches = (Branch[])append(myBranches, childBranch);
      
      // 外側図形の点、外側図形の中点、突っ張り点を基に、内側に図形を描写
      for (int k = 0; k < outerPoints.length; k++) {
        int nextk = k - 1;
        if (nextk < 0) {
          nextk += outerPoints.length;
        }
        PointObj[] newPoints = { projPoints[k], midPoints[k], outerPoints[k], midPoints[nextk], projPoints[nextk] };
        childBranch = new Branch(level + 1, k + 1, newPoints);
        myBranches = (Branch[])append(myBranches, childBranch);
      }
    }
  }
  
  /*
  * 木を描写するメソッド
  */
  void drawMe() {
    strokeWeight(5 - level);
    
    // 外側図形の描写
    for (int i = 0; i < outerPoints.length; i++) {
      int nexti = i + 1;
      if (nexti == outerPoints.length) {
        // 図形の一番最後の点の場合、次の点を最初の点とする
        nexti = 0;
      }
      line(outerPoints[i].x, outerPoints[i].y, outerPoints[nexti].x, outerPoints[nexti].y);
    }
    
    // 中点から突っ張り点までの描写
    strokeWeight(0.5);
    fill(255, 150);
    for (int j = 0; j < midPoints.length; j++) {
      // 中点の描写
      ellipse(midPoints[j].x, midPoints[j].y, 15, 15);
      // 中点から突っ張り点まで線を描写
      line(midPoints[j].x, midPoints[j].y, projPoints[j].x, projPoints[j].y); 
      // 突っ張り点の描写
      ellipse(projPoints[j].x, projPoints[j].y, 15, 15);
    }
    
    // 子の木オブジェクトの描写
    for (int k = 0; k < myBranches.length; k++) {
      myBranches[k].drawMe();
    }
  }

  /*
  * 上位の木のポイント位置に対する中点位置を計算して取得するメソッド
  * @return ポイントオブジェクト（中点位置）の配列
  */
  PointObj[] calcMidPoints() {
    PointObj[] mpArray = new PointObj[outerPoints.length];
    
    for (int i = 0; i < outerPoints.length; i++) {
      // 現在位置とその次の点の位置を取得し、中点位置を計算する
      int nexti = i + 1;
      if (nexti == outerPoints.length) {
        // 図形の一番最後の点の場合、次の点を最初の点とする
        nexti = 0;
      }
      // 中点位置を計算して取得
      PointObj thisMP = calcMidPoint(outerPoints[i], outerPoints[nexti]);
      mpArray[i] = thisMP;
    }
    return mpArray;
  }

  /*
  * 渡されたポイント位置の中点位置を計算して取得するメソッド
  * @return ポイントオブジェクト（中点位置）
  */
  PointObj calcMidPoint(PointObj start, PointObj end) {
    float midx;
    float midy;
    
    // X座標の計算
    if (start.x > end.x) {
      // 開始位置 > 終了位置の場合、終了位置から見て、開始 - 終了の半分を足した位置を取得
      midx = end.x + ((start.x - end.x) / 2);
    } else {
      // 終了位置 > 開始位置の場合、開始位置から見て、終了 - 開始の半分を足した位置を取得
      midx = start.x + ((end.x - start.x) / 2);
    } 
    
    // Y座標の計算
    if (start.y > end.y) {
      // 開始位置 > 終了位置の場合、終了位置から見て、開始 - 終了の半分を足した位置を取得
      midy = end.y + ((start.y - end.y) / 2);
    } else {
      // 終了位置 > 開始位置の場合、開始位置から見て、終了 - 開始の半分を足した位置を取得
      midy = start.y + ((end.y - start.y) / 2);
    } 

    // 計算して取得した中点位置を返却
    return new PointObj(midx, midy);
  }
  
  /*
  * 中点から対角上にある、外側図形の点までに対する、_strutFactor（割合）分までの位置を取得するメソッド
  * @return ポイントオブジェクト（中点から対角上になる外側図形の点までの、割合で区切った位置）の配列
  */
  PointObj[] calcStrutPoints() {
    PointObj[] strutArray = new PointObj[midPoints.length];
    
    for (int i = 0; i < midPoints.length; i++) {
      int nexti = i + 3;
      if (nexti >= midPoints.length) {
        nexti -= midPoints.length;
      }
      // 中点を向かい合った頂点に向けて伸ばす
      PointObj thisSP = calcStrutPoint(midPoints[i], outerPoints[nexti]);
      strutArray[i] = thisSP;
    }
    
    return strutArray;
  }
  
  /*
  * 中点から対角上にある、外側図形の点までに対する、_strutFactor（割合）分までの位置を取得するメソッド
  * @return ポイントオブジェクト（中点から対角上になる外側図形の点までの、割合で区切った位置）
  */
  PointObj calcStrutPoint(PointObj midp, PointObj outerp) {
    float strutx;
    float struty;
    float adj;
    float opp;
    
    // 三角法の計算
    if (outerp.x > midp.x) {
      opp = outerp.x - midp.x;
    } else {
      opp = midp.x - outerp.x;
    }
    if (outerp.y > midp.y) {
      adj = outerp.y - midp.y;
    } else {
      adj = midp.y - outerp.y;
    }

    // 斜辺に沿って伸ばす
    if (outerp.x > midp.x) {
      strutx = midp.x + (opp * _strutFactor);
    } else {
      strutx = midp.x - (opp * _strutFactor);
    }
    if (outerp.y > midp.y) {
      struty = midp.y + (adj * _strutFactor);
    } else {
      struty = midp.y - (adj * _strutFactor);
    }
    
    return new PointObj(strutx, struty);
  } 
}
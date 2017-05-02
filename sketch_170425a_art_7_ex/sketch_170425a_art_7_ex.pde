import processing.opengl.*;

Cell[][][] _cellArray;
int _cellSize = 10;
int _numX, _numY, _numZ;

void setup() {
  frameRate(15);
  size(500, 300, OPENGL);
  _numX = floor(width/_cellSize);
  _numY = floor(height/_cellSize);
  _numZ = floor(height/_cellSize);
  restart();
}

void restart() {
  _cellArray = new Cell[_numX][_numY][_numZ];
  for (int x = 0; x < _numX; x++) {
    for (int y = 0; y < _numY; y++) {
      for (int z = 0; z < _numZ; z++) {
        Cell newCell = new Cell(x, y, z);
        _cellArray[x][y][z] = newCell;
      }
    }
  }
  
  for (int x = 0; x < _numX; x++) {
    for (int y = 0; y < _numY; y++) {
      for (int z = 0; z < _numZ; z++) {
        int above = y-1;
        int below = y+1;
        int left = x-1;
        int right = x+1;
        int side = z-1;
        int back = z+1;
        
        if (above < 0) {
          above = _numY - 1;
        }
        if (below == _numY) {
          below = 0;
        }
        if (left < 0) {
          left = _numX - 1;
        }
        if (right == _numX) {
          right = 0;
        }
        if (side < 0) {
          side = _numZ - 1;
        }
        if (back == _numZ) {
          back = 0;
        } 
        _cellArray[x][y][z].addNeighbour(_cellArray[left][above][side]);
        _cellArray[x][y][z].addNeighbour(_cellArray[left][above][z]);
        _cellArray[x][y][z].addNeighbour(_cellArray[left][above][back]);
  
        _cellArray[x][y][z].addNeighbour(_cellArray[left][y][side]);
        _cellArray[x][y][z].addNeighbour(_cellArray[left][y][z]);
        _cellArray[x][y][z].addNeighbour(_cellArray[left][y][back]);
  
        _cellArray[x][y][z].addNeighbour(_cellArray[left][below][side]);
        _cellArray[x][y][z].addNeighbour(_cellArray[left][below][z]);
        _cellArray[x][y][z].addNeighbour(_cellArray[left][below][back]);
  
        _cellArray[x][y][z].addNeighbour(_cellArray[x][below][side]);
        _cellArray[x][y][z].addNeighbour(_cellArray[x][below][z]);
        _cellArray[x][y][z].addNeighbour(_cellArray[x][below][back]);
        
        _cellArray[x][y][z].addNeighbour(_cellArray[right][below][side]);
        _cellArray[x][y][z].addNeighbour(_cellArray[right][below][z]);
        _cellArray[x][y][z].addNeighbour(_cellArray[right][below][back]);
  
        _cellArray[x][y][z].addNeighbour(_cellArray[right][y][side]);
        _cellArray[x][y][z].addNeighbour(_cellArray[right][y][z]);
        _cellArray[x][y][z].addNeighbour(_cellArray[right][y][back]);
  
        _cellArray[x][y][z].addNeighbour(_cellArray[right][above][side]);
        _cellArray[x][y][z].addNeighbour(_cellArray[right][above][z]);
        _cellArray[x][y][z].addNeighbour(_cellArray[right][above][back]);
  
        _cellArray[x][y][z].addNeighbour(_cellArray[x][above][side]);
        _cellArray[x][y][z].addNeighbour(_cellArray[x][above][z]);
        _cellArray[x][y][z].addNeighbour(_cellArray[x][above][back]);
      }
    }
  } 
}

void draw() {
  background(200);
  
  for (int x = 0; x < _numX; x++) {
    for (int y = 0; y < _numY; y++) {
      for (int z = 0; z < _numZ; z++) {
        _cellArray[x][y][z].calcNextState();
      }
    }
  }
  
  translate(_cellSize/2, _cellSize/2);
  
  for(int x = 0; x < _numX; x++) {
    for (int y = 0; y < _numY; y++) {
      for (int z = 0; z < _numZ; z++) {
        _cellArray[x][y][z].drawMe();
      }
    }
  }
}

void mousePressed() {
  restart();
}

class Cell {
  float x, y, z;
  int state;
  int nextState;
  Cell[] neighbours;
  
  Cell(float ex, float why, float iz) {
    x = ex * _cellSize;
    y = why * _cellSize;
    y = iz * _cellSize;
    nextState = int(random(2));
    state = nextState;
    neighbours = new Cell[0];
  }
  
  void addNeighbour(Cell cell) {
    neighbours = (Cell[])append(neighbours, cell);
  }
  
  void calcNextState() {
    if (state == 0) {
      int firingCount = 0;
      for (int i = 0; i < neighbours.length; i++) {
        if (neighbours[i].state == 1) {
          firingCount++;
        }
      }
      if (firingCount == 2) {
        nextState = 1;
      } else {
        nextState = state;
      }
    } else if (state == 1) {
      nextState = 2;
    } else if (state == 2) {
      nextState = 0;
    }   
  }
  
  void drawMe() {
    state = nextState;
    stroke(0);
    if (state == 1) {
      fill(0);
    } else if (state == 2) {
      fill(150);
    } else { 
      fill(255);
    }
    ellipse(x, y, _cellSize, _cellSize);
  }
}
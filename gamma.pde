PFont f;

void setup() {

  size(1000, 500);
  background(255);
  stroke(0, 0, 0, 0); 
  fill(150);
  frameRate(100);

  f = createFont("Arial", 16, true);
}

PVector origin = new PVector(width/5, height/3);
float ra = 75;
float rb = 75;
float del = 10;
float l1 = 170;
float l2 = 100;
float l3 = 80;

float wwidth = width;
float wheight = height;


void draw() {
  textFont(f, 16); 

  fill(#ffffff,5);
  rect(0,0,width,height);

  stroke(0, 0, 0, 0); 
  fill(150);

  for (float i = -PI/2; i < 0; i+=0.1){
    for (float j = 0; j < PI/2; j+=0.1){
      plotpoint(i,j);
    }
  }

}

void plotpoint(float thetaa, float thetab) {
  origin.x = width/5;
  origin.y = height/3;
  PVector A = new PVector (origin.x, origin.y);
  PVector B = new PVector (origin.x, origin.y + del + ra + rb);
  PVector AP = new PVector (ra * cos(thetaa), ra * sin(thetaa));
  PVector P = new PVector (A.x + AP.x, A.y + AP.y);
  PVector BQ = new PVector (rb * cos(thetab), rb * sin(thetab));
  PVector Q = new PVector (B.x + BQ.x, B.y + BQ.y);
  PVector M = new PVector (.5 * (P.x + Q.x), .5 * (P.y + Q.y));
  float mpq = (Q.y - P.y)/(Q.x - P.x);
  float mmr = -1/mpq;
  float g = .5 * sqrt(pow(Q.x-P.x, 2) + pow(Q.y-P.y, 2));
  float h = sqrt(pow(l1, 2) - pow(g, 2));
  PVector MR = new PVector(h * cos(atan(mmr)), h*sin(atan(mmr)));
  PVector R = new PVector(M.x + MR.x, M.y + MR.y);
  float phia = atan((R.y - P.y)/(R.x - P.x));
  float phib = atan((R.y - Q.y)/(R.x - Q.x));
  PVector RS = new PVector(l2 * cos(phib), l2 * sin(phib));
  PVector S = new PVector(R.x + RS.x, R.y + RS.y);
  PVector RT = new PVector (l2 * cos(phia), l2 * sin(phia));
  PVector T = new PVector (R.x + RT.x, R.y + RT.y);
  float c = .5 * sqrt(pow(T.x - S.x, 2) + pow(T.y - S.y, 2));
  float d = sqrt(pow(l2, 2) - pow(c, 2));
  float mst = (T.y - S.y)/(T.x - S.x);
  float mnu = -1/mst;
  PVector N = new PVector(.5 * (S.x + T.x), .5 * (S.y + T.y));
  PVector NU = new PVector(d * cos(atan(mnu)), d * sin(atan(mnu)));
  PVector U = new PVector(N.x + NU.x, N.y + NU.y);

  fill(100);
  ellipse(U.x, U.y, 1, 1);
}
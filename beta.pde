PFont f;

void setup() {

  size(1000, 500);
  background(255);
  stroke(0, 0, 0, 0); 
  fill(150);
  frameRate(24);

  f = createFont("Arial", 16, true);
}

void draw() {
  background(255);
  textFont(f, 16); 

  PVector origin = new PVector(width/5, height/3);

  float ra = 75;
  float rb = 75;
  float del = 10;
  float l1 = 165;
  float l2 = 130;
  float l3 = 100;

  float wwidth = width;
  float wheight = height;

  float thetaa = (mouseX / wwidth)*2*PI;
  float thetab = (mouseY / wheight)*2*PI;
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


  stroke(150);
  line(A.x, A.y, P.x, P.y);
  line(B.x, B.y, Q.x, Q.y);
  line(P.x, P.y, R.x, R.y);
  line(Q.x, Q.y, R.x, R.y);
  line(R.x, R.y, S.x, S.y);
  line(R.x, R.y, T.x, T.y);
  line(S.x, S.y, U.x, U.y);
  line(T.x, T.y, U.x, U.y);
  

  fill(#ff0000);
  stroke(255);
  text("A", A.x, A.y);
  text("B", B.x, B.y);
  text("P", P.x, P.y);
  text("Q", Q.x, Q.y);
  text("M", M.x, M.y);
  text("R", R.x, R.y);
  text("S", S.x, S.y);
  text("T", T.x, T.y);
  text("U", U.x, U.y);
}
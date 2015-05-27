PFont f;

void setup() {

  size(500, 500);
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
  float r1 = 75;
  float r2 = 75;
  float d = 10;
  float a = 165;

  float wwidth = width;
  float wheight = height;

  float phi1 = (mouseX / wwidth)*2*PI;
  float phi2 = (mouseY / wheight)*2*PI;
  //  phi1 = 0.3;
  //  phi2 = 0.4;

  PVector O1, O2;
  O1 = new PVector(origin.x, origin.y);
  O2 = new PVector(origin.x, origin.y + r1 + r2 + d);

  noFill();
  stroke(200);
  ellipse(O1.x, O1.y, 2*r1, 2*r1);
  ellipse(O2.x, O2.y, 2*r2, 2*r2);

  PVector p = new PVector(O1.x + r1*cos(phi1), O1.y + r1*sin(phi1));
  PVector q = new PVector(O2.x + r2*cos(phi2), O2.y + r2*sin(phi2));
  stroke(1);
  line(O1.x, O1.y, p.x, p.y);
  line(O2.x, O2.y, q.x, q.y);

  PVector m = new PVector(.5*(p.x + q.x), .5*(p.y + q.y));
  stroke(200);
  line(p.x, p.y, q.x, q.y);

  PVector pq =  PVector.sub(p, q);
  float pq_slope = (q.y-p.y)/(q.x-p.x);
  float pq_len = PVector.dist(p, q);
  float mr_slope = -1/pq_slope;
  float mr_len = sqrt(pow(a, 2) - pow(pq_len/2, 2));
  float mr_unit = sqrt(mr_len*mr_len / (1 + mr_slope*mr_slope));

  PVector r = new PVector(m.x + mr_unit, m.y + mr_slope * mr_unit);
  stroke(200);
  line(m.x, m.y, r.x, r.y);
  stroke(0);
  line(p.x, p.y, r.x, r.y);
  line(q.x, q.y, r.x, r.y);

  noFill();
  stroke(200);
  ellipse(p.x, p.y, 2*a, 2*a);
  ellipse(q.x, q.y, 2*a, 2*a);

  fill(#ff0000);
  stroke(255);
  text("O1", O1.x, O1.y);
  text("O2", O2.x, O2.y);
  text("p", p.x, p.y);
  text("q", q.x, q.y);
  //  text("m", m.x, m.y);
  text("r", r.x, r.y);
}
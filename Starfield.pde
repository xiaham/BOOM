Particles[] particles;
//your code here
int rgb;
void setup()
{
  particles = new Particles[5000];
  for(int i =0; i <particles.length ; i++)
  {
    particles[i] = new NormalParticle();
    particles[1] = new OddballParticle();
    particles[2] = new JumboParticle();
    particles[3] = new JumboParticle();
    particles[4] = new JumboParticle();
    
  }
	size(500,500);//your code here
}
void draw()
{
  background(142,238,242);
  stroke(98,23,23);
  fill(98,23,23);
  quad(250-50,250,250+50,250,600,500,-100,500);
  rgb = (int)(Math.random()*256); //your code here
  stroke(255,0,0);
  fill(255,0,0);
  for(int i =0; i <particles.length ; i++)
  {
    particles[i].move();
    particles[i].show();
  }
}
class NormalParticle implements Particles
{
	double dX, dY, dTheta, dSpeed;//your code here
  NormalParticle()
  {
    dX = 250;
    dY = 250;
    dTheta = Math.random()*1.2*Math.PI + 0.9*Math.PI;
    dSpeed = Math.random()*10;
  }
  public void move()
  {
    dX = dX + dSpeed*Math.cos(dTheta);
    dY = dY + dSpeed*Math.sin(dTheta);
    if(dX >500 || dX <0 || dY <0)
    {
      dX = 250;
      dY = 250;
    }
  }
  public void show()
  {
    ellipse((float)dX,(float)dY,2,2);
  }
}
class OddballParticle implements Particles//uses an interface
{
	int myX,myY; //your code here
  OddballParticle()
  {
    myX = 250;
    myY = 390;
  }
  public void show()
  {
    stroke(0);
    fill(255);
    line(myX,myY, myX, myY+80);
    line(myX,myY+40,myX-30,myY+15);
    line(myX,myY+40,myX+30,myY+15);
    line(myX,myY+80,myX-20,myY+105);
    line(myX,myY+80,myX+20,myY+105);
    ellipse(myX,myY,50,50);
    ellipse(myX-10,myY,15,15);
    ellipse(myX+10,myY,15,15);
    ellipse(myX-10,myY,1,1);
    ellipse(myX+10,myY,1,1);
    fill(240,99,99);
    ellipse(myX,myY+15,17,11);
    stroke(255,0,0);
    fill(255,0,0);
  }
  public void move()
  {
    myX = myX + (int)(Math.random()*15)-7;
    myY = myY + (int)(Math.random()*3)-1;
  }
}
class JumboParticle extends NormalParticle //uses inheritance
{
	public void show()//your code here
  {
    fill(255,171,3);
    stroke(255,171,3);
    ellipse((float)dX,(float)dY,20,20);
    stroke(255,0,0);
    fill(255,0,0);
  }

}
interface Particles
{
  public void show();
  public void move();
}
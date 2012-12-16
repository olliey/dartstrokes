library graphics;
import 'dart:math' as Math;

degrees(r){
  return r*(180/Math.PI);
}

sign(a){
  if(a==0){return 0;}
  if(a<0){return -1;}
  if(a>0){return 1;}
}

angle(vector,vectortwo){
  var a=dot(vector,vectortwo);
  var b=absolute(vector)*absolute(vectortwo);
  var c=new vec2.raw(0,0);
  var d=-sign(cross(vector,vectortwo));
  var e=Math.acos(a/b);
  var f=(Math.PI*2)*(((d*d)+d)/2);
  var g=f-e;
  var h=g.abs();
  return h;
  }

absolute(vec){
  var a=(vec.x*vec.x)+(vec.y*vec.y);
  return Math.sqrt(a);
}

cross(vec1,vec2){
  return ((vec1.x*vec2.y)-(vec1.y*vec2.x));
}

dot(vectorone, vectortwo){
  return (vectorone.x*vectortwo.x)+(vectorone.y*vectortwo.y);
}

class vec2{
  var x;
  var y;
  vec2.raw(this.x,this.y);
  add(other)=> new vec2.raw(other.x+x,other.y+y);
  sub(other)=> new vec2.raw(x-other.x,y-other.y);
}


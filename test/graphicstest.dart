import 'package:strokes/graphics.dart';
import 'package:unittest/unittest.dart';
import 'dart:math' as Math;

main(){
  /*
  test('A negative number returns -1',() {
      expect(sign(-3),-1);
    });
  test('A Positive number returns 1',(){
      expect(sign(5),1);
    });
  test('A zero returns 0',(){
      expect(sign(0),0);
    });
  test('Create a vector with the raw constructor, values are correct',(){
      var vector=new vec2.raw(1,3);
      expect(vector.x,1);
      expect(vector.y,3);
      expect(sign(vector.y),1);
      var vectortwo=new vec2.raw(-5,0);
      expect(sign(vectortwo.x),-1);
      expect(sign(vectortwo.y),0);
    });
  test('The degrees function',(){
      expect(degrees(Math.PI),180);
    });
  test('The absolute function',(){
      var vector=new vec2.raw(1,1);
      var vectortwo=new vec2.raw(3,4);
      expect(absolute(vectortwo),5);
    });
  
  test('cross product function returns the right values',(){
      var vector=new vec2.raw(0,0);
      var vectortwo=new vec2.raw(0,1);
      var vectorthree=new vec2.raw(1,0);
      expect(cross(vectortwo,vectorthree),-1);
    });
    test('cross product function returns the right values',(){
      var vector=new vec2.raw(0,0);
      var vectortwo=new vec2.raw(0,1);
      var vectorthree=new vec2.raw(-1,0);
      expect(cross(vectortwo,vectorthree),1);
    });
      test('cross product function returns the right values',(){
      var vector=new vec2.raw(0,0);
      var vectortwo=new vec2.raw(0,1);
      var vectorthree=new vec2.raw(1,1);
      expect(cross(vectortwo,vectorthree),1);
    });
        test('cross product function returns the right values',(){
      var vector=new vec2.raw(0,0);
      var vectortwo=new vec2.raw(0,1);
      var vectorthree=new vec2.raw(-1,-1);
      expect(cross(vectortwo,vectorthree),1);
    });
  test('dot product',(){
      var vector=new vec2.raw(0,0);
      var vectortwo=new vec2.raw(0,-1);
      var vectorthree=new vec2.raw(1,0);
      var abs=absolute(vectortwo)*absolute(vectorthree);
      var dot=dot(vectortwo,vectorthree);
      var absdot=dot/abs;
      expect(absdot,0);
    });
  */
  test('angle equation 0 degrees',(){
      var vector=new vec2.raw(0,0);
      var vectortwo=new vec2.raw(1,0);
      var vectorthree=new vec2.raw(1,0);
      expect(angle(vectortwo,vectorthree),0);
    });
  test('angle equation 45 degrees',(){
      var vector=new vec2.raw(0,0);
      var vectortwo=new vec2.raw(1,0);
      var vectorthree=new vec2.raw(1,1);
      expect(angle(vectortwo,vectorthree),Math.PI/4);
    });
  test('angle equation 270 degrees',(){
      var vector=new vec2.raw(0,0);
      var vectortwo=new vec2.raw(1,0);
      var vectorthree=new vec2.raw(0,-1);
      expect(angle(vectortwo,vectorthree),6*(Math.PI/4));
    });
  test('angle equation 180 degrees',(){
      var vector=new vec2.raw(0,0);
      var vectortwo=new vec2.raw(1,0);
      var vectorthree=new vec2.raw(-1,0);
      expect(angle(vectortwo,vectorthree),Math.PI);
    });
  test('angle equation 135 degrees',(){
      var vector=new vec2.raw(0,0);
      var vectortwo=new vec2.raw(1,0);
      var vectorthree=new vec2.raw(-1,1);
      expect(angle(vectortwo,vectorthree),3*Math.PI/4);
    });
  test('angle equation 5Pi/4 degrees',(){
      var vector=new vec2.raw(0,0);
      var vectortwo=new vec2.raw(1,0);
      var vectorthree=new vec2.raw(-1,-1);
      expect(angle(vectortwo,vectorthree),5*Math.PI/4);
    });
  test('angle equation blah 30 degrees',(){
      var vectortwo=new vec2.raw(1,0);
      var vectorthree=new vec2.raw(1,0.5);
      expect(angle(vectortwo,vectorthree),Math.PI/6);
    });
  var listofvectors=new List();
  for(var i=0;i<10;i++){
    for(var j=0;j<10;j++){
      listofvectors.add(new vec2.raw(i,j));      
    }
  }
  for(var vector in listofvectors){
    print("x: ");
    print(vector.x);
    print("y: ");
    print(vector.y);
  }
  }
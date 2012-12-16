library strokes;
import 'package:strokes/graphics.dart';
import 'dart:math' as Math;

class Point {
  num x;
  num y;
  Point(this.x, this.y);
  add(Point other) => new Point(other.x+x, other.y+y);
}

class Segment{
  var absoluteStartingPosition=new vec2.raw(0,0);
  var absoluteFinishingPosition=new vec2.raw(0,0);
  var unitEastVector=new vec2.raw(1,0);
  var SVGPathSegComponent;
  Segment.basic(SVGPathSegParamater){
    this.SVGPathSegComponent=SVGPathSegParamater; 
  }
}

class MoveToSegment extends Segment{
  var startingPosition;
  MoveToSegment(param):super.basic(param){
    startingPosition=new vec2.raw(param.x,param.y);
  }
  absolutePositionFunc(x){
    absoluteStartingPosition=startingPosition;
    absoluteFinishingPosition=startingPosition;
    return absoluteFinishingPosition;
  }
  angleFunction(){
      return null;
  }
}

class QuadraticCurveSegment extends Segment{
  var finalPosition;
  var modifierPosition;
  var initialAngle;
  var finalAngle;
  QuadraticCurveSegment(param):super.basic(param){
    finalPosition=new vec2.raw(param.x,param.y);
    modifierPosition=new vec2.raw(param.x1,param.y1);
  }
  absolutePositionFunc(x){
    absoluteStartingPosition=x;
    absoluteFinishingPosition=x.add(finalPosition);
    return absoluteFinishingPosition;
  }
  angleFunction(){
    initialAngle=angle(unitEastVector,modifierPosition);
    var modifierPositionRelatedToFinalPosition=modifierPosition.sub(finalPosition);
    finalAngle=angle(unitEastVector,modifierPositionRelatedToFinalPosition);
  }
}

class VerticalLineToSegment extends Segment{
  var finalPosition;
  var initialAngle;
  var finalAngle;
  VerticalLineToSegment(param):super.basic(param){
    finalPosition=new vec2.raw(0,param.y);
  }
  absolutePositionFunc(x){
    absoluteStartingPosition=x;
    absoluteFinishingPosition=x.add(finalPosition);
    return absoluteFinishingPosition;
  }
  angleFunction(){
    initialAngle=angle(unitEastVector,finalPosition);
    finalAngle=initialAngle+Math.PI;
  }
}

class LineToSegment extends Segment{
  var finalPosition;
  var initialAngle;
  var finalAngle;
  LineToSegment(param):super.basic(param){
    finalPosition=new vec2.raw(param.x,param.y);
  }
  absolutePositionFunc(x){
    absoluteStartingPosition=x;
    absoluteFinishingPosition=x.add(finalPosition);
    return absoluteFinishingPosition;
  }
  angleFunction(){
    initialAngle=angle(unitEastVector,finalPosition);
    var zeroVector=new vec2.raw(0,0);
    var invertedFinalPosition=zeroVector.sub(finalPosition);
    finalAngle=angle(unitEastVector,invertedFinalPosition);
  }
}

class ClosePathSegment extends Segment{
  ClosePathSegment(param):super.basic(param);
  absolutePositionFunc(x){
    absoluteStartingPosition=x;
    absoluteFinishingPosition=x;
    return absoluteFinishingPosition;
  }
  angleFunction(){
      return null;
  }
}

class SmoothQuadraticCurveSegment extends Segment{
  var finalPosition;
  var modifierPosition;
  var previousSegment;
  SmoothQuadraticCurveSegment(param,paramTwo):super.basic(param){
    previousSegment=pathSegSelector(param-1,paramTwo);
    finalPosition=new vec2.raw(paramTwo[param].x,paramTwo[param].y);
    modifierPosition=new vec2.raw(0,0);
  }
  absolutePositionFunc(x){
    absoluteStartingPosition=x;
    absoluteFinishingPosition=x.add(finalPosition);
    return absoluteFinishingPosition;
  }
  angleFunction()=> null;
}

class Character{
  var currentSegment;
  var rawSVGPathSegs;
  var applicationSegments=new List();
  var segmentIndex=0;
  var currentAbsolutePosition=new vec2.raw(0,0);
  Character.fromPathSegList(SVGPathSegmentsParameter){
    this.rawSVGPathSegs=SVGPathSegmentsParameter;
  }
  initialiseSegments(){
    for(var i=0;i<rawSVGPathSegs.length;i++){
      applicationSegments.add(pathSegSelector(i,rawSVGPathSegs));
    }
  }
  initialiseSegmentPositions(){
    for(var appSeg in applicationSegments){
      currentAbsolutePosition=appSeg.absolutePositionFunc(currentAbsolutePosition);
    }
  }
  calculateAngles(){
    for(var appSeg in applicationSegments){
      appSeg.angleFunction();
    }
  }
}

pathSegSelector(index,params){
  switch(params[index].pathSegTypeAsLetter){
  case 'M':
    return new MoveToSegment(params[index]);
    break;
  case 'q':
    return new QuadraticCurveSegment(params[index]);
    break;
  case 'v':
    return new VerticalLineToSegment(params[index]);
    break;
  case 'l':
    return new LineToSegment(params[index]);
    break;
  case 't':
    return new SmoothQuadraticCurveSegment(index,params);
    break;
  case 'Z':
    return new ClosePathSegment(params[index]);
    break;
  default:
    print("Unknown Segment type");
    print(params[index]);
    return null;
  }
}






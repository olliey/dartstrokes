import 'dart:math';
import 'dart:html';
import 'dart:svg';
import 'package:strokes/script.dart';

boxAnnotate(svg,transform){
  var mysvg=query(svg);
  var boxGElement=new SvgElement.tag('g');
  mysvg.$dom_appendChild(boxGElement);  
  boxGElement.$dom_setAttribute('transform','$transform');
  return boxGElement;
}

rectAnnotate(gElementParam,posParam){
  var rectElement=new SvgElement.tag('rect');
  gElementParam.$dom_appendChild(rectElement);
  rectElement.$dom_setAttribute('x',posParam.x.toString());
  rectElement.$dom_setAttribute('y',posParam.y.toString());
  rectElement.$dom_setAttribute('height','10');
  rectElement.$dom_setAttribute('fill','red');
  rectElement.$dom_setAttribute('width','10');
}

main() {
  var path=query('#vg').$dom_firstElementChild.$dom_firstElementChild;
  var pathSegList=path.pathSegList;
  var localSegments=new List();
  for (int i=0;i<pathSegList.numberOfItems;i++){
    localSegments.add(pathSegList.getItem(i));
  }
  var char=new Character.fromPathSegList(localSegments);
  char.initialiseSegments();
  var gelem=boxAnnotate('#vg','matrix(1 0 0 -1 0 900)');
  char.initialiseSegmentPositions();
  for(var appSeg in char.applicationSegments){
    rectAnnotate(gelem,appSeg.absoluteFinishingPosition);
  }
  char.calculateAngles();
}

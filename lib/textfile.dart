import 'package:flutter/material.dart';


class TextChange1{
  dynamic TxChange(double tx1,double tx2,double txcon){
    if((tx1+tx2)>txcon){
     tx1=tx1/2;
      return tx1;
    }
  }
  dynamic TxChange2(double tx1,double tx2,double txcon){
    if((tx1+tx2)>txcon){
      tx2=tx2/2;
      return tx2;
    }
  }
}





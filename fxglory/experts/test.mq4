//+------------------------------------------------------------------+
//|                                       custom_strategy_zigzag.mq4 |
//|                                              Manish Khanchandani |
//|                                              http://mkgalaxy.com |
//+------------------------------------------------------------------+
#property copyright "Manish Khanchandani"
#property link      "http://mkgalaxy.com"
int opentime;
int opentime2;
//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
  {
//----
   custom_start();
   
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert deinitialization function                                 |
//+------------------------------------------------------------------+
int deinit()
  {
//----
   
//----
   return(0);
  }
//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
int start()
  {
   custom_start();
   return(0);
  }
//+------------------------------------------------------------------+

int custom_start()
{
   double val1 = iCustom(Symbol(),0,"ZigZag",150,5,3,0,3);
   double val2 = Open[3];
   double val3 = iCustom(Symbol(),0,"ZigZag",150,5,3,0,3);
   double val4 = Open[3];
   bool sell = val1  >  val2;
   bool buy = val3  <  val4;
   string info2 = "";
   if ((sell || buy) && opentime != Time[0]) {
      info2 = StringConcatenate(Symbol(), ", sell: ", sell, ", buy: ", buy);
      opentime = Time[0];
   }
   //part II semaphore
   double ZZ_1, ZZ_2;
   double Period1            = 28;
   double Period2            = 56;
   double Period3            = 112;
   string Dev_Step_1         ="3,9";
   string Dev_Step_2         ="24,15";
   string Dev_Step_3         ="63,36";
   int Symbol_1_Kod          =140;
   int Symbol_2_Kod          =141;
   int Symbol_3_Kod          =142;
    ZZ_1=iCustom(Symbol(),0,"3_Level_ZZ_Semafor",Period1,Period2,Period3,Dev_Step_1,Dev_Step_2,Dev_Step_3,Symbol_1_Kod,Symbol_2_Kod,Symbol_3_Kod,5,3);
   ZZ_2=iCustom(Symbol(),0,"3_Level_ZZ_Semafor",Period1,Period2,Period3,Dev_Step_1,Dev_Step_2,Dev_Step_3,Symbol_1_Kod,Symbol_2_Kod,Symbol_3_Kod,4,3);
   bool sell2 = ZZ_1 > ZZ_2;
   bool buy2 = ZZ_1 < ZZ_2;
   string info = "";
   if ((sell2 || buy2) && opentime2 != Time[0]) {
      info = StringConcatenate(Symbol(), ", sell2: ", sell2, ", buy2: ", buy2);
      Alert(info);
      opentime2 = Time[0];
   }
   Comment(
      "Val1: ", DoubleToStr(val1, Digits),
      "\nVal2: ", DoubleToStr(val2, Digits),
      "\nval3: ", DoubleToStr(val3, Digits),
      "\nval4: ", DoubleToStr(val4, Digits),
      "\nSell: ", sell,
      "\nbuy: ", buy,
      "\nZZ_1: ", DoubleToStr(ZZ_1, Digits),
      "\nZZ_2: ", DoubleToStr(ZZ_2, Digits),
      "\nSell: ", sell2,
      "\nbuy: ", buy2,
      "\ninfo: ", info,
      "\ntest: ", iCustom(Symbol(),0,"3_Level_ZZ_Semafor",Period1,Period2,Period3,Dev_Step_1,Dev_Step_2,Dev_Step_3,Symbol_1_Kod,Symbol_2_Kod,Symbol_3_Kod,5,0),
      "\ntest2: ", iCustom(Symbol(),0,"3_Level_ZZ_Semafor",Period1,Period2,Period3,Dev_Step_1,Dev_Step_2,Dev_Step_3,Symbol_1_Kod,Symbol_2_Kod,Symbol_3_Kod,4,0));
//----
}
********************************************************************
* A0.td   production cycle for SP-MB 5236658 / 0414799005
********************************************************************
*
* change date: 20/08/12
* by:          João Bueno - CtP/MSP11 and Andre Horn  - CtP/MSP11
* notes:	
*
*	08-jul-99 Tightened 4RTBip tolerance from .74 +/- .2ms to
*	            .71 +.05 -.07ms   
*
*	29/11/01 	Change the Tolerance from RT Bip to offer drawing values ( .74 +/- .2ms)
*			Include the Spilltimethreshold = 150 bar
*			Change control for KFMG Temperature (from 0ºC until 60ºC to 35ºC until 60ºC )
*
*	18/07/02	Change control for KFMG Temperature (from  35ºC to 32ºC)
*
*	12/03/07	Cycle reduction conforme SM/FM F000UP0131 ( AeAS 002013879)
*
*	18/07/08	Change the parameter PeakPressureOffset,PeakPressure, DeltaPeakPressure (SAC 8000006542)
*			Parameter PeakPressureOffset was modified according value of PeakPressure = 1790 bar in ofer draw
*
*	10/12/2008	Added tolerance to point open restriction - The same value as HoP1 - 45±40bar - Due valve stroke problem on field
*
*	18/03/2009	Change Open Restriction tolerance from 65 to 60 bar. According prescription F00041P056. only for CtP.
*
*	16/05/2011	Cycle reduction according ECR 2054126
*
*	20/08/2012	Added tolerance (From 999.9 to 4.0) to point DeliveryStdDev according 8D 230003599414
*
header       *================================
   TypDataVersion =         "A0v04c03"
   PumpType=                "SP" 
   FixtureType=             "SP"
   CamboxType=              "18.01"
   NozzleType=              "1800"
   PowerStageType=          "637.05"
   LubricationOfTestSample= on
*   DumpPeak=                on
*   DumpResult=              on
end_header   *--------------------------------


steps        *================================

general
      PSGAutoResetMax = 10    *Resetses bip event 10 times
      P0Inlet=                  (set=   3.0, min=   1.5, max=   4.5, Display= off, Exception= SOFTENDFAULT)
      P0Return=                 (set=   3.0, min=   1.5, max=   4.5, Display= off, Exception= SOFTENDFAULT)
end_general


teststep= 1   *111111111111111111111111111111
   set
      DisplaySetValues    = off
      TEurothermSetPoint=   40.0
      Speed=                   (set= 300.0, min= 200.0, max= 1000.0, Display= off, Exception= WARNING) 
      Alpha3=               32.0
      Alpha4=                8.0
      SetInjection=         on
   end_set
   wait
      WaitTime=    3
   end_wait
   measure
      AnalogInNo= 1
      TInlet=                  (set=  40.0, min=  0.0, max= 100.0, Display= off, Exception= SOFTENDFAULT)
      TReturn=                 (set=  40.0, min=   0.0, max= 100.0, Display= off, Exception= SOFTENDFAULT)
   end_measure
   reset
   end_reset
   end_teststep


teststep= 2   *222222222222222222222222222222
   set
      DisplaySetValues    = off
      TEurothermSetPoint=   40.0
      Speed=                   (set= 290.0, min= 275.0, max=2000.0, Display= off, Exception= WARNING)
      Alpha3=               32.0
      Alpha4=                2.05
      SetInjection=         on
   end_set

   wait
      WaitTime=   7
   end_wait

   measure
      AnalogInNo= 5
      PInlet=                  (set=   6.0, min=  5.85, max=  6.15, Display= off, Exception= RUNONFAULT, Timeout=600)
      PReturn=                 (set=   6.0, min=   5.6, max=   6.2, Display= off, Exception= RUNONFAULT, Timeout=600)
      TInlet=                  (set=  40.0, min=  30.0, max=  50.0, Display= on, Exception= SOFTENDFAULT)
      TReturn=                 (set=  40.0, min=  20.0, max=  70.0, Display= off, Exception= SOFTENDFAULT)
      OverflowNo= 1      
      Overflow=                (set=  60.0, min=  55.0, max=  65.0, Display= off, Exception= RUNONFAULT, Timeout=600)
      DeliveryNo= 5
      Delivery=                (set=  16.0, min=   5.0, max=  999.9, Display=  on, Exception= WARNING)
      DeliveryStdDev=          (set=   0.0, min=   0.0, max= 999.9, Display= off, Exception= WARNING)
      CopyDelivery2NW        = off
   end_measure

   reset
   end_reset

   end_teststep


teststep= 3   *333333333333333333333333333333
   set
      DisplaySetValues    = off
      TEurothermSetPoint=   90.0
      Speed=                   (set= 1100.0, min= 880.0, max=2000.0, Display= off, Exception= WARNING)
      Alpha3=               32.0
      Alpha4=               14.0
      SetInjection=         on
   end_set
   wait
      WaitTime=   8
   end_wait
   measure
      AnalogInNo= 1
      TInlet=                  (set=  70.0, min=   0.0, max= 100.0, Display= off, Exception= SOFTENDFAULT)
      TReturn=                 (set=  70.0, min=   0.0, max= 100.0, Display= off, Exception= SOFTENDFAULT)
   end_measure
   reset
   end_reset
   end_teststep


teststep= 4   *444444444444444444444444444444
   set
      DisplaySetValues    = off
      TEurothermSetPoint=   40.0
      Speed=                   (set= 900.0, min=   0.0, max=2000.0, Display= off, Exception= WARNING)
      Alpha3=               32.0
      Alpha4=               11.75
      SetInjection=         on
   end_set

   wait
      WaitTime=   18
   end_wait

   measure
      AnalogInNo= 20
      TInlet=                  (set=  40.0, min=  38.5, max=  42.5, Display= off, Exception= SOFTENDFAULT)
      TReturn=                 (set=  40.0, min=  20.0, max=  70.0, Display= off, Exception= SOFTENDFAULT)
      TKFMG=                   (set=  40.0, min=  32.0, max=  55.0, Display= off, Exception= SOFTENDFAULT)
      OverflowNo= 1
      Overflow=                (set=  60.0, min=  55.0, max=  65.0, Display= off, Exception= RUNONFAULT, Timeout=600)
      DeliveryNo= 20
      Delivery=                (set= 265.0, min= 254.4, max= 275.6, Display=  on, Exception= WARNING)
      DeliveryStdDev=          (set=   0.0, min=   0.0, max= 4.0, Display= on, Exception= WARNING)
      CopyDelivery2NW        = on
      PeakPressureNo= 50
      PeakPressure=            (set=1790.0, min=-9999.0, max=9999.0, Display=  on, Exception= WARNING)
      PeakPressureStdDev=      (set=   0.0, min=    0.0, max=  999.0, Display= off, Exception= WARNING)
      PeakPressureOffset      = 11.85
      PeakPressureSlope       = 6.71
      DeltaPeakPressure=       (set= 80.0, min=-80.0, max= 80.0, Display=  on, Exception= WARNING)
      CopyDeltaPeakPressure2NW    = on
      RisetimeBIP=             (set= 0.740, min= 0.540, max= 0.940, Display=  on, Exception= WARNING)
      RisetimeBIPStdDev=       (set=   0.0, min=   0.0, max= 999.9, Display= off, Exception= WARNING)
      RisetimePressure=        (set=   1.0, min=   0.0, max= 999.9, Display= off, Exception= WARNING)
      RisetimeThresholdStdDev =(set=   0.0, min=   0.0, max= 999.9, Display= off, Exception= WARNING)
      CopyRisetimeBIP2NW     = on
      AlphaOR                 =30.0
      OpenRestriction         =(set=  45.0, min=5.0, 	max=75.0, Display= on, Exception= WARNING)
      OpenRestrictionStdDev   =(set=   1.0, min=-9999.0, max=9999.9, Display= off, Exception= WARNING)
      EOCPressure             =(set=   1.0, min=   0.0, max=9999.9, Display= off, Exception= WARNING)
      EOCPressureStdDev       =(set=   1.0, min=   0.0, max=9999.9, Display= off, Exception= WARNING)
      PeakTime                =(set=   1.0, min=   0.0, max=9999.9, Display= off, Exception= WARNING)
      PeakTimeStdDev          =(set=   1.0, min=   0.0, max=9999.9, Display= off, Exception= WARNING)
      OpeningTime             =(set=   1.0, min=   0.0, max=9999.9, Display= off, Exception= WARNING)
      OpeningTimeStdDev       =(set=   1.0, min=   0.0, max=9999.9, Display= off, Exception= WARNING)
      SpillTime               =(set=   1.0, min=   0.0, max=9999.9, Display= off, Exception= WARNING)
      SpillTimeStdDev         =(set=   1.0, min=   0.0, max=9999.9, Display= off, Exception= WARNING)
      SpilltimeThreshold = 150.0
   end_measure

   reset
   end_reset

   end_teststep

end_steps

generalreset       *------------------------------------------------
end_generalreset   *------------------------------------------------


*  end of file
* ******************************************************************


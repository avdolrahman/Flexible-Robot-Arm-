  function targMap = targDataMap(),

  ;%***********************
  ;% Create Parameter Map *
  ;%***********************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 3;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc paramMap
    ;%
    paramMap.nSections           = nTotSects;
    paramMap.sectIdxOffset       = sectIdxOffset;
      paramMap.sections(nTotSects) = dumSection; %prealloc
    paramMap.nTotData            = -1;
    
    ;%
    ;% Auto data (test_P)
    ;%
      section.nData     = 16;
      section.data(16)  = dumData; %prealloc
      
	  ;% test_P.A
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% test_P.B
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 16;
	
	  ;% test_P.C
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 20;
	
	  ;% test_P.K
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 24;
	
	  ;% test_P.Ke
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 28;
	
	  ;% test_P.Kp
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 29;
	
	  ;% test_P.M
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 30;
	
	  ;% test_P.Nbar
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 34;
	
	  ;% test_P.AnalogOutput_FinalValue
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 35;
	
	  ;% test_P.AnalogOutput_InitialValue
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 36;
	
	  ;% test_P.Potentiometer_MaxMissedTicks
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 37;
	
	  ;% test_P.StrainGage_MaxMissedTicks
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 38;
	
	  ;% test_P.AnalogOutput_MaxMissedTicks
	  section.data(13).logicalSrcIdx = 12;
	  section.data(13).dtTransOffset = 39;
	
	  ;% test_P.Potentiometer_YieldWhenWaiting
	  section.data(14).logicalSrcIdx = 13;
	  section.data(14).dtTransOffset = 40;
	
	  ;% test_P.StrainGage_YieldWhenWaiting
	  section.data(15).logicalSrcIdx = 14;
	  section.data(15).dtTransOffset = 41;
	
	  ;% test_P.AnalogOutput_YieldWhenWaiting
	  section.data(16).logicalSrcIdx = 15;
	  section.data(16).dtTransOffset = 42;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(1) = section;
      clear section
      
      section.nData     = 9;
      section.data(9)  = dumData; %prealloc
      
	  ;% test_P.Potentiometer_Channels
	  section.data(1).logicalSrcIdx = 16;
	  section.data(1).dtTransOffset = 0;
	
	  ;% test_P.StrainGage_Channels
	  section.data(2).logicalSrcIdx = 17;
	  section.data(2).dtTransOffset = 1;
	
	  ;% test_P.AnalogOutput_Channels
	  section.data(3).logicalSrcIdx = 18;
	  section.data(3).dtTransOffset = 2;
	
	  ;% test_P.Potentiometer_RangeMode
	  section.data(4).logicalSrcIdx = 19;
	  section.data(4).dtTransOffset = 3;
	
	  ;% test_P.StrainGage_RangeMode
	  section.data(5).logicalSrcIdx = 20;
	  section.data(5).dtTransOffset = 4;
	
	  ;% test_P.AnalogOutput_RangeMode
	  section.data(6).logicalSrcIdx = 21;
	  section.data(6).dtTransOffset = 5;
	
	  ;% test_P.Potentiometer_VoltRange
	  section.data(7).logicalSrcIdx = 22;
	  section.data(7).dtTransOffset = 6;
	
	  ;% test_P.StrainGage_VoltRange
	  section.data(8).logicalSrcIdx = 23;
	  section.data(8).dtTransOffset = 7;
	
	  ;% test_P.AnalogOutput_VoltRange
	  section.data(9).logicalSrcIdx = 24;
	  section.data(9).dtTransOffset = 8;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(2) = section;
      clear section
      
      section.nData     = 5;
      section.data(5)  = dumData; %prealloc
      
	  ;% test_P.DiscreteTimeIntegrator1_gainval
	  section.data(1).logicalSrcIdx = 25;
	  section.data(1).dtTransOffset = 0;
	
	  ;% test_P.DiscreteTimeIntegrator1_IC
	  section.data(2).logicalSrcIdx = 26;
	  section.data(2).dtTransOffset = 1;
	
	  ;% test_P.Reference_Amplitude
	  section.data(3).logicalSrcIdx = 27;
	  section.data(3).dtTransOffset = 2;
	
	  ;% test_P.Reference_Frequency
	  section.data(4).logicalSrcIdx = 28;
	  section.data(4).dtTransOffset = 3;
	
	  ;% test_P.UnitDelay_InitialCondition
	  section.data(5).logicalSrcIdx = 29;
	  section.data(5).dtTransOffset = 4;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(3) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (parameter)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    paramMap.nTotData = nTotData;
    


  ;%**************************
  ;% Create Block Output Map *
  ;%**************************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 1;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc sigMap
    ;%
    sigMap.nSections           = nTotSects;
    sigMap.sectIdxOffset       = sectIdxOffset;
      sigMap.sections(nTotSects) = dumSection; %prealloc
    sigMap.nTotData            = -1;
    
    ;%
    ;% Auto data (test_B)
    ;%
      section.nData     = 8;
      section.data(8)  = dumData; %prealloc
      
	  ;% test_B.DiscreteTimeIntegrator1
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% test_B.ref
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% test_B.yk
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% test_B.K
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% test_B.Sum3
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% test_B.Gain3
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 5;
	
	  ;% test_B.Sum
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 9;
	
	  ;% test_B.Sum1
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 13;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(1) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (signal)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    sigMap.nTotData = nTotData;
    


  ;%*******************
  ;% Create DWork Map *
  ;%*******************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 2;
    sectIdxOffset = 1;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc dworkMap
    ;%
    dworkMap.nSections           = nTotSects;
    dworkMap.sectIdxOffset       = sectIdxOffset;
      dworkMap.sections(nTotSects) = dumSection; %prealloc
    dworkMap.nTotData            = -1;
    
    ;%
    ;% Auto data (test_DW)
    ;%
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% test_DW.DiscreteTimeIntegrator1_DSTATE
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% test_DW.UnitDelay_DSTATE
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(1) = section;
      clear section
      
      section.nData     = 4;
      section.data(4)  = dumData; %prealloc
      
	  ;% test_DW.Potentiometer_PWORK
	  section.data(1).logicalSrcIdx = 2;
	  section.data(1).dtTransOffset = 0;
	
	  ;% test_DW.StrainGage_PWORK
	  section.data(2).logicalSrcIdx = 3;
	  section.data(2).dtTransOffset = 1;
	
	  ;% test_DW.AnalogOutput_PWORK
	  section.data(3).logicalSrcIdx = 4;
	  section.data(3).dtTransOffset = 2;
	
	  ;% test_DW.Scope_PWORK.LoggedData
	  section.data(4).logicalSrcIdx = 5;
	  section.data(4).dtTransOffset = 3;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(2) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (dwork)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    dworkMap.nTotData = nTotData;
    


  ;%
  ;% Add individual maps to base struct.
  ;%

  targMap.paramMap  = paramMap;    
  targMap.signalMap = sigMap;
  targMap.dworkMap  = dworkMap;
  
  ;%
  ;% Add checksums to base struct.
  ;%


  targMap.checksum0 = 3268646940;
  targMap.checksum1 = 4269640258;
  targMap.checksum2 = 3739234049;
  targMap.checksum3 = 4058104812;


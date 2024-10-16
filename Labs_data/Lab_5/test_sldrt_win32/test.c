/*
 * test.c
 *
 * Code generation for model "test".
 *
 * Model version              : 1.46
 * Simulink Coder version : 8.8 (R2015a) 09-Feb-2015
 * C source code generated on : Wed Oct 16 19:07:24 2024
 *
 * Target selection: rtwin.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86/Pentium
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "test.h"
#include "test_private.h"
#include "test_dt.h"

/* options for Simulink Desktop Real-Time board 0 */
static double RTWinBoardOptions0[] = {
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
};

/* list of Simulink Desktop Real-Time timers */
const int RTWinTimerCount = 1;
const double RTWinTimers[2] = {
  0.001, 0.0,
};

/* list of Simulink Desktop Real-Time boards */
const int RTWinBoardCount = 1;
RTWINBOARD RTWinBoards[1] = {
  { "National_Instruments/PCI-MIO-16E-4", 4294967295U, 6, RTWinBoardOptions0 },
};

/* Block signals (auto storage) */
B_test_T test_B;

/* Block states (auto storage) */
DW_test_T test_DW;

/* Real-time model */
RT_MODEL_test_T test_M_;
RT_MODEL_test_T *const test_M = &test_M_;

/* Model output function */
void test_output(void)
{
  /* local block i/o variables */
  real_T rtb_poten;
  real_T rtb_strain;
  real_T rtb_Sum2;
  int32_T i;
  real_T rtb_Sum1_idx_0;
  real_T rtb_Sum1_idx_1;
  real_T rtb_Sum1_idx_2;

  /* DiscreteIntegrator: '<Root>/Discrete-Time Integrator1' */
  test_B.DiscreteTimeIntegrator1 = test_DW.DiscreteTimeIntegrator1_DSTATE;

  /* SignalGenerator: '<Root>/Reference' */
  rtb_Sum2 = test_P.Reference_Frequency * test_M->Timing.t[0];
  if (rtb_Sum2 - floor(rtb_Sum2) >= 0.5) {
    test_B.ref = test_P.Reference_Amplitude;
  } else {
    test_B.ref = -test_P.Reference_Amplitude;
  }

  /* End of SignalGenerator: '<Root>/Reference' */
  /* S-Function Block: <S2>/Potentiometer */
  {
    ANALOGIOPARM parm;
    parm.mode = (RANGEMODE) test_P.Potentiometer_RangeMode;
    parm.rangeidx = test_P.Potentiometer_VoltRange;
    RTBIO_DriverIO(0, ANALOGINPUT, IOREAD, 1, &test_P.Potentiometer_Channels,
                   &rtb_poten, &parm);
  }

  /* S-Function Block: <S2>/Strain Gage */
  {
    ANALOGIOPARM parm;
    parm.mode = (RANGEMODE) test_P.StrainGage_RangeMode;
    parm.rangeidx = test_P.StrainGage_VoltRange;
    RTBIO_DriverIO(0, ANALOGINPUT, IOREAD, 1, &test_P.StrainGage_Channels,
                   &rtb_strain, &parm);
  }

  /* Sum: '<S2>/Sum1' incorporates:
   *  Gain: '<S2>/Gain'
   *  Gain: '<S2>/Gain1'
   */
  test_B.yk = test_P.Kp * rtb_poten + -test_P.Ke * rtb_strain;

  /* Sum: '<S1>/Sum2' incorporates:
   *  Gain: '<S1>/Gain1'
   *  UnitDelay: '<S1>/Unit Delay'
   */
  rtb_Sum2 = test_B.yk - (((test_P.C[0] * test_DW.UnitDelay_DSTATE[0] +
    test_P.C[1] * test_DW.UnitDelay_DSTATE[1]) + test_P.C[2] *
    test_DW.UnitDelay_DSTATE[2]) + test_P.C[3] * test_DW.UnitDelay_DSTATE[3]);

  /* Sum: '<S1>/Sum1' incorporates:
   *  Gain: '<S1>/Gain2'
   *  UnitDelay: '<S1>/Unit Delay'
   */
  rtb_Sum1_idx_0 = test_P.M[0] * rtb_Sum2 + test_DW.UnitDelay_DSTATE[0];
  rtb_Sum1_idx_1 = test_P.M[1] * rtb_Sum2 + test_DW.UnitDelay_DSTATE[1];
  rtb_Sum1_idx_2 = test_P.M[2] * rtb_Sum2 + test_DW.UnitDelay_DSTATE[2];
  rtb_Sum2 = test_P.M[3] * rtb_Sum2 + test_DW.UnitDelay_DSTATE[3];

  /* Gain: '<Root>/K' */
  test_B.K = ((test_P.K[0] * rtb_Sum1_idx_0 + test_P.K[1] * rtb_Sum1_idx_1) +
              test_P.K[2] * rtb_Sum1_idx_2) + test_P.K[3] * rtb_Sum2;

  /* Sum: '<Root>/Sum3' incorporates:
   *  Gain: '<Root>/N'
   *  Sum: '<Root>/Sum2'
   */
  test_B.Sum3 = (test_P.Nbar * test_B.ref - test_B.K) +
    test_B.DiscreteTimeIntegrator1;

  /* S-Function Block: <Root>/Analog Output */
  {
    {
      ANALOGIOPARM parm;
      parm.mode = (RANGEMODE) test_P.AnalogOutput_RangeMode;
      parm.rangeidx = test_P.AnalogOutput_VoltRange;
      RTBIO_DriverIO(0, ANALOGOUTPUT, IOWRITE, 1, &test_P.AnalogOutput_Channels,
                     &test_B.Sum3, &parm);
    }
  }

  /* Gain: '<S1>/Gain3' */
  for (i = 0; i < 4; i++) {
    test_B.Gain3[i] = 0.0;
    test_B.Gain3[i] += test_P.A[i] * rtb_Sum1_idx_0;
    test_B.Gain3[i] += test_P.A[i + 4] * rtb_Sum1_idx_1;
    test_B.Gain3[i] += test_P.A[i + 8] * rtb_Sum1_idx_2;
    test_B.Gain3[i] += test_P.A[i + 12] * rtb_Sum2;
  }

  /* End of Gain: '<S1>/Gain3' */

  /* Sum: '<S1>/Sum' incorporates:
   *  Gain: '<S1>/Gain'
   */
  test_B.Sum[0] = test_P.B[0] * test_B.Sum3 + test_B.Gain3[0];
  test_B.Sum[1] = test_P.B[1] * test_B.Sum3 + test_B.Gain3[1];
  test_B.Sum[2] = test_P.B[2] * test_B.Sum3 + test_B.Gain3[2];
  test_B.Sum[3] = test_P.B[3] * test_B.Sum3 + test_B.Gain3[3];

  /* Sum: '<Root>/Sum1' */
  test_B.Sum1 = test_B.ref - test_B.yk;
}

/* Model update function */
void test_update(void)
{
  /* Update for DiscreteIntegrator: '<Root>/Discrete-Time Integrator1' */
  test_DW.DiscreteTimeIntegrator1_DSTATE +=
    test_P.DiscreteTimeIntegrator1_gainval * test_B.Sum1;

  /* Update for UnitDelay: '<S1>/Unit Delay' */
  test_DW.UnitDelay_DSTATE[0] = test_B.Sum[0];
  test_DW.UnitDelay_DSTATE[1] = test_B.Sum[1];
  test_DW.UnitDelay_DSTATE[2] = test_B.Sum[2];
  test_DW.UnitDelay_DSTATE[3] = test_B.Sum[3];

  /* Update absolute time for base rate */
  /* The "clockTick0" counts the number of times the code of this task has
   * been executed. The absolute time is the multiplication of "clockTick0"
   * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
   * overflow during the application lifespan selected.
   * Timer of this task consists of two 32 bit unsigned integers.
   * The two integers represent the low bits Timing.clockTick0 and the high bits
   * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
   */
  if (!(++test_M->Timing.clockTick0)) {
    ++test_M->Timing.clockTickH0;
  }

  test_M->Timing.t[0] = test_M->Timing.clockTick0 * test_M->Timing.stepSize0 +
    test_M->Timing.clockTickH0 * test_M->Timing.stepSize0 * 4294967296.0;

  {
    /* Update absolute timer for sample time: [0.001s, 0.0s] */
    /* The "clockTick1" counts the number of times the code of this task has
     * been executed. The absolute time is the multiplication of "clockTick1"
     * and "Timing.stepSize1". Size of "clockTick1" ensures timer will not
     * overflow during the application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick1 and the high bits
     * Timing.clockTickH1. When the low bit overflows to 0, the high bits increment.
     */
    if (!(++test_M->Timing.clockTick1)) {
      ++test_M->Timing.clockTickH1;
    }

    test_M->Timing.t[1] = test_M->Timing.clockTick1 * test_M->Timing.stepSize1 +
      test_M->Timing.clockTickH1 * test_M->Timing.stepSize1 * 4294967296.0;
  }
}

/* Model initialize function */
void test_initialize(void)
{
  /* S-Function Block: <Root>/Analog Output */
  {
    {
      ANALOGIOPARM parm;
      parm.mode = (RANGEMODE) test_P.AnalogOutput_RangeMode;
      parm.rangeidx = test_P.AnalogOutput_VoltRange;
      RTBIO_DriverIO(0, ANALOGOUTPUT, IOWRITE, 1, &test_P.AnalogOutput_Channels,
                     &test_P.AnalogOutput_InitialValue, &parm);
    }
  }

  /* InitializeConditions for DiscreteIntegrator: '<Root>/Discrete-Time Integrator1' */
  test_DW.DiscreteTimeIntegrator1_DSTATE = test_P.DiscreteTimeIntegrator1_IC;

  /* InitializeConditions for UnitDelay: '<S1>/Unit Delay' */
  test_DW.UnitDelay_DSTATE[0] = test_P.UnitDelay_InitialCondition;
  test_DW.UnitDelay_DSTATE[1] = test_P.UnitDelay_InitialCondition;
  test_DW.UnitDelay_DSTATE[2] = test_P.UnitDelay_InitialCondition;
  test_DW.UnitDelay_DSTATE[3] = test_P.UnitDelay_InitialCondition;
}

/* Model terminate function */
void test_terminate(void)
{
  /* S-Function Block: <Root>/Analog Output */
  {
    {
      ANALOGIOPARM parm;
      parm.mode = (RANGEMODE) test_P.AnalogOutput_RangeMode;
      parm.rangeidx = test_P.AnalogOutput_VoltRange;
      RTBIO_DriverIO(0, ANALOGOUTPUT, IOWRITE, 1, &test_P.AnalogOutput_Channels,
                     &test_P.AnalogOutput_FinalValue, &parm);
    }
  }
}

/*========================================================================*
 * Start of Classic call interface                                        *
 *========================================================================*/
void MdlOutputs(int_T tid)
{
  test_output();
  UNUSED_PARAMETER(tid);
}

void MdlUpdate(int_T tid)
{
  test_update();
  UNUSED_PARAMETER(tid);
}

void MdlInitializeSizes(void)
{
}

void MdlInitializeSampleTimes(void)
{
}

void MdlInitialize(void)
{
}

void MdlStart(void)
{
  test_initialize();
}

void MdlTerminate(void)
{
  test_terminate();
}

/* Registration function */
RT_MODEL_test_T *test(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)test_M, 0,
                sizeof(RT_MODEL_test_T));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&test_M->solverInfo, &test_M->Timing.simTimeStep);
    rtsiSetTPtr(&test_M->solverInfo, &rtmGetTPtr(test_M));
    rtsiSetStepSizePtr(&test_M->solverInfo, &test_M->Timing.stepSize0);
    rtsiSetErrorStatusPtr(&test_M->solverInfo, (&rtmGetErrorStatus(test_M)));
    rtsiSetRTModelPtr(&test_M->solverInfo, test_M);
  }

  rtsiSetSimTimeStep(&test_M->solverInfo, MAJOR_TIME_STEP);
  rtsiSetSolverName(&test_M->solverInfo,"FixedStepDiscrete");

  /* Initialize timing info */
  {
    int_T *mdlTsMap = test_M->Timing.sampleTimeTaskIDArray;
    mdlTsMap[0] = 0;
    mdlTsMap[1] = 1;
    test_M->Timing.sampleTimeTaskIDPtr = (&mdlTsMap[0]);
    test_M->Timing.sampleTimes = (&test_M->Timing.sampleTimesArray[0]);
    test_M->Timing.offsetTimes = (&test_M->Timing.offsetTimesArray[0]);

    /* task periods */
    test_M->Timing.sampleTimes[0] = (0.0);
    test_M->Timing.sampleTimes[1] = (0.001);

    /* task offsets */
    test_M->Timing.offsetTimes[0] = (0.0);
    test_M->Timing.offsetTimes[1] = (0.0);
  }

  rtmSetTPtr(test_M, &test_M->Timing.tArray[0]);

  {
    int_T *mdlSampleHits = test_M->Timing.sampleHitArray;
    mdlSampleHits[0] = 1;
    mdlSampleHits[1] = 1;
    test_M->Timing.sampleHits = (&mdlSampleHits[0]);
  }

  rtmSetTFinal(test_M, 10.0);
  test_M->Timing.stepSize0 = 0.001;
  test_M->Timing.stepSize1 = 0.001;

  /* External mode info */
  test_M->Sizes.checksums[0] = (3268646940U);
  test_M->Sizes.checksums[1] = (4269640258U);
  test_M->Sizes.checksums[2] = (3739234049U);
  test_M->Sizes.checksums[3] = (4058104812U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[1];
    test_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(test_M->extModeInfo,
      &test_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(test_M->extModeInfo, test_M->Sizes.checksums);
    rteiSetTPtr(test_M->extModeInfo, rtmGetTPtr(test_M));
  }

  test_M->solverInfoPtr = (&test_M->solverInfo);
  test_M->Timing.stepSize = (0.001);
  rtsiSetFixedStepSize(&test_M->solverInfo, 0.001);
  rtsiSetSolverMode(&test_M->solverInfo, SOLVER_MODE_SINGLETASKING);

  /* block I/O */
  test_M->ModelData.blockIO = ((void *) &test_B);
  (void) memset(((void *) &test_B), 0,
                sizeof(B_test_T));

  /* parameters */
  test_M->ModelData.defaultParam = ((real_T *)&test_P);

  /* states (dwork) */
  test_M->ModelData.dwork = ((void *) &test_DW);
  (void) memset((void *)&test_DW, 0,
                sizeof(DW_test_T));

  /* data type transition information */
  {
    static DataTypeTransInfo dtInfo;
    (void) memset((char_T *) &dtInfo, 0,
                  sizeof(dtInfo));
    test_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 14;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    /* Block I/O transition table */
    dtInfo.B = &rtBTransTable;

    /* Parameters transition table */
    dtInfo.P = &rtPTransTable;
  }

  /* Initialize Sizes */
  test_M->Sizes.numContStates = (0);   /* Number of continuous states */
  test_M->Sizes.numY = (0);            /* Number of model outputs */
  test_M->Sizes.numU = (0);            /* Number of model inputs */
  test_M->Sizes.sysDirFeedThru = (0);  /* The model is not direct feedthrough */
  test_M->Sizes.numSampTimes = (2);    /* Number of sample times */
  test_M->Sizes.numBlocks = (22);      /* Number of blocks */
  test_M->Sizes.numBlockIO = (8);      /* Number of block outputs */
  test_M->Sizes.numBlockPrms = (57);   /* Sum of parameter "widths" */
  return test_M;
}

/*========================================================================*
 * End of Classic call interface                                          *
 *========================================================================*/

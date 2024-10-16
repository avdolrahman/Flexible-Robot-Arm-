/*
 * test.c
 *
 * Code generation for model "test".
 *
 * Model version              : 1.21
 * Simulink Coder version : 8.8 (R2015a) 09-Feb-2015
 * C source code generated on : Wed Sep 25 18:56:01 2024
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
  0.01, 0.0,
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
  /* S-Function Block: <Root>/Strain Gauge 1 */
  {
    ANALOGIOPARM parm;
    parm.mode = (RANGEMODE) test_P.StrainGauge1_RangeMode;
    parm.rangeidx = test_P.StrainGauge1_VoltRange;
    RTBIO_DriverIO(0, ANALOGINPUT, IOREAD, 1, &test_P.StrainGauge1_Channels,
                   &test_B.StrainGauge1, &parm);
  }
}

/* Model update function */
void test_update(void)
{
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
}

/* Model initialize function */
void test_initialize(void)
{
}

/* Model terminate function */
void test_terminate(void)
{
  /* (no terminate code required) */
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

  /* Initialize timing info */
  {
    int_T *mdlTsMap = test_M->Timing.sampleTimeTaskIDArray;
    mdlTsMap[0] = 0;
    test_M->Timing.sampleTimeTaskIDPtr = (&mdlTsMap[0]);
    test_M->Timing.sampleTimes = (&test_M->Timing.sampleTimesArray[0]);
    test_M->Timing.offsetTimes = (&test_M->Timing.offsetTimesArray[0]);

    /* task periods */
    test_M->Timing.sampleTimes[0] = (0.01);

    /* task offsets */
    test_M->Timing.offsetTimes[0] = (0.0);
  }

  rtmSetTPtr(test_M, &test_M->Timing.tArray[0]);

  {
    int_T *mdlSampleHits = test_M->Timing.sampleHitArray;
    mdlSampleHits[0] = 1;
    test_M->Timing.sampleHits = (&mdlSampleHits[0]);
  }

  rtmSetTFinal(test_M, 60.0);
  test_M->Timing.stepSize0 = 0.01;

  /* External mode info */
  test_M->Sizes.checksums[0] = (2990030068U);
  test_M->Sizes.checksums[1] = (2807531166U);
  test_M->Sizes.checksums[2] = (981672315U);
  test_M->Sizes.checksums[3] = (3326697281U);

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
  test_M->Timing.stepSize = (0.01);
  rtsiSetFixedStepSize(&test_M->solverInfo, 0.01);
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
  test_M->Sizes.numSampTimes = (1);    /* Number of sample times */
  test_M->Sizes.numBlocks = (2);       /* Number of blocks */
  test_M->Sizes.numBlockIO = (1);      /* Number of block outputs */
  test_M->Sizes.numBlockPrms = (5);    /* Sum of parameter "widths" */
  return test_M;
}

/*========================================================================*
 * End of Classic call interface                                          *
 *========================================================================*/

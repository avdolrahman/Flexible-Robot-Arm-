/*
 * test_data.c
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

/* Block parameters (auto storage) */
P_test_T test_P = {
  /*  Variable: A
   * Referenced by: '<S1>/Gain3'
   */
  { 3.003819136044021, 1.0, 0.0, 0.0, -3.2028355979508176, 0.0, 1.0, 0.0,
    1.3784965560305418, 0.0, 0.0, 1.0, -0.17948009412374505, 0.0, 0.0, 0.0 },

  /*  Variable: B
   * Referenced by: '<S1>/Gain'
   */
  { 1.0, 0.0, 0.0, 0.0 },

  /*  Variable: C
   * Referenced by: '<S1>/Gain1'
   */
  { -0.01027326377467523, 0.020694319112751349, 0.0, 0.0 },

  /*  Variable: K
   * Referenced by: '<Root>/K'
   */
  { 0.041647581601006151, -0.082717502079341379, 0.049120584096123007,
    -0.0073289856086570749 },
  1.51,                                /* Variable: Ke
                                        * Referenced by: '<S2>/Gain1'
                                        */
  35.3,                                /* Variable: Kp
                                        * Referenced by: '<S2>/Gain'
                                        */

  /*  Variable: M
   * Referenced by: '<S1>/Gain2'
   */
  { 30.249069428198577, 27.027297547804345, 23.714051011885672,
    20.380709106319543 },
  0.069251912183416531,                /* Variable: Nbar
                                        * Referenced by: '<Root>/N'
                                        */
  0.0,                                 /* Mask Parameter: AnalogOutput_FinalValue
                                        * Referenced by: '<Root>/Analog Output'
                                        */
  0.0,                                 /* Mask Parameter: AnalogOutput_InitialValue
                                        * Referenced by: '<Root>/Analog Output'
                                        */
  10.0,                                /* Mask Parameter: Potentiometer_MaxMissedTicks
                                        * Referenced by: '<S2>/Potentiometer'
                                        */
  10.0,                                /* Mask Parameter: StrainGage_MaxMissedTicks
                                        * Referenced by: '<S2>/Strain Gage'
                                        */
  10.0,                                /* Mask Parameter: AnalogOutput_MaxMissedTicks
                                        * Referenced by: '<Root>/Analog Output'
                                        */
  0.0,                                 /* Mask Parameter: Potentiometer_YieldWhenWaiting
                                        * Referenced by: '<S2>/Potentiometer'
                                        */
  0.0,                                 /* Mask Parameter: StrainGage_YieldWhenWaiting
                                        * Referenced by: '<S2>/Strain Gage'
                                        */
  0.0,                                 /* Mask Parameter: AnalogOutput_YieldWhenWaiting
                                        * Referenced by: '<Root>/Analog Output'
                                        */
  0,                                   /* Mask Parameter: Potentiometer_Channels
                                        * Referenced by: '<S2>/Potentiometer'
                                        */
  1,                                   /* Mask Parameter: StrainGage_Channels
                                        * Referenced by: '<S2>/Strain Gage'
                                        */
  0,                                   /* Mask Parameter: AnalogOutput_Channels
                                        * Referenced by: '<Root>/Analog Output'
                                        */
  0,                                   /* Mask Parameter: Potentiometer_RangeMode
                                        * Referenced by: '<S2>/Potentiometer'
                                        */
  0,                                   /* Mask Parameter: StrainGage_RangeMode
                                        * Referenced by: '<S2>/Strain Gage'
                                        */
  0,                                   /* Mask Parameter: AnalogOutput_RangeMode
                                        * Referenced by: '<Root>/Analog Output'
                                        */
  0,                                   /* Mask Parameter: Potentiometer_VoltRange
                                        * Referenced by: '<S2>/Potentiometer'
                                        */
  0,                                   /* Mask Parameter: StrainGage_VoltRange
                                        * Referenced by: '<S2>/Strain Gage'
                                        */
  0,                                   /* Mask Parameter: AnalogOutput_VoltRange
                                        * Referenced by: '<Root>/Analog Output'
                                        */
  0.0001,                              /* Computed Parameter: DiscreteTimeIntegrator1_gainval
                                        * Referenced by: '<Root>/Discrete-Time Integrator1'
                                        */
  0.0,                                 /* Expression: 0
                                        * Referenced by: '<Root>/Discrete-Time Integrator1'
                                        */
  30.0,                                /* Expression: 30
                                        * Referenced by: '<Root>/Reference'
                                        */
  0.2,                                 /* Expression: 0.2
                                        * Referenced by: '<Root>/Reference'
                                        */
  0.0                                  /* Expression: 0
                                        * Referenced by: '<S1>/Unit Delay'
                                        */
};

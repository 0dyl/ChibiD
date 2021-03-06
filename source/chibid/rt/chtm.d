module chibid.rt.chtm;

import chibid.port;

struct tm_calibration_t
{
    rtcnt_t offset;
}

struct time_measurement_t
{
    rtcnt_t best;
    rtcnt_t worst;
    rtcnt_t last;
    ucnt_t n;
    rttime_t cumulative;
}

version(USE_CPP)
    extern(C++):
else extern(C):
void chTMObjectInit(time_measurement_t* tmp);
void chTMStartMeasurementX(time_measurement_t* tmp);
void chTMStopMeasurementX(time_measurement_t* tmp);
void chTMChainMeasurementToX(time_measurement_t* tmp1, time_measurement_t* tmp2);
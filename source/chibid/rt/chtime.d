module chibid.rt.chtime;

enum CH_CFG_ST_RESOLUTION = 32;
enum CH_CFG_ST_FREQUENCY = 100;
enum CH_CFG_INTERVALS_SIZE = 32;
enum CH_CFG_TIME_TYPES_SIZE = 32;

enum sysinterval_t TIME_IMMEDIATE = cast(sysinterval_t)0;
enum sysinterval_t TIME_INFINITE = cast(sysinterval_t)-1;
enum sysinterval_t TIME_MAX_INTERVAL = cast(sysinterval_t)-2;
enum sysinterval_t TIME_MAX_SYSTIME = cast(systime_t)-1;

sysinterval_t TIME_S2I(time_secs_t secs) { return cast(time_conv_t)secs * cast(time_conv_t)CH_CFG_ST_FREQUENCY; }
sysinterval_t TIME_MS2I(time_msecs_t msecs) { return (cast(time_conv_t)msecs * cast(time_conv_t)CH_CFG_ST_FREQUENCY + 999) / 1000;}
sysinterval_t TIME_US2I(time_usecs_t usecs) { return (cast(time_conv_t)usecs * cast(time_conv_t)CH_CFG_ST_FREQUENCY + 999999) / 1000000;}
time_secs_t TIME_I2S(sysinterval_t interval) { 
    return cast(time_secs_t)((cast(time_conv_t)(interval) + cast(time_conv_t)CH_CFG_ST_FREQUENCY - cast(time_conv_t)1) / cast(time_conv_t)CH_CFG_ST_FREQUENCY); }
time_msecs_t TIME_I2MS(sysinterval_t interval) {
        return cast(time_secs_t)((cast(time_conv_t)(interval) * 1000 + cast(time_conv_t)CH_CFG_ST_FREQUENCY - cast(time_conv_t)1) / cast(time_conv_t)CH_CFG_ST_FREQUENCY); } 
time_usecs_t TIME_I2US(sysinterval_t interval) {
        return cast(time_secs_t)((cast(time_conv_t)(interval) * 1000000 + cast(time_conv_t)CH_CFG_ST_FREQUENCY - cast(time_conv_t)1) / cast(time_conv_t)CH_CFG_ST_FREQUENCY); }

alias systime_t = ulong;
alias sysinterval_t = ulong;
alias time_secs_t = uint;
alias time_msecs_t = uint;
alias time_usecs_t = uint;
alias time_conv_t = ulong;

extern(C):
sysinterval_t chTimeS2I(time_secs_t secs);
sysinterval_t chTimeMS2I(time_msecs_t msec);
sysinterval_t chTimeUS2I(time_usecs_t usec);
time_secs_t chTimeI2S(sysinterval_t interval);
time_msecs_t chTimeI2MS(sysinterval_t interval);
time_usecs_t chTimeI2US(sysinterval_t interval);
systime_t chTimeAddX(systime_t systime, sysinterval_t interval);
sysinterval_t chTimeDiffX(systime_t start, systime_t end);
bool chTimeIsInRangeX(systime_t time, systime_t start, systime_t end);
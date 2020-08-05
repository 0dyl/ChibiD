module chibid.rt.chtime;

enum CH_CFG_ST_RESOLUTION = 32;
enum CH_CFG_ST_FREQUENCY = 100;
enum CH_CFG_INTERVALS_SIZE = 32;
enum CH_CFG_TIME_TYPES_SIZE = 32;

enum sysinterval_t TIME_IMMEDIATE = cast(sysinterval_t)0;
enum sysinterval_t TIME_INFINITE = cast(sysinterval_t)-1;
enum sysinterval_t TIME_MAX_INTERVAL = cast(sysinterval_t)-2;
enum sysinterval_t TIME_MAX_SYSTIME = cast(systime_t)-1;

// TODO complete macros

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
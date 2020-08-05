module chibid.rt.chsys;

auto chSysGetRealtimeCounterX() { return port_rt_get_counter_value(); }

enum CH_INTEGRITY
{
    rList = 1,
    vtList = 2,
    registry = 4,
    port = 8
}

auto S2RTC(auto freq, auto sec) { return freq * sec; }
auto MS2RTC(auto freq, auto msec) { return cast(rtcnt_t)(((freq + 999) / 1000) * msec); }
auto US2RTC(auto freq, auto usec) { return (rtcnt_t)((((freq) + 999999) / 1000000) * (usec)); }
auto RTC2S(auto freq, auto n) { return ((((n) - 1UL) / (freq)) + 1UL); }
auto RTC2MS(auto freq, auto n) { return ((((n) - 1UL) / ((freq) / 1000UL)) + 1UL); }
auto RTC2US(auto freq, auto n) { return ((((n) - 1UL) / ((freq) / 1000000UL)) + 1UL); }

extern(C):
void chSysInit();
bool chSysIntegrityCheckI(uint testmask);
void chSysTimerHandlerI();
syssts_t chSysGetStatusAndLockX();
void chSysRestoreStatusX(syssts_t sts);
bool chSysIsCounterWithinX(rtcnt_t cnt, rtcnt_t start, rtcnt_t end);
void chSysPolledDelayX(rtcnt_t cycles);
void chSysDisable();
void chSysSuspend();
void chSysEnable();
void chSysLock();
void chSysUnlock();
void chSysLockFromISR();
void chSysUnlockFromISR();
void chSysUnconditionalLock();
void chSysUnconditionalUnlock();
thread_t chSysGetIdleThreadX();
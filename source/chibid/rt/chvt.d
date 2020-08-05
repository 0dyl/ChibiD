module chibid.rt.chvt;

extern(C):
void chVTDoSetI(virtual_timer_t* vtp, sysinterval_t delay, vtfunc_t vtfunc, void* par);
void chVTDoResetI(virtual_timer_t* vtp);
void chVTObjectInit(virtual_timer_t* vtp);
systime_t chVTGetSystemTimeX();
systime_t chVTGetSystemTime();
sysinterval_t chVTTimeElapsedSinceX(systime_t start);
bool chVTIsSystemTimeWithinX(systime_t start, systime_t end);
bool chVTIsSystemTimeWithin(systime_t start, systime_t end);
bool chVTGetTimersStateI(sysinterval_t* timep);
bool chVTIsArmedI(const virtual_timer_t* vtp);
bool chVTIsArmed(const virtual_timer_t* vtp);
void chVTResetI(virtual_timer_t* vtp);
void chVTReset(virtual_timer_t* vtp);
void chVTSetI(virtual_timer_t* avtp, sysinterval_t delay, vtfunc_t vtfunc, void* par);
void chVTSet(virtual_timer_t* vtp, sysinterval_t delay, vtfunc_t vtfunc, void* par);
void chVTDoTickI();
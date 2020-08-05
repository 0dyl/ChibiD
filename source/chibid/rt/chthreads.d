module chibid.rt.chthreads;

import chibid.port;
import chibid.rt.chtime;

struct thread_descriptor_t
{
    const char* name;
    stkalign_t* wbase;
    stkalign_t* wend;
    tprio_t prio;
    tfunc_t funcp;
    void* arg;
}

auto THD_WORKING_AREA_SIZE(auto n) { 
    return MEM_ALIGN_TEXT(thread_t.sizeof + PORT_WA_SIZE(n), PORT_STACK_ALIGN); }
auto THD_WORKING_AREA_BASE(auto s) { return cast(stkalign_t*)s;}
auto THD_WORKING_AREA_END(auto s) { return WORKING_AREA_BASE(s) + s.sizeof / stkalign.sizeof; }
auto THD_FUNCTION(auto tname, auto arg) { return PORT_THD_FUNCTION(tname, arg); }

void chThdSleepSeconds(time_secs_t sec) { chThdSleep(TIME_S2I(sec)); }
void chThdSleepMilliseconds(time_msecs_t msec) { chThdSleep(TIME_MS2I(msec)); }
void chThdSleepMicroseconds(time_usecs_t usec) { chThdSleep(TIME_US2I(usec)); }

alias tfunc_t = void function(void* p);

version(USE_CPP)
    extern(C++):
else extern(C):
thread_t* chThdCreateSuspendedI(const thread_descriptor_t* tdp);
thread_t* chThdCreateSuspended(const thread_descriptor_t* tdp);
thread_t* chThdCreateI(const thread_descriptor_t *tdp);
thread_t* chThdCreate(const thread_descriptor_t *tdp);
thread_t* chThdCreateStatic(void *wsp, size_t size, tprio_t prio, tfunc_t pf, void *arg);
thread_t* chThdStart(thread_t *tp);
thread_t* chThdAddRef(thread_t *tp);
void chThdRelease(thread_t *tp);
void chThdExit(msg_t msg);
void chThdExitS(msg_t msg);
msg_t chThdWait(thread_t *tp);
tprio_t	chThdSetPriority(tprio_t newprio);
void chThdTerminate(thread_t *tp);
msg_t chThdSuspendS(thread_reference_t *trp);
msg_t chThdSuspendTimeoutS(thread_reference_t *trp, sysinterval_t timeout);
void chThdResumeI(thread_reference_t *trp, msg_t msg);
void chThdResumeS(thread_reference_t *trp, msg_t msg);
void chThdResume(thread_reference_t *trp, msg_t msg);
msg_t chThdEnqueueTimeoutS(threads_queue_t *tqp, sysinterval_t timeout);
void chThdDequeueNextI(threads_queue_t *tqp, msg_t msg);
void chThdDequeueAllI(threads_queue_t *tqp, msg_t msg);
void chThdSleep(sysinterval_t time);
void chThdSleepUntil(systime_t time);
systime_t chThdSleepUntilWindowed(systime_t prev, systime_t next);
void chThdYield();
thread_t* chThdGetSelfX();
tprio_t chThdGetPriorityX();
systime_t chThdGetTicksX(thread_t *tp);
stkalign_t* chThdGetWorkingAreaX(thread_t *tp);
bool chThdTerminatedX(thread_t *tp);
bool chThdShouldTerminateX();
thread_t* chThdStartI(thread_t *tp);
void chThdSleepS(sysinterval_t ticks);
void chThdQueueObjectInit(threads_queue_t *tqp);
bool chThdQueueIsEmptyI(threads_queue_t *tqp);
void chThdDoDequeueNextI(threads_queue_t *tqp, msg_t msg);

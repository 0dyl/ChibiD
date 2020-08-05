module chibid.rt.chsem;
 
import chibid.port;

struct ch_semaphore
{
    threads_queue_t queue;
    cnt_t cnt;
}

alias semaphore_t = ch_semaphore;

version(USE_CPP)
    extern(C++):
else extern(C):
void 	chSemObjectInit (semaphore_t *sp, cnt_t n);
void 	chSemReset (semaphore_t *sp, cnt_t n);
void 	chSemResetI (semaphore_t *sp, cnt_t n);
msg_t 	chSemWait (semaphore_t *sp);
msg_t 	chSemWaitS (semaphore_t *sp);
msg_t 	chSemWaitTimeout (semaphore_t *sp, sysinterval_t timeout);
msg_t 	chSemWaitTimeoutS (semaphore_t *sp, sysinterval_t timeout);
void 	chSemSignal (semaphore_t *sp);
void 	chSemSignalI (semaphore_t *sp);
void 	chSemAddCounterI (semaphore_t *sp, cnt_t n);
msg_t 	chSemSignalWait (semaphore_t *sps, semaphore_t *spw);
void 	chSemFastWaitI (semaphore_t *sp);
void 	chSemFastSignalI (semaphore_t *sp);
cnt_t 	chSemGetCounterI (const semaphore_t *sp);

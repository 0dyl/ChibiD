module chibid.rt.chbsem;

import chibid.rt.chtime;

struct ch_binary_semaphore
{
    cnt_t cnt;
    threads_queue_t queue;
}

alias binary_semaphore_t = ch_binary_semaphore;

extern(C):
void chBSemObjectInit(binary_semaphore_t* bsp, bool taken);
msg_t chBSemWait(binary_semaphore_t* bsp);
msg_t chBSemWaitS(binary_semaphore_t* bsp);
msg_t chBSemWaitTimeoutS(binary_semaphore_t* bsp, sysinterval_t timeout);
msg_t chBSemWaitTimeout(binary_semaphore_t* bsp, sysinterval_t timeout);
void chBSemResetI(binary_semaphore_t* bsp, bool taken);
void chBSemReset(binary_semaphore_t* bsp, bool taken);
void chBSemSignalI(binary_semaphore_t* bsp);
void chBSemSignal(binary_semaphore_t* bsp);
bool chBSemGetStateI(const binary_semaphore_t* bsp);
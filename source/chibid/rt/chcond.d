module chibid.rt.chcond;

import chibid.rt.chtime;

struct condition_variable
{
    threads_queue_t queue;
}

alias condition_variable_t = condition_variable;

version(USE_CPP)
    extern(C++):
else extern(C):
void chCondObjectInit(condition_variable_t* cp);
void chCondSignal(condition_variable_t* cp);
void chCondSignalI(condition_variable_t* cp);
void chCondBroadcast(condition_variable_t* cp);
void chCondBroadcastI(condition_variable_t* cp);
msg_t chCondWait(condition_variable_t* cp);
msg_t chCondWaitS(condition_variable_t* cp);
msg_t chCondWaitTimeout(condition_variable_t* cp, sysinterval_t timeout);
msg_t chCondWaitTimeoutS(condition_variable_t* cp, sysinterval_t timeout);
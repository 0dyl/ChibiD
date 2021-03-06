module chibid.rt.chschd;

import chibid.port;

struct ch_threads_list
{
    thread_t* next;
}

struct ch_threads_queue
{
    thread_t* next;
    thread_t* prev;
}

struct ch_thread
{
    threads_queue_t queue;
    tprio_t prio;
    port_context ctx;
    thread_t* newer;
    thread_t* older;
    const char* name;
    stkalign_t* wabase;
    tstate_t state;
    tmode_t flags;
    trefs_t refs;
    tslices_t ticks;
    systime_t time;

    union
    {
        msg_t rdymsg;
        msg_t exitcode;
        void* wtobjp;
        thread_reference_t* wttrp;
        msg_t sentmsg;
        ch_semaphore* wtsemp;
        ch_mutex* wtmtxp;
        eventmask_t ewmask;
    }

    threads_list_t waiting;
    threads_queue_t msgqueue;
    eventmask_t epending;
    ch_mutex* mtxlist;
    tprio_t realprio;
    void* mpool;
    time_measurement_t stats;
}

struct ch_virtual_timer
{
    virtual_timer_t* next;
    virtual_timer_t* prev;
    sysinterval_t delta;
    vtfunc_t func;
    void* par;
}

struct ch_virtual_timers_list
{
    virtual_timer_t* next;
    virtual_timer_t* prev;
    sysinterval_t delta;
    systime_t systime;
    systime_t lasttime;
}

struct ch_system_debug
{
    const char* panic_msg;
    cnt_t isr_cnt;
    cnt_t lock_cnt;
    ch_trace_buffer_t trace_buffer;
}

struct ch_system
{
    ready_list_t rlist;
    virtual_timers_list_t vtlist;
    system_debug_t dbg;
    thread_t mainthread;
    tm_calibration_t tm;
    kernal_stats_t kernel_stats;
}

auto firstprio(auto rlp) { return rlp.next.prio; }

enum msg_t MSG_OK = 0;
enum msg_t MSG_TIMEOUT = cast(msg_t)(-1);
enum msg_t MSG_RESET = cast(msg_t)(-2);

enum NOPRIO = 0;
enum IDLEPRIO = 1;
enum LOWPRIO = 2;
enum NORMALPRIO = 128;
enum HIGHPRIO = 255;

enum tstate_t CH_STATE_READY = 0;
enum tstate_t CH_STATE_CURRENT = 1;
enum tstate_t CH_STATE_WTSTART = 2;
enum tstate_t CH_STATE_SUSPENDED = 3;
enum tstate_t CH_STATE_QUEUED = 4;
enum tstate_t CH_STATE_WTSEM = 5;
enum tstate_t CH_STATE_WTMTX = 6;
enum tstate_t CH_STATE_WTCOND = 7;
enum tstate_t CH_STATE_SLEEPING = 8;
enum tstate_t CH_STATE_WTEXIT = 9;
enum tstate_t CH_STATE_WTOREVT = 10;
enum tstate_t CH_STATE_WTANDEVT = 11;
enum tstate_t CH_STATE_SNDMSGQ = 12;
enum tstate_t CH_STATE_SNGMSG = 13;
enum tstate_t CH_STATE_WTMSG = 14;
enum tstate_t CH_STATE_FINAL = 15;

enum tmode_t CH_FLAG_MODE_MASK = 3;
enum tmode_t CH_FLAG_MODE_STATIC = 0;
enum tmode_t CH_FLAG_MODE_HEAP = 1;
enum tmode_t CH_FLAG_MODE_MPOOL = 2;
enum tmode_t CH_FLAG_TERMINATE = 4;

version(USE_CPP)
    extern(C++):
else extern(C):
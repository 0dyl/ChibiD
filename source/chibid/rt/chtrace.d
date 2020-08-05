module chibid.rt.chtrace;

struct ch_trace_event_t
{
    uint type_state_rtstamp;
    systime_t time;
    thread_t* thread;
    void* wtobjp;

    struct sw_t
    {
        thread_t* ntp;
        void* wtojp;
    }
    sw_t sw;

    const char* name;

    struct isr_t
    {
        const char* name;
    }
    isr_t isr;
    const char* reason;

    struct halt_t
    {
        const char* reason;
    }
    halt_t halt;
    void* up1;
    void* up2;

    void user_t
    {
        void* up1;
        void* up2;
    }
    user_t user;
}

struct ch_trace_buffer_t
{
    ushort suspended;
    ushort size;
    ch_trace_event_t* ptr;
    ch_trace_event_t[CH_DBG_TRACE_BUFFER_SIZE] buffer;
}

enum CH_TRACE_TYPE_UNUSED = 0;
enum CH_TRACE_TYPE_SWITCH = 1;
enum CH_TRACE_TYPE_ISR_ENTER = 2;
enum CH_TRACE_TYPE_ISR_LEAVE = 3;
enum CH_TRACE_TYPE_HALT = 4;
enum CH_TRACE_TYPE_USER = 5;

enum CH_DBG_TRACE_MASK_DISABLED = 255;
enum CH_DBG_TRACE_MASK_NONE = 0;
enum CH_DBG_TRACE_MASK_SWITCH = 1;
enum CH_DBG_TRACE_MASK_ISR = 2;
enum CH_DBG_TRACE_MASK_HALT = 4;
enum CH_DBG_TRACE_MASK_USER = 8;
enum CH_DBG_TRACE_MASK_SLOW;
enum CH_DBG_TRACE_MASK_ALL;

enum CH_DBG_TRACE_MASK = CH_DBG_TRACE_MASK_DISABLED;
enum CH_DBG_TRACE_BUFFER_SIZE = 128;

extern(C):
void chDbgWriteTraceI(void* up1, void* up2);
void chDbgWriteTrace(void* up1, void* up2);
void chDbgSuspendTraceI(ushort mask);
void chDbgSuspendTrace(ushort mask);
void chDbgResumeTraceI(ushort mask);
void chDbgResumeTrace(ushort mask);
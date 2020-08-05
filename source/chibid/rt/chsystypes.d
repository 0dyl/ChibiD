module chibid.rt.chsystypes;

import chibid.port;

alias thread_t = ch_thread;
alias thread_reference_t = thread_t*;
alias threads_list_t = ch_threads_list;
alias ready_list_t = ch_ready_list;
alias vtfunc_t = void function(void* p);
alias virtual_timer_t = ch_virtual_timer;
alias virtual_timers_list = ch_virtual_timers_list;
alias system_debug_t = ch_system_debug;
alias ch_system_t = ch_system;
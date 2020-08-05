module chibid.rt.chdynamic;

import chibid.rt.chsystypes;

extern(C):
thread_t* chThdCreateFromHeap(memory_heap_t * heapp, size_t size, const char* name, tprio_t prio, tfunc_t pf, void* arg);
thread_t* cdThdCreateFromMemoryPool(memory_pool_t* mp, const char* name, tprio_t prio, tfunc_t pf, void* arg);
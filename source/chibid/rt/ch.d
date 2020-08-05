module chibid.rt.ch;

// CONSTANTS
enum CH_KERNEL_STABLE = 1;
enum CH_KERNEL_VERSION = "5.1.0"
enum CH_KERNEL_MAJOR = 5;
enum CH_KERNEL_MINOR = 1;
enum CH_KERNEL_PATCH = 0;

enum FALSE = 0;
enum TRUE = 1;

// MACROS

// BINDINGS
extern(C):
void chSysHalt(const char * reason);
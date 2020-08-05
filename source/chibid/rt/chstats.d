module chibid.rt.chstats;

import chibid.port;

struct kernel_stats_t
{
    ucnt_t n_irq;
    ucnt_t n_ctxswc;
    time_measurement_t m_crit_thd;
    time_measurement_t m_crit_isr;
}
module chibid.rt.chalign;

// MACROS

auto MEM_ALIGN_MASK(size_t a) { return a - 1; }
auto MEM_ALIGN_REV(size_t p, size_t a) {
    return p & ~MEM_ALIGN_MASK(a); }
auto MEM_ALIGN_NEXT(size_t p, size_t a) {
    return p + MEM_ALIGN_MASK(a); }
auto MEM_IS_ALIGNED(size_t p, size_t a) {
    return p & MEM_ALIGN_MASK(a) == 0; }
auto MEM_IS_VALID_ALIGNMENT(size_t a) {
    return (a != 0) && (a & (a - 1) == 0);
}
# 🍊 Grad Assignment: rust-bitcoin #1802

**Assigned to:** [TO_BE_ASSIGNED]  
**Mentor:** @keypleb  
**Due:** 2 weeks  
**Difficulty:** Beginner  
**Language:** Rust

---

## Issue: TryFrom<&str> for FromStr Types

**Original:** https://github.com/rust-bitcoin/rust-bitcoin/issues/1802  
**PR:** https://github.com/rust-bitcoin/rust-bitcoin/pull/6083  
**Fork:** https://github.com/code-orange-dev/rust-bitcoin

### Problem
Types implementing `FromStr` should also implement `TryFrom<&str>`.

### Solution
Apply `impl_tryfrom_str!` macro to relevant types.

---

## Tasks

### Phase 1: Setup
- [ ] Fork and checkout `fix/1802-tryfrom-for-fromstr`

### Phase 2: Apply
- [ ] Find types with `FromStr` (Address, Txid, etc.)
- [ ] Apply macro to each type
- [ ] Add tests for each

### Phase 3: Submit
- [ ] Run `cargo test`
- [ ] Run `cargo clippy`
- [ ] Push and update PR

---

## Skills
- Rust
- Traits
- Macros

---

🍊 **Ready?** Reply "🍊 Taking this"

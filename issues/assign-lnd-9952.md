# 🍊 Grad Assignment: LND #9952

**Assigned to:** [TO_BE_ASSIGNED]  
**Mentor:** @keypleb  
**Due:** 3 weeks  
**Difficulty:** Intermediate  
**Language:** Go

---

## Issue: MPP Record Support

**Original:** https://github.com/lightningnetwork/lnd/issues/9952  
**PR:** https://github.com/lightningnetwork/lnd/pull/10770  
**Fork:** https://github.com/code-orange-dev/lnd

### Problem
Add MPP (Multi-Path Payment) record support to QueryRoutes and SendToRoute.

### Solution
- Add `payment_addr` to QueryRoutesRequest
- Add `mpp_record` to SendToRouteRequest

---

## Tasks

### Phase 1: Setup
- [ ] Fork and checkout `fix/9952-mpp-queryroutes`

### Phase 2: Implement
- [ ] Regenerate protobuf
- [ ] Update router implementation
- [ ] Add CLI flags
- [ ] Add tests

### Phase 3: Test
- [ ] Unit tests
- [ ] Integration tests
- [ ] Manual testing

---

## Skills
- Go
- Lightning Network
- Protocol Buffers
- MPP payments

---

🍊 **Ready?** Reply "🍊 Taking this"

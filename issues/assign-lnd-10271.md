# 🍊 Grad Assignment: LND #10271

**Assigned to:** [TO_BE_ASSIGNED]  
**Mentor:** @keypleb  
**Due:** 2 weeks  
**Difficulty:** Beginner  
**Language:** Go

---

## Issue: Add change_addr to SendCoins

**Original:** https://github.com/lightningnetwork/lnd/issues/10271  
**PR:** https://github.com/lightningnetwork/lnd/pull/10769  
**Fork:** https://github.com/code-orange-dev/lnd

### Problem
Users want to specify a custom change address when sending coins, instead of using the wallet's internal change output.

### Solution
Add `--change_addr` flag to `lncli sendcoins` command.

---

## Tasks

### Phase 1: Setup
- [ ] Fork code-orange-dev/lnd to your account
- [ ] Clone and checkout `fix/10271-sendcoins-change-addr`
- [ ] Build: `make install`

### Phase 2: Complete
- [ ] Regenerate protobuf: `make rpc` (needs Docker)
- [ ] Add integration test
- [ ] Test manually with regtest
- [ ] Update PR description

### Phase 3: Submit
- [ ] Push to your fork
- [ ] Ensure CI passes
- [ ] Request review

---

## Skills
- Go
- Protocol Buffers
- Bitcoin transactions

---

🍊 **Ready?** Reply "🍊 Taking this"

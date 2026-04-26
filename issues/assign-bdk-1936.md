# 🍊 Grad Assignment: BDK #1936

**Assigned to:** [TO_BE_ASSIGNED]  
**Mentor:** @keypleb  
**Due:** 2 weeks from assignment  
**Difficulty:** Beginner  
**Language:** Rust

---

## Issue: Move TxTemplate to bdk_testenv

**Original Issue:** https://github.com/bitcoindevkit/bdk/issues/1936  
**Upstream PR:** https://github.com/bitcoindevkit/bdk/pull/2191  
**Code Orange Fork:** https://github.com/code-orange-dev/bdk

### Problem
The `TxTemplate` testing utility is currently in `crates/chain/tests/common/mod.rs`, making it only accessible for `bdk_chain` tests. It should be moved to `bdk_testenv` for broader use in benchmarks and other tests.

### Solution
Move `TxTemplate` types and logic to `bdk_testenv` crate with improvements.

---

## Your Tasks

### Phase 1: Setup (Day 1)
- [ ] Fork https://github.com/code-orange-dev/bdk to your GitHub account
- [ ] Clone your fork: `git clone https://github.com/YOUR_USERNAME/bdk.git`
- [ ] Add upstream remote: `git remote add upstream https://github.com/bitcoindevkit/bdk.git`
- [ ] Checkout the branch: `git checkout fix/1936-txtemplate-to-testenv`
- [ ] Build the project: `cargo build`
- [ ] Run existing tests: `cargo test`

### Phase 2: Understand (Day 1-2)
- [ ] Read the original issue: https://github.com/bitcoindevkit/bdk/issues/1936
- [ ] Find the current TxTemplate implementation in `crates/chain/tests/common/mod.rs`
- [ ] Review the new implementation in `crates/testenv/src/tx_template/mod.rs`
- [ ] Understand what `Cow<'static, T>` means and why it's used
- [ ] Read about `TxGraph` and how it's used in tests

### Phase 3: Improve (Day 3-7)
- [ ] Add unit tests for `TxTemplate` in `crates/testenv/src/tx_template/mod.rs`
- [ ] Add documentation with examples
- [ ] Update existing tests in `crates/chain/tests/` to use the new location
- [ ] Make sure all tests pass: `cargo test`
- [ ] Run clippy: `cargo clippy`
- [ ] Format code: `cargo fmt`

### Phase 4: Submit (Day 8-10)
- [ ] Commit your changes with good message
- [ ] Push to your fork: `git push origin fix/1936-txtemplate-to-testenv`
- [ ] Update the PR description with your improvements
- [ ] Request review from @keypleb
- [ ] Respond to any feedback

### Phase 5: Merge (Day 11-14)
- [ ] Address all review comments
- [ ] Get approval from maintainers
- [ ] PR merged! 🎉
- [ ] Update your resume with "Contributed to BDK (Bitcoin Dev Kit)"

---

## Resources

### Learning Materials
- [Rust Book - Smart Pointers](https://doc.rust-lang.org/book/ch15-00-smart-pointers.html) (for Cow)
- [BDK Contributing Guide](https://github.com/bitcoindevkit/bdk/blob/master/CONTRIBUTING.md)
- [Code Orange Rust Resources](https://github.com/code-orange-dev/curriculum/tree/main/decoding-bitcoin)

### Code References
- Current TxTemplate: `crates/chain/tests/common/mod.rs`
- New location: `crates/testenv/src/tx_template/mod.rs`
- Similar patterns: Look at other test utilities in `crates/testenv/src/`

### Support
- **Discord:** #dev-help channel
- **Mentor:** @keypleb (DM anytime)
- **Weekly sync:** Sundays 2pm at Bitcoin House Bali

---

## Definition of Done

- [ ] TxTemplate module has comprehensive unit tests
- [ ] Documentation includes usage examples
- [ ] All existing tests still pass
- [ ] Code follows BDK style guidelines
- [ ] PR is approved and merged
- [ ] You've learned something new! 🧠

---

## Recognition

Upon completion:
- 🏆 Code Orange Certificate of Contribution
- 🌟 Featured on [PR Tracking Dashboard](https://github.com/code-orange-dev/PR-tracking-dashboard)
- 📝 Line on your resume: "Contributed to BDK, a popular Bitcoin wallet library"
- 🎯 Progress toward "Code Orange Contributor" badge

---

## Questions?

1. **"I don't understand Cow"** → Read Rust Book chapter 15, ask in Discord
2. **"Tests are failing"** → Run `cargo test --lib` for library tests only
3. **"Not sure about my approach"** → Open a draft PR and ask for early feedback
4. **"Stuck for more than a day"** → Ping @keypleb immediately

---

🍊 **Code Orange Dev School**  
Training Bitcoin OSS contributors from Southeast Asia to the world.

**Ready?** Reply with "🍊 Taking this" and let's build Bitcoin!

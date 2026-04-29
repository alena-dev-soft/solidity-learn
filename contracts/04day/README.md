# DAY 4

**🎯 ONE GOAL FOR THE DAY:**
Write a smart contract on your own — from scratch, without ready-made code.

---

## ✅ STEPS

### [ ] Step 1 — Read the task and think for 10 minutes (~10 minutes)

**Your assignment:**

Write a **"Wish List"** contract (`WishList`). Anyone can add a wish. Only the owner can mark a wish as fulfilled. Everyone can read the list.

Before writing any code — answer these questions for yourself:

- What data do I need? (`struct`? `mapping`? array?)
- What methods do I need?
- Where do I need `require`?

---

### [ ] Step 2 — Write the contract yourself (~40 minutes)

Create `WishList.sol` in Remix and start writing.

**Hints if you get stuck** (read one at a time, only when you truly need it):

<details>
<summary>Hint 1 — data structure</summary>

You need a `struct Wish` with two fields: the wish text and a fulfilled/not fulfilled flag.

</details>

<details>
<summary>Hint 2 — storage</summary>

A `Wish[]` array to store all the wishes.

</details>

<details>
<summary>Hint 3 — methods</summary>

You need three methods: `addWish`, `completeWish`, and `getWish`.

</details>

---

### [ ] Step 3 — Compile (~5 minutes)

If the compiler complains — read the error carefully. It's usually one of these:

- A missing semicolon
- A wrong type
- A typo in a name

Try to fix it yourself before asking for help.

---

### [ ] Step 4 — Deploy and test (~20 minutes)

- Add 3 wishes
- Mark one as fulfilled
- Try marking one from a different account → you should get an error

---

### [ ] Step 5 — Show me the code

Share what you wrote — we'll review it together: what's good, what can be improved. No judgment, only constructive feedback.

---

## 📦 EXPECTED RESULT

- ✅ A working contract written by your own hands
- ✅ Deployed on Sepolia
- ✅ You understand every line — because you wrote it yourself

---

## ⚠️ COMMON BEGINNER MISTAKE

Jumping straight to the hints. Solidity compiler errors are very informative — they tell you exactly what's wrong and on which line. Try to work through them yourself first. **That is real development.**

---

## 🤔 REVIEW QUESTIONS (answer in the evening)

1. What was the hardest thing to figure out on your own?
2. What compiler error did you get, and how did you fix it?
3. What would you add to the contract if you had more time?

---

## 🔗 RESOURCES

| Resource | Link |
|---|---|
| Browser IDE | https://remix.ethereum.org |
| Solidity types reference (only if you forgot the syntax) | https://docs.soliditylang.org/en/latest/types.html |
| Your contracts from previous days | — feel free to peek at the syntax, that's totally fine |
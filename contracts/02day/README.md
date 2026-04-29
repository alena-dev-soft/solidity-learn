# DAY 2

**🎯 ONE GOAL FOR THE DAY:**
Write a contract with real logic — a counter with rules — and understand how Solidity thinks.

---

## ✅ STEPS

### [ ] Step 1 — Open Remix and create a new file (~5 minutes)

Go to https://remix.ethereum.org

In the `contracts` folder, create a new file `Counter.sol`.

---

### [ ] Step 2 — Write the counter contract (~20 minutes)

Paste this code:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint256 public count;
    address public owner;

    constructor() {
        owner = msg.sender;
        count = 0;
    }

    function increment() public {
        count += 1;
    }

    function decrement() public {
        require(count > 0, "Already zero!");
        count -= 1;
    }

    function reset() public {
        require(msg.sender == owner, "Only owner can reset!");
        count = 0;
    }
}
```

**Breakdown in plain terms:**

| Solidity | C# equivalent |
|---|---|
| `uint256` | `uint` — same but only positive (unsigned) |
| `address` | No equivalent — it's a wallet address (`0x...`) |
| `msg.sender` | Like `HttpContext.User` in ASP.NET — the address of whoever called the method |
| `require(condition, "error")` | Like `if (!condition) throw new Exception("error")` |

---

### [ ] Step 3 — Compile and deploy to Sepolia (~15 minutes)

You already know how:

1. Compiler → green checkmark
2. Deploy → **Injected Provider — MetaMask** → Confirm in MetaMask

---

### [ ] Step 4 — Play with the contract in Remix (~20 minutes)

After deployment, method buttons will appear in Remix. Click them and observe:

- Click **`increment`** several times → watch `count` change
- Click **`decrement`** → `count` decreases
- Click **`reset`** → resets to zero (works because you are the owner)
- Click **`count`** → see the current value

> Every button click is a transaction. Every transaction pays gas.

---

### [ ] Step 5 — Find your contract on Etherscan and view all transactions (~10 minutes)

Copy the contract address from Remix → go to:

```
https://sepolia.etherscan.io/address/YOUR_CONTRACT_ADDRESS_HERE
```

You'll see a list of all method calls you made. This is a public history of all actions.

---

## 📦 EXPECTED RESULT

- ✅ Deployed `Counter` contract on Sepolia
- ✅ You clicked the buttons in Remix and saw `count` change
- ✅ Etherscan shows 4-5 transactions from your address
- ✅ You understand what `msg.sender` and `require` are

---

## ⚠️ COMMON BEGINNER MISTAKE

Thinking that every method call is free. `increment()`, `decrement()`, `reset()` — each of them spends gas, because they change the state of the blockchain. But there's one exception: simply **reading** data (`count`, `owner`) is **free**. Reading doesn't write to the blockchain, so no gas is needed.

> **Rule to remember: write = gas, read = free.**

---

## 🤔 REVIEW QUESTIONS (answer in the evening)

1. What is `msg.sender` in your own words?
2. Why is clicking `count` (read) free, while `increment` (write) costs gas?
3. What happens if `reset()` is called from someone else's wallet?

---

## 🔗 RESOURCES

| Resource | Link |
|---|---|
| Browser IDE | https://remix.ethereum.org |
| Solidity types reference (just the Types section, 5 min) | https://docs.soliditylang.org/en/latest/types.html |
| View your contract's transactions | https://sepolia.etherscan.io |
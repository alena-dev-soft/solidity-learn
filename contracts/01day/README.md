# DAY 1

**🎯 ONE GOAL FOR THE DAY:**
Deploy your first smart contract to a test network and see its address on the blockchain.

Before you start — 2 minutes of theory (I promise, just 2):
Imagine the blockchain is a SQL server that millions of people are connected to simultaneously. Nobody can delete a row from a table retroactively. A smart contract is like a stored procedure in that database: deploy it once, and it lives there forever, executing automatically according to its rules.
Remix is a browser-based Visual Studio for smart contracts. Nothing to install.

---

## ✅ STEPS

### [ ] Step 1 — Set up a MetaMask wallet (~20 minutes)

Go to https://metamask.io → "Download" → install the extension for Chrome/Firefox.

When creating a wallet, you'll be given 12 words (seed phrase). This is like a password for everything. Write it down in a file, don't lose it. There's no real money on the test network, but build the habit anyway.

Done — you have a wallet address (a long string starting with `0x...`). This is your "ID" on the blockchain.

---

### [ ] Step 2 — Switch to the Sepolia test network (~5 minutes)

In MetaMask, the top shows "Ethereum Mainnet" — click it, select "Show test networks" → choose **Sepolia**.

Test network = development environment. Like localhost, but public. The money here isn't real.

---

### [ ] Step 3 — Get free test ETH (~10 minutes)

Go to https://sepoliafaucet.com

Paste your `0x...` address from MetaMask → click "Send". Within 1-2 minutes, 0.5 ETH will appear in MetaMask (test ETH, not real).

ETH here is needed for "gas" — it's like payment for executing code on the blockchain. Analogy: SQL Server uses CPU for every query; the blockchain uses ETH.

---

### [ ] Step 4 — Open Remix and write your first contract (~30 minutes)

Go to https://remix.ethereum.org

On the left — file structure. Open the `contracts` folder → create a new file `MyFirst.sol`.

Paste this code in full:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyFirst {
    string public message;

    constructor(string memory _message) {
        message = _message;
    }

    function setMessage(string memory _newMessage) public {
        message = _newMessage;
    }
}
```

In plain terms: a class `MyFirst` with one field `message` (like `public string Message` in C#). The constructor takes an initial value. The `setMessage` method changes the value. That's it.

---

### [ ] Step 5 — Compile and deploy (~20 minutes)

1. In Remix, find the **"Solidity compiler"** icon on the left (looks like the letter S) → click "Compile MyFirst.sol". A green checkmark should appear.
2. Go to the **"Deploy & run transactions"** icon (arrow pointing right with a dot).
3. In the **Environment** field, select **"Injected Provider — MetaMask"**. MetaMask will ask for permission — allow it.
4. In the field next to the Deploy button, enter your message in quotes: `"Hello from Olena"`
5. Click **Deploy** → MetaMask will show a transaction window → click **Confirm**.
6. Wait 15-30 seconds. Your contract with its `0x...` address will appear at the bottom of Remix.

---

## 📦 EXPECTED RESULT

- ✅ Green compilation checkmark in Remix
- ✅ A transaction has gone through in MetaMask (visible in history)
- ✅ At the bottom of Remix — a block with your contract; click the `message` button and you'll see `"Hello from Olena"`
- ✅ Contract address `0x...` — copy it, it's your first "live" code on the blockchain

---

## ⚠️ COMMON BEGINNER MISTAKE

Selecting **"Remix VM"** in Environment instead of **"Injected Provider"**. Remix VM is a local simulation — the contract isn't deployed anywhere, it's like running code in memory. You won't see it on the real network. Make sure **"Injected Provider — MetaMask"** is selected and that MetaMask shows the **Sepolia** network.

---

## 🤔 REVIEW QUESTIONS (answer in the evening)

1. What is **gas** — explain in your own words (1-2 sentences)?
2. How does the **test network** differ from the **main network**?
3. If you've deployed a contract — can you **change its code** afterwards?

---

## 🔗 RESOURCES

| Resource | Link |
|---|---|
| Wallet (install first) | https://metamask.io |
| Free test ETH | https://sepoliafaucet.com |
| Browser IDE | https://remix.ethereum.org |
| View contract live | https://sepolia.etherscan.io |
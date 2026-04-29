# DAY 3

**🎯 ONE GOAL FOR THE DAY:**
Write a voting contract — your first contract with real business logic, the kind you'll find in actual projects.

---

## ✅ STEPS

### [ ] Step 1 — Create Voting.sol in Remix (~5 minutes)

Go to https://remix.ethereum.org → `contracts` folder → new file `Voting.sol`

---

### [ ] Step 2 — Write the contract (~25 minutes)

Paste this code:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    address public owner;
    mapping(address => bool) public hasVoted;
    Candidate[] public candidates;
    bool public votingOpen;

    constructor(string[] memory _names) {
        owner = msg.sender;
        votingOpen = true;
        for (uint i = 0; i < _names.length; i++) {
            candidates.push(Candidate({
                name: _names[i],
                voteCount: 0
            }));
        }
    }

    function vote(uint256 _candidateIndex) public {
        require(votingOpen, "Voting is closed!");
        require(!hasVoted[msg.sender], "Already voted!");
        require(_candidateIndex < candidates.length, "Invalid candidate!");
        
        hasVoted[msg.sender] = true;
        candidates[_candidateIndex].voteCount += 1;
    }

    function closeVoting() public {
        require(msg.sender == owner, "Only owner!");
        votingOpen = false;
    }

    function getCandidate(uint256 _index) public view returns (string memory, uint256) {
        return (candidates[_index].name, candidates[_index].voteCount);
    }
}
```

**Breakdown in plain terms:**

| Solidity | C# equivalent |
|---|---|
| `struct` | Like a class in C# but without methods — just data |
| `mapping(address => bool)` | `Dictionary<address, bool>` — stores who has already voted |
| `Candidate[]` | Like `List<Candidate>` in C# |
| `view` on a method | "I only read, I don't write" — therefore free (remember yesterday?) |

---

### [ ] Step 3 — Deploy with parameters (~15 minutes)

You need to pass an array of candidate names in the Deploy field.

In Remix, paste this into the field next to the Deploy button:

```
["Alice", "Bob", "Charlie"]
```

Confirm in MetaMask → wait for the transaction.

---

### [ ] Step 4 — Vote and test the protection (~20 minutes)

After deployment, buttons will appear in Remix. Try them in order:

1. Click **`vote`** with parameter `0` → vote for Alice
2. Click **`vote`** with parameter `0` again → you should get the error **"Already voted!"**
3. Click **`getCandidate`** with parameter `0` → see `"Alice"` and `voteCount: 1`
4. Click **`closeVoting`** → voting is now closed
5. Click **`vote`** with parameter `1` → error **"Voting is closed!"**

---

### [ ] Step 5 — Find the contract on Etherscan (~5 minutes)

Copy the contract address from Remix → paste it at:

```
https://sepolia.etherscan.io/address/YOUR_CONTRACT_ADDRESS_HERE
```

Check the **"Contract"** tab — your code is publicly visible there.

---

## 📦 EXPECTED RESULT

- ✅ Deployed `Voting` contract on Sepolia
- ✅ You triggered the "Already voted!" error — the protection works
- ✅ Etherscan shows the voting transactions
- ✅ You understand `struct`, `mapping`, and arrays in Solidity

---

## ⚠️ COMMON BEGINNER MISTAKE

Forgetting the quotes and brackets when deploying. A string array must be passed **exactly** like this: `["Alice", "Bob", "Charlie"]` — with square brackets and quotes inside. Without them, Remix will throw a cryptic error and you'll spend time hunting for a bug that isn't in your code.

---

## 🤔 REVIEW QUESTIONS (answer in the evening)

1. How does `mapping` differ from a regular `Candidate[]` array?
2. Why is `getCandidate` marked as `view` — what does that give you?
3. If two different wallets both call `vote(0)` — will both votes be counted?

---

## 🔗 RESOURCES

| Resource | Link |
|---|---|
| Browser IDE | https://remix.ethereum.org |
| Solidity mappings reference (3 min, just the Mappings section) | https://docs.soliditylang.org/en/latest/types.html#mappings |
| View your contract's transactions | https://sepolia.etherscan.io |
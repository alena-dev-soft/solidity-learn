# DAY 5

**🎯 ONE GOAL FOR THE DAY:**
Build a React dApp that connects to MetaMask and displays your Wishlist contract in the browser.

---

## ✅ STEPS

### [ ] Step 1 — Create a React project (~10 minutes)

```bash
npm create vite@latest wishlist-dapp -- --template react-ts
cd wishlist-dapp
npm install
npm install ethers
npm run dev
```

Open http://localhost:5173 — you'll see the default Vite page.

---

### [ ] Step 2 — Prepare the contract data (~10 minutes)

Create the file `src/contract.ts`:

```typescript
export const CONTRACT_ADDRESS = "YOUR_WISHLIST_CONTRACT_ADDRESS_HERE";

export const CONTRACT_ABI = [
  "function addWish(string memory _name) public",
  "function fulfillWish(uint _index) public",
  "function getWishes() public view returns (tuple(string name, bool isFullfilled)[])",
  "function getWish(uint256 _index) public view returns (tuple(string name, bool isFullfilled))",
  "function owner() public view returns (address)"
];
```

**ABI — what is it in .NET terms?**

> ABI = a list of method signatures. Like `interface IWishlist` in C# — describes what exists, but not how it works.

Grab the contract address from Remix or Etherscan — the one you deployed today.

---

### [ ] Step 3 — Write the MetaMask hook (~20 minutes)

Create the file `src/useWishlist.ts`:

```typescript
import { useState } from "react";
import { ethers } from "ethers";
import { CONTRACT_ADDRESS, CONTRACT_ABI } from "./contract";

interface WishItem {
  name: string;
  isFullfilled: boolean;
}

export function useWishlist() {
  const [account, setAccount] = useState<string>("");
  const [wishes, setWishes] = useState<WishItem[]>([]);
  const [loading, setLoading] = useState(false);

  async function connect() {
    const provider = new ethers.BrowserProvider(window.ethereum);
    const accounts = await provider.send("eth_requestAccounts", []);
    setAccount(accounts[0]);
    await loadWishes(provider);
  }

  async function loadWishes(provider: ethers.BrowserProvider) {
    const contract = new ethers.Contract(CONTRACT_ADDRESS, CONTRACT_ABI, provider);
    const result = await contract.getWishes();
    setWishes(result.map((w: WishItem) => ({
      name: w.name,
      isFullfilled: w.isFullfilled
    })));
  }

  async function addWish(name: string) {
    setLoading(true);
    const provider = new ethers.BrowserProvider(window.ethereum);
    const signer = await provider.getSigner();
    const contract = new ethers.Contract(CONTRACT_ADDRESS, CONTRACT_ABI, signer);
    const tx = await contract.addWish(name);
    await tx.wait();
    await loadWishes(provider);
    setLoading(false);
  }

  async function fulfillWish(index: number) {
    setLoading(true);
    const provider = new ethers.BrowserProvider(window.ethereum);
    const signer = await provider.getSigner();
    const contract = new ethers.Contract(CONTRACT_ADDRESS, CONTRACT_ABI, signer);
    const tx = await contract.fulfillWish(index);
    await tx.wait();
    await loadWishes(provider);
    setLoading(false);
  }

  return { account, wishes, loading, connect, addWish, fulfillWish };
}
```

**Key concept:**

| | Role |
|---|---|
| `provider` | Reads data from the blockchain (free) |
| `signer` | Signs transactions through MetaMask (pays gas) |

**In .NET terms:**

> `provider` = a read-only `DbContext`.
> `signer` = a `DbContext` with permission to call `SaveChanges()`.

---

### [ ] Step 4 — Write the UI (~20 minutes)

Replace the contents of `src/App.tsx`:

```typescript
import { useState } from "react";
import { useWishlist } from "./useWishlist";

function App() {
  const { account, wishes, loading, connect, addWish, fulfillWish } = useWishlist();
  const [newWish, setNewWish] = useState("");

  async function handleAdd() {
    if (!newWish.trim()) return;
    await addWish(newWish);
    setNewWish("");
  }

  return (
    <div style={{ maxWidth: 600, margin: "40px auto", fontFamily: "sans-serif" }}>
      <h1>🌟 My Wishlist</h1>

      {!account ? (
        <button onClick={connect}>Connect MetaMask</button>
      ) : (
        <p>Connected: {account.slice(0, 6)}...{account.slice(-4)}</p>
      )}

      {account && (
        <>
          <div style={{ margin: "20px 0" }}>
            <input
              value={newWish}
              onChange={e => setNewWish(e.target.value)}
              placeholder="Add a wish..."
              style={{ padding: 8, width: 300 }}
            />
            <button onClick={handleAdd} disabled={loading} style={{ marginLeft: 8 }}>
              {loading ? "Adding..." : "Add"}
            </button>
          </div>

          <ul style={{ listStyle: "none", padding: 0 }}>
            {wishes.map((wish, i) => (
              <li key={i} style={{ 
                padding: 12, 
                margin: "8px 0", 
                background: wish.isFullfilled ? "#d4edda" : "#f8f9fa",
                borderRadius: 8,
                display: "flex",
                justifyContent: "space-between",
                alignItems: "center"
              }}>
                <span style={{ textDecoration: wish.isFullfilled ? "line-through" : "none" }}>
                  {wish.isFullfilled ? "✅" : "🌟"} {wish.name}
                </span>
                {!wish.isFullfilled && (
                  <button onClick={() => fulfillWish(i)} disabled={loading}>
                    Complete
                  </button>
                )}
              </li>
            ))}
          </ul>
        </>
      )}
    </div>
  );
}

export default App;
```

---

### [ ] Step 5 — Run and test (~15 minutes)

```bash
npm run dev
```

Open http://localhost:5173 → click **Connect MetaMask** → add a wish → mark it as fulfilled.

---

## 📦 EXPECTED RESULT

- ✅ A working UI in the browser
- ✅ MetaMask connects with a button click
- ✅ The wish list loads from the blockchain
- ✅ You can add a wish and see the transaction in MetaMask
- ✅ Fulfilled wishes appear with a strikethrough

---

## ⚠️ COMMON BEGINNER MISTAKE

Forgetting that MetaMask must be on the **Sepolia** network. If it's on Mainnet — transactions will go to the wrong place. Always check the network before testing.

---

## 🤔 REVIEW QUESTIONS (answer in the evening)

1. What's the difference between `provider` and `signer` in your own words?
2. Why does `getWishes()` not require a signer, but `addWish()` does?
3. What is ABI and why does the frontend need it?

---

## 🔗 RESOURCES

| Resource | Link |
|---|---|
| Ethers.js docs (just the "Connecting to Ethereum" section) | https://docs.ethers.org/v6/getting-started/ |
| Vite docs (if something won't start) | https://vitejs.dev |
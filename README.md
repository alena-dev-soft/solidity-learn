# 🦕 From .NET to Web3 — Learning in Public

> *A senior .NET developer with 14+ years of experience walks into Web3. One day at a time.*

---

## Who is this?

I've been writing .NET for many years. I love it — but after 14+ years, the brain needs something new. You know that feeling when a familiar codebase stops being interesting and starts being just... familiar? Yeah. Time for a change.

So I chose **Web3**. And decided to do it **publicly**, one day at a time.

To avoid wandering alone, I built myself an AI mentor. I configured Claude to guide me in a structured way: one goal per day, theory only when it actually matters, and an honest breakdown of where I went wrong. A coach who never gets tired and answers at any hour 😄

---

## The Format

Every day has:
- 🎯 **One clear goal** — no scope creep
- ✅ **Step-by-step instructions** — zero assumed knowledge
- 📦 **Expected result** — so I know when I'm actually done
- ⚠️ **Common mistake** — the thing I almost fell into
- 🤔 **Review questions** — to check I actually understood it

---

## My Stack Coming In

```
Language:     C# / .NET (15+ years)
Databases:    SQL Server, Snowflake
Backend:      ASP.NET, Windows Services, WinForms
ETL:          Matillion, Azure Blob Storage, SFTP
Cloud:        Azure, AWS
Web3 before:  Zero. Absolute zero.
```

---

## Progress Log (up to date)

| Day | Goal | Status |
|-----|------|--------|
| [Day 1](./day1_instructions.md) | Deploy first smart contract to Sepolia testnet | ✅ Done |
| [Day 2](./day2_instructions.md) | Write a Counter contract — understand `msg.sender`, `require`, gas | ✅ Done |
| [Day 3](./day3_instructions.md) | Build a Voting contract — `struct`, `mapping`, real business logic | ✅ Done |
| Day 4 | — | 🔜 Coming |

---

## Key Concepts — In .NET Terms (up to date)

| Solidity | .NET equivalent |
|---|---|
| Smart contract | A class deployed to a server you can't modify later |
| `uint256` | `uint` — same but always positive |
| `address` | No equivalent — a wallet's unique ID (`0x...`) |
| `msg.sender` | `HttpContext.User` — whoever called the method |
| `require(x, "err")` | `if (!x) throw new Exception("err")` |
| `mapping(K => V)` | `Dictionary<K, V>` |
| `struct` | A class with no methods — just data |
| `view` function | A `GET` endpoint — reads only, costs no gas |
| Gas | CPU cost per operation, paid in ETH |
| Testnet (Sepolia) | `localhost` — but public |

---

## Tools I'm Using

| Tool | What for |
|---|---|
| [Remix IDE](https://remix.ethereum.org) | Browser-based IDE for Solidity — no install needed |
| [MetaMask](https://metamask.io) | Wallet — your identity on the blockchain |
| [Sepolia Faucet](https://sepoliafaucet.com) | Free test ETH for the dev network |
| [Sepolia Etherscan](https://sepolia.etherscan.io) | Public explorer — see every transaction live |
| Claude | AI mentor — structured daily curriculum |

---

## Why Public?

Because writing things down forces clarity. Because maybe another .NET developer somewhere is thinking the same thing. And because accountability is a feature, not a bug.

---

*Built one day at a time. Updates as they happen.*

# 🏥 Health Insurance Claim Verifier

## 💡 What is this?

A smart contract that automates the **health insurance claim process** on-chain. Hospitals can submit claims on behalf of patients, and the insurer can approve, reject, and settle the claim — all without paperwork or intermediaries. 

---

## 🎯 Why was this built? 

✅ Traditional insurance claim processing is:

- Time-consuming
- Prone to fraud
- Burdened with manual paperwork

🔐 This smart contract introduces:

- Transparency
- Automation
- Trustless payouts
- Fraud prevention (claims above coverage are blocked)

---

## ⚙️ Core Features

- **Policy Registration**: Insurer adds patients with their coverage limits.
- **Claim Submission**: Hospitals submit treatment details and cost.
- **Approval Process**: Insurer verifies and approves or rejects claims.
- **Auto-Payout**: Approved claims are paid directly to the hospital.
- **Security**: Only insurer can register policies and manage claims.

---

## 📦 Example Use Case

1. Alice buys a health policy (₹5,00,000 coverage).
2. A hospital treats Alice and submits a ₹1,50,000 claim.
3. Insurer verifies claim data and approves it.
4. Smart contract automatically pays the hospital ₹1,50,000.

---

## 🔐 Roles

- **Insurer (Admin)**: Manages policyholders and reviews claims.
- **Hospital**: Submits claims on behalf of patients.
- **Patient**: Has insurance coverage.

---

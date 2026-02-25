# Yield Aggregator Vault

An expert-level implementation of a yield-generating vault based on the EIP-4626 Tokenized Vault Standard. This repository provides a secure and gas-efficient way for users to aggregate yield from various DeFi protocols through a unified interface.

## Overview
The vault accepts a specific underlying asset (e.g., USDC) and issues shares to the depositor. The underlying assets are then deployed into external protocols (like Aave or Compound). As interest is earned, the value of each share increases relative to the underlying asset.

### Key Features
* **ERC-4626 Standard:** Fully compatible with the latest Ethereum vault standard for seamless integration with other DeFi legos.
* **Auto-Compounding:** Yield is automatically reinvested to harness the power of compound interest.
* **Share-Based Accounting:** Accurate tracking of user positions through a mint/burn share mechanism.
* **Security:** Implements slippage protection and reentrancy guards for safe deposits and withdrawals.

## Technical Stack
* **Language:** Solidity ^0.8.20
* **Standard:** ERC-4626 (Tokenized Vaults)
* **License:** MIT

## Getting Started
1. Deploy the `YieldVault.sol` by specifying the underlying ERC-20 token address.
2. Users call `deposit()` or `mint()` to provide liquidity.
3. The vault manager (or an automated keeper) triggers strategy rebalancing.
4. Users call `withdraw()` or `redeem()` to exit with their principal plus earned yield.

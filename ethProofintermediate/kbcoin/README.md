# Kbcoin Solidity Token Contract

This is an erc20 Solidity smart contract for managing a token called Kbcoin (KC). 

## Features

- Create and manage a token with a name (Kbcoin), abbreviation (KC), and a total supply.
- Mint new tokens and distribute them to specific addresses.
- only owner can mint
- Burn existing tokens from specific addresses, with balance checks to prevent excessive burning.
- the address responsible for deployment can mint tokens to any address and any user that owns tokens can destroy them
- the contract is erc20 compliant
- users can transfer tokens and approve other users to transfer tokens for them

### Prerequisites

- [Solidity](https://soliditylang.org/) - Make sure you have Solidity installed on your development environment.

### Installation

compile in the remix ide

deploy to the remix vm for testing or to an evm blockchain

License
This project is licensed under the MIT License 

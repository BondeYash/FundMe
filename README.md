# FundMe Project ReadMe

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
  - [Installation](#installation)
  - [Deployment](#deployment)
- [Functionality](#functionality)
  - [Funding the Contract](#funding-the-contract)
  - [Withdrawing Funds](#withdrawing-funds)
- [Testing](#testing)
- [Gas Efficiency](#gas-efficiency)
- [License](#license)

## Overview

The FundMe project is a smart contract built on the Ethereum blockchain using the Solidity programming language. It allows users to fund the contract with Ether (ETH) based on the current ETH/USD price provided by the Chainlink Price Feed. The contract has an owner who can withdraw the funds once they have been accumulated. The contract ensures that each individual funding transaction meets a minimum funding threshold in USD.

## Prerequisites

To interact with the FundMe contract, you will need the following:

1. An Ethereum wallet (e.g., MetaMask) to send transactions and interact with the contract.
2. Some Ether (ETH) to fund the contract.
3. Access to an Ethereum development environment like Remix or Truffle, or an Ethereum wallet with built-in contract interaction capabilities.

## Getting Started

### Installation

1. Clone the FundMe repository from [GitHub Repository URL](https://github.com/BondeYash/FundMe.git).

### Deployment

1. Deploy the FundMe contract on an Ethereum development environment or the mainnet. You can use Remix or Truffle for development purposes.

2. When deploying the contract, pass the address of the Chainlink Price Feed contract as a parameter to the constructor. This Price Feed contract provides the current ETH/USD exchange rate.

3. After deploying the contract, the deploying account will become the contract's owner. Only the owner can withdraw the funds.

## Functionality

### Funding the Contract

To fund the contract with Ether, follow these steps:

1. Call the `fund` function on the FundMe contract, and send Ether along with the transaction.

2. The contract will use the Chainlink Price Feed to determine the current ETH/USD rate.

3. If the ETH amount sent with the transaction is equivalent to or greater than the specified minimum funding threshold in USD, the contract will register the funder's address and the funded amount.

### Withdrawing Funds

Only the contract owner can withdraw the funds. To withdraw the accumulated funds, follow these steps:

1. Call the `withdraw` function on the FundMe contract.

2. The contract will distribute the accumulated funds back to each funder in proportion to their contributions.

3. After the withdrawal, the contract balance will be zero.

## Testing

The FundMe contract has been tested to ensure its functionality. The test cases cover various scenarios, including funding the contract, ensuring the minimum funding threshold, and withdrawing the funds.

To run the tests:

1. Open an Ethereum development environment (e.g., Remix or Truffle).

2. Deploy the FundMe contract on the local development network.

3. Run the test scripts available in the "tests" folder.

## Gas Efficiency

The FundMe contract has been designed with gas efficiency in mind. Efforts have been made to minimize gas costs for various operations.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

---

Thank you for your interest in the FundMe project! If you encounter any issues or have any questions, please feel free to contact the project maintainers. Happy funding!


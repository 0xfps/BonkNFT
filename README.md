# BonkNFT
Bonk NFT Project.

A contract that plays around with ERC721 specification, and mints NFT Tokens free to a particular group of addresses added to the whitelist, while skipping those that aren't.

Addresses are added and removed from the whitelist in the [Whitelist.sol](https://github.com/fps8k/BonkNFT/blob/dev/contracts/Whitelist.sol) contract. This gives them the priviledge of getting the NFT minted to them for free.

The minting or airdrop is done on the [BonkNFT.sol](https://github.com/fps8k/BonkNFT/blob/dev/contracts/BonkNFT.sol) contract.

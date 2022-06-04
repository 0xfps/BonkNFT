// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

// ======== I M P O R T S ============

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "./Whitelist.sol";

// ======== I M P O R T S ============


/*
* @title: BonkNFT
* @author: Anthony (fps) https://github.com/fps8k .
* @dev: 
*
* Just a random NFT project I want to build.
* I will also include a Whitelist.
*/

contract Bonk is ERC721, Whitelist
{
    constructor () ERC721 ("Bonk NFT", "BNK") {}
}
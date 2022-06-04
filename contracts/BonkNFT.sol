// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";

/*
* @title: BonkNFT
* @author: Anthony (fps) https://github.com/fps8k .
* @dev: 
*
* Just a random NFT project I want to build.
*/

contract Bonk is ERC721
{
    constructor () ERC721 ("Bonk NFT", "BNK"){}
}
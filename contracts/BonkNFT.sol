// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

// ======== I M P O R T S ============

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "./Whitelist.sol";
import "../libraries/Math.sol";

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
    // Using Math for all uint256.
    using Math for uint256;

    // Token Id, supporting infinite mintings.
    uint256 private token_id = 1000;

    // Constructor.
    constructor () ERC721 ("Bonk NFT", "BNK") {}



    /*
    * @dev
    *
    * Airdrops some tokens to some specified addresses.
    * The addresses must be in the whitelist, else, the function skips them.
    *
    *
    * @param
    *
    * address[] _address => array of addresses
    */
    function airDrop(address[] memory _address) public
    {
        // Ensure that the person calling the function is an admin or a moderator.
        require(isAdmin(), "Not owner or moderator");
        // Get length of array.
        uint256 _l = _address.length;
        // Loop through each address and add them to the whitelist.
        for (uint256 i = 0; i < _l; i++)
        {
            // Current address.
            address current_address = _address[i];
            // If the address is not in the whitelist.
            if (whitelist[current_address] == true)
            {
                // Mint to the address.
                _safeMint(current_address, token_id, "");
                // Increment the token id.
                token_id = token_id.increment();
            }
            else
            {
                // Continue.
                continue;
            }
        }
    }



    /*
    * @dev
    *  
    * Mint once to the owner.
    */
    function newMint() public
    {
        // Ensure that the person calling the function is an admin or a moderator.
        require(isAdmin(), "Not owner or moderator");
        // Mint to the address.
        _safeMint(_owner, token_id, "");
        // Increment the token id.
        token_id = token_id.increment();
    }
}
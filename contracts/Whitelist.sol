// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;
import "../libraries/Math.sol";

/*
* @title: BonkNFT Whitelist.
* @author: Anthony (fps) https://github.com/fps8k .
* @dev: 
*/

contract Whitelist
{
    // Use the Math for uint256.
    using Math for uint256;

    // Mapping of addresses whitelisted
    mapping(address => bool) private whitelist;

    // Owner address.
    address private _owner;

    // Administrators or Moderator mapping.
    mapping(address => bool) private moderators;

    // Keep count of whitelist addresses.
    uint256 private whitelist_count;



    // ======== E V E N T S ==============

    // Emitted when a new owner is set.
    event NewOwner(address indexed old_owner, address indexed new_owner);
    // Emitted when a new address is added to the moderator.
    event NewModerator(address indexed moderatee, address indexed moderator);
    // Emitted when a new address is added to the whitelist.
    event NewAddressToWhitelist(address indexed moderator, address indexed user);
    // Emitted when a new address is removed from the whitelist.
    event RemoveAddressFromWhitelist(address indexed moderator, address indexed user);

    // ======== E V E N T S ==============



    // Constructor to set the owner address.
    constructor()
    {
        // Set the owner address.
        _owner = msg.sender;
        // Add owner to the moderators.
        moderators[msg.sender] = true;
        // Emit NewOwner event.
        emit NewOwner(address(0), msg.sender);
        // Emit NewModerator event.
        emit NewModerator(address(0), msg.sender);
    }



    /*
    * @dev
    *
    * Control function to make sure that only an owner or an admin can call a particular function.
    */
    function isAdmin() private view returns(bool)
    {
        return ((msg.sender == _owner) || (moderators[msg.sender] == true));
    }



    /*
    * @dev
    *
    * Function adds a user to the whitelist.
    *
    *
    * @param
    *
    * address _address => address to add to whitelist.
    */
    function addToWhitelist(address _address) public
    {
        // Ensure that the person calling the function is an admin or a moderator.
        require(isAdmin(), "Not owner or moderator");
        // Add address.
        add(_address);
    }



    /*
    * @dev
    *
    * Function removes a user from the whitelist.
    *
    *
    * @param
    *
    * address _address => address to remove from whitelist.
    */
    function removeFromWhitelist(address _address) public
    {
        // Ensure that the person calling the function is an admin or a moderator.
        require(isAdmin(), "Not owner or moderator");
        // Remove address.
        remove(_address);
    }



    /*
    * @dev
    *
    * Function adds an array of users to the whitelist.
    *
    *
    * @param
    *
    * address[] _address => array of addresses to add to whitelist.
    */
    function addArrayToWhitelist(address[] memory _address) public
    {
        // Ensure that the person calling the function is an admin or a moderator.
        require(isAdmin(), "Not owner or moderator");
        // Get length of array.
        uint256 _l = _address.length;
        // Loop through each address and add them to the whitelist.
        for (uint256 i = 0; i < _l; i++)
        {
            // Add address at index to whitelist.
            add(_address[i]);
        }
    }



    /*
    * @dev
    *
    * Function adds an array of users to the whitelist.
    *
    *
    * @param
    *
    * address[] _address => array of addresses to remove from whitelist.
    */
    function removeArrayFromWhitelist(address[] memory _address) public
    {
        // Ensure that the person calling the function is an admin or a moderator.
        require(isAdmin(), "Not owner or moderator");
        // Get length of array.
        uint256 _l = _address.length;
        // Loop through each address and add them to the whitelist.
        for (uint256 i = 0; i < _l; i++)
        {
            // Remove address at index from whitelist.
            remove(_address[i]);
        }
    }



    /*
    * @dev
    *
    * Does the actual addition to whitelist function.
    *
    *
    * @param
    *
    * address _address => address to add to whitelist.
    */
    function add(address _address) private
    {
        // Set the address to true on the whitelist.
        whitelist[_address] = true;
        // Increment the whitelist count.
        whitelist_count = whitelist_count.increment();
        // Emit the NewAddressToWhitelist function.
        emit NewAddressToWhitelist(msg.sender, _address);
    }



    /*
    * @dev
    *
    * Does the actual removal from whitelist function.
    *
    *
    * @param
    *
    * address _address => address to remove from whitelist.
    */
    function remove(address _address) private
    {
        // Set the address to false on the whitelist.
        whitelist[_address] = false;
        // Decrement the whitelist count.
        whitelist_count = whitelist_count.decrement();
        // Emit the RemoveAddressFromWhitelist function.
        emit RemoveAddressFromWhitelist(msg.sender, _address);
    }
}
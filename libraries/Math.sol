// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0;

/*
* @title: Math Library for additions only.
* @author: Anthony (fps) https://github.com/fps8k .
* @dev: 
*/

library Math
{
    /*
    * @dev
    *
    * Simply adds one to a number.
    */
    function increment(uint256 a) internal pure returns(uint256)
    {
        // Ensure the addition does not overflow.
        require((a + 1) < type(uint256).max);
        // Return the summation.
        return(a + 1);
    }



    /*
    * @dev
    *
    * Simply subtracts one from a number.
    */
    function decrement(uint256 a) internal pure returns(uint256)
    {
        // Ensure the addition does not overflow.
        require((a - 1) > type(uint256).min);
        // Return the summation.
        return(a - 1);
    }
}
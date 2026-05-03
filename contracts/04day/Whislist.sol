// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Wishlist { 
    struct WishItem {
        string name;
        bool isFullfilled;
    }

    address public owner; 
    
    WishItem[] public wishes; 
    
    constructor() {
        owner = msg.sender;
    }

    function addWish(string memory _name) public {
        wishes.push(WishItem({
            name: _name,
            isFullfilled: false
        }));
    }

    function fulfillWish(uint _index) public {
        require(msg.sender == owner, "Only owner");
        require(_index < wishes.length, "Invalid index");
        wishes[_index].isFullfilled = true;
    }

    function getWishes() public view returns (WishItem[] memory) {
        return wishes;
    }

    function getWish(uint256 _index) public view returns(WishItem memory) {
        require(_index < wishes.length, "Invalid index");
        return wishes[_index];
    }
}
//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract VolcanoCoin {
    uint totalSupply;
    address owner;
    
    uint constant SUPPLY_INCREASE = 1000;
    
    event SupplyChanged(uint _newSupply);
    
    constructor() {
        totalSupply = 10000;
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        if (msg.sender == owner) {
            _; // underscore means "it is okay to execute code inside the function"
        }
    }
    
    function increaseTotalSupply() public onlyOwner {
        totalSupply = totalSupply + SUPPLY_INCREASE;
        emit SupplyChanged(totalSupply);
    }
    
    function getTotalSupply() public view returns (uint) {
        return totalSupply;
    }
    
}
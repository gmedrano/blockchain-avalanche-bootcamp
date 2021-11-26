//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract VolcanoCoin {
    uint totalSupply;
    address owner;
    
    mapping(address => uint) balances;
    
    uint constant SUPPLY_INCREASE = 1000;
    
    event SupplyChanged(uint _newSupply);
    event TransferSent(address _receiver, uint _amount);
    
    constructor() {
        totalSupply = 10000;
        owner = msg.sender;
        balances[owner] = totalSupply;
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
    
    function transferCoins(address _receiver, uint _amount) public onlyOwner {
        balances[owner] = balances[owner] - _amount;
        balances[_receiver] = balances[_receiver] + _amount;
        
        emit TransferSent(_receiver, _amount);
    }
    
    function setBalance(uint _amount) public onlyOwner {
        balances[owner] = _amount;
    }
    
    function getBalance() public view returns (uint) {
        return balances[owner];
    }
    
}
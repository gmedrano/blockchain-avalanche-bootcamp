//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VolcanoCoin2 is ERC20("VolcanoCoin2", "VLC"), Ownable {
    
    uint constant INITIAL_SUPPLY = 10000;
    struct Payment {
        uint amount;
        address recipient;
    }
    mapping (address => Payment[]) public payments;
    
    event SupplyChanged(uint _newSupply);
    event TransferSent(address _receiver, uint _amount);
    
    constructor() {
        _mint(msg.sender, INITIAL_SUPPLY);
    }
    
    function mintTokens(uint _tokenAmount) public onlyOwner {
        _mint(msg.sender, _tokenAmount);
    }

    function transfer(address _recipient, uint _amount) public override virtual onlyOwner returns (bool) {
        _transfer(msg.sender, _recipient, _amount);
        payments[msg.sender].push(Payment({amount: _amount, recipient: _recipient}));
        return true;
    }
}
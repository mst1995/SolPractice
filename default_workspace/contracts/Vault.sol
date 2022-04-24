// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Vault is ERC20{

    //用户存款金额
    mapping(address =>uint256) public deposited;

     //ERC20 名称，简称
    constructor() ERC20("MyERC20","MyERC20"){
        //(地址，发行量)
        _mint(msg.sender,10000);
    }

    function approveAccount(address spender,uint256 _amount) public{
        ERC20.approve(spender,_amount);
    }

    function deposit(uint256 _amount) public{
        ERC20.transferFrom(msg.sender,address(this),_amount);
        deposited[msg.sender] += _amount;
    }

    function withdraw(uint256 _amount) public{
        require(deposited[msg.sender] >= _amount,"not enough money");
        deposited[msg.sender] -= _amount;
    }
}
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyRRC20 is ERC20{

    //ERC20 名称，简称
    constructor(uint256 _amount) ERC20("MyERC20","MyERC20"){
        //(地址，发行量)
        _mint(msg.sender,_amount);
    }
}
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Counter {

    mapping(address => uint256) public balances;

    //查询
    function getAccount() public view returns (uint) {
        return balances[msg.sender];
    }

    //存钱
    function saveMoney(uint _accout) external payable returns(bool){
        balances[msg.sender] += _accout;
        return true;
    }

    //取钱
    function withDraw(uint256 _withdraMoney) external payable{
        require(balances[msg.sender] >= _withdraMoney,"not enough money" );
        balances[msg.sender] -= _withdraMoney;
    }
}
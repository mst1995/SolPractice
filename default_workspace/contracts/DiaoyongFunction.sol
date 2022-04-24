// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;
//方法的调用 java用的是 A a = new A(); 这里则是将合约名字放进另一个合约名字参数的入参
contract A{
    uint public x;
    uint public value;

    function setX(uint _x) public returns(uint){
        x = _x;
        return x;
    }

    function setXandSendEther(uint _x) public payable returns(uint,uint){
        x = _x;
        value = msg.value;
        return(x,value);
    }
}

contract B{

    function setX(A a, uint _x) public {
        a.setX(_x);
    }

    function callsetXFromAddress(address _contractAddress,uint _x) public{
        A _a = new A(_contractAddress);
        _a.setX(_x);
    }

    function callsetXandSendEther(A a,uint _x) public payable{
        a.setXandSendEther{value : msg.value}(_x);
    }


}
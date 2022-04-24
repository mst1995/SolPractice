// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract Bank {

    //修饰符使用 constant view pure 用view的话不需要gas

    uint public age;

    function increaseAge() public {
        age ++;
    }

    //view查询不能修改
    function getAgeWithView() public view {
        return age;
    }
} 

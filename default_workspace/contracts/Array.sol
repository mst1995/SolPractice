// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract Array{
    uint[] public array1;
    uint[3] public array2;
    uint[] public array3 = [1,2,3];

    function push(uint _number) public{
        array1.push(_number);
    }

    function push3(uint _number) public{
        array3.push(_number);
    }

    function pop() public{
        array1.pop();
    }

    function getLength() public view returns(uint){
        return array1.length;
    }

    function getLength3() public view returns(uint){
        return array3.length;
    }

    function deleteElement(uint _idx) public{
        //把元素删除，变成初始化的值，长度保持不变
        delete array1[_idx];
    }

    function compactDelete(uint _idx) public {
        require(_idx >= 0 && _idx <array1.length,"out of index");
        if(_idx == array1.length -1){
            array1.pop();
        }else{
            uint lastElement = array1[array1.length -1];
            array1[_idx] = lastElement;
            array1.pop();
        }
    }

    function test() public {
        array1.push(100);
        array1.push(200);
        array1.push(300);
        array1.push(400);

        compactDelete(1);

    }




}
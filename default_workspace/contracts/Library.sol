// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;
//library 相当于公共方法
library SafeMath{

    function add(uint x,uint y) internal pure returns(uint){
        uint result = x + y;
        return result;
    }
}

contract testSafeMath{
    /**
    using A for B,这里A通常是某个library里面定义的某个方法，
    B是某种数据类型，这句话是把A方法绑定到B类型上，相当于给B类型附加了一个A方法。
    **/
    using SafeMath for uint; //using 公用方法 for 回参 

    function testAdd(uint x,uint y) public pure returns(uint){
        //所以将x入参赋予了方法
    
        uint result = x.add(y);
        return result;
    }
}

library Array{
    function remove(uint[] storage arr,uint index) public {
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }
}

contract TestArray{
    using Array for uint[];

    uint[] public testArr;

    function testArrayRemove() public{

        testArr.push(1);
        testArr.push(2);
        testArr.push(3);

        testArr.remove(3);

        assert(testArr.length ==2);
        assert(testArr[0] == 1);
        assert(testArr[1] == 3);
    }
    
}




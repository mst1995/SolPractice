// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract xiushifu {

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

contract privatePublicExtInt{

    uint age = 100;

    function getAgeWithPublic() public view returns(uint){
        return age;
    }

    //类似java的protected
    function getAgeWithInternal() internal view returns(uint){
        return age;
    }

    function getAgeWithPrivate() private view returns(uint){
        return age;
    }

    //方法里不能调用external的方法得成功部署到链上面的时候，调用
    function getAgeWithExternal() external view returns(uint){
        return age;
    }

    function callFunction() public view returns(uint){
        //return getAgeWithExternal;报错，不能内部调用
        return getAgeWithPublic;
    }









}
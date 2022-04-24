// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract A{

    string public name;
    string public height;

    constructor(string memory _name,string memory _height){
        name = _name;
        height = _height;
    }

    function setName() public view virtual returns(string memory ){
        return name;
    }
}

contract B{

    string public helloworld;

    constructor(string memory _helloworld){
        helloworld = _helloworld;
    }

     function getHelloWorld() public view virtual returns(string memory){
        return helloworld;
    }
   
}


contract C is A("haha","steven"),B("Helloword") {

}

contract D is A,B{

    constructor(string memory _name,string memory _helloworld) A(_name,_helloworld) B(_helloworld){
        
    }
}
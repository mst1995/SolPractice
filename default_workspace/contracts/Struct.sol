// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract Struct {

    struct Todo{
        string task;
        bool completed;
    }

    Todo[] public todoList;

    function create(String memory _task) public{
        //Todo memory todo = Todo(_task,false);
         Todo memory todo = todo({
             task: _task;
             completed: false;
         })
         todoList.push(todo);
    }

    function get(uint _index) public view returns (Todo memory){
        todoList[_index];
    }

    function getDetails(uint _index) public view returns (String memory task,){

    }


}
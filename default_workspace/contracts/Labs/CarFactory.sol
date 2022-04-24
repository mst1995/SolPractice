// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;
import "./Car.sol";
contract CarFactory{

    Car[] public cars;

    function createNewCars(string memory _model) public payable{
        require(msg.value >= 1 ether, "not engough money");
        Car car = new Car{value: msg.value}(_model,address(this));
        cars.push(car);
    }


}
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
contract Mytoken is ERC20{
    constructor() ERC20("mst.finance","steven"){
        
    }
     function decimals() public pure override returns (uint8) {
        return 9;
    }
 
}
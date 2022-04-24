// contracts/GameItems.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract My1155 is ERC1155 {
    uint256 public constant NARUTO = 1;
    uint256 public constant SAKULA = 2;
    uint256 public constant ZHIZHUI = 3;
    uint256 public constant GALA = 4;

    constructor() ERC1155("https://gateway.pinata.cloud/ipfs/QmYUiKkqyPRnXaCwcniCKUMWXFnDama3bdmV3qVr9xT185/{id}.json") {
        _mint(msg.sender, NARUTO, 10**1, "");
        _mint(msg.sender, SAKULA, 10**2, "");
        _mint(msg.sender, ZHIZHUI, 10**3, "");
        _mint(msg.sender, GALA, 10**4, "");
    }

    function uri(uint256 _tokenId) override public pure returns (string memory){
        return string(
            abi.encodePacked(
                "https://gateway.pinata.cloud/ipfs/QmYUiKkqyPRnXaCwcniCKUMWXFnDama3bdmV3qVr9xT185/",
                Strings.toString(_tokenId),
                ".json"
            )
        );
    }
}
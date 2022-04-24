// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyERC721 is ERC721URIStorage{

    using Counters for Counters.Counter;
    //使用计数器来定义一个_tokenIds变量，以跟踪发行的所有代币。
    Counters.Counter private _tokenIds;

    //ERC721 名称，简称
    constructor() ERC721("MyERC721","MyERC721"){
    }

    //recipient的地址变量，一个名为 hash的字符串变量，一个名为 metadata的字符串变量。
    //地址变量recipient是将收到 NFT 的人的钱包地址。
    //hash的字符串变量是与正在创建 NFT 的内容相关联的 IPFS 哈希。
    //而 tokenURI的字符串变量是指向资产的 JSON 元数据的链接
    function awardItem(string memory tokenURI) public returns (uint256){
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        return newItemId;
    }

    function burn(uint tokenId) public virtual{
        require(_isApprovedOrOwner(msg.sender,tokenId),"you are not Owner or Not Approved");
        super._burn(tokenId);
    }
}
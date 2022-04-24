// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "./IUniswapV2Router01.sol";
import "./IMgratorcheif.sol";


contract MyTokenMarket is IUniswapV2Router01{

    address public myToken;
    address public router;
    address public weth;
    address public zhiya

    constructor(address _myToken,address _router,address _weth,address _zhiyia){
        myToken = _myToken;
        router = _router;
        weth = _weth;
        zhiya = _zhiyia;
    }

    //token && eth
    function addLiquidity(uint amount)external payable{
        ERC20(myToken).transferFrom(msg.sender,address(this),amount);
        
        IUniswapV2Router01(myToken).approve(router,amount);
        ERC20(router).addLiquidityETH{value:msg.value}(
        myToken,amount,0,0,msg.sender,block.timestamp());
    }

    function buyToken(uint amount) external payable{
        address[] memory path = new address[](2);
        //weth 换成 token代币
        {path[0],path[1]} = {weth,myToken};
        ERC20(router).swapExactETHForTokens{value:msg.value}(
        amount,
        path,
        address(this),
        block.timestamp())

        uint amount = ERC20(myToken).balanceOf(address(this));

        IMgratorcheif(zhiya).deposit(1,amount);


    }

}
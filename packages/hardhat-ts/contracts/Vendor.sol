pragma solidity >=0.8.0 <0.9.0;
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";
import './YourToken.sol';

contract Vendor is Ownable {

  YourToken public yourToken;

  constructor(address tokenAddress) public {
    yourToken = YourToken(tokenAddress);
  }

  // ToDo: create a payable buyTokens() function:

  uint256 public constant tokensPerEth = 100;

  event BuyTokens(address buyer, uint256 amountOfEth, uint256 amountOfTokens);

  function buyTokens() public payable {
    yourToken.transfer(msg.sender, msg.value * tokensPerEth);
    emit BuyTokens(msg.sender, msg.value, msg.value * tokensPerEth);
  }

  // ToDo: create a withdraw() function that lets the owner withdraw ETH

  function withdraw() public onlyOwner {

    payable(msg.sender).transfer(address(this).balance);
  }

  uint256 public ethBalance = address(this).balance; 
  // ToDo: create a sellTokens() function:
}

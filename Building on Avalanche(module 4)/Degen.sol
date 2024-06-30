// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/access/Ownable.sol";

contract DEGENTOKEN is ERC20, Ownable {
   
    mapping(uint256 => uint256) public itemCosts;

    
    event RedeemedItem(address indexed player, uint256 indexed itemId);

   
    constructor() ERC20("Degen", "DGN") {
        itemCosts[1] = 150 * 10 ** decimals(); // item 1 costs 150 tokens
        itemCosts[2] = 260 * 10 ** decimals(); // item 2 costs 260 tokens
        itemCosts[3] = 440 * 10 ** decimals(); // item 3 costs 440 tokens
    }

  
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

 
    function redeem(uint256 itemId) external {
        uint256 cost = itemCosts[itemId];
        require(cost > 0, "Item does not exist");
        require(balanceOf(msg.sender) >= cost, "Insufficient token balance");

        _transfer(msg.sender, address(this), cost);
        emit RedeemedItem(msg.sender, itemId);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}

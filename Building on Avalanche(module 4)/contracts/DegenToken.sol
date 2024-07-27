// Your task is to create a ERC20 token and deploy it on the Avalanche network for Degen Gaming. The smart contract 
//should have the following functionality:

// Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. 
// Only the owner can mint tokens.
// Transferring tokens: Players should be able to transfer their tokens to others.
// Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
// Checking token balance: Players should be able to check their token balance at any time.
// Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/access/Ownable.sol";


contract DegenGamingToken is ERC20, Ownable {
    struct Item {
        uint256 id;
        string name;
        uint256 price;
    }

    uint256 private nextItemId;
    mapping(uint256 => Item) public items;
    mapping(address => mapping(uint256 => uint256)) public redeemedItems;

    event ItemAdded(uint256 id, string name, uint256 price);

    constructor() ERC20("Degen", "DGN") {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function addItem(string memory name, uint256 price) public onlyOwner {
        items[nextItemId] = Item(nextItemId, name, price);
        emit ItemAdded(nextItemId, name, price);
        nextItemId++;
    }

    function redeem(uint256 itemId) public {
        uint256 itemPrice = items[itemId].price;
        require(itemPrice > 0, "Item does not exist");
        require(balanceOf(msg.sender) >= itemPrice, "Insufficient balance to redeem item");
        _burn(msg.sender, itemPrice);
        redeemedItems[msg.sender][itemId]++;
    }

    function transferRewards(address to, uint256 itemId) public {
        uint256 redeemedItemCount = redeemedItems[msg.sender][itemId];
        require(redeemedItemCount > 0, "Insufficient redeemed items to transfer");
        redeemedItems[msg.sender][itemId]--;
        redeemedItems[to][itemId]++;
    }

   function viewRedeemedItems(address account, uint256 itemId) public view returns (string memory itemName, uint256 itemCount) {
        itemCount = redeemedItems[account][itemId];
        if (itemCount == 0) {
            itemName = "No items redeem";
        } else {
            itemName = items[itemId].name;
        }
        return (itemName, itemCount);
    }

}

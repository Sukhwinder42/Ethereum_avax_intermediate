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
    mapping(uint256 => address) public itemOwners; // Mapping to track item ownership
    mapping(address => mapping(uint256 => uint256)) public redeemedItems; // Mapping to track redeemed items

    event ItemAdded(uint256 id, string name, uint256 price);

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {}

    // Minting new tokens, only owner can mint
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Burn tokens, anyone can burn their own tokens
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Add a new item to the store
    function addItem(string memory name, uint256 price) public onlyOwner {
        items[nextItemId] = Item(nextItemId, name, price);
        emit ItemAdded(nextItemId, name, price);
        nextItemId++;
    }

    // Redeem tokens for in-game items
    function redeem(uint256 itemId) public {
        uint256 itemPrice = items[itemId].price;
        require(itemPrice > 0, "Item does not exist");
        require(balanceOf(msg.sender) >= itemPrice, "Insufficient balance to redeem item");
        _burn(msg.sender, itemPrice);
        redeemedItems[msg.sender][itemId]++;
    }

    // Transfer redeemed items
    function transferRewards(address to, uint256 itemId) public {
        uint256 redeemedItemCount = redeemedItems[msg.sender][itemId];
        require(redeemedItemCount > 0, "Insufficient redeemed items to transfer");
        redeemedItems[msg.sender][itemId]--;
        redeemedItems[to][itemId]++;
    }

    // View redeemed items
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

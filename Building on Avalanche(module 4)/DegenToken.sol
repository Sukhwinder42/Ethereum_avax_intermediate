// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenGamingToken is ERC20, Ownable {
    struct Item {
        uint256 id;
        string name;
        uint256 price;
    }

    uint256 private nextItemId;
    mapping(uint256 => Item) public items;

    event ItemAdded(uint256 id, string name, uint256 price);

    constructor() ERC20("DegenGamingToken", "DGT") {}

    // Minting new tokens, only owner can mint
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Transferring tokens, ERC20 standard function inherited from ERC20
    // Players can use transfer and transferFrom functions from ERC20

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
        Item memory item = items[itemId];
        require(item.id == itemId, "Item does not exist");
        require(balanceOf(msg.sender) >= item.price, "Insufficient balance to redeem item");

        _burn(msg.sender, item.price);
        // Logic to deliver the item to the buyer can be added here
    }

    // View an item's details
    function getItem(uint256 itemId) public view returns (Item memory) {
        return items[itemId];
    }

    // Checking token balance, ERC20 standard function inherited from ERC20
    // Players can use balanceOf function from ERC20
}

##  Creation of ERC20 token

To create ERC20 token and deploy it on Avalanche fuji network degen gaming.

## Description

This token will have the following functionalities in the contract:

1. Mint: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.
 
2. Burn : Anyone should be able to burn tokens, that they own, that are no longer needed.
   
3. TransferRewards : Person should be able to transfer their tokens to others.
 
4. Reedeming : Person should be able to redeem their tokens for items in the in-game store.
   
5. Checking balance : Person should be able to check their token balance at any time.
   

## Getting Started

## Installing

* Download metamask
  
* Add avalanche fuji network with correct chain id, rpc url and symbol.
  
* After, sign into snowtrace and connect it with metamask wallet to whichever account you want to get connected.

* To do transaction, amke sure you have the balance in it.
  
* Log into remix ide, which is a solidity platform- https://remix.ethereum.org/
  
* Import zepplin's app on the contract.
  
* Import hardhat also
  
* Create a file with name DegenToken.sol and write code under it.
  
* Use solidity version as per your choice typically ^0.8.0

### Executing program

* Compile the code as compile tab is on left side and then deploy it.
  
* When you are going to deploy set the environemnt to "Injected Provider" and connect it to metamask wallet. Your account address will be show there and then deploy it.
  
* After deploying, you will get the contract address, copy it and paste it on snowtrace search bar to get the results about your successful connection.
  
* Now mint the token, burn the token, reedem it, check tha balnce and transfer it to another address as you do.
  
```
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




```
## Authors

Contributors names and contact info

Name: Sukhwinder Singh
email: itsmaan127@gmail.com


## License

MIT License

Copyright (c) 2024 Sukhwinder Singh

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), 
to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, 
and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

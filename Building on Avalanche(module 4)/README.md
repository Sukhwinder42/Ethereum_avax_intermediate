##  Degen Coin

This Solidity program is a "Degan Token" program that demonstrates the basic syntax and functionality of the Solidity programming language. The purpose of this program is to create a ERC20 token and use it as per the needs.

## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract has fivr function such as "mintTo", "burnFrom", "redeem", "transferTo" and "getOwneditems" which allows owner to mint tokens, users to burn tokens, redeem token, transfer the tokens and get their owned/redeemed items.
   

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

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile DegenToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "DegenToken" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the mintTo function. Click on the "DegenToken" contract in the left-hand sidebar, and then click on the "mintTo" function. Finally, click on the "transact" button to execute the function.
  
```
// SPDX-License-Identifier: MIT
pragma solidity >0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DegenToken is ERC20 {
    address private owner;
    string[3] private items = ["Bullet","Cycle","Toy"];
    uint256[3] private prices = [200, 100, 50];

    mapping(address => string[]) private owneditems;
    constructor() ERC20("Degen", "DGN"){
        owner = msg.sender;
    }

    modifier onlyOwner{
        require(owner==msg.sender,"Only contract owner has the access");
        _;
    }

    function mintTo(address _to,uint256 _val) public onlyOwner{
        _mint(_to,_val);
    }

    function burnFrom(uint256 _val) public {
        _burn(msg.sender, _val);
    }

    function redeem(uint256 _item) public {

        require(_item-1 < items.length && _item-1 >= 0, "Item does not exist");
        uint256 price = prices[_item-1];
        _burn(msg.sender, price);
         owneditems[msg.sender].push(items[_item - 1]);
    }

    function transferTo(address _to, uint256 _val) public  {
        _transfer(msg.sender, _to, _val);
    }

    function getowneditems(address _owner) public view returns (string[] memory) {
        return owneditems[_owner];
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

// Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. 
// Only the owner can mint tokens.
// Transferring tokens: Players should be able to transfer their tokens to others.
// Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
// Checking token balance: Players should be able to check their token balance at any time.
// Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.



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

// You will write a smart contract to create your own ERC20 token and deploy it using HardHat or Remix. 
// From your chosen tool, the contract owner should be able to mint tokens to a provided address 
//and any user should be able to burn and transfer tokens.


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/access/Ownable.sol";


contract DonationToken is ERC20, Ownable {
    struct Cause {
        string name;
        uint256 donationAmount;
    }

    mapping(uint256 => Cause) public causes;
    uint256 public causeCount;

    constructor() ERC20("DonationToken", "DNT") {
        _mint(msg.sender, 90 * 10**decimals());     // Mint initial supply to the deployer
    }

    // Mint function can be called by the owner only
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Function to add a new cause (only owner)
    function addCause(string memory name) public onlyOwner {
        causes[causeCount] = Cause(name, 0);
        causeCount++;
    }

    function donate(uint256 causeId, uint256 amount) public {
        require(causeId < causeCount, "Cause does not exist");
        _transfer(msg.sender, address(this), amount);
        causes[causeId].donationAmount += amount;
    }

    function getDonationAmount(uint256 causeId) public view returns (uint256) {
        require(causeId < causeCount, "Cause does not exist");
        return causes[causeId].donationAmount;
    }

}

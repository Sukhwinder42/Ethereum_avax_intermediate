// Write a smart contract that implements the require(), assert() and revert() statements.
// SPDX-License-Identifier:MIT
pragma solidity >=0.8.7;

contract Smart {
    address public owner;
    uint256 public num;

    constructor() {
        owner = msg.sender; 
    }

    function setValue(uint256 _num) public {
        require(_num > 0, "Value must be positive");
        num = _num;
    }

    // Function that demonstrates the use of assert
    function MultiplyValue() public {
        num = num * 2;
        assert(num > 0);
    }

    function resetValue() public {
        // Check that the caller is the owner of the contract
        if (msg.sender != owner) {
            revert("Caller is not the owner");
        }
        num = 0;
    }
}


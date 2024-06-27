// SPDX-License-Identifier:MIT
pragma solidity >=0.8.7;

contract ViewAndPureFunctions {
    uint256 public storedNumber;

    constructor() {
        storedNumber = 20;
    }

    function getStoredNumber() public view returns (uint256) {
        return storedNumber;
    }

    function multiplyNumbers(uint256 num1, uint256 num2) public pure returns (uint256) {
        return num1 * num2;
    }
}

// SPDX-License-Identifier:MIT
pragma solidity >=0.8.7;

contract Smart {
    string[] private userNames;

    event UserAdded(string userName);

    function addUser(string memory userName) public {
        userNames.push(userName);
        emit UserAdded(userName);
    }

    function getUser(uint256 index) public view returns (string memory) {
        require(index < userNames.length, "Index out of bounds");
        return userNames[index];
    }

    function getAllUsers() public view returns (string[] memory) {
        return userNames;
    }
}

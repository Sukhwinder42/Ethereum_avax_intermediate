// SPDX-License-Identifier:MIT
pragma solidity >=0.8.7;

contract Proxy {
    address public owner;
    address public admin;

    constructor(address _owner) {
        owner = _owner;
        admin = msg.sender;
    }

    modifier AdminOnly {
        require(msg.sender == admin, "Only admin can call.");
        _;
    }

    function upgrade(address _newowner) external AdminOnly {
        owner = _newowner;
    }

    fallback() external payable {
        require(owner != address(0), "Execution address is zero");
        (bool success, ) = owner.delegatecall(msg.data); 
        require(success, "Delegatecall failed");
    }

    receive() external payable {
        revert("Receive function is not payable right now.");
    }
}

contract BankExample {
    struct User {
        string name;
        uint256 id;
    }

    mapping(address => User) public users;

    function setUserDetails(string memory name, uint256 id) external {
        users[msg.sender] = User(name, id);
    }

    function getUserDetails(address useraddress) external view returns (string memory, uint) {
        return (users[useraddress].name, users[useraddress].id);
    }
}

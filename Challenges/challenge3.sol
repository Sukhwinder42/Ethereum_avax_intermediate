// SPDX-License-Identifier:MIT
pragma solidity >=0.8.7;

contract Events {
    address public owner;
    mapping(address => string) public registeredUsers;
    uint256 public nextItemId;

    event UserRegistered(address indexed user, string name);
    event ItemAdded(uint256 indexed itemId, string itemName, uint256 quantity);
    event PaymentReceived(address indexed payer, uint256 amount);
    event Withdrawal(address indexed recipient, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function registerUser(string memory userName) external {
        registeredUsers[msg.sender] = userName;
        emit UserRegistered(msg.sender, userName);
    }

    function addItem(string memory itemName, uint256 quantity) external onlyOwner {
        emit ItemAdded(nextItemId, itemName, quantity);
        nextItemId++;
    }

    function receivePayment() external payable {
        emit PaymentReceived(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) external onlyOwner {
        payable(owner).transfer(amount);
        emit Withdrawal(owner, amount);
    }
}

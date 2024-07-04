//write a smart contract that implements the require(), assert() and revert() statements.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SubscriptionService {
    address public owner;
    uint256 public subscriptionFee;
    mapping(address => bool) public subscribers;
    uint256 public totalSubscribers;

    event Subscribed(address indexed user);
    event Unsubscribed(address indexed user);
    event Withdrawal(uint256 amount);

    constructor(uint256 _subscriptionFee) {
        owner = msg.sender;
        subscriptionFee = _subscriptionFee;
        totalSubscribers = 0;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function subscribe() public payable {
        require(msg.value == subscriptionFee, "Incorrect subscription fee");
        require(!subscribers[msg.sender], "Already subscribed");

        subscribers[msg.sender] = true;
        totalSubscribers += 1;
        emit Subscribed(msg.sender);
    }

    function unsubscribe() public {
        require(subscribers[msg.sender], "Not subscribed");

        subscribers[msg.sender] = false;
        totalSubscribers -= 1;
        emit Unsubscribed(msg.sender);
    }

    function checkSubscription(address _user) public view returns (bool) {
        return subscribers[_user];
    }

    function withdrawFees() public onlyOwner {
        uint256 amount = address(this).balance;
        if (amount == 0) {
            revert("No funds to withdraw");  //uasge of revert statement
        }

        // Use assert to ensure the transfer was successful
        (bool success, ) = owner.call{value: amount}("");
        assert(success);
        
        emit Withdrawal(amount);
    }

    function changeSubscriptionFee(uint256 _newFee) public onlyOwner {
        require(_newFee > 0, "Subscription fee must be greater than 0");
        subscriptionFee = _newFee;
    }
}


# Subscription Service Project

There is a contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain.The SubscriptionService smart contract is designed to manage a subscription-based service using Solidity on the Ethereum blockchain. The contract employs the require(), assert(), and revert() statements to ensure security and proper functioning.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the following code into the file:

```javascript

*/
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


```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.26" (or another compatible version), and then click on the "Compile Subscription.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. After that go to the bottom at deployed contracts  and cilck on side arrow with Smart contract. After deploying the SubscriptionService smart contract, the contract owner can set or update the subscription fee, and withdraw susbscription fees. Users can subscribe to the service by paying the specified fee, ensuring they are not already subscribed, and unsubscribe when needed. The subscription status of any address can be checked.

There are three methods that constitute the error-handling process in Solidity:

(1) require : It is used to validate conditions before proceeding with function execution. It ensures correct subscription fee is paid, user is not already subscribed, user is currently subscribed when unsubscribing, new subscription fee is valid, and only the owner can execute certain functions.

(2) assert : The assert function, like require, is a convenience function that checks for conditions. If a condition fails, then the function execution is terminated with an error message.

(3) revert : Used to halt execution and revert any state changes if an error condition is encountered.
Stops the transaction when there are no funds to withdraw, preventing further execution.


## Authors

Sukhwinder Singh  
itsmaan127@gmail.com


## License

This project is licensed under the MIT License - see the LICENSE.md file for details

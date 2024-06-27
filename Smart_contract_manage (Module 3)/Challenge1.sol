// SPDX-License-Identifier:MIT
pragma solidity >=0.8.7;

contract EtherReceiver {
    
    event Deposit(address user, uint amount);

   
    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    fallback() external payable {
        emit Deposit(msg.sender, msg.value);
    }

   
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

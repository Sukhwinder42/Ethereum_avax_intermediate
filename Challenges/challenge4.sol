// SPDX-License-Identifier:MIT
pragma solidity >=0.8.7;

contract globalFunctions{
    function getBalance() public view returns(uint256){
        return address(this).balance;
    }

    function transferEther(address payable receiver, uint256 value) public{
        receiver.transfer(value);
    }

    function sendEther(address payable receiver, uint256 value) public returns(bool){
        return receiver.send(value);
    }

    function receiveEther() external payable {
    }
    
    function getSender() public view returns (address) {
        return msg.sender;
    }
    
    function getGasLeft() public view returns (uint256) {
        return gasleft();
    }
    
    function getCurrentTimestamp() public view returns (uint256) {
        return block.timestamp;
    }
}

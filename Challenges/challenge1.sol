// SPDX-License-Identifier:MIT
pragma solidity >=0.8.7;
contract Smart{
    
    uint a;
    uint b;
    address useraddress;

    constructor(){
        useraddress = msg.sender;
    }

    modifier student { 
        require (useraddress == msg.sender, "only student can access");
        _;
    }

    function set (uint _a, uint _b) public {
        a = _a;
        b = _b;
    }

    function get() public view student returns(uint){
       return a*b;
    }
}


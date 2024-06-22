// SPDX-License-Identifier:MIT
pragma solidity >=0.8.7;

contract Challenge_2{
    uint256 public number;
    
    constructor(uint256 value){
        number=value;
    }

    function VIEW() public view virtual returns(uint256){
        return number;
    }
    function PURE(uint a,uint b) public pure virtual returns(uint256){
        return a+b;
    }
    function PAYABLE() public payable virtual {
        number+=msg.value;
    }
}

contract Derived_contract is Challenge_2{
    constructor(uint256 val) Challenge_2(val){}

    function VIEW() public view override returns(uint256){
        return number*2;
    }
    function PURE(uint a,uint b) public pure override returns(uint256){
        return a+b+10;
    }
    function PAYABLE() public payable override {
        number+=msg.value*10;
    }
}

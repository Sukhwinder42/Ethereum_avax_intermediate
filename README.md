
# Usage of Require assert and revert 

We will create a contract which will store some of the variable's data and mapping the owner to msg.sender with a respective address. This simple contract demonstrates how to use require(), assert(), and revert() to handle various conditions and ensure the correctness and security of your smart contract.

## Description

There is a contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. We will create a contract to fulfill the following requirements: write a smart contract that implements the require(), assert() and revert() statements. 

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the following code into the file:

```javascript
*/
// SPDX-License-Identifier:MIT
pragma solidity >=0.8.7;

contract Smart {
    address public owner;
    uint256 public num;

    constructor() {
        owner = msg.sender; 
    }

    function setValue(uint256 _num) public {
        require(_num > 0, "Value must be positive");
        num = _num;
    }

    // Function that demonstrates the use of assert
    function MultiplyValue() public {
        num = num * 2;
        assert(num > 0);
    }

    function resetValue() public {
        // Check that the caller is the owner of the contract
        if (msg.sender != owner) {
            revert("Caller is not the owner");
        }
        num = 0;
    }
}





```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile HelloWorld.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. After that go to the bottom at deployed contracts  and cilck on side arrow with Smart contract. Here, we have to set the value of num by using require statement and get that num. Also to check assert statement we used multiply function 
Then after that revert the statement by reset value function.

Setvalue will set the num.
Multiplyvalue will update the num.
Resetvalue will revert the statement if condition fails.

## Authors

Sukhwinder Singh  
itsmaan127@gmail.com


## License

This project is licensed under the MIT License - see the LICENSE.md file for details

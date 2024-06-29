## ERC20 TOKEN
ERC20 is a standard for fungible token, it has the property which makes each token same as another one. I have leanrt the concept of Solidity and more about the ERC20 and made the token.

## Description
This program is written in a Solidity which is OOP language used for developing smart contract on different platforms like ethereum. This creates ERC20 token and make some possible transactions. We can also transfer the tokens to another address.
For more information, visit: https://docs.openzeppelin.com/contracts/4.x/erc20

ERC20 has following functions :
1. TotalSupply: total number of token will be issued

2. Balanceof : The account balance of a token owner's account

3. Transferfrom: Automatically executes transfers of a specified number of tokens from a specified address using the token

4. Transfer: Automatically executes transfers of a specified number of tokens to a specified address for transactions using the token

5. Approve: Allows a spender to withdraw a set number of tokens from a specified account, up to a specific amount

6. Transfer: An event triggered when a transfer is successful

7. Allowance: Returns a set number of tokens from a spender to the owner

8. Approval: approved event

9. name : retruns the name of the token

10. symbol : returns the symbol of the token

11. decimal : returns the decimal conversion of the factor

12. mint : takes a receiving address and amount of type uint to be minted as an argument.

13. burn : takes an amount of tyoe uint tobe burned as an argument and any user can destroy the token even if we can also burn our token

## Getting Started

To run this program, you can use Remix IDE, which is an online Solidity where I have developed the ERC20 contract. 
Visit:  https://remix.ethereum.org/  ALways save the file with extension .sol and make a repository and post the code on github.
In order to compile the code, use Solidity copiler on left-handside. Make sure that you use version ^0.8.7 and the compile the assessemnt with the name you have saved.
After compilation, you can deploy the contract whcih is present on left-hand-side just after the compiler symbol. See that environment is set correctly to avoid any error.

## After Deploying
You will see foloowing things under Deployed contracts:

1. approve: takes the address of spender as well as amount of type uint whcih will serve as allowance of spender deducted from owner's balance as an argument.

2. burn: takes an amount of type uint to be burned as an argument and burns that amount of token from caller's balance.

3.  mint: takes a receiving address and amount of type uint to be minted as an argument.

4. transfer: takes a to-address and an amount of the type uint as an argument and transfers that amount of tokens to the to-addressee's balance.

5. transferfrom: takes from-address, to-address, and an amount of type uint that will be transfered to the to-address as arguments. This can only work if the person who owns the from-address or a spender 
that was give an allowance to spend in their stead calls this function.

6. allowance: Returns a set number of tokens from a spender to the owner

7. balanceof:  The account balance of a token owner's account

8. name: return the name of token

9. symbol: return the symbol of token

10. decimal: convert it into decimal, typicall 10^18.

## Author
Name: Sukhwinder Singh
Contact: itsmaan127@gmail.com

## License

MIT License

Copyright (c) 2024 Sukhwinder Singh

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

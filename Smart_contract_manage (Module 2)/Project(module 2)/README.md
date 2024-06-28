Starter Next/Hardhat Project
After cloning the github, you will want to do the following to get the code running on your computer.

Inside the project directory, in the terminal type: npm i
Open two additional terminals in your VS code
In the second terminal type: npx hardhat node
In the third terminal, type: npx hardhat run --network localhost scripts/deploy.js
Back in the first terminal, type npm run dev to launch the front-end.
After this, the project will be running on your localhost. Typically at http://localhost:3000/


## preview of a project can be done in Wiki pages(I have attached all the photos)
# Final ETH-AVAX-PROOF-Intermediate-Module-2
![](https://i.imgur.com/veF6Uvs.png)


[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://metacrafterc-scmstarter-zctwio2uvoo.ws-us114.gitpod.io/)

Click on the Gitpod Button 

Make sure you already have hardhat and node installed!

Open Three terminals 

In Second terminal copy the below command!
```solidity
npx hardhat node
```

In Third terminal copy the below command!
```solidity
npx hardhat run scripts/deploy.js --network localhost
```

After running the above command you will see  -- > Assessment contract deployed to: 0x....45

copy the address and paste in the file index.js in  the contractAddress variable



![image](https://github.com/toshiksharma271/ETH-AVAX-PROOF-Intermediate-Module-2/assets/98310467/50bff407-13f3-4441-9966-cffbc842711d)



Now in first terminal run this command given below

```solidity
npm run dev
```

Now the project will run on the port : 3000 , make that public 

![](https://i.imgur.com/uDgzotm.png)
![](https://i.imgur.com/EvjY5Pp.png)









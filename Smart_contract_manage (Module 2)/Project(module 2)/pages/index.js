import { useState, useEffect } from "react";
import { ethers } from "ethers";
import atm_abi from "../artifacts/contracts/Assessment.sol/Assessment.json";

export default function HomePage() {
  const [ethWallet, setEthWallet] = useState(undefined);
  const [account, setAccount] = useState(undefined);
  const [atm, setATM] = useState(undefined);
  const [balance, setBalance] = useState(undefined);
  const [owner, setOwner] = useState(undefined);

  const contractAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3"; // Replace with your deployed contract address
  const atmABI = atm_abi.abi;

  const getWallet = async () => {
    if (window.ethereum) {
      setEthWallet(window.ethereum);
    }

    if (ethWallet) {
      const account = await ethWallet.request({ method: "eth_accounts" });
      handleAccount(account);
    }
  };

  const handleAccount = (account) => {
    if (account.length > 0) {
      console.log("Account connected: ", account);
      setAccount(account[0]);
    } else {
      console.log("No account found");
    }
  };

  const connectAccount = async () => {
    if (!ethWallet) {
      alert("MetaMask wallet is required to connect");
      return;
    }

    const accounts = await ethWallet.request({ method: "eth_requestAccounts" });
    handleAccount(accounts);

    getATMContract();
  };

  const getATMContract = () => {
    const provider = new ethers.providers.Web3Provider(ethWallet);
    const signer = provider.getSigner();
    const atmContract = new ethers.Contract(contractAddress, atmABI, signer);

    setATM(atmContract);
  };

  const getBalance = async () => {
    if (atm) {
      setBalance((await atm.getBalance()).toNumber());
    }
  };

  const deposit = async () => {
    if (atm) {
      let tx = await atm.deposit(1);
      await tx.wait();
      getBalance();
    }
  };

  const withdraw = async () => {
    if (atm) {
      let tx = await atm.withdraw(1);
      await tx.wait();
      getBalance();
    }
  };

  const getContractOwner = async () => {
    if (atm) {
      const ownerAddress = await atm.owner();
      setOwner(ownerAddress);
    }
  };

  const transferOwnership = async (newOwner) => {
    if (atm) {
      try {
        let tx = await atm.transferOwnership(newOwner);
        await tx.wait();
        alert("Ownership transferred.");
      } catch (error) {
        console.error("Failed to transfer ownership:", error);
        alert("An error occurred while transferring ownership.");
      }
    }
  };

  const setNewBalance = async (newBalance) => {
    if (atm) {
      try {
        let tx = await atm.setBalance(newBalance);
        await tx.wait();
        getBalance();
        alert("Balance set to " + newBalance);
      } catch (error) {
        console.error("Failed to set balance:", error);
        alert("An error occurred while setting the balance.");
      }
    }
  };

  const resetBalance = async () => {
    if (atm) {
      try {
        let tx = await atm.resetBalance();
        await tx.wait();
        getBalance();
        alert("Balance reset to zero.");
      } catch (error) {
        console.error("Failed to reset balance:", error);
        alert("An error occurred while resetting the balance.");
      }
    }
  };

  const initUser = () => {
    if (!ethWallet) {
      return <p>Please install Metamask in order to use this ATM.</p>;
    }

    if (!account) {
      return <button onClick={connectAccount}>Please connect your Metamask wallet</button>;
    }

    if (balance === undefined) {
      getBalance();
    }

    return (
      <div>
        <p>My Account: {account}</p>
        <p>My Balance: {balance}</p>
        <button onClick={deposit}>Deposit 1 ETH</button>
        <button onClick={withdraw}>Withdraw 1 ETH</button>
        <button onClick={() => transferOwnership(prompt("Enter new owner address:"))}>Transfer Ownership</button>
        <button onClick={getContractOwner}>Get Contract Owner</button>
        <button onClick={() => setNewBalance(prompt("Enter new balance:"))}>Set New Balance</button>
        <button onClick={resetBalance}>Reset Balance</button>
        {owner && <p>Contract Owner: {owner}</p>}
      </div>
    );
  };

  useEffect(() => {
    getWallet();
  }, []);

  return (
    <main className="container">
      <header><h1>Welcome to Smart Contract Project</h1></header>
      {initUser()}
      <style jsx>{`
        .container {
          text-align: center;
          background: linear-gradient(to right,rgba(0,0,0,0), rgba(0,0,0,0)), 
                      url(https://th.bing.com/th/id/OIP.QY8Qrvi6b-M_uJSEURu3iAHaEK?w=312&h=200&c=7&o=5&dpr=1.3&pid=1.7);
          background-size: cover;
          background-repeat: no-repeat;
          color: black;
          min-height: 100vh;
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
         font-family: cursive;
      }
         header h1 {
         color: Black;
         }
        header {
          margin-bottom: 20px;
        }
        button {
          background-color: #282c34;
          color: white;
          border: none;
          padding: 10px 20px;
          margin: 5px;
          cursor: pointer;
          border-radius: 5px;
          transition: background-color 0.3s;
        }
        button:hover {
          background-color: #3c4048;
        }
          
      `}</style>
    </main>
  );
}

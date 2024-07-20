const hre = require("hardhat");

async function main() {
  // Get the DegenGamingToken smart contract
  const DegenGamingToken = await hre.ethers.getContractFactory("DegenGamingToken");

  // Deploy it
  const degenGamingToken = await DegenGamingToken.deploy();
  await degenGamingToken.deployed();

  // Display the contract address
  console.log(`DegenGamingToken deployed to ${degenGamingToken.address}`);
}

// Hardhat recommends this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

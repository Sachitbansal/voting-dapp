// scripts/deploy.js

const { ethers } = require("hardhat");

async function main() {
  const Voting = await ethers.getContractFactory("Voting");
  const voting = await Voting.deploy(["Option A", "Option B"]);
  await voting.waitForDeployment();

  console.log("Voting deployed to:", await voting.getAddress());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

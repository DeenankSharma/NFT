require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config({ path: ".env" });

const QUICKNODE_HTTP_URL = process.env.RPC_URL;
const PRIVATE_KEY = process.env.PRIVATE_KEY;
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY;

module.exports = {
  solidity: "0.8.20",
  networks: {
    sepolia: {
      url: "https://falling-necessary-wildflower.ethereum-sepolia.quiknode.pro/ab7ed868d29e8912c122309a3a0ee50cf23a8c89/",
      accounts: ["d2374e8ef6333a8b9fae26796948dc486e1284f44e416c42ae5b1fdfeafbe215"],
    },
  },
  etherscan: {
    apiKey: ETHERSCAN_API_KEY,
  },
};
require("@nomiclabs/hardhat-waffle");

const INFURA_PROJECT_ID = "a3b0de1a08e74aed9f615c8afd541daf";
const KOVAN_PRIVATE_KEY = "ac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80";

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: {
    compilers: [
      {
        version: "0.6.2"
      },
      {
        version: "0.5.2"
      }
    ]
  },
  networks: {
    kovan: {
      url: `https://kovan.infura.io/v3/${INFURA_PROJECT_ID}`,
      accounts: [`0x${KOVAN_PRIVATE_KEY}`]
    },
    xdai: {
      url: 'https://rpc.xdaichain.com/',
      accounts: [`0x${KOVAN_PRIVATE_KEY}`]
    }
  }
};


//Account #0: 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266 (10000 ETH)
//Private Key: 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80

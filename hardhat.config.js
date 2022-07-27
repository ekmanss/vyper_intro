require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require("@nomiclabs/hardhat-truffle5");
// require("hardhat-gas-reporter");
require('solidity-coverage');

require('dotenv').config({
    // path: '.env-kccTestnet', // test
    path: '.env-kccMainnetMock', // uat
    // path: '.env-kccMainnet', // prod
});

const private_info  = require("./key.json")

// const keys = require('./dev-keys.json');

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
    defaultNetwork: "hardhat",
    networks: {
        hardhat: {
            allowUnlimitedContractSize: false,
            // forking: {
            //     //url: "https://mainnet.infura.io/v3/" + keys.infuraKey,
            //     url: "https://eth-mainnet.alchemyapi.io/v2/" + keys.alchemyKey,
            //     blockNumber: 11807770, // <-- edit here
            // }

        },
        bsctest: {
            url: 'https://data-seed-prebsc-1-s1.binance.org:8545',
            chainId: 97,
            // gasPrice: 20000000000,
            accounts: [private_info.private_key],
        },
        ftm: {
            url: 'https://rpc.ftm.tools',
            chainId: 250,
            accounts: [private_info.private_key],
        },
        mumbai: {
            url: 'https://rpc.ankr.com/polygon_mumbai',
            chainId: 80001,
            gasLimit: 6_000_000,
            accounts: [private_info.private_key],
        },
        aurora: {
            url: 'https://testnet.aurora.dev/',
            chainId: 1313161555,
            accounts: [private_info.private_key],
            // gasLimit: 100,
        },
        kovan: {
            url: 'https://kovan.optimism.io/',
            chainId: 69,
            gas: 2100000,
            // gasPrice: 80000000,
            accounts: [private_info.private_key]
            // allowUnlimitedContractSize: true,
        }

    },
    paths: {
        artifacts: './artifacts',
        cache: './cache',
        sources: './contracts',
        tests: './test',
    },
    solidity: {
        version: "0.8.10",
        settings: {
            optimizer: {
                enabled: true,
                runs: 200,
            },
            metadata: {
                // do not include the metadata hash, since this is machine dependent
                // and we want all generated code to be deterministic
                // https://docs.soliditylang.org/en/v0.7.6/metadata.html
                bytecodeHash: 'none',
            },
        },
        compilers: [
            {
                version: "0.6.6",
                settings: {
                    optimizer: {
                        enabled: true,
                        runs: 200
                    }
                }
            },
            {
                version: "0.5.16",
                settings: {
                    optimizer: {
                        enabled: true,
                        runs: 200
                    }
                }
            },
            {
                version: "0.4.26",
                settings: {
                    optimizer: {
                        enabled: true,
                        runs: 200
                    }
                }
            },
            {
                version: "0.7.5",
                settings: {
                    optimizer: {
                        enabled: true,
                        runs: 200
                    }
                }
            },
            {
                version: "0.8.6",
                settings: {
                    optimizer: {
                        enabled: true,
                        runs: 200
                    }
                }
            }
        ],
    },
    mocha: {
        timeout: 2000000
    },
    // gasReporter: {
    //     enabled: (process.env.REPORT_GAS) ? true : false,
    //     currency: 'USD'
    // }
};
const actionJson = require("../build/contracts/test.json")
const {deployContract} = require("ethereum-waffle");
const {ethers} = require("hardhat");

async function main() {
    const accounts = await ethers.getSigners()
    let deployer = accounts[0]
    console.log('deployer:' + deployer.address)

    // const action = await deployContract(deployer, {
    //     bytecode: actionJson.bytecode,
    //     abi: actionJson.abi
    // }, [deployer.address, 1, 1])
    //
    const accountsFac = await ethers.getContractFactory(actionJson.abi, actionJson.bytecode);
    const action = await accountsFac.deploy();

    console.log("action::", action.address)

}

main()
    .then(() => process.exit())
    .catch(error => {
        console.error(error);
        process.exit();
    })
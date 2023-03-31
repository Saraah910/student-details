const { network } = require("hardhat");
const { EntranceFees, developmentChains } = require("../helper-hardhat-config");
const { verify } = require("../utils/verify");

module.exports = async function({getNamedAccounts, deployments}){
    const {deploy, log} = deployments;
    const {deployer} = await getNamedAccounts();

    args = [EntranceFees]

    const details = await deploy("data",{
        from: deployer,
        log: true,
        args: args,
        waitConfirmations: network.config.blockConfirmations || 1

    })

    log("-------------------------------------------------")
    log(`Contract deployed at ${details.address}`)

    if(!developmentChains.includes(network.name) || process.env.ETHERSCAN_API_KEY){
        await verify(details.address, args);
    }
    log("Contract verified sucessfully.")

}

module.exports.tags = ["all","details"]
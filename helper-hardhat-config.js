const networkConfig = {
    "5":{
        name: "goerli",
        
    },
    "31337":{
        name: "hardhat",

    },
    "11155111":{
        name: "sepolia"
    }
}
const developmentChains = ["hardhat","goerli"]
const EntranceFees = "10000000000000000000"
module.exports = {networkConfig, EntranceFees, developmentChains}

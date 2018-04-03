var WanDEXv1 = artifacts.require("./WanDEXv1.sol");

module.exports = function(deployer) {
    deployer.deploy(WanDEXv1).then(()=> {
    });
};
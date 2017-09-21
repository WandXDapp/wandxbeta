var GolemCoin = artifacts.require("./GolemNetworkToken.sol");

module.exports = function(deployer) {
    deployer.deploy(GolemCoin);
};
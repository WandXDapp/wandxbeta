var StandardToken = artifacts.require("./StandardToken.sol");
var HumanStandardToken = artifacts.require("./HumanStandardToken.sol");

module.exports = function(deployer) {
    deployer.deploy(StandardToken);
    deployer.deploy(HumanStandardToken);
};
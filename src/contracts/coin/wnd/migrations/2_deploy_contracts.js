var Token = artifacts.require("./Token.sol");
var StandardToken = artifacts.require("./StandardToken.sol");
var UnlimitedAllowanceToken = artifacts.require("./UnlimitedAllowanceToken.sol");
var WandXToken = artifacts.require("./WandXToken.sol");

module.exports = function(deployer) {
    deployer.deploy(Token);
    deployer.deploy(StandardToken);
    deployer.deploy(UnlimitedAllowanceToken);
    deployer.deploy(WandXToken);
};
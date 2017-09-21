var Token = artifacts.require("./Token.sol");
var StandardToken = artifacts.require("./StandardToken.sol");
var UnlimitedAllowanceToken = artifacts.require("./UnlimitedAllowanceToken.sol");
var ZRXCoin = artifacts.require("./ZRXToken.sol");

module.exports = function(deployer) {
    deployer.deploy(Token);
    deployer.deploy(StandardToken);
    deployer.deploy(UnlimitedAllowanceToken);
    deployer.deploy(ZRXCoin);
};
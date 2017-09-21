var Token = artifacts.require("./Token.sol");
var StandardToken = artifacts.require("./StandardToken.sol");
var GnosisToken = artifacts.require("./GnosisToken.sol");

module.exports = function(deployer) {
    deployer.deploy(Token);
    deployer.deploy(StandardToken);
    deployer.deploy(GnosisToken);
};
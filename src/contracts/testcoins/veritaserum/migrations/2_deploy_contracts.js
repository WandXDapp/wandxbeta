var Ownable = artifacts.require("./Ownable.sol");
var SafeMath = artifacts.require("./SafeMath.sol");
var StandardToken = artifacts.require("./StandardToken.sol");
var VeritaseumToken = artifacts.require("./VeritaseumToken.sol");

module.exports = function(deployer) {
    deployer.deploy(Ownable);
    deployer.deploy(SafeMath);
    deployer.deploy(StandardToken);
    deployer.deploy(VeritaseumToken);
};
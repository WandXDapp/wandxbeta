var ERC20 = artifacts.require("./ERC20.sol");
var SafeMathLib = artifacts.require("./SafeMathLib.sol");
var SafeMath = artifacts.require("./SafeMath.sol");
var Ownable = artifacts.require("./Ownable.sol");
var UpgradeAgent = artifacts.require("./UpgradeAgent.sol");
var StandardToken = artifacts.require("./StandardToken.sol");
var MintableToken = artifacts.require("./MintableToken.sol");
var ReleasableToken = artifacts.require("./ReleasableToken.sol");
var UpgradeableToken = artifacts.require("./UpgradeableToken.sol");

module.exports = function(deployer) {
    //deployer.deploy(ERC20);
    deployer.deploy(SafeMathLib);
    deployer.deploy(SafeMath);
    deployer.deploy(Ownable);
    //deployer.deploy(UpgradeAgent);
    deployer.deploy(StandardToken);
    deployer.link(SafeMathLib, MintableToken);
    deployer.deploy(MintableToken);
    //deployer.deploy(ReleasableToken);
    deployer.deploy(UpgradeableToken);
};
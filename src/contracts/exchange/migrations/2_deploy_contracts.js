var Token = artifacts.require("./base/Token.sol");
var Ownable = artifacts.require("./base/Ownable.sol");
var SafeMath = artifacts.require("./base/SafeMath.sol");
//var Surrogate = artifacts.require("./Surrogate.sol");
var WanDEXv1 = artifacts.require("./WanDEXv1.sol");
//var TokenRegistry = artifacts.require("./TokenRegistry.sol");

module.exports = function(deployer) {
    deployer.deploy(Token);
    deployer.deploy(Ownable);
    deployer.deploy(SafeMath);
    //deployer.deploy(Surrogate);
    deployer.deploy(WanDEXv1);
    //deployer.deploy(TokenRegistry);
};
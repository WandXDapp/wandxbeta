var UnlimitedAllowanceToken = artifacts.require("./UnlimitedAllowanceToken.sol");
var WandXToken = artifacts.require("./WandXToken.sol");

module.exports = function(deployer) {
    deployer.deploy(UnlimitedAllowanceToken).then(()=>{
        return deployer.deploy(WandXToken).then(()=>{
        });
    });
    
};
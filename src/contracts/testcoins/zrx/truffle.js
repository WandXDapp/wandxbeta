var HDWalletProvider = require("truffle-hdwallet-provider");

var infura_apikey = "infura_access_token";
var mnemonic = "metamask_12word_passcode";

module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*" // Match any network id
    },
    ropsten: {
      provider: new HDWalletProvider(mnemonic, "https://ropsten.infura.io/"+infura_apikey),
      network_id: 3
    }
  }
};

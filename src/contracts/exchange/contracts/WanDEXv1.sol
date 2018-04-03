/*  
    Base Code is from ZeroEx
    Copyright 2017 ZeroEx Inc. 
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at 
        http://www.apache.org/licenses/LICENSE-2.0 

    @author Dinesh
    DECENTRALIZED MULTI COIN DERIVATIVE CONTRACTS
*/
pragma solidity ^0.4.15;
 
import "./base/Token.sol";

/// @title WanDex - An exchange facilitates creating derivaives of ERC20 tokens
/// @author Dinesh
contract WanDEXv1 { 
    
    address public owner;
    struct AssetOrder {
        address  seller;
        address buyer;
        address[] sellerToken;
        address[] buyerToken;
        address feeReceipient;
        uint[] sellerTokenAmount;
        uint[] buyerTokenAmount;
        uint sellerFee;
        uint buyerFee;
        uint expirationTimestampInSec;
        bytes32 orderHash; 
    }
 
    event LogFill(
                address indexed seller, 
                address indexed buyer, 
                address feeReceipient,
                address[] sellerTokens, 
                address[] buyerToken, 
                uint256[] sellerTokenAmount, 
                uint256[] buyerTokenAmount,
                uint256 paidsellerFee, 
                uint256 paidbuyerFee, 
                bytes32 indexed tokens, 
                bytes32 orderHash
                );
      
    /* Constructor*/
    function WanDEXv1() {
        owner = msg.sender;
    }  
    
    function transfer(address token, address from, address to, uint value) public {
       assert(Token(token).transferFrom(from, to,value));
    }  
    
    
    /* Core Exchange functions */
    function fillAssetOrder(
                        address[] _sellerTokens, 
                        uint256[] _sellervalues, 
                        address[] _buyerTokens, 
                        uint256[] _buyerValues, 
                        address[3] _orderAddresses, 
                        uint256[4] _orderValues
    ) public
    returns (uint) 
    { 
      bool isDone = true;   
      AssetOrder memory order = createOrderObject(_sellerTokens, _sellervalues, _buyerTokens, _buyerValues, _orderAddresses, _orderValues);
      // Move Maker tokens first
      for (uint i = 0; i < _sellerTokens.length; i++) {
        if (!isDone) {
                return 0;
            }
            isDone = Token(order.sellerToken[i]).transferFrom(order.seller, order.buyer, order.sellerTokenAmount[i]); 
        }
      // Move Taker Tokens first 
      for (i = 0; i < _buyerTokens.length; i++) {
        if (!isDone) {
                return 0;
            }
            isDone = Token(order.buyerToken[i]).transferFrom(order.buyer, order.seller, order.buyerTokenAmount[i]); 
        }
      LogFill(order.seller, order.buyer, order.feeReceipient, order.sellerToken, 
      order.buyerToken, order.sellerTokenAmount,order.buyerTokenAmount, order.sellerFee, 
      order.buyerFee, keccak256(order.sellerToken, order.buyerToken), order.orderHash
      ); 
      return 1;
    }  

    function verifyOrderHashes(
                            address[] _sellerTokens, 
                            uint256[] _sellervalues, 
                            address[] _buyerTokens, 
                            uint256[] _buyerValues, 
                            address[3] _orderAddresses, 
                            uint256[4] _orderValues, 
                            bytes32 hash
    ) public  
    constant  
    returns (bool) 
    {
        AssetOrder memory order = createOrderObject(_sellerTokens, _sellervalues, _buyerTokens, _buyerValues, _orderAddresses, _orderValues);     
        return (order.orderHash == hash ? true : false);
    } 
    
    
    function createOrderObject(
                        address[] _sellerTokens, 
                        uint256[] _sellervalues, 
                        address[] _buyerTokens, 
                        uint256[] _buyerValues, 
                        address[3] _orderAddresses, 
                        uint256[4] _orderValues
    ) internal 
    returns (AssetOrder) 
    {
        AssetOrder memory order = AssetOrder({
            seller: _orderAddresses[0],
            buyer: _orderAddresses[1],
            feeReceipient: _orderAddresses[2],
            sellerToken: _sellerTokens,
            buyerToken: _buyerTokens,
            sellerTokenAmount: _sellervalues,
            buyerTokenAmount: _buyerValues,
            sellerFee: _orderValues[0],
            buyerFee: _orderValues[1],
            expirationTimestampInSec: _orderValues[2],
            orderHash: getOrderHash(_sellerTokens, _sellervalues, _buyerTokens, _buyerValues, _orderAddresses, _orderValues) 
        });
        return order;
    }



    function getLength(address[] sellerTokens) public constant returns (uint256) {
        uint256 len = sellerTokens.length;
        return len;
    } 


    function getItem(address[] sellerTokens, uint index) public constant returns (address) {
        address item = sellerTokens[index];
        return item;
    }


    function getOrderHash(
                        address[] _sellerTokens, 
                        uint256[] _sellervalues, 
                        address[] _buyerTokens, 
                        uint256[] _buyerValues, 
                        address[3] _orderAddresses, 
                        uint256[4] _orderValues
    ) internal 
    constant 
    returns (bytes32 orderHash) 
    {
        return keccak256(
            address(this), 
            _orderAddresses[0], // seller
            _orderAddresses[1], // buyer
            _sellerTokens, // seller token
            _buyerTokens, // buyer token
            _orderAddresses[2], // fee receipient
            _sellervalues, // seller token amount
            _buyerValues, // buyer token amount
            _orderValues[0], // seller fee
            _orderValues[1], // buyer fee
            _orderValues[2], // expirationTimestampInSec
            _orderValues[3] // salt
        );
    }  
}
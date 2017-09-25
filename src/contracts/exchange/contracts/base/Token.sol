pragma solidity ^0.4.15;

contract Token {
    /// @return total amount of tokens
    function totalSupply() public constant returns (uint supply);

    /// @param _owner The address from which the balance will be retrieved
    /// @return The balalnce
    function balanceOf(address _owner) public constant returns (uint balance);

    /// @notice send '_value' token to '_to' from 'msg.sender'
    /// @param _to the address of the recipient
    /// @param _value The amount of token to be transferred
    /// @return Whether the transfer was successful or not
    function transfer(address _to, uint _value) public returns (bool success);

    /// @notice send '_value' token to '_to' from '_from' on the condition is approved by '_from'
    /// @param _from the address of the sender
    /// @param _to the address of the reciver
    /// @param _value The amount of token to be transferred
    /// @return Whether the transfer was successful or not
    function transferFrom(address _from, address _to, uint _value) public returns (bool success);

    /// @notice 'msg.sender' approves '_addr' to spend '_value' tokens
    /// @param _spender the address of the account able to transfer the tokens
    /// @param _value THe amount of wei to be approved for transfer
    /// @return Whether the approval was successful or not
    function approve(address _spender, uint _value) public returns (bool success);

    /// @param _owner The address of the account owning tokens
    /// @param _spender The address of the account be able to transfer tokens
    /// @return Amount of remaining tokens allowed to spent
    function allowance(address _owner, address _spender) public constant returns (uint remaining); 

    event Transfer(address indexed _from, address indexed _to, uint _value);
    event Approval(address indexed _owner, address indexed _spender, uint _value);
}
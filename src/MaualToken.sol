// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.26;


contract ManualToken {
    mapping (address => uint) private s_balances;
    function name() public pure returns (string memory) {
        return "ManualToken";
    }
    function decimals() public pure returns(uint8) {
        return 18;
    }
    function totalSupply() public pure returns(uint256) {
        return 100 ether;
    }
    function balanceOf(address owner) public view returns(uint256){
        return s_balances[owner];
    }
    function transfer(address to, uint256 amount) public {
        uint256 previousBalance = s_balances[msg.sender] + s_balances[to];
        s_balances[msg.sender] -= amount;
        s_balances[to] += amount;
        require(balanceOf(msg.sender) + balanceOf(to) == previousBalance);
    }
}
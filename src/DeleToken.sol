// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.26;
import{ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DeleToken is ERC20{
    constructor(uint256 initialSupply) ERC20("DeleToken", "DT"){
        _mint(msg.sender, initialSupply);
    }

}
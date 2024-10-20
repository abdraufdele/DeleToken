// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.26;

import{Script} from "forge-std/Script.sol";
import{DeleToken} from "../src/DeleToken.sol";

contract DeployDeleToken is Script {
    uint256 public constant INITIAL_SUPPLY = 1000 ether;
    function run() external returns(DeleToken) {
        vm.startBroadcast();
        DeleToken deletoken = new DeleToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return deletoken;
    }
}
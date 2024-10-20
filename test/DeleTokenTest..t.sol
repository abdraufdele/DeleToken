// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.26;

import {Test} from "forge-std/Test.sol";
import {DeleToken} from "../src/DeleToken.sol";
import {DeployDeleToken} from "../script/DeployDeleToken.s.sol";

contract DeleTokenTest is Test {
    DeleToken public deletoken;
    DeployDeleToken public deployer;

    address alice = makeAddr("alice");
    address bob = makeAddr("bob");

    uint256 public constant STARTING_BALANCE = 10 ether;

    function setUp() public {
        deployer = new DeployDeleToken();
        deletoken = deployer.run();

        vm.prank(msg.sender);
        deletoken.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() public view {
        assertEq(STARTING_BALANCE, deletoken.balanceOf(bob));
    }

    function testAllowances() public {
        uint256 initialAllowance = 1000;
        //Bob approves alice to spend tokens
        vm.prank(bob);
        deletoken.approve(alice, initialAllowance);

        uint256 transferAmount = 500;

        vm.prank(alice);
        deletoken.transferFrom(bob, alice, transferAmount);
        assertEq(deletoken.balanceOf(alice), transferAmount);
        assertEq(deletoken.balanceOf(bob), STARTING_BALANCE - transferAmount);
    }

    function testTransfer() public {
        uint256 amount = 1000;
        address receiver = address(0x1);
        vm.prank(msg.sender);
        deletoken.transfer(receiver, amount);
        assertEq(deletoken.balanceOf(receiver), amount);
    }

    function testBalanceAfterTransfer() public {
        uint256 amount = 1000;
        address receiver = address(0x1);
        uint256 initialBalance = deletoken.balanceOf(msg.sender);
        vm.prank(msg.sender);
        deletoken.transfer(receiver, amount);
        assertEq(deletoken.balanceOf(msg.sender), initialBalance - amount);
    }

    function testTransferFrom() public {
        uint256 amount = 1000;
        address receiver = address(0x1);
        vm.prank(msg.sender);
        deletoken.approve(address(this), amount);
        deletoken.transferFrom(msg.sender, receiver, amount);
        assertEq(deletoken.balanceOf(receiver), amount);
    }
}
////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

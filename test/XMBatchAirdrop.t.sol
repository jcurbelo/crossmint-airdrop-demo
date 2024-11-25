// SPDX-License-Identifier: UNLICENSED

import {XMBatchAirdrop} from "../src/XMBatchAirdrop.sol";

pragma solidity ^0.8.28;

import {Test} from "forge-std/Test.sol";

contract XMBatchAirdropTest is Test {
    XMBatchAirdrop airdropContract;

    function setUp() public {
        airdropContract = new XMBatchAirdrop("XMBatchAirdrop", "XMB");
    }

    function testBatchMint() public {
        address[] memory accounts = new address[](2);
        uint256[] memory quantities = new uint256[](2);

        accounts[0] = address(0x1);
        accounts[1] = address(0x2);

        quantities[0] = 1;
        quantities[1] = 1;

        airdropContract.batchMint(accounts, quantities);

        // check each wallet balance
        for (uint256 i = 0; i < accounts.length; i++) {
            uint256 balance = airdropContract.balanceOf(accounts[i]);
            assertEq(balance, 1);
        }
    }
}

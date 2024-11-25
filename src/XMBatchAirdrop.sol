// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;
import {ERC721A} from "lib/ERC721A/contracts/ERC721A.sol";

contract XMBatchAirdrop is ERC721A {
    constructor(
        string memory name_,
        string memory symbol_
    ) ERC721A(name_, symbol_) {}
}

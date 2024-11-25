// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;
import {ERC721A} from "lib/ERC721A/contracts/ERC721A.sol";
import {AccessControl} from "lib/openzeppelin-contracts/contracts/access/AccessControl.sol";

contract XMBatchAirdrop is ERC721A, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor(
        string memory name_,
        string memory symbol_
    ) ERC721A(name_, symbol_) {
        _grantRole(DEFAULT_ADMIN_ROLE, _msgSenderERC721A());
        _grantRole(MINTER_ROLE, _msgSenderERC721A());
    }

    function batchMint(
        address[] calldata accounts,
        uint256[] calldata quantities
    ) public onlyRole(MINTER_ROLE) {
        require(accounts.length == quantities.length, "Invalid input");

        uint256 total = accounts.length;

        for (uint256 i = 0; i < total; ) {
            _mint(accounts[i], quantities[i]);
            unchecked {
                ++i;
            }
        }
    }

    function _startTokenId() internal pure override(ERC721A) returns (uint256) {
        return 1;
    }

    function supportsInterface(
        bytes4 interfaceId
    ) public view override(ERC721A, AccessControl) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}

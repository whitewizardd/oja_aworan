// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {CollectionNFT} from "./aworan.sol";

contract Market_Place {
    address[] public all_created_nft_contracts;
    mapping(address => address[]) public owner_to_contract;

    function create_new_collection(string memory name, string memory symbol) external {
        CollectionNFT nft = new CollectionNFT(name, symbol, msg.sender);
        address new_created_nft_contract = address(nft);
        all_created_nft_contracts.push(new_created_nft_contract);
        owner_to_contract[msg.sender].push(new_created_nft_contract);
    }

    function get_all_created_aworan_oja() external view returns (address[] memory created_aworan) {
        created_aworan = all_created_nft_contracts;
    }

    function get_user_created_aworan_oja() external view returns (address[] memory user_owned_aworan) {
        user_owned_aworan = owner_to_contract[msg.sender];
    }
}

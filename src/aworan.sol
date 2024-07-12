// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../lib/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";

contract CollectionNFT is ERC721URIStorage, Ownable {
    mapping(address => uint256) private minterTokenId;

    struct Mint {
        address minter;
        string uri;
    }

    constructor(string memory _name, string memory _symbol, address _owner) ERC721(_name, _symbol) Ownable(_owner) {}

    function mint(Mint memory minnt) external {
        handle_mint(minnt);
    }

    function handle_mint(Mint memory minnt) private {
        uint256 token_id = minterTokenId[minnt.minter] + 1;
        _mint(minnt.minter, token_id);
        _setTokenURI(token_id, minnt.uri);
    }

    function mint_multiple(Mint[] memory mints) external {
        uint256 length_of_mints = mints.length;
        for (uint256 i = 0; i < length_of_mints; i++) {
            handle_mint(mints[i]);
        }
    }
}

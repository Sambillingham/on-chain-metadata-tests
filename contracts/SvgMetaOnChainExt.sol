// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "./OnChainMetadata.sol";

contract SvgMetaOnChainExt is ERC1155, OnChainMetadata {
    constructor()
        ERC1155("")
        {}
    
    mapping(uint256 => bool) _ids; 
    
    function createMetadata(uint256 id, string memory name, string memory description, string memory imageURI) public { 
        require(_ids[id] == false, "ERC1155OnChainMetadata: mintWithMetadata: id already exists");
        _setValue(id, key_token_name, abi.encode(name));
        _setValue(id, key_token_description, abi.encode(description));
        _setValue(id, key_token_image, abi.encode(createSVG(imageURI))); 
        _ids[id] = true;
    }

    function uri(uint256 tokenId) public view override(ERC1155) returns (string memory) { 
        return _createTokenURI(tokenId);
    }

    function contractURI() public view virtual returns (string memory) { 
        return _createContractURI();
    }

      function createSVG(string memory svg) public pure returns (string memory){   
        return string(abi.encodePacked('data:image/svg+xml;base64,', Base64.encode(bytes(string(abi.encodePacked(svg))))));
    }

}
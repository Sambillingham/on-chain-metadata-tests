// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Strings.sol"; 
import "@openzeppelin/contracts/utils/Base64.sol"; 

contract SvgMeta is ERC1155 {
    constructor()
        ERC1155("")
        {}
    
    mapping (uint256 => string) public _uris;
            
    function uri(uint256 tokenId) override public view returns (string memory) {
        return(_uris[tokenId]);
    }
    
    function setTokenUri(uint256 tokenId,string calldata name, string calldata desc, string calldata svg ) public  {

        string memory packedSvg = string(abi.encodePacked(svg));

        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "',
                        name,
                        '", "description":"',
                        desc,
                        '","image": "data:image/svg+xml;base64,',
                        Base64.encode(bytes(packedSvg)),
                        '"}'
                    )
                )
            )
        );

        _uris[tokenId] = string(
            abi.encodePacked("data:application/json;base64,", json)
        );
    }

}
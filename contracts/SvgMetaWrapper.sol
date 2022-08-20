// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Strings.sol"; 
import "@openzeppelin/contracts/utils/Base64.sol"; 
import "./OnChainMetadata.sol";

// [WIP] Traits NFT
 
contract SvgMetaWrapper is ERC1155, OnChainMetadata {
    constructor()
        ERC1155("")
        {}
    
    string public name = 'SvgMetaWrapper';
    string public symbol = 'SMW';

    mapping (uint256 => string) public _svgData;
    mapping(uint256 => bool) _ids; 
    
    string private start = "<svg width='74' height='74' viewBox='0 0 74 74' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' clip-rule='evenodd' d='M4 2H3V3H2V4H3H4V3V2ZM69 3H5V4H69V3ZM69 70H5V71H69V70ZM70 2H71V3H72V4H71H70V3V2ZM3 70H2V71H3V72H4V71V70H3ZM3 5H4V69H3V5ZM72 71V70H71H70V71V72H71V71H72ZM71 5H70V69H71V5Z' fill='black'/><path fill-rule='evenodd' clip-rule='evenodd' d='M5 4H4V5H5V4ZM70 4H69V5H70V4ZM4 69H5V70H4V69ZM70 69H69V70H70V69Z' fill='#ACACAC'/>";
    string private end = "</svg>";

    function createMetadata(uint256 id, string memory name, string memory description) public { 
        require(_ids[id] == false, "ERC1155OnChainMetadata: id already exists");
        _setValue(id, key_token_name, abi.encode(name));
        _setValue(id, key_token_description, abi.encode(description));

        bytes[] memory trait_types = new bytes[](1);
        bytes[] memory trait_values = new bytes[](1);
        trait_types[0] = abi.encode("Rarity");
        trait_values[0] = abi.encode("Common");
        _setValues(id, key_token_attributes_trait_type, trait_types);
        _setValues(id, key_token_attributes_trait_value, trait_values);

        _ids[id] = true;
    }

    function _createTokenURI(uint256 tokenId) override internal view returns (string memory) { 
        bytes memory attributes;
        bytes[] memory trait_type = _getValues(tokenId, key_token_attributes_trait_type);

        if(trait_type.length > 0){
            attributes = '[';
            bytes[] memory trait_value = _getValues(tokenId, key_token_attributes_trait_value);
            for(uint256 i=0; i<trait_type.length; i++){
                attributes = abi.encodePacked(attributes, i > 0 ? ',' : '', '{',
                '"trait_type": "' , string(abi.decode(trait_type[i], (string))), '", "value": "' , string(abi.decode(trait_value[i], (string))), '"}');
            }
            attributes = abi.encodePacked(attributes, ']');
        }
    
        string memory itemName = string(abi.decode(_getValue(tokenId, key_token_name), (string)));
        string memory description = string(abi.decode(_getValue(tokenId, key_token_description), (string))); 
        string memory image = Base64.encode(abi.encodePacked(start,_svgData[tokenId],end));

        return string(abi.encodePacked('data:application/json;base64,', Base64.encode(abi.encodePacked(
            '{',
                '"name": "', itemName, '", ',
                '"description": "', description, '"'
                '"image": "data:image/svg+xml;base64,', image, '"',
                bytes(attributes).length > 0 ? string(abi.encodePacked(', "attributes": ', attributes)) : '',
            '}'))
        ));
    }

    function uri(uint256 tokenId) public view override(ERC1155) returns (string memory) { 
        return _createTokenURI(tokenId);
    }

    function setSVGData(uint256 tokenId, string calldata name, string calldata svg ) public  {
        createMetadata(tokenId, name, "~ Traits ~");
        _svgData[tokenId] = svg;
    }
    
    function mint(uint256 id) public {
        _mint(msg.sender, id, 1, '');
    }

}
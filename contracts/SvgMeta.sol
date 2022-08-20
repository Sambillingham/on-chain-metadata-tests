// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Strings.sol"; 
import "@openzeppelin/contracts/utils/Base64.sol"; 

contract SvgMeta is ERC1155 {
    constructor()
        ERC1155("")
        {
            setTokenUri(0, 'Toupee', '~Traits~', '<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" x="0" y="0" viewBox="0 0 74 74" style="enable-background:new 0 0 74 74" xml:space="preserve"><style>.st0{fill:#c4c4c4}.st1{fill:#ececec}</style><path d="M24.5 61h-5v1h2v5h1v-5h2zM25.5 62h1v4h-1zM26.5 66h3v1h-3zM29.5 62h1v4h-1zM26.5 61h3v1h-3zM31.5 61h1v5h-1zM32.5 66h3v1h-3zM35.5 61h1v5h-1zM38.5 62h3v-1h-4v6h1v-2h3v-1h-3zM41.5 62h1v2h-1zM44.5 62h4v-1h-5v6h5v-1h-4v-1h2v-1h-2v-1zM50.5 62h4v-1h-5v6h5v-1h-4v-1h2v-1h-2v-1z"/><g><path class="st0" d="M28 30h18v2H28zM30 24h6v2h-6zM38 24h6v2h-6z"/></g><g><path class="st1" d="M32 22h2v2h-2zM30 28h4v2h-4zM40 22h2v2h-2zM40 28h4v2h-4z"/></g><path d="M34 24h-2v2h-2v2h2v-2h2v2h2v4h-2v-2h-4v2h-2v2h2v-2h4v2h2v4h2v-4h2v-2h4v2h2v-2h-2v-2h-4v2h-2v-4h2v-2h2v2h2v-2h-2v-2h-2v2h-2v2h-2v-2h-2v-2z" style="fill-rule:evenodd;clip-rule:evenodd"/></svg>');
            setTokenUri(1, 'Cube', '~Traits~', '<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" x="0" y="0" viewBox="0 0 74 74" style="enable-background:new 0 0 74 74" xml:space="preserve"><style>.st0{fill:#f6f6f6}.st1{fill:#fff}.st2{fill:#cecece}.st11{fill:#eaeaea}</style><path class="st0" d="M26 45h4v2h4v2h2v2h2v-2h2v-2h4v-2h4v-6H26zM60 30h2v2h-2zM56 26h2v2h-2zM64 26h2v2h-2zM60 22h2v2h-2zM14 38h2v2h-2zM10 34h2v2h-2zM18 34h2v2h-2zM14 30h2v2h-2z"/><path class="st1" d="M34 33h6v4h-6zM32 45h10v6H32z"/><path class="st2" d="M32 39h10v2H32zM28 29h18v2H28z"/><path d="M40 21h-6v2h6v-2zm0 16h-6v2h6v-2zm0-4h6v2h-6v-2zm6-8h-6v2h6v-2zm0 4h4v2h-4v-2zm-18 0h-4v2h4v-2zm0 4h6v2h-6v-2zm6-8h-6v2h6v-2z" style="fill-rule:evenodd;clip-rule:evenodd;fill:#bfbfbf"/><path style="fill:#929292" d="M32 25h10v2H32z"/><path class="st2" d="M24 39h2v2h-2zM48 39h2v2h-2z"/><path d="M30 31h14v2H30v-2zm10 10h-6v2h2v2h2v-2h2v-2zm-8-2h-6v2h-2v2h2v-2h6v-2zm10 0h6v2h-6v-2zm6 2v2h2v-2h-2z" style="fill-rule:evenodd;clip-rule:evenodd;fill:#e2e2e2"/><path d="M44 27H30v2h14v-2zm-16 6h-2v2h-2v2h2v-2h2v-2zm20 2h2v2h-2v-2zm0 0h-2v-2h2v2z" style="fill-rule:evenodd;clip-rule:evenodd;fill:#a6a6a6"/><path d="M30 27h14v2h-2v2H32v-2h-2v-2zm12 10H32v-2h-6v2h-2v2h2v-2h4v2h6v2h2v-2h6v-2h4v2h2v-2h-2v-2h-6v2z" style="fill-rule:evenodd;clip-rule:evenodd;fill:#bababa"/><path class="st2" d="M26 37h4v2h-4zM44 37h4v2h-4zM34 31h6v2h-6z"/><path style="fill:#e2e2e2" d="M36 33h2v2h-2z"/><path d="M32 23h10v2H32v-2zm-2 4v-2h2v2h-2zm-4 2v-2h4v2h-4zm4 4h-4v2h-2v-6h2v2h4v2zm2 2h-2v-2h2v2zm4 2h-4v-2h4v2zm2 0v2h-2v-2h2zm4-2v2h-4v-2h4zm2-2v2h-2v-2h2zm4-4h2v6h-2v-2h-4v-2h4v-2zm-4-2h4v2h-4v-2zm0 0v-2h-2v2h2zM28 45v-2h-4v2h4zm18 0v-2h4v2h-4zm0 2h-6v2h6v-2zm-6 4h-6v2h6v-2zm-12-4h6v2h-6v-2z" style="fill-rule:evenodd;clip-rule:evenodd;fill:#737373"/><path d="M36 21h2v2h2v2h-6v-2h2v-2zM24 43h2v2h-2v-2zm6 4h-4v-2h4v2zm2 2h-2v-2h2v2zm4 2h-4v-2h4v2zm2 0v2h-2v-2h2zm4-2v2h-4v-2h4zm2-2v2h-2v-2h2zm4-2v2h-4v-2h4zm0 0v-2h2v2h-2z" style="fill-rule:evenodd;clip-rule:evenodd"/><g><path d="M25.5 62h1v4h-1zM26.5 66h3v1h-3zM29.5 62h1v1h-1zM26.5 61h3v1h-3zM29.5 65h1v1h-1z"/></g><g><path d="M31.5 61h1v5h-1zM32.5 66h3v1h-3zM35.5 61h1v5h-1z"/></g><g><path d="M37.5 62h1v5h-1zM41.5 62h1v1h-1zM37.5 61h1v1h-1zM38.5 63h3v1h-3zM38.5 66h3v1h-3z"/><path d="M37.5 61h4v1h-4zM41.5 64h1v2h-1z"/></g><g><path d="M43.5 65h1v2h-1zM43.5 63h1v2h-1zM43.5 62h1v1h-1zM43.5 61h1v1h-1zM44.5 64h2v1h-2zM44.5 66h4v1h-4z"/><path d="M43.5 61h5v1h-5z"/></g><g><path class="st11" d="M56 43h2v2h-2zM56 39h2v2h-2zM58 41h2v2h-2zM54 41h2v2h-2zM26 16h-2v2h-2v2h2v2h2v-2h2v-2h-2zM48 12h-2v2h-2v2h2v2h2v-2h2v-2h-2zM12 34h2v2h-2zM14 36h2v2h-2zM14 32h2v2h-2zM16 34h2v2h-2z"/></g></svg>');
            setTokenUri(2, 'Third Eye', '~Traits~', '<svg xmlns="http://www.w3.org/2000/svg" xml:space="preserve" viewBox="0 0 74 74"><path d="M15.5 61h-5v1h2v5h1v-5h2zm5 0v3h-3v-3h-1v6h1v-2h3v2h1v-6zm7 1v-1h-5v1h2v4h-2v1h5v-1h-2v-4zm5 0h1v2h-1zm0 3h1v2h-1zm-3-1v-2h3v-1h-4v6h1v-2h3v-1zm6 1v-3h3v-1h-4v6h4v-1h-3zm3-3h1v4h-1zm9 0h4v-1h-5v6h5v-1h-4v-1h2v-1h-2v-1zm5-1h1v1h-1zm4 0h1v1h-1zm-2 2h1v4h-1zm-1-1h1v1h-1zm2 0h1v1h-1zm4 0h4v-1h-5v6h5v-1h-4v-1h2v-1h-2v-1z"/><g fill="#eaeaea"><path fill-rule="evenodd" d="M34 26h6v2h2v2h2v2h2v2h2v2h2v2h2v4H22v-4h2v-2h2v-2h2v-2h2v-2h2v-2h2v-2z" clip-rule="evenodd"/><path d="M24 38h10v6H24zm16 0h10v6H40zm-6-16h6v6h-6z"/></g><g fill-rule="evenodd" clip-rule="evenodd"><path fill="#bebebe" d="M38 22h-2v4h4v-2h-2v-2zm-8 16h-2v4h4v-2h-2v-2zm16 0h-2v4h4v-2h-2v-2z"/><path fill="#d1d1d1" d="M36 40h-2v4h2v-4zm4 0h-2v4h2v-4z"/></g><path fill="#737373" fill-rule="evenodd" d="M38 16h-2v4h2v-4zm-6 4h2v2h-2v-2zm0 0h-2v-2h2v2zm-4 2h2v2h-2v-2zm0 0h-2v-2h2v2zm14-2h-2v2h2v-2zm0 0v-2h2v2h-2zm2 2h2v2h-2v-2zm2 0h2v-2h-2v2zM26 42h-2v2h2v2h6v-2h2v-2h-2v2h-6v-2zm14 0h2v2h-2v-2zm8 2v2h-6v-2h6zm0 0v-2h2v2h-2z" clip-rule="evenodd"/><path d="M36 24h2v2h-2zm-2 4h6v2h-6zm-4-4h2v2h-2zm10-2h2v2h-2zm2 2h2v2h-2zm-8-4h6v2h-6zm-2 2h2v2h-2zm-4 18h2v2h-2zm-8 0h4v2h-4zm4-2h2v2h-2zm10 2h2v2h-2zm-8-4h6v2h-6zm6 2h2v2h-2zm-10-2h2v2h-2zm2-2h2v2h-2zm20 6h2v2h-2zm-4-2h2v2h-2zm-2 2h2v2h-2zm10-2h2v2h-2zm2 2h4v2h-4zm0-4h2v2h-2zm-8 0h6v2h-6zm6-2h2v2h-2z"/></svg>');
            mint(0);
            mint(1);
            mint(2);
        }
    
    mapping (uint256 => string) public _uris;
            
    function uri(uint256 tokenId) override public view returns (string memory) {
        return(_uris[tokenId]);
    }
    
    function setTokenUri(uint256 tokenId,string memory name, string memory desc, string memory svg ) public  {

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

    function mint(uint256 id) public {
        _mint(msg.sender, id, 1, '');
    }

}
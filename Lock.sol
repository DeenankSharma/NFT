// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;


import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";



contract TVCharactersNFT is ERC721URIStorage{
    uint256 private _tokenId;
    uint256 public constant MAX_NFTS = 3000;
    uint256 public nftCount;
    mapping (uint256 => string) private _tokenURIs;

    constructor() ERC721("TVCharactersNFT", "TVNFT") {}

    function mintNFT(address recipient, string memory tokenURI) public returns (uint256) {
        require(nftCount < MAX_NFTS, "Maximum number of NFTs reached");

        uint256 newItemId = _tokenId + 1;
        _tokenId = newItemId;

        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        nftCount++;

        return newItemId;
    }

    function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual override {
        
        _tokenURIs[tokenId] = _tokenURI;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        
        return _tokenURIs[tokenId];
    }


    function changeImage(uint256 tokenId, string memory newTokenURI) public {
        require(ownerOf(tokenId) == _msgSender(), "Caller is not owner");
        _setTokenURI(tokenId, newTokenURI);
    }
}
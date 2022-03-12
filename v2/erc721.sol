// SPDX-License-Identifier: MIT
pragma solidity 0.8;

/**
    under user experiance
    * disclaimer:
    the code is trial & expermential.
    run this at your risk.
*/

import "@openzeppelin/contracts@4.5.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.5.0/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts@4.5.0/token/ERC721/extensions/ERC721Royalty.sol";
import "@openzeppelin/contracts@4.5.0/access/Ownable.sol";
import "@openzeppelin/contracts@4.5.0/utils/Counters.sol";
import "@openzeppelin/contracts@4.5.0/security/ReentrancyGuard.sol";

contract NFT is ERC721, ERC721URIStorage, Ownable, ReentrancyGuard  {
    using Counters for Counters.Counter;
     using Strings for uint256;

    Counters.Counter private _tokenIdCounter;

    bool private paused = false;
    uint256 private cost; // = 0.01 ether
    uint256 private ID = 1;
    uint256 public tokenCount;
    string public uriJson = '.json';
    string public uriPath; // test: QmUcMue4sM7FiJJRmPcU6eFQZMDVYW8CFe49feeBijj2Fd/

    constructor(
        string memory _name,
        string memory _symbol,
        string memory _path,
        uint256 _cost
    ) ERC721(_name, _symbol) {
        cost = _cost;
        uriPath = _path;
    }

    modifier notPause {
        require(!paused, 'The contract is paused!');
        _;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://ipfs.io/ipfs/";
    }
    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage ) {
        super._burn(tokenId);
    }


    function trigerPause() public onlyOwner {
        paused = !paused;
    }

    function mint(uint256 _mintAmount) public payable notPause {
        _safeMint(_msgSender(), _mintAmount, '');
        ID += 1;
    }

    function mintForAddress(uint256 _mintAmount, address _receiver) public onlyOwner {
        _safeMint(_receiver, _mintAmount);
        ID += 1;
    }

    function minter(string memory _tokenURI) external notPause returns(uint256){
        if(ID > 1){
            tokenCount = ID - 1;
            }
        else{
            tokenCount = 1;
            }
        _safeMint(msg.sender, tokenCount);
        _setTokenURI(tokenCount, _tokenURI);
        return(tokenCount);
    }

    function setCost(uint256 _cost) public onlyOwner {
        cost = _cost;
    }

    function withdraw() public onlyOwner nonReentrant {
        (bool success, ) = payable(owner()).call{value: address(this).balance}('');
        require(success);
    }

    function payedBalance () public view returns (uint256 cash) {
        cash = address(this).balance;
    }
    
    function tokenURI(uint256 _tokenId) public view 
    override(ERC721, ERC721URIStorage) returns (string memory) {
        require(_exists(_tokenId), 'ERC721Metadata: URI query for nonexistent token');
        string memory currentBaseURI = _baseURI();
        return bytes(currentBaseURI).length > 0
            ? string(abi.encodePacked(currentBaseURI, uriPath, _tokenId.toString(), uriJson))
            : '';
    }

}

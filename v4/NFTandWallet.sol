// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

/// @custom:security-contact mosipvp@gmail.com
contract ERC721NFT is ERC721, Pausable, Ownable, ERC721Burnable, ReentrancyGuard {
    using Counters for Counters.Counter;
    using Strings for uint256;

    Counters.Counter private _tokenIdCounter;

    // wallet erc721
    mapping(uint256 => address) public nftOwner; // sender=>covrage
    uint256 covrage; // saved item id (a db), seprate owners

    uint256 maxCount;

    string public cidURI = ""; // CID/x.abc
    string public uriSuffix = ".json";

    constructor(
        string memory _cid,
        uint256 _max
        ) ERC721("Show Time", "ST") {
        cidURI = _cid;
        maxCount = _max;
        safeMint(msg.sender);
    }

    function _baseURI() internal pure override returns (string memory) {
        // return "https://gateway.ipfs.io/ipfs/";
        return "https://ipfs.io/ipfs/";
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    function Mint(address to) public onlyOwner {
        require(_tokenIdCounter.current() < maxCount, "mint finish");
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function setCidURI(string memory _cidURI) public onlyOwner {
        cidURI = _cidURI;
    }

    function tokenURI(uint256 _tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        string memory currentBaseURI = _baseURI();
        return bytes(currentBaseURI).length > 0
            ? string(abi.encodePacked(currentBaseURI, cidURI, "/", _tokenId.toString(), uriSuffix))
            : "";
    }

    // wallet section: erc721
    function receiveNft(ERC721 _nft, uint id) external {
        require(msg.sender == _nft.ownerOf(id),"just real owner");
        // _nft.setApprovalForAll(address(this), true); // this is by sender from contract address.1- handly, 2- signature
        _nft.approve(address(this), id);
        _nft.transferFrom(msg.sender, address(this), id);
        nftOwner[covrage] = msg.sender;
        covrage += 1;
    }
    
    function sendNft(ERC721 nft, address spender, uint id) external onlyOwner {
        // require(check owner)
        require(spender != address(0), "i hate to burn nft`s");
        nft.transferFrom(address(this), spender, id);
        nftOwner[covrage] = address(0); 
    }

    // wallet section: erc20
    // ERC20 withdraw native token
    function withdraw() payable public onlyOwner nonReentrant {
        (bool success, ) = payable(owner()).call{value: address(this).balance}("");
        require(success);
    }

    // IERC20 public immutable token;
    IERC20 public token;

    receive() external payable {}

    fallback() external payable {}

    function balanceOf20() view public returns(uint) {
        return address(this).balance;
    }

    function balanceOf20(IERC20 _token) view public returns(uint) {
        // token = IERC20(_token);
        return address(_token).balance;
    }

    function giftToken(IERC20 _token, uint _amount) external {
        token = IERC20(_token);
        token.transferFrom(msg.sender, address(this), _amount);
    }

    function claimGift(IERC20 _token) payable external onlyOwner nonReentrant {
        token = IERC20(_token);
        uint256 tmp = balanceOf20(_token);
        token.transfer(msg.sender, tmp);
    }
    
}

interface IERC20 {
    function transfer(address, uint) external returns (bool);

    function transferFrom(
        address,
        address,
        uint
    ) external returns (bool);

    function balanceOf20() view external returns(uint);
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

// important: check nft exist

contract NftForMembers is ERC721, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    IERC721 keyNft; // keyNft - nft address = ticket

    constructor(address _key) ERC721("NftForMembers", "MEM") {
        keyNft = IERC721(_key);
    }

    //********************************************//
    event IsValidMember(address member);
    event NewValidator(address _nft);

    modifier validMember() {
        require(isMember() == true);
        _;
    }

    function changeTicket(address _nft) public onlyOwner {
        keyNft = IERC721(_nft);
        emit NewValidator(_nft);
    }

    function isMember() internal view returns (bool) {
        require(IERC721(keyNft).balanceOf(msg.sender) > 0, "not valid member");
        return true;
    }

    function checkMember() public { // this type of checks need role() for proof
        require(isMember() == true);
        emit IsValidMember(msg.sender);
    }

    function freeMint_forMembers() public validMember() {
        emit IsValidMember(msg.sender);
        safeMint(msg.sender);
    }

    //********************************************//

    function safeMint(address to) private {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

}

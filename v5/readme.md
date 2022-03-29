## NFT + Royality
- erc721 included:
- - bulk mint
- - royality
- - air drop
- included flat version

### how to deploy & info
- MAXSUPPLY = maximum items mintable
- PRICE = per item (in wei)
- ROYALITY = as a percntage -> 100000 = 100% -> 10000 = 10% 
- URIPREFIX = hash code from IPFS -> Cid


### verified example
- POLYGON -> [here](https://mumbai.polygonscan.com/address/0x56E782004A64faA9f10eD66c02F536F29eCc6f2D)
- BSC -> [here](https://testnet.bscscan.com/address/0x6dde8b244a0450c9a1fe91979e832de8f6f81d35)
- ETH {ROPSTEN} -> [here](https://ropsten.etherscan.io/address/0x171d2b035bfb39ef590b6b7980ec753befe4951a)


### Prerequire:
- json -would be in a folder & uploaded on [ipfs](https://github.com/mosi-sol/erc721/tree/main/ipfs-tips#different-type-of-ipfs-address-type-for-json-of-nfts)

### Disclaimer **
- this repo for study perpuses for my students.
- expermential codes 
- use is/as/on product at your own risk

### Example for json

```
{
    "name": "Item name here",
    "description": "description of artwork/utility here",
    "image": "https://bafy0000000000000000000000000000wbo4.ipfs.dweb.link/thumbnail.png",
    "attributes": [
        {
            "trait_type": "Collection",
            "value": "IC"
        },
        {
            "trait_type": "Creator",
            "value": "Mosi"
        }
    ],
    "compiler": "MOSi Encrypt"
  }
```
##

watch other erc721 version [here](https://github.com/mosi-sol/erc721)

##

<p align="right"> 
  <a href="https://github.com/mosi-sol/erc721" target="blank">
  <img src="https://img.shields.io/badge/Ver-0.5-blue?style=flat" alt="cafe_pafe" /></a>
  <a href="https://github.com/mosi-sol/erc721" target="blank">
  <img src="https://img.shields.io/badge/License-MIT-lime?style=flat" alt="cafe_pafe" /></a>
</p>

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

### Prerequire:
- json -would be in a folder & uploaded on ipfs

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

const { expect } = require('chai');
const fs = require('fs');



describe("On Chain Meta", function() {

    it("Set a new Token URI - v1", async function () {
        const factory = await hre.ethers.getContractFactory("SvgMeta");
        const svgMetaContract = await factory.deploy();
        await svgMetaContract.deployed(); 

        const svg = `<svg xmlns="http://www.w3.org/2000/svg" width="74" height="74" fill="none"><path fill="#fff" d="M0 0h74v74H0z"/><g fill="#000" clip-path="url(#a)"><path d="M25.5 65h1v2h-1zM25.5 63h1v2h-1zM25.5 62h1v1h-1zM25.5 61h1v1h-1zM26.5 66h3v1h-3zM29.5 62h1v4h-1z"/><path d="M25.5 61h4v1h-4z"/></g><g fill="#000" clip-path="url(#b)"><path d="M31.5 65h1v2h-1zM31.5 63h1v2h-1zM31.5 62h1v1h-1zM31.5 61h1v1h-1zM32.5 64h2v1h-2zM32.5 66h4v1h-4z"/><path d="M31.5 61h5v1h-5z"/></g><g fill="#000" clip-path="url(#c)"><path d="M37.5 61h1v4h-1zM39.5 66h1v1h-1zM38.5 65h1v1h-1zM40.5 65h1v1h-1zM41.5 61h1v4h-1z"/></g><g fill="#000" clip-path="url(#d)"><path d="M43.5 62h1v4h-1zM44.5 66h3v1h-3zM47.5 62h1v4h-1zM44.5 61h3v1h-3z"/></g><path fill="#ACACAC" d="M26 32h22v4H26z"/><path fill="#ACACAC" d="M30 28h14v10H30z"/><path fill="#ACACAC" d="M34 24h6v6h-6z"/><path fill="#000" fill-rule="evenodd" d="M40 22h-6v2h-2v2h-2v2h-2v2h-2v2h-2v4h2v2h4v2h14v-2h4v-2h2v-4h-2v-2h-2v-2h-2v-2h-2v-2h-2v-2Zm6 10h-2v-4h-4v-4h-6v4h-4v4h-4v4h4v2h14v-2h4v-4h-2Z" clip-rule="evenodd"/><path fill="#EAEAEA" d="M28 34h2v2h-2z"/><path fill="#D5D5D5" d="M28 32h2v2h-2z"/><path fill="#EAEAEA" d="M32 30h2v2h-2z"/><path fill="#D5D5D5" d="M32 28h2v2h-2z"/><path fill="#EAEAEA" d="M36 26h2v2h-2z"/><path fill="#D5D5D5" d="M36 24h2v2h-2z"/><path fill="#008AFF" d="M4 4h66v66H4z" style="mix-blend-mode:color"/><path fill="#000" fill-rule="evenodd" d="M4 2H3v1H2v1h2V2Zm65 1H5v1h64V3Zm0 67H5v1h64v-1Zm1-68h1v1h1v1h-2V2ZM3 70H2v1h1v1h1v-2H3ZM3 5h1v64H3V5Zm69 66v-1h-2v2h1v-1h1ZM71 5h-1v64h1V5Z" clip-rule="evenodd"/><path fill="#ACACAC" fill-rule="evenodd" d="M5 4H4v1h1V4Zm65 0h-1v1h1V4ZM4 69h1v1H4v-1Zm66 0h-1v1h1v-1Z" clip-rule="evenodd"/><defs><clipPath id="a"><path fill="#fff" d="M0 0h6v7H0z" transform="translate(25.5 61)"/></clipPath><clipPath id="b"><path fill="#fff" d="M0 0h6v7H0z" transform="translate(31.5 61)"/></clipPath><clipPath id="c"><path fill="#fff" d="M0 0h6v7H0z" transform="translate(37.5 61)"/></clipPath><clipPath id="d"><path fill="#fff" d="M0 0h6v7H0z" transform="translate(43.5 61)"/></clipPath></defs></svg>`
        await svgMetaContract.setTokenUri(1, 'name', 'desc', svg)
        const uri = await svgMetaContract.uri(1)
        // console.log(`https://nftpreview.0xdev.codes/?code=${uri}`)

        expect(uri).to.exist;
    });

    it("Set a new Token URI - W/onchainmeta.sol", async function () {
        const factory = await hre.ethers.getContractFactory("SvgMetaOnChainExt");
        const svgMetaContract = await factory.deploy();
        await svgMetaContract.deployed(); 

        const svg = `<svg xmlns="http://www.w3.org/2000/svg" width="74" height="74" fill="none"><path fill="#fff" d="M0 0h74v74H0z"/><g fill="#000" clip-path="url(#a)"><path d="M25.5 65h1v2h-1zM25.5 63h1v2h-1zM25.5 62h1v1h-1zM25.5 61h1v1h-1zM26.5 66h3v1h-3zM29.5 62h1v4h-1z"/><path d="M25.5 61h4v1h-4z"/></g><g fill="#000" clip-path="url(#b)"><path d="M31.5 65h1v2h-1zM31.5 63h1v2h-1zM31.5 62h1v1h-1zM31.5 61h1v1h-1zM32.5 64h2v1h-2zM32.5 66h4v1h-4z"/><path d="M31.5 61h5v1h-5z"/></g><g fill="#000" clip-path="url(#c)"><path d="M37.5 61h1v4h-1zM39.5 66h1v1h-1zM38.5 65h1v1h-1zM40.5 65h1v1h-1zM41.5 61h1v4h-1z"/></g><g fill="#000" clip-path="url(#d)"><path d="M43.5 62h1v4h-1zM44.5 66h3v1h-3zM47.5 62h1v4h-1zM44.5 61h3v1h-3z"/></g><path fill="#ACACAC" d="M26 32h22v4H26z"/><path fill="#ACACAC" d="M30 28h14v10H30z"/><path fill="#ACACAC" d="M34 24h6v6h-6z"/><path fill="#000" fill-rule="evenodd" d="M40 22h-6v2h-2v2h-2v2h-2v2h-2v2h-2v4h2v2h4v2h14v-2h4v-2h2v-4h-2v-2h-2v-2h-2v-2h-2v-2h-2v-2Zm6 10h-2v-4h-4v-4h-6v4h-4v4h-4v4h4v2h14v-2h4v-4h-2Z" clip-rule="evenodd"/><path fill="#EAEAEA" d="M28 34h2v2h-2z"/><path fill="#D5D5D5" d="M28 32h2v2h-2z"/><path fill="#EAEAEA" d="M32 30h2v2h-2z"/><path fill="#D5D5D5" d="M32 28h2v2h-2z"/><path fill="#EAEAEA" d="M36 26h2v2h-2z"/><path fill="#D5D5D5" d="M36 24h2v2h-2z"/><path fill="#008AFF" d="M4 4h66v66H4z" style="mix-blend-mode:color"/><path fill="#000" fill-rule="evenodd" d="M4 2H3v1H2v1h2V2Zm65 1H5v1h64V3Zm0 67H5v1h64v-1Zm1-68h1v1h1v1h-2V2ZM3 70H2v1h1v1h1v-2H3ZM3 5h1v64H3V5Zm69 66v-1h-2v2h1v-1h1ZM71 5h-1v64h1V5Z" clip-rule="evenodd"/><path fill="#ACACAC" fill-rule="evenodd" d="M5 4H4v1h1V4Zm65 0h-1v1h1V4ZM4 69h1v1H4v-1Zm66 0h-1v1h1v-1Z" clip-rule="evenodd"/><defs><clipPath id="a"><path fill="#fff" d="M0 0h6v7H0z" transform="translate(25.5 61)"/></clipPath><clipPath id="b"><path fill="#fff" d="M0 0h6v7H0z" transform="translate(31.5 61)"/></clipPath><clipPath id="c"><path fill="#fff" d="M0 0h6v7H0z" transform="translate(37.5 61)"/></clipPath><clipPath id="d"><path fill="#fff" d="M0 0h6v7H0z" transform="translate(43.5 61)"/></clipPath></defs></svg>`
        await svgMetaContract.createMetadata(1, 'name', 'desc', svg)
        const uri = await svgMetaContract.uri(1)
        // console.log(`https://nftpreview.0xdev.codes/?code=${uri}`)

        expect(uri).to.exist;
    });

    it("Store an SVG", async function () {
        const factory = await hre.ethers.getContractFactory("SvgMetaWrapper");
        const svgMetaContract = await factory.deploy();
        await svgMetaContract.deployed(); 

        // fs.stat('./trait/devo.svg', (err, stats) => console.log(stats));
        // const buffer = fs.readFileSync('./trait/image-10.svg');
        // const fileContent = buffer.toString();
        // console.log(fileContent);

        // const svg = '<path fill="#f6f6f6" d="M26 45h4v2h4v2h2v2h2v-2h2v-2h4v-2h4v-6H26v6zm34-15h2v2h-2v-2zm-4-4h2v2h-2v-2zm8 0h2v2h-2v-2zm-4-4h2v2h-2v-2zM14 38h2v2h-2v-2zm-4-4h2v2h-2v-2zm8 0h2v2h-2v-2zm-4-4h2v2h-2v-2z"/><path fill="#fff" d="M34 33h6v4h-6v-4zm-2 12h10v6H32v-6z"/><path d="M32 39h10v2H32v-2zm-4-10h18v2H28v-2z" class="st2"/><path fill="#bfbfbf" fill-rule="evenodd" d="M40 21h-6v2h6v-2zm0 16h-6v2h6v-2zm0-4h6v2h-6v-2zm6-8h-6v2h6v-2zm0 4h4v2h-4v-2zm-18 0h-4v2h4v-2zm0 4h6v2h-6v-2zm6-8h-6v2h6v-2z" clip-rule="evenodd"/><path fill="#929292" d="M32 25h10v2H32v-2z"/><path d="M24 39h2v2h-2v-2zm24 0h2v2h-2v-2z" class="st2"/><path fill="#e2e2e2" fill-rule="evenodd" d="M30 31h14v2H30v-2zm10 10h-6v2h2v2h2v-2h2v-2zm-8-2h-6v2h-2v2h2v-2h6v-2zm10 0h6v2h-6v-2zm6 2v2h2v-2h-2z" clip-rule="evenodd"/><path fill="#a6a6a6" fill-rule="evenodd" d="M44 27H30v2h14v-2zm-16 6h-2v2h-2v2h2v-2h2v-2zm20 2h2v2h-2v-2zm0 0h-2v-2h2v2z" clip-rule="evenodd"/><path fill="#bababa" fill-rule="evenodd" d="M30 27h14v2h-2v2H32v-2h-2v-2zm12 10H32v-2h-6v2h-2v2h2v-2h4v2h6v2h2v-2h6v-2h4v2h2v-2h-2v-2h-6v2z" clip-rule="evenodd"/><path d="M26 37h4v2h-4v-2zm18 0h4v2h-4v-2zm-10-6h6v2h-6v-2z" class="st2"/><path fill="#e2e2e2" d="M36 33h2v2h-2v-2z"/><path fill="#737373" fill-rule="evenodd" d="M32 23h10v2H32v-2zm-2 4v-2h2v2h-2zm-4 2v-2h4v2h-4zm4 4h-4v2h-2v-6h2v2h4v2zm2 2h-2v-2h2v2zm4 2h-4v-2h4v2zm2 0v2h-2v-2h2zm4-2v2h-4v-2h4zm2-2v2h-2v-2h2zm4-4h2v6h-2v-2h-4v-2h4v-2zm-4-2h4v2h-4v-2zm0 0v-2h-2v2h2zM28 45v-2h-4v2h4zm18 0v-2h4v2h-4zm0 2h-6v2h6v-2zm-6 4h-6v2h6v-2zm-12-4h6v2h-6v-2z" clip-rule="evenodd"/><path fill-rule="evenodd" d="M36 21h2v2h2v2h-6v-2h2v-2zM24 43h2v2h-2v-2zm6 4h-4v-2h4v2zm2 2h-2v-2h2v2zm4 2h-4v-2h4v2zm2 0v2h-2v-2h2zm4-2v2h-4v-2h4zm2-2v2h-2v-2h2zm4-2v2h-4v-2h4zm0 0v-2h2v2h-2z" clip-rule="evenodd"/><path fill="#eaeaea" d="M56 43h2v2h-2v-2zm0-4h2v2h-2v-2zm2 2h2v2h-2v-2zm-4 0h2v2h-2v-2zM26 16h-2v2h-2v2h2v2h2v-2h2v-2h-2v-2zm22-4h-2v2h-2v2h2v2h2v-2h2v-2h-2v-2zM12 34h2v2h-2v-2zm2 2h2v2h-2v-2zm0-4h2v2h-2v-2zm2 2h2v2h-2v-2z"/>'
        const svg = '<path fill="#c4c4c4" d="M28 30h18v2H28zm2-6h6v2h-6zm8 0h6v2h-6z"/><path fill="#ececec" d="M32 22h2v2h-2zm-2 6h4v2h-4zm10-6h2v2h-2zm0 6h4v2h-4z"/><path fill-rule="evenodd" d="M34 24h-2v2h-2v2h2v-2h2v2h2v4h-2v-2h-4v2h-2v2h2v-2h4v2h2v4h2v-4h2v-2h4v2h2v-2h-2v-2h-4v2h-2v-4h2v-2h2v2h2v-2h-2v-2h-2v2h-2v2h-2v-2h-2v-2z" clip-rule="evenodd"/>'
        await svgMetaContract.setSVGData(1, 'Toupee', svg)
        const uri = await svgMetaContract.uri(1)
        console.log(`https://nftpreview.0xdev.codes/?code=${uri}`)

        expect(uri).to.exist;
    });

});


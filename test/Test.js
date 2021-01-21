const { expect } = require("chai");

describe("Initialisation", function() {

  it("Conditional Tokens contract deployed", async function() {
    let CT = await ethers.getContractFactory("ConditionalTokens");
    ct = await CT.deploy()
  })

  it("LS-LMSR contract deployed", async function() {
    let LSLMSR = await ethers.getContractFactory("LsLMSR");
    [owner] = await ethers.getSigners();
    lslmsr = await LSLMSR.deploy(ct.address, owner.address, 3, ethers.utils.parseEther('100'))
  })

  it("Checking owner of market maker", async function() {
    expect(await lslmsr.owner()).to.equal(owner.address)
  })

  it("Checking correct number of outcomes", async function() {
    expect(await lslmsr.numOutcomes()).to.equal(3)
  })
})

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

describe("Cost functions", function() {

  it("Checking initial cost function", async function() {
    expect(ethers.BigNumber.from(await lslmsr.costU()).toString()).to.equal('110') //100 subsidy with 10% overround
  })

  it("Checking cost increases with purchase", async function() {
    expect(ethers.BigNumber.from(await lslmsr.cost_after_buyU(1, ethers.BigNumber.from('2').pow('64').mul('10'))).toNumber()).to.gt(110) //100 subsidy with 10% overround
  })

  it("Checking price at baseline", async function() {
    expect(ethers.BigNumber.from(await lslmsr.priceU(1, ethers.BigNumber.from('2').pow('64').mul('10'))).toNumber()).to.equal(4) //100 subsidy with 10% overround
  })
})

describe("Testing buy/sell", function() {
  it("Trying to buy", async function() {
    await lslmsr.buyU(1, ethers.BigNumber.from('2').pow('64').mul('10'))
    expect(ethers.BigNumber.from(await lslmsr.costU()).toString()).to.equal('115')
  })
})

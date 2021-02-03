const { expect } = require("chai");

function toUInt(a) {
  return ethers.BigNumber.from(a).div(ethers.BigNumber.from(2).pow(64))
}

function fromUInt(a) {
  return ethers.BigNumber.from(a).mul(ethers.BigNumber.from(2).pow(64))
}

describe("LS-LMSR", function() {

  beforeEach(async function() {
    [owner] = await ethers.getSigners()
  })

  describe("Deployment", function() {

    it("Conditional Tokens contract deployed", async function() {
      let CT = await ethers.getContractFactory("ConditionalTokens");
      ct = await CT.deploy()
    })

    it("Fake Dai contract deployed", async function() {
      let DAI = await ethers.getContractFactory("FakeDai");
      dai = await DAI.deploy();
    })

    it("Creating 1000 DAI for user", async function() {
      await dai.mint(owner.address, ethers.utils.parseEther('1000'))
      expect(await dai.balanceOf(owner.address)).to.equal(ethers.utils.parseEther('1000'))
    })

    it("LS-LMSR contract deployed", async function() {
      let LSLMSR = await ethers.getContractFactory("LsLMSR");
      lslmsr = await LSLMSR.deploy(ct.address, dai.address)
    })

    it("Approve LS-LMSR to spend user money", async function() {
      await dai.approve(lslmsr.address, ethers.utils.parseEther('1000'))
      expect(await dai.allowance(owner.address, lslmsr.address)).to.equal(ethers.utils.parseEther('1000'))
    })

    it("LS-LMSR setup", async function() {
      await lslmsr.setup(owner.address, 3, ethers.utils.parseEther('1000'), 10)

      expect(await dai.balanceOf(lslmsr.address)).to.equal(ethers.utils.parseEther('1000'))
      expect(await dai.balanceOf(owner.address)).to.equal(ethers.utils.parseEther('0'))
    })

  })



  describe("Cost functions", function() {

    it("Checking initial cost function", async function() {
      expect(toUInt(ethers.BigNumber.from(await lslmsr.cost()))).to.equal(1009) //100 subsidy with 10% overround
    })

    it("Checking cost increases with purchase", async function() {
      //expect(ethers.BigNumber.from(await lslmsr.cost_after_buyU(1, ethers.utils.parseEther('10'))).toNumber()).to.gt(110) //100 subsidy with 10% overround
    })

    it("Checking price at baseline", async function() {
      //expect(ethers.BigNumber.from(await lslmsr.priceU(1, ethers.utils.parseEther('10'))).toNumber()).to.equal(4) //100 subsidy with 10% overround
    })
  })

  describe("Testing buy/sell", function() {
    it("Trying to buy", async function() {
      //var cost_before = (await lslmsr.costU()).toNumber()
      //await lslmsr.buyU(1, ethers.utils.parseEther('10'))
      //var cost_after = (await lslmsr.costU()).toNumber()
      //expect(cost_before).to.lt(cost_after)

    })
  })

})

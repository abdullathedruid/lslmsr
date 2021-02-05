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

    it("Creating 2000 DAI for user", async function() {
      await dai.mint(owner.address, ethers.utils.parseEther('2000'))
      expect(await dai.balanceOf(owner.address)).to.equal(ethers.utils.parseEther('2000'))
    })

    it("LS-LMSR contract deployed", async function() {
      let LSLMSR = await ethers.getContractFactory("LsLMSR");
      lslmsr = await LSLMSR.deploy(ct.address, dai.address)
    })

    it("Approve LS-LMSR to spend user money", async function() {
      await dai.approve(lslmsr.address, ethers.utils.parseEther('1500'))
      expect(await dai.allowance(owner.address, lslmsr.address)).to.equal(ethers.utils.parseEther('1500'))
    })

    it("LS-LMSR setup", async function() {
      await lslmsr.setup(owner.address, 3, ethers.utils.parseEther('1000'), 1000)

      expect(await dai.balanceOf(lslmsr.address)).to.equal(ethers.utils.parseEther('1000'))
      expect(await dai.balanceOf(owner.address)).to.equal(ethers.utils.parseEther('1000'))
    })

  })



  describe("Cost functions", function() {

    it("Checking initial cost function", async function() {
      expect(toUInt(ethers.BigNumber.from(await lslmsr.cost()))).to.equal(1100-1) //100 subsidy with 10% overround
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
      await expect(lslmsr.buy(1, fromUInt(10))).to.emit(ct, 'PositionSplit')
      expect(await ct.balanceOf(owner.address, ethers.BigNumber.from('112404126028730116228429802878362298843209268839169693949991857295994972429654')))
        .to.equal(ethers.utils.parseEther('10'))
    })
  })

  describe("Testing functions when event is over", function() {
    it("Reporting outcome for event", async function() {
      await expect(ct.reportPayouts('0x000000000000000000000000cf7ed3acca5a467e9e704c703e8d87f634fb0fc9', [0,1,0]))
        .to.emit(ct, 'ConditionResolution')
    })
    it("Checking to see if you can buy after resolution", async function() {
      await expect(lslmsr.buy(1, fromUInt(10))).to.be.revertedWith('Market already resolved')
    })
    it("Seeing if you can withdraw initial liquidity", async function() {
      console.log(ethers.utils.formatUnits(await dai.balanceOf(lslmsr.address)));
      await lslmsr.withdraw()
      console.log(ethers.utils.formatUnits(await dai.balanceOf(lslmsr.address)));
    })
  })



})

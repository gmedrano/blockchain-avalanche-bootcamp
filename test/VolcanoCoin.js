const { expect } = require("chai");

describe("Volcano Coin", function () {
  it("Balance should be equal to 10000", async function () {
    const [owner] = await ethers.getSigners();

    const myVolcanoCoin  = await ethers.getContractFactory("VolcanoCoin");

    const hardHatVolcanoCoin = await myVolcanoCoin.deploy();

    const balance = await hardHatVolcanoCoin.getTotalSupply();
    expect(await hardHatVolcanoCoin.getTotalSupply()).to.equal(10000);
  });
});
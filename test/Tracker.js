const { expect } = require("chai");
const { ethers } = require("hardhat");
const { loadFixture } = require("@nomicfoundation/hardhat-network-helpers");

describe("Tracker contract", function () {
  it("test - add a route", async function () {
  const TrackerContract = await ethers.getContractFactory("Tracker");
  const [owner, addr1, addr2] = await ethers.getSigners();
  const contract = await TrackerContract.deploy();

  const testRoute = await contract.addRoute("Route")

  console.log(testRoute)

  expect(testRoute).to.be.ok
  
  })
});

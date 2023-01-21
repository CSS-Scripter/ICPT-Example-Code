import { TestCase } from "./TestCase.js";

const COLOR_GREEN = "\x1b[32m";
const COLOR_RED = "\x1b[31m";
const COLOR_RESET = "\x1b[0m";

const testSuites = [];

export class TestSuite {
  name;
  beforeFunc = () => {};
  afterFunc = () => {};
  beforeEachFunc = () => {};
  afterEachFunc = () => {};
  tests = [];

  constructor(name) {
    this.name = name;
    testSuites.push(this);
  }

  addTest(name, testFunction) {
    this.tests.push(new TestCase(name, testFunction));
    return this;
  };

  async runTests() {
    const testResults = [];
    await new Promise(async (r) => { await this.beforeFunc(); r(); });
    for (let test of this.tests) {
      await new Promise(async (r) => { await this.beforeEachFunc(); r(); });
      await new Promise(async (r) => { await test.run(testResults); r(); });
      await new Promise(async (r) => { await this.afterEachFunc(); r(); });
    }
    await new Promise(async (r) => { await this.afterFunc(); r(); });

    let suiteOutput = "";
    let suiteSuccess = true;

    for (let { name, results } of testResults) {
      let testOutput = "";
      let testSuccess = true;
      for (let result of results) {
        if (result.failed === true) {
          testOutput += COLOR_RED + "\t" + result.message + "\n" + COLOR_RESET;
          testSuccess = false; 
          suiteSuccess = false;
        }
      }
      if (testSuccess === true) {
        suiteOutput += COLOR_GREEN + ` - [${name}] PASSED\n` + COLOR_RESET;
      } else {
        suiteOutput += COLOR_RED + ` - [${name}] FAILED\n` + testOutput + COLOR_RESET; 
      }
    }

    if (suiteSuccess === true) {
      console.log(COLOR_GREEN, `[${this.name}] PASSED\n` + suiteOutput + COLOR_RESET);
    } else {
      console.log(COLOR_RED, `[${this.name}] FAILED\n` + suiteOutput, COLOR_RESET);
    }
  };

  before(beforeFunction) {
    this.beforeFunc = beforeFunction;
    return this;
  }

  beforeEach(beforeFunction) {
    this.beforeEachFunc = beforeFunction;
    return this;
  }

  after(afterFunction) {
    this.afterFunc = afterFunction;
    return this;
  }

  afterEach(afterFunction) {
    this.afterEachFunc = afterFunction;
    return this;
  }
}

export const RunAllSuites = async () => {
  for (let testSuite of testSuites) {
    await testSuite.runTests();
  } 
}

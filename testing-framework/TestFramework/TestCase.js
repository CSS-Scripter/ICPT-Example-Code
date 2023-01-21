export class TestCase {
  name;
  testFunction;
  results = [];

  constructor(name, testFunction) {
    this.name = name;
    this.testFunction = testFunction;
  }

  async run(results) {
    await this.testFunction(this);
    results.push({
      name: this.name,
      results: this.results
    });
  }

  assertEquals(actual, expected, message = `${actual} does not equals ${expected}`) {
    if (actual != expected) {
      this.failure(message);
    } else {
      this.success();
    }
  }

  assertStrictEquals(actual, expected, message = `${actual} does not strictly equals ${expected}`) {
    if (actual !== expected) {
      this.failure(message);
    } else {
      this.success();
    }
  }

  assertTrue(actual, message = `${actual} is not true`) {
    if (actual === true) {
      this.success();
    } else {
      this.failure(message)
    }
  }

  failure(message) {
    this.results.push({
      failed: true,
      message
    })
  }

  success() {
    this.results.push({ failed: false });
  }
}


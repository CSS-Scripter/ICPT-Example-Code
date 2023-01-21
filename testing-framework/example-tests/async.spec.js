import { TestSuite } from "../TestFramework/Suite.js";

new TestSuite("Async Suite")
  .addTest("Async testcase", async (t) => {
    await new Promise(resolve => setTimeout(resolve, 500))
    t.assertTrue(true);
  })
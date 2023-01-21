import { TestSuite } from "../TestFramework/Suite.js";

new TestSuite("Failure")
  .addTest("Should Fail", (t) => t.assertEquals(1, 2));
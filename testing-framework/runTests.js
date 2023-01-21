import { RunAllSuites } from "./TestFramework/Suite.js";
import { readdirSync } from "fs";
import { join } from "path";

const walkDirectory = (directory) => {
  const specFiles = [];
  
  const files = readdirSync(directory, { withFileTypes: true });
  for (const file of files) {
    if (file.isDirectory()) {
      specFiles.push(...walkDirectory(join(directory, file.name)));
    } else {
      if (file.name.endsWith(".spec.js")) {
        specFiles.push(join(directory, file.name));
      }
    }
  }
  return specFiles;
}

const runAllSpecFiles = async () => {
  const testFiles = walkDirectory("./");

  for (let file of testFiles) {
    const safePath = `./${file.replace("\\", "/")}`
    await import(safePath);
  }

  RunAllSuites();  
}

runAllSpecFiles();

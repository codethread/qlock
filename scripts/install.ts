// eslint-disable-next-line import/no-nodejs-modules -- Install the compiled executable with atomic replacement.
import { chmod, copyFile, mkdir, mkdtemp, rename, rm } from "node:fs/promises";
// eslint-disable-next-line import/no-nodejs-modules -- Resolve paths for the local executable installation.
import { join, resolve } from "node:path";
// eslint-disable-next-line import/no-nodejs-modules -- Install under the current user's home directory.
import { homedir } from "node:os";

const executableMode = 0o755;
const directory = join(homedir(), ".local", "bin");
await mkdir(directory, { recursive: true });
const staging = await mkdtemp(join(directory, ".qlock-"));
const target = join(directory, "qlock");
try {
	const executable = join(staging, "qlock");
	await copyFile(resolve(import.meta.dirname, "../dist/qlock"), executable);
	await chmod(executable, executableMode);
	await rename(executable, target);
	console.log(`Installed ${target}`);
} finally {
	await rm(staging, { recursive: true, force: true });
}

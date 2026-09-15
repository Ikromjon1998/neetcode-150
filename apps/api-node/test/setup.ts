/**
 * Shared e2e bootstrap.
 *
 * Boots the real application through `createApp()` — the same factory `main.ts` uses — so the
 * tests exercise the production validation pipe and exception filter. This is the NestJS
 * counterpart of FastAPI's `TestClient(create_app())` and Laravel's `$this->postJson()`.
 */

import type { INestApplication } from "@nestjs/common";
import { createApp } from "../src/app.factory";

export async function bootTestApp(): Promise<INestApplication> {
  const app = await createApp({ logger: false });
  await app.init();
  return app;
}

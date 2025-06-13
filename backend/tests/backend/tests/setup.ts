import { GenericContainer } from 'testcontainers';
import { execSync } from 'child_process';

let container: any;

beforeAll(async () => {
  container = await new GenericContainer('postgres:14')
    .withEnv('POSTGRES_DB', 'testdb')
    .withEnv('POSTGRES_USER', 'test')
    .withEnv('POSTGRES_PASSWORD', 'test')
    .withExposedPorts(5432)
    .start();

  process.env.DB_HOST = container.getHost();
  process.env.DB_PORT = container.getMappedPort(5432).toString();
  process.env.DB_USER = 'test';
  process.env.DB_PASS = 'test';
  execSync('npx prisma migrate deploy', { stdio: 'inherit' });
});

afterAll(async () => {
  await container.stop();
});

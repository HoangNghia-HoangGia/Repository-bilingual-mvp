import swaggerUi from 'swagger-ui-express';
import * as openapiDocument from './docs/openapi.yaml';

app.use('/docs', swaggerUi.serve, swaggerUi.setup(openapiDocument));

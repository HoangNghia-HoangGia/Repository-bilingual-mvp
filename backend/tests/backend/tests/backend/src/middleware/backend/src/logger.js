const { createLogger, format, transports } = require('winston');
const { combine, timestamp, printf } = format;

const customFormat = printf(({ timestamp, level, message, ...meta }) => {
  return `${timestamp} [${level}] ${message} ${Object.keys(meta).length ? JSON.stringify(meta) : ''}`;
});

const logger = createLogger({
  level: 'info',
  format: combine(
    timestamp(),
    customFormat
  ),
  transports: [
    new transports.Console(),
    new transports.File({ filename: 'logs/error.log', level: 'error' })
    // additional HTTP transport to Fluentd/ELK can be added here
  ]
});

module.exports = logger;

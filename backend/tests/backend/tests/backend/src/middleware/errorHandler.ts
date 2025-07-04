import { Request, Response, NextFunction } from 'express';

export default function errorHandler(
  err: any,
  req: Request,
  res: Response,
  next: NextFunction
) {
  console.error(err);
  const status = err.status || 500;
  res.status(status).json({
    code: status,
    message: err.message || 'Internal Server Error'
  });
}

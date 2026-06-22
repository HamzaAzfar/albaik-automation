export class Logger {
  static Info(message: string): void {
    console.log(` [${new Date().toISOString()}] ${message}`);
  }

  static Warn(message: string): void {
    console.warn(` [${new Date().toISOString()}] ${message}`);
  }

  static Error(message: string, error?: Error | unknown): void {
    console.error(` [${new Date().toISOString()}] ${message}`);
    if (error) {
      if (error instanceof Error) {
        console.error(`Stack Trace: ${error.stack}`);
      } else {
        console.error(`Error Details: ${JSON.stringify(error)}`);
      }
    }
  }
}

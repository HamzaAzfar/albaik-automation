export class Logger {
    static Info(message: string): void {
        console.log(`[INFO] [${new Date().toISOString()}] ${message}`);
    }

    static Warn(message: string): void {
        console.warn(`[WARN] [${new Date().toISOString()}] ${message}`);
    }

    static Error(message: string, error?: Error | unknown): void {
        console.error(`[ERROR] [${new Date().toISOString()}] ${message}`);
        if (error) {
            if (error instanceof Error) {
                console.error(`Stack Trace: ${error.stack}`);
            } else {
                console.error(`Error Details: ${JSON.stringify(error)}`);
            }
        }
    }
}

declare module 'wdio-cucumberjs-json-reporter' {
    class cucumberJson {
        static attach(data: any, type: string): void;
    }
    export default cucumberJson;
}
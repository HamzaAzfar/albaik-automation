class DataStore {
  private static data: { [key: string]: any } = {};

  static set(key: string, value: any): void {
    this.data[key] = value;
    console.log(`✓ DataStore: Set ${key} = ${JSON.stringify(value)}`);
  }

  static get(key: string): any {
    const value = this.data[key];
    console.log(`✓ DataStore: Get ${key} = ${JSON.stringify(value)}`);
    return value;
  }

  static has(key: string): boolean {
    return key in this.data;
  }

  static clear(): void {
    this.data = {};
    console.log('✓ DataStore: Cleared all data');
  }

  static getAll(): any {
    return { ...this.data };
  }
}

export default DataStore;

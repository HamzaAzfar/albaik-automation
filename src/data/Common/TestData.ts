export const qrCodeUrls: { [key: string]: string } = {
  // Change the key here to match your Feature File
  'KTM_BRANCH': 'albaik://store/539',
};
export const TestData = {
  web: {
    baseUrl: 'https://staging.ordering.albaikcloud.com/sign_in',
    email: 'jane.doe@albaik.com',
    password: 'Kualitatem123',

  },
  mobile: {
    phoneNumber: '532255875',
    password: '11223344',
    qrCodes: qrCodeUrls,
  },
  carPickupOrder: {
    itemName: 'Car Pickup Order',
    description: 'Standard car pickup service order',
  },
  qrCodes: qrCodeUrls,
};

export const orders = {
  carPickup: {
    storeName: 'Albaik',
    serviceType: 'Car Pickup',
    expectedStatus: 'Processing',
  },
};

export default TestData;

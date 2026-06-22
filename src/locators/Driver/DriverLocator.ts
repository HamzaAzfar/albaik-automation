export const DriverLocators = {
  ReadSafetyGuidelines: '//android.widget.TextView[contains(@text, "safety guidelines")]',
  AllowForegroundPermission:
    '//android.widget.Button[contains(@resource-id, "permission_allow_foreground_only_button")]',
  JoinRestaurantQueue: '//android.widget.TextView[contains(@text, "Join restaurant queue")]',

  EditLocation: (locationName: string) => [
    `//android.view.ViewGroup[contains(@content-desc, "${locationName}")]//com.horcrux.svg.SvgView`,
  ],
  SavedLocationCard: (locationName: string) => [
    `//android.view.ViewGroup[contains(@content-desc, "${locationName}")]`,
    `//android.widget.TextView[contains(@text, "${locationName}")]`,
  ],
  SavedBuildingInfo: (locationName: string) => `//android.widget.EditText[contains(@text, "${locationName}")]`,
  SaveAndContinue: '//android.widget.TextView[contains(@text, "Save and continue")]',
  DeleteSavedLocation: '//android.widget.TextView[contains(@text, "Delete saved location")]',
  SaveCardDetails: '//android.widget.TextView[contains(@text, "Save card details")]',
  CheckoutEmail: '//android.widget.EditText[contains(@resource-id, "rm_edit_email_input")]',
  AddButton: '//android.view.ViewGroup[contains(@resource-id, "Add button")]',
  ReduceButton: '//android.view.ViewGroup[contains(@resource-id, "Reduce button")]',

  EditOrder: [
    '//android.view.ViewGroup[contains(@content-desc, "Edit order")]',
    '//android.widget.TextView[contains(@text, "Edit order")]',
  ],

  Edit: '//android.view.ViewGroup[@content-desc="Home, New home, 65"]/android.view.ViewGroup[2]/com.horcrux.svg.SvgView/com.horcrux.svg.g/Ca1[1]',

  CancelOrder: [
    '//android.view.ViewGroup[contains(@content-desc, "Cancel order")]',
    '//android.widget.TextView[contains(@text, "Cancel order")]',
  ],
  ConfirmEdit: [
    '//android.widget.TextView[contains(@text, "Confirm Edit")]',
    '//android.view.ViewGroup[contains(@content-desc, "Confirm Edit")]',
  ],
  ConfirmOrder: [
    '//android.view.ViewGroup[contains(@content-desc, "Confirm Order")]',
    '//android.widget.TextView[contains(@text, "Confirm Order")]',
  ],
  OtpInput: '(//android.widget.EditText[contains(@text, "0")])[1]',
  ProductImage: '//android.widget.ImageView',
  ProductQuantity2: "//android.widget.TextView[@text='2']",
  ProductNameSpicyFalafelNuggets: "//android.widget.TextView[@text='Spicy Falafel Nuggets']",
  DiscountTextShawerma:
    "//android.widget.TextView[@text='Spend 20.00 ﷼ to get a discounted ALBAIK Shawerma with Garlic Sauce']",
};

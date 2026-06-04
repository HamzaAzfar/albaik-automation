module.exports = {
  default: {
    require: [
      './src/stepdefinitions/Common/CommonStepMob.ts',
      './src/stepdefinitions/Common/CommonStepWeb.ts',
      './src/stepdefinitions/Common/**/*.ts',
    ],
    requireModule: ['ts-node/register'],
  },
};

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_ARMS_ARMIndexTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[ARMS] DROP CONSTRAINT FK_ARMS_ARMIndexTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Mortgage_ARMS]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Mortgage] DROP CONSTRAINT FK_Mortgage_ARMS
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Applications_ApplicationTakenMethodTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT FK_Applications_ApplicationTakenMethodTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Assets_AssetTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Assets] DROP CONSTRAINT FK_Assets_AssetTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Aliases_Borrowers]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Aliases] DROP CONSTRAINT FK_Aliases_Borrowers
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Applications_Borrowers]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT FK_Applications_Borrowers
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Assets_Borrowers]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Assets] DROP CONSTRAINT FK_Assets_Borrowers
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_BorrowerProperties_Borrowers]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[BorrowerProperties] DROP CONSTRAINT FK_BorrowerProperties_Borrowers
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Dependents_Borrowers]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Dependents] DROP CONSTRAINT FK_Dependents_Borrowers
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Employment_Borrowers]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Employment] DROP CONSTRAINT FK_Employment_Borrowers
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_FHADeclarations_Borrowers]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[FHADeclarations] DROP CONSTRAINT FK_FHADeclarations_Borrowers
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Liabilities_Borrowers]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Liabilities] DROP CONSTRAINT FK_Liabilities_Borrowers
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Residences_Borrowers]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Residences] DROP CONSTRAINT FK_Residences_Borrowers
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_VABorrower_Borrowers]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[VABorrower] DROP CONSTRAINT FK_VABorrower_Borrowers
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_SubjectProperties_BuildingStatusTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[SubjectProperties] DROP CONSTRAINT FK_SubjectProperties_BuildingStatusTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Buydowns_BuydownBaseDateTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Buydowns] DROP CONSTRAINT FK_Buydowns_BuydownBaseDateTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Buydowns_BuydownContributorTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Buydowns] DROP CONSTRAINT FK_Buydowns_BuydownContributorTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Buydowns_BuydownSubsidyCalculationTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Buydowns] DROP CONSTRAINT FK_Buydowns_BuydownSubsidyCalculationTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Mortgage_Buydowns]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Mortgage] DROP CONSTRAINT FK_Mortgage_Buydowns
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Mortgage_CaseStateTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Mortgage] DROP CONSTRAINT FK_Mortgage_CaseStateTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Borrowers_CitizenshipResidencyTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Borrowers] DROP CONSTRAINT FK_Borrowers_CitizenshipResidencyTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Borrowers_CounselingConfirmationTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Borrowers] DROP CONSTRAINT FK_Borrowers_CounselingConfirmationTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_SubjectProperties_CurrentFirstMortgageHolderTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[SubjectProperties] DROP CONSTRAINT FK_SubjectProperties_CurrentFirstMortgageHolderTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_FHADeclarations_DeclarationExplanationTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[FHADeclarations] DROP CONSTRAINT FK_FHADeclarations_DeclarationExplanationTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Applications_DownPaymentOptionTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT FK_Applications_DownPaymentOptionTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Applications_DownPaymentTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT FK_Applications_DownPaymentTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Escrows_EscrowItemTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Escrows] DROP CONSTRAINT FK_Escrows_EscrowItemTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Escrows_EscrowPaidByTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Escrows] DROP CONSTRAINT FK_Escrows_EscrowPaidByTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Escrows_EscrowPaymentFrequencyTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Escrows] DROP CONSTRAINT FK_Escrows_EscrowPaymentFrequencyTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Escrows_EscrowPremiumPaidByTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Escrows] DROP CONSTRAINT FK_Escrows_EscrowPremiumPaidByTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Escrows_EscrowPremiumPaymentTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Escrows] DROP CONSTRAINT FK_Escrows_EscrowPremiumPaymentTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Mortgage_Escrows]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Mortgage] DROP CONSTRAINT FK_Mortgage_Escrows
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Mortgage_EstimatedPrepaidDaysPaidByTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Mortgage] DROP CONSTRAINT FK_Mortgage_EstimatedPrepaidDaysPaidByTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Borrowers_FHAAlimonyLiabilityTreatmentTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Borrowers] DROP CONSTRAINT FK_Borrowers_FHAAlimonyLiabilityTreatmentTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_FNMCreditReportScoreTypes_Borrowers]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Borrowers] DROP CONSTRAINT fk_FNMCreditReportScoreTypes_Borrowers
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_RESPA_FeePaymentCollectedByTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[RESPA] DROP CONSTRAINT FK_RESPA_FeePaymentCollectedByTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_RESPA_FeePaymentPaidByTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[RESPA] DROP CONSTRAINT FK_RESPA_FeePaymentPaidByTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_RESPA_FeePaymentProcessTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[RESPA] DROP CONSTRAINT FK_RESPA_FeePaymentProcessTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_RESPA_FeeResponsiblePartyTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[RESPA] DROP CONSTRAINT FK_RESPA_FeeResponsiblePartyTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_RESPA_FeeTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[RESPA] DROP CONSTRAINT FK_RESPA_FeeTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_SubjectProperties_GSEProjectClassificationTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[SubjectProperties] DROP CONSTRAINT FK_SubjectProperties_GSEProjectClassificationTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_BorrowerProperties_GSEPropertyTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[BorrowerProperties] DROP CONSTRAINT FK_BorrowerProperties_GSEPropertyTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_SubjectProperties_GSEPropertyTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[SubjectProperties] DROP CONSTRAINT FK_SubjectProperties_GSEPropertyTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Applications_GSERefinancePurposeTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT FK_Applications_GSERefinancePurposeTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Borrowers_GenderTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Borrowers] DROP CONSTRAINT FK_Borrowers_GenderTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Borrowers_HomeownerPastThreeYearsTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Borrowers] DROP CONSTRAINT FK_Borrowers_HomeownerPastThreeYearsTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Borrowers_HousingExpenseTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Borrowers] DROP CONSTRAINT FK_Borrowers_HousingExpenseTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Employment_IncomeTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Employment] DROP CONSTRAINT FK_Employment_IncomeTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Borrowers_IntentToOccupyTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Borrowers] DROP CONSTRAINT FK_Borrowers_IntentToOccupyTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Applications_Interviewers]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT FK_Applications_Interviewers
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Applications_JointAssetLiabilityReportingTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT FK_Applications_JointAssetLiabilityReportingTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Liabilities_LiabilityTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Liabilities] DROP CONSTRAINT FK_Liabilities_LiabilityTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Mortgage_LienPriorityTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Mortgage] DROP CONSTRAINT FK_Mortgage_LienPriorityTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Mortgage_LoanAmortizationTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Mortgage] DROP CONSTRAINT FK_Mortgage_LoanAmortizationTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Applications_LoanDocumentationTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT FK_Applications_LoanDocumentationTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Applications_LoanPurposeTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT FK_Applications_LoanPurposeTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Mortgage_LoanRepaymentTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Mortgage] DROP CONSTRAINT FK_Mortgage_LoanRepaymentTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_MortgageInsurance_MICompanyNameTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[MortgageInsurance] DROP CONSTRAINT FK_MortgageInsurance_MICompanyNameTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_MortgageInsurance_MIDurationTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[MortgageInsurance] DROP CONSTRAINT FK_MortgageInsurance_MIDurationTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_MortgageInsurance_MILTVCutoffTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[MortgageInsurance] DROP CONSTRAINT FK_MortgageInsurance_MILTVCutoffTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_MortgageInsurance_MIPremiumRefundableTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[MortgageInsurance] DROP CONSTRAINT FK_MortgageInsurance_MIPremiumRefundableTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_MortgageInsurance_MIPremiumTaxCodeTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[MortgageInsurance] DROP CONSTRAINT FK_MortgageInsurance_MIPremiumTaxCodeTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_MortgageInsurance_MIRenewalCalculationTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[MortgageInsurance] DROP CONSTRAINT FK_MortgageInsurance_MIRenewalCalculationTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_MortgageInsurance_MIRenewalPremiumSequences]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[MortgageInsurance] DROP CONSTRAINT FK_MortgageInsurance_MIRenewalPremiumSequences
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Borrowers_MaritalStatusTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Borrowers] DROP CONSTRAINT FK_Borrowers_MaritalStatusTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Applications_Mortgage]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT FK_Applications_Mortgage
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Mortgage_MortgageInsurance]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Mortgage] DROP CONSTRAINT FK_Mortgage_MortgageInsurance
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Mortgage_MortgageScoreTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Mortgage] DROP CONSTRAINT FK_Mortgage_MortgageScoreTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Mortgage_MortgageTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Mortgage] DROP CONSTRAINT FK_Mortgage_MortgageTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_PaymentAdjustments_PaymentAdjustmentCalculationTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[PaymentAdjustments] DROP CONSTRAINT FK_PaymentAdjustments_PaymentAdjustmentCalculationTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Mortgage_PaymentAdjustments]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Mortgage] DROP CONSTRAINT FK_Mortgage_PaymentAdjustments
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Mortgage_PaymentFrequencyTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Mortgage] DROP CONSTRAINT FK_Mortgage_PaymentFrequencyTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Applications_PrintPositionTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT FK_Applications_PrintPositionTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_BorrowerProperties_PriorPropertyTitleTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[BorrowerProperties] DROP CONSTRAINT FK_BorrowerProperties_PriorPropertyTitleTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_BorrowerProperties_PriorPropertyUsageTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[BorrowerProperties] DROP CONSTRAINT FK_BorrowerProperties_PriorPropertyUsageTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_BorrowerProperties_PropertyDispositionStatusTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[BorrowerProperties] DROP CONSTRAINT FK_BorrowerProperties_PropertyDispositionStatusTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_SubjectProperties_PropertyLegalDescriptionTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[SubjectProperties] DROP CONSTRAINT FK_SubjectProperties_PropertyLegalDescriptionTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_SubjectProperties_PropertyRightsTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[SubjectProperties] DROP CONSTRAINT FK_SubjectProperties_PropertyRightsTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_BorrowerProperties_PropertyUsageTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[BorrowerProperties] DROP CONSTRAINT FK_BorrowerProperties_PropertyUsageTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Applications_PurchaseCreditSourceTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT FK_Applications_PurchaseCreditSourceTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Applications_PurchaseCreditTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT FK_Applications_PurchaseCreditTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Applications_RESPA]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT FK_Applications_RESPA
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Borrowers_RaceNationalOriginTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Borrowers] DROP CONSTRAINT FK_Borrowers_RaceNationalOriginTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Mortgage_RateAdjustmentCalculationTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Mortgage] DROP CONSTRAINT FK_Mortgage_RateAdjustmentCalculationTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Applications_RefinanceImprovementTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT FK_Applications_RefinanceImprovementTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_BasisTypeID_Residence]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Residences] DROP CONSTRAINT fk_BasisTypeID_Residence
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Residences_ResidencyTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Residences] DROP CONSTRAINT FK_Residences_ResidencyTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[fk_SalesPriceExceedsAppraisedValue]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT fk_SalesPriceExceedsAppraisedValue
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_RESPA_SectionClassificationTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[RESPA] DROP CONSTRAINT FK_RESPA_SectionClassificationTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Applications_SectionOfActTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT FK_Applications_SectionOfActTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Applications_SubjectProperties]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT FK_Applications_SubjectProperties
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Mortgage_SummaryAmountTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Mortgage] DROP CONSTRAINT FK_Mortgage_SummaryAmountTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Applications_VABorrowerCertificationOccupancyTypes]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Applications] DROP CONSTRAINT FK_Applications_VABorrowerCertificationOccupancyTypes
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_VABorrower_VACoBorrower]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[VABorrower] DROP CONSTRAINT FK_VABorrower_VACoBorrower
GO

/****** Object:  Table [dbo].[ARMIndexTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ARMIndexTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ARMIndexTypes]
GO

/****** Object:  Table [dbo].[ARMS]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ARMS]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ARMS]
GO

/****** Object:  Table [dbo].[Aliases]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Aliases]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Aliases]
GO

/****** Object:  Table [dbo].[ApplicationTakenMethodTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ApplicationTakenMethodTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ApplicationTakenMethodTypes]
GO

/****** Object:  Table [dbo].[Applications]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Applications]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Applications]
GO

/****** Object:  Table [dbo].[AssetTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[AssetTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[AssetTypes]
GO

/****** Object:  Table [dbo].[Assets]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Assets]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Assets]
GO

/****** Object:  Table [dbo].[BorrowerProperties]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BorrowerProperties]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BorrowerProperties]
GO

/****** Object:  Table [dbo].[Borrowers]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Borrowers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Borrowers]
GO

/****** Object:  Table [dbo].[BuildingStatusTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BuildingStatusTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BuildingStatusTypes]
GO

/****** Object:  Table [dbo].[BuydownBaseDateTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BuydownBaseDateTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BuydownBaseDateTypes]
GO

/****** Object:  Table [dbo].[BuydownContributorTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BuydownContributorTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BuydownContributorTypes]
GO

/****** Object:  Table [dbo].[BuydownSubsidyCalculationTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[BuydownSubsidyCalculationTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[BuydownSubsidyCalculationTypes]
GO

/****** Object:  Table [dbo].[Buydowns]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Buydowns]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Buydowns]
GO

/****** Object:  Table [dbo].[CaseStateTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CaseStateTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CaseStateTypes]
GO

/****** Object:  Table [dbo].[CitizenshipResidencyTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CitizenshipResidencyTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CitizenshipResidencyTypes]
GO

/****** Object:  Table [dbo].[CounselingConfirmationTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CounselingConfirmationTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CounselingConfirmationTypes]
GO

/****** Object:  Table [dbo].[CurrentFirstMortgageHolderTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CurrentFirstMortgageHolderTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[CurrentFirstMortgageHolderTypes]
GO

/****** Object:  Table [dbo].[DeclarationExplanationTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DeclarationExplanationTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DeclarationExplanationTypes]
GO

/****** Object:  Table [dbo].[Dependents]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Dependents]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Dependents]
GO

/****** Object:  Table [dbo].[DownPaymentOptionTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DownPaymentOptionTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DownPaymentOptionTypes]
GO

/****** Object:  Table [dbo].[DownPaymentTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[DownPaymentTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[DownPaymentTypes]
GO

/****** Object:  Table [dbo].[Employment]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Employment]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Employment]
GO

/****** Object:  Table [dbo].[EscrowItemTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EscrowItemTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EscrowItemTypes]
GO

/****** Object:  Table [dbo].[EscrowPaidByTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EscrowPaidByTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EscrowPaidByTypes]
GO

/****** Object:  Table [dbo].[EscrowPaymentFrequencyTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EscrowPaymentFrequencyTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EscrowPaymentFrequencyTypes]
GO

/****** Object:  Table [dbo].[EscrowPremiumPaidByTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EscrowPremiumPaidByTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EscrowPremiumPaidByTypes]
GO

/****** Object:  Table [dbo].[EscrowPremiumPaymentTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EscrowPremiumPaymentTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EscrowPremiumPaymentTypes]
GO

/****** Object:  Table [dbo].[Escrows]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Escrows]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Escrows]
GO

/****** Object:  Table [dbo].[EstimatedPrepaidDaysPaidByTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[EstimatedPrepaidDaysPaidByTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[EstimatedPrepaidDaysPaidByTypes]
GO

/****** Object:  Table [dbo].[FHAAlimonyLiabilityTreatmentTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FHAAlimonyLiabilityTreatmentTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FHAAlimonyLiabilityTreatmentTypes]
GO

/****** Object:  Table [dbo].[FHADeclarations]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FHADeclarations]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FHADeclarations]
GO

/****** Object:  Table [dbo].[FNMCreditReportScoreTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FNMCreditReportScoreTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FNMCreditReportScoreTypes]
GO

/****** Object:  Table [dbo].[FeePaymentCollectedByTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FeePaymentCollectedByTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FeePaymentCollectedByTypes]
GO

/****** Object:  Table [dbo].[FeePaymentPaidByTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FeePaymentPaidByTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FeePaymentPaidByTypes]
GO

/****** Object:  Table [dbo].[FeePaymentProcessTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FeePaymentProcessTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FeePaymentProcessTypes]
GO

/****** Object:  Table [dbo].[FeeResponsiblePartyTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FeeResponsiblePartyTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FeeResponsiblePartyTypes]
GO

/****** Object:  Table [dbo].[FeeTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FeeTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FeeTypes]
GO

/****** Object:  Table [dbo].[GSEProjectClassificationTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GSEProjectClassificationTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[GSEProjectClassificationTypes]
GO

/****** Object:  Table [dbo].[GSEPropertyTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GSEPropertyTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[GSEPropertyTypes]
GO

/****** Object:  Table [dbo].[GSERefinancePurposeTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GSERefinancePurposeTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[GSERefinancePurposeTypes]
GO

/****** Object:  Table [dbo].[GenderTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GenderTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[GenderTypes]
GO

/****** Object:  Table [dbo].[GovernmentRefinanceTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GovernmentRefinanceTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[GovernmentRefinanceTypes]
GO

/****** Object:  Table [dbo].[HomeownerPastThreeYearsTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[HomeownerPastThreeYearsTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[HomeownerPastThreeYearsTypes]
GO

/****** Object:  Table [dbo].[HousingExpenseTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[HousingExpenseTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[HousingExpenseTypes]
GO

/****** Object:  Table [dbo].[IncomeTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IncomeTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[IncomeTypes]
GO

/****** Object:  Table [dbo].[IntentToOccupyTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[IntentToOccupyTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[IntentToOccupyTypes]
GO

/****** Object:  Table [dbo].[Interviewers]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Interviewers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Interviewers]
GO

/****** Object:  Table [dbo].[JointAssetLiabilityReportingTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[JointAssetLiabilityReportingTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[JointAssetLiabilityReportingTypes]
GO

/****** Object:  Table [dbo].[Liabilities]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Liabilities]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Liabilities]
GO

/****** Object:  Table [dbo].[LiabilityTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LiabilityTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LiabilityTypes]
GO

/****** Object:  Table [dbo].[LienPriorityTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LienPriorityTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LienPriorityTypes]
GO

/****** Object:  Table [dbo].[LoanAmortizationTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LoanAmortizationTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LoanAmortizationTypes]
GO

/****** Object:  Table [dbo].[LoanDocumentationTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LoanDocumentationTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LoanDocumentationTypes]
GO

/****** Object:  Table [dbo].[LoanPurposeTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LoanPurposeTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LoanPurposeTypes]
GO

/****** Object:  Table [dbo].[LoanRepaymentTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[LoanRepaymentTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[LoanRepaymentTypes]
GO

/****** Object:  Table [dbo].[MICompanyNameTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MICompanyNameTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MICompanyNameTypes]
GO

/****** Object:  Table [dbo].[MIDurationTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MIDurationTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MIDurationTypes]
GO

/****** Object:  Table [dbo].[MILTVCutoffTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MILTVCutoffTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MILTVCutoffTypes]
GO

/****** Object:  Table [dbo].[MIPremiumRefundableTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MIPremiumRefundableTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MIPremiumRefundableTypes]
GO

/****** Object:  Table [dbo].[MIPremiumTaxCodeTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MIPremiumTaxCodeTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MIPremiumTaxCodeTypes]
GO

/****** Object:  Table [dbo].[MIRenewalCalculationTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MIRenewalCalculationTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MIRenewalCalculationTypes]
GO

/****** Object:  Table [dbo].[MIRenewalPremiumSequences]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MIRenewalPremiumSequences]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MIRenewalPremiumSequences]
GO

/****** Object:  Table [dbo].[MaritalStatusTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MaritalStatusTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MaritalStatusTypes]
GO

/****** Object:  Table [dbo].[Mortgage]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Mortgage]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Mortgage]
GO

/****** Object:  Table [dbo].[MortgageInsurance]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MortgageInsurance]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MortgageInsurance]
GO

/****** Object:  Table [dbo].[MortgageScoreTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MortgageScoreTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MortgageScoreTypes]
GO

/****** Object:  Table [dbo].[MortgageTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MortgageTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MortgageTypes]
GO

/****** Object:  Table [dbo].[PaymentAdjustmentCalculationTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PaymentAdjustmentCalculationTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PaymentAdjustmentCalculationTypes]
GO

/****** Object:  Table [dbo].[PaymentAdjustments]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PaymentAdjustments]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PaymentAdjustments]
GO

/****** Object:  Table [dbo].[PaymentFrequencyTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PaymentFrequencyTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PaymentFrequencyTypes]
GO

/****** Object:  Table [dbo].[PrintPositionTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PrintPositionTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PrintPositionTypes]
GO

/****** Object:  Table [dbo].[PriorPropertyTitleTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PriorPropertyTitleTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PriorPropertyTitleTypes]
GO

/****** Object:  Table [dbo].[PriorPropertyUsageTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PriorPropertyUsageTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PriorPropertyUsageTypes]
GO

/****** Object:  Table [dbo].[PropertyDispositionStatusTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PropertyDispositionStatusTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PropertyDispositionStatusTypes]
GO

/****** Object:  Table [dbo].[PropertyLegalDescriptionTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PropertyLegalDescriptionTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PropertyLegalDescriptionTypes]
GO

/****** Object:  Table [dbo].[PropertyRightsTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PropertyRightsTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PropertyRightsTypes]
GO

/****** Object:  Table [dbo].[PropertyUsageTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PropertyUsageTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PropertyUsageTypes]
GO

/****** Object:  Table [dbo].[PurchaseCreditSourceTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PurchaseCreditSourceTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PurchaseCreditSourceTypes]
GO

/****** Object:  Table [dbo].[PurchaseCreditTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[PurchaseCreditTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[PurchaseCreditTypes]
GO

/****** Object:  Table [dbo].[RESPA]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RESPA]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RESPA]
GO

/****** Object:  Table [dbo].[RaceNationalOriginTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RaceNationalOriginTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RaceNationalOriginTypes]
GO

/****** Object:  Table [dbo].[RateAdjustmentCalculationTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RateAdjustmentCalculationTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RateAdjustmentCalculationTypes]
GO

/****** Object:  Table [dbo].[RefinanceImprovementTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RefinanceImprovementTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RefinanceImprovementTypes]
GO

/****** Object:  Table [dbo].[Residences]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Residences]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Residences]
GO

/****** Object:  Table [dbo].[ResidencyBasisTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ResidencyBasisTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ResidencyBasisTypes]
GO

/****** Object:  Table [dbo].[ResidencyTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[ResidencyTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[ResidencyTypes]
GO

/****** Object:  Table [dbo].[SalesPriceExceedsAppraisedValueTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SalesPriceExceedsAppraisedValueTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SalesPriceExceedsAppraisedValueTypes]
GO

/****** Object:  Table [dbo].[SectionClassificationTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SectionClassificationTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SectionClassificationTypes]
GO

/****** Object:  Table [dbo].[SectionOfActTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SectionOfActTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SectionOfActTypes]
GO

/****** Object:  Table [dbo].[SubjectProperties]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SubjectProperties]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SubjectProperties]
GO

/****** Object:  Table [dbo].[SummaryAmountTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[SummaryAmountTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[SummaryAmountTypes]
GO

/****** Object:  Table [dbo].[VABorrower]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VABorrower]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[VABorrower]
GO

/****** Object:  Table [dbo].[VABorrowerCertificationOccupancyTypes]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VABorrowerCertificationOccupancyTypes]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[VABorrowerCertificationOccupancyTypes]
GO

/****** Object:  Table [dbo].[VACoBorrower]    Script Date: 12/28/2004 2:37:52 PM ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[VACoBorrower]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[VACoBorrower]
GO

/****** Object:  Table [dbo].[ARMIndexTypes]    Script Date: 12/28/2004 2:37:58 PM ******/
CREATE TABLE [dbo].[ARMIndexTypes] (
	[ARMIndexTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[ARMIndexType] [varchar] (85) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ARMITDescription] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ARMS]    Script Date: 12/28/2004 2:37:58 PM ******/
CREATE TABLE [dbo].[ARMS] (
	[ARMSID] [int] IDENTITY (1, 1) NOT NULL ,
	[fk_ARMIndexTypeID] [int] NOT NULL ,
	[ARMQualifyingRatePercent] [decimal](8, 7) NULL ,
	[ARMConversionOptionIndicator] [bit] NULL ,
	[ARMIndexCurrentValuePercent] [decimal](8, 7) NULL ,
	[ARMIndexMarginPercent] [decimal](8, 7) NULL ,
	[ARMTypeDescription] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Aliases]    Script Date: 12/28/2004 2:37:58 PM ******/
CREATE TABLE [dbo].[Aliases] (
	[AliasID] [int] IDENTITY (1, 1) NOT NULL ,
	[fk_BorrowerID] [int] NOT NULL ,
	[AccountIdentifier] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CreditorName] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FirstName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MiddleName] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ApplicationTakenMethodTypes]    Script Date: 12/28/2004 2:37:58 PM ******/
CREATE TABLE [dbo].[ApplicationTakenMethodTypes] (
	[ApplicationTakenMethodTypesID] [int] IDENTITY (1, 1) NOT NULL ,
	[ApplicationTakenMethodType] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ATMDescription] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Applications]    Script Date: 12/28/2004 2:37:58 PM ******/
CREATE TABLE [dbo].[Applications] (
	[ApplicationsID] [int] IDENTITY (1, 1) NOT NULL ,
	[fk_BorrowerID] [int] NOT NULL ,
	[fk_MortgageID] [int] NOT NULL ,
	[fk_SubjectPropertiesID] [int] NOT NULL ,
	[fk_DownPaymentOptionTypesID] [int] NOT NULL ,
	[fk_InterviewsID] [int] NOT NULL ,
	[fk_LoanDocumentationTypesID] [int] NOT NULL ,
	[fk_LoanPurposeTypesID] [int] NOT NULL ,
	[fk_PurchaseCreditSourceTypesID] [int] NOT NULL ,
	[fk_PurchaseCreditTypesID] [int] NOT NULL ,
	[fk_ReFinanceImprovementTypesID] [int] NOT NULL ,
	[fk_RespaID] [int] NOT NULL ,
	[fk_SectionOfActTypesID] [int] NOT NULL ,
	[fk_VABorrowerCertificationOccupancyTYpesID] [int] NOT NULL ,
	[fk_GovernmentRefinanceTypesID] [int] NOT NULL ,
	[fk_GSERefinancePurposeTypesID] [int] NOT NULL ,
	[fk_JointAssetLiabilityReportingTypesID] [int] NOT NULL ,
	[fk_ApplicationTakenMethodTypeID] [int] NOT NULL ,
	[fk_PrintPositionTypesID] [int] NOT NULL ,
	[fk_SalesPriceExceedsAppraisedValueTypeID] [int] NOT NULL ,
	[BelowMarketSubordinateFinancingIndicator] [bit] NULL ,
	[BorrowerFinancedFHADiscountPointsAmount] [money] NULL ,
	[BorrowerFundingFeePercent] [decimal](4, 2) NULL ,
	[BorrowerPaidDiscountPointsTotalAmount] [money] NULL ,
	[BorrowerPaidFHAVAClosingCostsAmount] [money] NULL ,
	[BorrowerPaidFHAVAClosingCostsPercent] [decimal](4, 2) NULL ,
	[CAVIRSIdentifier] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CounselingConfirmationIndicator] [bit] NOT NULL ,
	[DataVersionName] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DataVersionNumber] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DeclarationExplanationDescription] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DownPaymentAmount] [money] NULL ,
	[DownPaymentSourceDescription] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FHACoverageRenewalRatePercent] [decimal](8, 7) NULL ,
	[FHAEnergyRelatedRepairsOrImprovementsAmount] [money] NULL ,
	[FHAGeneralServicesAdministrationCodeIdentifier] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FHALimitedDenialParticipationIdentifier] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FHAMIPremiumRefundAmount] [money] NULL ,
	[FHARefinanceInterestOnExistingLienAmount] [money] NULL ,
	[FHARefinanceOriginalExistingFHACaseIdentifier] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FHARefinanceOriginalExistingUpfrontMIPAmount] [money] NULL ,
	[FHAUpfrontMIPremiumPercent] [decimal](4, 2) NULL ,
	[FHAVALoanOriginatorIdentifier] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FNMNeighborsMortgageEligibilityIndicator] [bit] NOT NULL ,
	[FNMProductPlanIdentifier] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FRECashOutAmount] [money] NULL ,
	[FREOfferingIdentifier] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[HUDIncomeLimitAdjustmentFactor] [decimal](4, 2) NULL ,
	[HUDLendingIncomeLimitAmount] [money] NULL ,
	[HUDMedianIncomeAmount] [money] NULL ,
	[LoanEstimatedClosingDate] [smalldatetime] NULL ,
	[LoanScheduledClosingDate] [smalldatetime] NULL ,
	[OtherLoanPurposeDescription] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OtherPartyPaidFHAVAClosingCostsAmount] [money] NULL ,
	[OtherPartyPaidFHAVAClosingCostsPercent] [decimal](4, 2) NULL ,
	[PrepaidItemsEstimatedAmount] [money] NULL ,
	[PurchaseCreditAmount] [money] NULL ,
	[PurchasePriceAmount] [money] NULL ,
	[RefinanceImprovementCostsAmount] [money] NULL ,
	[RefinanceIncludingDebtsToBePaidOffAmount] [money] NULL ,
	[RefinanceProposedImprovementsDescription] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[RefundableApplicationFeeIndicator] [bit] NOT NULL ,
	[RequestedInterestRatePercent] [decimal](8, 7) NULL ,
	[RequiredDepositIndicator] [bit] NOT NULL ,
	[SalesConcessionAmount] [money] NULL ,
	[SellerPaidClosingCostsAmount] [money] NULL ,
	[SellerPaidFHAVAClosingCostsPercent] [decimal](4, 2) NULL ,
	[fk_DownPaymentTypeID] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[AssetTypes]    Script Date: 12/28/2004 2:37:59 PM ******/
CREATE TABLE [dbo].[AssetTypes] (
	[AssetTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[AssetType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ATDescription] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Assets]    Script Date: 12/28/2004 2:37:59 PM ******/
CREATE TABLE [dbo].[Assets] (
	[AssetID] [int] IDENTITY (1, 1) NOT NULL ,
	[fk_AssetTypeID] [int] NOT NULL ,
	[fk_BorrowerID] [int] NOT NULL ,
	[AdditionalBorrowerAssetsConsideredIndicator] [bit] NULL ,
	[AdditionalBorrowerAssetsNotConsideredIndicator] [bit] NULL ,
	[AssetAccountIdentifier] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AssetCashOrMarketValueAmount] [money] NULL ,
	[AssetHolderCity] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AssetHolderName] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AssetHolderPostalCode] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AssetHolderState] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AssetHolderStreetAddress] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AutomobileMakeDescription] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AutomobileModelYear] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LifeInsuranceFaceValueAmount] [money] NULL ,
	[StockBondMutualFundShareCount] [smallint] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BorrowerProperties]    Script Date: 12/28/2004 2:37:59 PM ******/
CREATE TABLE [dbo].[BorrowerProperties] (
	[BorrowerPropertyID] [int] IDENTITY (1, 1) NOT NULL ,
	[fk_SubjectPropertyID] [int] NOT NULL ,
	[fk_BorrowerID] [int] NOT NULL ,
	[fk_PriorPropertyTitleTypeID] [int] NOT NULL ,
	[fk_PriorPropertyUsageTypeID] [int] NOT NULL ,
	[fk_PropertyUsageTypeID] [int] NOT NULL ,
	[fk_PropertyDispositionStatusTypeID] [int] NOT NULL ,
	[fk_GSEPropertyTypeID] [int] NOT NULL ,
	[City] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CurrentResidenceIndicator] [bit] NULL ,
	[LienInstallmentAmount] [money] NULL ,
	[LienUPBAmount] [money] NULL ,
	[MaintenanceExpenseAmount] [money] NULL ,
	[MarketValueAmount] [money] NULL ,
	[PostalCode] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[RentalIncomeGrossAmount] [money] NULL ,
	[RentalIncomeNetAmount] [money] NULL ,
	[State] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[StreetAddress] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SubjectIndicator] [bit] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Borrowers]    Script Date: 12/28/2004 2:37:59 PM ******/
CREATE TABLE [dbo].[Borrowers] (
	[BorrowerID] [int] IDENTITY (1, 1) NOT NULL ,
	[fk_CounselingConfirmationTypeID] [int] NOT NULL ,
	[fk_GenderTypeID] [int] NOT NULL ,
	[fk_CitizenshipResidencyTypeID] [int] NOT NULL ,
	[fk_HomeownerPastThreeYearsTypeID] [int] NOT NULL ,
	[fk_MaritalStatusTypeID] [int] NOT NULL ,
	[fk_HousingExpenseTypeID] [int] NOT NULL ,
	[fk_IntentToOccupyTypeID] [int] NOT NULL ,
	[fk_RaceNationalOrginTypeID] [int] NOT NULL ,
	[fk_FHAAlimonyLiabilityTreatmentTypeID] [int] NOT NULL ,
	[fk_FNMCreditReportScoreTypeID] [int] NOT NULL ,
	[BankruptcyIndicator] [bit] NULL ,
	[BorrowedDownPaymentIndicator] [bit] NULL ,
	[AgeAtApplicationYears] [smallint] NULL ,
	[ApplicationSignedDate] [smalldatetime] NULL ,
	[BirthDate] [smalldatetime] NULL ,
	[FirstName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[BorrowerFirstTimeHomebuyerIndicator] [bit] NULL ,
	[HomeTelephoneNumber] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MiddleName] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NameSuffix] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NearestLivingRelativeCity] [varchar] (54) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NearestLivingRelativeName] [varchar] (44) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NearestLivingRelativePostalCode] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NearestLivingRelativeRelationshipDescription] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NearestLivingRelativeState] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NearestLivingRelativeStreetAddress] [varchar] (44) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NearestLivingRelativeStreetAddress2] [varchar] (44) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NearestLivingRelativeTelephoneNumber] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[SSN] [char] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[UnparsedName] [varchar] (125) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[CoMakerEndorserOfNoteIndicator] [bit] NULL ,
	[FNMBankruptcyCount] [tinyint] NULL ,
	[FNMBorrowerCreditRating] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[GovernmentMortgageCreditCertificateAmount] [money] NULL ,
	[HUDAdequateAvailableAssetsIndicator] [bit] NULL ,
	[HUDAdequateEffectiveIncomeIndicator] [bit] NULL ,
	[HUDCreditCharacteristicsIndicator] [bit] NULL ,
	[HUDStableEffectiveIncomeIndicator] [bit] NULL ,
	[LandlordCity] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LandlordName] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LandlordPostalCode] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LandlordState] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LandlordStreetAddress] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LandlordStreetAddress2] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LoanForeclosureOrJudgmentIndicator] [bit] NULL ,
	[OtherAssetTypeDescription] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OtherRaceNationalOriginDescription] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OutstandingJudgmentsIndicator] [bit] NULL ,
	[PartyToLawsuitIndicator] [bit] NULL ,
	[PresentHousingExpensePaymentAmount] [money] NULL ,
	[PresentlyDelinquentIndicator] [bit] NULL ,
	[ProposedHousingExpensePaymentAmount] [money] NULL ,
	[RaceNationalOriginRefusalIndicator] [bit] NULL ,
	[SchoolingYears] [smallint] NULL ,
	[SelfEmploymentIncomeIndicator] [bit] NULL ,
	[PropertyForeclosurePastSevenYearsIndicator] [bit] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BuildingStatusTypes]    Script Date: 12/28/2004 2:37:59 PM ******/
CREATE TABLE [dbo].[BuildingStatusTypes] (
	[BuildingStatusTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[BuildingStatusType] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BuydownBaseDateTypes]    Script Date: 12/28/2004 2:37:59 PM ******/
CREATE TABLE [dbo].[BuydownBaseDateTypes] (
	[BuydownBaseDateTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[BuydownBaseDateType] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BuydownContributorTypes]    Script Date: 12/28/2004 2:38:00 PM ******/
CREATE TABLE [dbo].[BuydownContributorTypes] (
	[BuydownContributorTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[BuydownContributorType] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[BCTDescription] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[BuydownSubsidyCalculationTypes]    Script Date: 12/28/2004 2:38:00 PM ******/
CREATE TABLE [dbo].[BuydownSubsidyCalculationTypes] (
	[BuydownSubsidyCalculationTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[BuydownSubsidyCalculationType] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Buydowns]    Script Date: 12/28/2004 2:38:00 PM ******/
CREATE TABLE [dbo].[Buydowns] (
	[BuydownID] [int] IDENTITY (1, 1) NOT NULL ,
	[fk_BuydownBaseDateType] [int] NOT NULL ,
	[fk_BuydownContributorTypeID] [int] NOT NULL ,
	[fk_BuydownSubsidyCalculationTypeID] [int] NOT NULL ,
	[ChangeFrequencyMonths] [smallint] NULL ,
	[BuydownContributorTypeOtherDescription] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DurationMonths] [smallint] NULL ,
	[IncreaseRatePercent] [decimal](4, 2) NULL ,
	[LenderFundingIndicator] [bit] NULL ,
	[BuydownOriginalBalanceAmount] [money] NULL ,
	[PermanentIndicator] [bit] NULL ,
	[RatePercent] [decimal](8, 7) NULL ,
	[BuydownSubsidySchedulePeriodicPaymentEffectiveDate] [smalldatetime] NULL ,
	[BuydownSubsidySchedulePeriodicPaymentSubsidyAmount] [money] NULL ,
	[BuydownSubsidySchedulePeriodicTerm] [smallint] NULL ,
	[BuydownSubsidySchedulePeriodIdentifier] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CaseStateTypes]    Script Date: 12/28/2004 2:38:00 PM ******/
CREATE TABLE [dbo].[CaseStateTypes] (
	[CaseStateTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[CaseStateType] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CSTDescription] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CitizenshipResidencyTypes]    Script Date: 12/28/2004 2:38:00 PM ******/
CREATE TABLE [dbo].[CitizenshipResidencyTypes] (
	[CitizenshipResidencyTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[CitizenshipResidencyType] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CounselingConfirmationTypes]    Script Date: 12/28/2004 2:38:00 PM ******/
CREATE TABLE [dbo].[CounselingConfirmationTypes] (
	[CounselingConfirmationTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[CounselingConfirmationType] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[CurrentFirstMortgageHolderTypes]    Script Date: 12/28/2004 2:38:00 PM ******/
CREATE TABLE [dbo].[CurrentFirstMortgageHolderTypes] (
	[CurrentFirstMortgageHolderTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[CurrentFirstMortgageHolderType] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[CFMHTDescription] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DeclarationExplanationTypes]    Script Date: 12/28/2004 2:38:00 PM ******/
CREATE TABLE [dbo].[DeclarationExplanationTypes] (
	[DeclarationExplanationTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[DeclarationExplanationType] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Dependents]    Script Date: 12/28/2004 2:38:00 PM ******/
CREATE TABLE [dbo].[Dependents] (
	[DependentsID] [int] IDENTITY (1, 1) NOT NULL ,
	[fk_BorrowerID] [int] NOT NULL ,
	[DependentAgeYears] [smallint] NULL ,
	[DependentCount] [tinyint] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DownPaymentOptionTypes]    Script Date: 12/28/2004 2:38:01 PM ******/
CREATE TABLE [dbo].[DownPaymentOptionTypes] (
	[DownPaymentOptionTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[DownPaymentOptionType] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DownPaymentTypes]    Script Date: 12/28/2004 2:38:01 PM ******/
CREATE TABLE [dbo].[DownPaymentTypes] (
	[DownPaymentTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[DownPaymentType] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Employment]    Script Date: 12/28/2004 2:38:01 PM ******/
CREATE TABLE [dbo].[Employment] (
	[EmploymentID] [int] IDENTITY (1, 1) NOT NULL ,
	[fk_BorrowerID] [int] NOT NULL ,
	[fk_IncomeTypeID] [int] NOT NULL ,
	[MonthsOnJob] [smallint] NULL ,
	[TimeInLineOfWorkYears] [smallint] NULL ,
	[YearsOnJob] [smallint] NULL ,
	[CurrentIncomeMonthlyTotalAmount] [money] NULL ,
	[EmployerCity] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[EmployerName] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[EmployerPostalCode] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[EmployerState] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[EmployerStreetAddress] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[EmployerTelephoneNumber] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[EmploymentBorrowerSelfEmployedIndicator] [bit] NULL ,
	[EmploymentCurrentIndicator] [bit] NULL ,
	[EmploymentPositionDescription] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[EmploymentPrimaryIndicator] [bit] NULL ,
	[IncomeEmploymentMonthlyAmount] [money] NULL ,
	[PreviousEmploymentEndDate] [smalldatetime] NULL ,
	[PreviousEmploymentStartDate] [smalldatetime] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[EscrowItemTypes]    Script Date: 12/28/2004 2:38:01 PM ******/
CREATE TABLE [dbo].[EscrowItemTypes] (
	[EscrowItemTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[EscrowItemType] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[EscrowPaidByTypes]    Script Date: 12/28/2004 2:38:01 PM ******/
CREATE TABLE [dbo].[EscrowPaidByTypes] (
	[EscrowPaidByTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[EscrowPaidByType] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[EscrowPaymentFrequencyTypes]    Script Date: 12/28/2004 2:38:01 PM ******/
CREATE TABLE [dbo].[EscrowPaymentFrequencyTypes] (
	[EscrowPaymentFrequencyTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[EscrowPaymentFrequencyType] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[EscrowPremiumPaidByTypes]    Script Date: 12/28/2004 2:38:01 PM ******/
CREATE TABLE [dbo].[EscrowPremiumPaidByTypes] (
	[EscrowPremiumPaidByTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[EscrowPremiumPaidByType] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[EscrowPremiumPaymentTypes]    Script Date: 12/28/2004 2:38:01 PM ******/
CREATE TABLE [dbo].[EscrowPremiumPaymentTypes] (
	[EscrowPremiumPaymentTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[EscrowPremiumPaymentType] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Escrows]    Script Date: 12/28/2004 2:38:02 PM ******/
CREATE TABLE [dbo].[Escrows] (
	[EscrowID] [int] IDENTITY (1, 1) NOT NULL ,
	[fk_EscrowPaymentFrequencyType] [int] NOT NULL ,
	[fk_EscrowItemType] [int] NOT NULL ,
	[fk_EscrowPaidByType] [int] NOT NULL ,
	[fk_EscrowPremiumPaymentType] [int] NOT NULL ,
	[fk_EscrowPremiumPaidByTypes] [int] NOT NULL ,
	[EscrowAggregateAccountingAdjustmentAmount] [money] NULL ,
	[EscrowAnnualPaymentAmount] [money] NULL ,
	[EscrowCollectedNumberOfMonthsCount] [smallint] NULL ,
	[EscrowCushionNumberOfMonthsCount] [smallint] NULL ,
	[EscrowDueDate] [smalldatetime] NULL ,
	[EscrowPaidToName] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[EscrowPremiumAmount] [money] NULL ,
	[EscrowUnequalPaymentsDueDate] [smalldatetime] NULL ,
	[EscrowUnequalPaymentsPaymentAmount] [money] NULL ,
	[EscrowWaiverIndicator] [bit] NULL ,
	[EscrowItemTypeOtherDescription] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[EstimatedPrepaidDaysPaidByTypes]    Script Date: 12/28/2004 2:38:02 PM ******/
CREATE TABLE [dbo].[EstimatedPrepaidDaysPaidByTypes] (
	[EstimatedPrepaidDaysPaidByTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[EstimatedPrepaidDaysPaidByType] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FHAAlimonyLiabilityTreatmentTypes]    Script Date: 12/28/2004 2:38:02 PM ******/
CREATE TABLE [dbo].[FHAAlimonyLiabilityTreatmentTypes] (
	[FHAAlimonyLiabilityTreatmentTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[FHAAlimonyLiabilityTreatmentType] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[FHAALTDescription] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FHADeclarations]    Script Date: 12/28/2004 2:38:02 PM ******/
CREATE TABLE [dbo].[FHADeclarations] (
	[FHADeclarationsID] [int] IDENTITY (1, 1) NOT NULL ,
	[fk_BorrowerID] [int] NOT NULL ,
	[fk_DeclarationExplanationTypeID] [int] NOT NULL ,
	[FHABorrowerCertificationOriginalMortgageAmount] [money] NULL ,
	[FHABorrowerCertificationOwn4OrMoreDwellingsIndicator] [bit] NULL ,
	[FHABorrowerCertificationOwnOtherPropertyIndicator] [bit] NULL ,
	[FHABorrowerCertificationPropertySoldCity] [varchar] (65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FHABorrowerCertificationPropertySoldPostalCode] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FHABorrowerCertificationPropertySoldState] [varchar] (65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FHABorrowerCertificationPropertySoldStreetAddress] [varchar] (65) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FHABorrowerCertificationPropertyToBeSoldIndicator] [bit] NULL ,
	[FHABorrowerCertificationSalesPriceAmount] [money] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FNMCreditReportScoreTypes]    Script Date: 12/28/2004 2:38:02 PM ******/
CREATE TABLE [dbo].[FNMCreditReportScoreTypes] (
	[FNMCreditReportScoreTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[FNMCreditReportScoreType] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FeePaymentCollectedByTypes]    Script Date: 12/28/2004 2:38:02 PM ******/
CREATE TABLE [dbo].[FeePaymentCollectedByTypes] (
	[FeePaymentCollectedByTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[FeePaymentCollectedByType] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FeePaymentPaidByTypes]    Script Date: 12/28/2004 2:38:02 PM ******/
CREATE TABLE [dbo].[FeePaymentPaidByTypes] (
	[FeePaymentPaidByTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[FeePaymentPaidByType] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FeePaymentProcessTypes]    Script Date: 12/28/2004 2:38:02 PM ******/
CREATE TABLE [dbo].[FeePaymentProcessTypes] (
	[FeePaymentProcessTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[FeePaymentProcessType] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FeeResponsiblePartyTypes]    Script Date: 12/28/2004 2:38:03 PM ******/
CREATE TABLE [dbo].[FeeResponsiblePartyTypes] (
	[FeeResponsiblePartyTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[FeeResponsiblePartyType] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[FeeTypes]    Script Date: 12/28/2004 2:38:03 PM ******/
CREATE TABLE [dbo].[FeeTypes] (
	[FeeTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[FeeType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[GSEProjectClassificationTypes]    Script Date: 12/28/2004 2:38:03 PM ******/
CREATE TABLE [dbo].[GSEProjectClassificationTypes] (
	[GSEProjectClassificationTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[GSEProjectClassificationType] [varchar] (55) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[GSEPropertyTypes]    Script Date: 12/28/2004 2:38:03 PM ******/
CREATE TABLE [dbo].[GSEPropertyTypes] (
	[GSEPropertyTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[GSEPropertyType] [varchar] (35) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[GSERefinancePurposeTypes]    Script Date: 12/28/2004 2:38:03 PM ******/
CREATE TABLE [dbo].[GSERefinancePurposeTypes] (
	[GSERefinancePurposeTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[GSERefinancePurposeType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[GSERPTDescription] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[GenderTypes]    Script Date: 12/28/2004 2:38:03 PM ******/
CREATE TABLE [dbo].[GenderTypes] (
	[GenderTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[GenderType] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[GTDescription] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[GovernmentRefinanceTypes]    Script Date: 12/28/2004 2:38:03 PM ******/
CREATE TABLE [dbo].[GovernmentRefinanceTypes] (
	[GovernmentRefinanceTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[GovernmentRefinanceType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[HomeownerPastThreeYearsTypes]    Script Date: 12/28/2004 2:38:03 PM ******/
CREATE TABLE [dbo].[HomeownerPastThreeYearsTypes] (
	[HomeownerPastThreeYearsTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[HomeownerPastThreeYearsType] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[HousingExpenseTypes]    Script Date: 12/28/2004 2:38:03 PM ******/
CREATE TABLE [dbo].[HousingExpenseTypes] (
	[HousingExpenseTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[HousingExpenseType] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[HETDescription] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[IncomeTypes]    Script Date: 12/28/2004 2:38:03 PM ******/
CREATE TABLE [dbo].[IncomeTypes] (
	[IncomeTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[IncomeType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[ITDescription] [varchar] (350) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[IntentToOccupyTypes]    Script Date: 12/28/2004 2:38:04 PM ******/
CREATE TABLE [dbo].[IntentToOccupyTypes] (
	[IntentToOccupyTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[IntentToOccupyType] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Interviewers]    Script Date: 12/28/2004 2:38:04 PM ******/
CREATE TABLE [dbo].[Interviewers] (
	[InterviewersID] [int] IDENTITY (1, 1) NOT NULL ,
	[InterviewersName] [varchar] (125) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InterviewerApplicationSignedDate] [smalldatetime] NULL ,
	[InterviewersEmployerCity] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InterviewersEmployerName] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InterviewersEmployerPostalCode] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InterviewersEmployerState] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InterviewersEmployerStreetAddress] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[InterviewersTelephoneNumber] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[JointAssetLiabilityReportingTypes]    Script Date: 12/28/2004 2:38:04 PM ******/
CREATE TABLE [dbo].[JointAssetLiabilityReportingTypes] (
	[JointAssetLiabilityReportingTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[JointAssetLiabilityReportingType] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[JALRTDescription] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Liabilities]    Script Date: 12/28/2004 2:38:04 PM ******/
CREATE TABLE [dbo].[Liabilities] (
	[LiabilitiesID] [int] IDENTITY (1, 1) NOT NULL ,
	[fk_BorrowerID] [int] NOT NULL ,
	[fk_LiabilityTypeID] [int] NOT NULL ,
	[LiabilityAccountIdentifier] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LiabilityExclusionIndicator] [bit] NULL ,
	[LiabilityMonthlyPaymentAmount] [money] NULL ,
	[LiabilityPayoffStatusIndicator] [bit] NULL ,
	[LiabilityRemainingTermMonths] [smallint] NULL ,
	[LiabilityUnpaidBalanceAmount] [money] NULL ,
	[SubjectLoanResubordinationIndicator] [bit] NULL ,
	[SubordinateLienAmount] [money] NULL ,
	[LiabilityHolderCity] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LiabilityHolderName] [varchar] (125) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LiabilityHolderPostalCode] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LiabilityHolderState] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LiabilityHolderStreetAddress] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AlimonyChildSupportObligationIndicator] [bit] NULL ,
	[AlimonyOwedToName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[LiabilityTypes]    Script Date: 12/28/2004 2:38:04 PM ******/
CREATE TABLE [dbo].[LiabilityTypes] (
	[LiabilityTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[LiabilityType] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[LTDescription] [varchar] (350) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[LienPriorityTypes]    Script Date: 12/28/2004 2:38:04 PM ******/
CREATE TABLE [dbo].[LienPriorityTypes] (
	[LienPriorityTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[LienPriorityType] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[LPTDescription] [varchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[LoanAmortizationTypes]    Script Date: 12/28/2004 2:38:04 PM ******/
CREATE TABLE [dbo].[LoanAmortizationTypes] (
	[LoanAmortizationTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[LoanAmortizationType] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[LATDescription] [varchar] (750) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[LoanDocumentationTypes]    Script Date: 12/28/2004 2:38:04 PM ******/
CREATE TABLE [dbo].[LoanDocumentationTypes] (
	[LoanDocumentationTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[LoanDocumentationType] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[LoanPurposeTypes]    Script Date: 12/28/2004 2:38:04 PM ******/
CREATE TABLE [dbo].[LoanPurposeTypes] (
	[LoanPurposeTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[LoanPurposeType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[LPTDescription] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[LoanRepaymentTypes]    Script Date: 12/28/2004 2:38:05 PM ******/
CREATE TABLE [dbo].[LoanRepaymentTypes] (
	[LoanRepaymentTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[LoanRepaymentType] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[MICompanyNameTypes]    Script Date: 12/28/2004 2:38:05 PM ******/
CREATE TABLE [dbo].[MICompanyNameTypes] (
	[MICompanyNameTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[MICompanyNameType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[MIDurationTypes]    Script Date: 12/28/2004 2:38:05 PM ******/
CREATE TABLE [dbo].[MIDurationTypes] (
	[MIDurationTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[MIDurationType] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[MILTVCutoffTypes]    Script Date: 12/28/2004 2:38:05 PM ******/
CREATE TABLE [dbo].[MILTVCutoffTypes] (
	[MILTVCutoffTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[MILTVCutoffType] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[MIPremiumRefundableTypes]    Script Date: 12/28/2004 2:38:05 PM ******/
CREATE TABLE [dbo].[MIPremiumRefundableTypes] (
	[MIPremiumRefundableTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[MIPremiumRefundableType] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[MIPremiumTaxCodeTypes]    Script Date: 12/28/2004 2:38:05 PM ******/
CREATE TABLE [dbo].[MIPremiumTaxCodeTypes] (
	[MIPremiumTaxCodeTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[MIPremiumTaxCodeType] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[MIRenewalCalculationTypes]    Script Date: 12/28/2004 2:38:05 PM ******/
CREATE TABLE [dbo].[MIRenewalCalculationTypes] (
	[MIRenewalCalculationTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[MIRenewalCalculationType] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[MIRenewalPremiumSequences]    Script Date: 12/28/2004 2:38:05 PM ******/
CREATE TABLE [dbo].[MIRenewalPremiumSequences] (
	[MIRenewalPremiumSequenceID] [int] IDENTITY (1, 1) NOT NULL ,
	[MIRenewalPremiumSequence] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[MIRPSDescription] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[MaritalStatusTypes]    Script Date: 12/28/2004 2:38:05 PM ******/
CREATE TABLE [dbo].[MaritalStatusTypes] (
	[MaritalStatusTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[MaritalStatusType] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Mortgage]    Script Date: 12/28/2004 2:38:06 PM ******/
CREATE TABLE [dbo].[Mortgage] (
	[MortgageID] [int] IDENTITY (1, 1) NOT NULL ,
	[fk_LienPriorityTypeID] [int] NOT NULL ,
	[fk_MortgageScoreTypeID] [int] NOT NULL ,
	[fk_MortgageTypeID] [int] NOT NULL ,
	[fk_SummaryAmountTypeID] [int] NOT NULL ,
	[fk_MortgageInsuranceID] [int] NOT NULL ,
	[fk_LoanAmortizationTypeID] [int] NOT NULL ,
	[fk_LoanRepaymentTypeID] [int] NOT NULL ,
	[fk_PaymentAdjustmentID] [int] NOT NULL ,
	[fk_PaymentFrequencyTypeID] [int] NOT NULL ,
	[fk_ARMSID] [int] NOT NULL ,
	[fk_BuydownID] [int] NOT NULL ,
	[fk_EscrowID] [int] NOT NULL ,
	[fk_CaseTypeID] [int] NOT NULL ,
	[fk_EstimatedPrepaidDaysPaidByTypeID] [int] NOT NULL ,
	[fk_RateAdjustmentCalculationTypeID] [int] NOT NULL ,
	[AgencyCaseIdentifier] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[BalloonIndicator] [bit] NULL ,
	[BalloonLoanMaturityTermMonths] [int] NULL ,
	[BaseLoanAmount] [money] NULL ,
	[BorrowerRequestedLoanAmount] [money] NULL ,
	[ConstructionImprovementCostsAmount] [money] NULL ,
	[ConstructionPeriodInterestRatePercent] [decimal](8, 7) NULL ,
	[ConstructionPeriodNumberOfMonthsCount] [smallint] NULL ,
	[DemandFeatureIndicator] [bit] NULL ,
	[EstimatedClosingCostsAmount] [money] NULL ,
	[EstimatedPrepaidDays] [tinyint] NULL ,
	[EstimatedPrepaidDaysPaidByOtherTypeDescription] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FHAUnderwriterComputerizedHomesUnderwritingSystemIdentifier] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FirstPaymentAdjustmentMonths] [smallint] NULL ,
	[FirstRateAdjustmentMonths] [smallint] NULL ,
	[FNMCommunityLendingProductName] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FNMCommunitySecondsIndicator] [bit] NULL ,
	[FREAffordableProgramIdentifier] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[HELOCMaximumBalanceAmount] [money] NULL ,
	[InitialPaymentRatePercent] [decimal](8, 7) NULL ,
	[LenderBranchIdentifier] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LenderCaseIdentifier] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LenderRegistrationIdentifier] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LoanAmortizationTermMonths] [smallint] NULL ,
	[LoanOriginationSystemLoanIdentifier] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[NegativeAmortizationLimitPercent] [decimal](8, 7) NULL ,
	[OriginalBalloonTermMonths] [smallint] NULL ,
	[OtherAmortizationTypeDescription] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PrepaymentFinanceChargeRefundableIndicator] [bit] NULL ,
	[PrepaymentPenaltyIndicator] [bit] NULL ,
	[PrepaymentRestrictionIndicator] [bit] NULL ,
	[ProductDescription] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[ProductName] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[RateAdjustmentDurationMonths] [smallint] NULL ,
	[RateAdjustmentInitialCapPercent] [decimal](8, 7) NULL ,
	[RateAdjustmentLifetimeCapPercent] [decimal](8, 7) NULL ,
	[RateAdjustmentPercent] [decimal](8, 7) NULL ,
	[RateAdjustmentPeriodNumber] [smallint] NULL ,
	[RateAdjustmentSubsequentCapPercent] [decimal](8, 7) NULL ,
	[ScheduledFirstPaymentDate] [smalldatetime] NULL ,
	[SubsequentPaymentAdjustmentMonths] [smallint] NULL ,
	[SubsequentRateAdjustmentMonths] [smallint] NULL ,
	[SummaryAmount] [money] NULL ,
	[AssumabilityIndicator] [bit] NULL ,
	[LendersContactPrimaryTelephoneNumber] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[MortgageScoreDate] [smalldatetime] NULL ,
	[MortgageScoreValue] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[OtherMortgageTypeDescription] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[MortgageInsurance]    Script Date: 12/28/2004 2:38:06 PM ******/
CREATE TABLE [dbo].[MortgageInsurance] (
	[MortgageInsuranceID] [int] IDENTITY (1, 1) NOT NULL ,
	[fk_MIDurationTypeID] [int] NOT NULL ,
	[fk_MICompanyNameTypeID] [int] NOT NULL ,
	[fk_MILTVCutoffTypeID] [int] NOT NULL ,
	[fk_MIPremiumRefundableTypeID] [int] NOT NULL ,
	[fk_MIPremiumTaxCodeTypeID] [int] NOT NULL ,
	[fk_MIRenewalCalculationTypeID] [int] NOT NULL ,
	[fk_MIRenewalPremiumSequenceID] [int] NOT NULL ,
	[MIAndFundingFeeFinancedAmount] [money] NULL ,
	[MIAndFundingFeeTotalAmount] [money] NULL ,
	[MICoveragePercent] [decimal](8, 7) NULL ,
	[MIEscrowIncludedInAggregateIndicator] [bit] NULL ,
	[MIInitialPremiumRateDurationMonths] [smallint] NULL ,
	[MIInitialPremiumRatePercent] [decimal](4, 2) NULL ,
	[MILTVCutoffPercent] [decimal](8, 7) NOT NULL ,
	[MIPremiumFinancedIndicator] [bit] NULL ,
	[MIPremiumTaxCodeAmount] [decimal](6, 2) NULL ,
	[MIPremiumTaxCodePercent] [decimal](4, 2) NULL ,
	[MIPremiumTermMonths] [tinyint] NULL ,
	[MIRenewalPremiumRate] [decimal](4, 2) NULL ,
	[MIRenewalPremiumRateDurationMonths] [smallint] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[MortgageScoreTypes]    Script Date: 12/28/2004 2:38:06 PM ******/
CREATE TABLE [dbo].[MortgageScoreTypes] (
	[MortgageScoreTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[MortgageScoreType] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[MortgageTypes]    Script Date: 12/28/2004 2:38:06 PM ******/
CREATE TABLE [dbo].[MortgageTypes] (
	[MortgageTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[MortgageType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[MTDescription] [varchar] (225) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PaymentAdjustmentCalculationTypes]    Script Date: 12/28/2004 2:38:06 PM ******/
CREATE TABLE [dbo].[PaymentAdjustmentCalculationTypes] (
	[PaymentAdjustmentCalculationTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[PaymentAdjustmentCalculationType] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PaymentAdjustments]    Script Date: 12/28/2004 2:38:06 PM ******/
CREATE TABLE [dbo].[PaymentAdjustments] (
	[PaymentAdjustmentID] [int] IDENTITY (1, 1) NOT NULL ,
	[fk_PaymentAdjustmentCalculationTypeID] [int] NOT NULL ,
	[PaymentAdjustmentAmount] [money] NULL ,
	[PaymentAdjustmentDurationMonths] [smallint] NULL ,
	[PaymentAdjustmentLifetimeCapAmount] [money] NULL ,
	[PaymentAdjustmentLifetimeCapPercent] [decimal](8, 7) NULL ,
	[PaymentAdjustmentPercent] [decimal](8, 7) NULL ,
	[PaymentAdjustmentPeriodicCapAmount] [money] NULL ,
	[PaymentAdjustmentPeriodicCapPercent] [decimal](8, 7) NULL ,
	[PaymentAdjustmentPeriodNumber] [smallint] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PaymentFrequencyTypes]    Script Date: 12/28/2004 2:38:07 PM ******/
CREATE TABLE [dbo].[PaymentFrequencyTypes] (
	[PaymentFrequencyTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[PaymentFrequencyType] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PrintPositionTypes]    Script Date: 12/28/2004 2:38:07 PM ******/
CREATE TABLE [dbo].[PrintPositionTypes] (
	[PrintPositionTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[PrintPositionType] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[PPTDescription] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PriorPropertyTitleTypes]    Script Date: 12/28/2004 2:38:07 PM ******/
CREATE TABLE [dbo].[PriorPropertyTitleTypes] (
	[PriorPropertyTitleTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[PriorPropertyTitleType] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[PPTDescription] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PriorPropertyUsageTypes]    Script Date: 12/28/2004 2:38:07 PM ******/
CREATE TABLE [dbo].[PriorPropertyUsageTypes] (
	[PriorPropertyUsageTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[PriorPropertyUsageType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[PPUTDescription] [varchar] (125) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PropertyDispositionStatusTypes]    Script Date: 12/28/2004 2:38:07 PM ******/
CREATE TABLE [dbo].[PropertyDispositionStatusTypes] (
	[PropertyDispositionStatusTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[PropertyDispositionStatusType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[PDSTDescription] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PropertyLegalDescriptionTypes]    Script Date: 12/28/2004 2:38:07 PM ******/
CREATE TABLE [dbo].[PropertyLegalDescriptionTypes] (
	[PropertyLegalDescriptionTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[PropertyLegalDescriptionType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[PLDTDescription] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PropertyRightsTypes]    Script Date: 12/28/2004 2:38:07 PM ******/
CREATE TABLE [dbo].[PropertyRightsTypes] (
	[PropertyRightsTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[PropertyRightsType] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[PRTDescription] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PropertyUsageTypes]    Script Date: 12/28/2004 2:38:07 PM ******/
CREATE TABLE [dbo].[PropertyUsageTypes] (
	[PropertyUsageTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[PropertyUsageType] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[PUTDescription] [varchar] (300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PurchaseCreditSourceTypes]    Script Date: 12/28/2004 2:38:07 PM ******/
CREATE TABLE [dbo].[PurchaseCreditSourceTypes] (
	[PurchaseCreditSourceTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[PurchaseCreditSourceType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[PurchaseCreditTypes]    Script Date: 12/28/2004 2:38:08 PM ******/
CREATE TABLE [dbo].[PurchaseCreditTypes] (
	[PurchaseCreditTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[PurchaseCreditType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[PCTDescription] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[RESPA]    Script Date: 12/28/2004 2:38:08 PM ******/
CREATE TABLE [dbo].[RESPA] (
	[RESPAID] [int] IDENTITY (1, 1) NOT NULL ,
	[fk_FeePaymentPaidByTypeID] [int] NOT NULL ,
	[fk_FeePaymentCollectedByTypeID] [int] NOT NULL ,
	[fk_FeePaymentProcessTypeID] [int] NOT NULL ,
	[fk_FeeResponsiblePartyTypeID] [int] NOT NULL ,
	[fk_FeeTypeID] [int] NOT NULL ,
	[fk_SectionClassificationTypeID] [int] NOT NULL ,
	[FeePaidToName] [varchar] (125) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FeePaymentAllowableFHAClosingCostIndicator] [bit] NULL ,
	[FeePaymentAmount] [money] NULL ,
	[FeePaymentIncludedInAPRIndicator] [bit] NULL ,
	[FeePaymentPaidOutsideOfClosingIndicator] [bit] NULL ,
	[FeePaymentPercent] [decimal](8, 7) NULL ,
	[FeePaymentSection32Indicator] [bit] NULL ,
	[FeeRequiredProviderOfServiceIndicator] [bit] NULL ,
	[FeeRequiredServiceProviderCity] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FeeRequiredServiceProviderName] [varchar] (125) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FeeRequiredServiceProviderNatureOfRelationshipDescription] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FeeRequiredServiceProviderPostalCode] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FeeRequiredServiceProviderState] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FeeRequiredServiceProviderStreetAddress] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FeeRequiredServiceProviderStreetAddress2] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FeeRequiredServiceProviderTelephoneNumber] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FeeSpecifiedHUDLineNumber] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[FeeTypeOtherDescription] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[RaceNationalOriginTypes]    Script Date: 12/28/2004 2:38:08 PM ******/
CREATE TABLE [dbo].[RaceNationalOriginTypes] (
	[RaceNationalOriginTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[RaceNationalOriginType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[RNOTDescription] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[RateAdjustmentCalculationTypes]    Script Date: 12/28/2004 2:38:08 PM ******/
CREATE TABLE [dbo].[RateAdjustmentCalculationTypes] (
	[RateAdjustmentCalculationTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[RateAdjustmentCalculationType] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[RefinanceImprovementTypes]    Script Date: 12/28/2004 2:38:08 PM ******/
CREATE TABLE [dbo].[RefinanceImprovementTypes] (
	[RefinanceImprovementTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[RefinanceImprovementType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Residences]    Script Date: 12/28/2004 2:38:08 PM ******/
CREATE TABLE [dbo].[Residences] (
	[ResidenceID] [int] IDENTITY (1, 1) NOT NULL ,
	[fk_BorrowerID] [int] NOT NULL ,
	[fk_ResidencyTypeID] [int] NOT NULL ,
	[fk_ResidencyBasisTypeID] [int] NOT NULL ,
	[City] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Country] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PostalCode] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[State] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[StreetAddress] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[DurationMonths] [smallint] NULL ,
	[DurationYears] [smallint] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ResidencyBasisTypes]    Script Date: 12/28/2004 2:38:08 PM ******/
CREATE TABLE [dbo].[ResidencyBasisTypes] (
	[ResidencyBasisTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[ResidencyBasisType] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[RBTDescription] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[ResidencyTypes]    Script Date: 12/28/2004 2:38:09 PM ******/
CREATE TABLE [dbo].[ResidencyTypes] (
	[ResidencyTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[ResidencyType] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[RTDescription] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SalesPriceExceedsAppraisedValueTypes]    Script Date: 12/28/2004 2:38:09 PM ******/
CREATE TABLE [dbo].[SalesPriceExceedsAppraisedValueTypes] (
	[SalesPriceExceedsAppraisedValueTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[SalesPriceExceedsAppraisedValueType] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[SPEAVTDescription] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SectionClassificationTypes]    Script Date: 12/28/2004 2:38:09 PM ******/
CREATE TABLE [dbo].[SectionClassificationTypes] (
	[SectionClassificationTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[SectionClassificationType] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[SCTDescription] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SectionOfActTypes]    Script Date: 12/28/2004 2:38:09 PM ******/
CREATE TABLE [dbo].[SectionOfActTypes] (
	[SectionOfActTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[SectionOfActType] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[SATDescription] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SubjectProperties]    Script Date: 12/28/2004 2:38:09 PM ******/
CREATE TABLE [dbo].[SubjectProperties] (
	[SubjectPropertyID] [int] IDENTITY (1, 1) NOT NULL ,
	[fk_CurrentFirstMortgageHolderTypeID] [int] NOT NULL ,
	[fk_BuildingStatusTypeID] [int] NOT NULL ,
	[fk_GSEProjectClassificationTypeID] [int] NOT NULL ,
	[fk_GSEPropertyTypeID] [int] NOT NULL ,
	[fk_PropertyLegalDescriptionTypeID] [int] NOT NULL ,
	[fk_PropertyRightsTypeID] [int] NOT NULL ,
	[FHABorrowerCertificationLeadPaintIndicator] [bit] NULL ,
	[FHABorrowerCertificationRentalIndicator] [bit] NULL ,
	[FNMForeclosureCount] [tinyint] NULL ,
	[GSETitleMannerHeldDescription] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[LandEstimatedValueAmount] [money] NULL ,
	[LandOriginalCostAmount] [money] NULL ,
	[MSAIdentifier] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PropertyAcquiredYear] [smalldatetime] NULL ,
	[PropertyAppraisedValueAmount] [money] NULL ,
	[PropertyCity] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PropertyCounty] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PropertyEnergyEfficientHomeIndicator] [bit] NULL ,
	[PropertyEstimatedValueAmount] [money] NULL ,
	[PropertyExistingLienAmount] [money] NULL ,
	[PropertyFinancedNumberOfUnits] [smallint] NULL ,
	[PropertyLeaseholdExpirationDate] [smalldatetime] NULL ,
	[PropertyLegalDescriptionTextDescription] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PropertyOriginalCostAmount] [money] NULL ,
	[PropertyPostalCode] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PropertyState] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PropertyStreetAddress] [varchar] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[PropertyStructureBuiltYear] [smalldatetime] NULL ,
	[TitleHolderName] [varchar] (125) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[AlterationsImprovementsAndRepairsAmount] [money] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[SummaryAmountTypes]    Script Date: 12/28/2004 2:38:09 PM ******/
CREATE TABLE [dbo].[SummaryAmountTypes] (
	[SummaryAmountTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[SummaryAmountType] [varchar] (90) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[VABorrower]    Script Date: 12/28/2004 2:38:09 PM ******/
CREATE TABLE [dbo].[VABorrower] (
	[VABorrowerID] [int] IDENTITY (1, 1) NOT NULL ,
	[fk_BorrowerID] [int] NOT NULL ,
	[fk_VACoBorrowerID] [int] NOT NULL ,
	[VAHouseholdSizeCount] [smallint] NULL ,
	[VAEntitlementAmount] [money] NULL ,
	[VAEntitlementCodeIdentifier] [smallint] NULL ,
	[VAFederalTaxAmount] [money] NULL ,
	[VALocalTaxAmount] [money] NULL ,
	[VAPrimaryBorrowerNonTaxableIncomeAmount] [money] NULL ,
	[VAPrimaryBorrowerTaxableIncomeAmount] [money] NULL ,
	[VAResidualIncomeAmount] [money] NULL ,
	[VASocialSecurityTaxAmount] [money] NULL ,
	[VAStateTaxAmount] [money] NULL ,
	[VAUtilityExpenseMonthlyAmount] [money] NULL ,
	[VeteranStatusIndicator] [bit] NULL ,
	[VAMaintenanceExpenseMonthlyAmount] [money] NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[VABorrowerCertificationOccupancyTypes]    Script Date: 12/28/2004 2:38:09 PM ******/
CREATE TABLE [dbo].[VABorrowerCertificationOccupancyTypes] (
	[VABorrowerCertificationOccupancyTypeID] [int] IDENTITY (1, 1) NOT NULL ,
	[VABorrowerCertificationOccupancyType] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[VABCOTDescription] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[VACoBorrower]    Script Date: 12/28/2004 2:38:09 PM ******/
CREATE TABLE [dbo].[VACoBorrower] (
	[VACoBorrowerID] [int] IDENTITY (1, 1) NOT NULL ,
	[fk_BorrowerID] [int] NOT NULL ,
	[VABorrowerCoBorrowerMarriedIndicator] [bit] NULL ,
	[VACoBorrowerNonTaxableIncomeAmount] [money] NULL ,
	[VACoBorrowerTaxableIncomeAmount] [money] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ARMIndexTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_ARMIType] PRIMARY KEY  CLUSTERED 
	(
		[ARMIndexTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ARMS] WITH NOCHECK ADD 
	CONSTRAINT [PK_ARMS] PRIMARY KEY  CLUSTERED 
	(
		[ARMSID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Aliases] WITH NOCHECK ADD 
	CONSTRAINT [pk_Aliases] PRIMARY KEY  CLUSTERED 
	(
		[AliasID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ApplicationTakenMethodTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_ATMTypes] PRIMARY KEY  CLUSTERED 
	(
		[ApplicationTakenMethodTypesID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Applications] WITH NOCHECK ADD 
	CONSTRAINT [PK_Applications] PRIMARY KEY  CLUSTERED 
	(
		[ApplicationsID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[AssetTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_AssetTypes] PRIMARY KEY  CLUSTERED 
	(
		[AssetTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Assets] WITH NOCHECK ADD 
	CONSTRAINT [pk_Assets] PRIMARY KEY  CLUSTERED 
	(
		[AssetID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[BorrowerProperties] WITH NOCHECK ADD 
	CONSTRAINT [pk_Properties] PRIMARY KEY  CLUSTERED 
	(
		[BorrowerPropertyID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Borrowers] WITH NOCHECK ADD 
	CONSTRAINT [PK_Borrowers] PRIMARY KEY  CLUSTERED 
	(
		[BorrowerID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[BuildingStatusTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_BuildingStatusTypes] PRIMARY KEY  CLUSTERED 
	(
		[BuildingStatusTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[BuydownBaseDateTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_BBDType] PRIMARY KEY  CLUSTERED 
	(
		[BuydownBaseDateTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[BuydownContributorTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_BCType] PRIMARY KEY  CLUSTERED 
	(
		[BuydownContributorTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[BuydownSubsidyCalculationTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_BSCType] PRIMARY KEY  CLUSTERED 
	(
		[BuydownSubsidyCalculationTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Buydowns] WITH NOCHECK ADD 
	CONSTRAINT [PK_Buydowns] PRIMARY KEY  CLUSTERED 
	(
		[BuydownID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[CaseStateTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_CSType] PRIMARY KEY  CLUSTERED 
	(
		[CaseStateTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[CitizenshipResidencyTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_CRTypes] PRIMARY KEY  CLUSTERED 
	(
		[CitizenshipResidencyTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[CounselingConfirmationTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_CCTypes] PRIMARY KEY  CLUSTERED 
	(
		[CounselingConfirmationTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[CurrentFirstMortgageHolderTypes] WITH NOCHECK ADD 
	CONSTRAINT [pkCurrentFirstMortgageHolderTypes] PRIMARY KEY  CLUSTERED 
	(
		[CurrentFirstMortgageHolderTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[DeclarationExplanationTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_DETypes] PRIMARY KEY  CLUSTERED 
	(
		[DeclarationExplanationTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Dependents] WITH NOCHECK ADD 
	CONSTRAINT [pk_Dependents] PRIMARY KEY  CLUSTERED 
	(
		[DependentsID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[DownPaymentOptionTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_DownPaymentOptionTypes] PRIMARY KEY  CLUSTERED 
	(
		[DownPaymentOptionTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[DownPaymentTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_DownPaymentTypes] PRIMARY KEY  CLUSTERED 
	(
		[DownPaymentTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Employment] WITH NOCHECK ADD 
	CONSTRAINT [pk_Employment] PRIMARY KEY  CLUSTERED 
	(
		[EmploymentID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[EscrowItemTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_EIType] PRIMARY KEY  CLUSTERED 
	(
		[EscrowItemTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[EscrowPaidByTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_EPBType] PRIMARY KEY  CLUSTERED 
	(
		[EscrowPaidByTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[EscrowPaymentFrequencyTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_EPFType] PRIMARY KEY  CLUSTERED 
	(
		[EscrowPaymentFrequencyTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[EscrowPremiumPaidByTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_EPPBType] PRIMARY KEY  CLUSTERED 
	(
		[EscrowPremiumPaidByTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[EscrowPremiumPaymentTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_EPPType] PRIMARY KEY  CLUSTERED 
	(
		[EscrowPremiumPaymentTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Escrows] WITH NOCHECK ADD 
	CONSTRAINT [PK_Escrows] PRIMARY KEY  CLUSTERED 
	(
		[EscrowID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[EstimatedPrepaidDaysPaidByTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_EPDPBType] PRIMARY KEY  CLUSTERED 
	(
		[EstimatedPrepaidDaysPaidByTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[FHAAlimonyLiabilityTreatmentTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_FHAALTTypes] PRIMARY KEY  CLUSTERED 
	(
		[FHAAlimonyLiabilityTreatmentTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[FHADeclarations] WITH NOCHECK ADD 
	CONSTRAINT [pk_FHADeclarations] PRIMARY KEY  CLUSTERED 
	(
		[FHADeclarationsID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[FNMCreditReportScoreTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_FNMCreditReportScoreTypes] PRIMARY KEY  CLUSTERED 
	(
		[FNMCreditReportScoreTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[FeePaymentCollectedByTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_RFPCBTypes] PRIMARY KEY  CLUSTERED 
	(
		[FeePaymentCollectedByTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[FeePaymentPaidByTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_FPPBTypes] PRIMARY KEY  CLUSTERED 
	(
		[FeePaymentPaidByTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[FeePaymentProcessTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_FPPTypes] PRIMARY KEY  CLUSTERED 
	(
		[FeePaymentProcessTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[FeeResponsiblePartyTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_FRPTypes] PRIMARY KEY  CLUSTERED 
	(
		[FeeResponsiblePartyTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[FeeTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_FTypes] PRIMARY KEY  CLUSTERED 
	(
		[FeeTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[GSEProjectClassificationTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_GSEProjectClassificationTypes] PRIMARY KEY  CLUSTERED 
	(
		[GSEProjectClassificationTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[GSEPropertyTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_GSEPTypes] PRIMARY KEY  CLUSTERED 
	(
		[GSEPropertyTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[GSERefinancePurposeTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_GSERefinancePurposeTypes] PRIMARY KEY  CLUSTERED 
	(
		[GSERefinancePurposeTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[GenderTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_GenderTypes] PRIMARY KEY  CLUSTERED 
	(
		[GenderTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[GovernmentRefinanceTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_GovernmentRefinanceTypes] PRIMARY KEY  CLUSTERED 
	(
		[GovernmentRefinanceTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[HomeownerPastThreeYearsTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_HPTYTypes] PRIMARY KEY  CLUSTERED 
	(
		[HomeownerPastThreeYearsTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[HousingExpenseTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_HousingExpenseTypes] PRIMARY KEY  CLUSTERED 
	(
		[HousingExpenseTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[IncomeTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_IncomeTypes] PRIMARY KEY  CLUSTERED 
	(
		[IncomeTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[IntentToOccupyTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_IntentToOccupyTypes] PRIMARY KEY  CLUSTERED 
	(
		[IntentToOccupyTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Interviewers] WITH NOCHECK ADD 
	CONSTRAINT [pk_Interviewers] PRIMARY KEY  CLUSTERED 
	(
		[InterviewersID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[JointAssetLiabilityReportingTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_JointAssetLiabilityReportingTypes] PRIMARY KEY  CLUSTERED 
	(
		[JointAssetLiabilityReportingTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Liabilities] WITH NOCHECK ADD 
	CONSTRAINT [pk_Liabilities] PRIMARY KEY  CLUSTERED 
	(
		[LiabilitiesID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[LiabilityTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_LTypes] PRIMARY KEY  CLUSTERED 
	(
		[LiabilityTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[LienPriorityTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_LPType] PRIMARY KEY  CLUSTERED 
	(
		[LienPriorityTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[LoanAmortizationTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_LAType] PRIMARY KEY  CLUSTERED 
	(
		[LoanAmortizationTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[LoanDocumentationTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_LDTypes] PRIMARY KEY  CLUSTERED 
	(
		[LoanDocumentationTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[LoanPurposeTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_LPTypes] PRIMARY KEY  CLUSTERED 
	(
		[LoanPurposeTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[LoanRepaymentTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_LRType] PRIMARY KEY  CLUSTERED 
	(
		[LoanRepaymentTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MICompanyNameTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_MICNType] PRIMARY KEY  CLUSTERED 
	(
		[MICompanyNameTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MIDurationTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_MIDType] PRIMARY KEY  CLUSTERED 
	(
		[MIDurationTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MILTVCutoffTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_MILTVCType] PRIMARY KEY  CLUSTERED 
	(
		[MILTVCutoffTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MIPremiumRefundableTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_MIPRType] PRIMARY KEY  CLUSTERED 
	(
		[MIPremiumRefundableTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MIPremiumTaxCodeTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_MIPTCType] PRIMARY KEY  CLUSTERED 
	(
		[MIPremiumTaxCodeTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MIRenewalCalculationTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_MIRCType] PRIMARY KEY  CLUSTERED 
	(
		[MIRenewalCalculationTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MIRenewalPremiumSequences] WITH NOCHECK ADD 
	CONSTRAINT [pk_MIRPSType] PRIMARY KEY  CLUSTERED 
	(
		[MIRenewalPremiumSequenceID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MaritalStatusTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_MSTypes] PRIMARY KEY  CLUSTERED 
	(
		[MaritalStatusTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Mortgage] WITH NOCHECK ADD 
	CONSTRAINT [PK_Mortgage] PRIMARY KEY  CLUSTERED 
	(
		[MortgageID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MortgageInsurance] WITH NOCHECK ADD 
	CONSTRAINT [PK_MortgageInsurance] PRIMARY KEY  CLUSTERED 
	(
		[MortgageInsuranceID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MortgageScoreTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_MSType] PRIMARY KEY  CLUSTERED 
	(
		[MortgageScoreTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MortgageTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_MType] PRIMARY KEY  CLUSTERED 
	(
		[MortgageTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[PaymentAdjustmentCalculationTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_PACType] PRIMARY KEY  CLUSTERED 
	(
		[PaymentAdjustmentCalculationTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[PaymentAdjustments] WITH NOCHECK ADD 
	CONSTRAINT [PK_PaymentAdjustments] PRIMARY KEY  CLUSTERED 
	(
		[PaymentAdjustmentID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[PaymentFrequencyTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_PFType] PRIMARY KEY  CLUSTERED 
	(
		[PaymentFrequencyTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[PrintPositionTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_BorrowerPrintPositionTypes] PRIMARY KEY  CLUSTERED 
	(
		[PrintPositionTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[PriorPropertyTitleTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_PPTTypes] PRIMARY KEY  CLUSTERED 
	(
		[PriorPropertyTitleTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[PriorPropertyUsageTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_PPUTypes] PRIMARY KEY  CLUSTERED 
	(
		[PriorPropertyUsageTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[PropertyDispositionStatusTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_PDSTypes] PRIMARY KEY  CLUSTERED 
	(
		[PropertyDispositionStatusTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[PropertyLegalDescriptionTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_PropertyLegalDescriptionTypes] PRIMARY KEY  CLUSTERED 
	(
		[PropertyLegalDescriptionTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[PropertyRightsTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_PropertyRightsTypes] PRIMARY KEY  CLUSTERED 
	(
		[PropertyRightsTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[PropertyUsageTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_PUTypes] PRIMARY KEY  CLUSTERED 
	(
		[PropertyUsageTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[PurchaseCreditSourceTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_CSTypes] PRIMARY KEY  CLUSTERED 
	(
		[PurchaseCreditSourceTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[PurchaseCreditTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_PCTypes] PRIMARY KEY  CLUSTERED 
	(
		[PurchaseCreditTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[RESPA] WITH NOCHECK ADD 
	CONSTRAINT [pk_RESPA] PRIMARY KEY  CLUSTERED 
	(
		[RESPAID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[RaceNationalOriginTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_RNOTypes] PRIMARY KEY  CLUSTERED 
	(
		[RaceNationalOriginTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[RateAdjustmentCalculationTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_RACType] PRIMARY KEY  CLUSTERED 
	(
		[RateAdjustmentCalculationTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[RefinanceImprovementTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_RITypes] PRIMARY KEY  CLUSTERED 
	(
		[RefinanceImprovementTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Residences] WITH NOCHECK ADD 
	CONSTRAINT [pk_Residences] PRIMARY KEY  CLUSTERED 
	(
		[ResidenceID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ResidencyBasisTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_ResidencyBasisTypeID] PRIMARY KEY  CLUSTERED 
	(
		[ResidencyBasisTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[ResidencyTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_RTypes] PRIMARY KEY  CLUSTERED 
	(
		[ResidencyTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[SalesPriceExceedsAppraisedValueTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_SalesPriceExceedsAppraisedValueTypeID] PRIMARY KEY  CLUSTERED 
	(
		[SalesPriceExceedsAppraisedValueTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[SectionClassificationTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_SCTypes] PRIMARY KEY  CLUSTERED 
	(
		[SectionClassificationTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[SectionOfActTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_SOATypes] PRIMARY KEY  CLUSTERED 
	(
		[SectionOfActTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[SubjectProperties] WITH NOCHECK ADD 
	CONSTRAINT [PK_SubjectProperties] PRIMARY KEY  CLUSTERED 
	(
		[SubjectPropertyID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[SummaryAmountTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_SAType] PRIMARY KEY  CLUSTERED 
	(
		[SummaryAmountTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[VABorrower] WITH NOCHECK ADD 
	CONSTRAINT [pk_VABorrower] PRIMARY KEY  CLUSTERED 
	(
		[VABorrowerID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[VABorrowerCertificationOccupancyTypes] WITH NOCHECK ADD 
	CONSTRAINT [pk_VACOTypes] PRIMARY KEY  CLUSTERED 
	(
		[VABorrowerCertificationOccupancyTypeID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[VACoBorrower] WITH NOCHECK ADD 
	CONSTRAINT [pk_VACoBorrower] PRIMARY KEY  CLUSTERED 
	(
		[VACoBorrowerID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Applications] WITH NOCHECK ADD 
	CONSTRAINT [DF__Applicati__Below__76CBA758] DEFAULT (0) FOR [BelowMarketSubordinateFinancingIndicator],
	CONSTRAINT [DF__Applicati__Couns__77BFCB91] DEFAULT (0) FOR [CounselingConfirmationIndicator],
	CONSTRAINT [DF__Applicati__FNMNe__78B3EFCA] DEFAULT (0) FOR [FNMNeighborsMortgageEligibilityIndicator],
	CONSTRAINT [DF__Applicati__Refun__79A81403] DEFAULT (0) FOR [RefundableApplicationFeeIndicator],
	CONSTRAINT [DF__Applicati__Requi__7A9C383C] DEFAULT (0) FOR [RequiredDepositIndicator]
GO

ALTER TABLE [dbo].[Assets] WITH NOCHECK ADD 
	CONSTRAINT [DF__Assets__Addition__5812160E] DEFAULT (0) FOR [AdditionalBorrowerAssetsConsideredIndicator],
	CONSTRAINT [DF__Assets__Addition__59063A47] DEFAULT (0) FOR [AdditionalBorrowerAssetsNotConsideredIndicator]
GO

ALTER TABLE [dbo].[BorrowerProperties] WITH NOCHECK ADD 
	CONSTRAINT [DF__Propertie__Subje__00200768] DEFAULT (1) FOR [fk_SubjectPropertyID]
GO

ALTER TABLE [dbo].[Borrowers] WITH NOCHECK ADD 
	CONSTRAINT [DF__Borrowers__Bankr__282DF8C2] DEFAULT (0) FOR [BankruptcyIndicator],
	CONSTRAINT [DF__Borrowers__Borro__29221CFB] DEFAULT (0) FOR [BorrowedDownPaymentIndicator],
	CONSTRAINT [DF__Borrowers__Borro__2A164134] DEFAULT (0) FOR [BorrowerFirstTimeHomebuyerIndicator],
	CONSTRAINT [DF__Borrowers__CoMak__2B0A656D] DEFAULT (0) FOR [CoMakerEndorserOfNoteIndicator],
	CONSTRAINT [DF__Borrowers__HUDAd__2BFE89A6] DEFAULT (0) FOR [HUDAdequateAvailableAssetsIndicator],
	CONSTRAINT [DF__Borrowers__HUDAd__2CF2ADDF] DEFAULT (0) FOR [HUDAdequateEffectiveIncomeIndicator],
	CONSTRAINT [DF__Borrowers__HUDCr__2DE6D218] DEFAULT (0) FOR [HUDCreditCharacteristicsIndicator],
	CONSTRAINT [DF__Borrowers__HUDSt__2EDAF651] DEFAULT (0) FOR [HUDStableEffectiveIncomeIndicator],
	CONSTRAINT [DF__Borrowers__LoanF__2FCF1A8A] DEFAULT (0) FOR [LoanForeclosureOrJudgmentIndicator],
	CONSTRAINT [DF__Borrowers__Outst__30C33EC3] DEFAULT (0) FOR [OutstandingJudgmentsIndicator],
	CONSTRAINT [DF__Borrowers__Party__31B762FC] DEFAULT (0) FOR [PartyToLawsuitIndicator],
	CONSTRAINT [DF__Borrowers__Prese__32AB8735] DEFAULT (0) FOR [PresentlyDelinquentIndicator],
	CONSTRAINT [DF__Borrowers__RaceN__339FAB6E] DEFAULT (0) FOR [RaceNationalOriginRefusalIndicator],
	CONSTRAINT [DF__Borrowers__SelfE__3493CFA7] DEFAULT (0) FOR [SelfEmploymentIncomeIndicator],
	CONSTRAINT [DF__Borrowers__Prope__3587F3E0] DEFAULT (0) FOR [PropertyForeclosurePastSevenYearsIndicator]
GO

ALTER TABLE [dbo].[Buydowns] WITH NOCHECK ADD 
	CONSTRAINT [DF__Buydowns__Lender__6BE40491] DEFAULT (0) FOR [LenderFundingIndicator],
	CONSTRAINT [DF__Buydowns__Perman__6CD828CA] DEFAULT (0) FOR [PermanentIndicator]
GO

ALTER TABLE [dbo].[Employment] WITH NOCHECK ADD 
	CONSTRAINT [DF__Employmen__Emplo__66603565] DEFAULT (0) FOR [EmploymentBorrowerSelfEmployedIndicator],
	CONSTRAINT [DF__Employmen__Emplo__6754599E] DEFAULT (0) FOR [EmploymentCurrentIndicator],
	CONSTRAINT [DF__Employmen__Emplo__68487DD7] DEFAULT (0) FOR [EmploymentPrimaryIndicator]
GO

ALTER TABLE [dbo].[FHADeclarations] WITH NOCHECK ADD 
	CONSTRAINT [DF__FHADeclar__FHABo__5DCAEF64] DEFAULT (0) FOR [FHABorrowerCertificationOwn4OrMoreDwellingsIndicator],
	CONSTRAINT [DF__FHADeclar__FHABo__5EBF139D] DEFAULT (0) FOR [FHABorrowerCertificationOwnOtherPropertyIndicator],
	CONSTRAINT [DF__FHADeclar__FHABo__5FB337D6] DEFAULT (0) FOR [FHABorrowerCertificationPropertyToBeSoldIndicator]
GO

ALTER TABLE [dbo].[Mortgage] WITH NOCHECK ADD 
	CONSTRAINT [DF__Mortgage__Balloo__74794A92] DEFAULT (0) FOR [BalloonIndicator],
	CONSTRAINT [DF__Mortgage__Demand__756D6ECB] DEFAULT (0) FOR [DemandFeatureIndicator],
	CONSTRAINT [DF__Mortgage__FNMCom__76619304] DEFAULT (0) FOR [FNMCommunitySecondsIndicator],
	CONSTRAINT [DF__Mortgage__Prepay__7755B73D] DEFAULT (0) FOR [PrepaymentFinanceChargeRefundableIndicator],
	CONSTRAINT [DF__Mortgage__Prepay__7849DB76] DEFAULT (0) FOR [PrepaymentPenaltyIndicator],
	CONSTRAINT [DF__Mortgage__Prepay__793DFFAF] DEFAULT (0) FOR [PrepaymentRestrictionIndicator],
	CONSTRAINT [DF__Mortgage__Assuma__7A3223E8] DEFAULT (0) FOR [AssumabilityIndicator]
GO

ALTER TABLE [dbo].[MortgageInsurance] WITH NOCHECK ADD 
	CONSTRAINT [DF__MortgageI__MIEsc__70A8B9AE] DEFAULT (0) FOR [MIEscrowIncludedInAggregateIndicator],
	CONSTRAINT [DF__MortgageI__MIPre__719CDDE7] DEFAULT (0) FOR [MIPremiumFinancedIndicator]
GO

ALTER TABLE [dbo].[RESPA] WITH NOCHECK ADD 
	CONSTRAINT [DF__RESPA__FeePaymen__49C3F6B7] DEFAULT (0) FOR [FeePaymentAllowableFHAClosingCostIndicator],
	CONSTRAINT [DF__RESPA__FeePaymen__4AB81AF0] DEFAULT (0) FOR [FeePaymentIncludedInAPRIndicator],
	CONSTRAINT [DF__RESPA__FeePaymen__4BAC3F29] DEFAULT (0) FOR [FeePaymentPaidOutsideOfClosingIndicator],
	CONSTRAINT [DF__RESPA__FeePaymen__4CA06362] DEFAULT (0) FOR [FeePaymentSection32Indicator],
	CONSTRAINT [DF__RESPA__FeeRequir__4D94879B] DEFAULT (0) FOR [FeeRequiredProviderOfServiceIndicator]
GO

ALTER TABLE [dbo].[SubjectProperties] WITH NOCHECK ADD 
	CONSTRAINT [DF__SubjectPr__FHABo__7FEAFD3E] DEFAULT (0) FOR [FHABorrowerCertificationLeadPaintIndicator],
	CONSTRAINT [DF__SubjectPr__FHABo__00DF2177] DEFAULT (0) FOR [FHABorrowerCertificationRentalIndicator],
	CONSTRAINT [DF__SubjectPr__Prope__01D345B0] DEFAULT (0) FOR [PropertyEnergyEfficientHomeIndicator]
GO

ALTER TABLE [dbo].[ARMS] ADD 
	CONSTRAINT [FK_ARMS_ARMIndexTypes] FOREIGN KEY 
	(
		[fk_ARMIndexTypeID]
	) REFERENCES [dbo].[ARMIndexTypes] (
		[ARMIndexTypeID]
	)
GO

ALTER TABLE [dbo].[Aliases] ADD 
	CONSTRAINT [FK_Aliases_Borrowers] FOREIGN KEY 
	(
		[fk_BorrowerID]
	) REFERENCES [dbo].[Borrowers] (
		[BorrowerID]
	) ON DELETE CASCADE  ON UPDATE CASCADE  NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[Applications] ADD 
	CONSTRAINT [FK_Applications_ApplicationTakenMethodTypes] FOREIGN KEY 
	(
		[fk_ApplicationTakenMethodTypeID]
	) REFERENCES [dbo].[ApplicationTakenMethodTypes] (
		[ApplicationTakenMethodTypesID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Applications_Borrowers] FOREIGN KEY 
	(
		[fk_BorrowerID]
	) REFERENCES [dbo].[Borrowers] (
		[BorrowerID]
	) ON DELETE CASCADE  ON UPDATE CASCADE  NOT FOR REPLICATION ,
	CONSTRAINT [FK_Applications_DownPaymentOptionTypes] FOREIGN KEY 
	(
		[fk_DownPaymentOptionTypesID]
	) REFERENCES [dbo].[DownPaymentOptionTypes] (
		[DownPaymentOptionTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Applications_DownPaymentTypes] FOREIGN KEY 
	(
		[fk_DownPaymentTypeID]
	) REFERENCES [dbo].[DownPaymentTypes] (
		[DownPaymentTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Applications_GSERefinancePurposeTypes] FOREIGN KEY 
	(
		[fk_GSERefinancePurposeTypesID]
	) REFERENCES [dbo].[GSERefinancePurposeTypes] (
		[GSERefinancePurposeTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Applications_Interviewers] FOREIGN KEY 
	(
		[fk_InterviewsID]
	) REFERENCES [dbo].[Interviewers] (
		[InterviewersID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Applications_JointAssetLiabilityReportingTypes] FOREIGN KEY 
	(
		[fk_JointAssetLiabilityReportingTypesID]
	) REFERENCES [dbo].[JointAssetLiabilityReportingTypes] (
		[JointAssetLiabilityReportingTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Applications_LoanDocumentationTypes] FOREIGN KEY 
	(
		[fk_LoanDocumentationTypesID]
	) REFERENCES [dbo].[LoanDocumentationTypes] (
		[LoanDocumentationTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Applications_LoanPurposeTypes] FOREIGN KEY 
	(
		[fk_LoanPurposeTypesID]
	) REFERENCES [dbo].[LoanPurposeTypes] (
		[LoanPurposeTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Applications_Mortgage] FOREIGN KEY 
	(
		[fk_MortgageID]
	) REFERENCES [dbo].[Mortgage] (
		[MortgageID]
	) ON DELETE CASCADE  ON UPDATE CASCADE  NOT FOR REPLICATION ,
	CONSTRAINT [FK_Applications_PrintPositionTypes] FOREIGN KEY 
	(
		[fk_PrintPositionTypesID]
	) REFERENCES [dbo].[PrintPositionTypes] (
		[PrintPositionTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Applications_PurchaseCreditSourceTypes] FOREIGN KEY 
	(
		[fk_PurchaseCreditSourceTypesID]
	) REFERENCES [dbo].[PurchaseCreditSourceTypes] (
		[PurchaseCreditSourceTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Applications_PurchaseCreditTypes] FOREIGN KEY 
	(
		[fk_PurchaseCreditTypesID]
	) REFERENCES [dbo].[PurchaseCreditTypes] (
		[PurchaseCreditTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Applications_RefinanceImprovementTypes] FOREIGN KEY 
	(
		[fk_ReFinanceImprovementTypesID]
	) REFERENCES [dbo].[RefinanceImprovementTypes] (
		[RefinanceImprovementTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Applications_RESPA] FOREIGN KEY 
	(
		[fk_RespaID]
	) REFERENCES [dbo].[RESPA] (
		[RESPAID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Applications_SectionOfActTypes] FOREIGN KEY 
	(
		[fk_SectionOfActTypesID]
	) REFERENCES [dbo].[SectionOfActTypes] (
		[SectionOfActTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Applications_SubjectProperties] FOREIGN KEY 
	(
		[fk_SubjectPropertiesID]
	) REFERENCES [dbo].[SubjectProperties] (
		[SubjectPropertyID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Applications_VABorrowerCertificationOccupancyTypes] FOREIGN KEY 
	(
		[fk_VABorrowerCertificationOccupancyTYpesID]
	) REFERENCES [dbo].[VABorrowerCertificationOccupancyTypes] (
		[VABorrowerCertificationOccupancyTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [fk_SalesPriceExceedsAppraisedValue] FOREIGN KEY 
	(
		[fk_SalesPriceExceedsAppraisedValueTypeID]
	) REFERENCES [dbo].[SalesPriceExceedsAppraisedValueTypes] (
		[SalesPriceExceedsAppraisedValueTypeID]
	) NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[Assets] ADD 
	CONSTRAINT [FK_Assets_AssetTypes] FOREIGN KEY 
	(
		[fk_AssetTypeID]
	) REFERENCES [dbo].[AssetTypes] (
		[AssetTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Assets_Borrowers] FOREIGN KEY 
	(
		[fk_BorrowerID]
	) REFERENCES [dbo].[Borrowers] (
		[BorrowerID]
	) ON DELETE CASCADE  ON UPDATE CASCADE  NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[BorrowerProperties] ADD 
	CONSTRAINT [FK_BorrowerProperties_Borrowers] FOREIGN KEY 
	(
		[fk_BorrowerID]
	) REFERENCES [dbo].[Borrowers] (
		[BorrowerID]
	) ON DELETE CASCADE  ON UPDATE CASCADE  NOT FOR REPLICATION ,
	CONSTRAINT [FK_BorrowerProperties_GSEPropertyTypes] FOREIGN KEY 
	(
		[fk_GSEPropertyTypeID]
	) REFERENCES [dbo].[GSEPropertyTypes] (
		[GSEPropertyTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_BorrowerProperties_PriorPropertyTitleTypes] FOREIGN KEY 
	(
		[fk_PriorPropertyTitleTypeID]
	) REFERENCES [dbo].[PriorPropertyTitleTypes] (
		[PriorPropertyTitleTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_BorrowerProperties_PriorPropertyUsageTypes] FOREIGN KEY 
	(
		[fk_PriorPropertyUsageTypeID]
	) REFERENCES [dbo].[PriorPropertyUsageTypes] (
		[PriorPropertyUsageTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_BorrowerProperties_PropertyDispositionStatusTypes] FOREIGN KEY 
	(
		[fk_PropertyDispositionStatusTypeID]
	) REFERENCES [dbo].[PropertyDispositionStatusTypes] (
		[PropertyDispositionStatusTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_BorrowerProperties_PropertyUsageTypes] FOREIGN KEY 
	(
		[fk_PropertyUsageTypeID]
	) REFERENCES [dbo].[PropertyUsageTypes] (
		[PropertyUsageTypeID]
	) NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[Borrowers] ADD 
	CONSTRAINT [FK_Borrowers_CitizenshipResidencyTypes] FOREIGN KEY 
	(
		[fk_CitizenshipResidencyTypeID]
	) REFERENCES [dbo].[CitizenshipResidencyTypes] (
		[CitizenshipResidencyTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Borrowers_CounselingConfirmationTypes] FOREIGN KEY 
	(
		[fk_CounselingConfirmationTypeID]
	) REFERENCES [dbo].[CounselingConfirmationTypes] (
		[CounselingConfirmationTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Borrowers_FHAAlimonyLiabilityTreatmentTypes] FOREIGN KEY 
	(
		[fk_FHAAlimonyLiabilityTreatmentTypeID]
	) REFERENCES [dbo].[FHAAlimonyLiabilityTreatmentTypes] (
		[FHAAlimonyLiabilityTreatmentTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Borrowers_GenderTypes] FOREIGN KEY 
	(
		[fk_GenderTypeID]
	) REFERENCES [dbo].[GenderTypes] (
		[GenderTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Borrowers_HomeownerPastThreeYearsTypes] FOREIGN KEY 
	(
		[fk_HomeownerPastThreeYearsTypeID]
	) REFERENCES [dbo].[HomeownerPastThreeYearsTypes] (
		[HomeownerPastThreeYearsTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Borrowers_HousingExpenseTypes] FOREIGN KEY 
	(
		[fk_HousingExpenseTypeID]
	) REFERENCES [dbo].[HousingExpenseTypes] (
		[HousingExpenseTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Borrowers_IntentToOccupyTypes] FOREIGN KEY 
	(
		[fk_IntentToOccupyTypeID]
	) REFERENCES [dbo].[IntentToOccupyTypes] (
		[IntentToOccupyTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Borrowers_MaritalStatusTypes] FOREIGN KEY 
	(
		[fk_MaritalStatusTypeID]
	) REFERENCES [dbo].[MaritalStatusTypes] (
		[MaritalStatusTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Borrowers_RaceNationalOriginTypes] FOREIGN KEY 
	(
		[fk_RaceNationalOrginTypeID]
	) REFERENCES [dbo].[RaceNationalOriginTypes] (
		[RaceNationalOriginTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [fk_FNMCreditReportScoreTypes_Borrowers] FOREIGN KEY 
	(
		[fk_FNMCreditReportScoreTypeID]
	) REFERENCES [dbo].[FNMCreditReportScoreTypes] (
		[FNMCreditReportScoreTypeID]
	) NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[Buydowns] ADD 
	CONSTRAINT [FK_Buydowns_BuydownBaseDateTypes] FOREIGN KEY 
	(
		[fk_BuydownBaseDateType]
	) REFERENCES [dbo].[BuydownBaseDateTypes] (
		[BuydownBaseDateTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Buydowns_BuydownContributorTypes] FOREIGN KEY 
	(
		[fk_BuydownContributorTypeID]
	) REFERENCES [dbo].[BuydownContributorTypes] (
		[BuydownContributorTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Buydowns_BuydownSubsidyCalculationTypes] FOREIGN KEY 
	(
		[fk_BuydownSubsidyCalculationTypeID]
	) REFERENCES [dbo].[BuydownSubsidyCalculationTypes] (
		[BuydownSubsidyCalculationTypeID]
	) NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[Dependents] ADD 
	CONSTRAINT [FK_Dependents_Borrowers] FOREIGN KEY 
	(
		[fk_BorrowerID]
	) REFERENCES [dbo].[Borrowers] (
		[BorrowerID]
	) ON DELETE CASCADE  ON UPDATE CASCADE  NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[Employment] ADD 
	CONSTRAINT [FK_Employment_Borrowers] FOREIGN KEY 
	(
		[fk_BorrowerID]
	) REFERENCES [dbo].[Borrowers] (
		[BorrowerID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Employment_IncomeTypes] FOREIGN KEY 
	(
		[fk_IncomeTypeID]
	) REFERENCES [dbo].[IncomeTypes] (
		[IncomeTypeID]
	) NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[Escrows] ADD 
	CONSTRAINT [FK_Escrows_EscrowItemTypes] FOREIGN KEY 
	(
		[fk_EscrowItemType]
	) REFERENCES [dbo].[EscrowItemTypes] (
		[EscrowItemTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Escrows_EscrowPaidByTypes] FOREIGN KEY 
	(
		[fk_EscrowPaidByType]
	) REFERENCES [dbo].[EscrowPaidByTypes] (
		[EscrowPaidByTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Escrows_EscrowPaymentFrequencyTypes] FOREIGN KEY 
	(
		[fk_EscrowPaymentFrequencyType]
	) REFERENCES [dbo].[EscrowPaymentFrequencyTypes] (
		[EscrowPaymentFrequencyTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Escrows_EscrowPremiumPaidByTypes] FOREIGN KEY 
	(
		[fk_EscrowPremiumPaidByTypes]
	) REFERENCES [dbo].[EscrowPremiumPaidByTypes] (
		[EscrowPremiumPaidByTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Escrows_EscrowPremiumPaymentTypes] FOREIGN KEY 
	(
		[fk_EscrowPremiumPaymentType]
	) REFERENCES [dbo].[EscrowPremiumPaymentTypes] (
		[EscrowPremiumPaymentTypeID]
	) NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[FHADeclarations] ADD 
	CONSTRAINT [FK_FHADeclarations_Borrowers] FOREIGN KEY 
	(
		[fk_BorrowerID]
	) REFERENCES [dbo].[Borrowers] (
		[BorrowerID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_FHADeclarations_DeclarationExplanationTypes] FOREIGN KEY 
	(
		[fk_DeclarationExplanationTypeID]
	) REFERENCES [dbo].[DeclarationExplanationTypes] (
		[DeclarationExplanationTypeID]
	) NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[Liabilities] ADD 
	CONSTRAINT [FK_Liabilities_Borrowers] FOREIGN KEY 
	(
		[fk_BorrowerID]
	) REFERENCES [dbo].[Borrowers] (
		[BorrowerID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Liabilities_LiabilityTypes] FOREIGN KEY 
	(
		[fk_LiabilityTypeID]
	) REFERENCES [dbo].[LiabilityTypes] (
		[LiabilityTypeID]
	) NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[Mortgage] ADD 
	CONSTRAINT [FK_Mortgage_ARMS] FOREIGN KEY 
	(
		[fk_ARMSID]
	) REFERENCES [dbo].[ARMS] (
		[ARMSID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Mortgage_Buydowns] FOREIGN KEY 
	(
		[fk_BuydownID]
	) REFERENCES [dbo].[Buydowns] (
		[BuydownID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Mortgage_CaseStateTypes] FOREIGN KEY 
	(
		[fk_CaseTypeID]
	) REFERENCES [dbo].[CaseStateTypes] (
		[CaseStateTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Mortgage_Escrows] FOREIGN KEY 
	(
		[fk_EscrowID]
	) REFERENCES [dbo].[Escrows] (
		[EscrowID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Mortgage_EstimatedPrepaidDaysPaidByTypes] FOREIGN KEY 
	(
		[fk_EstimatedPrepaidDaysPaidByTypeID]
	) REFERENCES [dbo].[EstimatedPrepaidDaysPaidByTypes] (
		[EstimatedPrepaidDaysPaidByTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Mortgage_LienPriorityTypes] FOREIGN KEY 
	(
		[fk_LienPriorityTypeID]
	) REFERENCES [dbo].[LienPriorityTypes] (
		[LienPriorityTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Mortgage_LoanAmortizationTypes] FOREIGN KEY 
	(
		[fk_LoanAmortizationTypeID]
	) REFERENCES [dbo].[LoanAmortizationTypes] (
		[LoanAmortizationTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Mortgage_LoanRepaymentTypes] FOREIGN KEY 
	(
		[fk_LoanRepaymentTypeID]
	) REFERENCES [dbo].[LoanRepaymentTypes] (
		[LoanRepaymentTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Mortgage_MortgageInsurance] FOREIGN KEY 
	(
		[fk_MortgageInsuranceID]
	) REFERENCES [dbo].[MortgageInsurance] (
		[MortgageInsuranceID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Mortgage_MortgageScoreTypes] FOREIGN KEY 
	(
		[fk_MortgageScoreTypeID]
	) REFERENCES [dbo].[MortgageScoreTypes] (
		[MortgageScoreTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Mortgage_MortgageTypes] FOREIGN KEY 
	(
		[fk_MortgageTypeID]
	) REFERENCES [dbo].[MortgageTypes] (
		[MortgageTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Mortgage_PaymentAdjustments] FOREIGN KEY 
	(
		[fk_PaymentAdjustmentID]
	) REFERENCES [dbo].[PaymentAdjustments] (
		[PaymentAdjustmentID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Mortgage_PaymentFrequencyTypes] FOREIGN KEY 
	(
		[fk_PaymentFrequencyTypeID]
	) REFERENCES [dbo].[PaymentFrequencyTypes] (
		[PaymentFrequencyTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Mortgage_RateAdjustmentCalculationTypes] FOREIGN KEY 
	(
		[fk_RateAdjustmentCalculationTypeID]
	) REFERENCES [dbo].[RateAdjustmentCalculationTypes] (
		[RateAdjustmentCalculationTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Mortgage_SummaryAmountTypes] FOREIGN KEY 
	(
		[fk_SummaryAmountTypeID]
	) REFERENCES [dbo].[SummaryAmountTypes] (
		[SummaryAmountTypeID]
	) NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[MortgageInsurance] ADD 
	CONSTRAINT [FK_MortgageInsurance_MICompanyNameTypes] FOREIGN KEY 
	(
		[fk_MICompanyNameTypeID]
	) REFERENCES [dbo].[MICompanyNameTypes] (
		[MICompanyNameTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_MortgageInsurance_MIDurationTypes] FOREIGN KEY 
	(
		[fk_MIDurationTypeID]
	) REFERENCES [dbo].[MIDurationTypes] (
		[MIDurationTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_MortgageInsurance_MILTVCutoffTypes] FOREIGN KEY 
	(
		[fk_MILTVCutoffTypeID]
	) REFERENCES [dbo].[MILTVCutoffTypes] (
		[MILTVCutoffTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_MortgageInsurance_MIPremiumRefundableTypes] FOREIGN KEY 
	(
		[fk_MIPremiumRefundableTypeID]
	) REFERENCES [dbo].[MIPremiumRefundableTypes] (
		[MIPremiumRefundableTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_MortgageInsurance_MIPremiumTaxCodeTypes] FOREIGN KEY 
	(
		[fk_MIPremiumTaxCodeTypeID]
	) REFERENCES [dbo].[MIPremiumTaxCodeTypes] (
		[MIPremiumTaxCodeTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_MortgageInsurance_MIRenewalCalculationTypes] FOREIGN KEY 
	(
		[fk_MIRenewalCalculationTypeID]
	) REFERENCES [dbo].[MIRenewalCalculationTypes] (
		[MIRenewalCalculationTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_MortgageInsurance_MIRenewalPremiumSequences] FOREIGN KEY 
	(
		[fk_MIRenewalPremiumSequenceID]
	) REFERENCES [dbo].[MIRenewalPremiumSequences] (
		[MIRenewalPremiumSequenceID]
	) NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[PaymentAdjustments] ADD 
	CONSTRAINT [FK_PaymentAdjustments_PaymentAdjustmentCalculationTypes] FOREIGN KEY 
	(
		[fk_PaymentAdjustmentCalculationTypeID]
	) REFERENCES [dbo].[PaymentAdjustmentCalculationTypes] (
		[PaymentAdjustmentCalculationTypeID]
	) NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[RESPA] ADD 
	CONSTRAINT [FK_RESPA_FeePaymentCollectedByTypes] FOREIGN KEY 
	(
		[fk_FeePaymentCollectedByTypeID]
	) REFERENCES [dbo].[FeePaymentCollectedByTypes] (
		[FeePaymentCollectedByTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_RESPA_FeePaymentPaidByTypes] FOREIGN KEY 
	(
		[fk_FeePaymentPaidByTypeID]
	) REFERENCES [dbo].[FeePaymentPaidByTypes] (
		[FeePaymentPaidByTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_RESPA_FeePaymentProcessTypes] FOREIGN KEY 
	(
		[fk_FeePaymentProcessTypeID]
	) REFERENCES [dbo].[FeePaymentProcessTypes] (
		[FeePaymentProcessTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_RESPA_FeeResponsiblePartyTypes] FOREIGN KEY 
	(
		[fk_FeeResponsiblePartyTypeID]
	) REFERENCES [dbo].[FeeResponsiblePartyTypes] (
		[FeeResponsiblePartyTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_RESPA_FeeTypes] FOREIGN KEY 
	(
		[fk_FeeTypeID]
	) REFERENCES [dbo].[FeeTypes] (
		[FeeTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_RESPA_SectionClassificationTypes] FOREIGN KEY 
	(
		[fk_SectionClassificationTypeID]
	) REFERENCES [dbo].[SectionClassificationTypes] (
		[SectionClassificationTypeID]
	) NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[Residences] ADD 
	CONSTRAINT [fk_BasisTypeID_Residence] FOREIGN KEY 
	(
		[fk_ResidencyBasisTypeID]
	) REFERENCES [dbo].[ResidencyBasisTypes] (
		[ResidencyBasisTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_Residences_Borrowers] FOREIGN KEY 
	(
		[fk_BorrowerID]
	) REFERENCES [dbo].[Borrowers] (
		[BorrowerID]
	) ON DELETE CASCADE  ON UPDATE CASCADE  NOT FOR REPLICATION ,
	CONSTRAINT [FK_Residences_ResidencyTypes] FOREIGN KEY 
	(
		[fk_ResidencyTypeID]
	) REFERENCES [dbo].[ResidencyTypes] (
		[ResidencyTypeID]
	) NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[SubjectProperties] ADD 
	CONSTRAINT [FK_SubjectProperties_BuildingStatusTypes] FOREIGN KEY 
	(
		[fk_BuildingStatusTypeID]
	) REFERENCES [dbo].[BuildingStatusTypes] (
		[BuildingStatusTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_SubjectProperties_CurrentFirstMortgageHolderTypes] FOREIGN KEY 
	(
		[fk_CurrentFirstMortgageHolderTypeID]
	) REFERENCES [dbo].[CurrentFirstMortgageHolderTypes] (
		[CurrentFirstMortgageHolderTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_SubjectProperties_GSEProjectClassificationTypes] FOREIGN KEY 
	(
		[fk_GSEProjectClassificationTypeID]
	) REFERENCES [dbo].[GSEProjectClassificationTypes] (
		[GSEProjectClassificationTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_SubjectProperties_GSEPropertyTypes] FOREIGN KEY 
	(
		[fk_GSEPropertyTypeID]
	) REFERENCES [dbo].[GSEPropertyTypes] (
		[GSEPropertyTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_SubjectProperties_PropertyLegalDescriptionTypes] FOREIGN KEY 
	(
		[fk_PropertyLegalDescriptionTypeID]
	) REFERENCES [dbo].[PropertyLegalDescriptionTypes] (
		[PropertyLegalDescriptionTypeID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_SubjectProperties_PropertyRightsTypes] FOREIGN KEY 
	(
		[fk_PropertyRightsTypeID]
	) REFERENCES [dbo].[PropertyRightsTypes] (
		[PropertyRightsTypeID]
	) NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[VABorrower] ADD 
	CONSTRAINT [FK_VABorrower_Borrowers] FOREIGN KEY 
	(
		[fk_BorrowerID]
	) REFERENCES [dbo].[Borrowers] (
		[BorrowerID]
	) NOT FOR REPLICATION ,
	CONSTRAINT [FK_VABorrower_VACoBorrower] FOREIGN KEY 
	(
		[fk_VACoBorrowerID]
	) REFERENCES [dbo].[VACoBorrower] (
		[VACoBorrowerID]
	) NOT FOR REPLICATION 
GO


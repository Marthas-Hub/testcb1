%dw 2.0
output application/json skipNullOn = "everywhere"
---
{
   	hasConsumerDeclaration: payload.hasConsumerDeclaration,
    bankruptcies: payload.bankruptcies map ( bankruptcy , indexOfBankruptcy ) -> {
        filedDate: bankruptcy.filedDate,
		disposition: {
   			status: bankruptcy.disposition.status,
            subStatus: bankruptcy.disposition.subStatus,
			settledDate: bankruptcy.disposition.settledDate
		},
        assetAmount: {
			amount: bankruptcy.assetAmount.amount,
			currencyCode: bankruptcy.assetAmount.currencyCode
		},
		liabilityAmount: {
			amount: bankruptcy.liabilityAmount.amount,
			currencyCode: bankruptcy.liabilityAmount.currencyCode
		},
		narratives: bankruptcy.narratives map ( narrative , indexOfNarrative ) -> {
			code: narrative.code,
			description: narrative.description
		}
	},
    collections: payload.collections map ( collection , indexOfCollection ) -> {
        agencyName: collection.agencyName,
        assignedDate: collection.assignedDate,
        verifiedDate: collection.verifiedDate,
		balanceAmount: {
			amount: collection.balanceAmount.amount,
			currencyCode: collection.balanceAmount.currencyCode
		},
        originalAmount: {
			amount: collection.originalAmount.amount,
			currencyCode: collection.originalAmount.currencyCode
		},
        narratives: {
			code: collection.narratives.code,
			description: collection.narratives.description
		},
		code: collection.code,
		description: collection.description
	},
    consumerStatements: payload.consumerStatements map ( consumerStatement , indexOfConsumerStatement ) -> {
		reportedDate: consumerStatement.reportedDate,
		statement: consumerStatement.statement
	},
    judgments: payload.judgments map ( judgment , indexOfJudgment ) -> {
        amount: {
			amount: judgment.amount.amount,
			currencyCode: judgment.amount.currencyCode
		},
		caseNumber: judgment.caseNumber,
        courtName: judgment.courtName,
		filedDate: judgment.filedDate,
        satisfiedDate: judgment.satisfiedDate,
		status: {
			code: judgment.status.code,
			description: judgment.status.description
		},
        verifiedDate: judgment.verifiedDate,
        narratives: judgment.narratives map ( narrative , indexOfNarrative ) -> {
			code: narrative.code,
			description: narrative.description
		},
		code: judgment.code,
		description: judgment.description
	},
    inquiries: payload.inquiries map ( inquiry , indexOfInquiry ) -> {
		customerId: inquiry.customerId,
		customerName: inquiry.customerName,
		inquiredDate: inquiry.inquiredDate
	},
    otherNames: payload.otherNames map ( otherName , indexOfOtherName ) -> {
		firstName: otherName.firstName,
        middleName: otherName.middleName,
		lastName: otherName.lastName,
		suffix: otherName.suffix
	},
	scores: payload.scores map ( score , indexOfScore ) -> {
        name: score.name,
		result: score.result
	},
	specialServices: payload.specialServices map ( specialService , indexOfSpecialService ) -> {
        "type": specialService."type",
		reportedDate: specialService.reportedDate
	},
    trades: payload.trades map ( trade , indexOfTrade ) -> {
		creditorName: trade.creditorName,
		openedDate: trade.openedDate,
		reportedDate: trade.reportedDate,
		balanceAmount: {
			amount: trade.balanceAmount.amount,
			currencyCode: trade.balanceAmount.currencyCode
		},
		highCreditAmount: {
			amount: trade.highCreditAmount.amount,
			currencyCode: trade.highCreditAmount.currencyCode
		},
		pastDueAmount: {
			amount: trade.pastDueAmount.amount,
			currencyCode: trade.pastDueAmount.currencyCode
		},
		paymentTermAmount: {
			amount: trade.paymentTermAmount.amount,
			currencyCode: trade.paymentTermAmount.currencyCode
		},
		paymentRate: {
			code: trade.paymentRate.code,
			description: trade.paymentRate.description
		},
		portfolioType: trade.portfolioType,
		status: trade.status,
		narratives: trade.narratives map ( narrative , indexOfNarrative ) -> {
			code: narrative.code,
			description: narrative.description
		}
	},
    fileInfo: {
		bureauName: payload.fileInfo.bureauName,
		fileId: payload.fileInfo.fileId,
		createdDate: payload.fileInfo.createdDate,
		lastActivityDate: payload.fileInfo.lastActivityDate,
		totalNumberOfInquiries: payload.fileInfo.totalNumberOfInquiries,
	},
    isHit: payload.isHit,
    hitStrength: payload.hitStrength,
	subject: {
        dateOfBirth: payload.subject.dateOfBirth,
		dateOfDeath: payload.subject.dateOfDeath,
		socialInsuranceNumber: payload.subject.socialInsuranceNumber,
		maritalStatus: payload.subject.maritalStatus,
		numberOfDependants: payload.subject.numberOfDependants,
		firstName: payload.subject.firstName,
		middleName: payload.subject.middleName,
		lastName: payload.subject.lastName,
		suffix: payload.subject.suffix,
	},
    currentAddresses: payload.currentAddresses map ( currentAddress , indexOfCurrentAddress ) -> {
		reportedDate: currentAddress.reportedDate,
		unitNumber: currentAddress.unitNumber,
		civicNumber: currentAddress.civicNumber,
        streetName: currentAddress.streetName,
		city: currentAddress.city,
		provinceCode: currentAddress.provinceCode,
		postalCode: currentAddress.postalCode,
		countryCode: currentAddress.countryCode,
	},
	previousAddresses: payload.previousAddresses map ( previousAddress , indexOfPreviousAddress ) -> {
		reportedDate: previousAddress.reportedDate,
		unitNumber: previousAddress.unitNumber,
		civicNumber: previousAddress.civicNumber,
        streetName: previousAddress.streetName,
		city: previousAddress.city,
		provinceCode: previousAddress.provinceCode,
		postalCode: previousAddress.postalCode,
		countryCode: previousAddress.countryCode,
	},
	sourceResponse: payload.sourceResponse,
	errors: payload.errors map ( error , indexOfError ) -> {
		code: error.code,
		description: error.description
	}
}
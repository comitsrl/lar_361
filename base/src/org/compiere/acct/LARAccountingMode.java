package org.compiere.acct;

import java.util.Properties;

import org.compiere.model.MSysConfig;

final class LARAccountingMode
{
	private static final String SYSCONFIG_USE_LEGACY_NATIVE_ACCOUNTING = "LAR_UseLegacyNativeAccounting";

	private LARAccountingMode()
	{
	}

	static boolean useLegacyNativeAccounting(Properties ctx, int adClientId)
	{
		return MSysConfig.getBooleanValue(SYSCONFIG_USE_LEGACY_NATIVE_ACCOUNTING, true, adClientId);
	}
}

package org.itsolution.hardware.penjualan.util;

import java.util.concurrent.ThreadLocalRandom;

public class IDGenerator {
	
	public static Integer generatePemesananID() {
		return ThreadLocalRandom.current().nextInt(100_000, 999_999 + 1);
	}

	public static Integer generateImageName() {
		return ThreadLocalRandom.current().nextInt(100_000, 999_999 + 1);	
	}

}

/*
 * generated by Xtext 2.10.0
 */
package io.github.jhipster.jdl.ui.tests;

import com.google.inject.Injector;
import io.github.jhipster.jdl.ui.internal.JdlActivator;
import org.eclipse.xtext.junit4.IInjectorProvider;

public class JDLUiInjectorProvider implements IInjectorProvider {

	@Override
	public Injector getInjector() {
		return JdlActivator.getInstance().getInjector("io.github.jhipster.jdl.JDL");
	}

}
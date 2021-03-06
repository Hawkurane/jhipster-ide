/**
 * Copyright 2013-2018 the original author or authors from the JHipster project.
 *
 * This file is part of the JHipster project, see http://www.jhipster.tech/
 * for more information.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package io.github.jhipster.jdl.util

import com.google.inject.Inject
import io.github.jhipster.jdl.jdl.JdlRelation
import io.github.jhipster.jdl.jdl.JdlRelationRole
import io.github.jhipster.jdl.jdl.JdlRelationship
import org.eclipse.emf.ecore.EObject
import org.eclipse.xtext.documentation.IEObjectDocumentationProvider

import static org.eclipse.xtext.EcoreUtil2.*

/**
 * @author Serano Colameo - Initial contribution and API
 */
class JdlModelUtil {
	
	@Inject IEObjectDocumentationProvider documentationProvider;

	def String getDocumentation(EObject source) {
		if (source === null) return '' // prevent NPE
		val documentation = documentationProvider.getDocumentation(source)
		return documentation;
	}
	
	def static JdlRelation getOpposite(JdlRelationRole relationRole) {
        if (relationRole === null) return null
        val relation = relationRole.eContainer as JdlRelation
        val relship = getContainerOfType(relationRole.eContainer, JdlRelationship)
        val opposite = if (relship.source === relation) relship.target else relship.source
        return opposite
	}
}

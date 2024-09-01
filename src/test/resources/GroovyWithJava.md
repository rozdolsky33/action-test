
classLoader.getClass().name

    Java run recognizes only Java StepDefs
    Java   run uses jdk.internal.loader.ClassLoaders$AppClassLoader
    
    Java run recognizes only Groovy StepDefs
    Groovy run uses jdk.internal.loader.ClassLoaders$AppClassLoader

See BackendServiceLoader.loadBackends(Iterable<BackendProviderService> serviceLoader)
    serviceLoader contains 2 instances:
        JavaBackend 
        GroovyBackend

        Runner constructor
            for (Backend backend : backends) {
                log.debug(() -> "Loading glue for backend " + backend.getClass().getName());
                backend.loadGlue(this.glue, gluePaths);
            }
  * Issue: JavaBackend.loadGlue() in Lambda it does not go into forEach
  * as a result, Java step definitions are not being loaded


FeaturePathFeatureSupplier used by:
    Groovy
    Java ?

Java run
----
ClassLoader.packages - 4:
    "groovyResetJarjarAsm" -> {Package@1135} "package groovyResetJarjarAsm, Groovy Reset Agent, version 1.0.0"
    "org.groovy.debug.hotswap" -> {Package@1137} "package org.groovy.debug.hotswap, Groovy Reset Agent, version 1.0.0"
    "io.cucumber.core.cli" -> {Package@1139} "package io.cucumber.core.cli, Cucumber-JVM: Core, version 7.18"
    "com.intellij.rt.debugger" -> {Package@1141} "package com.intellij.rt.debugger"


Groovy run
----
ClassLoader.packages - 56:
    "org.codehaus.groovy.runtime" -> {Package@2049} "package org.codehaus.groovy.runtime, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.slf4j" -> {Package@2051} "package org.slf4j"
    "org.codehaus.groovy.jsr223" -> {Package@2053} "package org.codehaus.groovy.jsr223, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.runtime.metaclass" -> {Package@2055} "package org.codehaus.groovy.runtime.metaclass, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.control.messages" -> {Package@2057} "package org.codehaus.groovy.control.messages, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.macro.methods" -> {Package@2059} "package org.codehaus.groovy.macro.methods, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.reflection.v7" -> {Package@2061} "package org.codehaus.groovy.reflection.v7, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "groovy.lang" -> {Package@2063} "package groovy.lang, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.runtime.memoize" -> {Package@2065} "package org.codehaus.groovy.runtime.memoize, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.slf4j.spi" -> {Package@2067} "package org.slf4j.spi"
    "org.codehaus.groovy.runtime.powerassert" -> {Package@2069} "package org.codehaus.groovy.runtime.powerassert, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy" -> {Package@2071} "package org.codehaus.groovy, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.transform.trait" -> {Package@2073} "package org.codehaus.groovy.transform.trait, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.ast.expr" -> {Package@2075} "package org.codehaus.groovy.ast.expr, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "groovy.lang.groovydoc" -> {Package@2077} "package groovy.lang.groovydoc, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.apache.groovy.io" -> {Package@2079} "package org.apache.groovy.io, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.apache.groovy.swing.extensions" -> {Package@2081} "package org.apache.groovy.swing.extensions, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.slf4j.simple" -> {Package@2083} "package org.slf4j.simple"
    "org.codehaus.groovy.macro.runtime" -> {Package@2085} "package org.codehaus.groovy.macro.runtime, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.apache.groovy.util" -> {Package@2087} "package org.apache.groovy.util, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.edushak.testspec" -> {Package@2089} "package org.edushak.testspec"
    "org.apache.groovy.nio.extensions" -> {Package@2091} "package org.apache.groovy.nio.extensions, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.apache.groovy.datetime.extensions" -> {Package@2093} "package org.apache.groovy.datetime.extensions, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "groovy.util" -> {Package@2095} "package groovy.util, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.apache.groovy.plugin" -> {Package@2097} "package org.apache.groovy.plugin, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.vmplugin.v8" -> {Package@2099} "package org.codehaus.groovy.vmplugin.v8, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.vmplugin.v9" -> {Package@2101} "package org.codehaus.groovy.vmplugin.v9, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "groovy.io" -> {Package@2103} "package groovy.io, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.apache.groovy.util.concurrent" -> {Package@2105} "package org.apache.groovy.util.concurrent, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.ast" -> {Package@2107} "package org.codehaus.groovy.ast, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.classgen" -> {Package@2109} "package org.codehaus.groovy.classgen, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "groovy.transform" -> {Package@2111} "package groovy.transform, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.reflection" -> {Package@2113} "package org.codehaus.groovy.reflection, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.runtime.typehandling" -> {Package@2115} "package org.codehaus.groovy.runtime.typehandling, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.runtime.callsite" -> {Package@2117} "package org.codehaus.groovy.runtime.callsite, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.macro.matcher" -> {Package@2119} "package org.codehaus.groovy.macro.matcher, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.reflection.stdclasses" -> {Package@2121} "package org.codehaus.groovy.reflection.stdclasses, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.vmplugin" -> {Package@2123} "package org.codehaus.groovy.vmplugin, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.apache.groovy.sql.extensions" -> {Package@2125} "package org.apache.groovy.sql.extensions, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.slf4j.event" -> {Package@2127} "package org.slf4j.event"
    "org.slf4j.helpers" -> {Package@2129} "package org.slf4j.helpers"
    "org.codehaus.groovy.transform" -> {Package@2131} "package org.codehaus.groovy.transform, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.apiguardian.api" -> {Package@2134} "package org.apiguardian.api, apiguardian-api, version 1.1.2"
    "org.codehaus.groovy.runtime.wrappers" -> {Package@2136} "package org.codehaus.groovy.runtime.wrappers, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.vmplugin.v10" -> {Package@2138} "package org.codehaus.groovy.vmplugin.v10, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.util" -> {Package@2140} "package org.codehaus.groovy.util, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "groovyjarjarasm.asm" -> {Package@2142} "package groovyjarjarasm.asm, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.vmplugin.v16" -> {Package@2144} "package org.codehaus.groovy.vmplugin.v16, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.classgen.asm.util" -> {Package@2146} "package org.codehaus.groovy.classgen.asm.util, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.runtime.dgmimpl" -> {Package@2148} "package org.codehaus.groovy.runtime.dgmimpl, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.runtime.m12n" -> {Package@2150} "package org.codehaus.groovy.runtime.m12n, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.runtime.dgmimpl.arrays" -> {Package@2152} "package org.codehaus.groovy.runtime.dgmimpl.arrays, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "groovy.sql" -> {Package@2154} "package groovy.sql, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.apache.groovy.xml.extensions" -> {Package@2156} "package org.apache.groovy.xml.extensions, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.ast.stmt" -> {Package@2158} "package org.codehaus.groovy.ast.stmt, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"
    "org.codehaus.groovy.control" -> {Package@2160} "package org.codehaus.groovy.control, Groovy: a powerful, multi-faceted language for the JVM, version 4.0.15"

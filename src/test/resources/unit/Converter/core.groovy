package glue

import org.testspec.core.TestSpecException
import org.testspec.core.util.Helper

import static io.cucumber.groovy.EN.*

MILLIS_PER_HOUR = 3600 * 1000

Then(~/^service should( not)? be running on (.*):(.*)$/) { String shouldOrNot, String host, String port ->
    host = normalizeParameter(host) // Helper.detokenize(host, binding)
    port = normalizeParameter(port) // Helper.detokenize(port, binding)
    def (isRunning, failureReason) = Helper.isServiceRunning(host, port)
    if (shouldOrNot == null) {
        assert isRunning, failureReason
    } else {
        assert !isRunning
    }
}

Given(~/^I import files (.*)$/) { String filesList ->
    List<String> files = filesList.tokenize(',')
    files.each { String fileName ->
        File fileToImport = Helper.resolveFile(fileName, true)
        if (fileToImport.name.endsWith('.groovy')) {
            // a standard way to import Groovy script
            evaluate(fileToImport)
            /*
            if (binding.hasVariable('databases')) {
                def dbs = binding['databases']
                Map dataSources = parse(dbs)
                println dataSources.toMapString()
            }
            */

        } else if (fileToImport.name.endsWith('.dictionary')) {
            // custom parsing; TODO: do it via DataTable?  def dataTable = DataTable.create(raw)
            List<String> lines = fileToImport.readLines()
            Map variables = lines.
                collect { it.trim() }.
                grep { !(it.startsWith('#') || it == '') }.
                collect { it.tokenize('|') }.
                collectEntries { [ ((String)TestSpecWorld.noQuotes(it[0].trim())) : TestSpecWorld.noQuotes(it[1].trim()) ] }
            binding.variables.putAll(variables)

        } else if (fileToImport.name.endsWith('.properties')) {
            Properties variables = Helper.loadProperties(fileToImport)
            binding.variables.putAll(variables)

        } else {
            throw new TestSpecException("Unsupported file type for import: $fileToImport")
        }
    }
}

When(~/^I wait for (\d+) (milliseconds|seconds|minutes)$/) { long duration, String timeUnit ->
    long msDuration = TimeUnit."${timeUnit.toUpperCase()}".toMillis(duration)
    if (msDuration > MILLIS_PER_HOUR) {
        throw new TestSpecException('Waiting duration should not exceed 60 min')
    }
    sleep(msDuration)
}

When(~/^I execute code "([^"]*)":$/) { String descr, String code ->
    i_execute_code(false, code)
}

//When(~/^I execute command: (.*)$/) { String command ->
//    command = normalizeParameter(command, true)
//    if (Helper.isClosure(command)) {
//        command = Helper.evaluate(command, binding)
//    }
//    commandResults = Helper.executeCommand(command) // , async
//    binding.setVariable('_lastCommandResult', commandResults)
//}
//
//Then(~/^last command exit code should be (\d+)$/) { int expectedExitCode ->
//    assert commandResults.exitCode == expectedExitCode
//}
//
//Then(~/^last command (STDOUT|STDERR) should (be|contain|match) (.*)$/) { String outOrErr, String operator, String expectedValue ->
//    expectedValue = noQuotes(expectedValue)
//    if (operator == 'be') {
//        assert commandResults?."$outOrErr" == expectedValue
//    } else if (operator == 'contain') {
//        assert commandResults?."$outOrErr".contains(expectedValue)
//    } else {
//        assert commandResults?."$outOrErr" ==~ expectedValue
//    }
//}

//Map parse(Map<String, Map> databases) {
//    databases.collectEntries { String dbAlias, Map<String,Object> config ->
//        [ dbAlias : Sql.newInstance(config) ]
//    }
//}

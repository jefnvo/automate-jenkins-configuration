import groovy.json.JsonSlurper;
import jenkins.model.*
import com.cloudbees.plugins.credentials.*
import com.cloudbees.plugins.credentials.common.*
import com.cloudbees.plugins.credentials.domains.*
import com.cloudbees.plugins.credentials.impl.*
import com.cloudbees.jenkins.plugins.sshcredentials.impl.*
import org.jenkinsci.plugins.plaincredentials.*
import org.jenkinsci.plugins.plaincredentials.impl.*
import hudson.util.Secret
import hudson.plugins.sshslaves.*


domain = Domain.global()
store = Jenkins.instance.getExtensionList('com.cloudbees.plugins.credentials.SystemCredentialsProvider')[0].getStore()
def jsonSlurper = new JsonSlurper()

File json_file = new File('/usr/share/jenkins/ref/init.groovy.d/template_credentials.json')
def obj = jsonSlurper.parse(json_file)
obj.each {
  secretText = new StringCredentialsImpl(
    CredentialsScope.GLOBAL,
    it.id_secret,
    it.desc_secret,
    Secret.fromString(it.secret)
  )
  store.addCredentials(domain, secretText)
}

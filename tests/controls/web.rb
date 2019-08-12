title "Belong web server controls"

control "httpd" do
  title "Ensure httpd is properly configured"
  
  describe service('httpd') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end

  describe file("/var/www/html/index.html") do
    it { should be_file }
  end
end  

control "timezone" do
  title "Verify timezone is Australia/Melbourne"
  describe bash('cat /etc/sysconfig/clock | grep ZONE ') do
      its('stdout') { should include 'Australia/Melbourne' }
      its('stderr') { should eq '' }
      its('exit_status') { should eq 0 }
  end
end
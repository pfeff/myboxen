task :default => [:puppet]

task :puppet do
    sh %q{ puppet apply --modulepath=./mymodules:./modules manifests/site.pp }
end


### project-synchronizer
---

A set of utilites to keep a remote project folder synchronized with a local project folder, with the local folder being the active one.) 

----

#### Basics

A symbolic link is created to the script `projectsync-project`, named `sync-<project-folder-name>'.  
The call to the resulting scripts uses the name n he symbolic link as the project name, used  during
synchronizer.


Example: 
  `symlink`:  
    _~/projects/sync-test-project_  
  `project folder`:  
    _~/projects//test-project/_  
  `remote hostname`:  
   _devserver_  

  calling `projects/sync-test-project` would use rsync to copy all files or file modifcations to the 
  remote host, _devserver_:  `devserver:/home/remoteuser/projects/test-projects`.

  If the project was synchronized previously, rsync only transfers the modified file diffs.

---

### Building the project  ####

#### Dependancies ####
      - `rrep` -- replace patterns in files.   
         Install on debian with `apt-get install rrep`.
      
**You need to edit _config.defs_ to enter some important configuration details (remote username, etc.).**

`$ ./configure` -- generate some necessary files and configuration variables  <br/>
`$ make` -- this will build the scripts.  It calls the _build.sh_ script.  <br/>

Once the build is complete, copy the two files in _build/_ to your projects folder (i.e.  ~/development/projects).
To enable synchronized for `project1`, in your main projects directory:
    `$ ln -s project1 project-sync-project1`
    and finally,
    `$ ./project-sync-project1` will perform the actual directory synchronization.
    
---

### Notes

  - The `build.sh` shouldn't be called manually, as it is called automatically when you run `make`.

    
---

### License

`project-syncronize` is released under the MIT license (https://github.com/patinthehat/project-synchronizer/blob/master/LICENSE).

    



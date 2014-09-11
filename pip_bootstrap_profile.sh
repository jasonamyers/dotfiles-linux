
pip_bootstrap_runtime () {
    if [[ -z "${BOOTSTRAP_PYTHON}" ]]; then
        export BOOTSTRAP_PYTHON="/usr/bin/python";
    fi;

    if [[ -z "${PYTHON_USER_BIN}" ]]; then
        # Set up environment.

        # Note that you can’t just "import site", because distribute installs a
        # site.py without the __main__ block.

        export PYTHON_USER_BIN="$(${BOOTSTRAP_PYTHON} -c 'import site; site._script()' --user-base)/bin";
        export PYTHON_USER_LIB="$(${BOOTSTRAP_PYTHON} -c 'import site; site._script()' --user-site)";

        export PATH="${PYTHON_USER_BIN}:${PATH}";

        if [[ "$(uname)" == "Darwin" ]]; then
            export STANDARD_CACHE_DIR="${HOME}/Library/Caches/org.pip-installer.pip";
        else
            export STANDARD_CACHE_DIR="${XDG_CACHE_HOME:-${HOME}/.cache}/pip";
        fi;

        export WHEELHOUSE="${STANDARD_CACHE_DIR}/Wheelhouse";

        # Configure pip to always do the thing it should do out of the box, and not
        # re-download packages every time I sneeze.
        export PIP_USE_WHEEL="yes";
        export PIP_DOWNLOAD_CACHE="${STANDARD_CACHE_DIR}/Downloads";
        export PIP_FIND_LINKS="file://${WHEELHOUSE}";
        export PIP_WHEEL_DIR="${WHEELHOUSE}";

    fi;

    # Set up shell-local stuff unconditionally.
    if [[ -e "${PYTHON_USER_BIN}/virtualenvwrapper.sh" ]]; then
        source "${PYTHON_USER_BIN}/virtualenvwrapper.sh";
    fi;

    function pip () {

        # When you run "pip install" in your regular shell outside a
        # virtualenv, it should just work, meaning, install stuff into your
        # home directory.  But, let’s not affect the operation of pip within
        # virtualenvs or as executed by any tools (such as tox or virtualenv
        # itself) which need to run it via automation and not via a shell.

        if [[ -z "${VIRTUAL_ENV:-}" ]]; then
            env PIP_USER=yes pip "$@";
        else
            command pip "$@";
        fi;
    }
}

pip_bootstrap_runtime;



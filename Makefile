
SHELL:=/bin/bash
ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY:

all: dependencies

clean:
	# Remove existing environment
	rm -rf $(ROOT_DIR)/*.pyc
	if [ -d $(ROOT_DIR)/.eggs ]; then rm -rf $(ROOT_DIR)/.eggs; fi;
	if [ -d $(ROOT_DIR)/build ]; then rm -rf $(ROOT_DIR)/build; fi;
	if [ -d $(ROOT_DIR)/dist ]; then rm -rf $(ROOT_DIR)/dist; fi;
	if [ -d $(ROOT_DIR)/science_rcn.egg-info ]; then rm -rf $(ROOT_DIR)/science_rcn.egg-info; fi;
	if [ -d $(ROOT_DIR)/science_rcn_venv ]; then rm -rf $(ROOT_DIR)/science_rcn_venv; fi;

dependencies:
	if [ ! -d $(ROOT_DIR)/data/MNIST ]; then unzip -u -qq $(ROOT_DIR)/data/MNIST.zip -d $(ROOT_DIR)/data ; fi
	if [ ! -d $(ROOT_DIR)/science_rcn_venv ]; then virtualenv $(ROOT_DIR)/science_rcn_venv; fi
	source $(ROOT_DIR)/science_rcn_venv/bin/activate; yes w | python -m pip install . -v

package:
	source $(ROOT_DIR)/science_rcn_venv/bin/activate; python setup.py bdist_wheel

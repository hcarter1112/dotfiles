#!/bin/bash
cd / &&
	sh -c "$(curl -fsLS chezmoi.io/get)" &&
	cd /ARCH

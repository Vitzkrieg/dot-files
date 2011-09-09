################################################################################
# Matt T. Proud's UNIX Dot (.) Files and Configurations                        #
#                                                                              #
# You are free to use these as you wish, except for I request that you provide #
# attribution as well as a canonical link back to their source.                #
#                                                                              #
# - http://www.matttproud.com                                                  #
# - http://blog.matttproud.com                                                 #
# - https://github.com/matttproud                                              #
#                                                                              #
################################################################################

FIND ?= find
GIT ?= git
RM ?= rm -v

all: clean

clean:
	-$(FIND) -type f -iname '*~' -exec $(RM) '{}' ';'
	-$(FIND) -type f -iname '*#' -exec $(RM) '{}' ';'

update:
	$(GIT) pull

submit: clean update
	$(GIT) push

.PHONY: clean update submit
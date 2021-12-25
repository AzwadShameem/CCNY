#include <cassert> // Provides assert()
#include <cstdlib> // Provides NULL and size_t
#include "node2.h" // Provides linked list toolkit
#include "sequence2.h"
namespace assignment_sequence2 {

	sequence::sequence() {
		many_nodes = 0;
		h = p = c = t = NULL;
	}
	sequence::sequence(const sequence& source) {
		many_nodes = source.many_nodes;
		list_copy(source.h, h, t);
		if (size() != 0) {
			c = h;
			for (node* z = source.h; z != source.c; z = z->link()) { advance(); }
		}
		else { c = h = t = NULL; }
	
	}
	sequence::~sequence() {
		many_nodes = 0;
		c = NULL;
		list_clear(h);
	}
	void sequence::start() { c = h; }
	void sequence::advance() {
		assert(is_item());
		p = c;
		c = c->link();
	}
	void sequence::insert(const value_type& entry) {
		if (is_item()) {								// If current pointer != NULL //
			if (c == h)									// Special case if current pointer is not null and points to head then must use head insert //
			{
				list_head_insert(h, entry);
				c = h;
			}
			else {										// For everything else that is not the head, just insert normally) //
				list_insert(p, entry);
				c = p->link();
			}
		}
		else {											// If current pointer is null assume your inserting to the head //
			list_head_insert(h, entry);
			c = h;
		}	++many_nodes;
	}
	void sequence::attach(const value_type& entry) {
		if (size() == 0) {								// attaching to an empty list //
			list_head_insert(h, entry);
			p = c = t = h;
		}
		else if (!is_item() || c == t) {				// Attaching if current pointer points to an NULL or if current pointer points to the tail - at end of the list //
			list_insert(t, entry);
			p = t;
			c = t = t->link();
		}
		else if (is_item()) {							// If the current pointer is not null then just inert normally // 
			list_insert(c, entry);
			p = c;
			c = c->link();
		}	++many_nodes;
	}
	void sequence::remove_current() {
		assert(is_item());
		if (size() == 1) {								// removes head then resets all pointers - if only one node exists//
			list_head_remove(h);
			p = c = t = NULL;
		}
		else if (c == t) {								// if the current pointer is pointing to the nail then remove tail //
			t = p;
			c = NULL;
			list_remove(t);
		}
		else if (c == h) {								// if current pointer points to the head then remove the head //
			list_head_remove(h);
			p = NULL;
			c = h;
		}
		else {											// If none of the cases apply then just remove normally //
			c = c->link();
			list_remove(p);
		}   --many_nodes;
	}
	void sequence::operator =(const sequence& source) {
		if (&source != this) {
			many_nodes = source.many_nodes;
			list_clear(h);
			list_copy(source.h, h, t);
			if (size() != 0) {
				c = h;
				for (node* z = source.h; z != source.c; z = z->link()) { advance(); }
			}
			else { c = h = t = NULL; }
		}
	}
}
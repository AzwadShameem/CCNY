#include <cassert>
#include "sequence1.h"
using namespace std;
namespace weimin_csc212 {
    sequence1::sequence1() // Constructor
    {	used = 0;
    current_index = 0; }

    void sequence1::start()		{
        if (used != 0){
            current_index = 0;} }

    void sequence1::advance()	{
        if (is_item()){
            ++current_index;}	}

    void sequence1::insert(const value_type& entry){
        size_type i;
        assert(size() < CAPACITY);
        if (!is_item()){
            current_index = 0;}
        for (i = used; i > current_index; --i){
            data[i] = data[i-1];}
        data[current_index] = entry;
        ++used;								  }

    void sequence1::attach(const value_type& entry) {
        if (used < CAPACITY) {
            if (!is_item()) {
                current_index = ++used -1;
                data[current_index] = entry;
            } else {
                for (size_t i = used; i > current_index + 1; i--) {
                    data[i] = data[i-1];
                }
                data[++current_index] = entry;
                used++;
            }
        }
    }

    void sequence1::remove_current(){
        for (size_t i = current_index; i < used - 1;i++) {
            data[i] = data[i+1];
            }
            used--;
        }

    bool sequence1::is_item() const {
        if (used == 0) {
            return false;
        } else if (current_index >= 0 && current_index <= used - 1) {
            return true;
        } else if (current_index >= used) {
            return false;
        }
        return false;
    }
}

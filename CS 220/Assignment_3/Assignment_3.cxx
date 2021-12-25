/*Testcode for  220 Homework 3 Fall 2020: Exploration of a grid graph */
/* compiles with command line  gcc test.cpp -lX11 -lm */
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <cstdio>
#include <cstdlib>
#include <utility>
#include <unordered_map>
#include <queue>
using namespace std;

#define SIZE 50
#define BLOCKPERCENTAGE 47
#define FREE 1
#define BLOCKED 0

Display *display_ptr;
int screen_num;
char *display_name = nullptr;
unsigned int display_width, display_height;

Window win;
int border_width;
unsigned int win_width, win_height;
int win_x, win_y;

XWMHints *wm_hints;
XClassHint *class_hints;
XSizeHints *size_hints;
XTextProperty win_name, icon_name;
char *win_name_string = "Example Window";
char *icon_name_string = "Icon for Example Window";

XEvent report;

GC gc, gc_yellow, gc_green, gc_red, gc_orange, gc_grey;
unsigned long valuemask = 0;
XGCValues gc_values, gc_yellow_values, gc_green_values,
        gc_red_values, gc_orange_values, gc_grey_values;
Colormap color_map;
XColor tmp_color1, tmp_color2;

int stepx, stepy, startx, starty;
void used_edge(int sx, int sy, int tx, int ty);
void path_edge(int sx, int sy, int tx, int ty);
void find_path(const int *g, int sx, int sy, int tx, int ty);

int main(int argc, char **argv)
{ int graph[SIZE][SIZE][4]; int i,j,k;
    int sx,sy,tx,ty; /* start and target point */
    int rand_init_value;
    if( argc > 1 )
    {  sscanf(argv[1], "%d", &rand_init_value);
        srand( rand_init_value );
    }
    /* setup grid */
    for( i=0;i< SIZE; i++ )
        for( j=0; j <SIZE; j++)
        { graph[i][j][0]= FREE; graph[i][j][1] = FREE;
            graph[i][j][2]= FREE; graph[i][j][3] = FREE;
        }
    for( i=0;i< SIZE; i++ )
    { graph[i][0][3] = BLOCKED; graph[i][SIZE-1][1] = BLOCKED;
        graph[0][i][2] = BLOCKED; graph[SIZE-1][i][0] = BLOCKED;
    }
    /* Block random edges */
    for( i=0;i< SIZE; i++ )
        for( j=0; j <SIZE-1; j++)
        { if( rand()%100 < BLOCKPERCENTAGE )
            {   graph[i][j][1]= BLOCKED; graph[i][j+1][3] = BLOCKED;
            }
            if( rand()%100 < BLOCKPERCENTAGE )
            {   graph[j][i][0]= BLOCKED; graph[j+1][i][2] = BLOCKED;
            }
        }
    /* now generate start and target point */
    /* and make the edges going out FREE, and connected to the graph*/
    sx = rand()%(SIZE-2) +1;
    sy = rand()%(SIZE-2) +1;
    graph[sx][sy][0] = FREE;   graph[sx+1][sy][2] = FREE;
    graph[sx][sy][2] = FREE;   graph[sx-1][sy][0] = FREE;
    graph[sx][sy][1] = FREE;   graph[sx][sy+1][3] = FREE;
    graph[sx][sy][3] = FREE;   graph[sx][sy-1][1] = FREE;
    tx = rand()%(SIZE-4) +1;
    ty = rand()%(SIZE-4) +1;
    graph[tx][ty][0] = FREE;   graph[tx+1][ty][2] = FREE;
    graph[tx][ty][2] = FREE;   graph[tx-1][ty][0] = FREE;
    graph[tx][ty][1] = FREE;   graph[tx][ty+1][3] = FREE;
    graph[tx][ty][3] = FREE;   graph[tx][ty-1][1] = FREE;



    /* opening display: basic connection to X Server */
    if( (display_ptr = XOpenDisplay(display_name)) == NULL )
    { printf("Could not open display. \n"); exit(-1);}
    printf("Connected to X server  %s\n", XDisplayName(display_name) );
    screen_num = DefaultScreen( display_ptr );
    color_map  = XDefaultColormap( display_ptr, screen_num );
    display_width  = DisplayWidth( display_ptr, screen_num );
    display_height = DisplayHeight( display_ptr, screen_num );

    printf("Width %d, Height %d, Screen Number %d\n",
           display_width, display_height, screen_num);
    /* creating the window */
    border_width = 10;
    win_x = 0; win_y = 0;
    win_height = (int) (display_height/1.3);
    win_width = win_height; /*square window*/

    win= XCreateSimpleWindow( display_ptr, RootWindow( display_ptr, screen_num),
                              win_x, win_y, win_width, win_height, border_width,
                              BlackPixel(display_ptr, screen_num),
                              WhitePixel(display_ptr, screen_num) );
    /* now try to put it on screen, this needs cooperation of window manager */
    size_hints = XAllocSizeHints();
    wm_hints = XAllocWMHints();
    class_hints = XAllocClassHint();
    if( size_hints == NULL || wm_hints == NULL || class_hints == nullptr )
    { printf("Error allocating memory for hints. \n"); exit(-1);}

    size_hints -> flags = PPosition | PSize | PMinSize  ;
    size_hints -> min_width = 60;
    size_hints -> min_height = 60;

    XStringListToTextProperty( &win_name_string,1,&win_name);
    XStringListToTextProperty( &icon_name_string,1,&icon_name);

    wm_hints -> flags = StateHint | InputHint ;
    wm_hints -> initial_state = NormalState;
    wm_hints -> input = False;

    class_hints -> res_name = "x_use_example";
    class_hints -> res_class = "examples";

    XSetWMProperties( display_ptr, win, &win_name, &icon_name, argv, argc,
                      size_hints, wm_hints, class_hints );

    /* what events do we want to receive */
    XSelectInput( display_ptr, win,
                  ExposureMask | StructureNotifyMask | ButtonPressMask );

    /* finally: put window on screen */
    XMapWindow( display_ptr, win );

    XFlush(display_ptr);

    /* create graphics context, so that we may draw in this window */
    gc = XCreateGC( display_ptr, win, valuemask, &gc_values);
    XSetForeground( display_ptr, gc, BlackPixel( display_ptr, screen_num ) );
    XSetLineAttributes( display_ptr, gc, 4, LineSolid, CapRound, JoinRound);
    /* and some other graphics contexts, to draw in yellow and red and grey*/
    /* yellow*/
    gc_yellow = XCreateGC( display_ptr, win, valuemask, &gc_yellow_values);
    XSetLineAttributes(display_ptr, gc_yellow, 2, LineSolid,CapRound, JoinRound);
    if( XAllocNamedColor( display_ptr, color_map, "yellow",
                          &tmp_color1, &tmp_color2 ) == 0 )
    {printf("failed to get color yellow\n"); exit(-1);}
    else
        XSetForeground( display_ptr, gc_yellow, tmp_color1.pixel );
    /* green */
    gc_green = XCreateGC( display_ptr, win, valuemask, &gc_green_values);
    XSetLineAttributes(display_ptr, gc_yellow, 2, LineSolid,CapRound, JoinRound);
    if( XAllocNamedColor( display_ptr, color_map, "green",
                          &tmp_color1, &tmp_color2 ) == 0 )
    {printf("failed to get color green\n"); exit(-1);}
    else
        XSetForeground( display_ptr, gc_green, tmp_color1.pixel );
    /* red*/
    gc_red = XCreateGC( display_ptr, win, valuemask, &gc_red_values);
    XSetLineAttributes( display_ptr, gc_red, 2, LineSolid, CapRound, JoinRound);
    if( XAllocNamedColor( display_ptr, color_map, "red",
                          &tmp_color1, &tmp_color2 ) == 0 )
    {printf("failed to get color red\n"); exit(-1);}
    else
        XSetForeground( display_ptr, gc_red, tmp_color1.pixel );
    /* orange*/
    gc_orange = XCreateGC( display_ptr, win, valuemask, &gc_orange_values);
    XSetLineAttributes( display_ptr, gc_orange, 2, LineSolid, CapRound, JoinRound);
    if( XAllocNamedColor( display_ptr, color_map, "orange",
                          &tmp_color1, &tmp_color2 ) == 0 )
    {printf("failed to get color orange\n"); exit(-1);}
    else
        XSetForeground( display_ptr, gc_orange, tmp_color1.pixel );
    /* grey */
    gc_grey = XCreateGC( display_ptr, win, valuemask, &gc_grey_values);
    XSetLineAttributes( display_ptr, gc_grey, 3, LineSolid, CapRound, JoinRound);
    if( XAllocNamedColor( display_ptr, color_map, "dark grey",
                          &tmp_color1, &tmp_color2 ) == 0 )
    {printf("failed to get color grey\n"); exit(-1);}
    else
        XSetForeground( display_ptr, gc_grey, tmp_color1.pixel );

    /* and now it starts: the event loop */
    while(1)
    { XNextEvent( display_ptr, &report );
        switch( report.type )
        {
            case ConfigureNotify:
                /* This event happens when the user changes the size of the window*/
                win_width = report.xconfigure.width;
                win_height = report.xconfigure.height;
                /* break; this case continues into the next:after a resize,
                   the figure gets redrawn */
            case Expose:
                /* (re-)draw the figure. This event happens
                   each time some part of the window gets exposed (becomes visible) */
                XClearWindow( display_ptr, win );
                stepx = (int) (win_width/(SIZE+3));
                stepy = (int) (win_height/(SIZE+3));
                startx = 2*stepx;
                starty = 2*stepy;
                /* Draw Grid Subgraph */
                for(i = 0; i < SIZE; i++ )
                    for( j = 0; j < SIZE; j++ )
                    { /* First draw edges */
                        if(graph[i][j][0] ==  FREE)
                            XDrawLine(display_ptr, win, gc_grey,
                                      startx + i*stepx + (int) (0.33*stepx),
                                      starty + j*stepy + (int) (0.33*stepy),
                                      startx + (i+1)*stepx + (int) (0.33*stepx),
                                      starty + j*stepy + (int) (0.33*stepy) );
                        if(graph[i][j][1] ==  FREE)
                            XDrawLine(display_ptr, win, gc_grey,
                                      startx + i*stepx + (int) (0.33*stepx),
                                      starty + j*stepy + (int) (0.33*stepy),
                                      startx + i*stepx + (int) (0.33*stepx),
                                      starty + (j+1)*stepy + (int) (0.33*stepy) );
                        if(graph[i][j][2] ==  FREE)
                            XDrawLine(display_ptr, win, gc_grey,
                                      startx + i*stepx + (int) (0.33*stepx),
                                      starty + j*stepy + (int) (0.33*stepy),
                                      startx + (i-1)*stepx + (int) (0.33*stepx),
                                      starty + j*stepy + (int) (0.33*stepy) );
                        if(graph[i][j][3] ==  FREE)
                            XDrawLine(display_ptr, win, gc_grey,
                                      startx + i*stepx + (int) (0.33*stepx),
                                      starty + j*stepy + (int) (0.33*stepy),
                                      startx + i*stepx + (int) (0.33*stepx),
                                      starty + (j-1)*stepy + (int) (0.33*stepy) );
                    }
                /* now draw vertex */
                for(i = 0; i < SIZE; i++ )
                    for( j = 0; j < SIZE; j++ )
                        XFillArc( display_ptr, win, gc, /*black*/
                                  startx+ i*stepx, starty+ j*stepy, /*upper left corner */
                                  (int) (0.66*stepx), (int) (0.66*stepy), 0, 360*64);


                /* Draw Start and Target point yellow: before call of function*/
                XFillArc( display_ptr, win, gc_red, /*red*/
                          startx+ sx*stepx, starty+ sy*stepy,
                          (int) (0.66*stepx), (int) (0.66*stepy), 0, 360*64);
                XFillArc( display_ptr, win, gc_red, /*red*/
                          startx+ tx*stepx, starty+ ty*stepy,
                          (int) (0.66*stepx), (int) (0.66*stepy), 0, 360*64);

                /* Now call function to draw shortest path */
                find_path(&(graph[0][0][0]), sx,sy,tx,ty);
                /* Draw Start and Target point red, after function did its work*/
                XFillArc( display_ptr, win, gc_red, /*red*/
                          startx+ sx*stepx, starty+ sy*stepy,
                          (int) (0.66*stepx), (int) (0.66*stepy), 0, 360*64);
                XFillArc( display_ptr, win, gc_red, /*red*/
                          startx+ tx*stepx, starty+ ty*stepy,
                          (int) (0.66*stepx), (int) (0.66*stepy), 0, 360*64);

                break;
            default:
                /* this is a catch-all for other events; it does not do anything.
                       One could look at the report type to see what the event was */
                break;
        }

    }
    exit(0);
}

void used_edge(int sx, int sy, int tx, int ty)
{ if( abs(sx-tx) + abs(sy-ty) != 1)
        printf(" called used_edge to connect non-neighbors (%d,%d) and (%d,%d)\n", sx,sy, tx, ty);
    else
        XDrawLine(display_ptr, win, gc_green,
                  startx + sx*stepx + (int) (0.33*stepx),
                  starty + sy*stepy + (int) (0.33*stepy),
                  startx + tx*stepx + (int) (0.33*stepx),
                  starty + ty*stepy + (int) (0.33*stepy) );
}
void path_edge(int sx, int sy, int tx, int ty)
{ if( abs(sx-tx) + abs(sy-ty) != 1)
        printf(" called path_edge to connect non-neighbors (%d,%d) and (%d,%d)\n", sx,sy, tx, ty);
    else
        XDrawLine(display_ptr, win, gc_orange,
                  startx + sx*stepx + (int) (0.33*stepx),
                  starty + sy*stepy + (int) (0.33*stepy),
                  startx + tx*stepx + (int) (0.33*stepx),
                  starty + ty*stepy + (int) (0.33*stepy) );
}

struct pairs {
    template <class T1, class T2>
    size_t operator()(const pair<T1, T2>& p) const
    {
        auto hash1 = hash<T1>{}(p.first);
        auto hash2 = hash<T2>{}(p.second);
        return hash1 ^ hash2;
    }
};

void find_path(const int *g, int sx, int sy, int tx, int ty) {

    // Map to store the shortest path //
    unordered_map<pair<int, int>, pair<int, int>, pairs> map;
    // Visited to make sure that a point has not been revisited in the queue //
    unordered_map<pair<int, int>, bool, pairs> visited = {}; // default bool is false - false = not visited //
    // A queue called list to put all the neighbors of a point into //
    queue<pair<int, int>> list;
    // Used "Pair" so that we don't have to write x1,y1,x2,y2 - only have to write x,y //
    // Current stores the current point that is being viewed - initialized as start point  //
    pair<int, int> current(sx, sy);
    // Pushes start point into queue to be viewed //
    list.push(current);

    // While list is not empty look at all the neighbors of the front of the list //
    while (!list.empty()) {

        // Current is set to the front of the list to be inspected //
        current = list.front();
        // Pops so that the next point is the new front for the next iteration //
        list.pop();

        // Visited checks if false - meaning point has not been visited continue inspection of point //
        if (!visited[current]) {
            visited[current] = true; // Since the point is now being inspected declare visited true //

            if (g[(current.first*(SIZE*4))+(current.second*4)] == FREE) {
                // If the point to the right of the current point is free then draw a line connecting them //
                used_edge(current.first, current.second, current.first+1, current.second);
                list.push(make_pair(current.first+1, current.second));
                // Checks if the neighbor has been visited - if false - then add to the map and push to queue //
                if (!visited[make_pair(current.first + 1, current.second)]) {
                    map[make_pair(current.first+1, current.second)] = current;
                }
            }

            if (g[(current.first*(SIZE*4))+(current.second*4)+1] == FREE) {
                // If the point below the current point is free then draw a line connecting them and push to queue//
                used_edge(current.first, current.second, current.first, current.second+1);
                list.push(make_pair(current.first, current.second+1));
                // Checks if the neighbor has been visited - if false - then add to the map and push to queue //
                if (!visited[make_pair(current.first, current.second + 1)]) {
                    map[make_pair(current.first, current.second+1)] = current;
                }
            }
            if (g[(current.first*(SIZE*4))+(current.second*4)+2] == FREE) {
                // If the point to the left of the current point is free then draw a line connecting them and push to queue //
                used_edge(current.first, current.second, current.first-1, current.second);
                list.push(make_pair(current.first-1, current.second));
                // Checks if the neighbor has been visited - if false - then add to the map and push to queue //
                if (!visited[make_pair(current.first - 1, current.second)]) {
                    map[make_pair(current.first-1, current.second)] = current;
                }
            }

            if (g[(current.first*(SIZE*4))+(current.second*4)+3] == FREE) {
                // If the point above the current point is free then draw a line connecting them and push to queue //
                used_edge(current.first, current.second, current.first, current.second-1);
                list.push(make_pair(current.first, current.second-1));
                // Checks if the neighbor has been visited - if false - then add to the map and push to queue //
                if (!visited[make_pair(current.first, current.second - 1)]) {
                    map[make_pair(current.first, current.second-1)] = current;
                }
            }
        }
    }
    // Current is now set to the end point
    current = make_pair(tx, ty);
    // Cycles backwards or in otherwise cycles from the end point to the start point //
    while (current != make_pair(sx, sy)) {
        // Draws line from the current point to the next point //
        path_edge(current.first, current.second, map[current].first, map[current].second);
        // Cycles current which is the end point originally backwards each time to the start point //
        current = map[current];
    }
}
/* compiles with command line  g++ test.cpp -lX11 -lm */
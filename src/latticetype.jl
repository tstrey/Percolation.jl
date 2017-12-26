abstract type Lattice end
abstract type TwoDLattice <: Lattice end
abstract type SquareLattice <: TwoDLattice end
abstract type TriangularLattice <: TwoDLattice end
abstract type HoneycombLattice <: TwoDLattice end
abstract type KagomeLattice <: TwoDLattice end
abstract type HighDimLattice <: Lattice end


###############################################
# For 2D square and triangular lattice
###############################################
function MakeLattice(N::Int, probability::Float64)
    lattice = - ( rand(Float64, N, N) .< probability )
    return lattice
end


###############################################
# For Higher Dimension cubic lattice
###############################################
function nearlist(dim)
    list = Array[]
    for i in 1:dim
        listplus = zeros(Int, dim)
        listminus = zeros(Int, dim)
        listplus[i] = 1
        listminus[i] = -1
        push!(list, listplus)
        push!(list, listminus)
    end
    return list
end

function MakeSimpleLattice(N::Int, dim::Int, p::Float64)
    lattice = - ( rand([N for i in 1:dim]...) .< p )
    NearestNeighborList = nearlist(dim)
    return lattice, NearestNeighborList
end




##########################
# Square lattice
###########################
# nearest neighbor
type Squarenn <: SquareLattice
    N::Int # lattice linear size
    p::Float64 # occupied probability
    lattice::Matrix{Int} # configuration occupied or empty
    clustersize::Vector{Int} # the number of sites belonging to i th cluster.
    clustersizefreq::Vector{Tuple{Int,Int}}
    clusternumber::Vector{Tuple{Int,Float64}} # The cluster number n_s(p) denotes the number of s-clusters per lattice site. (s, n_s(p)), http://www.mit.edu/~levitov/8.334/notes/percol_notes.pdf
    average_clustersize::Float64
    strength::Float64 # The strength of the infinite cluster P(p) is the probability that an arbitrary site belongs to the infinite cluster.
    ispercolation::Bool

    function Squarenn(N, p)
        if N > 10^3
            error("Too large site size. Reduce the number of sites under or equal 1000 of linear size.\n")
        end

        lattice = MakeLattice(N, p)
        clustersize = Vector{Int}()
        clustersizefreq = Vector{Tuple{Int,Int}}()
        clusternumber = Vector{Tuple{Int,Float64}}()
        average_clustersize = 0.0
        strength = 0.0
        ispercolation = false

        new(N, p, lattice, clustersize, clustersizefreq, clusternumber, average_clustersize, strength, ispercolation)
    end
end

# nearest neighbor & next nearest neighbor
type Squarennn <: SquareLattice
    N::Int # lattice linear size
    p::Float64 # occupied probability
    lattice::Matrix{Int} # configuration occupied or empty
    clustersize::Vector{Int} # the number of sites belonging to i th cluster.
    clustersizefreq::Vector{Tuple{Int,Int}}
    clusternumber::Vector{Tuple{Int,Float64}} # The cluster number n_s(p) denotes the number of s-clusters per lattice site. (s, n_s(p)), http://www.mit.edu/~levitov/8.334/notes/percol_notes.pdf
    average_clustersize::Float64
    strength::Float64 # The strength of the infinite cluster P(p) is the probability that an arbitrary site belongs to the infinite cluster.
    ispercolation::Bool

    function Squarennn(N, p)
        if N > 10^3
            error("Too large site size. Reduce the number of sites under or equal 1000 of linear size.\n")
        end

        lattice = MakeLattice(N, p)
        clustersize = Vector{Int}()
        clustersizefreq = Vector{Tuple{Int,Int}}()
        clusternumber = Vector{Tuple{Int,Float64}}()
        average_clustersize = 0.0
        strength = 0.0
        ispercolation = false

        new(N, p, lattice, clustersize, clustersizefreq, clusternumber, average_clustersize, strength, ispercolation)
    end
end


###########################
# Triangular lattice
###########################
type Tri <: TriangularLattice
    N::Int # lattice linear size
    p::Float64 # occupied probability
    lattice::Matrix{Int} # configuration occupied or empty
    clustersize::Vector{Int} # the number of sites belonging to i th cluster.
    clustersizefreq::Vector{Tuple{Int,Int}}
    clusternumber::Vector{Tuple{Int,Float64}} # The cluster number n_s(p) denotes the number of s-clusters per lattice site. (s, n_s(p)), http://www.mit.edu/~levitov/8.334/notes/percol_notes.pdf
    average_clustersize::Float64
    strength::Float64 # The strength of the infinite cluster P(p) is the probability that an arbitrary site belongs to the infinite cluster.
    ispercolation::Bool

    function Tri(N, p)
        if N > 10^3
            error("Too large site size. Reduce the number of sites under or equal 1000 of linear size.\n")
        end

        lattice = MakeLattice(N, p)
        clustersize = Vector{Int}()
        clustersizefreq = Vector{Tuple{Int,Int}}()
        clusternumber = Vector{Tuple{Int,Float64}}()
        average_clustersize = 0.0
        strength = 0.0
        ispercolation = false

        new(N, p, lattice, clustersize, clustersizefreq, clusternumber, average_clustersize, strength, ispercolation)
    end
end


###########################
# Honeycomb lattice
###########################
type Honeycomb <: HoneycombLattice
    N::Int # lattice linear size
    p::Float64 # occupied probability
    lattice::Matrix{Int} # configuration occupied or empty
    clustersize::Vector{Int} # the number of sites belonging to i th cluster.
    clustersizefreq::Vector{Tuple{Int,Int}}
    clusternumber::Vector{Tuple{Int,Float64}} # The cluster number n_s(p) denotes the number of s-clusters per lattice site. (s, n_s(p)), http://www.mit.edu/~levitov/8.334/notes/percol_notes.pdf
    average_clustersize::Float64
    strength::Float64 # The strength of the infinite cluster P(p) is the probability that an arbitrary site belongs to the infinite cluster.
    ispercolation::Bool

    function Honeycomb(N, p)
        if N > 10^3
            error("Too large site size. Reduce the number of sites under or equal 1000 of linear size.\n")
        end

        lattice = MakeLattice(N, p)
        clustersize = Vector{Int}()
        clustersizefreq = Vector{Tuple{Int,Int}}()
        clusternumber = Vector{Tuple{Int,Float64}}()
        average_clustersize = 0.0
        strength = 0.0
        ispercolation = false

        new(N, p, lattice, clustersize, clustersizefreq, clusternumber, average_clustersize, strength, ispercolation)
    end
end


###########################
# Kagome lattice
###########################
type Kagome <: KagomeLattice
    N::Int # lattice linear size
    p::Float64 # occupied probability
    lattice::Matrix{Int} # configuration occupied or empty
    clustersize::Vector{Int} # the number of sites belonging to i th cluster.
    clustersizefreq::Vector{Tuple{Int,Int}}
    clusternumber::Vector{Tuple{Int,Float64}} # The cluster number n_s(p) denotes the number of s-clusters per lattice site. (s, n_s(p)), http://www.mit.edu/~levitov/8.334/notes/percol_notes.pdf
    average_clustersize::Float64
    strength::Float64 # The strength of the infinite cluster P(p) is the probability that an arbitrary site belongs to the infinite cluster.
    ispercolation::Bool

    function Kagome(N, p)
        if N > 10^3
            error("Too large site size. Reduce the number of sites under or equal 1000 of linear size.\n")
        end

        lattice = MakeLattice(N, p); for i in 2:2:N, j in 2:2:N; lattice[j,i] = 0; end
        clustersize = Vector{Int}()
        clustersizefreq = Vector{Tuple{Int,Int}}()
        clusternumber = Vector{Tuple{Int,Float64}}()
        average_clustersize = 0.0
        strength = 0.0
        ispercolation = false

        new(N, p, lattice, clustersize, clustersizefreq, clusternumber, average_clustersize, strength, ispercolation)
    end
end



###########################
# Z^d lattice
###########################
type Simplenn <: HighDimLattice
    N::Int
    dim::Int
    p::Float64
    lattice::Array{Int}
    clustersize::Vector{Int}
    NearestNeighborList::Array{Array,1}
    ispercolation::Bool

    function Simplenn(N, dim, p)
        lattice, NearestNeighborList = MakeSimpleLattice(N, dim, p)
        ispercolation = false
        clustersize = Vector{Int}()
        new(N, dim, p, lattice, clustersize, NearestNeighborList, ispercolation)
    end
end

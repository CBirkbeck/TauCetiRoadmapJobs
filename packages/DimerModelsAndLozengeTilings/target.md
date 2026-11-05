Verdict: design
Name: DimerModelsAndLozengeTilings
Base: none
Owner: none

## Scope

The roadmap builds two-dimensional lattice statistical mechanics in the library, with the
dimer model on the hexagonal lattice, equivalently lozenge tilings of the plane, as its
worked case. Nothing on main, in an open pull request, on the board or in the pinned libraries
owns dimers, lozenge tilings, height functions, Kasteleyn matrices, infinite-volume Gibbs
measures on a lattice, or ergodic translation-invariant measures of a ℤ²-action on a product
space (see `packages/DimerModelsAndLozengeTilings/reports/TARGET-DimerModelsAndLozengeTilings.md`).

**Generality.** The measure-theoretic layer is stated at the generality the sources use
(kos2006 Section 2.2, kenyon2009 Section 5): perfect matchings of a locally finite countable
graph `G` carrying a free action of ℤ² by graph automorphisms (a periodic graph) and a
positive ℤ²-periodic edge weight `w` (the Boltzmann weight of a finite matching is the product
of its edge weights). The configuration space, the Gibbs property with weights, translation
invariance, ergodicity, the extremality characterisations, and the convexity and closedness
statements are proved there once. The hexagonal lattice with all weights `1` (uniform lozenge
tilings) is the instance on which the combinatorial layers are built: the triangular lattice
and its faces, the three tile types, height functions, slopes, the Kasteleyn determinant for
simply connected domains, the torus construction and the explicit kernel. Periodic edge
weights on the hexagonal lattice (kos2006 "magnetic field", kenyon2009 Section 5.5) are
carried along wherever they cost nothing and are otherwise a Check.

**What the roadmap owns.**

- The triangular lattice 𝕋 (vertices ℤ², edges in directions ±(1,0), ±(0,1), ±(1,1)), its
  faces, lozenges and the three tile types, domains (finite or infinite induced subgraphs with
  a combinatorial simple-connectivity condition), lozenge tilings of a domain as sets of inner
  edges, the dual hexagonal graph, and the equivalence tiling ↔ perfect matching
  (aggarwal2023 lines 322–364; kenyon2009 Section 1.1; gorin2021 Lecture 1).
- The configuration space of matchings of a periodic graph inside `{0,1}^{E(G)}`, its
  topology and σ-algebra, the ℤ²-shift on configurations and on probability measures, the
  weak-* (local) topology on probability measures and its description by cylinder
  probabilities and correlation functions (aggarwal2023 lines 412–418; gorin2021 Section 13.1).
- Height functions of lozenge tilings of the plane and of domains, boundary height, the
  bijection with Lipschitz-type integer functions, and the Thurston tileability criterion
  (aggarwal2023 lines 384–407; gorin2021 Section 1.4 and Theorem 1.4; kenyon2009 Section 2.2).
- Gibbs measures, translation invariance, ergodicity, slopes and their structure theory
  (aggarwal2023 lines 413–456; gorin2021 Definitions 13.4–13.6, Lemma 13.7, Definition 13.10;
  kos2006 Section 2.2.1; sheffield2005 Lemmas 3.2.1–3.2.2).
- Existence of ergodic Gibbs measures of every slope by torus limits (kos2006 Theorem 2.1;
  kenyon2009 Sections 4.2 and 5.4), Sheffield's uniqueness theorem for interior slopes
  (sheffield2005 Theorem 9.1.1; gorin2021 Theorem 13.12), and the classification on the
  boundary of the slope triangle (sheffield2005 Theorem 9.5.1).
- Kasteleyn's theorem and the determinantal local statistics for finite simply connected
  domains and for the torus (gorin2021 Theorems 2.1, 3.1, 3.5 and 3.10; kenyon2009 Theorem 2
  and Corollary 3; kenyon1997 Theorems 2 and 6).
- The explicit kernel of the ergodic Gibbs measures: the torus-limit double contour integral
  (gorin2021 Theorem 4.11 and Corollary 13.14; kos2006 Theorem 4.3; kenyon2009 Section 6.1),
  its identification with the incomplete beta kernel `K_ξ` (aggarwal2023 Definition 1.3 and
  equation (1.2); okounkov-reshetikhin2003 Definition 4, Theorem 2 and equation (36)), and the
  discrete sine kernel along a line (gorin2021 Corollary 13.16).
- Local-statistics convergence of measures on tilings of growing domains, as needed to state
  aggarwal2023 Theorem 1.5.

**Boundaries.** The roadmap does not prove the variational principle, limit shapes or the
surface tension (cohn-kenyon-propp2001; gorin2021 Lectures 5–10; kos2006 Section 3), the
Kenyon–Okounkov–Sheffield phase classification through amoebae (kos2006 Sections 3–4), Gaussian
free field fluctuations, or Aggarwal's universality theorem (aggarwal2023 Theorem 1.5): these are
consumers. It does not build planar graph theory: Kasteleyn's theorem is stated for domains of the
triangular lattice, whose faces are explicit, and the general planar bipartite Kasteleyn theorem
(kenyon2009 Theorem 2 in full generality) is a Part II once the library has planar embeddings.
Domino tilings and other periodic graphs beyond the abstract layer are a Part II. Determinantal
point processes on continuous spaces stay with `TauCetiRoadmap/RandomMatrices` Layer 8 (main)
and the exclusions of `TauCetiRoadmap/PointProcesses` (PR #417); here a determinantal law is a
probability measure on `{0,1}^X` for a countable set `X` whose cylinder probabilities of inclusion
are minors of a kernel, defined locally. Ergodic theorems (Birkhoff, mean ergodic for ℤ²) are not
proved: ergodicity is used only as triviality of invariant events, and almost-sure tile densities
are a Check. Infinite-volume φ⁴ or Ising measures stay with
`DESIGN-ConstructiveFieldTheoryPhi4` (#6086), whose brief already records that only vocabulary is
shared with this target.

## Final targets

Notation: 𝕋 the triangular lattice, `𝔈(R)` the tilings of a domain `R`, `𝔈(𝕋)` the tilings of
the plane, `𝔓(𝕋)` the Borel probability measures on `𝔈(𝕋)`, `𝔖_w` the shift by `w ∈ ℤ²`,
`𝒯 = {(s,t) : s,t > 0, s+t < 1}` the open slope triangle and `𝒯̄` its closure.

1. **Tilings are dimer coverings.** For a domain `R ⊆ 𝕋` (an induced subgraph, finite or
   infinite, whose union of faces is simply connected in the combinatorial sense the design
   fixes), a lozenge tiling is a set `M` of edges of `R` such that every face of `R` contains
   exactly one edge of `M`; each edge of `M` is the inner edge of a lozenge of type 1, 2 or 3,
   the lozenges of `M` tile the union of faces of `R`, and `M ↦` (matched pairs of faces) is a
   bijection from `𝔈(R)` to the perfect matchings (Mathlib's `Subgraph.IsPerfectMatching`) of
   the dual hexagonal graph of `R`. Locators: aggarwal2023 lines 324–364; gorin2021 Lecture 1;
   kenyon2009 Section 1.1.

2. **The configuration space.** For a periodic graph `(G, ℤ²)` the set `𝔛(G)` of perfect
   matchings is a closed subset of `{0,1}^{E(G)}` with the product topology, hence compact and
   metrisable, and its Borel σ-algebra is generated by the cylinder events `{e ∈ M}`; ℤ² acts by
   homeomorphisms; the push-forward action on `𝔓(G)` is affine and continuous for the weak-*
   topology, for which `𝔓(G)` is compact; a sequence of measures converges iff every cylinder
   probability converges iff every correlation function `ρ_n(e_1,…,e_n) = μ(e_1,…,e_n ∈ M)`
   converges, and the correlation functions determine the measure. The instance `𝔈(𝕋)`, with
   `𝔖_w` and `𝔓(𝕋)`, is recorded. Locators: aggarwal2023 lines 412–418; gorin2021 Section 13.1,
   Definition 13.1 and Lemma 13.2.

3. **Height functions.** (a) For every `M ∈ 𝔈(𝕋)` there is a unique `H_M : ℤ² → ℤ` with
   `H_M(0,0) = 0`, `H_M(x+1,y) − H_M(x,y) = 1` exactly when `(x,y)` and `(x+1,y)` are vertices of
   one type-1 lozenge of `M` and `0` otherwise, and `H_M(x,y+1) − H_M(x,y) = 1` exactly when they
   are vertices of one type-2 lozenge and `0` otherwise; then `H_M(v) − H_M(u) ∈ {0,1}` for
   `v − u ∈ {(1,0),(0,1),(1,1)}`, and `M ↦ H_M` is a bijection from `𝔈(𝕋)` onto the functions
   `H : ℤ² → ℤ` with `H(0,0) = 0` and those increments. (b) For a domain `R` and a free tiling
   of `R`, the same with a prescribed value at one vertex; the boundary height `H|_{∂R}` of a
   tiling of a domain does not depend on the tiling. (c) Thurston's criterion: a finite simply
   connected domain `R` is tileable iff a boundary height function exists on `∂R` (increments
   `+1` along boundary edges in the three positive directions) and satisfies
   `h(v) − h(u) ≤ d_R(u,v)` for all `u, v ∈ ∂R`, with `d_R` the directed path distance inside
   `R` along positive-direction edges as in gorin2021 Section 1.4. Locators: aggarwal2023 lines
   384–407; gorin2021 Theorem 1.4 (lines 521–526) and its proof; thurston1990 (uncertified,
   original); kenyon2009 Section 2.2 for the flow description.

4. **Gibbs, translation-invariant and ergodic measures.** For a periodic weighted graph and
   `μ ∈ 𝔓(G)`: (a) `μ` is Gibbs iff for every finite set `A` of vertices and every configuration
   outside `A` the conditional law of the matching inside `A` is the Boltzmann law (uniform for
   weight `1`) on the finite set `Ω_A(M)` of completions compatible with the outside; the design
   states this through identities between cylinder probabilities, so that no regular conditional
   probability is needed, and proves it equivalent to the conditional-expectation form; `μ` is
   translation-invariant iff `𝔖_w μ = μ` for all `w`; a translation-invariant `μ` is ergodic iff
   it is an extreme point of the convex set `𝔓_inv` of translation-invariant measures. (b) A
   translation-invariant `μ` is ergodic iff every ℤ²-invariant Borel event has `μ`-measure `0`
   or `1` (Mathlib's `ErgodicVAdd` for the ℤ²-action); for translation-invariant `μ` every
   invariant event is `μ`-almost surely a tail event; conditioning a translation-invariant Gibbs
   measure on an invariant event of positive measure gives a translation-invariant Gibbs
   measure; hence a translation-invariant Gibbs measure is extreme in the translation-invariant
   Gibbs measures `𝒢_inv` iff it is extreme in `𝔓_inv` iff it is ergodic, and `𝒢_inv` is a
   face of `𝔓_inv`. (c) The Gibbs measures `𝒢`, `𝔓_inv` and `𝒢_inv` are weak-* closed convex
   subsets of `𝔓(G)`, hence compact. Locators: aggarwal2023 lines 413–420; gorin2021
   Definitions 13.4–13.6 and Lemma 13.7 (lines 4534–4582); kenyon2009 Section 5.1 (lines
   799–809); kos2006 Section 2.2.1 (lines 195–202); sheffield2005 Lemmas 3.2.1–3.2.2 (lines
   1352–1371), restating georgii2011 Theorems 7.7, 14.5 and 14.15 (uncertified).

5. **Slopes.** For translation-invariant `μ ∈ 𝔓(𝕋)` the slope is
   `(s,t) = (E_μ[H(1,0) − H(0,0)], E_μ[H(0,1) − H(0,0)])`; `s`, `t` and `1 − s − t` are the
   probabilities that a fixed face lies in a lozenge of type 1, 2 and 3, independent of the
   face; `(s,t) ∈ 𝒯̄`; the slope map `𝔓_inv → 𝒯̄` is affine and weak-* continuous, so its
   fibres meet `𝒢_inv` in closed convex sets whose extreme points are ergodic Gibbs measures.
   Locators: aggarwal2023 lines 421–431 and 453–456; gorin2021 Definition 13.10 and Remark 13.11
   (lines 4590–4642); kos2006 lines 203–205.

6. **Existence by torus limits.** For `n ≥ 1` let `H_n` be the hexagonal graph on the torus
   `𝕋/nℤ²`; its matchings are the `nℤ²`-periodic elements of `𝔈(𝕋)`; the height change
   `(h_x, h_y)` of a torus matching is defined and equals the numbers of type-1 and type-2
   lozenges per row and column, with every pair in `{0,…,n}²` of sum at most `n` attained. For
   `(s,t) ∈ 𝒯̄` let `μ_n^{s,t}` be the uniform measure on torus matchings with height change
   `(⌊ns⌋, ⌊nt⌋)`, viewed in `𝔓(𝕋)`. Every weak-* limit point of `(μ_n^{s,t})` is a
   translation-invariant Gibbs measure of slope `(s,t)`; hence for every `(s,t) ∈ 𝒯̄` there is
   a translation-invariant ergodic Gibbs measure of slope `(s,t)` (Krein–Milman on the fibre of
   target 5). Locators: kenyon2009 Section 4.2 (Lemma 4, lines 682–697) and Section 5.4 (lines
   845–866); kos2006 Theorem 2.1 (lines 215–220) and Section 2.2.2; gorin2021 Section 3.3.

7. **Sheffield's uniqueness theorem.** For every `(s,t) ∈ 𝒯` there is exactly one
   translation-invariant ergodic Gibbs measure `μ_{s,t} ∈ 𝔓(𝕋)` of slope `(s,t)`; consequently
   the translation-invariant Gibbs measures of slope `(s,t)` reduce to `{μ_{s,t}}`, and
   `μ_n^{s,t} → μ_{s,t}` (no subsequence). Locators: sheffield2005 Theorem 9.1.1 (lines
   5443–5445; the dimer model on the hexagonal lattice is the simply attractive potential of
   its Section 9.1 with `E = ℤ`, `d = 2`), with the reduction of Section 9.3 and Theorem 9.3.1;
   gorin2021 Theorem 13.12 (lines 4643–4668, proof idea); aggarwal2023 lines 457–459; kos2006
   Theorem 2.1 (lines 217–220, uniqueness for interior slopes); kenyon2009 Theorem 6.

8. **Failure of uniqueness on the boundary.** At each corner of `𝒯̄` the fibre is the point
   mass at the unique tiling using one tile type. For `(s,t)` on an open edge of `𝒯̄` (say
   `t = 0`, `0 < s < 1`, the other two edges by the rotation symmetry of 𝕋), a tiling with no
   type-2 lozenge is determined by the sequence `(H(x+1,0) − H(x,0))_{x ∈ ℤ} ∈ {0,1}^ℤ`, every
   sequence occurs, every completion set `Ω_A(M)` is a singleton, and `𝔖_{(0,1)}` acts
   trivially; therefore the translation-invariant ergodic Gibbs measures of slope `(s,0)` are in
   bijection with the shift-ergodic probability measures on `{0,1}^ℤ` of density `s`, of which
   there are at least two (the Bernoulli product measure and a stationary two-state Markov chain
   of density `s` with a different nearest-neighbour correlation). Locators: sheffield2005
   Theorem 9.5.1 (lines 6195–6198); gorin2021 lines 4638–4642 (extreme slopes); kenyon2009
   Exercise 13.

9. **Kasteleyn's theorem and local statistics on finite domains.** For a finite simply
   connected domain `R` with dual bipartite graph (white and black faces) and Kasteleyn matrix
   `K` (rows the white faces, columns the black faces, entry the edge weight for adjacent faces
   and `0` otherwise): the weighted number of tilings is `|det K|`, in particular `#𝔈(R) = |det K|`
   for weight `1`; and if `𝔈(R) ≠ ∅`, under the Boltzmann (uniform) measure the probability that
   given lozenges `(w_1,b_1),…,(w_k,b_k)` all occur is `∏ K(w_i,b_i) · det[K^{-1}(b_i,w_j)]`. On
   the torus `H_n` the partition function is a signed combination of the four determinants of
   the Kasteleyn matrices with twisted periodic boundary conditions, and the edge probabilities
   are the corresponding combination of minors. Locators: gorin2021 Theorem 2.1 (lines 714–717),
   Theorem 3.1, Theorem 3.5 (lines 1281–1288) and Theorem 3.10; kenyon2009 Theorem 2 (line 504,
   hexagonal-lattice proof lines 537–550) and Corollary 3 (lines 557–563); kenyon1997 Theorem 2
   (lines 184–186) and Theorem 6 (lines 366–373); kos2006 Theorem 4.2.

10. **The explicit kernel.** For `(s,t) ∈ 𝒯` the correlation functions of `μ_{s,t}` are
    determinantal: there is an explicit kernel, given as a double contour integral over the
    unit torus of a rational function with linear denominator (the limit of the torus inverse
    Kasteleyn matrices), such that the probability that lozenges `(w_1,b_1),…,(w_k,b_k)` occur
    is `∏ K(w_i,b_i) · det[K^{-1}(b_i,w_j)]`. Define for `ξ` in the upper half-plane the
    incomplete beta kernel `K_ξ(x_1,y_1;x_2,y_2) = (2πi)^{-1} ∫_{ξ̄}^{ξ} (1−z)^{y_1−y_2} z^{x_2−x_1−1} dz`
    along an arc crossing `(0,1)` when `y_1 ≥ y_2` and `(−∞,0)` when `y_1 < y_2`. Then for every
    `ξ` in the upper half-plane there is a unique `μ_ξ ∈ 𝔓(𝕋)` such that the set `X(M)` of
    type-1 lozenge positions satisfies `μ_ξ((x_1,y_1),…,(x_m,y_m) ∈ X(M)) = det[K_ξ(x_i,y_i;x_j,y_j)]`
    for all `m` and all points, and `μ_ξ = μ_{s,t}` for `ξ = e^{πis} sin(πt) / sin(π − πs − πt)`,
    so that `μ_{s,t}` may equivalently be defined by its kernel. Along a line of type-1
    lozenges the kernel reduces to the discrete sine kernel `sin(πsy)/(πy)`. The map `X(M) ↦ M`
    is injective on tilings with at least one type-1 lozenge. Locators: aggarwal2023 Definition
    1.2, Definition 1.3, equation (1.2) and lines 505–507; okounkov-reshetikhin2003 Definition 4
    (lines 965–968), Theorem 2 (lines 993–1006) and equation (36) (lines 1077–1083); gorin2021
    Theorem 4.11 (lines 1853–1871), Corollary 13.14 (lines 4695–4723) and Corollary 13.16 (lines
    4762–4778); kos2006 Theorem 4.3 (lines 714–725); kenyon2009 Section 6.1 (lines 958–975);
    kenyon1997 Section 4.5 and Theorem 1 (lozenge version, lines 77–80).

11. **Local-statistics convergence.** For domains `R_N ⊆ 𝕋`, measures `μ_N` on `𝔈(R_N)` and
    vertices `v_N`, define `𝔖_{v_N} μ_N → μ ∈ 𝔓(𝕋)` to mean that for every finite set `E_0` of
    edges and every configuration `σ` on `E_0`, for `N` large enough that `E_0 + v_N ⊆ E(R_N)`,
    `μ_N(M|_{E_0 + v_N} = σ + v_N) → μ(M|_{E_0} = σ)`; prove that the limit is unique, that the
    notion agrees with weak-* convergence in `𝔓(𝕋)` when all `R_N = 𝕋`, and that a limit of
    shifted uniform measures on tileable finite domains is a Gibbs measure. With targets 2–10 in
    place the statement of aggarwal2023 Theorem 1.5 (lines 572–580) is expressible in the
    library; proving it is a consumer's task. Locators: aggarwal2023 lines 568–580; gorin2021
    Section 13.2 (lines 4530–4541).

`Suggested.lean` states targets 1, 3(a), 3(c), 4(b), 6, 7, 8, 9 (finite-domain part), 10 and
11, each with `sorry`, against the simple definitions of 𝕋, tilings, the shift and the
Gibbs property they need.

## Suppliers

- **Mathlib** (pinned): `SimpleGraph.Subgraph.IsMatching` and `IsPerfectMatching`
  (`Mathlib/Combinatorics/SimpleGraph/Matching.lean`) for target 1; `Pi.compactSpace`,
  `Pi.topologicalSpace` and `MeasurableSpace.pi` for target 2; `MeasureTheory.ProbabilityMeasure`
  with its weak topology for `𝔓(𝕋)`; `ErgodicVAdd`/`ErgodicSMul` and `VAddInvariantMeasure`
  (`Mathlib/Dynamics/Ergodic/Action/Basic.lean`) for the ℤ²-action in target 4, and
  `Ergodic.iff_mem_extremePoints` (`Mathlib/Dynamics/Ergodic/Extreme.lean`, single map) as the
  model for the ℤ² version; `MeasureTheory.condExp` for the conditional-expectation form of the
  Gibbs property; Krein–Milman (`Mathlib/Analysis/Convex/KreinMilman.lean`) for target 6;
  `Matrix.det`, `Matrix.inv` and the Jacobi complementary-minor identity (to be checked at the
  pin) for target 9; contour integration (`circleIntegral`) and residues for target 10.
- **Tau Ceti** (pinned): `TauCeti/Probability/Ergodic/` (invariant σ-algebra, mean ergodic
  projection for one map) is available but not needed; nothing on Gibbs measures or dimers.
- `TauCetiRoadmap/GraphConnectivityAndFlows` (main), Section 6.7: the perfect-matching
  predicate and edge-set/subgraph correspondence, if the design prefers its multigraph interface
  over Mathlib's `SimpleGraph` for the dual graph. Optional.
- `TauCetiRoadmap/RandomMatrices` (main), Layer 8.3: continuous-kernel determinantal point
  processes; not reused (the kernel here lives on `ℤ²`), but the discrete sine kernel of target
  10 is the discrete counterpart of its sine kernel and the design records the correspondence.
- No supplier is an open pull request, so the roadmap may be inserted anywhere in
  `merge-order/ORDER.txt`; after `GraphConnectivityAndFlows` is on main, the end of the order
  is the natural place.

## Consumers

- A roadmap proving aggarwal2023 Theorem 1.5 (universality of lozenge tiling local statistics),
  which needs targets 2–5, 7, 10 and 11 verbatim, plus cohn-kenyon-propp2001's variational
  principle.
- `DimerModelsAndLozengeTilingsPartII`: the variational principle, surface tension and limit
  shapes (cohn-kenyon-propp2001; gorin2021 Lectures 5–10; kos2006 Section 3); periodic weights,
  amoebae and the frozen/liquid/gaseous phases (kos2006 Sections 3–4); general periodic
  bipartite planar graphs and domino tilings once planar embeddings exist.
- A discrete determinantal point process roadmap (the exclusion list of
  `TauCetiRoadmap/PointProcesses`, PR #417, lines 95–98) can take the discrete determinantal
  law of target 10 as its first example.
- `DESIGN-ConstructiveFieldTheoryPhi4` (#6086) and any lattice spin-system roadmap can import
  target 4(b)–(c) (ergodicity as extremality, closedness of translation-invariant Gibbs
  measures) for its own single-site model if the design states that layer for a general
  product space `S^{ℤ²}` with `S` finite; the design should state it that way where it costs
  nothing.
- Random surfaces and Gaussian free field fluctuations (kenyon2009 Section 11; gorin2021
  Lectures 11–12).

## Sources

All entries are in `packages/DimerModelsAndLozengeTilings/sources.toml`.

- `aggarwal2023` — A. Aggarwal, *Universality for lozenge tiling local statistics*, Annals of
  Mathematics 198 (2023); read as arXiv:1907.09991v4 (open repository). Section 1.2 (lattice,
  tilings, height functions), Section 1.3 (Gibbs measures, translation invariance, extremality,
  slope, Definitions 1.2–1.3, equation (1.2)), Theorem 1.5. The design must check that the
  arXiv v4 numbering agrees with the published version.
- `sheffield2005` — S. Sheffield, *Random Surfaces*, Astérisque 304 (2005); read as
  arXiv:math/0304049v3 (open repository). Section 3.2 (Lemmas 3.2.1–3.2.5, extremal and ergodic
  decompositions), Theorem 9.1.1, Section 9.3 and Theorem 9.3.1, Theorem 9.5.1.
- `kos2006` — R. Kenyon, A. Okounkov, S. Sheffield, *Dimers and amoebae*, Annals of
  Mathematics 163 (2006); read as arXiv:math-ph/0311005v1 (open repository). Section 2.2
  (Gibbs measures, EGMs, slope, Theorem 2.1), Theorems 4.2–4.3.
- `kenyon2009` — R. Kenyon, *Lectures on dimers*, IAS/Park City Mathematics Series 16 (2009);
  read as arXiv:0910.3129v1 (open repository). Sections 1.1, 2.2, 3.3–3.5 (Lemma 1, Theorem 2,
  Corollary 3), 4.2 (Lemmas 4–5), 5.1–5.5 (Theorem 6), 6.1.
- `okounkov-reshetikhin2003` — A. Okounkov, N. Reshetikhin, *Correlation function of Schur
  process…*, Journal of the AMS 16 (2003); read as arXiv:math/0107056v3 (open repository).
  Definition 4, Theorem 2, equation (36).
- `cohn-kenyon-propp2001` — H. Cohn, R. Kenyon, J. Propp, *A variational principle for domino
  tilings*, Journal of the AMS 14 (2001); read as arXiv:math/0008220v3 (open repository).
  Section 1.4 (height functions, lattice structure) and Theorem 1.1 (consumer context only).
- `kenyon1997` — R. Kenyon, *Local statistics of lattice dimers*, Ann. Inst. H. Poincaré
  Probab. Statist. 33 (1997), 591–618; read from Numdam (open repository). Theorems 1, 2, 6,
  Section 4.5.
- `gorin2021` — V. Gorin, *Lectures on Random Lozenge Tilings*, Cambridge Studies in Advanced
  Mathematics 193 (2021); read from the author's pre-publication copy (author page; lecture and
  theorem numbers as printed, page numbers differ). Lecture 1 (Theorem 1.4), Lecture 2 (Theorem
  2.1), Lecture 3 (Theorems 3.1, 3.5, 3.10), Lecture 4 (Theorems 4.3, 4.6, 4.11), Lecture 13
  (Definitions 13.1–13.10, Lemma 13.7, Theorem 13.12, Corollaries 13.14 and 13.16).
- `thurston1990` — W. P. Thurston, *Conway's tiling groups*, Amer. Math. Monthly 97 (1990),
  757–773; paywalled (JSTOR), **uncertified**, cited by locator only; gorin2021 Theorem 1.4
  carries the statement and proof.
- `georgii2011` — H.-O. Georgii, *Gibbs Measures and Phase Transitions*, 2nd ed. (2011),
  Theorems 7.7, 14.5, 14.15, 14.17; paywalled (de Gruyter), **uncertified**, cited by locator
  only; sheffield2005 Lemmas 3.2.1–3.2.5 restate what is used, and the design proves the
  finite-state ℤ² cases itself.

## Risks

- **Sheffield's uniqueness theorem (target 7) is far above the library.** Its proof occupies
  sheffield2005 Chapters 8–9 (cluster swapping, the FKG inequality of Section 9.2, the reduction
  of Section 9.3 to measures on `{0,1}^{ℤ²}`, homotopy classes of paths in a countably
  punctured plane in Section 9.4); gorin2021 (lines 4654–4656) calls the key claim difficult
  and refers back to Sheffield. The design must either plan it in full from Chapter 9's
  reduction, or state it as the capstone with a precise outline and flag that its proof may
  become a Part II; `Suggested.lean` states it either way.
- **The explicit kernel (target 10) needs delicate asymptotics.** The torus route needs the
  four-determinant torus formula (gorin2021 Theorem 3.10), the free-energy limit through Riemann
  sums with singular integrands (gorin2021 Theorem 4.3 is proved only for special torus sizes,
  line 3093; kos2006 lines 691–712 argue along subsequences), and the residue computation
  converting the double contour integral to `K_ξ` (gorin2021 lines 4744–4755;
  okounkov-reshetikhin2003 Section 3.1.12). The Schur-process route of
  okounkov-reshetikhin2003 is not in the library. The equality `μ_ξ = μ_{s,t}` finally rests on
  target 7 or on the full torus convergence; the design must choose and say which.
- **Connectivity of tilings under cube flips** underlies Kasteleyn's theorem on the hexagonal
  lattice (kenyon2009 lines 537–550) and Thurston's criterion (gorin2021 proof of Theorem 1.4);
  it needs the lattice structure of height functions on a simply connected domain
  (cohn-kenyon-propp2001 Section 1.4 for dominoes). A combinatorial definition of "simply
  connected domain" that makes these proofs work in Lean, and agrees with aggarwal2023's
  convention (union of faces simply connected in ℝ²), must be fixed early; a mismatch would
  change the statement of target 11's consumer.
- **The Gibbs property and conditioning.** Regular conditional probabilities on `𝔈(𝕋)` are
  avoidable (the property is a family of cylinder identities), but target 4(b) needs that
  invariant events are almost surely tail events for translation-invariant measures and that
  conditioning on a tail event preserves the Gibbs property; georgii2011 cannot be read, so these
  are proved from scratch (the finite-state ℤ² case is elementary but must be planned).
- **No planar graph theory in Mathlib.** Faces, duals and Kasteleyn signs exist only for the
  explicit triangular lattice; the general planar bipartite Kasteleyn theorem is out of reach
  and is excluded from scope.
- **Paywalled sources.** thurston1990 and georgii2011 are uncertified; every statement that
  cites them is also backed by an open text (gorin2021, sheffield2005).

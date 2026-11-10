# Review of Foams (pull request #1629 at 60a0051)

**Verdict:** needs changes

This is an incremental re-review of the 56 lines changed in the folder since `4b76614`. All of them are in README.md; Suggested.lean and metadata.toml are byte-identical to `4b76614`. The previous finding R01 is repaired. Two new P3 defects are in 2.4's rewritten reuse paragraph:

- It routes lemmas that the pinned Tau Ceti already proves through KhovanovHomology K1. The previous report proposed that wording.
- One of its link labels runs into the next sentence.

## R01 (P3) — 2.4 takes from KhovanovHomology K1 chord lemmas that the pinned Tau Ceti already proves

**Location:** `TauCetiRoadmap/Foams/README.md:1035–1038`: "Consume the general spanning-tree, boundary-cycle and noninterleaving chord lemmas developed for KhovanovHomology K1, stated on Tau Ceti's permutation triples and associated ribbon graphs."

**Claim:** The lemmas are a KhovanovHomology K1 deliverable, and they are stated on `PermutationTriple`s and bipartite ribbon graphs.

**Witness:** Tau Ceti `2fd255d9`, `Combinatorics/RibbonGraph/Contraction.lean`, proves both lemmas for any rotation `ρ` and involution `α` on a finite dart set, not on triples:

- `TauCeti.nonempty_spanningTreeContraction` (line 215);
- `TauCeti.SpanningTreeContraction.isNoncrossingMatching_permCongr_matching_iff` (line 236).

The bound `TauCeti.orbitCount_finRotate_mul_add_orbitCount_add_two_le` is at `ChordDiagram.lean:274`.

These are exactly the steps K1 plans (main, KhovanovHomology lines 130–138). They apply verbatim to 2.4's pair (ρ, τ). On the theta graph with ρ=(a b c)(A C B), contracting {a,A} gives rotation (a b c A C B) and nested bands {b,B}, {c,C}. Then `orbitCount(τρ)+orbitCount ρ+orbitCount τ` = 3+2+3 = 8 = 6+2. With ρ=(a b c)(A B C), the bands interleave (1<2<4<5) and the count is 1+2+3 = 6. That matches both of 2.4's Checks.

The previous report suggested the "permutation triples" wording and kept the K1 attribution. It missed these declarations at the same pin.

**Repair:** Cite the pinned declarations and drop the K1 attribution.

1. Add a bullet after the ribbon-graph bullet under From Tau Ceti (after line 245):

   > `TauCeti.SpanningTreeContraction`, `TauCeti.nonempty_spanningTreeContraction` and `TauCeti.SpanningTreeContraction.isNoncrossingMatching_permCongr_matching_iff` take a connected ribbon graph, given by a rotation and an edge involution on a finite set of darts. They contract a spanning tree to a one-vertex chord diagram with the same boundary cycles. They show that V − E + F = 2 holds exactly when its bands do not interleave. `Equiv.Perm.IsNoncrossingMatching` and `TauCeti.orbitCount_finRotate_mul_add_orbitCount_add_two_le` give the noninterleaving notion and the boundary-count bound. `TauCeti.PDCode.IsPlanar`, defined through `TauCeti.PDCode.toPermutationTriple`, is the four-valent case, and `TauCeti.PDCode.isPlanar_iff_isNoncrossingMatching` is its chord criterion. [Spanning-tree contraction][tc-ribbon-contraction] · [Chord diagrams][tc-chord] · [PD-code planarity][tc-pd-planar]

   Define the two new links, pointing to `TauCeti/Combinatorics/RibbonGraph/Contraction.lean` and `TauCeti/Combinatorics/ChordDiagram.lean`.

2. Replace lines 1035–1041 up to "Construct" with:

   > Apply Tau Ceti's spanning-tree contraction and noninterleaving criterion, listed above, to the pair (ρ, τ) of each component; they hold for any rotation and edge involution on a finite set of darts.

3. In the *Needs* line at 1074, write "Euler-count comparisons and spanning-tree contraction".

**Test of the repair.** I made these edits on a scratch copy of the README, then checked the following:

- The repaired paragraph still gives the theta values above.
- All eight Tau Ceti names in the new bullet elaborate with `#check` at the pin.
- `roadmaps resolve` reports nothing unresolved.
- The dependency check returns `depcheck: 236 roadmaps, 2271 edges, 0 problem(s)`.

## R02 (P3) — A bare link label runs into the next sentence in 2.4

**Location:** `TauCetiRoadmap/Foams/README.md:1040–1041`: "… for its Euler criterion. [PD-code planarity][tc-pd-planar] Construct the trivalent-web adapter here:"

**Claim:** The link is a citation for the preceding sentence.

**Witness:** Rendered, the line reads "…for its Euler criterion. PD-code planarity Construct the trivalent-web adapter here: …", which is a fragment. This is the only mid-paragraph bare link label in the README. Elsewhere, link labels close a From Tau Ceti bullet (lines 201, 243–245).

**Repair:** Moving the link into the From Tau Ceti bullet, as in R01's repair, removes it from 2.4. If R01 is not applied, write instead "The native PD-code specialization, `TauCeti.PDCode.IsPlanar` ([PD-code planarity][tc-pd-planar]), uses …". Tested on the scratch copy: no "][tc-pd-planar] Construct" remains.

## Previous findings

- R01 — repaired. No "finite-map" remains in the README, and the four spots now read as follows:
  - line 259: "Closed-web planarity uses the permutation-triple and ribbon-graph interfaces listed under From Tau Ceti";
  - line 1038: "stated on Tau Ceti's permutation triples and associated ribbon graphs";
  - line 1055: "permutation-triple adapters";
  - line 1068: "from the permutation-triple/ribbon-graph comparisons cited under From Tau Ceti".

  The wording at line 1038 is the subject of this report's R01.

## Verified sound

**Scope of this pass.** The changed passages are:

- the closing sentence of the supplier contracts (259–261);
- 2.4: reuse paragraph 1034–1047, Supply bullet 1055, adapter paragraph 1068–1071;
- 7.2: equivalence paragraph 2541–2558, Supply bullet 2589, the new Dehn-twist Check 2600–2602, source paragraph 2604–2608;
- the new Jones reference and the `jones-planar`, `tc-pd-planar` and `tc-graded-tensor` link targets.

The pass also covered what depends on them:

- 7.1, whose identity-annulus Check the new Check extends;
- 7.4 KH4, whose *Needs* cites 7.2–7.3 and which is in the seeded sample;
- the supplier-table rows for KhovanovHomology G and GeometricTopology 2.2/3.3, which 7.2 consumes.

**Build, gate, scope.**

- Head `60a00513afd5c8bff2e6ff1b4633643eee5d7303`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/Foams'` is empty, and the change summary lists no file outside the folder. The folder holds README.md, Suggested.lean and metadata.toml.
- `lake env lean` on Suggested.lean gives exactly three warnings, `declaration uses sorry`, at lines 34, 63 and 113.
- The worker's gate passed every check, including the build.
- My rerun of the gate: every counter is zero except `depcheck=1`, "NOT IN ORDER: Foams (insert it after its last supplier)". The gate reads the board's order file, while the candidate order lists Foams at line 402. As in the previous round, this is not a finding.
- Dependency check against the candidate order:

```text
depcheck: 236 roadmaps, 2271 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

**Signatures.** Suggested.lean is unchanged since `4b76614`, where all 11 declarations were checked with `#check @name`. `signatures.md` reports no lost binder, and its 11 types agree with the previous report's.

**Library declarations opened at the pins (Tau Ceti `2fd255d9`).**

- `KnotTheory/PDCode/Planar.lean`: `TauCeti.PDCode.toPermutationTriple` (251), `IsPlanar` (350). `IsPlanar` says that `eulerChar` equals 2 × the number of monodromy orbits. Crossing-free circles are excluded (lines 38 and 348). This supports 2.4's sentence "uses `TauCeti.PDCode.toPermutationTriple` for its Euler criterion".
- `KnotTheory/PDCode/ChordDiagram.lean`: `isPlanar_iff_isNoncrossingMatching`, which needs a connected code.
- `Combinatorics/RibbonGraph/Contraction.lean`: lines 79, 215 and 236.
- `Combinatorics/ChordDiagram.lean`: `Equiv.Perm.IsNoncrossingMatching` (101), with the bound at 274.
- `Algebra/Module/GradedModule/TensorProduct/Basic.lean`, the new `tc-graded-tensor` target: it exists at the pin, and the old `…/TensorProduct.lean` does not. `TauCeti.InternalGrading.tensorProduct` (126), `tmul_mem_tensorProduct` (150) and `isHomogeneous_assoc_symm` (168) are there, as the From Tau Ceti bullet says.

All 11 names above elaborate in one scratch `#check` file, after `lake build` of the three modules.

**Cross-roadmap citations resolved.**

- KhovanovHomology K1 on main (`f8836c4`), lines 92–167. Lines 130–138 plan the spanning-tree and chord lemmas that R01 points to Tau Ceti for.
- Subfactors 6.1 on main, line 1089: the shaded, unoriented planar operad "modulo isotopy". 7.2's oriented, labelled operad without shading is a different variant, and its new isotopy notion agrees with 6.1's (remark below).
- `overlaps.md` lists no dropped id and no open pull request that changes Foams. `roadmaps grep` for "SpanningTreeContraction" finds no roadmap citing it. For "noninterleav", it finds only Foams 1036 and KhovanovHomology 133.

**Seeded sample.** No seeded target lies in the changed lines.

7.4 depends on 7.2, so I checked its locators against the text:

- Bar-Natan Definition 7.1 and Proposition 7.2 are on p. 1470 (`bn line 1247` gives the folio; the statements are at lines 1258 and 1276).
- The torus computation in Proposition 7.2's proof gives 2 and the sphere gives 0 (`bn lines 1282–1287`). This agrees with 7.4's Check, "sphere ↦ 0, torus ↦ 2".
- Definition 8.1 is at `bn line 1413` on p. 1473 (folio at line 1381) and continues on p. 1474 (line 1418).

The other seeded targets (0.1, 0.2, 0.6, 0.8, 1.1, 2.2, 2.9, 2.11, 2.13, 3.1, 4.2, 6.2, 6.4, 6.6) are untouched by the diff and were not re-read.

**New locators in the changed text.**

- Bar-Natan Definition 5.1 is on p. 1464 (folio at `bn line 996`, definition at line 1022). It defines d-input planar arc diagrams: numbered input disks, base points on all disks, oriented arcs "up to planar isotopy".
- Jones, Definition 2.3.1 is on p. 6 (`jones-planar line 177` begins page 6, the definition is at line 184, and condition (i) is at line 193). Condition (i) makes the partition function invariant under every orientation-preserving diffeomorphism of ℂ, with the internal discs identified. That is the "ordinary planar invariance" 7.2 cites it for.

**Adversarial pass.** Rows marked "r4" are carried from the previous report (statements untouched by this diff), with that report's values.

| Statement (section) | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| PD-code Euler criterion (2.4, new sentence) | one-kink unknot X[1,1,2,2]; X[1,2,1,2] | σ₀=(0 1 2 3). First, σ₁=(0 1)(2 3): face permutation orbits {0},{2},{1,3}, so F=3, eulerChar = 3−1 = 2 = 2·1, planar. Second, σ₁=(0 2)(1 3): one face (0 3 2 1), eulerChar 0 ≠ 2, not planar. README V−E+F: 1−2+3 = 2 and 1−2+1 = 0 | pass |
| Pinned contraction criterion on 2.4's Checks (R01) | theta with ρ=(abc)(ACB), ρ=(abc)(ABC), τ=(aA)(bB)(cC) | contraction rotations (a b c A C B) and (a b c A B C). Bands (1,5),(2,4): nested, and 3+2+3 = 8 = 6+2. Bands (1,4),(2,5): interleaved, and 1+2+3 = 6 ≠ 8. README: 2 and 0 | pass; the lemma applies verbatim |
| Edge count convention (2.4 versus pin) | τ fixed-point-free on 2E darts | pin E = card X − orbitCount α = 2E − E = E; README E = cycles of τ = E | pass |
| Ordinary planar equivalence: Dehn twist (7.2, new Check) | radial annulus, profile (+1,−1); full twist T about the core | T fixes both boundaries pointwise and extends by the identity over the input disk. The two operations are equal under 7.2's relation. Insertion: the abstract web and strips are unchanged, so the identity functor, as 7.1's Check says | pass |
| Same relation: non-example | four parallel outward strands of label 1: radial annulus versus one-click rotation annulus (same input and output profiles) | An allowed diffeomorphism fixes both base points and the cyclic order of the ports. So the port pattern (inner i ↦ outer i, versus i ↦ i+1) is invariant: a distinct operation | pass; the relation does not collapse rotations |
| Same relation: moving holes | two input holes exchanged around each other (pure braid), holes keep their numbers | the mapping class fixes all boundaries and is allowed, as in Jones (i) | pass |
| Same relation: orientation | reflection of the cup diagram | it reverses the cyclic order of the marked points, and is excluded by "orientation-preserving" (Jones (i), Bar-Natan 5.1) | pass |
| Insertion invariance under T (7.2, 7.4) | web W in the twisted annulus, then closed | T ∪ id is a diffeomorphism of the output disk rel boundary, isotopic to the identity, so the outputs are isotopic and their turning numbers equal. KH4's J_B on these is unchanged | pass |
| BN 5.1 / 8.1, Jones 2.3.1 locators (7.2) | page folios | 1464 at line 996; 1473 at line 1381, 1474 at line 1418; Jones p. 6 at lines 177–211 | pass |
| BN 7.1 / 7.2 (7.4, dependent) | sphere, torus | η∘ε = 0; η∘m∘Δ∘ε(1) = 1+1 = 2 | pass |
| `tc-graded-tensor` contract (From Tau Ceti) | p=1, q=−2 | `tmul_mem_tensorProduct`: degree p+q = −1; `isHomogeneous_assoc_symm`: degree 0 | pass |
| Frobenius headline (0.8), r4 | `R[ε]`; ε = 2·id on ℤ; A = 0 | Δ(1)=1⊗X+X⊗1, Δ(X)=X⊗X; Gram (2) not a unit, so excluded; zero module has one coalgebra | pass |
| KH1 counit/coproduct (1.4), r4 | 1, X | ε(1)=0, ε(X)=1 on both sides | pass |
| KH2 grading (1.4, 2.13), r4 | one circle; merge | +1, −1; merge degree −1 | pass |
| Euler parity and bound (2.4 Checks), r4 | theta two ways; bivalent circle | 2, 0, 2; even, ≤ 2 | pass |
| No Koszul sign (0.10), r4 | degrees 1, 1 | C^(sh): +1; `DGShiftClosure`: −1 | pass |
| GT 2.2 / 3.3 contract (7.2), r4 | round circle in S²; holed disk | two discs; relative statement stays a 7.2 target | pass |
| GW locator (1.3), r4 | Props 10, 11 | p. 4 at `gw-cob line 145` | pass |
| Evaluations (1.3), r4 | sphere, torus, genus 2, X-sphere, Klein | 0, 2, 0, 1, 2 | pass |
| Surface records (0.4), r4 | torus, Klein, Möbius | χ 0, 0, 0; crosscaps 0, 2, 1 | pass |
| Ordered labels (0.5), r4 | (12)(23), (23)(12) | (123), (132) | pass |
| Quantum integers (0.9), r4 | [2]² | [3]+[1] | pass |
| Graded coefficients (3.2), r4 | degrees 2, −3 | −1 | pass |
| Decorations (6.3), r4 | x, x² | x³; x⊗y | pass |
| Kernel (6.5), r4 | mΔ on 1, X | 2X, 0 | pass |
| Freeness headline (2.8), r4 | p = 0, diag(1,0), (x,e₁x); N = 0 | ∅; (1,0); (1,e₁); Λ₀ = ℤ | pass |
| Circle basis headline (2.11), r4 | (N,a) = (0,0)…(4,2) | rank 1, …, 6 = C(4,2) | pass |
| `elementaryCoefficient` (2.11), r4 | n=2, r=−1,0,2,3 | 0, 1, x₁, 0 | pass |
| `circleIdeal` (2.11), r4 | (2,1) | x² − e₁x + e₂ | pass |
| Dual Jacobi–Trudi (2.11), r4 | λ = (2), (1,1), (2,1) | c₁²−c₂, c₂, c₁c₂ | pass |
| Top-Schur traces (1.2), r4 | a = 0..3 | 1, σ, −σ², −σ³ | pass |
| Square relation (2.7), r4 | N=4 | Q₀₁ = 2, P_R = 0, R₀ = 1 | pass |
| Reconstruction (2.10), r4 | id = Σuᵢvᵢ | x = Σuᵢ(vᵢx) | pass |
| Boundary weight (4.1), r4 | a=b=1, N=3 | 3 = 3 | pass |
| Adjunction degrees (6.2), r4 | (1,1), (1,2) | ±1, ±2 | pass |

**The previous remark on 7.2 is resolved.** The previous report remarked that "boundary-preserving planar isotopy" made the Dehn-twisted radial arc a separate operation. The new text now allows "all boundary-fixing mapping classes", and a new Check states the Dehn-twist identification. Both agree with Bar-Natan 5.1 and Jones 2.3.1(i).

**Remark on untouched text (no change requested).** Subfactors 6.1 on main owns the shaded, unoriented planar operad modulo isotopy. 7.2's "colored planar operad" sentence (2557–2559) does not say how its oriented, labelled, unshaded variant differs from it.

## Not verifiable

- Blanchet–Habegger–Masbaum–Vogel, Proposition 1.1, p. 886 (2.1): paywalled and recorded as uncertified in an earlier round. It is untouched by this diff and was not fetched again.
- Most seeded targets and the higher coherence equations of Layers 3 and 5: untouched by this diff, and not re-read in this incremental pass.

## Source issues

- **Misprint** in jones-planar at Definition 2.3.1 preamble, p. 6: the source writes a garbled word for the multilinear notion and drops a verb ending (`jones-planar line 182`); it should read "one converts multilinearity into linearity"; affects nothing.
- **Misprint** in jones-planar at §2.2, p. 5: the source misspells "composition" (`jones-planar line 166`); it should be "composition"; affects nothing.

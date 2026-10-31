# Review of CombinatorialHeegaardFloer (pull request #1089 at 5d30db1)

**Verdict:** needs changes

Files reviewed: `TauCetiRoadmap/CombinatorialHeegaardFloer/README.md` (675 lines) and
`TauCetiRoadmap/CombinatorialHeegaardFloer/Suggested.lean` (75 lines), the whole folder, against
Mathlib `6b7abb3c` and Tau Ceti `a91d3aa` (the pins of the pull request's `lake-manifest.json`).
The pull request changes nothing outside this folder. The gate passed every check; the dependency
check reports no problem. One blocking finding (R01): the roadmap's own first end theorem,
invariance of `GH⁻` under grid moves, is statable at the pin but `Suggested.lean` states only its
corollary for `τ`. The remaining findings are P3.

## R01 (P2) — Statable headline absent: invariance of `GH⁻` itself

**Location.** `TauCetiRoadmap/CombinatorialHeegaardFloer/Suggested.lean` lines 37–47 (Lane G states
only `tau_eq_of_movesTo`); README lines 94–99 ("v1: grid homology is a link invariant … theorem
GH'_invariant") and lines 257–264 ("the remaining input is the commutation and O-stabilization
invariance of `GH⁻` as an Alexander-graded `𝔽[U]`-module, transferred by
`GridDiagram.IsKnot.tau_eq_of_linearEquiv`").

**Claim.** The v1 end goal and the theorem the roadmap builds toward is the invariance of grid
homology (book Theorem 5.3.1, OSSBOOK line 4427: `GĤ(G)` and the `F[U]`-module `GH⁻(G)` depend
only on the knot). `τ` invariance is its corollary (Definition 6.1.5, OSSBOOK line 4724). The Lean
file states only the corollary, although every carrier of the knot-case statement exists at the pin.

**Witness.** The hypothesis of `TauCeti.GridDiagram.IsKnot.tau_eq_of_linearEquiv`
(`TauCeti/KnotTheory/Grid/Homology/Tau.lean` lines 113–118 at `a91d3aa`) is exactly the statable
form: an Alexander-degree-zero `K[X]`-linear equivalence `G.unblockedHomology K ≃ₗ[K[X]]
G'.unblockedHomology K` under `hG.unblockedHomologyModule K`, with
`TauCeti.LinearMap.IsHomogeneous`. No Maslov grading exists on `unblockedHomology` at the pin
(`Grid/Homology/*.lean` define only the Alexander `InternalGrading`), so the Alexander-graded form
is the statable one and the bigraded form belongs in the docstring's not-statable list.

**Repair (elaborated at the pin: one `sorry` warning, nothing else).** Add to Lane G of
`Suggested.lean`, before `tau_eq_of_movesTo`:

```lean
open Polynomial in
/-- **Grid invariance of `GH⁻`.** For a knot grid `G` and `G.MovesTo G'`, the unblocked grid
homologies are isomorphic as Alexander-graded `K[U]`-modules (Ozsváth–Stipsicz–Szabó,
Theorem 5.3.1). -/
theorem unblockedHomology_equiv_of_movesTo {n m : ℕ} {G : TauCeti.GridDiagram n}
    {G' : TauCeti.GridDiagram m} (hG : G.IsKnot) (h : G.MovesTo G')
    (K : Type*) [CommRing K] [CharP K 2] :
    letI := hG.unblockedHomologyModule K
    letI := (h.isKnot_iff.mpr hG).unblockedHomologyModule K
    ∃ e : G.unblockedHomology K ≃ₗ[K[X]] G'.unblockedHomology K,
      TauCeti.LinearMap.IsHomogeneous e.toLinearMap
        (hG.alexanderUnblockedHomologyGrading K).piece
        ((h.isKnot_iff.mpr hG).alexanderUnblockedHomologyGrading K).piece 0 := by
  sorry
```

Name it in README G.5 next to `tau_eq_of_movesTo`, and add to the module docstring that the
bigraded (Maslov and Alexander) form and the link form over `𝔽[V₁,…,V_ℓ]` are not statable at
the pin (no Maslov grading on homology; no component-indexed coefficient ring).

## R02 (P3) — Torus-knot chirality: "the (3,4) torus knot" gets `τ = 3` and `τ = −3`

**Location.** README line 551 ("`τ(T_{3,4}) = 3`") against lines 566–571 ("`torusLink 2 3`
presents the (3,4) torus knot with `τ = −3`"; `torusLink 1 2` … "the (2,3) torus knot" with
`τ = −1`).

**Claim.** Both sentences name the same knot and assign it opposite values of `τ`.

**Witness.** `TauCeti/KnotTheory/Grid/TorusLink/Tau.lean` lines 13–17 at the pin: on
`torusLink p q` the tower sits in the top Alexander degree, `2τ = −pq`, and "the knot this grid
presents is the mirror image" of the positive torus knot whose `τ` is `(p−1)(q−1)/2`
(OSSBOOK Chapter 6). `two_mul_tau_torusLink` gives `τ = −3` on `torusLink 2 3` and `τ = −1` on
`torusLink 1 2`, `torusLink 2 1`.

**Repair.** In the "τ is a knot invariant" bullet write "present the mirror image of the (2,3)
torus knot (the left-handed trefoil)" and "presents the mirror image of the (3,4) torus knot", so
that `τ(T_{3,4}) = 3` in the "τ bites" bullet refers to the positive torus knot. Instances
checked: `2τ = −2` on both 5×5 grids and `2τ = −6` on the 7×7 grid, from
`GridDiagram.two_mul_tau_torusLink`.

## R03 (P3) — Locator "MOST §15.2" names a section the paper does not have

**Location.** README line 292 (G.12: "MOST §15.2, or Gallais's spin-extension construction").

**Witness.** MOST06 (arXiv:math/0610559v3) has six sections; sign refinements are its Section 4
(MOST06 line 1575). "15.2. Existence and uniqueness of sign assignments" is the book's section
(OSSBOOK line 147).

**Repair.** "book §15.2 (or MOST §4), or Gallais".

## R04 (P3) — `tau_stabilizeX` misattributed, and the "remaining input" list is incomplete

**Location.** README line 181 (inventory: `tau_stabilizeX` listed under
"`Grid/Homology/Tau.lean`") and lines 261–264 ("the remaining input is the commutation and
`O`-stabilization invariance").

**Witness.** `GridDiagram.IsKnot.tau_stabilizeX` lives in
`TauCeti/KnotTheory/Grid/Stabilization/Homology.lean` (line 287), whose docstring says "Only this
one stabilization type is treated here; the other stabilization types and commutation moves are
not." `IsXStabilization` (`Stabilization/Basic.lean` line 607) allows four placements of the new
row and column, of which `stabilizeX s.castSucc (G.X s).castSucc s` is one; `IsOStabilization`
(line 563) adds four more. Cyclic permutations are already covered
(`GridDiagram.IsKnot.tau_relabelRows_finRotate`, `Grid/Homology/CyclicPermutation.lean` line 168).

**Repair.** Attribute `tau_stabilizeX` to `Grid/Stabilization/Homology.lean`; write "the remaining
input is commutation invariance and the remaining stabilization types (the other three
`X`-placements and the four `O`-types); cyclic permutations are already proved".

## R05 (P3) — The blow-up "negative control" does not separate; `hP` is unused by the route

**Location.** README lines 561–566 ("Negative control: the zero-framed vertex is not negative
definite … and the headline does not apply to it"); `Suggested.lean` lines 56–61 and 68–73
(hypothesis `hP : P.IsNegativeDefinite`).

**Claim.** The control only shows the hypothesis fails; the conclusion still holds there, so it
refutes nothing. For `oneVertexPlumbing 0`, `k = 0`, `ε = −1`: the blown-up weight is
`s(s+1)/2`, so `S_n = ℝ × [−1, 0]`-type strips for every `n ≥ 0`, contractible; both sides are
`𝔽₂[U]` in degree 0 and `0` above, exactly as for `P`. Némethi's projection argument
(NEM07 lines 427–434) uses no definiteness, so the route does not need `hP`.

**Repair.** Either relabel the bullet "outside the source's domain (Némethi §3.4 assumes
negative definiteness); the conclusion is still true there" and keep `hP` as the source's
hypothesis, or add a genuine negative control on the move itself: adjoining a `−1`-vertex to
`oneVertexPlumbing (−1)` without lowering the framing of the old vertex gives intersection matrix
`[[−1,1],[1,−1]]`, singular, so it is not a blow-up and the weight `χ_k(x) + s(s+1)/2` splitting
fails.

## R06 (P3) — The `ε ≠ −1` argument omits the lattice translation

**Location.** README lines 352–355 ("any other odd `ε` lies in the same orbit after adding
`2Q(mE_new)`, which changes `ε` by `−2m` and shifts every weight by a constant (Némethi Lemma
3.3.2)").

**Claim.** Without translating, the weight does not shift by a constant: with `k'' = k' + 2Q(mE)`,
`χ_{k''}(x,s) = χ_{k'}(x,s) + m·s` (since `Q(mE)(x,s) = −ms`). Lemma 3.3.2 (NEM07 lines 372–374)
is `χ_{k+2l}(x − l) = χ_k(x) − χ_k(l)`: the weight is the translate by `l = mE_new`, minus the
constant `χ_{k'}(mE_new) = m(m−ε)/2`. The conclusion (same module) is right; the sentence is not.

**Repair.** "…after adding `2Q(mE_new)`; translating the lattice by `mE_new` carries the weight
function to the old one minus the constant `m(m−ε)/2` (Némethi Lemma 3.3.2; Tau Ceti
`Weight/Translation.lean`), so the exponents, and the module, do not change."

## R07 (P3) — Shape and process language

**Location.** README line 238 ("the 2025 summer project (acknowledgements) tried all three"),
line 271 ("the analytic roadmap's far future"), line 469 ("The current native coordinate chain
module"); the Fechtner bullet appears twice (lines 629 and 670); Lane L items 1–3 (lines 356–470)
have no `*Needs:*` lines and no per-definition `**Checks.**`, the lattice checks living only in
the acceptance list.

**Repair.** Drop the three process phrases ("tried all three", "far future", "current"); keep one
Fechtner bullet; give L.1–L.3 a `*Needs:*` line each (Mathlib `Finsupp`/`Polynomial`, Tau Ceti
`PlumbingGraph`, `characteristicWeight`; Némethi §3.1–3.2) and three Checks each (the genus-one
`(−1)` regression of line 371, the zero-framed `K = 0` sector of line 478, the one-vertex
exponents `1, 0` of the table in "Verified sound" row 4).

## Verified sound

**Gate and build.** `gate.md`: every check passed (`set_option=0 … build=0 OK`). Depcheck run as
instructed: `depcheck: 204 roadmaps, 1416 edges, 0 problem(s)`; no UPWARD or CYCLE line.
`lake env lean` on a probe copy of `Suggested.lean` with nine `#check @` lines: three
"declaration uses `sorry`" warnings and nothing else. Elaborated types agree with the README:
`tau_eq_of_movesTo` over any `[CommRing K] [CharP K 2]` (README: "every commutative ring of
characteristic two"); the two lattice headlines take `hP : P.IsNegativeDefinite`, `Odd ε`, every
`q : ℕ`, and conclude `Nonempty (… ≅ …)` in `ModuleCat PlumbingCoefficient`, i.e. `𝔽₂[U]`-module
isomorphisms in every cubical degree, as the README says. No section variables are dropped (every
binder is explicit).

**Padding probe.** On a scratch copy, `tau_eq_of_movesTo` with `by simp` ("no progress") and
`by rfl` (fails); `latticeChainHomology_blowUpVertex` with `by infer_instance` (fails) and
`by simp` (unsolved goals); `latticeChainHomology_blowUpEdge` with `exact ⟨Iso.refl _⟩` (the two
carriers are modules on different cube types, no reflexivity). Nothing is padding.

**Tau Ceti names at `a91d3aa`.** All 40 backticked Tau Ceti names in the README exist: `GridState`
(`Grid/Diagram/Basic.lean` 50), `GridDiagram` (621), `IsMove`/`MovesTo`/`GridLink`
(`Grid/Move/Basic.lean` 62/89/147), `IsCommutation` (`Commutation/Move.lean` 319),
`IsStabilization` (`Stabilization/Basic.lean` 670), `IsKnot` (`Diagram/Components.lean` 163),
`MovesTo.isKnot_iff` (`Move/Components.lean` 92), `fullyBlockedComplex`/`unblockedComplex`/
`simplyBlockedComplex` (`Chain/Complex.lean` 65/97/129), `fullyBlockedHomology`
(`Homology/Basic.lean` 125), `unblockedHomology` (`Homology/Unblocked.lean` 91),
`IsKnot.simplyBlockedHomology` (`Homology/SimplyBlocked.lean` 71), `unblockedHomologyModule`
(`Unblocked.lean` 306), `alexanderUnblockedHomologyGrading` (`Homology/KnotAlexander.lean` 38),
`OddComponentGridDiagram.gradedEulerChar_eq_smul_T_mul_det_weightMatrix`
(`Grid/EulerCharacteristic.lean` 272), `IsKnot.tau`/`tau_eq_of_linearEquiv`/
`tau_le_tau_sub_of_comp_eq_X_pow_smul` (`Homology/Tau.lean` 97/113/158), `tau_stabilizeX`
(`Stabilization/Homology.lean` 287, see R04), `two_mul_tau_torusLink` (`TorusLink/Tau.lean` 56),
`torusLink` (`TorusLink/Basic.lean` 100), `KnotTheory.alexander` (`Alexander.lean` 378),
`HeegaardRegionSystem` (`LowDimTopology/Heegaard/Domain.lean` 108), `PlumbingGraph`
(`Plumbing/IntersectionForm.lean` 89), `IsNegativeDefinite` (150), `characteristicVectors`/
`canonicalCharacteristic` (`Characteristic.lean` 67/84), `characteristicOrbits` (`SpinC.lean` 91),
`characteristicWeight` (`Weight/Basic.lean` 104), `PlumbingCoefficient`/`PlumbingChain`/
`latticeDifferential_comp_self` (`Differential.lean` 66/69/386), `latticeChainComplex`/
`latticeChainHomology` (`ChainComplex.lean` 51/94), `blowUpVertex`/`blowUpCharacteristic`
(`BlowUp.lean` 230/492), `blowUpEdge`/`blowUpEdgeCharacteristic` (`EdgeBlowUp.lean` 224/492),
`exists_injective_latticeHomologyCycleMap` (`Tower.lean` 263),
`coefficientEquivLatticeHomologyOfUnique`/`oneVertexPlumbing` (`OneVertex.lean` 357/384),
`e8Plumbing` (`E8.lean`). The native cube weight is the maximum of `χ_k` over the cube's vertices
(`Cube/Weight/Basic.lean` 175) and the exponents are the weight drops (`Cube/Face/Basic.lean`
74/105), as the table's native row says; `characteristicWeight` is `−(k(x)+x·x)/2`
(`Weight/Basic.lean` 104–121). The Lean docstring's not-statable list is right at the pin: no
crossing change or unknotting number on grids (grep of `KnotTheory/Grid`), `sliceGenus` only on
`SmoothCircleEmbedding` (`KnotTheory/Slice/Genus.lean` 168) with no map from grids, no Seifert
matrix of a grid, no chain complex or nice move under `LowDimTopology/Heegaard`, no genus
decoration and `𝔽₂[U]` coefficients only in `Plumbing`.

**Mathlib inventory at `6b7abb3c`.** All ten files named in the inventory exist
(`Algebra/Homology/{Homotopy,HomotopyCofiber,HomotopyCategory/MappingCone,ShortComplex/ShortExact,
HomologySequence,EulerCharacteristic}.lean`, `CategoryTheory/GradedObject.lean`,
`Algebra/PresentedMonoid/Basic.lean`, `GroupTheory/Perm/Sign.lean`, `Algebra/Quandle.lean`);
`HomotopyEquiv.toHomologyIso` is `Homotopy.lean` line 947.

**Cross-roadmap citations.** HeegaardFloer on main: §8.2 "Completed lattice/surgery comparison
(R2)" with `*Needs:* … CombinatorialHeegaardFloer Lane L; Zemke` (its line 4082), §8.3 grid = HFK
(R3), §8.1 nice-diagram comparisons (R1), Layer 6 (F4) consuming Lane H (lines 3096, 3304); its
scope paragraph lists CombinatorialHeegaardFloer among its suppliers (lines 26–34). This README
cites HeegaardFloer only as the downstream owner, never on a Needs line: direction consistent.
GeometricTopology Layer 4 "knot theory, done properly" (its line 409; presentations, slice-ness,
polynomials, lines 26–38) and Layer 9 (Heegaard splittings, no Reidemeister–Singer) match Lane K's
description. MorseTheory on main has handles and cells (M2) and no Cerf theory, consistent with
Lane H building the pointed Cerf moves itself. None of the three, nor this roadmap, is in
`ORDER.txt` (all on main). Ownership against the 434 open pull requests: `roadmaps grep` for
"lattice homology", "grid homology", "Reidemeister–Singer", "Cromwell", "nice diagram|nice move",
"latticeChainHomology|blowUpVertex", "tau_eq_of_movesTo" finds no other owner (GeometricTopology
#271/#1517/#903 revise an existing roadmap; HilbertModularSurfaces #1730 consumes `blowUpVertex`).

**Sources (all read; ids are the cache keys).** NEM07 = arXiv:0709.0841v1, ZEM21 = 2111.14962v4,
MOST06 = math/0610559v3, OSS09 = 0912.0830v3, GAL07 = 0706.0089v3, JTZ12 = 1210.4996v4,
SAR10 = 1011.5265v3, SW06 = math/0607777v4, MOT09 = 0910.0078v4, MO10 = 1011.1317v6,
LOT10 = 1010.2550v4, MOS06 = math/0607691v2, OSSBOOK = the authors' copy of *Grid Homology for
Knots and Links* (author page; its numbering agrees with every citation checked).

- Sampled target "Combinatorial computability is not combinatorial definition-with-invariance":
  SW06 abstract (line 9: an algorithm to compute HF̂, which is defined holomorphically), MOT09
  abstract (line 7: combinatorial descriptions via surgery on a grid link), MO10 is 279 pages
  (header line 1; README "~280"), LOT10 abstract (line 7: bordered bimodules), MOS06 abstract
  (line 8); MOST06 proves invariance over `𝔽₂` in §3 and signs in §4 (lines 200–207). Book:
  Chapter 16 is "The holomorphic theory", 16.4 "Equivalence of knot Floer homology with grid
  homology" (lines 154–158); Appendix B.4 Cromwell (178); "falls short of showing that these
  bounds are sharp" (616). Supported as written.
- Némethi: `F^q = Hom_ℤ(C_q, T⁺_0)`, `U`-action, grading `d − 2w(□)`, `δ_w` (lines 213–225);
  weights `w₀ = χ_k`, edge `max + M^{g_j}(|Δχ|)`, higher cubes max over segments (307–315);
  §3.2.2(a) genus-zero max over vertices (316–317); `m_k`, `eu` (322–324, 359–361); Lemma 3.3.2
  and `(k+2l)² = k² − 8χ_k(l)`, `8m_k = k² − max k'²` (372–381); §3.4.1 moves of valence ≤ 2
  (411–413); Prop 3.4.2 proof: `k' = c(k)` has `ε = −1`, `χ_{k'}(z) = χ_k(π_*z) + a(a+1)/2`,
  projection is a homotopy equivalence `S_n(Γ',k') → S_n(Γ,k)`, intersection-point case
  (416–437); Remark 3.4.3(a) homological form `⊕_n H_*(S_n)` (438–446); §3.1.11 `S_n` and
  Theorem 3.1.12 (262–285); Example 4.2.4 genus-one `(−1)` vertex, `K = −E`, edge weight 1,
  `H⁰ = T⁺_0 ⊕ T_0(1)` (576–582); §2.2.2 `Char`, orbits, torsion Spinᶜ (132–148).
- Zemke: Theorem 1.1 (plumbing tree, `F[[U]]`-modules, relatively graded when `b₁ = 0`; lines
  50–53); §2.3 `CF(G) = ∏_{K,E} F[[U]]⊗⟨[K,E]⟩`, equation (2.3) with `a_v, b_v` (377–408).
- MOST06 Theorem 6.1: `χ(ĤL) = ±∏(tᵢ^{1/2} − tᵢ^{−1/2})Δ` for `ℓ > 1`, `±Δ` for `ℓ = 1`
  (2727–2734); Prop 6.2 determinant factors `(1−tᵢ)^{nᵢ}` (2750–2761).
- Book: Theorem 5.3.1 (4427–4434), Definition 6.1.5 (4724–4726), Remark 4.6.10 (3268–3271),
  equation (8.2) `A = ½(M_O − M_X) − (n−ℓ)/2` (5711), `GH̃(G) ≅ GĤ(G) ⊗ W^{⊗(n−ℓ)}` (5792),
  Theorem 11.6.1 with the three factors `∏(1−tᵢ⁻¹)^{nᵢ}tᵢ^{1/2}`, `∏(tᵢ^{1/2}−tᵢ^{−1/2})`,
  `∏tᵢ^{1/2}` (8600–8631), §3.3 grid determinant (2116), §15.2 (147), B.5 normal forms (179),
  Appendix A homological algebra (163).
- OSS09: Definitions 1.1–1.2 of `HF̂_st` with `(F⊕F)` factors, Theorem 1.3 (63–87); twisted
  theory equals HF̂ for `b₁ = 0`, Theorem 10.4 (101–105, 3470–3473); only HF̂ over `ℤ/2`, no
  Spinᶜ/signs in this paper (121–124). GAL07, JTZ12, SAR10 abstracts support their citations.

**Adversarial table.** Values computed on each side.

| # | Statement | Instances | Values (left / right) | Result | Change |
|---|---|---|---|---|---|
| 1 | `tau_eq_of_movesTo` | `G' = G`; `torusLink 1 2` vs `torusLink 2 1` (both 5×5, present the same knot); `unknot 2` vs `unknot 3`; negative: `torusLink 1 2` vs `torusLink 2 3`; trivial ring; torsion `GH⁻` | `hG.tau K` / `hG.tau K`; `2τ = −2` / `2τ = −2`; `0` / `0`; `−1` vs `−3` with no `MovesTo` (component types differ), consistent; trivial ring excluded by `CharP K 2` (its characteristic is 1); torsion junk `τ = 0` transported by the module iso | holds | none (R01 adds the theorem it descends from) |
| 2 | `latticeChainHomology_blowUpVertex` | `oneVertexPlumbing (−1)`, canonical `k = −1`, `ε = −1`, `q = 0,1,2` | `χ = x(x+1)/2`: `S₀ = [−1,0]`, `S₁ = [−2,1]`; blow-up `χ' = x(x+1)/2 + s(s+1)/2`: `S₀ = {−1,0}²` (one square), `S₁` = plus of 5 squares on 12 vertices; `H₀ = 𝔽₂` per `n`, `H₁ = H₂ = 0` both → `𝔽₂[U]` / `𝔽₂[U]`, `0` / `0`; `ε = +1`: translate `s ↦ s+1`, same module; zero-framed (`hP` false): `𝔽₂[U], 0` / `𝔽₂[U], 0` | holds; `hP` unused by the route | R05 |
| 3 | `latticeChainHomology_blowUpEdge` | `A₂` (`−2,−2`, one edge), `k = 0`, `ε = −1`, `q = 0,1,2,3` | `χ = x₁² − x₁x₂ + x₂²`: `S₀ = {0}`, `S₁` = two squares meeting at `0` (7 vertices), contractible; blow-up `(−3,−1,−3)` chain, `χ' = χ(x) + s(s+1)/2`, projection retraction; `H₀ = 𝔽₂[U]`, `H₁ = H₂ = 0` both; `q = 3`: `0` / `0` (rank 2 has no 3-cubes) | holds | none |
| 4 | L.2 exponents `A_v − g`, `B_v − g` | one vertex `Q = (w)`, `E = {v}`; `w = −1`, `K = −1`; general `I` | `f(∅) = 0`, `f({v}) = (K(v)+w)/2 = −1`, `g = −1`: exponents `1` and `0`; native cube `[x,x+1]` has weights `χ(x)`, `χ(x)+1`: drops `1`, `0`, equal; identity `f(K, I∪{v}) = f(K+2v*, I) + f(K,{v})` gives `B_v − g = g(K+2v*,E−v) + f(K,{v}) − g(K,E)`, Zemke/OSS `b_v`; both exponents `≥ 0` as minima over sub-families | holds | none |
| 5 | zero-framed regression (README 476–483) | native `k = 0`; `[K,E]` with `Q = 0`, `K = 0`; Zemke completed | `d(e_x) = v_x + v_{x+1}` → `H₀ = 𝔽₂[U]`, `H₁ = 0`; `v* = 0`, faces `[0,∅]` twice with exponents `0,0` → `d = 0`, `H₀ = H₁ = 𝔽₂[U]` (also over `ℤ`: `[K,∅] − [K,∅] = 0`); `HF⁻(S¹×S²)` has two towers, so `𝔽₂[[U]]²` is the right target | holds | none |
| 6 | genus-one `(−1)` regression (L.1, L.3) | one vertex `−1`, `g = 1`, `K = −E` | `K(E) = −E² − 2 + 2g = 1`; `χ(0) = χ(E) = 0`; edge `max(0,0) + M¹(0) = 1`; spherical rule gives `0` and kills `H⁰_red = T_0(1)` (NEM07 576–582) | holds | none |
| 7 | correction-term identity (README 503–507) | any `k`, `l` | `(k+2l)² = k² + 4k(l) + 4l² = k² − 8χ_k(l)`; `max (k'²+|V|)/4 = (k² + |V|)/4 − 2m_k` | holds | none |
| 8 | Seifert plumbing convention (README 571–583) | `r = 0`; one leg `α/β = c/1` | `e = −b`, negative definite iff `−b < 0`; matrix `[[−b,1],[1,−c]]`, `det = bc − 1 > 0` iff `e = −b + 1/c < 0` (Schur complement) | holds | none |
| 9 | link Euler factors (G.9) | unknot; two-component unlink; ratios | `χ(GĤ(U)) = 1`; unlink `Δ = 0`, `GĤ = 𝔽²` in Maslov `0, −1`, `χ = 0`; hat/`GH⁻` ratio `∏(1−tᵢ⁻¹)`, fully blocked/`GH⁻` ratio `∏(1−tᵢ⁻¹)^{nᵢ}`; equals OSSBOOK 8600–8631 and MOST06 2727–2734 | holds | none |
| 10 | `GH̃ ≅ GĤ ⊗ W^{⊗(n−ℓ)}`, shift `(n−ℓ)/2` | `n = 2, ℓ = 1`; `n = 4, ℓ = 2`; integrality | `χ(W) = 1 − t⁻¹`, consistent with row 9; shift `1/2` vs `1`; collapsed `A` integral since `Δ_L(t,…,t)(t−1) = Δ¹(t) ∈ t^{(ℓ−1)/2}ℤ[t^{±1}]`; matches OSSBOOK (8.2) and 5792 | holds | none |
| 11 | `ε` orbit argument (README 352–355) | `ε = −1 → 1` (`m = −1`) | `χ_{(k,ε−2m)}(x,s) − χ_{(k,ε)}(x,s) = ms`, not constant; after translating by `mE_new` the difference is `−m(m−ε)/2`, constant | conclusion holds, sentence wrong | R06 |
| 12 | `HF̂_st` claims (Lane H) | `L(p,q)`; `(F⊕F)` factors; `b₁ = 0` | genus-1 one-basepoint diagram: `p` generators, no rectangles, `𝔽^p`; OSS09 Def 1.1–1.2, Thm 1.3, Thm 10.4 | holds | none |
| 13 | grid size bound | `n ≤ 5` | `5! = 120` generators | holds | none |

**Declared gaps.** None declared; none needed (every supplier citation resolves on main or at
the pins).

## Not verifiable

- none. (The book was read from the authors' copy on an author page; the AMS landing page itself
  is paywalled. Every other source is on arXiv.)

## Source issues

- **Misprint** in NEM07 at Proposition 3.3.4, printed page 8 (line 392): the displayed inequality
  subtracts `χ_{k_r}(−x_i)`; it should be `χ_{k_r}(−y_i)`, as the proof on the next line uses;
  affects nothing.

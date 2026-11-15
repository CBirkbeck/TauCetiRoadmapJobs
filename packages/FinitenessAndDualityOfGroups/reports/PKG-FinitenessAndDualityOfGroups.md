# PKG-FinitenessAndDualityOfGroups

Package of the accepted design (`REV-DESIGN-FinitenessAndDualityOfGroups~13`, accepted, conditional on
the declared gaps `simplicial-replacement-dimension` and `order-complex-nerve-realization`).

Files written: `packages/FinitenessAndDualityOfGroups/README.md`,
`packages/FinitenessAndDualityOfGroups/Suggested.lean`, `packages/FinitenessAndDualityOfGroups/metadata.toml`
(`topic = "math.GR"`, as `TauCetiRoadmap/FreeGroupsAndLimitGroups/metadata.toml`).
Unchanged: `packages/FinitenessAndDualityOfGroups/sources.toml` (every source key the README and the Lean
docstrings cite is in it with the cited locators; no new work is cited) and the `gaps` of
`packages/FinitenessAndDualityOfGroups/design/plan.json` (both gaps still hold at main, see below).

Pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti
`2fd255d997f47c0b5d834ee416c7015d55444ce5`, as in `lake-manifest.json` and the design baseline.

## Headline theorems

| Headline (README) | Status | Lean name / what it lacks |
|---|---|---|
| 1.5 finiteness criterion, directed colimits ((a)⇔(b)) | stated | `isOfTypeFPn_iff_colimit` |
| 1.5 finiteness criterion, products ((a)⇔(d)) | stated | `isOfTypeFPn_iff_piComparison` |
| 3.2 Serre's theorem | stated | `cohomologicalDim_eq_of_finiteIndex` |
| 5.3 Eilenberg–Ganea theorem | stated | `geometricDim_le_max` |
| 7.3(b) Swan's theorem, rational form | stated | `exists_linearEquiv_tensorRat` |
| 7.3(a) vanishing of the Hattori–Stallings rank off the identity | not statable | Hattori–Stallings trace over a noncommutative ring (EtaleCohomologyFoundations §F.10.3) not at the pins |
| 8.4(b) Euler characteristic independent of the subgroup | stated | `groupEulerChar_eq_div_index` |
| 8.4(c) multiplicativity on finite-index subgroups | stated | `groupEulerChar_subgroup` |
| 8.6 multiplicativity in extensions | stated | `isVirtuallyOfTypeFP_and_groupEulerChar_eq_mul` |
| 8.7 amalgams | stated | `groupEulerChar_pushoutI` |
| 8.7 HNN extensions | stated | `groupEulerChar_hnnExtension` |
| 8.7 general equivariant formula (monomial resolution / action on an acyclic complex) | not statable | no pinned carrier for a group action on a simplicial complex with orbit representatives and stabilizers, nor for monomial complexes (CohomologyOfGroups §3.2) |
| 8.9 Brown's denominator theorem | stated (both forms) | `exists_int_eq_mul_groupEulerChar`, `exists_subgroup_card_eq_of_dvd_den` |
| 9.2 existence of complete resolutions | stated | `isGorensteinProjective_opcycles` (Gorenstein projectivity of the `n`-th syzygy in `Rep R G`, Tau Ceti's carrier) |
| 9.4 Farrell cohomology against ordinary cohomology above `vcd` | not statable | Farrell cohomology needs a chosen complete resolution (data whose existence is 9.2) and its `Hom`-cohomology functor with the comparison map from `groupCohomology`; none is a pinned carrier |
| 6.3 duality criterion; 6.4(b) Bieri–Eckmann characterization; 6.6 closed aspherical manifolds | not statable | duality groups are defined by the cap product on group (co)homology, not at the pins (CohomologyOfGroups §4.6); 6.6 also lacks the orientation character of a manifold (AlgebraicTopology §6.3) |

Definitions kept to make these statable (all with real bodies on pinned carriers): `IsOfTypeFPn`
(Tau Ceti pseudocoherence of the trivial module), `IsOfTypeFP` (`TauCeti.Module.IsFPD`),
`cohomologicalDim` (`TauCeti.leastENatBound` of vanishing of `groupCohomology`),
`virtualCohomologicalDim`, `HasFiniteHomologicalType`, `IsVirtuallyOfTypeFP`, `geometricDim`
(`Topology.CWComplex` and `TauCeti.IsEilenbergMacLaneSpaceOne`), `rationalEulerChar` (`finsum` of
`Module.finrank` of `groupHomology`), `groupEulerChar`. Supporting targets that are deep but not
headlines (Serre's construction 5.4, Smith theory 8.8, Wall's lemma 8.1, Brown's theorem 7.5) stay in
the README only.

Naming: the Euler characteristic is `groupEulerChar`, not `eulerChar`, because the README cites Tau
Ceti's `TauCeti.AbelianK0.eulerChar_eq_homologyEulerChar`, whose last component has the stem
`eulerChar`; the gate's stem rule would read it as a claim on this roadmap's declaration. No
declaration stem collides with the README's notation (`cd_R`, `hd_R`, `vcd`, `gd`, `FP_n`, `χ`).

## What the README could not support

- AlgebraicTopology must supply two assertions (declared gaps, unchanged): §8.11a's simplicial
  replacement of a CW complex of dimension at most `N` by an abstract simplicial complex of
  dimension at most `N` (main §8.11a has the replacement by skeletal simplicial approximation and
  mapping cylinders, Hatcher 2C.5, with no dimension bound), and §4.7's affine homeomorphism from the
  realized order complex of a partial order to the realized nerve (main §4.7 has no order-complex
  statement). Both are needed by 5.4 only; the second route of 5.4(a) avoids the second gap.
- BrownGTM87, Farrell1977, EilenbergGanea1957, Wall1961 and Serre1971Prospects are settled
  uncertified and cited by locator only.
- The cap product (CohomologyOfGroups §4.6), the general Euler identity of a spectral sequence
  (SpectralSequencesAndConvergence §§3.4, 5.3) and the directed-union colimit
  (SchemeKTheoryOperations §6.7) are supplier sections, not pinned declarations; the Lean file
  states nothing that needs them.

Notions moved down from later roadmaps: none.

## Duplication sweep and ownership

Searched by object at the pins (grep of Mathlib and Tau Ceti for finiteness types, pseudocoherence
of group rings, discrete cohomological dimension, duality and Poincaré duality groups, cap products
of group (co)homology, Euler characteristics of groups, Farrell/complete cohomology of groups,
geometric dimension, Hattori–Stallings ranks, signed tensor induction of complexes), on main, in the
board packages, and in the open roadmap pull requests (`roadmaps grep` over all 475 heads).

Removals: none. No target of the design exists at the pins or is owned by another roadmap.

Found and cited instead of restated:
- Mathlib `HomologicalComplex.homologyEulerChar` (`Mathlib/Algebra/Homology/EulerCharacteristic.lean`,
  new at the pin): the Euler characteristic of a complex of modules with `finsum`/`finrank`
  conventions. The README now names it as the model of the Euler characteristics of complexes in
  8.2, 8.8, 8.9 and of `rationalEulerChar`; it is not a group invariant, so nothing is deleted.
- Tau Ceti `TauCeti.ContCohomology.nonempty_continuousCohomology_addEquiv_groupCohomology`
  (`TauCeti/RepresentationTheory/Homological/ContCohomology/DiscreteGroup.lean`): continuous against
  discrete cohomology for a finite discrete group in every degree. Cited in the Tau Ceti contract and
  in 2.8 for finite `G`; for infinite discrete groups 2.8 keeps CohomologyOfGroups §1.5.
- Tau Ceti's tensor induction of resolutions (`TauCeti/RepresentationTheory/Tensor/Induction/Resolution.lean`)
  is sign-free, for smooth discrete representations of compact open subgroups, in characteristic
  two; ProfiniteCohomology §13.2 (main) builds the Evens norm from a tensor-induced coinduced
  resolution of a profinite group. Both are different from 3.1's signed tensor induction of complexes
  over a discrete group; the Scope now says so and keeps 3.1 here.
- Other hits checked and found distinct: NoncommutativeAndEquivariantIwasawa (`swan_G0_lattice`, a
  `G₀` lattice statement, not Swan's theorem for projectives); Completed/ProfiniteProPGroups (profinite
  duality groups, not built there); BordismFormalGroups and StablePeriodicCurved (complete
  resolutions of profinite groups and of modules over rings); InfinityCategoryTheory (Wall's
  finiteness obstruction as an aside); SheafTheoreticSmithTheory (étale Smith theory).
- CohomologyOfGroups (open, at its head) excludes finiteness conditions, cohomological and virtual
  cohomological dimension, duality groups, Euler characteristics and Farrell cohomology by name in
  its Scope (its README line 103–104). Board packages: CohomologyOfGroups and
  MotivicStructuresInModuliOfCurves (consumer, §2.1 recalls Harer's `vcd`, cited in Downstream
  consumers) are the only ones mentioning these objects.
- No declaration of `Suggested.lean` shares its fully qualified name with a declaration of another
  roadmap: all live in `TauCetiRoadmap.FinitenessAndDualityOfGroups`.

Citations resolved against the cited roadmaps now: CohomologyOfGroups §§1.2, 1.4, 1.5, 2.3, 3.2,
3.4–3.6, 4.6, 5.2, 6.1–6.3 (head of its open pull request); SpectralSequencesAndConvergence §3.4
(Euler identity bullet) and §5.3 (head); SchemeKTheoryOperations §6.7 (head: the colimit
identification of the homology of a directed union, both halves); FreeGroupsAndLimitGroups
§§4.5, 4.7–4.9, EtaleCohomologyFoundations §F.10.3, ClassifyingSpaces Stage 2 item 10 and Stage 4
items 16–17, AlgebraicTopology §§4.7, 6.3, 6.4, 8.1, 8.3, 8.5, 8.7, 8.11a, ProfiniteCohomology Layer 11
and §13.2 (main). The `roadmaps resolve` leads are the same four as before: three are source keys
(BieriEckmann1974, BrownGTM87, BieriEckmann1973) read as roadmap names, and
MotivicStructuresInModuliOfCurves §2.1 exists in the board package. `scratch/overlaps.md` lists no
pull request changing this roadmap, no dropped id and no second copy.

## Changes from the design (corrections and alignment)

- Lean names added at their targets: 1.2, 1.5, 2.1, 3.2, 4.1, 4.4, 5.1, 5.3, 7.3, 8.3, 8.4, 8.6, 8.7,
  8.9, 9.2.
- Generality aligned with the Lean statements: 1.5 says its directed systems are indexed by nonempty
  directed preorders in `Type u` and its families by types in `Type u`, with the comparison maps
  `colimit.post` and `piComparison`; 7.3 says that a `ℤG`-linear isomorphism of rationalizations is
  a `ℚG`-linear one; 8.4 defines `χ` as the common value of `χ_ℚ(H)/[G : H]` over the torsion-free
  subgroups of finite index, choosing none of them (the set of values, when a singleton, gives its
  element through `∑ᶠ`), with value `0` when there is no such subgroup or the values differ, and
  the Conventions state the junk conventions of `rationalEulerChar` and `groupEulerChar`; 8.7 makes the injectivity of the amalgam's edge maps explicit; 8.9 states the
  integrality for every common multiple (equivalent to the least common multiple form); 9.2 states
  existence as Gorenstein projectivity of `P.complex.opcycles n`.
- Supplier contracts gained: `groupCohomology.functor`, `groupHomology.functor`, `colimit.post`,
  `piComparison`, `ProjectiveResolution`, `HomologicalComplex.opcycles`,
  `HomologicalComplex.homologyEulerChar` (Mathlib, with files and lines),
  `TauCeti.ContCohomology.nonempty_continuousCohomology_addEquiv_groupCohomology` (Tau Ceti).
- "Non-goals" renamed "Out of scope".
- Paragraphs rewrapped at 100 columns without splitting code spans (word sequence verified
  identical apart from the edits above).
- A locator fix in a Lean docstring: `vcd` is in Serre1971Bourbaki §1 in the paragraph after n° 1.6
  (lines 77–86), not in n° 1.6.

## Adversarial pass

`1` is the trivial group; coefficients integral unless stated. Every row computes both sides.

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| `IsOfTypeFPn R G n` | `ℚ` over `ℤ`, `n = 0, 1`; `ℤ`, `n = ⊤`; zero ring | `ℤ` is cyclic over `ℤℚ` (FP_0 true); augmentation ideal of `ℤℚ` not finitely generated (FP_1 false); for `G = ℤ = ⟨t⟩`, `0 → ℤℤ →(t−1) ℤℤ → ℤ → 0` exact (FP_⊤ true); over `0` every module is `0`, `⊤`-pseudocoherent. Index shifted by one would make FP_0 ⇔ `ℚ` finitely generated: false model | pass |
| `IsOfTypeFP R G` | `ℤ` (`m = 1`); `ℤ/2` over `ℤ` and `ℚ` | first syzygy `(t−1)Rℤ ≅ Rℤ` projective; `H^{2k}(ℤ/2, ℤ) = ℤ/2` for all `k ≥ 1`, so no finite projective resolution; over `ℚ`, `ℚ` is a summand of `ℚ[ℤ/2]` (`m = 0`). Free-resolution model (FL) fails there: alternating `ℚ`-dimension of a finite free `ℚ[ℤ/2]` complex is even, `dim ℚ = 1` | pass |
| `isOfTypeFPn_iff_colimit` | `n = 0`; `G = ℚ`, `n = 1`, `R = ℤ`; zero ring | `n = 0`: no `k < 0`; `colim (M_i)^G → (colim M_i)^G` injective for directed colimits; FP_0 always true. `ℚ`: `M_i = ℤ[ℚ/(1/i!)ℤ]`, `(M_i)^ℚ = 0` (infinite orbits), `(colim M_i)^ℚ = ℤ`: `0 → ℤ` not iso at `k = 0`, and FP_1 false. Zero ring: `0 → 0`, both sides true | pass |
| `isOfTypeFPn_iff_piComparison` | `n = 0`; `G = ℚ`, `n = 1`; zero ring | `(∏N_j)_G → ∏(N_j)_G` onto (lift componentwise): Epi holds, FP_0 true. `ℚ`: `(1 − 1/j!)_j ∈ ∏ ℤℚ` maps to `0` in `∏ ℤ` but is not in `I·∏ℤℚ` (would put all `1/j!` in one cyclic subgroup): not mono at `k = 0`. Zero ring: `0 → 0` | pass |
| `cohomologicalDim R G` | `ℤ` over `R ≠ 0`; `1`; `ℤ/2` over `ℤ`; zero ring | `H¹(ℤ, R) = R ≠ 0`, `Hᵏ = 0` for `k ≥ 2`: value `1`; `1`: `0`; `ℤ/2`: `⊤`; zero ring: `0`. Model with `k ≥ n` instead of `k > n` gives `2` for `ℤ` | pass |
| `cohomologicalDim_eq_of_finiteIndex` | `dℤ ≤ ℤ`; `ℤ² ≤` Klein bottle; `0 × ℤ ≤ ℤ/2 × ℤ`; `⊕_ℕ ℤ` | `1 = 1`; `2 = 2`; `1` vs `⊤`, excluded by `IsMulTorsionFree` (the element `s` of order two has `s² = 1²`, `s ≠ 1`); finite-index subgroups of `⊕_ℕ ℤ` contain `ℤⁿ` for all `n`: `⊤ = ⊤` | pass |
| `virtualCohomologicalDim G` | finite `G`; `ℤ/2 × ℤⁿ`; `⊕_ℕ ℤ/2` | `cd_ℤ 1 = 0` on the trivial subgroup: `0`; `ℤⁿ` of index 2: `n`; every finite-index subgroup has torsion: `⊤`. Infimum over all subgroups would give `0` always: excluded by `FiniteIndex` | pass |
| `HasFiniteHomologicalType G` | `S₃`; `ℤ/2 × ℚ`; `F₂` | `vcd = 0`, torsion-free finite-index subgroup `1` with `H₀ = ℤ`: true; `vcd = 2` but `H₁(ℚ, ℤ) = ℚ` not finitely generated: false; `F₂`: `H₀ = ℤ`, `H₁ = ℤ²`: true | pass |
| `IsVirtuallyOfTypeFP G` | `ℤ/4 ∗_{ℤ/2} ℤ/6`; `ℚ` | kernel of the map to `ℤ/12` (`×3`, `×2`) is free of rank 2, index 12, type FL: true; only finite-index subgroup of `ℚ` is `ℚ`, not FP_1: false | pass |
| `geometricDim G` | `1`; `ℤ`; `ℤ²`; `ℤ/2` | point: `0`; circle: `1`; torus (cells 1,2,1): `2`; `cd_ℤ = ⊤ ≤ gd`: `⊤`. Off-by-one model (`n ≤ m`) gives `2` for `ℤ` | pass |
| `geometricDim_le_max` | `1`, `ℤ²`, `ℤ³`, `ℤ/2` | `0 ≤ 3`; `2 ≤ max(3, 2) = 3`; `3 ≤ 3`; `⊤ ≤ ⊤` | pass |
| `exists_linearEquiv_tensorRat` | `G = 1`, `P = ℤʳ`; `G = ℤ/2`, `P = ℤG`; `P = 0`; trivial `ℤ` over `ℤ/2` | `m = r`, `r·1 = r`; `m = 1`, `1·2 = 2`; `m = 0`; non-projective `ℤ` has rank `1`, not a multiple of `2` (excluded by projectivity) | pass |
| `rationalEulerChar G` | `ℤ`; `F_r`; `ℤ/2`; `ℚ`; `ℤⁿ` | `1 − 1 = 0`; `1 − r`; `1`; `H₁(ℚ, ℚ) = ℚ`, `H₂ = 0`: `0`; `Σ_k (−1)ᵏ C(n, k) = 0` | pass |
| `groupEulerChar G` | `ℤ/2`; `ℤ/2 × ℤ`; `S₃`; `⊕_ℕ ℤ/2`; free group `F_ω` of countable rank | values set `{χ_ℚ(1)/2} = {1/2}`: `1/2`; `0 × nℤ` give `0/(2n) = 0`, set `{0}`: `0`; only `H = 1`, set `{1/6}`: `1/6`; no torsion-free finite-index subgroup, set `∅`: `0`; `H = F_ω` gives `1/1`, an index-2 subgroup `1/2` (`H₁` infinite-dimensional, `finrank = 0`), set not a singleton: `0`. Wrong models: `χ_ℚ(G)` gives `1` for `ℤ/2`; a value on a chosen subgroup gives `1` or `1/2` on `F_ω`, undetermined. Scratch elaboration proves `groupEulerChar G = q` when the set of values is `{q}` and `= 0` when there is no such subgroup | definition no longer chooses a subgroup (body: `∑ᶠ` over the set of values when it is a subsingleton, else `0`); README 8.4 and Conventions updated |
| `groupEulerChar_eq_div_index` | `ℤ/2 × ℤ` with `H = 0 × ℤ` and `0 × 2ℤ`; amalgam with its index-12 kernel; `S₃`, `H = 1` | `0/2 = 0/4 = 0`; `(1 − 2)/12 = −1/12`; `1/6` | pass |
| `groupEulerChar_subgroup` | `A₃ ≤ S₃`; kernel `≤` amalgam; `H = G` | `1/3 = 2 · 1/6`; `−1 = 12 · (−1/12)`; index `1` | pass |
| `isVirtuallyOfTypeFP_and_groupEulerChar_eq_mul` | `C₃ ◁ S₃`; `F₃ ◁ F₂ × F₃`; Klein bottle over `⟨a⟩`; `ℤ/2 ◁ ℤ/2 × ℤ` | `1/6 = 1/3 · 1/2`; `2 = (−2)(−1)` (Betti `1, 5, 6`); `0 = 0 · 0`; `0 = 1/2 · 0`. Virtual torsion-freeness is a hypothesis, as in Brown1974 Corollary 2 (line 455) | pass |
| `groupEulerChar_pushoutI` | `ℤ/4 ∗_{ℤ/2} ℤ/6`; `ℤ/2 ∗ ℤ/3`; `ℤ ∗ ℤ`; `φ true` an isomorphism | `1/4 + 1/6 − 1/2 = −1/12` (= kernel `−1/12`; reversed edge sign `11/12` refuted); `1/2 + 1/3 − 1 = −1/6`; `0 + 0 − 1 = −1 = χ(F₂)`; `χ(C) + χ(B) − χ(C) = χ(B)` | pass |
| `groupEulerChar_hnnExtension` | `H = A = B = 1` (`ℤ`); `BS(1, 2)`; `ℤ/2` along the identity (`ℤ/2 × ℤ`) | `1 − 1 = 0`; `0 − 0 = 0`; `1/2 − 1/2 = 0 = χ(ℤ/2 × ℤ)` | pass |
| `exists_int_eq_mul_groupEulerChar` | amalgam, `m = 12, 24`; `ℤ/2 ∗ ℤ/3`, `m = 6`; finite `G`, `m = |G|`; `m = 0` | `−1`, `−2`; `−1` (largest order `3` gives `−1/2`, excluded since `2 ∤ 3`); `1`; `0` | pass |
| `exists_subgroup_card_eq_of_dvd_den` | amalgam (den `12`); `ℤ/2 ∗ ℤ/3` (den `6`); torsion-free `G` | prime powers `1, 2, 4, 3` dividing `12`: subgroups `1, ℤ/2, ℤ/4, ℤ/3 ≤ ℤ/6`; `2, 3`: present; den `1`: only `k = 0`, trivial subgroup | pass |
| `isGorensteinProjective_opcycles` | `G = ℤ/2`, `H = 1`, `n = 0`; `G = 1`; `G = H = ℤ`, `n = 0`; `ℤ/2 × ℤ`, `H = ℤ`, `n = 1` | `opcycles 0 ≅ ℤ`, complete resolution `⋯ →(1−s) ℤG →(1+s) ℤG →(1−s) ⋯`; `R` projective; hypothesis `cd ℤ = 1 ≤ 0` false and `R` is not Gorenstein projective over `Rℤ` (finite projective dimension, not projective); augmentation ideal is `ℤℤ`-projective. `cycles n` (= `Ω^{n+1}`) would be a weaker claim: `cycles 0 = P_0` | pass |
| Conventions: junk values of `rationalEulerChar`, `groupEulerChar` | free group of countable rank; `⊕_ℕ ℤ/2` | `H₁` infinite-dimensional, `finrank = 0`, `χ_ℚ` value `1` (junk), and `χ = 0` because the whole group and an index-2 subgroup give `1` and `1/2`; no torsion-free finite-index subgroup: `0`. Every theorem assumes finite homological type (finite-dimensional `Hᵢ(H, ℚ)`, zero above `cd_ℤ H`), or for 8.6 virtual type `FP` with virtual torsion-freeness, under which the values agree and the set is a singleton | pass |
| Contract: `P.complex.opcycles n` is the `n`-th syzygy | `n = 0, 1` | `coker(P₁ → P₀) ≅ R` by exactness at `P₀`; `coker(P₂ → P₁) ≅ im(P₁ → P₀) = ker ε` | pass |
| Contract: `Module.finrank ℤ` | `ℤ ⊕ ℤ/2`; `ℤ/2` | `(1, 0)` independent, any two elements dependent: `1`; no nonzero independent element: `0` | pass |
| 7.3: `ℤG`-linear iso of rationalizations is `ℚG`-linear | additive `f` between `ℚ`-spaces | `n·f(x/n) = f(x)` gives `f(qx) = q f(x)` | pass |
| 8.9: every common multiple | lcm `12`, `m' = 24` | `24χ = 2 · (12χ) = −2 ∈ ℤ`; converse at `m' = lcm` | pass |
| 2.8 for finite `G` via the Tau Ceti comparison | `ℤ/2`; `1` | both sides `⊤` (`H^{2k}(ℤ/2, ℤ/2) ≠ 0`); both `0` | pass |
| Context of every Lean statement | all 22 declarations | no section `variable`s; each declaration carries its own binders (checked with `#check @name`, below) | pass |

The design's remaining statements are unchanged and keep the computed rows of the accepting
review (its tables cover all 51 targets); I recomputed while writing: the signed and unsigned swap
on `d(x ⊗ x) = y ⊗ x − x ⊗ y` (3.1), the `ℤ/2`-contraction `h(y⊗y) = (a + b)/2` (3.1), the `ℤ/12`
map of 4.1, `H¹` of the index-two subgroup of `F₂` as `2·𝟙 ⊕ sgn` (8.5), Floyd's relation
`0 + 1·2 = 2·1` on the four-vertex circle (8.8) and `Ĥᵏ = ℤ/12` (even `k ≥ 2`) for the amalgam (9.4).

## Lean

Elaboration: `lake env lean` on `packages/FinitenessAndDualityOfGroups/Suggested.lean` from the
content checkout, after building `TauCeti.Algebra.Homology.TotallyAcyclic.Abelian` (its object file
was missing; `lake build` of that module completed successfully). Result: exit 0, **13** warnings
`declaration uses 'sorry'` (one per theorem), no other message. Imports: `import Mathlib` and five
`TauCeti.*` modules (`Algebra.Module.PseudoCoherent.Basic`,
`Algebra.Module.PseudoCoherent.FiniteProjectiveDimension`, `Data.ENat.LeastBound`,
`AlgebraicTopology.EilenbergMacLane.Basic`, `Algebra.Homology.TotallyAcyclic.Abelian`). No
`set_option`, no `lemma`, no sorry'd data, no `choose`; the only non-theorem command is
`open scoped Classical in` for the decidability of the `if` (on `Set.Subsingleton` of the set of
values) in `groupEulerChar`.

Binder check: a scratch copy with `#check @name` for all 22 declarations was elaborated once; each
elaborated type was compared with its README statement. All binders are in the declarations' own
signatures. Changes made from it: none to the statements; the definition of the Euler
characteristic needed `open scoped Classical in` to elaborate, and the declaration was renamed
`groupEulerChar` (with its theorems) for the gate's stem rule. After the body of `groupEulerChar`
was changed so that it chooses no subgroup, `#check @groupEulerChar` elaborates to
`groupEulerChar : (G : Type) → [Group G] → ℚ` (unchanged), and a scratch copy of the file with two
proved `example`s (value `q` when the set of values is `{q}`, by `finsum_mem_singleton`; value `0`
when there is no torsion-free subgroup of finite index, by `finsum_mem_empty`) elaborated with exit
0; neither `example` is in `Suggested.lean`.

## Dependency check

```text
depcheck: 245 roadmaps, 2210 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. FinitenessAndDualityOfGroups is at line 319 of the merge order,
right after CohomologyOfGroups (318). Suppliers named: CohomologyOfGroups, SpectralSequencesAndConvergence,
SchemeKTheoryOperations (all earlier in the order), FreeGroupsAndLimitGroups, EtaleCohomologyFoundations,
ClassifyingSpaces, AlgebraicTopology, ProfiniteCohomology (main). SheafTheoreticSmithTheory (later),
GorensteinHomologicalAlgebra and PosetHomotopyAndSubgroupComplexes (not in the order) are named only
as owners of different theories, never as suppliers.

## Untrusted text

No instruction-like passage was found in the reviews, roadmaps or sources read.

<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/15391#issuecomment-6889892678 -->
Red team round 2 pass b (claude) of 51a0713

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) universal covers of arbitrary CW complexes: semilocal simple connectivity has no owner

   Location: `packages/FinitenessAndDualityOfGroups/README.md:1432-1434`, "the universal covering
   `TauCeti.UniversalCover` of `|K|` (a covering map by `TauCeti.UniversalCover.isCoveringMap`, the
   realization being locally path-connected and semilocally simply connected)"; the same input is used
   without mention at `README.md:1344-1348` (5.2: "the lifted cellular chains of the universal cover")
   and `README.md:1362-1375` (5.3: the universal covers of the skeleton and of the complex with cells
   attached).

   Claim: every Hausdorff CW complex that occurs (an arbitrary `K(G, 1)` CW complex of
   `geometricDim`, its skeleton with cells attached, the realization `|K|`) has a universal cover that
   is a quotient covering for its fundamental group, so `TauCeti.cellularResolutionOfIsAspherical`
   applies.

   Witness: `TauCeti.UniversalCover.isQuotientCoveringMap`
   (`TauCeti/AlgebraicTopology/UniversalCover/Action.lean` line 162) assumes
   `[SemilocallySimplyConnectedSpace X]`; no pinned instance gives it for `Topology.CWComplex`;
   `TauCeti.isAspherical_of_forall_isEmpty_cell` (`…/EilenbergMacLane/OneDimensional.lean` line 72)
   carries it as a hypothesis.

   Detail: `TauCeti.UniversalCover.isCoveringMap` (`…/UniversalCover/Covering.lean` line 58) has the
   same hypothesis. The pin gives Hausdorff CW complexes only local path-connectedness
   (`TauCeti.instDeltaGeneratedSpaceOfCWComplexUniv`,
   `TauCeti/Topology/CWComplex/Classical/DeltaGenerated.lean` line 66); neither Tau Ceti nor Mathlib
   has `SemilocallySimplyConnectedSpace`, `LocallyContractibleSpace` or
   `StronglyLocallyContractibleSpace` for a CW complex or for `AbstractSimplicialComplex.Realization`.
   No roadmap states it for a general CW complex: ClassifyingSpaces proves it for its two models only
   (its introduction, item 1), and its Stage 4 item 16 takes the universal cover `E` as given;
   `roadmaps grep` for local contractibility or semilocal simple connectivity of CW complexes finds
   no target on main or at an open head. `geometricDim` quantifies over all Hausdorff CW complexes
   with no such hypothesis, so `cd_R G ≤ gd G` (5.2) needs the general theorem.

   Repair (the theorem is true, Hatcher, *Algebraic Topology*, Appendix, Proposition A.4; the pinned
   file `DeltaGenerated.lean` already cites that proposition for the half it proves). Add to 5.1,
   before the bullets, the target:

   > Prove that a Hausdorff space with a CW structure on `univ` is locally contractible
   > (Mathlib's `LocallyContractibleSpace`: every neighbourhood of a point contains a neighbourhood
   > whose inclusion into it is null-homotopic), hence semilocally simply connected
   > (`TauCeti.SemilocallySimplyConnectedSpace.of_locallyContractibleSpace`); with the pinned local
   > path-connectedness `TauCeti.instDeltaGeneratedSpaceOfCWComplexUniv`, a path-connected Hausdorff
   > CW complex `X` then has the universal cover `TauCeti.UniversalCover x₀`, a quotient covering for
   > `π₁(X, x₀)` (`TauCeti.UniversalCover.isQuotientCoveringMap`) (Hatcher, Appendix, Proposition
   > A.4). Route: enlarge a neighbourhood skeleton by skeleton, pushing radially away from the centre
   > of each cell, and pass to the union by the weak topology. Checks: the wedge of countably many
   > circles is semilocally simply connected, in agreement with the pinned
   > `TauCeti.WedgeSum.instSemilocallySimplyConnectedSpaceCircle`; the Hawaiian earring is not
   > semilocally simply connected at its wedge point, and is not a CW complex (its topology at that
   > point is not the weak one); a discrete space satisfies the statement trivially.

   Then: add "5.1" and these three Tau Ceti names to the `*Needs:*` lines of 5.2, 5.3 and 5.4; in
   5.4(a) replace "the realization being locally path-connected and semilocally simply connected" by
   "the realization being a Hausdorff CW complex, 5.1"; add the three declarations to the Tau Ceti
   supplier contracts with their files (`…/SemilocallySimplyConnected/Basic.lean` line 131,
   `…/UniversalCover/Action.lean` line 162, `…/CWComplex/Classical/DeltaGenerated.lean` line 66) and
   Mathlib's `LocallyContractibleSpace` (`Mathlib/Topology/Homotopy/LocallyContractible.lean`); record
   Hatcher in `sources.toml` and the References. Tested on the refuting instance: for an arbitrary
   `K(G, 1)` CW complex `X` of 5.2 the hypotheses of `UniversalCover.isQuotientCoveringMap` are now
   `LocallyPathConnectedSpace X` (pinned instance), `PathConnectedSpace X` (part of
   `TauCeti.IsAspherical`) and `SemilocallySimplyConnectedSpace X` (the new target). Alternative of
   equal standing: declare it as a gap on AlgebraicTopology (a general CW fact) in the README and the
   plan's `gaps`; the theorem must have one of the two owners.

2. **F02** (P3) 7.5 uses a pinned theorem it does not name

   Location: `packages/FinitenessAndDualityOfGroups/README.md:1892-1893`, "whose residue fields at
   maximal ideals are finite (a field finitely generated as a ring is finite)"; `*Needs:*` at
   `README.md:1898-1899` lists only `IsLocalRing`, Nakayama's lemma and `Module.Projective`.

   Claim: the finiteness of the residue fields is available.

   Witness: no declaration is cited. The pin has `finite_of_finite_type_of_isJacobsonRing`
   (`Mathlib/RingTheory/Jacobson/Ring.lean` line 691): a field of finite type over a Jacobson ring is
   a finite module over it.

   Repair: in the route replace the parenthesis by "(a field of finite type over `ℤ` is a finite
   `ℤ`-module by `finite_of_finite_type_of_isJacobsonRing`, `ℤ` being a Jacobson ring; it is then not
   of characteristic zero, `ℚ` not being a finitely generated abelian group, so it is finite over
   `𝔽_p`)"; add the name to the `*Needs:*` line of 7.5 and to the Mathlib contracts. Tested: for the
   subring `ℤ[1/2] ⊂ ℚ` the residue fields are `𝔽_p`, `p` odd; `ℚ` itself is not of finite type over
   `ℤ`, so the statement does not claim it finite.

Round 2. One blocking finding (S01, an unowned prerequisite of Layer 5) and one P3 finding (S02).
The six findings of round 1 are repaired at this head, one of them partly, with the remainder
settled by the repair report.

## Round 1 findings at this head

| Finding | Status | Witness at 51a0713 |
| --- | --- | --- |
| 1a/F01 (general 8.7 statable) | repaired | `packages/FinitenessAndDualityOfGroups/Suggested.lean:278-287`, `groupEulerChar_eq_sum_of_monomialResolution`; README 8.7 line 2095 names it; the "not statable" bullet is gone. Recomputed: `ℤ/2`, `C = ℤ` in degree 0: `1/2 = 1/2`; `ℤ` on the line: `0 = 1 − 1`; amalgam: `1/4 + 1/6 − 1/2 = −1/12`. |
| 1a/F02 (twisted 8.5 missing) | repaired | `Suggested.lean:256-260`, `finsum_finrank_groupCohomology_eq_groupEulerChar_mul`, hypothesis `IsOfTypeFP ℤ G`; README 8.5 line 2025. Recomputed: `F₂`, `V = 𝔽₂`: `1 − 2 = −1 · 1`; `ℤ`, `λ ≠ 1`: `0 − 0 = 0 · 1`; `ℤ/2`, `V = ℚ`: `1 ≠ 1/2`, excluded by type `FP`. |
| 1a/F03 (5.4 and 8.8(a) absent) | repaired | `Suggested.lean:176-184` and `320-334`; README 5.4(c) lines 1412-1416 and 8.8(a) lines 2152-2155. Recomputed: finite `G`, `Γ = 1`: point, stabilizer of order `[G : 1]`; reflection of the 4-cycle, `p = 2`: `0 + 1 · 2 = 2 · 1`, tails `2 ≤ 2`, `0 ≤ 1`. |
| 1b/F01 (gap not minimal) | partly repaired | README: no occurrence of `order-complex`, `nerve`, `toTop` or `sd K`; 5.4(a) uses only `K_≤` (lines 1423-1449); the only contract is `gap:simplicial-replacement-dimension` (line 610). `design/plan.json` lines 2558-2560 still list `order-complex-nerve-realization`; the repair report marks this as not changeable at the package stage, with a reason (a target of the plan names it). Settled; not re-raised. |
| 1b/F02 (docstring minimality) | repaired | `Suggested.lean:338-340`: "The source states it for their least common multiple … `m · χ(G)` can be an integer for smaller `m` as well (`χ(ℤ/2 × ℤ) = 0`)". `1 · 0 ∈ ℤ`, lcm `2`: true. |
| 1b/F03 (locator of 2.3(b)) | repaired | README lines 971-973: "BieriEckmann1973 Proposition 3.1, lines 366–369, with the isomorphism `Hom_H(ℤG, ℤH) ≅ ℤG` of lines 345–351". |

No repair introduced an error that I could find in the four new declarations or in the rewritten
route of 5.4(a), apart from the prerequisite of S01, which the rewritten route states in a
parenthesis without an owner (and which 5.2 and 5.3 already used silently).

## Dependency check

    depcheck: 245 roadmaps, 2214 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The roadmap is at line 319 of `merge-order/ORDER.txt`, after
CohomologyOfGroups (318). MotivicStructuresInModuliOfCurves (350) and
PosetHomotopyAndSubgroupComplexes are named only as downstream consumers.

## The adversarial pass: Suggested.lean (27 declarations)

Context: `namespace TauCetiRoadmap.FinitenessAndDualityOfGroups`, `universe u`, no `variable`, no
`include`; every binder is in the declaration's own signature. The elaborated types of the worker's
signature file for this head were compared with the README statements, all 27; none lost a binder;
nothing changed. No Lean was run.

| Declaration | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| `IsOfTypeFPn` | `n = 0`; `ℚ`, `n = 1`, `R ≠ 0`; `R = 0` | `R` cyclic over `RG`: true; augmentation ideal of `Rℚ` not finitely generated: false; all modules `0`: true | index of pseudocoherence, as README |
| `IsOfTypeFP` | `ℤ/2` over `ℚ`, over `ℤ`; `G = 1` | `IsFPD … 0` (`ℚ` projective); no `m` (`H^{2k} = ℤ/2`); `m = 0` | sound |
| `isOfTypeFPn_iff_colimit` | `n = 0`; `ℚ`, `n = 1`; index type | left true, right: invariants of a filtered colimit, injective; `(M_i)^ℚ = 0`, `(colim)^ℚ = R`; the converse's test system (quotients of `RG`-modules by finitely generated submodules) is indexed in `Type u` | true; Brown1975 lines 83-92, same index `k` |
| `isOfTypeFPn_iff_piComparison` | `n = 0`; `ℚ`, `n = 1`; `n ≥ 1`, copies of `RG` | coinvariants of a product onto the product: surjective; `H₀(∏Rℚ) → ∏R` not injective; "epi at `k = n`" onto `∏ Hₙ(G, RG) = 0` is vacuous, so (e) reads `H₀` bijective and `Hₖ(G, ∏RG) = 0` for `1 ≤ k < n` | true; Brown1975 lines 93-101 |
| `cohomologicalDim` | `1`; `ℤ`; `ℤ/2` over `ℤ`; `R = 0` | `0`; `1`; `⊤`; `0`; `leastENatBound` takes `P : ℕ → Prop`, predicate monotone | sound |
| `cohomologicalDim_eq_of_finiteIndex` | `H = G`; Klein bottle ⊇ `ℤ²`; `ℤ/2 × ℤ`; `ℤ^{(ℕ)}` | equal; `2 = 2`; `⊤ ≠ 1`, excluded by `IsMulTorsionFree`; `⊤ = ⊤` | true |
| `virtualCohomologicalDim` | finite `G`; `ℤ/2 × ℤⁿ`; `⊕_ℕ ℤ/2` | `0`; `n`; `⊤` | sound |
| `HasFiniteHomologicalType` | finite; `ℤ/2 × ℚ`; `ℤ` | true; false (`H₁(ℚ) = ℚ`); true | Brown1974 lines 367-370 |
| `IsVirtuallyOfTypeFP` | finite; `ℚ` | true; false (no proper finite-index subgroup, not finitely generated) | sound |
| `geometricDim` | `1`; `F_S`; `ℤⁿ`; finite `≠ 1` | `0`; `1`; `n`; `⊤` | sound; see S01 for 5.2 |
| `geometricDim_le_max` | `1`; `ℤ²`; `ℤ³`; `ℤ/2` | `0 ≤ 3`; `2 ≤ 3`; `3 ≤ 3`; `⊤ ≤ ⊤` | true |
| `exists_acyclic_action_finite_stabilizers` | `G` finite, `Γ = 1`, `n = 0`; `ℤ/2 × ℤ ⊇ ℤ`, `n = 1`; `Z = ∅` | point, `0 ≤ 3·|G|`, stabilizer `|G| ≤ [G : 1]`; `W × W`, `2 ≤ 6`, stabilizer of `(w, w')` under `s t^b`: `2b = 0`, `w = w'`, so `⟨s⟩` on the diagonal, `⟨s⟩ ∩ Γ = 1`; `H₀(∅) = 0 ≠ ℤ` excluded | true |
| `exists_linearEquiv_tensorRat` | `G = 1`, `P = ℤ^r`; `P = (ℤG)²`; `P = 0`; trivial `ℤ` over `ℤ/2` | `m = r`; `2`; `0`; `m · 2 = 1` impossible, excluded (not projective) | true |
| `exists_linearEquiv_tensorZMod` | same, `p = 2, 3`; `ℤ` over `ℤ/p` | `m = r`, `2`, `0`; `𝔽_p` of dimension `1 < p` | true |
| `rationalEulerChar` | `1`; `ℤ`; `F_r`; `ℤ/2`; `ℚ`; `F_ℕ` | `1`; `0`; `1 − r`; `1`; `1 − 1 + 0 = 0`; `1` (junk) | docstring agrees |
| `groupEulerChar` | finite; `ℤ/2 × ℤ`; `F_ℕ`; `⊕ℤ/2` | `1/|G|`; `0`; `0` (values `1 ≠ 1/2`); `0` (empty set) | sound |
| `groupEulerChar_eq_div_index` | finite `G`, `H = 1`; amalgam, kernel of index 12 | `1/|G|`; `(1 − 2)/12 = −1/12` | true |
| `groupEulerChar_subgroup` | `H = G`; `1 ≤ G` finite; `F₃ ≤ F₂` | equal; `1 = |G| · 1/|G|`; `−2 = 2 · (−1)` | true |
| `finsum_finrank_groupCohomology_eq_groupEulerChar_mul` | `G = 1`; `ℤ`, `λ = 1`, `λ ≠ 1`; `F₂`, `𝔽₂`; `ℤ/2`, `ℚ` | `dim V = 1 · dim V`; `1 − 1`, `0 − 0`, both `0 · 1`; `1 − 2 = −1`; `1 ≠ 1/2` excluded | true over every field (Brown1974 lines 1284-1288) |
| `isVirtuallyOfTypeFP_and_groupEulerChar_eq_mul` | `N = 1`; `ℤ/2 × ℤ`; `F₂ × F₃`; image of a torsion-free subgroup with torsion | `χ · 1`; `(1/2) · 0`; `(−1)(−2) = 2`; the route intersects with the preimage of a torsion-free `Q₀`, so the image is torsion-free | true; Brown1974 lines 452-463 |
| `groupEulerChar_eq_sum_of_monomialResolution` | `ℤ/2`; `ℤ` on the line; `ℤ/2` flipping an edge; `ℤ²`; all `ι p` empty | `1/2`; `1 − 1`; `1 − 1/2 = 1/2` with `ℤ_sgn`; `1 − 2 + 1`; no `QuasiIso` to `ℤ`, vacuous; general count `[G : Γ'H][H : H ∩ Γ'] = [G : Γ']` | true |
| `groupEulerChar_pushoutI` | trivial groups; amalgam; `ℤ/2 ∗ ℤ/3`; `ℤ ∗ ℤ` | `1 + 1 − 1`; `−1/12`; `−1/6`; `0 + 0 − 1` | true |
| `groupEulerChar_hnnExtension` | `H = A = 1`; `BS(1, 2)`; `ℤ/2 × ℤ` | `1 − 1 = 0 = χ(ℤ)`; `0 − 0`; `1/2 − 1/2` | true |
| `smith_floyd` | point; trivial action; reflection of the 4-cycle; free `ℤ/3` on a 3-cycle; `k > N` | `1 + (p − 1) = p`; `χ + (p − 1)χ = pχ`; `0 + 2 = 2 · 1`; `0 + 0 = 3 · 0`; empty sums `0 ≤ 0` | true; a nondegenerate simplex is fixed or has `p` translates |
| `exists_int_eq_mul_groupEulerChar` | finite, `m = |G|`; amalgam, `m = 12`; `m = 0` | `1`; `−1`; `0` | true |
| `exists_subgroup_card_eq_of_dvd_den` | `k = 0`; amalgam, `4` and `3` | trivial subgroup; `ℤ/4`, `ℤ/3` | true |
| `isGorensteinProjective_opcycles` | finite `G`, `H = 1`, `n = 0`; `H = G`; `R = 0` | `opcycles 0 = R`, restriction to `1` projective; syzygy projective; zero object | true; pinned definition is "degree-zero cycles of a totally acyclic cochain complex" |

One-tactic probe, by reading bodies and pins: none of the 27 follows from a definition, one
library lemma or a README Check. No padding.

Headline theorems (README lines 25-29): 1.5, 3.2, 5.3, 6.3, 8.4, 8.6, 8.7, 8.9, 9.4. Stated: 1.5
(two forms), 3.2, 5.3, 8.4 (two), 8.6, 8.7 (general, amalgam, HNN), 8.9 (two), and 5.4, 7.3(b),
7.4, 8.5, 8.8(a), 9.2. Named as not statable in the module docstring: 6.3 with 6.4(b) and 6.6, 9.4,
the `G₀` form of 8.5, 7.3(a). Checked at the pins: no cap product on `groupCohomology` and
`groupHomology`, no Farrell cohomology, no Hattori–Stallings trace over a noncommutative ring (the
only "Stallings" files are folding of graphs); the reasons hold.

## The adversarial pass: README targets (51)

| Target | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 1.1 | `ℚ` over `ℤ`; `k = A/(x_i)`; `M = 0` | projections to `ℚ/(1/i!)ℤ` nonzero, colimit `0`; `Hom(k, A/(x₁..x_i)) = 0` (`x_{i+1}` regular), `Hom(k, k) = k` | holds |
| 1.2-1.4 | `1`, `ℤ`, `ℤ/2`; `F₂`; `ℚ` | `FL`; `FL`; `FP_∞` not `FP` over `ℤ`, `FP` over `ℚ`; boundary `(a, b) ↦ a(s − 1) + b(t − 1)`; not `FP_1` | holds |
| 1.5-1.8 | (e) for `n ≥ 1`; lamplighter; `n = 0` in 1.8; colimit of spectral sequences | as in the Lean table; base not finitely generated; `0 − 1 = 0`; `E₂^{p,q}` with `p + q ≤ n` have `p, q ≤ n` | holds |
| 2.1-2.4 | 2.2(b) with `cd = m > n`; 2.3(b) at `n = 0`; Klein bottle over `𝔽₂` | `Hᵐ(G, −)` right exact, quotient of a free module; `0 = 0`; `1 − (−1) = 0`, `H² = 𝔽₂` | holds |
| 2.5-2.8 | `ℚ`; `ℤ/2` over `ℤ/6` | `Hom(ℚ, ℚ) = ℚ` countable in `Hom(ℚ, ℚ/ℤ)`, `Ext¹(ℚ, ℤ) ≠ 0`, `cd = 2`; `(ℤ/6)/2 = ℤ/2 ≠ 0` | holds |
| 3.1-3.2 | `F = (Rx → Ry)` | `d(x⊗x) = b − a`, `da = db = y⊗y`; `dh + hd = id` on `y⊗y, a, b, x⊗x`; equivariant `h` needs `2k = 1`; with `2` a unit `h(a) = −(x⊗x)/2`: `−(b − a)/2 + (a + b)/2 = a`; swindle on the top term gives a free resolution of length `n` for `n ≥ 1` | holds |
| 4.1-4.4 | amalgam → `ℤ/12`; extension bound; Proposition 1 with this definition | `2 ↦ 6`, `3 ↦ 6`, compatible, index `12`; `1 = 0 + 1`; normal core of `T ∩ H` in `T` and the spectral sequence give finitely generated `H_*(T)` | holds |
| 5.1-5.4 | `S²`; swindle `Z ⊕ F ≅ F`; `K_≤` for an edge, `∂Δ²`; stabilizer in `Z` | `π₂ = ℤ`; cycles free; ranks `(2, 1)`, `(3, 3)`; `γ f(1) = f(γ) = f(1)` forces `γ = 1` | holds up to S01 |
| 6.1-6.3 | `ℤ`; finite `G`, `|G|` a unit; `F_r`; `ℤ ∗ ℤ²` | `x ↦ x(t)`; inverse `[m] ↦ |G|⁻¹ Σ g m`; dual boundary `a ↦ ((s_i − 1)a)_i`, right linear; `ℤG ↪ H¹` | holds |
| 6.4-6.6 | (b) for `∏ℤG`; `sgn ≠ w`; doubled-point circle | `Hₖ(G, ∏ℤG) ≅ ∏Hₖ(G, ℤG) = 0`, `k ≥ 1`; `0 ≅ ℤ` contradiction; `π₁ = F₂`, `H¹ = ℤ²` against `ℤ` or `ℤ/2` | holds; source hypothesis "for all `k`" equals the README's three clauses |
| 7.1-7.2 | `P = RG`; `Re`; `ℤ/3` over `ℂ`; `𝔽_p[ℤ/p]` | `[G : C] · [g = 1] = [g = 1]`; `1/|C|`; coefficient of `g⁻¹` is `ω/3`; `χ_P(1) = 0`, `r_P([1]) = 1` | holds |
| 7.3-7.5 | `g ≠ 1`; Nakayama step; `Γ = ℤ`, `P = ℤ`, `λ ≠ 1` | `|C| · r_P = 0` in `ℤ`; cokernel then kernel vanish mod `p`; `0 ≠ 1` without projectivity | holds; S02 |
| 8.1-8.4 | `k[x₁, …]`; `ℤ/2` on `ℤG`, on `ℤ`; 8.4(a) | no `D`; `2 = 2 · 1`; `1 ≠ 2`; `C = ℤ ⊗_{ℤΓ'} P` over `ℤ[Γ/Γ']` | holds |
| 8.5-8.6 | `F₂`, index 2, `ℚ` and `𝔽₂`; `F₂ × F₃` | `a` swaps the duals of `b`, `aba⁻¹` (`a²ba⁻² ≡ b`), `H¹ = 2·𝟙 ⊕ sgn`, class `−[ℚ[ℤ/2]]`; length `1 − 3 = −2`; `1 − 5 + 6 = 2` | holds |
| 8.7 | amalgam; wrong sign; character `ε` | `−1/12`; `11/12 > 1/12`; `χ_ℚ(ker ε) = 2χ_ℚ(T) = χ_ℚ(T) + χ_ℚ(T; ℚ_ε)` | holds |
| 8.8 | point-homology bullet at `p = 2`; `Eℤ/2`; `Δ[0]` | total `≤ 1` and `χ ≡ 1 mod 2`, nonempty so `H₀ ≠ 0`: homology of a point; `χ = 1` odd, infinite dimension; unnormalized chains `ℤ` in every degree | holds |
| 8.9 | amalgam; stabilizer in `Q` | `12 · (−1/12)`, `6 · (−1/12) ∉ ℤ`; `Γ'G_z/Γ' ≅ G_z`, orbit size `|Q|/|G_z|`, a multiple of `|Q|/m` | holds |
| 9.1-9.5 | `ℤ/2`; `ℤ/2 × ℤ`; amalgam | `Ĥ⁰ = ℤ/2`, `Ĥ^{±1} = 0`; `id − id = 0`, `Hᵏ = ℤ/2`; kernel of order `24/2 = 12` containing `(1, 1)` | holds |

## Verified sound

- Read: `Suggested.lean`, all 367 lines, 27 declarations; README, all 2474 lines, 51 targets with
  51 Check blocks. Values recomputed for the rows above; no Check contradicts a theorem of its
  section; each definition has at least three Checks.
- Lean against README: equal generality in all 27; imports are `import Mathlib` and five
  `TauCeti.*` modules, each used; no `set_option`, `lemma`, `#eval`, `True` placeholder or sorry'd
  data; all 27 names occur in the README.
- Pinned declarations opened this round: 22 Mathlib locators (the simplicial-set homology,
  normalized chains, dimension, `Action`, `End.asHom`, `Rep.ind`, `single₀`, lifting, charted-space
  entries; all at the cited lines) and 9 Tau Ceti declarations with bodies
  (`leastENatBound`, `IsFPD`, `IsAspherical`, `IsEilenbergMacLaneSpaceOne`,
  `IsTotallyAcyclicProjective`, `isGorensteinProjective`,
  `nonempty_linearEquiv_of_projective_of_tensorRat`, `trace_ofModule'_eq_zero_of_dvd_orderOf`,
  `cellularResolutionOfIsAspherical`).
- Source locators verified against the cached texts: 42 (Brown1974 21, Brown1975 5,
  BieriEckmann1974 5, Serre1971Bourbaki 5, Floyd1952 4, BieriEckmann1973 2); all carry their claims.
  Brown1974 Corollary 1 of Theorem 4 is stated in characteristic zero; the README says so and
  rests the general field on Theorem 7, which has no characteristic hypothesis.
- Sibling citations resolved at their current text: 36. CohomologyOfGroups (open head) §§1.2, 1.4,
  1.5, 2.3, 3.2, 3.4, 3.5, 3.6, 4.6, 5.2, 6.1, 6.2, 6.3 and its Scope exclusion (line 103), with
  3.2, 3.6, 4.6 and 6.2 read (the classical `E_r` on native page `r + 1`; `tr(y ∩ z) = res y ∩ tr z`);
  SpectralSequencesAndConvergence (open head) §3.4 Euler identity and §5.3; FreeGroupsAndLimitGroups
  §§4.5, 4.7, 4.8, 4.9; SchemeKTheoryOperations §6.7 (directed unions); EtaleCohomologyFoundations
  §F.10.3; ClassifyingSpaces items 10, 16, 17; AlgebraicTopology §§6.3, 6.4, 8.1, 8.3, 8.5, 8.7,
  8.11a; ProfiniteCohomology Layer 11, §13.2; FuchsianOrbifolds Layer 5 item 6; BianchiModularForms
  §9.3; ArithmeticKTheory §3.2; MotivicStructuresInModuliOfCurves §2.1 (board package).
- Ownership by object against main and the open heads of the index: finite homological type, type
  `FP`, Eilenberg–Ganea, Farrell cohomology, geometric dimension, Hattori–Stallings rank, the names
  of `Suggested.lean`. No second owner; no fully qualified name of the file occurs elsewhere.
- Gap `simplicial-replacement-dimension`: precise, minimal, same slug in the plan and the README.
- Policy: the pull request changes only `packages/FinitenessAndDualityOfGroups/`; no pull-request
  number or process narrative in the README or docstrings; every target has a locator.
- Overlaps file: no second copy, no dropped id, no other pull request changes this roadmap.

Source independence: 14 passages compared with 6 sources (Brown1974 lines 367-370, 441-447,
452-456, 558-563, 603-610, 643-651, 1284-1288; Floyd1952 lines 292-299, 333-336; BieriEckmann1974
lines 327-331; Brown1975 lines 83-95, 208-215; Serre1971Bourbaki lines 77-86; BieriEckmann1973
lines 317-323), none shared beyond statements the mathematics forces (longest common run 11 words,
the definition of finite homological type in the docstring at `Suggested.lean:139-140`); largest
share Brown1974, 36 of 131 locators; contents compared with Brown1974 (§§1-7, Appendices A-B):
independent (its §3 lies in 4.4, Appendix A in 7.4-7.5, §§1, 2, 4, 5, 6 in Layer 8 in the order
8.1-8.2, 8.8, 8.3-8.6, 8.7, 8.9 forced by the `*Needs:*` lines, §7 and Appendix B out of scope).

## Not verifiable

- Locators into BrownGTM87 (22), Farrell1977, EilenbergGanea1957, Wall1961 and Serre1971Prospects:
  uncertified, no text in the cache.
- Elaboration: no Lean was run; types are those of the worker's signature file for this head.
- LeanSearch and Loogle leads of the library-matches file: read; none is a statement of this file.
- Ownership against pull requests outside the index of the brief was not checked.
- Hatcher, Proposition A.4 (the locator of the repair of S01): cited from the reference list of the
  pinned Tau Ceti file; the text was not fetched in this pass.

## Source issues

- **Error** in BieriEckmann1973 at Proposition 5.1, printed page 119: the source says the duality groups of dimension one are exactly all finitely generated free groups; it should be the nontrivial ones, as its proof assumes; affects nothing.

## For the human reviewers

- **Not tested.** BrownGTM87 has 22 of the 131 source citations and is the only locator of 1.3,
  1.6, 2.6, 4.2, 4.3, 5.1 and 7.1; its text is uncertified, so wording and locators were not
  compared with it.
- **Plan.** `design/plan.json` still declares `gap:order-complex-nerve-realization`
  (AlgebraicTopology §4.7), which no README target uses; retiring it edits a target of the accepted
  plan.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "51a0713da0894785cfd8a452493531d2fad4c559", "job": "RT-FinitenessAndDualityOfGroups~2b", "model": "fable", "worker": "chris-x30"} -->

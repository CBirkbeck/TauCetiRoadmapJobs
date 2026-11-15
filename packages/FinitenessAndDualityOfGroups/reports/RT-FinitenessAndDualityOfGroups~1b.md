<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/15391#issuecomment-6889172438 -->
Red team round 1 pass b (claude) of 4505272

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) `gap:order-complex-nerve-realization` asks AlgebraicTopology for something 5.4 does not need

   Location: `packages/FinitenessAndDualityOfGroups/README.md:622-626` (the contract "What
   AlgebraicTopology must provide (gap:order-complex-nerve-realization)"), used only at
   `README.md:1431-1453` (the route of 5.4(a) through `sd K`).

   Claim: 5.4(a) needs, from AlgebraicTopology §4.7, a homeomorphism from the realized order complex of
   a partial order to the realized nerve.

   Witness: `README.md:1453-1463`, "A second route for (a) avoids `sd K` and the homeomorphisms above
   … gives the same conclusions without the nerve comparison or the subdivision homeomorphism". That
   route uses only pinned declarations (`AbstractSimplicialComplex.realizationCWComplex`,
   `TauCeti.orderedSimplicialChainComplex`, `TauCeti.cellularChainComplexRealizationIso`,
   `TauCeti.cellularResolutionOfIsAspherical`) and `gap:simplicial-replacement-dimension`. No other
   target uses the order-complex gap (8.8 and 8.9 use only the conclusions of 5.4). A gap is a contract
   laid on a supplier; this one is not minimal.

   Repair (tested on the instances `K` = a vertex, an edge, `∂Δ²`, where the `K_≤` route already has
   its Checks at `README.md:1510-1518`: ranks `(1)`, `(2, 1)`, `(3, 3)`, Euler characteristics
   `1, 1, 0`, `H₁(∂Δ²) = ℤ`):

   1. In 5.4, make the `K_≤` construction the route of (a): replace `README.md:1431-1453` ("Let
      `sd K = CategoryTheory.nerve …`" up to and including "A second route for (a) avoids `sd K` and
      the homeomorphisms above:") by "Choose a linear order on the vertices of `K` and let `K_≤` be …"
      (the existing text of lines 1454-1463, with "as above" replaced by the explicit description of
      `W`: its `k`-simplices are the pairs of a `k`-simplex of `K_≤` and a lift of its realized affine
      simplex to `TauCeti.UniversalCover` of `|K|`, the lift existing and being determined by one point
      by `IsCoveringMap.existsUnique_continuousMap_lifts`; the deck group `Γ` acts freely on the
      lifts).
   2. Delete the gap contract paragraph `README.md:622-626`; in the Scope bullet at
      `README.md:100-101` delete "the realization CW structure of simplicial sets and, as a declared gap,
      the homeomorphism between the realized order complex and the realized nerve of a partial order
      (§4.7),"; in the `*Needs:*` of 5.4
      (`README.md:1472-1486`) delete `gap:order-complex-nerve-realization`, AlgebraicTopology §4.7,
      `TauCeti.SetLike.Face`, `TauCeti.AbstractSimplicialComplex.orderComplex`,
      `TauCeti.PreAbstractSimplicialComplex.barycentricSubdivision_eq_orderComplex`,
      `AbstractSimplicialComplex.barycentricSubdivisionRealizationHomeomorph`, `CategoryTheory.nerve`,
      `SSet.toTop`, `PartialOrder.mem_nerve_nonDegenerate_iff_strictMono` and "for the second route";
      make the same deletions in the Layer 5 Dependencies (`README.md:1529-1535`), in "How to read the
      build" nothing changes.
   3. In the Checks of 5.4 keep the `K_≤` halves of the last two bullets (`README.md:1510-1512`,
      `1517-1518`) and delete the `sd K` halves (`1506-1510`, `1513-1517`), or keep one sentence saying
      that the barycentric subdivision is not used.
   4. In the supplier contracts delete the entries that only the first route used: the `nerve` /
      `toTop` / `AbstractSimplicialComplex` bullet at `README.md:308-315`, the order-complex and
      subdivision part of `README.md:466-481` (keep `AbstractSimplicialComplex.Realization`), the
      AlgebraicTopology §4.7 row at `README.md:609-613`, and the matching words of the "Already in the
      library" paragraph (`README.md:61-64`).
   5. Remove the entry `order-complex-nerve-realization` from the `gaps` list of `design/plan.json`
      (lines 2557-2565), so that the intake announces one gap, `simplicial-replacement-dimension`.

   If the first route is to be kept as an alternative, it must be marked as not needed and the gap
   still removed: an alternative that needs a supplier contract is not a contract of this roadmap.

2. **F02** (P3) docstring of `exists_int_eq_mul_groupEulerChar` can be read as a false minimality claim

   Location: `packages/FinitenessAndDualityOfGroups/Suggested.lean:257-260`: "then `m · χ(G)` is an
   integer; the least such `m` is the least common multiple of those orders."

   Claim as it reads: the least `m` with `m · χ(G) ∈ ℤ` is the least common multiple of the orders of
   the finite subgroups.

   Witness: `G = ℤ/2 × ℤ`: `χ(G) = 0` (README 8.4 Check), so `1 · χ(G) ∈ ℤ`, while the least common
   multiple of the finite-subgroup orders is `2` (README 8.9 Check). Under the other reading ("the
   least common multiple is the least common multiple") the clause says nothing. The theorem itself is
   true as typed.

   Repair: replace the sentence after the semicolon, so that the docstring reads: "If `G` has finite
   homological type and `m` is a common multiple of the orders of the finite subgroups of `G`, then
   `m · χ(G)` is an integer. The source states it for the least common multiple, which exists because
   the orders divide the index of a torsion-free normal subgroup of finite index; `m` need not be the
   least integer with this property (`χ(ℤ/2 × ℤ) = 0`). (Brown 1974, §6, Corollary 1 of Theorem 5.)"

3. **F03** (P3) 2.3(b): the locator "BieriEckmann1973 line 396" does not carry the fact it is cited for

   Location: `packages/FinitenessAndDualityOfGroups/README.md:985-987`: "(BieriEckmann1973 Proposition
   2.1, lines 280–286, with `RG ≅ Coind_H^G RH` and coinduction commuting with direct sums at finite
   index; BieriEckmann1973 line 396)".

   Claim: line 396 supports `cd_R H = cd_R G` for `H` of finite index and `cd_R G < ⊤`.

   Witness: BieriEckmann1973 line 396-397 invokes Serre's theorem for a torsion-free group (inside the
   proof of Theorem 3.3). The fact used in 2.3(b), `Hᵏ(S; ℤS) ≅ Hᵏ(G; ℤG)` for `S` of finite index, is
   BieriEckmann1973 lines 345-351 and Proposition 3.1, lines 366-369.

   Repair: replace "BieriEckmann1973 line 396" by "BieriEckmann1973 Proposition 3.1, lines 366–369,
   with the isomorphism `Hom_S(ℤG, ℤS) ≅ ℤG` of lines 345–351". (The citation of line 396 at
   `README.md:1192`, for Serre's theorem 3.2, is correct and stays.)

One P2 finding (a declared gap that the README's own second route makes unnecessary) and two P3
findings (an ambiguous docstring sentence, one source locator). No false statement, no unowned
prerequisite, no padding and no absent statable headline was found.

## Dependency check

    depcheck: 245 roadmaps, 2214 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The roadmap is at line 319 of `merge-order/ORDER.txt`, directly
after CohomologyOfGroups (318), its last supplier; SpectralSequencesAndConvergence (18),
SchemeKTheoryOperations (38) and EtaleCohomologyFoundations (44) are earlier;
FreeGroupsAndLimitGroups, ClassifyingSpaces, AlgebraicTopology and ProfiniteCohomology are on main.
MotivicStructuresInModuliOfCurves (350) and PosetHomotopyAndSubgroupComplexes appear only under
"Downstream consumers", not as suppliers.

## The adversarial pass: Suggested.lean (23 declarations)

All are in `namespace TauCetiRoadmap.FinitenessAndDualityOfGroups`, with `universe u`, no
`variable` line and no `include`; every binder is in the declaration's own signature. The elaborated
types of the worker's signature file were compared with the README statement of each; none lost a
binder; nothing changed.

| Declaration (layer) | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `IsOfTypeFPn R G n` (1.2) | `n = 0`, any `G`; `G = ℚ`, `n = 1`, `R ≠ 0`; `R = 0` | pinned body: surjective `ε`, exactness at `F₀` only for `1 ≤ n`; `R` cyclic so `FP_0` holds; `ℚ` not finitely generated so `FP_1` fails; over `0` all `n i = 0` works | matches README index |
| `IsOfTypeFP R G` (1.2) | `ℤ/2` over `ℚ` and over `ℤ`; `G = 1` | `IsFPD … 0` holds (`ℚ` projective over `ℚ[ℤ/2]`); over `ℤ` no `m` (`H^{2k} = ℤ/2`); trivial group `m = 0` | sound |
| `isOfTypeFPn_iff_colimit` (1.5) | `n = 0`; `G = ℚ`, `n = 1`; `R = 0` | left side true, right side: `colim M_i^G → (colim M_i)^G` injective (filtered colimits exact); `ℚ`: `(M_i)^ℚ = 0`, `(colim)^ℚ = R`, fails at `k = 0 < 1` as `FP_1` fails; zero ring `0 → 0` | true; Brown1975 lines 83-92 |
| `isOfTypeFPn_iff_piComparison` (1.5) | `n = 0`; `G = ℚ`, `n = 1` | coinvariants of a product onto product of coinvariants, always surjective; for `ℚ` the map `H₀(∏Rℚ) → ∏R` not injective | true; Brown1975 lines 93-101 |
| `cohomologicalDim R G` (2.1) | `G = 1`; `ℤ`, `R ≠ 0`; `ℤ/2` over `ℤ`; `R = 0` | `0`; `1` (`H¹ = R`); `⊤` (empty infimum); `0` | `leastENatBound` takes `P : ℕ → Prop`, predicate monotone |
| `cohomologicalDim_eq_of_finiteIndex` (3.2) | `H = G`; `dℤ ≤ ℤ`; Klein bottle ⊇ `ℤ²`; `ℤ/2 × ℤ` (excluded); both sides `⊤` (`ℤ^{(ℕ)}`) | `1 = 1`; `2 = 2`; `⊤ ≠ 1` without torsion-freeness; `⊤ = ⊤` | true |
| `virtualCohomologicalDim` (4.1) | finite `G`; `ℤ/2 × ℤⁿ`; `⊕_ℕ ℤ/2` | `0`; `n`; `⊤` (every finite-index subgroup has torsion) | sound |
| `HasFiniteHomologicalType` (4.4) | finite `G`; `ℤ/2 × ℚ`; `ℤ` | true; false (`H₁(ℚ) = ℚ`); true | Brown1974 lines 367-370 |
| `IsVirtuallyOfTypeFP` (4.4) | finite `G`; `ℚ` | true (trivial subgroup); false | sound |
| `geometricDim` (5.1) | `G = 1`; `F_S`; `ℤⁿ`; finite `G ≠ 1` | `0`; `1`; `n`; `⊤` | `IsEilenbergMacLaneSpaceOne` = aspherical and `π₁ ≃* G` |
| `geometricDim_le_max` (5.3) | `G = 1`; `ℤ²`; `ℤ³`; `ℤ/2` | `0 ≤ 3`; `2 ≤ 3`; `3 ≤ 3`; `⊤ ≤ ⊤` | true |
| `exists_linearEquiv_tensorRat` (7.3(b)) | `G = 1`, `P = ℤ^r`; `P = ℤG²`; `P = 0`; trivial `ℤ` over `ℤ/2` (not projective) | `m = r`; `m = 2`; `m = 0`; `m · 2 = 1` impossible | true |
| `exists_linearEquiv_tensorZMod` (7.4) | same, `p = 2, 3`; `P = ℤ` over `ℤ/p` | `m = r`, `2`, `0`; fails without projectivity | true |
| `rationalEulerChar` (8.3) | `1`; `ℤ`; `F_r`; `ℤ/2`; `ℚ`; `F_ℕ` | `1`; `0`; `1 − r`; `1`; `0`; `1` (junk, `finrank = 0` in degree `1`) | docstring agrees |
| `groupEulerChar` (8.4) | finite `G`; `ℤ/2 × ℤ`; `F_ℕ`; `⊕ ℤ/2` | `1/|G|` (only the trivial subgroup is torsion-free); `0`; `0` (values `1/1 ≠ 1/2`); `0` (empty set) | sound |
| `groupEulerChar_eq_div_index` (8.4(b)) | `G` finite, `H = 1`; `ℤ/4 ∗_{ℤ/2} ℤ/6`, `H` = kernel of index `12` | `1/|G|`; `(1 − 2)/12 = −1/12` | true; Brown1974 lines 388-424 |
| `groupEulerChar_subgroup` (8.4(c)) | `H = G`; `1 ≤ G` finite; `F_3 ≤ F_2` of index `2` | `χ = χ`; `1 = |G| · 1/|G|`; `−2 = 2 · (−1)` | true |
| `isVirtuallyOfTypeFP_and_groupEulerChar_eq_mul` (8.6) | `N = 1`; `N = G`; `ℤ/2 × ℤ`; `F_2 × F_3`; Klein bottle | `χ(G) = 1 · χ(G)`; `χ(G) · 1`; `(1/2) · 0`; `(−1)(−2) = 2`; `0 · 0` | true; Brown1974 lines 452-463 |
| `groupEulerChar_pushoutI` (8.7) | all groups trivial; `ℤ/4 ∗_{ℤ/2} ℤ/6`; `ℤ/2 ∗ ℤ/3`; `ℤ ∗ ℤ` | `1 + 1 − 1 = 1`; `1/4 + 1/6 − 1/2 = −1/12`; `−1/6`; `0 + 0 − 1 = −1` | true |
| `groupEulerChar_hnnExtension` (8.7) | `H = A = 1` (`ℤ`); `BS(1, 2)`; `ℤ/2 × ℤ` | `1 − 1 = 0`; `0 − 0`; `1/2 − 1/2 = 0` | true |
| `exists_int_eq_mul_groupEulerChar` (8.9) | finite `G`, `m = |G|`; amalgam, `m = 12`, `m = 6` (not a common multiple); `m = 0` | `1`; `−1`; `−1/2` (excluded by `hm`); `0` | true; docstring: R02 |
| `exists_subgroup_card_eq_of_dvd_den` (8.9) | `k = 0`; amalgam, `p^k = 4, 3`; `ℤ/2 × ℤ` (`den = 1`) | trivial subgroup; `ℤ/4`, `ℤ/3`; only `k = 0` | true |
| `isGorensteinProjective_opcycles` (9.2) | `G` finite, `H = 1`, `n = 0`; `G = H`; `G = ℤ/2 × ℤ`, `n = 1`; `R = 0` | `opcycles 0 = R`, Gorenstein projective by the norm splice; syzygy projective; first syzygy `ℤH`-projective, `Ext¹(−, Coind) = 0`; zero module | true over every commutative `R` |

One-tactic probe (by reading bodies and pins): no declaration follows from a definition, a single
library lemma or a README Check; `groupEulerChar_subgroup` needs 8.4(b) and the inheritance of
finite homological type, `exists_subgroup_card_eq_of_dvd_den` needs 8.9 and Sylow. No padding.

Headline theorems (README Summary, lines 25-29): 1.5, 3.2, 5.3, 6.3, 8.4, 8.6, 8.7, 8.9, 9.4.
Stated: 1.5 (two forms), 3.2, 5.3, 8.4 (two), 8.6, 8.7 (amalgam, HNN), 8.9 (two), with 7.3(b), 7.4
and 9.2. Named as not statable in the module docstring: 6.3 (with 6.4(b), 6.6), 9.4, the general
8.7, 7.3(a). Checked at the pins: Tau Ceti has a chain-level `cap`
(`TauCeti/Algebra/Homology/Monoidal/Cap.lean` line 271) but no cap product on `groupCohomology` and
`groupHomology`, no Farrell cohomology functor and no noncommutative Hattori–Stallings trace, so the
docstring's reasons hold.

## The adversarial pass: README targets (51)

| Target | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 1.1 | `M = ℚ` over `ℤ`; `k = A/(x_i)`; `M = 0` | `colim ℚ/(1/i!)ℤ = 0`, projections nonzero; `Hom(k, A/(x₁..x_i)) = 0`, `Hom(k, k) = k` | holds |
| 1.2, 1.3 | `1`, `ℤ`, `ℤ/2` over `ℤ`, `ℚ`, `0` | `FL`; `FL`; `FP_∞` not `FP`; `FP`; `FL` | holds |
| 1.4 | `ℚ`; `F_2`; normal closure of `b` | not `FP_1`; terms `RG, RG², 0`; infinite rank abelianization | holds |
| 1.5 | (c) for `n = 0`; (e) for `ℚ` | vacuous beyond injectivity; `(1 − [1/j!])_j` not in `I · ∏Rℚ` | holds |
| 1.6-1.8 | `ℤ/2 × ℤ ⊇ ℤ`; lamplighter; `BS(1, 2)`; `n = 0` in 1.8 | `FP_∞`, not `FP`; base not finitely generated; `FL`; `0 − 1 = 0` | holds |
| 2.1-2.4 | `ℤⁿ`; `ℚ`; Klein bottle over `𝔽₂`; `ℤ/2 × ℤ` over `ℚ` | `cd = hd = n`; `hd = 1 < cd = 2`; `H² = 𝔽₂` (`1 − (−1) = 0`); `cd_ℚ = 1` | holds |
| 2.5-2.8 | `ℚ`; `ℤ²` by cyclic subgroups; `ℤ/2` over `ℤ/6`, `ℤ[1/2]`; zero ring | `Ext¹(ℚ, ℤ) ≠ 0`; family not directed; `⊤`, `0`; `cd_0 ℤ = 0` | holds |
| 3.1 | `H = 1 ≤ ℤ/2`, `F = Rx` in degree `1`; `F = (Rx → Ry)` | `s(x⊗x) = −x⊗x`; `d(x⊗x) = y⊗x − x⊗y`, sign-free defect `2(y⊗x − x⊗y)`; `dh + hd = id` checked in degrees `0, 1, 2`; equivariant `h` exists iff `2` is a unit | holds |
| 3.2 | `n = 0`; `cd H = ⊤` | `H = 1`, `G` finite and torsion-free so trivial; `cd G ≥ cd H = ⊤` | holds |
| 4.1-4.4 | amalgam → `ℤ/12` (`1 ↦ 3`, `1 ↦ 2`, both send the edge generator to `6`); `ℤ/2 × ℚ`; extension bound | kernel free of rank `2`, index `12`; `vcd = 2`, not finite homological type; `1 = 0 + 1` | holds |
| 5.1-5.3 | `S²`; two points; `n = max(3, cd)` with `cd ≤ 2` | `π₂ = ℤ`; not connected; `(n − 1)`-skeleton has `π₁ = G` since `n − 1 ≥ 2` | holds |
| 5.4 | `G` finite, `Γ = 1`; `ℤ/2 × ℤ`; `K` = edge, `∂Δ²` | stabilizer of order `[G : 1]`; `Z = W × W`, stabilizer `⟨s⟩` on the diagonal (`2k = 0`); ranks `(2, 1)`, `(3, 3)` | holds; gap: R01 |
| 6.1-6.3 | `ℤ`; finite `G`, `|G|` a unit; `F_r`; `ℤ ∗ ℤ²`; zero ring | `x ↦ x(t)`; inverse `[m] ↦ |G|⁻¹Σgm`; `D` of infinite rank; `H¹(G, ℤG) ≠ 0`; vacuous | holds; the source's clause `H_j = 0` for `j > n` follows from `cd ≤ n` and 2.2(a) |
| 6.4-6.6 | Klein bottle; `sgn ≠ w` in (b); doubled-point circle | `H² = H₀(K, ℤ_w) = ℤ/2`; `0 = H⁰(ℤ_{sgn·w}) ≅ ℤ` contradiction; `π₁ = F₂`, `H¹ = ℤ²` against `ℤ` or `ℤ/2` | holds |
| 7.1-7.2 | `P = RG`; `P = Re`; `ℤ/3` over `ℂ`; `𝔽_p[ℤ/p]` | `δ_{[1]}`; `1/|C_G(g)|`; `ge = ωe`, coefficient of `g⁻¹` is `ω/3`; `χ_P(1) = 0`, `r_P([1]) = 1` | holds |
| 7.3-7.5 | `g ≠ 1`; `Γ` finite, `Γ' = 1`, `P = ℤΓ`; `Γ = ℤ`, `P = ℤ`, `λ ≠ 1` | `|C| · r_P = 0` in `ℤ`; `K^Γ` free of rank `1`; `0 ≠ 1` without projectivity | holds |
| 8.1-8.2 | `k[x₁, …]`; `ℤ/2` on `ℤG`, on `ℤ`, on a circle | no finite `D`; `2 = 2 · 1`; `1 ≠ 2`; `0 = 2 · 0` | holds |
| 8.3-8.6 | `F_2`, `Γ'` of index `2`, `V = ℚ`, `𝔽₂`; `F_2 × F_3` | `H¹ = 2·𝟙 ⊕ sgn`, class `−[ℚ[ℤ/2]]`; length `1 − 3 = −2`; `1 − 5 + 6 = 2` on classical `E₂` (native page `3`) | holds |
| 8.7 | amalgam; `F_r` on its tree; `ε` nontrivial | `−1/12`, wrong sign gives `11/12`; `1 − r`; `χ_ℚ(T; ℚ_ε) = χ_ℚ(T)` via `ker ε` | holds |
| 8.8 | reflection and rotation of the 4-cycle; `Eℤ/2`; `Δ[0]` | `0 + 1·2 = 2·1`; `0 + 0 = 2·0`; `χ = 1` with infinite dimension; unnormalized chains `ℤ` in every degree | holds; Sylow step: `p^e ∣ |G|/|G_σ|` forces `|P ∩ G_σ| ≤ |P|/p^e` |
| 8.9 | amalgam; `ℤ/2 ∗ ℤ/3`; finite `G`; `d = |Q|/m` | `12 · (−1/12) = −1`, `6 · (−1/12) ∉ ℤ`; `−1`; `1`; orbit size `d · m/|stab|` | holds |
| 9.1-9.5 | `ℤ/2` over `ℤ`; `ℤ/2 × ℤ`; amalgam; `k = n` | `Ĥ⁰ = ℤ/2`, `Ĥ^{±1} = 0`; `Hᵏ = ℤ/2` for `k ≥ 2`; `ℤ/12` (kernel of `ℤ/4 ⊕ ℤ/6 → ℤ/2` contains `(1, 1)`) and `0`; `ℤ → ℤ/2` not injective | holds |

## Verified sound

- Declarations read: 23 of 23 (whole file, 287 lines); README read: all 2481 lines; targets read: 51.
- Truth: every row above; no counterexample to a stated theorem, no Check contradicting a theorem of
  its section.
- Lean against README: generality equal in all 23 (`R G : Type u` in Layers 1, 2, 9; `G : Type` for
  the integral statements); imports are `import Mathlib` and five `TauCeti.*` modules, each used
  (`IsPseudoCoherentOver`, `IsFPD`, `leastENatBound`, `IsEilenbergMacLaneSpaceOne`,
  `isGorensteinProjective`); no `set_option`, no `lemma`, no sorry'd data, no `#eval`; all 23 names
  occur in the README and the README names no other declaration of its own.
- Pinned declarations: 72 Tau Ceti names with their files and line numbers and 58 Mathlib locators
  of the supplier contracts opened at the pins; all exist where cited. Bodies read for
  `IsPseudoCoherentOver`, `IsFPD`, `leastENatBound`, `IsAspherical`, `IsEilenbergMacLaneSpaceOne`,
  `IsTotallyAcyclicProjective`, `isGorensteinProjective`, `RelCWComplex`, `tateCohomology`.
- Source locators verified against the cached texts: 94 line locators in Brown1974 (37 citations),
  BieriEckmann1973 (29), BieriEckmann1974 (14), Brown1975 (9), Serre1971Bourbaki (9) and Floyd1952
  (4); one does not carry its claim (R03).
- Checks tested: all 168 Check bullets (51 blocks) read against the theorems of their section; the
  values of about 70 of them, those the two tables record, recomputed by hand. Each definition has
  at least three; none is false, vacuous or a restatement.
- Sibling citations checked at their current text: 36. CohomologyOfGroups (open head) §§1.2, 1.4,
  1.5, 2.3, 3.2, 3.4, 3.5-3.6, 4.6, 5.2, 6.1-6.3, its Scope exclusion (line 103) and its downstream
  paragraph; SpectralSequencesAndConvergence §3.4 (Euler identity) and §5.3 (native page `r` is the
  classical `E_{r−1}`); FreeGroupsAndLimitGroups §§4.5, 4.7, 4.8, 4.9; SchemeKTheoryOperations §6.7;
  EtaleCohomologyFoundations §F.10.3 (centralizer formula as quoted); ClassifyingSpaces items 10,
  16, 17; AlgebraicTopology §§4.7, 6.3, 6.4, 8.1, 8.3, 8.5, 8.7, 8.11a; ProfiniteCohomology Layer 11
  and §13.2; ArithmeticKTheory §3.2; FuchsianOrbifolds Layer 5 item 6; BianchiModularForms §9.3;
  BordismFormalGroups; GorensteinHomologicalAlgebra (exclusion at its line 27);
  PosetHomotopyAndSubgroupComplexes (line 105).
- Ownership: searched main, the open heads and the board packages by object (virtual cohomological
  dimension, Farrell cohomology, Eilenberg–Ganea, duality group, finite homological type,
  Hattori–Stallings rank, type `FP`, geometric dimension, Swan's theorem for projective
  `ℤG`-modules, tensor induction of complexes, Smith theory, complete resolution). No second owner:
  the other hits are instances, the profinite theory, the étale Smith theory, or CohomologyOfGroups'
  statement that it does not plan these. No fully qualified name of `Suggested.lean` occurs in
  another roadmap.
- Gaps: `simplicial-replacement-dimension` is precise, minimal and declared with the same slug in
  `design/plan.json` and the README; `order-complex-nerve-realization` is precise and declared, not
  minimal (R01).
- Policy: `git diff --stat origin/main...HEAD` touches only `packages/FinitenessAndDualityOfGroups/`
  (README.md, Suggested.lean, metadata.toml, two reports); no pull-request number or process
  narrative in the README or docstrings; every target has a locator; no algorithm.
- Overlaps file: no second copy, no dropped id, no other pull request changes this roadmap.

Source independence: 13 passages compared with 5 sources (Brown1974 lines 125-132, 367-370,
402-410, 452-456, 643-651, 1284-1288, 1321-1355; Brown1975 lines 87-92, 208-209; BieriEckmann1974
lines 253-257; Floyd1952 lines 292-299; Serre1971Bourbaki lines 77-86; BieriEckmann1973 lines
116-121), none shared beyond theorem statements whose hypotheses can be listed in one way (longest
common run 10 words, a statement); largest share Brown1974, 37 of 142 source citations; contents
compared with Brown1974 (§§1-7, Appendices A-B): independent. Its sections land in four layers (§3
in 4.4, Appendix A in 7.4-7.5, §§1, 2, 4, 5, 6 in Layer 8 as 8.1-8.2, 8.8, 8.3-8.6, 8.7, 8.9), §7 and
Appendix B are out of scope, §2 is placed after §5, and the order inside Layer 8 is forced by its
`*Needs:*` lines (8.2 needs 8.1; 8.4 needs 8.2 and 8.3; 8.5 needs 7.5 and 8.4; 8.6 needs 8.5; 8.9
needs 8.8 and 5.4). No table, figure or list is taken over from a source.

## Not verifiable

- The locators into BrownGTM87 (23 citations: III.10, VI.3, VIII.2, VIII.3, VIII.5, VIII.6, VIII.7,
  VIII.11, IX.2, X.2, X.3), Farrell1977, EilenbergGanea1957, Wall1961 and Serre1971Prospects: the
  manifest records them as uncertified and no text is in the cache. Two are worth a look by someone
  holding the book: 4.3 cites §VIII.2 for the vanishing with rational coefficients above `vcd`,
  which is a statement about virtual notions (§VIII.11 with §III.10); 9.1-9.2 cite §X.2 for the
  existence of complete resolutions and 9.3-9.4 cite §X.3. I could not confirm either from a text.
- Truth of the elaboration: no Lean was run in this pass; the types are those of the worker's
  signature file for this head.
- Ownership against board packages that have no README in the checkout (GorensteinHomologicalAlgebra,
  PosetHomotopyAndSubgroupComplexes) was checked on their open pull requests instead; ownership
  against pull requests outside the index of the brief was not checked.
- LeanSearch near-matches: the service returned errors for all 23 declarations; the Loogle hits were
  read and none is a statement of this file.

## Source issues

- **Error** in BieriEckmann1973 at Proposition 5.1, printed page 119: the source says the duality groups of dimension one are exactly all finitely generated free groups; it should be the nontrivial ones, the trivial group having dimension zero, as its proof assumes; affects nothing.

## For the human reviewers

- **Not tested.** BrownGTM87 has 23 of the 142 source citations and is the only locator of 1.3, 1.6,
  2.6, 4.2, 4.3, 5.1 and 7.1; its text is uncertified, so wording and locators were not compared
  with it (`sources.toml`, entry BrownGTM87).
- **Licence.** `sources.toml` records Farrell1977, EilenbergGanea1957, Wall1961 and
  Serre1971Prospects as uncertified: Layer 9, 5.3 and Serre's theorem 3.2 rest on locators nobody
  on this job has read.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4505272f924d6a9219c9a0d876d2e163be867d2a", "job": "RT-FinitenessAndDualityOfGroups~1b", "model": "fable", "worker": "chris-x52"} -->

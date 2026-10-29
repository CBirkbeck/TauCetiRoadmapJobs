# GATE-ProfiniteProPGroups~5: answers to the review of `9af5d7e`

One review (CBirkbeck, 2026-10-28) makes eight distinct points, H01–H08 below in the order they appear. All eight are applied. The repairs are in commit `d0eb5c68`. Line numbers refer to `TauCetiRoadmap/ProfiniteProPGroups/README.md` and `TauCetiRoadmap/ProfiniteProPGroups/Suggested.lean` at that commit.

## H01 (CBirkbeck) — applied
README 2166–2172. Old: `c_i` "is the reduction modulo `p` of the exponent vector of `r`". New: every exponent sum of `r ∈ Φ(F)` is divisible by `p`, and `c_i` is the `i`-th exponent sum **divided by `p` in `ℤ_p`**, reduced modulo `p`. The citation is TC `TauCeti.freeProP.degreeOneBasis_repr_gradedMk_inl` (`Free/DegreeOneForm.lean` line 787, which assumes the sum is `p * c` and returns `PadicInt.toZMod c`), now also pinned by `#check` at Suggested 1890. The witness is in the text: at `p = 3`, exponent vectors `(0,0)`, `(3,0)`, `(9,0)` give `c = (0,0)`, `(1,0)`, `(0,0)`, which are the branches `q = 0`, `q = p` and `p² ∣ q`. The `x₁^p(x₁,x₂)` counterexample (`c₁ = 1`) is kept. The other "exponent vector" passages (README 2671–2716) already use the vector itself, not its reduction, and are correct.

## H02 (CBirkbeck) — applied
On main, ProfiniteCohomology's export table puts all-degree Shapiro, dimension shifting and the all-degree long exact sequence in Layer 10 (its rows "all-degree Shapiro and dimension shifting" and "the all-degree colimit and exact sequence"). Layers 5 and 7 cover only degrees `≤ 2`. Each degree-unbounded route is corrected:
- Dévissage (1284): PC-5 → PC-10 `delta`, `longExact_exact`.
- Vanishing above degree 2 (1294): "PC-7 `Coind`, `shapiroIso` …; L6 dimension shifting" → PC-7 `Coind`; PC-10 `shapiroIso`, `coindEmbedding`, `dimensionShiftQuotient`, `coindAcyclic`, `dimensionShiftIso`, `longExact_exact`, `continuousCohomology_preservesFilteredColimits`. Layer 6 has no dimension-shifting item, so that reference was dangling. The quotient `Coind/M` is not finite, which is why the filtered-colimit export is needed. The `ℤ_p` / `C_p` degree-3 check is added there.
- `cd` of open subgroups (1332): PC-7 → PC-10 `shapiroIso`.
- Three-term Euler formula (1731): adds PC-10 `delta`, `longExact_exact`. The connecting map into `H³` is needed for surjectivity in degree 2, and PC-5's exactness stops at the node `H2B`.

The five-term sequence, the two-term Euler formula and the prescription property stay on PC-5/PC-7, because they live in degrees `≤ 2`. The new `## Exact supplier contracts` section (127) states which degree range each PC layer supplies.

## H03 (CBirkbeck) — applied
README 626. `M Subgroup.isCoatom_iff_index_eq_prime` → `M IsPGroup.isCoatom_iff_index_eq_prime`. At the pin, `Mathlib/GroupTheory/Nilpotent.lean` line 1255 declares it inside `namespace IsPGroup`, after `end Subgroup` at 1248. Nilpotence is still supplied by `IsPGroup.isNilpotent` (line 1282). In the same pass, two other Mathlib citations that do not resolve at the pin were corrected:
- `Sylow.conj_eq` → `Sylow.isPretransitive_of_finite` (393; `GroupTheory/Sylow.lean` line 345);
- `closedSubgroup_eq_sInf_open` → `ProfiniteGrp.closedSubgroup_eq_sInf_open` (201).

## H04 (CBirkbeck) — applied
README 2298. The no-power claim is now restricted to `m ≥ 1`, and `(ω₀) = (T)` is stated explicitly as the kernel to the trivial quotient. For `m ≥ 1`, `(ω_m)` is ruled out as each candidate in turn:
- not `(T)`, because `ω_m/T` has constant term `p^m`, a non-unit;
- not `(T^k)` for `k ≥ 2`, because `ω_m` has `T`-order 1;
- not the unit ideal, because `ω_m` is not a unit.

The witnesses `ω₁ = T(2+T)` at `p = 2` and `ω₁ = T(3+3T+T²)` at `p = 3` are included. This agrees with the existing trivial-group edge case of the `completedGroupAlgebra` checklist.

## H05 (CBirkbeck) — applied
At the pin, Tau Ceti proves the whole existence classification as two equivalences:
- `TauCeti.exists_isDemushkin_range_demushkinCharacter_eq_iff_of_even` (`Demushkin/NormalForm/Two/Even/Image.lean` line 181): for every `p`, closed pro-`p` `A`, and necessity at every `q`, including `q = 2`;
- `TauCeti.exists_isDemushkin_range_demushkinCharacter_eq_iff_of_odd` (`Two/Odd/Image.lean` line 234): at `p = 2`, covering `{±1}` in every odd rank (so `n = 1` and `f = ∞`) and `{±1} × U^(f)` for `n ≥ 3`.

The `q ≠ 2` iff in `Existence.lean` line 587, which the review cites, is narrower and was not used. Both equivalences are now headline theorems: Suggested 1065 and 1082, closed proofs, with the two `Image` modules added to the imports. The odd one is at the literal prime 2 for the same `ℤ_[2]ˣ` typing reason as the marked theorems. The README existence milestone (2899) names both and gets a Checks list:
- `(3,2,1)`: `1 < 9`, realized by `ℤ₃²`;
- `(2,2,ℤ₂ˣ)`: `4 < 4` is false;
- `(2,4,ℤ₂ˣ)`: `4 < 16`, realized by `x₁²(x₁,x₂)x₃⁴(x₃,x₄)`;
- `(2,1,{±1})`: realized by `C₂`;
- `n = 0` never occurs.

## H06 (CBirkbeck) — applied
The README is restructured to the required shape:
- The opening paragraph now starts with `**Summary.**`.
- `## Scope and exported contract` → `## Scope and ownership`.
- New `## Exact supplier contracts` (127), with From Mathlib, From Tau Ceti, and From TauCetiRoadmap.ProfiniteCohomology by layer and declaration.
- `## How to read the milestones` → `## How to read the build`.
- `#### Examples` and `#### Dependencies` at the end of every layer, 0–10. Each Dependencies paragraph was derived from that layer's own *Needs* lines. It records that Layer 2's worked instance on `ℤ̂` also uses Layer 4.
- `## Arithmetic applications owned by other roadmaps` → `## Downstream consumers`.

Sixteen new `**Checks.**` lists (22 in total, up from 5) cover:
- order and index;
- `IsProPSylow`, with the review's `S₃` instances (`C₂` index 3, three conjugates; `C₃` index 2, normal; `1` index 6, not 2-Sylow but 5-Sylow) plus `ℤ̂`;
- `IsProP`, `maximalProPQuotient`, generator rank, `proPFrattini`;
- `FiniteGroupClass`, `freeProP`;
- the coefficient objects, `presentedProP`;
- `IsDemushkin`: `ℤ/4` passes both dimension conditions but has `χ∪χ = 0`, so it separates the nondegeneracy field;
- the canonical character: the trivial character fails the prescription property on `ℤ/2`, computed;
- the closed subgroups of `ℤ₂ˣ`: `f = 2, 3` by squaring `3` and `7`;
- the lower `p`-series, `completedGroupAlgebra`, `IsCompactModule`.

The pass also found and fixed a false edge case (README 458–460). "A group that is pro-`p` for two different primes is trivial" holds only for profinite groups: connected `ℝ` has no proper open subgroup, so it is pro-`p` for every `p`.

## H07 (CBirkbeck) — applied
README 1204: `ProP/RelationRank.lean` → `ProP/Relation/Rank.lean`, which is where `finite_H2_iff` (566), `natCard_H2` (582), `natCard_H2_le_pow_iff` (601) and `topologicalGeneratorRankNat_quotient_pLowerCentralStep_eq` (701) live. Every `.lean` locator in the README was then checked against the pin. One more was wrong: README 2445, `ProP/RelationModule.lean` → `ProP/Relation/Module.lean` (lines 166 and 187 hold the two cited theorems).

## H08 (CBirkbeck) — applied
`fpPairing_bil` and `demushkinRelatorCharacter_mem_ker` are deleted from `Suggested.lean`. Both are one-step restatements of `TauCeti.fpPairing_bil_apply` and `TauCeti.demushkinRelatorCharacter_mem_ker`. The README now cites the Tau Ceti names instead:
- the downstream-surface row and the LocalGaloisGroups paragraph;
- the coefficient-object checklist (929), which keeps the `p = 3`, `a = b = 2` value `1`;
- the relation-module items (2392, and the paragraph at 2445).

The `fpPairing` docstring now states its defining equation and the Tau Ceti name. This follows the precedent set when the `standardD0Orientation` value theorems were deleted. `Completed/LocalGaloisGroups` on main still cites `fpPairing_bil`; it resolves there against `Completed/ProfiniteProPGroups` on main, which is outside this package.

## Build, gate and checks

- `lake build TauCetiRoadmap.ProfiniteProPGroups.Suggested`: **Build completed successfully (9471 jobs)**, with no errors and no warnings. The 23 `info:` lines are the pinning `#check`s, and the file has no `sorry`.
- Gate: `gate ProfiniteProPGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 198 roadmaps, 1260 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- Binder check: I appended `#check @TauCetiRoadmap.ProfiniteProPGroups.<name>` for every declaration to `Suggested.lean`, built once, read the elaborated types, and removed the block. All 116 real declarations elaborated; three further "unknown identifier" hits were docstring words picked up by the scan. The two new theorems carry exactly their stated binders (`p`, `[Fact p.Prime]`, `hn`, `hA`, `hAp`; respectively `hn`). No binder changed.
- Name check: the same build `#check`ed all 420 qualified names the README backticks, apart from ProfiniteCohomology names, which were checked against that roadmap's export table on main. The failures were:
  - `Sylow.conj_eq` and the unqualified `closedSubgroup_eq_sInf_open`: corrected under H03.
  - Tau Ceti names whose modules this file does not import: each confirmed at the pin by file and line.
  - Namespaces (`PowerSeries.WithPiTopology`, `ProfiniteGrp.ProfiniteCompletion`), which are not constants.

  Separately, the citation tool's lead `TauCeti.gradedPow_smul_zero` (README 1825) does not exist at main's Tau Ceti pin. It is replaced by `TauCeti.gradedPow_smul` (`Graded/Basic.lean` line 729), which holds in every degree, not only degree zero. The other seven leads are ProfiniteCohomology names present in that roadmap on main.
- Pin note: the branch's `lake-manifest.json` pins Tau Ceti `a91d3aa` and Mathlib `6b7abb3`, older than main's `358314d` / `f6090c7`, which this brief names as the pins. `lake build` therefore runs against the branch's pins. The README was checked against main's. Everything `Suggested.lean` uses exists at both. `TauCeti.gradedPow_smul` exists only at main's pin, so it is cited in the README but not `#check`ed.
- Ownership: the two new theorems state results Tau Ceti owns and proves; no other roadmap plans them (`roadmaps grep 'exists_isDemushkin_range'` finds only this roadmap). No new construction was added. Ownership against the open pull requests listed with paths was checked by object for the existence classification; nothing else new was planned.
- Sources: no source was fetched and `needs-references.toml` was not written. Every new claim is computed in this report or cited to a pinned declaration.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `c_i` = exponent sum / `p`, mod `p` | `p=3`: `(0,0)`, `(3,0)`, `(9,0)`; `x₁^3(x₁,x₂)` | `c = (0,0), (1,0), (0,0)`; the old formula gives `(0,0)` three times | fixed (H01) |
| vanishing above degree 2 via PC-10 | `ℤ_p`; `C_p` | `H³(ℤ_p,𝔽_p) = 0 = H²(ℤ_p, Coind/𝔽_p)`; `H²(C_p,𝔽_p) = 𝔽_p ≠ 0` (premise fails), `H³ = 𝔽_p` | consistent |
| three-term Euler uses `H³` | `cd_p ≤ 2`, `0 → 𝔽_p → 𝔽_p[G/U] → Q → 0` | `H²(G,Q) → H³(G,𝔽_p) = 0`; PC-5 exactness ends at `H2B` | PC-10 needed (H02) |
| `IsPGroup.isCoatom_iff_index_eq_prime` | `Q₈` | three maximal `C₄`, each of index 2 | correct name |
| `(ω_m)` vs `(T^k)` | `m=0`; `p=2,m=1`; `p=3,m=1` | `ω₀ = T`; `T(2+T)`, `2+T` a non-unit (constant term 2); `T(3+3T+T²)` | `m ≥ 1` only (H04) |
| even-rank existence iff | `(3,2,1)`, `(2,2,ℤ₂ˣ)`, `(2,4,ℤ₂ˣ)`, `n=0`, `(3,2,ℤ₃ˣ)` | `1<9` ✓; `4<4` ✗; `4<16` ✓; `1<1` ✗; `ℤ₃ˣ` not pro-3 (contains `−1`), `(A:A³)=3<9` | hypotheses needed |
| odd-rank existence iff | `(1,{±1})`, `(1,V^(2))`, `(3,U^(2))`, `(3,{±1})` | `C₂` ✓; `3≤1` ✗; `U^(2)` ∉ list ✗; `f=∞` ✓ | both directions |
| `IsProP` edge case | `ℝ`; profinite group pro-`p` and pro-`ℓ` | `ℝ` has only the trivial open quotient, so it is pro-`p` for all `p`; a profinite one has order supported at `p` and at `ℓ`, so order 1 | compactness needed (fixed) |
| `IsDemushkin` fields | `ℤ/2`, `ℤ/4`, `ℤ_p²`, `C_p²` | `(h¹,h²,χ∪χ)` = `(1,1,≠0)`, `(1,1,0)`, `(2,1,≠0)`, `(2,3,–)` | nondegeneracy separates `ℤ/4` |
| prescription property | `ℤ/2`, trivial vs sign `χ` | trivial: `H¹(C₂,ℤ/4) = ⟨2⟩ ↦ 0` in `H¹(C₂,ℤ/2)`; sign: `Z¹ = ℤ/2^i`, `B¹ = 2ℤ/2^i`, `H¹ = ⟨1⟩` onto | canonical = sign |
| `U^[f]` index | `f=2,3` | `3² = 9 = 1+8`, so `U^[2]∩U^(2) = U^(3)`, index 2; `7² = 49 = 1+16·3`, so `U^[3]∩U^(2) = U^(4)`, index 4 = `2^{f−1}` | matches |
| `IsProPSylow` | `S₃` at 2, 3, 5; `ℤ̂` | indices 3, 2, 6; 6 is prime to 5; `[ℤ̂:ℤ_p] = ∏_{ℓ≠p} ℓ^∞` | matches |
| `maximalProPQuotient` | `S₃` at 2, 3; `A₅` | kernels `C₃`, `S₃`; `A₅` perfect, so `A₅(p) = 1` | not a Sylow subgroup |
| `proPFrattini` | `Q₈`, `C₄`, `ℤ_p` | `{±1}`; `C₂` (commutator model gives 1); `pℤ_p` | matches |
| `presentedProP` | `⟨x∣x⁴⟩`, `⟨x∣x³⟩` at `p=2`; `x^p` in `ℤ_p` | `C₄`; trivial (3 a unit); algebraic closure `pℤ` dense, not closed | closed normal closure needed |
| `pLowerCentralSeries` | `C₄`, `ℤ_p`, free rank 2, `Q₈` | `λ₁ = C₂`; `p^kℤ_p`; `dim gr₁ = 3`; `λ₁ = {±1}`, `λ₂ = 1` | 0-based indexing confirmed |
| `completedGroupAlgebra` | `1`, `C₂`, `ℤ_p`, `S₃` | `ℤ_p`; rank 2; `ℤ_p[[T]]`; `(12)(13) ≠ (13)(12)` | matches |
| `IsCompactModule` | `ℤ_p/pℤ_p`, `ℤ_p/ℤ`, `ℚ_p` | `𝔽_p` compact; indiscrete, not T2; not compact | closedness needed |
| profinite order/index | `C₆`, `ℤ_p`, `ℤ̂`, `1 ≤ ℤ₂`, `ℤ ≤ ℤ₂` | `(1,1)`; `p^∞`; infinite support; `2^∞` vs `Subgroup.index = 0`; index 1 | supernatural values needed |
| `gradedPow_smul` (citation) | `p=2`, degree 0, `c=2` | `π(2x) = π(0) = 0 = 2π(x)` in elementary abelian `gr₁` | holds in every degree |

## Suspicious passages
None. The review contained no instructions beyond its findings.

# Review of ProfiniteProPGroups (pull request #618 at d0eb5c6)

**Verdict:** accepted

The gate passes at this head, the dependency check reports no problem, `Suggested.lean` elaborates with no warning and no `sorry`, and no P1 or P2 finding survives. Four P3 notes (R01–R04) are the author's to take or leave. One settled point is restated for the human approver, because it decides where this folder can land: main carries this roadmap only as `Completed/ProfiniteProPGroups/`, whose `Suggested.lean` declares 103 of the 120 names this folder declares in the same namespace `TauCetiRoadmap.ProfiniteProPGroups` (archived 2026-10-08). The repair report `GATE-ProfiniteProPGroups~3` H01 marked the destination (rebase onto main and revise the archive, or open a Part II) as a merge decision outside the two editable files. That reason still holds and the point is not re-raised; it is the one thing a human must settle before merging.

The previous review's findings were checked one by one first:

| Previous finding | Passage at this head and verification | Disposition |
|---|---|---|
| R01 (P1): divide the exponent sums by `p` | README:2167–2171 now says every exponent sum of `r ∈ Φ(F)` is divisible by `p` and `c_i` is the `i`-th sum divided by `p` in `ℤ_p`, reduced mod `p`, citing `TauCeti.freeProP.degreeOneBasis_repr_gradedMk_inl` (`Free/DegreeOneForm.lean:787–789` at the pin assumes the sum is `p * c` and returns `PadicInt.toZMod c`). At `p = 3` the vectors `(0,0)`, `(3,0)`, `(9,0)` give `c = (0,0)`, `(1,0)`, `(0,0)`; the old rule gave `(0,0)` three times. | Repaired. |
| R02 (P1): supplier declarations of the all-degree routes | README:1284 (dévissage), 1294–1303 (vanishing above degree 2), 1332 (`cd` of open subgroups) and 1730 (three-term Euler) now cite PC-10 `delta`, `longExact_exact`, `shapiroIso`, `coindEmbedding`, `dimensionShiftQuotient`, `coindAcyclic`, `dimensionShiftIso`, `continuousCohomology_preservesFilteredColimits`; the new `## Exact supplier contracts` (README:127–170) states PC-5/PC-7 as degrees `≤ 2` only. On main, `TauCetiRoadmap/ProfiniteCohomology/README.md:219,225` place these in Layer 10 and :1228 says `shapiroIso` is a Layer 10 milestone. README:626 now cites `IsPGroup.isCoatom_iff_index_eq_prime`, which is `Mathlib/GroupTheory/Nilpotent.lean:1255` inside `namespace IsPGroup` (line 1250). Degree-3 check present at README:1298–1300. | Repaired. |
| R03 (P2): exclude `m = 0` | README:2298–2303: `(ω₀) = (T)` is stated, the no-power claim is for `m ≥ 1`, with `ω₁ = T(2+T)` at `p = 2` and `T(3+3T+T²)` at `p = 3`. Recomputed: `((1+T)² − 1)/T = 2 + T`, `((1+T)³ − 1)/T = 3 + 3T + T²`, constant terms `2`, `3`, non-units. | Repaired. |
| R04 (P2): existence half of the classification | `Suggested.lean:1065–1087` states `exists_isDemushkin_range_demushkinCharacter_eq_iff_of_even` (every `p`, closed pro-`p` `A`, `(A : A^p) < p^n`) and `_of_odd` (`p = 2`, `A = {±1}` or `n ≥ 3` and `A = {±1} × U^(f)`), closed by the Tau Ceti theorems at `Two/Even/Image.lean:181` and `Two/Odd/Image.lean:234`, whose statements match line for line. README:2899–2935 names both with Checks. Instances below. | Repaired. |
| R05 (P3): Checks and structure | `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `#### Examples` and `#### Dependencies` at the end of every layer 0–10, `## Downstream consumers`, `## References` are all present; 22 `**Checks.**` lists (README:275, 322, 373, 464, 499, 577, 648, 730, 775, 939, 981, 1473, 1513, 1576, 1637, 1955, 2038, 2137, 2244, 2270, 2907, 3027). `ProP/RelationRank.lean` → `ProP/Relation/Rank.lean` at README:1204; the four cited theorems are at lines 566, 582, 601, 701 of that file at the pin. | Repaired; R04 below lists the three definitions still without a Checks list. |
| R06 (P3): two elementary controls | `fpPairing_bil` and `demushkinRelatorCharacter_mem_ker` are gone from `Suggested.lean`; README:89,929,2392,2435 cite `TauCeti.fpPairing_bil_apply` and `TauCeti.demushkinRelatorCharacter_mem_ker`. | Repaired; R03 below names three further controls of the same kind. |

## R01 (P3) — Cite the scalar lemma at the pin this pull request builds against

**Location:** `TauCetiRoadmap/ProfiniteProPGroups/README.md`:1825, "it commutes with `𝔽_p`-scalars in every degree (`TauCeti.gradedPow_smul`)".

**Claim:** The declaration exists at the repository pin.

**Witness:** This branch's `lake-manifest.json` pins Tau Ceti `a91d3aa`. A scratch `#check @TauCeti.gradedPow_smul` against that pin fails with unknown identifier, while `#check @TauCeti.gradedPow_smul_zero` and `#check @TauCeti.gradedPowIter_smul` succeed (`Graded/Basic.lean:797` and `:1005`). `gradedPow_smul` exists only at main's newer pin `358314d` (`Graded/Basic.lean:729`), as the repair report itself notes.

**Repair:** Either cite what the branch pin has, `TauCeti.gradedPow_smul_zero` (degree zero) together with `TauCeti.gradedPowAddMonoidHom` (additivity above degree zero, hence `map_smul`), or update the manifest to main's Tau Ceti pin and add `#check @TauCeti.gradedPow_smul` to the pinning block of `Suggested.lean` so the gate guards the name. Tested: at `p = 2`, degree 0, `c = 0`, both forms give `π(0 · x) = 0 = 0 · π(x)`; the scratch `#check`s above are the mechanical witness.

## R02 (P3) — State the marked classification at every universe

**Location:** `TauCetiRoadmap/ProfiniteProPGroups/Suggested.lean`:872, "variable (p : ℕ) [Fact p.Prime] (G : Type) [Group G]", governing `isDemushkin_marked_of_q_ne_two`, `_q_two_odd`, `_q_two_even`, `_q_two_rank_two`, `_q_two_odd_top`, `_q_two_even_top`.

**Claim:** The marked classification is stated for every Demushkin group, as every other theorem of the file is (`G : Type u`).

**Witness:** The elaborated signature reads `isDemushkin_marked_of_q_two_even_top : ∀ (G : Type) …`, while Tau Ceti's `Marked.lean:111–113` declares `universe u` and `{G : Type u}`. A Demushkin group in `Type 1` is covered by the supplier and not by this file.

**Repair:** Write `(G : Type u)` in that `variable` line. Tested on a scratch copy: it elaborates with exit 0 and the same `#check` output up to the universe.

## R03 (P3) — Delete three remaining elementary controls

**Location:** `TauCetiRoadmap/ProfiniteProPGroups/Suggested.lean`:627 `demushkinCharacter_range_isClosed`, :1366 `d0_topologicallyGenerates`, :1831 `closedSubgroup_units_two_level_unique`.

**Claim:** Each is a headline the finished roadmap is tested against.

**Witness:** Their bodies are the probe: the first is `isCompact_range … .isClosed` after two rewrites (a continuous image of a compact group is closed); the second rewrites with `TauCeti.range_presentedProP_of_d0Relator` and `TauCeti.presentedProP.dense_closure_range_of` (the generators of a presented group generate it); the third is `TauCeti.unitsPrincipal_inj`. At `f = 2, 3` the third says `1 + 4ℤ₂ ≠ 1 + 8ℤ₂`, a README Check (README:1641–1643).

**Repair:** Delete the three from `Suggested.lean`; the README keeps the statements (README:1568–1569, 1505–1506, 1637–1643). Direct consumers to the Tau Ceti names.

## R04 (P3) — Give the last three definitions their Checks lists

**Location:** `TauCetiRoadmap/ProfiniteProPGroups/README.md`:2378–2448 (Labute's relation module, `labuteRelatorClass`, `demushkinRelatorCharacter`), :1988–1999 (`IsFiniteContinuousQuotient`), :2803–2860 (the words `demushkinWordNeTwo`, `demushkinWordTwoOdd`, `demushkinWordTwoOddTop`, `demushkinWordTwoEven`, `demushkinWordTwoRankTwo`).

**Claim:** Every definition has at least three discriminating Checks.

**Witness:** These three items carry worked instances in prose (the `ℤ_p²` conjugation-versus-scalar example at README:2405–2412; `C₂`/`C₄` under the isomorphism theorem at 2038; `⟨x,y ∣ x²(x,y)⟩` at 2815) but no `**Checks.**` list, and the words have no computed value at all.

**Repair:** Add a `**Checks.**` list to each. Computed candidates: for the words, `demushkinWordNeTwo 0 2 x = (x₁,x₂)`, `demushkinWordTwoOddTop 1 x = x₁²`, `demushkinWordTwoEven a f 2 x = x₁^{2+a}(x₁,x₂)` (the rank-two word, `TauCeti.demushkinWordTwoEven_two`), and `demushkinWordTwoOdd 2 3 x = x₁²x₂⁴(x₂,x₃)`, the relator of `D₀` with `(A,S,Y) = (x₁,x₂,x₃)`; for `E`, `F = ℤ₂` with `χ = 1` gives `X = F`, `Γ = 1`, `Λ = ℤ₂`, `E = ℤ₂` and `r̄` the generator, while `F` free of rank 2 with `χ(x₁) = 1`, `χ(x₂) = −1` gives `X` open of index 2, free of rank `1 + 2·1 = 3`, and `E = ℤ₂³` as a `ℤ₂[C₂]`-module; for `IsFiniteContinuousQuotient`, `C₄` has exactly `1`, `C₂`, `C₄` and not `C₂²`, and `ℤ_p` has exactly the `ℤ/p^k`.

## Verified sound

Both files were read in full (README 3082 lines, `Suggested.lean` 1896 lines), every passage of the 466-line change set included. The pass covers the seeded targets, every headline, every passage a finding touches, and the previous repairs. `C_m` is cyclic of order `m`; brackets are Labute's `(x,y) = x⁻¹y⁻¹xy`; `J` is Mathlib's `fromBlocks 0 (−1) 1 0`; `U^(f) = 1 + 2^fℤ₂`, `V^(f) = {±1} × U^(f)`, `U^[f] = closure⟨−1 + 2^f⟩`.

**Gate and build.** The worker's gate at d0eb5c6: every check passed, `build=0`. `lake env lean TauCetiRoadmap/ProfiniteProPGroups/Suggested.lean` from the worktree: exit 0, output exactly the 23 pinning `#check` info lines, no warning, no error, no `sorry` in the file. A scratch copy with `#check @TauCetiRoadmap.ProfiniteProPGroups.<name>` for every declaration elaborated 117 declarations (the three "unknown identifier" hits are docstring words the extraction picked up); the binders agree with the README statements, and the one divergence is R02. Dependency check output:

```
depcheck: 200 roadmaps, 1308 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Seeded sample.**
- "One implementation" (README:41–71, `Suggested.lean:103–122`): every carrier is a reducible `abbrev` of the Tau Ceti declaration; unfolding gives the same object with the same arguments; number of new carriers 0.
- "From Mathlib" (README:129–139): every name resolves at Mathlib `6b7abb3`: `ProfiniteGrp.closedSubgroup_eq_sInf_open` (`Topology/Algebra/ClopenNhdofOne.lean:64`), `IsPGroup.isCoatom_iff_index_eq_prime` (`GroupTheory/Nilpotent.lean:1255`, namespace at 1250), `Sylow.isPretransitive_of_finite` (`GroupTheory/Sylow.lean:345`, an instance), `Module.equiv_free_prod_directSum` (`Algebra/Module/PID.lean:255`), `IsPGroup.card_modEq_card_fixedPoints` (`GroupTheory/PGroup.lean:266`), `isSquare_of_charTwo'` (`Algebra/CharP/Reduced.lean:32`), `IsCompact.nonempty_iInter_of_directed_nonempty_isCompact_isClosed` (`Topology/Compactness/Compact.lean:313`), `ProfiniteGrp.toLimit_surjective`/`_injective` (`ProfiniteGrp/Limits.lean:120,127`), `Subgroup.is_normal_topologicalClosure` (`Topology/Algebra/Group/Subgroup.lean:78`), `IsTopologicalGroup.exist_openNormalSubgroup_sub_clopen_nhds_of_one` (`ClopenNhdofOne.lean`), `Submodule.mem_span_range_iff_exists_fun` (used at `FieldTheory/Galois/NormalBasis.lean:77`).
- "From Tau Ceti" (README:141–146): the 409 backticked qualified names of the README were checked against both pins by a script; every Tau Ceti name resolves at `a91d3aa` except `TauCeti.gradedPow_smul` (R01); the remaining non-hits are namespaces and the ProfiniteCohomology names below.
- "From TauCetiRoadmap.ProfiniteCohomology" (README:148–170): the seven names the citation tool found nowhere are all in that roadmap's export table on main (`TauCetiRoadmap/ProfiniteCohomology/README.md:209` for `ofDiscreteModuleRes`, `:221–222` for `corestriction_comp_res` and `exists_openSubgroup_res_eq_zero_of_res_eq_zero`, `:234` for `cd_p_le_iff_finite_pPrimary`, `cd_p_le_iff_boundedExponent`, `cd_p_le_of_isClosed`, `cd_p_eq_of_index_not_dvd`), and the layer numbers the README assigns (1, 2–3, 5, 7, 10, 11, 12) match that table's rows (`:208–229`). `corestriction_comp_res` is stated there as `cor ∘ res = (G : U) • id` (`:1647`), as README:1346 uses it.
- "The carrier is Mathlib's, and its calculus is the Profinite Cohomology roadmap's" (README:883–889): `continuousCohomology` is Mathlib's; the file imports no roadmap module and states everything on `TauCeti.cohomFp`, `TauCeti.cupFp`, `TauCeti.cohomologicalDimensionAt`; number of cohomology carriers defined here 0.
- "Theorem" (README:296, the index description): `Subgroup.profiniteIndex_apply_eq_iSup_openSubgroup` is `Topology/Algebra/Group/Profinite/Index/Basic.lean:177` at the pin, stated for every `H`; the Lean docstring at `Suggested.lean:232` cites the sibling `Subgroup.profiniteIndex_eq_iSup_openSubgroup` (`:129`), which also exists. Instances in the table.

**Sources read** (cache, legal copies): Labute 1967 (Cambridge open access, `labute1967`), Serre's Bourbaki exposé 252 (Numdam, `serre1963bourbaki`). Locators verified: Labute p. 106 definition and `G^{ab} ≅ ℤ_p^{n−1} × ℤ_p/q` (lines 7–22); Thm 1 with `(A:A²) = 2` for form (3), `N ≥ 1`, and `(A:A²) = 4` for form (4), `N ≥ 2` (56–66); Remark 2 (i)–(iii) (71–76); Thm 2 and its corollary (80–87); Prop 3 with `u(x_h,x_k) = −1` for `(i,j) = (h,k)` and `+1` for `(k,h)` and `tr = −u(r)` (311–348); Prop 4 and its corollary (374–417); Prop 5 (1)–(3) with tails `i ≠ 2` (even) and `i ≠ 1` (odd) (432–437); Thm 3 (478–487); Prop 6 (532–553); Thm 4 with the three value tables and its Corollary (iii) image table (557–609); the closed subgroups of `U₂^(1)` (610–618); the §4 Definition of `E`, `Γ`, `Λ` (622–625); Thm 5 (692–696); Thm 6 (871–875). Serre: §3 definition and invariants (66–85), Thm 3.1 and remark b (88–93), Thm 3.2 (odd `n = 2m+1`, `m ≥ 1`, `k ∈ {0} ∪ {2^s : s ≥ 2}`, and the `n = 2` analogue) (103–113), §9.1 (dévissage gives one of surjective/bijective/injective per degree, co-effacement for infinite `G`, right exactness, `cd = 2`) (285–299), §9.2 with the bracketed Euler characteristic `n_H − 2 = d(n_G − 2)` (300–306), §9.3 (307–326).

**Adversarial table.** Every row carries the values computed on each side.

| Statement/object | Instances tried | Values computed on both sides | Result/change |
|---|---|---|---|
| `IsProP` predicate | `C₄`, `C₆` at `p=2`; `ℝ`; `⊕_ℕ C₂` vs `∏_ℕ C₂` | open-normal quotients `C₄,C₂,1` all 2-groups; `C₆` has `C₃`; `ℝ` has only the trivial open quotient; direct sum non-compact, product compact | separates compactness from the predicate; none |
| two primes | profinite `G` pro-`p` and pro-`ℓ`; `ℝ` | order supported at `p` and `ℓ` gives order 1; `ℝ` pro-`p` for all `p` | README:458–460 correctly restricted; none |
| profinite order/index | `C₆`, `ℤ_p`, `ℤ̂`, `2ℤ₂ ≤ ℤ₂`, `1 ≤ ℤ₂`, `ℤ ≤ ℤ₂` | exponents `(1,1)`; `p^∞`; `∏ℓ^∞`; `2 = Subgroup.index`; `2^∞` vs junk `0`; index `1` (dense) | none |
| Lagrange | `C₃ ≤ S₃`; `2ℤ₂ ≤ ℤ₂` | `(1,1) = (0,1)+(1,0)`; `2^∞ = 2^∞ + 1` | none |
| `IsProPSylow` | `S₃` at `p=2,3,5`; `ℤ_p ≤ ℤ̂`; `pℤ_p × ∏_{ℓ≠p}ℤ_ℓ` | indices `3`, `2`, `6`; three conjugates / unique normal / `1`; `∏_{ℓ≠p}ℓ^∞` prime to `p`; index `p` | none |
| `not_dvd_index_of_le` | `S₃`, `p=2`, `P=C₂`, `U=S₃`, `U=C₂` | indices `1`, `3`, neither divisible by 2 | none |
| `maximalProPQuotient` | `S₃` at 2, 3; `A₅`; `ℤ̂` | kernels `C₃`, `S₃`; `A₅` perfect, quotient `1`; `∏_{ℓ≠p}ℤ_ℓ`, quotient `ℤ_p`; Sylow reading would give `C₂`, `C₃` | none |
| `proPKernel_proPKernel_eq_top` | `S₃`, `p=2`; `p=3` | `N = C₃`, `proPKernel 2 C₃ = C₃ = ⊤`; `N = S₃`, no 3-quotient, `⊤` | none |
| generator rank | `C_p²`, `1`, `ℤ_p`, `∏_ℕ C_p`, `∏_{𝔠} C_p` | `2`, `0`, `1` (uncountable abstractly), `ℵ₀`, `2^ℵ₀` with a countable dense subgroup | none |
| rank monotonicity counterexample | `ℚ` discrete → `ℚ` real | discrete: converging sets finite, none generates, `sInf ∅ = 0`; real: `{1/n!}` generates (`m/k = m(k−1)!/k!`), rank `ℵ₀` | profinite source needed; none |
| `proPFrattini` | `Q₈`, `C₄`, `ℤ_p`, `C_p^n` | `{±1}` (both models); `C₂` vs commutator model `1`; `pℤ_p`; `1` | none |
| Schreier bound, junk subtraction | `U = G = 1`; `U = F` free rank `n` | `0 ≤ 1 + 1·(0−1 = 0) = 1`; `n ≤ 1 + 1·(n−1) = n` | harmless; none |
| `FiniteGroupClass` | `finiteGroupClassP 2`; nilpotent class; `{1}`, all finite, `p`-groups on `ℤ̂`/`ℤ` | `C₄,Q₈ ∈`, `C₃,S₃ ∉`; `C₃,C₂` nilpotent, `S₃` not, extension field needed; completions `1`, `ℤ̂`, `ℤ_p` | none |
| `freeProP` | maps to `C₂`, `C₃` from rank 2; rank 1; infinite `X` | `4`, `1` (`9` for the free profinite group); `ℤ_p` vs `ℤ̂`; rank `p^{#X}` = `dim 𝔽_p^X` (Erdős–Kaplansky) | none |
| `presentedProP` | `⟨x∣x⁴⟩`, `⟨x∣x³⟩` at `p=2`; `x^p` in `ℤ_p` | `C₄` with 2 maps to `C₂`; `3 ∈ ℤ₂ˣ` so trivial (`C₃` for the discrete quotient); algebraic closure `pℤ` dense, not closed | none |
| `D₀` nontrivial | `φ(A,S,Y) = (0,1,0)` to `ℤ/2` | relator `0·2 + 1·4 + 0 = 0`, onto | none |
| cup trace convention | `r = (x₁,x₂)` in the Heisenberg group `(a,b,z)(a',b',z') = (a+a',b+b',z+z'+ab')`, `φ = −z` | `δφ(g,h) = φ(g)+φ(h)−φ(gh) = ab' = χ₁(g)χ₂(h)`; `x₁⁻¹x₂⁻¹x₁x₂ ↦ (−1,−1,1)·(1,0,0)·(0,1,0) = (0,0,1)`; `tr = φ(r) = −1`, `B₂₁ = +1` | equals `Matrix.J (Fin 1)`; Labute's trace is `−u(r)`, the opposite sign, as README:2161 records; none |
| diagonal of the cup matrix | `r = x₁²`, `p=2`, `φ(g) = −e(e−1)/2` with `e` the exponent sum | `φ(g)+φ(h)−φ(gh) = ef`; `φ(x₁²) = −1 ≡ 1 = c₁`; Labute's `−binom(2c,2) ≡ c` | none |
| `c_i` from exponent sums | `p=3`: `(0,0)`, `(3,0)`, `(9,0)`; `x₁³(x₁,x₂)` | `c = (0,0)`, `(1,0)`, `(0,0)` by division then reduction; `c₁ = 1` while the cup matrix has zero diagonal | R01 of the previous review repaired; none |
| `δ₁` versus the `j ≥ 2` formula | `p=3`, `r=(x₁,x₂)`, `x_i ↦ x_i²` | relator class `4r̄`, deviation `3r̄ = 0`; `Σ[w̄_i,∂_i r̄] = [ξ₁,ξ₂]+[ξ₂,−ξ₁] = 2r̄ ≠ 0`; missing `a₁₂[w̄₁,w̄₂] = r̄` | none |
| even tail at `q = 2` | rank 2, `j=2`, `r = x₁^{2+α}(x₁,x₂)`, `4 ∣ α` | `c₁ = (2+α)/2 ≡ 1`; `δ₂(τ,τ,0,…) = π²ξ₂ + [πξ₂,ξ₂] = π²ξ₂` since `[πξ₂,ξ₂] = π[ξ₂,ξ₂] + [[ξ₂,ξ₂],ξ₂] = 0`; `Im δ₂ = ⟨π²ξ₂, [[ξ₁,ξ₂],ξ₁], π[ξ₁,ξ₂]+[[ξ₁,ξ₂],ξ₂], π[ξ₁,ξ₂]+π²ξ₁⟩` misses `π²ξ₁`; Labute's tail `i ≠ 2` supplies it | README:2749–2756 agrees with Labute Prop 5(2); none |
| `H¹`, `H²` counts | `C_p²`, `ℤ_p`, `C_p^n`, free rank 2 | `(2,3)`, `(1,0)`, `r = n(n+1)/2`, `(2,0)` | none |
| cup square at `p = 2` | `ℤ/2`, `ℤ/4` | `χ∪χ` = class of `ℤ/4` ≠ 0; `H*(C₄;𝔽₂) = 𝔽₂[x,y]/(x²)`, `χ∪χ = 0` (lifts to `ℤ/4`) | separates zero/alternating pairings; none |
| `IsDemushkin` fields | `ℤ/2`, `ℤ/4`, `ℤ_p²`, `ℤ_p`, `C_p²` | `(h¹,h²,χ∪χ) = (1,1,≠0)`, `(1,1,0)`, `(2,1,≠0)`, `(1,0,–)`, `(2,3,–)` | nondegeneracy separates `ℤ/4`; none |
| abelianization and `q` | `D₀`, `⟨x₁,x₂∣x₁^{p²}(x₁,x₂)⟩` | `ℤ₂² × ℤ/2`, `q = 2`; `ℤ/p² × ℤ_p`, `q = p²` | none |
| Golod–Shafarevich | `C_p`, `C_p²`, `C_p³`, `1` | `1 < 4`, `4 < 12`, `9 < 24`; trivial group `0 < 0` false | `Nontrivial` needed and present; none |
| `cd_p_le_iff_elementaryAbelian_of_isProP` | `G = 1`, `n = 0`; `G = ℤ_p`, `n = 0` | `cd ≤ 0` and `H¹(1,M) = 0`; `cd = 1 ≰ 0` and `H¹(ℤ_p,𝔽_p) = 𝔽_p ≠ 0` | both directions agree; none |
| trivial filtration | `C₂` on `𝔽₂²` by swap; `C₃` on the 2-dim irreducible over `𝔽₂` | fixed vector `(1,1) ≠ 0`; no fixed vector, `C₃` not pro-2 | pro-`p` hypothesis needed and present; none |
| vanishing above degree 2 | `ℤ_p`; `C_p` | `H³(ℤ_p,𝔽_p) = 0 = H²(ℤ_p, Coind/𝔽_p)`; `H²(C_p,𝔽_p) = 𝔽_p` fails the premise, `H³ = 𝔽_p` | none |
| `cd_p_eq_of_isOpen` | `C_p`, `U = 1` | `cd_p C_p = ∞ ≠ 0 = cd_p 1`; excluded by `hfin` | hypothesis needed and present; none |
| Sylow restriction injective | `S₃`, `p=2`, `P=C₂`; `p=3`, `P=A₃` | sign character restricts to the generator of `H¹(C₂,𝔽₂)`; `H²(S₃,𝔽₃) = H²(A₃,𝔽₃)^{C₂} = 0` since `C₂` acts by `−1` | none |
| Sylow equality | `S₃` at 2, 3 | `cd₂ S₃ = cd₂ C₂ = ∞`; `cd₃ S₃ = cd₃ A₃ = ∞` | none |
| two-term Euler / Nielsen–Schreier | free rank `n`, index `m`; `n=1`, `U = p^mℤ_p`; `n=2`, `m=3` | `1 − d(U) = m(1−n)`; rank `1 + p^m·0 = 1`; rank `4` | `n ≠ 0` guards `n−1`; none |
| prescription property | `C₂`, trivial vs sign `χ`, levels `i = 1, 2` | trivial: `H¹(C₂,ℤ/4) = ⟨2⟩ ↦ 0`; sign: `Z¹ = ℤ/2^i`, `B¹ = 2ℤ/2^i`, `H¹ = ⟨1⟩` onto; `H²(C₂,ℤ/4)[2] = {0,2}`, reduction to level 1 kills `2`, while `×2 : (ℤ/2)[2] → (ℤ/4)[2]` sends `1 ↦ 2 ≠ 0` | condition 2 is the `×p` form, not reduction; none |
| period-two calculation | `C₂`, sign module `ℤ/2^i` | `H^{2k} = M^G/NM = M[2]/0 ≅ ℤ/2`; `H^{2k+1} = ker N/(σ−1)M = M/2M ≅ ℤ/2` | `H²` has order 2 not `2^i`; none |
| canonical character on normal forms | `ℤ_p²`; `⟨x₁,x₂∣x₁^p(x₁,x₂)⟩`; `D₀` | trivial, image `1 = 1+0ℤ_p`; `χ(x₂)(1−p) = 1`, image `1+pℤ_p`; `(−1, 1, (−3)⁻¹)`, relator `↦ (−1)²·1⁴·1 = 1` | Labute Thm 4 tables (1), (2); none |
| image table, even `q = 2` | `α = 2^{f'}u`, `u` odd, `f' < f`; `v₂(α) ≥ f` | `⟨−(1+α)⟩ ∪ U^(f'+1) = U^(f'+1) ∪ −(1+2^{f'})U^(f'+1) = U^[f']`, `−1 ∉`; `−(1+α)^{-1} ∈ −U^(f)`, image `V^(f)` | Labute Cor. (iii); none |
| closed subgroups of `ℤ₂ˣ` | `f = 2, 3, 4` | `U^[2] = ⟨3⟩⁻`, `3² = 9 ∈ U^(3)∖U^(4)`, index 2; `U^[3] = ⟨7⟩⁻`, `49 = 1+16·3`, index 4; `g = −1+2^f`, `g² = 1 − 2^{f+1}(1 − 2^{f−1})`, `U^[f] ∩ U^(2) = U^(f+1)`; indices `2^{f−1}`, `2^{f−2}`, `2^{f−1}` | none |
| `(A : A²)` | `U^(f)`, `U^[f]`, `{±1}`, `V^(f)`, `1` | `2`, `2`, `2`, `4` (Frattini quotient `C₂²`), `1` | agrees with `relIndex_map_powMonoidHom_two_eq_one_or_two_or_four`; none |
| existence iff, even | `(3,2,1)`, `(2,2,ℤ₂ˣ)`, `(2,4,ℤ₂ˣ)`, `n=0`, `(3,2,ℤ₃ˣ)`, `(2,2,V^(f))` | `1<9` ✓; `(ℤ₂ˣ)² = U^(3)`, index `4`, `4<4` ✗; `4<16` ✓; `1<1` ✗; `ℤ₃ˣ ∋ −1` not pro-3; `4 < 4` ✗ (a rank-2 image is procyclic) | both directions; none |
| existence iff, odd | `(1,{±1})`, `(1,⊥)`, `(1,V^(2))`, `(3,U^(2))`, `(3,{±1})` | `C₂` ✓; `⊥ ≠ zpowers(−1)` and `3 ≤ 1` ✗, no rank-1 group has image `⊥`; `3 ≤ 1` ✗; `−1 ∉ U^(2)` ✗; `f = ∞` ✓ | none |
| Labute Thm 5 module statement | `n=2`, `f=2`, `α=4`, `r = x₁⁶(x₁,x₂)`, `χ(x₂) = −1/5`, `y = x₂⁻¹` | `χ(y) = −5 = −(1+2²)`; map to `D₁₆`, `x₁ ↦ t`, `x₂ ↦ s`: `r ↦ t⁶·t⁻¹s⁻¹ts = t⁴`, `ℓ(r̄) = 4`; `(5+γ)` acts as `5−1 = 4` on `ℓ(x̄₁) = 1`; `(1+γ)` acts as `0` | coefficient indexed by `f = v₂(α)`, not `g`; none |
| Labute Thm 6 module statement | `n=4`, `f=2`, `r = x₁²(x₁,x₂)x₃⁴(x₃,x₄)` | `χ(x₂) = −1`, `χ(x₄) = −1/3`, image `V^(2) = ℤ₂ˣ`; `s = x₂`, `y = x₄⁻¹` with `χ(y) = −3 = 1−2²`; coefficient `(2^f−1)+ȳ` is Labute's `2^f + T` under `ι` | none |
| convention `ι` | `γ` class of `y₂`, `χ(y₂) = −(1+2^f)^{-1}` | `γ⁻¹` is the class of any `y` with `χ(y) = −(1+2^f)`; `1+2^f+γ ↦ 1+2^f+γ⁻¹` | matches the Lean hypotheses `hy`; none |
| finite levels of `Λ` | `m = 0`; `p=2, m=1`; `p=3, m=1` | `ω₀ = T`; `T(2+T)`; `T(3+3T+T²)`; constant terms `2`, `3` non-units, `T`-order 1 | none |
| `E` free of rank `n−1` | `F` rank `n`, `Γ ≅ ℤ₂`, `Λ = ℤ₂[[T]]` | kernel of `Λ^n → (T) ⊂ Λ` projective of rank `n−1` over a local ring, hence free; independent of `r` | annihilator carries no information; none |
| `ℤ₂[C₂]` has no idempotents | `e = a + bσ` | `e² = e` forces `a² + b² = a`, `2ab = b` in `ℤ₂`, so `b = 0`, `a ∈ {0,1}` | none |
| Tate duality `α₂` | `M = 0`; `M = 𝔽_p`; `G = C₂`, `M = 𝔽₂[C₂]` | `0 → 0`; `H² ≅ Hom(𝔽_p,H²)`, both 1-dim; `H²(C₂,𝔽₂[C₂]) = 0` (Shapiro) while `Hom(H⁰(C₂,𝔽₂[C₂]) = 𝔽₂, H²) = 𝔽₂` | `Infinite G` needed and present; none |
| dévissage in §9.1 | four-lemma on `0→A→B→C→0` | gives `α₀` surjective, `α₁` bijective, `α₂` injective; co-effacement for infinite `G` supplies injectivity of `α₀`, then `|H⁰(M)| = |H²(M^∨)|` makes `α₂` bijective | README:1679–1683 proof order agrees; none |
| open-subgroup theorem | `ℤ/2 ⊃ 1`; `ℤ_p²`, index `p`; `D₀`, index 2 | `0−2 = 2·(1−2)` holds numerically but `H²(1,𝔽₂) = 0`; `n(U) = 2`; `n(U) = 2 + 2·1 = 4` | infinite hypothesis needed; none |
| three-term Euler | `ℤ_p²`, any `U` | `1 − 2 + 1 = 0 = [G:U]·0` | none |
| finite-quotient determinacy | `C₂,C₂`; `C₂,C₄`; `ℤ_p, ℤ_p²`; `G = ∏ C_{p^n}`, `H = G × ℤ_p` | identity; `C₄` separates; `C_p²` separates; both have exactly the finite abelian `p`-groups (`⊕C_{p^{e_i}}` is a quotient of `∏_{n≤N}C_{p^n}`), `Hom_cont(G,ℤ_p) = 0` by the dense torsion `⊕C_{p^n}` | finite generation of `G` needed; none |
| bonding maps not surjective | `H = C₄ × C₂ → C₂` second projection | does not factor through `C₄ ↠ C₂` | step 3 needed; none |
| bilinear forms over `𝔽₂`, `𝔽₃` | `J`, `I₂`, `I₁`, `I₂` over `𝔽₃` | `J` alternating, `m=1`; `I₂` diagonal `1`, not alternating; `I₁` odd dimension; `2` not a square in `𝔽₃` | none |
| rank-2 cup matrices | `x₁²(x₁,x₂)`, `x₁²` over `𝔽₂` | `[[1,1],[1,0]]`, det `1`; `[[1,0],[0,0]]`, det `0` | none |
| marked rank hypotheses | `n = 2` in the even statement; `n = 1` in the odd | fourth generator is `1`, clause reads `1 − 2^f = 1`, false; `⟨x₁,x₂∣x₁⁶(x₁,x₂)⟩` meets every other hypothesis with `α=4`, `f=3`, image `U^[2]`; third generator `1` at rank 1 | `hn` not decoration; none |
| level pinned by the image | `f₀ = 2`, `f = 3` | `(1−8)⁻¹ ∈ U^(3) ⊆ U^(2)`, attainment holds at both levels while `V^(2) ≠ V^(3)` | image equation needed; none |
| `D₀` orientation | `χ(A) = 1` variant | image `⟨−3⟩⁻ = U^(2)`, index 2, not onto | sign on `A` needed; none |
| `hasPGroupSolutions_of_isProjective` | `G = PSL₂(𝔽₅) ≅ A₅`, `p = 2`, `SL₂(𝔽₅) ↠ G` | every map to a pro-2 group is trivial, so projective; a solution is a splitting, impossible since `SL₂(𝔽₅)` has the single involution `−1` | pro-`p` hypothesis needed and present; none |
| Serre at arbitrary rank | `G = 1`; `G = ℤ/p`; `ℤ_p²`; `F(ℕ⁺,∞)` | `cd = 0`, `s = ∅`; `cd = ∞`, free pro-`p` groups torsion-free; `cd = 2`, `H² ≠ 0`; rank `ℵ₀`, `cd = 1` | none |
| `not_injective_fromFreeProC` | `C = {1}`; `C = p`-groups, `S` infinite | both objects trivial; duals of dimension `p^{#S}` versus `#S` | class hypothesis needed and present; none |
| universes | marked theorems; everything else | `G : Type` versus `G : Type u` | R02 |

**Library declarations opened at the pins** (Tau Ceti `a91d3aa`, Mathlib `6b7abb3`; file and line): `Demushkin/NormalForm/Marked.lean:111–127` (universe and the `q ≠ 2` marked theorem); `Two/Even/Image.lean:181–186`; `Two/Odd/Image.lean:234–238`; `Free/DegreeOneForm.lean:746–749, 787–789`; `NumberTheory/Padics/DyadicUnits.lean:346–352, 465–468`; `RingTheory/PowerSeries/Evaluation.lean:87–94` (`divXSubC`); `GroupTheory/PLowerCentralSeries.lean:296–303`; `Demushkin/Duality/Basic.lean:220`; `ProP/CohomologicalDimension.lean:51–79`; `Demushkin/OpenSubgroup.lean:201–208`; `ProP/CrossedHom.lean:109–110`; `Graded/Basic.lean:771–778, 797, 1003–1012`; `LinearAlgebra/BilinearForm/Diagonalization.lean:264–265`; `Free/Pointed/Presentation.lean:93–94`; `Free/Pointed/Rank.lean:163–164`; `CohomologicalDimension/OpenSubgroup.lean:111–115`; `Free/OpenSubgroup.lean:112–116`; `CohomologicalDimension/IndexNotDvd.lean:92–95`; `Profinite/Index/Basic.lean:129, 177`; `ProP/Relation/Rank.lean:566, 582, 601, 701`; main's Tau Ceti `358314d` `Graded/Basic.lean:729` (for R01); and the eleven Mathlib locations listed under the seeded sample. Each signature agrees with the Lean statement that closes with it.

**Cross-roadmap citations resolved.** The 39 ProfiniteCohomology exports named in README:148–170, each at its row of `TauCetiRoadmap/ProfiniteCohomology/README.md:208–234` on main (`c994070`), with the layer the README assigns. `ProfiniteArithmetic` (the owner of the three deferred constructions, README:19–28) is on main under `TauCetiRoadmap/` and its open head (pull request 775) plans the profinite power `x ^ᶻ a`, the ring `ℤ̂` and the continuous and outer automorphism groups (its README:1–6, 46, 111, 173, 298). `LocalGaloisGroups`, `LocalFieldsRamification`, `ClassFieldTheory` are named as consumers only (README:3068–3076), never as suppliers.

**Ownership.** `roadmaps grep` for the carriers (`IsProPSylow`, `IsDemushkin`, `freeProP`, `demushkinD0`, `profiniteOrder`, `completedGroupAlgebra`) and the headline names over the 431 open roadmap pull requests and main finds them only in this pull request, in main's `Completed/ProfiniteProPGroups/Suggested.lean` (lines 306, 387, 422, 517, 1115, 3756) and in pull request 1187, a 43-folder bulk pull request that carries the same `TauCetiRoadmap/ProfiniteProPGroups/Suggested.lean` text (its line 189 is this file's line 189). No sibling checkout given with a path plans these objects. Ownership against open pull requests without given files was checked only through that grep.

**Settled, not re-raised.** The merge destination against the archived copy (`GATE-ProfiniteProPGroups~3` H01) and the absent `sources.toml` (H07): both exceed the two-file package authority and are recorded here for the human.

## Not verifiable

- **Neukirch–Schmidt–Wingberg, second edition** (locators (1.5.1), (1.6.10), (3.3.5), (3.3.6), (3.9.1), (3.9.4), (3.9.5), (3.9.7), (3.9.9), (3.9.10), (3.9.13), (3.9.15), (3.9.19), I §1.4, I §5 Exercise 4, III §5, III §9, p. 417): the sources service resolves the author-hosted Heidelberg address to the index page `~schmidt/NSW2e/` (41 lines), not to the book's text, and the publisher's copy is paywalled. The statements these locators support were checked instead against Labute, Serre's exposé and the pinned Tau Ceti proofs; the numbering and page claims themselves remain uncertified.
- **Ribes–Zalesskii** (Props. 1.1.4, 2.2.2, 2.3.2, 2.5.2, 2.5.4, 2.6.2, 2.8.7, 2.8.13, Cors. 2.3.6, 3.2.8, 3.6.3, 7.7.5, Thms. 3.2.9, 3.6.2, 7.8.5, §§2.3, 3.3, 4.3, 7.7.4), **Serre, *Galois Cohomology*** (I §3, §3.1, §3.3, §3.4, §4.2, §4.5), **Koch** (Ch. 4.12, §5.4, Example 6.3), **Washington** (§7.1), **Fried–Jarden**, **Dixon–Formanek–Poland–Ribes 1982**: Springer and Elsevier texts, paywalled; cited by locator only.
- No `sources.toml` exists in the folder (settled H07), so no manifest status could be read for any of these.

## Source issues

- **Misprint** in labute1967 at Theorem 4 proof, printed p. 120 (line 569): the source says the multiplicative character takes the value zero on the relator; it should be the value one; affects the proof.
- **Misprint** in labute1967 at §4.2 auxiliary lemma proof, printed p. 127 (lines 846–852): the source says to take the correcting element as the product of the involution generator and the quotient series; it should be minus that product, since the displayed identity adds the correction term; affects the proof.
- **Misprint** in labute1967 at Theorem 6 proof, printed p. 128 (line 880): the source says the third generator carries the principal-unit value and the fourth carries one; by Theorem 4 case (3) with the exponent of the first generator equal to two, the values are the other way round; affects the proof.

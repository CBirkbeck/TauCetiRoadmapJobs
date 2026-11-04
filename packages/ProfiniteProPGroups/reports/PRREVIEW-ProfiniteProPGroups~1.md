# Review of ProfiniteProPGroups (pull request #618 at 46f8016)

**Verdict:** needs changes

Previous AI review: none. The worker's gate at this head passes (build clean, 46 `sorry` warnings and nothing else; depcheck `155 roadmaps, 1063 edges, 0 problem(s)`, no UPWARD or CYCLE line for this roadmap). The findings below are ordered by severity.

## R01 (P1) — The branch re-adds a roadmap that main has archived, discharged and corrected

**Location.** The whole folder `TauCetiRoadmap/ProfiniteProPGroups/` (five files), against main at `47d6263`.

**Claim.** The pull request revises the roadmap in place at `TauCetiRoadmap/ProfiniteProPGroups/`, with `Suggested.lean` carrying 46 sorried targets.

**Witness.** `git ls-tree -r origin/main` lists the roadmap only under `Completed/ProfiniteProPGroups/` (README, Suggested.lean, STATUS, PROGRESS, metadata). The branch's merge base `0e8b058a` predates that move. Main's `Completed/ProfiniteProPGroups/README.md` opens: "Archived, declared complete 2026-10-08. `Suggested.lean` states the milestones below, each now discharged … with no `sorry`. Eight statements … are corrected in the closing section *Errata, corrected at archiving*." Main's archived `Suggested.lean` is 7124 lines with 5 occurrences of the word `sorry`; this head's file is 3427 lines with 47. Both declare `namespace TauCetiRoadmap.ProfiniteProPGroups`, and `lakefile.toml` builds both `TauCetiRoadmap.*` and `Completed.+` by default.

Three consequences:
1. Merging creates two copies of one roadmap, two `Suggested.lean` files declaring the same fully qualified names (`TauCetiRoadmap.ProfiniteProPGroups.IsDemushkin`, `…cd_p_eq_two_of_isDemushkin`, …), and regresses discharged theorems to `sorry`.
2. The corrections this pull request makes (deficiency direction, prescription connecting map, infinite-group duality, `δ_1`, the `q ≠ 2` span statements, the even-rank tail, the nonalternating normal form) are already on main in the archive's errata section, word for word in substance; the pull request re-derives them against a stale base.
3. The new Layer 9 material (basis corrections, character-preserving iteration) extends a completed roadmap. Per the principles, an extension of existing work is a Part II, and a completed roadmap is built on, not re-planned.

**Repair.** Rebase onto main. Whatever survives R02–R09 goes either into `Completed/ProfiniteProPGroups/` as a revision of the archive (if the project accepts revisions of archived roadmaps) or into a `ProfiniteProPGroupsPartII` whose introduction says where the archived roadmap stops; in either case every statement that main's archive already discharges stays discharged, and nothing is re-added under `TauCetiRoadmap/ProfiniteProPGroups/`.

## R02 (P2) — Supplier drift: `ProfiniteCohomology.cd_p` on main is at coefficient universe `u`, not `0`

**Location.** `README.md` lines 1019–1037 ("`TauCeti.cohomologicalDimensionAt` at coefficient universe `0` … not identified by that coincidence … the transfer is a step of the proof"); `Suggested.lean` lines 3007–3192 (`TauCeti.cohomologicalDimensionAt.{0} p G` in `cd_p_le_iff_elementaryAbelian_of_isProP`, `cd_p_freeProP_le_one`, `isFree_of_cd_p_le_one`, `cd_p_eq_of_isOpen`, `cd_p_eq_of_isProPSylow`, `cd_p_eq_two_of_isDemushkin`, `cd_p_le_one_of_isClosed_freeProP`) and the docstring at lines 2983–2985.

**Claim.** `cd_p` of the Profinite Cohomology roadmap is `TauCeti.cohomologicalDimensionAt.{0}`, so every bound Tau Ceti proves at `.{u}` needs a "universe comparison" step (reduce both tests to finite modules, compare cohomology along an equivalence).

**Witness.** On main, `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean` line 2998 has `variable (p : ℕ) (G : Type u) …` and lines 3019–3020 read `noncomputable abbrev cd_p : ℕ∞ := TauCeti.cohomologicalDimensionAt.{u} p G`. The `.{0}` form is the one in the open pull request #616's head, which a revision pull request of an existing roadmap may not be cited for. With `.{u}`, `TauCeti.IsDemushkin.cohomologicalDimensionAt_eq_two` (TauCeti `Topology/Algebra/Group/Profinite/Demushkin/CohomologicalDimension.lean:60`) has exactly the type of `cd_p_eq_two_of_isDemushkin`: in my probe the term `(⟨hG.1, hG.2, hG.3, hG.4, hG.5⟩ : TauCeti.IsDemushkin p G).cohomologicalDimensionAt_eq_two` is reported as having type `cohomologicalDimensionAt.{u', u'} p G = 2` against the expected `.{0, u'}`; and `rfl` does not identify the two (probe line 3440), so the paragraph is right about Lean but wrong about the supplier. The same holds for `TauCeti.freeProP.cohomologicalDimensionAt_le_one` (`Free/CohomologicalDimension.lean:50`, at `.{u}`).

**Repair.** State the seven `cd_p` declarations at `cohomologicalDimensionAt.{u}` (or cite `ProfiniteCohomology.cd_p` as it is on main), delete the universe-comparison paragraph and the `*Needs:* L6 … universe comparison` items, and close `cd_p_eq_two_of_isDemushkin`, `cd_p_freeProP_le_one`, `isFree_of_cd_p_le_one` from the Tau Ceti theorems the README already names.

## R03 (P2) — Statable headline theorems absent from `Suggested.lean`

**Location.** `README.md` lines 1451–1474 (open-subgroup theorem: three clauses) and 1008–1012 (Golod–Shafarevich); `Suggested.lean` line 3160 (`IsDemushkin.openSubgroup`, the first clause only).

**Claim.** The open-subgroup theorem is `U` Demushkin, `n(U) − 2 = [G : U](n(G) − 2)` in `ℤ`, and `demushkinCharacter U = demushkinCharacter G ∘ inclusion`; Golod–Shafarevich is `4 r(G) > d(G)²` for a nontrivial finite `p`-group.

**Witness.** Only the first clause is stated. The rank formula and the character clause are statable with this file's `demushkinRank`, `OpenSubgroup.index`, `demushkinCharacter` and `ContinuousMonoidHom.subgroupSubtype`, and Tau Ceti proves them at the pin: `IsDemushkin.demushkinRank_openSubgroup_sub_two` (`Demushkin/OpenSubgroup.lean:201`) and `IsDemushkin.demushkinCharacter_openSubgroup` (`…:241`). Golod–Shafarevich is `IsPGroup.sq_topologicalGeneratorRankNat_lt_four_mul_finrank_cohomFp_two` (`ProP/GolodShafarevich.lean`). Main's archived `Suggested.lean` states all three (grep: `demushkinRank_openSubgroup` 5 hits, `demushkinCharacter_openSubgroup` 5, `sq_topologicalGeneratorRankNat` 2); this head drops them.

**Repair.** State the two clauses and the inequality, each closed by the Tau Ceti theorem.

## R04 (P2) — The "compare the roadmap predicate and cup with Tau Ceti" target is vacuous, and the README contradicts the file

**Location.** `README.md` lines 1380–1388; `Suggested.lean` lines 497–499 (`cupFp`), 564–581 (`IsDemushkin`, `IsDemushkin.iff_tauCeti`), 3124–3153.

**Claim.** "`IsDemushkin` and `cupFp` are separately defined against the Profinite Cohomology carrier; neither is a definitional alias of Tau Ceti's predicate or cup. … prove an explicit equality of the two cup maps under the coefficient/carrier equivalences, using the nonvacuous multiplication law for `fpPairing`, and prove both directions of `IsDemushkin p G ↔ TauCeti.IsDemushkin p G`."

**Witness.** At this head `cupFp` is `noncomputable abbrev cupFp … := TauCeti.cupFp p G a b` (line 497), so "the two cup maps" are one term. The five fields of the roadmap's `IsDemushkin` are, in order, the five fields of `TauCeti.IsDemushkin` (`Demushkin/Basic.lean:81`), on the same `cohomFp` and `cupFp`; my probe closes `IsDemushkin p G ↔ TauCeti.IsDemushkin p G` with `⟨fun h => ⟨h.1, h.2, h.3, h.4, h.5⟩, fun h => ⟨h.1, h.2, h.3, h.4, h.5⟩⟩`. The elaborated signature of the roadmap's structure is `IsDemushkin : (p : ℕ) → [Fact p.Prime] → (G : Type u) → [Group G] → [TopologicalSpace G] → [IsTopologicalGroup G] → Prop`, identical to Tau Ceti's.

**Repair.** Make `IsDemushkin` an `abbrev` of `TauCeti.IsDemushkin` (as the "One implementation" table does for every other carrier), delete `IsDemushkin.iff_tauCeti` and the README paragraph, and let `tateAlpha2_bijective`, `openSubgroup` and `cd_p_eq_two_of_isDemushkin` consume the Tau Ceti theorems directly. The `attribute [local instance 2000] Ring.toAddCommGroup` at line 3124 then goes with them.

## R05 (P3) — Padding in `Suggested.lean`: one-tactic, definitional and small-value declarations

**Location and witness** (each closed in my probe copy unless noted):
- `constantCoeff_of_eq_sub_C_mul` (line 962): `subst h; simp`.
- `twoPowENat_coe`, `twoPowENat_top` (1437, 1441): `simp [twoPowENat]`.
- `fpPairing_bil` (487): `exact TauCeti.fpPairing_bil_apply p G a b` (TauCeti `Cup/TrivialFp/Basic.lean:77`).
- `IsDemushkin.isTopologicallyFinitelyGenerated` (585) and `existsUnique_hasPrescriptionProperty` (614): one term each from `TauCeti.IsDemushkin.isTopologicallyFinitelyGenerated` and `TauCeti.IsDemushkin.existsUnique_hasPrescriptionProperty` (`Demushkin/Character/Basic.lean:217`), after R04.
- `mem_gradedPieceOf_iff` (1655): a proved restatement of `TauCeti.mem_gradedPieceOf_iff`.
- `demushkinWordTwoOddPadic_natCast`, `demushkinWordTwoEvenPadic_natCast` (1466, 1473): definition unfolding plus `padicPow_natCast` and `Nat.cast_pow`.
- `splitInvolution_isZeroDivisor` (1036) and `not_exists_complement_powerSeries_two_X` (975): small computations and rejection tests (the value `(1−S)(1+S) = 1 − S² = 0`; the vector `(2, T)` vanishes modulo the maximal ideal `(2, T)`).
- `not_marked_fourth_generator_of_rank_two` and the following `example` (2022–2042): boundary-case rejection tests.

**Repair.** Delete them from `Suggested.lean`; the README keeps each as a Check or API bullet.

## R06 (P3) — The new Layer 9 route lemmas are API, not headlines, and restate Tau Ceti theorems

**Location.** `Suggested.lean` lines 1493–1892 (`exists_continuousMulEquiv_freeProPGen_of_generates`, `…_of_inv_mul_mem_proPFrattini`, `exists_labuteBasisCorrection_of_range_eq_procyclicClosure`, `…_unitsPlusMinus`, `basisModificationDelta_mem_gradedPieceOf_ker`, `pow_dvd_crossedHom_of_mem_pLowerCentralSeries`, `existsUnique_crossedHom_freeProP`, `exists_basisModificationDelta_eq_iff_forall_crossedHom_procyclic`, `…_unitsPlusMinus`, `exists_labuteIterationStep_procyclic`, `…_unitsPlusMinus`, `exists_continuousMulEquiv_labuteIteration_procyclic`, `…_unitsPlusMinus`).

**Claim.** These are targets of the finished roadmap.

**Witness.** They are intermediate steps of one route (Labute §4) to theorems Tau Ceti already proves and the README itself names at lines 2297–2317: `exists_continuousMulEquiv_labuteIteration_procyclic` is `TauCeti.freeProP.exists_continuousMulEquiv_apply_demushkinWordNeTwo_eq_of_crossedHom_single_eq_zero` (`Demushkin/NormalForm/Kernel/Approximation.lean:206`) with the hypothesis "`r = r₀·e`, `e ∈ closure(X,X) ⊓ λ₂`" in place of its "same `gr_1` class, `r ∈ X`, `D_i r = 0`" and the conclusion strengthened by "`∈ λ₁`"; the two image theorems are `mem_map_basisModificationDelta_iff_forall_gradedFunctional_crossedHom_eq_zero` (`NormalForm/GradedFunctional.lean:158`) and `…demushkinWordTwoEven_iff_forall_gradedFunctional_eq_zero` (`Two/Even/KernelSpan.lean`); `pow_dvd_crossedHom_of_mem_pLowerCentralSeries` is `IsCrossedHom.pow_dvd_apply_of_mem_pLowerCentralSeries` (`ProP/CrossedHom.lean`); `existsUnique_crossedHom_freeProP` is `freeProP.crossedHom` (`Free/Prescription.lean:94`) with its universal property; the two basis corrections are the computations of `Two/Even/Twisted.lean` and `Two/Even/UnitsPlusMinus.lean` (main's STATUS: "Theorems 5 and 6 were proved by constrained successive approximation"). None is a headline of the roadmap; the headline they serve, `isDemushkin_marked_of_q_two_even`, is already stated.

**Repair.** Keep the route in the README (it is a good account of Labute §4, and every formula in it checked out, see the table below), citing the Tau Ceti declarations by file and name; remove the sorried lemmas from `Suggested.lean`.

## R07 (P3) — Redundant instance binders and a predicate wider than the README says

**Location.** 18 occurrences of `[TotallyDisconnectedSpace (freeProP p (Fin n))]` (e.g. lines 1452, 1493, 1541, 1904, 3038); `structure IsDemushkin` at line 564.

**Witness.** `example (n : ℕ) : TotallyDisconnectedSpace (freeProP p (Fin n)) := by infer_instance` elaborates in my probe copy, so the binders are never needed. The structure's elaborated type (above, R04) has no `[CompactSpace G] [TotallyDisconnectedSpace G]`, so the predicate is stated on every topological group while README line 1202 says "for a profinite group". Harmless (Tau Ceti's is the same), but say so in the README.

**Repair.** Drop the binders; one sentence in Layer 7 that the predicate's `IsProP` field is what restricts it.

## R08 (P3) — Locator errors

- `README.md` line 2531: "cite Serre's Thm 3.2 only for `n ≥ 3`, because its printed `n ≥ 1` degenerates at `n = 1`". Serre prints `q = 2 et n = 2m + 1, avec m ≥ 1` (serre1963bourbaki line 103), so the printed hypothesis is already `n ≥ 3`, and `n = 2` is treated separately on the same page (line 108). Repair: delete the clause about the print.
- `README.md` line 1255: "the following three conditions are equivalent (Labute Prop. 6)". Labute's three conditions are surjectivity of `H¹` reduction, prescribability of crossed homomorphisms into `I/pⁱ`, and into `I` (labute1967 lines 532–538); the `×p`-injectivity of `H²` is not in Labute and is Tau Ceti's reformulation (`hasPrescriptionProperty_iff_forall_injective_explicitCoeff2_mulPow`). Repair: cite Labute for 1 ⟺ 3 and Tau Ceti for 2.
- `README.md` line 692: "`Mathlib/Algebra/Category/ContinuousCohomology/Basic.lean` defines `continuousCohomology n`". At the pin that path does not exist; the definition is in `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean`. Repair: fix the path.
- `README.md` line 2510 and `Suggested.lean` line 2050: Labute Thm 2 gives an automorphism with `φ(r) = r'` (labute1967 lines 80–82); `exists_continuousMulEquiv_map_demushkinRelator` concludes only equality of closed normal closures. Repair: state `φ r = r'`.

## R09 (P3) — Process narrative, the file's self-description, and sources

- `Suggested.lean` line 2023 "An earlier form of `isDemushkin_marked_of_q_two_even` asserted that clause", line 2036 "The reviewer's witness": process narrative. Repair: state the mathematics only.
- `Suggested.lean` lines 68–72: "This file is not the roadmap and is not exhaustive … suggest Lean forms", and `README.md` line 106 "`Suggested.lean` pins useful Lean names and signatures": the file is the acceptance test. Repair: the standard docstring form.
- `README.md` lines 2647–2650: "Implementation and source details are maintained in a private provenance ledger", and no `sources.toml`. Labute 1967 is served openly by the publisher (fetched into the cache as `labute1967`), Serre's exposé is on Numdam (`serre1963bourbaki`); both belong in `sources.toml`. Repair: record them, drop the ledger sentence.

## Verified sound

**Gate and build.** Worker gate OK; `lake env lean` on `Suggested.lean`: 46 `sorry` warnings, no other output, exit 0. Depcheck: 0 problems, no UPWARD, CYCLE or `moved:` line. No change outside the roadmap folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ProfiniteProPGroups'` is empty).

**Seeded sample.**
- "One implementation" (README lines 40–66): every alias in the table elaborates against the pinned Tau Ceti (the file builds); spot-checked `TauCeti.IsDemushkin` (`Demushkin/Basic.lean:81`), `TauCeti.cupFp` (`Cup/TrivialFp/Basic.lean:115`), `TauCeti.fpPairing` (`…:66`), `freeProPGen` (`Free/ProP.lean:538`, value `1` out of range as the README says), `Subgroup.profiniteIndex`, `TauCeti.completedGroupAlgebra.proj_dyadicCoordinate_eq_zero_iff` / `ker_proj_comp_dyadicCoordinate` / `exists_dyadicLevel_le` (`CompletedGroupAlgebra/DyadicCoordinate.lean:168,178,188`), `TauCeti.freeProP.basisModificationDeltaZero` with `basisModificationDeltaZero_apply` and `_add` (`Free/BasisModification/LevelZero.lean:113,146,280`), `TauCeti.ContinuousCohomology.corestriction_res` (`Corestriction/AllDegrees.lean:173`, `cor (res x) = U.index • x`, a natural-number multiple as the README now says), `TauCeti.cohomologicalDimensionAt_le_iff_forall_finite` (`FiniteCoefficients.lean:347`), `cohomologicalDimensionAt_le_iff_boundedExponent` (`BoundedExponent.lean:62`), `ContinuousCohomology.exists_openSubgroup_res_eq_zero` (`ClosedSubgroup.lean:273`). The claim that the aliases make Tau Ceti lemmas apply is true; the claim that each milestone Tau Ceti proves is a closed proof here is not (R02, R04, R05).
- "The carrier is Mathlib's, and its calculus is the Profinite Cohomology roadmap's" (README line 692): `TopRep` is Mathlib's (`RepresentationTheory/Continuous/TopRep.lean:31`); `continuousCohomology` is Mathlib's but at a different path (R08); the Profinite Cohomology layer numbers cited (Layer 1 carrier, 5 exact sequences, 7 Shapiro, 10 all degrees, 11 `cd_p`, 12 graded cup) match that roadmap's headings on main (README lines 630, 960, 1168, 1549, 1739, 2091); `cd_p` itself is at `.{u}` there (R02).
- "Theorem" (Labute, against `labute1967`): Thm 1 (lines 56–66): rank `2N`, `(A:A²) = 2` form `x₁^{2+2^f}(x₁,x₂)(x₃,x₄)⋯`, `f ≥ 2` or `∞`, converse for `N ≥ 1`; `(A:A²) = 4` form `x₁²(x₁,x₂)x₃^{2^f}(x₃,x₄)⋯`, converse for `N ≥ 2`, image `{±1} × U₂(f)` — matches README lines 2489–2497. Remark 2 (lines 71–76): existence for `(n, A)`, `A ≤ U_p^{(1)}`, three cases — matches lines 2512–2520 including the pro-`p` hypothesis. Thm 2 (80–82): automorphism sends `r` to `r'` (R08). Prop 3 (311–317): diagonal `binom(q,2)a_i`, off-diagonal `±a_{ij}` — matches line 1829 at `q = p`. Prop 4 and corollary (374–417): cup normal forms and the `mod F₃` congruences, odd and even — matches lines 2329–2345. Prop 5 (432–437) and the proof of Thm 3 (488–520): full span for `q ≠ 2` in Labute's `q`-filtration; the README's `p = 3`, `(x₁, x₂)` counterexample is for the lower `p`-series and so does not contradict Labute. Thm 3 (478–487): the three normal forms, `α ∈ 4ℤ₂`, `f = 2, …, ∞` — matches lines 2422–2426. Prop 6 (532–544): see R08. Thm 4 and its proof (557–602): the character tables `(1−q)⁻¹`, `−1`/`(1−2^f)⁻¹`, `−(1+α)⁻¹`/`(1−2^f)⁻¹` and the commutator formula `D(x,y) = x⁻¹y⁻¹(Dx − yDx + xDy − Dy)` — match README lines 2430–2437 and 2226–2229 and the Lean `hχ1`, `hχ3`, `hD`. Corollary (iii) (605–609): image table incl. `U₂[v₂(α)]` when `v₂(α) < f` — matches the `hrange` disjunction of `isDemushkin_marked_of_q_two_even`. §4.1 (637–691): `a`, `b` (even), `y₂ = w₂^{a⁻¹}`, `y₄ = w₄w₂^{−b}`, `ψ₁ = 1+α+(1+T)^a`, `ψ₂ = 2^g−1+(1+T)^{ab}`, vanishing at `−2−2^f`, `φ₁(0)` unit, `φ₂(0) ∈ 2ℤ₂`, `r̄ = (2+2^f+T)z̄₁`, `e ∈ (X,X) ∩ F₃` — all as in the README and the Lean docstrings. Thm 5 (692–696), Lemmas 1–4 (717–773), the induction (794–817) — match the "character-preserving iteration" subsection, including Labute's `D` into `2I` and condition (ii). §4.2 (818–870): `n ≥ 4`, `f ≤ v₂(α)`, `y₂ = w₂w₄^{−b}`, `r̄ = (1+α+S(1+T)^b)ȳ₁ + (2^f+T)ȳ₃`, the lemma producing `φ = Sφ(T)`, `e₁ = (z₁,z₃)^a e₁'`, `x₂ = z₂z₃^{−a}` giving `(x₁,x₃)^{2a}` — match. Thm 6 (871–875), Lemmas 1 and 3 of §4.2 (888–905) with the mixed element `π^{i−2}[ξ₂, ξ₄]` — match.
- Serre's exposé (`serre1963bourbaki`): Thm 3.1 (lines 88–93, `q ≠ 2`, `n` even), Thm 3.2 (103–107), §9.1 (285–299: category of finite modules killed by `p`, `α_i` isomorphisms for `ℤ/p`, dévissage, co-effaceability from `G` infinite, right exactness of `H²`), §9.2 (300–306: open subgroups, Euler characteristic bracket `n' − 2 = d(n − 2)`), §9.3 (307–326: dualizing module, duality for finite `p`-primary `M` with `M' = Hom(M, I)`, the prescription characterization) — the README's Layer 7 duality package and its routes match these.

**Adversarial table.** Values computed on each side; "ok" means no change needed.

| Statement | Instance | Computed | Result |
|---|---|---|---|
| `U^[f]` coefficient witness (README 2131–2137) | `n=4`, `α=4`, `f=2`, `g=∞`, `F → D₁₆`, `x₁↦t`, `x₂↦s` | `(x₁,x₂) ↦ t⁻¹·st s = t⁻²`, `r ↦ t⁶t⁻² = t⁴`, `ℓ(r̄)=4`; `s` acts by `−1` so `ℓ((1+γ)z)=0`; `ℓ((5+γ)x̄₁)=5−1=4` | ok |
| image dichotomy behind the two basis corrections | `χ(x₂)=−(1+α)⁻¹`, `χ(x₄)=(1−2^g)⁻¹` | closure `{((−1)^a,(1+α)^a)}`; `1+α=(1−2^f)^u`, `u` odd ⇒ `= U^[f]` when `g>f=v₂(α)`; when `g ≤ v₂(α)`, `(1,1−2^g)` generates `{1}×U^(g) ∋ (1,1+α)` ⇒ `{±1}×U^(g)` | ok; matches Labute Cor (iii) |
| prescription condition 2 counterexample (README 1261–1265) | `C₂`, sign, `i=1` | `H²(C₂,ℤ/4)=(ℤ/4)[2]={0,2}`, reduction kills `2`; `×2: (ℤ/2ⁱ)[2]→(ℤ/2ⁱ⁺¹)[2]`, `2ⁱ⁻¹↦2ⁱ` injective; `H¹` reduction `M/2M→M'/2M'` is `id` on `ℤ/2` | ok |
| `H^{2k}(C₂, I/2ⁱ)`, `H^{2k+1}` (README 1420–1424) | sign module `M=ℤ/2ⁱ` | `N=1+σ=0`; `M^G/NM = M[2] = ℤ/2`; `ker N/(σ−1)M = M/2M = ℤ/2` | ok |
| `δ_1` at `j=1` (README 1599–1603) | `p=3`, `r=(x₁,x₂)`, `x_i↦x_i²` | class `4r̄`, deviation `3r̄=0`; `j≥2` formula `[ξ₁,ξ₂]+[ξ₂,−ξ₁]=2r̄≠0`; missing `a₁₂[ξ₁,ξ₂]=r̄` | ok |
| `δ_1`, polarization (README 1606–1623) vs TauCeti LevelZero docstring | general | `Σ c_i(πω_i+binom(p,2)[ω_i,ξ_i])+Σ a_{ik}([ω_i,ξ_k]−[ω_k,ξ_i]+[ω_i,ω_k])`; polarization `binom(p,2)Σc_i[w_i,v_i]+Σa_{ik}([v_i,w_k]+[w_i,v_k])` | identical |
| even-rank tail (README 2391–2396) | `q=2`, `w=(π^{j−1}ξ₂, π^{j−1}ξ₂, 0,…)` | `[u,ξ₂]−[u,ξ₁]+πu+[u,ξ₁] = π^jξ₂+[π^{j−1}ξ₂,ξ₂] = π^jξ₂` since `(x₂^{2^{j−1}},x₂)=1` | ok |
| `Im δ₂+T₂` misses `π²ξ₁` at `n=2` | basis `π²ξ₁, π²ξ₂, π[ξ₁,ξ₂], [[ξ₁,ξ₂],ξ₁], [[ξ₁,ξ₂],ξ₂]` | `Im δ₂ = ⟨π[ξ₁,ξ₂]+π²ξ₁, π²ξ₂, π[ξ₁,ξ₂]+[[ξ₁,ξ₂],ξ₂], [[ξ₁,ξ₂],ξ₁]⟩`; `π²ξ₁ ∈ Im δ₂+⟨π²ξ₂⟩` forces coefficient of `π[ξ₁,ξ₂]` equal `1≠0` | ok |
| cup matrices (README 2341–2343) | `p=2`, `n=2` | `x₁²(x₁,x₂)`: `[[1,1],[1,0]]`, det `1`; `x₁²`: `[[1,0],[0,0]]`, det `0` | ok |
| deficiency (README 1000–1003) | `⟨x ∣ x^p, x^{p²}⟩` | `#S−#R=−1`, `d−r=1−1=0`, `−1 ≤ 0` | ok |
| crossed-hom commutator formula (README 2226, Lean 1685) | `(g,h)=g⁻¹h⁻¹gh` | `D(g⁻¹)=−χ(g)⁻¹D(g)`; expanding gives `χ(g)⁻¹χ(h)⁻¹((1−χ(h))D(g)+(χ(g)−1)D(h))` | = Labute line 572 |
| detector values (README 2246–2250) | split branch, `f=2` | `D₄((x₂,x₄))=(−1)(1−2^f)(−2)=2(1−2^f)=−6`, half `−3` odd; `D₂((x₂,x₄))=−χ(x₂)⁻¹χ(x₄)⁻¹(χ(x₄)−1)`, `2^f ∣` | ok |
| Labute's last step (README 2153–2156) | `W=z₁²(z₁,z₂)…`, `r=W(z₁,z₃)^a e'` | `(z₁,z₂z₃^{−a})=(z₁,z₃^{−a})(z₁,z₂)^{z₃^{−a}} ≡ (z₁,z₃)^{−a}(z₁,z₂)` mod `λ₂` ⇒ `W'⁻¹r ≡ (z₁,z₃)^{2a}` | ok = Labute 866–870 |
| Lemma 1 complements (README 2203–2210) | `φ:F→2ℤ₂`, `φ(x₂)=2` | `φ(λ_k)=2^{k+1}ℤ₂`; `g∈λ_k` with `φ(g)∈2^{k+2}ℤ₂` ⇒ `g=hx`, `h∈λ_{k+1}`, `x∈X∩λ_k`; split: `φ(λ_k)={0}×2^{k+1}ℤ₂` only for `k≥1`, quotient at `k=0` is `𝔽₂²` | ok, "`k ≥ 1`" needed and present |
| Frattini congruence of the procyclic correction | `(1+2^f)^a=1+α`, `(1+α)^b=1−2^g` | `a` unit (both generate `U^(f)`), `b∈2^{g−f}ℤ₂` even; `y₁^{φ₁(0)}y₃^{φ₂(0)}≡y₁` mod `Φ` | ok |
| coefficient conventions in the Lean relator-class equations | Labute `γ·x̄ = y⁻¹xy`, Tau Ceti `ȳ•x̄ = yxy⁻¹` | `2+2^f+T = 1+2^f+γ ↦ (1+2^f)+γ⁻¹•`, `γ⁻¹` = class of `z₂⁻¹`, `χ(z₂)(1+2^f)=−1`; split `2^f+T ↦ (2^f−1)+γ⁻¹•`, `γ⁻¹` = class of `z₄⁻¹`, `S=S⁻¹` | matches `of ((z 1)⁻¹)`, `of ((z 3)⁻¹)` |
| `exists_labuteBasisCorrection_of_range_eq_procyclicClosure` at `n=2` | `freeProPGen 2 2 3 = 1` | `hχ3` reads `1−twoPowENat g = 1` ⇒ `g=⊤`; word `x₀^{2+α}(x₀,x₁)·x₂⁰` | ok as docstring says |
| `splitBase_dvd_iff`, `splitInvolution_isZeroDivisor`, `(2,T)` | `ℤ₂[C₂][[T]] = ℤ₂[[T]] ⊕ S·ℤ₂[[T]]` | `c(a+Sb) = ca+S cb`; `(1−S)(1+S)=1−S²=0`; `(2,T) ≡ 0` mod `(2,T)` so span mod `𝔪` is `≤1`-dimensional | true |
| universe identification (README 1029–1037) | `cohomologicalDimensionAt.{0}` vs `.{u'}` | `rfl` fails (probe line 3440); but supplier's `cd_p` is `.{u}` | R02 |
| `IsDemushkin.iff_tauCeti` | field shuffle | closes (probe) | R04 |
| open-subgroup rank formula at `n=2` (README 2541) | `n(U)−2=[G:U]·0` | `n(U)=2` for every `U` | ok, = Serre 9.2 |
| Tate duality needs `G` infinite (README 1418) | `C₂`, `I/4` | `H²` has order `2`, not `4` | ok |
| Serre Thm 3.2 hypothesis (README 2531) | print | `n = 2m+1`, `m ≥ 1` (line 103) | R08 |

**Cross-roadmap citations resolved.** `ProfiniteCohomology` Layers 1, 5, 7, 10, 11, 12 and the targets `cd_p_le_iff_finite_pPrimary` (its README line 1847), `cd_p_le_iff_boundedExponent`, `cd_p_le_of_isClosed`, `cd_p_eq_of_index_not_dvd`, `exists_openSubgroup_res_eq_zero_of_res_eq_zero`, `corestriction_comp_res`, `ofDiscreteModuleRes`, `cup_gradedComm`, `TopPairing` — all present on main; the eight "Lean names found nowhere" in the worker's citation list are exactly these ProfiniteCohomology target names, so they are not missing. `LocalGaloisGroups` and `ProfiniteArithmetic` are on main under `Completed/`. Supplier order: every supplier precedes this roadmap (merge order line 291) or is on main.

**Ownership against open work.** The sibling checkouts named in the brief were searched by object (Demushkin groups, `cd_p`, completed group algebras, free pro-`p` groups): only `ProfiniteCohomology` (#616, a revision of a roadmap on main, hence cited as on main) touches the same objects, and it builds no Demushkin or pro-`p` carrier. Ownership was not checked against open pull requests whose files the brief does not provide.

**Not statable headlines.** None claimed in the module docstring; the docstring does not list any, and R03 lists the statable ones that are absent.

## Not verifiable

- **NSW, Cohomology of Number Fields, 2nd ed.** ((3.9.1), (3.9.4), (3.9.5), (3.9.7), (3.9.13), (3.9.15), (3.9.19), (1.6.10), (3.3.5), (3.3.6), and the claim that p. 417 prints `x₂²(x₁,x₂)x₃^{2^f}⋯`): the authors' free electronic edition is linked from the index page `~schmidt/NSW2e/` as `./NSW2.3.pdf`, but that path answers with a redirect to the index for the sources service and for a direct fetch alike (three attempts under the ids `nsw2e`, `nsw2e_pdf`, `nsw2e_v23`; the cache holds only the index page). The Springer edition is paywalled.
- **Ribes–Zalesskii, Profinite Groups** (Prop. 1.1.4, §2.3, 2.3.2, 2.3.6, 2.5.2, 2.5.4, 2.6.2, 2.8.7, 2.8.13, 3.2.8, 3.2.9, 3.6.2, 3.6.3, §4.3, 7.7.4, 7.7.5, 7.8.5); **Serre, Galois Cohomology** (I §3, §3.1, §3.3, §3.4, §4.2, §4.5); **Koch, Galois theory of p-extensions** (Ch. 4.12, §5.4, Example 6.3); **Washington, Cyclotomic Fields** (§7.1); **Dixon–Formanek–Poland–Ribes 1982**: paywalled, cited by locator only (uncertified); none of these locators was read.
- The roadmap has no `sources.toml`, so no citation is recorded as waived or uncertified; the two texts I could read legally (Labute via the publisher's openly served PDF, Serre via Numdam) are now in the worker's cache under `labute1967` and `serre1963bourbaki`.

## Source issues

- none

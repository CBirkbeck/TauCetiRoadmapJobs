# Review of ProfiniteProPGroups (pull request #618 at c71bff1)

**Verdict:** needs changes

The worker's gate at this head passes (every check OK; `lake env lean` on `Suggested.lean`: 20 `sorry` warnings, no other output, exit 0; depcheck `155 roadmaps, 1063 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ProfiniteProPGroups'` is empty). No repair report exists on the board, so no finding of the previous review is settled as "not actionable".

## The previous review, finding by finding

- **R01 (P1, the folder re-adds an archived roadmap): not repaired.** The merge base is still `0e8b058a`; the branch still carries `TauCetiRoadmap/ProfiniteProPGroups/` (five files) while main (`4d14cbd5`) lists the roadmap only under `Completed/ProfiniteProPGroups/`. Re-raised below as R01 with new witnesses.
- **R02 (`cd_p` at universe `0`): repaired.** README lines 1020–1029 now say `TauCeti.cohomologicalDimensionAt.{u} p G` "with coefficients in the universe of the group", and every `cd_p` declaration of `Suggested.lean` is at `.{u}` (lines 2473–2673), with `.{0}` only for `freeProP p (Fin n) : Type`.
- **R03 (absent headlines): repaired.** `IsDemushkin.demushkinRank_openSubgroup_sub_two` (line 2638), `IsDemushkin.demushkinCharacter_openSubgroup` (2650) and `sq_topologicalGeneratorRankNat_lt_four_mul_finrank_cohomFp_two` (2438) are stated and closed by the Tau Ceti theorems.
- **R04 (vacuous comparison target): repaired.** `IsDemushkin` is `abbrev … := TauCeti.IsDemushkin p G` (line 560); `IsDemushkin.iff_tauCeti` and the README paragraph are gone.
- **R05 (padding): mostly repaired.** Ten of the twelve listed declarations are deleted. `fpPairing_bil` (487) and `existsUnique_hasPrescriptionProperty` (590) remain as proved one-liners; the README says `LocalGaloisGroups` cites the first by name (line 99), which is true of main's `Completed/LocalGaloisGroups/Suggested.lean`.
- **R06 (route lemmas): repaired.** None of the thirteen names occurs in the file.
- **R07 (redundant binders, predicate scope): repaired.** No `[TotallyDisconnectedSpace (freeProP p (Fin n))]` binder remains; README lines 1205–1207 now say the predicate is defined on every topological group and its `IsProP` field confines it.
- **R08 (locators): repaired.** Line 2516 cites Serre Thm 3.2 for `n = 2m + 1`, `m ≥ 1`; lines 1252–1254 cite Labute Prop. 6 for 1 ⟺ 3 and Tau Ceti for 1 ⟺ 2; line 692 has the correct Mathlib path; `exists_continuousMulEquiv_map_demushkinRelator` (Lean 1507) concludes `φ r = r'`.
- **R09 (narrative, docstring, sources): partly repaired.** The process sentences and the "provenance ledger" sentence are gone and the module docstring has the standard form. There is still no `sources.toml` (R07 below).

## R01 (P1) — The branch still re-adds a roadmap that main has archived and discharged

Re-raised: R01 of the previous review (no repair report marks it settled).

**Location.** The whole folder `TauCetiRoadmap/ProfiniteProPGroups/`, against main at `4d14cbd5`.

**Claim.** The pull request revises the roadmap in place under `TauCetiRoadmap/`, with `Suggested.lean` carrying 20 sorried targets.

**Witness.** `git ls-tree -r origin/main --name-only | grep ProfiniteProPGroups` lists only `Completed/ProfiniteProPGroups/{README.md,Suggested.lean,STATUS.md,PROGRESS.md,metadata.toml}`. Main's archived README opens "Archived, declared complete 2026-10-08 … each now discharged … with no `sorry`", and its errata section (line 2223) already records the deficiency direction, the prescription connecting map, the infinite-group duality, `δ_1`, the `q ≠ 2` spans, the even-rank tail and the nonalternating form. Measured against that archive at this head:

| Quantity | Value |
|---|---|
| README lines of this head identical to a line of the archive | 2063 of 2636 |
| declaration names of this head's `Suggested.lean` also declared in the archive | 117 of 132 |
| sorried declarations of this head that the archive proves from Tau Ceti | 18 of 20 |

Both files declare `namespace TauCetiRoadmap.ProfiniteProPGroups`, and `lakefile.toml` builds `TauCetiRoadmap.*` and `Completed.+` alike, so merging creates two modules declaring the same fully qualified names (`TauCetiRoadmap.ProfiniteProPGroups.IsDemushkin`, `…cd_p_eq_two_of_isDemushkin`, …). A consumer on main already binds to the archive: `Completed/LocalGaloisGroups/Suggested.lean` line 9 reads `import Completed.ProfiniteProPGroups.Suggested` and line 42 opens `TauCetiRoadmap.ProfiniteProPGroups`. The branch's own `STATUS.md` says "Every layer is done".

**Repair.** Rebase onto main. Whatever this pull request adds beyond the archive (the finite-module Tate duality wording, the open-subgroup character transport, the basis-correction prose of Layer 9) goes either into `Completed/ProfiniteProPGroups/` as a revision of the archive, if the project accepts revisions of archived roadmaps, or into a `ProfiniteProPGroupsPartII` whose introduction says where the archived roadmap stops. In either case every statement the archive discharges stays discharged (R03 below lists the imports that close 17 of the 20 sorries here), and nothing is re-added under `TauCetiRoadmap/ProfiniteProPGroups/`.

## R02 (P2) — `demushkinQ` and the normal-form vocabulary are re-defined although Tau Ceti has them at the pin, and the re-definition breaks the "one implementation" claim

**Location.** `Suggested.lean` line 579 (`noncomputable def demushkinQ … := if ∀ x : topAbelianization G, IsOfFinOrder x → x = 1 then 0 else Nat.card {x // IsOfFinOrder x}`); lines 1291–1343 (`def labuteComm`, `def freeProPGen`, `def presentedProPGen`, `def demushkinWordNeTwo`, `def demushkinWordTwoOdd`, `def demushkinWordTwoEven`, `def demushkinWordTwoRankTwo`); lines 1149 and 1157 (`def labuteRelatorClass`, `def demushkinRelatorCharacter`). README lines 41–44 ("Each carrier Tau Ceti provides is exported here … as a reducible alias … every Tau Ceti lemma applies to it") and 2431–2432 ("the relator words are the named terms `demushkinWordNeTwo`, …").

**Claim.** These are the roadmap's own definitions, and the Tau Ceti classification theorems apply to the roadmap's statements about them.

**Witness.** At the pinned Tau Ceti every one of them exists: `TauCeti.demushkinQ` (`Demushkin/QInvariant.lean:97`, body `if torsion (TopologicalAbelianization G) = ⊥ then 0 else Nat.card (torsion …)`), `TauCeti.labuteComm` and the four words (`Demushkin/NormalForm/Basic.lean:93,164,201,274,291`, same bodies), `TauCeti.freeProPGen` (`Free/ProP.lean:538`), `TauCeti.presentedProPGen` (`Presentation/Basic.lean:952`), `TauCeti.labuteRelatorClass` (`Demushkin/Labute/RelationModule.lean:122`), `TauCeti.demushkinRelatorCharacter` (`Demushkin/Labute/RelatorCharacter.lean:46`). The words and generators are definitionally equal to Tau Ceti's (my probe closes `isDemushkin_marked_of_q_two_odd` and `…_even` by `TauCeti.isDemushkin_marked_of_q_two_odd hG hodd hn hf hrange` and the even analogue), but `demushkinQ` is not: the probe's `TauCeti.isDemushkin_marked_of_q_ne_two hG hq` at line 1394 fails with "argument `hq` has type `demushkinQ hG ≠ 2` but is expected to have type `TauCeti.demushkinQ hG ≠ 2`". So `isDemushkin_marked_of_q_ne_two`, the two `labuteRelatorClass` theorems (whose `hq` is about this `demushkinQ`) and the README's `q`-statements are about an object no Tau Ceti theorem mentions, and the two definitions agree only propositionally (`torsion = ⊥ ↔ ∀ x, IsOfFinOrder x → x = 1`, `Nat.card (torsion …) = Nat.card {x // IsOfFinOrder x}`). Main's archive already made this move: its docstring (lines 207–210) says `demushkinQ`, the relator class, the relator character and the words "are now Tau Ceti's".

**Repair.** Replace each `def` by `abbrev … := TauCeti.<name>` (as the "One implementation" table does for every other carrier) and add the ten names to that table; then `isDemushkin_marked_of_q_ne_two` closes by `TauCeti.isDemushkin_marked_of_q_ne_two hG hq` and `isDemushkin_marked_of_q_two_rank_two` by the archive's proof from `TauCeti.isDemushkin_marked_of_q_two_rank_two` (`NormalForm/Marked.lean:298`). Tested: with the probe's imports (R03), the odd and even marked theorems and both relator-class theorems already close on the definitionally equal words.

## R03 (P2) — The README says every Tau Ceti-proved milestone is a closed proof in `Suggested.lean`; 18 of the 20 sorries are such milestones

**Location.** README line 62 ("Every milestone about these carriers that Tau Ceti proves is a closed proof in `Suggested.lean` whose body is the Tau Ceti theorem"), line 722 ("Its graded commutativity … is Tau Ceti's `TauCeti.cupFp_gradedComm`"), lines 1367–1368, 1440–1441, 1519, 1869, 1923, 2053; `Suggested.lean` module docstring line 71 ("each either with `sorry` or closed by the Tau Ceti theorem that proves it") and the sorried declarations at lines 506, 625, 1227, 1258, 1394, 1425, 1463, 1489, 1507, 2260, 2274, 2473, 2519, 2528, 2557, 2580, 2673, 2688, 2879.

**Claim.** What Tau Ceti proves is closed here; the sorries are the genuinely open targets.

**Witness.** On a copy of the file with nine further imports (`Demushkin.NormalForm.Marked`, `Demushkin.NormalForm.LabuteModule.Relator`, `Demushkin.NormalForm.Uniqueness`, `ContCohomology.CohomologicalDimension.OpenSubgroup`, `…CohomologicalDimension.IndexNotDvd`, `Profinite.Sylow.CohomologicalDimension`, `Profinite.Free.ClosedSubgroup`, `Profinite.Free.OpenSubgroup`, `Profinite.Free.Pointed.Rank`; eight of their object files had to be built first) and the archive's proof terms substituted, 17 of the 20 sorries elaborate with no error: `cupFp_gradedComm` (`TauCeti.cupFp_gradedComm`, `Cup/TrivialFp/Basic.lean:191`), `demushkinCharacter_range_congr` (`TauCeti.range_demushkinCharacter_of_equiv`, `Demushkin/Character/Basic.lean:300`), both `exists_labuteRelatorClass_*` (`LabuteModule/Relator.lean:82,149`), `isDemushkin_marked_of_q_two_odd` and `…_even` (`Marked.lean:152,265`), `exists_continuousMulEquiv_map_demushkinRelator` (`freeProP.exists_continuousMulEquiv_apply_eq_of_range_demushkinCharacter_eq`, `Uniqueness.lean:133`), the two `ProfiniteGroupExtension` lemmas (`GroupExtension/Cohomology.lean:803,822`), `cd_p_le_iff_elementaryAbelian_of_isProP` (from `IsProP.cohomologicalDimensionAt_le_iff_forall_smul_eq_self`, `ProP/CohomologicalDimension.lean:122`), `isFree_of_cd_p_le_one` (`Free/Serre.lean:81`), `cd_p_eq_of_isOpen` (`cohomologicalDimensionAt_eq_of_isOpen_of_ne_top`, `CohomologicalDimension/OpenSubgroup.lean:111`), `res_injective_of_isProPSylow` (`res_injective_of_forall_not_dvd_index`, `IndexNotDvd.lean:92`), `cd_p_eq_of_isProPSylow` (`IsProPSylow.cohomologicalDimensionAt_eq`, `Sylow/CohomologicalDimension.lean:81`), `cd_p_le_one_of_isClosed_freeProP` (`Free/ClosedSubgroup.lean:101`), `nonempty_continuousMulEquiv_freeProP_of_openSubgroup` (`freeProP.nonempty_continuousMulEquiv_freeProP_openSubgroup_index`, `Free/OpenSubgroup.lean:112`), `not_injective_fromFreeProC_finiteGroupClassP` (`Free/Pointed/Rank.lean:163`). The eighteenth, `isDemushkin_marked_of_q_ne_two`, closes after R02; `isDemushkin_marked_of_q_two_rank_two` likewise. Only `splitBase_dvd_iff` has no Tau Ceti counterpart.

**Repair.** Add the nine imports and close the 19 declarations with the terms above (the archive's `Suggested.lean` has each of them), or delete the README sentence and the docstring clause and say which statements are left open and why. The first is what main's archive does.

## R04 (P3) — A Mathlib name that does not exist at the pin

**Location.** README line 477: "*Needs:* M `frattini`, M `IsPGroup.exists_maximal_subgroup_normal` and the finite Frattini lemmas".

**Witness.** `exists_maximal_subgroup_normal` occurs nowhere in the pinned Mathlib (the worker's citation check flags it, and `grep -rl` over `Mathlib/` confirms). The facts Mathlib has are `Subgroup.isCoatom_iff_index_eq_prime` for `IsPGroup p G` with `Group.IsNilpotent G` (`Mathlib/GroupTheory/Nilpotent.lean:1255`), proved through `NormalizerCondition.normal_of_coatom` (line 1244), and Tau Ceti's `IsProP.normal_of_isCoatom`, which the same bullet already cites.

**Repair.** Replace the name by `Subgroup.isCoatom_iff_index_eq_prime` (with its `Group.IsNilpotent` hypothesis, supplied for a finite `p`-group by `IsPGroup.isNilpotent`).

## R05 (P3) — Hypotheses the statements do not need

**Location.** `Suggested.lean` lines 1231 and 1262 (`hq : demushkinQ hr = 2` in both `exists_labuteRelatorClass_*`), 1426 and 1464 (`hq` in `isDemushkin_marked_of_q_two_odd` and `…_even`), 1395 (`hn : 2 ≤ demushkinRank hG` in `isDemushkin_marked_of_q_ne_two`), 1511 (`hrank` in `exists_continuousMulEquiv_map_demushkinRelator`).

**Witness.** In the probe each of these theorems closes from the Tau Ceti theorem without the hypothesis, and Lean reports `hq` and `hrank` as unreferenced in the five that elaborated. Mathematically: `-1 ∈ Im χ` (forced by `hrange`) gives `q = 2`; both presented groups on `n` generators have rank `n` once the relator lies in `Φ(F)` (`IsDemushkin.mem_proPFrattini_of_presentedProP_singleton`, used at `Uniqueness.lean:138`); and a Demushkin group of rank `1` is `ℤ/2` with `q = 2`, so `hq` already excludes rank `1`.

**Repair.** Drop them, or keep `hrank` and `hn` with a docstring sentence saying they are redundant.

## R06 (P3) — The file is an API catalogue, not an acceptance test

**Location.** `Suggested.lean`: 87 `example`s (lines 658–2904), about 45 proved alias theorems, and `splitBase_dvd_iff` (976).

**Witness.** The brief's form for `Suggested.lean` keeps a proved `example` only when it tests something nontrivial about a kept definition, "at most a handful in the file"; here almost every section restates a Tau Ceti theorem as an `example` (`example : IsTopologicalRing (completedGroupAlgebra p Γ) ∧ …` at 790, `example (U : OpenNormalSubgroup Γ) : …` at 798, the eight Sylow examples at 1647–1704, the fourteen graded-piece examples at 658–747, …). `splitBase_dvd_iff` is a divisibility lemma in `ℤ₂[C₂][[T]]` (value: `(2^f + T) ∣ a + S·b ↔ (2^f + T) ∣ a ∧ (2^f + T) ∣ b`, true because `{1, S}` is a basis over `ℤ₂[[T]]`), a step of the §4.2 route and not a headline. Proved aliases that a consumer on main cites by name (`proPKernel_proPKernel_eq_top`, `demushkinCharacter_unique`, `fpPairing_bil`, `cd_p_eq_of_isProPSylow`, `standardD0Orientation` and its values, the extension-lifting row: each found in `Completed/LocalGaloisGroups/Suggested.lean` or `ClassFieldTheory`) are the one class with a reason to stay.

**Repair.** Delete the `example`s (the README keeps each as a Check or "In Tau Ceti" line), delete `splitBase_dvd_iff` from the file (the README keeps it under the dyadic bullet), and keep only the aliases consumers cite.

## R07 (P3) — No `sources.toml`

Re-raised in part: R09 of the previous review.

**Location.** `TauCetiRoadmap/ProfiniteProPGroups/` has no `sources.toml`; README lines 2630–2636 cite Labute 1967 and Serre's exposé 252.

**Witness.** Both texts are legally served (Labute by the publisher's open PDF, Serre on Numdam) and are in the worker's cache; the manifest that records `id`, `locator_scheme`, `cited_for` and the service's fields does not exist, so no citation of this roadmap is recorded as read, waived or uncertified.

**Repair.** Create `sources.toml` with `labute1967` (DOI 10.4153/CJM-1967-007-8, scheme `page`), `serre1963bourbaki` (Numdam `SB_1962-1964__8__145_0`, scheme `section`), and the paywalled texts (Ribes–Zalesskii, Serre *Galois Cohomology*, Koch, Washington, NSW) as `uncertified` with their locators.

## Verified sound

**Gate, build, direction.** Worker gate OK at `c71bff1`. `lake env lean TauCetiRoadmap/ProfiniteProPGroups/Suggested.lean`: 20 `sorry` warnings, nothing else, exit 0. Depcheck: `155 roadmaps, 1063 edges, 0 problem(s)`; the roadmap is at line 275 of the merge order; `ProfiniteCohomology` is on main; the consumers it names (`LocalGaloisGroups`, `ProfiniteArithmetic`) are on main under `Completed/`. No change outside the roadmap folder. No `set_option`, no `lemma`, no sorried data, single `import Mathlib` plus 64 `TauCeti.*` modules, all existing at the pin (the file builds).

**Seeded sample.**
- "One implementation" (README 40–69): every alias in the table elaborates against the pinned Tau Ceti; `IsDemushkin`, `demushkinRank`, `demushkinCharacter`, `HasPrescriptionProperty`, `cupFp`, `fpPairing`, `completedGroupAlgebra`, `IsCompactModule`, `unitsPrincipal`, `unitsPlusMinus`, `zHat`, `demushkinD0` with `d0A`, `d0S`, `d0Y`, `negThreeUnit`, `standardD0Orientation` are `abbrev`s of the Tau Ceti declarations. The claim that each Tau Ceti-proved milestone is a closed proof is false for 18 declarations (R03), and the table omits the ten names of R02.
- "The carrier is Mathlib's, and its calculus is the Profinite Cohomology roadmap's" (README 691): `continuousCohomology` is at `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean` (path now correct); the ProfiniteCohomology layer numbers cited as PC-1, 2, 3, 5, 7, 10, 11, 12 match that roadmap's headings on main (lines 630, 725, 777, 960, 1168, 1549, 1739, 2091); the ten ProfiniteCohomology target names cited (`cd_p_le_iff_finite_pPrimary`, `cd_p_le_iff_boundedExponent`, `cd_p_le_of_isClosed`, `cd_p_eq_of_index_not_dvd`, `exists_openSubgroup_res_eq_zero_of_res_eq_zero`, `corestriction_comp_res`, `ofDiscreteModuleRes`, `ofDiscreteModule_isSmoothDiscrete`, `isPPrimaryTorsion_continuousCohomology`, `cup_gradedComm`) all occur in main's `TauCetiRoadmap/ProfiniteCohomology/README.md` and `Suggested.lean`, and its `cd_p` is `TauCeti.cohomologicalDimensionAt.{u}` (line 3015), as this README now says.
- "Theorem" targets, against `labute1967` and `serre1963bourbaki`: Thm 4 (`labute1967` lines 557–559: a unique continuous `χ` with the Prop. 6 properties) supports the canonical-character theorem at README 1290; its character table (lines 566–568) matches README 2415–2418; Cor. (iii) (lines 605–609) matches the image table at 2420–2422, including `U₂[v₂(α)]` when `v₂(α) < f`; Thm 1 (lines 56–66, `N ≥ 1` for form (3), `N ≥ 2` for form (4), `f ≥ 2` or `∞`, images `U₂[f]` and `{±1} × U₂(f)`) matches README 2476–2481; Remark 2 (lines 71–76) matches the existence statement 2503–2507 with the pro-`p` hypothesis stated there; Thm 2 (lines 80–82, `r, r' ∈ Fᵖ(F,F)`, an automorphism sends `r` to `r'`) now matches Lean 1507; Prop. 3 (lines 311–317) matches the cup-matrix bullet at 1816–1823; Prop. 6 (lines 532–538: surjectivity of `H¹` reduction, prescribability into `I/pⁱ`, into `I`) is now cited for 1 ⟺ 3 only; §4 Note and §4.1 (lines 636–689: `w`-basis with `f = v₂(α) < g`, `y₂ = w₂^{a⁻¹}`, `y₄ = w₄w₂^{−b}`, `r̄ = (1+α+(1+T)^a)ȳ₁ + (2^g+(1+T)^{ab}−1)ȳ₃`, the division lemma, `ψ₁(−2−2^f) = ψ₂(−2−2^f) = 0`, `φ₁(0)` a unit and `φ₂(0) ∈ 2ℤ₂`, `r̄ = (2+2^f+T)z̄₁`, `e ∈ (X,X) ∩ F₃`) match README 2083–2123 and the Lean docstrings at 1211–1226; §4.2 (lines 818–870: `{±1} × U₂(f)`, `n ≥ 4`, `α ∈ 4ℤ₂`, `f ≤ v₂(α)`, `y₂ = w₂w₄^{−b}`, `r = z₁²(z₁,z₂)z₃^{2^f}(z₃,z₄)e₁`, `e₁ = (z₁,z₃)^a e₁'`, `x₂ = z₂z₃^{−a}` giving `(x₁,x₃)^{2a}`) match README 2131–2143; Thms 5 and 6 (lines 692–696, 871–875) match the two branch statements. Page mapping: PDF page `N` is printed page `105 + N`, so §4.1 is pp. 122–123 and §4.2 pp. 126–128 as cited. Serre: Thm 3.1 (`serre1963bourbaki` lines 88–93, `q ≠ 2`, `n` even), Thm 3.2 (103–107, `n = 2m+1`, `m ≥ 1`, `n = 2` separately at 108), §9.1 (285–299: finite modules killed by `p`, `α_i` isomorphisms for `ℤ/p`, dévissage, co-effaceability from `G` infinite, right exactness of `H²`), §9.2 (300–306, open subgroups, `n' − 2 = d(n − 2)`), §9.3 (307–326, dualizing module, finite `p`-primary `M`, the surjectivity characterization) support README 1358–1365, 1375–1386, 1392–1408, 1436–1462 and 2516.

**Adversarial table.** Values computed on each side; "ok" means no change.

| Statement | Instance | Computed | Result |
|---|---|---|---|
| `nonempty_continuousMulEquiv_freeProP_of_openSubgroup` (Lean 2688) | `n=1`, `U = p^kℤ_p` | index `p^k`, rank `1 + p^k·0 = 1` | ok |
| same, `hn` | `n=0`, `U=⊤` | `1 + 1·(0−1) = 1` in `ℕ` but `U` trivial has rank `0` | `hn` needed and present |
| same | `n=2`, index `2` | `1 + 2·1 = 3` | ok (Schreier) |
| `cd_p_le_iff_elementaryAbelian_of_isProP` at `n=0` | pro-`p` `G` | `cd ≤ 0` ⟺ `H¹(G,M)=0` for trivial elementary `M` ⟺ `Hom(G,𝔽_p)=0` ⟺ `G=1` | ok |
| `res_injective_of_isProPSylow` at `n=0` | any | `M^G → M^P` is an inclusion | ok |
| `IsDemushkin.tateAlpha2_bijective`, `M=𝔽_p` | infinite `G` | `H²(G,𝔽_p) → Hom(𝔽_p, H²)`, both one-dimensional | ok |
| same without `Infinite` | `G=C₂`, `M=𝔽₂[C₂]` | `H²(C₂,M)=0`, `H⁰(C₂,M^∨)=𝔽₂`, so `Hom` has order `2` | `Infinite` needed and present |
| `demushkinRank_openSubgroup_sub_two` | `G=ℤ_p²`, index `p` | `2−2 = p·0` | ok |
| same | `G=D₀` (`n=3`), index `2` | `n(U)−2 = 2·1`, `n(U)=4` | ok = Serre 9.2 |
| `demushkinQ` (Lean 579) | `D₀`, `ℤ_p²`, `ℤ/2` | torsion of `D₀^{ab}=ℤ₂²×ℤ/2` has `2` elements → `2`; `ℤ_p²` torsion-free → `0`; `ℤ/2` → `2` | ok; equals `TauCeti.demushkinQ` propositionally only (R02) |
| `isDemushkin_marked_of_q_two_rank_two` | `a=4` | `u=3`; `χ(x₂)·5=−1` so `χ(x₂)=−1/5`; `−1/5 = −1·5`, `5=(−3)^λ` with `v₂(log 5)=v₂(log(−3))=2` so `λ` odd, hence `−1/5 ∈ closure⟨3⟩=U^[2]` | consistent |
| same, `a=0` | — | `hrange` demands `(u:ℤ₂) = −1+2⁰ = 0`, not a unit | unsatisfiable, as the docstring says |
| `isDemushkin_marked_of_q_two_even` without `hn` | `n=2`, `⟨x₁,x₂∣x₁⁶(x₁,x₂)⟩`, `a=4`, `f=3` | fourth generator `1`, clause reads `1−8=1` | false; `hn` needed and present |
| `splitBase_dvd_iff` | `f=0` | `1+T` a unit: both sides true | ok |
| same | general | `a+Sb = (2^f+T)(c+Sd)` ⟺ `a=(2^f+T)c ∧ b=(2^f+T)d`, `{1,S}` free over `ℤ₂[[T]]` | true, not a headline (R06) |
| `cd_p_le_one_of_isClosed_freeProP` | `H=⊥`, `H=⊤` | `0 ≤ 1`, `≤ 1` | ok |
| `cupFp_gradedComm` at `p=2` | — | `a∪b = −b∪a = b∪a` | ok |
| Golod–Shafarevich | `C_p`; `(ℤ/p)²`; `1` | `4·1>1`; `4·3>4`; `0>0` false | `Nontrivial` needed and present |
| `not_injective_fromFreeProC_finiteGroupClassP` | finite `S` | map is an isomorphism (`freeProCPointed.equivFreeProC`) | `Infinite S` needed and present |
| relator-class coefficient, procyclic branch (Lean 1227) | Labute `2+2^f+T = 1+2^f+γ`, `γ` class of `y₂`, `χ(y₂)=−(1+2^f)^{−1}` | Tau Ceti's action is Labute's at `γ^{−1}`; `γ^{−1}` is the class of any `y` with `χ(y)=−(1+2^f)` | matches `hy` |
| relator-class coefficients, split branch (Lean 1258) | `2^f+T = (2^f−1)+γ`, `S=S^{−1}` | `(2^f−1)+γ^{−1}`, `γ^{−1}` class of `y` with `χ(y)=1−2^f` | matches `hs`, `hy` |
| `exists_labuteRelatorClass_eq_smul…` hypotheses | `F=ℤ₂`, `χ=1`, `r` a generator | would ask `1=(2+2^f)z`, impossible mod `2` | Demushkin hypotheses needed and present |
| `δ_1` at `j=1` (README 1588–1592) | `p=3`, `r=(x₁,x₂)`, `x_i↦x_i²` | class `4r̄`, deviation `3r̄=0`; `j≥2` formula gives `2r̄≠0` | ok |
| even-rank tail (README 2375–2378) | `q=2`, `w=(π^{j−1}ξ₂,π^{j−1}ξ₂,0,…)` | `δ_j(w)=π^jξ₂` since `(x₂^{2^{j−1}},x₂)=1` | ok |
| cup matrices (README 2328–2329) | `p=2`, `n=2` | `x₁²(x₁,x₂)`: `[[1,1],[1,0]]`, det `1`; `x₁²`: det `0` | ok |
| `U^[f]` coefficient witness (README 2124–2130) | `n=4`, `α=4`, `g=∞`, `F→D₁₆` | `ℓ(r̄)=4`, `ℓ((1+γ)z)=0`, `ℓ((5+γ)x̄₁)=4` | ok |
| detector value (README 2234) | split branch, `f=2` | `D₄((x₂,x₄)) = (−1)(1−2^f)(−2) = −6`, half odd | ok |
| deficiency (README 999–1002) | `⟨x∣x^p,x^{p²}⟩` | `#S−#R=−1 ≤ 0 = d−r` | ok |
| Tate duality needs `G` infinite (README 1403–1407) | `C₂`, `I/4` | `H²` has order `2`, not `4` | ok |
| `IsPGroup.exists_maximal_subgroup_normal` | Mathlib pin | absent; `Subgroup.isCoatom_iff_index_eq_prime` at `Nilpotent.lean:1255` | R04 |
| `demushkinQ hG ≠ 2` vs `TauCeti.demushkinQ hG ≠ 2` | probe line 1417 | type mismatch | R02 |

**Library declarations opened at the pin** (Tau Ceti unless marked): `cupFp_gradedComm` (`Cup/TrivialFp/Basic.lean:191`); `range_demushkinCharacter_of_equiv` (`Demushkin/Character/Basic.lean:300`); `exists_labuteRelatorClass_eq_smul_of_range_eq_procyclicClosure`, `…_add_smul_of_range_eq_unitsPlusMinus` (`NormalForm/LabuteModule/Relator.lean:82,149`); `isDemushkin_marked_of_q_ne_two`, `…_two_odd`, `…_two_even`, `…_two_rank_two` (`NormalForm/Marked.lean:120,152,265,298`); `freeProP.exists_continuousMulEquiv_apply_eq_of_range_demushkinCharacter_eq` (`NormalForm/Uniqueness.lean:133`); `ProfiniteGroupExtension.exists_continuous_monoidHom_of_contCohomologyClass_map_eq`, `contCohomologyClass_map_eq_of_continuous_monoidHom` (`GroupExtension/Cohomology.lean:803,822`); `IsProP.cohomologicalDimensionAt_le_iff_forall_smul_eq_self` (`ProP/CohomologicalDimension.lean:122`); `IsProP.nonempty_continuousMulEquiv_freeProP_of_cohomologicalDimensionAt_le_one` (`Free/Serre.lean:81`); `cohomologicalDimensionAt_eq_of_isOpen_of_ne_top` (`CohomologicalDimension/OpenSubgroup.lean:111`); `ContinuousCohomology.res_injective_of_forall_not_dvd_index` (`IndexNotDvd.lean:92`); `IsProPSylow.cohomologicalDimensionAt_eq` (`Sylow/CohomologicalDimension.lean:81`); `freeProP.cohomologicalDimensionAt_le_one_of_isClosed` (`Free/ClosedSubgroup.lean:101`); `freeProP.nonempty_continuousMulEquiv_freeProP_openSubgroup_index` (`Free/OpenSubgroup.lean:112`); `freeProCPointed.not_injective_fromFreeProC` (`Free/Pointed/Rank.lean:163`); `IsDemushkin.openSubgroup`, `demushkinRank_openSubgroup_sub_two`, `demushkinCharacter_openSubgroup` (`Demushkin/OpenSubgroup.lean:146,201,241`); `IsDemushkin.cohomologicalDimensionAt_eq_two` (`Demushkin/CohomologicalDimension.lean:60`); `IsDemushkin.dualityMap0/1/2_bijective` (`Demushkin/Duality/Basic.lean:191,153,220`); `IsPGroup.sq_topologicalGeneratorRankNat_lt_four_mul_finrank_cohomFp_two` (`ProP/GolodShafarevich.lean:79`); `demushkinQ` (`Demushkin/QInvariant.lean:97`); `labuteComm`, `demushkinWordNeTwo`, `demushkinWordTwoOdd`, `demushkinWordTwoEven`, `demushkinWordTwoRankTwo` (`NormalForm/Basic.lean:93,164,201,274,291`); `freeProPGen` (`Free/ProP.lean:538`); `presentedProPGen` (`Presentation/Basic.lean:952`); `labuteRelatorClass` (`Labute/RelationModule.lean:122`); `demushkinRelatorCharacter` (`Labute/RelatorCharacter.lean:46`); `gradedPow_smul_zero` (`LowerCentralSeries/Graded/Basic.lean:797`, so the worker's "found nowhere" lead for it is a false lead); `completedGroupAlgebra.isMulCommutative_iff` (`CompletedGroupAlgebra/Basic.lean:331`); Mathlib `Subgroup.isCoatom_iff_index_eq_prime` (`GroupTheory/Nilpotent.lean:1255`). A further 44 Tau Ceti names cited in the README's "In Tau Ceti" lines (duality, prescription, crossed homomorphisms, span and approximation theorems, the dyadic algebra, the `ℤ₂ˣ` classification, the inverse-system lemma) were resolved by grep to their files; none is missing.

**Cross-roadmap citations resolved.** `ProfiniteCohomology` Layers 1, 2, 3, 5, 7, 10, 11, 12 and its ten cited targets, all on main; `LocalGaloisGroups` and `ProfiniteArithmetic` on main under `Completed/`; the worker's nine "found nowhere" leads are eight ProfiniteCohomology target names (present on main) and `gradedPow_smul_zero` (present at the pin); only `IsPGroup.exists_maximal_subgroup_normal` is genuinely missing (R04).

**Ownership against open work.** `roadmaps grep -i 'IsDemushkin\|Demushkin group' --lean-only` reports no match on main or in any open roadmap pull request outside this one, so no open pull request builds a Demushkin or pro-`p` carrier. The owner of every object here on main is the archive `Completed/ProfiniteProPGroups/` (R01). Ownership was not checked against open pull requests whose files the brief does not provide.

**Headline theorems.** The README's headlines (the classification in marked form, Labute Thm 2, Tate's `cd_p = 2`, the open-subgroup theorem in three clauses, Serre's theorem both ways, the Sylow equality, Golod–Shafarevich, Nielsen–Schreier for open subgroups, the Layer 10 non-injectivity) are all stated; none is forced through a stand-in; the docstring names none as unstatable, and none is.

## Not verifiable

- **NSW, Cohomology of Number Fields, 2nd ed.** ((3.9.1), (3.9.4), (3.9.5), (3.9.7), (3.9.10), (3.9.13), (3.9.15), (3.9.19), (1.6.10), (3.3.5), (3.3.6), and the claim at README 2491 that p. 417 prints `x₂²(x₁,x₂)x₃^{2^f}⋯`): the authors' index page says "a pdf-file of the book, free for non-commercial use, can be downloaded here: Version 2.3, May 2020", but the sources service (this run, key `nsw2e`) and the previous review's three attempts all receive the index page in place of the PDF. Recorded in this job's `needs-references.toml`.
- **Ribes–Zalesskii, Profinite Groups**; **Serre, Galois Cohomology**; **Koch, Galois theory of p-extensions**; **Washington, Cyclotomic Fields**; **Dixon–Formanek–Poland–Ribes 1982**; **Fried–Jarden**: paywalled, cited by locator only; none read.
- The two `labuteRelatorClass` theorems and `isDemushkin_marked_of_q_two_rank_two` were checked against Labute and against the Tau Ceti statements, not re-derived.

## Source issues

- none

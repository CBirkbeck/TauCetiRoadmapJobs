# GATE-ProfiniteProPGroups~3: answers to the review of `c71bff1`

Repairs are in commit `67a8d3d4` on top of `c71bff1`. Only `TauCetiRoadmap/ProfiniteProPGroups/README.md`
and `TauCetiRoadmap/ProfiniteProPGroups/Suggested.lean` changed.

## H01 (CBirkbeck) — answered
The claim is correct. `git ls-tree origin/main` lists the roadmap only under `Completed/ProfiniteProPGroups/`; the merge base is still `0e8b058a`, where the folder lived under `TauCetiRoadmap/`. So merging this branch re-adds a module that declares the same `TauCetiRoadmap.ProfiniteProPGroups.*` names as the archive. Fixing that means rebasing onto main and then either revising `Completed/ProfiniteProPGroups/` or opening a `ProfiniteProPGroupsPartII`. Both moves fall outside the two files this repair may edit, and the choice belongs to the merge decision. What this round does is bring the content in line with the archive's discipline (H02, H03): every alias is Tau Ceti's and no headline is left with `sorry`. Whichever destination is chosen, nothing the archive discharges is undischarged here.

## H02 (CBirkbeck) — applied
`Suggested.lean`: the definitions `demushkinQ`, `labuteRelatorClass`, `demushkinRelatorCharacter`, `labuteComm`, `freeProPGen`, `presentedProPGen`, `demushkinWordNeTwo`, `demushkinWordTwoOdd`, `demushkinWordTwoEven` and `demushkinWordTwoRankTwo` were standalone `def`s. Each is now an `abbrev` of the Tau Ceti declaration of the same name. `demushkinQ` takes Tau Ceti's binders, with no `CompactSpace`/`TotallyDisconnectedSpace`. `labuteRelatorClass` takes a continuous `χ : F →ₜ* ℤ_[p]ˣ` and has values in `TauCeti.labuteE χ`; before, it took any `χ : F →* A`. The README "One implementation" table gains rows for all ten names. `demushkinRelatorCharacter_mem_ker` is now the Tau Ceti theorem. The derivative lemmas `freeProPGen_of_le`, `presentedProPGen_of_le` and `demushkinWordTwoEven_two` are deleted, and docstrings now cite `TauCeti.presentedProPGen_eq_one_of_le` and `TauCeti.demushkinWordTwoEven_two`. With these aliases, `isDemushkin_marked_of_q_ne_two` closes by `TauCeti.isDemushkin_marked_of_q_ne_two hG hq`.

## H03 (CBirkbeck) — applied
I added the nine imports named in the review. All 20 sorried declarations are now closed proofs from the Tau Ceti theorems the review lists, or deleted (`splitBase_dvd_iff`, see H06). `grep sorry Suggested.lean` finds only the docstring word. A few closures need more than the bare term:
- `isDemushkin_marked_of_q_two_rank_two` uses the archive's bridge, which computes `2 ≤ v₂(a)` from `4 ∣ a`.
- `nonempty_continuousMulEquiv_freeProP_of_openSubgroup` uses `TauCeti.freeProP.nonempty_continuousMulEquiv_freeProP_openSubgroup_index`, with `Nonempty (Fin n)` from `n ≠ 0`.
- The two `ProfiniteGroupExtension` lemmas pass named arguments, because Tau Ceti's binder order is not `X f hf Y`.

The README sentence at line 66 is reworded to say what is now true: every headline in `Suggested.lean` is proved in Tau Ceti and the file has no `sorry`. The module docstring says the same.

## H04 (CBirkbeck) — applied
README Layer 3 Frattini bullet: M `IsPGroup.exists_maximal_subgroup_normal` → M `Subgroup.isCoatom_iff_index_eq_prime`, with its `Group.IsNilpotent` hypothesis supplied by M `IsPGroup.isNilpotent`. Both are checked at the pin: `Mathlib/GroupTheory/Nilpotent.lean` lines 1255 and 1282.

## H05 (CBirkbeck) — applied
Each statement below now omits a hypothesis it does not need, and its docstring says why:
- `hq` is dropped from both `exists_labuteRelatorClass_*`, `isDemushkin_marked_of_q_two_odd`, `…_even` and `…_rank_two`. Each `hrange` puts `-1` or a unit `≡ 3 mod 4` into `Im χ`. For `q ≠ 2` the image is `U^(f)` with `2^f = q ≥ 4`, or trivial, so `q = 2` is forced. Example: `q = 4` gives `χ(x₂) = (1 − 4)⁻¹ ≡ 1 mod 4`.
- `hn : 2 ≤ demushkinRank hG` is dropped from `isDemushkin_marked_of_q_ne_two`. The only Demushkin group of rank 1 is `ℤ/2` at `p = 2`, which has `q = 2`.
- `hrank` is dropped from `exists_continuousMulEquiv_map_demushkinRelator`. Both relators lie in `Φ(F)`, so both quotients have rank `n`.

The README's module-statement paragraph and the marked-classification bullet now say the same.

## H06 (CBirkbeck) — applied differently
- All 90 `example`s are deleted, together with `splitBase_dvd_iff` and the two abbreviations it alone used (`splitInvolution`, `splitBase`).
- Under the same rule I also deleted `labuteRelatorClass_eq_sum`, a one-step consequence of Mathlib's `Submodule.mem_span_range_iff_exists_fun`.
- Section shells and section docstrings left empty by the deletions are removed.
- The README keeps the divisibility statement as prose under the dyadic bullet: `2^f + T ∣ ψ₀ + Sψ₁ ⟺ 2^f + T ∣ ψ₀ ∧ 2^f + T ∣ ψ₁`.
- About 25 README pointers "(`Suggested.lean`)" and "`Suggested.lean` has a closed proof of each of these" named deleted examples. They are removed or now point to Tau Ceti.

What differs from the suggestion: the proved headline theorems named in the README (Sylow, Frattini, generator rank, `D₀` orientation, `cd_p`, Nielsen–Schreier and similar) are kept, not cut down to the consumer-cited ones. They are this roadmap's stated end results and the README names each one, so they are the acceptance test rather than padding. `Suggested.lean` goes from 2912 to about 1850 lines.

## H07 (CBirkbeck) — answered
The finding is correct: the folder has no `sources.toml`. This repair may edit only `README.md` and `Suggested.lean`, and the manifest is written by the sources service in a job that edits it. So the file is not created here. The entries the review lists still need recording by that job: `labute1967`, DOI 10.4153/CJM-1967-007-8, scheme `page`; `serre1963bourbaki`, Numdam `SB_1962-1964__8__145_0`, scheme `section`; and the paywalled texts as `uncertified`.

## Build and gate

- `lake build TauCetiRoadmap.ProfiniteProPGroups.Suggested`: **Build completed successfully (9471 jobs)**. There are no errors and no warnings. The output has 20 `info:` lines, one for each `#check` listed below.
- Repair of the three linter warnings from the earlier build:
  - The `ExtensionLifting` section `variable` line has lost `[IsTopologicalGroup M] [ContinuousSMul G M]`. Only the two `ProfiniteGroupExtension` theorems use that section, and neither needs these instances, because the Tau Ceti declarations they apply don't ask for them. The statements become slightly more general; the README's Layer 5 prose names neither instance.
  - `cd_p_eq_of_isOpen` is now preceded by `omit [Fact p.Prime] in`. `TauCeti.cohomologicalDimensionAt_eq_of_isOpen_of_ne_top` holds for every profinite `G` and every `p`, so the statement is unchanged apart from that binder.
- Repair of `readme-ids-missing=20`: all 20 names are real, fully qualified Tau Ceti declarations at the pin (`358314d`). Examples: `TauCeti.IsProP.eq_top_of_forall_not_le_openNormalSubgroup_index_eq` in `Topology/Algebra/Group/Profinite/ProP/Burnside.lean`, and `TauCeti.freeProCPointed.convergesToOne_range_of_coe` in `Free/Pointed/Basic.lean`. The check flagged them because their namespace's last component (`IsProP`, `IsProPSylow`, `IsTopologicallyFinitelyGenerated`, `completedGroupAlgebra`, `freeProP`, `freeProCPointed`) is also the name of one of this roadmap's aliases. The names were not deleted from the README, since its supplier contracts must cite library inputs by exact name. Instead each one is pinned by a `#check @TauCeti.…` line under a `/-! ### Tau Ceti inputs named in the README -/` comment at the end of `TauCetiRoadmap/ProfiniteProPGroups/Suggested.lean`. All 20 elaborate at the pin, and the check now returns no names.
- `tauceti-roadmap … gate … --base origin/main`: **not completed**. It stopped again before any check with `GitHub: rate limited: gh api repos/TauCetiProject/TauCetiRoadmapJobs/contents/merge-order/ORDER.txt … (HTTP 403)`. The worker must rerun it.
- Depcheck (`--movable`): `depcheck: 157 roadmaps, 1084 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- README ↔ Lean names: a script compared the declarations at `c71bff1` and at the new head. Removed: `splitBase`, `splitBase_dvd_iff`, `splitInvolution`, `labuteRelatorClass_eq_sum`, `freeProPGen_of_le`, `presentedProPGen_of_le`, `demushkinWordTwoEven_two`. No README backticked name refers to any of them.
- Binder check: I did not run a `#check @name` scratch elaboration, because the brief allows only `lake build` as a Lean command. Every changed declaration carries its binders in its own signature. The marked theorems take `p`, `G` and `G`'s instances from section variables, and all of these occur in their types through `IsDemushkin p G`.
- Ownership: no new construction was added. Every changed declaration is an alias of, or a proof from, a pinned Tau Ceti declaration.

## Adversarial pass on changed statements

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| `q = 2` forced by the image (H05, both branch theorems, three marked theorems) | `Im = U^[2]`; `Im = {±1}×U^(3)`; `q = 4`; `q = 0` | `-1+4 = 3 ≡ 3 mod 4`; `-1 ≡ 3 mod 4`; `(1−4)⁻¹ = −1/3 ≡ 1 mod 4`, `Im = U^(2)`; `χ(x₂) = 1`, `Im = 1` | a `≡ 3 mod 4` unit is never in `U^(f≥2)` or `1`, so `q = 2` | `hq` dropped |
| no rank hypothesis at `q ≠ 2` | `ℤ/2`, `p = 2`; `ℤ/3`, `p = 3`; `ℤ_p` | `dim H¹ = dim H² = 1`, `x∪x ≠ 0`, torsion of `G^ab` has 2 elements, `q = 2`; `x∪x = 0` (odd degree, `p` odd), not Demushkin; `H² = 0`, not Demushkin | rank 1 forces `q = 2` | `hn` dropped |
| Thm 2 without `hrank` | `n = 2`, `r = (x₁,x₂)`, `r' = x₁^{p}(x₁,x₂)` | both in `Φ(F)`; `d(F/(r)) = d(F/(r')) = 2` | ranks equal automatically | `hrank` dropped |
| dyadic divisibility (README prose) | `ψ₀ = 2^f+T, ψ₁ = 0`; `ψ₀ = 1, ψ₁ = 0`; `ψ₀ = 0, ψ₁ = 2^f+T` | LHS true / RHS true; LHS false (the quotient's constant term would be `2^{−f}` in `ℤ₂[C₂]`) / RHS false; LHS true / RHS true | coordinates on the basis `{1, S}` are unique | prose replaces the Lean lemma |
| `demushkinQ` alias | `D₀`; `ℤ_p × ℤ_p` | `TauCeti.nat_card_torsion_topologicalAbelianization_demushkinD0`: 2; torsion-free, so 0 | matches Labute's `q` | `def` → `abbrev` |
| `cd_p_eq_of_isOpen` | `G = ℤ_p, U = pℤ_p`; `G = ℤ/2, U = 1, p = 2` | `1 = 1`; `cd_2(ℤ/2) = ∞`, excluded by `hfin` | true; pro-`p` is not needed | `hG` → `_hG`, docstring note |
| Frattini Mathlib input (H04) | `C_p²`; `Q₈` | maximal subgroups `C_p` of index `p`; three subgroups `C₄` of index 2 | matches `Subgroup.isCoatom_iff_index_eq_prime` | citation fixed |
| `labuteRelatorClass` on `→ₜ*` | χ continuous versus a bare `→*` | `TauCeti.labuteE χ` needs `χ.isClosed_ker`, which a bare homomorphism lacks | the narrower input is the intended one | signature narrowed to Tau Ceti's |
| Layer 5 lifting lemma and its converse, without `[IsTopologicalGroup M] [ContinuousSMul G M]` | (a) `G = ℤ/p`, `M = N = 𝔽_p` with trivial action, `f = id`, `X = Y = ℤ/p²`; (b) the same `G`, `M`, `N` with `f = 0`, `X = ℤ/p²` (class `c ≠ 0`), `Y = 𝔽_p × ℤ/p` (split, class 0) | (a) `φ = id`, and the classes `c = c`; (b) the pushforward class is `0·c = 0`, which is `Y`'s class, and `φ(e) = (0, π e)` is a continuous lift restricting to `0` on the kernels | both directions hold in each case. The proofs are Tau Ceti's term proofs, and they elaborate with the instances dropped | instances removed from the section `variable` line |
| `cd_p_eq_of_isOpen` with `Fact p.Prime` omitted | `p = 4` (junk value), `G = ℤ_2`, `U = 2ℤ_2` | `cd_4` of both sides is computed by the same definition, and Tau Ceti's lemma has no primality hypothesis, so `cd_4(U) = cd_4(G)` follows from `hfin` | true; the pro-`p` hypothesis was already unused | `omit [Fact p.Prime] in` |

## Suspicious passages
None. The review text contained no instructions outside its findings.

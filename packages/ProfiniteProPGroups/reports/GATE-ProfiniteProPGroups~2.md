# GATE-ProfiniteProPGroups~2: answers to the review of `46f8016`

All points come from one review comment by CBirkbeck (findings F01–F09). Points are numbered in
the order they appear: a finding that makes several points has one entry per point. Repairs are
in commit `c71bff13` on the pull-request branch, which has not been pushed.

## H01 (CBirkbeck) — answered

The finding is correct, and repairing it is outside what this job may edit. `git ls-tree -r origin/main`
(`ffcc9d3`) lists the roadmap only under `Completed/ProfiniteProPGroups/`, and that copy's
`Suggested.lean` declares the same `TauCetiRoadmap.ProfiniteProPGroups.*` names. The branch's
merge base `0e8b058a` predates the archive commit `14f77719`. A rebase, deleting the folder, a
revision of `Completed/ProfiniteProPGroups/`, or a `ProfiniteProPGroupsPartII` are each folder- or
history-level operations, and this job may only edit the two files under
`TauCetiRoadmap/ProfiniteProPGroups/`. Whether to close this pull request or redirect its Layer 9
material into a Part II is a maintainer decision. Until then, every declaration of this branch's
`Suggested.lean` collides with the archive's fully qualified names. The repairs below (H02–H15)
bring this copy closer to the archive (for example, `IsDemushkin` is an `abbrev` of
`TauCeti.IsDemushkin` in both) but do not remove the duplication.

## H02 (CBirkbeck) — applied

`cd_p` is now `TauCeti.cohomologicalDimensionAt.{u}` for `G : Type u`. This matches main's
`TauCetiRoadmap/ProfiniteCohomology/Suggested.lean` lines 3019–3020, which I re-read at `origin/main`.
`Suggested.lean` line 70 onward and the Layer 6 docstring changed from `.{0}` to `.{u}`.
`cd_p_le_iff_elementaryAbelian_of_isProP`, `isFree_of_cd_p_le_one`, `cd_p_eq_of_isOpen`,
`cd_p_eq_of_isProPSylow` and `cd_p_eq_two_of_isDemushkin` are now stated at `.{u}`. The statements
about `freeProP p (Fin n)` and its closed subgroups, which live in `Type`, stay at `.{0}`, which is
`cd_p` there. The README universe-comparison paragraph (old lines 1019–1037) and the "universe
comparison" items in the `*Needs:*` lines of Layer 6 and Layer 7 (old lines 1099–1100 and
1366–1368) are deleted; the new text is README line 1023. Two statements are now closed by Tau Ceti:
`cd_p_freeProP_le_one` (line 2505, `TauCeti.freeProP.cohomologicalDimensionAt_le_one`) and
`cd_p_eq_two_of_isDemushkin` (line 2663, `TauCeti.IsDemushkin.cohomologicalDimensionAt_eq_two`).
`isFree_of_cd_p_le_one` stays `sorry`. The reason is that Tau Ceti's theorem needs a generating
type in the universe of `G`, while the statement uses `Fin d(G) : Type`, so closing it needs a
cross-universe transfer of free pro-`p` groups, which is not a single term.

## H03 (CBirkbeck) — applied

Three statements are added, each closed by the Tau Ceti theorem the review names:
- `IsDemushkin.demushkinRank_openSubgroup_sub_two` (line 2638): `(n(U) : ℤ) − 2 = [G : U]·(n(G) − 2)`.
- `IsDemushkin.demushkinCharacter_openSubgroup` (line 2650): `χ_U = χ_G.comp (TauCeti.ContinuousMonoidHom.subgroupSubtype U)`.
- `sq_topologicalGeneratorRankNat_lt_four_mul_finrank_cohomFp_two` (line 2438): `d(G)² < 4·dim H²(G, 𝔽_p)` for a nontrivial finite discrete `p`-group.

`IsDemushkin.openSubgroup` (line 2627) is now the Tau Ceti term. The README open-subgroup bullet
(line 1436) and the Golod–Shafarevich bullet (line 1007) name the new declarations. The module
`ProP/GolodShafarevich` is imported; it exists at the pinned Tau Ceti.

## H04 (CBirkbeck) — applied

`IsDemushkin` changed from a five-field structure to
`abbrev IsDemushkin p G := TauCeti.IsDemushkin p G` (line 560). `IsDemushkin.iff_tauCeti` is
deleted, and so is the README paragraph "Compare the roadmap predicate and cup with Tau Ceti".
The README's dependent references to that comparison are deleted too: the `*Needs:*` items "the
explicit comparisons with Tau Ceti" and "the comparison targets above", and "first compare the
roadmap cup and predicate".

Following the same pattern, `demushkinRank` and `demushkinCharacter` are now `abbrev`s of
`TauCeti.demushkinRank` and `TauCeti.demushkinCharacter` (lines 567 and 599), and
`demushkinCharacter_unique` is closed by `TauCeti.HasPrescriptionProperty.eq_demushkinCharacter`.
`tateAlpha2_bijective` and `openSubgroup` now consume the Tau Ceti theorems directly.

The `attribute [local instance 2000] Ring.toAddCommGroup` (line 2591) is kept. Deleting it makes
`tateAlpha2_bijective` fail with "failed to synthesize instance" (tested by building without it),
because `TauCeti.ContCohomology.dualityMap2` elaborates at that instance path. Tau Ceti's own
`Demushkin/OpenSubgroup.lean` line 80 carries the same attribute.

## H05 (CBirkbeck) — applied differently

Deleted:
- `constantCoeff_of_eq_sub_C_mul` and `not_exists_complement_powerSeries_two_X`;
- `twoPowENat_coe` and `twoPowENat_top`;
- `splitInvolution_isZeroDivisor`;
- `demushkinWordTwoOddPadic_natCast` and `demushkinWordTwoEvenPadic_natCast`;
- `mem_gradedPieceOf_iff` (with H06);
- `IsDemushkin.isTopologicallyFinitelyGenerated`;
- `not_marked_fourth_generator_of_rank_two` and the `example` after it.

The README keeps each of these facts as prose without a backticked name. For example,
`(1 − S)(1 + S) = 1 − S² = 0`, and the constant term `ψ(0) = −c·φ(0)`. The same pattern also
removes the one-line `demushkinCharacter_continuous` and `demushkinCharacter_hasPrescriptionProperty`,
which no README line names.

Two of the listed items are kept, each closed by a Tau Ceti term:
- `fpPairing_bil` (line 487) is consumed by name downstream. Main's
  `Completed/LocalGaloisGroups/README.md` lines 109, 119, 316 and 362 cite it, and that roadmap's
  `Suggested.lean` line 463 runs `rw [ProfiniteProPGroups.fpPairing_bil, …]`. It is also in this
  README's frozen downstream table.
- `existsUnique_hasPrescriptionProperty` (line 590) is Labute's Theorem 4, a headline result of
  Layer 7 rather than API.

## H06 (CBirkbeck) — applied

All thirteen listed route lemmas are deleted from `Suggested.lean`, together with the abbreviation
`gradedPieceOf` and the "Basis corrections" and "character-preserving iteration" sections (old
lines 1478–1892). The README keeps the route as prose. Where the parenthetical names had a Tau Ceti
counterpart, they now cite it, each checked at the pin:
- `TauCeti.gradedPieceOf` and `TauCeti.mem_gradedPieceOf_iff` (`LowerCentralSeries/Graded/Subgroup.lean:65,73`);
- `TauCeti.IsCrossedHom.pow_dvd_apply_of_mem_pLowerCentralSeries` (`ProP/CrossedHom.lean:109`);
- `TauCeti.freeProP.crossedHom` (`Free/Prescription.lean:94`).

The others are removed. The closing paragraph (line 2296) now states the hypothesis form of Tau
Ceti's iteration theorems, read at `Demushkin/NormalForm/Kernel/Approximation.lean:206`: a relator
in the class of `r₀(x)` modulo `λ₂`, lying in `X`, and killed by the `D_i` for `i ≠ 2`. It also
says these milestones are the route to `isDemushkin_marked_of_q_two_even`, not headlines.

## H07 (CBirkbeck) — applied

Every `[TotallyDisconnectedSpace (freeProP …)]` binder is dropped, and so is every
`[TotallyDisconnectedSpace (presentedProP …)]` binder, which follow the same pattern. That is six
of each left after H06 removed the route lemmas, which carried the rest of the eighteen the
review counted. In a scratch file at the pins, `example (p n : ℕ) : TotallyDisconnectedSpace (TauCeti.freeProP p (Fin n)) := by infer_instance`
and the same check for `TauCeti.presentedProP p (Fin n) {r}` both elaborate.

## H08 (CBirkbeck) — applied

README line 1207 now says that `IsDemushkin` is `TauCeti.IsDemushkin`. Like that predicate, it is
defined on every topological group with no compactness or total-disconnectedness binder, and its
`IsProP` field is what confines it to pro-`p` groups. The `IsDemushkin` docstring (line 560) says
the same. The elaborated signature confirms that there are no such binders:
`(p : ℕ) → [Fact p.Prime] → (G : Type u) → [Group G] → [TopologicalSpace G] → [IsTopologicalGroup G] → Prop`.

## H09 (CBirkbeck) — applied

`serre1963bourbaki` line 103 states Théorème 3.2 for `q = 2`, `n = 2m + 1`, `m ≥ 1`, so the
printed hypothesis is already `n ≥ 3`. README line 2516 changed from "cite Serre's Thm 3.2 only
for `n ≥ 3`, because its printed `n ≥ 1` degenerates at `n = 1`" to "Serre's Thm 3.2 covers
`n = 2m + 1` with `m ≥ 1`; handle `n = 1` through NSW (3.9.10) and Labute Remark 2(iii)".

## H10 (CBirkbeck) — applied

`labute1967` lines 532–538: Labute's Prop. 6 lists surjectivity of the `H¹` reductions, prescription
modulo `pⁱ`, and prescription into `I`. It does not list the `×p`-injectivity on `H²`. README
line 1252 now says that Labute Prop. 6 proves conditions 1 and 3 equivalent and that condition 2 is
Tau Ceti's reformulation of condition 1. The `*Source:*` line now reads "Labute Prop. 6 for 1 ⟺ 3;
Tau Ceti, as cited above, for 1 ⟺ 2".

## H11 (CBirkbeck) — applied

At the pin, `Mathlib/Algebra/Category/ContinuousCohomology/` does not exist. `continuousCohomology`
is defined at `Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131`. README
line 692 now gives that path.

## H12 (CBirkbeck) — applied

`labute1967` lines 80–82 (Theorem 2, p. 107) give an automorphism of `F` sending `r` to `r'`. The
conclusion of `exists_continuousMulEquiv_map_demushkinRelator` (line 1507) changed from the equality
of closed normal closures to `∃ φ : freeProP p (Fin n) ≃ₜ* freeProP p (Fin n), φ r = r'`. The
README bullet (line 2496) matches.

Labute also assumes `r, r' ∈ Fᵖ[F, F]`. The docstring and the README now say why that is implied by
the Demushkin hypotheses: a relator outside `Φ(F)` is part of a basis by Burnside, so the quotient
is free pro-`p` with `H² = 0`. Checked at `n = 1`, `p = 2`, `r = x²`, `r' = x^{2u}`: the
automorphism `x ↦ x^u` works. For `p` odd and `n = 1`, `ℤ/pᵏ` has zero cup square, so the
hypothesis is vacuous there.

## H13 (CBirkbeck) — applied

The rank-two rejection lemma and its `example` are deleted (see H05). Those were the declarations
whose docstrings said "An earlier form of …" and "The reviewer's witness". The surviving mention in
the `isDemushkin_marked_of_q_two_even` docstring no longer refers to them. Searching for the same
defect found two more instances: the Layer 7 section comment "These declarations were pseudocode
while the cohomology had no carrier", which is replaced, and the README heading "Material
extracted from the former pro-`p` portfolio", which is now "Arithmetic applications owned by other
roadmaps" (line 2622).

## H14 (CBirkbeck) — applied

The module docstring (line 70) changed from "This file is not the roadmap and is not exhaustive …
suggest Lean forms" to: "The roadmap is `README.md`; this file is not the roadmap. It states the
roadmap's headline theorems against the pinned Mathlib and Tau Ceti …". README line 106 changed
from "`Suggested.lean` pins useful Lean names and signatures" to "`Suggested.lean` is its
acceptance test, stating the headline theorems against the pinned Mathlib and Tau Ceti with the few
definitions they need". The sentence about "comparison proofs against that declaration's actual
carriers" is deleted. The docstring does not yet list which headline theorems cannot be stated at
the pins, because this job did not audit the whole README for that.

## H15 (CBirkbeck) — applied differently

The "private provenance ledger" sentence is replaced (README line 2634) by full citations of Labute
1967 (Canad. J. Math. 19, 106–132) and Serre's Bourbaki exposé 252. I fetched both through the
sources service as `labute1967` (Cambridge Core, publisher-open) and `serre1963bourbaki` (Numdam,
open repository) and read them for H09, H10 and H12. `sources.toml` is not one of the two files
this job may edit, so the worker has to record these two entries in the manifest.

## Build

`lake build TauCetiRoadmap.ProfiniteProPGroups.Suggested`: `Build completed successfully (9408 jobs)`.
The only messages are 20 `declaration uses 'sorry'` warnings, down from 46: no errors and no other
warnings.

## Gate

`gate ProfiniteProPGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck (`--movable`): `depcheck: 155 roadmaps, 1063 edges, 0 problem(s)`. There is no UPWARD,
CYCLE or `moved:` line.

## Elaborated signatures

I put `#check @TauCetiRoadmap.ProfiniteProPGroups.<name>` for every declaration of the new file in
one scratch file and elaborated it once against the built module. Each changed or new statement
matches its README statement:
- `IsDemushkin` has no compactness binder (H08).
- `demushkinRank`, `demushkinCharacter`, `existsUnique_hasPrescriptionProperty` and
  `demushkinCharacter_unique` carry `[CompactSpace G] [TotallyDisconnectedSpace G]` explicitly.
- The three open-subgroup statements carry `[Infinite G]`.
- `sq_topologicalGeneratorRankNat_lt_four_mul_finrank_cohomFp_two` carries `[Finite G] [Nontrivial G] [DiscreteTopology G]`.
- `exists_continuousMulEquiv_map_demushkinRelator` concludes `∃ φ, φ r = r'`.

No section binder was lost: the rewritten Layer 7 block uses no section `variable`s.

## Adversarial pass on the statements this repair adds or changes

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `demushkinRank_openSubgroup_sub_two` | `G = ℤ_p²` (`n = 2`), `U` of index `p`; `G` of rank 4, index 2; finite `G = ℤ/2`, `U = 1` | `0 = p·0`; `n(U) − 2 = 2·2`, so `n(U) = 6`; `0 − 2 = 2·(1 − 2) = −2`, but `U = 1` has `H² = 0`, so it is not Demushkin | holds; `Infinite G` is needed for the subgroup to be Demushkin | ⚠ added to the docstring |
| `demushkinCharacter_openSubgroup` | `U = G` (index 1) | `χ_G = χ_G ∘ id` | holds | none |
| Golod–Shafarevich | `ℤ/p`; `(ℤ/p)²`; trivial group | `1 < 4·1`; `4 < 4·3 = 12`; excluded by `[Nontrivial G]` (would be `0 < 0`) | holds; the hypothesis is needed | values added to the docstring |
| Thm 2, `φ r = r'` | `n = 1`, `p = 2`, `r = x²`, `r' = x^{2u}`; `n = 0`; `p` odd, `n = 1` | `φ = (x ↦ x^u)`; trivial `F`, `H² = 0`, so not Demushkin; `ℤ/pᵏ` has zero cup square, so not Demushkin | holds; the Frattini hypothesis is implied | docstring and README |
| `cd_p_eq_two_of_isDemushkin` at `.{u}` | `ℤ_p²`; `ℤ/2` (finite) | `cd = 2`; `ℤ/2` has `cd_2 = ∞`, excluded by `hinf` | holds | closed by Tau Ceti |
| `cd_p_freeProP_le_one` at `.{0}` | `n = 0` (trivial group); `n = 1` (`ℤ_p`) | `cd = 0 ≤ 1`; `cd = 1` | holds | closed by Tau Ceti |
| `IsDemushkin` as an alias | `ℤ/2` at `p = 2`; free pro-`p` of rank 2 | `H¹ = H² = 𝔽₂`, `x ∪ x ≠ 0`; `H² = 0`, so not Demushkin | the predicate is unchanged (the fields are the same up to name) | none |
| README Prop. 6 attribution | `G = C₂` with its sign character | condition 1 holds, and the README's reduction-injectivity warning still applies | consistent | none |

## Ownership and citations

- No new carrier is introduced. Every added declaration aliases or applies a pinned Tau Ceti
  declaration.
- The fully qualified names collide with main's `Completed/ProfiniteProPGroups/Suggested.lean`.
  That collision is H01, and only a maintainer can resolve it.
- I used `roadmaps grep` on the names I removed (`fpPairing_bil`, `iff_tauCeti`, the route
  lemmas). The only consumer found is LocalGaloisGroups, of `fpPairing_bil`, which is why it is
  kept (H05).
- Ownership against the other open pull requests was not re-checked beyond that grep.
- The worker's eight unresolved-citation leads (`ProfiniteCohomology.cd_p_le_of_isClosed` and the
  others in `citations.md`) are untouched and were not re-verified in this round.

## Untrusted text

The review text contains no instructions outside its findings. Nothing suspicious was found.

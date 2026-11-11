# Repair report: red-team round 2 on ExponentialSumsAndCircleMethodPartII

Branch `roadmap/exponential-sums-and-circle-method-part-ii`, repairs committed as `2cb43f3a` on top of `08149d50`. Only `TauCetiRoadmap/ExponentialSumsAndCircleMethodPartII/README.md` changed; `Suggested.lean` is unchanged. Pass b reviewed the older head `d01cb8f`; every pass-b claim was rechecked at `08149d50` before acting.

## RT-ExponentialSumsAndCircleMethodPartII~2b/S03 (P2) — applied differently

Old §6.5 route: Lie-algebra Goursat over a list of low-rank coincidences, with no owner, and closure SO_(N₁) left open. New route:
- p₁(G)=O_(N₁): open image (LPV §5.7 Lie algebra, pinned `TauCeti.HopfIdeal.eq_of_le_of_finrank_quotientLie_le`) plus the Picard–Lefschetz reflections of LPV §5.10.
- `Subgroup.goursat` and the fibre-dimension identity dim G=N₁(N₁−1)/2+dim G₂=N₂(N₂+1)/2+dim G₁.
- G₂ from MordellLawrenceVenkatesh §0.17; G₁° from OrthogonalTamagawaAndLatticeMass §0.1.
- N₁=N₂+1 is impossible because (k−1)∤k.

New Checks: (4,3) and (3,5). Contracts, Scope and Dependencies are updated to match.

The finding is right on all three counts. On "applied differently": the normal-subgroup facts are cited from their existing owners (both earlier in the merge order) instead of being proved here. I also do not use the abstract quotient isomorphism: once dim G₂ and dim G₁ are each 0 or full, the dimension identity settles the cases.

## RT-ExponentialSumsAndCircleMethodPartII~2b/S02 (P2) — applied differently

This was already repaired at `08149d50`, before this round. Pass b reviewed `d01cb8f`. `compactOpen_germ_obstruction` (Suggested.lean:217) states the end-winding surjection onto ℤ and also that Hco is not homotopy equivalent to `GenLoop (Fin 2) fermatCubic x₀`. It uses `PrescribedGerm`/`Hco` on `Projectivization ℂ (Fin 2 → ℂ)`, not the draft's `OnePoint ℂ`. The docstring now keeps only §§13.2, 12.5 and 13.3 as not statable, and README line 7 names all three headlines. No further edit.

## RT-ExponentialSumsAndCircleMethodPartII~2a/S01, RT-ExponentialSumsAndCircleMethodPartII~2b/S06 (P2) — not actionable in this package: the stale entries are in `design/plan.json`, which this job may not edit

The README declares exactly two live contracts: `gap:sf-fibre-strata` (3 occurrences) and `gap:lpv-universal-monodromy` (4 occurrences). The plan's top-level `gaps` still lists 12 slugs. The ten to retire are `ecf-character-fourier`, `edc-top-components`, `ecf-one-variable-fourier`, `symmetric-lattice-shrinking` and the six `at2-*`. The worker or intake should delete them and withdraw any announcements on the supplier jobs.

## RT-ExponentialSumsAndCircleMethodPartII~2b/S01 (P2) — not actionable in this package: renaming the folder, namespace and merge-order line is a maintainer decision outside the two editable files

This finding was re-raised after round 1 (marked unresolved in the PORT report), so a human decides it. PRREVIEW~2 records that the pull-request description states the "Part II" refers to no Part I and leaves the rename to a maintainer. The namespace must equal the folder name, so retitling the README alone would make it inconsistent with the Lean file. No base roadmap exists on main, on the board or among the 438 open heads.

## RT-ExponentialSumsAndCircleMethodPartII~2b/S04 (P3) — applied

"Main … hypotheses" was replaced by explicit lists:
- §9.4: k≥3, d≥k−1, n>2ᵏ(k−1), smooth Z, x≠0 with f₀(x)=0, p>k, ℓ≠p of even order, E and ψ. It also states that smoothness of X is unused.
- §9.5: the same list, by reference to §9.4.
- §10.8: K of characteristic 0 or >k, k≥3, d≥k−1, n>2ᵏ(k−1), f of degree k, X and Z smooth, x≠0 with f₀(x)=0, and no condition on ℓ.
- §13.1: the same list over ℂ.

Pattern repair: §10.10 now lists its parameters explicitly as well.

## RT-ExponentialSumsAndCircleMethodPartII~2a/S02, RT-ExponentialSumsAndCircleMethodPartII~2a/S03, RT-ExponentialSumsAndCircleMethodPartII~2b/S05 (P3) — applied

Instruction and restatement Checks were replaced by computed ones:
- §4.4: b=(1,2,4), (0,0,1) and (0,1,0).
- §4.5: (1,2,4) monicity; (0,0,1) with leading error coefficient 1; L=3, m=2, (1,0,1) non-unique; L=4, (1,0,0,0).
- §3.2: 80−6=74.
- §5.5: 2T−1.
- §5.11: rank 0 versus −40.
- §8.4: G=a, −∞.
- §9.4: B(4)=188, B(5)=192. This merges pass a's deletion with pass b's replacement.
- §11.8: σ⁻¹=−1, and a constant family.
- §13.2: tδ=3, j=1.
- §13.3: 𝔸^D, 8·S² versus 16·S³, and diagonal dimensions 1 and 0.

A sweep of Check bullets that open with an imperative verb found no others.

## Outcome of the required checks

- `lake build TauCetiRoadmap.ExponentialSumsAndCircleMethodPartII.Suggested`: "Build completed successfully (18239 jobs)". The only warnings are the three `declaration uses 'sorry'` at Suggested.lean:115, 141 and 217.
- Gate after commit: `gate ExponentialSumsAndCircleMethodPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. Before the commit the only failure was `dirty=1`.
- Dependency check (`--movable --pr 2138`): `depcheck: 235 roadmaps, 2136 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line. The new edges go to MordellLawrenceVenkatesh (merge order line 160) and OrthogonalTamagawaAndLatticeMass (line 149), both above this roadmap (line 396).
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.
- Signatures: `Suggested.lean` is unchanged this round. I did not elaborate a separate `#check @` scratch file, because the only Lean command this job may run is the module build. Instead I compared the supplied elaborated types (`scratch/signatures.md`, 16 declarations, 0 lost binders) with the revised README. §10.8's new list matches the binders of `mapping_geometrically_irreducible` one-for-one: `hk`, `hd`, `hchar`, `hdegree`, `haff`, `hinfty`, `hx`, `hinc`, `hn` and `hrange`.
- No gate failures were listed in the brief, so none needed repair.

## Verification of new citations (at the copies read)

- MordellLawrenceVenkatesh §0.17, at its open head: over an algebraically closed field of characteristic 0, with dim V=2n≥2, the centre of Sp is {±1} and every proper closed normal subgroup lies in {±1}.
- OrthogonalTamagawaAndLatticeMass §0.1, at its open head: SO is geometrically connected; Spin is smooth of dimension n(n−1)/2; there is a central isogeny Spin→SO with kernel μ₂; Spin is absolutely almost simple for n≥3, n≠4.
- LefschetzPencilsAndVanishingCycles §5.7 ("Closed subgroups of Sp(V)(ℚ_ℓ) and O(V)(ℚ_ℓ)") and §5.10 ("its reflections topologically generate the compact image"), at its open head.
- Mathlib `Subgroup.goursat` is at `Mathlib/GroupTheory/Goursat.lean:131` (namespace `Subgroup`, line 32).
- Tau Ceti `TauCeti.smoothCommHopfAlgProperty_of_charZero` is at `TauCeti/Algebra/AlgebraicGroup/Smooth/CharZero.lean:151`.
- Tau Ceti `TauCeti.HopfIdeal.eq_of_le_of_finrank_quotientLie_le` is at `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Smooth/Dimension.lean:65`. Its hypotheses: both subgroups smooth and connected, and the Lie dimension does not drop.

Ownership was searched by object with `roadmaps grep`: almost-simple groups, normal subgroups of Sp/SO, orthogonal Lie algebra simplicity, and Goursat.
- The only owners found are the two cited above, ReductiveGroups (general structure theory, on main), and MordellLawrenceVenkatesh §0.22 (Goursat for simple Lie algebras, not used here).
- Tau Ceti pins simplicity of type-D orthogonal Lie algebras (`TauCeti.TypeDStd.isSimple_typeD`) but not type B, so the group-level Spin route through OrthogonalTamagawaAndLatticeMass §0.1 was chosen, because it covers odd N₁ such as 21.
- No construction was added here.

## Adversarial pass (changed statements)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §6.5 ranks | (k,n)=(4,3),(3,5),(3,6),(4,4),(5,3) | N₁=21,22,22,21,52; N₂=6,10,42,60,12; N₁−N₂=15,12,−20,−39,40 | never 1, as (k−1)Y=k has no integer solution for k≥3 |
| §6.5 range bounds | all (k,n) outside (3,3),(3,4) | min N₁=21 at (4,3), 22 at k=3; min N₂=6 at (4,3) | N₁≥21, N₂≥6 hold; (3,3) gives N₁=6, excluded |
| §6.5 dimension cases | dim G₂∈{0,full}, dim G₁∈{0,full} | (0,0): N₁²−N₁=N₂²+N₂ ⇔ (N₁−N₂−1)(N₁+N₂)=0; (0,full): N₂(N₂+1)=0; (full,0): N₁(N₁−1)=0; (full,full) consistent | only G=O×Sp survives |
| §6.5 −Id | N₁=21 odd; N₁=22 even | det(−I₂₁)=−1∉SO; det(−I₂₂)=+1∈SO | reflections needed exactly for odd N₁ |
| §6.5 coincidence control | (N₁,N₂)=(3,2),(5,4) | dim SO₃=3=dim Sp₂; dim SO₅=10=dim Sp₄ | the count is sharp exactly at N₁=N₂+1 |
| §4.4 Check b=(1,2,4) | L=3, m=1, m′=1 | 1/(T−2)=T⁻¹+2T⁻²+4T⁻³+8T⁻⁴…; error exponent −4=−3−1+1−1 | holds |
| §4.4/4.5 b=(0,0,1) | m′=0 versus m′=1 | m′=0: error T⁻³, exponent −3; m′=1 needs c=0, then T⁻³ coefficient 1≠0 | unique (0,0,1); exponent −4 would wrongly reject it |
| §4.4 b=(0,1,0) | m′=0,1 | det H₁=−1; m′=0 leaves T⁻²; c/(T−a) needs c=0 and ca=1 | no pair, b∉A₁ |
| §4.5 L=3, m=2, b=(1,0,1) | c∈K | (T+c)/(T²+cT−1)=T⁻¹+T⁻³−cT⁻⁴+…; gcd=1 since T²+cT−1=T(T+c)−1 | a one-parameter family, so non-unique above L/2 |
| §4.5 L=4, b=(1,0,0,0) | m′=0,1 | m′=0 leaves T⁻¹; m′=1 needs c=1, ca=0 | unique (1,1,T) |
| §3.2 Check | n=40, k=3, d=2 | 80−6=74 | holds |
| §5.5 Check | l₁=T, l₂=T−1 | (T−1)+T=2T−1 | holds |
| §5.11 Check | n=40, d=2, m=2,3 | 0; −40 | holds |
| §8.4 Check | G=a, N=1 | cd(a)=cd(−a)=cd(a−b)=cd(−y)=−∞ | holds with extended addition |
| §9.4 statement and Check | (k,d,n)=(3,4,24); n=16 | δ=1>0, t=2; B(4)=188, B(5)=192, cutoff 192+8−8=192; at n=16, δ=0 is excluded | holds |
| §9.4 hypotheses | is smooth X needed? | inputs §§9.2, 4.7, 9.3, 3.5 use only smooth Z, p>k, ℓ of even order | "not used" is correct |
| §10.8 versus Lean | n=40, k=3, d=2; n=32 | (2:ℚ)<1·(5−3+1)=3; at n=32, 2<2 is false | ten README hypotheses equal the ten binders |
| §13.1 hypotheses | k=3, n=16 | δ=0, so 0≤j<4(tδ−1)<0: empty range | including n>2ᵏ(k−1) loses nothing |
| §11.8 Check | escaping loop; constant loop | v=1/a_s=z^dσ⁻¹, σ=−1 at s=3r/2, so |v/z^d−1|=2; constant gives v/z^d=1 | holds |
| §13.2 Checks | n=40 versus 32 | t=1, δ=3, tδ=3>2; at n=32, tδ=2; j=1<8, i=−1>−4 | holds |
| §13.3 Checks | n=3, 4, 40 | 8·S², π₂=ℤ⁸; 16·S³, π₂=0; diagonal at j=0: 1 (m=0), at j=1: 0 (H_c^39(ℂ)=H_c^77(PConf₂)=0) | matches Ω²X, which is 36-connected |

## Notes for the maintainer

- `design/plan.json` still carries ten stale gaps; see 2a/S01 and 2b/S06.
- The "Part II" naming question (2b/S01) needs a human decision.
- Two new supplier edges were added, to MordellLawrenceVenkatesh §0.17 and OrthogonalTamagawaAndLatticeMass §0.1. Both are open roadmap pull requests earlier in the merge order. If either renumbers those sections before merging, these citations must follow.
- No Lean names changed, and no other roadmap cites this one's changed text.
- No new source was fetched and no locator changed; `needs-references.toml` was not written.
- No suspicious instructions were found in the reports, sibling roadmaps or sources read.
- Ownership against open pull requests was checked through the brief's index and the `roadmaps` tool, including MordellLawrenceVenkatesh, OrthogonalTamagawaAndLatticeMass and LefschetzPencilsAndVanishingCycles at their heads.

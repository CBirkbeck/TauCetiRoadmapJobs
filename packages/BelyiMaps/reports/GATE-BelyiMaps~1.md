# GATE-BelyiMaps~1 — answers to the human review of the BelyiMaps revision

Head reviewed: `03a6a88`. Repairs are in one commit on the branch, `85211014`
("BelyiMaps: review repairs (own Layers 8–14, fix carriers and counts, Suggested to headlines)").
Line numbers below are those of `TauCetiRoadmap/BelyiMaps/README.md` at `85211014`, unless they
are quoted from the review.

H01–H14 are the points of the review of 2026-10-21 (its findings 1–9 one each; finding 10 split
into H10–H12, finding 11 into H13–H14). H15–H33 are the points of the review of 2026-10-28 (F01–F06
one each; F07 split into H21–H25, F08 is H26, F09 split into H27–H30, F10 into H31–H33).

**Which pin.** The branch's own `lake-manifest.json` pins Tau Ceti `a91d3aa` / Mathlib `6b7abb3`
(Lean 4.35.0-rc3), and the requested build runs there. Main has since moved its pin to Tau Ceti
`2fd255d` / Mathlib `1b1ccf4` (Lean 4.36.0-rc2), and the brief makes main's pin the reference for
library citations. All 349 backticked library names in the README were checked at main's pin with
a namespace-aware scan (every `TauCeti.*` name resolves; the 22 that the scan does not find in
Tau Ceti are Mathlib names). `Suggested.lean` now imports only `Mathlib`, so it builds at both pins.
This matters for H18, H19 and H26.

## H01 (CBirkbeck) — applied

Layer 3.3 (README 1409–1426) now regroups the subgroup sum by `H`-conjugacy with multiplicity
`[H : N_H(K)]` and records `[H : K] = [H : N_H(K)]·[N_H(K) : K]`, matching
`TauCeti.card_productOneTriplesIn_eq_sum_conjugacy_generating`. Two Checks were added, including
the reviewer's `S₃` witness: three triples `(t,t,1)`, regrouped sum `1·3 = 3`, where the old
`[N_G(K):K] = 1` gives `1`.

## H02 (CBirkbeck) — applied

`n ≠ 0` is now a hypothesis in 1.3 (923, with the degree-0 counterexample at 935–938) and
throughout 3.4 (1439). 4.2 (1581–1583) now says "connected iff `n ≠ 0` and pretransitive", with a
warning about the empty action. Both match the Tau Ceti hypotheses (`hn : n ≠ 0` in
`passportSize_eq_genCountType_mul_card_centralizer_div_card_normalizer`;
`isConnected_iff_isPretransitive_range_toPerm`).

## H03 (CBirkbeck) — applied

The 7.7 carrier (2889–2898) now puts the covering condition over `markedᶜ`
(`IsCoveringMap (markedᶜ.restrictPreimage π)`; old: `marked.restrictPreimage π`). The reviewer's
fold `β ∘ (h × id)` is written out as the witness (2900–2909) and as a Check (2944–2945). The same pattern was
also wrong in the local-power clause, which lacked "π maps `φ.source` into `ψ.source`" and so
could be met by junk values; that clause is added (2911–2914), as in Tau Ceti's
`TauCeti.IsLocalPowerAt`. Main's pin implements the corrected carrier as `TauCeti.TopBranchedCover`,
cited at 2956–2963.

## H04 (CBirkbeck) — applied

8.1 item (3) is replaced (2996–3011). The new statement is: on a connected surface, `f` is
holomorphic iff its affine part is chartwise meromorphic **and** `f` is the canonical sphere
extension (the punctured limit). Equivalently, the representatives are `MeromorphicNFOn` and
`f⁻¹(∞)` is exactly the negative-order set. The reviewer's `f(0)=2` map is stated as the
counterexample, and Tau Ceti's `TauCeti.RiemannSurface.sphereMap`, `mdifferentiable_sphereMap` and
`MeromorphicFunction.sphereMap_finitePart` are cited.

## H05 (CBirkbeck) — applied

9.7 has a new step 3, "Integral rescaling at each point of Δ" (3837–3852). It sets
`m_N(W) = s^(N·n)·m(W/s^N)`, proves the algebra and root-space identifications, and gives
`disc(m_N) = s^(N·n(n−1))·disc(m)`. It works through the reviewer's example `w = (t−2)y`, which
gives `W² − t`. Step 1 warns that clearing denominators breaks monicity, steps 4–5 and 9.6
(3731) apply 9.6 to `m_N`, and the later steps are renumbered.

## H06 (CBirkbeck) — applied

10.1 (3919–3945) now computes the branch values of `P/Q` in both source charts: finite points by
`f′`, finite poles by pole order, and `∞` by `p−q`, `q−p` or `q − deg(P − cQ)`. Both reviewer
witnesses are stated: `1/x²` has branch value `0` at `∞`, and `1/x` shows why zeros of `f′` on the
sphere are wrong. The polynomial special case used in 10.3 is recorded.

## H07 (CBirkbeck) — applied

12.1 now uses positive moduli `n : ℕ+` for the projections, the limit, the unit criterion and
the character assembly (4583–4601). It includes the argument that no continuous unital
`ẑ → ZMod 0 = ℤ` exists. 12.10 (4953–4973) and the ProfiniteArithmetic supplier row use `ℕ+` too, matching
`TauCeti.zHat.toZMod`, `isUnit_iff_toZMod` and the `ℕ+`-indexed `unitsLift` at the pin.

## H08 (CBirkbeck) — applied

In 14.2 (5415–5426), valid rows now give only a map *into* the true orbit; the surjection
`G/H ↠ G/S` needs an explicit coverage certificate. 14.3 (5480–5498) replaces "fails precisely
when … simultaneously conjugate" with two independent failure modes, duplication and omission.
The reviewer's omission witness is stated: one `5T1-5_5_5` row gives `1` against `pass_size = 3`.
The section lists the certificates equality needs. 14.4's "What is proved" (5520) now says the
stored classes *lie in* the stored passport.

## H09 (CBirkbeck) — applied

3.5 (1499–1503) now reads "every **realized** ordered passport in degree `≤ 4` has size exactly
`1`". The degree-2 `S₂`, `([2],[2],[2])` admissible passport of size `0` is given as the warning.
This matches main's `TauCeti.PassportSpec.passportSize_eq_one_iff_of_degree_le_four`, which says
"size one iff inhabited".

## H10 (CBirkbeck) — applied

§Pinned conventions (379–386) no longer claims the partition at `∞` changes. `(σ1σ0)⁻¹` and
`(σ0σ1)⁻¹` are conjugate by `σ0`, so the passport cannot see the error, but the class does
change. The witness was found by exhaustive search over `S₅`: `a = (1 2)(3 4)`, `b = (0 1 2 3)`.
The triples `(a, b, (ba)⁻¹)` and `(a⁻¹, b⁻¹, ab)` have equal cycle partitions and are not
simultaneously conjugate.

## H11 (CBirkbeck) — applied

7.2's compactness bullet (2748–2758) now removes punctured discs of a smaller radius `r`. The
core lies over a compact set, and the rest is covered by images of closed discs of radius
`r^(1/e)` inside the chart domains. It states why the closures of the full filled discs prove
nothing. This is the route of Tau Ceti's `IsCoveringMap.isCompact_preimage_compactCore` with
`compactCore ρ`.

## H12 (CBirkbeck) — applied

7.7 (2919–2927) now proves that the local exponent is chart-independent topologically: `e` is the
number of points near `z` over a nearby unmarked value. The old analytic justification ("charts
differ by units", order of vanishing) is removed as unavailable for topological charts. Tau Ceti
has this as `TauCeti.IsLocalPowerAt.unique`.

## H13 (CBirkbeck) — applied

The inventory header (533) no longer names `9caeba1000` / Lean 4.31.0-rc1 or the ledger. It now
reads "against the Mathlib revision pinned in `lake-manifest.json`". The 31 load-bearing names of
the table and §Boundaries were spot-checked at both Mathlib pins (`6b7abb3`, `1b1ccf4`) and all
exist; the absent `card_parts_partition` is H31.

## H14 (CBirkbeck) — applied

Every appeal to the private provenance ledger (14 places) is removed. The convention check now
names `3T2-3_2.1_2.1-a` and its stored triple (372–376); the triple `(1,2,3), (2,3), (1,2)` was
read on the LMFDB page on 2026-11-10. The `5T1-5_5_5` claim (passport size 3, three orbits, each
over `ℚ`) was likewise read on 2026-11-10. Claims that rested only on the ledger now carry
mathematical witnesses, or were deleted:
- 11.7 now uses the `z ↦ z²` pair over `ℚ(√2)`;
- 14.1's geomtype claim (5354–5359) now uses a degree-5 genus-0 Euclidean triple and a degree-4 genus-1
  hyperbolic triple (computed);
- the rejected-route sentence of 10.7 is gone.

## H15 (CBirkbeck) — applied

1.6, §Boundaries, the supplier table, 14.1/14.3/14.5 and the scope exclusions now cite
PolynomialGaloisGroups Layer 6 (as on main, `Completed/`) for degrees 1–5. Degrees 6–11 are
declared as the gap line
`What PolynomialGaloisGroups must provide (gap:transitive-groups-degree-six-to-eleven)` (585–590).
The dead `HighDegreeReferenceData.md` link and every "Layer 1C/1D" citation are removed.
The matching `design/plan.json` gap entry is outside the two files this job may edit, so the
worker has to add it.

## H16 (CBirkbeck) — applied differently

The finding's premise has changed on main. Main's `TauCetiRoadmap/AlgebraicCurves/README.md` now
contains the cut: Layer 8 item 2, and Layer 12 items 12B.0a (lines 1503–1521, including "F is
relatively algebraically closed in Frac(F⊗[k]K)" and "generic supplier for the BelyiMaps
roadmap's Layer 9"), 12B.0b and 12B.0d (1560–1580). So no gap is declared. Instead 9.1C
(3433–3440), the supplier row (580), 10.6, 12.4 and the prerequisites cite those items exactly.
The reserved names `regularModel`, `functionFieldEquiv` and `regularModel_functionField` are
deleted, as the finding asked.

## H17 (CBirkbeck) — applied

This is the finding's first option: Layers 8–14 are this roadmap's own. The scope section (54–107)
is rewritten, the successor table and all seven "Owner: successor roadmap" banners are deleted,
and every mention of `BelyiAnalyticCovers`, `BelyiAlgebraicAndDescent` and
`BelyiArithmeticActions` is gone. This matches the roadmaps on main that cite BelyiMaps
Layers 8.4–13.1 directly (NoncongruenceModularForms, EtaleCohomologyFoundations,
ProfiniteArithmetic, AlgebraicCurves). The `:188`/`:426` inconsistency is resolved: the carrier is
the unbundled stack, and §Boundaries now names ComplexManifolds, FuchsianOrbifolds Layer 5 and
ModularForms §10B as suppliers (197–208).

## H18 (CBirkbeck) — applied differently

At main's Tau Ceti pin this headline is already proved, as
`TauCeti.TopBranchedCover.IsoClass.restrict_bijective`
(`TauCeti/AlgebraicTopology/ThricePuncturedSphere/FilledCover/TopBranchedCover.lean:318`).
Stating it again with `sorry` would restate a proved target. 7.7 (2956–2963) and the
`Suggested.lean` docstring cite that theorem instead. Layers 7.1–7.6 also gained *Tau Ceti:*
lines naming the filled cover, `fillMap` and the ramification partitions.

## H19 (CBirkbeck) — disputed

Every name the finding lists exists at main's Tau Ceti pin `2fd255d`:
- `TauCeti.ConnectedIsoClass.card_four` (`Combinatorics/PermutationTriple/SmallDegrees.lean:392`)
- `TauCeti.PermutationTriple.genus_eq_ite_of_degree_four` (`:264`)
- `TauCeti.PassportSpec.passportSize_eq_one_iff_of_degree_le_four` (`:440`)
- `TauCeti.MarkedIsoClass.stabilizerEquiv` (`Combinatorics/PermutationTriple/IsoClass.lean:309`)
- `TauCeti.puncturedDiscPow`, `isCoveringMap_puncturedDiscPow`, `puncturedDiscPowDeckMulEquiv` and
  `IsCoveringMap.exists_homeomorph_puncturedDiscPow_comp_eq_iff`
  (`Topology/Covering/PuncturedDisc.lean:192/217/273/359`)
- `IsCoveringMap.sameCycleQuotientσinfEquivConnectedComponents`
  (`AlgebraicTopology/ThricePuncturedSphere/PuncturedNeighborhoodComponents.lean:324`)

They are absent only at `a91d3aa`, the branch's older manifest pin, which the rebase onto main
replaces. Those lines are therefore kept, and Layer 7's lines were extended rather than cut.

## H20 (CBirkbeck) — applied

PeripheralActions is no longer a supplier anywhere: in §Boundaries (129–142), the Layer 13 header,
13.3 (5165–5202) and 13.4 (5204–5213). 13.3 is now this roadmap's Galois-equivariant theorem:
every representative of `ρ_ℓ(σ)` is peripheral of exponent `χ_ℓ(σ)`, with the arithmetic proof.
The bare existence statement appears only as a one-sentence remark that nothing uses.
`conjugation_transfer` and `opposite_third_peripheral` stay declared, because PeripheralActions on
main consumes them.

## H21 (CBirkbeck) — applied

`Suggested.lean` has no `set_option`: `autoImplicit false` and `maxRecDepth 8000 in` are gone,
together with the `decide` example the second one served.

## H22 (CBirkbeck) — applied

The 3.4 display (1463–1469) now reads `passportSize P = genCountType G λ0 λ1 λinf * Nat.card Z /
Nat.card N`, with `Z := C(G)` defined in prose. The `tex` count is 0.

## H23 (CBirkbeck) — applied

Every "stand-in" (head lines 95, 171, 551, 560, 566, 567, and the supplier-table intro) and the "so far" of
7.6 (now "nothing in Layer 7 chooses") are reworded. The `residue` count is 0.

## H24 (CBirkbeck) — applied

6.1 (2307–2311) states both facts in prose, replacing the undeclared
`ConnectedFiberNumberedCover.triple_isConnected` and the `ConnectedCover.nonempty_ν_of` that the
citation check also flagged. `readme-ids-missing` is 0.

## H25 (CBirkbeck) — answered

`NOT IN ORDER` concerns the merge-order file, which is the board's to place. The dependency check
now reports `depcheck: 235 roadmaps, 2267 edges, 0 problem(s)`, with no UPWARD or CYCLE line.

## H26 (CBirkbeck) — applied

`Suggested.lean` went from 1681 lines (190 declarations) to 88 lines. It has the prescribed
docstring, a single `import Mathlib`, and the two consumed lemmas. All Tau Ceti-closed
restatements, `decide`/`rfl` examples, the three sorried small-degree/API theorems, both
commented-out blocks and `subgroupConjSetoid` are deleted; the README states the latter's content
in prose at 6.3.

The docstring lists the headline theorems Tau Ceti proves:
- 3.2, 3.4, 4.4–4.5, 5.6, 6.3;
- 7.7, 8.6, 10.3, 10.4 and 13.5 (polynomial form), at main's pin.

It also lists the headlines it does not state, with the missing carrier:
- 9.8, 10.7, 11.6 and 13.5 (classes);
- 12.6, 12.11, 13.3 and 13.4.

The finding's Layer 7 statement is not added; see H18.

## H27 (CBirkbeck) — applied

"#244" is removed from the README (old 306 and 4290–4291); the commented block containing it in
`Suggested.lean` is deleted. The `prnum` count is 0.

## H28 (CBirkbeck) — applied

This is the same repair as H14: the ledger sentences are gone, and the records are cited by LMFDB
label in 3.5, 8.5, 12.12 and 14.

## H29 (CBirkbeck) — applied

The links now point where the roadmaps live on main: `../../Completed/ProfiniteArithmetic`,
`ProfiniteProPGroups`, `PolynomialGaloisGroups` and `ConformalMapping`. The `HighDegreeReferenceData.md`
link and the plain-path line at old 234–236 are removed, and ComplexManifolds/FuchsianOrbifolds
links are added. On the un-rebased branch, the `Completed/` targets for these four still sit
under `TauCetiRoadmap/`.

## H30 (CBirkbeck) — answered

This job may edit only `README.md` and `Suggested.lean`, so no `sources.toml` was created and no
source was fetched into a manifest. The finding's list of legal copies stands for the job that
records them:
- Köck arXiv math/0108222
- Musty–Schiavone–Sijsling–Voight arXiv 1805.07751
- Stix arXiv 0809.0017
- Hatcher (author page)
- Couveignes (Numdam/HAL)
- the CUP and Springer books, recorded as `uncertified`

## H31 (CBirkbeck) — applied

0.5 (747) now cites Mathlib's `Equiv.Perm.parts_partition` (`GroupTheory/Perm/Cycle/Type.lean:574`
at both Mathlib pins) instead of the nonexistent `Equiv.Perm.card_parts_partition`.

## H32 (CBirkbeck) — applied

§Boundaries (144–154) and 3.2 step 3 now use the Tau Ceti names CharacterTheory exports on main:
- `TauCeti.classSum`, `TauCeti.structureConstant`, `TauCeti.classSum_mul`;
- `TauCeti.characterTable` with
  `TauCeti.card_conjClass_mul_sum_characterTable_mul_characterTable_inv` (its 3.5);
- `TauCeti.Representation.centralCharacter` (its 4.3, `CharacterTable/CentralCharacter.lean:89`).

They replace `char_column_orthogonality` and `centralCharacter_coordinate`.

## H33 (CBirkbeck) — applied

8.6's genus reconciliation (3223–3229) now cites FuchsianOrbifolds Layer 5 (item 3) for
Riemann–Hurwitz and ModularForms §10B for analytic genus equals topological genus. The
nonexistent `10B(i)–(v)` item numbers are removed from 8.6, 9.3, 9.4, 9.5 and the references.

## Build and gate

- `lake build TauCetiRoadmap.BelyiMaps.Suggested TauCetiRoadmap.PeripheralActions.Suggested`:
  **Build completed successfully (9052 jobs)**. There are no BelyiMaps warnings (the file has no
  `sorry`); the only sorry warnings are PeripheralActions' own.
- `#check` scratch elaboration of `@opposite_third_peripheral` and `@conjugation_transfer`: the
  elaborated types equal the stated ones. Neither uses a section variable, so no hypothesis
  dropped and nothing changed.
- Gate: `gate BelyiMaps: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0
  residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0
  statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0
  long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0
  outside-folder=0 source-material=0 OK`.
- Depcheck output: `depcheck: 235 roadmaps, 2267 edges, 0 problem(s)`.

## Adversarial pass on changed statements

| statement | instances tried | values computed | result | change |
|---|---|---|---|---|
| 3.3 regrouping, multiplicity `[H:N_H(K)]` | `H=S₃`, classes (t, t, 1); `H=C₂`; `H=1` | `S₃`: total 3 = `1·[S₃:⟨t⟩]=1·3`, old rule gives 1; `C₂`: total 1 = `1·[C₂:C₂]`; `H=1`: 1 = `1·1` | holds | new multiplicity + 2 Checks |
| 1.3 / 3.4 with `n ≠ 0` | `n=0, G=⊥`; `n=1` | `n=0`: formula `1·1/1=1`, passport size 0; `n=1`: formula 1 = size 1 | false at `n=0`, true at `n=1` | hypothesis added |
| 4.2 connected iff | `n=0`; `n=1` | `n=0`: pretransitive, not connected; `n=1`: both hold | old iff false at 0 | `n ≠ 0 ∧` added |
| 7.7 covering set | fold `β∘(h×id)`, `deg β = 4` | 8 points over every unmarked value, local powers hold over marked values, folds over the circle `{a}×S¹` | old carrier admits it, new excludes it | field corrected, Check |
| 7.7 local power without `MapsTo` | any `ψ` with junk off source | equation can hold by junk values | defect | clause added |
| 7.7 degrees | `id` of sphere; `z^n` | `e=1`; `e=n` at `0, ∞`, `n` points with `e=1` over `1`, sums `n` | holds | Checks |
| 7.7 exponent independence | model `w^e` | `e` preimages near `0` of each small value `≠ 0` | topological proof valid | argument replaced |
| 7.2 compactness | radius `r`, components of degree `e` | core over `{|z|≥r/2, |z−1|≥r/2, |z|≤2/r}` compact; rest in `φ_C⁻¹(D̄(r^{1/e}))` | holds | proof replaced |
| 8.1 (3) | `f(0)=2`, else 1; identity of sphere; constant 0 | first: meromorphic, sphere extension 1 ≠ 2, not NF → excluded; identity: NF with order −1 exactly at `∞`; constant 0: NF, order `⊤` | old iff false, new iff holds on the tests | statement replaced |
| 9.7 rescaling | `m=Y²−t/(t−2)²`, `s=t−2`, `N=1` | `m_1 = W²−t`; disc `4t/(t−2)²` vs `4t = s²·disc` | holds | step 3 added |
| 10.1 branch values | `1/x²`; `1/x`; `1+1/x²`; `x²` | indices at `∞`: 2 (value 0); 1; `2−0=2` (value 1); 2 (value `∞`) | old affine test misses `1/x²` | both-chart rule |
| 12.1 `ℕ+` | `n=0`; `n=1` | `ZMod 0=ℤ`: compact image finite but contains `ℤ` → impossible; `ZMod 1 = 0` ring: map exists | `n=0` excluded | `ℕ+` throughout |
| 14.2/14.3 coverage | one row of `5T1-5_5_5`; `ℚ`-class over `ℚ(√2)` | sum 1 vs `pass_size` 3; 2 entries for 1 class | old "precisely when" false | coverage certificate, two failure modes |
| 3.5 realized | `S₂`, `([2],[2],[2])` | `(0 1)³ = (0 1) ≠ 1`, size 0 | old claim false | "realized" |
| conventions, rival third permutation | `a=(1 2)(3 4)`, `b=(0 1 2 3)` in `S₅` | partitions `[2,2,1],[4,1],[4,1]` both sides; no simultaneous conjugator (all 120 tested) | old "wrong partition" false | text + witness |
| 11.7 non-injective | `z²` over `ℚ(√2)` | `[G:H]=2`, `[G:S]=1` | holds | witness replaces ledger |
| 14.1 geomtype witnesses | degree 5 `(2,4,4)`; degree 4 `(3,4,4)` | `χ=3+2+2−5=2` (g=0, E); `χ=2+1+1−4=0` (g=1, H), triple found by search | holds | witnesses replace ledger |
| 13.3 restated | `σ=1`; `σ` = complex conjugation | `u=1`, `φ=id`, conjugators 1; `u=−1`, conjugate of inverse | consistent | Galois form |
| 13.4 conjugator | `q=P`, `x=C` in `conjugation_transfer` | `d = P·c_C·(φP)⁻¹` | matches lemma | stated |
| gap line counts | transitive groups of degree 6–11 | 16, 7, 50, 34, 45, 8 | standard values | — |
| 1.6 Checks | `3T1`, `3T2`; degree 6 | `A₃`, `S₃`; `numTransitiveGroups 6 = 0` at pin | holds | Checks |

## Ownership, overlaps and suppliers

- **Ownership.** No new object is introduced. The only restated statement, 13.3's
  Galois-equivariant form, is owned here: PeripheralActions owns only the Galois-free existence
  statement and cites "BelyiMaps' peripheral-power theorem (its Layer 13.3)" as the arithmetic
  route.
- **Suppliers.** Every supplier cited is on main: CharacterTheory, UniversalCovers,
  AlgebraicTopology, ConformalMapping, ComplexManifolds, FuchsianOrbifolds Layer 5, ModularForms
  §10B, AlgebraicCurves Layers 0–8 and 12, PolynomialGaloisGroups Layer 6, ProfiniteProPGroups and
  ProfiniteArithmetic. No later roadmap is cited, and no notion moved down. The one missing
  supplier piece is declared as `gap:transitive-groups-degree-six-to-eleven`.
- **Overlap #1187** (Tau Ceti bump, conflicts in `Suggested.lean`): this rewrite replaces the
  whole file. Whichever merges second keeps this version (a `Mathlib`-only file needs none of
  #1187's import adaptations).
- **Overlap #1791** merges cleanly.
- **Open revision #763** (PolynomialGaloisGroups 1C/1D) is not cited (H15).
- No other open pull request imports a declaration removed from `Suggested.lean`. On main, only
  `Completed/PeripheralActions` imports the file, and it uses `opposite_third_peripheral`, which
  stays.

## What still needs doing (for the worker)

- **Rebase onto main.** The branch predates main's move to Tau Ceti `2fd255d` and of several
  roadmaps to `Completed/`. After the rebase, `TauCeti.AnalyticBelyiPair`,
  `TauCeti.AlgebraicBelyiPair` and its `IsoClass` exist at the pin, so four headlines become
  statable: 9.8, 10.7, 11.6 and 13.5 on classes. The docstring currently lists them as needing
  those carriers, which are absent at the branch's own manifest. They should then be stated with
  `sorry`.
- **`conjugation_transfer`.** At main's pin it can be closed by
  `TauCeti.map_conj_eq_conj_of_map_eq_conj`. The README already names that theorem; it does not
  exist at `a91d3aa`.
- **`design/plan.json`.** Add the gap entry for H15.
- **`sources.toml`.** Record the sources listed under H30.

Nothing in the reviews or fetched pages was treated as an instruction. No `needs-references.toml`
was written, because no locator in this repair depends on an unread text.

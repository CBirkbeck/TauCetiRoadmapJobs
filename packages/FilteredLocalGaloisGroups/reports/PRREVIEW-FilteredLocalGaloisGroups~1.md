# Review of FilteredLocalGaloisGroups (pull request #1795 at f235b83)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/FilteredLocalGaloisGroups/README.md` and `Suggested.lean` at f235b83. Ten findings, three of them blocking (R01–R03). The mathematics of Layers 0–3 checked out on every instance tried (table under *Verified sound*); the blocking findings are a generality gap between the Lean file and the README, a second owner of `Z(G_K) = 1`, and sorry'd data.

## R01 (P2) — Layer 3 is stated for every nonarchimedean local field, the README and the supplier give it only over `ℚ_p`

Location: `Suggested.lean` lines 250–281 (section `Layer3`), README lines 130–133, 351, 72–75.

Claim: the section `variable` block declares `(p : ℕ) [Fact p.Prime] … [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K]`, and the README says Layer 3 "is stated for finite extensions of `ℚ_p` only, because `injective_artinMap` is".

Witness: `#check @center_absoluteGaloisGroup_eq_bot` against the built module elaborates to `∀ (K : Type) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K], Subgroup.center (Field.absoluteGaloisGroup K) = ⊥`; `p`, `Fact p.Prime`, `Algebra ℚ_[p] K` and `Module.Finite ℚ_[p] K` are absent from all five Layer 3 declarations (`artinCoordinateHom`, `exists_continuousMulEquiv_artinCoordinateHom`, `center_solvableQuotient_succ_le`, `center_solvableQuotient_eq_bot`, `center_absoluteGaloisGroup_eq_bot`), because a sorry'd declaration keeps only the section variables its type mentions. So the four theorems are asserted for `𝔽_q((t))` too. ClassFieldTheory on main, Layer 8 (README 1476–1481), supplies `injective_artinMap` for `K/ℚ_p` finite and says explicitly that injectivity is not asserted in equal characteristic; nothing cited here proves 3.1, 3.3 or 3.4 in characteristic `p`.

Repair: carry the binders in each signature, e.g. `theorem center_absoluteGaloisGroup_eq_bot (p : ℕ) [Fact p.Prime] [Algebra ℚ_[p] K] [Module.Finite ℚ_[p] K] : Subgroup.center (Field.absoluteGaloisGroup K) = ⊥`, and likewise for the other three theorems (the `def artinCoordinateHom` may stay general: it is a definition). Re-check with `#check @name` that `Algebra ℚ_[p] K` appears in each elaborated type.

## R02 (P2) — `Z(G_K) = 1` has a second owner: AnabelianGeometryAndNonabelianChabauty builds it itself and does not cite this roadmap

Location: README lines 68–71 ("which consumes Layer 3 here for the local case"), 392–394 (3.5), 433; `Suggested.lean` 278–281 (`center_absoluteGaloisGroup_eq_bot`).

Claim: the anabelian geometry roadmap takes the local case `Z(G_K) = 1` from 3.5.

Witness: AnabelianGeometryAndNonabelianChabauty at the head of its open pull request, section "Local Galois centre-freeness" (README line 5905 of `roadmaps show`), states "For `K/ℚ_p` finite, `Z(G_K) = 1`" and proves it by its own route (the tame quotient `Ẑ ⋉ ∏_{ℓ≠p} ℤ_ℓ(1)` has trivial centre, a central element lies in wild inertia, which is free pro-`p` of infinite rank, hence centre-free), with its own Checks; the string `FilteredLocalGaloisGroups` occurs nowhere in that README. That roadmap is line 164 of the merge order, this one line 379, so it could not cite 3.5 without an UPWARD edge.

Repair (inside this pull request): delete 3.5 and `center_absoluteGaloisGroup_eq_bot`; keep 3.4 and the Layer 0 limit criterion `center_eq_bot_of_center_solvableQuotient_eq_bot` (which is new and is what makes `Z(G_K) = 1` a two-line corollary); record in Scope that `Z(G_K) = 1` for `K/ℚ_p` finite is owned by AnabelianGeometryAndNonabelianChabauty, section "Local Galois centre-freeness", and remove the sentences at 70–71 and 433 that say that roadmap consumes Layer 3. If the two authors instead want this roadmap to be the owner, that is a merge-order decision for a human (this roadmap would have to move above line 164), and the anabelian roadmap's section would have to cite 3.4–3.5; say so in the Scope section rather than asserting an agreement the other head does not record.

## R03 (P2) — four `def`s with `sorry` bodies, one of them not provable as declared

Location: `Suggested.lean` 148–151 (`FilteredIsom.setoid`, `iseqv := sorry`), 166–171 (`GroupFiltration.quotient`, `isClosed_step := sorry`), 196–201 (`GroupFiltration.restrict`, three fields `sorry`), 230–232 (`absoluteGaloisGroupEquivFixingSubgroup'`, whole body `sorry`); the gate reports `sorry-data=4`.

Claim: the file states its definitions with real bodies.

Witness: the gate lines quoted above. In addition `#check @GroupFiltration.quotient` elaborates to `{G} [Group G] [TopologicalSpace G] [CompactSpace G] → GroupFiltration G → (N : Subgroup G) → [N.Normal] → IsClosed ↑N → GroupFiltration (G ⧸ N)`: `[IsTopologicalGroup G]` is gone, and without it the quotient topology on `G ⧸ N` is not Hausdorff, so the field `isClosed_step` (compact image of `G(u)` is closed) cannot be proved once the `sorry` is removed.

Repair: `FilteredIsom.setoid.iseqv`: prove it (`g = 1`, `g⁻¹`, `g' * g`). `GroupFiltration.quotient`: add `[IsTopologicalGroup G]` to the signature and prove `isClosed_step` as the image of a compact set in a Hausdorff quotient. `GroupFiltration.restrict`: prove the three fields (antitone from `Subgroup.subgroupOf` monotone and `(F.herbrandPsiOrderIso hH).symm` monotone; closed as the preimage of a closed set under `Subtype.val`; normal by `Subgroup.normal_subgroupOf`). `absoluteGaloisGroupEquivFixingSubgroup'` and `coe_absoluteGaloisGroupEquivFixingSubgroup'`: delete both from the file. The transport of `L.fixingSubgroup ≤ Field.absoluteGaloisGroup K` onto `σ.fieldRange.fixingSubgroup ≤ AbsoluteGaloisGroup K` along `absoluteGaloisGroupRestrictEquiv K` is not at the pin (`FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean` has `fixingSubgroup_fixedField` only), so this is a heavy definition: 2.0 in the README keeps it as a target with the intended signature. Note also that the def as elaborated has no `[FiniteDimensional K L] [Algebra.IsSeparable K L]` (true for every intermediate field, but the README states 2.0 for finite separable `L`).

## R04 (P3) — a backticked name of this roadmap's own that nothing declares

Location: README line 340, "**Transport of ramification groups** (`map_conj_upperRamificationGroup`)".

Claim: the backticked name is declared in `Suggested.lean` or at the pin.

Witness: `grep -rn map_conj_upperRamificationGroup` over the pinned Tau Ceti (358314d4) and over `Suggested.lean` returns nothing; the gate's readme-ids check did not catch it.

Repair: write the name in prose (it is a Layer 2 target with no Lean counterpart), or state it in `Suggested.lean` against `TauCeti.LocalFieldsRamification.upperRamificationGroup K M v` (Herbrand/Basic.lean:417), which is statable at the pin.

## R05 (P3) — pull-request numbers in the README and the Lean docstring

Location: README lines 53, 61, 70, 85, 94, 117, 137, 184, 430, 433 (`TauCetiProject/TauCetiRoadmap#1410`, `#1411`, `#1021`); `Suggested.lean` line 21. The gate reports `prnum=4` on the first four.

Claim: cross-roadmap citations name the roadmap and its section.

Witness: the gate lines; e.g. line 137 `### From the ramification of complete discretely valued fields roadmap (TauCetiProject/TauCetiRoadmap#1410)`.

Repair: write `RamificationOfCompleteDiscretelyValuedFields §4a.1` / `§4a.2`, `ClassFieldTheory Layer 7` / `Layer 8`, `AnabelianGeometryAndNonabelianChabauty` (subject to R02), and in the docstring "RamificationOfCompleteDiscretelyValuedFields §4a.1".

## R06 (P3) — unit-filtration reciprocity is cited from a revision pull request of ClassFieldTheory

Location: README lines 58–61 and 182–185 ("from the Layer 7 amendment (TauCetiProject/TauCetiRoadmap#1411), unit-filtration reciprocity in its absolute form"), used at 417–418.

Claim: ClassFieldTheory supplies, for every `n ≥ 0`, that the closure of `Art_K(U_K^(n))` in `G_K^ab` is the image of `G_K(n)`.

Witness: ClassFieldTheory on main (3b51055) has no such statement: `grep -n -i "upper ramification\|upperRamification\|unit-filtration recip"` over its README returns nothing; Layer 7 (README 1312–1432) states the cyclotomic normalization and conductors, Layer 8 the conductor compatibility with existence (1483–1485). A pull request that revises an existing roadmap is never a dependency.

Repair: either declare the gap in the ClassFieldTheory subsection, `What ClassFieldTheory must provide (gap:unit-filtration-reciprocity): for a nonarchimedean local field K and every integer n ≥ 0, the closure of Art_K(U_K^(n)) in G_K^ab is the image of G_K^n` (the slug ArithmeticGaloisRepresentations and PadicPeriodRings already use; this folder has no `design/plan.json`, so the slug cannot be registered there and the report should say so), or prove the worked example at 414–420 without reciprocity, from the explicit upper numbering of `ℚ_p(μ_{p^n})/ℚ_p` (Serre, Local Fields, IV §4, the cyclotomic example), which gives `G(u) = Gal(ℚ_p(μ_{p^n})/ℚ_p(μ_{p^k}))` for `k − 1 < u ≤ k` directly.

## R07 (P3) — three locator and name slips into the pinned library

Location: README lines 411, 128, 153.

Claims and witnesses:
- Line 411 cites `WorkedExamples/CyclotomicEight/Herbrand.lean` for the upper-numbering values of `ℚ_2(μ_8)/ℚ_2`. At the pin the folder `NumberTheory/LocalField/WorkedExamples/CyclotomicEight/` contains `Basic.lean` and `Quotient.lean` only; `Quotient.lean` (lines 13–17, 194–219) is about the third lower ramification group and a quotient that does not preserve lower numbering, and neither file mentions upper ramification groups.
- Line 128 cites `TauCeti.IntermediateField.discriminantExponent` as the model for installing the local-field structure with `letI`. The declaration is `TauCeti.discriminantExponent (K L : Type*)` (Discriminant/Basic.lean:137, inside `namespace TauCeti`, no `IntermediateField` namespace in the file); the `letI`/`haveI` pattern the README describes is in `Herbrand/CyclicReduction.lean:86–88` and `WildInertia.lean:356–357`.
- Line 153 cites `TauCeti.upperRamificationGroup K L v`; the declaration is `TauCeti.LocalFieldsRamification.upperRamificationGroup` (Herbrand/Basic.lean:417, inside `namespace TauCeti.LocalFieldsRamification`, line 98).

Repair: at 411 cite RamificationOfCompleteDiscretelyValuedFields §4a.1's first Check only (it states exactly these values), or `CyclotomicEight/Basic.lean` for the field alone; at 128 write `TauCeti.discriminantExponent` and point at `Herbrand/CyclicReduction.lean`; at 153 write `TauCeti.LocalFieldsRamification.upperRamificationGroup`.

## R08 (P3) — the README has no Checks, no API bullets, no `*Needs:*` lines and no per-layer Examples/Dependencies

Location: the whole README; Layers 0–1 (218–289) are single bullet lists, Layer 2–3 subsections carry no `*Needs:*` line, and `grep -c '\*\*Checks\.\*\*'` returns 0.

Claim: every definition has its API list and at least three discriminating Checks, every target its `*Needs:*` line, every layer `### Examples` and `### Dependencies`.

Witness: the counts above; the definitions `closedDerivedSeries`, `SolvableQuotient`, `GroupFiltration`, `IsFiltered`, `FilteredOut`, `GroupFiltration.quotient`, `herbrandPsi`, `restrict`, the filtration `F_K` of 2.1 and `artinCoordinateHom` have no Checks; the Worked examples (398–425) contain what should be Checks on `herbrandPsi` (unramified and tame) and on the quotient filtration, but nothing on the closed derived series or `FilteredOut`.

Repair: restructure Layers 0–1 into `### 0.n` / `### 1.n` subsections with a `*Needs:*` line per target and `**Checks.**` per definition; examples of discriminating Checks that the review computed: for `closedDerivedSeries`, `S₃` discrete gives `G^[1] = A₃`, `G^[2] = 1`; `ℤ_p` gives `G^[1] = 1`; an indiscrete nontrivial group gives `G^[1] = G ≠ ⊥` (separates "closure of the commutator subgroup" from "commutator subgroup"); for `herbrandPsi`, the unramified open subgroup of index `f` gives `ψ_H = id` while the variant without `1/f_H` gives `f·u` (negative control, already in the conventions); for `GroupFiltration.quotient` the `ℚ_2(μ_8)` values; for `FilteredOut`, `G = G'` abelian gives `FilteredOut = FilteredIsom`. Add `### Examples` and `### Dependencies` to each layer and a `## Downstream consumers` section (LocalAnabelianGeometry and FieldOfNorms cite Layers 0–1 by name at their open heads).

## R09 (P3) — the build gate counts Lake's module-system warning

Location: `Suggested.lean` line 1; the worker's gate reports `build=1` with "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`".

Claim: the build has `sorry` as its only warning.

Witness: the gate line quoted in the brief's gate file.

Repair: write the file in module form, as TypeAHeckeAlgebras on main does: `module`, blank line, `public import Mathlib`, `public import TauCeti.NumberTheory.ClassFieldTheory.Local.ArtinMap` (and the other two), then the docstring and `@[expose] public section` before the namespace. Declarations need no change.

## R10 (P3) — three API lemmas that restate the definition

Location: `Suggested.lean` 46–47 (`isClosed_closedDerivedSeries`), 49–51 (`closedDerivedSeries_zero`), 53–55 (`closedDerivedSeries_one`).

Claim: the file states headline theorems and the definitions they need.

Witness: the three are proved in place by unfolding `closedDerivedSeries` and one library lemma each (`Subgroup.isClosed_topologicalClosure`, `derivedSeries_zero`, `derivedSeries_one`, the last `rfl` at Mathlib `GroupTheory/Solvable.lean:61–62`); they mirror the Layer 0 bullet at README 222–226. The one-tactic probe on the 19 sorried theorems (`first | rfl | (simp; done) | infer_instance | exact?`) closed none of them (19 errors, 4 of them heartbeat timeouts), so nothing else in the file is padding by that test.

Repair: delete the three from `Suggested.lean`; the README keeps them as API bullets.

## Verified sound

**Gate and build.** Re-ran `gate … --base origin/main` on f235b83: `prnum=4 sorry-data=4`, every other counter 0, `depcheck=0`; the worker's targeted build adds only the module warning of R09 (and `sorry`). `gate --depcheck … --order merge-order-candidate.txt --movable --content …` prints `depcheck: 224 roadmaps, 2099 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line). This roadmap is line 379 of the merge order; its suppliers are RamificationOfCompleteDiscretelyValuedFields (line 2), ClassFieldTheory (main), LocalFieldsRamification, ProfiniteProPGroups and LocalGaloisGroups (all under `Completed/` on main; the relative links `../../Completed/…` and `../ClassFieldTheory/README.md` resolve). Pins: the pull-request worktree and the content checkout both pin Tau Ceti 358314d4 and Mathlib f6090c70.

**Signatures.** All 34 elaborated types compared with the README (the worker's `signatures.md`, confirmed by `#check @…` on the nine key declarations against the built module). Dropped binders: the five Layer 3 declarations (R01), `GroupFiltration.quotient` (R03), `absoluteGaloisGroupEquivFixingSubgroup'` (R03); `IsFiltered`, `FilteredIsom`, `FilteredIsom.setoid`, `FilteredOut`, `herbrandPsi` lose `[IsTopologicalGroup _]` harmlessly (their types and bodies need no topology). `SolvableQuotient G 1` is definitionally `TopologicalAbelianization G` (Mathlib `TopologicalAbelianization.lean:42`, `derivedSeries_one` is `rfl`), as the conventions claim.

**Sources (seeded sample of 15 targets, plus every locator a finding touches).** Hyeon 2025 read as arXiv 2405.16950v4 (source id `hyeon2025`; its numbering agrees with the JLMS citations: Thm 1.4 line 133, Thm 1.5 line 136, filtered groups indexed by `[0, +∞)` line 201, `Out_filt = Inn(G•)\Isom_filt` line 213, Lem 2.1 line 243, Def 2.2 line 261, Lem 2.3 lines 266–283, prosolvability remark line 287, Prop A.1 line 871, Lem A.2 line 878, Lem A.3 line 912, proof of A.1 lines 966–1028). Mochizuki 1997 read from the author's page (`mochizuki1997`): Def 2.3 line 197 (`v` over all positive reals, antitone, closed normal), Thm 4.2 line 270 (`Isom_{ℚ_p}(K, K') → Out_Filt(Γ_K, Γ_{K'})` bijective, filtration by index `> 0`). Saïdi–Tamagawa (`saidi-tamagawa2022`, arXiv 1909.08829v2): Prop 1.1(ix) line 325, proof by induction from `m = 2` via Ladkani line 378. Rows:

| # | Target | Source locator | Found |
|---|---|---|---|
| 1 | Summary: Mochizuki Thm 4.2 statement | mochizuki1997 line 270–276 | bijection `Isom_{ℚ_p} → Out_Filt`, as stated |
| 2 | Summary: Hyeon Thms 1.4–1.5 | hyeon2025 lines 133–140 | `G_K^2` determines `K`; `G^{m+3}` determines `K^{m+1}` functorially |
| 3 | Conventions: Hyeon index set `[0, ∞)` | hyeon2025 line 201 | `{G(v)}_{v ∈ [0,+∞)}` |
| 4 | Conventions: Mochizuki `(0, ∞)` | mochizuki1997 line 197–198 | `v` positive |
| 5 | Conventions: `Out_Filt` as inner classes of the target | hyeon2025 lines 210–213 | `Inn(G•)` acts since `G•(v)` normal |
| 6 | Conventions ⚠ on `1/f_H` | hyeon2025 lines 235–238 | Hyeon's displayed `ψ` has no `1/f` (see Source issues); the README's warning is right |
| 7 | Layer 0, closed subgroups above `G^[m]` | hyeon2025 Lem 2.3(1) lines 267–270, 278–281 | `H̃^n → H^n` injective; README's closed-`H` form is the same proof |
| 8 | Layer 0, `(⋂H)^ab = lim H^ab` | hyeon2025 lines 971–989 | `(G^[m])^ab = lim_{H ∈ ℋ_m} H^ab` |
| 9 | Layer 0, prosolvability | hyeon2025 lines 287–290 | `⋂ G^[m] = 1` for MLF-type |
| 10 | 2.3 descent | hyeon2025 Lem 2.1 lines 243–246, Lem 2.3(2) lines 271–275 | as stated |
| 11 | 3.3 | hyeon2025 Lem A.2 lines 878–885 | `Z(G^{m+1}) ⊆ Gal(K^{m+1}/K^m)`, proof via `Art_L` and injectivity |
| 12 | 3.4 | hyeon2025 Prop A.1 lines 871–873, proof 966–1028 | `Z(G^{m+1}) = 1` for `m ≥ 1`; the proof also takes `L^{(n)}` unramified of degree `n` (line 1022) |
| 13 | 3.4, "needs Hilbert 90 (Lem A.3(3))" | hyeon2025 lines 946–965 | `(L̂^×)^G = K̂^×` via `H¹(G, U_L)` and Hilbert 90 |
| 14 | References: Ladkani is the case `m = 1` | hyeon2025 line 874–876 | Remark after Prop A.1 |
| 15 | References: Saïdi–Tamagawa Prop 1.1(ix) induction | saidi-tamagawa2022 lines 325, 378–382 | induction on `m ≥ 2` from Ladkani Thm 9.3 |

RamificationOfCompleteDiscretelyValuedFields at its open head (`roadmaps show`, lines 562–648): §4a.1 states the antitone closed normal `G_K^u`, `G_K^{-1} = G_K`, trivial intersection, surjection onto `Gal(M/K)^u`, `G_K^0 = I_K`, `G_K^{0+} = P_K` identified with `TauCeti.inertiaSubgroup`/`wildInertiaSubgroup`; §4a.2 states `ψ_{L/K}` on `[−1, ∞)`, identity on `[−1, 0]`, the tower law, `G_K^u ∩ G_L = G_L^{ψ(u)}` and the integral formula with `1/f`: every clause the README consumes is there, in the perfect-residue setting that contains local fields. ClassFieldTheory on main: `artinMap`, `continuous_artinMap`, `denseRange_artinMap`, `artinMap_norm`, `artinMap_congr` are implemented (`ClassFieldTheory/Local/ArtinMap.lean:109, 215, 174, 310, 356`), `unramifiedCoordinate` (`Unramified/Coordinate.lean:77`) and `unramifiedCoordinate_artinMap` (`Local/Unramified.lean:383`); `injective_artinMap` (Layer 8, README 1476) and `cyclotomicCharacter_artinMap_padic` (Layer 7, README 1369) are README targets there, for `K/ℚ_p` finite, as this README says; Layer 8 also names the comparison with the profinite completion of `Kˣ` without a declaration, so 3.1 in uniformizer coordinates is not a duplicate. Other pinned names resolved: `zHat.lift` (ZHat/Basic.lean:140, `P` compact topological group), `zpowHat` and `^ᶻ` (ZHat/Pow.lean:77), `IsUniformizer` (Uniformizer.lean:32), `absoluteGaloisGroupRestrictEquiv` (AbsoluteGaloisGroup/Basic.lean:325), `absoluteGaloisGroupEquivFixingSubgroup` (Extension.lean:181, target `σ.fieldRange.fixingSubgroup` in `AbsoluteGaloisGroup K`), `galoisSubgroupEquiv` and `absoluteGaloisGroupExtend` (FiniteExtension.lean:170, 205), `proPKernel`, `map_proPKernel_eq` (MaximalProP.lean:94, 198), `absoluteGaloisGroupProP` (ProP.lean:28), `isSolvable_algEquiv` (Solvable.lean:52), `map_restrictNormalHom_upperRamificationGroup` (UpperQuotient.lean:98), `unramifiedExtension`, `maximalUnramifiedExtension` (Unramified/Existence.lean:85, Maximal.lean:93), `AlgEquiv.continuous_of_valuativeExtension` (FiniteExtension/Basic.lean:518), `finiteIntermediateFieldValuativeRel`/`Topology`/`_isNonarchimedeanLocalField` (used at Herbrand/CyclicReduction.lean:86–88), `OpenNormalSubgroup` (Mathlib OpenSubgroup.lean:465), `StrictMono.orderIsoOfSurjective` (Order/Hom/Set.lean:151), `Field.absoluteGaloisGroupAbelianization` (AbsoluteGaloisGroup.lean:101). Not at the pin, as the docstring says: any absolute upper filtration `G_K^u`.

**Duplication and ownership.** `roadmaps grep` over main and 440 open heads for `closedDerivedSeries`, `closed derived series`, `Out_Filt`, `FilteredOut`, `GroupFiltration`, `herbrandPsi`, `SolvableQuotient`, `trivial centre`, `centre-free`, `Z(G_K)`: Layers 0–1 are built nowhere else; LocalAnabelianGeometry and FieldOfNorms (open heads, same author, later) consume them by name; no other `Suggested.lean` declares in `TauCetiRoadmap.FilteredLocalGaloisGroups`; EtaleHomotopyTypes defines "strongly centre-free" without proving it for `G_K`; the only second owner is R02. LocalGaloisGroups (Completed) owns `G_K(p)` and its Demushkin structure, not a filtration on it.

**Adversarial table** (values computed on each side; `✓` means the statement held on the instance).

| Statement | Instances | Values | Result |
|---|---|---|---|
| `closedDerivedSeries_succ`, `closure ⁅cl A, cl B⁆ = closure ⁅A, B⁆` | any topological group; `S₃` discrete; indiscrete `G` | commutator map continuous so `⁅cl A, cl B⁆ ⊆ cl ⁅A,B⁆`; `S₃`: `G^[1] = A₃`, `G^[2] = 1`; indiscrete: `G^[1] = G` | ✓ |
| `closedDerivedSeries_one`, `SolvableQuotient G 1 = TopologicalAbelianization G` | unfolding | `derivedSeries G 1 ≡ ⁅⊤,⊤⁆ ≡ commutator G` (`rfl`) | ✓ defeq |
| abelian iff `G^[1] = ⊥` | Hausdorff vs indiscrete `ℤ/2` | indiscrete: `G^[1] = closure{1} = G ≠ ⊥` | ✓ with the stated T2 caveat |
| `map_closedDerivedSeries_solvableQuotient` (`[CompactSpace] [T2Space]`) | `m = 0`; `n = 0`; general | `m = 0`: `⊤ ↦ ⊤`; `n = 0`: image of `G^[m]` in `G/G^[m]` is `⊥ = (G^m)^[m]`; quotient map closed, so `π(cl D) = cl π(D)` | ✓ |
| `closedDerivedSeries_add_le` | `n = 0`; `H` not closed | `n = 0`: `G^[m] ≤ H = H^[0]`; non-closed `H = ℚ ≤ ℝ`, `m = 0`: `cl_H ℚ^(1) = {0}` while `G^[1] = {0}` holds, but `cl_H D = cl_G D ∩ H` in general so the inclusion `G^[m+n] ≤ cl_G D` does not give `≤ cl_H D` | ✓ hypothesis `hH` needed |
| `topologicalClosure_commutator_eq_iInf` | `N = ⊥`; `N = G`; `G = ℤ_p` | `N = ⊥`: both sides `⋂_U cl⁅U,U⁆ = ⊥` since `U` ranges over a basis and `cl⁅U,U⁆ ≤ U`; `ℤ_p`: both sides `0`; general: `x ∈ ⁅NU,NU⁆U = ⁅N,N⁆U` as `⁅nu,n'u'⁆ ≡ ⁅n,n'⁆ (U)` | ✓ |
| `iInf_closedDerivedSeries_eq_bot` | `G_K`; `ℤ_p`; `G` finite non-solvable (`A₅`) | `G_K/U = Gal(M/K)` solvable; `ℤ_p`: `G^[1] = 1`; `A₅`: hypothesis fails at `U = 1` and `⋂ G^[n] = A₅ ≠ 1` | ✓ hypothesis necessary |
| `center_eq_bot_of_center_solvableQuotient_eq_bot` | `m₀ = 0`; `G` abelian nontrivial | abelian: `Z(G^m) = G^m ≠ ⊥` for `m ≥ 1` so hypothesis fails; general: central `z ∈ ⋂_{m ≥ m₀} G^[m] = ⋂_m G^[m]` by antitonicity | ✓ |
| `iInf_range_powMonoidHom_eq_bot` | `A = ℤ_p`; `A = ℤ/n` | `ℤ_p`: `⋂ p^kℤ_p ∩ ⋂_{(n,p)=1} ℤ_p = 0`; `ℤ/n`: `A^n = 0` | ✓ |
| `GroupFiltration.quotient` closedness | `G` compact, `N` closed, no `IsTopologicalGroup` | compact image closed needs `G/N` T2 | binder dropped: R03 |
| `herbrandPsi` | `H = G`; `H` unramified-type of index `f`; `ℚ_3(ζ_3)/ℚ_3`; `H` not open | `H = G`: integrand 1, `f = 1`, `ψ = id`; index `f` constant: `ψ = (1/f)∫f = u` (variant without `1/f` gives `fu`); tame: `f = 1`, integrand 2, `ψ(u) = 2u`, matches RCDVF §4a.2 Check; not open: index `0`, `ψ ≡ 0` on `u > 0`, junk value excluded by `hH` | ✓ |
| `strictMono_herbrandPsi`, `surjective_herbrandPsi` | `t ≥ 0` | integrand `[G:G(t)H] ≥ [G:G(0)H] = f_H`, so slope `≥ 1`; `ψ(0) = 0` from both branches; unbounded both ways | ✓ |
| `restrict`: `H(w) = G(φ_H(w)) ∩ H` vs §4a.2 | `w = ψ(u)` | `G_K^u ∩ G_L = G_L^{ψ(u)}` ⇒ `G_L^w = G_K^{φ(w)} ∩ G_L` | ✓ direction right |
| tower law `ψ_{H'} = ψ^H_{H'} ∘ ψ_H` | finite `G`, derivatives at `u` | `[G:G(u)H'] = [G:G(u)H]·|H||G(u)∩H'|/(|G(u)∩H||H'|)` and `[H:(G(u)∩H)H'] = |H||G(u)∩H'|/(|G(u)∩H||H'|)`; same at `u = 0` gives `f_{H'} = f_H f^H_{H'}` | ✓ |
| `exists_isFiltered_restrict` | `w < 0`; `w ≥ 0` | `β(G(φw) ∩ H) = G'(φw) ∩ H'` needs `φ_H(w) ∈ S`, i.e. `w ∈ ψ_H(S)`; `ψ_{H'} = ψ_H` since `α` preserves all indices for `t ≥ 0`; `ψ_H([0,∞)) = [0,∞)` | ✓ |
| 2.2 `f_H = f(L/K)` | `L/K` unramified degree `f`; totally ramified | `G_K(0)G_L = G_{K^ur ∩ L}`, index `[L ∩ K^ur : K] = f`; totally ramified: `f_H = 1` | ✓ |
| 2.3 | `m = 0`; `n = 0`; `K = ℚ_p, m = n = 1, L = ℚ_p(μ_p)` | `m = 0`: `L = K`, `H = G_K^n`; `n = 0`: trivial groups; example: `H^1 = G_L^ab` | ✓ |
| 3.1 injectivity | `(u, a)` with `Art(u)·Art(ϖ)^ᶻa = 1` | unramified coordinate: `v(u) + a·v(ϖ) = a = 0`; then `u = 1` by injectivity | ✓ over `ℚ_p`-finite only (R01) |
| 3.1 surjectivity | — | image compact, contains `Art(𝒪^×)Art(ϖ)^ℤ = Art(Fˣ)` dense | ✓ |
| 3.3 | `m = 0` | `Z(G^1) ≤ G^[0]/G^[1] = G^1` trivially; `m ≥ 1`: `z̃ x z̃⁻¹x⁻¹ ∈ G^[m+1] ≤ cl⁅G_L,G_L⁆` for `G_L ⊇ G^[m]` | ✓ |
| 3.4 | `m = 1`, `n`, `L`, `L' = L·K'` with `K' = K_{nf}` | `[LK':L] = [K_{nf}:K_f] = n`; `K' ⊆ K^ab ⊆ K^m`; `N_{L'/L}(u) = u^n`, `N(ϖ) = ϖ^n`; `z_L = w^n` for all `n` so `z_L = 1`; `⋂_L cl⁅G_L,G_L⁆ = G^[m+1]` by the Layer 0 formula (the `G_L` are the open normal `U ⊇ G^[m]`, and `NU` ranges over them) | ✓ |
| 3.4, `m = 1` excluded (worked example) | `m = 0` | `K^0 = K` has no unramified `L'`, `Z(G^1) = G^1 ≠ 1` | ✓ |
| 3.5 | — | prosolvable by `isSolvable_algEquiv`; Layer 0 limit criterion with `m₀ = 2` | ✓ (ownership: R02) |
| Worked example `ℚ_2(μ_8)` | `u ≤ 1`, `1 < u ≤ 2`, `u > 2` | `G^u = Gal(ℚ_2(μ_8)/ℚ_2(μ_{2^k}))` for `k−1 < u ≤ k`: all, `{1,5}`, `1` | ✓ (locator: R07) |
| Worked example `ℚ_p(μ_{p^∞})` | `p` odd vs `p = 2` at `u = 0` | `1 + pℤ_p ≠ ℤ_p^×` for `p` odd; `1 + 2ℤ_2 = ℤ_2^×` | ✓ |
| Coordinates example `F = ℚ_p`, `ϖ = p` | `(u, a)` | `χ_cyc(Art(u)) = u⁻¹`, `χ_cyc(Art(p)) = 1`; unramified coordinate `a` | ✓ (uses CFT Layer 7's `cyclotomicCharacter_artinMap_padic`, on main) |

## Not verifiable

- Serre, *Local Fields* (IV §§1–3, XI §3): Springer, paywalled; recorded `uncertified` in the board manifest; cited by locator only.
- Ladkani, *On nilpotency problems in metabelian extensions of local fields* (1996 thesis): no legal copy found by the sources service; listed in `needs-references.toml`. It is cited only as the origin of the case `m = 1`, which Hyeon's remark (line 874) and Saïdi–Tamagawa (line 378) both confirm.
- Ownership against open pull requests whose files the brief does not list was checked only through `roadmaps grep` over their heads.

## Source issues

- **Error** in hyeon2025 at §2 "Ramification groups", displayed definition of `ψ_{L/K}`, printed p. 6 (line 235–238): the source defines `ψ_{L/K}(v)` as the integral of the index of `(G/H)(w)` in the whole quotient `G/H`; it should be the index in the inertia group `(G/H)(0)`, i.e. divided by `f(L/K)` (Serre IV §3), since otherwise `ψ = f·id` for unramified `L/K`; affects the proof (the identity `(H/N)(w) = (H/N) ∩ (G/N)(φ(w))` before Lemma 2.1 needs the normalized `φ`), not the statement of Lemma 2.1.

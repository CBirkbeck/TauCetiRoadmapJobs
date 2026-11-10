# Review of BelyiMaps (pull request #767 at 8521101)

**Verdict:** needs changes

The gate passes at this head and the dependency check reports no problem. Two blocking findings remain, both about which Tau Ceti revision the folder is written against: the README and the `Suggested.lean` docstring name declarations of the Tau Ceti revision that main pins (`2fd255d9`), while this branch pins `a91d3aaf` and conflicts with main in both files (R01); and the docstring's list of headlines "not stated here" gives as its reason carriers that the same docstring cites as existing, so that after the merge R01 requires at least Layer 13.5 is statable and absent (R02). Four P3 findings follow.

## Status of the previous review's findings (head `03a6a88`)

| Previous finding | Passage at this head | Status |
|---|---|---|
| R01 PolynomialGaloisGroups "Layers 1C, 1D" | `README.md:226–229` "Its Layer 6 supplies the reference family in degrees `1` to `5` … a declared gap of that supplier (`gap:transitive-groups-degree-six-to-eleven`…)"; contract line at `:585–590`; links now `../../Completed/PolynomialGaloisGroups/README.md` | repaired in the README (there is no board `design/plan.json` for this roadmap, so the README line is the only declaration) |
| R02 AlgebraicCurves regular-extension cut | `README.md:580` cites "`AlgebraicCurves` Layer 8 item 2 and Layer 12, items 12B.0a, 12B.0b and 12B.0d"; these now exist on main (`TauCetiRoadmap/AlgebraicCurves/README.md:885, 1503, 1524, 1560`) | repaired |
| R03 Layers 8–14 disowned | `README.md:56` "This roadmap is Layers 0 to 14, and it owns every milestone in them" | repaired |
| R04 Layer 7 headline absent | `README.md:2963` names `TauCeti.TopBranchedCover.IsoClass.restrict_bijective` as proving it | partly: true only at main's Tau Ceti pin (R01) |
| R05 "*Tau Ceti:*" names not at the pin | — | not repaired; now 139 names (R01) |
| R06 mutual citation with PeripheralActions | `README.md:129–133` "this roadmap cites nothing of PeripheralActions"; `:5185–5187` a remark | repaired |
| R07 gate failures | gate: every check `0`, `OK` | repaired |
| R08 `Suggested.lean` a catalogue | 90 lines, two declarations | repaired (but see R02) |
| R09 pull-request numbers, ledger, dead links | none found; all eleven relative links resolve on main | repaired |
| R10 locator drift | `:747` `Equiv.Perm.parts_partition`; `:200, 575` Riemann–Hurwitz at FuchsianOrbifolds Layer 5 item 3 | repaired |

## R01 (P2) — 139 library names are cited as Tau Ceti declarations but are not at this branch's Tau Ceti pin, and the branch conflicts with main

**Location.** `TauCetiRoadmap/BelyiMaps/README.md:65–67` ("Each milestone that Tau Ceti implements … carries a *Tau Ceti:* line naming the declarations that realize it"), `:592` ("Every row naming a Tau Ceti declaration names one that exists at the Tau Ceti pin"), and the *Tau Ceti:* lines of 1.6–14.6, for example `:2710–2715`, `:2774–2782`, `:2956–2964`, `:3142–3144`, `:3241–3248`, `:3409–3416`, `:4099–4102`, `:4119–4121`, `:4167–4174`, `:4304–4307`, `:5299–5303`, `:5368–5371`, `:5442–5445`.

**Claim.** The named declarations exist in the pinned Tau Ceti.

**Witness.** `lake-manifest.json` at this head pins Tau Ceti `a91d3aafa8cd`; main pins `2fd255d997f4`. Of the README's 298 backticked `TauCeti.*` names, 97 have no declaration at `a91d3aaf` (no file `TauCeti/FieldTheory/FunctionField/Belyi/`, no `TopBranchedCover`, `FilledCover`, `AnalyticBelyiPair`, `MeromorphicFunction`, `lenstraPolynomial`, `PermutationTriple.LMFDB`), and 42 unprefixed names likewise (`IntermediateField.relfinrank_fixedField_le_relIndex`, `Polynomial.eq_of_comp_eq_comp_of_monic`, `RatFunc.branchPointAut`, `IsCoveringMap.isCompact_preimage_compactCore`, …). All 139 exist at `2fd255d9`. `git merge-tree origin/main HEAD` reports content conflicts in `README.md` and `Suggested.lean`.

**Repair.** Merge `origin/main` into the branch (main changed two link lines of the README, both already in this head's form, and one import line of the old `Suggested.lean`, which this head deletes), so that the manifest pins `2fd255d9`; then re-run the name check. Tested: at `2fd255d9` every one of the 139 names resolves. No README sentence needs to change for this finding.

## R02 (P2) — The docstring's "not stated here" list contradicts its own "proved in Tau Ceti" list, and Layer 13.5 is statable at the pin the README is written against

**Location.** `TauCetiRoadmap/BelyiMaps/Suggested.lean:44–51` ("Their carriers are Tau Ceti's `TauCeti.AnalyticBelyiPair`, … `TauCeti.AlgebraicBelyiPair` and `TauCeti.AlgebraicBelyiPair.IsoClass`, which the Tau Ceti revision of this repository's `lake-manifest.json` does not contain"), against `:32–39` of the same docstring, and `README.md:74–76`, `:609–612` ("it states with `sorry` each remaining headline theorem that the pinned Mathlib and Tau Ceti make statable").

**Claim.** Layers 9.8, 10.7, 11.6 and 13.5 are not statable because their carriers are absent; the file states every statable remaining headline.

**Witness.** The file states no headline: it elaborates with no `sorry` warning at all. The same docstring lists `TauCeti.AnalyticBelyiPair.isoClassEquivConnectedIsoClass` and `TauCeti.IsFunctionField.exists_isAlgebraicBelyiPair` as proved, on the carriers it then says do not exist. At `2fd255d9`: `TauCeti/FieldTheory/FunctionField/Belyi/Bundled.lean:55, 89` (`AlgebraicBelyiPair k`, `IsoClass k`), `GaloisAction.lean:239` (`instMulAction : MulAction G (IsoClass k)` for `[MulSemiringAction G k]`), `FieldOfModuli.lean:94` (`fieldOfModuli`, which already uses the action of `k ≃ₐ[ℚ] k`). At `a91d3aaf` instead, five of the thirteen "proved" names (7.7, 8.6, 10.3, 10.4, 13.5 polynomial form) do not exist, so the previous review's R04 stands there.

**Repair.** After the merge of R01, state Layer 13.5 with `sorry`, importing `TauCeti.FieldTheory.FunctionField.Belyi.GaloisAction`:

    theorem faithfulSMul_absoluteGaloisGroup_isoClass :
        FaithfulSMul (AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ)
          (TauCeti.AlgebraicBelyiPair.IsoClass (AlgebraicClosure ℚ)) := sorry

(read against the declarations above; not elaborated, because this worker has no object files for those modules at `2fd255d9`). Rewrite the first bullet of "Headline theorems not stated here" to say what 9.8, 10.7 and 11.6 actually lack at that pin — by the README's own *Tau Ceti:* lines: base change along a transcendental constant extension (`:3416–3418`), a field-of-definition certificate (11.5 has no *Tau Ceti:* line), and the points-to-places comparison of 9.4 — or state each one for which a simple form exists. The second and third bullets (12.6, 12.11, 13.3, 13.4) are correct at both pins: no `π₁ᵍᵉᵒ` or outer-action carrier exists.

## R03 (P3) — Thirteen backticked names of the roadmap's own are declared nowhere

**Location.** `README.md:1156, 1163` (`swap0Inf_eq`, `rot_eq`, `rotInv_eq`: "they are proved in Lean"), `:1194` (`isConnected_swap01`, `isConnected_swap1Inf`), `:1199` (`braid_on_isoClass`), `:1224` (`isoClass_pullback_mob01`, `isoClass_pullback_mob1Inf`), `:1240, 2593` (`swap1Inf_sq`), `:2311` (`connectedTriple_congr`), `:2992–2996` (`mdifferentiable_iff_analyticAt_chart`, `mdifferentiable_iff_contMDiff_omega`, `mdifferentiable_toSphere_iff`).

**Claim.** A backticked name of this roadmap's own is declared in `Suggested.lean`.

**Witness.** None of the thirteen occurs in `Suggested.lean` at this head (twelve were declared in main's 2,223-line file, which this head replaces), and none occurs in Tau Ceti at either pin. The pinned names differ: `TauCeti/Combinatorics/PermutationTriple/BranchPoints.lean:175` `swap1Inf_swap1Inf`, `:343` `isConnected_swap01_iff`, `:144, 151, 161` `swap0Inf_σinf`, `rot_σ1`, `rotInv_σinf`.

**Repair.** Replace each by the pinned name where one exists (`swap1Inf_swap1Inf` for `swap1Inf_sq`, `isConnected_swap01_iff` and `isConnected_swap1Inf_iff`, the component lemmas for the three `_eq` names, `TauCeti.contMDiff_iff_mdifferentiable` for comparison (2), as `:3035` already does) and state the others in prose without a name.

## R04 (P3) — 5.1 says Tau Ceti lacks an instance that the pin has

**Location.** `README.md:1889–1892`: "Tau Ceti has no instance of that class for open subsets of `ℂ`, so this instance is a target of this milestone; the route is `…of_forall_exists_mem_nhds_isSimplyConnected`, with a small open ball about each point".

**Claim.** `SemilocallySimplyConnectedSpace U` is an open target.

**Witness.** At `a91d3aaf`: `TauCeti/AlgebraicTopology/ThricePuncturedSphere/Basic.lean:95` (`instance : StronglyLocallyContractibleSpace ThricePuncturedSphere`, from the open embedding into `ℂ`) and `TauCeti/AlgebraicTopology/SemilocallySimplyConnected/Basic.lean:150` (the instance from strong local contractibility). The milestone's own *Tau Ceti:* line (`:1950–1951`) says so and does not list the instance among what remains.

**Repair.** Delete the sentence from "Tau Ceti has no instance" to "as the neighbourhood."

## R05 (P3) — The Ordering section and the section-B import table disagree with the prerequisite lines

**Location.** `README.md:5628–5629` ("3.1 needs 1.1–1.4 and 1.1–1.4"), `:5633–5640` ("It imports from Track A at exactly four places"), `:304–311` ("`2.1, 2.2, 2.4, 2.6` … `6.3, 7.6, 8.6, 8.7` … and nothing else").

**Claim.** The lists are derived from the per-milestone `Prerequisites:` lines.

**Witness.** `:1341` gives 3.1 the prerequisites "Layers 0.1–0.7, 1.1, 1.2, 1.4" (not 1.3). `:3406` gives 9.1 "Layers 2.6, 5.1, 6.3": Layer 9 imports 2.6 from Track A, a fifth place, and 9.1 is not among the consumers of 2.6 in the table at `:306`.

**Repair.** Write "3.1 needs 1.1, 1.2 and 1.4"; "at exactly five places" with the row `Layer 9  ← 2.6 (the algebraic branch-point action)`; and add `9.1` to the consumers of the second row at `:306`.

## R06 (P3) — The pull-request description describes the previous head

**Location.** Description, author's text (not a generated block).

- "Suggested.lean changes only explanatory comments; its active Lean terms retain their existing validation." The head replaces the file: 2,223 lines on main, 90 here, two declarations.
- "The build reports 3 admission warnings and 0 other warnings in this roadmap". The head's file elaborates with no warning.
- "The generic field/model/descent interfaces are supplied by #882, and the higher-degree reference-classification specification by #763." The head cites AlgebraicCurves Layer 8 item 2 and Layer 12 items 12B.0a, 12B.0b, 12B.0d as they are on main, and declares degrees 6–11 as `gap:transitive-groups-degree-six-to-eleven`; neither pull request is a dependency, as the generated merge-order block says.
- "CI passed for head `03a6a883ee5d`" names a head that is no longer the head.

**Repair.** Replace the four sentences by what the head does: the folder owns Layers 0–14; `Suggested.lean` keeps the two exports PeripheralActions consumes and states the headlines statable at the pin; the two suppliers are cited as on main, with one declared gap.

## Verified sound

**Gate, build, dependency check.** Gate at `8521101`: every counter `0`, `OK`. `lake env lean TauCetiRoadmap/BelyiMaps/Suggested.lean`: exit 0, no warning (28 s). Dependency check output: `depcheck: 235 roadmaps, 2268 edges, 0 problem(s)` — no UPWARD or CYCLE line. `git diff --stat origin/main...HEAD` outside the folder: empty. Overlaps: #1187 has a stated order after this pull request; #1791 falls under the stated "whichever merges second is rebased" rule; no dropped or revision-only id.

**Signatures.** `#check`-level comparison of the two elaborated types in the worker's signature file with README §Pinned conventions (`:486–503`): `opposite_third_peripheral : (P * T)⁻¹ = P * (T * P)⁻¹ * P⁻¹` and `conjugation_transfer` with conjugator `q * c * (φ q)⁻¹`; both carry `[Group G]` and nothing was lost. They are free-variable group identities, one closed by `group` and the other equal to the pinned `TauCeti.map_conj_eq_conj_of_map_eq_conj` (`TauCeti/GroupTheory/ConjugationTransfer.lean:39`); they are kept, and not reported as padding, because `Completed/PeripheralActions/Suggested.lean:5, 475` imports this module and uses `TauCetiRoadmap.BelyiMaps.opposite_third_peripheral` by name.

**Adversarial table** (statement; instances; values computed; result).

| Statement | Instances | Values | Result |
|---|---|---|---|
| §Pinned, monodromy group and connectedness (`:404–408`) | `n = 0`; `cyclicTriple n` | on `Fin 0` pretransitivity holds vacuously and `χ = 0 + 0 + 0 − 0 = 0`, so `2 − 2g = 0` would give `g = 1` for the empty cover; `1 + n + 1 − n = 2` | `n ≠ 0` clause needed and present |
| §Pinned, orders and geometry type (`:416–418`) | `(1,m,m)`, `(2,4,4)`, `(3,4,4)`, `(2,3,7)` | `1 + 2/m > 1`; `1/2+1/4+1/4 = 1`; `1/3+1/2 = 5/6 < 1`; `41/42 < 1` | identity of order 1 is always spherical, consistent with 4.4 |
| 14.1 genus versus `geomtype` | deg 5, `σ0 = (1 2)(3 4)`, `σ1 = (0 1 2 3)`; deg 4, `(0 1 2)`, `(0 1 2 3)` | `σ1σ0 = (0 1 3 4)`, types `[2,2,1],[4,1],[4,1]`, `χ = 3+2+2−5 = 2`, Euclidean; `(0 1 2)(0 1 2 3) = (0 2 3 1)`, `χ = 2+1+1−4 = 0`, `5/6 < 1` | both witnesses correct |
| 2.6 / 5.1 / 9.1 the three actions agree | `mob01 ∘ mob1Inf`; `(t−1)/t`; `h = mob01` on `periphInf` | `1 − z/(z−1) = 1/(1−z)` = `mobRot`; pullback reverses, giving `swap1Inf ∘ swap01 = rot`; `(t−1)/t`: `0→∞→1→0` = `(0 ∞ 1) = ρ⁻¹`; `(periph0·periph1)⁻¹ = periph1⁻¹·periphInf·periph1` = `swap01`'s third entry | consistent in all three places |
| 3.5 comparison with the database | counts; LMFDB search, degree ≤ 4 | `1+3+7+26 = 37`; 13 records returned (`1T1-1_1_1-a` … `4T5-4_4_3.1-a`); `S₃`-orbits of ordered passports `1+1+3+8 = 13` | as stated; mssv2019 lines 186–209 give one passport per `S₃`-orbit |
| 1.6 / gap counts | degrees 1–5, 6–11; `6T6` generators | `1+1+2+5+5 = 14`; `16+7+50+34+45+8 = 160`; `⟨(0 2 4)(1 3 5), (2 5)⟩` preserves blocks `{0,3},{1,4},{2,5}`, contains `(0 3),(1 4),(2 5)`, order `8·3 = 24 = |C₂ ≀ C₃|` | consistent |
| 7.7 `TopBranchedCover` | fold `β ∘ (h × id)`; `π = id`; `z ↦ zⁿ` | `x²` on `y² = x³ − x`: degree 4, branch values `{0,1,∞}`; fold has 8 points over unmarked values and is not a local homeomorphism on the fold circles; `e = n, 1ⁿ, n` sum to `n` | covering clause over `markedᶜ` is the discriminating one |
| 8.5 positive-genus example | `y⁴ = t(t−1)` | one point with `e = 4` over `0` and `1`; order `−2` at `∞`, `gcd(4,2) = 2` points with `e = 2`; `2g−2 = −8 + (3+3+1+1) = 0`; monodromy `y ↦ iy` around both `0` and `1` gives `σ0 = σ1`, `σinf = σ0⁻²` = `torusTriple`; LMFDB `4T1-4_4_2.2-a`: genus 1, friend elliptic curve `32.a3` | as stated |
| 9.1 carrier | `F = k(t)`; `k = ℚ`, `t ↦ u³` | degree 1 is a pair; `u³−1 = (u−1)(u²+u+1)`, local data `{(1,1),(1,2)}`, `1+2 = 3`, unweighted `{1,1}` | weighted partition is the correct invariant; pinned `IsAlgebraicBelyiPair` (main pin, `Belyi/Basic.lean:184`) carries `[CharZero k]`, exact constants and the three-place condition, as §Pinned says |
| 9.2 `M(X)` | disconnected `X`; `X = ℂ`, `1/sin`; `f` algebraic over `ℂ` | product of fields has zero divisors; infinitely many poles; `p(f) = 0` puts `f` in a finite set, so `f` is constant on connected `X` | hypotheses (nonempty, connected; compact only for divisors) placed correctly |
| 9.3 / 9.4 | `β = z³`, fibre `{1,ω,ω²}`; `ord −k`, `ord −(k+1)` | sums of the pole separators have poles at both `1` and `ω`; quotient has order `−1` | regular-evaluation route needed; value group `ℤ` |
| 9.7 step 3 | `t = u²`, `y = u/(t−2)` | `y² = t/(t−2)²`; `w = (t−2)y = u`, `W² − t`; `disc(m_N) = s^{N·n(n−1)} disc(m)` (roots scaled by `s^N`) | correct |
| 10.2 measure | `S = {±√2}` | `m(S) = {0}`, critical value `m(0) = −2`; `ν ≤ ν(S) − d + (d−1)` | strict decrease |
| 10.3 | `B_{m,n}(m/(m+n))`; `B_{1,1}`; `N ≥ 3` step | `= 1`; `4x(1−x)`, only critical point `1/2`; `g(a) = g(c) = 0`, `g(b) = 1`, `T′ = g(T)`, `#(T′∖∞) ≤ N−1`; base cases degree 1 with no branch value | induction terminates; `∞` fixed throughout |
| 10.7 steps 2–3 | `ℓ((g+1)P) ≥ 2`; minimal pole order `m` | unique place over `p`, `e = f = 1`, so `[F:E] = 1`; `L(mP) = ℂ ⊕ ℂz` since any element of pole order `< m` is constant | kock2004 lines 277–328 |
| 11.4 / 11.7 | `z ↦ z²`, `Aut = C₂`; `k = ℚ(√2)` | a discontinuous character of `∏_ℕ C₂` gives a cocycle with no finite level; `[G:H] = 2`, `[G:S] = 1` | continuity hypothesis and the surjection `G/H ↠ G/S` are right |
| 12.2 `^ᶻ` | `a = n ∈ ℤ`; `x` of order `d`; noncommuting `x, y` | `zHat.lift x` sends the generator to `x`, so `x ^ᶻ n = xⁿ`; factors through `ZMod d`; `(xy)² ≠ x²y²` | laws as stated; pinned `TauCeti.zHat.lift` (`Topology/Algebra/Group/Profinite/ZHat/Basic.lean:140`) |
| 12.12 | `S₃`: `(0 1 2), (0 1), (1 2)`, `u = 5`; `S₅`: `a`, `b` | relation holds (`0→1→0→0`); fifth powers give `(1 2)(0 1)(0 2 1): 0 ↦ 1`; `b·a = (0 3 2 4 1)`, two distinct Sylow 5-subgroups generate `A₅`; LMFDB `5T1-5_5_5`: size 3, three orbits of size 1 over `ℚ` | both counterexamples and the record correct |
| 13.3 / 13.4 | `q = P`, `x = C` | `P·C·P⁻¹ = P(TP)⁻¹P⁻¹ = (PT)⁻¹`; conjugator `P·c_C·(φP)⁻¹` | matches `conjugation_transfer` |
| 13.5 | `p_α`; affine matching; char `p`; `H₁ = x`, `H₂ = 2x` | degree 7, leading coefficient `1/7`, multiplicities `2,3,4`; `−b/a = 0`, `(1−b)/a = 1`, `(α−b)/a = σα` force `b = 0`, `a = 1`, `σα = α`; `(xᵖ−x)∘xᵖ = xᵖ∘(xᵖ−x)`; `c = 2`, `d = 0` | every hypothesis of the lemma load-bearing |
| 14.2 base field versus field of moduli | mssv2019 | lines 654–656: the database stores the fields over which the maps are defined; line 260: the field of moduli is the intersection of fields of definition; line 385: a dessin that does not descend | "no certificate equates them" supported |

**Library declarations opened.** At `a91d3aaf`: `TauCeti/GroupTheory/ConjugationTransfer.lean:39`; `Topology/Algebra/Group/Profinite/Free/Basic.lean:74, 124` (`freeProfiniteGroup.of`, `.lift`), `Free/ProP.lean:98, 243`, `MaximalProP.lean:94, 198, 208, 346` (`proPKernel`, `map_proPKernel_eq`, `isTopCharacteristic_proPKernel`, `maximalProPQuotient.lift`), `ZHat/Basic.lean:140`, `ZHat/ZMod.lean:102, 263`, `ZHat/PadicInt.lean:67`, `ProP/PadicPow.lean:135`; `AlgebraicTopology/UniversalCover/Classification/ActionCover.lean:97, 163, 178, 203, 209` and `FundamentalGroupAction.lean:178, 270` (the inverse of `fiberActionEquivalence` is `asEquivalence`'s chosen functor, as 6.2 says); `ThricePuncturedSphere/Basic.lean:95`; `SemilocallySimplyConnected/Basic.lean:150`; `RepresentationTheory/CharacterTable/Table.lean:463`, `CentralCharacter.lean:91`; `Combinatorics/PermutationTriple/BranchPoints.lean:138–200, 343`. All 298 `TauCeti.*` names and 333 other dotted or underscored names of the README were searched at both pins: 201 `TauCeti.*` names exist at the branch pin and all 298 at main's (R01); thirteen own names exist nowhere (R03). At `2fd255d9` (read, not elaborated): `FieldTheory/FunctionField/Belyi/Basic.lean:91, 184`, `Bundled.lean:55, 89`, `GaloisAction.lean:79, 210, 239, 271`, `FieldOfModuli.lean:94, 127`, `BaseChange.lean:132`, `Existence.lean:117, 163`; `Analysis/Complex/RiemannSurface/BelyiPair.lean:201, 566`; `AlgebraicTopology/ThricePuncturedSphere/FilledCover/AnalyticBelyiPair.lean:321`.

**Cross-roadmap citations resolved on main.** AlgebraicCurves Layer 8 item 2 (`:885`), 12B.0a (`:1503`), 12B.0b (`:1524`), 12B.0d (`:1560`), each stating what 9.1C, 10.6 and 12.4 consume and naming BelyiMaps as the fixed-`t` consumer; FuchsianOrbifolds Layer 5 items 2 and 3 (`TauCetiRoadmap/FuchsianOrbifolds/README.md:318–331`: finite holomorphic maps, local multiplicity, degree; Riemann–Hurwitz); ModularForms §10B (`:1173`); ComplexManifolds Milestone 3 (`:221`); ProfiniteProPGroups Layers 3 and 4 (`Completed/…:437, 706`); ProfiniteArithmetic Layers 0, 1.1, 1.3, 2 (`Completed/…:223, 336, 407, 441`); PolynomialGaloisGroups Layers 0 and 6. PeripheralActions (`Completed/PeripheralActions/README.md:103–104, 170–174`) consumes the two exports and is cited by nothing here. The declared gap is precise and minimal: the pin's `numTransitiveGroups` is `0` above degree five.

**Sources read at their locators.** kock2004 (arXiv math/0108222v2): (1.4) line 115, (1.5) line 139, (1.6) line 146, (1.9) line 185, (1.10) line 199, (2.1) line 257, (2.2) line 277, (3.1) line 355, (3.2) line 385. mssv2019 (arXiv 1805.07751v3): relation `σ∞σ1σ0 = 1` line 114, Algorithm 2.3.1 lines 188–209, §4.1 lines 257–268, Example 4.5.2 line 385, §7.1 lines 650–658. LMFDB pages for degree ≤ 4, `5T1-5_5_5` and `4T1-4_4_2.2-a`, read on 2026-11-10.

**Seeded sample.** "Profinite and pro-p groups", "API" (6.2), "New object: `^ᶻ`": pinned declarations opened, above. "A. Finite combinatorics — Layers 0–4": every exported name exists at the pin; imports match the prerequisite lines of Layers 0–4. "Monodromy group and connectedness", "Orders and geometry type", "Algebraic Belyi pairs", "The three actions agree", "The positive-genus worked example", "New object: `M(X)`": computed in the table. "Comparison with the database", "Base field versus field of moduli": mssv2019 and the LMFDB, as above. "The absolute Galois group and the cyclotomic character": unchanged since the previous review, whose Kummer computation (`σ̃γσ̃⁻¹ = γ^{χ(σ)}`, pin convention `g ζ = ζ^{χ(g)}`) I re-read against 12.11 and 12.12. "New object: `U`": R04. "New object: `ramificationIndex`": pinned as `TauCeti.RiemannSurface.localMultiplicity` (present at both pins); its Forster locators are below.

**Ownership against open work.** No other roadmap on main or at the listed open heads declares a Belyi pair, a `TopBranchedCover` or a dessin; GroupActionsOnRiemannSurfaces, InverseGaloisAndArithmeticFundamentalGroups and NoncongruenceModularForms cite BelyiMaps for them. Pull requests the brief names without files were not checked.

## Not verifiable

- Forster, *Lectures on Riemann Surfaces* (2.1, 2.2, 1.11, 2.4, 4.3, 4.5(b) for `ramificationIndex`; 1.12, 1.15, 1.16 for `M(X)`; 4.6, 8.4, 8.5, 8.9 for 8.5): Springer, paywalled; no legal copy found. The item numbers were not checked.
- Girondo–González-Diez (Propositions 1.23, 1.26 for `M(X)`; §1.2.7, Lemma 1.80, Proposition 1.81 for 8.5; the other locators of Layers 4–13): CUP, paywalled.
- Szamuely (4.6.10–4.6.12, 4.7.1–4.7.5), Lando–Zvonkin, Fried, Weil, Deligne, Serre, Dixon–Mortimer, Cori–Machì, Sijsling–Voight: paywalled or not in the sample; not fetched.
- Couveignes (Théorème 3, Théorème 8, §8.3) and the published numbering of Stix's Definition 37(i): not re-fetched this round; neither is in the sample.
- Elaboration of the R02 statement at `2fd255d9`: this worker has no object files for `TauCeti.FieldTheory.FunctionField.Belyi.*` at that pin; decided by reading.

## Source issues

- none

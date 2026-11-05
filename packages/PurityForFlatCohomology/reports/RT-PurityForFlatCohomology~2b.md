<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2153#issuecomment-6643317364 -->
Red team round 2 pass b (claude) of cfdb8a6

Verdict: needs_changes

1. **F01** (P2) PrismaticCohomology §2.0 is cited for seven Lean names it does not declare

   Location: `packages/PurityForFlatCohomology/README.md:352–353`, "§2.0: `Arc.Cover`, `Arc.Site`, `ArcPCover`,
   `ArcP.Site`, `FormalArc.Site`, `FormalArc.PerfectoidBasis`, `FormalArc.coverByValuations`"; also §5.3 Needs
   (line 1313, "`FormalArc.PerfectoidBasis`") and §5.9 (line 1441, "`FormalArc.coverByValuations`").

   Claim: PrismaticCohomology §2.0 declares these seven names.

   Witness: PrismaticCohomology at its head #1057 (`roadmaps show`): §2.0 ("Arc descent for the comparisons",
   README lines 2280–2327) names no Lean declaration, and its `Suggested.lean` (138 lines) contains no arc
   object; `roadmaps grep 'coverByValuations|PerfectoidBasis|ArcPCover|FormalArc\.Site|Arc\.Site|Arc\.Cover'`
   matches nothing on main or in any open pull request. The mathematics is there: §2.0's bullet "Covers by
   that basis and by products of p-complete rank-one valuation rings with algebraically closed fraction
   fields", the `arc_p` sheaf property, the henselian comparison and BS22 Proposition 8.10 acyclicity.

   Repair: in the contract (352–353) replace the name list by "§2.0: the arc, `arc_p` and formal arc sites, the
   perfectoid basis of the formal arc site, covers by that basis and by products of `p`-complete rank-one
   valuation rings with algebraically closed fraction fields ([CS24] Lemma 2.2.3), arc descent for torsion
   étale cohomology, the henselian comparison …" (keep the rest). In §5.3 Needs write "PrismaticCohomology
   §2.0 (the perfectoid basis of the formal arc site, acyclicity of `𝒪`)" and in §5.9 "(PrismaticCohomology
   §2.0, covers by products of valuation rings)". Tested on §5.9: the basis of the `p`-complete arc topology is
   then supplied by the §2.0 bullet, which states exactly CS24 Lemma 2.2.3's products.

2. **F02** (P3) Wrong page for the elliptic-curve sharpness example

   Location: `packages/PurityForFlatCohomology/README.md:1846`, "[CS24] p. 89 uses an elliptic curve".

   Claim: the elliptic-curve example of Corollary 7.2.3's sharpness is on p. 89.

   Witness: it is Remark 7.2.4, CS24 line 3758, after the page-90 marker at line 3757 (Corollary 7.2.3 itself is
   on p. 89).

   Repair: "[CS24] Remark 7.2.4, p. 90, uses an elliptic curve".

3. **F03** (P3) The README cites line numbers of the worker's text extraction

   Location: `packages/PurityForFlatCohomology/README.md:936`, "footnote 13 (CS24 line 997)"; and 2421–2426
   ("text line 3630", "line 1453", "line 3578", "line 3726", "line 3774").

   Claim: these are locators into [CS24].

   Witness: the numbers are lines of the operator's line-numbered extraction of arXiv:1912.10932v3, which no
   reader of the roadmap repository has; the printed locators (footnote 13 is on p. 24; the others already
   carry their pages) are the only resolvable ones.

   Repair: line 936: "as in [CS24] §2.3.3, footnote 13, p. 24"; lines 2421–2426: delete "(text line 3630)",
   "(line 1453)", "(line 3578)", "line 3726", "line 3774", keeping "p. 87", "p. 35", "p. 85", "p. 89", "p. 90".

4. **F04** (P3) §4.2 cites Mathlib's strong regular-sequence predicate against Convention 1

   Location: `packages/PurityForFlatCohomology/README.md:1182`, "*Needs:* … Mathlib `RingTheory.Sequence.IsRegular`";
   also the Mathlib contract line 202.

   Claim: the regular sequences of §4.2 are Mathlib's `IsRegular`.

   Witness: Convention 1 (139–141) fixes regular sequences as `RingTheory.Sequence.IsWeaklyRegular`, "with no
   condition that the final quotient be nonzero"; at the pin `IsRegular` is the structure extending
   `IsWeaklyRegular` with the extra field `top_ne_smul : ⊤ ≠ Ideal.ofList rs • ⊤`
   (`Mathlib/RingTheory/Regular/RegularSequence.lean:146–147`). For `A = k`, `m = 1`, `f_1 = 1` the sequence is
   weakly regular, `B = 0`, and §4.2 is vacuous but stated; `IsRegular` would exclude it.

   Repair: in §4.2 Needs write "Mathlib `RingTheory.Sequence.IsWeaklyRegular` (Convention 1)"; in the Mathlib
   contract keep `IsRegular` only if some target uses the nonzero-quotient condition, otherwise delete it.

5. **F05** (P3) `finiteEtalePullback` has two discriminating Checks

   Location: `packages/PurityForFlatCohomology/README.md:840–843`, the only Check about the definition
   `finiteEtalePullback` (an isomorphism, the empty open).

   Claim: the definition has at least three discriminating Checks.

   Witness: the remaining Checks of §1.8 (829–839) test the two theorems, not the functor.

   Repair: add "For `f : Spec ℂ → Spec ℝ`, `finiteEtalePullback f` sends the connected degree-two cover
   `Spec ℂ → Spec ℝ` to `Spec ℂ ⊔ Spec ℂ` (`ℂ ⊗_ℝ ℂ ≅ ℂ × ℂ`): rank `2` is preserved, connectedness is not,
   and the functor is not full: there is no `ℝ`-map `Spec ℝ → Spec ℂ`, while after pullback there are two maps
   `Spec ℂ → Spec ℂ ⊔ Spec ℂ`; so pullback along a faithfully flat map need not be an equivalence."

Files reviewed in full at head `cfdb8a6`: `packages/PurityForFlatCohomology/README.md` (2495 lines, 77 targets,
all Checks), `packages/PurityForFlatCohomology/Suggested.lean` (205 lines, 12 declarations), `design/plan.json`
(gaps), `sources.toml`, `metadata.toml`. No Lean was run (read-only pass); the elaborated types of
`signatures.md` were compared by hand with the README.

## Round-1 findings at this head

Review a (codex), `F01`–`F17`, and review b (claude), `F01`–`F06`, as settled in
`reports/FIX-RT-PurityForFlatCohomology~1.md`.

| Id | Status | Witness at `cfdb8a6` |
|---|---|---|
| a-F01 | repaired | README 695–698: "(c) local duality: if `R` is strictly henselian, then for a bounded constructible complex `K`"; negative Check 712–714 (`𝔽_2`, `ℓ = 3`: `ℤ/3` versus `0`). |
| a-F02 | repaired | README 1025–1029 defines `RΓ(U_A, G)` as the derived limit over animated fppf `A′` with `Spec π_0(A′) → U` and states the triangle `RΓ_Z(A, G) → RΓ(A, G) → RΓ(U_A, G)`; Check 1038–1040 (`k ⊕ k[1]`, `Z = ∅`: `fib(id) = 0` versus `k[1]`). CS24 line 2291 is on p. 55 as cited. |
| a-F03 | repaired | README 1689–1692: "the coaction `a : 𝒪_Y → 𝒪_G ⊗ 𝒪_Y` induces `Hom(𝒪_G, 𝒪_Y) ≅ Hom(𝒪_Y, 𝒪_Y)` … its source is `𝒪_Y^{⊕r}`"; Check 1701–1703 (dimensions 4 = 4, old source 8). |
| a-F04 | repaired | README 1761–1773 uses SGA 2 XI Lemme 3.17 with hypotheses a), c), d), e) listed and verified by induction; matches SGA2 lines 3830–3841 and the proof of 3.13(ii) at lines 3842–3852. Source-corrections bullet 2433–2435 records the printed "y ∈ Y". Needs gains PurityOfBranchLocus §0.3. |
| a-F05 | repaired | README 241–245 states `coherent_extension` and `reflexive_extension_of_depth` as SchemeAndStackFoundations has them (its README 612–619 and 715–722 on main); §7.3 (1686–1688) uses `reflexive_extension_of_depth` with `𝒪_Y` finite locally free hence reflexive. |
| a-F06 | repaired | README 906–910: presheaf value `A/(φ − 1)A`, étale sheafification `0`; `𝔽_p` gives `𝔽_p` versus `0`. |
| a-F07 | repaired | README 1400–1404: "for `a` a nonzerodivisor (every component `a_i ≠ 0`)"; `a = 0` gives `0 = 0`. |
| a-F08 | repaired | Suggested.lean 53–57 names `TauCeti.GradedAlgebra.gradedAlgebraQuotientPiece` (exists at `TauCeti/RingTheory/GradedAlgebra/Homogeneous/Quotient.lean:88`) and says `𝒪(1)` and its class are missing; README 232–235 and §7.9 Needs 1838–1839. No twisting sheaf under `Mathlib/AlgebraicGeometry/ProjectiveSpectrum` or Tau Ceti at the pins. |
| a-F09 | repaired | Suggested.lean 155–180: `frobeniusSemilinear_exists_fixed_basis`, `free_of_endomorphisms_iso_pi`, `isRegularLocalRing_uniqueFactorizationMonoid`; README 45–48 and §§5.6, 7.2, 7.4 name them. `Module.Basis` is the pinned name (`Mathlib/LinearAlgebra/Basis/Defs.lean:75,89`). `roadmaps grep` (index 2026-11-04): no other roadmap states them. |
| a-F10 | repaired | README 1984–1990: degree 1 from §0.5(b) on affine torsors, degree 2 from (a), with the three-dimensional node (`Pic(U_R) ≅ ℤ`) as the reason (a) is unavailable in degree 1. |
| a-F11 | repaired | README 1845–1848: "A smooth plane cubic …"; cuspidal cubic over `ℂ` has torsion `ℤ/3`. |
| a-F12 | repaired | README 1334–1336: `I = ℕ`, `R_i = 𝔽_2`, misses `(1, 1, …)`; controls `0 → 0` and the identity of `𝔽_2`. |
| a-F13 | repaired (differently) | README 948–950: `Spec 0 → Spec ℤ` is pro-ppf but not a cover; the replacement Check is discriminating (admitting it would make every sheaf zero). |
| a-F14 | repaired | README 762–772: `X = Spec A`, `U = X ∖ {𝔪}`, `I ⊂ 𝔪`, Situation 0EHC with `𝔞 = 𝔪`, closures in `X`, `dim A > d + 2`; Check 781–784 reads `4 > 3`, `3 > 3` fails, `𝔞 = 0` control. |
| a-F15 | repaired (differently) | README 1122–1130: the Check is over a perfectoid base with completed tensor powers (`perfectoid_completed_tensor`, PerfectoidQuotients §0.6 line 933 at #1042); the `ℤ_p` witness is kept as the reason. |
| a-F16 | repaired | README 192–195 and Suggested.lean 26–30: input in `AddCommGrpCat.{v}` with `HasSheafify` at `v`, output universe `w′` separate. |
| a-F17 | repaired | Suggested.lean 32–39: the crystalline key formula and the animated deformation/continuity/excision/descent bullets, with the missing carriers; no substitute stated. |
| b-F01 | repaired | README 994: "Theorem 5.1.13, p. 52". |
| b-F02 | repaired | README 1097–1098: "Corollary 5.4.5, p. 68". |
| b-F03 | disputed, settled | README 310 still cites `Algebra.CotangentComplex`; DerivedModuleAlgebra on main (README 815–830) gives `Algebra.CotangentComplex (A B : Type u) … : DerivedCategory (ModuleCat.{u} B)` as the §0.4 declaration. The repair's reason holds; not re-raised. |
| b-F04 | repaired | README 56–59 (Scope) and the §1.1 API bullet 621–625 (`ℚ` in residue characteristic `0`). |
| b-F05 | repaired | README 116–118 "to be imported", 2385–2396 "is to import"; the DeformationAndDerivedPatchingAlgebra bullet (129–132) names §1.1 and §§7.5–7.6 only. |
| b-F06 | repaired | README 565–569: equivalent to surjectivity together with injectivity of `H²(R, μ_p) → H²(U_R, μ_p)`; `ℝ⟦x, y⟧`, `p = 2`, `Br(ℝ)[2] = ℤ/2`. |

No repair introduced an error that I could find. One wording note (not a finding): in §7.6 (1762–1763) "depth
`≥ 3` at closed points of `Y`" is SGA 2's condition c) on `𝒪_{X,y}`, the local ring of `X = U_{R′}`, not of
`Y`; the verification that follows ("local rings of `X` at closed points … depth `≥ 4`") covers both readings.

## Verified sound

Counts: declarations read 12 of 12 (every binder by hand; no `variable` block, so no section binder can be
lost; the 12 elaborated types of `signatures.md` match the README statements); targets read 77 of 77, with
every API bullet and worked example; Checks tested: all (the sections' Check bullets were recomputed, table
below); source locators verified 131 (CS24: all 57 distinct page citations checked mechanically against the
page markers of the extraction, every one correct except S02; statements of 3.3.1, 5.2.9–5.2.10, 7.2.1,
7.2.7, 7.2.8, 7.2.9, 2.2.3, 2.2.4, (3.2.1.1)–(3.2.1.3), §5.2.5, footnote 13 reread; C19: 11 page citations
and Theorems 1.1–1.4, Corollary 2.5, Lemma 3.2, Remarks 6.3–6.4, A.1–A.2; SGA2 XI 3.16–3.17 and the proof
of 3.13(ii); EGA IV 21.13.6(iii); Gro66 1.4, 1.6, 1.8, 1.9); cross-roadmap citations resolved 103 (every
section number and every backticked declaration of the supplier contracts, on main or at the open head
named: SchemeAndStackFoundations 26 sections and 29 names, LocalPurity 4 + 5, ModularCurves 4D + 2,
EtaleCohomologyFoundations F.0.2/F.5 + 1, PurityOfBranchLocus 0.3 + 3, DerivedDeRhamCohomology 0.19/0.21/1.10
+ 3 at #868, DerivedModuleAlgebra 5 + 1, EnhancedDerivedSheaves 4, PerfectoidSpaces 10 + 6,
PerfectoidQuotients 3 + 4 at #1042, PerfectoidQuotientsPartII 10 sections in the board design,
PrismaticCohomology §2.0 at #1057 (section present; names absent: S01), PrismaticCohomologyPartII Layer 4
at #1065, FiniteFlatGroupsAndIntegralPadicHodgeTheory 3 + 2 at #879, ArithmeticGaloisDuality R02.2.4 at
#858 (the Witt sequence there is stated for every complete discretely valued field with perfect residue
field, as cited), LefschetzPencilsAndVanishingCycles §0.10 at #873); sibling citations checked: the five
downstream roadmaps named are all later in the merge order and none is cited as a supplier.

Dependency check (`gate --depcheck … --movable`, run from the board checkout):

    depcheck: 234 roadmaps, 2117 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` touches only
`packages/PurityForFlatCohomology/` (README, Suggested.lean, design/plan.json, metadata, reports, sources).

Gaps: the five slugs of `design/plan.json` (`prismatic-dieudonne-perfectoid` → PrismaticCohomologyPartII
Layer 4; `complete-intersection-presentations`, `flat-local-complete-intersection`, `ci-defect-additivity` →
DerivedDeRhamCohomology §§0.21/0.19/0.21; `regular-tower-tilt` → PerfectoidQuotientsPartII §Q10.1) each
appear under the supplier's contract in the README with the same `needs` sentence; each names a supplier
and a section that exists; each `needs` carries its hypotheses; none asks for what the pins or an earlier
roadmap provide (DerivedDeRhamCohomology #868 does not state 09Q1/09Q7/Avramov 3.6; PrismaticCohomologyPartII
#1065 Layer 4 has no Dieudonné theory; §Q10.1 gives towers, not the tilt).

Pinned libraries (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`): `Module.Basis` (`LinearAlgebra/Basis/Defs.lean`),
`IsOfFinOrder`, `MorphismProperty.IsStableUnderBaseChange.inf` (`MorphismProperty/Limits.lean:406`),
`IsWeaklyRegular`/`IsRegular`/`Ideal.ofList` (`Regular/RegularSequence.lean:41,146`), `Submodule.spanFinrank`
(`Algebra/Module/SpanRank.lean:66`, `(spanRank p).toNat`), `IsRegularLocalRing` (only `Defs` and
`Polynomial`; no factoriality, no Auslander–Buchsbaum anywhere in Mathlib), `Etale`/`IsFinite` classes,
`SheafCohomology/{Basic,Cech,ExactSequences,MayerVietoris}.lean`, no twisting sheaf on `Proj`;
`LineBundleClass` with its `CommGroup` (`Class.lean:50,142`), `cartierDual` (abbrev, `FiniteLocallyFree.lean:331`),
`MultiplicativeTypeAffineGroupSchemeCat` (over a field), `pointsFppfSheaf`, `gradedAlgebraQuotientPiece`,
`TauCeti.IsRegularLocalRing.isDomain` (`RegularLocalRing/Basic.lean:124`; that file has no factoriality).
Hence each "not statable" reason of the module docstring that grep can test holds, and no statable headline is
missing: the seven stated theorems are CS24 3.3.1(a)(b) minus the `π_1` clauses, 7.2.1's two clauses
(the regular clause "of any dimension" as in CS24 line 3709), Katz 4.1.1, Auslander 1.3 and
Auslander–Buchsbaum factoriality.

Padding probe: the five definitions are used by the theorems; none of the seven theorems follows by one
tactic or library lemma (no factoriality, no Katz, no Auslander at the pins; the Zariski–Nagata and Picard
statements are the headlines). Policy: `theorem` throughout, no `set_option`, single `import Mathlib` plus
two existing `TauCeti.*` modules, no sorry'd data, no pull-request numbers or process words in README or
docstrings, no algorithm.

Ownership: `roadmaps grep` (index 2026-11-04, 452 pull requests) finds no other `Suggested.lean` declaring
`virtualDimension`, `CohenPresentation`, `IsCompleteIntersection`, the three new theorems, or a regular-local
`UniqueFactorizationMonoid`; PurityOfBranchLocus, LocalPurity and ModularCurves on main do not state
factoriality. `puncturedSpectrum`/`finiteEtalePullback` restate LocalPurity's local carrier and `FEt.pullback`
because a roadmap may not import another's module, and the README says so.

Declarations (context, instances, values):

| Declaration | Instances and values | Result |
|---|---|---|
| `puncturedSpectrum R` (`CommRing R`) | field: `J = 0`, carrier ∅; DVR: `{(0)} = Spec K`; `k⟦x,y⟧`: `D(x) ∪ D(y)`; `k × k`: `J = 0`, ∅; zero ring: ∅, `ringKrullDim = ⊥`; finite `R → R′`: `V(J(R)R′)` = maximal ideals of `R′` | sound |
| `CohenPresentation R` (`IsLocalRing R`, `ring : Type u`) | `k⟦x,y⟧ → k⟦x⟧` kernel `(y)`; `k⟦x,y⟧/(xy) → itself` excluded by regularity; universe of `ring` is that of `R` as the README says | sound |
| `IsCompleteIntersection R` | `rs = []` for regular; `[xy]` for the node curve; `(x,y)²` needs 3 generators, never regular; `rs = [1]` impossible since `R̂ ≠ 0`; rank-one valuation ring with `𝔪 = 𝔪²`: junk `true`, excluded by `IsNoetherianRing` everywhere | sound |
| `virtualDimension R` | `k⟦x_1..x_n⟧`: `n`; `k⟦x⟧` as `k⟦x,y⟧/(y)`: `1`; `(x,y)²`: `2 − 3 = −1`; `𝔽_p⟦x,y,z,t⟧/(x²,y²,xz−yt)`: `4 − 3 = 1`; empty set: `sInf ∅ = 0` on `ℤ`, unused | sound |
| `finiteEtalePullback f` | identity; empty open (not faithful on `X ⊔ X`); `Spec ℂ → Spec ℝ` (rank kept, connectedness not) | sound; S05 |
| `zariskiNagata_full_faithful_connected` | regular dim 2: holds; node curve `vdim 1`: `U` disconnected, excluded; `A_1`: `vdim 2`, (a) holds, `π_1(U) = ℤ/2 ≠ 1` so (b) fails; `vdim ≥ 2 ⟹ dim ≥ 2 ⟹ U ≠ ∅` | = CS24 3.3.1(a) lines 1420–1422 |
| `zariskiNagata_isEquivalence` | node `xy − zw`, `vdim 3`: SGA2 X 3.4(ii) | = 3.3.1(b) |
| `frobeniusSemilinear_exists_fixed_basis` | `M = 0`: empty basis; `M = K`, `F = cφ`: fixed vector `λ` with `λ^{p−1} = c^{−1}`, also `p = 2`; `𝔽_3(t)^{perf}`, `F = tφ`: no fixed vector (`v(x) = −1/2 ∉ ℤ[1/3]`), excluded by `IsAlgClosed` | sound |
| `free_of_endomorphisms_iso_pi` | `M = R^n`, `r = n`: `n² = n²`; `M = 0`: any `r`; `r = 0`, `M ≠ 0`: hypothesis impossible (`id ≠ 0`); `(x,y)` on `A_1`: not regular, excluded | sound (Aus62 uncertified) |
| `isRegularLocalRing_uniqueFactorizationMonoid` | field, DVR, `k⟦x,y⟧`: UFD; `A_1` (`xz = y²`): not regular | sound |
| `localPicard_torsion_eq_one` | node dim 3: `Pic(U) ≅ ℤ`, finite order ⟹ `x = 1`; elliptic cone dim 2: excluded; `x = 1`: order 1 | = CS24 7.2.1 first clause |
| `localPicard_subsingleton` | field: `U = ∅`; DVR: `Spec K`; `k⟦x_1..x_5⟧/(x_1x_2 − x_3x_4)`: `Pic(U) = 0`; node dim 3 satisfies neither disjunct | = 7.2.1 second clause, line 3709 |

Adversarial pass (one row per target; "=" means agreement with the cited source line; all Checks of the row
recomputed):

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conv. 1, 6, 8 | `IsWeaklyRegular`; `ℤ/p^n`, `μ_{p^n}`, `ξ = p`; cubic crossed product | `FV = φ(ξ)`, `VF = ξ` both lines; `𝕄(ℤ/p)^{V=1} = A^{φ=1}`; `𝕄(μ_p)`: `V = 0`; residues `1/3` and `2/3` | sound; S04 for `IsRegular` |
| §0.1 | field, DVR, `k⟦x,y⟧`, `k × k`, zero ring, finite `R → R′`, `R̂`/`R^h`/`R^{sh}` | as in the table; semilocal `U = ∅ ⟺ dim 0` (`p ⊇ ∏ 𝔪_i ⟹ p = 𝔪_i`) | sound |
| §0.2 | `Z = ∅, X`; DVR `𝔾_m`; `k[t]`, `(t)`; `𝔸¹`, `Z = 0` | `0`, `H^i`; `H⁰_𝔪 = 0`, `H¹_𝔪 = ℤ`; `k[t,t^{−1}]/k[t]`; `H⁰_Z(𝔾_a) = 0 ≠ k` | sound |
| §0.3 | `k^s`, `μ_n`; `Z_0 = X_0`, `∅` | `colim k′^×/n = 0`; absolute; `0 = 0` | sound |
| §0.4 | `k[x_1..x_d]` origin; `Z = Spec A`; `M = 0`; `d = 0` | Koszul of `(x^n)` acyclic below `d`, `H^d_Z ≠ 0`; `H⁰_Z = A`; `0`; no claim | sound |
| §0.5 | `k[x,y]` origin; `V(x) ⊂ 𝔸²`; doubled origin | `k[x,y]`; `k[x^±,y] ≠ k[x,y]`; two maps agree off `0` | = CS24 7.2.7 lines 3796–3802 |
| Layer 0 Ex. | `k⟦x,y⟧`, `μ_p`; `ℝ⟦x,y⟧`, `p = 2`; DVR | `H⁰_𝔪 = H¹_𝔪 = 0`; `H²(R, μ_2) = ℤ/2`; `ℤ/p ↪ H²_𝔪` | sound |
| §1.1 | see table; `R/(f_1..f_r)`: `μ(I + (f)) ≤ μ(I) + r`; `ℚ` versus `ℤ_(p)` base | `vdim ≥ vdim R − r`; Cohen factorization target regular (`p ∉ 𝔪²`) | = (3.2.1.1)–(3.2.1.2) lines 1328–1331 |
| §1.2 | `k⟦x⟧ → k⟦x,y⟧/(y²)`; fibre `(y,z)²` | `1 = 1 + 0`; `0 = 1 + (−1)`, `dim` unchanged | = (3.2.1.3) line 1335 |
| §1.3 | twisted cubic cone; `(x²,xy,xz)`; Kohn | `1 < 2`; depth 0, `3 − 3 = 0`; `pd = dim R̃` ⟹ depth 0 | sound |
| §1.4 | `d = 1`, `d = 0`, shift, `𝔽_2` with `ℓ = 3` | `cd = 1`; linear duality; `ℤ/ℓ` in degree `2d`; `ℤ/3` versus `0` | sound |
| §1.5 | DVR uniformizer; unit `f`; `k⟦x,y⟧`, `f = x` | `0 ↪ ℤ/ℓ`; `R/(f) = 0`; `0 → ℤ/ℓ(−1)` not onto in degree 2 | sound |
| §1.6 | regular; `xy`; depth-zero rings; Mayer–Vietoris of `R_1, R_2, R_{12}` | `H^{<dim} = 0`; `H¹_𝔪 ≠ 0` (two components); `vdim(R_*) ≥ vdim R + 1` for `n ≥ 2` | sound |
| §1.7 | `I = 𝔪`; dim 4/3, `d = 1`; `𝔞 = 0`; `Σ y^{−n²}xⁿ` | `0 = 0`; `4 > 3`, `3 > 3` false; `4 − 4 > 3` false; poles `n²` | sound |
| §1.8 | regular dim 2; node curve; `A_1`; node 3; `vdim 1` ring; `f` iso; empty open | as in the declaration table | sound; S05 |
| §2.1 | `ℤ/p^n`, `μ_{p^n}`, `α_p`, `𝔽_p ⊔ 𝔽_p`; covariant = contravariant of dual | `(pφ, φ^{−1})`, `(φ, pφ^{−1})`, `(0,0)`, `𝔽_p × 𝔽_p`; `M_cov(ℤ/p) = M_contra(μ_p)`: `F = 0`, `V` bijective | sound |
| §2.2 | `ℤ/p` over `𝔽_p`, `𝔽̄_p`; `μ_p` | `Hom(𝟙_n, 𝕄)`: `V(m) = m`, `F(m) = pm` automatic; `V − 1 = −1`; `𝔽̄_p ≠ ℤ/p` | = CS24 4.1.4 |
| §2.3 | `ℤ/p`/`𝔽_p`; `α_p`-torsor; `Spec 0 → Spec ℤ` | `φ^{−1} − 1` onto `𝔽̄_p` not `𝔽_p`; perfection `A`; not a cover | sound |
| §2.4 | `ℤ/p`; `μ_{p^n}`; `α_p` | Artin–Schreier; `RΓ = 0`; `−1`, non-perfect base has torsors | sound |
| §3.1 | `𝔾_m`, `𝔾_a`, `μ_p/𝔽_p` | `1 + M`; `A′ → A → M[1]`; degrees `−1, 0` | = 5.1.13 p. 52 |
| §3.2 | discrete; `k ⊕ k[1]`, `Z = ∅`; `μ_n` Bégueri; `𝔽_p ⊕ 𝔽_p[1]` | `fib(id) = 0` versus `k[1]`; `ζ ↦ (ζ^i)`; étale site of `𝔽_p` | = 5.2.4, 5.2.6; `U_A` = line 2292 |
| §3.3 | Postnikov step `τ_{≤n} → τ_{≤n−1}`, `n ≥ 1`; `k[ε]`; `𝔽_p[ε]`, `α_p` | deformation term in degrees `−n−1` (smooth), `−n−1, −n` (flf): bijective `i ≥ 0`/`i ≥ 1`, surjective in degree 0, Milnor `lim¹ = 0`; `1 + kε`; `𝔽_pε → 0` | = 5.2.9–5.2.10 lines 2366–2383 |
| §3.4 | `ℤ_p`, `μ_{p^n}`; `𝔽_p(s)`; `ℤ`, odd `p` | `lim (ℤ/p^m)^×/p^n`, `−1` at `p = 2`; `Br[p] ≠ 0`, `H^{≥3} = 0`; `0 ≠ ℤ/p` | sound |
| §3.5 | identity; `I = π_0 A`; `ℤ_(p)`; `ℤ_(p) → ℚ` | trivial; `0`; `ℤ/p` both (valuation mod `p`); `𝔽_p ≠ 0`, `ℤ/p ≠ 0` | sound |
| §3.6 | fppf cover; `ℤ_(p) → ℤ_p` (constant nerve mod `p`); perfectoid `A → A′`; `B ⊗_{ℤ_p} B` | descent; `Tot` constant `= RΓ_Z(ℤ_p)`; completed terms perfectoid; `diag(p, p², …)` infinite rank | sound |
| §4.1 | `𝔽_p⟦x,y⟧`; `𝔽_p⟦x⟧/(x²)`; `xy` | `0, 0`; `x` killed by `𝔪`; `(xy)^p = 0`, `𝔪·xy = 0` | sound |
| §4.2 | `m = 0`; `(x², xy)`, `g_1 = x`; `B = 0` | identity; `xA/(x²,xy) ≅ k` not free; vacuous | sound; S04 |
| §4.3 | `R′ = R`; `k⟦t⟧ → k⟦t^{1/p}⟧`; `E_1^{s,t} = 0`, `t < n` | tautology; CI of dim 1; `H^n_𝔪(R) = E_2^{0,n} ⊂ E_1^{0,n}` | sound (n unrestricted, as corrected) |
| §4.4 | `𝔽_p⟦x,y⟧`, `μ_p`; `α_p`; non-CI of §6.4; fibre of `V − 1` | `0, 0`; §4.1; degree 0 fails; `H^i(fib) = 0` from `H^{i−1}_Z(𝕄) = H^i_Z(𝕄) = 0`; `pd ≤ 1` shifts by one | sound |
| Layer 4 Ex. | `A_1`, `p ≠ 2` | `H⁰_𝔪 = H¹_𝔪 = 0`; `Pic(U)[2] = ℤ/2 ⟹ H²_𝔪(μ_2) ≠ 0` | sound |
| §5.1 | `G = 0`, `Z = ∅`; `ℤ/p`, `μ_p` over perfect `A`; `𝔽̄_p` | `0`; `A^{φ=1}`, `A/(φ−1)A`, `0`; `𝔽̄_p ≠ ℤ/p` | sound |
| §5.2 | `ℤ/p`; `μ_p`; `𝒪_C` | `A/(φ−1)A`; `A^×/A^{×p}`; `H¹ = 0` by valuative criterion | = 4.2.4 |
| §5.3 | `ℤ/p`; `𝒪_C` cover; `p`-torsion | `V = φ^{−1}` on `𝒪`; equaliser; `0 → A_inf → A_inf → A_inf/p` stays exact | sound |
| §5.4 | `M = R`; `⊕ 𝔽_2`; all `0`; one factor; `R/J` | identity; misses `(1,1,…)`; `0 → 0`; identity; `∏ R_i/J_i` | sound |
| §5.5 | singleton; `μ_{p^n}`; `I = ∅` | identity; `∏ A_inf(A_i)/p^n`, `V = ξφ^{−1}`; zero ring | sound |
| §5.6 | rank 0, 1; `cφ`; `𝔽_3(t)^{perf}`; `V − 1` on a fixed basis | `(V − 1)(Σ c_i e_i) = Σ (c_i^{1/p} − c_i) e_i`, onto for `K = K̄`; `x^p − ξx + c = 0` solvable | sound |
| §5.7 | `𝒪_C`, `a = p`; `μ_p`, nonzerodivisor `a`; `a = 0`; non-closed `C`; infinite `I` | `H^{≥1}(C) = 0`; `∏ μ_p(K_i)`; `0 = 0`; `H¹(C, ℤ/p) ≠ 0`; `βI` | = 4.2.10, 2.2.4 (lines 774–777) |
| §5.8 | prime-to-`p`; `𝒪_C`; `ℤ_p⟨t⟩` | arc descent; degree 0; `𝔽_p[t]` imperfect | sound |
| §5.9 | perfect `A`; `ℤ/p`; mixed characteristic `Z` | §2.4; Artin–Schreier; support differs from absolute | sound; basis = CS24 2.2.3 (S01) |
| §5.10 | perfect `A`; regular tower; `d = 0`; `(ξ, ã)` regular | last step of §4.4; `H^{<d}_Z = 0`; `H⁰(𝔽_p, ℤ/p) = ℤ/p`; `A_inf/ξ = A` | sound |
| Layer 5 Ex.; Worked ex. 4 | `𝒪_C`; `(A_inf/p)^{V=1}`, `V = ξφ^{−1}` | `RΓ_𝔪 = 0`; `x = ξ̄x^{1/p} ⟹ x = 0` or `x^{p−1} = ξ̄^p`: `p` solutions `= |μ_p(C)|` | sound |
| §6.1 | Noetherian; `ℤ_p[x]`, `p`, `x`; `ℚ_p/ℤ_p` | bounded torsion; `ℤ_p`; classical completion `0`, derived `ℤ_p[1]` | sound |
| §6.2 | regular dim 2; `W(k)⟦x,y⟧/(p − xy)`; `α_p`; CM and `vdim` | `H^{<2} = 0`; `H^{<2} = 0`; §4.1; §7.8, §6.4 | = 6.2.3 |
| §6.3, §6.4 | `vdim 1` ring; `(x,y)²`; monomial basis | `H⁰_𝔪(ℤ/p) = 0`, `H⁰_𝔪(α_p) ∋ xy ≠ 0`; `U = ∅`, `H⁰ = ℤ/p`; `xy` divisible by none of `x², y², xz, yt` | = 6.2.4, 6.2.6 |
| §6.5 | DVR `μ_p`; field; `α_p` on `𝔽_p⟦x,y⟧`; `A_1`; exponent argument | `0, 0`, `H² ⊇ ℤ/p`; `ℤ/n`, `K^×/K^{×p}`; Kunz; `H²_𝔪(μ_2) ≠ 0`; `e ↦ ≥ e/p > e` on finite sums of negative monomials (`H^d_Z = colim A/(x^n)` by the gap) | = 6.2.7 ("not a field") |
| §7.1 | regular dim 2, `d = 3`; `Spec k ⊔ Spec k`, `d = 1`; smooth `X`, codim `c`; `𝔾_m`, `Z = {1}` | injective `i < 3`, bijective `i < 2`; `(ℤ/2)² → ℤ/2`; `d = c + 1`; `ℤ/p ↪ (ℤ/p)²` | = 7.1.2 with `max(d − 1, 1)` |
| §7.2 | `R^n`; `A_1` ideal; DVR; `M = 0` | as in the declaration table | sound |
| §7.3 | `ℤ/n`; `α_p`; `μ_2` on `A_1`; `(ℤ/2)_k` trivial torsor; `S_3` | purity; extends; does not extend; `4 = 4 ≠ 8`; `36 = 36 ≠ 216` | = 7.1.3 |
| §7.4 | DVR; `k⟦x,y⟧`; `A_1`; `ℤ_p⟦x⟧` | UFD; UFD; `xz = y²`; UFD | sound |
| §7.5 | equivalence ⟺ `Γ` bijective and `Pic(U) = 0` (`Hom(L, L′) = Γ(𝒪)` for trivial `L, L′`); `k⟦x,y⟧`; DVR; `A_1`; node 3; EGA 21.13.6(iii) with `Y′ = f^{−1}(𝔪)` zero-dimensional | holds; parafactorial; `Γ(U) = K`; `ℤ/2`; `ℤ`; descent | = EGA44 lines 12964–12967 |
| §7.6 | SGA2 3.16–3.17 hypotheses a)–e) at `X = U_{R′}`, `Y = U_R`: `depth R′_𝔭 ≥ 4`, `depth R_𝔮 ≥ 3`, `depth R ≥ 4`, induction at closed points of `X`; regular dim 4; node 3; `x_1x_2 − x_3x_4` in 5 variables | all hold; `Pic(X) = 0 ⟹ Pic(Y) = 0`; parafactorial; not; `Pic(U) = 0` | = SGA2 lines 3830–3852 |
| §7.7 | node 3; regular dim 2, field, DVR; elliptic cone; Kummer lift | `ℤ` torsion free; `0`; infinite torsion; `L = res(β) ↦ 0` | = 7.2.1 lines 3707–3710 |
| §7.8 | `n = 3`, Veronese; `H¹_𝔪(μ_2) = 0`; `n = 2` | not CI (6 quadrics), `Pic(U) ⊃ ℤ/2`; degree 2 failure; `A_1` allowed | = 7.2.2 |
| §7.9 | cubic threefold; quadric surface; smooth cubic; cusp over `ℂ` | `ℤ`; `ℤ² / ℤ`; infinite torsion; `ℤ/3` | = 7.2.3; S02 |
| §7.10 | DVR; `𝔸²_ℂ`; field | `Br(R) ↪ Br(K)`; into `Br(ℂ(x,y))`; torsion for `i ≥ 1` | = Gro66 1.4, 1.8 (lines 129–133, 161–163) |
| §7.11 | field; `Spec R`; punctured `k⟦x,y,z⟧`; Segre cone; ample ⟹ separated (`X_f ∩ X_g = X_{fg}` affine, sections surject) | classical; affine Gabber; quasi-affine; nontorsion excluded | sound |
| §7.12 | `k⟦x,y⟧`; syzygy on `k⟦x,y,z⟧`; `A_1` | trivial; not free; `(x,y)` nontrivial | sound |
| §7.13 | `W(k)⟦x,y,z⟧`; hypersurface dim 4; dim 3 | `Br(k)`; iso; §7.14 | = 7.2.5 |
| §7.14 | elliptic cone `S^{sh}⟦x,y⟧/(xy)`; Segre | dim 3, `Br(R) = 0`, `Br(U_R)` infinite; dim 4, nontorsion only; `xy` nonzerodivisor | = 7.2.6 p. 90 |
| §7.15 | `μ_n`, `𝔾_m`, `𝔾_a`; norm torus; `α_p` | `D(ℤ/n)`, `D(ℤ)`, no characters; `ℤ_sign`; dual `α_p` not étale | sound |
| §7.16 | regular dim 2 `𝔾_m`; `μ_n`; `A_1`; node 3 degree 1 | `Br(R) ≅ Br(U_R)`; torsor purity; `Pic(U) ≠ 0`; depth 3 so §0.5(b) applies | = 7.2.8 lines 3830–3845 |
| §7.17 | regular codim 2, `d = 3`; `μ_n`; node 3 | bijective `i ≤ 1`, injective `i = 2`; §7.1; `0 → ℤ` not onto | = 7.2.9 lines 3871–3878 |
| §8.1 | `k⟦x,y⟧`; `W(k̄)⟦x,y,z⟧`; §7.14 ring; strictly local `H^{≥1}(R, F) = 0` | `0`; `p`-part `0`; infinite; `H²(R, μ_n) = 0`, `H³_𝔪 = 0` for `d ≥ 3` | = C19 5.3 p. 12 |
| §8.2 | `R′ = R`; `𝔽_q`, `ℂ((t))`, `ℚ_p^{unr}`, `ℝ`; `R′ ⊗ R′` | identities; `H²(ℝ, ℤ/2) = ℤ/2`; product of regular local rings of dim ≥ 2 | = C19 2.1–2.5, A.1–A.2 |
| §8.3 | strictly henselian `𝔾_m`; `ℤ_p⟦x⟧`; `ℝ⟦x,y⟧` norm torus | `Pic = 0`, §8.1; `0`; `ℤ/2` by §8.6 and henselian invariance | = C19 1.4 |
| §8.4 | closed point; Dedekind; `𝔸¹` | excision; localization; codim-one set not closed | sound |
| §8.5–8.7 | strictly henselian dim 2; `V(x) ⊂ 𝔸²`; `𝔸²_ℂ ∖ 0`; §7.14 | `q ≤ 3`; `H¹_Z = ℤ`; `Br′` unchanged; infinite | = C19 6.1, 1.1 (lines 30–32) |
| §8.8–8.10 | `𝔾_m^r`; `ℙ¹_ℝ`; `Res 𝔾_m`; Dedekind; `𝔸²_ℂ` versus `𝔾_m²`; `Spec ℤ` | holds; fails; holds; unramified classes; ramified along `x = 0`; `⋂_p Br(ℤ_(p)) = 0` | = C19 6.2, 1.2 |
| §8.11–8.12 | `ℤ_sign`: `Ext¹(ℤ_sign, ℤ) = ℤ/2`, `Ext¹(ℤ_sign, ℤ[G]) = 0`; `H¹(ℝ, T) = ℤ/2` | not flasque; wrong test; class dies over `ℂ` | = CTS87 1.2, 2.2(ii), 2.4 |
| §8.13 | `ℚ_p`; imperfect `k((t))`; `Br(ℚ) → Br(ℚ_p)` | `Br(K^{unr}) = 0`; `Br[p] ≠ 0`; single-class comparison | = Poo17 6.8.1–6.8.2 |
| §8.14–8.15 | `ℤ_p`; `ℂ⟦t⟧`; imperfect `k⟦t⟧`; `ℝ⟦t⟧`; `𝔽_q⟦t⟧`, `(L/K, Frob^{±1}, t)` | `∂` iso; `0`; no `p`-sequence; `ℤ/2 → (ℤ/2)² → ℤ/2`; `±χ` inverse classes (`(−χ, a) = −(χ, a)`) | = C19 6.4, AGD R02.2.4 |
| §8.16–8.18, Worked ex. 5 | `Spec ℤ`; char 0; `𝔸²_{𝔽_p}`; `ℤ_p⟦x⟧`: `(p)` versus `(x)`; cyclic algebra `n = 1, 3` | `Br(ℤ) = 0`, injective into `⊕_p ℚ/ℤ`; nothing excluded; `p`-parts excluded; `𝔽_p((x))` imperfect, `ℚ_p` not; residue `χ_y`, swap gives `−χ_y`; `(−1,−1)_ℚ`: `1/2` at `2` | sound |

## Not verifiable

- Lean elaboration and the `#check @name` audit: this pass may run no Lean. The twelve types in
  `signatures.md` (and the fix report's elaboration of the three new theorems) were compared by hand.
- Uncertified sources cited by locator only (Aus62 1.3, Avr77 3.6, Gro68 Brauer III 2.1 and 6.1 b, MB85
  Lemme 2, Bou78 IV 5.1 and V 4.9, Gab04b Conjectures 2–3, BH 2.3.1, SGA 3 IX 1.1/2.11 and X 4.5, SGA 4 V 6.4
  and VII 5.7, SGA 5 I (4.2.2), DF84 Remark 3): checked only against the way CS24/C19 invoke them.
- Published numberings (ILO XVII 0.2 = arXiv 0.9; ALB23 5.4 = arXiv 5.1.4): only the arXiv texts were read.
- Ownership against open pull requests: checked through `roadmaps grep`/`show` (index 2026-11-04, 452 pull
  requests) and the sibling checkouts named in the brief; not every open head was read by hand.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "cfdb8a6141e0152574ca7d57d4e76c09b0211ff1", "job": "RT-PurityForFlatCohomology~2b", "model": "fable", "worker": "chris-x8"} -->

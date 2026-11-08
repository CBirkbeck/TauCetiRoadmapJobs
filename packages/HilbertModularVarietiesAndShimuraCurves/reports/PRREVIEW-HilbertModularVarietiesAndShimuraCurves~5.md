# Review of HilbertModularVarietiesAndShimuraCurves (pull request #1005 at cd70693)

**Verdict:** needs changes

Independent AI review: 6 findings (1 P2, 5 P3). This is a full review of the head; the folder changed by 230 lines since d3e151e. Below, README means `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md` and Suggested.lean the file beside it. Other roadmaps are cited by folder and pull request, with line numbers at that pull request's head.

## Previous findings (review of d3e151e)

| Id | Status | Evidence at cd70693 |
| --- | --- | --- |
| R01 module-system build warning | Repaired | Suggested.lean:1–3 reads `module` / `public import Mathlib`, and :57 reads `@[expose] public section`. `lake env lean` exits 0 with no output, and the worker's gate has `build=0`. |
| R02 GL2AutomorphicRepresentationsAndTransfer R17.3.8a–d | Repaired | No `R17.3.8a`–`d` remains. README:9, 33, 134 and the Dependencies at 2533 and 3317 cite QuaternionicModularForms §§0.2–0.4, 1.3, 2.1–2.3, 3.1. The one bare “§R17.3.8” (README:3877) is GL2AutomorphicRepresentationsAndTransfer R17.3.8, which exists (#931 line 1729). |
| R03 §R18.5.16b restates QuaternionicModularForms §0.3 | Repaired | The section and its three Lean theorems are gone. README:2445 cites “QuaternionicModularForms §0.3 for the refinement fibres”; §R18.3.3's proof route (README:2810) cites §2.1 “(central characters)”; item 4 attributes the indices to §0.2. One leftover sentence is in R05 below. |
| R04 two owners of Eichler orders and Brandt matrices | Partly | This side now claims ownership (README:9, 4392) and declares no `IsEichlerOrder`. QuaternionArithmetic at #1722 still owns the same objects: see R01 below. |
| R05 dropped supplier anchors | Partly | The ClassicalArithmeticCompletion links now use `#74-…` and `#772-…`; both resolve on main. AlgebraicTopology is cited as Layer 6 with #1652's anchor, but #1652 is not named in the description: see R04 below. |
| R06 intermediate order lemmas in Suggested.lean | Repaired | Suggested.lean declares nothing. README:183 says it “contains no theorem signatures”. |
| R07 ℚ(√10) Brandt Check | Repaired | README:2399 now says that `s_{𝔭₂}` is the identity, so `B(𝔭₂)` is self-adjoint although `𝔭₂` is not principal, and adds the mass computation. |
| R08 Zha14 URL | Repaired | README:4435 links the `…-a002.pdf` file. |

## R01 (P2) — Eichler orders and Brandt matrices still have two owners: QuaternionArithmetic does not take them from here

**Location.**
- README:9: “QuaternionArithmetic, which consumes this roadmap, takes these objects from those sections for its §§1.9–1.10, 1.12, 3.2, 3.4 and Layer 7.”
- README:4392 says the same under Downstream consumers.

**Claim.** The ownership contract is one-sided. At its head, QuaternionArithmetic still defines and proves exactly what §§R18.5.16a and R18.5.16c own. Its list of what it consumes from this roadmap omits both sections. The objects therefore have two owners, which the previous review's R04 asked to settle.

**Witness.** QuaternionArithmetic README at #1722: line 664 “Define Eichler orders as pinned. Prove … conjugate to the standard order” (R18.5.16a items 1–2); lines 1491–1497 define Brandt matrices; lines 236–239 consume only R18.1, R18.3.1, R18.5.17a.

**Repair.** This roadmap is the only admissible owner, because QuaternionArithmetic consumes R18.1, R18.3.1 and R18.5.17a and so comes later in the merge order. The settlement therefore needs the following edit in #1722 (author roed-math), and this pull request should not be accepted until that head carries it:
- QuaternionArithmetic §1.9 cites R18.5.16a items 1–2 for the definition and the local form. It keeps only what R18.5.16a does not state: superorders, hereditary orders and the normalizer quotient ℤ/2.
- §1.10 cites items 2 and 4 for the level and the local unit index.
- §1.12 cites item 1 for the two maximal orders at distance e.
- §§3.2 and 3.4 cite item 6 for the class set and the idelic dictionary.
- §§7.1–7.3 cite R18.5.16c items 1–4. The Brandt matrices there are `B(v)ᵀ`, because QuaternionArithmetic's convention (README:137) is Voight's column convention.
- Lines 236–239 add R18.5.16a and R18.5.16c to the consumed list.

QuaternionArithmetic's Lean `IsEichler` can stay as the carrier of its own headlines, since this roadmap declares none. If #1722's author declines, the only other settlement is the reverse one: QuaternionArithmetic drops its dependence on this roadmap and moves earlier, and §§R18.5.16a and R18.5.16c are cut to citations. Either way, README:9 and README:4392 must describe the other roadmap as it actually is.

## R02 (P3) — The §R18.3.8 proof route copies a misprinted kernel relation

**Location.** README:2899: “If (f,g) lies in the kernel, then `f(x)=−g(xω)` with `ω=diag(ϖ_w,1)`; so f is invariant under H and `ω⁻¹Hω`”.

**Claim.** The degeneracy map is `π₂=ρ_{ω⁻¹}`, with `ρ_g[γ]=[γg]`. A kernel element therefore satisfies `f(x)=−g(xω⁻¹)`. The displayed `g(xω)` is not a function on `Y_{H₀(w)}`. It would also make f invariant under `ωHω⁻¹`, not under the `ω⁻¹Hω` the same sentence uses.

**Witness.** Take `k=(1 1; 0 1)∈H₀(w)`. Then `ω⁻¹kω=(1 ϖ⁻¹; 0 1)∉H`, so `x↦g(xω)` is not `H₀(w)`-invariant, while `ωkω⁻¹=(1 ϖ; 0 1)∈H`. The conventions are at MS19 line 367 (`ρ_g`) and MS19 lines 486–489 (`π₂=ρ_{ω⁻¹}`).

**Repair.** Write `f(x)=−g(xω⁻¹)`. Then `f(xω⁻¹hω)=−g(xω⁻¹h)=−g(xω⁻¹)=f(x)` gives the stated invariance under `ω⁻¹Hω`, and the rest of the route is unchanged. The source misprint is listed under Source issues.

## R03 (P3) — Nine links to supplier sections point at anchors that do not exist

**Location and repair.** Each link below targets a heading anchor that the supplier README does not have; replace it as shown. The italic target names stay in the text.

| README line(s) | Current anchor | Replacement anchor | Target heading at that head |
| --- | --- | --- | --- |
| 94, 2445, 2487 | `GL2AutomorphicRepresentationsAndTransfer/README.md#r17-1-swapped-quaternion-invariants` | `#r1715-swapped-quaternion-invariants-in-arithmetic-applications` | #931 line 1462 |
| 2445 | `AdelicAlgebraicGroups/README.md#s-arithmetic-double-cosets` | `#44-double-cosets-and-level-topology` | #792 line 4765 |
| 2445 | `AdelicAlgebraicGroups/README.md#quaternion-norm-one-strong-approximation` | `#42-strong-approximation-and-arithmetic-closures` | #792 line 4282 |
| 136, 3027 | `AutomorphicFormsOnReductiveGroups/README.md#anemic-eigensystems` | `#58a-universal-anemic-presentation-and-eigensystems` | #1037 line 912 |
| 2868 | `AutomorphicFormsOnReductiveGroups/README.md#invariants-hecke-operators` | `#05-smoothing-and-finite-hecke-operators` | #1037 line 183 |
| 3005 | `AutomorphicFormsOnReductiveGroups/README.md#galois-anemic-eigensystem` | `#58b-galois-eigensystems` | #1037 line 926 |

**Claim.** These 9 of the 73 anchored cross-roadmap links do not resolve. The other 64 resolve, one of them (AlgebraicTopology) only at #1652 (R04), and all 168 internal anchors resolve.

**Witness.** AutomorphicFormsOnReductiveGroups at #1037 has no `id=` attribute and no heading producing these anchors; AdelicAlgebraicGroups at #792 writes *s-arithmetic-double-cosets* only as an italic label (line 4767), which GitHub does not anchor. All six replacements resolve.

## R04 (P3) — AlgebraicTopology Layer 6 exists only at #1652, which the description does not name

**Location.** README:3572 links `../AlgebraicTopology/README.md#layer-6-cohomology-products-and-manifold-duality`; README:45 and README:100 say “AlgebraicTopology, Layer 6”.

**Claim.** Following the previous review, this citation uses the numbering of #1652's head, which makes #1652 a dependency. The description names #1652 neither in its Depends-on list nor in its merge-order paragraph.

**Witness.** On main, AlgebraicTopology README:946 is “Stage 6: cohomology, products, and manifold duality”. At #1652's head, line 1576 is “Layer 6: …”. In the pull-request description, “1652” occurs nowhere.

**Repair.** Add “#1652 AlgebraicTopology (kim-em)” to the description's Depends-on list, and put it before this pull request in the merge-order paragraph. The README text stays as it is.

## R05 (P3) — Catalogue residue: repeated locators, self-references and a removal stub

**Location, claim and repair.** These lines repeat a section number, cite a section from inside itself, or record a deleted identifier:
- README:93: “(§3, `§3.4`, `§3.4`)”, “(`§4.3`, `§4.3`)”, “(`§4.2`, `§4.2`)”. Change to “(§§3, 3.4)”, “(§4.3)” and “(§4.2)”.
- README:116: “(§3.14, §3.14)”. Change to “(§3.14)”.
- README:128 and 3869: “`§7a.1`, `§7a.2`, `§7a.1`”. Change to “`§7a.1`, `§7a.2`”.
- README:3045: “`§3.4`, `§4.3`, `§4.3`”. Change to “`§3.4`, `§4.3`”.
- README:4007: “`§1.9`, `§1.9`, `§2.4`, `§2.4`”. Remove the duplicates.
- README:4125 and 4137, inside §R18.4.30: “regular-base flatness specialization (§R18.4.30)”, “nodal thickening transfer (§R18.4.30)”, “nodal filtration transfer (§R18.4.30)” and “the MS Lemma 5.2/5.3 algebra required of §R18.4.30”. Drop the self-references, for example “Prove the nodal thickening transfer: …”.
- README:3317: “the fixed-central-character adapter fixed-central-character algebraic forms (§R18.3.3)”. Change to “the fixed-central-character adapter (§R18.3.3)”.
- README:9, last sentence: “The identifier §R18.5.16b names no target of this roadmap; its citations resolve to QuaternionicModularForms §0.3 …”. Delete it. No roadmap cites the id, and the same paragraph already assigns QuaternionicModularForms §0.3 the refinement fibres.

**Witness.** `roadmaps grep 'R18\.5\.16b'` over main and all 472 open heads matches only README:9. The listed strings occur verbatim at those lines.

## R06 (P3) — The Sai09 §4 page is off by one

**Location.** README:4239: “(Source: [Sai09](#references) §§4–5, pp.18–24; …”.

**Claim.** Section 4 begins on internal p.19.

**Witness.** In Sai09, the header of page 19 is at line 817, and “4. Shimura curves and sheaves on them.” follows at line 841. Line 775 starts page 18, which contains no section heading.

**Repair.** Change the locator to “§§4–5, pp.19–24”.

## Verified sound

**Validation.**
- **Head and pins.** Head cd706930b9e6e4f034dbba0cb23602b55d6b1838. Pins unchanged: Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e, Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5, Lean v4.36.0-rc2. The diff outside the folder is empty. The folder holds README.md, Suggested.lean and metadata.toml (`topic = "math.NT"`).
- **Worker's gate.** Every rule is 0, including `build=0` and `stray-files=0`.
- **My rerun of the gate.** Every text rule is 0, ending in `OK`.
- **Dependency check.** Output, exactly: `depcheck: 240 roadmaps, 2465 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` on Suggested.lean: exit 0, no output at all.
- **Worktree.** Nothing in the worktree was changed. The source fetches wrote only to a scratch copy of the manifest.

**Suggested.lean.**
- The file declares no `def`, `theorem` or `instance`, so the `#check @` signature pass and the one-tactic padding probe have nothing to run on.
- The docstring has the required form: the roadmap is README.md, the file states the headlines against the pins, and it lists each group of headlines with the carrier it lacks.
- **Headlines.** The end theorems are R18.5.15, R18.4.32–R18.4.33, R18.3.8 and H6.2–H6.8. The deep inputs are R18.5.7, R18.5.11, R18.5.12c, R18.4.29, R18.4.30 and H6.5.
- **None is statable.** No Shimura-curve, Hilbert-moduli, Drinfeld, real-multiplication or quaternionic-form carrier exists at the pins. R18.3.8 also needs MS19's non-Eisenstein condition, which is defined through the attached Galois representation `ρ̄_m` (MS19 line 438). The statable commutative algebra inside R18.4.30 consists of proof lemmas (MS19 calls them that, line 1564), not headlines.

**Library declarations opened at the pins (all present).**
- **Tau Ceti:**
  - `HeckeRing.GL2.deg_heckeT` and `degree_diagCoset_prime_pow` (NumberTheory/HeckeRing/GL2/Degree.lean).
  - `NumberField.NarrowClassGroup.instFinite` (NarrowClassGroup/Finite.lean:38) and `exists_mk0_eq_and_isCoprime_absNorm` (NarrowClassGroup/CoprimeRepresentative.lean).
  - `NumberField.card_elementaryTwoQuotient_units` and `units_sq_index_eq` (Units/ElementaryTwoQuotient.lean).
  - `NumberField.IsTotallyPositive`, `totallyPositiveIntegerUnits` and `sq_mem_totallyPositiveIntegerUnits` (TotallyPositive.lean).
  - `NumberField.unitsMulEquivTorsionProdMultiplicative` (Units/Dirichlet.lean).
  - `QuaternionAlgebra.normForm_coe` (Algebra/Quaternion/NormForm.lean).
  - `TauCeti.LocalCoefficientSystem.pullback` (LocalCoefficient.lean:78), together with `monodromyRepresentation` and `constantFunctor`.
  - `twistedCochainComplex`, `twistedCohomology` and `twistedCochainComplexCoefficientMap` (AlgebraicTopology/Cohomology/Twisted/Basic.lean:79, 84).
  - `TauCeti.SU2.symPower`, `finrank_symPower`, `isIrreducible_symPower` and `existsUnique_nonempty_equiv_symPower`.
  - `TauCeti.symPowerRep` and `Representation.charTwist`.
  - `TauCeti.exists_trace_mul_algebraMap_eq` and `exists_sum_trace_mul_smul_eq` (Different/DualFamily.lean).
  - `TauCeti.IntegralOrder.IsOrder` (Basic.lean:75), `IsMaximalOrder` (Maximal.lean:67) and `leftOrder` (LeftOrder.lean:61).
- **Mathlib:**
  - `HeckeCoset` and `IsHeckeTriple` (NumberTheory/HeckeRing/Defs.lean:157, 75).
  - `Representation.coind` (RepresentationTheory/Coinduced.lean:80) and `Rep.resCoindAdjunction`.
  - `groupCohomology.H1ofAutOnUnitsUnique` and `exists_div_of_norm_eq_one` (Hilbert90.lean).
  - `Module.free_of_finite_type_torsion_free'` (FreeModule/PID.lean).
  - `Submodule.mem_traceDual` and `FractionalIdeal.dual_eq_mul_inv` (DedekindDomain/Different.lean).
  - `RingHom.ker_isMaximal_of_surjective` (Ideal/Maps.lean).
  - `NumberField.Units.dirichletUnitTheorem.unitLattice_span_eq_top` and `instZLattice_unitLattice`.

**Cross-roadmap citations resolved.**
- **QuaternionicModularForms (#934).** Each section states what README:9, 33 and 134 attribute to it:
  - §0.2 (line 307): `U₀`, `U₁`, and the indices `q^{t−1}(q+1)` and `q^{2t−2}(q²−1)`.
  - §0.3 (line 345): refinement fibres and finiteness at every open level.
  - §0.4 (line 382).
  - §1.3 (line 499): `L_{n,v}`, the `w`-conjugation comparison, and `ν_alg(π)^e`.
  - §2.1 (line 606): central characters, with the action extended to `U𝔸_{F,f}ˣ`.
  - §§2.2–2.3 (lines 662, 716).
  - §3.1 (line 1003): the inversion formula `[Uη_v⁻¹U]=S_v⁻¹T_v`.
  - Convention 4 (line 111): the `Δᵐᵒᵖ` right action.
- **AutomorphicFormsOnReductiveGroups (#1037).** §§7.4 and 7.6 resolve at lines 1219 and 1267.
- **AdelicAlgebraicGroups (#792).** §5.3 (*quaternion-class-sets*, *definite-quaternion-stabilizers*) and §4.6 (*quaternion-norm-images*) resolve.
- **NeronModelsAndSemistableAbelianVarieties (#852).** §§4.2 and 4.14 and Layer 4 resolve.
- **ClassicalArithmeticCompletion (main).** §§7.4 and 7.72 resolve.
- **Planned supplier names.** `LocallySymmetric.FrankeInput` and `SheafDerived.isoSingular` (ArithmeticLocallySymmetricSpaces #871), `CanonicalModel.minimal_defined_over_reflex` (ShimuraVarieties #933) and `OrderIdeles.unit_change` (ClassicalArithmeticCompletion main) are present in those READMEs.
- **Other open roadmaps citing this one.** PadicFamilies (#1019) cites §§R18.3.1, R18.3.4, R18.3.5, R18.3.22 and R18.5.16a, and HilbertModularVarietiesAndShimuraCurvesPartII (#1745) cites R18.1–R18.4 ranges. All of these ids exist here. No other open pull request changes this roadmap.

**Ownership.**
- **Method.** Checked by object: Eichler orders, Brandt matrices, class sets and their central quotient, refinement fibres, coefficient modules, level forms, central characters and Hecke inversion. I searched main and the open heads, and read #934, #1722, #1037 and #1745.
- **Only remaining second owner.** QuaternionArithmetic (R01).
- **Why this roadmap owns the Eichler and Brandt material.** It precedes QuaternionArithmetic in the merge order.

**Seeded sample (15 targets, all read at their locators).**

| Label | Target | Source (`<id> line N`) | Result |
| --- | --- | --- | --- |
| Definition | H1.1 ordered module | Tay02 line 321 (internal p.10; the scan's page N is internal page N−1) | Supported |
| Comparison | R18.5.6 height action | BZ22 lines 2031–2057 (§5, (5.18)–(5.20), Prop 5.9, pp.38–39) | Supported; heights are even (line 2032) |
| Definition | H2.1 local model | DP94 lines 349–352 (§3.2, p.68), 436–466 (§§4.1–4.2, pp.70–71) | Supported |
| Theorem | R18.5.15 Čerednik–Drinfeld | BZ22 lines 2412–2423 ((6.29)–(6.31)), 2559–2580 (Thm 6.7, Cor 6.8, p.49) | Supported |
| Theorem | H1.5 determinant condition | DP94 lines 256–286 (Prop 2.7, Cor 2.9, pp.65–66) | Supported |
| Comparison | R18.4.24a semistable comparison | Sai09 lines 1373–1451 (§7, pp.32–33), §8 from line 1452 (p.34) | Supported |
| Definition | R18.5.1 Drinfeld half-plane | CDN20 lines 459–471 (§1.2, p.12) | Supported |
| Comparison | R18.4.9 adjoint localization | MS19 lines 373–395 (§2.7, p.8), 444 (Prop 2.3, p.9) | Supported |
| Definition | R18.5.4 special formal moduli | BC91 lines 3768–3787 (Déf. (8.1), Thm (8.2), printed p.107); BZ22 lines 2026–2051 | Supported |
| Theorem | H2.3 flatness and normality | DP94 lines 226–235 (Thm 2.2, Cor 2.3, pp.64–65), 469–510 (§§4.3–4.5, pp.71–73) | Supported |
| Definition | R18.4.14 Gram operator | MS19 lines 481–498 (§2.11, p.10) | Supported (the matrix is derived in the roadmap) |
| Theorem | R18.4.33 integral saturation | MS19 lines 1686–1707 (Lemma 6.4, Thm 6.5, p.34), 472 (§2.10, p.10) | Supported |
| Theorem | R18.4.30 Steinberg flatness | MS19 lines 1568–1663 (Lemmas 5.1–5.3, pp.31–33), 1875–1930 (Props 6.10–6.12, pp.37–38) | Supported; the README's “swapped ambient rings” remark is correct |
| Theorem | H6.5 local torsion points | Tay02 lines 217–258 (pp.6–7), 335–413 (Lemmas 1.2–1.3, pp.10–12), 418–437 (p.13) | Supported; Taylor assumes cyclotomic determinant (line 130), matching (C1) |
| Finite-level specialization | R18.4.34 Saito projector | Sai09 lines 1240–1290 (§6.3, Lemma 3, p.30), 1389–1402 (Lemma 4, pp.32–33) | Supported; page error R06 |

No README locator is flagged as unverified.

**Adversarial pass.** Values were computed this round.

| Statement | Instances tried | Values on each side | Result; change |
| --- | --- | --- | --- |
| R18.5.16a item 1 | `O₀(𝔭^e)`, column lattice `O⊕𝔭^e` | `End(O⊕𝔭^e)=(O, 𝔭^{−e}; 𝔭^e, O)`, and its intersection with `M₂(O)` is `O₀(𝔭^e)`. The stabilizer of `O⊕𝔭^e` in `GL₂(O)` is `K₀(𝔭^e)`, with quotient `O/𝔭^e`. | Correct; second owner (R01) |
| Item 4 indices | q=3, e=1 | `K₀`: 4=#ℙ¹(𝔽₃). `K₁`: 8=9−1 nonzero rows. The additive index is `q=3≠4`. | Correct, cited to QuaternionicModularForms §0.2 |
| Item 5, adjacent order | `n=(0 1; ϖ 0)` | `nXn⁻¹=(d, c/ϖ; ϖb, a)`; `nM₂(O)n⁻¹∩M₂(O)=O₀(𝔭)`; `n²=ϖI` | Correct |
| Items 7–8, Hurwitz Checks | Hurwitz; level 3; disc 37 | `F×∩R̂×=O_F×`. w=24/2=12 and 6/2=3. Masses 1/12·(3+1)=1/3. Disc 37: h=3, type number 2. | Correct |
| R18.5.16c ℚ(√10) Check | Siegel formula for d=40 | σ₁ terms 18+26+24+2=70, so ζ_F(−1)=7/6. Mass 2⁻¹·(7/6)·2=7/6. Weights (12,2,3,4): 1/12+1/2+1/3+1/4=7/6. Item 4: 4·3=12·1, 3·2=2·3, 4·1=2·2. Distinct weights force `s=id`, since left orders are unchanged by central `𝔭`. | Correct |
| p=23 Brandt Check | `B(2)`, w=(2,1,3) | `B·diag(2,1,3)=((2,2,0),(2,1,3),(0,3,0))` is symmetric; Σ1/w=11/6=22/12 | Correct |
| R18.5.16c item 2 | QuaternionicModularForms convention | `Σ_{y∈UηU/U}f(xy)` is QuaternionicModularForms' `T_{η⁻¹}`. `Uη⁻¹U=ϖ⁻¹UηU` gives `S⁻¹T`. | Correct |
| R18.5.17a incidence | dart x→y, q successors | `a_*U_r e=q·y=q·b_*e`; `b_*U_r e=T_r y−x` | Correct |
| R18.3.2 | d=2, k=4; `Sym²` pairing | rank 3²=9; Gram ((0,0,2),(0,−1,0),(2,0,0)), det 4 | Correct (not perfect over ℤ₂) |
| R18.3.3 | `t∈U∩Z`, `uz=(ut)(t⁻¹z)` | `ψ(t⁻¹z)τ(ut)⁻¹=ψ(t)⁻¹ψ(z)ψ(t)τ(u)⁻¹=ψ(z)τ(u)⁻¹` | Correct |
| R18.3 Examples | `C₈`, N=2 | `C₈/{0,4}≅C₄`; `C₈/2C₈≅C₂` | Correct |
| R18.3.8 (headline) | F=ℚ, D ramified at {2,∞}, H maximal | `Y_H` is one point; kernel {(a,−a)}; `T_v` on constants is `q_v+1` (Eisenstein). Witness `k=(1 1;0 1)`: `ω⁻¹kω∉H`. | Statement correct; proof sign (R02) |
| R18.3.15 | 𝔽₇, q=3, det 6 | S=2; qS=6 | Correct |
| R18.4.9 | central `s=ψ(ϖ)` | `m*=m` iff `s=s⁻¹`; order>2 gives `m*≠m` | Correct |
| R18.4.14 | q=2, T=3, S=2 and S=1 | `GJ=((q+1)²−S⁻¹T²)·id` by expansion. `G(0,1)=(3/2,3)`. With S=1, Δ=0 and G(1,−1)=(0,0). | Correct |
| R18.4.30 | `A=k[[t]]`, `R=A[[x]]`, M=R; M=k | dim R=2=1+1, so flat. M=k has depth 0<1, is not MCM and not flat. | Correct |
| R18.4.32 (headline) | l=3; l=5 clause | \|SL₂(𝔽₃)\|=24, divisible by 3. The l=5 clause is MS19 Thm 6.5(2), line 1703. | Correct; not statable |
| R18.4.33 (headline) | `O→O², x↦(x,0)` | The cokernel O is free. Modulo λⁿ the cokernel `O/λⁿ` is free over `O/λⁿ` but has λ-torsion. | Correct; not statable |
| R18.4.34 | (g,w)=(2,4), (1,k), (1,2); k=(6,2) | q₀=6, a=2, degree 7. g=1: q₀=k−2 (Kuga–Sato degree k−1). w=2: q₀=a=0. (w−6)/2=−1 is excluded. | Correct; page (R06) |
| R18.5.15 (headline) | disc 6 at v=2; `M₂(ℚ)` | `inv₂=½`, `inv_∞=0`; `M₂(ℚ)` has `inv₂=0` and is excluded | Correct; not statable |
| R18.5.16, R18.1.1a | level 7, `𝔽₇ˣ/cubes` | Classes {1,6}, {2,5}, {3,4}. `nrd(s)=2` maps to 2⁻¹=4 and `Π⁻¹` to 2; 2·4≡1, so the cycles are inverse. | Correct |
| R18.5.4 | [K:ℚ_p]=2; `[π]` | Group height 8; `[π]` has relative height 4 and absolute height 4f, while the group height is 4ef | Correct |
| R18.5.6 | `π·id`; `SL₂(K)` | Height shift 2 for `π·id`, 0 for `SL₂(K)` | Correct |
| R18.5.1 | `z∈K₂∖K`; ∞ | `Ω_K(C)=C∖K` contains z; ∞ is excluded | Correct |
| H2.1 | `k[T]/T²`, `W=⟨Te₁,Te₂⟩` | `⟨Te₁,Te₂⟩=T²=0`; `W^⊥=W`; `TW=0`, not free; DP94 stratum i=j=1 | Correct |
| H1.5 | ℚ(√2), a=√2 | On a free rank-one `O⊗K` module the characteristic polynomial is `T²−2=N(T−√2)` | Correct |
| H4.18 | ℚ(√2), N=5, g=2 | `[U:U₅]=12` (ε has order 12 mod 5). Bound 12·2²=48≥\|Δ_n(5)\|=6. | Correct |
| H4.19 (i) | p=3, N=4, `η=ε⁴` | η=17+12√2 ≡1 mod 4 and ≡−1 mod 3; ±η∉U₁₂. η² is nonzero in Δ₁(4) and zero in Δ(4). | Correct; refutes BHW23 (Source issues) |
| H4.19 (ii) | p=2, N=5 | b_m=1, 2, 12, 408 with v₂=m. `ε⁶=99+70√2≡−1 mod 5`. `U_{2ⁿ5}=⟨ε^{3·2ⁿ}⟩`, so `Δ_n≅ℤ/6`; ×2 transitions give limit ℤ/3 | Correct |
| H6.5 Check (headline input) | `x³−3x+1`, l=7, p=19 | Disc 81. Values mod 7: 1,6,3,5,4,6,3. Roots mod 19: 3, 7, 9 (323=17·19, 703=37·19). `π₇²−π₇+7=0`; `π₇³=−10−9√−3`; √−3≡±4 gives 11 and 7; 343≡1 mod 19 | Correct; not statable |
| H1.1 | O=ℤ; −1 | The cone is {n>0}; −1 swaps the components, so it is not ordered | Correct |

## Not verifiable

- **Voi21 printed pages.** The sources service does not read link.springer.com. Section numbers were checked in the author's v1.0.5 edition in the previous round. This round the R18.5.16a/c mathematics was recomputed (table), not re-located.
- **BC91 Part I §§1–2 (R18.5.1).** Not reread. CDN20 §1.2 alone supports the definition.
- **Tay02 formulas.** The scan is OCR'd, and some displayed formulas are unreadable, for example the Tate HBAV module at Tay02 line 348. The statements and pages were checked; the exact `𝔡_M⁻¹` twist was not.
- **Outside this sample.** YZ18, Kur79, KL05, Dim05 and PRR23 (cited by locator, paywalled) were not reread.

## Source issues

- **Misprint** in MS19 at §6 opening and Theorem 1.4, pp.33 and 5: the source calls the indefinite algebra ramified at exactly one infinite place; it should say split at exactly one infinite place, as §2.2 defines the indefinite case; affects nothing.
- **Misprint** in MS19 at proof of Theorem 6.8, p.35: the source writes the kernel relation as f(x) = −g(xω); with its own π₂ = ρ_{ω⁻¹} (§2.11) it should be f(x) = −g(xω⁻¹); affects the proof.
- **Misprint** in MS19 at proofs of Propositions 6.11–6.12, p.38: the source applies Lemma 5.2 over R^unip and Lemma 5.3 over R^ps; it should be R^ps (an X²Y-algebra) for Lemma 5.2 and R^unip (an XY-algebra) for Lemma 5.3; affects the proof.
- **Error** in MS19 at proof of Theorem 6.8, p.35: the source factors through F^×\A_f^×/ν(H); for totally definite D the reduced-norm image is the totally positive F₊^×, so it should be F₊^×\A_f^×/ν(H); affects the proof.
- **Error** in BHW23 at Lemma 8.20, p.1775: the source claims Δ_∞(N) = Δ_n(N) for large n, via a map Δ_n(N) → Δ(N) said to be injective; it should say only that the images of Δ_∞(N) stabilize, since ℚ(√2) gives non-injectivity at p=3 and ℤ/6 versus ℤ/3 at p=2; affects a stated result.

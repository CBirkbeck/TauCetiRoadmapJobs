# Review of IntegralHeckeAndGaloisDeterminants (pull request #1689 at b11da0d)

**Verdict:** needs changes

The gate passes, but four blocking findings remain. The worktree was not changed. Locations below are in `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md` unless another file is named.

**Previous findings, checked first against this head.** The supplied previous report identifies PR #792 at `6008aed`, not the present head. Its assertions were therefore rechecked, rather than carried forward on the brief's “none” change label.

| Previous finding | Passage at this head and disposition |
|---|---|
| R01, admitted data | **Repaired.** `Suggested.lean:47` has `def ker` with actual closure proofs; `:90` defines `IsRealizedBy` by equality with matrix characteristic polynomials. The admitted `traceLinear`, `ofMatrix` and example are absent. |
| R02, roadmap import | **Repaired.** The only imports are `import Mathlib` and `import TauCeti.RingTheory.FittingIdeal.Basic` (`Suggested.lean:1`). |
| R03, omitted headlines | **Repaired.** The docstring names the missing carriers, beginning “The determinant coordinate-ring and Vaccarino statements need the homogeneous divided-power algebra”; `existsUnique_of_isAzumaya` is present at `Suggested.lean:163`. |
| R04, padding | **Repaired.** The 75 admitted examples and elementary nilpotence/projection declarations are absent. The fresh 21-theorem probe below found no replacement padding. |
| R05, commit links | **Repaired.** The four supplier links no longer use `blob/<commit>`; the head's gate reports `blob=0`. |
| R06, process references and unowned Koszul work | **Repaired.** The Koszul input now names DerivedModuleAlgebra §0.K.1. The Mathlib pull-request links and “Build these contracts in Tau Ceti when absent” are absent. |
| R07, Fitting namespace | **Not repaired.** Line 505 still says `TauCeti.Module.fittingIdeal_le_annihilator`; see R05 below. |
| R08, source versions/locator | **Partly repaired at best.** Line 2282 still says “§2.3, pp.15–16”; the adapted-ring section is §2.4. The DKSW reference still lists only the September author manuscript. Both versions were opened; sampled theorem pagination agrees. See R06. The previous report's proposed §2.3 repair should not be followed. |
| R09, small text defects | **Partly repaired.** The coset example now uses right cosets. The ACC conversion citation still omits pp.931–932 for §2.2.20; the local derived-category instance still has no docstring. See R06 and R08. |

No supplied repair disposition marked these remaining matters “not actionable in this package.” The findings below concern this head, not the old gate failures.

## R01 (P1) — Break the two-way supply with ReductiveGroups

**Location:** README:71 and :471: “ReductiveGroups layer 1: comodules, comodule morphisms, tensor products and the regular representation”; :477 also imports layer 9. The corresponding `Needs` occur at :1204 and :1267.

**Claim:** This folder consumes ReductiveGroups, but ReductiveGroups on main consumes this folder's generic rational cohomology and induction. This violates the single direction of supply even though the mechanical check reports no cycle.

**Witness:** `TauCetiRoadmap/ReductiveGroups/README.md:221–226` assigns the generic constructions to IntegralHeckeAndGaloisDeterminants0.7; :521–542 consumes that supplier in layer 6A. Thus both roadmap-level dependency edges exist.

**Repair:** Remove ReductiveGroups as a supplier here. Cite the pinned native comodule/cofree and GL coordinate APIs for the actual foundations; formulate the generic constructions on the given flat commutative Hopf algebra. Leave root-datum instantiation and its comparisons to the consuming ReductiveGroups roadmap, where that construction already belongs. Do not duplicate its layer 9 here. This leaves a single IHG-to-ReductiveGroups supply direction. On the trivial Hopf algebra, cofree `M ⊗ A ≃ M` and coaction `m ↦ m ⊗ 1` still provide the same construction without either roadmap-level input. The clean mechanical output below does not negate these explicit edges.

## R02 (P1) — The telescope equivalence sends a zero relation class to a nonzero element

**Location:** README:2965–2967: “`single n x − single (n+1) (t x)` … sending that generator's class to `Module.DirectLimit.of … n x`.”

**Claim:** The displayed generator is a generator of the submodule being quotiented out, so its class must map to zero.

**Witness:** Take `M=ℤ`, `t=id`, `n=0`, `x=1`. The indicated class is `0`; the indicated direct-limit element corresponds to `1 ∈ ℤ`.

**Repair:** Say that the class of `single n x` maps to the stage element, and that each displayed relation maps to zero by `Module.DirectLimit.of_f`. On this instance the corrected relation maps to `1−1=0`, while `[single 0 1]` maps to `1`. Add this distinction as a negative-control Check. This is a correction of the specified map, not a rejection of the usual telescope theorem.

## R03 (P2) — Give contraction and pullback compatible domains

**Location:** README:4318–4324 declares `ω : ∧(W*) → End(∧U)` but applies `ω(∧f*(λ_k))`; the same application recurs at :4373.

**Claim:** Pullback along `f : U → W` lands in `∧(U*)`, outside the declared domain of `ω`. The construction also cannot extend an unpulled covector on `W` by contraction on `U`.

**Witness:** For `f : ℤ³ → ℤ²`, projection to the first two coordinates, `f*(e₀*)=(1,0,0) ∈ (ℤ³)*`, whereas the declared input is a covector on `ℤ²`.

**Repair:** Define the signed contraction `ω_U : ∧(U*) → End(∧U)` and use `ω_U(∧f*(λ))`. Alternatively define `ω_f=ω_U ∘ ∧f*` with domain `∧(W*)`, and apply it directly to `λ`. Use one convention in both complexes and Checks. The projection example then evaluates on `e₀` to `1`, and the zero map to `0`; the existing two-form value remains `1`. Buchsbaum line 112 distinguishes the induced action from the original contraction; pinned `CliffordAlgebra.contractLeft` likewise contracts a module against its own dual.

## R04 (P2) — Import the degree-one and determinant-line theorems already owned by suppliers

**Location:** README:599–607 asks for degree-one laws to be uniquely recovered from linear ground maps; :736 repeats the multiplicative classification; :1091 asks to prove the top exterior power invertible.

**Claim:** These general results are planned again at the same hypotheses, despite the supplier contracts at :425–431 and :498–502.

**Witness:** `TauCetiRoadmap/DerivedModuleAlgebra/README.md:62–92` states both degree-one classifications. `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:3192–3224` owns invertibility, constant-rank specialization and base change of the determinant line.

**Repair:** Delete the repeated general theorem targets and import those exact supplier results in Scope and ownership / Exact supplier contracts. Retain the genuinely new assembly of determinant laws and the matrix/projective representation compatibility. For `ℤ/2` the identity linear law still evaluates to `1` at `1`; for `ℤ²` the swap acts on the supplied determinant line by `−1`. Neither adapter needs a second owner of the underlying theorem.

## R05 (P3) — Correct the Fitting-bound supplier name

**Location:** README:106, :505, :3587 and :5200 use `TauCeti.Module.fittingIdeal_le_annihilator`.

**Witness:** The cited owner, `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:2695–2701`, calls it `TauCeti.Iwasawa.fittingIdeal_le_annihilator` and states the finite-presentation hypothesis.

**Repair:** Change all four citations to the owner's name, keeping its hypothesis. This is a name correction, not an unowned theorem: for `ℤ/2`, the cited containment remains `(2) ⊆ (2)`.

## R06 (P3) — Repair source locators and distinguish the DKSW versions

**Location:** README:2282 says Wang–Erickson “§2.3, pp.15–16”; :5266–5268 lists only the September DKSW manuscript although inline references also use arXiv v2. README:1743–1744 omits pages for ACC §2.2.20.

**Witness:** Wang–Erickson line 651 starts §2.4; lines 720–744 contain Definition 2.22 and the adapted representation ring. Both fetched DKSW texts have Theorem 2.1 on pp.7–8 and Proposition 5.14 on p.46.

**Repair:** Cite Wang–Erickson §2.4, Definition 2.22 and the equations following it, pp.15–16 (and Proposition 2.23, pp.16–17 where needed). Give DKSW one reference entry with both versions and a numbering note, or consistently use one. Add ACC §2.2.20, pp.931–932. The corrected adapted-ring locator still gives `A[b]` for an upper-triangular rank-one GMA and `A[b,c]/(bc−1)` for the full matrix GMA; the correction changes no mathematics.

## R07 (P3) — Degree-one traces do not vanish in characteristic two

**Location:** README:2424–2427: “the unique degree-one determinant factors … through traces (zero when `2 = 0`), would lose uniqueness.”

**Claim:** This Check confuses the trace of a scalar rank-two representation with the traces of its ordered degree-one constituents. The latter are the characters themselves.

**Witness:** In upper-triangular matrices over `𝔽₂`, the two constituents take `E₁₁` to `1` and `0`. Their traces are therefore distinct; `tr(E₁₁)=1`, although `tr(I₂)=0`.

**Repair:** Keep the ordered-factor Check, using these two values. Move the trace warning to a genuine rank-two example, such as the two evaluation characters squared over `𝔽₂`: both traces are zero but their characteristic polynomials at the variable are `X²` and `X²+1`. Do not claim degree-one traces vanish.

## R08 (P3) — Restore the required Lean section and declaration documentation

**Location:** `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/Suggested.lean:302–310` has the only layer section comment and an undocumented `local instance : HasDerivedCategory…`.

**Witness:** Targets for layers 0, 1, 4, 5 and 6 occur at lines 98, 186, 347, 399 and 423 without their corresponding layer comments; the instance at line 310 has no docstring.

**Repair:** Add the missing layer comments in README build order and a docstring identifying `HasDerivedCategory.standard`. Use the prescribed “target signatures” module title and explicitly say these statements use the pinned APIs. No additional declarations or examples are needed. This changes neither the derived-category type nor the tested two-term ghost with square zero.

## Verified sound

**Scope and mechanical evidence.** The reviewed head is `b11da0d2bf90f6b83e08118b90fcede7c2681380`. The base-relative diff outside this folder is empty. The supplied push gate reports every scanner, dependency and targeted-build check zero and ends `build=0 OK`; there are no stray files. Independent `lake env lean` elaboration succeeded with exactly 21 `sorry` warnings and no other warnings. No `set_option`, admitted data, admitted examples or roadmap import remains.

The required dependency command was run against the supplied merge order and main content, with this output:

```
depcheck: 205 roadmaps, 1506 edges, 0 problem(s)
```

It emitted no UPWARD or CYCLE line. R01 records a concrete two-way supplier contract missed by that result; no tooling or order file was changed.

**Signatures and padding.** A scratch copy checked `#check @name` for all 54 declarations. The 21 theorem signatures retain the mathematical binders used by their README statements, including completeness, local/Noetherian hypotheses, the residual identification, finite bounding lattice, topology comparison, and the principal Artinian coefficient factors. The resolver's suspected dropped `Algebra A R` on `cycleTerm` is harmless: that definition takes an arbitrary `T : R → A` and uses multiplication in `R`; scalar compatibility is not its claim. The one-tactic copy tried `simp`, `rfl`, and `infer_instance` on every admitted theorem, with 21 failures. Inspection of the pinned declarations below found no exact one-lemma replacement. No new padding finding is supported by this probe.

**Headlines and coverage.** The README's end results are determinant coefficient reconstruction; trace/pseudocharacter comparisons; Azumaya norms; semisimple and henselian realization; coefficient and symplectic descent; classical Ribet lattices; derived-Hom finiteness and ghost nilpotence; Frobenius uniqueness, compact gluing and integral interpolation; descent through a Hecke comparison; generic/mixed regularity; and local/global Ribet extensions. These are the 21 theorem declarations. The docstring names the unavailable divided-power coordinate rings, invariant-word diagrams, finite-exponent norms, labelled GMAs, characteristic-law quotient, derived telescope, rational cohomology/good filtrations and Buchsbaum–Rim complexes for the remaining deep targets. Hecke normalization formulas and residual predicates remain README interfaces and computations; they are not replaced by arbitrary predicates in Lean. The local and global Ribet signatures use actual difference modules and continuous cocycles.

**Pinned objects opened.** Mathlib was checked at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following 20 declarations/objects were read by object, not merely searched by proposed names:

| Pinned declaration/object | File and line; relevant content |
|---|---|
| `PolynomialLaw` | `Mathlib/RingTheory/PolynomialLaw/Basic.lean:77`: natural scalar-extension family; no homogeneity, multiplication or topology condition |
| `PolynomialLaw.ground` | Same file :232; evaluation on the ground algebra |
| `PolynomialLaw.toFun` | Same file :332; extension beyond the defining universe |
| `IsAzumaya` | `Mathlib/Algebra/Azumaya/Defs.lean:60`: finite, projective, faithful and the endomorphism comparison; no chosen splitting |
| `finite_ext` | `Mathlib/Algebra/Category/ModuleCat/Ext/Finite.lean:26`: Noetherian base and finite modules; no finite-projective-dimension assumption |
| `Module.DirectLimit.of` | `Mathlib/Algebra/Colimit/Module.lean:84`: stage map |
| `Module.DirectLimit.of_f` | Same file :92; stage-map compatibility |
| `Ideal.kerLift_injective` | `Mathlib/RingTheory/Ideal/Quotient/Operations.lean:59`: injective map from quotient by the actual kernel |
| `sectionsSubring` | `Mathlib/Algebra/Category/Ring/Limits.lean:292`: compatible sections, used for the actual limit carrier |
| `MonoidAlgebra.mapDomainAlgHom` | `Mathlib/Algebra/MonoidAlgebra/Basic.lean:284`: group/monoid change on group algebras |
| `CliffordAlgebra.contractLeft` | `Mathlib/LinearAlgebra/CliffordAlgebra/Contraction.lean:82`: covectors on the same module being contracted |
| `ExteriorAlgebra.lift` | `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean:109`: algebra map from a square-zero linear map |
| `TauCeti.minorsIdeal` | `TauCeti/RingTheory/FittingIdeal/Basic.lean:85`: ideal of minors |
| `TauCeti.det_mem_minorsIdeal` | Same file :92; square determinant membership |
| `TauCeti.fittingIdeal` | Same file :343; existing module Fitting carrier |
| `quotient_span_singleton_of_lTensor_mulLeft_injective` | `TauCeti/RingTheory/Flat/QuotientRegular.lean:124`: flat base algebra and injectivity after tensoring every finitely generated ideal |
| `Comodule.cofree` | `TauCeti/Algebra/Coalgebra/Comodule/Cofree.lean:127`: arbitrary coefficient module |
| `Comodule.Hom.cofreeUnit` | Same file :209; actual coaction unit |
| `Comodule.Hom.cofreeEquiv` | Same file :283; adjunction, not a hypothesis that the coefficient module is injective |
| `GeneralLinear.coordinateHopfAlgebra` | `TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Coordinate/HopfAlgebra.lean:479`, generic matrix at :491 |

**Ownership and supplier resolution.** Object searches used the roadmap service across main/open work, the provided sibling checkouts and board packages. The target folder is new on main; its determinant/GMA/Ribet synthesis is not a replacement of an existing roadmap. Later deformation and potential-automorphy package contracts consume it rather than supplying it. No duplicate fully qualified name of a kept Lean declaration was found. Besides R01, R04 and R05, these supplier contracts resolve:

- DerivedModuleAlgebra §§0.DP.1, 0.DP.2 and 0.K.1: laws, divided powers/internal Roby multiplication, Koszul complexes. The two general degree-one results at :62–92 must be imported (R04).
- PadicMeasuresIwasawaAlgebras §4.5 (:2680–2701), §5.1 (:3192–3224): the Fitting bound and determinant lines. AlgebraicVectorBundles L0C (:254 onward) consumes the ring-level determinant and supplies the sheaf comparison, not another ring-level construction.
- SchemeAndStackFoundations §0.20 (:1302, :1317, :1326) supplies Japanese/Nagata complete-local rings; §2.22 (:4454 onward) supplies étale matrix splitting for Azumaya algebras.
- RepresentationTheory/SemisimpleAlgebras layers 0, 2–5 supply radical theory, Artin–Wedderburn, density, central-simple structure and field conjugacy. The inseparable norm laws and determinant-specific dimension bounds are additional work here.
- ProfiniteCohomology layer 2, B1 (:725–745), supplies continuous cocycles with the stated action. ClassFieldTheory layer 7 (:1349, :1365, :1960) supplies arithmetic reciprocity and inversion. Completed/Chebotarev layer 10 (:410 onward) supplies finite-quotient Frobenius conjugacy density, not density of an arbitrarily chosen set of representatives.
- ModularForms layer 9 (:971–981) gives the classical Hecke polynomial. ReductiveGroupsPartII RG2.2–RG2.3 gives the stated single-element containment; it does not promise simultaneous hyperspecial containment for a compact subgroup.
- The supplied SmoothRepresentationsOfLocalGroups head, SR.4.3 (:3275), SR.4.5 (:3515–3555), SR.6.1 (:4798), SR.6.3 (:4960–4999), supplies Satake, the spin convention and finite-wild excursion construction. Reversing its spin polynomial with the stated `T₁/T₂` relabelling gives the computed polynomial below. Its downstream reference to this roadmap is not a supplier edge. The general untwisted word diagram here extends the finite-wild instance and explicitly identifies that instance, rather than making a second carrier.

**Seeded source audit.** All 15 requested sections were reopened against legal source text; Jantzen-dependent inputs remain uncertified as recorded below. The table distinguishes source theorems from extensions assembled using other named inputs. Source IDs below are the reference names; line numbers refer to the fetched extraction, not README lines.

| Sample | Locator actually inspected | Outcome |
|---|---|---|
| 0.3 | Chenevier Lemma 1.18, p.16, lines 649–678 | Translation kernel tests all scalar extensions; quotient and injectivity statements match. Base change gives inclusion, not an unsupported equality. |
| 0.4 | Chenevier Proposition 1.6/Example 1.7, pp.9–10, lines 350–399; Theorem 1.15, pp.14–15, line 619 onward | Roby abelianization and Vaccarino's free-algebra invariant theorem match; the divided-power prerequisite has its supplier. |
| 1.1 | Chenevier §1.17/Lemma 1.21, pp.17–18, lines 710–735 | Coefficients generate the two-sided CH ideal; containment in the determinant kernel uses the full law, including characteristic two. |
| 1.4 | Allen–Newton–Thorne Proposition 2.5, pp.5–6, lines 213–280; Bellaïche–Chenevier Theorem 1.5.6, pp.36–37, lines 1503–1555; Proposition 1.7.1, p.42, lines 1810–1816 | Determinant reducibility needs no factorial inverse. Extension identification retains the specified quotient and constituent order. R07 corrects a Check, not these theorems. |
| 1.7 | Emerson–Morel Theorem 4.1, pp.13–14, lines 522–546; BIP Lemma 3.1, pp.10–11, lines 470–505 | GL comparison plus Chenevier reconstruction supplies semisimplicity. The generic-matrix construction uses finitely many algebra generators and relations; its finite-type proof works with the stated arbitrary commutative base. |
| 2.3 | Bökstedt–Neeman Definition 2.1/Remark 2.2, p.213, lines 149–158; Boxer–Pilloni Lemmas 2.4.3/2.4.6, pp.18–19, lines 892–902, 948–953 | Correct one-minus-shift orientation and bounded ordinary finiteness; R02 corrects the explicitly specified quotient map. |
| 4.2 | Chenevier Examples 2.31–2.32/Lemma 2.33, pp.38–39, lines 1543–1602; inverse-limit representability lines 1717–1723 | Compact coefficient gluing, continuity and finite group quotients are distinct steps. The uniform congruence witness is stated, not inferred from field points. |
| 5.1 | Scholze Theorem 5.4.1, pp.1058–1059, lines 4313–4356 | Nilpotent Hecke comparison supports the arithmetic application; abstract kernel descent follows from the injective quotient map and determinant descent. |
| 5.2 | Scholze Corollaries 5.4.3–5.4.4 and footnote 29, p.1060, lines 4398–4419 | Uniform exponent in the stated family; the ideal-sum, quotient-extension and product bounds were computed independently below. |
| 5.3 | Chenevier Theorems 2.12/2.22; Scholze Corollary 5.4.4, p.1060; Ribet Proposition 2.1, pp.154–155, lines 151–202 | Residual semisimplification and henselian lifting remain separate. Ribet's lattice argument was read using OCR; its DVR rescaling uses the uniformizer, not a fixed prime integer. |
| 6.1 | DKSW Theorem 2.1, pp.7–8, lines 235–277; §2.1, p.9, lines 286–325 | Character differences and cocycle direction agree. The README's finite bounding lattice/topology input repairs an actual gap in the cited construction. |
| 6.2 | DKSW Lemma 2.4, pp.13–14, lines 453–525 | Principal local factors and the primitive/socle argument matter; a nonzero kernel vector alone over an arbitrary ring does not imply zero determinant. |
| 6.3 | DKSW Proposition 3.3/equation (47), p.21, lines 877–888 | Formal error specialization and polarized local congruence support the invariant argument. Index/sign defects in the source are recorded below. |
| 6.5 | Buchsbaum Lemma 1.1/§1, pp.184–185, lines 60–118; Theorem 2.9, p.191, lines 314–326; §3/Proposition 3.1, pp.194–195, lines 429–452 | Contraction signs and ordered-prefix regularity match after R03's domain correction. The generic-combination and mixed-block extensions have their own hypotheses. |
| 6.7 | DKSW Theorems 4.22–4.23, pp.33–34, lines 1365–1404; Lemma 5.11/Corollary 5.12, p.43, lines 1776–1807; Proposition 5.14, p.46, lines 1895–1926 | Resolution/invariant lifting and weighted Fitting containment match. README's `L ≤ u+k` count handles cases missing from the source's equality count. |

The remaining cited works and Stacks tags were requested through the source service, including the legal AMS copy of Buchsbaum and OCR of Ribet. The two DKSW versions agree at the sampled locators. No source material was copied into the repository or this report.

**Computed adversarial pass.** Each row below identifies a mathematical target by README line and gives actual values, including rejected hypotheses and wrong models. “Agrees” means the displayed instance agrees; finite examples are not proofs of the full theorem. The source and dependency audits above address the proof routes. `ε²=0` denotes a square-zero thickening, `Eᵢⱼ` a matrix unit, and `χ_D` the monic characteristic polynomial. The retained rows cover all 15 sampled sections, all Lean headlines, and the targets touched by findings; extra convention/Check rows follow.

| Target (README line) | Instance | Values on the two sides / negative control | Result and change |
|---|---|---|---|

| 599: Linear-map laws and ground-value adapters | ℤ/2, identity map | f(1)=1; base-change identity also 1 | R04: import |
| 736: One-dimensional determinants are algebra … | identity A→A | D(7)=7; unique algebra map also 7 | R04: import |
| 791: The kernel of a polynomial law | P(x)=x² on ℤ | P(T+x)−P(T)=2Tx+x²; zero iff x=0 | Agrees |
| 809: Kernels are compatible with base change | same law, base 𝔽₂ | kernel image=0; (T+x)²−T²=x² gives kernel 0 | Agrees |
| 814: Laws factor through their kernel | evaluation at 0 on ℤ[X] | kernel=(X); quotient law on ℤ is identity | Agrees |
| 821: The induced law on M/Ker(P) is faithful | same quotient | shift by 1 changes value by 1; new kernel 0 | Agrees |
| 832: Determinant coordinate ring | R=A, d=0,1,2 | representing ring=A; scalar 3 gives 1,3,9 | Agrees |
| 851: Vaccarino universal determinant theorem | one 2×2 generic matrix | tr(diag(2,3))=5; det=6 on both sides | Agrees |
| 894: Coefficient reconstruction from group words | trivial group, degrees 0,2 | D(7)=1,49 recovered from χ₁=1,(X−1)² | Agrees |
| 917: The trace of a determinant is a pseudocha… | M₂ trace, three identities | alternating sum 8−12+4=0 | Agrees |
| 924: A determinant is determined by its trace … | d=2, diag(2,3), ℚ | det=(5²−13)/2=6; trace recovers χ | Agrees |
| 930: Over ℚ-algebras determinants are pseudoch… | d=1, ℚ, T=id | D(7)=T(7)=7; normalization 1 | Agrees |
| 941: Determinants and pseudocharacters when (2… | d=2 over ℤ[1/2] | trace 5, square trace 13 give det 6 | Agrees |
| 1087: Determinant of a finite projective repres… | rank 0; swap on ℤ² | det=1; swap determinant=−1 | R04: import line theorem |
| 1113: Azumaya reduced-norm determinant | M₂(ℚ); Hamilton quaternions | norm diag(2,3)=6; norm i=1 | Agrees |
| 1186: Rational cohomology of a flat affine grou… | trivial Hopf algebra, module M | H⁰=M; H¹=0; coaction m↦m⊗1 | R01: repoint input |
| 1252: Algebraic induction | C₂⊂S₃, trivial coefficient | three right cosets; induced module rank 3 | R01: repoint input |
| 1738: Arithmetic and geometric Frobenius conver… | rank-one arithmetic eigenvalue 2 | geometric eigenvalue=1/2, inverse of 2 | Agrees |
| 1866: The Cayley–Hamilton ideal | evaluation at 0 on ℤ[X] | χ(x)=x−x(0); CH=(X) | Agrees |
| 1883: Cayley–Hamilton algebras | M₂; upper-triangular algebra | χ(M)=0 in both; latter determinant kernel≠0 | Agrees |
| 1899: Cayley–Hamilton is stable under base change | M₂(ℤ)→M₂(𝔽₂) | χ(M)=0 maps to 0; CH stays 0 | Agrees |
| 1903: Cayley–Hamilton restricts to subalgebras | diagonal subalgebra of M₂ | diag(2,3) satisfies M²−5M+6I=0 | Agrees |
| 1907: The kernel contains the Cayley–Hamilton i… | evaluation at 0 on ℤ[X] | CH=(X)=kernel | Agrees |
| 1910: Faithful determinants are Cayley–Hamilton | identity law on A | kernel=0; χ(a)=a−a=0 | Agrees |
| 1999: Semisimple reconstruction of field determ… | upper-triangular unipotent rep | χ=(X−1)² for both rep and semisimplification | Agrees |
| 2240: Henselian irreducible reconstruction | standard M₂ over complete DVR | residual full matrix algebra; determinant realizes χ | Agrees |
| 2273: Adapted GMA representation ring | upper-triangular; full M₂ | adapted rings A[b]; A[b,c]/(bc−1) | R06 locator |
| 2317: Ordered residual GMA constituents | triangular algebra over 𝔽₂ | ordered values at E₁₁ are (1,0), not (0,0) | Agrees |
| 2377: Partition reducibility for determinants | two-block DVR order | factorization mod πʳ; I_partition=(πʳ) | Agrees |
| 2398: Two-block determinant reducibility ideal | triangular; full M₂ | I_red=0; opposite pairing ideal=A | Agrees; R07 Check |
| 2429: GMA quotient constituent module | selected first diagonal module | 2e₁+3e₂ acts by 2; cross block acts by 0 | Agrees |
| 2455: GMA extension module | three-block upper-triangular algebra | path E₁₂E₂₃=E₁₃ killed in extension quotient | Agrees |
| 2473: GMA extension identification | two scalar triangular blocks | Ext¹(second,first)=k, identified with dual of kE₁₂ | Agrees |
| 2484: Off-diagonal extension injection | same triangular algebra | Ext¹(second,first) dimension 1; reverse dimension 0 | Agrees |
| 2508: Extension dimensions bound reducibility g… | DVR order with lower πʳA | I_red has 1 generator; bound 1·1=1 | Agrees |
| 2515: Classical Ribet lattice | nonzero upper extension over DVR | upper class 1 remains nonsplit; lower entry 0 | Agrees |
| 2571: Absolutely irreducible coefficient descent | A=B=ℤₚ, full matrix image | conjugator 1 works; all traces already in A | Agrees |
| 2579: Symplectic coefficient descent with presc… | odd p, fixed alternating J | identity descent retains μ; characteristic 2 excluded | Agrees |
| 2659: GL pseudocharacter reconstruction | GL₁ invariant character at 2 | realized matrix [2]; polynomial X−2 | Agrees |
| 2671: Generic Cayley–Hamilton representation al… | R=A, d=1 | generic algebra=A; universal scalar 7 maps to [7] | Agrees |
| 2734: Evaluation contracts | residual transport; noncommuting units | 3⊗(2⊗7)↦42; UV−VU=diag(6,−6) | Agrees |
| 2831: Finite morphism modules | ℤ[0],ℤ[0]; zero complex | Hom=ℤ generated by 1; Hom(0,ℤ)=0 | Agrees |
| 2896: Ghost nilpotence and annihilators | 𝔽₂[0]⊕𝔽₂[−1] | δ≠0, δ²=0; amplitude bound 2 | Agrees |
| 2956: Telescope and homology | M=ℤ,t=id,x=1 | relation class 0; specified image 1 | R02: correct map |
| 2973: Comparison with an idempotent | t=diag(1,0), e=t | telescope vector (2,3) maps to (2,0) | Agrees |
| 3000: Factorial powers | t=−1 over 𝔽₃; t=2 over ℤ₂ | factorial powers eventually 1; limit 0 respectively | Agrees |
| 3012: Ordinary finiteness | bounded finite complex, t projection | ordinary H⁰ rank 1 rather than rank 2 | Agrees |
| 3027: Completion of a supplied split algebra | ℤ₂×ℤ₂, first maximal factor | (2,3) maps to 2; complementary idempotent to 0 | Agrees |
| 3184: Uniqueness from Frobenius density | S₃ transposition conjugacy class | all three transpositions have equal χ; one representative alone not dense | Agrees |
| 3195: Compact coefficient-ring gluing | compact coefficient ring 𝔽₂×𝔽₃ | 1+1 maps to (0,2); coordinate laws reconstruct it | Agrees |
| 3227: Compatible quotient determinants | ℤ/8→ℤ/4→𝔽₂ | 7↦3↦1; direct map also 1 | Agrees |
| 3236: Refining the group quotient | g,h collapse in group quotient | 2g+3h↦5; scalar degree-two law gives 25 | Agrees |
| 3246: The quotient-limit ring | J₀=A, J_r=0 for r>0 | 3 corresponds to (0,3,3,…), not to constant 3 at level 0 | Agrees |
| 3257: Determinant from a compatible inverse limit | ℤ₂ with quotient coefficients | 3 mod 2ʳ has unique limit 3 | Agrees |
| 3270: Uniform congruence witnesses for classica… | rank-one integral character 1 | all quotient witnesses χ=X−1; same bound for every element | Agrees |
| 3284: Integral interpolation with uniform congr… | same character over ℤ₂ | interpolated χ=X−1; every reduction identical | Agrees |
| 3301: Coefficient change in interpolation | coefficient map ℤ₂→𝔽₂ | χ=X−1 reduces to X+1 on both routes | Agrees |
| 3309: Hecke level change in interpolation | identity Hecke level map | T₁=3 stays 3; determinant coefficient unchanged | Agrees |
| 3317: Fixed ramification set in coefficient limits | unramified character, inertia element | all levels evaluate inertia to 1; limit also 1 | Agrees |
| 3326: Failure of field-point integrality on nil… | 𝔽₂[ε]/ε², value 1+ε | field point gives 1; original value differs by ε≠0 | Agrees |
| 3373: Determinant from a quantified Hecke compa… | T→B quotient ℤ/4→𝔽₂ | kernel (2); descended coefficient 3↦1 | Agrees |
| 3389: Functoriality of nilpotent descent | ℤ/8→ℤ/4→𝔽₂ | 7↦3↦1; descent composition agrees | Agrees |
| 3419: Nilpotence through a quotient extension | ℤ/64, J=(2), K=(8) | J³=K, K²=0; J⁵=(32)≠0, J⁶=0 | Agrees |
| 3425: Nilpotence of sums of commutative ideals | ℚ[x,y]/(x²,y³) | (x+y)³=3xy²≠0; fourth power 0 | Agrees |
| 3433: Nilpotence in a product of coefficient rings | ℤ/8×ℤ/4, ideals (2) | (2,2)²=(4,0)≠0; cube 0 | Agrees |
| 3442: Error ideal on a filtered module | E₁₂ on two-step filtered k² | action lowers filtration; E₁₂²=0 | Agrees |
| 3450: Quantified composition of Hecke error ideals | quotient exponent 3, error exponent 2 | composed exponent 6; ℤ/64 witness sharp | Agrees |
| 3468: Uniform nilpotence in an inverse limit | ℤ₂/(2ʳ), nonuniform exponents | 2ʳ=0 at level r; 2ⁿ≠0 in ℤ₂ for every n | Agrees |
| 3479: Residual semisimple specialization | upper-unipotent residual matrix | semisimplification I₂ has same χ=(X−1)² | Agrees |
| 3490: Representation over the nilpotent quotient | A/J field, degree-one character | realization [1]; charpoly X−1 | Agrees |
| 3499: Local conditions and change of lattice | diag(2,3) acts on upper entry 6 | c=6/3=2 transforms to 4/3 | Agrees |
| 3583: Check | presentation [2] of ℤ/2 | Fitt₀=(2)=ann(ℤ/2) | Agrees |
| 3587: Fitting annihilator bound | same module | Fitt₀=(2)⊆(2)=ann | R05: correct citation |
| 3603: Character congruence on the group algebra | χ=ψ=1, upper unipotent | χρ(g)=X²−2X+1=(X−1)² | Agrees |
| 3610: Character difference modules | ρ(n)=I+nE₁₂ over ℤ | Δ=ℤE₁₂; scalar differences nE₁₂ | Agrees |
| 3632: Product containment of difference modules | same unipotent family | ΔχΔψ=0⊆Δψ | Agrees |
| 3643: Initial Ribet quotient module | unipotent; scalar sign | M₀=ℤ; for scalar sign Δ=2ℤI, Δ²=4ℤI, M₀=ℤ/2 | Agrees |
| 3661: Canonical Ribet cocycle | g=diag(2,3), h upper-unit | κ(gh)=2/3=0+(2/3)·1 | Agrees |
| 3687: Ribet module with local conditions | no places; all G distinguished | first N=M₀; second local relations kill N to 0 | Agrees |
| 3709: Finite and continuous Ribet modules | finite bound ℤ/4; infinite test at :3776 | finite quotient has 4 elements; ℓᵢ(δⱼ)=δᵢⱼ gives infinite dimension | Agrees; bound necessary |
| 3731: Finite orders and the global coefficient … | char 2, J=[[0,t],[1,0]] | J²=tI, traces 0; no eigenline when t nonsquare | Agrees |
| 3794: Every cocycle representative generates | α≡1 mod m | κ′ mod m=κ mod m; identical generating images | Agrees |
| 3799: Ribet theory for distinct residual charac… | DVR order with two distinct characters | off-diagonal rank 1; Fitt of A/(πʳ)=(πʳ) | Agrees |
| 3842: Five types of Ribet module relations | C₂² scalar representation example | omitting joint generator gives ideal 0; full relations give (2) | Agrees |
| 3864: Stabilization of local relation rows | adjoin row (a,−1) | det [[d,0],[a,−1]]=−d | Agrees |
| 3886: Weighted auxiliary matrix | weight 2, minor 5 | weighted determinant=10∈(2); unweighted 5∉(2) | Agrees |
| 3913: Kernel vector for the altered matrix | [[2,1],[4,2]] | matrix·(−1/2,1)=0; determinant 0 | Agrees |
| 3922: Vanishing of the altered determinant | ℤ/4, 1×1 matrix [2] | nonzero kernel vector 2 but det=2; primitive/socle argument required | Agrees; rejects weak proof |
| 3939: Trace congruences for difference words | upper-nilpotent difference words | trace(E₁₂)=0; trace(E₁₂²)=0 | Agrees |
| 3946: Formal Ribet matrix ring | formal x=2,ν=3,a=7 | top entry a−x=5; altered entry x−a=−5 | Agrees |
| 3990: Modified formal auxiliary matrices | same formal scalar data | type-IV arithmetic 0 vs formal 5 mod (5) | Agrees |
| 4011: Specialization of the formal auxiliary ma… | type-V test | arithmetic 3, formal 5; difference 2 in error ideal (2) | Agrees |
| 4035: Formal Ribet relation ideals | triangular [[1,3],[0,4]], swapped basis | relation errors [[3,0],[3,0]]; vanish modulo 3 | Agrees |
| 4067: Evaluation annihilates the formal relatio… | specialize preceding error ideal mod 3 | both nonzero entries 3 map to 0 | Agrees |
| 4071: Trace and determinant invariant subring | scalar aI₂ over 𝔽₂ | trace=0; determinant=a², so traces alone insufficient | Agrees |
| 4090: Polarized local character congruence | ψ=1,χ=−1, ξ=1 or −1 | u=1−ξ, v=ξ−1; diagonal u·v is 0 or −4 | Agrees mod (4); polarize |
| 4096: Invariant intersection with the character… | same characteristic congruence modulo 4 | invariant scalar errors 0 or 4 map to 0 | Agrees |
| 4297: Composition of exterior contractions | ordered dual basis on ℤ² | ω(e₁*∧e₂*)(e₁∧e₂)=1; composite contractions=−1 | Agrees |
| 4317: Exterior-bar construction | projection ℤ³→ℤ² | f*e₀*=(1,0,0); declared ω domain has rank 2 | R03: correct domain |
| 4343: Buchsbaum–Rim module complex | f=0 : k³→k² | H₀=k², H₁=k³; not an exact resolution | Agrees; regularity necessary |
| 4369: Buchsbaum–Rim determinant complex | square diag(2,3) | determinant differential multiplies by 6; H₀=ℤ/(6) | Agrees |
| 4391: Regularity of a finite free map | multiplication by 2 over ℤ and ℤ/4 | kernels 0 and {0,2}; second not regular | Agrees |
| 4412: Mapping cone for adjoining a column | rank-one sequence (2,3) | cone cross-term signs give −6+6=0 | Agrees |
| 4417: Transfer of acyclicity to determinant com… | square identity matrix | BR positive homology=0; determinant complex [1] exact | Agrees |
| 4424: Exactness of regular Buchsbaum–Rim maps | identity k²→k² | H₁=0 and all higher homology 0 | Agrees |
| 4433: Tensor resolutions of ordered determinant… | disjoint rank-one blocks x,y over k[x,y] | successive quotients k[y],k; Koszul H₁=0 | Agrees |
| 4438: A two-column regularity criterion | generic columns (1,0),(0,1),(a,b) | minor syzygy c₃−a c₁−b c₂=0 | Agrees |
| 4443: Localized chart for generic two-column mi… | chart b₁′=1,b₁=2,b₂′=3 | minor 6−b₂; quotient forces b₂=6 | Agrees |
| 4453: Saturation of the generic minor ideal | generic 2×2 minor ideal, b₁′ inverted | b₁′·h in ideal implies h in ideal; h=minor gives 0=0 | Agrees instance |
| 4457: Regularity of a generic two-column map | generic two-column map specialized to identity | maximal minor 1; positive homology 0 | Agrees |
| 4461: A pivot chart for generic linear sequences | linear equation x−c, pivot 1 | quotient substitutes x=c; equation becomes 0 | Agrees |
| 4466: Generic linear prefixes at a zero pivot | pivot α→0 in αx+βy | remaining equation βy, not 0; over domain kernel 0 | Agrees |
| 4470: Cancellation of pivot denominators | ℤ[x], denominator 2 | 2·x≠0, so no false cancellation x=0 | Agrees instance |
| 4474: Weak regularity of generic linear equations | generic one-form Vx over k[x,V] | multiplication kernel 0; quotient nonzero | Agrees |
| 4480: Generic combinations of an ideal containi… | two forms V₁x,V₂x in ideal (x) | V₁·(V₂x)=0 mod (V₁x), V₁≠0; length 2 invalid | Agrees; length bound needed |
| 4511: Coordinate regularity in disjoint minor q… | minor b₁b₂′−b₂b₁′ then b₁ | mod b₁, b₂b₁′=0; both same-block coordinates not regular | Agrees; excludes wrong model |
| 4538: Mixed minor and linear resolutions | u=2,k=1,L=3 | bound 3≤2+1; L=4 exceeds available regular sequence | Agrees |
| 4581: Generic variable count for the Ribet rela… | N=4,s=1,a₅=2 | L=3,u=2,k=1; minor=−ν₃≠0, so L=u fails | Agrees; source gap repaired |
| 4802: The determinant difference in the formal … | h=1,x=2,ν=4,a=2 | formal difference 6, correction 2; difference is in (2) | Agrees |
| 4823: Pairing determinant terms along a local c… | pairing [[b,x−a],[0,1]]; bad I₂ | first det=b; dropping incidence admits det I₂=1 | Agrees; incidence needed |
| 4854: Unipotent invariance for product rows | product-row determinant under lower unipotent | b fixed (x=z=1); paired difference 0 | Agrees instance |
| 4872: Unipotent invariance for one local block | one local column, paired terms | two terms t and −t sum 0 | Agrees instance |
| 4887: Borel invariance of the determinant diffe… | lower diagonal and unipotent generators | weight-zero difference scales by 1; unipotent difference 0 | Agrees instance |
| 4892: Lifting the invariant error across the fu… | trivial error ideal J′=J=0 | invariant lift 6↦6; obstruction 0 | Agrees instance |
| 4913: Formal determinant comparison | h=1,x=2,ν=4,a=7 | formal altered det=−5; excluded correction e−11∉(2) | Agrees; error hypothesis necessary |
| 4939: Weighted Fitting containment | weight 2, relation minor 5 | weighted Fitting generator 10∈(2), while 5∉(2) | Agrees |
| 5000: Ribet extension with all local conditions | empty local places; unit error ideal | local module reduces to global one; zero module allowed for I=A | Agrees |
| 5015: Irreducibility excludes an exact split de… | irreducible rep, exact split determinant over field | split characters force semisimplification rank 1+1; contradict irreducibility | Agrees; excludes I=0 |
| 5024: Ribet extension without residual distinct… | I=A; I=0 | M=0 has Fitt=A⊆A; I=0 excluded by preceding argument | Agrees boundary |


The table retains **129 target rows** from the 232-row audit, omitting the other per-target entries for comment length. Further convention and negative-control computations used in reading the API/Checks:

| Convention / carrier | Instance | Computed values | Result |
|---|---|---|---|
| Whole polynomial law, not ground function | `𝔽₂[T]`, polynomial `x²−x` | zero at ground 0 and 1, but `T²−T≠0` | Ground values cannot specify the law |
| Constant law kernel; zero ring | degree zero | kernel is the whole module; `χ=1`; zero ring has `0=1` | These are admitted boundary cases, not implicit nonzero rings |
| Cycle convention and empty product | no factors; transposition | empty term `1`; transposition sign `−1` | Correct normalization |
| Ordered multiplicative word | upper-unit U with entry 2; lower-unit V with entry 3 | `UV=[[7,2],[3,1]]`, `VU=[[1,2],[3,7]]` | Opposite multiplication rejected |
| Similitude versus determinant | `ℤ/4`, multipliers `1,−1` | both squares `1`; multipliers differ | Full multiplier must remain input |
| Idempotent and telescope maps | `t=0,id,diag(1,0)` on a rank-two module | `(2,3)` maps to `0,(2,3),(2,0)` | Distinguishes zero, identity and selected summand |
| Telescope stage sign | `t=−1`, `x=3` | `[0,3]+[1,3]=0` | Plus sign results from subtracting the transition |
| Complete-space hypothesis | scalar operator 2 on `ℤ₂` versus `ℚ₂` | factorial powers tend to 0 in both; 2 is invertible only in the latter | Ring/module finiteness hypotheses cannot be dropped from the ordinary projector theorem |
| Empty coefficient family | empty product of coefficient rings | product is zero ring; injectivity forces source zero ring | No determinant existence over a nonzero source follows from an empty family |
| Finite-quotient separation | `ℤ/8→ℤ/4→𝔽₂` | `7→3→1`, while `1+ε→1` kills a nonzero ε | Quotients detect coefficients when their kernels intersect in zero; field points need not |
| Contraction and bar signs | rank-one dual generator e* and vector e | first differential `1⊗1+e*⊗e`; next gives `−1+1=0` | Fixes contraction on exterior degree zero as well as degree one |
| Local-column orientation | `Yσ=[[1,2],[3,4]],Yτ=[[5,6],[7,8]],xσ=9,xτ=10` | four wedges `29,7,−2,−38` | Full-entry comparison uses these signs, not their negatives |
| Compact image need not be finite over the smaller ring | README:3776 infinite inseparable coefficient example | `ℓᵢ(δⱼ)=δᵢⱼ`, `tΔ⊆Δ²`; infinitely many independent classes mod t | Canonical module is not finite; finite-lattice input in Lean excludes it |
| Inseparable quadratic image | `J=[[0,t],[1,0]]`, characteristic 2, nonsquare t | `J²=tI`, trace pairing identically 0; an eigenvalue would square to t | Ordinary irreducibility does not imply trace-dual boundedness; normalization is needed |

**Shape.** The README has scope/ownership, conventions, supplier contracts, a build explanation, layered examples/dependencies and references. Its reordered 3a/1 and 3b/4 dependencies are explicit. Definitions carry API prose and discriminating Checks, often in shared comparison tables. The incorrect trace Check is R07. The defects above do not require narrowing to good primes, characteristic zero, reduced coefficients, or absolutely irreducible representations where ordinary irreducibility is stated. No computational algorithm, source passage copied into the roadmap, or instruction-like external text was found in the material reviewed.

## Not verifiable

- **Jantzen**, *Representations of Algebraic Groups*, second edition (2003): the exact cited text at I.2.3, I.3.3–3.9, I.4.2/I.4.7/I.4.14–4.17, II.2.6 and II.4.16–4.21 was not obtained. The source service's title search and retry found no legal copy; no paywall was bypassed. This affects independent certification of the general induction/cofree-resolution references in §0.7 and good-filtration references in §6.4, not the explicit Hopf computations above. DKSW's relevant specialized statements were read, but are not a substitute for those exact Jantzen locators. One missing-reference entry records the work under its existing key.
- The finite-instance rows do not certify every general theorem. In particular, the generic cohomology and good-filtration inputs retain the source limitation just stated. The report is not an approval of the source gaps listed below, nor a claim that a `sorry` build proves truth.

Ribet is no longer unverified: the legal scan was readable through OCR. Buchsbaum was read from the AMS open archive after the author URL failed. Ownership was searched against the supplied open heads as well as main and package contracts; no unprovided open pull-request contents are being asserted checked.

## Source issues

- **Misprint** in Chenevier at Lemma 1.18(ii), printed p.16 (Chenevier line 660): the source says the faithful quotient has carriers R and S, although the law has carriers M and N; it should be M/ker(P) to N; affects nothing.
- **Gap** in Bellaïche–Chenevier at proof of Theorem 1.5.6, printed p.37 (Bellaïche–Chenevier line 1549): the source says vanishing on the kernel follows using idempotents acting on the j-th constituent, while the target is the i-th; it should split i=j from i≠j, using generation by Eⱼ in the latter case; affects the proof.
- **Misprint** in Emerson–Morel at proof of Theorem 4.1(i), printed p.14 (Emerson–Morel line 545): the source says determinant generators are indexed by elements of coefficient ring A; it should use elements of the generator set X; affects nothing.
- **Misprint** in DKSW at proof of Lemma 2.3, printed p.9 (DKSW line 308): the source says the expanded scalar character term has a minus sign and an extra second-element character factor; it should simplify to positive χ(g₁)/ψ(g₁); affects the proof.
- **Misprint** in DKSW at §2.1, printed p.9 (DKSW line 320): the source says the local relation uses 1−χψ⁻¹; it should use χψ⁻¹−1 to match Theorem 2.1, or negate the chosen local vector; affects nothing.
- **Gap** in DKSW at §2.1, printed p.9 (DKSW line 324): the source says compactness and continuity make its canonical quotient finite over T; it should establish a finite T-lattice bound and the needed induced topology before asserting finiteness and continuity; affects the proof.
- **Misprint** in DKSW at equation (47), printed p.21 (DKSW line 877): the source says the second factor evaluates ξ at ψ and ψ at σ; it should be ξᵥ(τ)−ψ(τ); affects the proof.
- **Gap** in DKSW at the argument following equation (47), printed p.21 (DKSW line 878): the source says the inertial congruence applies to the first group element without restricting it to inertia; it should use polarization with the inertial second element to justify the required product congruence; affects the proof.
- **Gap** in DKSW at §5.9 after Proposition 5.14, printed p.46 (DKSW lines 1916–1926): the source says the number of generic linear rows equals the number of unused scalar coordinates; it should handle L≤u+k, including L=3,u=2,k=1 with a nonzero minor; affects the proof.
- **Misprint** in Scholze at Corollary 5.4.4, printed p.1060 (Scholze line 4415): the source says the integral characteristic polynomial belongs to the residual representation σψ; it should refer to the newly constructed integral representation σm; affects a stated result.

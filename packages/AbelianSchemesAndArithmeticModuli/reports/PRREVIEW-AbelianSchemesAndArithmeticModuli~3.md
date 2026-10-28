# Review of AbelianSchemesAndArithmeticModuli (pull request #849 at 9b54c40)

**Verdict:** needs changes

## Previous findings, checked first

| Previous finding | Passage at this head | Status |
|---|---|---|
| R01, differentials gap | `Suggested.lean:44–46` still ends its list with “or relative differential bundles”; A1.3 is still absent from the missing-headline list. | Not repaired; R03 below. The pin supplies affine-base differentials. |
| R02, module title | `Suggested.lean:9`: “Abelian schemes and arithmetic moduli: headline statements”. | Not repaired; R04 below. |
| R03, square-root unit hypothesis | `README.md:3082`: “For a positive self-adjoint unit `s`”. | Partly addressed: A6.24 now establishes invertibility before application; the redundant hypothesis remains. R05 below. |

These refer to `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/`. No repair report marking these findings “not actionable in this package” was present among the supplied previous reports. The earlier accepted review is evidence to recheck, not a substitute for this review. In particular, this head correctly replaces its predecessor's false normal-base Weil-extension claim by the regular-base claim and supplies the cone counterexample.

## R01 (P2) — State the internal positive-square-root theorem

**Location.** `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:3082–3085`: “there is a unique positive self-adjoint `r ∈ E` with `r² = s`”; `Suggested.lean:301–330` states only the positivity predicate and normal form.

**Claim.** The deep internal square-root result, explicitly constructed in A6.15 and consumed by both the ample-cone and real-isometry results, is expressible at the pins but absent from the acceptance test. It needs no represented dual or geometric polarization.

**Witness.** A scratch extension of the unchanged file elaborated successfully using its existing `IsRosatiPositive`, `Module.Finite`, `IsUnit`, `Algebra.adjoin`, and `Commute`; no new carrier, placeholder predicate, import, or option was needed.

**Repair.** Add the abstract square-root theorem with the same ring, real algebra, star, finite-dimension and trace hypotheses as `realRosatiDecomposition`. Assert unique positive root, square equation, invertibility, polynomial membership and commutant compatibility; express inverse compatibility using the resulting unit. Keep the geometric specialization in the README. The checked signature includes:

```lean
∃! r : E, IsRosatiPositive t r ∧ r * r = s ∧ IsUnit r ∧
  r ∈ Algebra.adjoin ℝ ({s} : Set E) ∧
  ∀ x : E, Commute x s → Commute x r
```

For `s = diag(4,4,9)`, this gives `r = diag(2,2,3)`; the full repeated-eigenvalue block commutes with both. The zero algebra has its unique element as positive root and unit. These test the proposed statement without narrowing it to matrices.

## R02 (P2) — The dependency gate is failing on main-roadmap suppliers

**Location.** `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:413`, `:787`, `:1017`, `:1859`, `:2471`, `:3835` cite AlgebraicVectorBundles; `:3166` cites RepresentationTheory/SemisimpleAlgebras.

**Claim.** The recorded gate fails (`depcheck=2`); the independent dependency run reproduces two UPWARD lines and an inability to move this roadmap. The review contract does not permit acceptance with this failure outstanding.

**Witness.** Both suppliers actually exist on main: `TauCetiRoadmap/AlgebraicVectorBundles/README.md:228–268` supplies L0B/L0C; `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md:274–284` supplies Skolem–Noether. The gate appears to classify their open revisions as dependencies.

**Repair.** Resolve these citations against those existing main roadmaps, rather than their later open revisions, and rerun the gate. This is an apparent gate false positive, **not evidence that the mathematical supply graph contains the reported cycle**. No merge-order or tooling file was changed in this review. The Skolem–Noether dependency can additionally be replaced by its earlier, already implemented owner: `TauCeti.skolemNoether`, `TauCeti/Algebra/CentralSimple/SkolemNoether.lean:107`, or `TauCeti.exists_unit_conj_of_algEquiv` at line 142, retaining centrality and finite dimension. For `M₂(ℝ)`, the latter directly supplies the conjugating unit required by the proof. Do not remove the actual vector-bundle prerequisite merely to suppress the diagnostic.

## R03 (P3) — Name the precise differential-carrier gap

**Location.** `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/Suggested.lean:44–46`: “the geometric Hodge comparison or relative differential bundles”.

**Claim.** A1.3, listed as a headline at README line 32, is neither stated nor identified in the docstring as unavailable. The reference to missing relative differential bundles is too broad.

**Witness.** `TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean:85` defines `Scheme.relativeDifferentials R X`; `LocallyFree.lean:95` bundles it under smoothness, and `Rank.lean:112` supplies the relative-dimension-one invertible sheaf. These are over `Spec R`.

**Repair.** Name A1.3 and A6.38 explicitly and identify the missing arbitrary-scheme-base differential sheaf/comparisons. Do not claim that the affine-base carrier is absent. For an elliptic curve over a field the existing bundle has rank one; over an arbitrary scheme the needed gluing/interface is the additional work.

## R04 (P3) — Use the required module heading and layer sections

**Location.** `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/Suggested.lean:9`: “headline statements”.

**Claim and witness.** The required title ends in “target signatures”. The file also has no `/-! ## Layer … -/` section comments, although its theorems span A1, A3, A4 and A6; A1's cube and seesaw occur among later-layer statements.

**Repair.** Rename the heading and group the retained declarations under layer comments in README order, moving simple prerequisites before their users. This is a presentation repair; the current signatures elaborate.

## R05 (P3) — Strict positivity already implies the square root's unit hypothesis

**Location.** `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:3082`: “positive self-adjoint unit”.

**Claim.** In the stated finite-dimensional trace setting, “unit” is redundant.

**Witness.** If `sx=0`, strict positivity gives `0=t(sxx†)>0` unless `x=0`. Thus left multiplication by `s` is bijective; its right inverse is two-sided in a finite-dimensional algebra.

**Repair.** Remove “unit” from the hypothesis and retain invertibility in the conclusion. For `E=ℝ`, `s=2` gives inverse `1/2` without a separate unit assumption; `s=0` is excluded by positivity when `E≠0`. In the zero algebra the unique element is a unit, so no nontriviality hypothesis is needed.

## R06 (P3) — The finite-étale Check uses a non-open generic point

**Location.** `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:3430`: “Over `S = Spec ℤ[1/n]` with `U = Spec ℚ`”.

**Claim.** The Check's equality is true, but it is not an instance of the preceding theorem, whose `U` is a nonempty open subscheme.

**Witness.** Every nonempty open of `Spec ℤ[1/n]` contains closed primes; its generic point alone is not open. Thus `Spec ℚ` fails the theorem's input condition.

**Repair.** Use `U=Spec ℤ[1/(nm)]`, with positive `n` and a prime `m` not dividing `n`. Both endomorphism rings of `μ_n` are `ℤ/n`, and restriction is the identity. Alternatively add the generic-point full-faithfulness clause already present in Stacks tag 0BQI before using this Check. For `n=3,m=2`, both sides have exactly three group endomorphisms.

## R07 (P3) — Undeclared API names conflict with the required README/Lean correspondence

**Location.** `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:310–312` declares a convention allowing backticked README-only targets; examples include the A0/A1 API and `DieudonneCrystal.evaluate` at line 2137.

**Claim.** That local convention contradicts this review's form rule: backticked names of this roadmap's own declarations must exist in `Suggested.lean`. A green name scanner does not override that rule.

**Witness.** `Suggested.lean` has no `DieudonneCrystal` declaration and expressly explains why crystalline carriers cannot be stated at the pins. The README nevertheless presents `.evaluate`, `.contravariant` and `.fv` as backticked API identifiers.

**Repair.** Write the unavailable targets and API facts in prose, retaining their mathematical statements, locators and Checks. Keep backticked own declaration names only for the 27 actual declarations and added headline signatures. Do not add an API catalogue or fabricated crystalline carrier to the Lean file. The rank-one constant/multiplicative Checks remain exactly `F=σ` and `F=pσ` after this formatting repair.

## Verified sound

The two requested files were read in full. The sampled targets, seven layers, definitions, API assertions, worked examples, Lean hypotheses and supplier boundaries were examined. The calculations below are tests of the statements, not formal proofs of the admitted theorems. No copied source passage, algorithmic construction substituted for theory, sorry-valued data definition, `set_option`, or out-of-folder PR edit was found. The folder is new relative to main and explicitly extends JacobianChallenge; the separate Part II work is not used as an input.

**Build and signature evidence.** The targeted build completed successfully (9052 build jobs); direct `lake env lean` of the requested file exited 0. Both gave only the 19 expected admitted-theorem warnings. A scratch copy with `#check @…` for all **27 declarations** elaborated, and the printed binders were compared with the README. In particular regular local stalks remain in Weil extension, reducedness remains in seesaw, invertible characteristic remains in Tate statements, and cyclicity/star invariance/strict positivity remain in the normal form. No dropped-binder correction was necessary. All **19** admitted theorems failed the scratch one-tactic alternatives `rfl`, `infer_instance`, and closing `simp`; inspection of the pinned object APIs found no exact single-lemma proof of those complete statements. No padding finding is raised. The additional square-root signature elaborated with one additional `sorry` warning and no other warning.

**Gate evidence.** The supplied full gate has all scanner checks passing and build passing, but dependency check failing. The independently run `gate --depcheck … --movable` returned exit 2 with this output (the file argument was the reviewed README):

```text
not movable: AbelianSchemesAndArithmeticModuli consumes AlgebraicVectorBundles (#247) and is consumed by AnalyticToricGeometryPartII (#139), which comes first: moving AbelianSchemesAndArithmeticModuli after AlgebraicVectorBundles would put a supplier after a consumer, a cycle through AbelianSchemesAndArithmeticModuli
UPWARD: AbelianSchemesAndArithmeticModuli (#41) -> AlgebraicVectorBundles (#247) at README lines [413, 787, 1017, 1859, 2471, 3835]
UPWARD: AbelianSchemesAndArithmeticModuli (#41) -> RepresentationTheory (#180) at README lines [3166]
depcheck: 163 roadmaps, 1181 edges, 2 problem(s)
```

The `#` numbers here are merge-order positions, not pull-request citations. R02 records the main-copy evidence against both diagnostics. No other upward supplier was found by reading the Needs lines. A1.8(3) explicitly waits for A2.8; the earlier Dedekind argument does not, and the regular extension theorem is not an input to the construction of A2.8. Crystalline site/coefficient construction precedes this roadmap; the BT-specific crystal and deformation equivalence flow outward from here. No undeclared supplier gap was used.

**Pinned objects opened.** Mathlib is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following are library-relative paths at those pins, not proposed roadmap declarations:

| Pinned file and line | Declaration/body inspected and boundary |
|---|---|
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | `AbelianVariety`: `Over (Spec K)`, group object, proper and geometrically integral. Smoothness and commutativity are derived, not fields. This does not supply an arbitrary-base abelian-scheme carrier. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Hom/Rigidity.lean:59` | `isMonHom_of_one_hom`: field base, proper geometrically integral source, separated locally finite-type target. The roadmap's arbitrary-base rigidity is stronger. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean:56` | `isogenies` and `IsIsogeny`: finite and surjective morphisms, not a geometric-point count. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Product.lean:61` | `prod`; projections/lift at 114, 123, 132. Field products are imported. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/TangentSpace.lean:85` | `TangentSpace`; `finrank_tangentSpace_eq_dim` at 193. No relative differential bundle over general `S` follows from this field result. |
| `TauCeti/Algebra/Module/Torsion/TateModule.lean:115` | Actual inverse-limit Tate module; `mapLinearMap` at 285; `nonempty_linearEquiv_of_natCard` at 615 and free/finite/rank at 627–637 consume the torsion cardinalities, which remain abelian-specific work here. |
| `TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean:85` | Actual sheafification defining `Scheme.relativeDifferentials`; universal Hom equivalence at 101. Base is a commutative ring. |
| `TauCeti/AlgebraicGeometry/Modules/Differentials/LocallyFree.lean:95`, `Rank.lean:112` | Finite locally free/invertible differential sheaves under smoothness/relative dimension one. R03. |
| `TauCeti/Algebra/CentralSimple/Real.lean:346` | `nonempty_algEquiv_real_or_quaternion`: division, real centrality, finite dimension. It does not include the complex-centre branch. |
| `TauCeti/Algebra/CentralSimple/SkolemNoether.lean:107` | `skolemNoether`; `exists_unit_conj_of_algEquiv` at 142. Central-simple source, finite-dimensional simple target; the automorphism case has central target. |
| `Mathlib/FieldTheory/IsAlgClosed/Basic.lean:220` | `IsAlgClosed.algebraMap_bijective_of_isIntegral`: integral algebra/domain over an algebraically closed field, used only after constructing the complex scalar action. |
| `Mathlib/Analysis/Complex/Polynomial/Basic.lean:58` | `Real.nonempty_algEquiv_or`: the algebraic real field-extension dichotomy, applied to the centre. |
| `Mathlib/Analysis/InnerProductSpace/Spectrum.lean:299`, `:324` | `eigenvectorBasis` and `apply_eigenvectorBasis`: finite-dimensional self-adjoint operator. The interpolation argument produces an internal polynomial root rather than an arbitrary ambient operator. |

Object searches for finite/free Hom, characteristic polynomials and semisimplicity in the pinned abelian-variety files did not find the claimed geometric arithmetic theorems. Searches for abelian schemes, BT/crystal structures and Serre tensor constructions did not reveal an alternative native carrier contradicting the remaining docstring gaps.

**Supplier and ownership resolution.** `roadmaps show` was used to obtain fresh main/head texts, and `roadmaps grep` searched objects (Serre tensor, positive involutions, Appell–Humbert, Grothendieck–Messing, finite-étale extension and Weil restriction). Board package READMEs and the supplied Part II checkout were also searched. The 80 scanner leads were treated as names to resolve, not missing-supplier verdicts: “AlgebraicModuli” is explicitly expanded at README line 393, and many other leads are the unavailable own API identifiers addressed in R07. The following are the principal resolved contract locations; supplier line numbers below exclude the tool's one-line provenance header:

| Supplier copy | Resolved contracts |
|---|---|
| `TauCetiRoadmap/AlgebraicVectorBundles/README.md`, main | L0B/L0C at 228/254: finite locally free sheaves and operations; L2A/L2B include geometric vector bundles. Existing-main ownership, despite gate classification. |
| `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md`, main | Layers 4–5, especially 274–284, central-simple Skolem–Noether. The pin now supplies it directly. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md`, main | §1.8 pullbacks (2252), §1.17 bootstrap (2652), §2.6 cohomology (3439), §3.8 invariant differentials (5002), §4.10 formal existence/morphisms (5490/5497), §5 Chern/intersection/GRR (6703/7110). The bootstrap is for a representable flat locally finitely presented covering; the quotient kernel pair supplies those hypotheses. |
| `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md`, open head | Relative Serre/generation and ampleness (576/586/679/695); Hom/Isom (1031); relative Hom, Weil restriction, base change and quotient comparison (1637–1716); universal functions (8377); Picard sheaf/base change/rigidification/splitting (8708–8760); proper-space completion (8813); identity component (8837). No unpolarized scheme effectivity is smuggled into coherent existence. |
| `TauCetiRoadmap/ComplexComparisonPartII/README.md`, open head | C−1 analytification including nilpotents; C1.9 proper GAGA (1682/1691); C3.2d.2 Picard representation (1972), C3.2f full identity components and criterion (2056/2074); C3.3 proper-space GAGA; C4.2 Chow; C4.4 proper-source morphisms (2214/2243); C5.1–C5.2 Betti/de Rham and Gauss–Manin (2549/2749/2787/2814); C5.4 Chern normalization (3355). The README retains the stronger hypotheses for nonreduced bases. |
| `TauCetiRoadmap/EtaleCohomologyFoundations/README.md`, main | F.0.2 finite-étale Galois category (203); F.2.6 ordinary Künneth (647), distinct from compact support; F.3.0 geometric dimension (631), F.3 proper finiteness (692); F.4.1–F.4.6 normalized systems, classical/pro-étale comparison, finiteness, rationalization and operations (963–1096). Uniform Tor/cohomological bounds and invertible ℓ are retained. |
| `TauCetiRoadmap/EnhancedDerivedSheaves/README.md`, main | E1.9 `perfect_proper_pushforward` (1057): perfect E, bounded finitely presented target-flat G with proper supports; the proper flat finitely presented specialization has no added Noetherian hypothesis. |
| `TauCetiRoadmap/CrystallineCohomology/README.md`, open head | CR.1 base-compatible big fppf site (698–703); CR.7.1 finite projective coefficient evaluations (11274 onward); twist convention (279–281), `p^(−r)` and filtration shift. Its BT-specific construction points back to A4.CR.7.2 rather than supplying it circularly. |
| `TauCetiRoadmap/ComplexTori/README.md`, main | Milestones 1–4 at 130,154,188,230: orbit quotient with discrete full lattice, holomorphic period families, equivariant descent and trivial-action torsion. Polarizations and abelian analytification are additional work here. |
| `TauCetiRoadmap/StableReduction/README.md`, main | Layer 2 relative duality (354–377); effective descent with compatible ample bundle (395–399), including group operations. |
| `TauCetiRoadmap/ModularCurves/README.md`, main | 0B finite-flat Cartier duality (280), 0C quotient domain (345), 0E effective descent (386), 1C/1D elliptic models/group law; 2A–2F elliptic torsion/duality; 7E/7F elliptic BT and Serre–Tate (1510/1551). These do not supply the arbitrary-dimensional theory. |
| `TauCetiRoadmap/JacobianChallenge/README.md`, main | Layers D/E/F: pointed-curve Picard/Jacobian, field abelian geometry, Abel–Jacobi/Albanese. Relative geometry and original-imperfect-field image formation remain here. |

The fresh supplier identifier inventory resolved 47 named contracts across AlgebraicModuliForArithmeticGeometry, ComplexComparisonPartII and SchemeAndStackFoundations, besides the section contracts above. The source-base identity, fppf quotient, characteristic restrictions and contravariant twist conventions agree on the instances below. Open ownership hits for Serre tensor are specializations in CM/Hilbert work importing this general construction; finite-flat classification is separate from the BT carrier and crystal owned here; affine reductive-group Weil restriction is separate from the abelian specialization of the imported general algebraic-space functor. The readable AbelianSchemesAndArithmeticModuliPartII file uses its own namespace and supplies completion/invariant-tensor extensions, not a second owner of the base targets. No duplicate fully qualified declaration was found in those checked files. No unseen open PR was treated as a supplier.

**Seeded source sample.** All 13 named targets were followed to their locators. No README locator is explicitly labelled unverified. Legal source-service retrievals were attempted for all works in the reference list; failures are recorded below. Statements depending on inaccessible primary texts are not certified by pretending to have read them.

| Sampled target | Text inspected at locator | Outcome |
|---|---|---|
| Relative Serre tensor | conrad-gz lines 1518–1544, Theorem 7.2, p.101; 1555–1571, proof p.102; 1614–1623, Theorem 7.5, p.103 | Any associative unital ring, finite projective **right** module, left module scheme, arbitrary scheme base. Properness, smoothness and connected fibres support the abelian conclusion. The source explicitly omits some proofs; the README supplies its own splitting route. |
| Functoriality/projective splittings | conrad-gz lines 1535–1565, same theorem/proof | Tensor universal property and representing functor imply the stated maps and uniqueness preserving the balanced map; these are deductions, not a separately numbered source theorem. |
| Arbitrary base change | conrad-gz lines 1535–1565 | Restricting that point functor to schemes over the new base, or pulling back the split kernel, gives the comparison for every base morphism. |
| Relative Weil extension | BLR §4.4 Theorem 1/Lemma 2, pp.109–110; §1.2 Proposition 8 p.15; §8.4 Corollary 6 p.234 | Primary text inaccessible, **uncertified**. The regular-vs-normal correction and cone negative control were independently checked. Kass's overly broad normal-base assertion is not used as authority for this corrected claim. |
| Crystalline Dieudonné crystal | dejong-crystalline lines 612–639, §§2.3.2–2.3.3 pp.21–22; panny-robert-sferlazza lines 1778–1822, Appendix B pp.35–36; madapusi-mondal lines 605–618, Remark 4.3.3 pp.13–14 | Contravariant Ext, rank-height, fppf site and Hodge/abelian comparison supported. De Jong's F,V statement is characteristic p; the roadmap correctly separates general p-nilpotent bases. BBM itself remains uncertified. |
| Variance/Tate twists | scholze-weinstein-berkeley lines 3955–3957, Lecture 12 p.99 footnote 1; illusie-pisa lines 85–99, §2.2 pp.3–5 | Naive dualization of the source's covariant convention changes the multiplicative Frobenius `p⁻¹σ` to `pσ`; Cartier duality includes twist −1. |
| Grothendieck–Messing | illusie-pisa lines 650–694, §4.2(iv)–(v) pp.16–18; dejong-crystalline lines 994–1046, Proposition 3.2.1/proof pp.32–34; panny-robert-sferlazza lines 1787–1792 | Local p-nilpotence, locally nilpotent divided powers and direct-summand Hodge lifts retained. De Jong's formal-scheme proposition is only cited as an application, not promoted to arbitrary bases. Primary Messing remains uncertified. |
| Lie/Tate/de Rham/crystalline Serre comparison | conrad-gz lines 1555–1565 plus the preceding realization sources | Apply covariant functors to the split projector and contravariant functors to its transpose. The Hom over the opposite ring, rather than an unmarked tensor or added twist, gives the right variance. |
| Rosati operator adapter/internal roots | voight lines 5247–5253, §8.4.8 p.117; pinned spectral theorem | Source supports regular-representation positivity. The internal root and uniqueness are the README's interpolation argument; R01 concerns its missing signature, not mathematical falsity. |
| Real division algebras | voight lines 2025–2084, Theorem 3.5.1/Corollary 3.5.9 pp.36–37; pinned central theorem and complex-centre reduction | General real division case supported; centrality is not silently imposed on the general result. |
| Real Rosati normal form/positivity | voight lines 5180–5267, §§8.4.5–8.4.9 pp.116–118; lipnowski-tsimerman lines 725–764, §4.3.2/Proposition 4.10 pp.19–20 | The normal-form statement is supported; the old Voight proof has errors/gaps listed below and must not be copied as a complete proof. The trace used here need not equal reduced trace. |
| Geometric ample cone | conrad-polarizations lines 260–302, Example 2.2/Lemma 2.3 pp.6–7; lipnowski-tsimerman lines 683–764, Lemma 4.6/Propositions 4.9–4.10 pp.18–20 | Symmetric-Hom identification and positivity cone, with a separate half-normalization, match the roadmap. Integral realization is supplied by A3.13, not inferred by dividing an integral class by two. |
| Finite étale morphisms over normal bases | stacks-0bqi lines 1177–1187, tag 0BQI, Lemma 58.10.7, printed p.25; same chapter lines 435 onward, tag 0BN6, Lemma 58.4.1 pp.9–10 | Irreducible geometrically unibranch suffices; normal integral meets it. Both open and generic-point full faithfulness occur in the source, but only the open clause is stated in this target (R06). |

**Adversarial calculations.** Each row records actual values or maps on the indicated instances. A row marked “passes” is limited to those instances. Shared API laws are tested on the same construction, with both positive and wrong-model/degenerate controls where relevant. The table covers all numbered subsections, the seeded subtargets, the headline list and every finding's mathematical target.

| Statement / definition and API | Instances tried | Values on the two sides | Result | Change |
|---|---|---|---|---|
| A0.1 abelian-scheme carrier, identity, points | identity over S; Gₘ; constant S₃; μ₂ in characteristic 2 | identity has one point over each test T and dimension 0; Gₘ is not proper; S₃ has six geometric components; μ₂ has tangent vector `1+ε≠1` and is not smooth | Desired and wrong models separated | None |
| A0.1 point pullback and group laws | identity map; nonreduced T; S₃ as general group-object control | identity pullback sends x to x; `(1+ε)²=1` in characteristic 2; transpositions `(12)(23)≠(23)(12)` show group-object structure alone does not assert commutativity | Actual scheme points retained | None |
| A0.2 field/elliptic boundaries | elliptic E and zero abelian variety | dimensions 1 and 0; E has identity and smooth proper geometrically connected fibre, whereas the zero object cannot be a relative elliptic curve | Boundaries distinguish dimension | None |
| A0.3 Picard input | E and P¹ over an algebraically closed field | global functions `k=k`; Pic⁰ is respectively E∨ and 0; Pic(P¹)=ℤ while its identity component is a point | Component condition is substantive | None |
| A1.1 products/base change/dimension | E×E; empty product; pullback to dual numbers | dimensions `1+1=2`, `Σ∅=0`; pulled-back identity/product laws remain `(x,y)+(x′,y′)=(x+x′,y+y′)` | Passes | None |
| A1.2 zero-preserving rigidity and automatic commutativity | `[2]`; nonzero translation tₐ; constant S₃ | `[2](x+y)=2x+2y`; `tₐ(0)=a≠0`; S₃ fails connectedness before noncommutativity could contradict the theorem | Hypotheses exclude wrong models | None |
| A1.2 nilpotent/fibre rigidity | S₀=S; S₀ empty over nonempty S; constant `[m]` and `[n]` on E | kernel ideals 0 versus unit ideal; 0 is nilpotent, unit ideal is not; distinct integer maps stay distinct on a geometric fibre | No empty-thickening vacuity | None |
| A1.3 invariant forms | identity scheme; E; Gₘ for supplier comparison | ranks `0=0`, `1=1`; invariant form on Gₘ is `dt/t`, not `dt`; translation pulls `dt/t` to itself | Mathematical comparison consistent; missing-carrier explanation imprecise | R03 |
| A1.3a relative Serre tensor | M=0,R,R² | functors and projectors give `0⊗A=0`, `R⊗A=A`, `R²⊗A=A²`; dimensions 0,g,2g | Passes, including empty product | None |
| A1.3a nonfree/noncommutative tensor | `I=(2,1+√−5)`; `e₁₁M₂(ℤ)` acting on B² | ideal norm 2, while `a²+5b²=2` has no integer solution; lattice becomes I, not R. Matrix summand gives `e₁₁B²=B×0≅B` | Freeness/commutativity not assumed | None |
| A1.3a functoriality/splitting | inclusion `(1,2):R→R²`; zero map; complements N and N⊕R | point map `x↦(x,2x)`; zero maps to 0; projectors `diag(1,0)` and `diag(1,0,0)` both return first coordinate; composite change of splitting acts identically on `m⊗a` | Balanced-map marking excludes arbitrary automorphism | None |
| A1.3a arbitrary base change | dual numbers; identity; two base maps | projector `diag(1,0)` remains that matrix after each pullback; tangent image `(v,0)` on both sides; direct and iterated comparisons send `m⊗a` to the same `m⊗a` | Includes nilpotents and nonflat pullback | None |
| A1.4 seesaw | X=S; infinitesimal Picard deformation on E over k[ε] | identity gives `L=id*(id*L)`; a nonzero tangent Picard class specializes to 0 while remaining nontrivial, so “fibrewise trivial” alone is false on the excluded nonreduced base | Reducedness retained in Lean | None |
| A1.5 cube and integer pullbacks | n=0,1,−1,2,−2 | exponents respectively `(0,0),(1,0),(0,1),(3,1),(1,3)`; for symmetric L, totals `0,1,1,4,4=n²` | Integer divisions exact, negative n covered | None |
| A1.5 rigidification | unrigidified L=π*N; rigidified identity line | cube expression has base exponent `1−3+3=1`, giving π*N rather than O; rigidified base line is O and gives O | Rigidification excludes wrong model | None |
| A1.6 elliptic equivalence | E and dimension-zero identity | E maps to dimension 1 with same zero; identity maps to dimension 0 and is excluded | Both directions use dimension one | None |
| A1.7 torsion restriction | n=1,2; L=O_E(0) | E[1] is identity and rigidified restriction trivial; n=2 has rank 4 and the stated exponent `2n²=8`; rigidification kills the pulled-back base factor | Scheme-theoretic torsion kept | None |
| A1.8 Weil criterion | normal cubic cone, domain missing vertex fibre | along `(t,−t,0)` value `[1:−1:0]`; along `(t,0,−t)` value `[1:0:−1]`; unequal limits | Domain is not fibrewise dense; criterion does not assert extension | None |
| A1.8 Dedekind and regular extension | DVR, map [p]; base field; empty X | `[p]` restricts and extends to `[p]`, kernel rank p² for E; over a field restriction is identity; empty-source Hom sets both singleton | Passes; primary locator uncertified | None |
| A1.8 normal-vs-regular negative control | same cubic cone; regular A² with constant E | cone has two incompatible values above; constant rational map on A² has one value and extends constantly | Corrected regular hypothesis matters | None |
| A2.1 Raynaud representability/affine neighbourhoods | zero abelian space; finite subset of E | zero space is S; empty finite subset fits any open; for finite F⊂E(k), choose q∉F and affine E∖{q} containing F | Scheme and finite-neighbourhood assertions consistent | None |
| A2.2 dual/Poincaré/biduality | E; identity abelian scheme | dimensions 1 and 0; P restricted to either zero section is O; double dual of E identifies with E, double dual of 0 with 0 | Zero rigidifications determine normalization | None |
| A2.3 Mumford map | L=O_E(d·0), d=0,1,2; order-3 point a | relative to λ_E, maps `[0],[1],[2]`; divisor class at a is `[-da]−[0]`; a and −a differ at order 3 | Sign agrees with inversion adapter | None |
| A2.4 ample cohomology/HRR/degree | E, d=−1,0,1,2 | χ=d; h⁰=0,1,1,2; ample d>0 has higher cohomology 0 and `degφ=d²`; degree formula also yields 1 for d=−1, not ampleness | Positivity assumption substantive | None |
| A2.4 higher-dimensional negative χ | E² with degree-1 and degree-−1 factors | χ=−1, self-intersection −2, `χ²=1=degφ`; χ is not always positive for arbitrary L | Square formula handles signs | None |
| A2.5 polarization/type/principal | E with d=1,2; g=0 | isogeny degrees 1,4, numerical degrees 1,2; kernel ranks 1,4; g=0 empty type, degree 1 | Principal means degree one, not arbitrary isogeny | None |
| A2.6 graph bundle | g=1,d=1; g=2,d=1 | doubled graph polarization has χ `2^g d=2,4`; cubic bundle has h⁰ `6^g d=6,36` | Factor 2 and cubic embedding retained | None |
| A2.7 positive intersections | E, effective point D; zero divisor | `(L⁰·D)=1`; zero divisor degree 0 and is excluded by nonzero requirement | No false strict positivity at zero | None |
| A2.8 projective presentation | constant E over normal S; origin of A² | O_E(3·0) gives fibre P² embedding and degree 3; codimension of origin is 2, so codimension-one extension alone does not reach it | Projectivity supplies the later regular-base proof | None |
| A2.9 normalized symmetric nef lines | constant E over a projective curve; zero section | pullback of symmetric ample E-line has nonnegative degree on curves; zero section has degree 0 after normalization | Nef, not necessarily ample on total space | None |
| A2.10 NS group and pullback | E; E² without CM; [2] | NS(E)=ℤ via degree, NS(E²) rank 3 via symmetric matrices; `[2]*` multiplies by 4 | Algebraic-equivalence quotient differs from Pic | None |
| A3.1 isogeny, flat rank and base change | [p] on supersingular E; projection E²→E | finite-flat rank p² but geometric kernel has 1 point; projection has dimension-1 kernel and is not finite | Rank not point count | None |
| A3.2 multiplication/density | g=0; n=±1; n=0 at g>0 | ranks `1`, `1`; zero map on E is not finite and excluded by n≠0; identity is 1-torsion at dimension 0 and dense | Degenerate cases consistent | None |
| A3.2 geometric prime-to-p torsion | E, ℓ≠p, n=1,2 | cardinalities ℓ² and ℓ⁴; dimensions of Z/ℓⁿ-module are 2; supersingular p-torsion has only 1 point and is excluded | Invertibility necessary | None |
| A3.3 finite-flat quotient | H=0; H=ker(F:E→E^(p)) | quotients A and E^(p); ranks `1=1`, `p=p`; kernel is the pullback square, not just its geometric points | Universal-property target consistent | None |
| A3.4 divisibility, both directions | f=[n]h; f=id on supersingular E, n=p | for x∈A[n], `f(x)=h(nx)=0`; `[p]` kills full p-kernel, identity does not, though all geometric kernel points are 0 | Test-scheme quantifier essential | None |
| A3.4 uniqueness/units | n=1,−1; dimension 0 | unique factors h=f and h=−f; zero-dimensional Hom singleton | No division-by-zero route | None |
| A3.5 dual isogeny/Cartier dual pairing | Frobenius and Verschiebung; constant Z/p and μ_p | dual kernels exchange étale/multiplicative; compositions `[p]`; Cartier evaluation on `(1,ζ)` is ζ | Scheme dual and twist preserved | None |
| A3.6 theta commutator/descent | α₂ pairing `1+xy`; constant (Z/2)² wrong pairing | α₂ diagonal `1+x²=1`; strong-product triviality would discard nontrivial xy. A symmetric pairing with self-value −1 fails alternating diagonal | Weak/strong alternation distinguished | None |
| A3.7 polarized Weil pairing | symplectic basis at n=3; swap basis | e(P,Q)=ζ₃, e(Q,P)=ζ₃⁻¹; e(P,P)=1 | Twist and orientation fixed | None |
| A3.8 full level | n=3 over algebraically closed char≠3; n=2 | GL₂(F₃) has 48 bases, symplectic subgroup SL₂(F₃) has 24; [−1] is identity mod2 and nonidentity mod3 | Symplectic marking and n≥3 rigidity differ | None |
| A3.9 Rosati | product polarization E², x=e₁₂,y=e₂₁ | `(xy)†=e₁₁=y†x†`; `x†y†=e₂₂`; scalar [n] is fixed | Anti-multiplicative direction substantive | None |
| A3.10 effective divisor criterion | D=E×{0} versus product polarization divisor | stabilizer of first has dimension 1 and self-intersection 0; product divisor has square 2 and finite translation stabilizer | Effectivity alone is insufficient and not claimed | None |
| A3.11 principal quotient | polarization of type (1,2) | degλ=4, maximal isotropic subgroup rank2; quotient map degree2, descended polarization degree `4/2²=1` | Kernel order and polarization degree differ | None |
| A3.12 genus-two 2-torsion | even subsets of six branch points | 32 even subsets / complement =16 classes, 15 nonzero; pairs disjoint give +1, intersection size1 gives −1 | F₂ dimension4 and pairing agree | None |
| A3.13 symmetric-Hom realization | E², swap matrix; pullback of P | symmetric swap is not positive (eigenvalues 1,−1); graph Poincaré construction has Mumford map twice swap, determinant −4, degree16 | Integral realization is not obtained by integral division by2 | None |
| A4.1 geometric points/Tate module/map | zero object; E, ℓ≠p; supersingular p | ranks 0,2,0 respectively; Tate([n])=nI; rank2 conclusion excludes ℓ=p | Native-carrier Lean target matches prose | None |
| A4.2 universal vector extension | E; zero A; additive polynomial in char p | vector kernel dimension1 and total dimension2 for E; both 0 for A=0; `t^p−at` is additive but not k-linear | Vector-group extensions retain linear structure | None |
| A4.3 H¹dR/Hodge sequence/connection | E; E²; multiplication by p in char p | dimensions 2,4 with Hodge ranks1,2; `[p]*=pI=0`; on constant horizontal basis, ∇(tv)=dt⊗v | Pullback and differentiation conventions agree | None |
| A4.4 exterior cohomology | g=0,1,2 | Betti ranks `(1)`, `(1,2,1)`, `(1,4,6,4,1)` from binomial coefficients; in char2 exterior v²=0 is stronger than skew commutation | Rank and characteristic-2 test passes | None |
| A4.5 BT carrier/tower/duality | Qp/Zp; μp∞; their sum | heights1,1,2; pⁿ-kernel ranks pⁿ,pⁿ,p²ⁿ; duality exchanges first two | Height and whole tower fixed | None |
| A4.5a truncated BT definition | αp at level1; Z/p⊕Z/p² at level2 | on αp, imF=0 while kerV=αp; on mixed group, ker[p] has order p² but im[p] order p | Wrong finite-flat p-power groups excluded | None |
| A4.6 PD realization | canonical DP on (2) in Z/4; zero DP | iterated γ₂(2) remains2 modulo4, so not locally PD-nilpotent; zero DP has δ₂(2)=0 but canonical γ₂(2)=2 | Square-zero does not imply permitted DP structure | None |
| A4.7 abelian GM | ordinary E over square-zero PD extension | H¹ has rank2, Hodge line rank1; line lifts `(1,aε)` have one parameter a | Matches dimension g²=1 | None |
| A4.CR.7.2 crystal/evaluation | constant and multiplicative groups over W(F₂), W(F₃) | rank1 each; F multipliers1,p and V multipliers p,1; both FV=VF=p, hence 2 or3 on generators | Characteristic and semilinearity respected | None |
| A4.CR.7.2 variance/twists | dual of constant group; double dual | slope0 dual then twist−1 gives slope1, F=pσ; repeating returns slope0, since dual reverses the twist | Wrong untwisted dual excluded | None |
| A4.CR.7.2 GM equivalence | étale; multiplicative; ordinary elliptic | Hodge submodules 0,whole rank1,line in rank2; lift spaces singleton,singleton,one tangent parameter | Admissibility and variance agree | None |
| A4.7a realization comparison | M=R²; map `(1,2):R→R²`; rank-zero M | Lie/Tate direct sums; covariant map `v↦(v,2v)`; contravariant map `(x,y)↦x+2y`; M=0 gives zero realization | Opposite-ring Hom has correct direction | None |
| A4.8 polarized effectivity | constant E over complete DVR; compatible O(3·0) | each reduction has degree3 and h⁰3; compatible graded sections recover E with the same ample system | Does not infer scheme effectivity from coherent existence alone | None |
| A4.9 Serre–Tate with structures | zero A; ordinary E; multiplication [n] | zero deformation groupoid has one object; elliptic deformation has one parameter; [n] acts as n on both factors | Structures restrict deformations, not arbitrary equivalences | None |
| A4.10 ordinary coordinates | g=1,2; canonical lift | unpolarized tangent dimensions1,4; principal symmetric dimensions1,3; canonical q=1, Frobenius sends q to qᵖ | Normalization and symmetry agree | None |
| A4.11 weighted polarization equations | two-dimensional diagonal weight diag(1,p) | symmetry of weighted matrix equates one off-diagonal entry with p times the other, not with the unweighted entry; q=1 remains1 under q↦qᵖ | Nonunit weight retained | None |
| A4.12 odd-prime finite-level lifting | abelian surface height4, p=3 | rank of level1 group `3⁴=81`; ambient deformation dimension4, principally polarized dimension3 | Prime and polarization hypotheses retained | None |
| A4.13 ordinary dyadic lifting | ordinary surface p=2 | height4 gives level1 rank16; étale and multiplicative pieces each rank4; canonical divided powers fail nilpotence as above | Separate dyadic route required | None |
| A4.14 genus-two Jacobian lifting | smooth genus2 curve | degω=2, h⁰ω=2, dimSym²H⁰ω=3=h⁰ω²; matches polarized deformation dimension3 | Correct genus-specific dimensions | None |
| A5.1 lattice uniformization/maps | C/(Z+iZ); scalar i versus √2 | lattice rank2, i preserves basis by integral matrix `[[0,−1],[1,0]]`; √2 sends1 outside lattice | Arbitrary complex-linear map does not descend | None |
| A5.2 Riemann/homological forms | lattice basis1,i | E(i,1)=1, E(1,i)=−1; Q=−E and C=−J give Q(Cx,x)=E(Jx,x)=1 at x=1 | Both sign changes are needed | None |
| A5.2 integral perfect pairing | unimodular form; twice it | determinants1 and4; cokernels0 and (Z/2)²; both are nondegenerate over Q | Perfectness retains principal condition | None |
| A5.3 Appell–Humbert/Chern normalization | principal line on C/(Z+iZ); trivial line | `(i/2π)Θ=dx∧dy`, integral1=`−E(1,i)`; trivial curvature0 and c₁0 | Period/orientation convention agrees | None |
| A5.4 elementary divisors/Pfaffian | type(1,2); empty type | Pfaffian2, determinant4, h⁰2, top self-intersection4; empty products1 and dimension0 | Determinant is square, not Pfaffian | None |
| A5.5 polarized Hodge equivalence | non-CM E; multiplication by2 | integral endomorphisms ℤ versus rational ℚ; [2] multiplies pairing by4 | Integral/rational equivalences distinct | None |
| A5.6 analytic families | constant E; disconnected E×(Z/2); deficient lattice | constant period i gives compact fibre E; exponential misses second component of disconnected group; rank1 lattice in C gives noncompact cylinder | Connectedness/full lattice exclude wrong models | None |
| A5.7 comparison conventions | E, basis1,i | H₁ rank2 of weight−1; H¹ its dual of weight1; pairing to Z(1) has alternating entries ±1 | Duals and Tate twist not interchangeable | None |
| A5.8 Siegel action | g=1, τ=i, inversion and translation; g=0 | `−1/i=i`, `i+1`; automorphy denominator i for inversion; empty determinant1 at g=0 | Denominators nonzero | None |
| A5.8 noncommuting matrix order | Ω=`[[i,1],[1,i]]`, lower unipotent with C=diag(1,0) | `(CΩ+I)=[[1+i,1],[0,1]]`; correct Ω(CΩ+I)⁻¹ has (2,1) entry `1/(1+i)`, left quotient has (2,1) entry1 | Detects reversed fractional-linear multiplication | None |
| A6.1 degree definition/composition | [2] on E; non-isogeny; zero-dimensional identity | degrees4,0,1; `[2][3]` degree36=`4·9` | Finite rank and exceptional zero-dimensional zero map consistent | None |
| A6.2 Hom/Tate faithfulness and saturation | r=0; scalar [ℓʳ]; supersingular ℓ=p | at r0 factor f itself; Tate([ℓʳ])=ℓʳI divisible by ℓʳ; p-Tate module0 loses identity map and is excluded | Both divisibility directions meaningful | None |
| A6.3 images over original field | projection E²→E; Frobenius | images E and E^(p), dimensions1; Frobenius kernel nonreduced rankp, but image smooth | Does not replace reduced kernel by smooth kernel | None |
| A6.4 simple abelian varieties | E; E²; zero | E has no proper positive-dimensional subgroup; E² has E×0; zero excluded by positive dimension | Wrong vacuous simple object excluded | None |
| A6.5 complete reducibility | E×0⊂E²; diagonal with anti-diagonal | complement0×E gives degree1; sum of diagonal and anti-diagonal has matrix `[[1,1],[1,−1]]`, degree4 | Complement gives isogeny, not necessarily product isomorphism | None |
| A6.6 degree polynomial | Gaussian CM E; diagonal(2,3) on E² | deg(a+bi)=a²+b², deg(1+i)=2; degdiag(2,3)=2²3²=36 | Homogeneity degrees2 and4 | None |
| A6.7 finite/free Hom | non-CM E; supersingular E; zero A | ranks1≤4, 4=4, 0≤0; no torsion from `[n]f=0` | Rank bound includes extremal and zero cases | None |
| A6.8 semisimple End⁰ | E² non-CM; E×E′ nonisogenous; zero | M₂(Q), Q×Q, zero ring; all semisimple, dimensions4,2,0 | Empty product/zero algebra retained | None |
| A6.9 polynomial detection | P=(X−1)²; Q=(X−1)(X−1−ℓ); F=X−1−ℓ | product of F at P roots is ℓ² with ℓ-adic norm ℓ⁻²; at Q roots product0; equal residues of roots do not give equal resultants | Detects multiplicities beyond modℓ | None |
| A6.9 determinant of polynomial | matrix diag(2,3), G=X+1 | detG(M)=3·4=12; productG(roots)=12 | Correct polynomial functional calculus | None |
| A6.10 characteristic polynomial/trace | α=[r], g=1; g=0 | P=(X−r)², P(m)=(r−m)²=deg(α−m); trace2r. At g0 P=1, deg=1, trace0 | Even sign and total-degree convention correct | None |
| A6.11 Tate/finite-level comparison | [1+ℓʳ] and [1] on E | same matrix I modℓʳ but integer traces `2+2ℓʳ` and2; entire tower distinguishes them | No single-level reconstruction overclaim | None |
| A6.12 subfield trace/norm | CM E, F=Q(i), α=1+i | f=2=2g, exponent1; trace2, norm2=degree2 | Same-identity field condition matters | None |
| A6.13 polarized isogeny degree | [n] on principally polarized E, n=2 | pullback polarization4λ has degree16; `degλ·deg[2]²=1·4²=16` | Square degree retained | None |
| A6.14 Rosati positivity/intersection | projection E²→E×0; Gaussian a+bi | projection trace2=`4·1/2`; translated divisor pulls back to `{−a}×E`; Gaussian trace `2(a²+b²)` | Translation handles image lying in original divisor | None |
| A6.15 operator positivity definition | transpose algebra; s=I+k with k skew | `t(sxxᵀ)=Σxᵢⱼ²`, same as I because skew term trace0; s fails self-adjointness unless k=0 | Positivity inequality alone would admit wrong model; definition excludes it | None |
| A6.15 internal square root | diag(2,3); diag(4,4,9); diag(1,0); zero algebra | roots diag(√2,√3), diag(2,2,3); singular matrix gives quadratic value0 on e₂₂ and is excluded; zero algebra has unique root0=1 | True tested statement, missing signature; unit redundant | R01,R05 |
| A6.15 real division classification | R,C,H,M₂(R) | real dimensions1,2,4,4; centres R,C,R,R; M₂ has `e₁₁e₂₂=0` with both factors nonzero | Complex centre included; matrix algebra excluded | None |
| A6.15 normal form/trace | one M_d(C) factor; quaternion scalar2 | cyclic star-invariant trace is `a ReTr`, a>0; positivity is `aΣcolumns Re(v*sv)`; quaternion s=2 gives `2aΣ|vᵢ|²>0` | Intrinsic/matrix positivity agree | None |
| A6.15 wrong involutions | J=diag(1,−1), x=e₁₂; factor swap on R×R | `trace(x†x)=−1`; `(1,0)(1,0)†=(0,0)` with trace0 | Both violate strict positivity | None |
| A6.15 ample cone/normalization | polarization L; its inverse; E² | θ(L)=1 versus θ′(L)=1/2; θ(L⁻¹)=−1 gives negative value; positive diagonal(1,2) versus indefinite diag(1,−1) | Half-normalization and positivity distinguish classes | None |
| A6.16 NS finiteness | E; E² non-CM | ranks1≤4 and3≤16; symmetric 2×2 matrices have 3 parameters | Uses symmetric part, not all End | None |
| A6.17 geometric/reduced trace | End⁰(E)=Q, α=1 | geometric trace2, reduced trace1; multiplicity2 restores equality | Source Remark4.8 cannot be copied | None |
| A6.18 polarized automorphisms/level | j=1728 E; [−1], n=2,3 | automorphisms ±1,±i (four); −1≡1 mod2 but −1≠1 mod3 | n≥3 excludes familiar stabilizer | None |
| A6.19 polarization orbits | non-CM E | only principal positive integer1; units±1 act by square1; one orbit | Positivity excludes −1 | None |
| A6.20 full-level descent | quadratic twist; n=2 versus3 | twist cocycle−1 acts trivially on E[2] but by−I on E[3] | Low-level failure excluded | None |
| A6.21 Frobenius semisimplicity | E/Fq, q=2,3 | π†π=q; geometric trace of q is2q=4,6; eigenvalues obey productq, with P=X²−aX+q | Centrality is over the original finite field | None |
| A6.22 coefficient Hom/quasi-isogeny | E, coefficients Q, Z, zero ring | End spaces Q,Z,0; [2] invertible over Q but not Z; zero-ring identity0 is its unique unit | Coefficients do not silently become fields | None |
| A6.23 isogeny torsor | A=B=E; nonisogenous E,E′ | rational isomorphisms Q× act freely transitively on themselves; nonisogenous Hom0 gives empty isomorphism set | Torsor requires nonemptiness hypothesis | None |
| A6.24 real isometry | same E with λ_B=2λ_A | scalar u=1/√2 gives u†(2λ_A)u=λ_A; no rational scalar solves 2u²=1 | Real coefficients essential | None |
| A6.24 adjoint compatibility | f=diag(2,1), noncompatible polarizations, x=e₁₂ | `f x f⁻¹=2e₁₂`; its transpose2e₂₁ differs from `f xᵀ f⁻¹=(1/2)e₂₁` | Adjoint intertwining needs polarization compatibility | None |
| A6.25 finite-étale extension | μ₃ on S=SpecZ[1/3], U=SpecZ[1/6] | endomorphism rings both Z/3; restriction sends each exponent0,1,2 to itself | Correct open Check | R06 |
| A6.25 finite-étale negative controls | nodal cover; open immersion U≠S | section counts `0` over S versus `2` over node complement; for open immersion `0` over S versus `1` over U | Normality and finiteness not cosmetic | None |
| A6.25 abelian Hom extension/representability | constant E over normal cone; U=S; empty U | End(E) extends identically although arbitrary sections need not; identity restriction bijective; empty U not dense unless S empty | Does not reuse false normal-base section extension | None |
| A6.25 fixed part | constant E family; nonconstant family with no fixed part | invariant H₁ ranks2 and0 respectively; corresponding constant abelian dimensions1 and0 | Constant part tied to actual variation | None |
| A6.26 localized Hom | disjoint union of points with denominators2ⁿ | each local morphism has finite denominator; no single `2^N` clears all `2ⁿ`; a product of torsion classes of orders2ⁿ vanishes locally after localization but not globally with one denominator | Sheafification differs from global tensor | None |
| A6.27 weak localized polarizations | λ and2λ, coefficients Q versus Z | 2 is positive unit in Q, not unit in Z; inverse1/2 exists only in Q | Weak equivalence retains coefficient units | None |
| A6.28 coefficient torsor twist | μ₂-torsor over R split by C, sign action on coefficients | invariant line generated by i; coefficient extension is isomorphic to original object, with descent marking changed | Does not falsely assert quadratic geometric twist | None |
| A6.29 twist realizations/polarization | real descent via diag(1,i) | transported symmetric form descends to diag(1,−1); value at e₂ is−1 | Positivity must be checked, not inferred from complex trivialization | None |
| A6.30 Weil restriction functor/scheme criterion | identity; split degree2; inseparable quadratic in char2 | Res_idX=X; split gives X₁×X₂; `(Kbar[ε]/ε²)×≅Gₘ×Gₐ` by `(a,b)↦(a,b/a)` | Inseparable case not called torus | None |
| A6.31 separable splitting | Q(√2)/Q; inseparable degree2 | two embeddings give Gₘ² with swap; inseparable tensor has ε≠0, ε²=0 and only one reduced point | Separability substantive | None |
| A6.32 abelian Weil restriction | finite étale degree2; dual numbers | dimension2g and proper product after splitting; dual-number Res(E)≅E×Gₐ is dimension2 but not proper | Finite flat alone excluded | None |
| A6.33 Tate induction | extension degree1,2 | ranks2g and4g; identity induction is original module, quadratic action swaps the two summands | Finite-index sum commutes with inverse limit | None |
| A6.34 quadratic twists | trivial character; g1 in char2 as well | trivial twist A; sum-difference matrix M satisfies M²=2I, detM=−2; degree on E² is4, including inseparable multiplicity | Degree not2 and no good-prime shortcut | None |
| A6.34 rational eigenspaces/Tate twist | split cover; nontrivial character | projectors `(1±σ)/2` have eigenvalues1,0; Galois action on twist is χ(σ)ρ(σ), not coefficient-torsor action alone | Averaging only after Q-extension | None |
| A6.35 curve-generated subvariety | a+(E×0); diagonal E⊂E² | generated subgroups E×0 and diagonal E, each dimension1, not full dimension2 | Subtracting basepoint removes translation | None |
| A6.36 Morikawa | C=A=E, H degree d>0 | ν=id, α=[d], trace2d=`2(C·H)`; P=(X−d)², Q=X−d positive rootd | Fixes sign, square multiplicity and positivity | None |
| A6.37 CM isotypic decomposition | A=Eⁿ with CM field F, n=1,2 | End⁰=F and M₂(F); centres F, simple-module multiplicities1,2; off-diagonal Hom prevents product F² for E² | Matrix factor distinguished from product | None |
| A6.38 Hodge line/base change | zero A; E×E | det of rank0 module is O; det(ω_E⊕ω_E)=ω_E⊗ω_E; pullback sends tensor factors to same pulled-back factors | Missing arbitrary-base carrier must be stated precisely | R03 |

There are **124 calculation rows** above. The 19 Lean theorem targets occur explicitly in the rows for A1 rigidity/seesaw/cube/extension, A3 multiplication/density/quotient/divisibility, A4 Tate rank, and A6 faithfulness/reducibility/Hom/semisimplicity/characteristic polynomial/Tate comparison/normal Hom extension/real normal form. The other headline families in the README are Picard/dual/polarization/theta/level geometry; universal extension/de Rham/BT/crystalline/deformation theory; complex uniformization/Appell–Humbert/Hodge/Siegel geometry; and coefficient/localized Hom, twists, Weil restriction, Morikawa and the Hodge line. Their missing geometric carriers are described in the module docstring, with A1.3's omission corrected by R03 and the expressible square-root result corrected by R01. The general real division-algebra reduction can also be stated on native carriers; it is a supporting classification input rather than a replacement for the accepted normal-form headline.

## Not verifiable

- **blr:** the source service resolved *Néron Models* only to its paywalled Springer DOI. I did not read §4.4 Theorem 1/Lemma 2 pp.109–110, §1.2 Proposition 8 p.15, §8.4 Corollary 6 p.234, or §7.6 Theorem 4. Their precise primary-source wording is uncertified. The cone calculation, regular-base signature and scheme-theoretic restrictions were checked independently; this is not a claim that the primary locator was verified.
- **messing:** Springer LNM 264, Chapter V Definition 1.4/Theorem 1.6, inaccessible through the service. The admissibility and locally nilpotent PD conditions were checked in the legal Illusie and Panny–Robert–Sferlazza texts, and in de Jong's explicit use. The primary text remains uncertified.
- **bbm:** Springer LNM 930, §§2.5.6, 3.3.3–3.3.10, inaccessible through the service. The cited construction and numbering were checked through de Jong, Madapusi–Mondal and Panny–Robert–Sferlazza, not by claiming access to BBM itself.
- **faltings-chai:** Springer DOI only; the quoted I.1–I.6 locators were not directly certified. Legal Olsson, Oort, Katz and other cited accounts provide independently readable portions of the surrounding theory.
- **chai-conrad-oort:** §1.7.4 could not be retrieved through the source service. The AMS landing page was found; Chai's author-hosted draft returned HTTP 403; the institutional CiteSeer copy redirected to an unavailable archived document (HTTP 404). This remains the sole unresolved entry in `needs-references.toml`. Conrad's readable Theorems 7.2/7.5 independently support the sampled Serre-tensor claims, including noncommutative coefficients. No published/preprint numbering equivalence was assumed.

Other reference-list works were retrieved legally, but retrieval alone is not a certification of every non-sampled locator. The audit certified the source passages enumerated in the sample table. Pilloni's author version and Tsimerman's arXiv version were retrieved after their landing-page attempts failed; their published page numbering was not silently transferred to those copies. No manifest or roadmap source file was edited. The review is complete with these explicit evidence limits.

## Source issues

- **Error** in kass-abelian-schemes at the Weil-extension paragraph, printed p.2 (lines 41–45): the source says normal connected locally Noetherian bases suffice for extension from every smooth separated generic fibre; it should require regularity or suitable stronger hypotheses, as the normal cubic-cone example shows; affects a stated result.
- **Error** in voight at the paragraph following Definition 8.4.1, printed p.116 (lines 5186–5188): the source says positivity of a bilinear form can be tested on basis vectors; it should require positivity on every nonzero vector; the factor-swapping involution on R×R is a counterexample; affects the proof.
- **Gap** in voight at Lemma 8.4.5, second proof, printed p.116 (lines 5213–5217): the source says a nonzero radical power supplies an element with nonzero corresponding power; it should use a nonzero element of the last radical power directly; exterior algebras refute the asserted selection; affects the proof.
- **Error** in voight at Proposition 8.4.7, printed p.117 (lines 5235–5238): the source says a skew-adjoint quaternionic matrix has zero diagonal; it should allow purely imaginary diagonal entries and separately exclude skew-Hermitian adjoints using positivity; affects the proof.
- **Misprint** in voight at §8.4.8, printed p.117 (line 5253): the source says the quadratic form in α contains an independent β; it should use α in both slots; affects nothing.
- **Gap** in voight at Lemma 8.4.9, printed p.118 (lines 5258–5263): the source says an isotropic vector for the μ-weighted form immediately contradicts positivity of the conjugated involution; it should relate that form explicitly to the involution's positive trace form, for example using rank-one matrices; affects the proof.
- **Error** in voight at Lemma 8.4.9, printed p.118 (line 5264): the source says positive definiteness makes all eigenvalues equal to one; it should distinguish normalization by congruence from operator eigenvalues; μ=diag(2,3) retains eigenvalues two and three; affects the proof.
- **Error** in lipnowski-tsimerman at Remark 4.8, printed p.18 (line 705): the source says geometric trace equals reduced trace for every simple abelian variety; it should include the representation multiplicity; for a non-CM elliptic curve the traces of one are two and one; affects a stated result.
- **Misprint** in panny-robert-sferlazza at Appendix B, printed p.35 (line 1787): the source says Grothendieck–Mazur names the filtration deformation equivalence; it should say Grothendieck–Messing, consistently with the cited theorem; affects nothing.
- **Misprint** in conrad-gz at Theorem 7.2, proof, printed p.102 (line 1570): the source says the split base-algebra decomposition is a decomposition of A-modules; it should say R-modules, for the base ring R used in that paragraph; affects nothing.

The README does not repeat the false normal-base claim, the equality of geometric and reduced traces, or the invalid basis-positivity test. Its independent internal-root argument avoids the eigenvalue-normalization mistake. No published correction was located in this audit.

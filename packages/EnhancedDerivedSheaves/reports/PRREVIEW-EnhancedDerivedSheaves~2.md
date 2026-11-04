# Review of EnhancedDerivedSheaves (pull request #1630 at 7b99c5e)

**Verdict:** needs changes

## Previous findings at this head

The supplied previous report identifies pull request #1330 at `856fe7a`, rather than this pull request. I compared its seven findings with the actual files at `7b99c5e`; the dispositions below do not assume an intervening repair. No report marking a finding “not actionable in this package” was supplied.

| Previous finding | Passage at this head | Disposition |
| --- | --- | --- |
| R01, missing PurityOfBranchLocus import/build failure | Suggested.lean:1–2 contains only `import Mathlib` and `import TauCetiRoadmap.SchemeAndStackFoundations.Suggested`. | Repaired/absent: no PurityOfBranchLocus import; direct elaboration succeeds. The remaining forbidden import is R03 below. |
| R02, duplicated regular-local algebra | README:705: “By Lemma 10.109.12 it suffices to bound the projective dimension of cyclic, hence finite, modules”. | Not repaired. The residue-field theorem is also present again at Suggested.lean:94. See R01. |
| R03, roadmap-module import | Suggested.lean:2: `import TauCetiRoadmap.SchemeAndStackFoundations.Suggested`. | Not repaired; the gate still fails. See R03. |
| R04, padding | Suggested.lean:130: `theorem frobeniusRootIdeal_root_mem`; the four named counterexample theorems also remain. | Not repaired. See R04. |
| R05, pro-isomorphism signature | README:1407: “`proIso_comp` (composition and two-out-of-three)”. | Not repaired: the theorem still states composition only. See R05. |
| R06, tensor locator | README:459: “§4.1.3 and §7.1.2”. | Not repaired: §4.1.3 is about planar operads. See R06. |
| R07, catalogue/docstring form | Suggested.lean:367: “The README also specifies API beyond the representative statements above”. | Not repaired: the catalogue and “representative” framing remain. See R07. |

## R01 (P2) — Import the existing owner of regular-local homological algebra

Location: `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:695`, :705–707 and `TauCetiRoadmap/EnhancedDerivedSheaves/Suggested.lean:94`. Quote: “Conversely, a Noetherian local ring whose residue field has finite projective dimension is a regular local ring”.

Claim: E1.6 owns both this criterion and the ordinary local/cyclic-module steps used to prove its global-ring bound.

Witness: `TauCetiRoadmap/PurityOfBranchLocus/README.md:162–200` owns 065T, 00O7 and 00OC. Its `Suggested.lean:146–150` already states the same residue-field criterion with the same hypotheses and conclusion.

Repair: delete the duplicate criterion from this Lean file and import PurityOfBranchLocus §0.3 mathematically in Scope and ownership, the supplier contracts and E1.6's relevant *Needs:* lines. Keep the genuinely additional all-module, global-ring bound (00OE). Its route should use the supplier's `globalDimension_le_iff`, `IsRegularLocalRing.globalDimension_le` and `globalDimension_le_iff_hasProjectiveDimensionLE`, followed by localization, rather than planning their proofs again. Use its residue-field criterion for the Kunz converse. Do not introduce a roadmap-module Lean import.

Test of the boundary: a field has dimension/projective dimension 0; a regular local polynomial ring in d variables has residue-field projective dimension d; a global regular ring needs the additional localization argument. The supplier owns the first two ingredients, while the last comparison is the retained target. Main's PurityOfBranchLocus ownership paragraph at :61–68 explicitly leaves 00OE here. This is a repairable overlap within an existing roadmap, not grounds to reject the whole roadmap as a re-plan.

## R02 (P2) — State the saturated-lattice headline on the available native carriers

Location: `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:830`; `TauCetiRoadmap/EnhancedDerivedSheaves/Suggested.lean:184–202` defines saturation but states no finite-freeness theorem. Quote: “M is a finite free V-module of rank at most r”.

Claim: the finite-freeness result is part of the roadmap, but the acceptance test only defines its predicate.

Witness: `bs17` lines 1221–1232, Lemma 6.14, p. 26, states the bounded saturated-submodule result. A scratch signature using `ValuationSubring`, `Submodule`, closed balls and `LinearEquiv` elaborates with only its `sorry` warning.

Repair: add this headline theorem. Spherical completeness is a short property of the native metric carrier; its absence as a named predicate is not an unavailable heavy carrier. The successfully elaborated signature, using the existing real-bodied `IsValuationSaturated`, was:

```lean
theorem valuationSaturated_finite_free
    (K : Type u) [NontriviallyNormedField K] [CompleteSpace K]
    (hballs : ∀ S : Set (Set K), S.Nonempty → IsChain (· ⊆ ·) S →
      (∀ s ∈ S, ∃ x : K, ∃ r : ℝ, 0 ≤ r ∧ s = Metric.closedBall x r) →
      (⋂₀ S).Nonempty)
    (hvalues : ∀ r : ℝ, 0 < r → ∃ x : K, ‖x‖ = r)
    (V : ValuationSubring K) (hV : ∀ x : K, x ∈ V ↔ ‖x‖ ≤ 1)
    (r : ℕ) (M : Submodule V (Fin r → K))
    (hbounded : Bornology.IsBounded (M : Set (Fin r → K)))
    (hsat : IsValuationSaturated V (IsLocalRing.maximalIdeal V) M) :
    ∃ n : ℕ, n ≤ r ∧ Nonempty (M ≃ₗ[V] (Fin n → V)) := by
  sorry
```

This is a signature probe, not a proof of the theorem. The identification of V with the norm unit ball fixes the coefficient ring and the nonarchimedean convention. Rank zero gives n=0; a nonzero principal ball gives n=1; the open unit ball fails saturation. These are exactly the discriminating instances of the README, and the full positive-real value-group assumption is retained.

## R03 (P3) — Remove the import rejected by the gate

Location: `TauCetiRoadmap/EnhancedDerivedSheaves/Suggested.lean:2`. Quote: `import TauCetiRoadmap.SchemeAndStackFoundations.Suggested`.

Claim: the acceptance test may depend on another roadmap's admitted API.

Witness: the supplied gate reports `imports=1`, `FAIL`; all other counters, including `build`, are zero. The permitted imports are Mathlib and used individual TauCeti library modules.

Repair: remove this import, the corresponding `open` at :31 and the five `IsReplete.*` theorems at :258–294. Keep their mathematical statements in E2.1 and name them in the module docstring as unavailable because the supplied repleteness predicate is a roadmap target, not a pinned-library declaration. Keep the section-level supplier citation. A scratch copy with exactly that import/open/section removal elaborated successfully with only `sorry` warnings. No change of gate policy is needed or assumed.

## R04 (P3) — Delete the API and Check padding from Suggested.lean

Location: `TauCetiRoadmap/EnhancedDerivedSheaves/Suggested.lean:50–77`, :130–134, :236–248, :334–336 and :358–363. Quote: “The `p^n`-th roots of `f` lie in `J_f`”.

Claim: these declarations belong in the headline acceptance test.

Witness: root membership closes with `exact Ideal.mem_iSup_of_mem n (Ideal.mem_span_singleton_self _)`. The flat-single statement and four counterexample theorems repeat the README's boundary/example Checks rather than its end theorems.

Repair: delete `frobeniusRootIdeal_root_mem`, `isKFlat_single_of_flat`, `zmodFourTwoComplex_not_isKFlat`, `pMultiplicationTower_not_isProZero`, `derivedComplete_directSum_counterexample` and `derivedComplete_not_separated` from `Suggested.lean`. Delete the two example-only data definitions `zmodFourTwoComplex` and `pMultiplicationTower`, their trivial proved examples, and `IsKFlat` if it has no remaining headline consumer. The README keeps these mathematical Checks as prose, without claims of Lean counterparts. Do not prove them in place.

Tests: root membership's single-term proof elaborated. For the ℤ/4 complex, ker(2)=im(2)={0,2}, but after tensoring with 𝔽₂ every differential is zero and every cohomology group is 𝔽₂. Multiplication-by-p tower composites are p^(m−n), nonzero for prime p; even p=4 works, so primality is unnecessary for that Check. For ⊕ℤ_p, the recurrence with y_n=e_n forces infinitely many nonzero coordinates in x₀. These are useful negative controls, but their role is in the README.

## R05 (P3) — Do not label composition as a two-out-of-three signature

Location: `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1407`; `TauCetiRoadmap/EnhancedDerivedSheaves/Suggested.lean:229–233`. Quote: “`proIso_comp` (composition and two-out-of-three)”.

Claim: the Lean declaration states all three implications.

Witness: the declaration assumes `IsProIsomorphism f` and `IsProIsomorphism g`, and concludes `IsProIsomorphism (f ≫ g)`. Neither cancellation implication occurs in its type.

Repair: describe this declaration as composition only. State the two cancellation implications separately in the README's prose API, retaining their hypotheses; no additional API-padding declarations are needed. For f=id and g a pro-isomorphism the composition implication works; recovering g from f and gf is a different implication. For the zero-transition tower, all three relevant kernel/cokernel towers die after one step, confirming that two-out-of-three is about pro-isomorphisms rather than levelwise isomorphisms.

## R06 (P3) — Replace the planar-operad locator for derived tensor

Location: `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:459`. Quote: “Lurie, Higher Algebra, §4.1.3 and §7.1.2”.

Claim: §4.1.3 supports the symmetric monoidal localization used for derived tensor.

Witness: `lurie-ha` line 17801, printed p. 465, starts the planar-operad section. Proposition 4.1.7.4 at line 18583, p. 486, and Example 4.1.7.6 at line 18605, p. 487, give monoidal localization.

Repair: cite §4.1.7, specifically Proposition 4.1.7.4 and Example 4.1.7.6, pp. 486–487, alongside the ringed-site K-flat tensor construction. Retain §7.1.2 for the module-spectrum comparison, not as a substitute for the sheaf construction. The test is the tensor-stability hypothesis: a quasi-isomorphism remains one after tensoring with a K-flat complex; arbitrary termwise flat unbounded complexes fail the ℤ/4 control above.

## R07 (P3) — Replace the signature catalogue with a headline docstring

Location: `TauCetiRoadmap/EnhancedDerivedSheaves/Suggested.lean:5–24`, :367–453; `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:265`. Quote: “representative target signatures”; “The README also specifies API beyond the representative statements above”.

Claim: a catalogue of undeclared names records the acceptance test's remaining API.

Witness: the final block is a catalogue, not declarations. For example `dgNerve` is a backticked own target in the README but has no definition or theorem in this file.

Repair: use the prescribed single module docstring, “Enhanced derived sheaves: target signatures”. Name the actual headline theorems retained and, individually or in precise families, the headline theorems not statable and their missing carriers. Delete the ending catalogue. In the README use prose/italic labels for own targets not declared in Lean; retain backticked declaration names only for genuine declarations and suppliers. Do not manufacture opaque carriers or extra declarations to satisfy the names. Add the finite-free headline from R02 rather than leaving it as a catalogue entry. A declaration scan and the 34 elaborated `#check @name` outputs distinguish actual declarations from comment text.

## R08 (P3) — Supply the definition APIs and the Layer 0 closing sections

Location: `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:431–507`, especially :433 and :459. Quote: “Provide shifts, cones, mapping complexes, the standard cohomological t-structure”.

Claim: the construction paragraphs provide the required definition-level API and layer structure.

Witness: Layer 0 ends directly with the §0.4 Checks and then Layer E1. It has no `### Examples` or `### Dependencies`; the new constructions' API promises are inline lists rather than mathematical API bullets.

Repair: give each definition its prose API bullets with domains, hypotheses and conclusions, preserving its discriminating Checks. End Layer 0 with Examples and Dependencies, keeping the joint replacement-before-localization order explicit. For example, distinguish H⁰(A[0])=A, H⁻¹(A[1])=A and H*(Cone(id_A))=0; list the §0.2 replacement and E0 nerve inputs separately from later coherent-operation inputs. This is a shape repair, not a request for more Lean API declarations.

## Verified sound

The exact requested head was read. The outside-folder diff is empty. This pull request changes the existing roadmap's definitional-order explanation and its spectral-comparison locator; it does not add a second roadmap. The new ordering is mathematically consistent: the dg construction comes first and the spectral equivalence is proved later. Scope excludes prestack quasicoherent-sheaf ownership. No `set_option`, sorry-valued data, computational algorithm or route-specific restriction was found. No source passage copying was identified in the inspected source comparisons.

The direct `lake env lean` elaboration of the target succeeded with 25 `sorry` warnings and no other warnings or errors. A separate scratch copy printed all 34 declared signatures using `#check @name`; the regularity, characteristic, finite-generation, universe and completeness hypotheses present in their source signatures survived elaboration. No silent binder loss was found. Each of the 25 sorried theorems was tried with `simp`, `rfl` and `infer_instance` on a scratch copy; none closed with those tactics. The separate single-library-term root-membership probe did close. The full probe's expected failures included instance-search timeouts; no options were changed. The import-removal copy and the added saturated-lattice signature were each elaborated separately and passed. No Lean process was left running.

Gate evidence: `imports=1`, `build=0`, `depcheck=0`, `stray-files=0`, `outside-folder=0`, `sorry-data=0`, `set_option=0`; the other reported counters are zero. Thus the gate is **FAIL**, despite a passing build. Acceptance is unavailable while R03 remains.

The requested independent dependency command returned:

```text
depcheck: 205 roadmaps, 1519 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The *Needs:* lines and supplier table were inspected; R01 identifies an omitted ownership edge rather than a reported upward edge. The ringed-site joint construction does not require its localization to construct replacements. The additive tower theory precedes its monoidal extension; the abstract spectral comparison precedes animated-module comparison; coefficient reconstruction follows the regular-ideal and derived-completion comparisons. No declared supplier gaps were present.

The normative README and CONTRIBUTING were read, as were the shape of main's PurityOfBranchLocus and Completed/OrthogonalL2Bases. Main was inspected at `fa41b3747f56d4e77bd69e7099c1be4f2e4959ba`. Library evidence below uses Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

### Seeded source sample

No README locator was marked unverified. All four seeded sections were compared with legally fetched source text, including hypotheses and the following exact locators. Page numbers for Stacks refer to the fetched chapter PDFs; tags are the stable identifiers.

| Target | Source text inspected | Outcome and scope |
| --- | --- | --- |
| 0.1 enhanced derived sheaves | `lurie-ha` lines 4739, 4743, 4874: Definition 1.3.5.8 and Propositions 1.3.5.9, 1.3.5.21, pp. 125, 129; `stacks-injectives` line 883, Theorem 19.12.6/079P, chapter p. 19 | Grothendieck abelian category, K-injective dg model, stability, presentability and filtered-colimit compatibility match. The source does not grant left completeness for every Grothendieck category; the roadmap correctly imposes later repleteness/boundedness hypotheses. |
| 0.2 replacements | `stacks-injectives` lines 883–903, 079P; `stacks-sites-cohomology-ch` lines 1342–1358, Lemmas 21.17.11–12/06YS–06YT, p. 31; §21.19, pp. 36–38 | Functorial K-injective replacement and existence of K-flat flat-term replacements match. The commutative coefficient restriction is retained for tensor. Flat terms alone do not assert K-flatness. Coherent/functorial models require the stated model-category work, not just the existence clause of 06YS. |
| 0.3 tensor and internal Hom | `stacks-sites-cohomology-ch` lines 1373–1386, 06YU/08FF, pp. 31–32; lines 3670–3703, 08J8/08J9/08JB, p. 82 | Construction, tensor–Hom adjunction, restrictions and Tor in negative cohomological degrees agree. The Higher Algebra localization citation needs R06. |
| 0.3 limits and completion | `stacks-derived` lines 5253–5275, §13.34/08TB, p. 105; `stacks-more-algebra` line 10814, 07KY, p. 235; lines 12163, 12293, 12344, 12520, 091V/0920/0G1U/0923, pp. 264, 267, 268, 271 | Fibre of 1−shift, the Milnor term and finite-generation/regular-quotient restrictions agree. Degreewise surjectivity is correctly separated from cohomological ML; derived products are retained for sheaves. |
| 0.4 coherent functors | `stacks-sites-cohomology-ch` lines 1447–1453, §21.18, p. 33; lines 1631–1664, 07A6/0D6E/07A7, pp. 37–38; `lurie-ha` §1.3.4, including lines 4382–4410, pp. 116–117 | Unbounded derived adjunction, composition and exchange direction agree. The source supplies the ordinary calculus and model-category machinery; coherent enhancement remains a target. Analytic proper-support equivalences are conditional on the explicit geometric inputs, not asserted for every morphism. |
| Changed spectral comparison | `lurie-ha` line 46277, Remark 7.1.1.16, p. 1206; line 46530, Theorem 7.1.2.13, p. 1212 | Additive module comparison for discrete associative rings, and symmetric monoidal comparison for commutative rings, agree with the standing coefficient conventions. |
| Saturated lattices | `bs17` lines 1221–1232, Lemma 6.14 and proof, p. 26 | Boundedness, spherical completeness, full real value group and saturation are all needed in the stated proof. Rank bound follows from the embedding in K^r. |

The source files were fetched through the sources service from the Stacks project, author pages and arXiv. In addition to this seeded sample, I read the two BS-proet proof passages discussed under Source issues. The mathematical statements of their lemmas remain valid; the README's use of mapping spaces and all integer cohomological degrees avoids the proof defects.

### Pinned APIs and ownership

The following native definitions were opened rather than inferred from their names. In particular, regularity already includes Noetherianity, ordinary sheaf tensor is not its derived enhancement, and adic completeness already includes separation.

| Library declaration | File and line at the pin | What it supplies / does not supply |
| --- | --- | --- |
| `CochainComplex.IsKInjective` | `Mathlib/Algebra/Homology/HomotopyCategory/KInjective.lean:42` | Maps from acyclic complexes are homotopic to zero; it is not a K-flat predicate. |
| `IsRegularLocalRing` | `Mathlib/RingTheory/RegularLocalRing/Defs.lean:51` | Local, Noetherian, and cotangent-generator dimension equality. |
| `IsRegularRing` | `Mathlib/RingTheory/RegularLocalRing/Defs.lean:92` | Noetherianity and regularity of prime localizations; the finite global dimension theorem is additional. |
| `CategoryTheory.Tor` | `Mathlib/CategoryTheory/Monoidal/Tor.lean:44` | Left-derived tensor in the second argument; the roadmap uses positive indices `i+1`. |
| `IsHausdorff`, `IsAdicComplete` | `Mathlib/RingTheory/AdicCompletion/Basic.lean:46`, :56 | Intersection-of-powers separation; completeness bundles it with precompleteness. |
| `TauCeti.DGCategory`, `TauCeti.dgHomComplex` | `TauCeti/CategoryTheory/DG/Basic.lean:71`, :77 | Enrichment in cochain complexes and its Hom complexes; no dg nerve is supplied here. |
| `EnrichedFunctor.mapDGHomotopyCategory` | `TauCeti/CategoryTheory/DG/Functor.lean:244` | The induced H⁰ functor, not a comparison of mapping spaces. |
| `TauCeti.SheafOfModules.monoidalCategory`, `symmetricCategory` | `TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Monoidal.lean:104`, :112 | Ordinary module-sheaf tensor and symmetry. |
| `TauCeti.SheafOfModules.monoidalClosed` | `TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Closed.lean:73` | Ordinary internal Hom; derived Hom is not duplicated by using it. |

The citation resolver reported no unresolved cross-roadmap section and 40 Lean-name leads. These include own README-only targets and supplied specifications, rather than 40 missing pinned APIs: for example, Almost.Algebra.IsFiniteEtale and its idempotent criterion resolve in PerfectoidSpaces:2061–2068, while Sheaf.derivedPushforward and Sheaf.higherDirectImage resolve in SchemeAndStackFoundations:3282–3286. The module-name lead resolves to the real imported file, whose import is nevertheless disallowed by R03.

Object searches used `roadmaps grep`/`roadmaps show`, the main tree, the available open-head files and the board packages, including searches for dg nerves, enhanced sheaves, regular homological dimension, valuation saturation, derived fibre products and animation. No competing owner of the saturated bounded-lattice theorem was identified. Main's existing EnhancedDerivedSheaves owns the enhancement direction; this change builds on it. The direct-summand and crystalline packages consume that direction rather than supplying its foundation. The ordinary regular-local overlap is R01. No collision of a retained fully qualified declaration name with a different readable roadmap was identified; mathematical duplication is still a defect even when namespaces differ.

Resolved supplier contracts included the following, against main rather than against a progress/revision pull request:

| Supplier | Resolved section evidence | Boundary checked |
| --- | --- | --- |
| BordismFormalGroups | `TauCetiRoadmap/BordismFormalGroups/README.md:1526`, :1546, :1823, :1944, :2005, F6.5 and its named sub-lanes | Generic categorical models, straightening and coherent diagrams are suppliers. The dg nerve and its cochain-sign comparison are the additional targets here. |
| DerivedModuleAlgebra | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:516`, :555, :626, :1403, :1573, :1666, :1693, :1733, :1788, :1808 | Koszul/K-injective/K-flat module constructions; ordinary towers, derived limits/Hom and completion are supplied. Ringed-site and mapping-space comparisons remain here. |
| SchemeAndStackFoundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3924–3932`, :3959–3993, :5643–5649 | §2.17 repleteness and its ordinary consequences; §2.18 DQCoh/affine/base-change; §4.13 regular/Cohen–Macaulay geometry. The roadmap does not make these pinned Lean imports legitimate. |
| PurityOfBranchLocus | `TauCetiRoadmap/PurityOfBranchLocus/README.md:162–200`; `Suggested.lean:146–150` | Existing ordinary regular-local supplier, omitted here: R01. |
| PerfectoidSpaces | `TauCetiRoadmap/PerfectoidSpaces/README.md`, P0.1–P0.2, P0.5–P0.15 and P7.16a (:17397) | Almost algebra and regular power-series input; not ownership of the enhanced category. |
| GeneralizedCohomology | `TauCetiRoadmap/GeneralizedCohomology/README.md`, G2.1–G2.7 and G3.8–G3.9 | Concrete spectra/module models and tower/completion operations, not the derived-category comparison theorem. |
| DGAInfinity; ProfiniteCohomology | Their main READMEs, Layers 0–1; Layers 0 and 10 respectively | Cochain grading/enrichment; discrete continuous modules and all-degree continuous cohomology. |
| AdicSpacesPartII; JacobianChallenge; StableReduction | Their main READMEs, R0.19.10; Layer C; Layer 2 respectively | Topos qcqs notions and scheme coherent cohomology. Algebraic-space proper-support extensions remain targets here. |

### Headline coverage

The README's headline families are: dg-nerve/mapping-space/sign comparison; presentable unbounded ringed-site enhancement with tensor–Hom and coherent functors; regular global dimension, Kunz and perfect-algebra Tor/projective-dimension bounds; saturated-lattice finite freeness; affine and proper-support comparisons; relative Kan extensions and adjoints; multiplicative tower filtrations and pro-isomorphisms; monadicity, Ind/presentability/duality and descendability; module-spectrum comparison; animated rings/modules/cotangent powers; replete Postnikov convergence and hyperdescent, especially perfect h-descent; and derived completion with coefficient reconstruction.

The regular/perfect algebra and elementary module-completion headlines are statable and represented. Saturated-lattice finite freeness is statable but missing (R02). Repleteness is represented using a forbidden roadmap import (R03). The genuinely enhanced families require quasicategorical derived sheaf categories, coherent diagrams, monoidal ∞-categories, spectra or animated carriers not supplied by the pins. The docstring identifies these broad missing carriers, but its catalogue must become an explicit headline-to-carrier account (R07). No weakened replacement theorem is required for them.

### Adversarial values

The following 168 rows are mathematical computations, not consequences of successful `sorry` elaboration. “Retain” means the displayed instance agrees with the statement under its hypotheses, not that it proves the general theorem. Cochain shifts use H^i(K[1])=H^(i+1)(K). Ordinary modules are in degree zero. A failed negative control is explicitly outside the hypotheses or the model being rejected.

| Statement / convention | Instances and computed values on the two sides | Result / change |
| --- | --- | --- |
| Full enhanced subcategory | P=true gives C in every degree; P=false gives no vertices and no simplices. | Both extremes correct; retain. |
| Weak contractibility | Point→point gives Map(*,Z)=Z; empty gives Map(∅,Z)=*, which differs for Z={0,1}. | Empty excluded; retain. |
| Finality | {1}→[1]: both undercategories are contractible; {0}→[1]: undercategory at 1 is empty. | Direction distinguished; retain. |
| Categorical vs homotopy-category equivalence | ℤ and ℤ⊕ℤε, degree(ε)=−1: both H⁰=ℤ, but mapping π₁ are 0 and ℤ. | H⁰ equivalence insufficient; retain. |
| Stable fibre/cofibre | Cone(id_K) has H*=0; Cone(0→K)=K; ΩΣK=K. | Signs/zero objects agree. |
| Stable exactness | In Ab, pushout of 0←ℤ→0 is 0, while a stable pushout is ℤ[1]. | Ordinary abelian category excluded. |
| Local smallness | A contractible large Kan model has small homotopy model *, irrespective of its number of simplices. | Homotopy type, not raw size; retain. |
| dg nerve differential | For a 2-simplex the equation is dη=gf−h; with η=0 choose h=gf. | Composition orientation fixed. |
| dg nerve inner horns | n=2, inner vertex 1: f₀₂=f₁₂f₀₁ and f₀₁₂=0 satisfy the equation. | Basic filler correct. |
| dg nerve H⁰ | For Hom=[ℤ→id ℤ], both H⁰ and homotopy classes are 0; raw degree-zero cycles need quotienting. | Boundaries not retained as morphisms. |
| dg nerve mapping spaces | Hom=ℤ[1] gives H⁻¹=ℤ and π₁=ℤ; Hom=ℤ[0] gives discrete π₀=ℤ. | Sign agrees in E0/E1. |
| Coherent-nerve comparison | Discrete degree-zero enrichment gives the ordinary nerve on both sides; the 2-simplex relation is h=gf. | Low-dimensional agreement; no general isomorphism inferred. |
| Shift/cone comparison | Cone(p:ℤ→ℤ) in degrees −1,0 has H⁻¹=0, H⁰=ℤ/p; rotation's last map is −p[1]. | Retain cochain sign. |
| CoCartesian sections | Constant diagram over [1]: coCartesian sections identify with C, arbitrary sections with Fun([1],C). | Edge condition essential. |
| Relative section transformations | Identity fibration BG→BG has one section over BG and only identity over-base transformations; arbitrary transformations can include Z(C₂)=C₂. | “Over identity” matters. |
| Filteredness | Point is filtered; empty fails existence; two discrete points have no common cocone. | Degenerate shapes discriminate. |
| Compact/presentable | In D(ℤ), ℤ is compact; identity of ⊕ℕℤ does not factor through a finite subsum. Terminal category is presentable and compactly generated by its object. | Presentability not confused with every object compact. |
| Presheaf presentation | C=* gives P(C)=Spaces; Map(y*,F)=F(*). | Yoneda value correct. |
| 0.1 enhanced category | Point site: A[0] has H⁰=A; A[1] has H⁻¹=A; acyclic complex maps to 0. | Supplied sample agrees. |
| 0.1 presentability | Filtered colimit of degree-zero modules has H⁰=colim M_i and H^j=0 for j≠0. | Exact filtered colimits give claimed compatibility. |
| 0.2 K-injective replacement | Zero complex has replacement quasi-isomorphic to 0; bounded-below injective resolution of ℤ has H⁰=ℤ and no other H. | Correct bounded/unbounded comparison. |
| IsKFlat / flat single | R[n]⊗A=A[n], so H^i=H^(i+n)(A)=0 for acyclic A. | Boundary case true; delete Lean padding, R04. |
| Non-K-flat free-term complex | Over ℤ/4, d=2 gives ker=im={0,2}; tensor 𝔽₂ gives d=0 and H^i=𝔽₂ for every i. | Termwise free is insufficient; README Check retained. |
| 0.3 tensor unit | R⊗ᴸK=K; RHom(R,K)=K, including K=0. | Unit normalization correct. |
| 0.3 derived tensor | (ℤ/p)⊗ᴸℤ(ℤ/p) has H⁻¹=H⁰=𝔽_p, others 0; ordinary tensor has only H⁰. | Tor term retained. |
| Koszul symmetry | Degrees 1,1 give (−1)^(1·1)=−1; in characteristic 2 this equals +1. | p=2 does not justify dropping the integral sign. |
| 0.3 Rlim | Constant identity tower K gives K; zero-transition tower gives fib(id)=0. | Correct 1−shift convention. |
| 0.3 ML comparison | ℤ/p^(n+1) has limit ℤ_p and lim¹=0. | Ordinary and enhanced projections agree. |
| Degreewise-surjective warning | K_n=[ℤ→ℤ/p^(n+1)]: H⁰=p^(n+1)ℤ, H¹=0; H¹(Rlim K_n)=ℤ_p/ℤ. | False vanishing would lose this term. |
| Singular derived reduction | 𝔽₂⊗ᴸ_(ℤ/4)𝔽₂ has Tor_i=𝔽₂ for every i≥0. | No finite Tor amplitude claimed. |
| 0.3 derived completion | Completion of ℤ is ℤ_p; completion of ℤ[1/p] is 0; 𝔽_p completes to itself. | Unit/conservativity hypotheses correct. |
| Reduction recovery | Derived reduction of 𝔽_p over ℤ has H⁻¹=H⁰=𝔽_p, with positive-Tor transition zero and H⁰ transition identity. Rlim=𝔽_p. | Full complexes recover the object. |
| Perfect tensor/limit interchange | P=ℤ^r[n]: both sides are (Rlim K_i)^r[n]; r=0 gives 0. | Perfect hypothesis supports interchange. |
| 0.4 adjunction | Identity site map gives id⊣id and both exchange maps id_K. | Sample correct. |
| 0.4 exchange direction | Self-square of Spec 𝔽_p over Spec ℤ: derived side has Tor₁=𝔽_p, ordinary fibre product does not. | Transformation is not an unconditional equivalence. |
| 0.4 composition | Two identity squares give id∘id=id; units/counits type the map g*Rf*→Rf′*g′*. | Direction and composition agree. |
| Slice-free sheaf | Point gives free module R; initial slice gives 0; terminal slice gives O. | Distinguishes local sections from arbitrary global sections. |
| Enriched complexes | Degree-zero cycles are chain maps; boundaries are null-homotopic maps. For [ℤ→id ℤ], id is a boundary. | Enrichment/H⁰ boundary correct. |
| Enhanced mapping complexes | Map(𝔽_p,𝔽_p[1]) has π₀=Ext¹=𝔽_p and π₁=Hom=𝔽_p. | H⁰ alone would lose π₁. |
| Grothendieck vs compact generation | For C_p with characteristic-p coefficients, H^n(C_p,𝔽_p)=𝔽_p in every n≥0. | No finite cohomological bound follows merely from presentability. |
| Point-site derived Hom | RHomℤ(𝔽_p,ℤ) has H⁰=0,H¹=𝔽_p; RHomℤ(ℤ[1/p],ℤ) has H¹=ℤ_p/ℤ. | Nonperfect/localization controls agree. |
| Pullback/pushforward | Identity gives id; extension ℤ→𝔽_p sends 𝔽_p to a complex with two nonzero cohomology groups. | Derived pullback essential. |
| Finite-cell coefficient rule | Over ℚ[C₂], sign representation has invariants 0, whereas ℚ-invariants of the unit tensor sign are sign. | A nontrivial action is not in thick(trivial unit); retain restriction. |
| Koszul realization | Empty list gives A[0]; single zero gives A in degrees −1,0 with d=0; regular x gives A/x in degree 0. | Reindexing and regularity correct. |
| Global regular bound | Field: pd=0; ℤ: pd(𝔽_p)=1; polynomial regular local ring: pd(κ)=d. | Sharp values; import local owner, R01. |
| Residue-field criterion | Dual numbers have dim=0 but pd(k)=∞; regular local polynomial ring has pd(k)=d. | Finite pd excludes singular case; duplicate target, R01. |
| Kunz forward | Frobenius on 𝔽_p[t] has free basis 1,t,…,t^(p−1), rank p; on 𝔽_p rank 1. | Correct for p=2,3. |
| Kunz converse | On k[ε]/ε² in characteristic p≥2, F(ε)=0 and Frobenius module is not flat. | Noetherian singular control rejected. |
| Frobenius-root ideal | f=0 gives J=0; f=1 gives J=R; in perfected k[t], t^(1/p)∈J_t but not (t). | Radical, not ordinary principal ideal. |
| Root membership | n=0 gives f∈(f); arbitrary n enters its own summand of the supremum. | Single-term proof; delete Lean theorem, R04. |
| Root flatness/idempotence | For J_t, t^(1/p^n)=(t^(1/p^(n+1)))^p∈J_t²; J_0²=0, J_1²=R. | Product equality correct; perfect reducedness matters. |
| Perfect Tor independence | Three perfect fields give Tor_i=0 for i>0; zero algebra gives 0 in all degrees. | Algebra-perfect hypotheses retained. |
| Perfect presentation Tor bound | m=0: flat polynomial perfection, Tor₁=0. For R=k[t^(1/p^∞)], B=R/√(t), M=R/(t), Tor₁(B,M)=(t)/t√(t)≠0 and Tor₂=0. | No m−1 off-by-one. |
| Perfect projective-dimension bound | Presentation P₀=k has d=0 and permits bound 1; a vector space actually has pd=0. | d+1 is an upper bound, not asserted equality. |
| Cohen/regular presentation route | k[[x]]/(x²) has a one-variable regular presentation but is not regular; k itself has a zero-variable presentation. | Presentation and quotient regularity not conflated. |
| Saturation map | Over a dense full-value valuation ring, Hom_V(𝔪,V)=V; for M=𝔪, Hom_V(𝔪,𝔪)=V while M=𝔪. | Principal ball saturated; open ball fails. |
| Discrete valuation negative control | 𝔪=(π), Hom_V(𝔪,V)≅V; the map from V becomes multiplication by π, not surjective. | Full-value hypothesis cannot be silently dropped. |
| Saturated lattice theorem | M=0⊂K⁰ gives n=0; M=aV⊂K, a≠0, gives n=1≤1; open ball excluded. | Missing statable headline, R02. |
| Quasicoherent enhancement | On Spec R, O maps to R[0]; ⊕ℕO is quasicoherent but not perfect. | Dqc and Perf distinguished. |
| Perfect base change | Perfect algebras: positive Tor=0, derived fibre product discrete; 𝔽_p self-product over ℤ has Tor₁=𝔽_p. | Perfectness/derived-square hypotheses matter. |
| H⁰ base change | K=𝔽_p[−1]: H⁰(K)=0 but H⁰(𝔽_p⊗ᴸℤK)=𝔽_p. | Naive H⁰ interchange excluded. |
| Affine tensor comparison | R⊗ᴸ_R M=M; 𝔽_p self-tensor gives H⁻¹=H⁰=𝔽_p on both affine descriptions. | Supplied ordinary tensor transported correctly. |
| Coherent proper support | ℙ¹_k,O has H⁰=k,H¹=0; affine line has H⁰=k[t], infinite-dimensional. | Proper support is essential. |
| Perfect proper pushforward | RΓ(ℙ¹,O(−2))=k[−1], perfect; identity on a singular ring does not turn its nonperfect residue field into a perfect object. | Relative/perfect input retained. |
| Finite-stage approximation | Polynomial t₃₇ in an infinite polynomial union appears at stage 37; a finite matrix uses finitely many variables. | Finite-presentation content has a finite stage. |
| Relative left Kan extension | {0}→[1], value d: extension has values d,d and transition id; empty diagram gives initial objects. | Under-category orientation correct. |
| Representability | On terminal category, represented functor has value *; the two-point-valued constant functor is not represented. | Wrong arbitrary functor excluded. |
| Adjoint criterion | Free/forgetful modules give Hom_R(R^(S),M)=Hom_Set(S,UM); identity adjunction yields identical mapping spaces. | Correct universal property. |
| Accessible localization | S=∅ gives C→C; in a stable category killing a generator yields zero localization. | Both boundary localizations correct. |
| Compact generation / coproducts | RHom(⊕ℕℤ,−)=∏ℕRHom(ℤ,−), whereas a finite sum gives a finite product and commutes with coproducts. | Compactness not inferred for infinite generator sums. |
| Ringed diagrams | Constant coefficient diagram with identity maps gives constant identity comparison; extension R→S sends the unit R to S. | Scalar/source targets fixed. |
| Mates | A right-adjoint comparison has mate in the opposite adjoint direction; identity mates are id, a reverse map *→∅ does not exist. | Direction is not arbitrary. |
| Cardinal-cutoff comparison | Identity inclusion of the same cutoff gives id on objects and mapping spaces. | Universe transport has a normalization. |
| Tower Milnor sequence | ×p on ℤ: lim=0, lim¹=ℤ_p/ℤ; constant identity ℤ: lim=ℤ, lim¹=0. | Nonzero derived limit retained. |
| Multiplication of lim¹ classes | Two filtration-one classes land in filtration two; for a tower lim²=0, so their product is 0. | Filtration bound gives stated vanishing. |
| Finite cohomological-dimension filtration | d=0 gives F¹=0; d=1 permits F¹ but F²=0. | Bound d+1, not d, is correct. |
| IsProZero | Zero transitions kill after one step, although each term can be ℤ; identity transitions never kill ℤ. | Definition discriminates wrong limit-only model. |
| p-multiplication tower | p=0: pro-zero; p=1: limit ℤ, not pro-zero; p=2,3,4: composites p^(m−n)≠0, limit 0. | README control true; Lean padding removed, R04. |
| Pro-isomorphism | 0→zero-transition ℤ-tower: kernel=0,cokernel pro-zero; 0→constant ℤ: cokernel not pro-zero. | Not levelwise isomorphism. |
| Cofinal reindexing | φ(n)=2n: zero composites remain zero; ×p composites become p^(2(m−n)), still nonzero. | Both directions agree. |
| proIso_comp / cancellation | Identity and a pro-isomorphism compose to it; zero-transition kernels/cokernels die after one step for f,g,gf. | True API; Lean states only composition, R05. |
| Stable pro-zero | Degreewise-escaping multiplication by powers of t in a graded ring may kill each fixed cohomological degree eventually while maps t^n remain nonzero. | Uniform stable null-homotopy is stronger. |
| Operadic algebras | Commutative monoid in sets has A(0)=*, A(2)=A²; multiplication/unit recover an ordinary commutative monoid. | Nullary operations retained. |
| Monoidal envelope | Commutative operad envelope has tensor on finite sets by disjoint union: sizes 0+2=2,1+1=2. | Unit and binary tensor agree. |
| Module/scalar extension | Mod_1(C)=C; A→A yields id; successive A→B→D extension gives D⊗_A M on both sides. | Associativity normalization correct. |
| Monoidal localization families | Over a point, family construction reduces to its fibre; inverting only identities leaves the category unchanged. | Fibrewise normalization correct. |
| Stable tensor | Cofibre of p on ℤ, then tensor 𝔽_p: cofib(0:𝔽_p→𝔽_p)=𝔽_p⊕𝔽_p[1]. | Tensor must preserve stable cofibres. |
| Idempotent completion | Retract of finite free module is finite projective; rank-zero projector gives zero, identity projector the full module. | Retracts, not only free objects, included. |
| Thick closure | thick(0)=0; thick(unit) contains finite sums/shifts/retracts of unit, not arbitrary infinite sums. | Finite generation restriction correct. |
| Barr–Beck | Identity adjunction gives identity monad and its algebra category C. | Conservativity/realization inputs normalize correctly. |
| Ind comparison | Ind(FinSet)=Set; sifted completion PΣ(FinSet)=Spaces, containing non-discrete K(ℤ,1). | Ordinary Ind is not animation. |
| Presentable limits | Empty limit is terminal category; product C×D has componentwise colimits. | Limit conventions correct. |
| Spectra/stabilization | Stabilization of a stable C returns C; stabilization of terminal category is zero. | Stability distinguished from mere pointing. |
| Tensor of presentables | Spaces⊗C=C; for stable C, Sp⊗C=C. | Units correctly separated. |
| Object inversion | Inverting unit changes nothing; forcing zero to be tensor-invertible collapses a stable category to zero. | Degenerate inversion correct. |
| Verdier quotient/Ind | C/0=C; C/C=0; Ind of these gives Ind(C) and 0 respectively. | Quotient boundaries agree. |
| Group actions | Trivial G-action gives Fun(BG,C), not C; G=C₂ or S₃ retains its group-action data. | Nonabelian control retains conjugation/action laws. |
| Homotopy fixed points | C_p,𝔽_p: H^n=𝔽_p for all n≥0; rational coefficients give H^n=0 for n>0. | No unconditional fixed-point compactness. |
| Compact morphisms | Identity of a finite-dimensional vector space factors through a finite stage; identity of ⊕ℕk does not. | Noncompact identity excluded. |
| Dualizable categories | D(R) has dual D(R^op); zero category has dual zero; for commutative R the first is D(R). | Opposite-ring convention visible. |
| Filtered Perf comparison | A finite idempotent matrix and its relations occur at one common finite stage; infinite unrelated coefficients need not. | Finite data hypothesis tested. |
| Descendability index | Identity algebra has zero fibre and index≤1; index 0 would require id_A=0, hence A=0. | Zero-th tensor power not omitted. |
| Completion versus descendability | ℤ_p→𝔽_p: fibre inclusion is ×p, its n-fold tensor gives ×p^n≠0, although completion recovers ℤ_p. | Infinite totalization does not imply finite index. |
| Nilpotent descent | ε²=0 gives fibre-square multiplication 0; nilpotence orders tending to infinity give no common finite exponent. | Uniform colimit hypothesis necessary. |
| Module-spectra comparison | Unit HR has π₀=R,π_i=0 for i≠0, matching R[0]; suspension has π₁=R matching R[1]. | Changed convention correct. |
| Spectral tensor | H𝔽_p⊗_(Hℤ)H𝔽_p has π₀=π₁=𝔽_p, matching degrees 0,−1 in D(ℤ). | No ordinary tensor substitution. |
| Concrete completion comparison | Tower H(ℤ/p^n) has π₀ limit ℤ_p, other π=0; derived reductions of H𝔽_p retain the extra π₁ before taking the limit. | Unit and transition data agree. |
| Siftedness | Empty category fails nonempty condition; two discrete objects have off-diagonal pairs not in diagonal image; point is sifted. | Basic controls discriminate. |
| Animation | Finite free commutative rings retain discrete π₀; PΣ of finite sets includes higher spaces. | Not ordinary Ind. |
| Animated pushout | 𝔽_p⊗ᴸ_(𝔽_p[t])𝔽_p has π₀=π₁=𝔽_p. | Ordinary fibre product loses π₁. |
| Animated Frobenius/perfection | Positive homotopy is killed under Frobenius in characteristic p; the above pushout perfects to discrete 𝔽_p. | Perfect colimit is discrete here. |
| Imperfect base | For a root t^(1/p), δ=t^(1/p)⊗1−1⊗t^(1/p) has δ^p=0 but δ≠0 before perfection. | Reduced/perfect hypotheses matter. |
| Witt vectors | Constant 𝔽_p: π₀W=ℤ_p. For 𝔽_p⊗ᴸ_(𝔽_p[t])𝔽_p, π₁W=∏ℕ𝔽_p, whereas W of π₀ alone has π₁=0. | Ring structure distinguished. |
| Bounded totalization | Normalized object k[2] in cosimplicial degree 2 gives Tot₁=0 and Tot=k[0]; its termwise homotopical bound is b=2, not 0. | Cutoff must reflect the bound. |
| Animated vs E∞ commutativity | Over 𝔽₂, spectral symmetric square has group homology H_n(C₂,𝔽₂)=𝔽₂ for all n≥0; ordinary polynomial algebra is discrete. | No characteristic-zero equivalence used at p=2. |
| Animated modules | Unit module over the derived self-intersection has π₁=𝔽_p, matching the animated ring. | Ordinary discrete modules insufficient. |
| Replete slices | Set over a two-point set is Set×Set; inverse limits and epi projections compute componentwise. | Slice statement correct. |
| Replete cover descent | Empty→* is not epi; its slice cannot test repleteness of Set. Identity cover gives the original predicate. | Epi hypothesis essential. |
| Replete equivalence | Identity equivalence preserves the same inverse sequences/projections; products of equivalent components give the same epi condition. | Transport has no new data. |
| Relative epi limits | Tail sets F_n={m≥n}→* are individually onto but lim F_n=∅. Their successive transitions are not epi. | Required tower hypothesis prevents counterexample. |
| Countable epi products | Products of surjections of sets are surjective by countable choice; a factor ∅→* fails surjectivity and makes the product fail. | All-factor hypothesis necessary. |
| Rlim amplitude in replete topoi | Module towers in degree 0 have H only in 0,1; ×p on ℤ gives nonzero H¹=ℤ_p/ℤ. | Upper bound 1 is sharp. |
| Postnikov completion adjunction | K=ℤ[1], L₀=ℤ: RHom(K,L₀)=ℤ[−1], RHom(τ≥0K,L₀)=0, but both mapping spaces are contractible. | Mapping spaces needed; source proof issue below. |
| Left completeness | K=ℤ[3]: truncation stages n=0,1,2 are 0, stages n≥3 are ℤ[3]; Rlim=ℤ[3]. | Negative cohomological degrees tested. |
| Postnikov Milnor computation | For each m∈ℤ, H^m stabilizes at n≥max(0,−m); eventual constant tower has lim¹=0 and lim=H^m(K). | All integers, not only nonnegative m. |
| Cohomological-bound convergence | Bound b=0: degree m=0 requires eventual stage ≥1 in the displayed estimate; m=−3 shifts it to ≥4. | Negative-degree shift retained. |
| Weakly contractible object | In Set every surjection onto U splits (choice), hence Γ(U,−) exact; for C_p invariants, augmentation ℤ[C_p]→ℤ has image pℤ on invariants. | Terminal object of BG need not be weakly contractible. |
| Nonabelian weak-contractibility control | For S₃ the invariant augmentation has image 6ℤ, not ℤ. | Failure is not restricted to cyclic groups. |
| Locally weakly contractible | G-sets have covering free G-sets, whose equivariant sections are ordinary set sections; this does not make the terminal G-set projective. | Local/global distinction retained. |
| Hypercover matching | Čech nerve of {0,1}→* has 4 elements in degree 1; constant two-element simplicial set has only 2 and misses off-diagonal matching pairs. | Matching epimorphism discriminates. |
| Cartesian coefficient datum | Identity Čech datum uses identity pullbacks; assigning ℤ→ℤ² as a required equivalence fails since ranks 1≠2. | Effectivity is not for arbitrary diagrams. |
| Derived hypercover descent | Identity hypercover gives Tot(const K)=K; split two-point cover gives the same K by its extra degeneracy. | Bounded/unbounded normalization correct. |
| Space Postnikov convergence | K(ℤ,n) truncates to * below n and remains K(ℤ,n) at/above n; limit is K(ℤ,n). | Space assertion separate from additive left completeness. |
| Perfect h-topology | Identity is a cover; ∅→nonempty X is not a cover. | Surjectivity retained. |
| Inductive level | Proper fppf identity has level 0; a blowup uses its exceptional closed locus for the inductive step. | n=0 does not use natural subtraction n−1. |
| Geometric descendable maps | Identity fibre=0; finite split cover algebra has a unit retraction; nilpotent ε² quotient has square-zero fibre multiplication. | Standard generating cases agree. |
| Noetherian h-cover descent | Identity h-cover gives index≤1; no claim of a universal index across all covers. | Quantifier order retained. |
| Derived-scheme base change | Self-intersection of t=0 in Spec 𝔽_p[t] has π₁=𝔽_p; perfecting the base situation removes positive Tor. | Derived and ordinary products separated. |
| Perfect h-cover bound | A fixed approximation carries one finite exponent; a family with exponents 1,2,3,… has no uniform bound. | Filtered-colimit hypothesis necessary. |
| Boundedness detection | Pullback along identity detects all degrees; projection to one component of X⊔Y loses arbitrary unbounded data on the other component and is not a cover. | Cover hypothesis essential. |
| Dqc/Perf h-descent | Split cover of a perfect field returns D(k) and Perf(k); infinite direct sum k is in the former but not the latter. | Two category statements distinct. |
| Tensor/totalization | Constant cosimplicial N=R: both sides are M; normalized degree-one R: both sides are M[−1]. | Bounded totalization cases agree. |
| Finite-dimensional-base hyperdescent | Base a perfect field has presentation dimension 0; identity hypercover returns every unbounded K unchanged. | Does not claim all perfect rings have finite global dimension. |
| Derived complete predicate | I=0: 1−0·shift=id, every module complete; I=R: f=1 yields noninjective 1−shift on any nonzero constant sequence. | Unit ideal admits only zero. |
| Generator criterion | (p,p²) and (p) give same localization-orthogonality condition; empty generating list for 0 imposes none. | Finite generators and empty case agree. |
| Complete limits | ∏ℕℤ_p is complete; ⊕ℕℤ_p is not: y_n=e_n forces infinite support in x₀. | Limit versus coproduct distinguished; R04. |
| Completion reflector | L_pℤ=ℤ_p; L_pℤ[1/p]=0; L_p0=0. | Localization kernel and unit correct. |
| Complete colimits | Colim(ℤ_p→pℤ_p→p⋯) in ambient modules is ℚ_p; its completed colimit is 0. | Reflector needed for colimits. |
| Koszul completion | Generator 0 gives K⊕K[1] with transitions id on K and zero on extra summand; Rlim=K. | Ordinary termwise quotient would miss the finite stages. |
| Regular ideal powers | I=(x,y), I²=(x²,xy,y²), whereas (x²,y²) omits xy. Both quotients have Tor amplitude within [−2,0]. | Powers not equated to generator-wise powers. |
| Adic vs derived completeness | ℤ_p is both complete and separated; ℤ⊂ℤ_p is separated but not complete. For p=3, recurrence y_n=1 would force x₀=−1/2. | Separation alone insufficient. |
| Weak Serre property | ×p:ℤ_p→ℤ_p has kernel 0,cokernel 𝔽_p, both complete; submodule ℤ is not complete. | Kernels/cokernels between complete objects, not all subobjects. |
| Completeness on cohomology | ℤ_p[1] has H⁻¹=ℤ_p and is complete; ℤ[1] has H⁻¹=ℤ and is not. Nonnegative cohomology is zero in both. | All integer degrees are essential. |
| Nonseparated complete module | In the displayed cokernel construction, the class of e₀ is nonzero but belongs to p^nM for every n. | Derived completeness does not imply separation; keep as README Check. |
| Completed Hom | RHom(R[1],L)=L[−1]; for complete L this is complete. | Shift sign and local completeness agree. |
| Completed tensor | 𝔽_p completed-tensored over ℤ with itself still has H⁻¹=H⁰=𝔽_p. | Completion does not discard Tor. |
| Coefficient systems | System ℤ/p^n has Rlim=ℤ_p; naive constant 𝔽_p system fails derived transition equivalence over ℤ/p² because Tor_i=𝔽_p. | Derived compatibility excludes wrong system. |
| Reduction functor | Red(ℤ_p)_n=ℤ/p^n; Red(0)_n=0. | Correct target and unit. |
| Reconstruction functor | Rec(ℤ/p^n)=ℤ_p; zero system reconstructs 0. | Limits remain complete. |
| Reconstruction counit | ℤ_p⊗ᴸℤℤ/p^k=ℤ/p^k; for I=(x,y), quotient by I² is still perfect despite three generators. | No false “I^k regular sequence” shortcut. |
| Reconstruction unit | ℤ_p→lim ℤ/p^n is iso; ℤ[1/p]→0 is not, and ℤ[1/p] is not complete. | Completeness hypothesis essential. |
| Completed coefficient sheaf | On a profinite test set, continuous maps to ℤ_p can be non-locally-constant, whereas sections of the constant discrete sheaf are locally constant. | Completed sheaf need not be constant. |
| Derived Nakayama | Complete K with K/p=0 gives K=0; ℚ_p/p=0 but ℚ_p≠0 and is not complete in this sense. | Conservativity restricted correctly. |
| Animated derivations | Polynomial B=A[t], M=B[1]: derivation space has π₁=B; ordinary degree-zero derivations alone see 0. | Higher homotopies necessary. |
| Cotangent comparison | Dual numbers in characteristic ≠2 have differential 2ε: H⁻¹=(ε),H⁰=k; characteristic 2 gives zero differential and both groups B. | Characteristic-sensitive formula retained. |
| Cotangent universal property | A→A has L=0 and contractible derivations; A[t] gives free rank-one L and Map(L,M)=underlying space of M. | Zero and polynomial tests agree. |
| Animated exterior powers | Rank-one free degree-zero module has Λ²=0 even at p=2; shifting it invokes divided powers, nonzero in every weight. | Integral décalage, not rational symmetric-power shortcut. |
| Final enhancement compatibility | Units R[0]/HR have only π₀=R; regular quotient by p has the same two-term resolution and the same derived self-Tor on each route. | Comparison preserves unit, shifts and nontrivial Tor. |

## Not verifiable

- The source service supplied legal text for the seeded sample and the other referenced works requested during this review; no seeded source was inaccessible. No missing-text waiver is requested.
- General headline proofs are not certified by the admitted Lean file. The table records explicit instances and negative controls, not proofs of all general assertions.
- The non-seeded locators throughout this 2,983-line README were not all independently certified against their sources. Source certification here is the four-section seeded sample, the changed spectral locator, the saturated-lattice theorem, and the stated BS-proet proof passages. Object searches across the supplied open work are evidence of ownership, not a claim that every statement in every open roadmap was reviewed.

## Source issues

- **Error** in bs-proet at Lemma 3.3.2 proof, printed p. 18 (`bs-proet` line 844): the source says adjacent Postnikov-stage derived Hom complexes agree by truncation adjunction; it should be an equivalence of mapping spaces, not unrestricted derived Hom complexes; affects the proof.
- **Error** in bs-proet at Proposition 3.3.3 proof, printed p. 19 (`bs-proet` lines 875–888): the source says the cohomology product equals its tail and tests only nonnegative degrees; it should retain the prefix or pass cofinally, and test all integer degrees with stabilization n≥max(0,−i); affects the proof.

# Review of ArithmeticGaloisDuality (pull request #858 at 0f301e0)

**Verdict:** needs changes

The previous review was checked first, finding by finding:

| Previous finding | Passage at this head | Resolution |
| --- | --- | --- |
| R01, supplier ownership/order | README:122–124 names `TauCeti.profiniteOrder`; README:234–260 imports the function-field divisor/product-formula and class-group inputs. | Partly repaired. Those ownership defects are repaired. The dependency gate still fails on four reported edges; R03 below distinguishes its output from the actual owners on main. |
| R02, TeX/style scanner | The formulas use Unicode and code spans; the supplied gate reports `latex=0 tex=0`. | Repaired. |
| R03, compact-support bounds | README:329–336 specifies “Under `(P)`, for finite `S`” and the relevant coefficient restrictions. | Repaired; real dyadic negative cohomology and the `(P)` case were tested separately below. |
| R04, KW Lemma 4.6 locator | README:7112: “Lemma 4.6, statement p. 43, proof pp. 43–45.” | Repaired. The source really has that statement and proof there. R01 below concerns the mathematical input, not that repaired locator. |
| R05, undeclared API/Check names | README:39–40 says the other interfaces “are not declarations of that file.” | Not repaired: that disclaimer conflicts with the required README/Lean naming convention. See R04. |

Locations below are in `TauCetiRoadmap/ArithmeticGaloisDuality/` unless a different repository-relative path is given. Source line references identify the line-numbered extractions obtained through the sources service; they are not quotations.

## R01 (P1) — The relation bound assumes its essential obstruction-theoretic input

**Location:** README.md:7103–7114: “If a presentation … comes with an injection … then the number of defining relations is at most” the dual-Selmer dimension.

**Claim:** The roadmap promises Khare–Wintenberger relation bounds, but its only target and proof route assume the injection that proves the bound. None of this target's three named prerequisites constructs it. The conditional dimension inequality is true; it does not supply the promised relation theorem. This is an unowned prerequisite, not a request to formalize a deformation ring inside `Suggested.lean`.

**Witness:** `khare-wintenberger-2` lines 2032–2045: the presentation is minimal relative to the local deformation ring; Lemma 4.6 constructs an injection into the **dual** of the dual-Selmer group and proves injectivity.

**Repair:** State a target constructing the obstruction pairing for the actual minimal relative framed presentation and proving that its adjoint `Hom_k(J/𝔪J,k) → H¹_{L⊥}((ad⁰)*(1))^∨` is injective. Name the owner of the universal/local lifting data it needs, or make that construction a target here. Then deduce the relation bound. A citation to KW is the proof source, not an owner for missing library work. Preserve the true adjoint dual in characteristic two.

**Repair test:** When the dual-Selmer dimension is zero, the constructed injection must give `J/𝔪J = 0`, hence zero minimal relations by Nakayama. With dimension one it gives at most one relation. The existing conditional statement only gives these conclusions *after* assuming the missing injection. Replacing the codomain by its dual preserves both dimension tests and matches the source pairing.

## R02 (P2) — A statable function-field headline is omitted

**Location:** README.md:4596–4611, “Function-field central obstruction localization”; Suggested.lean:28–43 and the function-field namespace at line 210.

**Claim:** The README owns injectivity of localization in degree two for finite prime-to-characteristic coefficients with constant Tate dual. This theorem is absent from the acceptance test. It does not need an idele-class or Selmer-complex carrier: the existing function-field Sha theorem already uses its exact native localization kernel and coefficient dual.

**Witness:** The pinned `ContinuousCohomology.tateShafarevich` is the intersection of localization kernels (Mathlib `RepresentationTheory/Homological/ContCohomology/Sha.lean:71`). `TauCeti.Place.Completion` and `completionEmbedding` exist at `FieldTheory/FunctionField/Place/Completion/Basic.lean:41,49`.

**Repair:** Add the general finite-coefficient theorem asserting that this actual degree-two Sha group is a subsingleton, assuming a positive annihilator `n`, `IsUnit (n : F)`, and trivial action on `TauCeti.InternalHom G M (TauCeti.KummerCoeff F n)`. Use the same function-field completions and restriction adapter as `GlobalFunctionField.sha_duality`. The constant-module, roots-of-unity formulation is its corollary. Do not replace it by an arbitrary injective map or a free proposition.

**Repair test:** A 27-line scratch signature with exactly these native carriers, explicit continuity and field hypotheses, and this conclusion elaborated with only its `sorry` warning. For `F = 𝔽₇(t)` and `M = ℤ/3`, its dual is constant and both `Ш¹(F,Mᴰ)` and `Ш²(F,M)` are zero. This does **not** assert that `H²(F,M)` is zero: classes with nonzero local invariants still exist. The zero module gives the same subsingleton conclusion.

## R03 (P2) — The required dependency gate still fails on four existing-main owners

**Location:** README.md:1556, 2170, 3657, 4338 and the dependency lines listed below.

**Claim:** The worker gate has `depcheck=4` and fails. Acceptance is disallowed while it fails. These four diagnostics are not evidence that this roadmap actually depends on new, later versions of those roadmaps: the cited owners already exist on main.

**Witness:** Main has `TauCetiRoadmap/AlgebraicCurves/README.md:1102`, `TauCetiRoadmap/ClassFieldTheory/README.md:920`, `TauCetiRoadmap/RepresentationTheory/ModularInduction/README.md:37`, and `Completed/PolynomialGaloisGroups/README.md`. These are existing roadmap objects, not new supplier folders.

**Repair:** Reconcile the worker's dependency classification with these existing-main owners and rerun the gate. Retain citations to the main contracts; do not introduce an upward dependency on their open revisions, duplicate their targets, or move their theory here to silence the diagnostic. No tooling or order file was changed during this review. This finding records a failed mandatory check and its concrete false-positive evidence; it does not allege a mathematical supply cycle.

**Repair test:** Resolving each of these four citations to its existing main folder must eliminate its `UPWARD` diagnostic. The final gate must pass. Merely moving ArithmeticGaloisDuality below an open ClassFieldTheory revision does not test or fix this classification problem.

## R04 (P3) — API and Check names still claim undeclared Lean counterparts

**Location:** README.md:954 (`CompactCoefficients.continuousHomRepresentation`), 3244–3263 (`PoitouTate.beta_apply` and related names), and the disclaimer at 39–40.

**Claim:** Numerous own API names remain backticked although `Suggested.lean` does not declare them. The required form reserves such names for actual declarations; API bullets and Checks otherwise use prose. The disclaimer does not change that rule.

**Witness:** Suggested.lean has eleven headline theorems, five named supporting definitions and two anonymous instances; neither cited API family occurs among those declarations. The resolver's 144 leads include these independently confirmed examples.

**Repair:** Rewrite undeclared own API/Check names as mathematical prose, preserving their statements and discriminating examples. Retain exact names for pinned declarations, supplier declarations, and the acceptance test's actual declarations. Do not expand `Suggested.lean` into an API catalogue.

**Repair test:** The continuous-Hom action remains `(g·f)(x)=g·f(g⁻¹x)`, and the restricted-product localization still evaluates at each place, without claiming new Lean declarations. Resolve the remaining own backticked names against the file after rewriting.

## R05 (P3) — Two sampled source attributions need narrower, accurate locators

**Location:** README.md:3275–3277, “before Lemma 7.6, p. 28”; README.md:6841–6843, KW §§4.1.4–4.1.6 and Paškūnas–Quast §1.4.2/Lemma 13.22.

**Claim:** The available Harpaz–Wittenberg v2 text does not define restricted products or `Шʳ_S` before Lemma 7.6; its proof uses an all-place Sha group. KW §4.1.4 starts on printed page 39, not 41. The cited Paškūnas–Quast passages concern deformation dimensions and local cohomology, not the general matrix trace-pairing criterion.

**Witness:** `harpaz-wittenberg-massey` lines 1180–1219; `khare-wintenberger-2` lines 1873–1919; `paskunas-quast` lines 308 and 3124. The actual restricted-product definitions are in `milne-adt` lines 2074–2103.

**Repair:** Keep Milne I.§4, p. 55 for restricted products and the localization kernel. Remove the unnecessary HW attribution or give an exact locator and version supporting the asserted object. Cite KW §4.1.4, pp. 39–40 for the characteristic-two cohomological boundary, and the named adjoint supplier/pinned trace-form declarations for the general matrix algebra. Do not attribute that algebra to PQ's unrelated passages. The linked HW author-final text could not be retrieved, so no claim is made about a numbering difference in that inaccessible version.

**Repair test:** The cited material must distinguish the direct sum (zero distinguished subgroups) from the full infinite product. For trace-zero matrices, it must give radical `k·Id` for `n=2` over `𝔽₂` and radical zero over `𝔽₃`. Both calculations remain correct after these citation changes.

## Verified sound

The review read the entire README and acceptance test, the previous review, the normative repository README and CONTRIBUTING, and main-roadmap examples ProfiniteCohomology, ClassFieldTheory and HeightsAndUnits. The head matches `0f301e0`; there are no changes outside the assigned folder in the PR diff and the review left the worktree unchanged. This is an extension of ProfiniteCohomology's excluded coefficient/spectral-sequence directions, not a replacement plan for that roadmap. The README retains equal-characteristic, real-place and dyadic cases. No computational algorithm, copied source passage, sorry'd data or `set_option` was found.

### Gate and elaboration

The worker's gate reports zero for every check except `depcheck=4`, including `build=0`, `stray-files=0`, `outside-folder=0`, `sorry-data=0`, `latex=0` and `tex=0`. The independently run dependency check prints:

```text
not movable: ArithmeticGaloisDuality consumes ClassFieldTheory (#258) and is consumed by SelmerIwasawaCohomologyPartII (#169), which comes first: moving ArithmeticGaloisDuality after ClassFieldTheory would put a supplier after a consumer, a cycle through ArithmeticGaloisDuality
UPWARD: ArithmeticGaloisDuality (#44) -> AlgebraicCurves (#226) at README lines [2170, 2849]
UPWARD: ArithmeticGaloisDuality (#44) -> ClassFieldTheory (#258) at README lines [1556, 1584, 1821, 2228, 2271, 2415]
UPWARD: ArithmeticGaloisDuality (#44) -> PolynomialGaloisGroups (#210) at README lines [4338, 4634]
UPWARD: ArithmeticGaloisDuality (#44) -> RepresentationTheory (#185) at README lines [3657, 3679, 4634]
depcheck: 164 roadmaps, 1183 edges, 4 problem(s)
```

The numbers in this output are order positions. R03 explains the four classifications; the preliminary “cycle through” sentence is not an independently established cycle of mathematical contracts.

The targeted build `lake build TauCetiRoadmap.ArithmeticGaloisDuality.Suggested` completed successfully (9019 jobs). Direct `lake env lean` elaboration of the acceptance test also passed with only eleven `sorry` warnings. A scratch copy with `#check @name` for all sixteen named declarations and checks of the two generated instance signatures elaborated successfully. Needed hypotheses, including the explicit joint-action continuity in rationalisation and the finite/exponent/invertibility hypotheses of Sha duality, remain in the resulting types. No signature repair was needed.

A scratch one-tactic pass tried `simp`, `rfl`, `infer_instance` and `exact?` against all eleven admitted theorems. None closed. Reading their pinned inputs likewise found no theorem that simply restates one definition or computes a boundary value. This is evidence against padding, not a proof of the eleven statements.

### Headline inventory

The README's eight-layer headline table includes: inverse-limit and rationalisation comparisons; continuous extensions and unbalanced products; Hochschild–Serre/transgression and Laurent residue; restricted ramification/Hermite/global finiteness and class formations; Poitou–Tate, Sha duality, Euler characteristics, Grunwald–Wang, character roots and torus duality; derived coefficient/local/global duality, compact support, lattice duality, abelian-variety duality and local-condition mapping fibres; Greenberg–Wiles; adjoint/first-order comparisons; and Taylor–Wiles/KW auxiliary-prime and dimension theorems. The explicitly owned function-field central-obstruction application is included in this inventory.

The eleven acceptance statements are rationalisation (line 59), Hermite finiteness (92), finiteness of `H¹` (100), finiteness in every degree (109), global Euler characteristic (119), high-degree real-place restriction (136), number-field Sha duality (181), the Grunwald–Wang order-two alternative (203), function-field Sha duality (217), function-field Tate vanishing (240), and first-order lift/cocycle comparison (257). The docstring names the missing carriers for the remaining spectral-sequence, idele, derived, Selmer and Frobenius headlines. R02 is a counterexample to the claimed missing-carrier justification. The algebraic trace criterion was also tested for statability, but ArithmeticGaloisRepresentations §7.2 already supplies its underlying adjoint quotient/kernel theory; duplicating that supplier in this file is not the repair.

### Pinned objects and ownership

The following pinned declarations/definitions were opened, rather than inferred from names. Paths in this table are relative to the named library's source root.

| Library and file:line | Object read and conclusion |
| --- | --- |
| Mathlib `RepresentationTheory/Continuous/TopRep.lean:31` | `TopRep` does not itself supply joint continuity of `G × M → M`; rationalisation correctly carries that hypothesis explicitly. |
| Mathlib `RepresentationTheory/Homological/ContCohomology/Sha.lean:71,84,90` | Actual localization kernel, kernel of the product map, and membership criterion; supports R02 without a new Sha carrier. |
| Tau Ceti `Topology/Algebra/Group/Profinite/Section.lean:230` | Continuous section of a closed-subgroup quotient; a topological section, not an additive splitting. |
| Tau Ceti `Topology/CompactOpen.lean:43` | Compact source/discrete target gives discrete compact-open mapping space. It does not say that the pointwise topology on an infinite dual is discrete. |
| Tau Ceti `FieldTheory/GaloisCohomology/Coefficients.lean:125,164` | `KummerCoeff` is roots of unity in additive notation; comparison with `ZMod n` requires the invertibility hypotheses. |
| Tau Ceti `Topology/Algebra/GroupAction/InternalHom/Basic.lean:350` | Evaluation for the actual equivariant internal Hom; the Tate twist is supplied by its coefficient target. |
| Tau Ceti `NumberTheory/ClassFieldTheory/Local/Duality/FiniteModule.lean:253,260,267` | Bijective local duality maps in degrees 0, 1, 2 for finite discrete coefficients killed by an invertible exponent. These are consumed, not new targets. |
| Tau Ceti `Algebra/Lie/GeneralLinear/TraceForm.lean:126,148` | Matrix trace form and its nondegeneracy; does not make its trace-zero restriction perfect in characteristic dividing the rank. |
| Tau Ceti `Algebra/Lie/GeneralLinear/Basic.lean:269,279` | Trace-zero ideal and membership; no replacement submodule is needed. |
| Tau Ceti `RingTheory/DedekindDomain/SInteger/Unit.lean:105` | Multiplicative unit valuation has exponent minus the additive order; the S-unit examples keep that sign. |
| Tau Ceti `FieldTheory/FunctionField/Divisor/ProductFormula.lean:258` | Principal divisor degree zero. |
| Tau Ceti `FieldTheory/FunctionField/RiemannRoch/AffineClassNumber.lean:107` | Finite affine ideal class group; existing function-field input. |
| Tau Ceti `FieldTheory/FunctionField/Place/Completion/Basic.lean:41,49,60` | Completion, embedding and valuation compatibility, used by the native function-field signatures. |
| Mathlib `LinearAlgebra/BilinearForm/Basic.lean:151` and `LinearAlgebra/BilinearMap.lean:376` | Restriction/composition of native bilinear maps; the matrix restriction can be stated without opaque data. |

Ownership searches used `roadmaps grep` by objects (continuous coefficients, compact cochains, duality, adjoints, Selmer groups and class formations), `roadmaps show` for suppliers at the supplied heads, the board package index, and the pinned sources. The following 23 supplier groups were resolved; line numbers refer to the cited repository's README, not the tool's output wrapper.

| Supplier | Contract resolved |
| --- | --- |
| ProfiniteCohomology | Layers 1–12: discrete coefficients, explicit maps, exact sequences, Shapiro and cup products; its exclusions permit the extension here. |
| DerivedModuleAlgebra | §0.2 (line 626), §1.T.1 (1403), §§1.1/1.3/1.5 (1573/1733/1808), §§1.M.1/1.M.2/S.1 (2242/2290/2316): derived tensor, towers, restriction of scalars and spectral sequences. |
| PerfectoidTowers | §P9.0 (1855–1912): continuous-cochain comparison, including action continuity. |
| NoncommutativeAndEquivariantIwasawa | §F.3 (1713–1721) supplies the general discrete/compact Hochschild–Serre inputs; §F.4 (1756 onward) supplies the number-field Selmer-fibre input. General coefficients are not restricted to finite torsion there. |
| IntegralIwasawaTheory | §2.0 (274), §§10.0–10.1 (1304/1324): finite arithmetic duality and tower/dyadic fibre inputs. |
| PadicPeriodRings | §§0.1–0.2: procyclic cohomology in the stated coefficient categories. |
| ArithmeticGaloisRepresentations | §4.7 (3097), §5.13 (3484), §7.2 (4197–4228), §§7.6–7.7 (4600/4754): residual adjoints, function-field Chebotarev, true adjoint dual, Tate vanishing and finite-group input. |
| SchemeAndStackFoundations | §§2.7, 2.15, 2.18, 2.21: supports, étale Galois comparison, derived tensor and duality. |
| EnhancedDerivedSheaves | §E1.8.DMA.1 (888): affine derived-module comparison. |
| EtaleCohomologyFoundations | §F.0.A0 (330) and A2 (368): field Galois cohomology and arithmetic exact sequences. |
| AdelicAlgebraicGroups | §§1.1–1.2/1.5 and §3.4 (3072): torus adelic topology and finite class sets. |
| AbelianSchemesAndArithmeticModuli | §A2.2: dual abelian varieties/Picard inputs, consumed before arithmetic Ext duality. |
| AlgebraicModuliForArithmeticGeometry | The named moduli/derived arithmetic inputs, rather than a second moduli construction here. |
| PadicLocalLanglandsForGL2Qp | §0.5: multiplicity theory; the maximal-ideal Hilbert–Samuel expression here is its specialization. |
| HeightsAndUnits | §4.2 (418 onward) and §4.3: fundamental units, rank and the unit-system interfaces. |
| EllipticCurves | Layer 7 (1264 onward) explicitly starts with a **general discrete Galois-module** Selmer structure; this is not merely elliptic-curve torsion. |
| GlobalNumberFields | Layers 1 and 6–8 (253,433,453,470): approximation and idele/ray-class inputs. |
| NumberFieldArithmetic | Existing completed roadmap; algebraic-number-field arithmetic inputs, not its open revision. |
| Chebotarev | Existing completed roadmap, Layer 10; number-field Frobenius/detection input. |
| AlgebraicCurves | Main Layer 12 (1085), especially 12B/closed-point places (1102–1114): projective-model input exists. |
| ClassFieldTheory | Main Layers 5–7 and 10–13 (920,1220,1312,1552,1683,1724,1799). Its scope excludes the Grunwald–Wang/function-field extensions owned here. |
| RepresentationTheory/ModularInduction | Main Layers 0, 1 and 4; modular representation Grothendieck groups and modular Artin input. The decomposition map is not already owned by that scope (37–42). |
| PolynomialGaloisGroups | Existing completed roadmap for the cited permutation-group input. |

No actual duplicate fully qualified acceptance-test name was identified. Existing generic tensor/tower/cochain machinery is imported; this roadmap owns the arithmetic comparisons, topological coefficient variants and general local/global duality stated in its scope. In particular it does not take a dependency on its later SelmerIwasawaCohomologyPartII consumer. Ownership searches covered readable supplied open heads; remote-only package entries without supplied files were not certified. Resolver warnings were treated as leads: the four genuine main owners above and mathematical notation were not reported as missing declarations.

### Seeded source sample

All fifteen requested targets were checked against the available text, or explicitly marked unreadable. The sample contains thirteen targets for which relevant readable primary text was inspected; NSW-dependent parts of two targets remain uncertified. A readable alternative/pinned theorem does not certify an unread NSW locator. No README locator explicitly labelled unverified was found.

| Sampled target | Text, locator and result |
| --- | --- |
| Continuous sections of coefficient surjections | NSW I.§1, Exercise 4, p. 11 could not be read from the fetched landing-page extraction. The pinned quotient-section theorem was read; the finite example below confirms “section” need not mean module homomorphism. |
| Connecting map is cup with torsor class | [Harpaz–Wittenberg v2](https://arxiv.org/abs/1904.06512v2), Lemma 5.5, p. 19, `harpaz-wittenberg-massey` lines 830–842. The cochain identity supports the roadmap's pointwise-Hom formulation; the source's unqualified discrete-Hom formulation has the continuity gap recorded below. |
| Finitely generated C: discrete case | Same Lemma 5.5 plus the finite-generator argument: evaluation on finitely many generators gives an open stabilizer. The extra finite-generation hypothesis repairs the cited discrete setting; the infinite direct-sum counterexample below separates it. |
| Continuous Hom from a profinite source | [Milne ADT](https://www.jmilne.org/math/Books/ADTnot.pdf), conventions, `milne-adt` lines 168–173, supports the continuous dual convention. NSW II.2.4.4, p. 114 remains unread. The pinned compact-open discreteness theorem supplies the topological distinction. |
| Unbalanced cochain products | [Kaletha v5](https://arxiv.org/abs/1304.3292v5), §4.3, pp. 19–20, `kaletha-rigid` lines 889–946. Inequalities `i > j′ ≥ j > 0`, the quotient-indexed sum and `(-1)^i` are retained. |
| Reindexing fundamental S-units | [Milne ANT](https://www.jmilne.org/math/CourseNotes/ANT.pdf), p. 85 and Theorem 5.11, p. 90, `milne-ant` lines 3817–3822,4038–4050. Free unit exponents modulo torsion justify reindexing; a finite-index generating subset is not a fundamental system. |
| Galois group G(K,S) | ADT I.§4, p. 48, `milne-adt` lines 1823–1839. Arbitrary S with the specified archimedean convention; finiteness theorems separately require finite S. |
| S-idele classes as quotient | ADT Proposition 4.3, p. 50 and Lemma 4.4, p. 51, `milne-adt` lines 1892–1939. The quotient construction is supported; the proof's finite/cofinite slip is not copied. |
| Unramified exact annihilators | ADT Theorem 2.6, pp. 30–31, `milne-adt` lines 1191–1214. The residue-characteristic invertibility hypothesis is retained; the p-primary counterexample below explains why. |
| Restricted products and Sha(S) | ADT I.§4, p. 55, `milne-adt` lines 2074–2103, supports the construction. The additional HW attribution does not support that construction in the readable version: R05. |
| Tate global Euler characteristic | ADT Theorems 5.1/5.3 and Corollary 5.4, pp. 67,69–70, `milne-adt` lines 2499–2533,2587 onward. Ordinary archimedean invariants, rather than Tate H⁰, occur in the formula. The source's remark has the dual-denominator slip below. |
| Function-field central obstruction | [Wood](https://par.nsf.gov/servlets/purl/10152050), Lemma 3.2 and proof, published p. 389, `wood-moments` lines 471–490. The proof uses constant dual plus Chebotarev and Sha duality; prime-to-characteristic is essential to this route. R02 concerns its missing acceptance statement. |
| Continuous cochains in derived category | [Nekovář](http://www.numdam.org/item/AST_2006__310__1_0/), §§3.4.1–3.4.2, 3.5.4–3.5.6, 3.6.2, 4.4.1/4.4.6, `nekovar-sc` lines 3344–3400,3570–3595,3675–3719,4098–4102,4155–4173. The distinctions between low-degree comparison, cohomological-dimension bounds and m-primary coefficients are retained. Jannsen Proposition 2.2, pp. 215–216, `jannsen-cet` lines 318–343, supplies the ML comparison. |
| Trace-zero adjoint duality | [KW II](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), §4.1.4, pp. 39–40, `khare-wintenberger-2` lines 1873–1919, supports the true-dual/trace-boundary issue. The general matrix computation is correct; the other listed locators overreach: R05. |
| Group-theoretic Taylor–Wiles input | [DDT](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), Theorem 2.49 proof, pp. 83–84, `ddt` lines 3080–3117. Odd prime, residual irreducibility and the distinction between the full projective group and its PSL subgroup matter. The small-group computation below tests the smallest odd case. |

### Computed adversarial pass

The 141 rows below record explicit values, not a claim that elaboration proves mathematics. `0` denotes the zero group; its cardinality is `1`. Finite-field dimensions are over the displayed field. Each row compares the intended object/formula with a degenerate case, an opposite convention or a plausible wrong model. API consequences of the same construction are tested with their construction. “Retain” means that these instances do not refute the stated hypotheses; it does not certify inaccessible sources.

| Statement / construction | Instances and values on the two sides | Result / change |
| --- | --- | --- |
| Coefficient towers / derived inverse limit | Reduction tower ℤ/pⁿ: lim=ℤₚ, lim¹=0. Multiplication-p tower ℤ: lim=0, lim¹=ℤₚ/ℤ. Ordinary lim alone misses the second value. | Retain derived term. |
| Tate inverse-limit comparison | G=1 and constant identity tower M: H⁰=M=lim M; higher H and lim¹ are 0. The multiplication-p tower has nonzero derived-limit term as above. | Retain ML hypotheses. |
| Continuous sections of coefficient surjections | ℤ/4→ℤ/2 has section 0↦0,1↦1, but s(1+1)=0 whereas s(1)+s(1)=2. A section of z↦z² on the circle would have 2·degree(s)=1. | Section is topological; profiniteness matters. |
| Exact cochains / lifting | A continuous map from compact ℤₚ to discrete ℤₚ has finite image; identity into adic ℤₚ has infinite image. Identity short exact sequences with actual continuous section lift every cochain. | No arbitrary-topology lifting. |
| Lattice boundedness | f(x)=x on ℤₚ has image in ℤₚ; on ℚₚ its valuations are unbounded below. For T=0 all cochains are 0. | Compact source is used. |
| Rationalisation headline | G=ℤₚ, trivial T=ℤₚ: H¹(T)⊗ℚₚ=ℚₚ=H¹(ℚₚ). T=𝔽ₚ gives V=0 and both rationalized sides 0. | Retain torsion lattices. |
| Quotient V/T and connecting map | G=C₂ acting by −1 on ℤ₂: Tᴳ=Vᴳ=0; (V/T)ᴳ=C₂ and H¹(G,T)=C₂, with connecting map an isomorphism. | Do not drop torsion boundary. |
| Pointwise Hom | Hom(ℤ,A)=A; Hom(ℤ²,A)=A²; Hom(0,A)=0. Hom(⊕ℕ𝔽₂,𝔽₂)=∏ℕ𝔽₂ with pointwise topology, not discrete. | Correct finite-generator distinction. |
| Splitting torsor | C₂ acts unipotently on 𝔽₂²: the section of the trivial quotient has γ(σ)=1; the equivariantly split extension has γ=0. | Zero torsor excluded. |
| Connecting map is cup with torsor | In that unipotent example, δ(1)(σ)=1 and γ(σ)·1=1; in the split example both are 0. | Sign/order retained. |
| Finitely generated C | C=𝔽₂, A=𝔽₂ gives Hom=C₂ discrete. C=⊕ℕ𝔽₂ gives the infinite product above; its zero point is not open. | Discrete-source claim needs its stated restriction. |
| Continuous Hom from profinite source | P=∏ℕC₂, A=C₂: continuous characters form ⊕ℕC₂. Compact-open topology is discrete; pointwise neighborhoods leave nonzero characters vanishing on finitely many test vectors. | Distinguishes the two topologies. |
| Completed tensor | ℤₚ ⊗̂ ℤₚ=ℤₚ; modulo pⁿ both sides are ℤ/pⁿ. Zero factor gives 0. | Retain completion and continuity. |
| Factor sets and continuous extensions | C₂ by C₂: zero factor set gives C₂²; the carry cocycle gives C₄. A changed section adds a coboundary, leaving the extension class fixed. | Nontrivial class distinguished. |
| Schreier classification | H²(C₂,C₂)=C₂: two central extension classes; split iff class 0. Automorphisms of a fixed split extension over kernel/quotient are Z¹(C₂,C₂)=C₂. | Correct class vs automorphism distinction. |
| Unbalanced cochain product | Δ=C₄→Θ=C₂, i=2,j=1: choose an F₂-valued homogeneous indicator selecting one quotient element and g=1. Quotient sum=1; summing its two lifts in Δ gives 0. | Quotient indexing is essential. |
| Hochschild–Serre | C₂⊂C₄ with F₂: H¹(C₄)=F₂, while the two E₂ degree-one terms each have dimension 1; nonzero d₂ removes the extra class. H=1 leaves one row. | No automatic degeneration. |
| HS degeneration | Split product C₂² over F₂ has dim Hⁿ=n+1, the sum of its n+1 bidegrees; trivial quotient has one column. | Retain the stated degeneration conditions. |
| Five-term sequence | C₄/C₂ over F₂: inflation H¹(C₂)→H¹(C₄) is iso, restriction is 0, transgression H¹(C₂)→H²(C₂) is iso. | Exactness checked in both middle terms. |
| Transgression sign | For C₉→C₃ and section 0,1,2, the carry at (1,2) is 1; the negative-carry transgression is −1=2 in F₃. | Positive sign would fail. |
| Restriction/corestriction | Index 2 with F₃: cor∘res=2, invertible. With F₂ it is 0. | Index-invertibility cannot be suppressed. |
| Norm/transgression evaluation | Trivial action of C₃ on A: N(a)=3a; for A=F₃ this is 0, for A=ℤ it is 3a. | Finite-cyclic and procyclic formulas separated. |
| Compact inflation–restriction | G=ℤₚ, H=pℤₚ, T=ℤₚ: restriction on H¹ is multiplication p, image pℤₚ and kernel 0; H¹(Cₚ,ℤₚ)=0. | Topological coefficient retained. |
| Supplied procyclic H¹ | H¹(ℤₚ,ℤₚ)=ℤₚ; H¹(ℤₗ,ℤₚ)=0 for l≠p. H¹(ℤₚ,Fₚ)=Fₚ. | No coefficient-independent formula. |
| Laurent residue | F_q((t)): prime-to-q Brauer residue identifies the corresponding Q/ℤ-primary parts; with algebraically closed residue the prime-to-characteristic residue term is 0. Artin–Schreier p-classes are not covered. | Equal characteristic distinguished. |
| Multiplicative/pro-p completion | Completion of ℤ is ℤₚ; C₂ completes to C₂ at p=2 and 0 at p=3; ℚ and ℚₚ/ℤₚ have zero pro-p completion. | No replacement by algebraic double dual. |
| Global-unit completion | ℚ units={±1}: completion C₂ at 2 and 0 at odd p. Real quadratic rank-one units give one ℤₚ factor. | Rank-zero and torsion separated. |
| S-unit cardinality and valuation | ℚ, S={2,3,∞}: rank 2; units modulo cubes have order 9, modulo squares order 8. Multiplicative valuation of 2 at 2 has exponent −1. | Correct torsion/sign. |
| Reindex fundamental systems | Swapping units 2,3 swaps exponents (a,b) to (b,a). Units 4,3 generate index 2 in the free exponent lattice, so are not another fundamental system. | Rerender names only, R04. |
| S-unit completion | ℚ, S={2,∞}: one ℤₚ factor plus primary roots of unity. In ℚ(√−5), the prime over 2 has order 2 in the class group, giving valuation image 2ℤ. | Valuation image need not be all ℤ. |
| Finite Galois localization | At a complex place positive cohomology is 0; at a real place with C₂ coefficients H²=C₂. Zero coefficients give 0 at both. | Real places cannot be discarded. |
| G(K,S) | ℚ, S={∞}: no nontrivial everywhere-unramified finite extension. S={2,∞} admits ℚ(i), ℚ(√2), ℚ(√−2), but not ℚ(√3), discriminant 12. | Ramification predicate discriminates. |
| Hermite headline | Degree bound 0: empty family. Bound 1: only ℚ. Bound 2 and S={2,∞}: ℚ and exactly the three quadratic fields above. | Finiteness is substantive. |
| H¹ finiteness headline | ℚ, S={2,∞}, trivial F₂: H¹ has order 4. With all finite primes allowed there are infinitely many quadratic characters. Zero coefficients give cardinality 1. | Finite S is necessary. |
| Modified archimedean groups | Real F₂: Tate groups C₂ in every degree. Complex places: modified groups 0. Real trivial F₃: ordinary H⁰ has order 3, Tate H⁰ has order 1. | Two archimedean conventions kept distinct. |
| Function-field places/divisors | In F_q(t), div(t)=(0)−(∞), degree 1−1=0. A degree-d irreducible polynomial defines a place of degree d. | Unweighted sum would fail. |
| Function-field restricted ramification | F_q(t), S={∞}: yᵖ−y=t is permitted; yᵖ−y=1/t ramifies at 0 and is not. Constant-field extensions give quotient Ẑ. | Wild extensions retained. |
| Function-field local input | F₇((t)), n=3: H¹(μ₃) has order 9, H²(μ₃) order 3. Artin–Schreier H¹ in characteristic 7 is infinite. | Prime-to-characteristic restriction genuine. |
| Function-field class formation | Idele degree maps to ℤ; constants reciprocity completes it to Ẑ, leaving quotient Ẑ/ℤ before completion. | Number-field surjectivity not copied. |
| S-ideles and units | ℚ, S={∞}: C_S=ℝ_{>0}; S={2,∞}: units {±2ᵐ}. S=all places gives the ordinary idele class construction. | Correct quotient and units. |
| S-idele quotient | In ℚ(√−5), the nonprincipal ideal over 2 has order 2; after adjoining i it becomes generated by 1+i. Its class becomes 0 in the directed system. | Colimit class-group obstruction vanishes. |
| P-class formation | G=ℤₚ, trivial C=ℤ: H²=ℚₚ/ℤₚ, not all ℚ/ℤ. G=Ẑ gives ℚ/ℤ. Index-one fundamental class is 0. | Prime support retained. |
| S-class reciprocity | For ℚ, S={∞}, the connected C_S has trivial profinite quotient; S={2,∞} has maximal exponent-two quotient C₂². | Completion is not identity on C_S. |
| S-unit Kummer | ℚ, S={2,∞}, n=2: unit square classes have order 4 and the S-class group is 0; H¹(μ₂) has order 4. n=1 gives all groups 0. | Exact sequence tested. |
| Relative/absolute Sha | Identity extension has relative cohomology 0. An all-place degree-zero kernel is 0 since restriction on invariants is injective. An S-only kernel need not vanish outside S. | No false S-to-all-place identification. |
| Cyclotomic power kernel | ℚ, n=8, outside T={2}: 16 gives order-two kernel since 16²=2⁸. n=2 has zero obstruction. | Genuine dyadic exceptional class. |
| Exponent-two ramification fields | ℚ with S={2,∞}: degree 4. Adding 3 gives independent square classes −1,2,3, hence degree 8. | Missing prime changes rank. |
| One-prime quadratic input | (17/41)=−1=(41/17); quadratic reciprocity agrees. Adding the dyadic place allows independent classes −1 and 2. | No uniform odd-prime shortcut. |
| Antiunit rank | A conjugate split pair contributes one anti-invariant unit direction: vector (a,−a), dimension 1; three independent pairs contribute dimension 3. | Linear-algebra check only; Maire locator uncertified. |
| No Zₚ extension away from p | At a finite l≠p, the pro-p residue-unit quotient has order p^{v_p(l−1)}: finite, so Hom to ℤₚ is 0 although Hom to Fₚ can be nonzero. | Torsion characters do not give Zₚ extensions. |
| Continuous/abstract comparison | Finite G: all maps are continuous, so complexes coincide. For ℤₚ, continuous Hom to discrete ℤₚ is 0, whereas to adic ℤₚ it is ℤₚ. | Topology cannot be forgotten. |
| Ext of discrete modules | G=1: Ext¹_ℤ(ℤ/2,ℤ)=C₂, but H¹(G,Hom(ℤ/2,ℤ))=0. | Derived coefficient Ext is required. |
| Class-formation duality | G=Ẑ,C=ℤ: invariant H²=ℚ/ℤ; on n-torsion pairing 1 with 1 gives 1/n. Multiplying the invariant map by n kills that value. | Normalization excludes zero/rescaled map. |
| Kummer descent | μ₃ is ramified at 3 over ℚ, but unramified away from 3. μ₁=0. | S must include coefficient primes. |
| Tate dual/bidual | M=ℤ/3 trivial: Mᴰ=μ₃ with cyclotomic action, not the trivial dual over ℚ. Evaluation on generator/primitive root is 1 mod 3; double evaluation returns the generator. | Twist retained. |
| Local finite pairing | F₇((t)), n=3: H¹ has dimension 2; unramified line dimension 1 and its annihilator dimension 1. A dual basis pairs to 1/3; reversing degree-one inputs gives −1/3. | Nonzero normalization and sign. |
| Archimedean local duality | Real M=F₃ trivial: ordinary invariants dimension 1, Tate invariants 0. Real M=F₂: Tate dimension 1 in each degree, pairing 1·1 maps to 1/2. | Odd and dyadic cases differ. |
| Unramified annihilators | Over ℚₚ, p odd, M=ℤ/p: unramified line has dimension 1. μₚ has no inertia invariants, so its unramified H¹ is 0, but annihilator of the first line has dimension 1. | Residue-prime exclusion essential. |
| Restricted products / Sha(S) | Infinite index set with distinguished 0: finite-support direct sum; distinguished full groups: full product. Finite index set: both equal finite product. | R05 citation repair; definition sound. |
| Localization properness/finiteness | Fixing ramification S={2,∞} and order 2 gives the four quadratic characters above; allowing arbitrary extra ramification gives infinitely many. | Finite ramification input used. |
| Pontryagin duality | C₃ dual=C₃, ℤₚ dual=ℚₚ/ℤₚ, and the latter's dual is ℤₚ. Evaluation 1 on 1/p is 1/p. | Discrete/compact topologies distinguished. |
| Dual restricted products | Single F₇((t)), n=3: P¹ and its dual both have order 9; P⁰ and P² both order 3. Zero module gives order 1 in all degrees. | Complementary degrees 2−r. |
| Ext/S-idele coefficient comparison | G=1 and ℤ/2 coefficients give Ext¹(ℤ/2,ℤ)=C₂, not 0; zero coefficients give 0. | Cannot replace derived Hom by ordinary Hom. |
| Poitou–Tate nine terms | ℚ, S={3,∞}, M=ℤ/3: P⁰=C₃ and global H⁰→P⁰ is iso. An extra ordinary real H⁰ would add a spurious C₃. | Modified localization required. |
| All-degree finiteness headline | ℚ, S={2,∞}, F₂: for r≥3, Hʳ=C₂. Zero module: cardinality 1. Infinite S: H¹ infinite. | Finiteness does not mean high-degree vanishing. |
| Cohomological dimension | ℚ,S={2,∞}: Hʳ(F₂)=C₂ for arbitrarily high r, so cd₂=∞. For odd p, the real p-primary terms vanish and cdₚ≤2. | Dyadic real exception retained. |
| H² onto selected local factors | ℚ,S={2,∞},T={∞},μ₂: Hamilton algebra has invariants 1/2 at 2 and ∞, giving surjection onto C₂. ℚ,S=T={3,∞},μ₃: global H²=0 but local H² at 3=C₃. | Omitted finite place is necessary. |
| High-degree S-unit cohomology | Real ℂ×: odd positive cohomology=0 by Hilbert 90, even Tate cohomology=C₂. Its odd-primary parts are 0. | Both parity conditions tested. |
| Explicit PT cochain sign | deg α=1, dβ′=α′: d(α∪β′)=−α∪α′; d(β∪α′)=α∪α′. Their required signed combination is a cocycle; the unsigned alternative has differential 2α∪α′. | Sign distinguished at p=3. |
| Decomposition map / rational Artin | S₃ at p=3: decomposition rows (1,0),(0,1),(1,1) span ℤ². Cyclic induction vectors (2,1),(1,2) have determinant 3, spanning only after rationalization. | Integral and rational claims differ. |
| Euler-characteristic normalization | Real sequence μ₂→μ₄→μ₂: ordinary cohomological Euler ratios are 1,1/2,1; archimedean-normalized ratios are all 1. | Raw ratio not multiplicative here. |
| Tate Euler headline | ℚ,S={3,∞}: ℤ/3 has H⁰,H¹,H² orders 3,3,1, ratio 1=3/3; μ₃ has orders 1,3,1, ratio 1/3=1/3. | Distinguishes module from its dual. |
| Totally imaginary Euler check | ℚ(i), S above 2, F₂: dimensions (1,2,0), ratio 2/4=1/2; formula gives 2^{−[F:ℚ]/2}=1/2. | Complex degree contribution correct. |
| Function-field PT | F₇(t), μ₃: local Brauer invariants 1/3 at 0 and −1/3 at ∞ sum to 0, yielding a global class; a single nonzero invariant cannot be global. | Sum-of-invariants map nonzero. |
| Finite compact support | ℚ,S={3,∞},F₃: compact-support dimensions in degrees 0–3 are (0,0,1,0); real F₂ instead has nonzero modified terms in negative degrees. | Dyadic truncation invalid. |
| Function-field Euler | F_q(t), S={∞}, constant F_l with l≠char: prime-to-characteristic quotient gives H⁰=H¹=F_l,H²=0, ratio 1. | Euler is 1, not number-field degree factor. |
| All-place Sha duality headlines | ℚ, μ₂ and dual ℤ/2: everywhere-local square/character kernels are 0; paired Sha groups are both 0. Same for F₇(t), μ₃ with constant dual. | Zero case compatible; R02 extracts a substantive application. |
| Grunwald–Wang alternative headline | ℚ,n=8,T={2}: generator 16 has v₂=4 mod 8 and order 2 in the power kernel. T empty gives kernel 0; n=2 gives kernel 0. | Both permitted cardinalities occur. |
| Purely inseparable transfer | F₂(u)/F₂(t), u²=t, exponent 3: transfer under the identified Galois groups raises Kummer classes to degree 2; u corresponds via restriction inverse to t², whereas norm(u)=t. | Degree factor cannot be omitted. |
| Exact character prescription | At 2, unramified order-eight character sends 16=2⁴ to −1; obstruction is nontrivial. Order-sixteen character squared gives the needed order-eight local character. | Exact order-eight prescription fails, doubled order repairs. |
| Character roots / real obstruction | A real involution has square 1 under every character, so its nontrivial quadratic character has no character square root. The quadratic character of ℚ(√5) does have a quartic root via ℚ(ζ₅). | Real condition matters. |
| Totally real base change | ℚ(√3) is real and split at 13 since 4²≡3; it is quadratic at 2 and differs from ℚ(i). | Simultaneous local and avoidance conditions compatible. |
| Tate vanishing, trivial coefficients | Function-field headline gives H²(F_q(t),ℚₚ/ℤₚ)=0 for p≠char. In contrast H²(F_q(t),μ_{p∞}) has Brauer classes with invariants ±1/p. | Tate twist cannot be erased. |
| Local torus modification | T=G_m: at ℝ, points modulo norms are {±1}=C₂; at ℂ modified points are 0. | Ordinary real points are not the modified carrier. |
| Completed all-place torus sequence | T=G_m over a number field: reciprocity targets G_F^{ab}; over a function field the degree direction is ℤ→Ẑ with cokernel Ẑ/ℤ. | Number-field restriction retained. |
| Torus quotient topology | ℤ→Ẑ has dense image with closure all Ẑ but image not closed. Quotient by the image and by its closure differ. | Closure in adelic realization is necessary. |
| Torus Sha duality | G_m has H¹(F,G_m)=0 and Sha²(F,ℤ)=0 by character detection. A cyclic norm-one torus has Sha¹=0 by Hasse norm. | Split and nonsplit cyclic controls. |
| Function-field central obstruction | F₇(t), A=C₃: dual constant, Sha¹=Sha²=0; Brauer class with invariants ±1/3 remains nonzero in H². A=0 gives kernel 0. | Add native headline, R02. |
| Derived tensor | (ℤ/2)⊗ᴸ(ℤ/2) has H⁻¹=C₂,H⁰=C₂; ordinary tensor has only H⁰. Tensor with ℚ kills both. | Tor term retained. |
| Perfect amplitude | k[ε]/ε² with residue k has Tor_i(k,k)=k for all i≥0, so k is not perfect; the ring itself has amplitude [0,0]. | Finite generation alone insufficient. |
| Derived limit comparison | Multiplication-p tower ℤ: Rlim has H⁰=0,H¹=ℤₚ/ℤ. Constant identity tower M has H⁰=M,H¹=0. | Derived and ordinary limit separated. |
| Grothendieck local duality | R=ℤₚ: H¹_m(R)=ℚₚ/ℤₚ, Matlis dual R. Dimension-zero R=k[ε]/ε² has dualizing module R in degree 0. | Shift follows dimension. |
| Derived composite spectral sequence | G=1, Hom(ℤ/2,−) on ℚ/ℤ gives C₂; applying Hom again is not explained by degree-zero composition without the required acyclicity. Ext¹(ℤ/2,C₂)=C₂ is the obstruction. | Acyclicity restriction retained. |
| Adic continuous functions / flatness | C(ℤₚ,ℤₚ)/p is C(ℤₚ,Fₚ); finite-free rank d tensor gives d copies. Infinitely many basis directions can approach 0 p-adically without lying in an algebraic direct sum. | No arbitrary infinite tensor interchange. |
| Hilbert–Samuel normalization | ℤₚ has length R/p^{n+1}=n+1, e=1. k[[x,y]] has length (n+1)(n+2)/2, e=1. Quotient by x has intrinsic e=1 but ambient degree-two coefficient 0. | Ambient/intrinsic dimensions separated. |
| Universal coefficients | C₂: H²(C₂,ℤ)=C₂ and H¹(C₂,ℤ)=0, whereas H¹(C₂,F₂)=F₂ comes from the torsion term after coefficient change. | Ordinary tensor alone misses it. |
| Künneth | C₂² over F₂: H² dimension 3=1+1+1, not just the two factor H² dimensions. | Cross term required. |
| Admissible coefficients | Infinite direct sum of trivial ℤₚ modules has scalar action image ℤₚ, finitely generated; zero module has zero image. A discontinuous finite-valued character still fails the continuity requirement. | Finite action image alone is insufficient. |
| Continuous cochains in derived category | G=ℤₚ,T=ℤₚ: H¹=ℤₚ with adic coefficients, 0 after imposing discrete topology on the same torsion-free group. H⁰ is ℤₚ in both. | Category/topology matters beyond invariants. |
| Compact Hochschild–Serre | Open subgroup index d gives finite quotient and d cosets. Closed subgroup of infinite index gives infinitely many cosets; finite coinduction-rank argument no longer applies. | Extra admissibility not automatic. |
| Local cohomology finiteness | ℚₚ, odd p, trivial ℤₚ: H⁰=ℤₚ, H¹=ℤₚ², H²=0. Finite p-quotient has dimensions (1,2,0). | Finite generation, not finiteness of lattice groups. |
| Compact Shapiro | H=G gives identity. For H=1 in G=Cₚ, coinduced Fₚ has dimension p and H¹(G,coind Fₚ)=0; a single trivial Fₚ instead has H¹(G,Fₚ)=Fₚ. | Actual coinduction carrier needed. |
| Coefficient base change | Finite-free rank d gives Hⁱ(M⊗R Rᵈ)=Hⁱ(M)ᵈ; d=0 gives 0. Localization kills p-torsion but preserves a rank-one free module. | Flatness/perfectness restrictions respected. |
| Local invariant and trace | H²(ℚₚ,μ_{p∞})=ℚₚ/ℤₚ; invariant of normalized generator of p-torsion is 1/p. At real places odd p gives 0, p=2 gives C₂. | Cannot drop dyadic trace. |
| Derived local duality | Degree 0 pairs with degree 2; ℚₚ lattice H⁰=ℤₚ pairs with H²(ℚₚ,ℚₚ/ℤₚ(1))=ℚₚ/ℤₚ. Shift 1 would pair with the wrong rank. | Shift 2 tested. |
| Cup-duality symmetry | Degree-one basis pair has value 1/3; exchanged inputs give −1/3=2/3. For p=2, −1/2=1/2. | Odd-prime witness fixes otherwise invisible sign. |
| Compact-support cone | A=B=k[0], restriction id: Cone(id)[−1] has all cohomology 0. Restriction 0: H⁰=k,H¹=k. | Source, target and differential fixed. |
| Compact-support cup product | Degree-one global input contributes local sign −1; degree-zero contributes +1. Over F₃ these are 2 and 1. | Same Leibniz convention as PT. |
| Global trace | H³_c(ℚ,S,ℚₚ/ℤₚ(1)) maps to ℚₚ/ℤₚ; a local invariant 1/p contributes 1/p, not 0. | Trace normalization nontrivial. |
| Derived Poitou–Tate | Shift 3 pairs H²_c(F₃) with H¹(μ₃); for ℚ,S={3,∞}, both have dimension 1. Pairing in shift 2 would instead hit H⁰(μ₃)=0. | Shift distinguished. |
| Localization of coefficients | ℤₚ→ℚₚ sends Fₚ cohomology torsion to 0 and rank-one free cohomology to ℚₚ. | Derived tensor has the expected two behaviors. |
| Coefficient-field dimensions | Extending Fₚ to F_{p²}: local trivial-module dimensions remain (1,2,0) over the coefficient field but become (2,4,0) over Fₚ. | No mixed logarithm normalization. |
| Dyadic real compact support | Real F₂ has Tate groups F₂ in every degree, including negative degrees. The induced regular C₂-module has all Tate groups 0. | Nonzero versus acyclic real term. |
| Compact-support Euler | ℚ,S={3,∞},F₃: global additive Euler=1−1=0; local 3 Euler=1−2=−1; support Euler=0−(−1)=1. | Matches H²_c dimension 1. |
| Lattice/rational PT | Local ℚₚ H¹(ℤₚ)=ℤₚ² becomes ℚₚ²; global ℚ,S={p,∞} trivial H¹ gives one ℤₚ, then one ℚₚ. | Finite-level/rational ranks agree. |
| Abelian Ext | Elliptic E: Hom(E,G_m)=0 and Ext¹(E,G_m)=E∨; the zero abelian variety gives both 0. | Torus Hom is not abelian Ext. |
| Local abelian duality | Multiplication by n prime to residue characteristic has equal finite kernel and index on local points; p-primary multiplication includes the analytic determinant factor. | Finite-level perfectness is not cardinal equality for p-isogenies. |
| Isogeny measure | One-dimensional local analytic group over ℚₚ: derivative [p] has absolute determinant p⁻¹, giving index/kernel ratio p; [n], p∤n, gives ratio 1. | Nonunit derivative distinguished. |
| Perfect pairings | F₃² with dot product: x-axis annihilator=y-axis, double annihilator=x-axis. Multiplication by 3 on ℤ has zero mod-3 pairing and is not perfect. | Nondegeneracy is substantive. |
| Local-condition menu | Strict L=0 has annihilator all H¹; relaxed L=H¹ has annihilator 0. Unramified line in a two-dimensional local space has dimension-one annihilator. | Strict and unramified are different. |
| Annihilator involution | Finite dimension d: dim L⊥=d−dim L. For the ordinary bilinear pairing ℚₚ×ℚₚ→ℚₚ, annihilator of ℤₚ is 0 and double annihilator is ℚₚ, not ℤₚ. | Correct duality category/closure matters. |
| Parametric mapping fibres | Fibre(id:k[0]→k[0])=0; fibre(0) has H⁰=k,H¹=k. An unspecified map admits both answers. | Map and homotopy compatibility necessary. |
| Degree-zero local-condition correction | Adding k[0] with zero map leaves the image in local H¹ unchanged but adds one k to the fibre's H¹. | Selmer subgroup alone does not determine complex. |
| Unramified local error | Prime-to-p unramified cohomology factors through procyclic residue Galois group, H²=0. Integral p-torsion errors can survive before rationalization and become 0 afterward. | Keep integral error object. |
| Ordinary dual line | In k², line ke₁ has annihilator ke₂∨; choosing ke₁∨ gives pairing 1, not 0. | Dual line and Tate twist retained. |
| Greenberg–Wiles | ℚ,trivial Fₚ, all unramified local conditions, p odd: Selmer and dual Selmer both 0, ratio 1; global factor p and real correction 1/p give 1. | Archimedean correction essential. |
| Greenberg–Wiles dimensions | Over F_{p²}, log_p of a group of k-dimension d is 2d, not d. Dimension formula over k removes that factor on both sides. | Coefficient convention checked. |
| Changing one local condition | Relaxing a one-dimensional unramified line in a two-dimensional local space has quotient dimension 1; dual tightening changes the complementary dimension by 1. Zero change gives quotient 0. | Exact growth bound, not automatic growth. |
| Rank-one arithmetic numerics | Nontrivial even quadratic character of ℚ(√2), p=3: unit eigenspace rank 1; odd quadratic character has unit rank 0. | Parity alters Euler/dimension contribution. |
| Trace-zero adjoint duality | n=2,F₂: rad=k·Id dimension 1. n=2,F₃: rad=0. n=1: ad⁰=0 and its zero pairing is perfect. | Correct criterion; R05 only locator. |
| First-order lift headline | (1+εc(g))ρ(g)(1+εc(h))ρ(h) has ε-coefficient c(g)+g·c(h); equality to the lift of gh gives exactly the cocycle equation. ε²=0. | Actual representation, not arbitrary scalar identity. |
| Fixed-determinant quotient | SL₂(F₂): dim ad⁰=3,H⁰=1,Z¹=3,B¹=2,H¹=1; full ad has dimensions 4,1,3,3,0. Trace connecting map kills the extra fixed-determinant class in the relevant quotient. | Dyadic boundary cannot be omitted. |
| Taylor–Wiles local count | Regular nonscalar 2×2 Frobenius has trace-zero centralizer dimension 1; scalar Frobenius has dimension 3. For q≡1 mod p, local H¹ dimension 2 and unramified dimension 1. | Regularity indispensable. |
| Group-theoretic TW input | SL₂(F₃), order 24, on ad⁰: H⁰=0,Z¹ dimension 3,B¹ dimension 3,H¹=0. PGL₂(F₃)=S₄ has PSL₂(F₃)=A₄ of index 2. | Small odd case and full-group distinction checked. |
| Archimedean adjoint dimensions | n=2, char≠2, c=diag(1,−1): invariant trace-zero dimension 1; scalar c gives 3. At p=2, unipotent c has invariant dimensions 2 on both ad and ad⁰. | Ordinary invariants, not Tate dimensions. |
| Dual-Selmer killing | One-dimensional dual Selmer, evaluation 1 at one prime: kernel 0. Evaluation 0 at one prime: kernel k. Empty prime set kills exactly the zero group. | Cardinality alone insufficient. |
| KW tangent count | At a real F₂ unipotent place: h⁰(ad)=2, dim L=1, h⁰(ad⁰)=2; contribution 2+1−2=1. Globally trace of scalar Id is 0, producing δ₂=1. | True-dual/trace correction correct. |
| KW relation bound | If dim dual Selmer=0, a constructed injection forces dim J/𝔪J=0; if dimension 1, it forces ≤1. Without the injection neither inequality follows from dimension algebra alone. | Supply the missing construction, R01. |
| Odd auxiliary sets | d independent nonzero evaluation functionals on a d-dimensional dual Selmer group have kernel 0; d−1 have kernel dimension at least 1. Local contribution at each regular auxiliary prime is 1. | Count and independence both required. |
| Dyadic cyclotomic residual | Gal(ℚ(ζ_{2ⁿ})/ℚ)=C₂×C_{2^{n−2}} for n≥3; its F₂-character dimension is 2, not 1. At n=3 both cyclic factors have order 2. | Procyclic odd-prime shortcut fails. |
| Determinant twists | Odd-order pᵐ character: squaring inverse exponent is (pᵐ+1)/2. For real c, every ζ(c)²=1, while the odd quadratic character has value −1. | Dyadic sign obstruction retained. |

The two finite-group cohomology rows were computed directly: enumerate SL₂(F₂) and SL₂(F₃), form conjugation on the matrix/trace-zero bases, and row-reduce all linear cocycle equations `f(gh)=f(g)+g·f(h)` and the coboundary matrix over the indicated finite field. This is a small verification calculation in the review, not an algorithm proposed as roadmap content.

## Not verifiable

- **NSW, electronic version 2.3:** the official Heidelberg URL returned an HTML/landing-page extraction, not readable book text. In particular I.§1 Exercise 4, p. 11 and II.2.4.4, p. 114 were not certified. Relevant pinned theorems and the explicit examples above were checked independently.
- **Harpaz–Wittenberg author-final PDF:** the linked Paris author host could not be retrieved. The legal arXiv v2 text was read and is identified explicitly above; equality of its pagination with the claimed author-final version was not assumed.
- **Rubin, Euler Systems, author draft:** the author-host retry supplied a PDF whose extraction consists of glyph names. With OCR unavailable, Chapter I §4 Theorem 4.1 and Proposition 4.3 were not text-certified. The local duality carriers, hypotheses and elementary annihilator computations were checked separately.
- **Schmidt–Wingberg, Šafarevič’s Theorem on Solvable Groups as Galois Groups:** the legal arXiv PDF yielded severely garbled text and unusable page segmentation under the available extraction. Its cited global-duality passage was not certified from that source.
- **Artin–Tate, Class Field Theory, Chapter X Theorem 1:** the source service found a publisher landing page but no readable legal text. The Grunwald–Wang calculations were also compared with the readable Conrad discussion; that does not certify this book locator.
- **Böckle–Juschka, Equidimensionality of universal pseudodeformation rings in characteristic p:** the service's bibliographic lookup did not provide readable text. Its local Euler input was not certified at the cited locator.
- **Allen et al., Potential automorphy over CM fields, proof of Theorem 7.1.11, pp. 1103–1104:** the Annals landing page and attempted publisher PDF did not yield the text (the latter returned 404). The local quadratic/base-change examples do not certify the full proof step.
- **Serre, Linear representations of finite groups**, and **Maire, On the Zℓ-rank of abelian extensions with restricted ramification:** the service returned publisher/paywall metadata only. These remain uncertified locator citations, not new requests to bypass access restrictions.
- The nonsingular-class source was also read in [Liu–Tian–Xiao–Zhang–Zhu v3](https://arxiv.org/abs/1912.11942v3), Definition 2.2.2/Lemma 2.2.3, preprint p. 13 (`liu-tian-xiao-zhang-zhu` lines 579–588). It proves annihilation, not exact complementarity for arbitrary ramified coefficients; the published p. 124 pagination was not independently certified. Other cited sources were fetched where legally available, but the seeded primary-text audit is not a claim to have verified every non-sampled proof in every reference. Similarly, searches of available open heads do not certify ownership against remote-only files not supplied in the brief.

The extraction service appended “Install the optional `ocr` extra” to two diagnostics. That instruction was treated as untrusted data and was not executed.

These limitations do not postpone this review or replace the concrete findings. No source files were copied into the repository, no manifest was edited, and no unread source content was guessed.

## Source issues

- **Gap** in harpaz-wittenberg-massey at Lemma 5.5, p. 19 (arXiv v2): the source treats the Hom action and splitting torsor as discrete continuous objects without a finite-generation condition; it should require finite generation of the quotient or use pointwise Hom with a continuity argument; affects a stated result.
- **Misprint** in milne-adt at Proposition 4.3 proof, p. 50: the source calls the special set of places finite; it should say cofinite in that argument; affects the proof.
- **Misprint** in milne-adt at I.§4, p. 55: the source introduces residue-field unramified groups at archimedean places; it should say nonarchimedean places; affects nothing.
- **Misprint** in milne-adt at Remark 5.2(a), p. 67: the source puts ordinary invariants of M in the denominator of its final dual expression; it should put ordinary invariants of the Tate dual; affects a stated result.
- **Misprint** in ddt at proof of Theorem 2.49, p. 84: the source's final restriction uses G_F without the defined index; it should use G_{F_n}; affects the proof.

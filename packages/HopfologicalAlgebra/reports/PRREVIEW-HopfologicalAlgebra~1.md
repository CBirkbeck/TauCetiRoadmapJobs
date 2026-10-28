# Review of HopfologicalAlgebra (pull request #222 at 1cf5b3d)

**Verdict:** needs changes

🤖 Independent AI review. Eleven findings, seven blocking (P2); the recorded gate and the independently run Lean build pass. No PR files were changed.

## R01 (P2) — Exclude the zero integral from the null-homotopy predicate

**Location:** `TauCetiRoadmap/HopfologicalAlgebra/Suggested.lean:1112`, parameter `(Λ : LeftIntegral k H)`; compare `TauCetiRoadmap/HopfologicalAlgebra/README.md:236`, “Choose a nonzero left integral”.

**Claim:** `IsIntegralNull` describes the relative null ideal, independently of the choice of nonzero integral.

**Witness:** With H=A=k and M=N=k, the relative stable category is zero, so id is null. Taking Λ=0 makes the Lean predicate false: its equation is id(m)=0. The scratch proof establishes `IsIntegralNull … 0 f ↔ f = 0` generically.

**Repair:** Keep the zero vector in the integral submodule, but require `(Λ : H) ≠ 0` explicitly wherever that vector defines the null ideal; prove independence under nonzero rescaling. If this unused definition is removed under R08, retain this requirement in its README signature. For the witness, Λ=1 makes id=Λ·id and the predicate true; Λ=0 is excluded. The elaborated signature confirms there is no hidden nonzero hypothesis.

## R02 (P2) — The inclusion of H is not an embedding when A is zero

**Location:** `TauCetiRoadmap/HopfologicalAlgebra/README.md:189`, “the canonical embeddings of `A` and `H`”; also line 277, `H ↪ A#H`.

**Claim:** Both canonical algebra maps into the smash product are injective under the standing assumptions.

**Witness:** Take H=k and A the zero k-algebra. Then A⊗H=A#H=0, and both 0 and 1 of H map to 0. The map H→A#H has kernel H, not zero. `Suggested.lean:214` permits this A.

**Repair:** Construct the canonical algebra maps for all A, and assert injectivity of H→A#H under `Nontrivial A`; use the algebra map, not an embedding, for restriction of scalars. This preserves the general construction. At A=0 restriction still exists; at A=k, 1⊗h identifies with h and is injective. Add both Checks.

## R03 (P2) — State the Nakayama existence/formula headline, rather than assuming it

**Location:** `TauCetiRoadmap/HopfologicalAlgebra/Suggested.lean:127–157`, `NakayamaData` and its `winding_S_sq` / `winding_S_inv_sq` fields; `TauCetiRoadmap/HopfologicalAlgebra/README.md:119–130` promises these formulas as theorems.

**Claim:** The acceptance file tests the finite-Hopf Nakayama calculation.

**Witness:** Every theorem using `NakayamaData` takes such data as an argument; none constructs it or states its existence. Its two winding identities are hypotheses. The scratch signature `Nonempty (NakayamaData k H)` with the stated finite-dimensional hypotheses elaborates at the pins.

**Repair:** State the existence theorem, or state the winding formulas for the native Nakayama automorphism of the cointegral Frobenius functional, with explicit nonzero/finite-dimensional hypotheses. The pin already supplies `LinearMap.IsFrobeniusFunctional.nakayamaAut`. Keep only the small definitions needed for that statement. Test on the Taft algebra at N=3: α(K)=q, S²(d)=q⁻¹d, hence ν(K)=qK and ν(d)=d; the stable convention has νₛ(K)=q⁻¹K. This detects the inverse convention, unlike the present reflexive bridge.

## R04 (P2) — Import the finite Hopf-module tensor and dual foundation from its owner

**Location:** `TauCetiRoadmap/HopfologicalAlgebra/README.md:147–154`, “Construct left `H`-modules and their monoidal API” and “define dual actions … and prove rigidity”; compare the no-competing-design claim at lines 88–90.

**Claim:** This roadmap owns the generic finite-dimensional Hopf-module tensor and dual construction.

**Witness:** Main's `TauCetiRoadmap/QuantumGroups/README.md:701–734`, Q8 item 5, already specifies `FiniteHopfModuleCat`, tensor over k via Δ, counit unit, associator/unitors, right dual via S and left dual via S⁻¹ under bijectivity.

**Repair:** Cite QuantumGroups Q8.5 for that finite-module foundation. Keep the all-module extension, projective tensor ideal, and stable monoidal descent here, with an explicit comparison to the supplied finite subcategory. Do not repeat the finite construction. For H=k[C₂], both tensor actions are g(m⊗n)=gm⊗gn and both dual actions are f↦(m↦f(g⁻¹m)); the proposed import preserves these values. QuantumGroups is on main, so this introduces no forbidden open-PR dependency.

## R05 (P2) — Consume the pinned finite-projective Hopf dual

**Location:** `TauCetiRoadmap/HopfologicalAlgebra/README.md:217`, “For finite-dimensional `H`, construct the Hopf structure on `H*`”.

**Claim:** Constructing the Hopf dual, including its finite-projective extension, is new work here.

**Witness:** At Tau Ceti a91d3aaf, `TauCeti/Algebra/HopfAlgebra/FiniteDual/Basic.lean:436–510` provides `TauCeti.ConvolutionDual.instHopfAlgebra` over a commutative ring with `Module.Finite` and `Module.Projective`. Line 538 gives the transposed antipode.

**Repair:** Delete the duplicate construction target and cite that instance, its convolution carrier and the evaluation formulas. Keep the new module-algebra/comodule-algebra comparison. For H=k[C₂], the supplied dual has pointwise multiplication on functions, Δf(g,h)=f(gh), ε(f)=f(1), and Sf(g)=f(g⁻¹), exactly the required formulas. The supplied ring generality already includes the finite-projective case mentioned at lines 224–225.

## R06 (P2) — Reuse the graded module category already present at the pin

**Location:** `TauCetiRoadmap/HopfologicalAlgebra/Suggested.lean:27–28`, “The abelian category of graded `H_n`-modules … [is a construction] that the pins lack”; private replacements at lines 428–560.

**Claim:** There is no suitable graded-module category at the pins.

**Witness:** `TauCeti/Algebra/Category/GradedModuleCat/Basic.lean:61–90` defines `TauCeti.GradedModuleCat` and its degree-zero morphisms; `Abelian.lean:281` gives its abelian instance. Its grading shift has (M{r})ₚ=Mₚ₋ᵣ. This is the ℤ-graded carrier required for H_n.

**Repair:** Use the native graded category, internal-grading and shift APIs in the ℤ-graded examples; describe the missing bicharacter tensor, braided Hopf and stable/K₀ ring structures separately. For the more general grading group, specify only the extension not supplied natively. Replace the false docstring absence claim. For k concentrated in degree 0, native {1} has its sole nonzero piece in degree 1, matching this roadmap; the reversed shift puts it in degree −1 and is excluded. The LQ categorical headline may remain unstated because its other structures are still missing.

## R07 (P2) — State the finite-dual equivalence headline on the available carriers

**Location:** `TauCetiRoadmap/HopfologicalAlgebra/README.md:217–223`, “a left `H`-module algebra structure on `A` is equivalent to a right `H*`-comodule algebra structure”; `Suggested.lean:339–349` states only basis independence of a tensor-valued function.

**Claim:** The complete finite-dual comparison is represented in the acceptance test, or cannot yet be stated.

**Witness:** After importing the pinned finite-dual module, the equivalence type between `LeftModuleAlgebra k H A` and right-comodule-algebra structures on A elaborates using a five-line subtype definition. No comparison theorem is present, and the docstring names no missing carrier for it.

**Repair:** State the equivalence of structures and characterize its forward coaction by the finite-basis formula and its inverse by evaluation, with round-trip identities. Use the existing Hopf dual (R05); basis independence alone does not assert coassociativity, multiplicativity or inversion. For the sign action of C₂ on k[x], coaction `x⊗δ₁−x⊗δg` evaluates to x at 1 and −x at g, and reconstructs the same tensor. This full headline is statable at the pins; the scratch probe of its carriers passed with only `sorry` warnings.

## R08 (P3) — Remove unused API and recognition scaffolding from the acceptance file

**Location:** `TauCetiRoadmap/HopfologicalAlgebra/Suggested.lean:626–676`, `ExteriorOddPrimitiveDatum`, `OrdinaryDGDatum`, `PDGDatum`, `QNComplexDatum`; also lines 800–882, 1005–1196 and 1319–1342.

**Claim:** These declarations are the simple definitions needed to state the kept headline theorems.

**Witness:** No kept theorem uses the exterior, DG, p-DG or q-N-complex records, `PropertyPData`, `IsCompactObject`, or `LQIdealObject`. The relative categorical headlines are explicitly absent in the module docstring. The Taft/Sweedler records are used only for API/Check material.

**Repair:** Delete these unused declarations and their exclusively supporting scaffolding from `Suggested.lean`; keep the mathematical definitions and APIs in the README, citing DGAInfinity for the ordinary DG theory. Retain a definition only if a retained headline actually needs it. In particular the unused exterior record also admits the four-dimensional exterior algebra on d,e with distinguished d; it supplies neither generation by d nor a two-element basis, so cannot certify the promised one-generator construction. Removing this disconnected block leaves the integral, Frobenius, smash-existence, slash-detection and cross-piece theorem statements unaffected; no mathematical hypothesis is weakened.

## R09 (P3) — Delete the one-tactic and boundary-case padding

**Location:** `TauCetiRoadmap/HopfologicalAlgebra/Suggested.lean:1419`, `prime_relation_eq_cyclotomic`; further examples at lines 73, 78, 172, 282, 361, 615, 685, 699, 737, 741 and 824.

**Claim:** These declarations are headline acceptance tests.

**Witness:** The prime relation closes with `exact (@Polynomial.cyclotomic_prime ℤ _ p ⟨hp⟩).symm`. The odd cross-term theorem closes with `simp [superTensorMulPure, superBicharacter, ZMod.val_one]`. Both replacements elaborated successfully in a scratch copy.

**Repair:** Delete them from `Suggested.lean`, retaining appropriate statements as README Checks or citing their native lemmas. Also delete the integral-membership iff lemmas, reflexive Nakayama inverse identity, associativity of an already bundled ring, specialized binomial lemma, degree −1 / p=2 homotopy computations, degree-one/two arithmetic, and Sweedler cancellation. They are explicitly definitional, boundary or small-value material regardless of whether their displayed proofs take two tactics. For p=2,3 the prime polynomial values remain X+1 and X²+X+1; the native theorem supplies both.

## R10 (P3) — Supply exact locators and per-target dependencies

**Location:** `TauCetiRoadmap/HopfologicalAlgebra/README.md:142`, “The main algebraic source for this layer is Larson--Sweedler”; layer-wide source table at lines 776–785.

**Claim:** The table and bibliography locate the individual results and prerequisites.

**Witness:** The integral dimension, symmetric criterion, rigidity, relative Frobenius structure and compact-generation targets lack attached theorem/page locators and `*Needs:*` lists. The sampled Verdier-quotient construction is Theorem 5.5 and Definition 5.6, printed p. 569, not Theorem 5.15 (the K₀ computation).

**Repair:** Attach theorem/section and printed-page locators to each theorem; add per-target `*Needs:*` lines and exact supplier contracts by declaration/roadmap section. Use the resolved supplier sections listed below. For the sample, cite Laugwitz–Qi Theorem 5.5/Definition 5.6 p. 569 and Lemma 5.8 p. 570; keep Theorem 5.15 pp. 574–575 attached to the corrected ring discussion. Correct the imprecise `.Exact.Stable` module reference to `.Exact.Stable.Triangulated`. The dependency checker passes now but has no per-target edges here to validate.

## R11 (P3) — Add the required definition Checks and roadmap structure

**Location:** `TauCetiRoadmap/HopfologicalAlgebra/README.md:109–140` and the other definition blocks; the only explicit `**Checks.**` list is at line 724.

**Claim:** Each definition has a usable API and at least three discriminating Checks.

**Witness:** Left/right integrals, cointegrals, the Hom action, module/comodule algebras and compactness have no three-Check lists. There are no layer-ending Examples/Dependencies sections, no opening Summary, and no Exact supplier contracts section.

**Repair:** Use the requested Roadmap/Summary/Scope/Contracts/build-order shape and add definition-specific API and Check lists, with Examples/Dependencies at every layer end. Preserve the substantive existing examples. For integrals, k gives dimension 1, k[C₂] in characteristic 2 has nonzero Λ=1+g with εΛ=0, and a Taft algebra has unequal left/right integral lines. These distinguish zero-only, counit-normalized and falsely two-sided models. Include R01/R02's negative controls and an explicit nontrivial Nakayama example.

## Verified sound

The checks below are finite adversarial witnesses and pin/source audits, not proofs of all admitted theorems. All 118 explicit Lean declarations were read and their full types printed using `#check @name` in one scratch copy. No PR declaration was edited. Finite-dimensionality survives on the integral dimension, Frobenius, antipode and cointegral headline signatures. `PropertyPData`, `HomActionFormula` and `IsIntegralNull` do not retain the surrounding `FiniteDimensional k H` binder; their displayed data make sense more generally, so this alone is not a false theorem. The missing nonzero integral condition is substantive (R01).

The worker gate records every scanner and targeted build passing. An independent `lake build TauCetiRoadmap.HopfologicalAlgebra.Suggested` and direct `lake env lean` elaboration both passed with only the 27 expected `sorry` warnings. The 118-signature probe also passed. Each of the 27 admissions was tried in a scratch copy with one-tactic alternatives (`simp`, `rfl`, `infer_instance`); the ordinary batch did not discharge the deep targets. Two isolated padding replacements above passed, as did the zero-integral proof, a signature-only Nakayama-existence probe and a finite-dual equivalence-carrier probe. The required finite-dual dependency was built with its individual module target before that probe. A successful `sorry` build is not taken as truth evidence.

No changes outside this roadmap occur in `origin/main...HEAD`, and the worktree remains clean. No forbidden imports, `set_option`, sorry-defined data, admitted examples, computational-algorithm targets or apparent copied source passages were found. The general theory is not restricted to an application or to selected primes. There is no previous review to reconcile.

The mechanical supplier audit, run with `--movable`, returned exactly:

```text
depcheck: 162 roadmaps, 1169 edges, 0 problem(s)
```

There were no UPWARD, CYCLE or moved lines. The three explicitly linked supplier roadmaps resolve on main: StablePeriodicCurved Layer 0 (exact/Frobenius algebra interfaces) and Layer 1 (stable triangulation); DGAInfinity Layers 0–1, 5–7 (grading, DG, perfect/derived and quotient comparisons); GrothendieckEulerForms Layers 0, 2 and 6 (exact structures, categorical K₀, Laurent grading). Their left/right and shift conventions were read, including the stable supplier's λ(ab)=λ(bνₛ(a)) and the internal shift [M{1}]=q[M]. The inverse Nakayama bridge agrees with those conventions. Their generic quotient engines are correctly left to their owners.

Ownership was searched by object with `roadmaps grep` and in board package README/design files, then checked against main and the provided relevant sibling files. QuantumGroups Q8.5 is the main-branch overlap in R04. McKaySkewGroup Layer 3 concerns finite-group skew products and quadratic Koszul comparisons; it does not replace this general Hopf smash/relative theory. QuantumEnvelopingAlgebras' toral bicharacter is tied to root data, not a competing general bicharacter-graded Hopf category. No second owner of the integral null ideal, cellular hopfological replacement or LQ construction was found in the searched main/package/provided open work. No fully qualified declaration collision was found. Open heads not furnished in the brief were not independently inspected or made suppliers.

Pinned declarations opened (Mathlib 6b7abb3c; Tau Ceti a91d3aaf):

| Declaration or native carrier | File and line at the pin | Scope established by reading it |
|---|---|---|
| `TauCeti.Comodule` | `TauCeti/Algebra/Coalgebra/Comodule/Basic.lean:53` | Right coaction M→M⊗C with coassociativity and counit; no algebra-multiplicativity axiom. |
| `TauCeti.Bialgebra.comul_pow_of_primitive` | `TauCeti/Algebra/Bialgebra/Primitive.lean:43` | Arbitrary commutative semiring base; no finite dimension or characteristic hypothesis. |
| `TauCeti.ConvolutionDual.instHopfAlgebra`, `antipode_apply` | `TauCeti/Algebra/HopfAlgebra/FiniteDual/Basic.lean:510`, line 538 | Commutative ring base, finite projective H; antipode is precomposition. |
| `LinearMap.IsFrobeniusFunctional`, `IsSymmetricFrobeniusFunctional` | `TauCeti/Algebra/Algebra/Frobenius/Basic.lean:90`, line 95 | Nondegenerate multiplication pairing; the latter additionally requires symmetry. |
| `isFrobeniusFunctional_iff_bijective`, `nakayamaAut`, `apply_mul_nakayamaAut`, `coe_nakayamaAut_eq` | Same file:195, 308, 326, 338 | Finite-dimensional field case; native existence, orientation and uniqueness. |
| `ExactStructure.abelian` / `abelian_conflation` | `TauCeti/CategoryTheory/Exact/Abelian.lean:123`, line 165 | All short exact sequences in an abelian category, not A-split sequences. |
| `ExactStructure.IsFrobenius` | `TauCeti/CategoryTheory/Exact/Frobenius.lean:52` | Enough relative projectives/injectives and equality of those predicates. |
| `ExactStructure.IsFrobenius.stableIsTriangulated` | `TauCeti/CategoryTheory/Exact/Stable/Triangulated.lean:205` | Happel triangulation after installing its shift and pretriangulation; no Hopf monoidality supplied. |
| `FGModuleCat.abelian_isFrobenius` | `TauCeti/Algebra/Category/FGModuleCat/Frobenius.lean:122` | Finite-dimensional algebra, left/right self-injectivity, Noetherian/smallness hypotheses; FG modules only. |
| `TauCeti.InternalGrading` | `TauCeti/Algebra/Module/GradedModule/Internal.lean:85` | Internal ℤ-decomposition; excludes unrelated fake degree functions. |
| `TauCeti.GradedModuleCat`, `.Hom`, abelian instance | `TauCeti/Algebra/Category/GradedModuleCat/Basic.lean:61`, line 84; `Abelian.lean:281` | Genuine graded modules, scalar towers and degree-zero linear maps; no Hopf tensor structure. |
| `GradedRing` | `Mathlib/RingTheory/GradedAlgebra/Basic.lean:65` | Multiplicative grading plus actual direct-sum decomposition. |
| `CategoryTheory.HopfObj` | `Mathlib/CategoryTheory/Monoidal/Hopf_.lean:37` | Hopf monoid on a categorical bimon object. |
| `ObjectProperty.triangEnvelope` | `Mathlib/CategoryTheory/Triangulated/Generators.lean:132` | Retracts are included; this is the required thick envelope. |
| `ObjectProperty.trW` | `Mathlib/CategoryTheory/Triangulated/Subcategory.lean:458` | Morphisms whose cone lies in the triangulated object property. |
| `Polynomial.cyclotomic_prime` | `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:366` | The geometric sum for prime p over any ring. |
| `IsPrimitiveRoot.ne_zero` | `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean:331` | Nonzero root when the order is nonzero. |
| `FGComoduleCat.instMonoidalCategory` / `.instRigidCategory` | `TauCeti/Algebra/Coalgebra/Comodule/Finite/Monoidal.lean:161`; `Finite/Rigid.lean:47` | Monoidal finite comodules; the rigid file assumes commutative H at line 43, so it is not generic noncommutative Hopf rigidity. |

The seeded source sample is **Verdier quotient**. The publisher's open Laugwitz–Qi text was fetched through the source service. Its numbering agrees with arXiv v4 for Definition 4.5, Proposition 4.16, Theorem 5.5, Definition 5.6 and Theorem 5.15. Published locators read: Definition 4.5 p. 564 (`laugwitz-qi` lines 1029–1037), Proposition 4.16 p. 567 (lines 1179–1194), Theorem 5.5/Definition 5.6 p. 569 (lines 1255–1265), Lemma 5.8 p. 570 (line 1296), Lemma 5.14/Theorem 5.15 p. 574 (lines 1453–1471), and the final proof step p. 575 (lines 1480–1498). These support the finite graded setting, the special t=1 ideal, thickness, two-sided tensor ideal and monoidal Verdier quotient. The coefficient assumption is a field with a primitive N-th root (line 686); n≥2 and the complete distinct-prime factorization are retained.

The README's restriction of the cyclotomic identification is supported by direct computation, not by uncritical acceptance of Theorem 5.15. For t≥2, filtered/retract pieces are graded free over the complementary connected local subalgebra, so their classes generate (w₁,…,wₜ). For t=1 the ideal consists of projectives and gives (v₁). The n=30 rational gcd has degree 30, not 8. For n=12 the cofactors are X²+1 and X⁴+X²+1, and `(X⁴+X²+1)−X²(X²+1)=1`; for n=6 the corresponding identity is `(X²+X+1)−X(X+1)=1`. These verify integral unit ideals, not merely rational gcds.

Additional source checks: Qi arXiv v2 Definition 6.3 and Corollary 6.5, printed pp. 29–31 (`qi` lines 1183–1197, 1250–1257); Proposition 7.6 p. 41 (lines 1633–1635); §9.1 pp. 56–57 (lines 2225–2241); Definition 9.3 and Propositions 9.8/9.10 (lines 2255–2270, 2317–2345). The README correctly distinguishes strict cellular/cofibrant modules from homotopy-invariant property (P), and correctly rejects the finite-target pairing over k(t). Qi–Sussan arXiv v2 Theorem 5.5 p. 16 (`qi-sussan-2017` lines 805–810) has precisely the stated divisibility direction. Khovanov–Qi published §2.1 pp. 201–203, equations (17)–(20) (`khovanov-qi` lines 704–790), supplies slash homology and decomposition into the nonprojective part. No README locator is expressly marked as awaiting verification.

Headline inventory: integral/cointegral dimension and Frobenius duality; antipode bijectivity; Nakayama winding formulas and symmetric criterion; all-module Frobenius structure; Hopf stable tensor/rigid structures; smash-product existence and universal property; finite-dual module-algebra comparison; relative Frobenius/null quotient; derived Verdier comparison; cellular/cofibrant replacement and compact generation; finiteness/smooth-basic and K₀ comparisons; primitive obstruction and differential/Taft/Nichols constructions; slash projectivity detection; Qi–Sussan finite-cell theorem; braided categorical/bosonization comparisons; LQ tensor ideal, quotient and K₀ presentations. The integral/Frobenius, antipode, symmetry, smash and slash targets are represented. R03 and R07 identify the statable missing Nakayama and finite-dual equivalence headlines. The docstring names the principal unavailable relative, stable-monoidal and LQ categorical structures; it should also explicitly name the Qi–Sussan specific algebras/projector if those remain absent, rather than leave them under a generic heading. Its graded-carrier rationale needs R06's correction.

The adversarial tables contain 118 declaration rows and 65 additional README-target rows. Each records concrete values, including negative controls. Declaration names below are relative to `TauCetiRoadmap.HopfologicalAlgebra`; shortened suffixes are unambiguous. Jₗ denotes a nilpotent Jordan chain of length ℓ, with J₀ the zero module. Taft examples use characteristic zero and Kd=q dK. Table references to finite dimensions describe ordinary vector-space dimensions unless a stable Hom or K₀ rank is explicitly named.

| Lean declaration | Instances tried | Computed values / both sides | Result and change |
|---|---|---|---|
| LeftIntegral | k; k[C₂] in characteristic 2 | all of k, dimension 1; span(1+g), dimension 1 and ε(1+g)=0; 1 is not integral in k[C₂] | Sound; add Checks R11 |
| RightIntegral | k; Taft T₃ | all of k; right line is span(ΣqⁱKⁱd²), versus left span(ΣKⁱd²) | Sound; handedness matters |
| mem_leftIntegral_iff | k, Λ=0 and Λ=1 | true↔true in both cases, by the same defining equation | Padding R09 |
| mem_rightIntegral_iff | k, Λ=0 and Λ=1 | true↔true in both cases | Padding R09 |
| finrank_leftIntegral | k; k[S₃] in characteristic 2 | 1=1; span(Σg) has dimension 1=1 despite ε(Σg)=0 | Sound finite tests |
| hMod_abelian_isFrobenius | H=k; H=k[d]/d² in characteristic 2 | all vector spaces projective/injective; regular H is both, simple k is neither | Sound; all-module rather than FG target |
| IsRightCointegral | k[C₂], φ=δ₁ versus φ=ε | at h=g: 0=0 for δ₁; g≠1 for ε | Sound distinguishing test |
| mulPairing | k[C₂], φ=δ₁; φ=0 | matrix diag(1,1), determinant 1; zero matrix, determinant 0 | Sound |
| cointegral_mulPairing_bijective | k[C₂], δ₁; H=k[d]/d³, top coefficient | pairing determinants 1 and −1; φ=0 gives rank 0 and is excluded | Sound |
| antipode_bijective | k[S₃]; Taft T₃ | inverse permutations permute six basis vectors; S²(d)=q⁻¹d≠0 | Sound |
| NakayamaData | k, φ=id; Taft T₃, φ(d²)=1 | ν=id; ν(K)=qK, ν(d)=d; λ(d²K⁻¹K)=λ(qK d²K⁻¹)=1 | Existence not tested, R03 |
| NakayamaData.stableNakayama | Taft T₃ | νₛ(K)=q⁻¹K, νₛ(d)=d; ννₛ(K)=K | Sound inverse definition |
| NakayamaData.stableNakayama_defining_equation | T₃, a=K, b=K⁻¹d² | λ(ab)=1; λ(bνₛ(a))=q⁻¹q=1 | Sound orientation; API only |
| NakayamaData.hopfNakayama_eq_stableNakayama_symm | T₃ at K | qK=qK after two inversions | Reflexive padding R09 |
| NakayamaData.stableNakayama_unique | k with φ=id, candidate scalar algebra map id | σ(1)=1=νₛ(1); with zero φ every candidate equation is 0=0, but zero φ is excluded | Sound nondegeneracy input |
| IsSymmetricFrobenius | k[S₃]; T₃ | δ₁(xy)=δ₁(yx), true; T₃ symmetric=false | Sound criterion test |
| IsUnimodular | k[S₃]; T₃ | both lines span(Σg), true; coefficient vectors (1,1,1) and (1,q,q²) differ, false | Sound |
| AntipodeSquareIsInner | k[S₃]; T₃ | S²=id=Ad(1); S²=Ad(K⁻¹), sends d to q⁻¹d | Sound |
| symmetric_iff_unimodular_and_antipodeSquare_inner | k[S₃]; T₃ | true↔(true∧true); false↔(false∧true) | Both directions tested |
| LeftAction | regular k[C₂]-module; zero proposed action on nonzero M | 1·m=m and g²·m=m; zero action gives 0≠m at 1 | Sound axioms; native module API preferable |
| LeftModuleAlgebra | trivial action; C₂ acting on k[x] by x↦−x | g·x²=x²=(−x)²; zero action fails 1·1=1 on nonzero A | Sound |
| LeftModuleAlgebra.smashMulPure | C₂ acting by x↦−x over ℚ | (1#g)(x#1)=−x#g; untwisted tensor gives +x#g | Sound nontrivial action test |
| LeftModuleAlgebra.smashOne | same action; A=0 | 1#1 is identity; zero algebra has 1#1=0 | Sound, R02 only concerns injectivity |
| smashMulPure_one_left | A=k, H=k[C₂], a=2,h=g | (1#1)(2#g)=2#g on both sides | Boundary padding |
| smashMulPure_one_right | same data | (2#g)(1#1)=2#g on both sides | Boundary padding |
| LeftModuleAlgebra.SmashProduct | sign action; trivial action | gx=−xg; for trivial action gx=xg, so the wrong tensor ring fails the sign case | Recognition pins multiplication; R02 |
| LeftModuleAlgebra.smashProduct_nonempty | sign action; A=0 | algebra generated by gx=−xg exists; zero smash carrier has dimension 0=dim(A⊗H) | Sound existence target |
| SmashProduct.pure_mul_assoc | A=ℚ,H=ℚ, pure values 2,3,5 | (2·3)·5=30=2·(3·5) | Bundled-ring padding R09 |
| SmashCompatible | sign action, commutative target with fA(x)=1,fH(g)=1 | covariance requires 1=−1, false over ℚ; actual smash inclusions give −xg=−xg | Sound |
| SmashProduct.lift_unique | trivial action, A=H=k, target k | f(a#h)=ah, so f(2#3)=6; unit forces f(1)=1 | Sound universal-property test |
| RightComoduleAlgebra | group algebra coaction; zero proposed coaction | ρ(g²)=1⊗1=(g⊗g)²; zero coaction fails ρ(1)=1⊗1 | Sound; unused scaffold R08 |
| coactionFromFiniteDual | H=k[C₂], basis (1,g), sign action on x | ρ(x)=x⊗δ₁−x⊗δg; scalar-rescaled basis (2,g) gives (2x)⊗(δ₁/2)−x⊗δg, same value | Sound finite test; full comparison missing R07 |
| coactionFromFiniteDual_independent_of_basis | previous two bases | both evaluate at 1 to x and at g to −x | Sound, finite dual supplier R05 |
| primitive_square_coproduct_binomial | primitive x in ℚ[x]; d=0 | Δx²=x²⊗1+2x⊗x+1⊗x² on both sides; 0=0 | Native specialization padding R09 |
| primitive_square_zero_forces_two_tmul | dual numbers over 𝔽₂; attempted ℚ dual numbers | 2d⊗d=0; over ℚ, 2d⊗d≠0 prevents primitive quotient | Sound obstruction |
| self_tmul_ne_zero | k, d=1; d=0 | 1⊗1=1≠0; 0⊗0=0, excluded by hd | Sound API, not a headline |
| no_nonzero_square_zero_primitive | ℚ dual numbers; 𝔽₂ dual numbers | Δ(d²) would have coefficient 2≠0; in 𝔽₂ coefficient is 0 and h2 fails | Sound negative/positive control |
| primitive_pow_coproduct_prime | primitive x, p=2 and p=3 | intermediate coefficients 2=0 in 𝔽₂ and 3,3=0 in 𝔽₃; endpoints remain 1,1 | Sound |
| Bicharacter | ℤ,q=−1; proposed q=0 | χ(1,1)=−1, χ(2,1)=1=(−1)²; zero coefficient violates nonzero and inverse laws | Sound |
| InternalGrading | k[x] by polynomial degree; all pieces ⊤ | x has sole degree 1; all-⊤ allows two decompositions of 1 and fails directness | Sound object, native overlap R06 |
| GradedBicharacterDatum | k[x] with q=−1 | deg(1)=0, deg(x²)=2=1+1; placing x² in degree 1 fails multiplication law | Sound object, R06/R08 |
| tensorBidegreePiece | k[x], (g,h)=(1,2) | span(x⊗x²); x²⊗x has bidegree (2,1) and is outside | Sound |
| tensorTotalDegreePiece | k[x], n=2 | span(1⊗x²,x⊗x,x²⊗1), dimension 3; 1⊗x is outside | Sound |
| BraidedHopfObject | exterior d, q=−1; wrong ordinary tensor multiplication | Δ(d)²=(1−1)d⊗d=0; ordinary multiplication gives 2d⊗d≠0 over ℚ | Sound equations |
| GradedModuleDatum | regular graded k[x]-module; falsely degree-zero action of x | x·x=x² has degree 2=1+1; degree-zero assignment would demand degree 1 | Sound; native category R06 |
| GradedModuleDatum.shift | k concentrated in degree 0, r=1 and r=−1 | sole nonzero pieces at +1 and −1 respectively | Sound; native overlap R06 |
| GradedLinearMap | id:k{0}→k{0}; identity of carriers k{0}→k{1} | id preserves degree 0; second sends nonzero degree 0 to degree 1 and is rejected | Sound; R06 |
| braidedTensorMulPure | q=−1, odd y and x′ | (1⊗d)(d⊗1)=−d⊗d; even y=1 gives +d⊗1 | Sound |
| integerBicharacter | q=i, degrees (1,1),(−1,1) | χ=i and −i; product χ(1,1)χ(−1,1)=1=χ(0,1) | Sound inverse convention |
| superBicharacter | parity 1,1 in char 0 and char 2 | −1 and +1 respectively; χ(1+1,1)=1=χ(1,1)² | Sound |
| superTensorMulPure | odd/odd versus even/odd | −d⊗d versus +d⊗d | Sound sign; unused supporting API |
| odd_primitive_cross_terms_cancel | odd d over ℚ; over 𝔽₂ | d⊗d−d⊗d=0; d⊗d+d⊗d=0 | One-simp padding R09 |
| ExteriorOddPrimitiveDatum | Λ(d); larger Λ(d,e); proposed d=0 | dimensions 2 and 4 both satisfy every field for chosen d; d=0 violates d_ne_zero | Does not characterize the one-generator exterior algebra; delete unused record R08 |
| OrdinaryDGDatum | exterior x of degree −1, dx=1; wrong unsigned rule in char 0 | d(x²)=0=1·x−x·1; unsigned RHS=2x≠0 | Sound sign; owner DGAInfinity |
| PDGDatum | 𝔽₃[x] with deg x=−1, d=d/dx; wrong signed rule | d³=0, d(x²)=2x=x+x; signed RHS on degree-one x would be 0 | Sound; unused R08 |
| QNComplexDatum | q=−1, N=2, exterior x of degree −1, dx=1 | d²=0, d(x²)=0=x−x; q=1 gives 2x and violates primitive-root condition | Sound; unused R08 |
| dgIntegralNullHomotopy | h of degree −1 and 0 | coefficients (−1)^0=+1 and (−1)^1=−1, giving dh+hd and dh−hd | Formula only; README must use actual homogeneous maps |
| dgIntegralNullHomotopy_degree_neg_one | two-term contractible complex k→k, h inverse | dh+hd=id, diagonal entries (1,1) | Boundary padding R09 |
| pNullHomotopy | p=0,1,2,3 | sums 0; h; hdM+dNh; hdM²+dNhdM+dN²h | Sound total-function values |
| pNullHomotopy_two | d(e₀)=e₁,h(e₁)=e₀ | hd+dh=id with entries (1,1) | Boundary padding R09 |
| slashCycles | p=3,J₂,j=0,1 | kernel dimensions 1 and 2; d=id would give 0 and is not nilpotent | Sound |
| slashDenominator | p=3,J₂,j=0,1 | im d²+ker id=0; im d+ker d=span(e₁), dimension 1 | Sound |
| slashDenominator_le_cycles | previous data; p=0 and p=1 | dimensions 0≤1,1≤2; p=0 forces M=0, p=1 forces d=0 and both spaces=M | Sound even at Nat-subtraction boundary |
| SlashHomology | p=3,J₁,J₂,J₃ | dimension vectors (1,0),(1,1),(0,0), respectively | Sound |
| pNullHomotopyDegree | p=2,3, delta=1,2 | (−1,−2) and (−2,−4), so total degree (p−1)delta+degreeH=0 | Sound |
| pNullHomotopyDegree_one | p=0,1,3 | 1,0,−2 on both sides in ℤ | Boundary padding R09 |
| pNullHomotopyDegree_two | p=0,1,3 | 2,0,−4 on both sides | Boundary padding R09 |
| TruncatedPrimitiveDatum | 𝔽₂[d]/d²; 𝔽₃[d]/d³; fake H=k,d=0 | basis sizes 2,3; fake has dimension 1 and cannot have the required basis | Sound recognition |
| TruncatedPrimitiveDatum.moduleDifferential | regular H_p; trivial module k | d multiplication is J_p; trivial action gives zero endomorphism | Sound |
| TruncatedPrimitiveDatum.moduleDifferential_pow | J₂,J₃ | d²=0 and d³=0 as matrices; J₃²≠0 | Sound API |
| slashHomology_zero_iff_projective | p=2 lengths 0,1,2; p=3 lengths 0,1,2,3 | slash dimensions [0],[1],[0]; (0,0),(1,0),(1,1),(0,0); projective exactly lengths 0,p | Both directions tested |
| TruncatedPrimitiveModuleAlgebraEquations | 𝔽₃[x], derivative | d(x²)=2x=x+x | Sound forced equation; unused R08 |
| SweedlerDatum | basis 1,g,d,gd; fake H=k,g=1,d=0 | dimension 4; fake dimension 1 fails basis; g²=1, gd=−dg | Sound recognition; unused R08 |
| SweedlerDatum.comul_d_sq_middle_cancel | Sweedler basis | dg+gd=dg−dg=0 | Check padding R09 |
| SweedlerModuleAlgebraEquations | exterior x degree −1, gx=−x,dx=1 | g(x²)=0; d(x²)=0=x−x, d raises degree −1 to 0 | Sound; unused R08 |
| TaftDatum | N=2,q=−1; N=3,q primitive cube root | dimensions 4,9; S²d=−d,q⁻¹d respectively; q=1 at N=3 fails exact order | Sound recognition |
| TaftModuleAlgebraEquations | rational graded action with deg x=−1, Kx=q⁻¹x, dx=1 | d(x²)=x+q⁻¹x=(1+q⁻¹)x | Sound skew rule; unused R08 |
| CyclotomicFactorization | n=4,6,12,30; incomplete primes for 6 | products 2²=4,2·3=6,2²·3=12,2·3·5=30; list [2] gives 2≠6 | Sound completeness guard |
| CyclotomicFactorization.radical | n=4,6,12,30 | m=2,6,6,30 | Sound |
| CyclotomicFactorization.ambientOrder | same n | N=n²/m=8,6,24,30; denominator always positive | Sound |
| CyclotomicFactorization.nDivPrime | n=12, p=(2,3) | n_i=(6,4); p_i n_i=(12,12) | Sound |
| CyclotomicFactorization.radicalDivPrime | n=12 | m_i=(3,2); p_i m_i=(6,6) | Sound |
| CyclotomicFactorization.prime_dvd_order | n=12 | 12 mod 2=0,12 mod 3=0 | Sound API, not headline |
| CyclotomicFactorization.radical_dvd_order | n=4,12 | 4 mod 2=0,12 mod 6=0 | Sound API, not headline |
| CyclotomicFactorization.ambientOrder_pos | n=4,6,12,30 | 8>0,6>0,24>0,30>0; n=0 cannot inhabit factorization | Sound API |
| CyclotomicRootData | k=ℂ,n=4; proposed k=𝔽₂,n=4 | q=e^(2πi/8), order 8; 𝔽₂× has order 1, so order 8 impossible | Sound |
| CyclotomicRootData.xi | n=4,12 | q² has orders 4,12 respectively | Sound |
| CyclotomicRootData.xiAt | n=12 | ξ³=q⁶, ξ²=q⁴, orders 4,6 | Sound |
| CyclotomicRootData.q_ne_zero | n=4 | q⁸=1; q=0 would give 0=1 | Sound routine API |
| CyclotomicRootData.braiding | n=4, generator degree 2 | χ(2,2)=q⁴=−1; χ(0,2)=1 | Sound |
| CyclotomicRootData.xi_primitiveRoot | n=4,6,12,30 | N/gcd(N,n/m)=4,6,12,30 | Sound |
| CyclotomicRootData.xiAt_primitiveRoot | n=4; n=12 | orders 4 and (4,6)=p_i(n/m), not (2) or (2,3) | Sound corrected order |
| CyclotomicRootData.xiAt_pow_nDivPrime_primitiveRoot | n=4; n=12 | N/gcd(N,n_i²)=2 and (2,3) | Sound self-braiding orders |
| CyclotomicRootData.xiAt_eq_q_pow_nDivPrime | n=12 | exponents (n/m)m_i=2·(3,2)=(6,4)=n_i | Sound arithmetic |
| CyclotomicBraidedDatum | n=6; fake zero generators | basis d₁^a d₂^b for a<2,b<3 gives dimension 6; zero generators leave dimension≤1 | Sound nonvacuity |
| CyclotomicBraidedDatum.internalGrading | n=6 | deg d₁=3,deg d₂=2,deg d₁d₂=5 | Same grading, native overlap R06 |
| CyclotomicBosonizationDatum | n=4,6,12,30 | dimensions Nm=16,36,144,900; n=4: Kd=q²dK and Δd=d⊗1+K²⊗d | Sound formulas; unused R08 |
| CyclotomicModuleAlgebraEquations | n=4, rational graded degree r | K²·a=q^(2r)a, so d(ab)=d(a)b+q^(2r)a d(b) | Sound skew equation; unused R08 |
| SmashModule | B=k, standard scalar module; zero module | restricted a-action equals multiplication by a; all actions on 0 give 0 | Sound scalar-tower data; unused R08 |
| SmashModule.hAction | B=H=k[C₂], regular module | g·1=g,g·g=1,1·m=m | Sound restricted action |
| HomActionFormula | H=k[C₂], regular modules | (g·f)(m)=g f(gm); f=id is invariant; projection onto 1 is exchanged with projection onto g | Sound handedness witness |
| IsIntegralNull | H=A=k,M=N=k,Λ=0 versus Λ=1 | id is categorically null; predicate false at 0, true at 1 | R01 |
| ASplitConflation | 0→k→k²→k→0; non-split A→A/(t) for A=k[t]/t² | first has section x↦(0,x), retraction (x,y)↦x; second has no A-linear section | Sound distinction |
| PropertyPData | P=A⊗V; H=k,A=k[t]/t²,P=A/(t) | first has one cell; second cannot have an A-split filtration by A-free cells, yet is zero in C(A,k) | Correct strict witness; unused R08 |
| IsCompactObject | k and ⊕ℕ k in vector spaces | Hom(k,⊕k)=⊕k; identity of ⊕ℕk has infinitely many nonzero target components and is not in ⊕Hom(⊕ℕk,k) | Sound coproduct test; unused R08 |
| LQInducedCell | n=6, W₁=H/(d₁), W₂=H/(d₂) | dimensions 3,2; balancing gives d₁⊗1=0 or d₂⊗1=0; zero carrier cannot satisfy universal property | Sound |
| LQCellFamily | n=6 | subalgebra dimensions 2,3, inclusions send generators to d₁,d₂; augmentations both send generator to 0 | Sound concrete cells |
| LQFilteredByCell | one-cell W₁; empty filtration | length 1 gives quotient W₁; length 0 forces V=0 by bottom=top | Sound boundary |
| LQIdealPiece | n=6,W₁; n=4,k | first belongs to I₁; second is nonprojective over k[d]/d² and does not belong to the prime-power I₁ | Sound t=1 distinction |
| LQIdealObject | n=6,U₁=W₁,U₂=W₂ | carrier dimension 3+2=5, rather than 3 or 2 from a union | Sound; unused R08 |
| LQIdealObject.Carrier | same data; all pieces zero | direct sum dimension 5; zero pieces give dimension 0 | Sound; unused R08 |
| LQFactorsThroughProjective | n=6, f:W₁→W₂ taking 1↦d₁ | factor W₁→H by 1↦d₁ then H→W₂; identity of nonprojective k does not factor | Sound distinguishing test |
| lq_induced_cross_freeness | n=6, shifts adjusted so 1↦d₁ has degree zero | f factors through H as above; stable class 0; when i=j=id on W₁, stable class≠0 and hij excludes it | Sound |
| lq_cross_piece_factors_through_projective | n=6,U=W₁⊕W₁,V=W₂; same-piece control | each component sends 1 to c d₁ and factors, stable Hom=0; identity on W₁ is nonzero | Sound finite-extension/retract test |
| primeStableRelation | p=0,1,2,3 | 0,1,1+X,1+X+X² | Polynomial definition, no K₀ theorem |
| taftStableRelation | N=4 | 1+X+X²+X³=(X+1)(X²+1), degree 3≠deg Φ₄=2 | Correct contrast; unused alias R08 |
| cyclotomicVerdierRelation | n=4 and n=30 | Φ₄=X²+1; Φ₃₀ has degree 8, versus corrected K₀ rank 30 at n=30 | Unused alias; cannot substitute for categorical theorem |
| prime_relation_eq_cyclotomic | p=2,3; composite 4 | X+1=Φ₂, X²+X+1=Φ₃; geometric sum at 4≠Φ₄ and hp excludes it | Native lemma padding R09 |

The remaining README claims, grouped only when they share the same displayed construction, were tested as follows. A “sound” result here means that the stated finite or degenerate instance passes, not that the general theorem has been formalized.

| README target | Instances tried | Computed values / both sides | Result and change |
|---|---|---|---|
| Layer 1 integral functoriality and antipode conversion | k[C₃], g↦g⁻¹; T₃ | Σg is fixed; S carries a nonzero left integral to the distinct right-integral line in T₃ | Sound finite controls |
| Layer 1 right-integral and cointegral dimensions | k[S₃] over 𝔽₂ | right integrals span Σg, cointegrals span δ₁: dimensions 1 and 1, not the same subspace/carrier | Sound |
| Layer 1 Frobenius dual bases | H=k[d]/d³, top trace | dual bases (1,d,d²) and (d²,d,1), pairing matrix anti-diagonal ones, determinant −1 | Sound |
| Layer 2 diagonal tensor associator/unit | k[S₃], noncommuting g=(12),h=(23) | (gh)(m⊗n)=ghm⊗ghn; both associations of a triple give gm⊗gn⊗gr; ε(g)=1 | Sound; finite part supplied R04 |
| Layer 2 projective tensor/internal Hom closure | H=𝔽₂[d]/d²,P=H,M=k | M⊗P≅H; Hom(k,H)≅H; Hom(H,k)≅H, ranks 2,2,2 and projective | Sound positive control; P=k would fail |
| Layer 2 ordinary stable ideal | same H | id_H=0 stably; id_k≠0, stable End(k)=k | Sound distinction from zero quotient |
| Layer 2 suspension/inverse | same H; semisimple H=k | H/kd≅k, ker ε=kd≅k, both send k to k stably; H=k stable category has only 0 | Sound |
| Layer 2 tensor-triangle exactness and coproducts | same H, coproduct of copies of k | tensor by k leaves 0→k→H→k→0 unchanged; coproduct is ⊕k; tensor by H gives projective objects, hence 0 stably | Sound finite/zero controls; arbitrary coproduct theorem not proved by this example |
| Layer 2 rigidity and nonautomatic symmetry | k[C₂]; T₃ | double dual action is S²: id for C₂, d↦q⁻¹d for T₃; plain flip interchanges d⊗1+K⊗d with 1⊗d+d⊗K | Correct need for symmetry hypotheses |
| Layer 3 invariant algebra and equivariance | C₂ acting on ℚ[x] by x↦−x | invariants ℚ[x²]; x not fixed, x² fixed; evaluation x↦0 commutes with action | Sound |
| Layer 3 opposites/tensors and smash-module equivalence | sign action | module covariance g(xm)=−x(gm), exactly gx=−xg; trivial action gives gx=xg | Sound; explicit op/cop hypotheses still need R10 |
| Layer 3 coaction on smash | sign smash, h=g | ρ(x#g)=(x#g)⊗g; both iterated coactions equal (x#g)⊗g⊗g | Sound direction |
| Layer 3 finite-dual equivalence | H=k[C₂], sign action | evaluate ρ(x)=x⊗δ₁−x⊗δg at 1,g to recover x,−x; reconstructing returns the same tensor | Sound comparison, R05 |
| Layer 4 A-split Frobenius exact structure | H=k,A=k[t]/t² | conflations are split A-sequences; every module relative projective/injective; C(A,k)=0 | Sound, differs from abelian exact structure |
| Layer 4 induced/coinduced projectives | H=k, M=A/(t) | M⊗H=M is relatively projective but not A-projective: A→A/(t) has no A-linear section | Sound |
| Layer 4 λ_M and factoring equivalence | H=k,Λ=1; Λ=0 | λ_M=id, every map factors; λ_M=0 only zero maps factor | Sound at required nonzero Λ; R01 negative control |
| Layer 4 integral invariant quotient | H=𝔽₂[d]/d²,A=k,M=N=k | invariants=k; d·Hom=0; relative Hom=k/0=k, matching stable End(k) | Sound |
| Layer 4 ordinary stable vs relative quotient | H=k,A=k[t]/t²,M=A/(t) | ordinary stable End_A(M)=k; relative End_C(M)=0 | Sound separation |
| Layer 4 right stable action and super chain-homotopy comparison | H=𝔽₂[d]/d²,M=k; two-term signed DG complex | k⊗k=k, k⊗H=0 stably; dh+hd has diagonal (1,1) on the contractible complex | Sound conventions |
| Layer 5 quasi-isomorphisms/acyclics | A=k,H=𝔽₂[d]/d² | H is acyclic, k is not; 0→H is a quasi-isomorphism, 0→k is not; cone test gives H versus k | Sound |
| Layer 5 localization = Verdier quotient | A=k; H=k with arbitrary A | first C=D=H-StMod because the acyclic objects are already 0; second C=D=0 | Sound degenerate comparisons; general equivalence remains a target |
| Layer 5 strict cofibrancy characterization | H=k,A=k[t]/t²,P=A versus P=A/(t) | A lifts through every surjection; A/(t) fails to lift id through A→A/(t); all Hom k-spaces are H-projective | Sound |
| Layer 5 arbitrary-cell versus indecomposable-cell filtration | H=𝔽₂[d]/d²,V=H | radical filtration 0⊂kd⊂H has two simple layers k; both underlying vector-space inclusions split | Sound finite model; nilpotent radical gives finite refinement generally |
| Layer 5 cellular ⇒ cofibrant; retract characterization | H=k,A=k[t]/t² | a cellular module is A-free (split layers); its retract is projective; A/(t) is neither | Sound |
| Layer 5 cofibrant ⇒ property (P), converse rejected | H=k,A=k[t]/t² | A is cofibrant and has (P); A/(t) is zero in C and has (P) but is not cofibrant | Sound repair of source wording |
| Layer 5 nonsemisimple negative control | trivial H-action, H=𝔽₂[d]/d²,A=𝔽₂[t]/t² | (A/(t))⊗H has A-length 2 and is relative-zero; A⊗H has length 4; any lift image annihilated by t reduces to 0, not id | Sound |
| Layer 5 bar replacement | H=k,A=k[t]/t²,M=A/(t) | A→M is a surjective quasi-isomorphism from a one-cell cofibrant object; M itself is not cofibrant | Consistent replacement witness; functorial bar construction still target |
| Layer 5 Hom comparison and equivalence of representative subcategories | A=k,H=𝔽₂[d]/d² | all k-vector-space modules are cellular; Hom_C(k,k)=k=Hom_D(k,k) | Sound finite control |
| Layer 5 compact generators and thick envelope | A=k,H=𝔽₂[d]/d² | one simple generator k; Hom(k,k)=k detects k; Hom(k,H)=0 stably detects zero H; finite sums k^r are compact | Sound |
| Layer 5 compactness needs finite support | coproduct ⊕ℕk in the same stable category | id has infinitely many nonzero components and is not in ⊕Hom(⊕ℕk,k); k has Hom(k,⊕ℕk)=⊕ℕk | Sound negative control |
| Layer 5 Noetherian iff | A=k[t], trivial H finite of dimension r; A=k[x₁,x₂,…] | A#H is A-free of rank r; first is Noetherian, second has strictly increasing ideals (x₁,…,x_j) extended to A#H | Both directions consistent; faithful-flat descent named |
| Layer 5 Dᵇ versus Dᶠ | A=k[t],H=𝔽₂[d]/d² trivial | A is finitely generated over A but infinite length; A/(t) has length 1; for finite-dimensional A all finite A-modules have finite length | Correct distinction |
| Layer 5 Artinian compact representatives | A=k[t]/t²,H=k | only zero derived object, represented by projective 0; for A=k,H=𝔽₂[d]/d², k represents a compact and is A-projective | Sound boundary tests |
| Layer 5 split-basic smooth comparison | A=k×k, trivial H-action; A=ℂ over k=ℝ | first has two one-dimensional simples and Dᶜ=Dᶠ; ℂ has simple dimension 2 and fails the stated split-basic hypothesis | Correct exclusion of division-algebra model |
| Layer 5 finite-cell p-DG and Qi–Sussan theorem | (p,n)=(2,3),(2,2),(3,4),(3,3) | n−1 residues 0,1,0,2; finite-cell projector true,false,true,false | Matches source Theorem 5.5; specific algebras required |
| Layer 6 representation-ring quotient | H=k[C₂], char k=2; H=k | [H]=2[k], stable K₀=ℤ/2; for H=k relation [k]=0 gives zero ring | Sound |
| Layer 6 compact K₀ rather than large K₀ | H=𝔽₂[d]/d² | compact stable K₀=ℤ/2; on large category the countable-sum relation E≅k⊕E forces [k]=0 | Sound necessity of size convention |
| Layer 6 right K₀ module structure | classes x,[V],[W] | (x·[V])·[W]=[M⊗V⊗W]=x·([V][W]); as left opposite-module scalars the product order reverses | Correct direction |
| Layer 6 finite-target derived pairing | k=𝔽₂,A=k(t),H=k[d]/d²,P=M=A | A-length(M)=1; Hom_A(A,A)=k(t), k-dimension infinite; stable Hom_H(k,k(t))=k(t) | README counterexample correct; finite target needs stronger hypothesis |
| Layer 6 finite-dimensional pairing refinement | A=k×k,P=M=Ae₁ | Hom_A(P,M)=k, dimension 1; across e₁,e₂ Hom=0 | Sound finite target |
| Layer 6 balanced tensor/ring structure | commutative A=k[t], cocommutative H with trivial action | A/(t)⊗_A A/(t)=k; unit A⊗_A M=M; derived tensor is needed when passing to D | Consistent intended derived construction; specify replacement in route |
| Layer 6 smooth-basic K₀ comparison | A=k×k,H=𝔽₂[d]/d² | K₀(A)=ℤ², stable K₀(H)=ℤ/2; both sides (ℤ/2)² | Sound split-basic finite test |
| Layer 7 failed ordinary primitive quotient | ℚ[d]/d²; 𝔽₂[d]/d² | relation Δ(d²) leaves 2d⊗d≠0 over ℚ, but 0 over 𝔽₂ | Sound |
| Layer 7 super and Sweedler repairs | odd d; Sweedler g,d | middle coefficients 1+(−1)=0; dg+gd=0 | Sound; full ℤ-grading must supplement parity |
| Layer 7 p-complex null formula | p=2,J₂; p=3,J₃ | choose h sending the top basis vector to the bottom: Σdⁱhd^(p−1−i)=id with diagonal (1,1) or (1,1,1) | Sound homotopy degree 1−p |
| Layer 7 slash detection | p=3,J₂ versus J₃ | slash dimensions (1,1) versus (0,0); projective false versus true | Both directions tested |
| Layer 7 prime stable relation | p=2,3, generator degree +1 | free q-dimensions 1+q and 1+q+q² equal Φ₂,Φ₃; suspension remains distinct from grading shift | Sound |
| Layer 7 bicharacter category/Hopf bridge | G=ℤ,χ(i,j)=q^(ij); super χ | two hexagon scalars q^((i+j)r)=q^(ir)q^(jr); super odd-odd value −1 | Sound laws; categorical bridge is a construction, not the record itself |
| Layer 7 Nichols algebra and Gaussian cancellation | N=2,q=−1; N=3,q³=1,q≠1; q=1 in char 0 | [2]_q=0, [3]_q=0; q=1 gives [N]_1=N≠0 and infinite polynomial Nichols algebra | Sound exact-order guard |
| Layer 7 Taft bosonization and rational restriction | N=3 | basis size 3²=9; Kd=q dK; degree r must have K-eigenvalue q^r; weight-1 module put in incompatible degree 1 is excluded | Sound restriction |
| Layer 7 graded Taft K₀ | N=4 | relation (1+q+q²+q³)=(q+1)(q²+1), rank 3; Φ₄ quotient rank 2 | Correct noncyclotomic warning |
| Layer 8 complete arithmetic and all n | n=4,6,12,30 | (m,N)=(2,8),(6,6),(6,24),(30,30); all denominators divide n or n² | Sound, no good-prime restriction |
| Layer 8 braiding need not square to identity | n=3,χ(1,1)=q primitive cubic | double braiding on d⊗d has scalar q²≠1; for n=2 scalar (−1)²=1 | Sound negative control |
| Layer 8 H_n trace/integral and basis | n=6, x²=y³=0, degrees 3,2 | dimension 6; Λ=xy², xΛ=yΛ=0; top-coefficient pairing pairs x^a y^b with x^(1−a)y^(2−b) | Sound nondegeneracy |
| Layer 8 ordinary bosonization | n=4,6,12,30 | dim H_n=m=2,6,6,30; bosonization dimensions 16,36,144,900 | Sound standard-monomial counts |
| Layer 8 rational graded module recovery | n=4,N=8,deg d=2 | K acts on degree r by q^r, hence Kd=q²dK; a K-weight unrelated to r fails this equality of gradings | Sound restricted comparison |
| Layer 8 stable K₀ presentation | n=4,6,30 | free graded dimensions v₁; v₁v₂ of degree 7; v₁v₂v₃ of degree 59, respectively | Sound, distinct from quotient relations |
| Layer 8 I_k, I and cross-vanishing | n=6 | dim W₁=3,dim W₂=2; I contains W₁⊕W₂ of dimension 5; every cross map factors through free H | Matches Definitions 4.5/4.12 and Proposition 4.16 |
| Layer 8 thick two-sided ideal | n=6,W₁; n=4 | cone of zero W₁→W₁ is W₁⊕TW₁ in I; prime-power I has stable image 0; tensoring by unit preserves both | Sound finite controls; source Theorem 5.5 supports general claim |
| Layer 8 Verdier quotient | n=4; n=6 | t=1 kills no further stable object; t=2 sends W₁,W₂ to 0, so their classes w₁,w₂ become 0 | Supports sampled construction |
| Layer 8 t=1 ring formula | n=4 | v₁=1+ν²=Φ₄; erroneous empty-product relation w₁=1 would give rank 0 instead of rank 2 | Correct exceptional clause |
| Layer 8 t=2 integral ring formula | n=6,12 | gcds Φ₆,Φ₁₂, degrees 2,4; cofactor Bézout identities above have value 1 | Correct integral, not only rational, conclusion |
| Layer 8 t≥3 ring formula | n=30 | gcd(w₁,w₂,w₃)=Φ₆Φ₁₀Φ₁₅Φ₃₀², degree 2+4+8+16=30; φ(30)=8 | Correct README/source correction |
| Layer 8 Φ_n² quotient obstruction | n=30 | each w_i≡0 mod Φ₃₀²; Φ₃₀ remains nonzero of degree 8<16 in that quotient | Correct normalized-isomorphism obstruction |
| Layer 8 prime-power p-complex specialization | n=4 and n=9 | one differential with d²=0,degree 2; or d³=0,degree 3; self-braiding orders 2,3 | Sound braided lift, not ordinary char-zero primitive quotient |

## Not verifiable

The review is complete with the following source limitations; they are not treated as proof that a mathematical statement is false. Sources were fetched only through the source service, with the same key reused for preprint/published alternatives. No source text or manifest was written into the PR folder.

- **Larson–Sweedler (`larson-sweedler`)**: the DOI led to JSTOR without a usable authorized text. The original Frobenius proof and its exact original theorem/page locator were not certified. The README does not supply such a locator. The linear-algebra examples above do not replace reading that proof.
- **Montgomery (`montgomery`)**: the AMS ebook landing page did not yield an authorized text through the service. Its module-algebra/smash/bosonization source locators remain uncertified.
- **Fischman–Montgomery–Schneider (`fischman-montgomery-schneider`)**: the DOI reached the AMS landing page, but the service did not retrieve an authorized PDF. The exact original Nakayama locator was not verified; the handed formulas were independently tested on Taft algebras and compared with the native stable convention.
- **Majid's book (`majid-book`)**: the Cambridge landing page did not supply readable book text. The separate open bosonization article was fetched successfully; no assertion is made that its numbering certifies the book citation.
- **Pareigis (`pareigis`), Erdmann–Solberg–Wang (`erdmann-solberg-wang`), Radford (`radford`)**: the source service classified their Elsevier DOIs as `uncertified`/paywalled. They were not bypassed or re-requested under new keys. In particular the cited published Theorem 2.2 in Erdmann–Solberg–Wang was not certified from its text.
- **Version limits**: Qi and Qi–Sussan (2017) were read as arXiv v2, not as their printed journal/volume text. The preprint locators used above are explicit; equality of all published page numbers was not assumed. Laugwitz–Qi and Khovanov–Qi were read in the publisher's open texts. Khovanov's first-steps article, Qi–Sussan (2022), Majid's article and Kapranov were fetched legally, but their full contents were not independently certified beyond the checks specifically recorded above.

The unresolved retrievals are consolidated in the job's `needs-references.toml`; successful later retrievals were removed from that list. No missing text is used to postpone this verdict. In the mathematical table, an instance check is explicitly weaker than a general proof, particularly for arbitrary coproducts, compact generation, categorical coherence and functorial replacement. Those general claims were audited for source/ownership/dependency shape rather than asserted proved by the finite calculations.

## Source issues

- **Error** in laugwitz-qi at Theorem 5.15 and its final proof paragraph, printed pp. 574–575: the source says the quotient is cyclotomic for every n; it should be the quotient by the complementary-cell polynomials for t≥2, cyclotomic only for t≤2; affects a stated result.
- **Error** in qi at Corollary 6.5, arXiv v2 printed p. 31: the source says homotopy-invariant property (P) implies strict cofibrancy; it should be strict cellular property (P) implies cofibrancy, or require A-projectivity additionally; affects a stated result.
- **Error** in qi at §9.1, arXiv v2 printed p. 57: the source says the derived Hom pairing always has finite-length k-valued output under Noetherian hypotheses; it should have large stable target unless additional k-finiteness is imposed; affects a stated result.
- **Error** in qi-sussan-2017 at §5.2, arXiv v2 printed p. 16, paragraph preceding Theorem 5.5: the source says the quantum integer [n] is a unit whenever p does not divide n−1; it should require p not dividing n, since [p]=0; affects a stated result.

# Review of GlobalQuadraticForms (pull request #1200 at 1bc4ccc)

**Verdict:** needs changes

AI-assisted independent review. Nine findings, five blocking (two P1 and three P2). This is a full-folder review, including defects retained from main; it does not attribute every finding to the small advertised sign correction. The rank-four sign correction itself is correct.

## R01 (P1) — The realization equivalence admits a rank-zero counterexample

**Location:** `TauCetiRoadmap/GlobalQuadraticForms/README.md:879`, “I.IsAdmissible ↔ ∃ Q regular over K, globalInvariants Q = I”; also lines 358–367 and 770–772.

**Claim:** Every invariant record realized by a regular form is admissible. The surrounding explanation tries to exclude rank zero by saying its discriminant has no unit representative and the invariant carrier has positive rank.

**Witness:** Over ℚ, take the zero form on ℚ⁰ and its actual `globalInvariants`. Its rank is 0 and determinant is the empty product 1. Realization is true; admissibility requires 1 ≤ 0, hence is false.

**Repair:** Require the realizing form to have positive rank in the equivalence, or assume `1 ≤ I.rank`. Describe `GlobalFormInvariants.rank` as an unrestricted natural number and distinguish the admissible subtype. Put finite support under admissibility rather than the raw carrier: the raw record also permits sᵥ=−1 at every finite place. Delete the claim that the zero form lacks a unit discriminant: it has class [1]. On the witness the repaired positive-rank existential is false, matching inadmissibility. `Suggested.lean:152` already has the safe forward direction; it must not acquire the unrestricted converse. The scratch boundary probe proves that a regular rank-zero form has an inadmissible invariant record.

## R02 (P1) — The supplied push gate fails its build check

**Location:** `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean:1` and the worker's gate result for this head.

**Claim:** The folder is ready for acceptance with a passing gate.

**Witness:** The recorded gate ends `build=12 FAIL`. All twelve diagnostics are non-`sorry` warnings about importing module-system Mathlib from files without a `module` header; the first names this file.

**Repair:** Resolve the module-system migration for the affected build inputs through their owners, starting with the appropriate `module` header in this file, and rerun the exact targeted gate. Do not suppress warnings with `set_option`, or edit other roadmap folders in this review. The affected inputs are listed under Verified sound. Direct `lake env lean` succeeds with twelve `sorry` warnings, so this is a gate/build-warning failure, not a demonstrated elaboration error. A scratch copy with the leading `module` header also elaborated with only the twelve expected `sorry` warnings. That tests the local migration candidate, but does not turn the recorded twelve-file gate green. Severity follows the brief's mandatory classification for a failing build check.

## R03 (P2) — Higher-rank induction loses nonzero values when T is empty

**Location:** `TauCetiRoadmap/GlobalQuadraticForms/README.md:678`–683, “choose one global x∈U(K) … define b:=Q(x)”.

**Claim:** Approximation on the anisotropic-place set supplies the nonzero b needed to apply induction to the regular form ⟨b⟩⊥W.

**Witness:** Let U=⟨1,1⟩ and W=⟨1,−1,1⟩ over ℚ. W contains a hyperbolic plane everywhere, so T=∅. The allowed choice x=0 gives b=0; ⟨0⟩⊥W is singular and (x,y)=(0,0) is not isotropic.

**Repair:** Consume `QuadraticForm.exists_apply_ne_zero_locallyRepresentsScalar_neg` from `TauCeti/NumberTheory/QuadraticForm/Global/ApproximateValue.lean:61`. Its proof explicitly handles the empty case at lines 117–135. If retaining an explanatory proof, separate T=∅ and choose any x with U(x)≠0; regular positive-rank U supplies one. In this instance x=(1,0) gives b=1 and y=(0,1,0) gives W(y)=−1, so (x,y) is nonzero and the induction input is regular. This is a gap in the specified route, not a counterexample to Hasse–Minkowski.

## R04 (P2) — Reconcile targets with the substantial theory already at the pin

**Location:** `TauCetiRoadmap/GlobalQuadraticForms/README.md:222`–245, 289–307, 315–334, 358–385, 492–497, 592–605, and 774–784.

**Claim:** Define the localizations, signatures and invariant records, prove their existing API, prove archimedean symbols here, and prove quaternary descent here.

**Witness:** `TauCeti/NumberTheory/HilbertSymbol/Archimedean.lean:59` proves the displayed real formula; `TauCeti/LinearAlgebra/QuadraticForm/QuaternaryDescent.lean:119` proves the displayed descent; `Global/LocalRealization.lean:243` already constructs the local forms requested in §7.1.

**Repair:** Move existing constructions and results into Scope and ownership and exact pinned supplier contracts; remove them as fresh targets. Retain genuinely missing extensions with a sentence distinguishing them. The inventory below also resolves localizations, complex automaticity, signatures, finite Hasse support, local classification and invariant records. Keep the missing global square/product/prescription and Hasse–Minkowski/existence endpoints. For the real test (−1,−1), the pinned formula gives −1; for descent the residual discriminant is [−1]; for the admissible rank-one record the pinned local-realization theorem gives ⟨1⟩. No new carrier is needed in any of these cases. This repair builds on this existing roadmap; it does not replace it by a newly planned roadmap.

## R05 (P2) — State the promised form-level global realization headline

**Location:** `TauCetiRoadmap/GlobalQuadraticForms/README.md:790`–797 and 882–883; `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean:26` and 152–156.

**Claim:** Every headline is stated, and existence returns a global form with the prescribed local isometries, not only an equal invariant record.

**Witness:** The only existence signature returns `Q.globalInvariants hQ = I`. There is no local family or local-isometry conclusion. The pin supplies `GlobalFormInvariants.IsLocalRealization` in `TauCeti/NumberTheory/QuadraticForm/Global/LocalRealization.lean:91`.

**Repair:** State the form-level realization theorem on this native carrier: given admissible I and local families U,R realizing I, return regular Q on Kⁿ with its invariant equality and `(Q.atFinitePlace v).Equivalent (U v)` and `(Q.atRealPlace w).Equivalent (R w)` at every place. Complex places can use the proved automaticity. A scratch signature on precisely these carriers was elaborated after building the missing `TauCeti.NumberTheory.QuadraticForm.Global.LocalRealization` object file. For I of ⟨1⟩ and U,R all ⟨1⟩, the required maps are identity isometries. The current equality-only theorem does not directly test the promise at README line 883.

## R06 (P3) — Supply definition Checks and the required layer structure

**Location:** `TauCetiRoadmap/GlobalQuadraticForms/README.md:252`–268 and 354–402, representative of the whole file.

**Claim:** The definitions and layers provide implementable APIs and discriminating checks in the required roadmap form.

**Witness:** There are zero `**Checks.**` lists. Four local predicates are introduced together, and the invariant/admissibility definitions have no three-test lists. No layer ends with the required Examples and Dependencies subsections.

**Repair:** After removing imported targets under R04, add an API and at least three discriminating Checks for every retained definition, with computed values and negative controls; add the required Summary, Scope and ownership, Exact supplier contracts, How to read the build, layer headings and per-layer endings. For local isotropy, test rank 0=false, H=true, and ⟨1,1,−3⟩=false despite real isotropy. For admissibility, test ⟨1⟩=true, the rank-zero record=false, and a rank-one two-negative-sign record=false although its product is 1. These distinguish the intended predicates from real-only isotropy and product-only admissibility.

## R07 (P3) — Make the source and supplier locators precise

**Location:** `TauCetiRoadmap/GlobalQuadraticForms/README.md:64`, 476–499, 1038–1056.

**Claim:** The claims have exact, independently checkable source and supplier locators.

**Witness:** The weak-approximation row says Global Number Fields “Layer 0.2”; its main README places the theorem in Layer 1 at line 259. The archimedean computation has no individual locator; no cited theorem has a printed page.

**Repair:** Cite `Completed/GlobalNumberFields/README.md`, Layer 1, or the pinned native weak-approximation declaration. Attach source theorem/section and printed-page locators to the retained mathematical claims, including the archimedean formula, instead of using broad chapters for Lam, Cassels, Neukirch and Milnor–Husemoller. Resolve these against a legal text; do not invent page numbers. The repaired supplier citation was tested against its mixed finite/infinite completion signature at `Completed/GlobalNumberFields/Suggested.lean:34`, including independent targets at 2 and ∞. Source-text availability is separately recorded below; this finding concerns missing/inaccurate locators, not inaccessible books.

## R08 (P3) — Delete the one-step isometry corollary from the acceptance file

**Location:** `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean:182`–190.

**Claim:** `equivalent_of_locallyEquivalent` is an additional acceptance headline.

**Witness:** Its entire proof is `(hasseMinkowski_equivalent Q hQ R hR).2 h`. It is exactly one direction of the existing headline at line 135, with no additional content.

**Repair:** Delete it from `Suggested.lean`; keep the named downstream corollary in the README. The equality and implication versions both return true for H versus ⟨2,−2⟩, and both fail to produce an isometry for ⟨1⟩ versus ⟨−1⟩ because the real local hypothesis is false. No consumer-facing mathematics is lost. All twelve sorried declarations were separately tried with `simp`, `rfl`, and `infer_instance`; none closed that way.

## R09 (P3) — Stop making a particular proof route mandatory

**Location:** `TauCetiRoadmap/GlobalQuadraticForms/README.md:427`, “It is the one route this roadmap accepts”; also 516 and 800.

**Claim:** Only the prescribed norm-index and correction-plane proof organizations are acceptable.

**Witness:** The binding roadmap format says a proof sketch names a route and its inputs without making that route mandatory. These sentences explicitly do the opposite.

**Repair:** Present these as available proof routes, retaining all mathematical hypotheses, input ownership and the warnings against invalid inferences. Other complete proofs must satisfy the same theorem and supplier contracts. For a=4 in the global square theorem, the witness 2²=4 remains sufficient regardless of proof organization; for a nonsquare the proposed norm-index contradiction still computes 1≠2. This changes a process restriction, not theorem generality.

## Verified sound

**Scope and mechanical evidence.** Confirmed HEAD `1bc4ccc4a056d34d48a4b02fddd33110d5a475c7`. The outside-folder diff against `origin/main...HEAD` is empty. No PR file was edited. The given gate has all scanners and the dependency check at zero; only its build-warning check fails. No `set_option`, sorry-defined data, alien Lean imports, admitted examples, or computational algorithm was found in the two reviewed files. The mathematical construction arguments are existence proofs, not executable algorithms. Source copying cannot be certified without the texts.

The independent dependency command returned exactly:

```text
depcheck: 204 roadmaps, 1496 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Read all prerequisite paragraphs and all supplier-table rows; the four incoming suppliers are GlobalNumberFields, NumberFieldArithmetic, ClassFieldTheory and QuadraticFormInvariants. OrthogonalSpinGroups and IntegralLattices are consumers. No undeclared missing supplier contract was established. The mistaken Layer 0.2 locator is R07, not an unowned theorem: the named theorem really exists in Layer 1.

The twelve module-warning inputs in the supplied gate are:

- `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean`
- `Completed/IntegralLattices/Suggested.lean`
- `Completed/RestrictedProducts/Suggested.lean`
- `Completed/NumberFieldArithmetic/Suggested.lean`
- `Completed/GlobalNumberFields/Suggested.lean`
- `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean`
- `Completed/ProfiniteProPGroups/Suggested.lean`
- `Completed/LocalFieldsRamification/Suggested.lean`
- `TauCetiRoadmap/ClassFieldTheory/Suggested.lean`
- `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean`
- `Completed/OrthogonalSpinGroups/Suggested.lean`
- `TauCetiRoadmap/IntegralLattices/Suggested.lean`

**Lean evidence.** Direct elaboration of the original file exited 0, with precisely twelve `sorry` warnings. A scratch copy tried each of those twelve bodies with single-tactic `simp`, `rfl`, and `infer_instance`; all remained admitted, with no other warnings/errors. Read the pinned candidate APIs to rule out a matching complete global theorem for `exact`; the completed corollary is R08. Appended and elaborated `#check @name` for all thirteen declarations. NumberField, finite-dimensionality, regularity and the scalar nonzero hypotheses are retained; no section binder disappeared. The two module variables in the representation/equivalence signatures share a universe, but ordinary cross-universe forms can be transported; no false mathematical claim follows. The rank-zero discrepancy is in the README, not a dropped Lean binder.

**Headlines audited.** Global square detection (§4.2), the localized product formula, fixed-argument and unrestricted sign prescription (§4.4), isotropy (§5.5), scalar/form representation and isometry (§6), prescribed-local realization and admissible-system existence (§7), classification (§8.1), local-global hyperbolicity/Witt injectivity (§§8.2–8.3), and the SO-facing form corollary (§8.4). The file states twelve admitted targets and one proved corollary. Existence with explicit local isometries is absent (R05). The injectivity statement uses a real Witt ring and actual scalar extension; no stand-in carrier is used. The invariant equality criterion and positive-rank realization together express the classification content; no separate artificial bijection carrier is necessary.

**Pinned declarations opened.** Mathlib pin `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti pin `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. The following 25 inventory rows identify the pinned declarations inspected. Paths are relative to the corresponding library repository. In particular, the native rank carrier is ℕ, not a positive-rank subtype; the native finite product has no support hypothesis in its definition, and its meaningful-use theorem and admissibility carry that hypothesis.

| Object inspected | Pinned declaration and file:line | Content checked |
|---|---|---|
| Isotropy | `QuadraticMap.Anisotropic`, `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1056` | Zero only at zero; the zero-dimensional form is anisotropic. |
| Scalar extension | `QuadraticForm.baseChange`, `Mathlib/LinearAlgebra/QuadraticForm/TensorProduct.lean:127`; `baseChange_tmul`:131 | Tensor-product carrier; q(a⊗x)=a²q(x). |
| Algebraically closed classification | `QuadraticForm.equivalent_of_isAlgClosed`, `Mathlib/LinearAlgebra/QuadraticForm/AlgClosed.lean:59` | Finite dimension, invertible 2, separating associated forms; fixed carrier. |
| Scalar/form representation | `QuadraticMap.Represents`, `IsRepresentedBy`, `TauCeti/LinearAlgebra/QuadraticForm/Representation.lean:44`, :47 | Value existence versus an injective isometry. |
| Localizations | `QuadraticForm.atFinitePlace`, `atRealPlace`, `atComplexEmbedding`, `TauCeti/NumberTheory/QuadraticForm/Global/Localization.lean:88`, :94, :103 | Actual base changes, not arbitrary local forms. |
| Local predicates | `IsLocallyIsotropic`, `LocallyRepresents`, `LocallyRepresentsScalar`, `LocallyEquivalent`, `TauCeti/NumberTheory/QuadraticForm/Global/Predicates.lean:51`, :66, :85, :147 | Every finite and every real place; no complex clause. |
| Complex automaticity | `QuadraticForm.equivalent_atComplexEmbedding_iff_finrank_eq`, `TauCeti/NumberTheory/QuadraticForm/Global/ComplexPlaces.lean:65` | Rank comparison on genuine localizations. |
| Signatures | `QuadraticForm.realSignature`, `realPositiveIndex`, `realNegativeIndex`, `TauCeti/NumberTheory/QuadraticForm/Global/Signature.lean:75`, :80, :85 | Positive/negative indices of localized forms. |
| Signature API | `realSignature_neg`, `realSignature_smul_of_neg`, `equivalent_atRealPlace_iff_realSignature_eq`, same file :259, :325, :340 | Negation swaps indices; real isometry uses both indices. |
| Finite Hasse | `QuadraticForm.finiteHasse`, `finiteHasse_prod`, `TauCeti/NumberTheory/QuadraticForm/Global/FiniteHasse.lean:79`, :182 | Class invariant and orthogonal-sum cross symbol. |
| Finite support | `QuadraticForm.hasFiniteMulSupport_finiteHasse`, `TauCeti/NumberTheory/QuadraticForm/Global/HasseSupport.lean:39` | Finite-dimensional regular global form. |
| Invariant record | `GlobalFormInvariants`, `TauCeti/NumberTheory/QuadraticForm/Global/Invariants.lean:90` | Unrestricted rank, square class, arbitrary finite signs and real indices. |
| Admissibility | `GlobalFormInvariants.IsAdmissible`, same file :178 | Positive rank, real bound/sign, finite support, rank-1/2 exclusions, product one. |
| Actual invariants | `QuadraticForm.globalInvariants`, `TauCeti/NumberTheory/QuadraticForm/Global/FormInvariants.lean:77` | Defined also in rank zero. |
| Admissibility reduction | `QuadraticForm.isAdmissible_globalInvariants_iff`, same file :165 | Positive rank AND product one, not realization alone. |
| Isometry invariance | `QuadraticMap.Equivalent.globalInvariants_eq`, same file :193 | Equal full records under global isometry. |
| Real Hilbert symbol | `TauCeti.hilbertSymbol_real`, `TauCeti/NumberTheory/HilbertSymbol/Archimedean.lean:59` | Both negative gives −1. |
| Zero discriminant | `TauCeti.RegularFormClass.discr_zero`, `TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Discriminant.lean:134` | Additive square-class zero means multiplicative class [1]. |
| Discriminant parity | `TauCeti.RegularFormClass.signedDiscr_eq_sign_add_discr`, same file :257 | Rank factor (−1)^(n(n−1)/2). |
| Quaternary descent | `QuadraticForm.not_anisotropic_of_not_anisotropic_baseChange_quaternary`, `TauCeti/LinearAlgebra/QuadraticForm/QuaternaryDescent.lean:119` | Regular rank 4, nonsquare determinant, quadratic extension and specified root. |
| Nonzero approximated value | `QuadraticForm.exists_apply_ne_zero_locallyRepresentsScalar_neg`, `TauCeti/NumberTheory/QuadraticForm/Global/ApproximateValue.lean:61` | Finite exceptional set, with explicit empty-set branch. |
| Local realization | `GlobalFormInvariants.IsLocalRealization`, `IsAdmissible.exists_isLocalRealization`, `TauCeti/NumberTheory/QuadraticForm/Global/LocalRealization.lean:91`, :243 | Real local families, regularity and actual invariant equations. |
| Mixed weak approximation | `TauCeti.GlobalNumberFields.weakApproximation_denseRange`, `TauCeti/NumberTheory/NumberField/Global/Approximation/Weak.lean:204` | Dense diagonal in finite products of finite/infinite completions. |
| Witt scalar extension | `TauCeti.WittRing.baseChange`, `TauCeti/LinearAlgebra/QuadraticForm/Witt/BaseChange.lean:211`; `baseChange_wittClass`:226 | Ring homomorphism induced on the hyperbolic quotient; actual scalar extension of forms. |
| Example isometry | `equivalent_sumTwoSquaresSubSq_sqAddTwoSqSubTwoSq`, `TauCeti/NumberTheory/QuadraticForm/Global/HyperbolicIsometry.lean:68` | The README's two ternary forms are already identified. |

**Resolved cross-roadmap ownership.** Used the roadmap grep/show tools, the main checkout, the board packages and the supplied sibling checkouts; search terms included the objects quaternary descent, Hasse–Minkowski, signatures, local/global invariants, Hilbert symbol comparison/product and the idelic norm. Existing-roadmap revisions were not treated as suppliers in place of main.

- `Completed/GlobalNumberFields/README.md:157` and :259, `Suggested.lean:34`, :371, :381: mixed approximation and both idele coordinate maps; Layers 6 and 8 provide idele carriers/norms.
- `Completed/NumberFieldArithmetic/README.md:1303`–1371, `Suggested.lean:1444`: the canonical local-field instance and completion tower map, with valuation/topology and LiesOver hypotheses. This resolves the frozen consumer name even though it is not printed in that README's §5.1 prose.
- `TauCetiRoadmap/ClassFieldTheory/README.md:1730`–1820 and `Suggested.lean:3392`, :3404, :3409, :4120, :4184, :4205, :4396: principal ideles, idele norms, the norm index, arbitrary-idele local norm criterion, cyclic Hasse norm and additive Hilbert reciprocity. The additive equation is converted to signs by QFI; it is not literally a product theorem in CFT.
- `TauCetiRoadmap/QuadraticFormInvariants/README.md:952`, Layers 1, 6A, 6C, 6D, especially :1695, :2126–2137, :2204–2225; `Suggested.lean:2552`, :2578: representation/Witt theory, dyadic square openness, local invariants/classification and cohomological comparison. Its product bridge is written with cohomological factors, so the localized norm-equation signature here is a genuine adapter, not an exact duplicate.
- `Completed/OrthogonalSpinGroups/README.md:947`, :965 and `TauCetiRoadmap/IntegralLattices/README.md:476`, :978 consume global isometry in the stated direction. No incoming torsor or integral-lattice theory was smuggled into this roadmap.
- Open `QuaternionArithmetic/README.md:145`–147 consumes this roadmap's prescription/isotropy/representation/isometry. Open `GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:15` and its board package assign global Witt injectivity to this roadmap. No competing owner for the missing global endpoints was found in those results.

The citation scanner's lone unresolved name, `TauCeti.NumberField.QuadraticForm.hasseMinkowski_equivalent` at README line 762, is explicitly a suggested implementation name; the acceptance declaration exists under `TauCetiRoadmap.GlobalQuadraticForms`. It is not falsely advertised as pinned code. No foreign roadmap's fully qualified declaration name is introduced by this Lean file. Format comparisons used the main GlobalNumberFields, NumberFieldArithmetic and EffectiveBounds roadmaps; their older layouts do not waive this review's explicit shape requirements.

**Adversarial computations.** The table below records actual values, not source certification or formal proofs of the general endpoints. Let H=⟨1,−1⟩, A=⟨1,1⟩, T=⟨1,1,−3⟩, and use the plain determinant square class. A check marked “passes” means that these instances agree, not that finite examples prove the universal assertion. Restrictions exclude zero rings, characteristic-two/equal-characteristic fields, inseparable extensions and arbitrary topologies; dyadic completions remain included. The only groups constructed here are abelian norm/square-class/Witt groups, so substituting S₃ or Q₈ is outside their carriers.

There are 107 rows. Each entry gives the tested values; related API operations have separate rows. The six seeded targets appear explicitly.

| Statement | Instances tried | Computed values on the two sides / distinguishing values | Result | Required change |
|---|---|---|---|---|
| Conventions: plain/signed discriminant | n=0,1,2,4 | sign factors 1,1,−1,1; det H=−1, signed det H=1 | passes; the advertised rank-four correction is right | none |
| Conventions: real Hasse sign | negative index q=0,1,2,3,4 | (−1)^C(q,2)=1,1,−1,−1,1 | passes; diagonal pair count gives same list | none |
| 0.1 finite localization | H over ℚ at 2 and 3, vector (1,1) | 1²−1²=0 globally and in both completions; rank 2→2 | passes | reuse pinned localization |
| 0.1 real/complex localization | A at ℝ and ℂ | A(1,i)=0 over ℂ; x²+y²=0 over ℝ only at (0,0) | passes; scalar extension can create isotropy | reuse |
| 0.1 pure-tensor scaling | ⟨3⟩, scalar 2, vector 1 | q(2⊗1)=12=2²·3 | passes; excludes missing square factor | reuse baseChange_tmul |
| 0.1 isometry/representation transport | H→H identity; ⟨1⟩→H first coordinate | q maps to same x²−y²; image value x² on both sides; ranks 2,1 | passes | reuse |
| 0.1 orthogonal sum/negation/scaling | ⟨2⟩⊥⟨−3⟩ on (1,1) | value −1; negated value 1; scaling by 4 gives −4 before/after localization | passes | reuse |
| 0.1 regularity and rank | empty form, ⟨1⟩, H | det 1,1,−1; ranks 0,1,2 preserved by field extension | passes | R01 correct rank-zero prose |
| 0.1 tower compatibility | ℚ⊂ℚ(√2), H, vector (1,1) | direct/two-stage matrices diag(1,−1); value 0=0 | passes for the canonical tower maps | reuse |
| 0.2 local isotropy predicate | zero-dimensional form, H, T | global/local isotropy false/false, true/true, false/false; T is real-isotropic but 3-anisotropic | passes; real-only model fails T | R06 |
| 0.2 local scalar representation | ⟨1⟩, scalar 4 then −1 | 4=2² globally/locally; −1 has no real square root, so false/false | passes in both directions | R06 |
| 0.2 local form representation | ⟨1⟩ into H; H into ⟨1⟩ | true/true via first axis; false/false since 2>1 | passes; checks direction | R06 |
| 0.2 local equivalence | H and ⟨2,−2⟩; ⟨1⟩ and ⟨−1⟩ | true/true; false/false at ℝ (signatures (1,0)≠(0,1)) | passes | R06 |
| 0.2 isometry invariance and rank | A and ⟨4,1⟩ via (x,y)↦(2x,y) | values 4x²+y² agree; both ranks 2; local predicate values agree | passes | reuse |
| 0.3 algebraically closed isotropy | ℂ, ranks 0,1,2 | nonzero zero-vector exists: false,false,true; witness (1,i) in rank 2 | passes with rank≥2 | reuse |
| 0.3 complex classification | ⟨1,1⟩ and ⟨1,−1⟩ over ℂ | equal ranks 2=2; map (x,y)↦(x,iy) preserves values; rank 1 vs 2 fails | passes | reuse |
| 0.3 complex scalar/form representation | ⟨1⟩ represents −1; 0-space represents 1; dimensions 1→2 and 2→1 | i²=−1; false since 0≠1; embedding true then false | passes | state rank conditions explicitly |
| 1.1 positive/negative indices | diag(1,−2,−3) | (p,q)=(1,2), p+q=3; determinant 6 has sign +1=(−1)² | passes | reuse |
| 1.1 signature sum | H⊥⟨−1⟩ | (1,1)+(0,1)=(1,2) | passes | reuse |
| 1.1 negation | −diag(1,−2,−3) | signature (2,1), versus original (1,2) | passes | reuse |
| 1.1 positive/negative scaling | 2A and −2A | (2,0) and (0,2), respectively | passes; excludes forgetting sign | reuse |
| 1.1 same real place | ℚ unique real embedding, ⟨−2⟩ | index (0,1) from either representation; det sign −1 | passes | reuse |
| 1.2 real classification/realization | (p,q)=(0,0),(1,0),(1,1),(0,2) | diagonals empty,1,H,−A; signatures exactly given; H and −A have different indices | passes | reuse |
| 1.2 real determinant and Hasse | H and −A | det signs −1,+1; Hasse signs +1,−1; formulas match q=1,2 | passes | reuse |
| 2.1 localized determinant | diag(2,3), at p=3 | det=6 globally and locally; local valuation 1 so nonsquare | passes; distinguishes trivial class | reuse |
| 2.1 finite Hasse definition/isometry | diag(2,5) and diag(8,5), at 2,5 | both signs −1,−1; rescaling first coordinate by 2 multiplies weight by 4 | passes | reuse |
| 2.1 orthogonal-sum Hasse formula | ⟨−1⟩⊥⟨−1⟩ at 2 | s=−1; s₁s₂(d₁,d₂)=1·1·(−1)=−1 | passes; cross term necessary | reuse |
| 2.1 negation/scaling Hasse | A→−A at 2; n=2,d=1,a=−1 | s(A)=1; s(−A)=−1; RHS 1·(−1,−1)·(−1,1)=−1 | passes | reuse |
| 2.2 finite Hasse support | −A over ℚ | s₂=−1; sₚ=1 for all odd p; finite support {2} | passes; dyadic place cannot be discarded | reuse |
| 2.2 almost-all isotropy | T over ℚ | anisotropic at 2,3; isotropic at every p≠2,3 (regular ternary unit reduction) | passes; finite bad set {2,3} | reuse |
| 2.3 finite local classification | H versus 2H at 3; A versus −A at 2 | first: (2,[−1],1) on both; second: (2,[1],1) versus (2,[1],−1) | true/true and false/false | reuse |
| 2.3 local realization exceptions | rank 1,s=−1; rank 2,d=[−1],s=−1 | 0 realizations in both cases; ⟨1⟩ and H give s=1 | passes | retain small-rank hypotheses |
| 3.1 invariant carrier/extensionality | record of zero form; change rank 0→1 | both are legal raw records; unequal since 0≠1; first is not admissible | README positive-rank carrier claim fails | R01 |
| 3.1 raw finite support | sₚ=−1 at every rational prime | support is infinite; raw record exists; admissibility=false | unconditional support request is false | R01: put support under admissibility |
| 3.2 positive-rank condition | I₀=globalInvariants(0-space) | rank 0; 1≤0=false; product 1 | passes as rejection, refutes §7.3 converse | R01 |
| 3.2 real compatibility | rank 2,d=[1],p=1 at ℝ | expected determinant sign −1 but supplied +1; inadmissible | passes; excludes arbitrary real index | R06 |
| 3.2 natural subtraction | raw rank 1,p=2 | 1−2=0; p+(1−p)=2≠1; bound p≤n=false | admissibility excludes junk value | R06 |
| 3.2 finite support/product independence | s₂=s₃=−1, other s=1 | product on {2,3}=1; enlarged {2,3,5} still 1 | passes | reuse |
| 3.2 rank-one exclusion | n=1,d=[1],p=1,s₂=s₃=−1 | real sign 1; total product 1; local rank-one condition false | passes; product-only model fails | R06 |
| 3.2 rank-two exclusion | n=2,d=[−1],p=1,s₂=s₃=−1 | total product 1; required local signs 1≠−1 | passes; product-only model fails | R06 |
| 3.2 Hasse product | −A over ℚ | finite product −1, real product −1, total 1 | passes | none |
| 3.3 global-form admissibility | ⟨1⟩, H, −A | records (1,[1],1,p=1), (2,[−1],1,p=1), (2,[1],s₂=−1,p=0); all products 1 | passes in positive rank | retain positive-rank hypothesis |
| 4.1 vector approximation | ℚ² at 2 and ℝ; target (1,2) | global (1,2) has error (0,0) at both places; empty target set also admits (0,0) | passes; emptiness does not force nonzero | R03 |
| 4.2 global square theorem | a=4,S=∅; a=2,S=∅ | 4=2² globally/all places; 2 is nonsquare mod 3 and globally, so premise/conclusion false | passes | none |
| 4.2 norm-index proof | hypothetical nonsquare split outside S | quadratic degree 2; asserted norm surjectivity would give index 1; 1≠2 | valid contradiction once its premises are obtained | R09 remove exclusivity |
| 4.2 false idele factorization warning | ℚ, real coordinate √2, all finite coordinates 1 | would require rational principal scalar √2 to make real coordinate 1; impossible | warning correct | none |
| 4.3 norm-equation adapter | ℚ(i)/ℚ, a=5 then 3 | 5=1²+2² is a norm; v₃(3)=1 is odd, so 3 is not a local norm at 3 | passes; ternary equation has witness (1,1,2) for ⟨−5,1,1⟩ | none |
| 4.3 split binary case | d=1, a=3 | (2)²−(1)²=3; split norm (u,v)↦uv is onto; ⟨1,−1⟩ already isotropic | must handle square d separately from a quadratic field | clarify the elementary branch |
| 4.4 localized product formula [sample/headline] | (a,b)=(−1,−1) and (2,5) over ℚ | first: s₂=s∞=−1, others 1, product 1; second: s₂=s₅=−1, s∞=1, product 1 | passes; omitting 2 gives −1 | none |
| 4.4 real symbol [sample] | (−1,−1),(−1,1),(1,−1) | norm equation x²+y²=−1 impossible→−1; 1=1²→+1; −1=0²−1²→+1 | matches both-negative criterion | R04 reuse |
| 4.4 complex symbol [sample] | a=b=−1 over ℂ | b=i²−a·0²=−1, so symbol 1 | passes | R04 reuse |
| 4.4 real symmetry/bimultiplicativity | a=a′=−1,b=−1 | (aa′,b)=(1,−1)=1; (a,b)(a′,b)=(−1)²=1; swapped pair also −1 | passes | reuse real API |
| 4.4 fixed-b sign prescription [sample/headline] | b=−1,T={2,∞}; b=5,T={2,5}; T=∅ | a=−1 and a=2 give exactly indicated supports; a=1 gives empty support | passes; every specified b is locally nonsquare | none |
| 4.4 sign prescription restrictions | T={∞}; or b=1,T={2,3} | first requested product −1≠1; second has (a,1)=1 at both places, never −1 | negative controls pass: parity/nonsquare assumptions essential | none |
| 4.4 unrestricted-pair prescription [headline] | T={2,∞} and T=∅ | pairs (−1,−1) and (1,1), supports equal T | passes | none |
| 4.4 nonsquare choice by approximation | b=−2 at {2,∞} | v₂(b)=1 and real b<0; nonsquare at both; 4 has valuation 2 and is positive | passes; excludes global-square wrong choice | reuse Nonsquare API |
| 4.4 idele character φ | b=−1; idele with i₂=−1, all others 1 | φ(i)=−1, φ(i²)=1=(−1)²; principal −1 has φ=1 | passes; finite support for arbitrary ideles needs unit-at-almost-all argument | reuse IdeleCharacter API |
| 4.4 kernel/index comparison | surjective φ to ±1; T of size 0,2 | kernel index=2=norm-class index; φ(j)=1 and (−1)²=1 | passes with the supplied norm-index theorem | none |
| 4.4 form Hasse product | diag(−1,−1,1) | s₂=−1, s∞=−1, total 1; pairwise product equals 1 | passes | none |
| 4.5 coordinate continuity | H near (1,0), perturb to (1+t,0) | value 1+2t+t²→1; at t=0 value 1 | passes | reuse |
| 4.5 odd square openness | ℚ₃: 4∈1+3ℤ₃; 2∉square subgroup | 4=2²; residue 2 nonsquare in F₃ | passes | reuse |
| 4.5 dyadic square openness | ℚ₂: 9∈1+8ℤ₂; 5∈1+4ℤ₂ | 9=3²; odd squares ≡1 mod 8, so 5 nonsquare | passes; depth 2e+1=3 at e=1 | retain dyadic input |
| 4.5 real square openness | ℝˣ: 4 and −1 | 4=2²>0; −1<0 not square; positive half-line open | passes | reuse |
| 4.5 square stability of representation | ⟨3⟩ represents 3, multiply by 4 | q(1)=3, q(2)=12=4·3; factor 0 excluded from unit quotient | passes | reuse |
| 5.1 binary [sample] | H and A over ℚ | d(H)=[−1], zero (1,1); d(A)=[1], no real nonzero zero | passes; both directions tested | none |
| 5.1 ternary [sample] | ⟨−5,1,1⟩ and T | first: −5+1+4=0, norm 5; second: x²+y²=3z² has no primitive mod-3 solution | passes; split d branch should be stated | clarify branch, not a false theorem |
| 5.1 square-discriminant quaternary/ternary restriction [sample] | H⊥H with U=⟨1,−1,1⟩; ⟨1,1,1,1⟩ over ℝ | det 1 in both; first ambient/U isotropic via (1,1,0,0)/(1,1,0); second ambient/U anisotropic | passes | reuse field-generic input |
| 5.1 quaternary descent [sample] | ⟨1,−1,1,−2⟩, d=2, E=ℚ(√2) | det 2; isotropic before/after via (1,1,0,0); signed determinant 2·(−1)^6=2 | passes | R04 reuse |
| 5.1 residual-plane discriminant [sample] | d=2, ε=3 | det⟨ε,−dε⟩=−18; det P class=2/(−18)=−1/9→[−1]; signed plane class=[1] | passes; denominator ε≠0 is justified by anisotropy | none |
| 5.1 dimension-exactly-four control | F=ℚ(i), ⟨1,2⟩, E=F(√2) | det=2; −2 nonsquare in F; (i√2)²=−2 in E | false/true isotropy; rank 2 excluded | none |
| 5.1 extension specification control | E=ℚ(√2,√3), d=2 | root exists but degree=4≠2; cannot use basis {1,√2} for E | passes: quadratic-degree assumption excludes wrong extension | none |
| 5.2 and 9.5 binary exceptional-set boundary | A at p=3,7,11 | −1 nonsquare mod each p; only zero mod-p solution to x²+y²=0; same for all p≡3 mod4 | anisotropy at infinitely many primes; rank≥3 condition matters | reuse BinaryObstruction |
| 5.3 nonzero local common values | U=H, W=⟨1,1,1⟩ at ℝ | x=(0,1), y=(1,0,0); U(x)=−1=−W(y)≠0 | passes; handles isotropic U | none |
| 5.4 higher-rank approximation, nonempty T | U=H,W=⟨1,1,1⟩ over ℚ | x=(0,1), b=−1; W(1,0,0)=1=−b; final value 0, vector nonzero | passes | none |
| 5.4 higher-rank approximation, empty T | U=A,W=H⊥⟨1⟩, x=0 | T=∅; b=0; det(⟨b⟩⊥W)=0; final (0,0) is zero | route fails | R03 choose x=(1,0),b=1 |
| 5.5 isotropy headline, ranks 0/1 | zero-dimensional form and ⟨1⟩ | global/local isotropy false/false in both; q=0 has only zero vector in rank 0 | passes; requires an actual finite place, supplied for number fields | none |
| 5.5 isotropy headline, ranks 2/3/5 | H, T, ⟨1,1,1,1,−1⟩ | true/true via (1,1); false/false at 3; true/true via (1,0,0,0,1) | passes | none |
| 5.5 real-only false generalization; 9.1 | T | real zero (√3,0,1); modulo 3, x²+y²=0 forces x=y=0 then 3 divides z | real true, rational/3-adic false | reuse TernaryObstruction |
| 5.5 all-but-one-place false generalization | ⟨1,1,1,1,1⟩ over ℚ | isotropic at every finite place (local u=4), anisotropic at sole real place | all-but-one true, global false | none |
| 5.5 one real embedding is insufficient | ℚ(√5), ⟨1,−√5⟩ | at +√5 signature (1,1), at −√5 signature (2,0); global isotropy false | passes negative control | none |
| 5.5 singular classification control | zero form of rank 1 versus zero form of rank 2 | both discriminant 0 and no nonzero value; dimensions/radicals 1≠2, not isometric | supports retaining regularity/dimension/radical data | none |
| 6.1 scalar representation headline | A represents 5 and fails to represent 3 | 5=1²+2² globally/locally; 3 fails at 3 by odd norm valuation | true/true and false/false | none |
| 6.1 scalar zero control | zero-dimensional form, a=0 and a=1 | represents 0=true via 0; represents 1=false; ⟨−0⟩ is singular | passes; nonzero reduction cannot be applied to a=0 | none |
| 6.2 representation-of-forms headline | ⟨1⟩→H; A→⟨1⟩ | first true globally/locally; second false since 2≤1 is false | passes | none |
| 6.2 induction/cancellation | common summand ⟨1⟩ in ⟨1⟩⊥H and ⟨1⟩⊥2H | ranks 3→2; complementary H and 2H both have det [−1] and are isometric | passes | none |
| 6.3 isometry headline; 9.2 | ⟨1,1,−1⟩ vs ⟨1,2,−2⟩ | det −1 vs −4 gives same class; signature (2,1); finite Hasse all 1; both ⟨1⟩⊥H | true/true | reuse example |
| 6.3 negative isometry test | ⟨1⟩ vs ⟨−1⟩ | global false; local false at ℝ, indices 1≠0 | passes both sides | none |
| 7.1 local realization | n=1,d=[1],s=1,p=1 | local ⟨1⟩ has dimension 1, determinant [1], Hasse 1 and real index 1 | passes | R04 reuse |
| 7.2 initial approximation | targets all H, n=2,d=[−1] | take a₁=1,a₂=−1; W=H; mismatch set R=∅ | passes | none |
| 7.2 correction-plane determinant | α=2,β=5 | P=⟨1,−5⟩ det −5; P′=⟨2,−10⟩ det −20; ratio 4 is square | passes | reuse correction API |
| 7.2 correction-plane Hasse signs | same α,β at 2,5,∞ | s(P)=1 everywhere; s(P′)=−1 at 2,5 and +1 at ∞; (α,β) same signs | passes; support R={2,5} even | none |
| 7.2 correction-plane real signatures | α=2,β=5; also α=−2,β=5 | both P and P′ signature (1,1) in either case | passes; positive β is essential | none |
| 7.2 correction embedding/complement | W=P′, targets Uᵥ=Pᵥ, R={2,5} | P′ embeds as second summand of P⊥P′; complement V=P; rank 4−2=2; d(V)=d(W)=[−5] | passes and realizes the target | none |
| 7.2 small-rank restrictions | n=1; binary d=[−1] | only one local class in each case, hence mismatch set R empty there | passes; one class still satisfies “at most two” | correct explanatory wording if retained |
| 7.2 rank-zero existence | all Uᵥ zero forms | rank 0, det empty product 1, all Hasse 1; global zero form realizes them | theorem true; n−1 coefficient recipe needs a separate rank-zero branch | R01 align rank convention |
| 7.3 admissibility iff realization | I from zero form, then from ⟨1⟩ | zero: false↔true; rank one: true↔true | first is false as written | R01 add positive rank |
| 7.3 Lean forward existence headline | I from ⟨1⟩ and from H | witnesses Q=⟨1⟩ and H, regular determinants 1 and −1; invariant equalities reflexive | passes | R05 strengthen interface to local isometries |
| 7.4 uniqueness headline | ⟨1,1,−1⟩ and ⟨1,2,−2⟩ | equal (rank 3,discr [−1],s=1,p=2); both isometric | passes | none |
| 8.1 full invariant criterion headline | same pair; then ⟨1⟩ vs ⟨−1⟩ | first equality/isometry true; second real indices 1≠0 and isometry false | passes both directions | none |
| 8.1 positive-rank classification vs rank zero | zero record and record of ⟨1⟩ | raw ranks 0,1; admissible flags false,true; each has a regular realization | bijection must restrict to positive rank | R01 |
| 8.2 hyperbolicity | H⊥H and A | first rank 4,witt index 2,global/local hyperbolic true; A index 0 over ℝ so global/local false | passes; even rank alone insufficient | none |
| 8.2 equality of Witt classes | ⟨1⟩ and ⟨1⟩⊥H | ranks 1 and 3, Witt classes equal; local classes equal after killing H | passes; isometry differs from Witt equality | none |
| 8.3 Witt-map injectivity headline | 0,[H],[⟨1⟩],[A] over ℚ | 0 and [H] map to 0; ⟨1⟩ maps to signature 1 at ℝ; A maps to signature 2 | no spurious kernel in these cases | none |
| 8.3 complex omission/parity | H and ⟨1⟩ over ℂ | Witt images 0 and 1 in ℤ/2; even/odd ranks 2/1 give same values | passes; finite-local vanishing forces even parity | none |
| 8.4 SO-facing corollary | H vs 2H; ⟨1⟩ vs ⟨−1⟩ | local/global equivalence true/true; false/false | same instance outcomes as 6.3 | R08 delete redundant Lean declaration |
| 9.3 two-real-place example | ℚ(√5),n=3,d=[1],p=(3,1),one sᵥ=−1 above 2 | negative indices (0,2); discr signs (+1,+1); real Hasse (1,−1); total (−1)·1·(−1)=1 | admissible; finite prime above 2 is inert (x²−x−1 irreducible mod2) | none |
| 9.4 small-rank nonexamples | two negative finite signs, rank 1; then rank 2,d=[−1] | finite product (−1)²=1; realizable=false in both | passes; detects product-only wrong model | R06 retain as Checks |

## Not verifiable

No locator is explicitly labeled unverified in this README. All six seeded targets nevertheless require checking against O’Meara's text, which was unavailable. The following are **not** claimed to have been source-verified:

| Seeded target | Cited/intended locator | Verification limitation |
|---|---|---|
| The localized product formula | O’Meara 71:18 (reference list), with the QFI/CFT adapters | No legal text obtained; theorem number, page and source hypotheses not certified. |
| The archimedean symbol | No individual locator in §4.4; reference list includes 71:18 | Mathematical formula verified directly and at the pin; no printed page/source statement certified. |
| Sign prescription | O’Meara 71:19a and 71:19; norm-index input 65:21 | Both finite-support/parity variants tested mathematically; printed source not inspected. |
| Binary | O’Meara 66:1 with 65:15 and 42:11–12 | Global-square reduction checked; source numbering and page not certified. |
| Ternary | O’Meara 66:1 with 65:23 | Norm-equation reduction checked; exact source split/nonsplit treatment not certified. |
| Quaternary | O’Meara 66:1, 42:12 and 58:7 | Rank-four determinant computation and native descent inspected; printed text not certified. |

All six cited works were attempted through the sources service; no source extraction was returned, so there are no source-line citations to fabricate. The source service did not create a missing-reference file on these network failures; the six missing entries were recorded in the designated scratch manifest. This review edited no roadmap source manifest.

- **omeara** — bibliographic fetch failed at arXiv with HTTP 429. A second fetch using DOI `10.1007/978-3-662-41922-9` also failed; the service reported a paywalled Springer DOI prefix and HTTP 429. [Springer's book metadata](https://link.springer.com/book/10.1007/978-3-662-41922-9) identifies a third-edition text, not a verified copy of the cited 1963/2000 theorem pages. The general web search produced metadata and references, not a legal readable copy of the requested text. No numbering equivalence was assumed.
- **lam** — bibliographic fetch failed at arXiv with HTTP 429. The cited chapters have no exact locators in the README.
- **serre** — bibliographic fetch failed with HTTP 429 and an unresolved paywalled Springer DOI prefix; Chapters III–IV were not read.
- **cassels** — bibliographic fetch timed out at arXiv; no theorem/section locator is provided in the README.
- **neukirch** — bibliographic fetch failed with HTTP 429 and an unresolved paywalled Springer DOI prefix; the approximation/class-field references are broad subjects.
- **milnor_husemoller** — bibliographic fetch failed with HTTP 429 and an unresolved paywalled Springer DOI prefix; the Witt/local-global reference has no exact locator.

These access failures do not establish source errors. Source-text comparison, page certification, edition matching and source-copying detection remain unverified. The mathematical, library, ownership, signature, dependency and gate work above was completed independently of those unavailable texts. No verdict was inferred from a search snippet, and no external source was copied into a report or repository.

## Source issues

- none

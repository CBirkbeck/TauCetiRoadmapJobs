<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/170#issuecomment-6355595167 -->
Red team round 2 pass a (codex) of c5a54c1

Verdict: needs_changes

1. **F01** (P1) Nonzero determinant conclusion omits independence

   **Location:** `packages/Polylogarithms/README.md:502`: “if the calibrated period columns equal `λₙπ^(n-1)` times Borel columns ... in `ℚˣ√|disc F|π^(-eₙ)ζ_F(n)`.”

   **Claim:** Calibration alone puts the determinant in a nonzero rational coset of the zeta value.

   **Witness:** Take `F=ℚ`, `n=3`, the single zero K-class and zero symbol family. Calibration is `0=λ₃π²·0`; the determinant is `0`. The claimed coset is `ℚˣζ(3)`, which excludes `0`.

   **Exact repair text:** “For arbitrary rational K-theory columns the calibrated determinant belongs to `ℚ·√|disc F|π^(-eₙ)ζ_F(n)`. If those columns form a rational basis of the Borel regulator domain, the coefficient is nonzero.” The zero-family instance now gives coefficient zero; a regulator basis gives the asserted nonzero determinant.

2. **F02** (P3) Boundary theorems and elementary checks pad the acceptance test

   **Location:** `packages/Polylogarithms/Suggested.lean:143`, `:383`, `:412`, `:446`, `:521`: “`lobachevsky_half_pi`”, “`not_isCycle3_single_three`”, “`cycleLift_iff`”, “`normalizedPeriod_empty`”, “`singleValued_three_derivative_half`”.

   **Claim:** Boundary evaluations, negative-control examples and elementary linear algebra are included as acceptance theorems.

   **Witness:** `normalizedPeriod_empty` already closes by `simp [normalizedPeriod, Matrix.det_fin_zero]` at line 450. The lifting proofs use only subtraction or injectivity. The derivative and cycle nonexamples repeat README Checks, irrespective of proof difficulty.

   **Exact repair text:** Delete from `Suggested.lean` `lobachevsky_half_pi`, `lobachevsky_pi`, `not_isCycle3_single_three`, `not_isCycle4_single_two`, `cycleLift_iff`, `cycleLift_of_injective`, `normalizedPeriod_empty`, and the four `singleValued_three_derivative_*` theorems. Keep their mathematics in the README. Delete the elementary `example` blocks (lines 174, 178, 202, 223, 234, 245, 253, 274, 293, 350, 355, 367, 377, 390, 394, 398, 438, 452, 457, 484, 488, 503, 506); the prime-unit independence example at line 297 is the only candidate for a retained nontrivial definition test. The deletions remove no headline theorem. Values remain `Λ(π)=0`, empty determinant `1`, and derivatives at `1/2,2,-1,1` respectively `4log²2/3,-log²2/3,0,0` on the real unit tangent.

3. **F03** (P3) Several definitions serve only diagnostics

   **Location:** `packages/Polylogarithms/Suggested.lean:95`, `:184`, `:190`, `:197`, `:481`: “`IsCycle4`”, “`projectedCrossRatio`”, “`tripleRatio`”, “`triangleParameter`”, “`collidingPointCycle`”.

   **Claim:** These five definitions belong in the headline acceptance file.

   **Witness:** Their only consumers in this file are Check mirrors and boundary/nonexample theorems. None occurs in any retained headline theorem; the configuration comparison and multiplicity-bearing incidence construction are absent.

   **Exact repair text:** Delete these five definitions and their Check mirrors from `Suggested.lean`; retain their formulas and discriminating Checks in README §§3.5–3.6 and 5.3. This preserves the values `6/5`, `10/9`, `2`, and `[0]+[0]=2[0]` while keeping only definitions needed to state headline theorems.

4. **F04** (P1) Current foundations and Poincaré–Lelong are replanned

   **Location:** `packages/Polylogarithms/README.md:591`: “Call this space `TestFormsᵏ(M)`”; `:593`: “define a degree-`q` `ManifoldCurrent`”; `:617`: “named target `poincareLelong_singularSupport`”.

   **Claim:** The LF form tests, their dual currents, differential calculus, logarithmic Poincaré–Lelong theorem and supporting normal-current vanishing theorem are additions owned here.

   **Witness:** `TauCetiRoadmap/GeometricCurrents/README.md:139`–181 already owns real LF form tests and currents. `TauCetiRoadmap/ComplexComparisonPartII/README.md:3020`–3053 owns their complex calculus; `:3258`–3283 owns Poincaré–Lelong including the same support-theorem proof.

   **Exact repair text:** “Import GeometricCurrents G1's TestForm and Current, with degree-q currents on a real m-manifold identified with dimension-(m−q) currents and differential `(-1)^(q+1)∂`. Import ComplexComparisonPartII §C5.4's CurrentCalculus, AnalyticCycleIntegration and lelongPoincareSection, including its normal-current support theorem, and ComplexKahlerGeometry K5a's bundle-test LF topology. This roadmap adds the BFT normalization, logarithmic polylogarithmic forms and explicit regulator comparisons.” Delete the duplicated generic construction and proof targets from §§5.1–5.2 and update the scope and supplier contracts. For `f=z` on ℂ the imported formula is still `ddᶜlog|z|=δ₀`; for a degree-zero form the transported differential still satisfies `d[α]=[dα]`.

5. **F05** (P1) Analytification is attributed to a nonexistent supplier section

   **Location:** `packages/Polylogarithms/README.md:101`: “AlgebraicModuliForArithmeticGeometry §7.10.1 supplies `complexSchemeAnalytification.map` and `.fibreProduct`”; also lines 16 and 1091.

   **Claim:** That section owns the complex analytification functor and its map/fibre-product comparisons.

   **Witness:** Its current README has no §7.10.1 and explicitly assigns this interface to ComplexComparisonPartII §C−1.1 at line 280. `TauCetiRoadmap/ComplexComparisonPartII/README.md:749`–757 constructs exactly the required functor, maps and fibre-product comparison.

   **Exact repair text:** Replace every analytification citation to “AlgebraicModuliForArithmeticGeometry §7.10.1” with “ComplexComparisonPartII §C−1.1, complexSchemeAnalytification, its map and fibreProduct APIs”. Retain AlgebraicModuliForArithmeticGeometry §1.6 for Chow parameters. The replacement preserves nonreduced inputs: `Spec ℂ[ε]/(ε²)` analytifies with its nonzero nilpotent stalk, rather than its reduction.

6. **F06** (P1) Relative-cycle foundations duplicate the current supplier

   **Location:** `packages/Polylogarithms/README.md:672`: “The needed family-specific API is `chowRelativeFamily_pullback(f)` for every morphism of Noetherian k-schemes”; line 674 constructs flattening-based specialization and pullback.

   **Claim:** Only regular-base equidimensional cycles are already owned, so this roadmap constructs the general-base relative-cycle operations.

   **Witness:** `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:699`–701, §4.8a, already constructs relative-cycle specialization, arbitrary base pullback, proper/flat maps, products and admissible Cartier intersections over noetherian bases. Its §4.14 explicitly consumes that input.

   **Exact repair text:** “Define the degree-e effective Chow-family subfunctor using MotivesAndAlgebraicCycles §4.8a's relative-cycle carriers, specialization multiplicities, arbitrary base pullback and admissible Cartier intersection; §4.14 supplies equidimensional cycles and transfers. The additions here are the Chow-form/h-sheaf identification, tautological cycle on the Chow coefficient scheme and its admissible face and vertex adapters.” Remove the duplicate generic specialization/pullback construction from §§5.3 and 5.11. The imported multiplicity law still gives the fiber `2[0]` of `x²=t` and the same `2[0]` after `t=s²,s=0`.

7. **F07** (P1) The analytic supplier already owns the exact trilogarithm differential

   **Location:** `packages/Polylogarithms/README.md:1124`: “that rewriting ... [is] the content of this target”; `packages/Polylogarithms/Suggested.lean:512` and `:538`.

   **Claim:** Rewriting the general differential using D, and the zero derivative at one, are new targets here; named differential exports are consumed from the supplier.

   **Witness:** `TauCetiRoadmap/PolylogarithmFunctions/README.md:623`–639, §4.8, already states the identical D-formula and endpoint theorem. Its current Lean file omits `singleValued_differential`, `singleValued_two` and `blochWigner_differential`; the corresponding mathematics is in §§4.5,5.2,5.4.

   **Exact repair text:** “Import PolylogarithmFunctions §4.8's exact weight-three differential and hasFDerivAt_singleValued_three_one; §4.5 supplies the general differential, §5.2 identifies L₂ with D, and §5.4 supplies the Bloch–Wigner one-form. This subsection proves their compatibility with the regulator representatives constructed in §5.17.” Delete `singleValued_three_differential` and its derivative corollaries from `Suggested.lean`; replace nonexistent supplier declaration citations by the actual named sections. Import the Steinberg one-form identity from §5.4, deleting `etaJet_steinberg` and its diagnostic-only `etaJet` definition from the acceptance file. The formulas agree since `-v/(z-1)=v/(1-z)`; at `z=2,v=1` both give `-log²2/3`, and at one both give zero.

8. **F08** (P2) The Deligne gap requests already-owned higher-cycle foundations

   **Location:** `packages/Polylogarithms/design/plan.json:11` and `packages/Polylogarithms/README.md:99`: “Supply higher-cycle complexes ...”; line 105 attributes the whole carrier package to MotivicEtaleKTheory.

   **Claim:** The declared universal-Deligne gap includes construction of higher-cycle complexes without importing their existing owner.

   **Settlement boundary:** The repair report’s “not actionable in this package” decision concerns discharging genuine supplier exports and their placement. This finding concerns a newly checked overlap and the package’s own gap wording; it asks for no supplier proof or edit.

   **Witness:** `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:480`–490, §3.0a, owns BlochCycle/HigherChow, integral simplicial faces, coefficients, localization and homotopy invariance for arbitrary separated finite-type schemes. Motivic cubical and mixed adapters are additional requirements, not a second simplicial carrier.

   **Exact repair text:** Replace the gap's needs sentence, in both its plan entry and README contract, by: “Using KTheoryFiniteLocalFields §3.0a's shared BlochCycle/HigherChow complexes and localization maps, supply the cubical and mixed-model comparison, rational Chern character and restriction-natural universal Deligne regulator for smooth projective varieties over subfields of ℂ and their open complements, with the logarithmic product, compactification independence and the support-semipurity input of §5.2.” Cite §3.0a directly for the shared simplicial carrier and localization. Preserve the gap slug and named Deligne supplier. For a field, the imported complex still gives `CH¹(F,1)=Fˣ` and `CH¹(F,0)=0`; the new request does not reconstruct them.

9. **F09** (P1) The primitive adapter invokes an unavailable general H-space theorem

   **Location:** `packages/Polylogarithms/README.md:137`: “For every unital ring R ... Apply the rational H-space theorem degreewise ... without ... finite-dimensional ...”.

   **Claim:** The listed plus/Q and stable-H-space suppliers suffice for the unrestricted rational primitive identification.

   **Witness:** `TauCetiRoadmap/StableHomotopyKTheory/README.md:1362`, §3.37, assumes finite-type rational homology. For `R=ℚ`, `H₁(GL(R),ℚ)=ℚˣ⊗ℚ` has the independent classes of every prime, hence infinite dimension. Sections 3.12–3.14 and 4.14 do not remove that hypothesis.

   **Exact repair text:** Declare `gap:rational-hspace-unrestricted`, supplier StableHomotopyKTheory §3.37: “Extend the rational Hurewicz identification with primitive homology to path-connected homotopy-associative H-spaces of CW type without finite-type rational homology, with naturality.” Put the same slug and needs in the plan gaps and Exact supplier contracts; make §2.2 depend on it. Retain the all-unital-ring adapter and its inverse. On `R=ℚ`, all prime classes now fall within the stated contract; restricting to finite-dimensional arithmetic cases would not repair the advertised general theorem.

10. **F10** (P2) The geometric-volume headline is statable but missing

   **Location:** `packages/Polylogarithms/README.md:195`: “Prove `idealTetrahedron_volume`”; `packages/Polylogarithms/Suggested.lean:150` states only the angle formula.

   **Claim:** The acceptance file represents the geometric volume comparison promised in the summary.

   **Witness:** The actual region at README lines 177–180 uses only ℂ×ℝ, a finite convex hull, norms and inequalities. Its h⁻³ set integral uses pinned Bochner integration. No future hyperbolic-metric carrier is needed to state that region-volume equality.

   **Exact repair text:** Keep two real-bodied definitions on native carriers: `idealRegion z` is the displayed subset of `ℂ×ℝ`, with `c=1/2+i(‖z‖²-z.re)/(2*z.im)`; `signedIdealVolume z = Real.sign z.im * ∫ p in idealRegion z, p.2^(-3:ℤ)`. Add the admitted headline “For `z.im≠0`, `signedIdealVolume z = blochWigner z`.” Also state the region's integrability if required to prevent totalized integration hiding the finite-volume claim. This is the actual README object, not a placeholder geometry. At `z=i` the region has `c=(1+i)/2`, volume `D(i)>0`; conjugation gives the negative signed value, as required.

11. **F11** (P2) The elliptic kernel convergence headline is statable but absent

   **Location:** `packages/Polylogarithms/README.md:1052`: “Prove absolute convergence”; `packages/Polylogarithms/Suggested.lean:478` has no elliptic-kernel theorem.

   **Claim:** No acceptance signature is supplied for the convergent elliptic trilogarithm kernel.

   **Witness:** Mathlib `Algebra/Module/ZLattice/Basic.lean:433` supplies `IsZLattice`; `Algebra/Module/ZLattice/Covolume.lean:72` supplies its covolume. `Summable`, complex exponentials and the subtype of nonzero lattice triads already express exactly this series.

   **Exact repair text:** Define the displayed lattice character and kernel summand with real bodies, using `Λ : Submodule ℤ ℂ`, `[DiscreteTopology Λ]`, `[IsZLattice ℝ Λ]`, area `ZLattice.covolume Λ`, and index `{g : Fin 3 → Λ // (∑ i, g i)=0 ∧ ∀ i, g i≠0}`. State `ellipticTrilogKernel_summable`: for every `x y z : ℂ`, the norm of this summand is summable. Define its sum only if needed for the other retained elliptic headline. On the square lattice and triad `(1,i,-1-i)` at `(0,0,0)`, the summand is `(-1+2i)/2`, with norm `√5/2`; scaling by two divides it by 32. These witnesses survive the proposed native statement.

12. **F12** (P3) Missing-carrier headlines disappeared from the module docstring

   **Location:** `packages/Polylogarithms/Suggested.lean:6`–13: “light definitions and milestone signatures ... is not exhaustive”.

   **Claim:** This suffices to explain absent headline theorems after deleting the old trailing catalogue.

   **Witness:** The docstring names neither the Borel comparisons, configuration lifting, explicit/universal regulator comparisons, reciprocity constructions nor elliptic regulator pairing, and gives no missing carrier for any of them.

   **Exact repair text:** Use the title “Polylogarithms: target signatures” and say that the file states the roadmap's headline theorems against the pinned APIs. In connected prose identify the missing carriers: Bloch-group and K-theory regulator objects for descent/Borel and configuration comparison; LF/current and higher-cycle Deligne objects for explicit/universal chain-regulator comparison; curve-function-field Bloch maps for reciprocity; and those curve/current maps for the elliptic regulator pairing. State the native volume and kernel-convergence headlines of S10–S11 rather than calling those unavailable. Keep the downstream weight-four ownership exclusion. No boundary example substitutes for a missing headline.

13. **F13** (P2) The higher-symbol inversion statement includes false weight one

   **Location:** `packages/Polylogarithms/README.md:458`: “Prove `higherSymbol_inversion`: `[x]ₙ+(-1)^n[x⁻¹]ₙ=0` for `x≠0`.”

   **Claim:** The displayed inversion holds on the inductive groups, whose starting weight is explicitly `B₁(F)=U(F)`.

   **Witness:** At `F=ℚ,n=1,x=2`, the left side is `u(2)-u(1/2)=2u(2)`. Applying the 2-adic valuation gives 2, whereas the right side gives 0. G95 line 778 concerns weights at least two.

   **Exact repair text:** “For every infinite field F, every n≥2 and every x≠0, prove `[x]ₙ+(-1)^n[x⁻¹]ₙ=0`. Weight one instead satisfies `u(x)+u(x⁻¹)=0`.” Add the negative-control Check “At n=1,x=2 the higher-weight sign gives valuation 2, not 0; the weight-one sign gives 1+(−1)=0.”

14. **F14** (P1) The p-adic matrix adapter already belongs to IntegralIwasawaTheory

   **Location:** `packages/Polylogarithms/README.md:1101`: “Define `pAdicUnitLogMatrix` as the `r×N` matrix ...”; line 1099 also defines `leopoldtUnitMap`.

   **Claim:** The all-embeddings matrix and its rank/minor equivalence are an additional adapter constructed here.

   **Witness:** `TauCetiRoadmap/IntegralIwasawaTheory/README.md:542`, §4.1, already defines the same map and the transposed N×r matrix, with `leopoldt_iff_logMatrix_fullRank` and the totally-real/CM scalar regulator. Section 4.4 supplies the abelian consequence.

   **Exact repair text:** “Use IntegralIwasawaTheory §4.1's leopoldtLogMap, all-embeddings logarithm matrix and leopoldt_iff_logMatrix_fullRank. Display its transpose so that units index rows; transport its basis and permutation laws by Matrix.transpose. Import its totally-real regulator criterion and §4.4's abelianLeopoldt. The examples below test these supplied statements.” Remove the duplicate construction/proof obligations. The quadratic column `(a,−a)ᵀ` becomes the displayed row `(a,−a)`; its two minors remain −a and a. The rank-zero transpose still has empty minor 1.

15. **F15** (P3) The five-term predicate has only endpoint-level Checks

   **Location:** `packages/Polylogarithms/README.md:276`: the zero function passes `FiveTermFunction`, while the constant-one function fails its endpoint conditions.

   **Claim:** These two tests adequately distinguish the newly defined normalized five-term predicate.

   **Witness:** The endpoint-normalized function `b:ℚ→ℚ`, `b(x)=1` if `x=2` and 0 otherwise, passes both endpoint laws but fails at x=2,y=3: its five-term sum is `1−0+0−0+0=1`.

   **Exact repair text:** Add a third README Check: “For b(x)=1 at x=2 and zero elsewhere, b(0)=b(1)=0 but the five-term sum at (2,3), with arguments 2,3,3/2,3/4,1/2, is 1. Therefore FiveTermFunction b is false.” Keep this Check in the README; do not add another Lean example. This tests the relation itself and excludes the plausible wrong endpoint-only predicate.

16. **F16** (P3) Two configuration citations were not updated after the move

   **Location:** `packages/Polylogarithms/README.md:345`: “`M₃` is the geometric-to-symbol isomorphism constructed in §3.6”; line 371 also assigns the elementary triangle construction to §3.6.

   **Claim:** Section 3.6 constructs these inputs to the signed configuration maps.

   **Witness:** The actual triangle parameter, triangle-symbol presentation and explicit inverse M₃ are now in §3.5, lines 309–326. Section 3.6 starts at line 373 with Gale duality.

   **Exact repair text:** Change these two construction citations to “§3.5, the geometric presentation and triangle-symbol comparison above”. Retain §3.6 for the projected top square and duality. The triangle parameter remains 2 on the first native example and 1 on the endpoint example; this change removes the apparent forward construction without altering either value.

17. **F17** (P2) The Borel gap also requests an existing rank theorem

   **Location:** `packages/Polylogarithms/README.md:85`: “What BorelRegulators must provide ... the rank ... of Layers 3–5”; also lines 14 and 89.

   **Claim:** The rank input belongs among the missing Borel supplier exports.

   **Witness:** `TauCetiRoadmap/ArithmeticKTheory/README.md:959`–980, §3.4, owns borel_rank_order and borel_rank_centralSimple; §3.3 supplies rational localization to the field. At ℚ the ranks in degrees 3 and 5 are 0 and 1; at ℚ(i) both are 1.

   **Exact repair text:** “ArithmeticKTheory §§3.3–3.4 supplies rational localization and Borel ranks. What BorelRegulators must provide (gap:borel-period-contract): the rational Borel regulator image and covolume of Layers 3–5 and the totally-real even-weight primitive-period theorem of §7.1, including its Tamagawa input.” Remove rank ownership from the other Borel supplier descriptions. The given rank examples are unchanged. Keep the genuine regulator/period gap; its supplier implementation and placement remain settled external work. This is a new minimality finding, not a demand to discharge that gap locally.

18. **F18** (P3) Future API identifiers violate the README/Lean name contract

   **Location:** `packages/Polylogarithms/README.md:137`, `:651`, `:1052`: backticked `stableK_hurewiczPrimitive`, `universalRegulator_supportCone`, `ellipticTrilogKernel_summable`.

   **Claim:** These are this package's own backticked names, but none is declared in `Suggested.lean`.

   **Witness:** The complete file contains only 38 named declarations; its only K-theory discussion is a module comment and it contains no support-cone or elliptic-kernel declaration. The same mismatch affects the future API lists throughout the README.

   **Exact repair text:** Keep native headline names backticked when their actual signatures are retained or added. Render future API targets requiring unavailable carriers as plain mathematical prose, preserving their intended signatures and locators; put the missing-carrier headline explanations in the module docstring as in S12. Do not fill the acceptance file with API placeholders. This changes no mathematics: the zero support remains the fibre of the identity, and the kernel summand remains `(-1+2i)/2` on S11's triad.

## Earlier finding verification

The two earlier reviews have independent F-numbering. These decisions compare their claims with this head; “repaired” concerns the earlier defect, not acceptance of the surrounding target. Locations in this table are in `packages/Polylogarithms/README.md` unless explicitly marked Lean.

| Earlier finding | Status | Repaired passage at this head | Witness and repair consequence |
| --- | --- | --- | --- |
| r1a F01, computational algorithms | Repaired | §2.5, line 203: “Uniform Fourier bounds and Kummer reduction” | No approximation algorithm, termination target or PolylogDiagnostic remains. N=3,6 gives 8/9,209/225; these are analytic Checks. |
| r1a F02, integral sixth-root kernel | Repaired | line 123: “strict-exterior Bloch kernel” | For w a primitive sixth root, 1−w=w⁻¹, so w∧(1−w)=0; the antisymmetric tensor has the order-two diagonal class. Doubling kills that class. |
| r1a F03, every-family headline absent | Repaired | Lean line 127: “theorem zagier_three_everyFamily” | The supplied elaborated type retains every IsCycle3 hypothesis and allows q=0. A zero family has determinant 0 and coefficient 0. |
| r1a F04, missing native Checks | Repaired with a new defect | line 276: “raw cyclic expansions and rescaling Checks have proved native mirrors” | The two Fourier sums, triangle parameters, ratios and collision coefficients compute as claimed. Admitted boundary targets and the numerous mirrors are padding under the present acceptance rules: S02–S03. |
| r1a F05, missing source manifest | Repaired | `packages/Polylogarithms/sources.toml:1`: schema “tauceti-roadmap-sources/v1” | Nineteen distinct works, nineteen certified entries and accessible cached texts. No unresolved source request was found. |
| r1a F06, internal build cycles | Partly repaired | line 355: “projected top square is established with duality in §3.6” | Primitive inputs precede configurations; support cones precede Green/Wang comparison; homotopy input precedes conditional transfer. Two construction references still point to the old section: S16. Dependency gate has zero problems. |
| r1a F07, Green coefficient closedness | Repaired | line 686: “separately ∂-closed and bar∂-closed” | BUR line 3095 has the two restrictions. For α=(z₁+bar z₁)i dz₂∧dbar z₂, the composite derivative is 0 but each first derivative is nonzero. |
| r1a F08, cubic characteristic restriction | Repaired | line 975: “algebraically closed field k of arbitrary characteristic” | The two displayed cubics have no simultaneous gradient zero on the curve in characteristics 2 and 3. Their analytic comparisons remain over ℂ. |
| r1a F09, arbitrary-curve rigidity substituted for explicit descent | Repaired as a planning obligation | line 982: “prove ellipticFiveTermDescent in the explicit rational five-term quotient” | G04 lines 2887–2890 use the broader relation group. The README now explicitly owns the extra chord/associativity/Steinberg proof and does not claim the cited rigidity proves it. That extra proof is not certified here. |
| r1a F10, inverse primitive comparison missing | Partly repaired | line 137: “The inverse is part of the API”; line 413 applies it after primitive projection | On a primitive class u(2), projection and inverse return u(2), rather than an arbitrary homology lift. The unrestricted rational H-space input is still unowned: S09. |
| r1b F01, cubical orientation | Repaired, with supplier verification limited | line 37: “δ J_q=J_{q-1}∂_M” | At q=1, J₁=−1, ∂_M=∂⁰−∂∞, δ=−∂⁰+∂∞; both sides equal ∂_M. BFT line 86 confirms δ. Current MotivicEtaleKTheory text was unavailable. |
| r1b F02, nonexistent inversion export | Repaired | line 69: “PolylogarithmFunctions.singleValued_inv” | That name exists in the current supplier Lean file; n≥2 agreement is expressly scoped at line 81. Its other analytic names have since drifted: S07. |
| r1b F03, supplier labels/ownership | Partly repaired | line 99: “What MotivicEtaleKTheory must provide (gap:universal-deligne-contract)” | Both declared slugs match the plan. Genuine supplier gaps remain accepted as contracts. Current owner drift and nonminimal requests are S04–S09 and S17; no absence behind a declared gap is itself a finding. |
| r1b F04, elementary admitted theorems | Mathematically repaired; padding remains | Lean line 450: “simp [normalizedPeriod, Matrix.det_fin_zero]” | Both lifting theorems now have proofs; unused square binders disappeared from cycleLift_iff. The id/id/zero square still cannot lift y=1 to a cycle. These elementary results must be deleted from the acceptance file: S02. |
| r1b F05, wrong β₂ locator | Repaired | line 1124: “β₂=1/3 ... p.3” | G00 line 143 gives 1/3; line 326's equation (15) is a different definition. The derivative at 1/2 remains 4log²2/3. |
| r1b F06, trailing future-name catalogue | Partly repaired | Lean lines 11–13 mention only downstream weight four | The trailing catalogue is gone. The required prose identifying unavailable headline carriers is absent: S12; future backticked names still violate the bidirectional name rule: S18. |

The repair report's settled external work is preserved: this package is not required to prove the genuine Borel-period or universal-Deligne supplier contracts. S08 and S17 concern newly verified duplication in the package's own requests, not those external proofs.

## Verified sound

Read all 1,175 README lines and 542 Lean lines, the repository rules, both earlier reviews and the repair report. The Lean inventory is **38 named declarations: 18 definitions and 20 theorems**, plus **24 proved examples**, hence **62 declaration/example blocks**. Seventeen theorems are admitted. The supplied signature inventory says 39 because it also mistakes the word “cycle” in a docstring for an inductive declaration; its resulting unknown-name diagnostic is an inventory artifact. There is no declaration named cycle in this package.

The tables below inventory **39 numbered README subsections**, both bold mathematical targets (strong reciprocity and generalized reciprocity), **49 Checks blocks tested through the computed instances below**, with **217 bulleted Checks read**, plus the inline Checks. The README ledger has 123 target/convention rows with explicit computed instances; this is an adversarial test record, not a claim to have proved every future theorem. Nineteen source records and nineteen grouped source-locator entries were inspected. Current supplier sections were compared in the separate supplier table. The full list of sixteen provided open-head folders was searched by object, together with main, Completed and the board packages; the roadmap-index grep/show tools were also used. No duplicate fully qualified Lean declaration name was found. Relevant overlaps are reported above.

The supplied elaborated types were compared with the README and source signatures. There are no section-variable or include blocks to lose hypotheses. In particular, the number-field instances, every-family cycle hypotheses, selected-place equivalence, square/injectivity conditions and endpoint HasFDerivAt survive. I ran no Lean build or elaboration in this read-only pass. The one-tactic padding probe was by inspecting the definitions, actual proof bodies and pinned library lemmas.

### Lean declaration ledger

All names below have prefix `TauCetiRoadmap.Polylogarithms`. “Q-module” means AddCommGroup plus Module ℚ. All binders and instances are explicit in the declaration. F and V share universe u in the universal cycle predicates; their actual quotient test objects live in that same universe, so no universe enlargement is needed. Native calculations outside a geometric domain are recorded as totalized values, not geometric claims. G denotes Catalan's constant, approximately 0.91596559418.

| Declaration; line; README section | Variable and instance context | Instances and computed values on the two sides | Result/change |
| --- | --- | --- | --- |
| polylog; 28; conventions | n:ℕ,z:ℂ | Li₀(1)=1/0=0 by totalization; Li₁(1)=−log 0=0; Li₂(1)=π²/6; Li₃(0)=0 | Agreement with supplier restricted to n≥2, as stated. |
| singleValued; 37; conventions | n:ℕ,z:ℂ | n=0 empty sum gives 0; L₂(1)=0; L₃(1)=ζ(3); L₃(−1)=−3ζ(3)/4 | Bernoulli sign is −1/2; real/imaginary parity matches. |
| blochWigner; 45; conventions | z:ℂ | D(0)=D(1)=D(2)=0; D(i)=G; D(−i)=−G | Lower-cut log contribution cancels the imaginary jump. |
| unitVector; 51; §3.2 | F:Type u,[Field F],x:F | u(0)=u(1)=u(−1)=0; ord₂u(2)=1; ord₂u(1/2)=−1 | Nonzero and inverse controls exclude the zero map. |
| FiveTermFunction; 57; §3.2 | F,V:Type u,[Field F],V Q-module,b:F→V | b=0 passes; b=1 fails 1=0; indicator of 2 has endpoints 0 but relation value 1 at (2,3) | S15. |
| trilogCyclic; 65; §3.1 | F field,V additive commutative group,b,a,c,d | At (1,1,1), block=b(1)+b(−1); at (2,2,2), arguments 3,3/4,2,1/2,3/2,−2,1/4,1 with signs ++++−+−− | Raw expansion agrees; it is not a zero raw sum. |
| TrilogRelationFunction; 73; §3.1 | F field,V Q-module,b | b=0 passes; b(x)=x fails inversion at 2 because 2≠1/2; the (1,1,1) full relation is 3b(1)+4b(−1)=0 | Actual relation constraints, not a free Prop. |
| IsCycle3; 86; §3.2 | F field,c:F→₀ℚ; universally quantified V,b as above | c=0 and [1] give tensor sum 0; [3] gives valuation coefficient 1 in (u(2)∧u(3))⊗u(3) | Universal quotient test has both directions; no numerical substitute. |
| IsCycle4; 95; §§3.2,4.5 | F field,c:F→₀ℚ; universal TrilogRelationFunction | [1] gives 0; [2]+[1/2] gives b(2)⊗(u(2)−u(2))=0; [2] has detected value 7ζ(3)/8≠0 | True predicate, but diagnostic-only here: S03. |
| periodMatrix; 101; §4.4 | F field,ι:Type*,n,σ:ι→F→+*ℂ,c:ι→F→₀ℚ | One entry on 2[1] is 2ζ(3); zero column is identically 0; doubling column doubles determinant | Row/column orientation matches. |
| normalizedPeriod; 106; §4.4 | F field and NumberField,finite decidable ι,n,σ,c | ℚ,n=3,d=1,[1]: ζ(3); ℚ,n=2,d=0:π²; positive-size zero column:0 | In arbitrary diagnostic dimensions d>N, natural subtraction gives exponent 0; actual headlines select d≤N. |
| zagier_three_exists; 116; §3.8 | F field and NumberField,e:Fin(r₁+r₂)≃InfinitePlace F | ℚ,[1]:Z=ζ(3),q=1; ℚ(i),[1]:Z=π³ζ(3)/2=16ζ_F(3) | Actual IsCycle3 and q≠0 retained. |
| zagier_three_everyFamily; 127; §3.8 | Above plus c and ∀j IsCycle3(c j) | Zero family:0=0·ζ; double ℚ cycle:2ζ=2·ζ; duplicate columns:0 | Correctly allows coefficient zero; contrasts with S01. |
| lobachevsky; 139; §2.4 | θ:ℝ | Λ(0)=0; Λ(π/2)=Λ(π)=0; Λ(π/4)=G/2 | Omitting 2 adds θ log 2, a different function. |
| lobachevsky_half_pi; 143; §2.4 | No binders | −[(π/2)log2−(π/2)log2]=0 | Boundary padding, S02. |
| lobachevsky_pi; 147; §2.4 | No binders | −[πlog2−πlog2]=0 | Boundary padding, S02. |
| blochWigner_lobachevsky; 151; §2.4 | z:ℂ,0<Im z | z=i: G=0+G/2+G/2; regular shape exp(iπ/3):D=3Λ(π/3) | Angles in (0,π) sum to π; geometric equality still absent, S10. |
| circlePartial; 158; §2.5 | N:ℕ,w:ℂ | S₀=0; S₃(i)=8/9; S₆(i)=209/225; S_N(1)=0 | Real-bodied partial sum. |
| circlePartial_error; 162; §2.5 | N>0,‖w‖=1 | N=3,i:error≈0.0270767053≤1/3; N=6:i:error≈0.0129232947≤1/6; w=1:0≤1/N | N=0 would say G≤0 and is excluded. |
| blochWigner_kummer; 167; §2.5 | z≠0,1 | z=i gives circle arguments −1,i,i, so G=(0+G+G)/2; real z=2 gives 0=0 | All three denominators nonzero on the domain. |
| projectedCrossRatio; 184; §3.5 | F field,v:Fin5→Fin3→F | Moment tuple:6/5; last-two swap:5/6; first-vector doubling:6/5; zero tuple:0/0=0 | Geometric domain excludes last input; S03. |
| tripleRatio; 190; §3.5 | F field,v:Fin6→Fin3→F | Moment tuple:10/9; generic endpoint tuple:1; doubling first vector leaves value; zero tuple:0 | Endpoint 1 is allowed; S03. |
| triangleParameter; 197; §3.5 | F field,v:Fin6→Fin3→F | Parameter z has determinants z,−z,z,−1; z=2 gives 2; z=1 gives 1; z=0 gives totalized0 | Geometric denominator excludes0; S03. |
| singleValued_three_relations; 288; §3.1 | No binders; conclusion TrilogRelationFunction(L₃) | (1,1,1):3ζ+4(−3ζ/4)=0; inversion at2:L₃(2)=L₃(1/2)=7ζ/8; x=−1:−3ζ/4+2·7ζ/8=ζ | Genuine functional-equation target. |
| not_isCycle3_single_three; 383; §3.2 | No binders,F=ℚ | Quotient-boundary and ord₃ test gives 1, not0 | Correct nonexample; S02. |
| not_isCycle4_single_two; 387; §4.5 | No binders,F=ℚ | L₃⊗ord₂ test gives7ζ(3)/8>0 | Correct nonexample; S02. |
| cycleLift_iff; 412; §4.6 | C,D,E Q-modules,p,a linear,y,x,hx:px=y | p=a=idℚ,y=x=1:both propositions false; y=x=0:both true with z=k=0; zero modules:both true | No square hypothesis needed; elementary padding S02. |
| cycleLift_of_injective; 426; §4.6 | C,D,E,J Q-modules,p,a,b,q,square,p onto,q injective,by=0 | All identity maps imply y=0,x=0; q=0,p=a=id,b=0,y=1 fails injectivity and would require1=0 | Hypotheses retained; padding S02. |
| normalizedPeriod_empty; 446; §4.7 | F NumberField,σ,c indexed by Fin0,n:ℕ | det₀=1; ℚ,n=2:π²=π²; n=0 gives 1/√disc on both sides | Library simp, S02. |
| zagierExistence_totallyRealEven; 471; §4.7 | NumberField,IsTotallyReal F,n≥2,Even n,Fin0 data | ℚ,n=2:q=6; n=4:q=90; ℚ(√2),n=2:q=24 | Endpoint exclusions and nonzero discriminant suffice; accepted conditional on declared Borel gap. |
| collidingPointCycle; 481; §5.3 | F field,t:F | ℚ,t=0:2[0]; t=1:[1]+[−1]; characteristic2:2[t], coefficient2∈ℕ | Integral coefficients do not reduce modulo characteristic; S03. |
| etaJet; 495; §5.13 | f,g,df,dg:ℂ | (1,1,0,0) gives 0; (2,i,0,−1) giveslog2; swapped jet gives−log2 | Denominators belong to unit-locus API; diagnostic-only after S07. |
| etaJet_steinberg; 499; §5.13 | z≠0,1,v:ℂ | z=i,v=1:both sides log√2; z=1/2,v=i:both4log2; v=0:0=0 | Same supplier one-form identity, S07. |
| singleValued_three_differential; 512; §6.2 | z≠0,1,real Fréchet derivative | z=1/2,v=1:4log²2/3≈0.640604; z=2:v=1:−log²2/3≈−0.160151; z=i,v=i:0; v=−1:−G | Correct but already owned, S07. |
| singleValued_three_derivative_half; 521; §6.2 | v:ℂ | v=1:4log²2/3 on both sides; v=i:0=0 | Check mirror, S02/S07. |
| singleValued_three_derivative_two; 527; §6.2 | v:ℂ | v=1:−log²2/3 on both; v=i:0=0 | Cut included correctly; S02/S07. |
| singleValued_three_derivative_negOne; 533; §6.2 | v:ℂ | log‖−1‖=D(−1)=0, so every tangent gives 0 | Check mirror, S02/S07. |
| singleValued_three_derivative_one; 538; §6.2 | No binders,HasFDerivAt over ℝ | ε log²\|ε\|→0; derivative operator0, all directional values0 | Actual differentiability rather than junk fderiv; already supplied, S07. |

The following ledger covers every anonymous example. All have proofs; none is an admitted example. The prime-unit independence proof is a substantive native tensor-carrier test. The others are Check mirrors or small calculations and are covered by S02.

| Example line | Context | Computed result |
| --- | --- | --- |
| 174 | No binders | Λ(0)=−∫₀⁰=0. |
| 178 | No binders | S₃(i)=1−1/9=8/9; S₆(i)=1−1/9+1/25=209/225. |
| 202 | Rational six-tuples | Triangle parameter 2 before and after first-vector doubling. |
| 223 | Rational six-tuple | Collinear side points give triangle endpoint 1. |
| 234 | Rational five-tuples | Projected ratio 6/5; last-two permutation gives5/6. |
| 245 | Rational five-tuple | Rescaled projected ratio 6/5. |
| 253 | Rational six-tuples | Triple ratios 10/9 and 1. |
| 274 | Rational six-tuple | Rescaled triple ratio 10/9. |
| 293 | Arbitrary field F | u(0)=0,u(1)=0. |
| 297 | F=ℚ,three indexed unit vectors | Valuation matrix at 2,3,5 is identity, determinant 1; all relation coefficients 0. |
| 350 | b:ℚ→ℚ fixed zero/one | Zero predicate true; constant1 violates b0=0 and b1=0. |
| 355 | F field,V additive group,b:F→V | T(1,1,1)=b1+b(−1); full cyclic sum3b1+4b(−1). |
| 367 | b:ℚ→ℚ arbitrary | T(2,2,2)=b3+b(3/4)+b2+b(1/2)−b(3/2)+b(−2)−b(1/4)−b1. |
| 377 | Identity b:ℚ→ℚ | Inversion would give 2=1/2, false. |
| 390 | Arbitrary field F | IsCycle3[1]:each summand b1⊗u1=0. |
| 394 | Arbitrary field F | IsCycle4[1]:b1 may be nonzero, but u1=0. |
| 398 | F=ℚ | IsCycle4([2]+[1/2]):b2⊗u2+b2⊗(−u2)=0. |
| 438 | Four Q-modules specialized to ℚ | p=id onto; a=id cannot send its unique preimage of1 to 0. |
| 452 | One rational row and column | Entry on2[1] is2L₃(1). |
| 457 | σ,c:Fin0 plus arbitrary positive-size test | Empty ℚ weight4 period π⁴; any designated zero column gives determinant 0. |
| 484 | F=ℚ | Collision at0 has multiplicity 2. |
| 488 | F=ℚ and ZMod2 | At1, two rational coefficients1; in ZMod2, the coefficient at1 is2∈ℕ. |
| 503 | Four complex scalars fixed | etaJet1 1 0 0=0. |
| 506 | Four complex scalars fixed | etaJet 2 i 0(−1)=log2·Im(i)=log2. |

### README target, convention and Check ledger

Rows identify the target construction and its associated API laws. Native declarations also have their individual rows above. Cases outside a target's quantified domain are identified explicitly: a field is nontrivial, a number field has characteristic zero and positive degree, and the analytic varieties in Layer 5 are smooth complex varieties unless an algebraic construction explicitly says otherwise. Thus a zero ring is an input to the all-ring primitive adapter, but not to a Field binder; residue characteristic two remains an input to the residue construction. No “good primes” restriction was inserted.

| Target and context; README section | Instances and computed values | Result/change |
| --- | --- | --- |
| Rational symbols and U(F); conventions | u(−1)=0 over ℚ; [1]₃ maps to ζ(3)≠0; [0] and [∞] map to 0 | Rational torsion removal does not kill the odd endpoint. |
| Analytic branch/Bernoulli/parity; conventions | B₁=−1/2; at z=2, ImLi₂(2)=−πlog2 cancels arg(−1)log2; D(2)=0 | Supplier convention matches; no cut differentiability inferred for the holomorphic branch. |
| Shift and alternation; conventions | Two transposed inputs change sign; Alt₃ has 6 terms; target shift differential is −d | No hidden 1/6; component residue signs must alternate. |
| Cubical orientation; conventions | q=0,1,2 gives J=1,−1,1; δJ_q=J_(q−1)∂_M in each case | Algebraic repair sound; supplier text limitation below. |
| Cross-ratio conventions | r(∞,0,1,i)=i; r(0,∞,1,i)=−i; r(0,1,a,∞)=a/(a−1) | D-values G,−G,−D(a); orientation distinguished. |
| Zagier normalization; conventions | (N,d,e):ℚ,n=3:(1,1,0);ℚ(i),n=3:(2,1,3);ℚ,n=2:(1,0,2) | Natural subtraction in native function is nontruncated on headline inputs. |
| blochWignerDesc and uniqueness; §2.1 | [i] over ℚ(i) has boundary 0 since u(i)=0 and period G; [3] over ℚ has boundary u2∧u3≠0 | Descends to pre-Bloch group; only restriction to kernel enters K₃. |
| weightTwoRegulator and embedding maps; §2.1 | ℚ target dimension 0,unique zero map;ℚ(i) one row G,conjugation −G | Real places do not add a row. |
| Integral-kernel Check; §2.1 | Primitive sixth root w:strict wedge w∧w⁻¹=0; antisymmetric boundary−w⊗w has order 2; doubled boundary 0 | Earlier reversal repaired. |
| Dilogarithmic group cocycle; §2.2 | Tuple (∞,0,1,i) gives G; repeated vertex gives 0; alternating five-point boundary gives 0 | Measurable/degenerate extension does not claim continuity everywhere. |
| Base-point independence of cocycle; §2.2 | Same base point gives zero prism cochain; swapping two vertices negates G | Coboundary direction and alternation agree. |
| stableK_hurewiczPrimitive; §2.2 | Zero ring:K_j⊗ℚ=PrimH_j=0 for j>0; R=ℚ,j=1 has u(p) for every prime | General rational H-space prerequisite S09. |
| Inverse, naturality and rank filtration; §2.2 | Identity ring map fixes u(2); GL₁ class u(2) remains u(2) in GL₂; rank 0 subgroup has image 0 | Explicit inverse and monotone images are now named. |
| stableHomology_primitiveProjection and pairing; §2.2 | Primitive a maps to a; product ab of two independent primitives has reduced coproduct a⊗b−b⊗a and primitive projection 0 | Projection fixes primitive Borel pairing; no projection theorem in degree 0 is used. |
| weightTwoRegulator_borel/borelCalibration_two; §2.3 | X=E₁₂,Y=E₂₁,Z=E₂₂:AltTr=−3,halfAltTr=−3/2,Φ=1/2; swapX,Y gives opposites | Source's displayed value 1 is not copied; full calibration remains a target. |
| Upper-half-space metric and Möbius adapter; §2.4 | Positive diagonal a=2 sends (w,h) to (4w,4h):Jacobian 64 anddensity factor 1/64; translation Jacobian 1 | Metric and measure transformations agree. |
| Boundary, distance and curvature; §2.4 | Vertical heights 1,2 have distance log 2; integral down to 0 diverges; sectional curvature −1; inversion above 0 hasJ=h²>0 | Height 0 excluded; missing h² would give denominator 0. |
| idealTetrahedronRegion; §2.4 | z=i,c=(1+i)/2,R²=1/2,w=(1+i)/4:distance²=1/8; h=1 gives 9/8≥1/2, h=1/10 gives 27/200<1/2 | Region contains the first point and excludes the second; real z excluded from the center formula. |
| Ideal truncation/exhaustion; §2.4 | Cusp tail A/(2H²); at 2H it is A/(8H²); omitting an open ball B loses positive volume(B) | Nonnegative density plus union hypothesis; no closed-manifold total-volume shortcut. |
| Lobachevsky identities; §2.4 | Λ0=Λ(π/2)=Λπ=0; Λ(π/4)=G/2; omitting the factor 2 changes Λ(π)by π log 2 | Definition has discriminating checks; boundary Lean padding S02. |
| idealTetrahedron_volume; §2.4 | At z=i, signed volume G>0; reversed orientation −G; degenerate real shape 0 | Actual native integral headline absent, S10. |
| Unit-circle Fourier series and tail; §2.5 | w=1 gives all terms 0; w=i,N=3,6 gives 8/9,209/225 and errors 0.0270767053,0.0129232947 | Both errors below 1/N; N=0 excluded. |
| Kummer reduction; §2.5 | i gives(−1,i,i), hence G; (1+i)/2 gives(i,−1,i), hence G; real 2 gives(1,1,1), hence 0 | Protected denominators; no approximation algorithm. |
| Explicit trilog relation quotient; §3.1 | R(1,1,1)=3[1]+4[−1]; analytic value 3ζ−3ζ=0; identity function gives−1≠0 | Raw relation and its evaluation distinguished. |
| coordinateRelation_specialize; §3.1 | Endpoint x=1 gives L₃(1) retained; pole 1/t specializes to ∞ and period 0 | Requires projective limits, not field inverse 0. |
| Three-term/inversion consequences; §3.1 | x=2:7ζ/8+7ζ/8−3ζ/4=ζ; x=−1 gives the same identity | Endpoint constant essential. |
| Low-weight complexes and square zero; §3.2 | δ₂[3]=u2∧u3; δ₂[2]=0; δ²[3]₃=(u2∧u3)∧u3=0 | Repeated unit proves square zero without claiming δ₃=0. |
| H¹ and functorial maps; §3.2 | No incoming degree-0 differential gives H¹=kerδ; identity field map fixes [3] and its boundary | General motivic comparison remains separate. |
| Universal cycle predicate comparisons; §3.2 | Universal quotient test detects [3] by coefficient 1; zero and[1] give0; weight-four inverse pair gives 0 | Both iff directions follow from factorization and the universal test; no free Prop. |
| Unit and five-term definitions; §3.2 | Prime valuation matrix I₃; zero function passes; constant 1 fails; indicator of 2 has five-term sum 1 | Third discriminating Check S15. |
| resExterior and uniformizer independence; §3.3 | res(t∧2∧3)=u2∧u3; all-unit residue 0; uniformizer 2t gives res(t∧2∧3)=u2∧u3 | Unit-part map removes valuation before reduction. |
| Integral tame/exterior comparison; §3.3 | v(t)=1,v(c)=0:tame(t,c)=c⁻¹; exterior residue c; for(t,t),strict residue 1 whiletame−1 | Extra (−1)^(vfv g) corrects the integral sign; rationalu(−1)=0,including residue characteristic 2. |
| Weight-three residue chain map; §3.3 | Source degree 2 has positive component, degree 3 negative component intoΓ(k,2)[−1]; applying d² gives 0 | Uniformizer-first convention and shift separated. |
| Generic vector configurations and coinvariants; §3.4 | Rank0 independence of subsets of size ≤0 is vacuous; BC₃³=0,BC₄³=C₄(3); repeated nonzero vector in rank ≥2 fails pair independence | Terms below row 3 killed by quotient; vector rescaling not imposed. |
| Deletion/projection/Biggrassmannian; §3.4 | Deleting i,j in opposite orders has coefficients (−1)^(i+j−1),(−1)^(i+j),sum 0 | ∂²,p² andmixedsum cancel; choice of standard space vanishes in coinvariants. |
| geometricTrilogGroup and seven-term relation; §3.5 | Coincident or four-collinear tuple gives 0; triangle η with three collinear side points maps[1]₃ with period ζ | No three-collinear zero rule. |
| triangleSymbol and parameter; §3.5 | z=2 determinants 2,−2,2,−1 give 2; z=1 gives η; z=0 denominator 0 excluded | Parameter order agrees with source; old section citations S16. |
| trianglePrime and incidence relation; §3.5 | trianglePrime(1)=−η−2·0+η=0; trianglePrime(0)=−0−2η+η=−η | Endpoint coefficients kept; the source’s inconsistent extra η/3 is not used. |
| M₃ inverse and auxiliary-point reduction; §3.5 | Seven-term boundary with a last givesC+Σ(−1)^iC_i=0, hence C=−Σ; moving a first contributes(−1)^5=−1 | Repaired source case (e) sign correct; M₃ η=[1]₃ excludes the zero map. |
| Projected and triple ratios; §3.5 | 6/5 versus 5/6;10/9 versus generic 1; independent rescaling cancels all powers | Native diagnostic padding S03; computations agree. |
| exteriorConfigurationMap r₄; §3.5 | Special four-tuple gives coefficient 18 at u5∧u67∧u197; Alt-coefficient−6,so−3Alt=18 | Computed all 24 permutations. |
| middleConfigurationMap r₅ and lower square; §3.5 | Moment tuple:δr₅=36u2∧u3∧u5=r₄∂; pivot grouping gives6·sum=18f₁ | Computed all 120 permutations; independent rescaling is not invariant. |
| geometricConfigurationMap r₆ and normalization; §3.5 | Triangle 2 maps18[2]₃; triangle 1 maps18[1]₃; iterated boundary coefficient −60 versus raw Alt₆ coefficient 300 | Necessary factor −1/5 only; no unsupported quotient-level Alt₆ identity claimed. |
| Lower projected identities; §3.5 | Pivot transposition fixes summand and negates alternation, givingS=−S, hence 0 over ℚ | Coefficients −3/2 and 18 are consistent with lower normalization. |
| Gale duality; §3.6 | Matrix (I,B) dual (−Bᵀ,I); product with transpose is −B+B=0; double orthogonal returns original subspace | Deletion and projection exchange; top class changes sign. |
| Complete configuration chain comparison; §3.6 | Top dual sum r₆(C)+r₆(C*)=0; lower deletion square 36=36 | Top projected square placed after duality. |
| Top cohomology/Milnor comparison and transfer; §3.6 | Steinberg(1−x)∧x∧y maps0; restriction followed by norm in degree d multiplies by d, not d³ | No full Quillen/Milnor identification claimed. |
| Configuration K-map and regulator class; §3.7 | GL₂ input maps0 in weight three; GL₃→GL₄ preserves comparison; [1]periodζ and[−1]period−3ζ/4 | Rank and Adams filtrations not identified. |
| cycleLifting_three; §3.8 | Zero cycle lifts zero; [1] cycle needs nonzero period ζ; generic resolution alone cannot give the full cycle lifting statement | All-configuration higher differentials explicitly owned; primitive input S09. |
| Cycle-period image containment; §3.8 | Projecting a primitive lift leaves the ζ pairing; zero or duplicate column forces determinant 0 | Inverse primitive comparison needed and now stated; its prerequisite S09. |
| Weight-three existence and every-family conclusions; §3.8 | ℚ: q=1;ℚ(i): q=16; arbitrary zero family: q=0; basis change A multiplies determinant by det A | Native headline coverage is present. |
| higherBlochGroup rational-curve induction; §4.1 | Constant α gives sp₁α−sp₀α=0; 1/t at 0 gives [∞]=0; B₁=U with u6=u2+u3 | Arbitrary differences are not relations; arbitrary residue extensions retained. |
| relationSpecialization/higherDelta_wellDefined; §4.1 | Raw kernel relation has boundary 0 before and after specialization; a constant unit 2 specializes to 2, a pole to ∞ | Arbitrary valuation residue extension is an explicit proof obligation. |
| higherSymbol_inversion; §4.2 | n=1,x=2 gives 2u2 withord₂=2 versus0; n=2,x=1 gives 2[1]=0; n=3,x=1 gives 0=0 | False without n≥2: S13. |
| higherPolylogComplex and naturality; §4.2 | Weight1 has one U term;weight three has three terms; repeated unit gives d²=0; identity map acts identically | No weight-0 group introduced. |
| Weight-two presentation and rigidity import; §4.2 | [3]₂ hasnonzero δ,u2∧u3; a Bloch-kernel constant specializes to itself; {t,a,b} has residue {a,b}≠0 | No full pre-Bloch or Quillen K₃ rigidity claim; K3 supplier unavailable this round. |
| explicitToInductive_three and motivic comparison conjecture; §4.2 | Endpoint [1] must map to [1], with period ζ; degreei=n target is Milnor, rather than all Quillen K-theory | Surjection target; injectivity and motivic comparison remain conjectural. |
| cycleEvaluation/cycleConstancy/higherBlochPeriod; §4.3 | Constant cycle has constant period; raw [t]₃ has boundary [t]₂⊗u(t)≠0; pole limit at ∞=0 | Constancy only after the actual kernel hypothesis. |
| Three Zagier assertions; §4.4 | Existence has q≠0;every family has q=0 on zero; a real basis rescaled by √2 need not lie in the rational image | Rational calibration cannot be replaced by real full rank. |
| Calibrated determinant conversion; §4.4 | d rows contribute π^((n−1)d); d−nN+(n−1)d=−n(N−d); zero K columns give determinant 0 | Exponent correct; nonzero-scalar overclaim S01. |
| explicitRawCycleFour; §4.5 | [1] is a cycle;[2]+[1/2] is a cycle;[2] detected by 7ζ(3)/8≠0 | Raw kernel stronger than its exterior-boundary image; weight-four theorem downstream. |
| Presentation square and cycle obstruction; §4.6 | p=a=idℚ,q=b=0,y=1: ordinary preimage 1, boundary 1, ker p=0 cannot cancel it; y=0 cancels 0 | Surjectivity alone insufficient; obstruction class is 1 modulo 0. |
| Injective lower comparison criterion; §4.6 | q=id forces ax=0 from qax=0; noninjective q=0 permits ax=1 | Mathematical criterion correct; native padding S02. |
| Empty determinant/real-even theorem; §4.7 | detFin0=1; ℚπ²=6ζ2,π⁴=90ζ4; ℚ(√2)π⁴/√8=24ζ_F2 | Deep statement retained; boundary simp deleted under S02. |
| Polynomial-place residue/homotopy conjecture; §4.7 | Constant residue 0;linear p=t has residue field F; p=t²+1 over ℚ has ℚ(i); infinity absent | Finite-support polynomial places correct; homotopy only conjectural. |
| Conditional full-complex transfer; §4.7 | Identity norm is id; degree-d restriction/norm=d; tower degree d₁d₂ | Independence and composition coherences remain hypotheses; they do not follow from top cohomology. |
| LF test forms and manifold currents; §5.1 | Empty M has zero tests/currents; escaping bumps→0 in compact-open topology but not LF; degrees outside 0…m give0 | Correct object, but already owned, S04. |
| Current differential/wedge/pushforward; §5.1 | δ′₀(φ)=−φ′(0); d²=0; multiplying a current by the zero form gives 0 | No arbitrary current product; generic calculus duplication S04. |
| Current de Rham and Dolbeault resolutions; §5.2 | On a point, H⁰ of the real de Rham complex is ℝ and H⁰ of the holomorphic complex is ℂ; higher degrees are 0. On a ball, a closed current of positive degree has class 0. | Resolution targets are distinct from defining the already-owned current carrier. |
| Analytic cycle current and proper degree; §5.2 | [point](1)=1;2[point](1)=2; a node’s two branches add 2; a finite degree-d pushforward multiplies by d | Multiplicity kept; inherited LF continuity already owned, S04. |
| Resolution invariance/Poincaré–Lelong/support; §5.2 | Birational degree 1 preserves the cycle; ddᶜlog\|z^r\|=rδ₀; a normal current of insufficient support dimension is 0 | Already-owned input S04; no analytic resolution of arbitrary spaces is asserted. |
| Normalized current dictionary; §5.2 | Tate factor in codimension d=(2πi)^−d; transpose on q=1 has minus, q=2 plus; d_D[−log\|z\|]=−δ₀ | New regulator normalization is legitimate. |
| universalRegulator_supportCone; §5.2 | Z empty:fib(id) acyclic; Z=X:U empty,fibreC(X); nested forgetful maps compose | Generic cone algebra, not a new universal regulator; declared gap/S08. |
| D_A,D_AZ,D_AH and β; §5.2 | d² second component=−g₁da+dg₁a=0; third=ρda−dρa=0; cycle(0,clZ,0) | Signs and degree-(q+1) first summand correct. |
| Admissible Chow parameter loci; §5.3 | Degree 0 cycle 0; double hyperplane coefficient 2 versus 1; component contained in face excluded | Closed universal support alone insufficient. |
| chowRelativeFamily and all-base pullback; §5.3 | x²=t at 0 gives 2[0]; after t=s² then s=0 the same 2[0]; characteristic 2 gives 2[s] | Generic relative-cycle operations already owned, S06. |
| tautologicalChowCycle/incidence/h-descent; §5.3 | Doubled Chow form maps to a double divisor; point through projection center excluded; generic degree-d projection has coefficient d | Family-specific adapter legitimate after S06; projective support is proper. |
| Face and vertex operations; §5.3 | r=0 proper hyperplane intersection is empty→0; negative expected dimension gives 0; two admissible faces retain multiplicity 2 | Every intermediate proper-intersection hypothesis is present. |
| Logarithmic Green representatives and pullback; §5.3 | −log\|z\|has off-support curvature 0 but divisor δ₀; a coefficient α with ∂bar∂α=0 but ∂α,bar∂α nonzero is excluded | Earlier closedness repair correct. |
| logarithmicCurrent_integrable and class comparison; §5.3 | ∫₀^ε\|logr\|rdr finite;∫₀^εr⁻²rdrdiverges;critical Green identity has −δ₀ | Does not admit arbitrary power poles or current pullbacks. |
| r-forms/alternation/multiplicativity; §5.4 | r₀=log; r₁=iη; r₂log-log coefficient 1/6,arg-arg coefficient −1/2; repeated entries give 0 | The i² sign and factorials agree. |
| r-current integrability and codimension; §5.4 | m=1,c=1 gives current degree 2; uncancelled log r·dr/r diverges; alternating combination cancels bad terms | Cancelled expression needed before local integrability. |
| varietyExteriorResidue and Deligne dictionary; §5.4 | res(z∧c)=c; dη(z,c)=−2πlog\|c\|(δ₀−δ∞); normalization turns the raw factor into the Deligne sign | The source’s unchecked ordinary-d identity is not used as a definition. |
| Raw Deligne complex; §5.5 | Weight one has function/current top operator 2bar∂∂; d²=0 after type projection | Raw and normalized models kept distinct. |
| Simplex regulator and real descent; §5.5 | i=0 cycle map=(2πi)^nδY; i=1 uses log; n=1 at unit a gives log\|a\|; conjugate pair projects with Tate parity | Exceptional degree-zero cycle formula explicit. |
| Wang T_m,W_m,G_m; §5.7 | T₀=1,T₁=−log\|f\|; ratio 1 gives log1=0 and zero jets; m=2 has an alternating two-entry form | Distinguishes raw r₀ from normalized T₁. |
| Wang boundary currents; §5.7 | d_DT₁(t)=−δ₀+δ∞; m=1 cube has 2 faces, simplex has 2; m=2 cube has 4, simplex has 3 | Face counts and signs correct. |
| Cubical regulator/normalization; §5.8 | δ-model at unit a gives −log\|a\|; J₁=−1yields supplied +log\|a\|; degenerate coordinate 1 gives 0 | Infinity/zero normalizations compared through the common quotient. |
| integrationComparison φ and Green/Wang identity; §5.9 | m=0: W₀=1, φ is base inclusion;critical d_D g=ω−δZ; subcritical r=1 sign +, r=2 sign − | Cannot replace cohomological degree by cube degree. |
| ψ and cubicalRegulator_beilinson; §5.9 | Cycle(0,clZ,0)↦P_cZ; base(0,0,α)↦φα; principal Green piece cancels δ_div | Actual comparison uses the independent universal map; gap accepted apart from S08. |
| mixedWangForm/mixedRegulator; §5.10 | Axes (n,0),(0,m) recover cube/simplex; (1,1) total δ−∂; ratio 1 kills the form | J_n acts on cube degree only; an extra simplex-degree sign would fail an axis. |
| Simplicial/cubical agreement; §5.10 | z₀↦−z₀ adds log\|−1\|=0 and constant darg=0 | Does not eliminate the raw-to-normalized dictionary obligation. |
| Chow polylogarithm forms; §5.11 | p=0,q=1:r₀→log; p=q−1:degree 0; p=1,q=2: r₂ has 3 entries and real coordinate −∫r₂/(2π) | Corrected arity and (2πi)^−p; source misprint not copied. |
| resolvedIncidenceRegulator independence/additivity; §5.11 | Double component gives 2T; nodal two branches T₁+T₂; two colliding points have regular value 2f(0) | Relative cycle pulled back before current construction; no unrestricted distribution pullback. |
| Smooth/transverse base change and face identities; §5.11 | Identity base change T=T; map into a singular stratum constructs a new current, not T’s undefined pullback | Analyticity requires arrangement-transverse smooth cycles, not merely a smooth base. |
| Green classes/Arakelov cone; §5.12 | Principal pair (divf,−log\|f\|)has class 0; cone[-1]puts degree 2n−i in group label i | Quotient top smooth forms before the cone; no ordinary Chow replacement. |
| Curve unramified fibre/localization; §5.13 | Zero residue map gives C⊕target[-1],not just C; ramified cover of degree e multiplies residue by e | Full homotopy fibre and adjacent cohomology term retained. |
| η and tame current formula; §5.13 | η(z,c)=−log\|c\|dargz; residue coefficients at 0,∞ are −log\|c\|,+log\|c\| | Parameter tame(t,c)=c⁻¹fits the current sign. |
| Steinberg/Chern comparison; §5.13 | η(z,1−z)=dD; at z=i,v=1 the value is (log2)/2; ch₂,₂=−c₂,₂supplies the displayed positive regulator | Analytic one-form already owned, S07; Chern comparison gap not reproved. |
| Chow dilogarithm and Steinberg evaluation; §5.14 | P₂((1−t)∧t∧(t−a))=D(a); a=3 gives real period 0 but can have nonzero boundary | −1/(2π)matches the current Stokes identity. |
| ρ₂ current identity; §5.14 | Integrating dρ₂ gives 0=2πΣv(g)D(f)+∫r₂; henceP₂=Σv(g)D(f) | Sign consistent with the P₂ definition. |
| **Strong reciprocity**, both triangles; §5.14 | Total exterior residue of  t∧(t−1)∧(t−3) is3∧2≠0; thereforeδ₂h≠0 | Codomain pre-Bloch, not Bloch kernel; zero homotopy fails. |
| Strong reciprocity ⇒ Suslin and analytic equality; §5.14 | Res=δ₂hhas class 0incokerδ₂; identity family preserves P₂; constants give 0 | Analytic equality only for constructed maps, not an arbitrary algebraic homotopy. |
| Rational-curve h and auxiliary-point independence; §5.15 | Repeated points give 0; r(0,1,a,∞)=a/(a−1)hasD=−D(a); auxiliary difference is a five-term sum 0 | Rational coefficients remove the 6-torsion qualification. |
| Family constancy and Qbar descent; §5.15 | Degree-d cover pullback integral=dI, so descent uses 1/d; zero periods at all complex embeddings detect the rational Bloch kernel | A single embedding is not used for injectivity; avoids arbitrary-curve quotient identification. |
| Elliptic line h_E; §5.16 | Swapping L₁,L₂ negates wedge and symbol sum; rescaling lines leaves projective cross-ratios unchanged; a tangent double point contributes 2 symbols | General-position and multiplicity conditions present. |
| ellipticFiveTermDescent; §5.16 | Chord y=0 has divisor (x)+(0)−(x)−(0)=0; the two associativity parenthesizations have equal divisors | The extra explicit-quotient proof is owned, but not certified by the source’s broader-quotient proof. |
| Arbitrary-characteristic cubic geometry; §5.16 | characteristic 2 gradient=(X²,Z²,Y²),only simultaneous zero is 0; characteristic 3: ∂X=Z²forces Z=0, then ∂Z=Y² and the cubic force Y=X=0 | Both projective cubics smooth; no short-model restriction. |
| Plane-curve integral and normalized line equations; §5.16 | Integral 2πΣ(−1)^iD gives P₂=−Σ; equations x,y,z generally have (y+z)/x≠1 | Special normalization retained as a hypothesis. |
| curveRho2_fiveTerm/residue/diagonal; §5.17 | At f=1/2,v=1,ρ₂(f⊗f)=−4log²2/3=−dL₃; g constant with norm unequal to 1 retains −αlog\|c\|/3 | Both D and exterior parts needed for descent. |
| curveWeightThreeRegulator/Chern; §5.17 | A ramified K₄ class has nonzero residue and does not enter the unramified fibre; identity restriction commutes | A cohomology map, not an all-K₄ isomorphism; the explicit comparison owns its normalization. |
| **Generalized reciprocity conjecture**; §5.17 | Weight two signed tame product is 1; weight three at a=3 requires a nonzero homotopy; constant input has residue 0 | Higher weights and correspondence coherence conditional; no unconditional instance. |
| ellipticTorusFourierAdapter and character; §5.18 | Square lattice:χ₁(x+iy)=exp(2πiy); χ₁(i)=1; ∫₀¹exp(2πiy)dy=0; χ₀integral1 | Nonzero area and full lattice hypotheses exclude area 0. |
| Elliptic kernel, summability and finite divisors; §5.18 | Triad(1,i,−1−i),points 0:summand(−1+2i)/2,norm√5/2; dyadic sum Σ(j+1)2^−j=4 | Convergence is a native-statable headline, S11. |
| Kernel periodicity/translation/swap/scale; §5.18 | Simultaneous translation factor χ₀=1; swapping the last two frequencies negates the numerator; λ=2 gives factor 1/32; repeated last points give K=0 | Zero indices excluded, preventing 0/0. |
| Holomorphic pairing identity; §5.18 | ρ₂ part D dargg integrates−∫log\|g\|α; correction −1/3 gives total −4/3 | Holds for holomorphic/antiholomorphic ω, not an arbitrary closed form. |
| Fourier logarithm coefficient/finite-triad pairing; §5.18 | Three coefficients (−A/2π)³, derivativeπ/A, area−2iA; α order and frequency reversal give +iA³/(4π²) | Then −4/3 gives −iA³/(3π²); raw constants match. |
| Regularized elliptic regulator pairing; §5.18 | λ=2: A³×64, kernel÷32, so integral×2, matching dbar z; constant logs of zero-divisor functions need cycle-relation cancellation | Common regularization is owned; its full convergence proof is not certified here. |
| Completed units and logarithm map; §6.1 | ℚ and imaginary quadratic rank 0,minor1; p=2 torsion −1 has log 0 but nontrivial completion class | Correct definitions; existing owner S14. |
| All-embeddings matrix/rank/minor/basis laws; §6.1 | An inert prime still gives N columns; unit basis determinant ±1 multiplies minors; quadratic row (a,−a)minors −a,a | Same matrix as the supplier transpose, S14. |
| Totally-real/abelian regulator diagnostics; §6.1 | ℚ(√2),p7:10²≡2,11⁶≡15mod49,so valuation of log ε⁶ is 1; logp(p)=0outside the unit-kernel claim | Exact p-adic Check correct; abelian result imported. |
| Exact L₃ differential and continuity; §6.2 | Real unit vector at 1/2,2,−1 gives4log²2/3,−log²2/3,0; at i radial0/angular−G | Already owned, S07; Check corollaries are padding, S02. |
| Endpoint/inversion/conjugation derivative; §6.2 | At1 derivative0; inversion tangent −v/z² at z=2 changes the half-point derivative to −log²2/3; conjugation leaves the real value | Not a blanket nondifferentiability claim at all weights. |

### Source locator ledger

These **19 source groups** were checked against the cached legal copies, using the versions named in the manifest. Line numbers below refer to the numbered extractions, not to roadmap lines. A matching locator verifies the stated scope; it does not certify every intermediate argument in a long proof. No further source was needed and no missing-reference request was created.

| Source and locator group | Witness | Result |
| --- | --- | --- |
| Z90 §§7–8, (33)–(36), Proposition 3, pp.413–417 | Z90 lines 841, 884–895, 929–937 | Bernoulli normalization, endpoint parity and the rational special-value statement match. The real-basis condition alone is not a rational-image condition. |
| Z07 §1, (2), and §2, (7)–(8) | Z07 lines 392–421, 570–589 | Circle series, Kummer reduction and ideal-volume formula support the stated analytic headlines. The computations at i distinguish their signs. |
| G94 §§3.1–3.10, Theorems 3.12 and 5.11 | G94 lines 1105–1195, 1322–1360, 2280–2300 | Projection symmetry, stabilization, the rank-two vanishing and Borel comparison are located. Its lower normalization must not replace G95's factors 18. |
| G95 Theorem 1.1, Definition 1.5, Lemma 1.16, Corollary 1.19, §§3,5,8–9 | G95 lines 240–250, 455–499, 755–860, 903–940, 2204–2293, 2808–2850, 2974–2992, 3311–3341, 3473–3503 | The endpoint relation, geometric quotient, lower square, inverse, duality and all-configuration lifting route are present. Weight-one inversion fails, S13. The §3 extra endpoint and §5.2 case-(e) sign inconsistencies are not copied. The complex diagram's unreadable OCR arrows are not independently certified here. |
| MIL §§7.1–7.2, Theorem 7.2.1 and Lemma 7.2.2 | MIL lines 140–179 | Lobachevsky and hyperbolic metric/volume normalizations match. The three vertex angles sum to π, as used in the roadmap; the scan's stray 2π at line 155 is not adopted. |
| SV Definition 3.1.3, Theorems 3.3.1, 4.2.2, 4.4.11, Corollary 4.4.13 | SV lines 500–525, 760–779, 1050–1085, 2000–2020, 2730–2755, 2795–2820 | Relative-cycle specialization, positive-characteristic coefficient qualifications and h/Chow comparison located. This supports a Chow-family adapter, not duplicate ownership of generic relative cycles, S06. |
| G00 β₂, (15), Proposition 4.1 and (28) | G00 lines 130–145, 320–328, 733–790 | β₂=1/3 occurs at line 143, not in equation (15). The regulator component contains the −1/3 correction used in §5.17. |
| G04 §§2–3,5–6 and their numbered constructions | G04 lines 398–441, 516–542, 588–620, 754–826, 866–950, 984–1004, 1047–1128, 1950–2052, 2152–2167, 2270–2415, 2510–2690, 2793–2817, 2840–2905 | Raw Deligne, simplex, cone and Chow-form constructions, calibration and reciprocity locators exist. The corrected arity is supported by line 1067; the inconsistent later display is not adopted. The trace witness gives 1/2 rather than the printed 1. Explicit five-term elliptic descent is an additional obligation, not certified by the broader-quotient proof at lines 2887–2890. |
| GR Theorems 1.1–1.3, Conjecture 1.4, Lemmas 5.1–5.2 | GR lines 110–120, 190–205, 245–259, 2391–2438, 2586–2596 | Every-family and inductive-cycle formulations are distinguished from existence. Weight four remains downstream. The unused §7 alternating top formula is not needed to justify this package's map. |
| BFT §§4–6, Propositions 4.3,5.16,5.23,5.26, Theorems 4.7,6.5,6.11 and Proposition 6.12 | BFT lines 80–92, 251–275, 296–322, 335–348, 463–483, 640–677, 718–724, 805–869, 920–988 | δ is infinity-minus-zero. The Green/Wang comparison distinguishes critical degree 2p from subcritical degree r. Mixed comparison is stated for the appropriate cycle complexes; the analytic comparison assumes a projective complex manifold. |
| D96 Theorem 2.1 and Theorems 3.3–3.4 | D96 lines 300–318, 760–837 | Curve K₄ regulator and elliptic series/pairing are present. The roadmap's explicit constants were recomputed from its own Fourier convention, rather than inferred from an unspecified source constant. |
| DEM I §§2–3 and III §2 | DEM lines 532–545, 862–874, 1280–1298, 6924–6940, 7023–7055, 7167–7185 | Current, Poincaré/Dolbeault, extension, support and Lelong–Poincaré statements are located. The support and local integrability qualifications are material. Existing roadmap ownership is S04. |
| BUR II, Corollary 3.8, Definition 4.2, Theorem 4.3, Lemma 4.5 | BUR lines 2940–2960, 3054–3102 | Support classes and Green representatives located; separate ∂ and bar∂ closedness is required and now retained. |
| NEK §§7.3–7.5 | NEK lines 839–870, 888–898, 916–924 | Logarithm, product, tame and η conventions agree after the stated Chern-character conversion. |
| SCH §4, p.28 | SCH lines 978–1020; corresponding displayed formula inspected in the rendered page | For positive K-degree, chᵢ,ⱼ=(-1)^(j−1)cᵢ,ⱼ/(j−1)!; at j=2 the sign is negative. OCR alone did not reliably preserve this formula. |
| SHA §1.5, Proposition 1.5.6, Theorem 1.5.7, Definitions 1.5.9–1.5.10 | SHA lines 874–884, 895–904, 920–938 | Local logarithm and completed-unit formulations located. The unit restriction excludes the nonunit p, whose Iwasawa logarithm is zero. |
| WEI V §6, Theorems 6.2,6.6 and 6.7.1–6.7.3 | WEI lines 1725–1736, 1824–1838, 1880–1889, 1908–1940 | Homotopy invariance, localization and specialization support indecomposable K₃ rigidity; they do not give arbitrary-curve presentation equality. |
| WEI4 IV §1, pp.11–12 | WEI4 lines 480–510, particularly 493–503 | The general rational primitive comparison is a genuine mathematical input. A source citation does not supply the missing roadmap theorem in S09. |
| BOR77 Remark 6.3, p.632 | BOR77 lines 579–601; formula inspected in rendered printed p.632 | For a totally real field, m odd means n=m+1 even. The formula contains √disc and π^(−nN), yielding the nonzero rationality used for empty determinants. |

### Supplier, ownership and pin ledger

There are **21 supplier groups below: 18 with current text checked, three unavailable**. Each row groups the indicated section citations; these are counts of checked groups, not a count inflated by repeated mentions. Main/Completed and the sixteen specified sibling heads were searched by mathematical object. Current new-roadmap suppliers were read through the roadmap index's grep/show tools; a revision of an existing roadmap was not substituted for main. The supplied ArithmeticKTheory head contains the rank overlap; the other ownership findings cite the current main or named supplier texts identified below.

| Supplier; checked location | Contract and concrete convention test | Result |
| --- | --- | --- |
| PolylogarithmFunctions §§4.2,4.5,4.6,4.8,5.1,5.2,5.4 and five-term section | n≥2 endpoint agreement; inversion parity; L₃ derivative at 2 is −log²2/3 | Three stale Lean names and duplicate differential, S07. singleValued_inv and the five-term export exist. |
| GeneralAlgebraicKTheory §§3.12–3.14 | Ring plus/Q comparison and K₁ matrix convention; zero ring has zero positive K-groups | Supplied all-ring model exists; unrestricted primitive theorem is additional, S09. |
| StableHomotopyKTheory §§3.37,4.14 | Stable block sum and H-space; §3.37 has finite-type rational homology | ℚ has infinitely many independent prime classes in H₁, so that theorem alone is insufficient, S09. |
| K2SymbolsBrauer §§5.4,7.2,8.2–8.3,9.5,9.11,9.16,10.5,10.9,10.24,10.29–10.30,11.3,11.5 | Parameter-last Milnor residue, norms and right Quillen boundary; at p=5, tame(5,2)=3 but the degree-two right boundary corresponds to 2 | Degree-three comparison sign is +; degree-two sign is −. The README retains this distinction. |
| SchemeKTheoryOperations §§3.3,4.5,5.1–5.2, Layer 6 | qcqs localization, noetherian coherent coniveau, regular K-homotopy and Adams operations | The package uses the regular curve setting for K-theory, and does not infer regularity from an arbitrary scheme. |
| DifferentialGeometry Layers 0–2,5–6,8 | Forms, exterior derivative, orientation, integration, Stokes and de Rham comparison | For compactly supported f on ℝ, ∫df=0; orientation reversal negates integration. Currents require the other owners below. |
| GeometricTopology Layer 7 | Hyperbolic metric and Riemannian volume | h⁻³ density and vertical distance log 2 match; the particular ideal region is an addition of this roadmap. |
| SchemeAndStackFoundations Layer 5, especially §§5.1,5.5–5.6 | Locally finite cycles modulo rational equivalence; Cartier intersection and smooth Chow product | Negative dimension gives zero; a doubled divisor has coefficient two. These are not relative Chow-family carriers. |
| AlgebraicVectorBundles L0A–L0C, L2B | Finite locally free operations, tensor, dual and pullback | Rank-zero determinant is the trivial line; arbitrary pullback preserves finite local freeness. |
| AlgebraicModuliForArithmeticGeometry §1.6 and §§9.4–9.7 | Chow parameters and resolution adapters | Degree-two doubled cycle retains multiplicity two. §7.10.1 does not exist; analytification correction S05. Resolution adapters explicitly point to ResolutionOfSingularitiesCharacteristicZero. |
| ComplexComparisonPartII §§C−1.1,C5.4 | Analytification, current calculus, cycle integration, extension, Lelong–Poincaré | Nonreduced analytic stalks retained; ddᶜlog\|z\|=δ₀. Existing ownership S04–S05. |
| MotivesAndAlgebraicCycles §§4.8a,4.14 | General noetherian-base relative cycles, specialization and pullback | x²=t specializes to 2[0], including after t=s²; generic operations are already owned, S06. |
| IntegralIwasawaTheory §2.2,§§4.1–4.4 | Completed units, all-embeddings matrix, rank/minor criterion, abelian Leopoldt | Supplier N×r matrix transposes to this package's r×N matrix; rank-zero minor is 1. Duplicate adapter S14. |
| ColemanIntegration L0.F,L0.15–L0.18 | Rational formal series and logarithm-branch/finite-extension adapters | Branch difference is a·v; on a unit v=0 the branches agree. No later Coleman integration theorem is consumed. |
| ArithmeticKTheory §§3.3–3.4, supplied open head | Rational localization and ranks of orders/central simple algebras | ℚ degrees 3,5 give ranks 0,1; ℚ(i) gives 1,1. Nonminimal Borel rank request S17. |
| KTheoryFiniteLocalFields §3.0a | BlochCycle/HigherChow, coefficients and localization | CH¹(F,1)=Fˣ; CH¹(F,0)=0. Shared simplicial carrier must be imported, S08. |
| GeometricCurrents G1, main | LF form tests, currents and boundary | δ′₀(φ)=−φ′(0); escaping bumps separate LF from compact-open topology. Duplicate foundations S04. |
| ComplexKahlerGeometry K5a, main | Bundle tests and LF continuous duals | Zero test space has zero dual; switching a line bundle to its dual changes the pairing carrier. Duplicate LF construction S04. |
| K3BlochGroups Layers 3–4,§4.21,Layer 6 | Requested pre-Bloch, strict-exterior, Suslin and rational-function rigidity APIs | No current text in the supplied copies or the index show result. Not certified; not reported as nonexistent. |
| BorelRegulators Layers 3–5,§7.1 | Rational image, covolume and totally-real even periods | Current text unavailable. Declared gap accepted; only the duplicate rank request is S17. |
| MotivicEtaleKTheory Layer 4,§§9.1,12.2 | Universal Deligne regulator, Chern comparison, logarithmic/support input | Current text unavailable. Declared gap accepted; only the duplicate higher-cycle request is S08. |

The two declared gap slugs agree exactly between `packages/Polylogarithms/design/plan.json` and the README. Both have named suppliers. Their genuine period and universal-regulator obligations are conditional inputs, not missing-supplier findings. The added H-space gap in S09 is a proposed repair, not an undeclared assumption silently accepted by this review.

The library pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following native inputs were read at those pins, rather than inferred from contemporary online documentation.

| Pinned declaration or object | File and line | What the native carrier includes or does not include |
| --- | --- | --- |
| Complex logarithm derivative | `Mathlib/Analysis/SpecialFunctions/Complex/LogDeriv.lean:45` | Slit-plane hypothesis; not a holomorphic derivative across the cut. |
| Log-sine half/full integrals | `Mathlib/Analysis/SpecialFunctions/Integrals/Log.lean:46`, `:85` | Gives the Λ(π/2)=Λ(π)=0 boundary computations, S02. |
| NumberField.discr_ne_zero and rational discriminant | `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean:41`, `:89` | NumberField hypotheses; excludes zero discriminant in normalized periods. |
| NumberField.dedekindZeta | `Mathlib/NumberTheory/NumberField/DedekindZeta.lean:49` | Actual zeta function on native number fields, rather than an arbitrary scalar. |
| InfinitePlace embedding and signature formulas | `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean:102`, `:447`, `:475` | One complex representative per infinite place; d≤N in the headline signatures. |
| Distribution, delta and derivative | `Mathlib/Analysis/Distribution/Distribution.lean:165`, `:201`, `:234` | Scalar test-function dual and negative-transpose derivative; not the full manifold form-current package. |
| AlgebraicGeometry.AlgebraicCycle | `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44`, `:54` | Locally finitely supported coefficients and weighted map; no relative flatness, effectivity or specialization law in the definition. |
| Exterior-power alternating map | `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean:56` | Strict alternating exterior power, not merely skew tensors before rationalization. |
| IsZLattice and ZLattice.covolume | `Mathlib/Algebra/Module/ZLattice/Basic.lean:433`; `Mathlib/Algebra/Module/ZLattice/Covolume.lean:72` | Discreteness is an explicit instance and real span is top; covolume takes the Haar measure with a default. S11's area is statable. |
| HasContinuousLogOn and log API | `TauCeti/Analysis/Complex/ContinuousLog/Basic.lean:161`, `:172`, `:199`, `:207`, `:213`, `:270` | A chosen continuous logarithm implies nonvanishing; multiplication/inversion and union laws retain their hypotheses. |
| residueUnit and finite support of orders | `TauCeti/FieldTheory/FunctionField/Place/Residue.lean:185`, `:208`, `:214`, `:221`; `TauCeti/FieldTheory/FunctionField/Place/Zeros.lean:461` | Reduction rules require valuation-zero units; finite support uses IsFunctionField. Nonunits are not treated as residue-field units. |
| Finite-extension logarithm convergence/injectivity | `TauCeti/NumberTheory/LocalField/Logarithm.lean:97`, `:165`, `:256`, `:285` | Injectivity uses the ramification inequality e<(p−1)i; no unramified or odd-prime shortcut is taken. |
| Riemannian volume | `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:76` | A measure, not an assertion that every manifold has finite total volume. |

### Headline coverage

| README headline | Acceptance status |
| --- | --- |
| Bloch–Wigner descent, measurable class and Borel calibration, §§2.1–2.3 | Missing Bloch/K-theory/regulator carriers; name these in the module docstring, S12. |
| Geometric ideal-tetrahedron volume, §2.4 | Native region and integral make it statable; absent, S10. The angle identity alone is present. |
| Uniform Fourier bound and Kummer identity, §2.5 | Both present on the actual analytic functions. |
| Trilogarithm functional equations, §3.1 | Present as singleValued_three_relations with actual universal relation conditions. |
| Configuration chain comparison, primitive lift and Borel identification, §§3.5–3.8 | Future configuration/Bloch/K-theory carriers; docstring must explain absence, S12. |
| Weight-three existence and every-family rationality, §3.8 | Both present on native cycle predicates and number-field zeta values. |
| General Zagier and motivic comparisons, §§4.2–4.4 | Conjectures are identified as conjectures; not unconditional acceptance theorems. |
| Totally-real even-weight special values, §4.7 | Present with n≥2 and Even n, conditional in its proof route on the declared period supplier. |
| Explicit/universal current-regulator comparison, §§5.5–5.12 | Missing current/higher-cycle Deligne carriers; docstring explanation required, S12. |
| Rational/elliptic reciprocity and curve Chern comparison, §§5.14–5.17 | Missing selected Bloch and curve regulator maps; do not substitute a theorem about arbitrary scalars or jets, S07/S12. |
| Elliptic kernel absolute convergence, §5.18 | Native lattice and summability carriers suffice; absent, S11. |
| Elliptic regulator pairing, §5.18 | Requires curve/current maps unavailable at the pins; name this limitation, S12. |
| Completed-unit matrix and exact analytic differential, §6 | Already-owned supplier theorems, S07/S14. Boundary consequences do not replace other headlines. |
| Weight-four Zagier theorem | Explicitly downstream; its absence is not a defect or an upward dependency. |

### Direction and package checks

The required dependency command was run read-only with the supplied order and `--movable`. Its final output was:

```text
depcheck: 18 roadmaps, 133 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This validates the present parsed dependency direction; it does not validate the contents of supplier contracts, which were checked separately above. Repairs that repoint ownership or add a gap must rerun the gate.

The PR diff contains seven files and 2,234 inserted lines, all under `packages/Polylogarithms/`. The only working-tree addition made during this pass is this report. README and Suggested.lean were not edited. Suggested.lean has a single `import Mathlib`, the required namespace, no `set_option`, no `lemma`, no admitted data, no `True` placeholder, and no admitted example. The removed algorithmic interface has not returned. The deficiencies in acceptance-file content and documentation are S02–S03, S07, S10–S12 and S18.

## Not verifiable

- K3BlochGroups' present section/declaration contracts could not be independently resolved: no current copy was available in the supplied main/Completed/package locations or the roadmap index's show result. The source mathematics does not certify those future API names. BorelRegulators and MotivicEtaleKTheory were likewise unavailable; their genuine declared gaps remain accepted conditional inputs, not findings about absence.
- No Lean command was run, as required by the read-only brief. All 38 named types were compared using the supplied elaborated-signature inventory. This review does not claim a fresh build or fresh `#check` run; the inventory's extra “cycle” entry is the scanner artifact explained above.
- The extra explicit-five-term elliptic descent, all-configuration higher-differential argument and full analytic regularization are future proof obligations. The cited constructions, domains and numerical sign witnesses were inspected, but this pass does not certify those complete proofs. No counterexample was established to them. G95's badly extracted complex diagram was not certified arrow by arrow; the boundary computations are independent witnesses, not a substitute for that diagram.
- Ownership was searched in all sixteen provided sibling heads, main/Completed, board packages and the available named new-roadmap suppliers. Open work without an available head was not inspected as a source of mathematical contracts. No unavailable declaration was called nonexistent solely because a search returned no result.
- No legal source remains requested or unreadable as a work. SCH and BOR77 required rendering the cached legal scans to verify formulas that OCR lost. Verification of nineteen source groups does not certify every equation or every argument in those works.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c5a54c1f09028919c6d75ce86e2a6536e3e4a8f6", "job": "RT-Polylogarithms~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->

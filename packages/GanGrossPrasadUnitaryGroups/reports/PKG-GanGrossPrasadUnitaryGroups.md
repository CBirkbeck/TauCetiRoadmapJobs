# GanGrossPrasadUnitaryGroups package report

The package retains all 40 accepted targets, all 82 named API entries, all 130 catalogue Checks, the eight convention Checks and all seven layer examples. The README expands the generated catalogue skeleton into the accepted seven-layer build. Six small native-carrier specializations add five representative theorem signatures and twelve proved examples. The mathematical endpoints and conjectural boundaries are unchanged.

The deliverables are `packages/GanGrossPrasadUnitaryGroups/README.md`, `packages/GanGrossPrasadUnitaryGroups/Suggested.lean`, `packages/GanGrossPrasadUnitaryGroups/metadata.toml`, `packages/GanGrossPrasadUnitaryGroups/sources.toml` and this report. Only the top-level gaps list changes in `packages/GanGrossPrasadUnitaryGroups/design/plan.json`; structural comparison with the input confirms that every other JSON value is identical. The accepted design README and review files are unchanged.

## Corrections and limits

1. Applied the accepted review's three non-blocking locator corrections in the package README: Theorem 7.2.1 points to bp-arch line 6813–6814, Proposition 7.4.1 to bp-arch line 7165–7166, and Lemma 11.3.1 to bp-arch line 10538–10539. Also pointed the three local trace theorems to their actual statements at bp-arch line 10551–10558. The immutable target locators in the design JSON were not edited.
2. Made the local additive character in §1.2 explicitly unitary, with codomain S¹, as required for the asserted unitary Bessel character; see ggp line 1631–1634. This makes explicit the convention already used globally at ggp line 3081–3083.
3. Clarified the auxiliary Bernstein argument in §2.4 and its supplier contract. An unramified twist never leaves its inertial class. First choose a supercuspidal inertial class absent from the finite support of the fixed endpoint, then avoid reducibility inside that class by twisting. This retains the exact Hom comparison and the unrestricted irreducible endpoints. The existence conclusion is the one used at ggp line 2233–2235.
4. Replaced obsolete supplier-section descriptions by the actual smooth, automorphic, spectral, endoscopic and theta sections inspected. Narrowed six needs sentences to their comparison supplements: local-categories, local-bernstein, local-jacquet-filtration, archimedean-globalization, automorphic-realization and adelic-measures. The 36 accepted gap slugs, their owners and neededBy lists remain intact. Each needs sentence appears verbatim after its required “What … must provide (gap:…)” prefix in the README.
5. Heavy API and Check labels are namespace-free prose. Every backticked Lean identifier in an API or Check is declared in Suggested.lean. No non-existent analytic object is represented by admitted data. The elementary component calculation cites ggp §4, pp. 14–15, ggp line 510–548, and §6, ggp line 720–730; the full constituent sign group cites bpcz §1.1.3, p. 3, bpcz line 96–107.

6. Rephrased the seven mathematical uses of the singular word “packet” that the residue scanner matched, across Scope and ownership, the ModularityAndLanglandsExtensions contracts, the ordinary-endoscopy contract and §3.6. The wording now explicitly refers to Langlands packets, their classification, labeling and character identities. Classification premises, Whittaker normalization, ownership, hypotheses, formulas and dependencies are unchanged. The residue scan reports **0 hits**. The repeated dependency check reports `depcheck: 8 roadmaps, 57 edges, 0 problem(s)`. Suggested.lean, metadata.toml, sources.toml and design/plan.json are byte-for-byte unchanged by this repair; the recorded elaboration result remains applicable.

The README cannot support a proof of the split archimedean higher-codimension prediction (§3.10), nor of the general fixed-pair global conjecture (§4.4); both retain their accepted conjectural status. The theorem of §3.11 retains precisely the certified split range. The all-residue spherical theorem (§5.3) is an owned extension: Harris's stated intermediate excludes even residue characteristic at harris line 170–181. The README retains the trace-one integral-coordinate argument and both dyadic rank-one controls, rather than attributing the extension to Harris's theorem.

The actual Hermitian-group, smooth/Casselman–Wallach, enhanced-parameter, quasi-character, regularized-integral and automorphic-period carriers are not present at the pins. Accordingly the multiplicity, packet-selection, global nonvanishing and GGP.8 endpoints remain full README statements. Lean records the easy algebraic model and sign-group milestones on native carriers. It does not replace an endpoint by a conditional statement about arbitrary scalars, a bounded model or a package of its own desired conclusions. Convention Checks involving future analytic objects likewise remain attached to those README targets. The twelve Lean examples test the six actual definitions and use none of the admitted theorem signatures.

No notion was moved down from a later roadmap. PeriodsAndSpecialValues, TwistedAutomorphicDescents and QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups remain consumers. The arithmetic period witness in SelmerIwasawaCohomologyPartII §8.1 supplies no premise here. The AutomorphicSpectralTheory multiplier continuation and EndoscopicTransferAndUnitaryTraceComparison relative continuation remain explicit supplier gaps with preceding placement, as in the accepted design.

## Duplication sweep

Read the roadmap shapes in `TauCetiRoadmap/ReductiveGroups/README.md`, `TauCetiRoadmap/GlobalNumberFields/README.md` and `Completed/RestrictedProducts/README.md`. The content snapshot is origin/main at d9c5729419150d5d4adbc5073310d038141e3553. The library pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

Searched main and Completed, both pinned library trees, the seven specified open heads and the named earlier suppliers by mathematical object: arbitrary and standard Hermitian forms and isometries, orthogonal complements, unitary groups and points, tensor actions and intertwiners, smooth duals, induction and Jacquet modules, Bernstein and mirabolic theory, Whittaker spaces, component groups, ordinary and relative transfer, Schwartz distributions, completed L-factors, Tamagawa measures and Bessel periods. Matches for Bessel functions, Hilbert-space Bessel inequalities, coding-theoretic Hermitian forms and positive Hermitian matrix analysis were read as different objects.

| Open roadmap head | Inspected commit | Comparison |
| --- | --- | --- |
| QSeriesPartitionsAndMockModularForms | 8fe91e0905291e2ed941f90e1d4bcaaceb3ce96e | Scalar analytic Bessel/Whittaker functions and modular growth, not relative unitary models. |
| K3SurfacesAndSymplecticBoundedness | b82cbb70e85924d052746bdfe84156c20d8e201f | Surface geometry, integral cohomology and lattices; no relative-model or period target. |
| CohomologyComparisonsPartII | dd8d7e6fda7516b9ab6806d5d75f5202332851c7 | Syntomic and coefficient comparisons; no overlap. |
| ColemanIntegrationPartII | bd972d91ed7d5d8bd3dd2e7ee84b35853db32ba4 | Curve integration and index pairings; no automorphic Bessel period. |
| QWittVectors | 4605fbb0a2d9279b561f9467ab5cce09d7f2469e | Witt and difference algebra; no overlap. |
| ErdosProgressionPowers | 72b615703f7fc5d175e519ddbb6e589d3d744c6c | Progression and character-sum arithmetic; Bessel's inequality is unrelated. |
| ArithmeticDynamics | 85e78c07dcc361ead6505c970a1181deee483819 | Dynamical heights, measures and orbit arithmetic; no overlap. |

Both README and Suggested.lean were inspected at each head. The large ArithmeticDynamics README was read from its exact Git object. The earlier supplier sections were also inspected, including the ReductiveGroupsPartII head 0d37c3f452ad9769ad7bfc257b5f283091814d85.

No entire accepted target is duplicated elsewhere, so no entire target was deleted. The following generic objects or construction requests were excluded from local ownership or deleted from the opening needs sentences, and are cited under Scope and ownership and the exact supplier contracts:

| Generic object excluded here | Exact owner consumed | Relative work retained |
| --- | --- | --- |
| General sesquilinear nondegeneracy | LinearMap.Nondegenerate, Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean | Nondegenerate relevant complements with the specified odd split form. |
| Generic orthogonal submodule | Submodule.orthogonalBilin and Submodule.mem_orthogonalBilin, Mathlib/LinearAlgebra/SesquilinearForm/Orthogonal.lean | Relevance and frame transport. |
| Tensor representation and equivariant-map structure | Representation.tprod and Representation.tprod_apply, Mathlib/RepresentationTheory/Basic.lean; Representation.IntertwiningMap, ext and isIntertwining, Mathlib/RepresentationTheory/Intertwining.lean | The Bessel tensor/character specialization and its evaluation equation. |
| Identity-form unitary group | Matrix.unitaryGroup, Mathlib/LinearAlgebra/UnitaryGroup.lean | Arbitrary-form comparison stays with the Hermitian supplier; identity-form compatibility is a Check. |
| Group-valued Hopf points | TauCeti.HopfAlgebra.pointsFunctor, TauCeti/Algebra/AlgebraicGroup/PointsFunctor.lean | Relative subgroup representability through ReductiveGroups Layers 0, 3, 5 and 7. |
| Generic restricted products and rational diagonals | Completed RestrictedProducts Layers 0–3; GlobalNumberFields Layers 4–6 and 8 | Adelic Bessel character and quotient period. |
| Unit membership and finite cardinal arithmetic | Prod.isUnit_iff, Mathlib/Algebra/Group/Prod.lean; Nat.card_fun and Nat.card_sum, Mathlib/SetTheory/Cardinal/Finite.lean | The split frame and full constituent-sign specializations, with concrete controls. |
| Complex inner-product algebra | Mathlib/Analysis/InnerProductSpace/Basic.lean | The swapped-slot period-pairing convention. |
| Smooth category, smooth dual, induction and Jacquet construction | SmoothRepresentationsOfLocalGroups SR.0.1–SR.0.4 and SR.2.1–SR.2.3 | Restriction/twist comparisons, relative Hom reduction and multiplicity. |
| Generic geometric lemma and principal-series filtration | SmoothRepresentationsOfLocalGroups SR.2.2, geometric-lemma and principal-series-jacquet | The dimension-six negative control and exact unitary/Whittaker supplement. |
| Cuspidal support, Bernstein blocks, Satake and derivatives | SmoothRepresentationsOfLocalGroups SR.3.1–SR.3.3, SR.4.1–SR.4.2 and SR.5 | Auxiliary-support avoidance, supercuspidal restriction and relative spherical calculation. |
| Real globalization and generic adelic module constructions | AutomorphicFormsOnReductiveGroups §§0.1–0.5, 2.3, 2.7, 3.4–3.5 and 4.2 | Completed tensor comparisons, JSZ estimates, Bessel periods and period continuity. |
| Generic spectral analysis and ordinary trace kernels | AutomorphicSpectralTheory Layers 0–4 and §§6.3–6.6, 6.12–6.16 | Relative characters, star-generic contribution and isolated relative comparison. |
| Ordinary transfer and enhanced classification | EndoscopicTransferAndUnitaryTraceComparison Layers 2–5, §§11.2–11.4; ModularityAndLanglandsExtensions §§3.13, 3.15, 3.20, 5.1 and 5.4 | Actual Bessel character calculation, relative Fourier identity and uniqueness. |
| Oscillator and small-theta carriers | MetaplecticAutomorphicForms §0.18 and §§3.3–3.6 | Real Bessel seesaw and its exact enhanced-signature supplement. |
| Adelic points, quotient measures and generic Tamagawa construction | AdelicAlgebraicGroups §§0.1–0.3, 1.1–1.5 and 2.2–2.5 | Exact BPCZ convergence-factor comparison, local-volume product and relative period. |
| General Fourier, Rankin–Selberg and leading-term theory | AutomorphicLFunctionsAndLocalFactors AL.0–AL.5 | Signed-Asai comparisons, exact local regularity and Whittaker/norm supplements, and the relative normalizer quotient. |

These are all duplication exclusions/removals. None removes a catalogue Check or API specialization. The six real-bodied definitions differ from their generic inputs exactly as described in Scope and ownership and their layer paragraphs.

## Source audit

All sixteen cited active works have legally cached certified texts. The seventeenth manifest entry, xue-bessel, remains a settled unused waiver; no theorem is inferred from it and no missing-reference request is created. Read the cited statement and normalization passages in every active work. The manifest retains the service's provenance fields and updates the usage and locator fields for the small native-carrier interfaces and Lemma 11.3.1. No source text was copied into a deliverable.

Additional decisive passages include the split basis requirement at ggp line 1567–1569; character coordinates at ggp line 1624–1639; unnormalized induction and the excluded Bernstein blocks at ggp line 2152–2163; the mirabolic calculation at ggp line 2217–2227; finite-dimensional-space-dependent archimedean injection at jsz-bessel line 260–283; seminorm decay at jsz-bessel line 652–656; local regularity and the all-place formula at bpcz line 148–193; the signed mirabolic and norm residues at bpcz line 4132–4154; exact spectral coefficient at bpcz line 3070–3072 and bpcz line 4245–4254; and the inverse-order coefficient and local comparison at bpcz line 4935–4946. The apparent sign typo in the last source sentence is not adopted: S has order 2^r, while its coefficient is 2^(-r).

## Adversarial mathematics pass

Each row covers the statement, its named API, its hypotheses and its Checks. “Retained” means the listed controls support the precise claim with its stated supplier obligations; it does not claim a completed mathematical formalization.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| §1.1 relevant pair, frame and API | W=0; ranks 1 and 3; positive definite versus signatures (2,1)/(1,2); split idempotent | Rank is n+2r+1; split frame requires a generator; base change and transport respect the complement | Retained unit-norm/basis condition and both line signs. |
| §1.2 datum, embedding and character API | Empty flag; two simple roots; split rank-three upper unipotents; identity/product | Cross terms disappear under b; (x,−y) keeps both split roots; r=0 is diagonal | Made ψ:E→S¹ explicit. |
| §1.3 transport API | Identity/composite isometries; h and −h; changed additive character | Groups agree after form scaling; characters require transport | Retained conjugacy rather than literal frozen-character equality. |
| §2.1 model, currying and dimension API | Trivial group; U(1) inverse/equal weights; ν≠1; completed tensors | Bilinear models use the smaller smooth dual; cardinal dimension precedes finrank | Added exact native algebraic specialization; analytic category retained. |
| §2.2 distribution symmetry and anti-involution API | Rank-one norm-one z; split GL₂ unipotent; two noncommuting matrices | c₀g⁻¹c₀ is identity in rank one; transpose reverses products | Retained field-dependent descent contract. |
| §2.3 adjacent multiplicity | U(0)⊂U(1); ramified Q₂; split GL₂(R) | Bound includes all three; does not require compactness | Retained. |
| §2.4 nonarchimedean reduction and API | r=1; W hyperbolic; forbidden block; non-supercuspidal endpoints; diagonal(a,1) | Y has rank r+1 but need not be maximal; induction is unnormalized | Corrected inertial-class versus unramified-twist explanation. |
| §2.5 archimedean injection and API | Two-dimensional S; r=1; both line signs; a pole or reducible parameter | A common right half-plane exists for each finite S; parameter depends on S | Retained finite-S formulation. |
| §2.6 all odd-codimension multiplicity | W=0; real opposite signs; compact U(2) weight mismatch | Uniqueness allows multiplicity zero; no existence follows | Retained. |
| §2.7 adjacent integral | Compact inverse weights; split noncompact H; trivial non-tempered GL₂ | Compact integral is Haar mass; trivial noncompact integral diverges | Retained unitary tempered hypotheses and all log powers. |
| §3.1 epsilon character and API | Empty parameter; χ₁⊕χ₋₁; two copies of χ₁ | Generator uses one copy; central value uses multiplicity parity | Added native central-element calculation with the correct §4 locator. |
| §3.2 enhancement transport | Dimensions (2,1); norm/nonnorm t; real t=−1 | Even-side sign changes by −1; odd-side sign stays fixed | Retained simultaneous model and label transport. |
| §3.3 tempered form and API | H=1 of mass a; compact weight k=0/nonzero; r>0 | Form gives aB or weight projection; higher-rank integral needs regularization | Corrected both theorem-line anchors. |
| §3.4 geometric multiplicity and API | x=1; W=ℂ,x=−1; θ=0; compact U(2)×U(1) | Moving determinant is 1 or 4; empty regular-nilpotent set gives coefficient 0 | Corrected induction lemma anchor; retained full nonreductive H discriminant. |
| §3.5 local trace formula | W=0; real indefinite groups; normalized induced quasi-character | Whittaker germ survives; raw compact-group trace is insufficient; induction coefficient agrees | Anchored the three actual theorem statements. |
| §3.6 packet Fourier identity | με=−1/+1; identity component; order-two Fourier transform | Total distinguished count is 0/1 and the selected enhancement is detected | Retained central restrictions and actual-classification premise. |
| §3.7 finite-place packet theorem | W=0; dyadic ramification; same parameter with another enhancement | Exactly one distinguished class across the relevant forms | Retained. |
| §3.8 real theta reduction | a+b=1; (a,b)=(2,1); paired non-self-dual summands; big lift | Induction measure drops by two; small lift suffices | Retained integrated seesaw and no big-lift irreducibility premise. |
| §3.9 real packet theorem | Compact U(2) standard and U(1) weights ±1; negative line; U(0)⊂U(1) | Dual interlacing and both line signs agree with transported enhancements | Retained. |
| §3.10 split prediction and API | GL₁×GL₀; GL₂×GL₁; regular GL₃ principal series | Generic character gives dimension 1; trivial character gives dimension 6 | Preserved conjectural higher-codimension archimedean boundary. |
| §3.11 certified split nonvanishing | Adjacent real/complex; finite GL₄×GL₁; real higher-gap unipotent | Exactly the finite-place or adjacent ranges are theorems | Retained explicit real (x,−y) character without asserting existence there. |
| §4.1 period and API | r=0; ν(h)=i; character nontrivial on H(F) | Inverse-character integrand transforms by ν; nonrational character does not descend | Retained unimodularity, convergence and continuity as named targets. |
| §4.2 local obstruction/factorization | One zero local Hom; two local values 2,3; reference scalar a | Period vanishes or scales by 6; local reference functional rescales reciprocally | Retained nonzero reference premise and pure-tensor density. |
| §4.3 tensor L-representation and API | b=0; ranks (2,1); split place | Dimensions 0 and 4; induction has two summands; split central factor is a modulus square | Retained finite-Galois index-two induction before Weil inflation. |
| §4.4 global conjecture and API | W=0; all local Hom nonzero but central value zero; prescribed inner form | L-factor 1 for zero tensor; central nonvanishing still required | Kept as a proposition, with fixed pair and cuspidal multiplicity one. |
| §5.1 normalizer and API | n=1; split η_v=1; central global zero; all-place tempered factors | Δ₂=L(1,η)L(2,1); local C≠0 while global C may vanish | Retained nonzero denominator proofs and completed factors. |
| §5.1a split Whittaker identity and API | n=1; dyadic/real/complex; positive Haar and pairing scales a,b | Raw integral is ab·λ(W)conjugate(λ(W′)); no hidden zeta factor | Retained Zhang's differential measures at zhang-period line 1437–1440. |
| §5.2 normalized form and API | x=0; cx; matching pure-tensor values; discontinuous functional on completion | q excludes zero; continuity is essential to tensor density | Kept jointly continuous extensionality and separate nonzero-form assertion. |
| §5.3 spherical theorem | Haar volumes 1 and 2; ramified Steinberg; split and nonsplit Q₂ | Nonspherical data have no value prescribed; split C=3 and nonsplit C=1 | Retained owned dyadic extension and trace-one coordinate proof. |
| §5.4 rescaling | Pairing factor 2; two Haar factors 2,1/2; global Haar factor 2 | Local pairings cancel; product-one Haar changes cancel; squared period changes by 4 globally | Retained fixed global Tamagawa normalization. |
| §5.5 all-place product and API | All spherical; one zero factor; moving a volume-2 place into S | Product is a finite modification of the nonzero volume tail and may be zero | Retained no central Euler-product definition. |
| §6.1 Whittaker periods and API | Degrees 1,2; zero vector; central zero; several constituents | Asai signs +,−; λ may vanish while β is nonzero; residues have constituent pole orders | Retained exact leading coefficients and induced norm comparison. |
| §6.2 relative character and API | One-dimensional space; zero period; rescaled orthogonal basis; hyperspecial projector | Basis norm cancels; J vanishes exactly with P; local trace is Cα on rank one | Retained explicit dg, dt and summable smoothing expansion. |
| §6.3 star-generic contribution | Counts (1,1),(2,1); irrelevant or repeated constituents | Coefficients 1/4,1/8; irrelevant contribution zero; repetition outside hypotheses | Added full-sign-group native cardinal/coefficient milestones. |
| §6.4 isolated comparison and API | No auxiliary supercuspidal place; zero other-form transfer; three constituents; larger S | Sum retains all actual cuspidal realizations; coefficient is 1/8 | Retained transfer/support/convergence factors and dense archimedean detection. |
| §6.5 Euler identity | Missing local model; nontrivial local κ; endoscopic count three | Both sides can be zero without division; product κ=1; coefficient 1/8 | Retained raw local characters and opposite-Asai denominator comparison. |
| §7.1 global adjacent nonvanishing | n=1; several constituents; a different prescribed h | Inner form is existential; no tempered or auxiliary-place assumption | Retained. |
| §7.2 stable corollary | Counts (1,1); bad/infinite places; n=1 boundary | Stable source assumes n>1; n=1 belongs to §7.1 | Retained separate hypotheses. |
| §7.3 refined proposition and API | Counts (1,1),(2,1); zero vector; mixed vectors with zero cross pairing | Inverse orders 1/4,1/8; quotient excludes zero; polarization clears denominators | Retained product-compatible pairings and no assumed truth. |
| §7.4 GGP.8 and API | Vector/pairing scaling; product-one Haar scaling; counts (2,1); central zero | All factors remain defined and period square is zero when central value is zero | Retained completed all-place identity, positive vector norms and no circular premise. |
| splitLineFrame and norm criterion | Arbitrary field; (1,1),(1,0),0; characteristic two field | Product unit iff both coordinates nonzero; line norm is their product | Helper intentionally works over every field; Hermitian ambient theory still assumes characteristic ≠2. |
| linearFirstPairing | (i,1),(1,i); cx,cy; zero vector/module | Values i,−i; first slot linear and second conjugate-linear | Real-bodied slot swap; no completeness binder needed. |
| algebraicBesselModel and covariance | Arbitrary group and modules; scalar character; target minus identity | Native tensor intertwiner gives ν covariance and annihilates a fixed tensor with incompatible target | Explicit binders retained; no admissibility or finite-dimensionality silently inferred. |
| componentCentralElement and character evaluation | Empty index; singleton multiplicity 2; two multiplicity-one indices | Central element records multiplicity mod two, not generator count | Finite character formula keeps Fintype and decidable equality explicitly. |
| unitaryConstituentSigns and order | Counts (0,0),(1,1),(2,1) | Group orders 1,4,8 | No diagonal quotient; both finite-type hypotheses retained. |
| unitaryConstituentCoefficient and formula | Same counts; denominator nonzero | Coefficients 1,1/4,1/8 | Finite assumptions retained; no global endpoint asserted for empty pair. |

The following conventions and requested supplier identities were also checked, independently of Lean elaboration.

| Convention or contract | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Algebraic fields, rank and forms | Zero rank; split E; characteristic 2; inseparable quadratic field | Constant split rank is E-rank; characteristic 2 and inseparable quadratic algebras are outside ambient hypotheses | Retained. |
| Hyperbolic and line conventions | Basis e,f; positive definite 2-space; positive/negative line | Self-pairings 0 and cross-pairing 1 distinguish H | Retained explicit witness. |
| Local analytic categories | Finite Q₂; R,C; noncompact group | Smooth/admissible versus continuous Casselman–Wallach functionals remain separate | Retained. |
| Covariance and duals | Weights 1,−1 versus 1,1; ν(h)=i | Bilinear smaller factor is dualized; period transforms by i | Added character-line native example. |
| Induction convention | Upper GL₂ B and diagonal(a,1) | δ=|a|, normalized induction inserts its positive half power | Retained unnormalized auxiliary induction. |
| Parameter/Asai parity | Degrees 1 and 2; multiplicity two | Degree-one pole sign +, adjoint sign −; repeated multiplicity changes central element only | Retained. |
| Frobenius direction | Two eigenvalues a,b and their inverses | Geometric Frobenius has norm q⁻¹; inversion changes both eigenvalues | Retained explicit two-term local-factor witness. |
| Measures, universes and denominators | Empty determinant; zero vector; local scale 2; global scale 2; zero central value | Empty determinant 1; norms positive only on nonzero vectors; local C inverted only after regularity | Retained all explicit conditions. |
| hermitian-unitary | Split rank one; rank zero; both real signatures | General arbitrary-form group cannot be replaced by identity-Gram matrices | Exact gap retained. |
| local-categories | Closed relative subgroup; character twist; dyadic F | Generic category is imported; restriction/tensor–Hom comparison is the supplement | Narrowed request. |
| local-bernstein | Same inertial class under unramified twist; arbitrary μ | Support avoidance must precede twisting | Corrected as described above. |
| local-mirabolic | k=1,2; split product; p=2 | Generic supercuspidal restriction is distinct from constructing derivative functors | Gap retained on SR.5 carriers. |
| gl-tempered-genericity | GL₁; unitary tempered principal series; real/complex GL | Every-place genericity is needed; genericity is not imposed on arbitrary unitary representations | Retained. |
| local-jacquet-filtration | k=1,3; distinct unitary characters; ordinary/nondegenerate character | Dimensions 1 and 6 contrast with Whittaker dimension 1 | Generic filtration imported; combined consequence retained as supplement. |
| local-spherical | q=2; equal Satake eigenvalues; ramified nonspherical data | Continuous specialization required; no hyperspecial vector means no spherical evaluation | Retained actual volumes. |
| archimedean-globalization | Zero module; two factors; pure-tensor density | Algebraic dual alone is insufficient | Generic globalization imported; completed-tensor comparison retained. |
| archimedean-generic-induction | One/two complex parameters; poles/reducible parameters | Null exceptional set permits a generic parameter in each right half-plane | Retained exact unnormalized JSZ family. |
| archimedean-seminorms | Positive dilation; fixed finite basis; arbitrary N | Decay exponent/seminorm may depend on N, not dilation or vector | Retained quantified bounds. |
| distribution-gk | Odd-dimensional finite-place quadratic space; real adapted distributions; diagonal product | Real homogeneity is an existence statement in a stable subspace, not a law for every distribution | Retained field-dependent criterion. |
| local-schwartz-germs | Empty regular-nilpotent set; compact inner form | Coefficient is zero without division by cardinality zero | Retained. |
| local-tempered-bounds | Noncompact H; arbitrary smooth compact types | Coefficient bound alone does not assert the relative integral | Relative integrability stays §2.7. |
| local-plancherel | Induced tempered modules; noncompact real group | Actual spectral measure and topology are needed | Relative trace identity stays §3.5. |
| local-fourier-extension | Finite stabilizer stage versus real derivatives | Continuous Fourier extension does not imply raw cutoff stabilization for every weak-Schwartz test | Retained precise weighted hypothesis. |
| enhanced-packets | Same parameter/different enhancement; both real signs; central multiplicity parity | An arbitrary packet bijection or conditional classification cannot replace actual normalized LLC | Retained full theorem gap and existing classification premises. |
| ordinary-endoscopy | Nonsplit inner form; geometric versus packet identity | Geometric transfer and classification remain distinct inputs | Retained exact supplement. |
| real-oscillator-model | Equal/adjacent ranks; positive dilation λ | Overlap factor is min(1,λ⁻¹) in each coordinate | Retained real mixed-model gap. |
| real-small-theta | Equal rank; character present/absent; repeated character; paired summand | One versus two target signatures and multiplicity-sensitive ordering retained | No big-lift irreducibility is requested. |
| adelic-measures | Two opposite local scales; rational volume-form scaling | Global product formula fixes measure; convergence factors cannot be omitted | Generic construction imported; BPCZ comparison retained. |
| automorphic-realization | Pure tensor versus completion; zero cusp vector | Continuity and density are required to obtain a nonzero reference tensor | Narrowed to completed smooth comparisons. |
| global-parameters | One/many distinct constituents; weak/strong base change | Full sign group counts distinct constituents in both degrees | Retained actual global classification gap. |
| factor-epsilon-identities | Zero parameter; ψ scaled by norm/nonnorm; degrees 1,2 | Zero tensor epsilon 1; central epsilon scaling and signed adjoint comparison agree | Retained geometric-Frobenius normalization. |
| tempered-local-regularity | Split, ramified and dyadic places; archimedean gamma factors | Individual factors at specified arguments are regular and nonzero | C is constructed only in §5.1. |
| hermitian-global-values | Central zero; degree zero tensor; distinct endoscopic constituents | Central value may vanish; opposite-Asai denominator does not | No central value inverted. |
| local-rankin-selberg | s=0; unitary tempered data; spherical q=2 | Central integral converges; normalized continuation supplies nonzero test | Retained quotient Haar volume. |
| whittaker-pairing-fourier | k=1; regular character; spherical vector | Positive norm uses unnormalized differential Haar; Fourier δ exponent is −1 | Retained exact measures. |
| global-mirabolic-norms | One/two constituents; larger S; mixed vectors | Pole order equals constituent count; normalized norm is positive | Retained residues rather than divergent L(1) values. |
| local-smoothing-trace | Fixed finite-place level; real nuclear expansion | Every smooth seminorm pair must be absolutely summable | Relative H-integrability remains §6.2. |
| automorphic-spectrum | Irrelevant cuspidal datum; Eisenstein continuation | Canonical relative periods and actual kernels are required | Generic spectral theory imported; relative supplement retained. |
| spectral-isolation | No supercuspidal place; prescribed base-change class | Compact-support multipliers alone do not supply Schwartz isolation preserving transfer | Part II supplier/preceding placement retained. |
| relative-geometric-comparison | Matching families on several forms; larger S | Equality precedes spectral isolation | Retained separate geometric gap. |
| relative-finite-transfer | Ramified Q₂; one designated inner form | Both transfer directions and vanishing unmatched components required | Retained. |
| relative-archimedean-transfer | Dense transfer subspaces; arbitrary Schwartz test | Density plus continuity suffices; full surjectivity is not claimed | Retained. |
| relative-fundamental-lemma | Unramified q=2; split algebra; ramified datum | Unit fundamental lemma includes small residue characteristic; ramified transfer is separate | Retained no nonsplit full-Hecke claim. |
| relative-character-comparison | Local κ≠1; rational global ψ,τ; split place | Constants transport with duals/measures; only their global product is 1 | Retained exact comparison and no assumed GGP.8. |

## Elaboration and consistency

The prescribed `lake env lean` elaboration of the absolute file corresponding to `packages/GanGrossPrasadUnitaryGroups/Suggested.lean` was run from the content checkout. Final exit status: 0. Exact warning count: **5**, all `declaration uses sorry`. Errors: 0. Other warnings or messages: none. The file imports only Mathlib, so no Tau Ceti object build was required. No process remains running.

The five admitted statements are splitLineFrame_iff_norm_ne_zero, algebraicBesselModel_equivariant, componentCentralElement_character, unitaryConstituentSigns_card and unitaryConstituentCoefficient_eq. Six definitions/abbreviations have real bodies. All twelve examples are proved; none calls an admitted signature. There is no admitted data, option override, placeholder condition or imported roadmap module.

A separate scratch elaboration appended `#check @name` for every admitted statement. The printed types retain the field and group/module structures, the finite index and decidable-equality hypotheses for the character sum, and both finite-type binders for the sign-group order and coefficient. There are no ambient section variables that silently disappear. The subsequent scalar-character example edit leaves all five theorem types unchanged.

Mechanical consistency checks found zero README code identifiers absent from Suggested.lean, zero Lean declarations absent from the README, zero missing catalogue target/API/Check labels, and exact matching of all 36 gap needs sentences. JSON and TOML parse. No machine path or LaTeX delimiter occurs in a deliverable. The only working-tree changes are the authorized deliverables and the permitted gaps-list edits.

## Dependency check

The prescribed dependency command was run with this roadmap name, the package README and the supplied merge order. Its output is:

```text
depcheck: 8 roadmaps, 57 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line for GanGrossPrasadUnitaryGroups. Earlier supplier roadmaps appear only in supplier contracts and Needs lines; later consumers appear only in ownership/consumer discussion. The gap continuations are not asserted to be completed imports.

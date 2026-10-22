# Repair findings and verification

The first three finding sections refer to review r1a; the next four refer to review r1b. IDs and severities retain each review's labels. The findings do not overlap: r1a-F01 concerns examples, while r1b-F01 concerns admitted theorem wrappers.

## F01 (P3) — applied

Review r1a. Existence-only scalar and fixed-tensor examples → two expanded proved examples. Evaluation at 1⊗1 identifies the scalar model with ℂ and gives finrank 1. Circle weights (1,−1) give another such equivalence; weights (1,1) give only zero functionals and finrank 0, using i. Both target-character covariance controls remain. README Checks describe these conclusions.

## F02 (P2) — applied

Review r1a. Arbitrary orthonormal bases → smooth K-bases assembled from finite-dimensional K-isotypic spaces; orthogonal bases are compatible rescalings with norm denominators. Added the period-domain hypothesis, nuclear convergence locator and non-smooth-basis negative control. Evidence: bpcz line 1167, line 1174, line 1185, line 4225 and line 4694. Added these precise locators to the existing bpcz manifest entry.

## F03 (P3) — applied

Review r1a. Staging-directory manifest reference → adjacent `[source manifest](sources.toml)` link in `packages/GanGrossPrasadUnitaryGroups/README.md`. The manifest and README remain adjacent when the folder moves to `TauCetiRoadmap/GanGrossPrasadUnitaryGroups`.

## F01 (P3) — applied differently

Review r1b. Four admitted wrappers → native supplier contracts for product units, intertwiner evaluation and finite cardinalities. Deleted all four Lean declarations and their README target names, retaining the definitions and examples. The binding duplication rule requires deletion rather than proved wrappers. A scratch elaboration verifies all four original signatures using the cited native proofs.

## F02 (P3) — applied

Review r1b. Nonexistent `TauCetiRoadmap.RestrictedProducts` folder heading → linked completed roadmap at `Completed/RestrictedProducts/README.md`. Its Layers 0–3 and declaration table supply the same reference families, maps, decompositions and diagonals. The dependency remains RestrictedProducts; no new supplier or theorem is assigned.

## F03 (P3) — applied

Review r1b. Lower-cased personal names → Bessel and Gan–Gross–Prasad in the title. This follows the proper-name convention in `TauCetiRoadmap/LocalGaloisGroups/README.md` and agrees with the package's prose and Lean docstrings.

## F04 (P3) — not actionable in this package: successor scope and ownership require a board decision

Review r1b. The present targets already exclude the remaining classical endpoints. Choosing a differently named successor instead of the stated Part II changes cross-roadmap ownership, which this package cannot establish. The proposed anonymous “later roadmap” supplies no named owner. The binding extension rule retains Part II naming; a human must decide any successor rename. No prerequisite gap arises.

## Mathematical verification

The table covers each numbered target together with its APIs and Checks, the six retained elementary definitions, the two carrier comparisons and the standing conventions. “Retained” means that the tested instances introduce no additional defect under the written hypotheses and declared supplier contracts; it does not certify the analytic proofs or discharge those contracts.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Algebraic conventions and relevance | Zero module; ranks 1 and 3; split idempotents; C/R signatures (3,0), (2,1), (1,2) | Characteristic ≠2 and quadratic étale coefficients exclude the zero ring and inseparable extension; relevance requires the odd split complement | Retained |
| Local categories and analytic conventions | Q₂, Q₃, R, C; split algebra; noncompact GL₂; zero tensor | Smooth versus continuous models remain distinguished; no compactness inferred | Retained |
| Pairing, character, induction and Frobenius conventions | B(i,1)=i, B(1,i)=−i; ν(h)=i; diag(a,1); two unramified eigenvalues | Slot swap, inverse period character, unnormalized-induction comparison and inverse-Frobenius comparison have the stated directions | Retained |
| Component and measure conventions | Multiplicity 2; counts (1,1), (2,1); Haar scalars 2, 1/2; vector scalar c | Central multiplicity reduces modulo 2; coefficients 1/4, 1/8; global squared period scales by 4 under Haar factor 2 | Retained |
| §1.1 RelevantHermitianPair and frame API | W=0; complement H⊕L; definite and indefinite rank 3; identity and composite transports | Rank difference 2r+1 and basis-vector requirement survive all tests | Retained |
| §1.1 hermitianFieldCarrierEquiv and adjoints | C-line at (i,1)/(1,i); zero space; quadratic Q₂-line; scalar a and c(a) | Double slot swap is identity; adjoint remains conjugate scalar, without inverse | Retained |
| §1.1 hermitianSplitCarrierEquiv | A=0 and A=F; cross-pairings; action (2,1/2); simultaneous scaling by 2 | Cross-pairings exchange coordinates; dual action preserves the form; simultaneous scaling multiplies pairing by 4 | Retained |
| §1.1 splitLineFrame | (1,1), (1,0) over any field, hence also F₂; (2,1) and (2,1/2) over Q | Unit means both coordinates nonzero; frame norm need not be 1 | Native criterion replaces duplicate target |
| §1.2 besselDatum and character API | Empty flag; two simple coordinates; split GL₃ with b=(x,−y) | r=0 gives diagonal H and ν=1; split character retains both simple coordinates | Retained |
| §1.3 besselTransport | Identity/composition; simultaneous form negation; changed line frame and additive character | Conjugacy and transported characters are required; negation exchanges real line signs | Retained |
| §2.1 besselModel and multiplicity | Trivial H; inverse and equal U(1) weights; smooth dual versus full dual | Trivial scalar model has dimension 1; inverse weights dimension 1; equal weights dimension 0 | Completed the Lean mirrors |
| §2.1 linearFirstPairing | Scalar i in either slot; arbitrary c; zero vector and zero space | Linear first, conjugate-linear second, zero in either zero slot | Retained proved examples |
| §2.1 algebraicBesselModel | Any scalar target ν with matching first factor; translated 1⊗1; fixed tensor and target −id | Evaluation is an equivalence with ℂ; ν-covariance remains distinct from inverse covariance; negative target kills a fixed tensor | Expanded exactly two examples; native evaluation replaces duplicate target |
| §2.2 adjacent distribution symmetry | Rank-one norm-one torus; upper/lower GL₂ unipotents; product reversal | c₀g⁻¹c₀ fixes the rank-one torus; inversion alone fails | Retained |
| §2.3 adjacent multiplicity | U(0)⊂U(1); ramified Q₂; split GL₂(R); non-tempered irreducibles | Bound ≤1 needs the stated irreducibility/categories, not temperedness | Retained |
| §2.4 finite-place reduction | r=1; isotropic W; excluded Bernstein block present or absent; upper-Borel modulus | Y has rank r+1, not necessarily maximal; exclusion uses π_V dual and induction is unnormalized | Retained |
| §2.5 archimedean injection | r=1; both complement signs; finite-dimensional S; exceptional s | One common half-plane is chosen for S; no injection at every s or uniform parameter for the whole Hom space | Retained |
| §2.6 odd-codimension uniqueness | W=0; U(2) standard paired with weight 1; hypothetical two-dimensional S | Whittaker bound holds; compact example has multiplicity 0; a two-dimensional S contradicts adjacent uniqueness | Retained |
| §2.7 adjacent tempered integrability | Compact U(1); noncompact split pair; trivial GL₂×GL₁ representations | Tempered estimate permits noncompact integration; non-tempered constant coefficient diverges | Retained |
| §3.1 epsilon character and central restriction | Empty smaller parameter; χ₁⊕χ₋₁ against 1; repeated χ₁ | Empty epsilon is 1; duality product is −1; generator counts one copy, central element counts parity | Retained |
| §3.1 componentCentralElement and character formula | Empty index; multiplicity 2; two singleton generators with sum character | Coordinates are multiplicities modulo 2; χ(Σ dᵢeᵢ)=Σ dᵢχ(eᵢ) by additivity; all finiteness binders explicit | Retained theorem target and proved examples |
| §3.2 enhancement transport | Norm and nonnorm t; real t=−1; two successive changes | Determinant twist changes the even-side generator as stated; two changes cancel | Retained |
| §3.3 temperedBesselForm | H=1 of mass a; matching/mismatching compact weights; r>0; reducible tempered induction | Raw adjacent integral gives mass a or zero; higher codimension uses regularization; induction concerns full representation | Retained |
| §3.4 geometric multiplicity and discriminants | x=1; x=−1 on C; zero quasi-character; compact U(2) centralizer; proper Levi | Empty determinant is 1; moving norm determinant at −1 is 4; empty regular-orbit set gives coefficient 0 without division | Retained |
| §3.5 local trace formula | W=0; indefinite real group; proper-Levi induction; Lie algebra | Nonsplit tempered scope and regularization are retained; induction uses the germ factor | Retained |
| §3.6 packet Fourier identity | με=−1 and +1; identity component; Z/2 Fourier values (1,−1) | Prefactor is 0 or 1; Fourier inversion selects the nontrivial enhancement in the two-term test | Retained |
| §3.7 finite-place packet selection | W=0; ramified Q₂/Q₃; wrong enhancement | No second inner form is invented for the zero space; other enhancements have multiplicity 0 | Retained |
| §3.8 real theta reduction and both seesaws | Counts (2,1)→(1,1)→(1,0); base a+b=1 with paired summands; zero companion lift; compact vanishing pair | Lower measure drops by 2; zero-lift branches remain; no universal nonvanishing or equal-rank endpoint is assumed | Retained |
| §3.8 realSeesawForm | U(0); an occurring oscillator weight k; weight k+1; i in either slot | Values 1 and 0 distinguish invariance; conjugate oscillator and linear-first convention give i and −i | Retained |
| §3.9 real packet theorem | Compact interlacing; opposite line sign; W=0,r=0; higher odd codimension | Compact negative control has multiplicity 0; label transport accompanies form negation; higher reduction uses full induction | Retained |
| §3.10 split prediction | GL₁×GL₀; GL₂×GL₁; non-tempered trivial GL₂; regular GL₃ with generic or trivial N-character | Generic dimension 1 differs from ordinary Jacquet dimension 6; real higher codimension remains a proposition | Retained |
| §3.11 split generic theorem | All finite places and all r; archimedean r=0; real GL₄×GL₁ at r=1 | The proved range matches ggp line 2398; higher real model retains both character coordinates without a theorem claim | Retained |
| §4.1 globalBesselPeriod | r=0; rational elements; ν(h)=i; right translation; noncompact quotient | P transforms by ν; nonrational character does not descend; convergence is on smooth cusp vectors | Retained |
| §4.2 local obstruction and factorization | One zero local model; reference tensor; two local changes; reference scalar a | Nonzero global period implies local models; finite factorization divides only by nonzero reference period | Retained |
| §4.3 tensor L-representation | b=0; ranks (2,1); split place; connected-dual restriction | Dimension is 2ab, hence 4 in the rank test; index two is in the finite-Galois L-group | Retained |
| §4.4 fixed-pair conjecture | W=0; all local models with zero central value; fixed versus existential form | Zero-rank tensor L-function is 1; local existence alone is insufficient; proposition concerns the specified pair | Retained |
| §5.1 local/global normalizers | Split, ramified, dyadic, infinite places; degree 1 Asai signs; zero global central value | Local C is nonzero; global C may be zero; adjoint denominator has its separate nonvanishing contract | Retained |
| §5.1a split Whittaker identity | n=1; opposite generic characters; Haar/pairing scales a,b; λ=0 | Raw identity scales by ab; some diagonal value is positive, not every vector value | Retained |
| §5.2 normalized local period | Zero vector; compact matching/mismatching weights; nonzero vector scalar; dense tensor image and discontinuous counterexample | α is defined on zero, q only off zero; continuity is essential to extend equality from pure tensors | Retained |
| §5.3 spherical identity | Haar scale 2; nonspherical Steinberg; split Q₂ eigenvalues 1,−1; nonsplit unramified Q₂ rank one | Split C=3 and raw integral 3; compact nonsplit C=1 and raw integral 1; normalized ratios are 1 in both unit-volume examples; residue size 1 is excluded | Retained all-residue target, with Harris only an odd-residue intermediate |
| §5.4 rescaling | Pairing scale 2; local Haar scales 2,1/2; global Haar scale 2; nonzero vector scalar c | Local pairing cancels; product-one Haar changes cancel; global squared period scales by 4 | Retained |
| §5.5 all-place product | Enlarged S; one zero local factor; nonunit spherical volumes; product-one rescaling | Finite modification of nonzero volume tail permits zero factors and never inverts a central Euler product | Retained |
| §6.1 Whittaker relative periods | Endoscopic constituent count; order-r leading coefficients; λ=0; enlarged S | Leading terms replace divergent values at 1; central numerator may vanish | Retained |
| §6.2 global and local relative characters | Rank-one smoothing; zero P; basis scalar c; normalized compact-open projector; nonsmooth Hilbert basis | Term rescaling cancels; local trace uses the supplied smooth tensor expansion; nonsmooth vectors have no defined P | Restricted global bases and added boundary Check |
| §6.3 star-generic contribution | Relevant/nonrelevant data; total counts 2 and 3; full split centre | Coefficients 1/4 and 1/8; no diagonal-sign quotient and no removal of a_G | Retained |
| §6.3 unitaryConstituentSigns and coefficient | Counts (1,1), (2,1), (0,0); finite reindexing | Orders 4,8,1 and coefficients 1/4,1/8,1; finite group order is positive | Native cardinal identities replace duplicate targets |
| §6.4 isolated comparison | Prescribed inner form; several actual realizations; enlarged S; dense infinite-place transfer | Sum includes every realization with that base change; only inert unit tests and split spherical tests are used away from S | Retained |
| §6.5 relative-character Euler identity | Zero local model; nontrivial κ_v with product 1; counts (2,1); partial measures | Vanishing branch avoids division; coefficient is inverse full sign-group order | Retained |
| §7.1 adjacent global existence | n=1; endoscopic and non-tempered Hermitian data; varying inner form | Existence theorem is existential in h, without supercuspidal-place or temperedness restriction | Retained |
| §7.2 stable specialization | One constituent per degree; n>1; no split supercuspidal place | Specialization has total count 2; n=1 comes separately from §7.1 | Retained |
| §7.3 refined proposition and polarization | Counts (1,1), (2,1); zero central value; zero vector; mixed vectors | Coefficients 1/4,1/8; only vector norm quotients exclude zero; polarization clears denominators and uses product-compatible pairings | Retained |
| §7.4 GGP.8 and export APIs | Zero local/global factor; counts (2,1); vector, pairing and Haar rescaling; bad/infinite places | Completed Tamagawa identity uses coefficient 1/8, convergent all-place product and no inverted central value | Retained |

The source checks preserve the distinctions between definitions, conditional classification inputs, propositions and theorem endpoints. In particular: ggp line 2051 and line 2060 fix tensor/dual conventions; agrs line 59 and sun-zhu line 66 give adjacent uniqueness; jsz-bessel line 277 makes the parameter depend on a finite-dimensional subspace; bp-unitary-tempered line 5003 and bp-arch line 10551 give the relative trace endpoints; bp-refined line 2869 retains classification premises through gap:enhanced-packets. The final global assertions match bpcz line 124, line 179 and line 4254. Harris's exclusion of even places at harris line 173 is not used as an all-residue theorem.

The legal extraction of xue-real has damaged conjugation bars and exponents in some displays. This round changes none of those formulas and does not claim an independent typography certification. The conditional zero-lift branches and decreasing induction remain explicit. The xue-bessel waiver remains settled; no source request was made or renamed.

## Checks and maintainer consequences

- Final elaboration: ran `lake env lean` on `packages/GanGrossPrasadUnitaryGroups/Suggested.lean` from the content checkout. Exit status **0**. The only diagnostic was ``warning: declaration uses `sorry` `` at `packages/GanGrossPrasadUnitaryGroups/Suggested.lean:224:8` for `componentCentralElement_character`; there were no errors or linter warnings. No Tau Ceti import or targeted build was needed.
- Native-proof verification: a scratch copy of the original signatures, with the four direct Mathlib proofs, elaborated with exit status **0**, leaving only the expected central-element warning. Its `#check @componentCentralElement_character` displays explicit `I`, `Fintype I`, `DecidableEq I`, multiplicity and additive-character binders. There is no hidden section context.
- Dependency check: ran the prescribed `tauceti-roadmap gate --depcheck` command after the edits. Exit status **0**; exact output:

```text
depcheck: 8 roadmaps, 58 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

The four deleted names are `splitLineFrame_iff_norm_ne_zero`, `algebraicBesselModel_equivariant`, `unitaryConstituentSigns_card` and `unitaryConstituentCoefficient_eq`. Their replacements are respectively `Prod.isUnit_iff` with `isUnit_iff_ne_zero`; `Representation.IntertwiningMap.isIntertwining` with `Representation.tprod_apply`; and `Nat.card_fun` with `Nat.card_sum` for both cardinal identities. These declarations were checked in the pinned Mathlib files named in the supplier contracts. A read-only search of main's active/completed roadmaps and the seven specified open comparison roadmaps found no consumer of the deleted names. No endpoint name, including `GanGrossPrasadUnitaryGroups:GGP.8`, changed.

The file has 292 lines, six real-bodied definitions/abbreviations, one admitted theorem target and twelve proved examples, exactly two per definition. All seven retained named declarations appear in the README; all four deleted names leave it. Imports remain the single `import Mathlib`; there is no admitted data, admitted example or `set_option`.

The 36 existing supplier-gap slugs agree between README contracts and the plan. No gap, layer, merge-order placement or metadata changed. The source manifest still has 17 distinct keys; only the existing bpcz locators changed. RestrictedProducts remains the same completed supplier. Successor ownership from r1b-F04 requires a human decision and does not affect this package's prerequisite direction. No commit, push or external write was made; no Lean process remains running.

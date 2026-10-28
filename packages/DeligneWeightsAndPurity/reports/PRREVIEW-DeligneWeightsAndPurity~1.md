# Review of DeligneWeightsAndPurity (pull request #929 at 6c2402d)

**Verdict:** needs changes

## R01 (P2) — Fix the phase of the real-envelope twist

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:1837`: “use a rank-one Weil twist of weight `2β`”.

**Claim:** The proposed fixed-embedding real envelope is not determined by this weight condition. Weight fixes the absolute value of the twisting scalar, but its phase also matters. The reciprocal-normalized dual must have the conjugate eigenvalues, not merely eigenvalues of the same absolute value.

**Witness:** Take q=2, β=0, F=1 and twist scalar i. Its weight is 0, but the envelope has polynomial T²−(1+i)T+i, which is not real.

**Repair:** Specify the constant Weil line whose degree-one scalar c satisfies `ι(c)=q^β∈ℝ_{>0}`, extending coefficients when necessary; degree e then acts by c^e. Explain that `ι(c^e/α)=conj(ι(α))`. Retain the integer Tate normalization separately. Add the witness as a negative-control Check. With c=1 the witness becomes `(T−1)²`, with real coefficients. WII (1.2.14), p. 156, asserts the existence of a suitable real envelope; it does not make every twist of the right weight suitable (WII lines 781–794).

## R02 (P2) — Import the degree-refined Chebotarev theorem already supplied

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:1550`: “The degree refinement is a target `finiteCover_degreeChebotarev`”; also the supplier contract at line 442.

**Claim:** ArithmeticGaloisRepresentations §5.13 already supplies the constant-field congruences and the degree-by-degree asymptotic. The contract incorrectly restricts that supplier to Dirichlet/Frobenius density and schedules its stronger theorem again here. Summing its conjugacy-class formula over a conjugation-stable set gives this target, with an explicit error term stronger than the stated convergence.

**Witness:** `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:3537` gives zero outside the prescribed degree class and `(#B/#H_geom)q^n/n+O(q^(n/2)/n)` inside it, with error constant independent of n.

**Repair:** Delete the standalone finite-cover counting target and its proof route; cite §5.13's “Chebotarev for function fields” in scope, the supplier contract and §3.7. Keep the geometric-Frobenius inversion comparison and the genuinely additional uniform conditional-mass argument. On a constant C₂-cover the imported theorem gives proportion 1 in the permitted parity, 0 in the other, and density 1/2, exactly as required here. This repairs the duplicate without creating a reverse dependency.

## R03 (P2) — State the abelian-variety point-count headline at the pins

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurity/Suggested.lean:14` groups DWP.1 with headlines needing missing étale cohomology; `README.md:1209` promises the general abelian-variety point-count estimate.

**Claim:** The missing cohomology carriers prevent the spectral formulation, but not §1.5's numerical theorem. The pin has a native abelian-variety carrier, its dimension, and its scheme morphism. The file already defines the required finite-field point count. Omitting this deep numerical conclusion leaves a statable headline out of the acceptance test.

**Witness:** `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` supplies `AbelianVariety`; line 118 supplies `dim`. A scratch signature for the full §1.5 bound elaborated successfully with only `sorry` warnings.

**Repair:** Import `TauCeti.AlgebraicGeometry.AbelianVariety.Basic` and add the all-dimensions, all-positive-extension-degrees bound on `A.toOver.hom`, using the existing point-count definition and a binder `hg : A.dim = (g : WithBot ℕ∞)`. Use real exponents for g−1/2 and g−1, avoiding natural subtraction. Amend the docstring to distinguish this statable numerical theorem from the unavailable spectral formulations. The full tested signature is recorded below. For g=0 it gives 0≤0; for q=2, g=1, trace 1, m=2 it gives 4≤5.

## R04 (P3) — Remove the raw anchors rejected by the gate

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:99` and the remaining 247 raw-anchor lines.

**Claim:** The supplied gate fails its `residue` scanner on the HTML anchor lines. The theorem text need not change, but this folder cannot be accepted with that gate failure.

**Witness:** There are 248 lines beginning `<a id=`; the gate reports `residue=248` and `FAIL`, with all build, import, sorry-data and outside-folder counters zero.

**Repair:** Delete the raw anchors and repoint internal links to the corresponding Markdown heading fragments. Check the reference and supplier links as well as target links, then rerun the gate. The two dependency diagnostics are separately explained below as false positives under the brief's main-roadmap exception; do not reorder suppliers to address those diagnostics.

## R05 (P3) — Use the roadmap namespace and target-signature form

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurity/Suggested.lean:36` and line 105: `namespace TauCeti.Weights` and `namespace TauCeti.HardLefschetz`.

**Claim:** Acceptance-test declarations belong under `TauCetiRoadmap.DeligneWeightsAndPurity`, rather than the eventual library namespaces. The file also lacks the required layer comments for its multiple layers and uses “headline statements” rather than the required “target signatures” module title.

**Witness:** All nine elaborated declarations are under the two `TauCeti.*` namespaces; none is under `TauCetiRoadmap.DeligneWeightsAndPurity`.

**Repair:** Put the declarations under the roadmap namespace, retaining nested `Weights` and `HardLefschetz` if useful; update qualified references consistently. Use the required module title and README-order layer comments. Re-elaborate all nine signatures. This is a naming/form repair, not a request to add API lemmas.

## R06 (P3) — Remove undeclared API and Check identifiers

**Location:** `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:2286` onward, for example `compactWeilForm`, `compactWeilForm.degree`, and the named Checks at lines 2302–2317; also lines 3289–3292.

**Claim:** Numerous API bullets and Checks use proposed Lean identifiers that Suggested.lean does not declare. The introduction explicitly treats these as a future API catalogue, contrary to the acceptance-test naming rule. Adding these missing declarations would itself violate the restriction to headline theorems and their simple definitions.

**Witness:** Suggested.lean has nine declarations; it has no `compactWeilForm`, `dmStack_etaleCohomology_atlas`, or `compact_jordan_part`. The corresponding README bullets nevertheless name these as API or Check identifiers.

**Repair:** State these API facts and Checks in mathematical prose, removing proposed declaration labels. Keep names only for the actual acceptance-test declarations and exact imported declarations. For example, retain the Jordan calculation distinguishing degree-e Weil semisimple part from matrix semisimple part, but remove its proposed Check identifier. Do not expand Suggested.lean to match the catalogue.

## Verified sound

This is a read-only review of the specified head. No previous review was supplied. The worktree remained clean, its head matched the brief, and the diff outside this roadmap folder was empty. I read the normative README and CONTRIBUTING and compared the shape with AlgebraicCurves and the completed OrthogonalL2Bases and ProfiniteProPGroups roadmaps.

The numerical audit below has **150 rows**: all **136 numbered target subsections**, nine additional constructions, and the five Lean definitions. A row records a finite computation, a negative control, or a local algebraic fixture; it is not a proof of the general theorem. In particular, the openness, global descent and pencil arguments are also checked through the stated source/supplier contracts, not inferred from a small matrix example.

### Seeded source sample

All 15 requested targets were checked against legally fetched text. The README has no additional locator explicitly marked unverified. Printed pagination was used for WI/WII; the fetched Milne notes are version 2.00 (2008), as cited. All nine listed references were fetched; the additional SGA 1 citation in §5.15 was also fetched from its revised arXiv text. No source passages were copied into this report.

| Target | Text and locator opened | What the text supports |
| --- | --- | --- |
| 0.17 | WI lines 159–169, proof of (1.7)⇒(1.6), p. 277 | Distinct-weight factors are coprime. The general intertwiner statement is the stated linear-algebra consequence, using the pinned coprimality and Cayley–Hamilton results below; it is not a separately numbered WI theorem. |
| 2.1 | WI lines 408–416, (3.1), pp. 283–284 | Smooth open of P¹, rational-adic lisse coefficients, stalk weights and the curve-cohomology context. The definition continues onto p. 284. |
| 2.2 | WI lines 453–467, proof (3.7), p. 285 | Open symplectic image is Zariski dense, so its tensor invariants/coinvariants agree with those of Sp. The analytic-chart supplier supplies the general group argument. |
| 2.8 | WI lines 442–449, (3.6), p. 284 | Nonnegative factors give the stated direction for the closest pole: the product's closest pole is no farther away than a factor's. |
| 3.1 | WI lines 808–832, (6.1), pp. 294–295 | Arithmetic radical quotient and the pairing with the indicated Tate target; zero quotient remains allowed. |
| 3.5 | WI lines 916–934, (6.10)–(6.11), pp. 297–298 | Arithmetic image open in the multiplier group H; the a=−e conversion gives multiplier q^(de). |
| 5.17 | WII lines 2150–2251, (2.2.1)–(2.2.8), pp. 192–195 | Semisimple geometric identity component, finite coefficient model, dense continuous geometric image and finite geometric kernel in a mixed representation are retained. The group-relative Jordan decomposition is correctly distinguished from matrix Jordan decomposition. The weight-sign misprint is corrected. |
| 6.5 | WII lines 2438–2446 and 2598–2621, (3.2.3) and proof of (3.3.1), pp. 200, 204–205 | Pure parabolic H¹ and boundary weights at most β imply the compact-support bound β+i. Zero cohomology is allowed. |
| 8.7 | WII lines 4087–4115, (6.1.12)–(6.1.13), p. 246 | Mixed nearby cycles in the finite-field curve/spread-model trait setting. This is not an unrestricted mixed-characteristic weight–monodromy theorem. |
| 8.8 | WII lines 4131–4139, (6.2.3), p. 247 | Rf_! preserves upper complex-weight bounds; the README separately retains separated finite-type f. |
| 8.9 | WII lines 4143–4150, (6.2.5)(a),(b), p. 247 | Twist/shift normalization, smooth duality, and the lisse-cohomology criterion with weights w+i. |
| 8.17 | WII lines 2695–2699, (3.4.1)(i), p. 207 | Unique finite functorial decomposition by real weights modulo Z; no spurious normality hypothesis is added here. |
| 9.2 | WII lines 3091–3096, (4.1.4), p. 218 | An invariant nondegenerate pairing restricts nondegenerately to invariants in a completely reducible representation; the nontrivial constituents have no trivial quotient. |
| 9.6 | WII lines 3049–3055, (4.1.1), p. 217 | Smooth projective variety, ample class, invertible coefficient prime, and hard Lefschetz in the specified degrees. |
| 10.6 | WII lines 2852–2884, (3.5.4)–(3.5.7), pp. 211–212 | Nonconstant-j elliptic-family application and SU₂ monodromy. The roadmap corrects the source's density constant and point-count sign; see Source issues. |

Other decisive source checks: WII (1.2.12)–(1.2.14), p. 156, for R01; Int lines 10431–10488, XXI (5.2.1)–(5.2.2), pp. 385–387, for both integrality clauses; SGA1 lines 12615–12630, XIII (5.6), revised p. 318, for the simultaneous prime-to-p tame boundary group. I also inspected the rendered WII p. 212 to distinguish its printed Sato–Tate errors from extraction errors.

### Adversarial computations

“Pass” means that the displayed instance agrees with the statement and its conventions. Conditional/local fixtures are explicitly labelled. The field hypotheses exclude the zero ring; q>1 excludes q=1; positive extension degrees exclude r=0. Characteristic-two tests use rational-adic coefficients unless the arbitrary-field Lefschetz or modular-representation control explicitly says otherwise.

| Statement | Instances tried | Computed values on both sides | Result / change |
| --- | --- | --- | --- |
| 0.1 | q=2; roots of T²−T+2; 0; q=1 | Root norms √2=2^(1/2); norm(0)=0≠2^(n/2); q=1 fails 1<q | Pass |
| 0.2 | α=2, β=1/2; integral weight zero | Weights 2+(−2)=0; αβ=1; inverse weight −2; integral unit −1 has square 1 | Pass |
| 0.3 | q=2, α=−√2, r=2; r=0 control | α²=2 has modulus 4^(1/2)=2; r=0 gives 1 for every α and is excluded | Pass |
| 0.4 | q=2, α=1+√2 and its conjugate; α=−1 | Moduli 1+√2 and √2−1 are reciprocal; weights ±2log₂(1+√2); w(−1)=0 | Pass |
| 0.5 | E=Qbar; E=C; k=Q(√2) | Cardinalities ℵ₀<c versus c=c; √2 can map to ±√2; a countable E cannot surject onto C | Pass |
| 0.6 | α=1+√2; E=Q(t) with t sent to z, 2z | Conjugate moduli differ; transcendental-image moduli differ by 2, so weights differ by 2log_q2 | Pass |
| 0.7 | J₂(2), diag(1,2), zero space, zero endomorphism | Roots [2,2], [1,2], []; weights [2,2], [0,2], []; zero scalar rejected although total log 0=0 | Pass |
| 0.8 | F=[[1,1],[0,2]], W=first axis | χ_F=(T−1)(T−2); det F=2=1·2; W need not have an invariant chosen complement | Pass |
| 0.9 | J₂(1), invariant first axis | Both subquotients have weight 0; extension roots [1,1] have weight 0 although J₂(1)≠I | Pass |
| 0.10 | F=diag(1,2); F=I₂ over F₂ | D=1−3t+2t²; −tD′/D=3t+5t²+9t³+…; over F₂ all traces vanish but D=1+t² | Pass |
| 0.11 | F=diag(1,−1), P=T² | P(F)=I₂; roots [1,1], retaining multiplicity 2; inverse roots [1,−1] | Pass |
| 0.12 | q=2, F=diag(√2,−√2), r=2 | F²=2I; base becomes 4; both original and new roots have weight 1 | Pass |
| 0.13 | F=[2], G=[4], q=2 | Tensor scalar 8 has weight 6; dual scalar 1/2 has weight −2; Hom scalar 2 has weight 2=4−2 | Pass |
| 0.14 | F=diag(2,3), k=0,1,2,3 | Exterior root multisets [1], [2,3], [6], []; dimensions 1,2,1,0 | Pass |
| 0.15 | q=2, F=[2], twists 1 and ±1/√2 | Tate twist scalar 1, weight 0=2−2; half-twist scalars ±√2 both weight 1 but unequal | Pass |
| 0.16 | B(x,y)=xy, F=2, F′=3, c=6 | B(Fx,F′y)=6xy; c/2=3; (−T)(6/T−2)/2=T−3 | Pass |
| 0.17 | q=2, F=1, G=2; equal-weight control | Intertwining gives 2u=u, hence u=0; if G=1, u=1 survives; zero modules give only zero map | Pass |
| 0.18 | F=diag(1,2), q=2 | Weight pieces ker(F−1)=Qe₁ and ker(F−2)=Qe₂; dimensions 1+1=2; intersections 0 | Pass |
| 0.19 | F=diag(1,2), Ne₂=e₁ | NF=2FN; monodromy grades −1,+1 have weights 0,2, centered at 1; ordinary purity fails | Pass |
| 1.1 | A=zero abelian variety; elliptic q-Frobenius | Degrees q^0=1 and q^1=q; on a dimension-g variety degree q^g matches adapter normalization | Pass |
| 1.2 | Elliptic Frobenius π over F₂ | π†π=[2], so Tate determinant 2 and pairing multiplier 2 agree | Pass |
| 1.3 | α=1+2i, Rosati conjugation | α†α=5; roots 1±2i have squared modulus 5 | Pass |
| 1.4 | Elliptic polynomial T²−T+2; dimension zero | Roots have modulus √2; zero-dimensional polynomial 1 has no roots | Pass |
| 1.5 | q=2,g=1,trace 1,m=1,2; g=0 | Counts 2,8 give errors 0≤2√2+1 and 4≤5; g=0 gives error 0 and bound 0 | Pass mathematics; missing Lean headline R03 |
| 1.6 | P¹ and genus-one curve over F₂ | Counts 3 and 2; deviations 0≤0 and 1≤2√2; Jacobian H¹ dimensions 0 and 2 | Pass |
| 1.7 | P¹/F₂ | Frobenius spectra in degrees 0,1,2 are [1], [], [2]; weights 0, vacuous, 2 | Pass |
| 1.8 | Elliptic trace 1 over F₂ | a=2+1−2=1; a²=1≤8=4q; χ=T²−T+2 | Pass |
| 1.9 | Same elliptic polynomial, extension degree 2 | Trace α²+β²=1−4=−3; determinant 4; root moduli 2=(2²)^(1/2) | Pass |
| 1.10 | Spec F₂, A¹/F₂, empty scheme, Spec F₂[ε]/ε² | Counts in degree m: 1,2^m,0,1; zeta functions 1/(1−t),1/(1−2t),1,1/(1−t) | Pass; includes Lean headline |
| 2.1 | Constant rank-two system on an affine curve | Alternating matrix has determinant 1; geometric image {I} has dimension 0<3=dim Sp₂, so open-image hypothesis rejects it | Pass negative control |
| 2.2 | Sp₂ over Q₂; open congruence subgroup; rank zero | Lie dimension 3=dim SL₂; {I} has dimension 0 and is not open; Sp₀={1} has dimension 0 | Pass |
| 2.3 | Symplectic Qℓ², tensor powers 0,2,4 | Invariant dimensions 1,1,2; the three pairings in degree 4 have one relation, not dimension 3 | Pass |
| 2.4 | Tensor exponent k=0 on G_m/F₂ | Hc⁰=0, Hc¹ eigenvalue 1, Hc² eigenvalue 2; L=(1−t)/(1−2t) | Pass |
| 2.5 | Real trace a=−1, tensor exponent 2k=2 | Tensor trace a²=1≥0; odd tensor trace −1 would fail positivity | Pass |
| 2.6 | Scalar tensor eigenvalue 1 | Local factor (1−t)^−1 has coefficients 1,1,1; log coefficients 1,1/2,1/3 | Pass |
| 2.7 | f=(1−t)^−1, g=(1−2t)^−1, product fg | Radii 1,1/2,1/2; each factor radius ≥ product radius | Pass |
| 2.8 | Same rational factors; cancellation control g=1−2t | Nearest pole moduli 1 and 1/2 versus product 1/2; negative coefficient −2 is precisely what permits forbidden cancellation | Pass |
| 2.9 | Weight-one symplectic rank-two local factor T²−T+2 | Both root moduli √2=2^(1/2), product 2; non-open constant example of §2.1 excluded | Pass numerical conclusion |
| 2.10 | Zero symplectic system on affine U; bound at β=1,q=2 | Hc¹ has no roots; comparison value is 2^(1/2+1)=2√2, not √2 | Pass boundary and exponent |
| 2.11 | Zero symplectic system, hence zero parabolic cohomology | Root multiset []; both coarse inequalities have zero offending roots | Pass boundary case |
| 3.1 | Zero vanishing space; rank-two alternating quotient of weight d=1 | Zero quotient has rank 0; J= [[0,1],[-1,0]], diag(1,2)^t J diag(1,2)=2J | Pass descent/sign fixture |
| 3.2 | Geometrically constant Jordan system J₂(1) | Geometric action I; degree-e arithmetic action [[1,e],[0,1]]=J₂(1)^e, descending without semisimplicity | Pass |
| 3.3 | Smooth P¹ fibre over F₂, vanishing quotient zero | Z=1/((1−t)(1−2t)); variable factor 1, constant factors 1−t and 1−2t | Pass |
| 3.4 | Singleton α,β nonzero with equal second and third powers | r=α/β has r²=r³=1, hence r=1; using even powers alone admits r=−1 | Pass |
| 3.5 | d=1, degree e=1 and 2 | Multiplier q^(de) is 2 and 4; arithmetic coordinate a=−e gives q^(−da)=2 and 4 | Pass sign; openness checked at source |
| 3.6 | Sp₂ diagonal g=diag(a,a⁻¹), prescribed eigenvalue 1 | det(g−I)=2−a−a⁻¹; zero iff a=1; a=2 gives −1/2, proving nonidentity of this equation | Pass local equation |
| 3.7 | Constant C₂-cover, class identity | Even degrees have conditional proportion 1, odd degrees 0; Dirichlet density 1/2; supplier gives same numbers | R02 |
| 3.8 | Rational-factor fixture with constant part 1 and variable polynomial 1−t+2t² | Numerator/denominator cancellation absent; reduced varying factor remains 1−t+2t², constant term 1 | Pass algebraic fixture only |
| 3.9 | Weight-one factor 1−t+2t² versus extraneous 1−t | Reciprocal-root moduli √2 versus 1; the weight criterion selects the quadratic, not 1−t | Pass |
| 3.10 | Rank-two factor from trace 1, determinant 2; zero quotient | D=1−t+2t²∈Q[t]; rank-zero D=1∈Q[t] | Pass |
| 3.11 | d=1 coarse exponent window; candidate modulus 2 | 2 lies between 2^((d+1)/2−1/2)=√2 and 2^((d+1)/2+1/2)=2√2 | Pass bound arithmetic |
| 4.1 | P²/F₂, middle H² | Root 2; half-unit bounds 2^(1/2)≤2≤2^(3/2) | Pass |
| 4.2 | Same root on m-fold Cartesian powers | Root 2^m; mth-root bounds tend to 2; log₂(2^m)/m=1 | Pass |
| 4.3 | P²/F₂ and empty smooth projective scheme | Roots [1], [2], [4] in degrees 0,2,4; moduli 2^(i/2); empty case all root multisets [] | Pass headline |
| 4.4 | P¹/F₂; coefficient fields Q and Q₃; empty degree pieces | R=1/((1−t)(1−2t)); P₀=1−t,P₁=1,P₂=1−2t; numerator·even=denominator·odd | Pass Lean headline |
| 5.1 | Point Spec F_q; identity and degree-two Frobenius | Geometric kernel {1}; Weil group Z; degrees 0 and 2; F₂=F₁² | Pass |
| 5.2 | Point Weil lines with scalar ℓ and scalar −1 | ℓ-adic norms ℓ^−1 versus 1; first fails étale descent, second extends via finite quotient C₂ | Pass |
| 5.3 | Point scalar 1+√2 and conjugate; J₂(1) | Fixed-embedding weights ±2log_q(1+√2); no single integer Weil weight; J₂(1) weights [0,0] | Pass |
| 5.4 | q=2, pure line F=1, β=0, twist scalar i | Twist weight 0=2β, but envelope polynomial T²−(1+i)T+i is nonreal; scalar 1 repairs it to (T−1)² | R01 |
| 5.5 | Rank-one Kummer character of order 3; constant line scalar 2 | Geometric image orders 3 and 1; cubing first determinant kills it; constant scalar gives weight 2 at q=2 | Pass |
| 5.6 | Direct sum of lines with scalars 1 and 2 | Determinantal constituent weights 0 and 2; total determinant scalar 2 has weight 2, average weight 1 is not either constituent weight | Pass |
| 5.7 | G=SL₂×Z; constant Jordan degree representation | Identity component semisimple; centre μ₂×Z has degree image Z; J₂(1)^e retains off-diagonal e | Pass |
| 5.8 | Scalar lines 2 and 4, tensor and dual | Determinantal tensor weight 6=2+4; dual weight −2; pullback degree a changes base to 2^a and preserves normalized weight | Pass |
| 5.9 | Finite geometric character and constant rank-one scalar 2 | Determinantal and punctual weights both 2 at q=2; rank-one generalized majoration gives equality | Pass headline fixture |
| 5.10 | Constant coefficients on G_m/F₂ | Hc¹ root 1 has weight 0; boundary invariants root 1 have weight 0; coarse H¹ upper estimate permits it | Pass |
| 5.11 | Nodal elliptic degeneration, Ne₂=e₁, F=diag(1,2) | NF=2FN; monodromy grades −1,+1 have weights 0,2=1±1 | Pass local headline fixture |
| 5.12 | Trivial inertia line; tame nontrivial quadratic line | Invariant stalk ranks 1 and 0; root spectra [1] and []; boundary weights 0 and none | Pass |
| 5.13 | q=2, F=diag(1,2); q′=4,F′=diag(1,4) | Normalized slopes [0,1] in both; vertices (0,0),(1,0),(2,1); zero module endpoint (0,0) | Pass |
| 5.14 | N with one length-two string and slope interval [0,1] | N²=0, N≠0; floor(1−0)+1=2; unit interval [0,0] would force N=0 | Pass |
| 5.15 | G_m² and curve t↦(t,t−1); wrong curve t↦(t,1) | Boundary homology image ranks 2 and 1 versus target rank 2; constant system image order 1 throughout | Pass |
| 5.16 | 3+4cosθ+cos2θ at θ=0,π,π/2 | Values 8,0,2 equal 2(1+cosθ)²; nonnegative, with exact zero at π | Pass |
| 5.17 | G=Z acting by J₂(1), degree e=2; norm character at q=2 | Weil semisimple element 2, group-unipotent part 0; matrix parts I and [[1,2],[0,1]]; norm exponent 1 gives weight −2 | Pass seeded target |
| 5.18 | Constant sheaf on G_m/F₂ | Hc¹ root 1 has weight 0<2=β+2; ordinary H¹ root 2 has weight 2 and shows why compact support matters | Pass |
| 5.19 | Trivial compact kernel, degree progression | Translated support is the single degree-i class; total mass tends to 1; Haar probability there has mass 1 | Pass |
| 6.1 | Ordinary node xy=t, with constant coefficients | One vanishing cycle, Milnor rank 1; two branches give orientation permutation determinant −1 when swapped | Pass |
| 6.2 | Elliptic factor T²−T+2 | Conjugate roots sum 1 and product 2; cohomological polynomial has real coefficients 1,−1,2 | Pass |
| 6.3 | Pure root α of modulus √2 on product of two curves | Tensor eigenvalue α² has modulus 2=(√2)²; taking square root recovers √2 | Pass |
| 6.4 | Constant G_m and smooth projective elliptic curve/F₂ | Parabolic H¹: dimension 0 and 2; second roots have modulus √2, exactly weight 1 | Pass headline |
| 6.5 | Constant G_m/F₂, β=0 | Hc¹ weight 0≤1; Hc² weight 2≤2; parabolic image 0; boundary weight 0≤β | Pass seeded target |
| 7.1 | Point Tate line and trivial line | Scalars 1/2 and 1 have weights −2 and 0; convention agrees with §5.3 | Pass imported convention |
| 7.2 | Point scalar 1/2 and scalar −1 | Weights −2 and 0; 1/2 is not integral, −1 is integral; zero object has no nonintegral root | Pass |
| 7.3 | Identity map; disjoint union of two points | R⁰id_! returns original roots; two copies give root multiset [1,1], higher direct images zero | Pass |
| 7.4 | Frobenius universal homeomorphism on A¹/F₂ | Étale cohomology unchanged; Hc² root remains 2, degree of scheme map 2 does not multiply cohomological dimension | Pass |
| 7.5 | Kummer cover t=s³ on G_m in characteristic 2 | Cover degree 3, tame inertia order 3; p=2 does not force removal of this tame case | Pass |
| 7.6 | P¹→point with empty boundary | Fibre dimension 1; compactification unchanged; tame coefficient rank 1; resulting H² scalar q | Pass |
| 7.7 | P¹/F₂ with constant weight-zero coefficients | R⁰ roots [1], R¹ [], R² [2]; weights 0≤0 and 2≤2 | Pass |
| 7.8 | A¹/F₂→point, constant sheaf | Only Hc²=Qℓ(−1); weight 2=0+2; compact output is Qℓ(−1)[−2] | Pass headline |
| 7.9 | Same A¹, Weil line of real weight β=1/2 | Hc² scalar q·q^(1/4); weight 5/2=β+2, allowing noninteger β | Pass headline |
| 7.10 | A¹/F₂, d=1,i=2; point,d=i=0 | Eigenvalues 2 and 1; normalized eigenvalues 2/2^(2−1)=1 and 1/2⁰=1 are integral | Pass headline |
| 7.11 | Same A¹ integral coefficients | Lower bound 2(i−d)=2, upper bound n+i=2; actual weight 2 lies in [2,2] | Pass |
| 7.12 | Constant G_m/F₂ | Hc¹ weight 0≤1; H¹ weight 2≥1; image Hc¹→H¹=0, pure weight 1 vacuously | Pass headline |
| 7.13 | q=5,α=1+2i; α=q⁻¹; raw q=0 | Couples (1,0)/(0,1), sum 1; (−1,−1), sum −2; q=0 multiplication yields (0,0)≠(0,∞) | Pass |
| 7.14 | G_m/F₂, d=i=1; compact/ordinary H¹ | Couples (0,0) and (1,1); sums 0≤1 and 2≥1; ordinary coordinates 1≤min(i,d)=1 | Pass |
| 7.15 | P¹/F₂; scheme quotient P¹/C₂ with trivial action | Roots [1],[2] in degrees 0,2, weights 0,2; degree factors 1−t and 1−2t are integral | Pass headline |
| 8.1 | Point Qℓ[1], Qℓ(1)[2] | Nonzero degrees −1,−2 have stalk weights 0,−2; complex weights 1 and 0 | Pass |
| 8.2 | Point Qℓ[1] and its dual | Dual Qℓ[−1] has complex weight −1; lower/upper exchange 1↔−1 | Pass |
| 8.3 | Identity on Spec Z[1/ℓ], constant sheaf | R⁰ roots [1], Rⁱ=0 for i>0; generic open can be entire base | Pass |
| 8.4 | A¹/F₂→point, ordinary cohomology | R⁰ roots [1], Rⁱ=0 for i>0; mixed weights {0} | Pass |
| 8.5 | Point lines of weights 0 and −2 | Tensor weight −2; internal Hom from weight −2 to 0 has weight 2; dual of −2 has weight 2 | Pass |
| 8.6 | Split multiplicative elliptic degeneration; quadratic tame character | Graded roots 1,q, weights 0,2; nontrivial quadratic inertia invariants 0, trivialized after degree 2 | Pass |
| 8.7 | Smooth trait with constant sheaf; nodal degeneration | Smooth nearby roots [1] in R⁰, higher zero; nodal local R¹Ψ=Qℓ(−1) with weight 2 | Pass seeded target |
| 8.8 | A¹/F₂→point, K=Qℓ of complex weight 0 | Rf_!K=Qℓ(−1)[−2]; complex weight 2−2=0, matching bound 0 | Pass seeded target |
| 8.9 | Smooth A¹, K=Qℓ(1)[2]; point Qℓ[1] | Complex weights −2+2=0 and 0+1=1; nonzero cohomology weights w+i are −2 and 0 | Pass seeded target |
| 8.10 | j:G_m→A¹, constant sheaf | Underived j_*Qℓ=Qℓ has weight 0; derived R¹j_* boundary stalk Qℓ(−1) has weight 2 and is not being asserted weight-zero sheaf | Pass |
| 8.11 | A¹→point and point identity; weights a=2,b=−2 | Compact output weight 0 as in §8.8; tensor weight 0=a+b; Hom weight −4=b−a | Pass |
| 8.12 | P¹/F₂→point, K=Qℓ | Rf_*K=Qℓ⊕Qℓ(−1)[−2]; both summands complex weight 0 | Pass headline |
| 8.13 | Closed finite-field point of Spec Z[1/ℓ] | K′=Qℓ(−1)[−2] has weight 2−2=0; alternative dualizing normalization preserves weight | Pass |
| 8.14 | Trivial geometric group with J₂(1) arithmetic action | Geometric representation splits 1⊕1; arithmetic Jordan block does not split; geometric Zariski closure dimension 0 | Pass |
| 8.15 | Point; two trivial rank-one systems | H⁰ Hom=Qℓ, F−1=0, coinvariants dimension 1; H¹ geometric=0; Ext¹ arithmetic dimension 1 | Pass |
| 8.16 | Point characters 1 and 2; equal-character control | F−1 on Hom is 1 or −1/2, invertible: Ext¹=0; for equal scalars F−1=0, Ext¹ dimension 1 | Pass |
| 8.17 | Point lines weights 0,1/2,2 | Modulo-Z blocks: ranks 2 in class 0, 1 in class 1/2; total 3=2+1; zero object has zero blocks | Pass seeded target |
| 8.18 | Kummer extension 0→Qℓ(1)→E→Qℓ→0 | W_−3=0, W_−2=W_−1=Qℓ(1), W₀=E; graded ranks 1+1=2; no splitting required | Pass |
| 8.19 | Pure constant J₂(1) system | Geometric image trivial, hence two simple summands; arithmetic endomorphism still J₂(1)≠I | Pass headline |
| 8.20 | Point model Qℓ and wrong unrelated point model | Specified fibre has scalar 1, weight 0; substituting scalar q gives weight 2 and fails identification/purity condition | Pass |
| 8.21 | P¹×S→S | R⁰=Qℓ, R¹=0, R²=Qℓ(−1); fibre roots 1,q have weights 0,2 at each finite residue field | Pass |
| 8.22 | Constant sheaf on geometric point | Representation has rank 1 and invariant subspaces 0,V; semisimple; model scalar 1 supplies purity weight 0 | Pass |
| 8.23 | P¹×S→S over algebraically closed field | Nonzero direct images are rank-one constant systems in degrees 0,2; both split into one simple summand | Pass |
| 8.24 | P¹ with two boundary points; branch swap | d₁:H⁰(P¹)→Qℓ² sends 1↦(1,1); cokernel dimension 1, weight 0; H² root q; branch orientation swap −1 | Pass headline |
| 9.1 | P¹, L=O(1), L⊗² | λ(1)=h, Tr(h)=1; c₁(L²)=2h; trivial line gives c₁=0 | Pass |
| 9.2 | S₃ permutation representation Q³, dot product; modular C₂ control | Invariants Q(1,1,1), restricted matrix [3] nondegenerate; over F₂ swap-representation invariants (1,1) have norm 0 and module is not semisimple | Pass seeded target |
| 9.3 | X=P², Y=P¹ | H⁰(Y) pairing via hyperplane has matrix [1]; λ²:H⁰(X)→H⁴(X) also matrix [1] | Pass |
| 9.4 | P¹ with O(1) spread over Z[1/ℓ] | Fibre Betti dimensions 1,0,1; λ:H⁰→H²(1) is [1] on every geometric fibre | Pass |
| 9.5 | Hyperplane P¹ in P² | Degree-one groups both zero, invariant part dimension 0; degree-zero fixed part for hyperplane points has constant rank 1 | Pass boundary fixture |
| 9.6 | P², n=2, r=0,1,2,3 | λ⁰ on H² is I; H¹,H³=0; λ²:H⁰→H⁴(2) sends 1↦h²; r=3 has 0→0 | Pass seeded headline |
| 9.7 | Three-step chain e₀→e₂→e₄; K=F₂,F₃,Q; n=0 | P⁰=Ke₀,P²=0; degree-2 decomposition λP⁰ has dimension 1; 1−1=0 for P²; n=0 gives P⁰=V | Pass both Lean headlines |
| 9.8 | Same chain, B(e_i,e_j)=1 for i+j=4 and 0 otherwise | B matrix determinant −1 (1 in F₂); primitive ψ₂(e₀,e₀)=1; degree-two ψ₀(e₂,e₂)=1 | Pass |
| 9.9 | Genus-one curve; P² | Odd Betti dimensions 2 and 0, both even; alternating 2×2 matrix has determinant 1 also in characteristic 2 | Pass |
| 9.10 | P¹, K=Qℓ[1] of weight 1 | Nonzero hypercohomology degrees −1,+1; λ sends scalar 1 to twisted scalar q·q⁻¹=1 | Pass headline fixture |
| 9.11 | P¹ with constant rank-r pure coefficient system | H⁰ and H²(1) both rank r; Lefschetz matrix I_r; r=0 gives 0→0 | Pass |
| 9.12 | P¹ hyperplane in P², invariant/vanishing splitting | Middle H¹(Y)=0; both summands dimension 0, orthogonal complements agree; nondegenerate restriction convention matches §9.2 | Pass boundary fixture |
| 10.1 | N=0 scalar F=2 and nonzero-N example of §0.19 | Ordinary and WD weights both 2 when N=0; nonzero-N weights {0,2} versus centered WD weight 1 | Pass |
| 10.2 | P¹/F₂; Spec F₄ viewed over F₂ | Counts 3,5 for P¹ in degrees 1,2; counts 0,2 for Spec F₄; top component traces 0,2 are required | Pass headline |
| 10.3 | Split versus nonsplit nodal elliptic degeneration over F₂ | Graph Frobenius +1 versus −1 (weight 0); dual graph twist scalars +2 versus −2 (weight 2) | Pass headline |
| 10.4 | Same node | Newton slopes 0,1; monodromy N²=0; Gr weights 0,2; both conventions agree with §§5.11,8.6 | Pass |
| 10.5 | X=A¹/F₂, trivial compact kernel, degree m | Mass 2^−m·#A¹(F_(2^m))=1; translated Haar mass 1; using 2^−2m would incorrectly tend to 0 | Pass headline |
| 10.6 | Elliptic trace 1 over F₂; Haar angle density | cosθ=1/(2√2); count 1+2−1=2; integral₀^π (2/π)sin²θ dθ=1, second trace moment 1 | Pass seeded headline |
| 3.7 auxiliary uniform fibre mass | H=Z₂×C₂, U_j=2^j Z₂×C₂ | Each fibre mass 2^−j; supremum 2^−j→0; total mass also 2^−j | Pass |
| 5.15 auxiliary full prime-to-p reduction | P¹−{0,1,∞}→G_m² via (t,t−1) | Boundary exponent vectors (1,0),(0,1),(−1,−1); image rank 2 at every prime ≠p | Pass |
| 5.17 auxiliary compact-form comparison | SL₂(C)×Z and trivial kernel | Quotient compact PSU₂; inverse image SU₂×Z; centre kernel order 2 retained; Z kernel order 1 | Pass |
| 6.1 auxiliary boundary pencil | xy=t with two boundary branches | Branch transposition has sign −1; vanishing cycle rank 1; constant coefficient monodromy unipotent eigenvalue 1 | Pass local fixture |
| 7.9 auxiliary integrality fibration | A²→A¹ coordinate projection; affine point | Relative dimension 1; final compact fibre Hc² root q; dimension-zero termination has Hc⁰ root 1 | Pass |
| 8.24 auxiliary DM coefficient descent | BC₂ constant/sign local systems, ℓ=2 | Constant H⁰ dimension 1, sign H⁰ dimension 0; higher rational cohomology 0 because averaging uses 1/2∈Q₂ | Pass |
| 8.24 auxiliary smooth proper DM purity | [P¹/C₂], trivial action | H⁰ root 1, H² root q, other groups 0; weights 0,2 agree with dimension 1 and coarse P¹ | Pass |
| 9.7 auxiliary natural-grading comparison | Three-step chain, n=2, j=0,2 | j=0↦r=2 and kernel λ³; j=2↦r=0 and kernel λ; negative degree subspace 0 | Pass |
| 10.6 auxiliary full monodromy | Prime-to-p full level 3 and higher level 5 | SL₂(F₅) has order 5(25−1)=120; connected level-5 torsor has full 120-element geometric image | Pass finite-level fixture |
| Lean finiteFieldPointCount | Spec F₂, Spec F₂[ε]/ε², empty scheme over F₂ | Each field map kills ε: cardinalities 1,1,0; nilpotents do not create field-valued points | Pass |
| Lean finiteFieldZeta | Point, with arbitrary E₀ | Log coefficients 0,1,1/2,1/3; zeta coefficients 1,1,1,1; E₀ never used | Pass |
| Lean IsWeilNumber | q=2, α=1/2; q=1; transcendental α | Weights −2; q=1 rejected; transcendental rejected by algebraicity despite zero minimal polynomial | Pass |
| Lean IsPure | Zero space; 1-dimensional F=0; J₂(1) | Roots [],[0],[1,1]; truth values all weights, no weights, weight 0 | Pass |
| Lean primitivePiece | n=0,λ=0,V⁰=V; r=0,1 | r=0 gives V∩ker0=V; r=1 gives V⁻¹=0; definition valid without finite dimension | Pass |

### Lean acceptance test and missing headline probe

The original Suggested.lean elaborated with `lake env lean`: **zero errors and exactly four sorry warnings**. A scratch copy with `#check @...` for all **nine declarations** also elaborated. The flagged dropped section binder belongs to `primitivePiece`: it does not retain `FiniteDimensional K V`, but an intersection with a kernel needs no such hypothesis. Both Lefschetz theorems explicitly retain finite dimensionality, internal grading, support bounds, the degree-two condition and all required Lefschetz bijections. No signature correction is needed for that binder.

I replaced each of the four theorem proofs by the single tactic `simp` in a separate copy. All four remained unproved: three unsolved-goal errors and one no-progress error. Reading their native carriers and the pinned linear algebra did not reveal a one-library-lemma replacement. None is a boundary-case or API-padding theorem.

The README's headline families are:

- DWP.1: abelian and curve Weil estimates, point-count bounds and zeta rationality.
- DWP.2–DWP.4: symplectic coefficient estimate, pencil-factor rationality, smooth projective purity, rational/integral degree factors and independence of the coefficient prime.
- DWP.5–DWP.7: generalized majoration, local weight–monodromy, sharp parabolic/compact curve bounds, general direct-image bounds and integrality.
- DWP.8: mixed six operations, pure proper direct images, weight filtration, geometric semisimplicity, potential purity, and the normal-crossings spectral sequence with its DM purity input.
- DWP.9: geometric and potentially pure hard Lefschetz, primitive decomposition and perfect pairings.
- DWP.10: arithmetic weight transport, compatible factors and point-count estimates, semistable/nearby-cycle weights, equidistribution and elliptic Sato–Tate.

The file correctly states zeta rationality, degree-factor extraction and the two arbitrary-field graded Lefschetz theorems. Its docstring identifies the unavailable rational-adic cohomology, constructible Weil complexes, monodromy and associated operations for the other geometric formulations. R03 identifies the numerical abelian exception to that explanation. The following full §1.5 signature, appended to a scratch copy with the single additional native import, elaborated with **zero errors and five sorry warnings** (four original, one new):

```lean
import Mathlib
import TauCeti.AlgebraicGeometry.AbelianVariety.Basic

-- Uses the existing finiteFieldPointCount definition from Suggested.lean.
theorem abelianPointCountBound {k : Type u} [Field k] [Finite k]
    (A : TauCeti.AlgebraicGeometry.AbelianVariety k) (g : ℕ)
    (hg : A.dim = (g : WithBot ℕ∞))
    (E : Type u) [Field E] [Algebra k E] [FiniteDimensional k E]
    (m : ℕ) (hm : 0 < m) (hE : Module.finrank k E = m) :
    |(TauCeti.Weights.finiteFieldPointCount A.toOver.hom E : ℝ) -
       (Nat.card k : ℝ) ^ (m * g)| ≤
      2 * (g : ℝ) * (Nat.card k : ℝ) ^ ((m : ℝ) * ((g : ℝ) - 1 / 2)) +
      ((2 : ℝ) ^ (2 * g) - 2 * (g : ℝ) - 1) *
        (Nat.card k : ℝ) ^ ((m : ℝ) * ((g : ℝ) - 1)) := by
  sorry
```

The namespace in that probe references the existing file; R05's rename should be applied consistently in the repaired acceptance test. The probe is a signature witness, not a claimed proof.

### Library and ownership audit

I opened **46 explicitly cited pinned declarations**, listed below, and additionally inspected `AbelianVariety` and `AbelianVariety.dim` in `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95,118`, and the three scheme-morphism predicates in `Mathlib/AlgebraicGeometry/Morphisms/FiniteType.lean:42`, `QuasiCompact.lean:41` and `Separated.lean:43`.

The native `AbelianVariety` bundles a proper geometrically integral group scheme; it is not an arbitrary scheme with a freely supplied genus. The zeta theorem's separate finite-type, quasi-compact and separated binders supply the required finiteness without imposing smoothness. `Representation` is a monoid homomorphism to linear endomorphisms: it supplies no topology or continuity. `DirectSum.IsInternal` says the canonical direct-sum map is bijective; it supplies no finite-dimensionality or bounded grading. `BilinForm.Nondegenerate` is both left- and right-separation; it supplies no symmetry. Those extra hypotheses are properly retained where used.

The pinned `IsAlgClosed.lift` assumes an algebraic extension, so it alone does not solve §0.5's prescribed-base extension for a transcendental field. The roadmap explicitly adds the transcendence-basis construction. The eigenvalue/charpoly comparison is applied over fields and finite-dimensional spaces, not arbitrary rings. The Clifford restriction result starts with an irreducible finite-dimensional representation and a normal subgroup; the roadmap's semisimple use is summandwise. The orthogonal-complement equivalence requires a reflexive form and is not a substitute for the arbitrary-bilinear-form proof of §9.2.

Library paths in this inventory are relative to their respective pinned library roots:

| Declaration opened | Pinned file and line |
| --- | --- |
| `minpoly.algHom_eq` | `Mathlib/FieldTheory/Minpoly/Basic.lean:69` |
| `IsAlgClosed.lift` | `Mathlib/FieldTheory/IsAlgClosed/Basic.lean:350` |
| `NumberField.Embeddings.pow_eq_one_of_norm_eq_one` | `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean:138` |
| `IsAlgClosed.cardinal_eq_cardinal_transcendence_basis_of_aleph0_lt` | `Mathlib/FieldTheory/IsAlgClosed/Classification.lean:122` |
| `Cardinal.mk_complex` | `Mathlib/Analysis/Complex/Cardinality.lean:25` |
| `IsAlgClosed.equivOfTranscendenceBasis` | `Mathlib/FieldTheory/IsAlgClosed/Classification.lean:61` |
| `IsAlgClosed.ringEquiv_of_equiv_of_charZero` | `Mathlib/FieldTheory/IsAlgClosed/Classification.lean:159` |
| `Algebra.IsAlgebraic.cardinalMk_le_max` | `Mathlib/RingTheory/Algebraic/Cardinality.lean:71` |
| `LinearMap.charpoly_baseChange` | `Mathlib/LinearAlgebra/Charpoly/BaseChange.lean:21` |
| `Module.End.hasEigenvalue_iff_isRoot_charpoly` | `Mathlib/LinearAlgebra/Eigenspace/Charpoly.lean:40` |
| `LinearMap.finrank_maxGenEigenspace_eq` | `Mathlib/LinearAlgebra/Eigenspace/Zero.lean:200` |
| `Module.End.iSup_maxGenEigenspace_eq_top` | `Mathlib/LinearAlgebra/Eigenspace/Triangularizable.lean:74` |
| `Module.End.independent_maxGenEigenspace` | `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:731` |
| `Matrix.charpoly_fromBlocks_zero₂₁` | `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:185` |
| `LinearMap.charpoly_prodMap` | `Mathlib/LinearAlgebra/Charpoly/ToMatrix.lean:62` |
| `Matrix.reverse_charpoly` | `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:292` |
| `Matrix.trace_eq_sum_roots_charpoly` | `Mathlib/LinearAlgebra/Matrix/Charpoly/Eigs.lean:108` |
| `Matrix.charpoly_inv` | `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:313` |
| `Matrix.det_kronecker` | `Mathlib/LinearAlgebra/Matrix/Kronecker.lean:402` |
| `LinearMap.trace_tensorProduct'` | `Mathlib/LinearAlgebra/Trace.lean:258` |
| `LinearMap.det_dualMap` | `Mathlib/LinearAlgebra/Determinant.lean:784` |
| `Polynomial.isCoprime_iff_aeval_ne_zero_of_isAlgClosed` | `Mathlib/FieldTheory/IsAlgClosed/Basic.lean:251` |
| `LinearMap.aeval_self_charpoly` | `Mathlib/LinearAlgebra/Charpoly/Basic.lean:89` |
| `Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime` | `Mathlib/RingTheory/Polynomial/Basic.lean:871` |
| `AddValuation` | `Mathlib/RingTheory/Valuation/Basic.lean:1057` |
| `Multiset.sort` | `Mathlib/Data/Multiset/Sort.lean:30` |
| `MonoidHom.eqLocus` | `Mathlib/Algebra/Group/Subgroup/Ker.lean:388` |
| `exteriorPower.map` | `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean:260` |
| `Module.Basis.exteriorPower` | `Mathlib/LinearAlgebra/ExteriorPower/Basis.lean:94` |
| `Representation` | `Mathlib/RepresentationTheory/Basic.lean:48` |
| `Representation.asModule` | `Mathlib/RepresentationTheory/Basic.lean:142` |
| `Representation.invariants` | `Mathlib/RepresentationTheory/Invariants.lean:73` |
| `IsSemisimpleModule` | `Mathlib/RingTheory/SimpleModule/Basic.lean:65` |
| `Representation.IsSemisimpleRepresentation` | `Mathlib/RepresentationTheory/Semisimple.lean:34` |
| `LinearMap.BilinForm.Nondegenerate` | `Mathlib/LinearAlgebra/BilinearForm/Properties.lean:291` |
| `LinearMap.BilinForm.restrict` | `Mathlib/LinearAlgebra/BilinearForm/Basic.lean:151` |
| `LinearMap.BilinForm.IsAlt` | `Mathlib/LinearAlgebra/BilinearForm/Properties.lean:236` |
| `LinearMap.BilinForm.restrict_nondegenerate_iff_isCompl_orthogonal` | `Mathlib/LinearAlgebra/BilinearForm/Orthogonal.lean:327` |
| `DirectSum.IsInternal` | `Mathlib/Algebra/DirectSum/Basic.lean:440` |
| `LinearMap.ker` | `Mathlib/Algebra/Module/Submodule/Ker.lean:59` |
| `Module.finrank` | `Mathlib/LinearAlgebra/Dimension/Finrank.lean:61` |
| `TauCeti.Representation.isSemisimpleRepresentation_comp_subtype` | `TauCeti/RepresentationTheory/Induction/Clifford/Basic.lean:327` |
| `LinearMap.BilinForm.IsAlt.even_finrank` | `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean:309` |
| `Even.pow_nonneg` | `Mathlib/Algebra/Order/Ring/Basic.lean:81` |
| `MonoidHom.mrange` | `Mathlib/Algebra/Group/Submonoid/Operations.lean:649` |
| `exists_finite_inj_algHom_of_fg` | `Mathlib/RingTheory/NoetherNormalization.lean:287` |

Object searches used `roadmaps grep`, `roadmaps show`, the main checkout, the board packages and the supplied sibling files. The following contracts were resolved by content, not merely by matching a name. Line references below refer to the cited roadmap README, without the display tool's one-line banner.

| Supplier and relative README locator | Resolved contract / ownership consequence |
| --- | --- |
| SchemeAndStackFoundations, lines 848 (§0.9), 1825 (§0.29), 2817 (§1.19), 2843 (§1.20), 3021 (§1.23), 4905 (§3.6) | Approximation, scheme Frobenius, DM atlases/inertia/coarse spaces and base-point-free Picard torsors exist on main. The native stack carrier is imported; rational DM coefficient descent and purity remain explicit constructions here. |
| AbelianSchemesAndArithmeticModuli, lines 1140, 1626, 1883, 2922, 2950, 2988, 3255 | Polarization, Rosati, H¹/Tate comparison, characteristic polynomial, Tate realization, positivity and Frobenius semisimplicity supply the contracts. The elliptic polynomial is explicitly stated in §A6.11, even though the extra identifier `charpoly_frobenius_elliptic` is not its heading. |
| ArithmeticGaloisRepresentations, §2.6 and line 3484 (§5.13) | Natural-base Weil numbers and centered monodromy filtration are imported; real-base comparison is new here. The complete finite-cover degree count is already supplied: R02. |
| ArithmeticGaloisDuality, line 2072 (§R02.3.2) | Function-field ideles, degree-zero compactness, local units and reciprocity supply the curve input. The higher-dimensional prime-to-p curve reduction is explicitly owned in §5.15 here. |
| EtaleCohomologyFoundations, §§F.0–F.8 and F.10 | Finite/integral/rational coefficient foundations, compact-support operations, duality, twists, weak Lefschetz, perverse carriers and Frobenius comparisons are supplied. The stable-lattice condition is retained for normal/lattice-admitting lisse representations. |
| InverseGaloisAndArithmeticFundamentalGroups, §§IG.0.T1–IG.0.T4; line 6369 inside §IG.5.7 | Curve/Jacobian and coefficient trace formulas; finite-cover criterion and normal dense-open surjectivity. The latter really occurs inside §IG.5.7 despite that section's hyperelliptic title. |
| LefschetzPencilsAndVanishingCycles, lines 2438 (§3.6), 2630 vicinity (§4.4), 4046 (§7b.7), §§7a.3/7a.5 | Full compact arithmetic monodromy specialization, geometric radical quotient, generic arithmetic complex models and signed nodal descent. DWP adds arithmetic weight conclusions and its stated general-base extension, rather than assuming local invariant-cycle spectral hypotheses for free. |
| ReductiveGroupsPartII, line 640 inside §RG2.0.2 | Smooth characteristic-zero local-field analytic charts and dimension comparison needed for open symplectic subgroup density. |
| RepresentationTheory/LieGroups, line 407, Layer 7 | Compact real forms and continuous/holomorphic representation comparison; DWP's algebraic-by-Z and finite-component comparison is additional. |
| RepresentationTheory/SchurWeyl, lines 378, 441, Layer 9 | Symplectic Brauer contractions/commutant theorem; DWP transports the invariant calculation to its rational-adic coefficient setting. Small-rank relations are not discarded. |
| RepresentationTheory/CompactGroups, Layers 0, 5, 6 and SU₂ case | Haar probability, Peter–Weyl and characters are imported. DWP retains the additional uniform degree-fibre/null-locus argument. |
| ArithmeticDirichletSeries, lines 321–334, Layer 8 | Landau at the actual abscissa and the 3–4–1 positivity combination. |
| AlgebraicCurves, line 1085, Layer 12, on main | Smooth compactification over perfect fields and the function-field dictionary; no dependence on its later revision is necessary. |
| Completed/ProfiniteProPGroups, lines 312, 477–487 | Completed Frattini theory and named Tau Ceti realizations; no dependence on the later-listed open revision is necessary. |
| NewtonPolygons, lines 320 and 396 (§§0.6–0.7) | One common slope/polygon carrier, including represented-height comparison; DWP constructs a stalk adapter rather than another polygon. |
| ModularCurvesPartII, lines 1669 and 1695 (§§4.11–4.12), §3.2 | Fixed-pairing geometric connectedness, smoothness and the elliptic open; DWP's inverse-limit SL₂ image argument is additional. |
| StandardConjectures, scope and §§0.1–0.4 | Imports DWP's arbitrary-field primitive core and adds characteristic-zero lowering/sl₂/projector constructions. It is a consumer, not an input to §9.7. |
| EllAdicHomotopyTypesAndWeights, scope/weight supplier contract in the supplied sibling | Consumes cohomological weight theory and adds homotopy algebra and weight splitting; it does not replace DWP's cohomological purity owner. |

The corresponding main-roadmap Hasse, Abel–Jacobi and compact-representation contracts were also checked through their named layers. No duplicate fully qualified name was found for the nine Suggested.lean declarations in the searched roadmap copies. The object search found no competing earlier owner for the general Weil-II purity/weight library or the arbitrary-field primitive core. R02 is the concrete duplicated target. This finding is repairable inside this folder; it does not justify rejecting the whole roadmap as a re-plan.

### Gate and supply direction

I read all **150 `*Needs:*` lines** together with the supplier contracts. The coefficient prefix of DWP.5 is explicitly placed before DWP.2; the later local/analytic weight theorems use DWP.1–DWP.4. The arithmetic-purity → potential-complex-purity → Lefschetz route is also spelled out. I found no mathematical cycle in those target-level dependencies.

The supplied push-gate result is:

```text
gate DeligneWeightsAndPurity: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=248 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=2 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 FAIL
```

I independently ran the requested dependency check, which returned:

```text
not movable: DeligneWeightsAndPurity consumes ProfiniteProPGroups (#246) and is consumed by AbelianSchemesAndArithmeticModuliPartII (#112), which comes first: moving DeligneWeightsAndPurity after ProfiniteProPGroups would put a supplier after a consumer, a cycle through DeligneWeightsAndPurity
UPWARD: DeligneWeightsAndPurity (#85) -> AlgebraicCurves (#238) at README lines [2526, 2694]
UPWARD: DeligneWeightsAndPurity (#85) -> ProfiniteProPGroups (#246) at README lines [2185, 2211]
depcheck: 164 roadmaps, 1170 edges, 2 problem(s)
```

Both UPWARD lines are **false positives under this brief's explicit permission to consume main roadmaps**. The supplied content checkout has HEAD equal to origin/main at `3ec8d5f97285d3a04491f8d9662b5dad2bb4f6ff`. It contains `TauCetiRoadmap/AlgebraicCurves/README.md` with the cited Layer 12 and `Completed/ProfiniteProPGroups/README.md` with the cited Frattini theory. The alleged cycle results from treating those citations as dependencies on later revisions instead of the main/completed owners. No mathematical target needs to move upward or downward. The raw output is preserved rather than silently treated as passing; R04 remains an actual gate failure.

The Lean file has one Mathlib import, no imported roadmap, no `set_option`, no sorry-defined data and no admitted examples. It is 156 lines. No stray/source-material files or outside-folder edits were found. Shape defects are R04–R06; the mathematical definitions retain substantive API and discriminating examples, including zero objects, nonintegrality, Jordan blocks, wrong Frobenius conventions, component permutations and characteristic two.

## Not verifiable

- No cited text remained inaccessible: the initial Int fetch failure was resolved using the legal institutional copy, and the missing-reference request was cleared. There are no waived or uncertified source entries to reopen.
- The finite computations are not formal proofs of the 136-target library. In particular, matrix fixtures for pencil monodromy do not certify openness, and the branch/node fixtures do not prove the global existence of a boundary-adapted pencil. Those general assertions were assessed through their source and supplier statements.
- The object audit covers the main/board/indexed material and supplied open-work copies available to this review. It does not certify ownership against private or unavailable work. No inaccessible public source is being used to defer the verdict.

## Source issues

- **Misprint** in WII at (2.2.8)(i), printed p. 195, repeated in (3.5.1), printed p. 211: the source says the associated sheaf has weight twice the real norm exponent; it should be minus twice that exponent with its chosen inverse-norm character; affects a stated result.
- **Misprint** in WII at (3.5.6)–(3.5.7), printed p. 212: the source says the angle density has coefficient 1/(2π) multiplying sin²θ; it should be 2/π, so the measure has total mass one; affects a stated result.
- **Misprint** in WII at (3.5.6), printed p. 212: the source says the elliptic point count adds the Frobenius trace to 1+q^n; it should be 1+q^n minus that trace; affects a stated result.


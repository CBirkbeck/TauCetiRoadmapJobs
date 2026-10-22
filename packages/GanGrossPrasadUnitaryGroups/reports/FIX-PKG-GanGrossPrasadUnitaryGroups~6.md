# Repair report: GanGrossPrasadUnitaryGroups

## F01 (P2) — applied

Split carrier requested through `gap:hermitian-unitary` → imported from MetaplecticAutomorphicForms §3.2a. The gap retains complement/Witt geometry, arbitrary-form representability and additional scalar-extension/inner-form comparisons. Added `hermitianSplitCarrierEquiv`, its compatibility API and three Checks; updated §§1.1, 1.3 and 3.4. Extended the two existing split-line Lean examples. The source key is unchanged.

### Mathematical evidence

Read `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:608` at revision `297a40c9a53d52c164a6e568d51015a6332dc8f4`. Its §3.2a includes the perfect split Hermitian carrier on finite projective modules, the idempotent description A⊕A∨ and the isometry group GL(A). The algebraic assertions require a field of characteristic different from 2; the local-field assumption concerns the subsequent oscillator comparison. Thus the package's field base already lies in the carrier's scope.

The comparison is elementary and does not require another carrier construction. For E=F×F, the action is `(a,b)(x,l)=(ax,bl)`. The supplier's sign +1 form is `k((x,l),(y,m))=(l(y),m(x))`. Exchanging its arguments gives `h((x,l),(y,m))=(m(x),l(y))`, with `h(av,bw)=a c(b)h(v,w)`. Exchanging twice recovers k. Nondegeneracy is unchanged. This agrees with the linear-first convention in ggp §2, p. 5, ggp line 179–190; the relative complement is described at ggp line 229–243 and its line framing at ggp line 1567–1569.

For an E-linear equivalence f, `h(fv,fw)=h(v,w)` is exactly the k-preservation equation with v,w exchanged. Identity and composite maps therefore remain the same maps. For any E-submodule S, `h(s,v)=k(v,s)=c(k(s,v))`; involutivity of c makes its vanishing equivalent to `k(s,v)=0`. This proves orthogonal-submodule compatibility, also for S of nonconstant E-rank. Finally, `((g⁻¹)∨m)(gx)=m(x)` proves preservation by the supplied GL(A) action. No oscillator assertion is needed.

The pinned declarations agree with these arguments: `LinearMap.Nondegenerate` is two-sided separation in `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:595`; `LinearMap.flip_nondegenerate` is at line 656. The actual membership formula in `Mathlib/LinearAlgebra/SesquilinearForm/Orthogonal.lean:54` fixes the orthogonal's argument order. Object searches in pinned Mathlib and Tau Ceti found no split perfect-Hermitian carrier supplying this comparison. `Matrix.unitaryGroup` supplies the identity-Gram group and does not replace arbitrary-form representability.

The field comparison remains distinct: `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:1184`, at revision `01c64f0cc5f154a3d190697951ead2fffc2af693`, supplies its field carrier and adjoints, whose field hypothesis excludes F×F. The seven specified sibling package contexts were inspected for competing Hermitian/model ownership; their lattice, cohomological, arithmetic-line and modular-representation objects supply no replacement for the split carrier or this comparison.

Section 3.4 retains its nonsplit analytic hypotheses. Its added split comparison concerns the algebraic fixed/moving submodules and centralizers; it does not assert a split version of the nonsplit trace formula. Split multiplicities still use §§3.10–3.11.

### Adversarial mathematics pass

Each numbered row includes the subsection's API, identities and Checks. The results below are boundary and hypothesis checks, not completed proofs of the planned analytic theorems. Unchanged targets continue to require their named supplier contracts.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Algebraic conventions | Zero module; split algebra; characteristic 2; inseparable quadratic extension; zero ring | Rank zero is valid. Étaleness and field/characteristic assumptions exclude the invalid bases. Split constant E-rank n gives GL_n(F). | Split ownership corrected. |
| Pairing, character and induction conventions | Pairings at (i,1) and (1,i); character value i; upper GL₂ diagonal element | Values i and −i; right translation acts by ν; δ_B is abs(a), with the inverse half-modulus converting normalized to unnormalized induction. | None. |
| Factor and measure conventions | Degrees 1/2; empty parameter; two Frobenius eigenvalues; Haar factors 2 and 1/2 | Asai signs alternate; empty factor is 1; inverse Frobenius inverts both eigenvalues; product-one Haar changes cancel. | None. |
| §1.1 relevance and frames | W=0; rank-three complement; both indefinite real signs; split idempotent | Complement rank is 2r+1. A nonzero split vector need not generate the line. | Split carrier imported. |
| `hermitianFieldCarrierEquiv` and API | Zero space; complex line; multiplication by a over a quadratic Q₂-extension | Double swap is identity, orthogonals/isometries agree, and both adjoints multiply by c(a). | Preserved. |
| `hermitianSplitCarrierEquiv` and API | A=0; A=F; arbitrary E-submodule S; identity and composite isometries | Zero group is trivial; slot exchange is involutive; orthogonals agree even for nonconstant-rank S. | Added comparison and zero-rank target. |
| Split idempotent Check | v=(1,0), w=(0,1), S=F×{0} | k(v,w)=(0,1), h(v,w)=(1,0); both self-pairings vanish; S is self-orthogonal although the ambient pairing is perfect. | Added README Check and Lean scalar witness. |
| Split scaling Check | t=2 over Q; inverse-dual versus equal component scaling | Cross-pairings are (1,0) versus (4,0). Frames (2,1/2) and (2,1) have norms 1 and 2. Division uses a unit. | Added README Check and Lean witness. |
| `splitLineFrame` and norm theorem | (1,1), (1,0), (2,1), (2,1/2); arbitrary fields | Frames are precisely units, equivalently nonzero coordinate product. The small specialization also works in characteristic 2; the Hermitian roadmap keeps its separate characteristic restriction. | Two proved examples extended. |
| §1.2 datum and character | Empty flag; two simple coordinates; split upper GL₃ | r=0 gives diagonal U(W); simple-coordinate sums have no cross term; the split line generator yields both character coordinates. | None. |
| §1.3 transport | Identity/composite isometries; simultaneous form negation; altered additive character | Slot comparisons preserve the same conjugating maps. Form negation preserves the group equation and exchanges real line signs; character transport is required. | Uses split comparison. |
| §2.1 analytic models and currying | Trivial H; inverse versus equal nonzero U(1) weights; dense algebraic tensors | Model dimensions 1 versus 0 detect the dual. Continuous extensions need density and continuity. Finrank is used after finiteness. | None. |
| `linearFirstPairing` | Complex scalar scaling; zero vectors; zero space | First slot is linear, second conjugate-linear; scalar witnesses give i and −i. | None. |
| `algebraicBesselModel` and equivariance | Scalar character; trivial second factor; fixed tensor with target action −1 | Multiplication intertwines the actual target character; covariance uses ν. The fixed tensor is annihilated in the negative-control case. | None. |
| §2.2 distribution symmetry | Norm-one scalar; split upper unipotent GL₂; noncommuting products | Conjugated inverse fixes the scalar; transpose reverses multiplication. Identity is not an anti-automorphism in the noncommutative case. | None. |
| §2.3 adjacent multiplicity | U(0)⊂U(1); split real pair; ramified quadratic Q₂-extension | Scalar model has dimension 1; compactness and odd residue characteristic are not hypotheses. | None. |
| §2.4 finite-place reduction | r=1; isotropic residual W; forbidden Bernstein block; GL₂ modulus | Auxiliary rank is 2. Residual W need not be anisotropic. Closed-orbit vanishing requires the support exclusion; induction remains unnormalized. | None. |
| §2.5 archimedean injection | S of dimensions 0,1,2; reducible induction parameter; both line signs | The common half-plane is for a fixed finite S; a suitable irreducible parameter may depend on S. | None. |
| §2.6 multiplicity one | Two independent functionals; incompatible compact weight; dyadic data | A two-dimensional S contradicts the adjacent bound. Zero multiplicity is permitted. | None. |
| §2.7 tempered integration | Compact H of mass a; trivial coefficients on noncompact split H; logarithmic weights | Compact value is a. The nontempered trivial integral diverges. Strict relative decay absorbs a fixed logarithmic power. | None. |
| §3.1 epsilon character | Empty parameter; opposite odd characters; repeated irreducible | Empty value is 1. Duality gives product −1 for opposite odd characters. Multiplicity parity belongs to the central element, not the component generator. | None. |
| `componentCentralElement` and character theorem | Empty index; multiplicity 2; two multiplicity-one coordinates | Values are 0,0,(1,1). The sum character is 1 on each generator and 0 on their sum; coordinate expansion gives the theorem. | None. |
| §3.2 enhancement transport | Norm/nonnorm change; dimensions 2 and 1; two successive sign changes | Norm change is trivial; the even-side label changes in the displayed witness; two changes cancel. Actual correspondence normalization is required. | None. |
| §3.3 regularized form | H=1; compact matching/mismatching weights; r>0; reducible tempered induction | Scalar mass and weight orthogonality agree. Higher codimension needs regularization. Induction refers to the full induced representation. | None. |
| §3.4 geometric multiplicity | x=1; x=−1 on one complex line; zero quasi-character; compact centralizer; split comparison | Empty determinant is 1; moving-line norm determinant is 4. Empty regular germ sets contribute 0. Algebraic slot transport changes no centralizer operator. | Split comparison added; nonsplit theorem retained. |
| §3.5 local trace formula | W=0; real indefinite group; proper-Levi induction | Rank zero retains the Whittaker germ; noncompact groups need Schwartz/regularized traces; induction keeps the GL germ factor. | None. |
| §3.6 Fourier identity | μ=ε; μ=−ε; order-two component group | Values at the origin are 1 and 0 respectively. Fourier values (1,−1) select the nontrivial enhancement. | None. |
| §3.7 nonarchimedean selection | W=0; ramified dyadic data; wrong enhancement | Complement fixes the rank-zero inner form; wrong enhancement has multiplicity 0; no residue prime is discarded. | None. |
| §3.8 real reduction and seesaw form | a+b=1; counts (2,1); zero companion lift; matching/mismatching U(1) oscillator weights | Counts decrease to (1,0). Nonzero companion-lift conjuncts prevent false universal nonvanishing. Conjugate oscillator gives diagonal 1 versus 0 and slot scalings i versus −i. | None. |
| §3.9 real selection | Compact U(2) weights; opposite line sign; W=0 | Dual weight 1 interlaces, dual weight −1 does not; transported signs preserve multiplicity; rank-one model has dimension 1. | None. |
| §3.10 split prediction | GL₁×GL₀; nontempered trivial GL₂; regular GL₃ principal series | Empty factor is scalar. Unitarity alone does not imply genericity. Ordinary Jacquet dimension 6 differs from generic model dimension 1. Infinite higher codimension stays a proposition. | None. |
| §3.11 split nonvanishing | Adjacent real pair; finite-place GL₄×GL₁; real higher codimension | Proven ranges remain finite places or adjacent infinity; no infinite higher-codimension proof is inferred. Generic character uses both split coordinates. | None. |
| §4.1 global period | r=0; ν(h)=i; character nontrivial on H(F) | Empty unipotent contributes 1; right translation gives i; a nonrational character does not descend to the quotient. | None. |
| §4.2 local obstruction | One zero local model; replacements with values 2 and 3; reference scaling | Global period is zero in the obstructed case; two replacements multiply by 6; reference normalization cancels. | None. |
| §4.3 L-representation | b=0; ranks (2,1); split localization | Dimensions are 0 and 4, with empty L-factor 1. Split localization has two factors. Index two is taken in the finite-Galois L-group. | None. |
| §4.4 fixed-pair conjecture | W=0; central value zero; nondistinguished prescribed inner form | Whittaker coefficient remains meaningful; central nonvanishing is a separate conjunct; fixed and existential inner-form assertions differ. | None. |
| §5.1 normalizer | n=1; split place; zero global central value | Δ₂ uses η then 1. Local factors stay finite/nonzero while the global numerator can vanish; no central value is inverted. | None. |
| §5.1a split Whittaker identity | n=1; vector in ker λ; pairing and Haar rescaling | Raw form has factor ab; kernel vector gives zero without making the form identically zero; doubling H Haar doubles the integral. | None. |
| §5.2 normalized local form | Zero vector; nonzero scalar multiple; compact H; continuous versus discontinuous tensor forms | α(0,0)=0, q(0) is excluded, and q(cx)=q(x). Density determines continuous forms only. | None. |
| §5.3 spherical value | Split Q₂ eigenvalues 1,−1; unramified nonsplit Q₂ rank one; nonspherical data | Split values L=2, Δ=8/3, Ad=32/9 give C=3 and raw integral 3. Compact nonsplit H gives raw=C=1. Nonspherical vectors fail the hypotheses. | None; arbitrary-rank all-residue proof remains target work. |
| §5.4 rescaling | Pairing times 2; Haar factors 2 and 1/2; global H Haar times 2 | Pairing quotient unchanged; product-one local factors cancel; squared global period multiplies by 4. | None. |
| §5.5 all-place product | Spherical tail; one zero exceptional term; good place of volume 2 moved into S | Nonzero reference tail defines the finite modification; exceptional zero is allowed; enlargement leaves the product unchanged. | None. |
| §6.1 Whittaker periods | n=1; central zero; zero vector; multiple constituents | Degree-wise Asai signs differ; λ can vanish while β and norm remain nonzero; leading coefficients remove the specified pole orders. | None. |
| §6.2 relative characters | One-dimensional realization; basis rescaling; zero period; spherical projector | Numerator and basis norm scale together. Zero period gives zero J; projector has local trace Cα after justified Fubini. | None. |
| §6.3 spectral contribution | Counts (1,1),(2,1); repeated constituent; diagonal-centre quotient | Coefficients are 1/4,1/8. Repetition violates the datum; quotienting the centre changes the coefficient incorrectly. | None. |
| `unitaryConstituentSigns` and cardinal theorem | Empty indices; counts (1,1),(2,1) | Orders 1,4,8; both finite-index hypotheses are explicit. Native cardinal arithmetic supplies the calculation. | None. |
| `unitaryConstituentCoefficient` and formula | Same index pairs; possible zero denominator | Values 1,1/4,1/8. The sign group contains zero, so finite order is positive before inversion. | None. |
| §6.4 isolated comparison | Several realizations with one base change; transfer on one inner form; dense infinite-place transfer | Isolation retains the entire base-change class; zero transfer components remove other forms; continuity is needed for density. | None. |
| §6.5 Euler identity | One nondistinguished local component; three constituents; product-one κ | Vanishing is handled without division by periods; coefficient is 1/8; only the global product of κ is asserted to be 1. | None. |
| §7.1 global nonvanishing | n=1; endoscopic parameter; unsuitable prescribed h; nontempered component | Inner form is existential, rank one/endoscopy are included, and the theorem imposes no temperedness premise. | None. |
| §7.2 stable specialization | One constituent per degree; n=1 boundary; bad places | Stable coefficient is 1/4. The cited stable theorem has n>1; n=1 uses §7.1. All places are retained. | None. |
| §7.3 refined proposition | Counts (1,1),(2,1); zero vector; zero mixed pairing | Coefficients vary; norm quotients exclude zero vectors; mixed formula is denominator-cleared before polarization. | None. |
| §7.4 completed identity | Central zero; endoscopy; vector/pairing/Haar changes | Every local term remains defined at central zero; counts determine the coefficient; scaling agrees with §5.4; the conjecture is not assumed. | None. |
| Supplier supplements | Differential Haar at q=2, ranks 1/2; quotient Haar scaling; dyadic trace-one choice; zero theta lift | Compact volumes 1/2,3/8; quotient scaling a/b; trace-one avoids dividing integral coordinates by 2; nonzero-lift branches are explicit. | Only the duplicated split-carrier request narrowed. |

### Exact check outcomes

- Required elaboration: `lake env lean` on `packages/GanGrossPrasadUnitaryGroups/Suggested.lean`, from the content checkout, exited **0**. The only diagnostics were five `declaration uses sorry` warnings, at lines **25, 84, 131, 174 and 197**. All twelve examples, including the extended split witnesses, were proved. The sole import is `import Mathlib`; no Tau Ceti object build was required.
- A scratch elaboration with `#check @name` for all eleven named declarations exited **0**, with the same five warnings. The field/group/module assumptions, complex inner-product structure, `Fintype`/`DecidableEq`, and both `Finite` assumptions remain in the elaborated signatures.
- Required dependency direction check exited **0** with exactly:

```text
depcheck: 8 roadmaps, 58 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. `merge-order/ORDER.txt` puts ReductiveGroupsPartII at line 20, MetaplecticAutomorphicForms at line 112 and this roadmap at line 149. The comparison is owned here and introduces no reverse supplier dependency.

- Plan comparison against the original JSON passed: all top-level values except `gaps` are identical; within `gaps`, only `hermitian-unitary`'s `needs` and `detail` changed. Its slug, owner and section are unchanged. All **36** gap slugs match the README's exact supplier contracts.
- Lean/README name and shape checks passed: **11** documented names, **6** real-bodied definitions/abbreviations, **5** admitted theorem signatures, **12** proved examples, and **213** lines. No admitted data, extra import or `set_option` was introduced. No existing signature was changed.
- TOML parsing and source-key uniqueness passed: **17** unique source entries, **16** certified extractions present and **1** waived entry. The existing `ggp` entry gained the comparison's `cited_for` locator. No new source was needed; `xue-bessel` remains waived and was not requested again. Metadata is unchanged.
- `git diff --check` passed without output. Edits are confined to the allowed package files and this report; no commit or external write was made.

### Maintainer consequences

ReductiveGroupsPartII still owes the narrowed `gap:hermitian-unitary`; this repair does not discharge its complement/Witt or representability mathematics. MetaplecticAutomorphicForms supplies its existing split carrier without a new target there. The eight `hermitianSplitCarrierEquiv` names remain README targets because their supplier carriers are not implemented at the pins; the zero-rank assertion is explicitly named there rather than forced into an artificial Lean encoding.

No existing downstream name, including `GanGrossPrasadUnitaryGroups:GGP.8`, changes. No other roadmap or merge-order edit is required. The all-residue spherical extension and other analytic/supplier proof obligations retain their stated scope and status.

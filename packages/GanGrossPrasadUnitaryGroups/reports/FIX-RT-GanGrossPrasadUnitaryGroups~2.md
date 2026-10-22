# Repair findings and verification

## Finding inventory

Both supplied round-two reviews record `Verdict: accepted`. Review r2a explicitly establishes no new S-series finding; r2b explicitly does not re-raise the earlier findings. Neither supplies a new finding ID or severity. No mathematical file is changed in this round. The short proof suggested in r2b is explicitly informational, not a finding; it does not require changing the retained representative theorem.

The historical findings overlap between the two reviews and are accounted for once below. The first three finding sections refer to r1a and the next four to r1b, retaining their original IDs, severities and dispositions. Their settled status is not reopened. This report records verification and check outcomes; it does not replace the next independent review.

## F01 (P3) — applied

Review r1a, model Checks. The two `algebraicBesselModel` examples construct evaluation equivalences and prove finrank 1 for the scalar and inverse-Circle-weight models. Equal Circle weights give the zero model and finrank 0: at i, equivariance gives −f(1⊗1)=f(1⊗1), hence f=0 over ℂ. The README describes precisely these results.

## F02 (P2) — applied

Review r1a, global relative-character bases. Section 6.2 specifies smooth K-bases, finite-dimensional K-isotypic spaces, nonzero orthogonal basis vectors and norm denominators. The excluded nonsmooth Hilbert-basis case remains a Check. This agrees with bpcz line 1167, line 1174, line 1185 and line 4694, rather than asserting that the period is defined on every Hilbert vector.

## F03 (P3) — applied

Review r1a, source-manifest link. The reference is the adjacent `[source manifest](sources.toml)` in `packages/GanGrossPrasadUnitaryGroups/README.md`; the manifest exists alongside the README.

## F01 (P3) — applied differently

Review r1b, duplicate admitted wrappers. All four deleted wrapper names remain absent from the README and Lean file. Native product-unit criteria, intertwiner evaluation and finite cardinal identities remain exact supplier imports. Their declarations and the actual tensor action were inspected at the pins.

## F02 (P3) — applied

Review r1b, completed supplier link. RestrictedProducts is linked to `Completed/RestrictedProducts/README.md`. Its completed reference-family, map, decomposition and diagonal contracts are present; they supply no Tamagawa assertion.

## F03 (P3) — applied

Review r1b, title capitalization. The title retains Bessel and Gan–Gross–Prasad with proper-name capitalization.

## F04 (P3) — not actionable in this package: successor scope and ownership require a board decision

Review r1b, successor ownership. Both reviews explicitly leave the earlier `not actionable in this package` disposition settled. A different successor name or cross-roadmap scope assignment requires a human decision. This package imports no theorem from the proposed successor, so this is not an undeclared prerequisite requiring another gap.

## Mathematical verification

Each row includes the named APIs and Checks of the indicated target, not only its headline. Instances below were checked against the written definitions, explicit Lean proof bodies, source statements and elementary calculations. “Retained” means no edit is warranted by these tests under the written hypotheses; it does not certify future analytic proofs or discharge supplier gaps.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Algebraic conventions | Zero module; ranks 0, 1, 3; split E; definite and indefinite real forms | Nondegeneracy permits the zero module. Relevant rank difference is 2r+1. Fields and quadratic étale coefficients exclude the zero ring and inseparable extensions. | Retained |
| Analytic conventions | Q₂, Q₃, ℝ, ℂ; split algebra; noncompact GL₂ | Characteristic zero is explicit; dyadic residue characteristic is included. Smooth finite-place and continuous archimedean models remain distinct. | Retained |
| Pairing and character conventions | B(i,1), B(1,i); ν(h)=i; inverse weights 1,−1 | Values i,−i and P(R(h)f)=iP(f) agree with the slot swap and inverse character in the integral. Equal weights give zero invariants. | Retained |
| Induction and Frobenius conventions | diag(a,1) in upper GL₂ Borel; two unramified eigenvalues a,b | δ_B=|a|; converting unnormalized to normalized induction uses δ_B^(-1/2). Inverse Frobenius replaces a,b by their inverses. | Retained |
| Component, Asai and measure conventions | Multiplicity 2; degrees 1 and 2; constituent counts 2 and 3; Haar factors 2,1/2 | Central multiplicity is reduced modulo two; Asai pole and adjoint signs are opposite; coefficients are 1/4,1/8. Global Haar factor 2 changes the squared period by 4. | Retained |
| §1.1 `RelevantHermitianPair` and frames | W=0,V=L; W=0,V=H⊕L; definite rank 3; split idempotent | Rank increment is 2r+1. Definite rank 3 fails the r=1 test; a nonzero split zero divisor is not a line basis. | Retained |
| §1.1 `hermitianFieldCarrierEquiv` | Complex line; zero space; dyadic quadratic line; multiplication by a and by 2 | Swapping slots twice is identity and preserves orthogonals and isometries. The adjoint is multiplication by c(a), without inversion. | Retained |
| §1.1 `hermitianSplitCarrierEquiv` | A=0; A=F; the two idempotents; action (2,1/2) | Cross-pairings are (1,0) and (0,1). Inverse-dual scaling preserves them; scaling both entries by 2 gives (4,0). GL(0) is trivial. | Retained |
| §1.1 `splitLineFrame` | (1,1),(1,0) over any field, including 𝔽₂; (2,1),(2,1/2) over ℚ | A frame is a unit, hence has both coordinates nonzero. Its norm need not be 1. The native criteria give the equivalence without an admitted wrapper. | Retained |
| §1.2 `besselDatum` | Empty flag; two simple coordinates; split GL₃ | r=0 gives diagonal H and ν=1. Two coordinates contribute their sum; split b=(x,−y) retains both generic coordinates. | Retained |
| §1.3 `besselTransport` | Identity; composition; simultaneous form negation; changed additive character | Conjugacy transports the frame, character and actions together. Negating real forms exchanges the complementary line signs without changing stabilizer equations. | Retained |
| §2.1 `besselModel`, `besselMultiplicity` | Trivial scalar model; inverse/equal Circle weights; zero module; completed tensor | The tested dimensions are 1,1,0. Cardinal dimension precedes finrank; continuity and density are necessary for completed-tensor uniqueness. | Retained |
| §2.1 `linearFirstPairing` | i in either slot; scalar c; zero vector and zero space | B(i,1)=i and B(1,i)=−i; scaling the second slot conjugates c. Neither completeness nor finite dimension is needed. | Retained |
| §2.1 `algebraicBesselModel` | Arbitrary scalar character; trivial group; Circle; fixed tensor with target −id | Evaluation at 1⊗1 identifies the scalar model with ℂ. The fixed tensor maps to zero in the −id case. All category instances occur in the explicit binders. | Retained |
| §2.2 distribution symmetry | Rank-one norm-one scalar; upper and lower GL₂ unipotents; identity map | The nonsplit anti-involution fixes the rank-one group; transpose reverses multiplication. Identity is not an anti-automorphism of noncommutative GL₂. | Retained |
| §2.3 adjacent multiplicity | U(0)⊂U(1); dyadic extension; GL₂(ℝ)↓GL₁(ℝ) | Rank-one character model has dimension 1; no compactness or odd-residue assumption is introduced. Irreducibility and representation category remain explicit. | Retained |
| §2.4 nonarchimedean reduction | r=1; W hyperbolic; nonsupercuspidal endpoints; excluded Bernstein block | Auxiliary rank is r+1=2. Y need not be maximal isotropic. The exclusion uses π_V dual and is essential; induction is unnormalized. | Retained |
| §2.5 archimedean injection | Finite-dimensional S; r=1; either line sign; bad inducing parameter | The common convergence half-plane can depend on S. Generic irreducibility is chosen there; no injection for every parameter is asserted. | Retained |
| §2.6 multiplicity one | W=0; both real signs; compact U(2) standard with U(1) weight 1 | Uniqueness permits multiplicity zero. The unmatched compact weights give zero; the theorem does not assert universal distinction. | Retained |
| §2.7 adjacent tempered integral | Compact inverse weights; split noncompact GL₂×GL₁; trivial nontempered pair | Compact value is Haar mass. The trivial noncompact integrand has infinite integral, confirming the tempered hypothesis. | Retained |
| §3.1 `ggpEpsilonCharacter` | Empty parameter; χ₁⊕χ₋₁ against 1; repeated χ₁ | Empty tensor epsilon is 1. Duality gives two-generator product −1; multiplicity two kills the central coordinate without killing its generator. | Retained |
| §3.1 `componentCentralElement` and character identity | Empty I; multiplicities 0,1,2; two-coordinate additive character | Every vector is the sum of its coordinate generators with multiplicities. Additive maps to ℤ/2 respect these multiples, giving the stated sum identity. The proved examples independently separate generator and central values. | Retained |
| §3.2 enhancement transport | Norm and nonnorm t; even/odd degree; t=−1 over ℝ | The even-side generator changes by −1 in degrees (2,1); the odd-side label is unchanged. Norm changes are trivial and two nonnorm changes cancel. | Retained |
| §3.3 regularized tempered form | H=1 of mass a; compact matching/mismatching weights; r>0; full induction | Values are aB and zero as appropriate. Only adjacent rank uses the raw integral; higher rank retains regularization. Induction concerns the entire induced representation. | Retained |
| §3.4 geometric multiplicity | x=1; x=−1 on a complex line; zero quasi-character; compact U(2) centralizer | Empty moving determinant is 1; Δ(−1)=4. An empty regular nilpotent-orbit set gives coefficient zero, avoiding an empty average. | Retained |
| §3.5 local trace formula | W=0; real noncompact group; proper-Levi induction; Lie algebra | Nonsplit scope, strongly cuspidal tests and regularization are retained. The induction factor is the GL germ, with group and Lie identities stated separately. | Retained |
| §3.6 packet Fourier identity | με=−1,+1; order-two group with Fourier values (1,−1) | The relevance prefactor is respectively 0,1. Fourier inversion selects the nontrivial enhancement for the two-term witness. | Retained |
| §3.7 finite-place packet theorem | W=0; ramified Q₂/Q₃; wrong enhancement | Uniqueness ranges over relevant inner forms. The zero space does not acquire a second inner form; the wrong enhancement has multiplicity zero. | Retained |
| §3.8 real theta reduction and two seesaws | a+b=1; (2,1)→(1,1)→(1,0); zero companion lift; compact vanishing pair | The lower Bessel measure drops by 2. Nonzero companion-lift conjuncts remain essential; the compact unmatched pair prevents an unconditional nonvanishing inference. | Retained |
| §3.8 `realSeesawForm` | U(0); occurring oscillator weight k; weight k+1; i in either argument | Unit-volume scalar value is 1, shifted-weight value is 0. Conjugating the oscillator coefficient and using linear-first pairings gives i,−i covariance. | Retained |
| §3.9 real packet theorem | Compact U(2) weights; opposite line sign; W=0; higher odd codimension | Bilinear dual weights give the stated interlacing; labels travel with the form change. Higher-codimension reduction uses the full induced representation. | Retained |
| §3.10 split prediction | GL₁×GL₀; GL₂×GL₁; trivial GL₂; regular unitary GL₃ principal series | Trivial GL₂ is unitary but nontempered and nongeneric. Ordinary N-invariants in the GL₃ functional model have dimension 6; generic model dimension is 1. Higher archimedean scope remains a proposition. | Retained |
| §3.11 split nonvanishing | Adjacent pair at every place; finite-place gap 3; higher real model | The theorem covers every finite place and only adjacent archimedean pairs. The displayed higher real model has both character coordinates but no unsupported theorem claim. | Retained |
| §4.1 global period | r=0; rational points; ν(h)=i; right translation | Rational triviality is required for descent. Changing variables gives ν(h), matching the local model; the empty unipotent contributes 1. | Retained |
| §4.2 local obstruction | One zero local model; two factors with values 2,3; reference-vector scalar a | Local failure forces global vanishing. The finite product changes by 6; reference normalization changes reciprocally. No converse from local existence alone is inferred. | Retained |
| §4.3 tensor L-representation | b=0; ranks (2,1); split place; connected-dual restriction | Dimension is 2ab, hence 4 in the example. Index two refers to the finite-Galois L-group. The split central factor is the product with its dual. | Retained |
| §4.4 global conjecture | W=0; existing local models with zero central value; prescribed inner form | Zero-degree tensor factor is 1. The proposition retains the central-value condition and fixed pair; it is not a proof input to the adjacent theorem. | Retained |
| §5.1 normalizers | n=1; split, ramified, dyadic and infinite local factors; zero global central value | Δ₂ uses L(1,η)L(2,1). Local regularity gives nonzero C_v; global C may vanish. Only the separately nonzero adjoint denominator is inverted. | Retained |
| §5.1a split Whittaker identity | n=1; independent Haar and pairing scales a,b; λ(W)=0 | Raw integral is ab times λ(W)conj(λ(W′)). Some smooth vector has positive diagonal value; a vector in the kernel need not. | Retained |
| §5.2 normalized local period | Zero vector; nonzero scalar; compact weights; dense tensor image; discontinuous functional | α(0,0)=0, while q is formed only off zero. Norm scaling cancels in q. Extension from pure tensors requires the stated continuity. | Retained |
| §5.3 spherical identity | Unit/scaled Haar; ramified nonspherical data; split and nonsplit dyadic n=1 | Split Q₂ test has Δ₂=8/3, tensor L-value 4 and adjoint value 32/9, hence C=3; the geometric series gives raw integral 3. Nonsplit compact test has C=1 and raw integral 1. Both ratios are 1 at unit volume. | Retained |
| §5.4 rescaling | B→2B; two Haar factors 2,1/2; global Haar factor 2; f→cf | Pairing scaling cancels locally, product-one Haar scaling cancels globally, and a global Haar factor 2 multiplies the squared period by 4. | Retained |
| §5.5 all-place product | All spherical; one zero factor; enlargement of S; nonunit good-place volume | The nonzero volume tail admits finite modifications, including a zero factor. Moving a good place of volume 2 into S preserves its contribution. No central Euler product is assumed convergent. | Retained |
| §6.1 global Whittaker periods | Two constituents; zero vector; zero central value; order-r poles | Finite nonzero leading coefficients replace pole values at 1. The two Asai signs are + on degree 1 and − on degree 2. λ may be zero while β and the model are nonzero. | Retained |
| §6.2 global and local relative characters | Rank-one operator; P=0; basis vector ce; nonsmooth Hilbert vector; compact-open projector | Norm denominators cancel basis rescaling. Global bases remain in the period domain; local smoothing and the adjacent majorant justify the trace integral and its sum. | Retained |
| §6.3 star-generic contribution | Relevant/nonrelevant datum; two/three total constituents; full split centre | Coefficients are 2^(-2),2^(-3); irrelevant data vanish. Removing the split centre or quotienting a diagonal sign gives the wrong coefficient. | Retained |
| §6.3 `unitaryConstituentSigns`, `unitaryConstituentCoefficient` | Counts (1,1),(2,1),(0,0); reindexing | Orders are 4,8,1 and coefficients 1/4,1/8,1. Finite group order is positive, so the inverse has no zero denominator. | Retained |
| §6.4 isolated comparison | Several realizations with the same base change; zero transfer to other forms; no auxiliary supercuspidal place | The sum is over actual base-change classes. Infinite-place density and finite-place exact transfer have separate contracts; inert tests away from S remain units. | Retained |
| §6.5 Euler identity | One zero local model; nontrivial κ_v with product 1; counts (2,1) | Both sides vanish in the local-failure case without division. Product-one comparison constants and inverse group order 1/8 remain explicit. | Retained |
| §7.1 adjacent global nonvanishing | n=1; multiple constituents; an incorrectly prescribed inner form | The conclusion chooses an inner form. The general Hermitian Arthur endpoint has no imposed everywhere-tempered or auxiliary-supercuspidal premise. | Retained |
| §7.2 stable specialization | Single constituent in each degree; n=1 boundary; bad and infinite places | Total count is 2. The cited stable formulation keeps n>1; the separate general theorem supplies n=1. | Retained |
| §7.3 refined conjecture and polarization | Stable/endoscopic counts; zero vector; zero mixed pairing; rescaling | The quotient excludes the zero vector, and polarization clears denominators before using mixed pairings. The conjecture's truth is not assumed by §7.4. | Retained |
| §7.4 `GGP.8` and exports | Counts (1,1),(2,1); central value zero; vector/pairing scaling; Tamagawa factorization | Coefficients are 1/4,1/8. Zero central value makes the defined right side zero. Only nonzero adjoint and positive vector norms are divided by. | Retained |

The definition/API rows also cover identity and composition transport, constructor/extensionality claims and reindexing: these are consequences of the specified native carriers or constructed equivalences, with no arbitrary data detached from the construction. Residue cardinality q=1 is excluded by finite local-field hypotheses. The characteristic-two frame specialization is valid without extending the surrounding characteristic-≠2 Hermitian targets. No positive-rank global theorem is extended by the empty constituent example.

## Source and ownership evidence

All 17 manifest IDs are unique. The 16 certified texts are present in the legal cache; `xue-bessel` remains waived and was not requested or used to infer a theorem. No source was added or renamed. The following anchors were read directly; no source passage is reproduced here.

| Source | Evidence used |
| --- | --- |
| ggp | ggp line 179 and line 229 for form and relevance conventions; line 510 for components; line 598 and line 728 for epsilon identities; line 1567 and line 1624 for frames and characters; line 2051, line 2152 and line 2229 for models/reduction; line 2398 for the split theorem's range; line 2503 for label transport; line 3077 and line 3175 for global periods and conjecture. |
| agrs; sun-zhu; jsz-bessel | agrs line 35, line 59 and line 80; sun-zhu line 49 and line 66; jsz-bessel line 24, line 207, line 260 and line 277. These distinguish anti-involutions, category hypotheses, unnormalized induction and finite-dimensional-subspace injections. |
| bp-unitary-tempered; bp-arch; bp-refined | bp-unitary-tempered line 5000 and line 5003 retain the restriction-Hom dual convention. bp-arch line 6813, line 7165, line 10204, line 10538, line 10551 and line 11200 support the form, induction, discriminant, trace and packet claims. bp-refined line 2855 and line 2888 support the inner-form Fourier factor. Its classification premises remain supplier contracts. |
| xue-real | xue-real line 196, line 213, line 238, line 561, line 848, line 983, line 1017, line 1067, line 1098 and line 1172. The legal cached PDF at published pp. 1010–1011 and 1019 was inspected to resolve OCR ambiguity: the equal-rank theta epsilon uses the conjugate additive character, the new generator has exponent n(n+1)/2−q, and the integrated oscillator coefficient is conjugated with μ⁻¹ in Proposition 3.6. |
| harris; zhang-period | harris line 132, line 149, line 170, line 230 and line 1289 distinguish the refined statement, adjoint sign, integrability and odd-residue spherical source. zhang-period line 424, line 656, line 962, line 1523 and line 1543 retain the differential Haar, spherical Whittaker normalization and raw split period identity. The dyadic spherical extension remains an owned target, not an attribution to Harris's restricted theorem. |
| bpcz; bplzz | bpcz line 96, line 124, line 148, line 179, line 1167, line 1174, line 4243, line 4694 and line 4918 support the constituent count, global endpoints, smooth-basis domain and spectral normalization. bplzz line 128, line 157 and line 185 support the stable specialization. The inverse-order coefficient is determined by bpcz line 104 and line 4254; the inverted cardinal printed at bpcz line 4945 is not substituted for that coefficient. |
| bp-plancherel; bp-fundamental | bp-plancherel line 4480 and line 4734 distinguish exact finite transfer, dense infinite transfer and convention-sensitive spectral constants. bp-fundamental line 99 and line 105 include the fundamental-lemma/group comparison without a small-residue exclusion. |
| ag-descent; bernstein-zelevinsky | ag-descent line 406, line 583 and line 1189 distinguish descent, the archimedean adapted-distribution assertion and the general criterion. bernstein-zelevinsky line 329 gives a filtration, not a canonical splitting. |

At the pinned libraries, inspected the form separation and orthogonal objects, native intertwiner structure and evaluation equation, tensor/dual actions, identity-Gram unitary group, product-unit and cardinal identities, Circle character and Hopf points functor. These support the exact imports and do not supply the analytic endpoints. In particular, `Representation.IntertwiningMap.isIntertwining` is in `Mathlib/RepresentationTheory/Intertwining.lean`, `Representation.tprod_apply` in `Mathlib/RepresentationTheory/Basic.lean`, `Prod.isUnit_iff` in `Mathlib/Algebra/Group/Prod.lean`, and `Nat.card_fun` and `Nat.card_sum` in `Mathlib/SetTheory/Cardinal/Finite.lean`. The pins match the README: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

Read the main-branch NoncommutativeGeometry N1, GlobalNumberFields scope and supplier boundary, and completed RestrictedProducts scope and native declaration contracts. Searched the eight specified sibling heads for overlapping relative models, period endpoints and Hermitian carriers. The SelmerIwasawaCohomologyPartII §8.1 definite integral period witness is an explicit premise with stronger form, level and integral-vector requirements; an existential inner-form theorem here does not discharge it. The other matches concern different objects, including Bessel's inequality and Maass Bessel functions.

All 36 top-level `design/plan.json` gaps have `slug`, `needs`, `supplier` and `section`, with the matching `What <Supplier> must provide (gap:<slug>):` line under the exact supplier contracts. No supplier ownership, gap, import or merge placement is changed. Implementations of open supplier roadmaps were not available in the supplied board/main snapshot; this report does not assert their existence or discharge their declared contracts. The absence of those future proofs is already represented by the contracts, not repaired by assuming their conclusions.

## Required checks

1. Ran the prescribed `lake env lean` elaboration of `packages/GanGrossPrasadUnitaryGroups/Suggested.lean` from the supplied content checkout, with the absolute argument required by the brief. Exit status **0**. Sole diagnostic, expressed with the repository-relative file name:

   ```text
   packages/GanGrossPrasadUnitaryGroups/Suggested.lean:224:8: warning: declaration uses `sorry`
   ```

   This is `componentCentralElement_character`, the retained theorem target. There are no Tau Ceti imports requiring a targeted build. The file has 292 lines, six real-bodied definitions/abbreviations, one admitted theorem and twelve proved examples, two per definition. Its only import is `import Mathlib`. Every named declaration is present in the README; no section variables hide necessary binders. There are no admitted examples or data definitions and no `set_option`.

2. Ran the exact prescribed dependency command. Exit status **0**, complete output:

   ```text
   depcheck: 9 roadmaps, 79 edges, 0 problem(s)
   ```

   There is no UPWARD or CYCLE line. This is the fresh output; the reviews' older edge counts are not substituted for it.

The report gate found no finding sections in the required heading style. The settled-findings table is now seven finding sections retaining the original IDs, severities and dispositions. The recorded elaboration and dependency outcomes above are unchanged; neither check was rerun for this report-only formatting repair. Neither check leaves a running process.

## Changes and maintainer consequences

Only this report is added. `README.md`, `Suggested.lean`, `metadata.toml`, `sources.toml` and all of `design/plan.json` remain unchanged. No target, Lean name, downstream label, supplier or source key changes. `GanGrossPrasadUnitaryGroups:GGP.8` keeps its complete hypotheses. The existing successor-ownership question remains for a human, as both reviews already record; it is not re-raised for another agent decision. No commit or external write was made.

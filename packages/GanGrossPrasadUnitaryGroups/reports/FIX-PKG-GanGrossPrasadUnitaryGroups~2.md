# Repair report: GanGrossPrasadUnitaryGroups

## F01 (P1) — applied

Unconditional multiplicity preservation → two named seesaw equivalences retaining both companion-lift conditions. Added the integrated equal-rank form, its epsilon criterion, signatures, splittings and three Checks; §3.9 now uses the joint induction including vanishing branches. The compact standard-representation/weight-1 tensor has weights 2,1, hence multiplicity 0. Evidence: xue-real line 984, line 1025, line 1098, line 1180.

## F02 (P2) — applied

Repeated analytic prerequisite → imports of the existing §AL.3 targets and five named APIs. Restricted gap:local-rankin-selberg to differential/quotient Haar comparison in both authorized files; specified c_n, the s+1/2 shift and a/b rescaling. Updated all four consumers. Evidence: AutomorphicLFunctionsAndLocalFactors revision 691b4b3310d3, §AL.3; zhang-period line 489, line 511, line 962, line 984.

## F03 (P3) — applied

Repeated zero-coordinate Check → the rational frame (2,1), of norm 2. Extended the first existing proved example, retaining two examples for `splitLineFrame` and the theorem’s all-field scope. The product-unit criterion accepts this vector; a norm-one predicate rejects it. Evidence: Mathlib `Prod.isUnit_iff`, `Mathlib/Algebra/Group/Prod.lean:615`.

## F04 (P3) — applied

Unproved two-generator Check → a direct proved calculation for the additive homomorphism χ(x)=x(0)+x(1). Extended the second existing `componentCentralElement` example: χ(e₀)=χ(e₁)=1 and χ(z)=0 for multiplicities (1,1). The proof uses no admitted theorem and retains two examples for this definition.

## Validation

- Required `lake env lean` elaboration of `packages/GanGrossPrasadUnitaryGroups/Suggested.lean`, from the content checkout: exit 0. Exactly five diagnostics, all `declaration uses sorry`, at lines 25, 74, 121, 164 and 187. No errors or other warnings. Its only import is `Mathlib`; no Tau Ceti object build was needed.
- Separate scratch elaboration with `#check @name` for all eleven named declarations: exit 0, the same five admitted-target warnings. The elaborated types retain the explicit field, group, module, finite-type and inner-product hypotheses. No ambient section variables can disappear. Both new computations are proved.
- Prescribed dependency check: exit 0; exact output:

```text
depcheck: 8 roadmaps, 57 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

- `git diff --check`: exit 0, no output.
- Parsed both manifests and the design JSON. The only changed top-level design key is `gaps`, and its only changed member is `local-rankin-selberg`. All 36 gap slugs match the README supplier contracts and retain named suppliers, sections and needs. Nothing outside the permitted package files and this report was changed in the board.
- `Suggested.lean` contains six real-bodied definitions/abbreviations, five admitted theorem signatures and twelve proved examples, with two examples per definition. All eleven named declarations appear in the README. No admitted data, admitted example, option override or additional import was introduced.
- All sixteen certified source texts are available. The settled `xue-bessel` waiver is unchanged. No additional source or missing-reference request was needed. The revised source locators were checked in the legal cached copies; the dense oscillator formulas were also inspected in the published-page images.

## Adversarial mathematics pass

Each numbered row includes the subsection’s defining formulas, hypotheses and subordinate API assertions. “Consistent” means the listed boundary calculations and hypotheses expose no further defect; it is not a proof of the planned analytic theory. Supplier prerequisites remain prerequisites.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: fields, forms, rank and coefficients | Zero ring; inseparable quadratic algebra; split algebra; characteristic 2; zero module | Field/étale hypotheses reject the first two; split ranks remain E-ranks. Hermitian theory assumes characteristic different from 2, while the light split predicate permits every field. | None |
| Conventions: translations, pairings, modulus and factors | Character value i; B(i,1), B(1,i); upper GL₂ at diag(a,1); degrees 1,2; geometric versus arithmetic Frobenius | Values i, i, −i and modulus abs(a) agree; Asai signs in degree 1 are + for distinction and − for adjoint; Frobenius inversion inverts eigenvalues. | None |
| Conventions: measures and denominators | Pairing multiplied by 2; local Haar factors 2 and 1/2; global Haar factor 2; zero vector; zero central value | Local pairing scales cancel, product-one Haar changes cancel, squared global period scales by 4. Vector and local-factor denominators have explicit nonvanishing premises. | None |
| §1.1 relevance and framed API | W=0 and a line; H plus a line; positive definite rank 3; split idempotent; identity and composite isometries | Ranks 1 and 3 agree; definite rank 3 fails relevance for r=1; a nonzero split idempotent fails the basis condition. | F03 adds norm-two frame control |
| §1.2 subgroup, linear form and character API | r=0; two simple coordinates; split GL₃; product of two unipotents | Empty flag gives diagonal U(W); simple-root coordinates add; the split example retains x and −y. | None |
| §1.3 transport API | Identity; composite frame changes; simultaneous negation; character changed with or without its coordinates | Transport respects composition; both line signs occur; character equality requires the specified transport. | None |
| §2.1 models, multiplicity and currying API | Trivial subgroup; weights (1,−1) and (1,1); dense algebraic tensor at infinity | Dimensions 1 and 0 distinguish the dual convention; continuity is needed on completed tensors. Natural-number multiplicity follows finite-dimensionality. | None |
| §2.2 distribution symmetry API | Rank-one norm-one element; upper GL₂ unipotent; product of noncommuting matrices | Conjugated inversion is identity in rank 1; transpose reverses multiplication. Identity is not an anti-involution in the noncommutative example. | None |
| §2.3 adjacent bound | U(0) inside U(1); ramified extension over Q₂; split real GL₂ | Rank-zero multiplicity is 1; no temperedness, compactness or odd-prime restriction is used. | None |
| §2.4 finite-place reduction API | r=1; isotropic W; forbidden support present or absent; normalized versus unnormalized induction | Auxiliary GL₂ and rank-two Y are required; residual W need not be anisotropic. Exclusion and irreducibility are supplied premises, not conclusions silently assumed. | None |
| §2.5 archimedean injection API | S=0, one and two dimensions; pole of induction; opposite line sign | A finite basis admits a common half-plane; the parameter depends on S and avoids reducibility. No injection at arbitrary parameters is asserted. | None |
| §2.6 general bound | W=0; r=0 and r=1; compact incompatible weights; residue 2,3 | Uniqueness permits multiplicity 0. Any two-dimensional model subspace contradicts the adjacent bound. | None |
| §2.7 integrability | Compact subgroup of mass a; noncompact split subgroup; two trivial non-tempered factors | Inverse compact weights give integral a; the trivial split example diverges and is excluded by temperedness. Fixed logarithmic powers preserve the strict decay estimate. | None |
| §3.1 epsilon-character API | Empty parameter; characters χ₁,χ₋₁; a constituent repeated twice; two component generators | Epsilon 1 for the zero tensor; opposite generator factors multiply to −1; even multiplicity gives zero central coordinate without deleting its generator. | F04 supplies the missing direct character Check |
| §3.2 enhancement transport | Norm t; nonnorm t in dimensions (2,1); two successive sign changes | Norms act trivially; the even-side one-dimensional generator changes by −1; applying the change twice cancels. | None |
| §3.3 tempered relative form API | H=1 of mass a; compact weights with sum 0 or nonzero; r>0; reducible normalized induction | Values aB and zero agree. Higher codimension uses regularization; nonvanishing comparison concerns the full induction, not an arbitrary constituent. | None |
| §3.4 geometric multiplicity API | x=1; x=−1 on a complex line; zero quasi-character; compact U(2) centralizer with no regular nilpotent orbit | Empty moving determinant is 1; the line value is 4; empty orbit set contributes zero without division. Full H discriminant is retained. | None |
| §3.5 local trace identities | W=0; indefinite real group; strongly cuspidal test; proper-Levi induction | Whittaker germ, Schwartz restriction and GL germ coefficient are retained; no unregularized noncompact trace is asserted. | None |
| §3.6 packet Fourier identity | Order-two component group; inner-form invariant equal or opposite to epsilon | Factor (1+με)/2 is 1 or 0; inversion selects the indicated enhancement with central restrictions. | None |
| §3.7 nonarchimedean packet theorem | W=0; wrong enhancement; ramified dyadic field | The fixed complement selects the rank-zero inner form; wrong enhancements have multiplicity 0. Actual enhanced LLC remains a prerequisite. | None |
| §3.8 first seesaw | σ′=0 versus nonzero; arbitrary target signature; compact weights 2,1 | A zero companion lift forces L=0; signature selection cannot be dropped. Compact input has m=0 and disproves unconditional preservation. | F01: conditional identity and negative Check |
| §3.8 second seesaw and induction | σ₀=0; counts (2,1); b≥2 induction; base sum 1 | Nonzero branches give intermediate (1,1), then lower ordered pair (1,0); sum decreases by 2. Zero branches fail the transported epsilon condition. | F01: full equivalence and both branches |
| §3.8 auxiliary form and its API | U(0), mass 1; occurring U(1) oscillator weight k; π′ weight k+1; multiplication of either argument by i | Values 1 and 0 distinguish invariance; first/second scaling gives i and −i. The conjugate oscillator agrees with xue-real line 861; epsilon criterion with μ⁻¹ and conjugate ψ_C agrees with line 873. | F01: named definition, continuity and epsilon targets, three Checks |
| §3.9 real packet theorem | Compact interlacing and failure; opposite line sign; W=0; higher odd codimension | Endpoint remains all relevant ranks and both signs. The repaired induction proves the enhancement equivalence, not universal nonvanishing. | F01: proof dependency repaired |
| §3.10 split prediction API | GL₁×GL₀; adjacent GL₂×GL₁; regular unitary GL₃ principal series | Whittaker model is one-dimensional; trivial unipotent character instead gives six ordinary Jacquet pieces. Infinite higher codimension remains a prediction. | None |
| §3.11 split generic theorem | GL₂×GL₁ at finite and infinite places; GL₄×GL₁ at a finite place; n=0 | Existing normalized local functional is nonzero; positive measure conversion preserves this. Rank zero is the elementary scalar case. No general infinite higher-codimension proof is asserted. | F02: import existing analytic targets |
| §4.1 global period API | r=0; ν(h)=i; character nontrivial on rational points | Empty unipotent factor has mass 1; right translation gives i; nonrational character cannot descend to the quotient. | None |
| §4.2 local obstruction and factorization | One zero local model; two local values 2 and 3; reference rescaled by c | Zero obstruction holds; product is 6; reference scalar and normalized functional change reciprocally. No converse from local models alone. | None |
| §4.3 tensor L-representation API | Smaller rank 0; ranks (2,1); split place | Tensor zero gives L=1; induced dimension is 4, and split local factor has both conjugate-dual terms. Induction uses the finite-Galois index-two subgroup. | None |
| §4.4 fixed-pair conjecture API | W=0; all local models present but central value zero; isometric pair | Definition retains the central-value condition; only the local obstruction implication is proved independently. | None |
| §5.1 normalizer API | n=1; split finite place; global central zero; archimedean gamma factors | Δ₂ has signs η then 1; local denominators require factorwise regularity. Global central zero is permitted and never inverted. | None |
| §5.1a split integral identity API | GL₂×GL₁; raw Haar rescaled by a; pairing rescaled by b; normalized test value 1 | Raw diagonal value is ab times the squared nonzero central local factor. Measures are the differential measures, not implicitly volume-one measures. | F02: existing tests plus explicit conversion |
| §5.2 local normalized form API | x=0; x multiplied by nonzero c; compact inverse weights; continuous and discontinuous forms on completed tensor | q excludes 0, is scale invariant, and equality extends from pure tensors only with continuity at infinity. | None |
| §5.3 spherical theorem | Haar doubled; nonspherical Q₂ datum; split q=2 with eigenvalues 1,−1; nonsplit q=2 and compact U(1) | Volume is retained; nonspherical inputs are excluded. Split control gives C=3 and normalized value 1; nonsplit compact control gives C=1. | F02: supplier spherical value converted to differential volume |
| §5.4 rescaling API | Pairing factor 2; Haar factors 2,1/2; global Haar factor 2 | Pairing cancels, local Haar product cancels, squared global period scales by 4. | None |
| §5.5 product API | All spherical; one zero factor; good place of volume 2 moved into S | Product is a finite modification of a nonzero volume tail; a zero factor yields zero and is never inverted. | None |
| §6.1 Whittaker periods API | n=1 Asai signs; zero vector; central value zero; endoscopic constituent counts | Distinction signs are + then −; λ vanishes with the central value, while the other functional and norm remain defined. | F02: analytic imports and measure comparison separated |
| §6.2 relative characters API | One-dimensional basis; zero period; basis rescaled; hyperspecial projector | Numerator/norm scaling cancels; zero period gives zero character. Local smoothing identity has the factor C_v and the actual H Haar. | None |
| §6.3 star-generic contribution | Counts (1,1),(2,1); repeated constituent; full split centre | Coefficients are 1/4 and 1/8; repetitions are outside the hypotheses. Centre is included in dim a_P. | None |
| §6.4 isolated comparison API | Transfer zero on other forms; three constituents; enlargement of S; archimedean density | Full base-change class remains in the sum; coefficient 1/8 and source measure factors persist. Dense infinite transfer is not asserted surjective. | None |
| §6.5 Euler identity | One zero local model; nontrivial local comparison constants with product 1; three constituents | Both sides vanish without dividing by a character; only the product of constants cancels; inverse order is 1/8. | None |
| §7.1 adjacent nonvanishing | n=1; prescribed wrong inner form; several distinct constituents; nontempered parameter | The conclusion is existential in h; no auxiliary supercuspidal or tempered premise is inserted. | None |
| §7.2 stable specialization | One constituent per degree; n=1 boundary; bad local places | Total count 2; n>1 belongs to this source formulation and does not restrict §7.1. | None |
| §7.3 refined proposition API | Counts (1,1),(2,1); zero vector; vanishing mixed pairing | Coefficients 1/4,1/8; positive vector norms are the only vector denominators; polarization clears denominators first. | None |
| §7.4 GGP.8 API | Endoscopic counts; central zero; vector/pairing scaling; product-one local Haar changes | RHS is defined at central zero and forces zero period; coefficient and scaling agree. The refined proposition’s truth is not a hypothesis. | None |
| `splitLineFrame`, its theorem and examples | (1,1), (1,0), rational (2,1); field of characteristic 2 | Unit membership is equivalent to both coordinates nonzero over every field. A norm-one substitute fails (2,1). | F03; direct Lean proof passes |
| `linearFirstPairing` and examples | i,1; first/second scalar multiplication; zero space | Values and conjugation agree with the README; completeness and finite dimension are unnecessary. | None |
| `algebraicBesselModel`, covariance theorem and examples | Scalar multiplication intertwiner; trivial second factor; fixed tensor with target −1 | Covariance uses ν, not ν⁻¹; the latter tensor is annihilated. Native intertwiner and tensor carriers suffice. | None |
| `componentCentralElement`, character theorem and examples | Empty index; multiplicity 2; two multiplicity-one generators with coordinate-sum character | Coordinates count multiplicities modulo 2. χ(e₀)=χ(e₁)=1, χ(z)=0 follows directly from 1+1=0. | F04; direct Lean proof passes |
| `unitaryConstituentSigns`, cardinality theorem and examples | Empty pair; counts (1,1),(2,1) | Orders 1,4,8; no diagonal quotient. Finite binders remain in the elaborated theorem. | None |
| `unitaryConstituentCoefficient`, formula and examples | Empty pair; counts (1,1),(2,1) | Values 1,1/4,1/8; denominator is nonzero because the group contains its identity. | None |
| Residual Rankin–Selberg measure contract | κ=1, q=2, n=1,2; GL Haar doubled versus N Haar doubled; ramified ψ | Volumes 1/2 and 3/8; quotient factors 2 and 1/2. General c_n includes κ^(n²); the same self-dual N measure cancels in the comparison. | F02; three normalization Checks |

## Ownership, source and pin audit

The object search used the pinned `Representation.IntertwiningMap`, its covariance API, `Representation.tprod`, `Prod.isUnit_iff`, `Nat.card_sum`, `Nat.card_fun`, the sesquilinear/orthogonal carriers and `TauCeti.HopfAlgebra.pointsFunctor`. These remain imports or light specializations; no generic carrier was replanned. The pins agree with `lake-manifest.json`: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

The main-branch shape comparison read `TauCetiRoadmap/ReductiveGroups/README.md`, `TauCetiRoadmap/GlobalNumberFields/README.md` and `Completed/RestrictedProducts/README.md`. Read-only object searches at the seven supplied open-roadmap revisions found no competing owner of these Bessel, component-character or Rankin–Selberg interfaces:

| Roadmap | Inspected revision | Relevant result |
| --- | --- | --- |
| QSeriesPartitionsAndMockModularForms | 8fe91e090529 | Its general oscillator/theta references point to MetaplecticAutomorphicForms; no duplicate real Bessel seesaw target. |
| K3SurfacesAndSymplecticBoundedness | b82cbb70e859 | No overlapping object. |
| CohomologyComparisonsPartII | dd8d7e6fda75 | No overlapping object. |
| ColemanIntegrationPartII | bd972d91ed7d | No overlapping object. |
| QWittVectors | 4605fbb0a2d9 | No overlapping object. |
| ErdosProgressionPowers | 72b615703f7f | Its Bessel inequality is the inner-product inequality, unrelated to Bessel models. |
| ArithmeticDynamics | 85e78c07dcc3 | No overlapping object. |

The remaining supplier contracts were checked as prerequisites, including zero rank, split coefficients, all permitted residue characteristics, actual representations and enhancements, and the specified continuous topologies. No new gap or change of supplier direction is needed. The corrected Rankin–Selberg contract consumes the existing earlier owner’s targets; it does not ask that owner to prove them twice. The source evidence for F01 preserves each nonzero condition rather than replacing the source by a weaker endpoint. The general dyadic spherical extension remains an owned target, not a theorem certified by Harris’s odd-residue statement.

## Maintainer notes

No public Lean declaration was added, deleted or renamed, and no Lean theorem signature changed. The six new README API names are `realSeesawForm`, `realSeesawForm_sesquilinear`, `realSeesawForm_continuous`, `realSeesawForm_epsilon`, `besselRealThetaReduction_firstSeesaw` and `besselRealThetaReduction_secondSeesaw`; their analytic carriers remain README targets. `besselRealThetaReduction` now has conditional semantics. `besselTemperedPacket_real` and the GGP.8 export retain their endpoints.

The existing slug gap:local-rankin-selberg is retained with its narrower measure-comparison meaning. Existing design references to this slug therefore continue to resolve. No supplier roadmap, merge order, tooling or pull-request text was edited; no later-roadmap ownership move, commit or network write was made. Supplier implementations remain outstanding where already declared as gaps; this repair does not certify them as existing library declarations.

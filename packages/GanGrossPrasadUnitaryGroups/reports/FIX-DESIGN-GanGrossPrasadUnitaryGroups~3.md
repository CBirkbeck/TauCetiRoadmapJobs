# GanGrossPrasadUnitaryGroups design repairs

Changes are confined to `packages/GanGrossPrasadUnitaryGroups/design/README.md`, `packages/GanGrossPrasadUnitaryGroups/design/plan.json`, the source manifest's usage labels, and this report. The mathematical target catalogue retains its 40 targets and seven layers.

## F01 (P2) — applied

Nonzero line vector → E-basis vector, equivalently unit norm. The constructor, frame extensionality, isometry transport and character hypotheses retain this requirement. Added the split idempotent negative control and computed both character coordinates for the valid generator. Evidence: ggp line 1567–1569 and ggp line 1624–1634; for e=(s,t), its norm is st, a unit exactly when e generates E.

## F02 (P2) — applied

Unrestricted completed-tensor extensionality → equality of two jointly continuous forms on every pair of pure tensors. The finite-place algebraic statement remains unrestricted. Added density and discontinuous-functional Checks, and the direct globalization dependency. Evidence: bp-arch line 6797–6801 and bp-arch line 6820–6825. Linearity extends equality to the algebraic tensor square; continuity extends it to the completion.

## F03 (P2) — applied

One compound L-factor gap → six contracts separating identities, local regularity, global values, local Rankin–Selberg continuation, Whittaker Fourier analysis, and global mirabolic/norm theory. Every intake sentence states its field, representations, arguments and conclusion; consumers, summaries and layer dependencies match. Evidence: zhang-period line 656–678, zhang-period line 962–986, and bpcz line 4132–4154. C_v and the split relative identity retain their owners here.

## F04 (P2) — applied differently

The local trace API now depends on §§2.7 and 5.2, specifies tests and both Haar measures, and proves interchange using a summable smoothing expansion and the relative Ξ bound. The global nuclear clause does not provide this local statement; registered `gap:local-smoothing-trace` with AutomorphicSpectralTheory. Evidence: bp-arch line 6780–6801, bp-arch line 6827–6833, and bpcz line 4873–4888.

## F05 (P3) — applied

Corrected JSZ's inducing-family locator, added AGRS's split theorem, separated the Γ measure and Δ identity locators, and moved Zhang's measure change to p. 29 while retaining the introductory warning. Plan locators match. Evidence: jsz-bessel line 207–216; agrs line 35–40; bp-arch line 10054–10078 and bp-arch line 10204–10208; zhang-period line 1437–1440. Source versions and manifest locators remain unchanged.

## F06 (P3) — applied

Arbitrary character arithmetic → actual C/R parameters χ₁⊕χ₋₁ and χ₁⊕χ₁, with the specified additive-character sign. Proof-status Check → the explicit GL₄/GL₁ subgroup and character exp(i(x-y)); scope retains the conjectural archimedean range. Evidence: ggp line 598–601, ggp line 728–737, and ggp line 1624–1639. These Checks detect the constant-character and missing-coordinate errors.

## F07 (P3) — applied

Board/import-eligibility narration → ownership by the AutomorphicSpectralTheory Part II multiplier continuation, §§SM.0–SM.5. The existing `gap:spectral-isolation`, base supplier and required preceding placement remain explicit. The continuation's multiplier and isolation interfaces were read without importing it as an eligible supplier or changing merge order.

## F08 (P2) — applied

Global good-place theorem → local spherical theorem for every characteristic-zero nonarchimedean field, including p=2, with an almost-everywhere global corollary. Split Whittaker evaluation and nonsplit dyadic relative Cartan specialization have separate proof explanations. Added split and nonsplit Q₂ Checks and ramified nonspherical data. Harris's odd-residue intermediate remains accurately delimited: harris line 170–181 and harris line 1289–1294; split evaluation: zhang-period line 982–986.

## Mathematical verification

The following is a mathematical boundary pass, not a claim of Lean elaboration. Each row includes the target's definitions, hypotheses, API identities and conventions. Characteristic-zero analytic fields include residue characteristics 2 and 3; the algebraic field and quadratic-étale assumptions exclude the zero ring and inseparable quadratic algebras.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions and normalizations | Hyperbolic basis; split rank-one group; B(i,1); ν(h)=i; upper GL₂ modulus; two Frobenius eigenvalues; constituent counts (1,1),(2,1) | Norms 0, mutual pairing 1; split U(1)=F×; linear-first value i; period transforms by i; δ=\|a\|; geometric Frobenius has norm q⁻¹; constants 1/4,1/8. Haar and vector scales have the stated powers. | No change. |
| 1.1 RelevantHermitianPair | W=0,r=0; H⊕<1>; positive definite real rank 3; split e=(1,0),(1,1) | Ranks 1 and 3; only indefinite relevant rank-3 complements; split idempotent has norm 0 and is not a basis vector. | F01. |
| 1.2 besselDatum | Empty flag; two coordinates; split GL₃ upper unipotent | r=0 gives diagonal H; b adds the coordinates; valid split b=(x,-y), invalid idempotent b=(x,0). Both simple characters are needed. | F01. |
| 1.3 besselTransport | Identity; composition; h→-h; line generator under an isometry | Group equations agree for h and -h; the line sign changes; isometries preserve the basis-vector condition and transport the character. Freezing changed character data does not give literal equality. | F01 hypotheses. |
| 2.1 besselModel | H=1; U(1) weights (1,-1),(1,1); algebraic versus continuous tensor functionals | Dimensions 1 and 0 as stated; currying requires the smooth dual. Density applies only within the continuous carrier at infinity. | No change. |
| 2.2 distribution symmetry | U(1); split GL₂ unipotent; product of two noncommuting matrices | Conjugate inverse fixes norm-one scalars; transpose reverses multiplication; identity is not an anti-automorphism in rank 2. | F05 split locator. |
| 2.3 adjacent multiplicity | U(0)⊂U(1); compact inverse and equal weights; split real and dyadic fields | Bound includes zero smaller rank and noncompact groups; dimension can be 0. No temperedness is imposed. | No change. |
| 2.4 nonarchimedean reduction | r=1; W hyperbolic; an excluded Bernstein component; normalized versus ordinary induction | Auxiliary rank is 2; Y has rank 2 while W′ has Witt index 3. The support exclusion and induction normalization are essential. | No change. |
| 2.5 archimedean injection | S of dimension 0,1,2; split two-parameter family; parameter outside the common half-plane | A finite basis gives common estimates; a measure-zero reducibility locus cannot fill the componentwise half-plane. No injection for every parameter is claimed. | F05 supplier locator. |
| 2.6 multiplicity one | Whittaker case W=0; both real line signs; compact incompatible weights | Uniqueness gives ≤1, including dimension 0; transport handles the opposite complement sign. | No change. |
| 2.7 tempered integral | H=1; compact U(1); split noncompact H; trivial GL₂×GL₁ pair | Compact values retain Haar mass; the noncompact trivial pair diverges and is not tempered on GL₂. The relative Ξ bound, rather than compactness, justifies convergence. | F04 adds its consumer. |
| 3.1 epsilon character | Empty smaller parameter; χ₁⊕χ₋₁ against 1; χ₁⊕χ₁ against 1 | Empty tensor has epsilon 1. Duality gives product -1 in the first real example; multiplicity two gives generator -1 but central value +1 in the second. | F06. |
| 3.2 enhancement transport | Norm-class t; nonnorm t; t=-1 over R; two successive changes | Norm changes are trivial. The odd-dimensional tensor summand changes sign under a nonnorm; two changes cancel. Labels and forms must be transported together. | F03 dependency only. |
| 3.3 tempered relative form | H=1 with mass a; compact paired/unpaired characters; r>0 | Values aB, 1 and 0 after unit Haar normalization; higher-codimension integrals require the stated regularized extension. No absolute Haar convergence is inferred there. | No change. |
| 3.4 geometric multiplicity | Identity; x=-1 on a complex line; zero quasi-character; compact U(2)×U(1) | Moving determinant 1 at identity, norm determinant 4 at -1; zero input gives 0; empty regular-nilpotent set gives c_θ=0. Γ's identity atom has mass 1. | F05 measure/Δ locators. |
| 3.5 local trace formula | Rank-zero W; real noncompact pair; normalized induction | No positive-rank torus is forced. Regularized kernels are retained; the induced GL contribution is c_(θ_GL)(1), not an arbitrary constituent coefficient. | No change. |
| 3.6 packet Fourier identity | μ=-ε; μ=ε at (0,0); A=Z/2 | Fourier values 0 and 1 as appropriate; (1,-1) inverts to the nontrivial enhancement, with the finite-group normalization. | No change. |
| 3.7 nonarchimedean packet theorem | W=0; wrong enhancement; ramified Q₂ and Q₃ | Fixed complement and central restrictions select the appropriate inner forms; another enhancement has multiplicity 0. No residue-characteristic restriction occurs. | No change. |
| 3.8 real theta reduction | a+b=1; (a,b)=(2,1); extra paired summands | Count is odd, decreases by 2, and reaches the base count. Paired summands do not force low total rank. No irreducibility of the big lift is assumed. | No change. |
| 3.9 real packet theorem | Compact U(2)↓U(1); both complement signs; W=0,r=0 | Dual weights 1 and -1 respectively pass and fail interlacing; complement negation transports labels; a rank-one character has a one-dimensional model. | No change. |
| 3.10 split prediction | GL₁/GL₀; adjacent GL₂/GL₁; generic GL₃ principal series with ν or 1 | Generic Whittaker dimension is 1, while the trivial-unipotent-character dimension is 6 by the six Weyl filtration pieces. The larger archimedean assertion remains a proposition. | No change. |
| 3.11 split generic theorem | Adjacent all-place pair; finite r=1; real GL₄/GL₁ subgroup | Explicit N has coordinates a,x,z,b,y and b(u)=(x,-y); the W-action fixes x,y. This computation asserts no higher-codimension archimedean existence theorem. | F06. |
| 4.1 global period | Empty N; rational versus nonrational character; ν(h)=i | Rational triviality permits descent; ν⁻¹ in the integral gives the correct right-translation factor ν. Unipotent quotient mass and continuous cuspidal estimates are retained. | No change. |
| 4.2 local obstruction | Zero local model; reference vector with nonzero period; modifications of values 2,3 | Zero local model forces global vanishing. Factorization multiplies values by 6; changing a reference scalar rescales the normalized functional reciprocally. No division by a zero period. | No change. |
| 4.3 tensor L-representation | Smaller rank 0; ranks (2,1); split local algebra | Representation dimensions 0 and 4; zero tensor factor has L=1; split factors retain both conjugate terms, giving absolute square at the unitary center. | F03 identity contract. |
| 4.4 fixed-pair proposition | W=0; zero central value; fixed form with missing local model | Whittaker rather than empty period condition at W=0; local models alone do not imply global nonvanishing; the specified inner form is retained. | F03 global regularity contract. |
| 5.1 normalizers | n=1; split q=2; ramified and archimedean local factors; global central zero | Δ₂ uses η then 1; local individual factors are regular nonzero; global central zero gives C=0 while the adjoint denominator stays nonzero. | F03 separates the inputs; quotient remains here. |
| 5.1a split Whittaker identity | n=1; normalized RS vector; λ-kernel; Haar factor 2 | Raw values ab\|L(1/2)\|² and 0; doubling Haar doubles the integral. Abstract Hom nonvanishing alone does not establish the identity. | F03 contracts, F05 locator. |
| 5.2 normalized local form | Zero vector; c times a vector; compact mass a; discontinuous form on a completion | α(0,0)=0; q excludes zero; q(cx)=q(x); compact value a/C. Algebraic density does not determine a discontinuous comparison form. | F02. |
| 5.3 spherical evaluation | Split Q₂ Satake values 1,-1; nonsplit unramified Q₂ rank 1; St×ramified character; doubled Haar | Split C=3 and raw integral 1+2Σ2^(-m)=3; nonsplit compact H gives raw integral 1 and C=1. Ramified data have zero hyperspecial-fixed space. Haar rescaling doubles the spherical ratio. | F08. |
| 5.4 rescaling | Pairing doubled; Haar factors 2,1/2; global H Haar doubled | q is pairing-independent; product-one local Haar changes cancel; a global H measure change multiplies squared periods by 4 and is outside the fixed Tamagawa datum. | No change. |
| 5.5 all-place product | Enlarge exceptional set; one zero local factor; volume 2 moved into the finite part | Product is coherent under enlargement and permits zero. Its definition uses the nonzero volume tail, not convergence of a central Euler product. | No change. |
| 6.1 global Whittaker periods | n=1 Asai signs; zero vector; vanishing central value; multiple constituents | Signs are + and -; λ,β vanish on zero; λ may vanish identically with central value 0. Mirabolic/norm leading coefficients keep the constituent pole orders. | F03. |
| 6.2 relative characters | Basis scalar c; convolution square; zero period; local hyperspecial projector | Norm cancels the squared absolute scalar; J is positive on convolution squares and vanishes with P. The local projector gives J=Cα; smoothing summability plus §2.7 justifies the H-integral. | F04. |
| 6.3 star-generic contribution | Counts (1,1),(2,1); irrelevant datum; full split center | Coefficients 1/4,1/8; irrelevant contribution zero. Quotienting out the split center would change the exponent incorrectly. | No change. |
| 6.4 isolated comparison | No auxiliary supercuspidal; one prescribed inner-form support; archimedean dense transfer | The whole base-change class is retained. Detection uses both transfer directions and continuity; the multiplier ownership/placement requirement remains a gap. | F07 wording only. |
| 6.5 relative-character Euler identity | Missing local model; nontrivial κ_v with product 1; counts (2,1) | Zero local/global relative characters cause no division; κ_v need not individually equal 1; coefficient is 1/8. | F03 factor comparison contract. |
| 7.1 global nonvanishing | n=1; endoscopic data; prescribed form without model | Existential inner form is essential; no fixed-form conclusion or temperedness assumption is introduced. | No change. |
| 7.2 stable specialization | n=1 boundary; single constituents; opposite Asai signs | Source range n>1 is preserved; n=1 has the separate §7.1 theorem. Opposite-parity regularity uses the correct ambient degree. | F03 global-value contract. |
| 7.3 refined proposition | Counts (1,1),(2,1); zero vector; zero mixed pairing | Constants 1/4,1/8; vector quotient excludes 0; factorwise polarization is denominator-cleared and does not divide by mixed pairings. | No change. |
| 7.4 GGP.8 | Vector and pairing scales; product-one Haar changes; central zero; endoscopy | All factors remain defined; central zero forces every period to vanish; the variable component coefficient and all-place product are retained. The proposition's truth is not assumed. | No change. |

For the nonsplit dyadic extension in §5.3, the required relative Cartan comparison is owned here. The general spherical supplier supplies group formulas at all residue sizes. The proof must identify the relative expansion uniformly using integral trace surjectivity and the unitary reductive-quotient factors, establish the rational identity from the odd-residue calculation, and specialize at q=2. The roadmap does not attribute that strengthened theorem to Harris or treat the almost-everywhere assertion as its proof.

## Supplier, pin and source checks

Read the main roadmaps `TauCetiRoadmap/ReductiveGroups/README.md`, `TauCetiRoadmap/GlobalNumberFields/README.md` and `Completed/RestrictedProducts/README.md` for shape and ownership. Their relevant contracts remain parabolics/Levi decompositions, arithmetic adeles, and generic restricted products respectively. None provides Tamagawa quotient measures or the local relative trace bridge.

Read the scope passages and searched the seven supplied open-roadmap copies: QSeriesPartitionsAndMockModularForms, K3SurfacesAndSymplecticBoundedness, CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics. Their relevant mentions supply no duplicate Bessel model, epsilon selection, local relative integral or period identity. The AutomorphicSpectralTheory Part II §SM.3/relative-characters statement concerns induced automorphic spaces; it cannot discharge the new local operator clause. Its §§SM.0–SM.5 multiplier continuation remains the owner of spectral isolation.

The manifest pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Object searches and declaration reads confirmed the existing APIs in:

- `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean`: `LinearMap.Nondegenerate`.
- `Mathlib/LinearAlgebra/SesquilinearForm/Orthogonal.lean`: `Submodule.orthogonalBilin`, `Submodule.mem_orthogonalBilin`.
- `Mathlib/RepresentationTheory/Basic.lean`: `Representation.tprod`, `Representation.tprod_apply`, `Representation.dual`.
- `Mathlib/RepresentationTheory/Intertwining.lean`: `Representation.IntertwiningMap` and its extensionality/equivariance fields.
- `Mathlib/LinearAlgebra/UnitaryGroup.lean`: identity-form `Matrix.unitaryGroup`.
- `TauCeti/Algebra/AlgebraicGroup/PointsFunctor.lean`: `TauCeti.HopfAlgebra.pointsFunctor`.

These do not supply the missing continuous local representation, smoothing or arbitrary Hermitian-group carriers. No generic pinned object was recreated. Source evidence for the repairs was read from the supplied legal extractions. The manifest still has 16 certified sources and the settled xue-bessel waiver; no new reference or missing-text request was necessary. Only Zhang's `cited_for` labels changed, replacing the obsolete compound gap label. Source locators, versions, hashes and access provenance were preserved.

## Check outcomes

The dependency command specified in the brief, with candidate `packages/GanGrossPrasadUnitaryGroups/design/README.md` and order `merge-order/ORDER.txt`, exited **0** and produced exactly:

```text
candidate: GanGrossPrasadUnitaryGroups is not in the merge order yet; checked as if placed after ModularityAndLanglandsExtensions (the intake inserts it when its design is accepted)
depcheck: 8 roadmaps, 57 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

Structural validation exited **0**: JSON and TOML parse; 40 targets, 82 API entries, 130 Checks and 36 supplier gaps. README and plan agree on all modified statements and on hypotheses, locators, API/Check names and text, direct prerequisites, `neededBy` sets, contract sentences and layer gap dependencies. The comparison ignores Markdown backticks and six manually verified, unchanged equivalent formulations about Langlands packets. Every internal prerequisite points to an earlier target; there is no internal cycle. Every definition/construction retains at least three Checks. All seven layers retain Examples and Dependencies.

`git diff --check` exited **0**, with no output. Path/style checks found no machine paths, LaTeX delimiters or workflow labels in the design and manifest. No `Suggested.lean` exists in this design package; no Lean file was added or edited and no Lean command was run. Heavy headline carriers remain the explicit supplier work, so this report makes no elaboration claim.

## Maintainer consequences

No existing target name or downstream export changed. `GanGrossPrasadUnitaryGroups:GGP.8` retains its complete measure and local-factor contract. The new API name is `normalizedLocalBesselPeriod_spherical_ae`; new Check names are listed with their definitions in the README and plan.

`gap:l-factors` is replaced by `gap:factor-epsilon-identities`, `gap:tempered-local-regularity`, `gap:hermitian-global-values`, `gap:local-rankin-selberg`, `gap:whittaker-pairing-fourier` and `gap:global-mirabolic-norms`, all owned by AutomorphicLFunctionsAndLocalFactors. `gap:local-smoothing-trace` is owned by AutomorphicSpectralTheory. Their implementation requires work by those suppliers; this repair only declares precise contracts and does not invent their targets. The local-spherical contract now explicitly includes all residue characteristics. No ownership was moved from a later supplier; no other roadmap, tooling, merge-order entry or pull-request text was edited. No commit or network write was made.

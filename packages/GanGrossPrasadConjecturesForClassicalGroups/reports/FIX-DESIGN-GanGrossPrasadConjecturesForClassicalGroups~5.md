# Repair report

## F01 (P2) — applied

Broad missing-category contracts → imports from SmoothRepresentationsOfLocalGroups SR.0.1, SR.0.4, SR.0d.2, SR.2.1–SR.2.2, SR.3.1–SR.3.3 and SR.4, with residual cover/tensor, restriction-filtration and Ext/support contracts. Casselman–Wallach moves to AutomorphicFormsOnReductiveGroups §2.7 with AutomorphicSpectralTheory §0.49. Consumer prerequisites and gap `neededBy` lists agree.

Evidence: the supplier sections state smoothness, admissibility, duals, tensors, both induction functors, modulus, Jacquet functors and Bernstein components. SR.2.2 makes the square root a coefficient choice and fixes the positive half-modulus. Its reciprocity retains the distinction between closed and open subgroups. The remaining classical filtrations are those used in ggp §§15–16, ggp line 2158 and ggp line 2293.

## F02 (P2) — applied differently

Missing Heisenberg/Stone–von Neumann and seesaw contracts → direct section imports; both gaps disappear. Remaining oscillator, theta-asymptotic and P2 gaps are narrowed. Generic standard-module irreducibility moves to AutomorphicSpectralTheory; its theta comparison becomes `gap:standard-module-theta` on MetaplecticAutomorphicForms. The function-field theta extension remains explicit.

Evidence: MetaplecticAutomorphicForms §0.10 supplies the polarized coordinate change, so its comparison with the pinned Heisenberg group needs no extra supplier theorem. Sections 3.6–3.8 supply Howe/seesaw and §3.18 explicitly supplies nonzero tempered big-lift irreducibility. The remaining P2 enhancement uses gan-ichino line 306 and gan-ichino line 565.

The suggested narrowing would lose necessary domains: AutomorphicSpectralTheory §2.9 assumes a localization of a generic global Arthur parameter, whereas gan-ichino Proposition 9.1 allows arbitrary local generic parameters with positive exponents (gan-ichino line 2445–2460). Sections 4.5 and 5.1–5.2 of MetaplecticAutomorphicForms have number-field hypotheses. Those extensions therefore remain gaps. The theta residual retains the almost-equal-rank exclusions in gan-ichino line 2476–2489.

## F03 (P2) — applied differently

Missing classification/factor theories → named imports with residual normalization and domain comparisons. Local Whittaker lambda and its normalization move to AutomorphicLFunctionsAndLocalFactors AL.3 Central periods. The Eisenstein gap keeps regularized periods on induced realizations. General quadratic-number-field base change and general adjoint factors remain residual requirements.

Evidence: EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 states the classification and character identities, including conditional classification inputs, irrelevant empty packets and potentially reducible extended members. The residual STAB/TRANS contracts compare these objects with the source normalization; bp-arch line 11148–11184 includes empty sums and derives these laws from classification. The label comparison is fixed by bp-refined line 2891–2901.

The suggested repair is too broad in two places. The supplier's §§11.4,13.1,13.6 has CM/standard-pair hypotheses, whereas bpcz line 108–118 and bpcz line 148–151 requires the general quadratic-number-field and all-place domain. AL.2's adjoint theorem is a Maass specialization, not a general classical adjoint theorem. AL.1's displayed epsilon law is rank one, and AL.4 retains supplied ramified comparisons. Their general extensions remain explicit. AL.3's local Whittaker period does not itself construct the regularized Rankin–Selberg period on the induced Eisenstein realization of §8.1.

## F04 (P2) — applied

Broad adelic, cuspidal and analysis gaps → imports from the cited adelic, automorphic and spectral sections. Residuals now request function-field extensions, unitary convergence factors, genuine covers, Tamagawa pairing normalization, uniform center-quotient estimates and relative Schwartz traces. Consumers requiring only supplied ordinary number-field objects no longer depend on the corresponding extension gaps.

Evidence: AdelicAlgebraicGroups §§1.1–1.3,2.1–2.4 has number-field hypotheses; the residual measure identity is bpcz line 680–699. AutomorphicFormsOnReductiveGroups §§3.4–3.5,4.2 and AutomorphicSpectralTheory §0.50 retains nonzero/unit spherical references and a specified unitary occurrence. The center quotient is essential: a unitary character cannot decay along an unbounded split center. MetaplecticAutomorphicForms §5.2 supplies theta growth, not relative-period integrability.

## F05 (P2) — applied differently

Unowned Hermitian carrier → imported `SignedHermitianSpace` and adjoint from GeometryOfNumbersAndQuadraticArithmetic §2.9, with the split étale carrier imported from MetaplecticAutomorphicForms §3.2a. Relevance uses these objects. Add the computed argument-reversal Check; retain only general Witt operations and scheme/isometry comparison as gaps, importing RG2.0.1–RG2.0.2 for point topology.

Evidence: the carrier paragraph in GeometryOfNumbersAndQuadraticArithmetic §2.9 explicitly removes the local odd-residue-characteristic restriction from the carrier and adjoint. It still requires a field: F × F cannot instantiate it. MetaplecticAutomorphicForms §3.2a supplies that separate split case. On h(x,y) = conjugate(x)y, the convention B(x,y) = h(y,x) gives B(i,1) = i and B(1,i) = −i. RG2.0.2's total disconnectedness is confined to nonarchimedean fields.

## F06 (P3) — not actionable in this package: supplier ownership routing requires the maintainer

The second ownership claim is verified in `packages/AutomorphicSpectralTheoryPartII/design/README.md`, SM.5/global-isolation. Selecting one supplier or placing Part II in the merge order cannot be settled by an edit here. `gap:endoscopic-isolation` remains explicitly assigned to AutomorphicSpectralTheory §6.3, with the residual statement narrowed in F04 to the same normalized range theorem.

The contract now requires mu(chi) = 1 and range in finitely many spectral components indexed by cuspidal data in which chi occurs, without asserting an idempotent projection or that every surviving component consists of cusp forms. This is bplzz Theorem 3.19, bplzz line 1428–1440, and agrees with SM.5/global-isolation. The supplier gap is present both in the top-level plan and under Exact supplier contracts. No dependency on Part II was introduced. A maintainer must route that contract to one owner.

## F07 (P3) — applied

Local-only construction → algebraic `GGP.besselFunctional` in §2.1 and local `GGP.besselCharacter` in §2.1a. The algebraic map has coordinate, multiplication, invariance and arbitrary scalar-extension APIs with three Checks. Section 6.1 uses its adelization and a global quotient character; local consumers point to §2.1a. The source registry includes the new target and locators.

Evidence: ggp line 1624–1634 defines the coordinate homomorphism before character composition; ggp line 3078–3083 uses that algebraic map globally. Polynomial evaluation commutes with every F-algebra map. At r = 0 it is zero; on the two-coordinate quotient it is x1 + z; over F3(t), (t,1) maps to t + 1 in F3((t)). A global quotient character kills the rational diagonal of this value.

## Adversarial mathematics pass

The table audits the target statements and their associated APIs, Checks and standing conventions. It records mathematical boundary checks; it does not claim to implement the theorem proofs.

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| §1.1 relevance and form conventions | Zero spaces with both signs; anisotropic skew-Hermitian plane; h(i,1), h(1,i); F × F | Parity and isotropy both matter; swapped arguments give i, −i; split algebra is not a field | Import both carriers; add sign Check |
| §1.2 subgroup and embedding | Complement ranks 0,1; j(1,g), j(u,1); Gram matrix diag(1,4) | Diagonal versus first-coordinate embedding remains correct; transpose-inverse conversion preserves the chosen Gram equation | Supplier imports only |
| §1.3 relevant inner forms | Zero complement; real signatures (3,1), (1,3); split GL | Complement isometry, markings and pure twists remain essential | Narrow form gap |
| §1.4 split comparison | Rank 0,1; a with a² unequal to 1 | Action is (a,a⁻¹), using the conjugate dual | Import split carrier; update local-character locator |
| §2.1 algebraic functional | r = 0; (1,−1), (1,0); F3(t) → F3((t)); zero scalar algebra | Values 0,0,1 and t+1; base change preserves coordinates, including the trivial zero-algebra value | New algebraic map and three Checks |
| §2.1a local character | Empty flag; split nonunit residual vector and one-factor character | Empty flag gives 1; non-generating data lose a root coordinate | Retain local hypotheses and negative controls |
| §2.2 Heisenberg quotient | X = 0; W = 0; split idempotent functional; identity functional | Separate zero-X branch; unimodularity ensures surjectivity; commutator is 2 on the specified plane | Import Heisenberg theory |
| §2.3 oscillator restriction | Cover involution; equal rank; zero smaller space | Exactly one genuine ambient factor cancels the oscillator sign; equal rank retains the oscillator | Import cover/splitting theory |
| §2.4 model and dimension | Trivial group on C²; finite-dimensional comparison; infinite-dimensional Fréchet dual | Cardinal dimension prevents false finrank conclusions; continuous and algebraic duals remain distinct | Correct suppliers and §2.1a reference |
| §3.1 finite basic uniqueness | SO(1)/SO(0); Q2; required genuine factor | Bound is consistent in rank zero; no residue-prime exclusion | Import category sections |
| §3.2 archimedean uniqueness | n = p = q = 0; discontinuous algebraic functionals | One-dimensional center model; continuity cannot be discarded | Reassign globalization contract |
| §3.3 Bessel reduction | Absent forbidden Levi; representation in a forbidden block | Vacuous exclusion in the first case; no claimed comparison in the second | Narrow filtration/support gaps |
| §3.4 symplectic reduction | X = 0; genuine Levi twist | Zero-X reduction excluded; removing the genuine twist changes the Hom domain | Import general induction; keep mixed-model residual |
| §3.5 multiplicity assertion | Trivial group on C and C²; zero model | Irreducibility is necessary; assertion does not require every model nonzero | None |
| §3.6 SO reduction | Maximal isotropic components; SO(0); insufficient Witt index | Components remain separate; empty closed-stratum support is allowed | Bind general induction/Bernstein sections |
| §3.7 skew-unitary reduction | det = a; different smaller-space splitting; X = 0 | mu and mu⁻¹ cancel, leaving abs(a)^(1/2); incompatible splittings are rejected | Retain exact mixed-model residual |
| §3.8 higher uniqueness | Basic codimensions; SO(3)/SO(0); Q2 | Each reduction precedes the milestone; no auxiliary good-prime condition | Supplier bindings only |
| §4.1 component signs | M = 0; repeated irreducible line; hyperbolic nonselfdual pair | Components have orders 1,2,1; multiplicity does not duplicate generators | Bind parameter carriers |
| §4.2 conjugate root character | N = 0; two generators; odd/even nonnorm scaling | Values are 1, product of signs, and the stated parity factor | Keep higher-rank epsilon residual |
| §4.3 selfdual correction | Zero parameters; two symplectic parameters; M = 1 ⊕ sgn, N = 1 ⊕ 1 | Even-dimensional domain is necessary; determinant correction turns −1 into +1 | Supplier binding only |
| §4.4 selection character | Split component group; N a trivial line; mu eigenvalue u | Trivial split character; N ⊕ 1 has even dimension; twist is z/u | Narrow label comparison |
| §4.5 change of data | Identity change; nonnorm scaling; tensor values z,u | Identity maps; parity changes; reassociation gives zu | Import known factor/splitting laws |
| §4.6 local assertion | Singleton split family; two relevant forms; nongeneric parameter | Quantifies over the actual union; no fixed-form or nongeneric conclusion | Bind classification sections |
| §4.7 split selection | GL2 × GL1; archimedean higher codimension | Singleton enhancement; higher archimedean reduction is not asserted | Import category sections |
| §4.8 reduction implication | Basic pair; archimedean field | Family implication retains enhanced-induction hypotheses; no archimedean Bernstein argument | Narrow prerequisites |
| §5.1 tempered Bessel selection | Ramified Q2; both orders of odd/even dimensions; nonnorm change | Source's nu0 and label normalization remain explicit | Import classification; retain normalization comparison |
| §5.2 multiplicity of standard modules | Empty inducing blocks; unordered exponents | Identity on tempered remainders; ordering hypotheses remain | Import general induction |
| §5.3 generic Bessel selection | Local generic parameter outside global exponent bounds | Global-localization standard-module theorem is insufficient | Reassign and retain general local residual |
| §5.4 theta bridge | Zero lift; n = 0; split algebra | Zero lifts supply no Hom; supplier has separate rank-zero/split branches | Delete redundant seesaw gap |
| §5.5 generic Fourier–Jacobi selection | Wrong mu restriction; Q2; almost-equal-rank excluded blocks | Correct splitting and generic lifted parameter remain necessary | Separate standard-module theta gap |
| §5.6 tempered union uniqueness | Real signatures; complex split place; empty irrelevant family | Full relevant union is required; complex split case uses §4.7; empty sum is zero | Bind STAB/TRANS to existing identity |
| §6.1 Bessel period | Rational point; codimension one; GL1 split center | Global character kills rational l; diagonal case has nu = 1; no full GL finite-volume claim | Use algebraic §2.1 |
| §6.2 Fourier–Jacobi period | Rank 0; split equal rank GL1; cover signs | Point quotient is harmless; positive equal rank can diverge; signs cancel | Retain function-field theta extension |
| §6.2a central regularization | Tate rank one; Fourier scaling by 2; beta = abs(.)^(−1/2); rank 0 | Poles at 0,1 for unitary rank one; half-density preserved; finite part shifts by −R under norm e | Keep asymptotic/uniform estimate residuals |
| §6.3 global R | M = 0; dimensions 2 and 1; split algebra | L(s,0) = 1; dimension is 2 without an extra line; split factors pair with their duals | Import factors with residual general domains |
| §6.4 global assertion | One bad local model; zero central value; zero input vector; polar central family | Neither local distinction alone nor a polar finite part supplies the scalar assertion | Preserve original analytic hypotheses |
| §6.5 unitary datum | Norm line at 1,i,1+i; two nonisometric forms | Values 1,1,2; fixed realized inner form remains part of datum | Import ordinary cuspidal realization |
| §7.1 orthogonal Delta | d = 2,3,4; split plane | Values L(1,chi), zeta(2), zeta(2)L(2,chi); split plane has a pole | Keep general adjoint/continuation residual |
| §7.2 local orthogonal form | Zero vector; scalar i in each factor; singular quotient | Conjugations and linearities agree; no scalar division at a pole or zero | Import representation/measure sections |
| §7.3 tempered/spherical orthogonal | Twice the measure; missing hyperspecial condition | Spherical alpha doubles; all U-conditions remain | Supplier bindings only |
| §7.4 orthogonal conjectures | Centralizer orders 2,4; measure times 3; zero vector | Component factor 1/8; C0 rescales inversely; zero ratios excluded | Preserve conjectural continuation domain |
| §7.5 unitary alpha | Zero vector; i-scalings; q = 2 at s = 1 and s = 0 | Sesquilinearity holds; local factor is 2 at 1 and has a pole at 0 | Bind local factors/category sections |
| §7.6 unitary convergence | Ramified/dyadic/infinite places; spherical compact volume 2 | No place omitted; spherical alpha equals volume times norm | Keep regularity and measure residuals |
| §7.7 normalization invariance | Vector 2i f; reciprocal measures; one doubled measure | Ratio unchanged by vector scaling; product unchanged only for product-one measure scaling | None |
| §7.8 global constant | Constituent totals 2,3; central value zero | Component factors 1/4,1/8; zero central value is allowed with nonzero adjoint denominator | Retain ambient-degree Asai sign |
| §8.1 relative distributions | Basis vector i e; empty subset; zero period; constant coefficient on Fvˣ | Summand unchanged; sums vanish appropriately; divergent local integral rejected | Separate local lambda from regularized Eisenstein periods |
| §8.2 linear contribution | Irrelevant datum; dim aP = 2,3 | Zero contribution; factors 1/4,1/8 | Narrow analytic supplier gaps |
| §8.3 isolated comparison | Multiplier at chi; components with proper Levi; positive local measure changes | Scalar normalization preserves action at chi; range need not be purely cuspidal or an idempotent projection | State exact isolation residual |
| §8.4 endoscopic nonvanishing | Ambient m = 1,2; partition 1+1; unrelated inner form | Signs +,−; both degree-one constituents use ambient sign −; existence varies h | Retain general-field base-change residual |
| §8.5 factorization | Zero local model; real and complex places; both Haar rescalings | Both sides vanish in obstructed case; source comparison uses separate ambient and diagonal scales | Bind known supplier sections |
| §8.6 GGP.8 | Nonzero vector rescaling; constituent totals 2,3 | Squared period/norm ratio and component factors agree | Endpoint and name unchanged |
| §8.7 stable specialization | n = 1; two cuspidal base changes | bplzz's n > 1 domain remains; constant specializes to 1/4 | None |
| Supplier conventions and residuals | Upper Borel at diag(uniformizer,1); zero Heisenberg space; arbitrary generic local exponents; non-CM extension | Half modulus is positive; oscillator line retains genuine sign; global-only supplier results do not discharge wider domains | Preserve residuals instead of narrowing endpoints |

Pinned-library duplication was checked by object and by declaration, using the local checkouts at the exact manifest commits and GitHub search followed by pinned-file reads. Mathlib `QuadraticMap.polar_self` retains the unhalved value 2. Tau Ceti's `Representation.IsInvariantSesqForm` is star-first, and `TauCeti.HeisenbergGroup.mul_z` has the matrix central product. No new general library API is planned here for these objects.

Read the main-branch roadmaps QuadraticFormInvariants, GlobalNumberFields and completed RestrictedProducts for shape and ownership. Read the supplier texts at the heads identified by the review and checked the five named open sibling roadmaps; none supplies the relative Bessel construction or creates a new competing prerequisite here. The separate SM.5 owner is reported in F06.

## Checks and maintainer notes

The required dependency command completed with exit code 0. Its exact output was:

```text
candidate: GanGrossPrasadConjecturesForClassicalGroups is not in the merge order yet; checked as if placed after MetaplecticAutomorphicForms (the intake inserts it when its design is accepted)
depcheck: 6 roadmaps, 47 edges, 0 problem(s)
```

No UPWARD or CYCLE line occurred. The candidate's absence from the merge order is expected at design stage.

The structural audit completed with exit code 0: all 52 target statements, APIs and Checks agree between README and plan after normalizing code formatting, sentence order and the inherited Πphi notation. The changed algebraic/local hypotheses agree. All 39 gap contracts match their README sentences and exact `neededBy` consumers. Target IDs are unique, prerequisites resolve, every internal edge points to an earlier target and the internal graph is acyclic. The source manifest parses, and every target's locator source and `cited_for` entry resolve.

All cited works remain legally available certified cache entries; no additional source or missing-reference request was needed. The manifest changes only extend existing locators and target attribution. No source passage was copied into the package. No suspicious instructions were encountered in the inspected review or source data.

There is no Suggested.lean in this design package. No Lean declaration changed, and no Lean build or elaboration was run. `GGP.besselCharacter` keeps its name and mathematics at §2.1a; `GGP.besselFunctional` and its four API names are new in §2.1. GGP.8 remains §8.6 and no downstream theorem name changed. Deleted gap slugs are `heisenberg-svn` and `theta-seesaw`; `standard-module-theta` is the new split contract. Casselman–Wallach and generic standard-module gaps have corrected owners. Supplier work and the F06 routing decision remain with their named owners and the maintainer; this package does not claim to discharge those gaps.

`git diff --check` completed with exit code 0 and no output. Submission hygiene checks passed: the four edited deliverables contain no machine paths, forbidden display delimiters or `set_option`; all seven finding headings have the required form.

Only `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md`, `packages/GanGrossPrasadConjecturesForClassicalGroups/design/plan.json`, `packages/GanGrossPrasadConjecturesForClassicalGroups/sources.toml` and this requested report changed. No supplier, merge-order or tooling file changed; no commit or remote write was made.

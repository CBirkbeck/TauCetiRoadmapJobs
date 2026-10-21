# Mathematical repair report

## F01 (P2) — applied

Scheme-construction gaps → residual unitary and quadratic point-comparison gaps. Added the pinned constant-form, O, SO, symplectic and symplectic-basis APIs with their hypotheses. Synchronized supplier descriptions and consumer prerequisites. Added low-rank and arbitrary-Gram Checks; the latter explicitly tests inverse transpose. No target or gap identifier changed.

Evidence at Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`:

- `TauCeti/Algebra/AlgebraicGroup/ConstantForm/Basic.lean`, `TauCeti.ConstantForm.groupScheme` and `TauCeti.ConstantForm.mem_definingPointsSubgroup_iff`, construct the arbitrary-matrix subgroup and identify its point equation over every commutative ring. Neither nondegeneracy nor positive rank is required.
- `TauCeti/Algebra/AlgebraicGroup/Orthogonal/Basic.lean`, `TauCeti.Orthogonal.groupScheme` and `TauCeti.Orthogonal.pointsMulEquiv`, specialize to the standard symmetric form. `TauCeti/Algebra/AlgebraicGroup/SpecialOrthogonal/Basic.lean`, `TauCeti.SpecialOrthogonal.definingHopfIdeal`, forms the determinant-one cut; `pointsMulEquiv` and `pointsMulEquiv_mapValue` identify its points naturally. These are standard-form statements, not an identification of every quadratic form with that form.
- The SO `BaseChange.lean`, `Smooth.lean`, `Connected.lean`, `LowRank.lean` and `Reductive.lean` files provide the exact declarations listed in the revised contract. General SO smoothness requires invertible 2; geometric connectedness and reductivity are supplied over fields of characteristic different from 2. The rank-zero and rank-one results have no restriction on 2.
- The symplectic `Basic.lean`, `Scheme.lean`, `BaseChange.lean`, `Smooth.lean`, `Connected.lean` and `Reductive.lean` files provide standard-form points, scheme points, base change and smoothness over every commutative ring, and geometric connectedness and reductivity over every field. `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J` in `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean` supplies the arbitrary nondegenerate alternating-form specialization, including dimension zero.
- The matrix carriers were also checked at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, `Mathlib/LinearAlgebra/UnitaryGroup.lean`, declarations `Matrix.orthogonalGroup`, `Matrix.mem_orthogonalGroup_iff`, `Matrix.specialOrthogonalGroup` and `Matrix.mem_specialOrthogonalGroup_iff`.

The comparison must respect the matrix convention: if `M C Mᵀ = C`, then `T = (Mᵀ)⁻¹` satisfies `Tᵀ C T = C`. This is a group homomorphism, preserves the determinant-one condition, and is compatible with scalar extension. The added rational matrix Check distinguishes it from using M itself. The alternating orientation Check now compares the roadmap's `(e,f)` basis with the pinned J-basis `(f,e)`.

`TauCetiRoadmap/OrthogonalSpinGroups/README.md`, Layer 0 and §3A, provides point groups and explicitly excludes the scheme comparison from its milestones. `Completed/RestrictedProducts/README.md`, Scope and ownership, provides generic restricted products rather than classical point identifications. The surviving comparisons therefore remain explicit ReductiveGroupsPartII gaps, not invented supplier targets. Their identifiers are unchanged; their section descriptions are now “unitary schemes and points” and “quadratic constant-form point comparison.”

## F02 (P3) — applied

Two-family higher-codimension uniqueness → all four classical families. `GGP.higherCodimensionMultiplicityOne` now consumes §§3.7–3.8 as well as §§3.3–3.4, with characteristic-zero and irreducibility hypotheses retained. Added SO(3)/SO(0) and codimension-two skew-unitary Checks, using the actual connected-group and oscillator reductions.

Evidence: ggp line 2661–2698 explains the orthogonal/Hermitian basic-case reduction and auxiliary irreducible induction; ggp line 2699–2700 identifies the skew-Hermitian counterpart. The connected SO and skew-unitary comparison proofs remain the owned targets §§3.7–3.8. Waldspurger Theorem 1, waldspurger line 10–18, supplies the adjacent SO bound. Sun Theorems B–C, sun line 31–42 and sun line 102–104, supply the basic oscillator/Jacobi bounds. The proof does not infer SO uniqueness by restriction from O.

For the SO boundary, `V = hyperbolic plane ⊥ L` and `W = 0` give `Vplus = V ⊥ (−L)` of dimension four and Witt index two. Its maximal-isotropic-plane Levi is `GL(2) × SO(0)`; the resulting adjacent pair is SO(4)/SO(3). For a skew-Hermitian line W0 with one added hyperbolic plane, the induction Levi is `GL_E(1) × U(W0)` and the resulting model has equal ambient rank. Both Checks retain the support exclusions and compatible dual/splitting conventions through the cited reduction targets.

## F03 (P3) — applied differently

Removed enhanced classification from §1.3 and smooth/Casselman–Wallach categories from §4.1; removed the representation-category hypotheses from the latter. Updated gap consumers and Layer 1 dependencies. Retained the Layer 4 aggregate category dependencies because §§4.7–4.8 still consume them. Packet marking remains in §4.6.

Evidence: ggp line 255–257 defines relevance using an isometric inclusion and its complement, after the pure-inner-form description at ggp line 214–226. This needs the marked-form contract and Witt transport, not packet classification. The centralizer decomposition and sign generators at ggp line 477–532 concern finite-dimensional parameter representations only. In particular M = 0, an orthogonal multiplicity space of dimension two, and a paired GL multiplicity space require no smooth or Casselman–Wallach representation category.

Deleting the category gaps from the whole Layer 4 aggregate would be incorrect: §4.7 states smooth and continuous archimedean GL model comparisons, and §4.8 uses smooth induction and models. Their prerequisites are retained. The `neededBy` entries remove only §4.1 from these two gaps and §1.3 from enhanced classification.

## F04 (P3) — applied

Implicit normalization → a fixed `nu0 ∈ Fˣ`, parity-dependent residual norm, and `mu(G)` and labels relative to that datum. §5.1 covers every norm class by varying `nu0`; the enhanced-classification contract carries the same requirement. Added sign and norm-class Checks and extended the existing source locator.

Evidence: bp-refined line 381–399 defines the residual form with central-line norm nu; bp-refined line 713–719 fixes nu0 and defines the quasi-split sign relative to it. Condition 4.1(1), bp-refined line 806–807, uses +nu0 when the larger dimension is even and −nu0 when it is odd. Theorem 8.5.1 explicitly imports that condition at bp-refined line 2883–2884 and uses the sign and fixed labeling at bp-refined line 2891–2901.

The sign Check is discriminating over `E = Q3(√3)`: a unit norm has square residue in F3, so −1 is not a norm. Thus the residual lines of norms +1 and −1 differ there. Multiplying a generator by 2 multiplies its norm by 4 and preserves its norm class. No norm class is excluded by the repaired statement.

## Checks and supplier consequences

The dependency check used `packages/GanGrossPrasadConjecturesForClassicalGroups/design/README.md` with the supplied configuration, candidate name and order. Exit status: **0**. Exact output:

```text
candidate: GanGrossPrasadConjecturesForClassicalGroups is not in the merge order yet; checked as if placed after MetaplecticAutomorphicForms (the intake inserts it when its design is accepted)
depcheck: 4 roadmaps, 29 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No merge-order change is needed or made.

The independent scratch consistency checks completed successfully:

```text
PASS: JSON and TOML parsed; 50 target names and 40 gap slugs retained.
PASS: every gap contract, detail, supplier section and neededBy list agrees with the README and actual prerequisites.
PASS: every target/API/Check name and every changed API/Check statement agrees between README and plan; prerequisite target graph is acyclic.
PASS: F02 reduction inputs and F03 removals verified; all 12 certified sources have cached texts; no machine paths or LaTeX delimiters in README.
PASS: the rational 2-by-2 Gram, determinant and inverse-transpose witness computes exactly as stated.
```

`git diff --check`: exit status **0**, no output. No Lean command was run: this design package contains no `Suggested.lean`, no Lean file was changed, and editing or creating one is outside this repair's permitted files. The new Checks are mathematical specifications in README and plan.

Read-only ownership comparison used `TauCetiRoadmap/ReductiveGroups/README.md`, `TauCetiRoadmap/OrthogonalSpinGroups/README.md`, `Completed/RestrictedProducts/README.md`, and the available QWittVectors, ErdosProgressionPowers and ArithmeticDynamics package READMEs. None supplies the residual relative-model comparisons addressed here. Pinned declarations were searched through GitHub code search and then read at the manifest commits rather than relying on the search result's revision. All source locators needed for the findings were read from the certified legal cached texts; no additional source or missing-text request was needed.

Maintainer consequences: ReductiveGroupsPartII is asked only for the residual form/point/topology interfaces, using the pinned constructions. EndoscopicTransferAndUnitaryTraceComparison's enhanced-classification gap now requires the common norm normalization. These remain gaps, not claims that a supplier has already implemented them. No supplier file, target name, gap slug, downstream citation name or endpoint changed. `GGP.higherCodimensionMultiplicityOne` has the broader four-family conclusion; no prerequisite was moved to a later roadmap.

## Adversarial mathematics pass

Each row includes the target's defining conditions, displayed identities and API under the hypotheses in the README. These are boundary and consistency checks, not new proofs of the source-dependent theorem targets.

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| Standing form, field and dual conventions | Zero space; rank-one `Q(x) = x²`; alternating plane; C/R hyperbolic plane; characteristic 2 versus Q2; split algebra versus inseparable extension | Polar value 2; alternating signs 1 and −1; conjugate inverse required; field/étale hypotheses reject the forbidden cases | J-basis orientation made explicit |
| Pinned constant-form and classical-scheme contracts | Empty matrix; zero ring; arbitrary C; SO(1); symplectic rank zero; characteristic 2 versus invertible 2 | General construction has no form hypothesis; SO smoothness/connectedness ranges remain restricted; low-rank SO and symplectic construction do not need that restriction | F01 |
| Parameter and measure conventions | Uniformizer norm q⁻¹; q = 2 versus q = 1; twist eigenvalues z,u; scalar 2i; two reciprocal measure changes | Local factor at s = 1 is 2; q = 1 rejected; twist gives z/u; squared scaling is 4; only compatible products preserve Tamagawa measures | None |
| §1.1 `GGP.RelevantPair` and API | Zero skew pair; anisotropic line; positive plane; anisotropic skew-Hermitian plane; identity transport | Parity and Witt splitness are separate; zero skew complement is allowed; isometries preserve relevance | Pinned alternating input and orientation Check |
| §1.2 `GGP.relativeSubgroup` and API | Empty flags at codimensions 0 and 1; j(1,g), j(u,1); ranks 0 and 1; C = diag(1,4), M = [[0,1/2],[−2,0]] | Correct diagonal and kernel; determinant-one low ranks trivial; M preserves row-form C but is not its column isometry | F01 inputs and two new Checks |
| §1.3 `GGP.IsRelevantInnerForm` and API | Zero complement; real signatures (3,1) and (1,3); split GL; marked identity twist | Complement isometry, not rank/discriminant alone, controls relevance; geometric transport uses no packets | F03 |
| §1.4 `GGP.splitPairEquiv` | Rank zero; split line acted on by a and a⁻¹; a² ≠ 1 | Both zero groups trivial; inverse-dual direction forced | Narrowed unitary contract retained |
| §2.1 `GGP.besselCharacter` and API | Empty flag; two root terms 1,−1; split residual vector (1,0); split character on one factor; generic GL3 data | Empty character trivial; sum vanishes; nongenerating/degenerate data rejected; both generic root coefficients nonzero | None |
| §2.2 `GGP.fourierJacobiQuotient` and API | Rank-one X; zero W; zero X; split idempotent functional versus identity | Commutator 2; zero vector quotient; separate basic branch; surjectivity requires unimodularity | Pinned symplectic prerequisites |
| §2.3 `GGP.fourierJacobiRepresentation` and API | Genuine versus nongenuine input; X = 0; W = 0 | Kernel signs cancel only in the genuine tensor; equal-rank oscillator is retained; zero W gives the flag character | None |
| §2.4 `GGP.Model` and API | Trivial H; zero input; Mp(0) sign versus trivial input; infinite direct sum; finite-dimensional continuous comparison | Multiplicities 1,0; correct genuine sign; cardinal dimension needed; topology cannot be forgotten without comparison hypotheses | None |
| §3.1 Basic nonarchimedean uniqueness | Q2; SO(1)/SO(0); equal-rank unitary oscillator | Characteristic-zero theorem includes dyadic fields; trivial bound is attained; Sun's central-character hypothesis retained | None |
| §3.2 Basic archimedean uniqueness | Rank-zero Jacobi group; infinite-dimensional spaces | Center-character bilinear dual has dimension one; continuous Hom is required | None |
| §3.3 Bessel induction | No isotropic Yprime of required dimension; forbidden Bernstein support; O versus SO | Empty exclusion is meaningful; closed contribution otherwise not killed; full-O statement does not prove SO statement | None |
| §3.4 Symplectic Fourier–Jacobi induction | X = 0; omitted genuine Levi twist | Nonbasic theorem rejects X = 0; cover signs require the twist | None |
| §3.5 Multiplicity assertion and API | SO(1)/SO(0); trivial C² representation; zero model | Irreducible model has dimension one; dropping irreducibility gives dimension two; distinction is not automatic | None |
| §3.6 Higher-codimension uniqueness | Basic codimension 0/1; Q2; SO(3)/SO(0); skew-unitary line plus hyperbolic plane | All four reductions lead to their actual basic bounds; no archimedean or positive-characteristic extension inferred | F02 |
| §3.7 SO induction | SO(0) smaller group; two maximal-isotropic components; absent closed Levi; forbidden support | Both components tracked; SO argument needs no O extension; rank-four auxiliary group gives adjacent SO basic case | F01 prerequisites; F02 consumer |
| §3.8 Skew-unitary induction | Rank-one X; zero X; common mu versus one changed splitting | mu and mu⁻¹ cancel; residual modulus remains; zero X is basic; one changed splitting changes the Hom datum | F02 consumer; unitary contract clarified |
| §4.1 Parameter sign domain and API | M = 0; T ⊕ T; P ⊕ P∨; two odd orthogonal summands | Component groups trivial, C2, trivial, C2² respectively; determinant-one subgroup in last case has order two | F03 |
| §4.2 Conjugate-dual character and API | N = 0; generator signs −1,+1; odd versus even dim N | Trivial zero character; product −1; parity controls nonnorm sign change | None |
| §4.3 Selfdual character and API | Zero parameters; two symplectic parameters; odd N negative control; real determinant correction | Even determinant-one domain essential; correction turns the real test value from −1 to +1 | None |
| §4.4 Distinguished character and API | Split component group; N the trivial line; eigenvalues z,u | Trivial split character; extra line makes even-dimensional local domain; inverse twist z/u | None |
| §4.5 Normalization changes | Odd component eigenspace; splitting scalar u; identity changes | Nonnorm sign reverses; tensor action zu on both reassociated sides; identity maps remain identities | None |
| §4.6 Local selection proposition and API | Singleton GL packet; two inner forms; nongeneric parameter | Actual marked packets and relevance required; nongeneric parameters excluded | Classification remains here |
| §4.7 Split selection | Generic GL2/GL1; higher codimension at infinity | Singleton enhancement trivial; higher archimedean range not asserted | Valid category prerequisites retained |
| §4.8 Basic-case selection reduction | Four group types; archimedean negative control | Uses actual packets and their induction laws; nonarchimedean implication only | Valid smooth prerequisites retained |
| §5.1 Tempered unitary Bessel selection | Ramified Q2; even versus odd larger dimension; Q3(√3) norm classes; generator scaled by 2 | Residual signs +nu0/−nu0 differ when −1 is not a norm; scaling by 2 multiplies the norm by 4 | F04 |
| §5.2 Standard-module multiplicity | No GL blocks; unordered exponents; crossing reduced ranks | Identity on tempered remainders; ordering and relevant-pair transport required | None |
| §5.3 Generic Bessel selection | Generic nontempered module; tempered boundary; residual datum of §5.1 | Standard-module reduction preserves the stated pair/normalization hypotheses | Inherits repaired §5.1 |
| §5.4 Theta bridge | Zero theta lift; common splitting data; family of Bessel assertions | Only nonzero lift contributes; P2 and seesaw used; P1 not reproved | None |
| §5.5 Generic Fourier–Jacobi selection | Wrong mu restriction; ramified Q2; r = 0 | Wrong splitting excluded; dyadic field included; equal rank uses bridge | None |
| §5.6 Tempered packet uniqueness | Several real signatures; F = C split place | Search ranges over actual relevant inner triples; C uses split theorem; no real epsilon-label theorem inferred | None |
| §6.1 Global Bessel period and API | Codimension one; zero cusp form; split SO plane; split GL1 center | Correct diagonal integral; zero value; full split quotients not assigned finite volume | F01 prerequisite |
| §6.2 Global Fourier–Jacobi period and API | Zero Schwartz input; cover involution; additive character nontrivial on rationals | Bilinear zero value; cover signs cancel; nonautomorphic character rejected | None |
| §6.3 Distinguished L-representation and API | M = 0; dimensions 2 and 1; split unitary factors | L = 1; tensor dimension 2 rather than 4; split central product is squared absolute value | None |
| §6.4 Global nonvanishing proposition and API | All local models with central value zero; one bad local model; zero vector in distinguished representation | L-condition necessary; local obstruction genuine; functional nonvanishing is existential | None |
| §6.5 Unitary period datum and API | Q(i) inputs 1,i,1+i; zero function; nonisometric forms of equal rank | Norms 1,1,2; zero period allowed; forms give separate data | None |
| §7.1 Orthogonal Delta and API | d = 2,3,4; hyperbolic plane; global split-plane pole | L(s+1,chi), zeta(2), zeta(2)L(2,chi); discriminant sign correct; pole not an ordinary scalar | None |
| §7.2 Orthogonal local period and API | Zero vector; scalar i on each factor; zero/pole normalizer | Correct conjugate/linear behavior; ordinary scalar domain rejects singular denominator | F01 prerequisite |
| §7.3 Tempered/spherical orthogonal form | Norm-one spherical vectors; Haar measure doubled | Alpha changes from 1 to 2; volume hypothesis necessary | None |
| §7.4 Orthogonal refinement propositions and API | Centralizer orders 2,4; measure tripled; ALG versus tempered; zero vector | Factor 1/8; C0 compensates; genericity not Ramanujan; no 0/0 vector ratio | None |
| §7.5 Normalized unitary local period and API | Zero input; simultaneous and one-sided i; Cv doubled; split q = 2; s = 0 pole | Correct sesquilinearity; Cv tied to factors; trivial L-factor at s = 1 is 2; pole rejected as scalar | None |
| §7.6 Local convergence and spherical value | Compact volume 2; complex split place; ramified and dyadic places | Spherical alpha equals volume times norm; all actual local integrals retained | None |
| §7.7 Normalization invariance | Vector 2i; reciprocal two-place measures; single doubled measure | Vector ratio invariant; product invariant only for total scale one | None |
| §7.8 Unitary global constant and API | Constituent counts 1+1,1+2; n = 1; zero central value | Factors 1/4,1/8; Delta2 = L(1,eta)L(2,1); numerator zero is allowed | None |
| §8.1 Relative characters and API | Basis phase i; empty spectrum; zero period; split n = 1 trivial local representation | Phase cancels; zero sums; ordinary character need not vanish; noncompact local integral diverges outside tempered domain | None |
| §8.2 Linear contribution | Two versus three total constituents; irrelevant datum | Factors 1/4 and 1/8; irrelevant trace zero and not inverted | None |
| §8.3 Isolated comparison | Enlarged S0; all test functions zero | Measure factors must move with S0; zero equality holds | None |
| §8.4 Endoscopic nonvanishing | Degrees 1,2; wrong fixed inner form; function-field input | Asai signs +,−; conclusion existential in h; number-field theorem does not extend by assertion | None |
| §8.5 Relative-character factorization | Vanishing local model; constants k,k⁻¹; one ambient measure doubled versus compensated pair | No zero functional divided out; constants cancel; ambient product condition essential | None |
| §8.6 GGP.8 | Stable/endoscopic constituents; zero period on nonzero vector; scalar 2i | Factors 1/4,1/8; zero equality valid; squared norms and periods both scale by 4 | None |
| §8.7 Stable specialization | n = 1 boundary; two cuspidal base changes | bplzz specialization requires n > 1; n = 1 stays with the general bpcz endpoint | None |

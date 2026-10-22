<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/625#issuecomment-6331888052 -->
Review (codex) of 546bb44

Verdict: needs_changes

1. **F01** (P2) The Hermitian gap repeats an existing field-form carrier

   **Location.** `packages/GanGrossPrasadUnitaryGroups/README.md:73`: “Supply Hermitian forms on finite projective constant-rank modules over quadratic étale algebras”. The same request occurs in the `hermitian-unitary` entry beginning at `packages/GanGrossPrasadUnitaryGroups/design/plan.json:2307`. Its direct consumers are §§1.1, 1.3 and 3.4.

   **Claim.** This gap requests the Hermitian form foundations from ReductiveGroupsPartII without importing the existing field-form carrier from GeometryOfNumbersAndQuadraticArithmetic §2.9. Its field case repeats already planned mathematics. The broader split-algebra and algebraic-group requirements are additional work, but do not justify requesting the existing field carrier again.

   **Witness.** `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:1184` explicitly supplies `SignedHermitianSpace` and its adjoint over any commutative field with involution. `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/Suggested.lean:750` defines that carrier with a sesquilinear form, symmetry and nondegeneracy.

   These witnesses are at supplier revision `01c64f0cc5f154a3d190697951ead2fffc2af693`. The paragraph explicitly exempts the carrier and adjoint from the section's odd-residue local-field restriction; that restriction governs classification and transfer-image results. Thus its sign +1 specialization already covers arbitrary nonsplit coefficient fields, including C and dyadic quadratic fields, and finite-dimensional spaces of rank zero. Over a field the requested finite projective modules are precisely finite-dimensional vector spaces. The supplier uses conjugate-first forms, whereas this package uses linear-first forms at README line 21: the comparison is `h_here(x,y)=h_supplier(y,x)`, not another construction of the same field-form data. MetaplecticAutomorphicForms §3.3 independently consumes this same existing carrier.

   **Exact repair.** Import GeometryOfNumbersAndQuadraticArithmetic §2.9's `SignedHermitianSpace` and field adjoint API in Scope and ownership and Exact supplier contracts. Retain the `hermitian-unitary` slug, but revise its README and plan `needs`/`detail` to ask only for the missing quadratic-étale/module extension, complement and Witt geometry, representable reductive U(h), and comparisons not already supplied. State a named field-carrier comparison with the displayed slot swap and use the imported carrier in the nonsplit field specializations of §§1.1, 1.3 and 3.4. Preserve split coefficients, both real signatures, zero rank and all residue characteristics.

   Keep the comparison in this roadmap, or another owner after both suppliers: `merge-order/ORDER.txt:20` places ReductiveGroupsPartII before GeometryOfNumbersAndQuadraticArithmetic at line 61, while this roadmap is at line 149. Do not repair the omission by making ReductiveGroupsPartII depend upward on GeometryOfNumbersAndQuadraticArithmetic. No supplier file or merge-order edit is needed for the package repair. This is a new finding; the previous repair report contains no settled refusal concerning this carrier.

2. **F02** (P3) Put target identifiers in code spans

   **Location.** `packages/GanGrossPrasadUnitaryGroups/README.md:203`: “define RelevantHermitianPair(W,V,r,L)”; line 319 similarly introduces `besselModel` and `besselMultiplicity` as plain text.

   **Claim.** Numerous target and API identifiers use plain text or bold styling instead of the required backtick code spans.

   **Witness.** `packages/GanGrossPrasadUnitaryGroups/README.md:327` writes the API label as `**besselModel_mk.**`; line 359 correctly uses backticks for `algebraicBesselModel` in the same section.

   **Exact repair.** Put the target identifiers in the prose and API lists in backticks, following line 359. For example, write “define `RelevantHermitianPair`” and “`besselModel_mk`”. Apply the same formatting consistently to the other target/API names. Retain the mathematical prose, named APIs, Checks and locators.

Two findings: one P2 and one P3; no P1. The preceding review's F01 is repaired. The new blocking finding concerns a different supplier gap, and can be repaired without narrowing the mathematical scope. No authored package file or source-manifest entry was changed.

## Verified sound

### Previous finding, checked first

| Previous finding | Status | Repaired passage and independent check |
| --- | --- | --- |
| Round 3 F01 (P2): the genericity gap repeated archimedean genericity and Whittaker realization | **Repaired** | `packages/GanGrossPrasadUnitaryGroups/README.md:85` now says “For every nonarchimedean characteristic-zero local field K and k≥1”. Line 99 imports `HasWhittakerModel`, `genericUnitaryInduction`, `genericUnitaryClassification` and `whittakerTwist`; line 173 imports the actual Whittaker realization. The matching plan entry is likewise restricted to nonarchimedean genericity. |

Read the actual supplier statements, rather than relying on the repair report: `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:431`, revision `bc8af0cee90d91cf9c2345e2b65630749b64609c`, gives the continuous genericity criterion for irreducible normalized inductions of essentially tempered blocks. A tempered irreducible is a single such block, with whole-group induction. Its §2.7 supplies the continuous globalization. `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:241` and line 1959, revision `691b4b3310d33d5ad6b2b5224005a407eff9a1f8`, supply the topology comparison and orbit-function realization. The revised direct consumers at §§3.10, 3.11 and 5.1a and the Layer 3/5 summaries cite these inputs. The zero-rank and nongeneric-unitary boundary Checks retain the distinction between temperedness and unitarity. SmoothRepresentationsOfLocalGroups SR.2.3 supplies general functional/quotient carriers and GL₂ specializations, not the all-rank finite-place genericity theorem. The remaining finite-place gap is therefore substantive.

### Coverage and principles

Read the four requested package files, the plan's gap records, the previous review and repair report. The mathematical pass covers all **40 numbered target subsections**, their subordinate APIs and Checks, the conventions, **six real-bodied Lean definitions/abbreviations** and **five Lean theorem signatures**. There are **40 target-specific Needs lines**, and all **seven layers** have Examples and Dependencies sections.

The roadmap preserves arbitrary relevant odd codimension for multiplicity one, split local algebras, the two real complement signs, ramified and dyadic fields, and endoscopic global data. It does not add an auxiliary supercuspidal place to the global endpoints. General higher-codimension global nonvanishing and the split archimedean higher-codimension assertion remain explicitly conjectural proposition targets. The all-residue spherical calculation distinguishes Harris's odd-residue intermediate from the additional dyadic argument. No re-planned existing roadmap, computational algorithm, copied source passage, admitted data, option override, circular endpoint premise or forced analytic Lean carrier was found. R01 concerns minimality of one supplier contract, not the scope of the relative theory.

For shape comparison, read main's `TauCetiRoadmap/ReductiveGroups/README.md`, `Completed/RestrictedProducts/README.md` and `TauCetiRoadmap/GlobalNumberFields/README.md`. The package has the required summary, scope, conventions, supplier contracts, build paragraph, layers, downstream consumers and references. Definitions retain API lists and at least three Checks, with several Checks combined into a single proved Lean example as required by the example limit. R02 records the remaining identifier-formatting issue. Uses of “packet” refer to Langlands packets, not workflow narrative.

### Seeded source sample: 15 of 15 targets verified

The table checks the locator, page, hypotheses and mathematical content against the recorded legal version. Conclusions requiring supplier constructions remain conditional on those constructions; checking a locator does not discharge a supplier gap.

| Target | Source witness | Verification |
| --- | --- | --- |
| 1.1 `RelevantHermitianPair` | ggp §2, pp. 5–7, ggp line 229 and line 255; §12, p. 44, line 1567 | The nondegenerate embedding, split odd complement and fixed complement under relevant inner forms agree. The split basis-vector requirement strengthens “nonzero” correctly. R01 concerns ownership of the underlying field carrier. |
| 1.2 `besselDatum` | ggp §12, pp. 44–46, ggp line 1593, line 1603 and line 1624 | The flag radical, simple-coordinate map, stabilizing smaller group and character agree. Empty flags and both split root coordinates are retained. |
| 1.3 `besselTransport` | ggp §12, pp. 45–46, ggp line 1609 and line 1637; §18, pp. 71–72, line 2489 and line 2503 | Changes of auxiliary choices give conjugate embedded models. Form scaling preserves the groups; character and enhancement normalizations must be transported together. |
| 2.5 `besselHom_archimedean_injection` | jsz-bessel §3.2, Proposition 3.1, p. 6, jsz-bessel line 207; Propositions 3.3–3.4, p. 8, line 260 and line 268 | The source embeds each finite-dimensional subspace after choosing a common convergence half-plane and an irreducible parameter there. The package does not assert a uniform parameter for the entire Hom space. |
| 2.7 `adjacentTemperedIntegral_converges` | harris Proposition 2.1 and proof, pp. 5–7, harris line 230, line 250 and line 289; split calculation line 311–367; bpcz line 166 | The root-exponent bounds absorb any fixed logarithmic power. The split proof separately sorts coordinates around 1; compactness is not assumed. Extension from compact-finite inputs uses the explicit smooth-vector seminorm supplier. |
| 3.2 `ggpEnhancement_transport` | ggp Theorem 6.1(3), p. 20, ggp line 732–753; §18, pp. 71–72, line 2503–2519 | The determinant twist and even/odd distinction agree. The older source's classification desiderata are explicitly requested as proved properties in `enhanced-packets`. |
| 3.5 `besselLocalTraceFormula` | bp-arch Theorems 11.4.1–11.4.3, p. 273, bp-arch line 10542–10559; bp-unitary-tempered Theorem 17.1.1, p. 100, line 5003 | Strong cuspidality, Schwartz spaces, the group and Lie identities, and the tempered multiplicity conclusion agree. The geometric induction multiplier is retained at bp-arch line 10531–10539. |
| 3.6 `besselPacketFourierIdentity` | bp-refined §8.6, equation (1), pp. 71–72, bp-refined line 2880–2908; Theorem 8.5.1, line 2869 | The factor `(1+με)/2`, the fixed inner form and the actual component labeling are retained. The source's packet assumptions are owned supplier obligations. |
| 3.8 `besselRealThetaReduction` | xue-real §2.4, pp. 1002–1003, xue-real line 267–303; equation (3.17) and Proposition 3.6, p. 1019, line 848–886; Lemmas 3.8–3.9, pp. 1022–1024, line 983–1025; Lemmas 4.1–4.4, pp. 1024–1029, line 1050–1211 | The nonzero companion-lift conjuncts, counter-twists, odd self-dual count and two-step descent agree. The conjugate oscillator and conjugated additive character were checked directly in the PDF at published p. 1019; theta formulas (3.11)–(3.15) were visually checked at pp. 1010–1011 where OCR was garbled. |
| 3.11 `besselSplitGeneric_nonvanishing` | ggp Theorem 17.2, p. 68, ggp line 2394–2405 | All finite-place odd codimensions and adjacent infinite-place pairs are supported. Higher archimedean codimension is not asserted as a proved consequence. |
| 4.1 `globalBesselPeriod` | ggp §23, pp. 86–88, ggp line 3036–3047 and line 3077–3093 | The rational relative group and automorphic Bessel coefficient agree. Inverting the source character gives the package's right-translation covariance. Continuity is a named target using the supplied cuspidal estimates. |
| 5.1a `splitAdjacentWhittakerPeriod` | zhang-period §4.5, Lemma 4.9 and Proposition 4.10, pp. 30–33, zhang-period line 1469–1548; measure change p. 29, line 1437–1440 | The actual Whittaker pairings, opposite characters and unnormalized differential Haar measures give the stated product of functionals. Scaling the pairing and group measure gives the factor `ab`. |
| 5.4 `unitaryPeriod_rescaling` | bpcz §1.1.6, pp. 4–5, bpcz line 160–191; §2.3.2, p. 15, line 679–699 | Substitution gives pairing cancellation in each vector quotient, linear local Haar scaling and quadratic scaling of the squared global period. Only product-one finite local changes preserve the fixed global measure. |
| 7.1 `unitaryAdjacentGlobalNonvanishing` | bpcz Theorem 1.1.5.1, p. 3, bpcz line 124–134; §10.2, p. 90, line 4835–4864 | The Hermitian discrete parameter, existential inner form, n≥1 and absence of a temperedness premise agree. Weak/strong comparison is stated separately at bpcz line 112–120. |
| 7.3 `harrisRefinedUnitaryConjecture` | harris Conjecture 1.3, p. 3, harris line 132–144 and pairings line 75–111; bpcz §1.1.6, pp. 4–5, line 148–193 | The normalized vector formula and constituent-group coefficient agree. Mixed-vector polarization clears the positive diagonal denominators; it never divides by a mixed pairing that can vanish. |

The manifest has **16 certified readable works and one waived work**. All 16 certified cached text files are present. The only locator explicitly marked unverified belongs to the waived `xue-bessel` entry, addressed below. No additional source was necessary, fetched, or added to the manifest.

### Adversarial mathematics pass

Every subsection row includes its definition, subordinate API, hypotheses and Checks. “None” means the attempted instances gave no additional finding; it does not mean the future analytic theorem has been formalized. No package changes were applied.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Algebraic and local conventions | Zero ring; inseparable quadratic algebra; split algebra; zero module; field characteristic 2; residue characteristics 2 and 3 | Field and étale assumptions exclude the first two. Hermitian theory excludes field characteristic 2, while characteristic-zero local fields include dyadic ones. Split rank n gives GL_n. | None |
| Pairing, action and induction conventions | `(i,1)`, `(1,i)`; character value i; upper GL₂ at `diag(a,1)` | Pairings are i and −i; inverse-character integration transforms by ν. The modulus is abs(a), and unnormalized induction uses the inverse half-modulus correction. | None |
| Factor, parameter and measure conventions | Degrees 1 and 2; two Frobenius eigenvalues; empty parameter; Haar scalars 2 and 1/2 | Asai signs and their opposites differ in the required degrees. Inversion changes both eigenvalues. Empty factors equal 1; local product-one scaling cancels. | None |
| Domains, universes and denominators | Zero vector; zero central value; rank zero; arbitrary algebraic topology | Vector quotients exclude zero, local normalizers have nonvanishing inputs, and no central global value is inverted. No smoothness/completeness is inferred from an algebraic representation. | None |
| 1.1 relevant pair and frame API | W=0 and a line; H plus a line; definite dimension 3; split `(1,0)`; identity and composite isometries | Ranks 1 and 3 are correct. Definite dimension 3 fails r=1 relevance. A nonzero split idempotent is not a basis vector. | R01: reuse the field carrier with slot comparison |
| 1.2 Bessel datum | r=0 and r=2; upper split GL₃; products of root coordinates | Empty flag gives the diagonal group. Coordinates add in the abelianization; the split character detects `(x,−y)`. | None |
| 1.3 transport | Identity; composition; simultaneous negation; altered character with frozen coordinates | Transport preserves the model and composes; negation exchanges the line sign. Frozen character coordinates do not give literal equality. | R01: use the field comparison |
| 2.1 model, multiplicity and currying | Scalar trivial-group model; U(1) weights `(1,−1)` and `(1,1)`; dense tensor image | Dimensions are 1 and 0. The curried target is the smooth dual. Continuity is needed to use density; finrank follows finiteness. | None |
| 2.2 invariant distributions | Norm-one scalar; upper GL₂ unipotent; two noncommuting matrices | Conjugated inversion fixes the scalar; transpose reverses multiplication. Identity is not an anti-automorphism in the noncommutative case. | None |
| 2.3 adjacent bound | U(0) inside U(1); ramified quadratic extension of Q₂; split real groups | Scalar multiplicity is 1. Irreducibility and the field-appropriate category remain explicit; no temperedness restriction is added. | None |
| 2.4 finite-place reduction | r=1; hyperbolic W; allowed and forbidden Bernstein support; upper-B modulus | Auxiliary GL rank is 2; the chosen isotropic Y need not be maximal. The closed-orbit exclusion and unnormalized induction are retained. | None |
| 2.5 infinite-place injection | S of dimensions 0, 1 and 2; reducible parameter; both line signs | A finite basis gives one half-plane for S, and generic irreducibility supplies a usable parameter. No injection at every s is asserted. | None |
| 2.6 multiplicity one | Hypothetical two-dimensional model; wrong compact weight; dyadic field | A two-dimensional subspace contradicts the adjacent bound after reduction. Multiplicity zero remains possible. | None |
| 2.7 tempered integration | Compact H of mass a; trivial noncompact split representation; arbitrary fixed logarithmic power | Compact integral is a. The divergent trivial GL₂ coefficient is nontempered. Relative root decay absorbs each fixed logarithmic power. | None |
| 3.1 epsilon character | Empty smaller parameter; two opposite odd characters; one multiplicity-two constituent | Empty epsilon is 1. Duality gives product −1 for the two opposite odd characters. A repeated constituent has zero central coordinate but a nonzero component generator. | None |
| 3.2 enhancement transport | Norm and nonnorm scalars; dimensions 2 and 1; applying two sign changes | Norm scaling is trivial; the even-side generator changes sign in the stated example, the odd-side label does not, and two changes cancel. | None |
| 3.3 relative tempered form | H=1 with mass a; compact weight sum zero/nonzero; higher codimension; reducible normalized induction | Compact averaging detects the invariant weights. Higher codimension retains regularization; induction concerns the whole induced representation. | None |
| 3.4 geometric multiplicity | x=1; x=−1 on a complex line; zero quasi-character; compact centralizer with no regular nilpotent orbit | Moving determinants are 1 and 4. Empty germ averages are defined as zero. In higher codimension the Lie algebra of H includes its unipotent radical, so its discriminant cancels the extra root factors. | R01 only for the field-form input |
| 3.5 trace formula | W=0; noncompact real group; proper-Levi induction | Whittaker germs, the Schwartz/truncated construction and the GL germ multiplier remain present. No compact-group replacement is used. | None |
| 3.6 packet Fourier identity | μ=ε and μ=−ε; component group of order 2 | Total masses are 1 and 0. Fourier values `(1,−1)` select the nontrivial enhancement. | None |
| 3.7 finite-place packet selection | W=0; Q₂ and Q₃; wrong enhancement | The complement fixes the rank-zero relevant form. Central restrictions select the appropriate inner form; a different enhancement has multiplicity zero. | None |
| 3.8 real theta reduction and auxiliary form | Counts `(2,1)`; zero companion lift; compact wrong weights; U(0); oscillator weight k and k+1 | The lower Bessel counts are `(1,0)`, and the induction sum drops 3 to 1. Zero-lift branches retain vanishing. The scalar form has diagonal values 1 and 0; first/second i scaling gives i/−i. | None |
| 3.9 real packet selection | Compact U(2) weights; opposite line sign; W=0 | Dual-weight interlacing distinguishes multiplicities 1 and 0. Form negation also transports labels. The U(1) scalar case remains included. | None |
| 3.10 split prediction | GL₀ and GL₁; R, C and Q₂; trivial unitary GL₂; ordinary GL₃ coinvariants | Rank zero is direct. Trivial unitary GL₂ is nongeneric and nontempered. Ordinary coinvariants have dimension 6 in the example, versus generic dimension 1. | None |
| 3.11 split theorem | Adjacent pairs at all places; rank gap 3 at finite and infinite places | The theorem covers the first two cases; infinite higher codimension retains conjectural status. Existing normalized RS tests give nonvanishing. | None |
| 4.1 global period | r=0; ν(h)=i; nonrational character | The empty unipotent contributes 1. Right translation has factor i. A character nontrivial on H(F) cannot descend. | None |
| 4.2 local obstruction and factorization | One vanishing local model; two modified factors 2 and 3; reference scalar a | A local obstruction kills the period. The two changes multiply it by 6. Reference rescaling gives reciprocal local normalization. | None |
| 4.3 tensor L-representation | b=0; ranks `(2,1)`; split localization | Dimensions are 0 and 4; the empty L-factor is 1. Split localization retains both conjugate-dual tensor factors. Induction is from the index-two finite-Galois subgroup. | None |
| 4.4 fixed-pair conjecture | W=0; central zero; prescribed wrong inner form | The Fourier coefficient is not discarded in rank zero. The conjunction keeps the central-value condition and the specified inner form. No general proof is exported. | None |
| 5.1 normalizers | n=1; split local algebra; zero global central value | Δ₂ uses η then 1. Local factors remain nonzero; the global numerator may vanish. The adjoint denominator is separately controlled. | None |
| 5.1a split Whittaker period | GL₂×GL₁ over finite/R/C fields; λ-kernel vector; doubled Haar | A normalized nonzero test gives `ab abs(L(1/2))²`; kernel vectors have zero diagonal period. Doubling only Haar doubles the raw form. | None |
| 5.2 normalized form | Zero vector; scalar multiple; compact H; discontinuous algebraic functional vanishing on a dense subspace | α(0,0)=0; q excludes zero and is vector-scale invariant. Density identifies jointly continuous forms, not arbitrary algebraic extensions. | None |
| 5.3 spherical identity | Split q=2 with eigenvalues 1 and −1; nonsplit unramified rank one; ramified nonspherical inputs | Split raw integral and C are both 3, hence q=1. Compact nonsplit raw integral and C are 1. Missing fixed vectors exclude the ramified example from the spherical assertion. | None |
| 5.4 rescaling | Pairing factor 2; local Haar factors 2 and 1/2; global Haar factor 2 | Pairing scales cancel; product-one local Haar scales cancel; the squared global period scales by 4. | None |
| 5.5 infinite product | Spherical tail; zero exceptional factor; good place of volume 2 moved into S | The nonzero volume tail defines a coherent finite modification. A zero local period is retained without inversion. | None |
| 6.1 Whittaker periods | n=1; zero vector; central zero; multiple constituents | The Asai signs differ between the degrees. Central zero kills λ, not β. Leading terms use the actual constituent-dependent pole orders. | None |
| 6.2 relative characters | One-dimensional realization; basis rescaling; zero period; spherical projector | Basis scalars cancel. Zero period gives zero distribution. Local smoothing summability and the adjacent bound justify the absolute interchange. | None |
| 6.3 spectral contribution | Counts `(1,1)` and `(2,1)`; repeated constituent; quotienting the centre | Coefficients are 1/4 and 1/8. Repeated constituents violate star-generic hypotheses. The full split-centre dimension is required. | None |
| 6.4 isolated comparison | Other forms zero; several representations with one base change; dense infinite transfer | Isolation initially gives the whole base-change class. Dense transfer requires continuity. No auxiliary supercuspidal component is assumed. | None |
| 6.5 Euler identity | Missing local model; local constants with product 1; three constituents | Both sides vanish in the obstruction branch without dividing by a period. Constants cancel globally, and the coefficient is 1/8. | None |
| 7.1 adjacent nonvanishing | n=1; endoscopic parameter; fixed unsuitable h; nontempered local components | The theorem existentially chooses h and retains n=1 and endoscopy. No temperedness premise is inserted. | None |
| 7.2 stable specialization | Single constituent in each degree; n=1 boundary; bad places | The cited stable source has n>1; n=1 is available independently from 7.1. Bad places remain included. | None |
| 7.3 refined proposition | Counts `(1,1)` and `(2,1)`; zero vector; zero mixed pairing | Coefficients vary correctly. Positive diagonal norms control division; mixed polarization avoids division by a mixed pairing. | None |
| 7.4 GGP.8 | Central zero; endoscopic counts; vector, pairing and Haar rescaling | Central zero forces zero period with defined local terms. All normalization tests agree, and the refined proposition is a conclusion, not a premise. | None |
| `splitLineFrame` and its theorem | `(1,1)`, `(1,0)`, rational `(2,1)`; characteristic 2 | Norms 1, 0 and 2 distinguish a basis from mere nonzeroness or norm-one membership. The all-field signature is valid. | None |
| `linearFirstPairing` | i in either slot; scalar c; zero space | The slots give i/−i, first linearity and second conjugate-linearity. Completeness is unnecessary. | None |
| `algebraicBesselModel` and equivariance | Scalar character; trivial group; fixed tensor with target action −1 | Covariance uses the target character, and the fixed tensor is annihilated in the −1 test. No smooth-category assertion is encoded. | None |
| `componentCentralElement` and character theorem | Empty index; one multiplicity-two constituent; two multiplicity-one constituents | Multiplicity parity differs from a component generator. The coordinate-sum character evaluates to 1 on each generator and 0 on their sum. | None |
| `unitaryConstituentSigns` and cardinal theorem | Empty indices; counts `(1,1)` and `(2,1)` | Orders are 1, 4 and 8; the cardinality theorem retains both finite-index hypotheses. | None |
| `unitaryConstituentCoefficient` and formula | Same three counts; possible zero denominator | Values are 1, 1/4 and 1/8. The identity element guarantees nonempty finite sign group, so its complex cardinal is nonzero. | None |

### Duplication, supplier order and gap audit

The pinned revisions agree with the README: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Object searches included sesquilinear forms, orthogonal complements, isometries, unitary matrices, tensor actions, dual actions, intertwiners, finite sign groups, smooth globalizations, Whittaker models, local factors and adelic measures. The following native carriers are correctly imported rather than replaced:

| Object | Verified owner |
| --- | --- |
| Nondegenerate sesquilinear form and orthogonal submodule | `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:595`; `Mathlib/LinearAlgebra/SesquilinearForm/Orthogonal.lean:48` and line 54 |
| Algebraic intertwiner, tensor action and dual action | `Mathlib/RepresentationTheory/Intertwining.lean:36`; `Mathlib/RepresentationTheory/Basic.lean:618`, line 626 and line 670 |
| Identity-Gram unitary group | `Mathlib/LinearAlgebra/UnitaryGroup.lean:58`; this is not the requested arbitrary-form group scheme |
| Finite function and sum cardinalities | `Mathlib/SetTheory/Cardinal/Finite.lean:217` and line 242 |
| Hopf-algebra points with convolution | `TauCeti/Algebra/AlgebraicGroup/PointsFunctor.lean:150` |
| Completed projective tensor and complete-target universal property | `TauCetiRoadmap/NoncommutativeGeometry/README.md:86` |
| Archimedean genericity, nuclearity and ordinary growth | AutomorphicFormsOnReductiveGroups §§2.6–2.7, particularly README lines 431 and 448 |
| Actual Whittaker realization and normalized adjacent RS functional | AutomorphicLFunctionsAndLocalFactors, Representation prerequisites and AL.3, particularly README lines 241, 1959, 2054 and 2306 |
| Arbitrary field Hermitian carrier | GeometryOfNumbersAndQuadraticArithmetic §2.9; omitted from the package's imports, as R01 records |

Main's finite-dimensional ClassicalGroups branching and LieGroups constructions do not supply the local admissible restriction theorem. OrthogonalSpinGroups explicitly leaves Hermitian/unitary theory outside its scope. The seven named open-roadmap contexts were searched at the available heads or board snapshots: QSeriesPartitionsAndMockModularForms, K3SurfacesAndSymplecticBoundedness, CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics. Their relevant matches concern scalar special functions or arithmetic Hermitian line bundles, and do not duplicate these Bessel targets.

All 40 Needs lines were read; their local target edges point backward in the stated build order. Supplier references to actual sections and declarations were checked against main or the available earlier-roadmap heads. The missing all-inner-form, local-analysis and relative-transfer results are explicitly gaps, not falsely asserted imports. In particular, EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 retain classification premises, ModularityAndLanglandsExtensions §§3.13, 3.15, 3.20 and §§5.1, 5.4 do not by themselves supply the requested unconditional all-inner-form unitary package, and AutomorphicSpectralTheory §6.3's compact-support multiplier is not the requested Schwartz-isolation theorem.

All **36 gap slugs** occur both in the plan and in a named README supplier contract; none has supplier `none`. The brief first sentences are read together with their explicit hypotheses, normalization and output paragraphs. The following table records the ownership/minimality checks; R01 is the sole failure found.

| Gap group | Slugs checked | Result |
| --- | --- | --- |
| Hermitian foundations | `hermitian-unitary` | The split/module and representable-group extensions remain additional; the existing field carrier must be imported: R01. |
| Finite-place categories and representations | `local-categories`, `local-bernstein`, `local-mirabolic`, `gl-tempered-genericity`, `local-jacquet-filtration`, `local-spherical` | The existing smooth category, dual, induction, Jacquet filtration, Bernstein support, derivatives and Satake constructions are imported. The specified relative comparisons, simultaneous exclusions and normalization supplements are additional. The genericity repair excludes the already supplied infinite-place result. |
| Globalizations and automorphic realization | `archimedean-globalization`, `archimedean-generic-induction`, `archimedean-seminorms`, `automorphic-realization` | Tensor completion, nuclearity and ordinary growth are imports. Relative smooth-dual continuity, the specified JSZ family, every Whittaker decay order with fixed growth exponent, and the restricted completed realization comparisons are separate requirements. |
| Local distributions and analysis | `distribution-gk`, `local-schwartz-germs`, `local-tempered-bounds`, `local-plancherel`, `local-fourier-extension`, `local-smoothing-trace` | The contracts specify test spaces, field ranges, Fourier homogeneity, centralizer germs, measures, actual tempered dual and summable smoothing expansions. They do not assume the Bessel symmetry, relative integral or trace identity. |
| Parameters and ordinary transfer | `enhanced-packets`, `global-parameters`, `ordinary-endoscopy` | Actual correspondence, central restrictions and normalization comparisons remain substantive beyond the cited conditional/general interfaces. Ordinary geometric transfer and enhanced character identities retain separate owners. |
| Real oscillator and theta | `real-oscillator-model`, `real-small-theta` | Existing splittings and theta carriers are imported; mixed-model estimates and the real tempered signature/enhancement formulas are additional. MetaplecticAutomorphicForms §3.43 is a specified nonarchimedean dichotomy, not this real theorem. |
| Measures and factors | `adelic-measures`, `factor-epsilon-identities`, `tempered-local-regularity`, `hermitian-global-values`, `local-rankin-selberg`, `whittaker-pairing-fourier`, `global-mirabolic-norms` | The comparison formulas retain quotient disintegration, signed Asai conventions, local nonzero values versus possibly zero global central values, actual pole orders and the differential Haar constant. Existing RS analytic theory is imported separately. |
| Spectrum and isolation | `automorphic-spectrum`, `spectral-isolation` | Actual kernels, regularized periods and support-preserving Schwartz isolation are requested, rather than arbitrary distributions satisfying the desired endpoint. |
| Relative comparison | `relative-geometric-comparison`, `relative-finite-transfer`, `relative-archimedean-transfer`, `relative-fundamental-lemma`, `relative-character-comparison` | The fixed groups, characters, measures and transfer factors specify exact finite transfer, dense infinite transfer, spherical units at inert places and explicit local constants with global product one. The final period identity is not a premise. |

The prescribed dependency check completed with exit 0 and exactly this output:

```text
depcheck: 8 roadmaps, 57 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The named registered suppliers precede this roadmap. R01's proposed new direct import also precedes it; the repair must preserve the distinct earlier position of ReductiveGroupsPartII. No object was moved or file edited during this review.

### Lean and file validation

The prescribed `lake env lean` invocation on `packages/GanGrossPrasadUnitaryGroups/Suggested.lean`, run from the content checkout, completed with **exit 0**. Its only diagnostics were **five warnings that declarations use `sorry`**, at lines **25:8, 74:8, 121:8, 164:8 and 187:8**. There were no errors or other warnings. The sole import is `Mathlib`, so no Tau Ceti object-file build was required.

A separate scratch elaboration of the same file with `#check @name` for all **11 named declarations** also completed with exit 0 and the same five warnings. The elaborated types retain their field, group, complex module, normed inner-product, finite-index and decidable-equality binders. No discarded section hypothesis was found. The file is **203 lines**, with **six real-bodied definitions/abbreviations**, **five theorem statements** and **12 proved examples**, two per definition. Every named Lean declaration occurs in the README. The analytic endpoints remain README targets because their carriers are not available at the pins.

Both TOML files and the plan JSON parse. The manifest records the cited works, and the package-only whitespace check passed. Both Lean processes completed; none was left running. The authored README, Lean file, metadata, plan and manifest remain unchanged.

## Not verifiable

- **`xue-bessel`**: its exact theorem number and pagination remain unverified in the manifest. Its status is `waived`, and its `cited_for` says no theorem is inferred from it. The waiver was honored; no missing-reference request was opened for it.
- **Future supplier constructions**: the 36 declared gaps are contracts, not discharged theorems. Their statements, ownership and registration were audited; their implementation and proofs cannot be certified from this package. This is not an additional finding. R01 identifies the specific contract-minimality defect.

All 15 sampled target texts were readable. The online viewer timed out on the institutional Xue PDF, but the recorded legal cached PDF was readable and was rendered locally to check the formulas obscured by OCR. No sampled source claim remains unread, and no new missing source was identified.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "546bb44ca76021251590128423deeade5f1b931f", "job": "REV-PKG-GanGrossPrasadUnitaryGroups~4", "model": "gpt-6-astra", "worker": "chris-4"} -->

<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1152#issuecomment-6436569124 -->
Red team round 1 pass a (codex) of 6c3c8b8

Verdict: needs_changes

1. **F01** (P2) Arbitrary central characters do not enter the supplied excursion decomposition

   **Location:** packages/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md:702–708, :736–742; compare :51 and :326. Claim: §§4.2–4.4 realize arbitrary reductive local parameters in occurring global parameters, while their explicit central-character clauses require compatibility only at z.

   **Witness:** For K=F₄(t), G=G_m, ℓ=3 and ξ(a)=3^deg(a), Π=ξ is cuspidal, but ξ(Ξ)≠1 for every cocompact central lattice. Frobenius value 3 cannot belong to a continuous finite-coefficient Galois character.

   The parent supplies a decomposition of the Ξ-invariant cusp space, not this representation: TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:1828–1842. FunctionFieldArithmetic §6.2 explicitly requires the central character to be trivial on Ξ (TauCetiRoadmap/FunctionFieldArithmetic/README.md:2139). Section 2.1 here only defines occurrence for semisimple G. If the phrase “compatible central character and central lattice” at line 51 is intended as a standing restriction, it excludes this input despite §§4.2 and 4.4 stating compatibility only at z; the general essentially discrete-series formulation is then not supplied. The local reductive-central-reduction gap does not supply a global twisting construction. Merely saying “every occurring” makes the assertion vacuous in this example; it cannot provide the asserted realization. Likewise §4.4 applies §4.3 directly to essentially discrete series although that input requires discrete series with unitary central character.

   **Exact repair text:** Add an owned target before §4.2: “For a reductive cuspidal automorphic representation Π, construct an automorphic character χ such that Π₀=Π⊗χ⁻¹ has central character trivial on a cocompact central lattice Ξ. Prove compatibility of this twist with all local parameters and excursion occurrence. Define the parameter of Π by the central Weil twist σ=σ₀·χ̂; assert extension to a continuous Galois parameter only under the corresponding ℓ-adic-unit condition. Use σ₀ in the adjoint purity argument. Normalize essentially discrete series before applying §4.3 and undo the same global twist afterwards.” Name the supplier for any missing global normalization input in a matching README/plan gap, and extend the occurrence definition to this normalized reductive setting.

   **Retest:** In the witness choose χ=ξ. Then Π₀=1 and σ₀(Frob)=1 occur on the Ξ-quotient; the untwisted Weil parameter has value 3 and its adjoint is trivial. No nonexistent Galois character or Ξ-fixed vector is required.

2. **F02** (P2) Uniformization drops the parahoric-model hypothesis

   **Location:** packages/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md:426: “G connected reductive with a smooth model”. Claim: the formal representability and uniformization theorems cited there apply to this class of models.

   **Witness:** lh line 248 assumes a parahoric group scheme; lh line 1574 repeats this hypothesis for global uniformization. Smoothness alone includes the congruence model Spec O[x,(1+tx)⁻¹] of G_m, whose special fibre is G_a.

   That model has O-points 1+tO, whereas the torus's parahoric model has O-points O× and special fibre G_m. It is not the model in the cited theorem. The parent's global constructions likewise use connected parahoric models (TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:1840).

   **Exact repair text:** Replace the model clause by: “Let 𝒢/X be a connected parahoric group scheme with connected reductive generic fibre G, reductive away from finitely many places, and use its parahoric restriction to the formal disc at v. Congruence subgroups are imposed as levels on this model.” If arbitrary smooth models are intended, retain that generalization as a separate target with its representability hypotheses and proof inputs, rather than attributing it to Li-Huerta.

   **Retest:** The displayed congruence subgroup is still covered as positive level on the parahoric G_m model; the false implication ‘smooth model ⇒ parahoric model’ is no longer used.

3. **F03** (P3) GHS Definition 2.5 is not the geometricity definition cited here

   **Location:** packages/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md:137 and :165. Claim: ghs Definition 2.5 supports mixed integer-weight geometricity and its independence of faithful realization.

   **Witness:** ghs line 329–335 defines purity with one common weight. At q=4, a G_m parameter with Frobenius 2 has weights {1} in id and {1,0} in the faithful representation id⊕1.

   The roadmap's geometricity predicate correctly accepts both realizations; the cited GHS common-weight predicate does not. This distinction already appears in the roadmap's §0.3 Checks.

   **Exact repair text:** In §§0.1–0.2 retain “ch26, §2.3, Definition 2.5, p. 7; ch26 line 323” and remove GHS Definition 2.5 as supporting authority for this predicate. If retained as background, label it explicitly as a different, common-weight purity definition whose faithful-realization assertion requires correction.

   **Retest:** The weights {1} and {1,0} satisfy ch26's integer-weight geometricity definition; neither citation now asserts that both have a single common weight.

4. **F04** (P3) The type-D half-spin Check has the wrong surviving points

   **Location:** packages/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md:847: “the spin representation alone leaves ½ω₁ and ½ω₂”. Claim: both residual points pass the half-integrality test for the chosen half-spin module when n is even.

   **Witness:** In D₄, ω₁=(1,1,1,1)/2 and ω₂=(−1,1,1,1)/2. Half-spin V(ω̂₁) has pairings {1/2,0,−1/2} at ω₁/2, but {1/4,−1/4} at ω₂/2. Only the first survives.

   These coordinates are ch26 line 1039; the second failure is already detected by the highest weight, with pairing 1/4. The separator theorem and the chosen half-spin-plus-vector test family are unaffected.

   **Exact repair text:** Replace this Check with: “For PSO₈, V(ω̂₁) has pairing multiplicities 1,6,1 at 1/2,0,−1/2 on ω₁/2, but multiplicities 4,4 at 1/4,−1/4 on ω₂/2. Thus it leaves the first spin-node point and excludes the second. The vector module excludes both spin-node points but leaves ω₄/2; together the two modules exclude all three. For even n the surviving spin-node point switches when n changes from 0 to 2 modulo 4.”

   **Retest:** For D₄ the new Check gives respectively half-integral/non-half-integral; for D₆ the highest-weight pairings are 3/4 and 1/2, so the two outcomes switch. The vector highest-weight pairing on either spin-node point is 1/4, while all vector pairings on ω_n/2 are 0 or ±1/2.

5. **F05** (P3) The trivial-representation Check drops the outer Frobenius factor

   **Location:** packages/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md:511. Claim: for every G the trivial representation has Frobenius q^(ρ̂), with eigenvalues integral powers of q^(1/2).

   **Witness:** Take the norm-one torus of the unramified quadratic extension. Its L-group is G_m⋊C₂ with inversion action. The trivial character's Frobenius swaps the two weight spaces of the induced faithful representation, giving eigenvalues 1,−1, not 1,1.

   Here ρ̂=0 and q^(ρ̂) alone is the identity, even though the parameter must project to the nontrivial Frobenius component. The eigenvalue −1 is not a power of the positive square root at q=4. Both eigenvalues have weight zero, so geometricity itself survives.

   **Exact repair text:** Replace the Check by: “For split G, the trivial representation has normalized semisimple Frobenius q^(ρ̂). For nonsplit G retain the prescribed finite outer component; in algebraic L-group realizations the eigenvalues can include root-of-unity factors. For the unramified quadratic norm-one torus, the trivial character gives the swap matrix with eigenvalues 1 and −1, both of weight zero.”

   **Retest:** The split torus gives (1,1) in the two-weight realization; the norm-one torus gives (1,−1). Both project correctly and have weights (0,0).

6. **F06** (P3) Several Checks merely repeat their definitions or conclusions

   **Location:** packages/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md:155, :901, :1049 and :1130. Claim: these bullets discriminate the geometricity, lift, realization and place-independence interfaces.

   **Witness:** The GL_n bullet restates the eigenvalue predicate; the lift bullet repeats equality of real parts; the scheme bullet chooses the defining witness; the place-independence bullet repeats the definition. None computes a distinguishing instance.

   **Exact repair text:** Replace the four bullets, respectively, with:

   - “At q=4, diag(2,3) has weights 1 and log₂3, so it is not geometric although its first summand is.”
   - “The two SL₂ lifts ±I of identity in PGL₂ have traces ±2 but the same real part zero; the lift theorem does not identify their characteristic polynomials.”
   - “For the constant quadratic cover U×F_(q²)→U, the rank-two direct image has Frobenius eigenvalues 1 and −1 at a rational point. Its nontrivial rank-one constituent is realizable, although it is not the constant sheaf.”
   - “In SL₂, I and −I both have weight multiplicity n(0)=2, but have traces 2 and −2. Equality of weight patterns does not imply equality of full Satake classes.”

   **Retest:** The new outputs distinguish integer from noninteger weights, central-lift traces, a nonconstant realizable constituent, and full Satake classes with equal real parts. They retain the original statements in the surrounding API.

7. **F07** (P1) The algebraic test representations are attributed to a Lie-module supplier

   **Location:** packages/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md:850 and :874, also :105. Claim: RepresentationTheory/LieHighestWeight Layers 0 and 6 supply the algebraic highest-weight realizations used in Rep(Ĝ_sc⋊Γ).

   **Witness:** TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:804 defines the representation ring of Lie modules. The rational group category, integration and algebraic highest-weight modules are instead targets of TauCetiRoadmap/ReductiveGroups/README.md:1733 and :1759, §§10A–10B.

   Layers 0 and 6 supply strings and characters, not an algebraic group action with coefficient maps and base change. This is material for the spin and E₇ modules: a Lie-module carrier alone cannot be used in the L-group realization functor. Neither ReductiveGroupsPartII §RG2.5's construction of the dual group nor finite induction supplies this missing input.

   **Exact repair text:** Add to the supplier contracts and §5.1 Needs: “ReductiveGroups §§10A–10B supplies the finite-dimensional rational representation category of the split dual group, its actual character lattice, algebraic highest-weight modules, scalar extension and their Weyl characters. RepresentationTheory/LieHighestWeight Layers 0 and 6 supplies the differentiated sl₂ strings and Lie-character comparisons.” Construct the listed test modules using that algebraic owner before inducing across Γ. Use the same distinction in §8.0's character-recognition input.

   **Retest:** The highest-weight-one Lie module of sl₂ has dimension 2 and integrates to SL₂, where −I acts as −I; it does not descend to PGL₂. The rational character-lattice interface accepts it for the simply connected dual used here and rejects the wrong adjoint carrier. No new representation theory is planned twice.

## Verified sound

Read all 1,442 README lines and all 53 Suggested.lean lines. Inventory and test counts: **0 Lean declarations**, **52 numbered README targets**, **6 additional bold targets inside §4.0**, and the separate local theorem within §5.1: **59 target families**. All **186 Check bullets** were assessed against their definitions, hypotheses and conventions, with explicit instance calculations for **59 target families** and the shared conventions; the computed instances below record the boundary/normalization tests, rather than claiming to prove the roadmap's deep theorems by examples. Findings R04–R06 concern Checks. The six bold targets each have a separate row below.

The package diff is confined to its folder. The acceptance file has one `import Mathlib`, the required namespace and a module docstring; it contains no sorry'd data, placeholders, `set_option`, admitted examples, duplicate fully qualified names or padding. Its declaration/context inventory is empty: there are no variables, instances or signatures to elaborate, so no `#check` scratch run or Lean build was performed.

The headline inventory is: geometricity independence and pure-completion uniqueness (§§0.2, 0.4); absolute twist decomposition, boundary integrality and irreducible-parameter purity (§§1.1–1.4); local excursions, formal/analytic uniformization and local–global compatibility (§§3.0–3.2); Kloosterman, oper, localization, Bessel and adjoint-rigidity comparisons (§4.0); globalization, pseudo-globalization, discrete-series purity and coefficient transport (§§4.2–4.8); spherical separation, lifted integrality, Ramanujan and genericity (§§5.1–5.5); elliptic purity, Lafforgue–Zhu and conditional constant-coefficient realization (§§6.2–6.5); rationality and Xue quotients (§§7.5–7.6); complementary-series propagation, named weight comparisons and elimination (§§8.2, 8.5–8.6). The module docstring names these unavailable interfaces and their missing carriers. The proposed global Arthur decomposition remains conjectural. Property A is explicitly an auxiliary combinatorial theorem, not a substitute headline.

At the pins, `Finsupp` has an actual finite support with membership equivalent to nonzero value (Mathlib/Data/Finsupp/Defs.lean:88); `Finsupp.sum` is generated from the support product (Mathlib/Algebra/BigOperators/Finsupp/Basic.lean:47); `Finsupp.mapDomain` sums fibres rather than selecting an arbitrary preimage (Mathlib/Data/Finsupp/Basic.lean:267). `Finset.sum_comm` and `Finset.sum_eq_single` are the additive declarations generated at Mathlib/Algebra/BigOperators/Group/Finset/Sigma.lean:120 and Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean:354. Thus §8.4 is statable on native finite arrays. TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:272 requires discrete topology and open stabilizers; it does not supply arithmetic parameters. TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean:91 defines roots of a classical newform polynomial, not reductive Satake classes. Object searches at both pins found no arithmetic shtuka, excursion-algebra, Weil–Deligne/L-group or Bessel-isocrystal carriers that would make the listed headlines statable with a few elementary definitions.

### Computed statement and context table

Context abbreviations: **L** means a local equal-characteristic field with finite q≥2, ℓ≠p, characteristic-zero realizations and finite inertia in the semisimple Weil parameter. **G** means a smooth projective geometrically connected finite-field curve, finite bad set, and the stated finite coefficient model. **S** adds semisimple G and the prescribed finite outer projection. **A** means actual automorphic occurrence, full-level Hecke action and the stated central/level conditions. These contexts are mathematical README contexts; none is silently asserted to be a Lean instance. A result marked “agrees” concerns the displayed calculation only. Carrier-incompatible cases (zero coefficient ring, q=1, infinite-dimensional realization, inseparable induced torus) are tested as exclusions, not substituted into hypotheses they do not satisfy.

| Statement | Context and instances tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| Conventions, README:17–31 | L; q=4, degree 2, rank 0; Tate line; two-term N | Tate eigenvalue 1/4 has weight −2; inverse 4 has weight 2. diag(1,4) conjugates E₀₁ to E₀₁/4. Eigenvalue 2 becomes 4 over q=16; both normalized weights are 1. Rank 0 gives the empty multiset. | Agrees; q=1 would make every weight equal and is excluded. |
| §0.1 geometricity | L; G_m, q=4, eigenvalues 2 and 3; q=5, (3+4i)/5 | Weights are 1 and log₂3 respectively: first integral, second not. Both conjugates of (3+4i)/5 have norm 1 and weight 0, though the value has infinite order. | Predicate agrees; R03 corrects its source. |
| §0.2 independence | L; id versus id⊕1; S₃ with C₃ inertia; cyclic C₃ | At value 2, weights {1} and {1,0} are both integral. At q=5 both transpositions have eigenvalues {1,−1}, weights {0,0}; q=4 permits commuting C₃, q=5 forces inversion. | Agrees; nonfaithful trivial realization would wrongly accept value 3. |
| §0.3 WD purity | L; Sp₂ with r=diag(1,4), N≠0; N=0; G_m | With N≠0, gr₂→gr₀ is an isomorphism and centre weight is 1. With N=0 the same map is zero between one-dimensional spaces. G_m id⊕1 at value 4 has weights 2,0, not one common weight. | Agrees; arithmetic and fixed-embedding purity remain distinct. |
| §0.4 completion uniqueness | L; normalized Sp₂, q=4; pair (1,16) | Pair (1/2,2) with N linking the two weights has bounded Weil×SL₂ factor and weight 0. Weights 0,4 for (1,16) cannot be one Jordan string: N lowers by 2 and must be zero. | Existence is not inferred from arbitrary geometricity. |
| §1.1 twist decomposition | G; constant values 3 over F₄, 1+i and 1+2i over F₂; permitted ℓ | 3 has weight log₂3; twisting by 1/3 gives 1, weight 0. Norms √2 and √5 give weights 1 and log₂5, so the two latter constants lie in different integer-twist classes. | Agrees; ℓ=5 and ℓ=7 retain continuous étale constants. |
| §1.2 boundary propagation | G; constant 3 over F₄; rank-one finite order; one removed good place | At every degree d, value 3^d over 4^d has weight log₂3, so no geometric anchor exists. A finite-order line has weight 0 before and after restriction. | Agrees; the nongeneric constant fails the hypothesis, not the conclusion. |
| §1.3 irreducible purity | G,S; SL₂ split pair (2,1/2), q=4 | Standard weights {1,−1}; the invariant low-weight line is preserved by the lower Borel, so this parameter fails irreducibility. The positive-root matrix sends low to high and does not preserve the increasing filtration. | Agrees with the corrected sign; not a counterexample to irreducible purity. |
| §1.4 local purity | G,S; normalized Steinberg; reductive central factor | Standard local weights {−1,1} have centre 0 and a nonzero N linking them. On G_m, Ad⁰ has dimension 0 even if central Frobenius is 3. | Semisimple/adjoint distinction agrees; R01 concerns its global use. |
| §2.1 occurrence | G,S,A; one simple Hecke factor with multiplicity 2 | Two one-dimensional excursion summands each admit the same simple Hecke module; m=2 is independent of dim π^U. For SL₂ pair (2,1/2), trace=5/2 and polynomial=1−(5/2)T+T². | Occurrence is a relation, not a uniquely chosen parameter. |
| §2.2 rationality | G,S,A; q=4, normalized Hecke value a=5 | q^(−1/2)a=5/2=2+1/2; both Satake roots 2 and 1/2 are algebraic. This scalar test alone does not impose cuspidal temperedness. | Normalization agrees. |
| §2.3 real Satake part | L; SL₂ pairs (2,1/2), (√2,1/√2), (i,−i), q=4 | Real exponents are (1/2,−1/2), (1/4,−1/4), (0,0); weights are ±1, ±1/2, 0,0. | Compactness gives ν=0; half-integrality is a separate test. |
| §3.0 local excursions | L; trivial group; torus value a=2; St and trivial PGL₂ | Trivial-group invariant functions act as scalars; torus trace detects 2 versus 1/2. St and trivial have trace 5/2 on the standard dual realization despite different N. | Semisimple extraction cannot recover N; uniform cutoff retains all I,V. |
| §3.1 uniformization | G; GL₁ lattice z⁻¹O; dual numbers; degree-2 place | Glued line degree is 1·deg(v), hence 1 or 2. ε survives over k[ε]/ε² but becomes 0 on reduction. α⁴=α+1 and α¹⁶=α; with s=3, κ=2 the bounds are 3→5→7. | Frobenius iteration/sign agrees; model scope needs R02. |
| §3.2 local–global comparison | G,A; unramified SL₂ pair (2,1/2); ramified St | Both sides give trace 5/2 and determinant 1. St and the same pair with N=0 have equal semisimplifications. | Statement compares semisimple parameters, not WD operators. |
| §3.3 parameter transport | L; products, rank-one inverse, induction | Product traces add in a direct-sum realization: 2+1/2=5/2; determinant is 1. Induced constituents St and trivial retain the same pair. A coefficient sign on √5 is a finite central factor. | Agrees with the separate square-root transport contract. |
| §3.4 geometric representations | L; trivial PGL₂, unramified G_m value 3, nonsplit norm-one torus | PGL₂ weights ±1 are integral; value 3 at q=4 has weight log₂3; nonsplit torus has eigenvalues 1,−1 rather than 1,1. | Geometricity agrees; R05 repairs the claimed formula. |
| §3.5 conjugates | L; (3±4i)/5; q=5 square roots; q=4 square root | Both conjugates have norm 1 and weight 0. √5↦−√5 changes sign, not weight 1; √4=2 is rational and fixed. | Finite normalization cocycle is necessary and correctly declared. |
| §3.6 tori | L; unramified quadratic E/F; χ(ϖ_E)=q_F^(1/2); inseparable degree p | q_E=q_F², giving weight 1/2; induced Frobenius roots ±q_F^(1/4) have the same weight 1/2. Purely inseparable restriction has geometric unipotent radical dimension p−1. | Rejects the wrong q_F-only criterion and the inseparable “torus”. |
| §3.7 induction/Jacquet | L; PGL₂ normalized reducible principal series, q=4 | Both constituents have eigenvalues (2,1/2), hence integer weights ±1, although their nilpotent operators differ. Tensor weights add and dual weights negate. | Geometricity survives the operations at their stated constituent level. |
| §3.8 central character | L; GL₂ Steinberg; nonsmooth μ_p | Product of normalized eigenvalues is 2·1/2=1, central weight 0. μ_p(F_p) has one point, unlike a smooth central torus. | Smooth-central restriction is retained. |
| §4.0 étale anchor | G; rank-one factor, p=2; product A₁×G₂ | Ad dimensions/ranks are 3/1 and 14/2; product rank is 3 and Swan totals add to 3. Full inertia invariants, not irreducibility of Ad, are required to be zero. | All-prime extension uses the stated Bessel comparison, not HNY's good-prime theorem alone. |
| §4.0 invariant parameters (bold) | Characteristic zero; λ=−π; h=2,3; A₁ quotient ab | Scaling gives π²c in A₁ and −π³c in A₂. (1,c) and (2,c/2) both give invariant c; 2c gives a different quotient point. | Sign and scale agree. |
| §4.0 oper singularities (bold) | Characteristic zero; pinned coordinate; A₁ | Coefficient c=0 gives tame d+N dx/x. c≠0 gives slope 1/2; replacing cx by cx² gives slope 1 and violates the bound. | Zero is retained in the oper space; genericity is imposed later. |
| §4.0 localization (bold) | H adjoint; A₁ chart V of dimension 2 | Cotangent dimension=4 and moment fibre dimension=2. On E_η with η=λt, ∂e=−λe and (−∂)e=λe. For λ=−π these are π and −π. | Full U(V) specialization and the infinitesimal sign agree. |
| §4.0 Bessel companion (bold) | G; finite coefficient extensions; tensor unit; A₁ | Tensor unit has Frobenius 1 and polynomial 1−T on both sides. Principal rank-two residue has kernel dimension 1; zero residue would give 2 (and Ad kernels 1 versus 3). | These tests do not identify a connection merely by slope/residue; the full comparison is an explicit target. |
| §4.0 adjoint rigidity (bold) | G; r,h of A₁ and G₂; small primes | floor(3/2)=1 and floor(14/6)=2; together with the lower bounds r these force Irr=1 and 2. The same integers apply at p=2,3. | Agrees conditionally on the declared slope and semisimplicity inputs. |
| §4.0 étale transfer (bold) | Actual companions; A₁ at q=4; A₄ inertia example | Boundary Frobenius eigenvalue 1/4 gives det(1−TF)=1−T/4; inertia average (3−3)/12=0. Ad reducibility of dimensions 1+2 is compatible with zero invariants in each summand. | Adjoint conductors/invariants are compared, not full geometric monodromy groups. |
| §4.1 tempered/discrete | L; G_m unramified character 3, q=4; finite-order character | Proper-parabolic exponent conditions are empty for both; central absolute values 3 and 1 distinguish nontempered from tempered. Compact anisotropic finite-dimensional cases have unit-modulus eigenvalues. | Central unitarity is essential and retained. |
| §4.2 supercuspidal globalization | G,A; G_m, ξ=1 and ξ=3^deg; derived group nontrivial | For ξ=1 there is one prescribed torus representation and Ad dimension 0. For ξ=3^deg, a degree-d lattice acts by 3^d≠1; its invariant subspace is zero. | R01; cannot obtain a nonzero excursion block from the supplied quotient. |
| §4.3 pseudo-globalization | G,A; PGL₂ St pseudo-coefficient; one supercuspidal factor | Tr_St(f)=1, Tr_triv(f)=−1, so trace on the reducible principal series is 0. Nonzero trace detects common cuspidal support, not equality of constituents. | The repaired pseudo-globalization formulation agrees. |
| §4.4 discrete-series globalization | G,A; St and an unramified nonunitary twist | St has pair (2,1/2); multiplying by 3 gives (6,3/2), central determinant 9. Adjoints agree, but the twist is not unitary discrete series for §4.3. | R01 requires normalization before that application. |
| §4.5 WD purity | L; semisimple normalized Sp₂; reductive central twist | Weights ±1 have centre 0; central multiplication by 3 changes absolute weights but leaves the adjoint ratio 4 unchanged. | Semisimple/all-realization and reductive/adjoint conclusions are correctly separated. |
| §4.6 algebraic discrete series | L; St with rational model; G_m central character | St weights ±1 and finite model establish geometricity. A value 3 at q=4 is algebraic but has noninteger weight log₂3, so an algebraic model alone is insufficient in the reductive central direction. | Stated central hypothesis excludes the latter. |
| §4.7 conjugate discrete series | L,S; rational St; unramified twists | Rational St is unchanged by embeddings; on the negative chamber its normalized Jacquet exponent has absolute value q^(−1/2)<1. Twisting changes the centre, showing why the semisimple condition and separate central reduction matter. | No claim that a common-cuspidal-support globalization descends the original representation. |
| §4.8 temperedness transport | G,S,A; geometric eigenvalue (3+4i)/5; complementary pair | Every conjugate of the first value has modulus 1. At q=4 the complementary pair has weights ±1/2, failing arithmetic geometricity. | Arithmetic geometricity is not replaced by one complex absolute value. |
| §5.1 test family | S; A₁, B₂, D₄ and D₆ | A₁ separator pairs to ±1/4 where Ad pairs to ±1/2. B₂ vector values are ±1/2,0,0,0; spin values ±1/4 twice. D₄ half-spin at the two spin-node points gives {±1/2,0} versus {±1/4}. | R04; the test-family theorem itself survives. |
| §5.1 local separator theorem | L; central-compact A₁; noncentral compact G₂ | A₁ complementary pair at q=16 has values 2,1/2 and weights ±1/2. G₂ positive-coroot values at q=4 are −1,2,−2,2,−2,−4, none 4 or 1/4; removing compact signs gives +4. | Central-compact restriction has a separating witness; odd-unitary exception is retained. |
| §5.2 finite central lift | G,S; SL₂→PGL₂; p=2; two lifts ±I | Finite kernel is {±1}; constant-coefficient H² vanishes in characteristic 2 by Artin–Schreier. ±I have real part 0 and traces ±2. A Galois inversion action makes c(γδ)=c(γ)γ(c(δ)). | Distinguishes constant μ₂ coefficients from the characteristic-2 group scheme; R06 improves a Check. |
| §5.3 integral weights | G,S,A; St anchor; a degree-2 restriction | Local weights ±1 become eigenvalues 4,1/4 over q=16, still weights ±1. An unnormalized 3-valued line would give log₂3 and cannot satisfy the anchor. | Fixed-embedding and all-embedding conclusions remain separate. |
| §5.4 Ramanujan | G,S,A; central-compact PGL₂; G₂ witness | At q=4 the nonzero complementary exponent 1/4 gives weights ±1/2 and is excluded by integral separator weights. G₂ above has nonzero ν despite integral root weights if compactness is dropped. | The required compact-factor condition prevents that counterexample. |
| §5.5 genericity | G,S,A; PGL₂ tempered spherical pair | For compact eigenvalues (i,−i), root ratio −1 is neither q nor q⁻¹; the principal series is irreducible and generic. Trivial representation has root ratio q and is not this case. | General-isogeny/Whittaker input is explicitly a supplier contract. |
| §6.1 ellipticity | G; GL₂ reducible/irreducible; torus; Klein four | Reducible diagonal GL₂ centralizer modulo centre has dimension 1; irreducible case has dimension 0. Torus quotient has order 1; Klein-four image in PGL₂ has finite centralizer of order 4, not order 1. | Both directions require semisimplicity; finite need not mean trivial. |
| §6.2 elliptic purity | G,S,A; reducible diagonal pair versus irreducible | Pair (2,1/2) gives a one-dimensional adjoint invariant Cartan, contradicting ellipticity. An irreducible parameter has that invariant dimension 0, allowing the weight-zero conclusion. | Nonzero-weight split example fails the hypothesis. |
| §6.3 Lafforgue–Zhu | G,A; split GL₂; moving standard factor with/without frozen dual | Without compensation, centre acts with weight 1, so invariants=0. With frozen dual, scalar central weights sum to 0, and std∨⊗std has a one-dimensional invariant. | Full S_σ invariants are needed; nonsplit extension remains conditional. |
| §6.4 realization | G; identity, empty stack, constant quadratic cover; value 3 | Identity gives rank-one R⁰=1; empty stack gives rank 0; quadratic cover gives eigenvalues 1,−1. Value 3 has weight log₂3 and fails the integer-weight consequence. | Conditional constant-coefficient bridge is not replaced by Satake IC coefficients; R06 improves a Check. |
| §6.5 realization weights | G; compact cohomology of A¹; constant 3 | H²_c(A¹)=Q_ℓ(−1) has eigenvalue q and integer weight 2. Constant 3 over F₄ has noninteger weight log₂3. | Sun's mixedness alone is not used to infer integrality. |
| §7.1 weak Arthur data | G,S; trivial and standard SL₂; unbounded Weil factor | Standard Arthur evaluation at q=4 is (2,1/2), weights ±1, N≠0. Trivial SL₂ with Weil pair (4,1/4) has N=0 but weights ±2 and unbounded Weil factor. | Weak data do not silently include boundedness. |
| §7.2 prediction | G,S,A; trivial residual PGL₂; complementary pair; I versus −I | Residual pair (2,1/2) matches principal SL₂ weights ±1. Complementary pair has weights ±1/2 and fails (a). I and −I have equal weight functions n(0)=2 but unequal traces ±2. | Full matching condition is stronger than weight matching; R06 improves a Check. |
| §7.3 compatibility | G,S,A; trivial residual PGL₂; τ=1 | σ(Frob)=(2,1/2) has polynomial 1−(5/2)T+T²; τ=1 gives 1−T. Compatible parameters need not be cuspidal, nor uniquely determined for all groups by single-place conjugacy. | Weil-valued formulation is explicit. |
| §7.4 discrete hypotheses | G,S,A; residual PGL₂; nilpotent excursion algebra | Residual pair has algebraic roots 2,1/2. Algebra E[ε]/ε² has one generalized character block and ε²=0 although ε≠0. | Reducedness is not required; this is a hypothesis package, not an unconditional theorem. |
| §7.5 rationality | G,S,A; finite rational Hecke image | A rational 2×2 operator with polynomial T²−3T+1 has algebraic roots (3±√5)/2. A single transcendental eigenvalue cannot act on a finite rational vector space. | Full Hecke image, rather than good-place eigenvalues alone, supplies a model. |
| §7.6 Xue quotients | G,A; split G; ideals (T−a), (T−a)² and unit ideal | Quotient dimensions are 1,2,0. The second allows a Jordan block; a transcendental a still has codimension 1. Unit ideal yields the zero space and no nonzero parameter summands. | Finite codimension is not algebraicity; local comparison uses the full compact-support identity. |
| §8.0 strata/Aubert | L; PGL₂ St/trivial; Sp₆; residue-cardinality change | St/trivial share (2,1/2) but have N≠0/0. Sp₆ central standard weights are ±1 each three times; extraneous weights are 2,1,0,0,−1,−2. At q=4 and 16 the same normalized root exponent gives values 4 and 16. | Compact factors and the KL q-relation remain distinct from geometric WD q⁻¹. |
| §8.1 global patterns | G,S,A; rank 0; trivial residual PGL₂ | Rank 0 gives n=0. Residual standard realization gives n(1)=n(−1)=1; total rank 2 and symmetry hold. A complementary pair would have noninteger indices ±1/2 and is excluded. | Uses ℤ-indexed finite support, not natural subtraction. |
| §8.2 propagation | G,S,A; degree-2 cover; same real part, different compact factor | Values 2,1/2 become 4,1/4 over q=16 with unchanged weights ±1. Multiplication by −1 changes traces but not these weights. | Only real parts/central-compact strata propagate; no automorphic base change is inferred. |
| §8.3 weight array | G,S,A; a(0,±1)=1; negative diagonal entry at (−3,−3) | First array: row(0)=2, columns(±1)=1, all other displayed margins 0; row reflection exchanges the two entries. Negative diagonal singleton gives row(−3)=column(−3)=1. | Both positive and negative integer indices are needed. |
| §8.4 Property A | Native finite ℕ-valued arrays; zero; translated symmetric pair; missing hypotheses | Zero margins 0=0. a(2,1)=a(2,3)=1 gives c(3)=1>r(3)=0. Unsymmetric a(1,0)=1 gives c(1)=0<r(1)=1; signed symmetric pair gives c(1)=−1<0=r(1). | 19,683 arrays on [−2,2] with orbit values 0,1,2 pass; 243 diagonal cases, 19,440 strict-discrepancy cases. |
| §8.5 extraneous comparisons | L; actual F₄/E₇/E₈ root systems, Cartan zero weights included | F₄ B₃ top (10,9,8): (1,0,2), central (1,0,1). E₇ top (10,9): (1,1), central (1,0). E₈ D₆ top (18,17,16): (1,0,2), central (1,0,1); other maxima 13,9,5 versus 12,8,4. | Root calculations agree. Named-orbit identifications are the explicit supplier gap, not inferred from a matching dimension array. |
| §8.6 elimination | G,S,A; Sp₆ extraneous versus central; zero orbit | At largest discrepancy 2, proposed global row=1 and ramified column=0, opposite to Property A's c>r. Zero orbit has only weight 0, diagonal array and N_i=0. | Inequality direction and graded-monodromy conclusion agree; no full Arthur parameter is constructed. |

### Supplier, ownership and order record

Resolved **18 named supplier roadmaps**, including the two supplied parent/current-function-field heads, and the three downstream names. The ownership search covered the supplied sibling folders, main, Completed and board packages, using object terms as well as the roadmap service's current-head index. The following rows record the interfaces actually consumed; range citations were expanded when checking their sections. R07 is the one supplier attribution that needs repointing to a different existing owner.

| Supplier | Sections resolved and hypothesis comparison |
|---|---|
| GlobalShtukasAndFunctionFieldLanglands | §§1.4, 1.9–1.14, 2.1–2.5, 2.9–2.10, 3.6/3.10/3.12, 4.8/4.12, 5.3–5.10, 6.1–6.2, 7.6–7.9 at the supplied head. Satake coefficients, finite coefficient models, prescribed outer projection and generalized occurrence are retained. Its fixed-Ξ domain is the issue in R01; its connected parahoric domain matters for R02. |
| FunctionFieldArithmetic | §5.8 and §§6.1–6.6 at the supplied head. §6.4 is genuinely connected-reductive finiteness, not just split/GL_n. §6.2's central character is trivial on Ξ. The trace/globalization extension is declared separately. |
| SmoothRepresentationsOfLocalGroups | §§SR.0.2, 1.3–1.5, 2.2, 3.1–3.4, 4.1–4.2, 5.2 at its current head. Discrete series includes the unitary centre; normalized tempered support, coefficient change and linear WD data are distinct inputs. The five requested extensions are explicit gaps, not alleged present theorems. |
| ArithmeticGaloisRepresentations | §2.6 and §§3.1–3.4: finite-dimensional characteristic-zero WD filtration, arithmetic purity and conductor theory; N lowers by two, matching the computed two-term example. |
| DeligneWeightsAndPurity | §§0.1–0.19, 5.2–5.5, 5.11–5.12, 7.8–7.9, 8.5, 8.17–8.18. Fixed-ι splitting is not absolute splitting. Scheme operations do not already supply either declared stack gap. |
| PadicDifferentialEquationsAndRigidCohomology | RD.2.49–2.51, 3.13/3.25, 4.10–4.12, 5.46, 6.23, 6.39, 6.51–6.55, 6.64–6.65, 6.77, 6.84–6.85. In particular RD.6.77's constituent-purity statement is not geometric semisimplicity after forgetting Frobenius; the gap is substantive. Formal slopes and differential slopes are not equated by definition. |
| LanglandsParameterStacks | LP0.1–0.4, LP1.11–1.12, LP2e.5/2e.15, LP2c.1–2c.4/2c.8. Abstract categorical excursions/Schur reconstruction are supplied; the equal-characteristic application remains here. Prescribed projection and actual nilpotent cone are retained. |
| ReductiveGroupsPartII | RG2.3–RG2.4 and RG2.5.1–RG2.5.2: parahoric models, modulus and dual groups with pinned outer action. These sections do not by themselves construct every algebraic highest-weight module (R07). |
| MotivesAndAlgebraicCycles | §6.3: tensor generation uses a faithful closed representation and includes sums, tensors, duals and subquotients. It supports §0.2's mixed integer-weight argument, not common-weight purity. |
| NilpotentOrbits | N0–N2, especially N2.1, N2.2 and N2.4: triples, conjugacy and orbit classes. The listed exceptional orbit-to-profile identifications are not already explicitly supplied there; their declared gap is needed. |
| RepresentationTheory/LieHighestWeight | Layers 0 and 6: Lie modules, sl₂ strings and character theory. Algebraic group modules must instead be consumed from ReductiveGroups §§10A–10B (R07). |
| FormalConnectionsOpers | F4–F5 and F8.4: intrinsic opers, coordinate descent and regular/punctured function algebras; not the specialized singularity space or Kloosterman localization theorem owned here. |
| AffineLieAlgebras | A7–A8: critical vacuum/completed centres and the Feigin–Frenkel comparison. The specialized global parahoric localization theorem is separately targeted in §4.0. |
| HeckeStacksAndLocalShtukas | HS0.1–HS0.4, HS1, HS2.9, HS3.1–HS3.4, HS4.1/HS4.7: analytic towers, period maps and coherent Hecke data. Formal equal-characteristic models and local-to-global uniformization are explicitly distinguished here. |
| DiamondEtaleCohomology | C0: sites, coefficient categories and descent. No arbitrary-topology replacement for the local shtuka carrier is asserted. |
| DiamondSixOperations | S1.2, S1.5, S2.1–S2.4: eligible morphisms and compact supports; bounded-chart compactifiability remains an obligation of §3.1. |
| SchemeAndStackFoundations | Layers 1–2: scheme/stack foundations beneath the parent's constructions; no generic stack carrier is rebuilt here. |
| EtaleCohomologyFoundations | F.0–F.4: coefficient and realization foundations; the specialized arithmetic weight assertions are separate. |

The requested **12 gap slugs** occur in both design/plan.json and the README with the same supplier and needs. None has supplier `none`. Their operations are tied to specified objects and compatibility conditions; no absence from today's supplier is counted as a defect. In particular, number-field descent does not follow from a globalization sharing only cuspidal support, and Satake IC coefficients are not constant coefficients. These two gaps cannot be deleted merely because the weaker statements exist.

The later designs SmoothRepresentationsOfLocalGroupsPartII, LieHighestWeightPartII and KloostermanSheavesAndBesselIsocrystals overlap the local classification, exceptional-profile applications and Bessel constructions. The scope expressly moves the required early constructions into this roadmap and sends later applications downstream; this direction is retained, rather than recommending those designs as suppliers. The citation resolver's sole unresolved name, KloostermanSheavesAndBesselIsocrystals at README:13, is a downstream design present in packages/KloostermanSheavesAndBesselIsocrystals/design/README.md, not a missing proof input. CongruenceSpectralGap §4.2b owns classical linear hyper-Kloosterman sums/sheaves; the pinned-group-valued tensor construction and oper comparison targeted here are distinct. There are zero Lean names here capable of colliding with sibling declarations.

The previous package repair report records its four findings as applied; no finding marked “not actionable in this package” is re-raised.

The mandated dependency command returned exit status 0 and the following complete output:

```text
moved: GlobalShtukasAndFunctionFieldLanglandsPartII moved in the merge order from #27 to #243, right after its last supplier HeckeStacksAndLocalShtukas (ArithmeticGaloisRepresentations, LanglandsParameterStacks, MotivesAndAlgebraicCycles, DiamondEtaleCohomology, DiamondSixOperations, DeligneWeightsAndPurity, PadicDifferentialEquationsAndRigidCohomology, FunctionFieldArithmetic, GlobalShtukasAndFunctionFieldLanglands also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 56 roadmaps, 653 edges, 0 problem(s)
```

No UPWARD or CYCLE line occurred. The movable placement is not a defect. Neither the merge-order file nor any package input was edited.

### Source locator record

All **16 cited works** have one manifest key and a legal cached source. The ledger below counts **79 named locator entries located and read**, counting a numbered result once even when multiple parts are cited. The damaged André inequality was additionally verified against the cached PDF image: the maximal p-adic slope is at most the maximal formal slope. “Located and read” does not mean a source's statement is correct: R03 and Source issues distinguish those cases. Supporting surrounding proofs, conventions and the ch26 coordinate tables were also read.

| Source | Count | Named locators and extraction anchors |
|---|---:|---|
| ch26 | 17 | Definitions 2.5–2.6; Proposition 2.7; Proposition 3.10; Theorems 4.2–4.3; Proposition 4.5; Theorem 5.4; Corollary 5.7; Proposition 6.31; Corollary 6.32; Theorem 7.4; Corollary 7.5; Theorem 8.5; Proposition 10.2; Theorem 10.3; Property A. ch26 line 323, line 353, line 489, line 527, line 619, line 1172, line 1192, line 1248, line 1351, line 1560, line 1610. |
| ghs | 8 | Definitions 2.5 and 3.3; Lemma 3.5; Propositions 3.9 and 3.11; Corollary 3.12; Lemmas A.1 and A.3. ghs line 329, line 354, line 384, line 450, line 495, line 519, line 1789. Published numbering, not the older arXiv numbering, was used. |
| lh | 9 | Theorems 2.12 and 4.9; Proposition 4.12; Propositions 5.13–5.14; Theorem 5.16; Lemma 5.18; Theorems 6.13 and 6.15. lh line 696, line 1314, line 1384, line 1730, line 1850, line 1900, line 2177. Parahoric hypotheses: lh line 248 and line 1574. |
| st | 2 | Lemmas 11.4–11.5, st line 4018 and line 4037; the filtration sign in the proof was recomputed. |
| xue | 4 | Introduction Proposition 1 and Theorem 2; Lemma 3.6.6 and Theorem 3.6.7. xue line 74, line 88, line 1363, line 1394. Finite-codimension ideals need not have algebraic residue eigenvalues. |
| lz | 4 | Theorem 1.1, Proposition 1.2, Corollary 2.1, Lemma 4.1. lz line 40, line 70, line 140, line 260. The full centralizer action and compensating frozen factor were retained. |
| sun | 1 | Theorem 2.11, sun line 655. This is mixedness preservation, not by itself an integer-weight realization theorem. |
| glo | 3 | Theorem 1.1, Lemma 8.1, Proposition 8.2. glo line 17, line 1673, line 1726. The remark at glo line 1738 explicitly stops at common cuspidal support. |
| hny | 3 | Theorems 1–2 and Corollary 2.13, hny line 950 through line 998. Good-prime restrictions are not silently omitted: the all-prime extension is a separate §4.0 target using xz. |
| ty | 1 | Lemma 1.4(3)–(6), ty line 215. The convention at ty line 159 allows character twists in its use of “tempered”; it is not an unqualified bounded-image assertion. |
| laf02 | 1 | Corollaire VII.8, laf02 line 11595. The absolute constant-twist argument is distinguished from fixed-embedding splitting. |
| fs | 7 | Theorem I.9.6; Theorem VIII.4.1; Proposition VIII.4.3; Proposition IX.3.2; Definition IX.4.1; Proposition IX.5.1; Theorem IX.5.2. fs line 1329, line 11272, line 11344, line 12622, line 12645, line 12718. |
| xz | 7 | Theorem 4.2.1; §4.3.3's invariant parameter; Theorem 4.4.4; Lemma 4.5.5; Corollaries 4.5.6–4.5.7; Remark 4.5.8. xz line 1994, line 2155, line 2320, line 2420, line 2460, line 2503. The −π normalization and the small-prime transfer were checked separately. |
| stacks-as | 3 | Tags 03PL, 03R7, 0A3K, stacks-as line 1410, line 4359, line 4444. In characteristic 2 the constant coefficient group {±1} is not the nonreduced group scheme μ₂. |
| andre-bessel | 1 | Proposition 3.2, printed pp. 788–789, andre-bessel line 393; hypotheses, inequality and convexity proof verified against the cached PDF image. |
| zhu-fg | 8 | Theorem 8, Corollary 9, Lemmas 17–21 and Remark 5.1. zhu-fg line 375, line 425, line 878, line 913, line 989. These support the specialized oper/localization route, not a carrier-only argument. |

## Not verifiable

- The 12 declared supplier contracts remain conditional inputs. This review checked their ownership, matching declarations and relation to current supplier targets; it did not certify future proofs. In particular, computed root multiplicities do not establish the exceptional orbit labels, and a slope estimate alone does not construct the Bessel companion.
- No Lean elaboration was run, as required by the read-only brief. There are no declarations in Suggested.lean for which an elaborated signature is missing. The review is not a proof of future targets: finite numerical tests certify the displayed instances, not the universal geometric, analytic or automorphic assertions.
- Ownership was checked against the supplied sibling folders and the available main/current-head index. Unprovided private or subsequently changed heads were not checked. The proposed global Arthur homomorphism/decomposition is conjectural in the package itself and was not treated as established.

## Source issues

- **Misprint** in ch26 at §2.3, p. 7, ch26 line 310: the source says the Borel subgroup lies inside the maximal torus; it should be the torus lies inside the Borel; affects nothing.
- **Misprint** in ch26 at Definition 2.6(iii), p. 7, ch26 line 344: the source says Nᶦ maps weight w−i to w+i; it should be Nᶦ maps weight w+i to w−i for geometric Frobenius; affects a stated result.
- **Error** in ghs at Definition 2.5, pp. 7–8, and Definition 3.3(b), p. 8, ghs line 329 and line 365: the source says common-weight purity is independent of the faithful realization; it should be specified per realization, or replaced by an appropriate adjoint/weight-zero condition; id and id⊕1 on G_m distinguish them; affects a stated result.
- **Misprint** in ghs at Definition 3.3(a)(iii), p. 8, ghs line 361: the source says N itself is the isomorphism for every i, including zero; it should be Nᶦ, with N⁰ the identity; affects a stated result.
- **Error** in ghs at Lemma 3.5(a), p. 9, ghs line 385: the source says essential temperedness at one embedding is equivalent to arithmetic purity; it should be fixed-embedding purity, or arithmetic purity with boundedness after every embedding; a Salem-conjugate SL₂ pair separates them; affects a stated result.
- **Error** in ghs at Remark 3.10, p. 11, ghs line 490: the source says the Kloosterman local parameter remains irreducible after the adjoint representation; it should be its adjoint inertia invariants vanish; odd-characteristic rank-two Kloosterman adjoint inertia splits into dimensions one and two; affects the proof.
- **Misprint** in st at proof of Lemma 11.4, p. 83, st line 4033: the source says nonnegative-weight root subgroups stabilize the increasing weight filtration; it should be nonpositive-weight root subgroups, together with the torus; affects the proof.
- **Error** in ch26 at Proposition 3.10(2), pp. 10–11, ch26 line 492: the source says torus character values being Weil q_F-numbers suffice for geometricity; it should be evaluated with the correct residue degree; an unramified quadratic induced torus requires integer weights relative to q_E=q_F²; affects a stated result.
- **Gap** in ch26 at proof sketch for Theorem 4.2, p. 11, ch26 line 537: the source says pseudo-globalization realizes the prescribed discrete series itself and proves number-field descent; it should be common cuspidal support only; descent of the original representation needs an independent argument; affects the proof.
- **Gap** in ch26 at Remark 5.8, p. 16, ch26 line 749: the source says Lafforgue–Zhu Proposition 1.2 supplies constant-coefficient stack realization; it should be Satake-coefficient realization with an additional bridge from intersection-cohomology coefficients to constant direct images; affects the proof.
- **Error** in ch26 at Corollary 6.32(1), p. 25, ch26 line 1192: the source says generic unitary geometric spherical parameters always have zero real part regardless of compact factor; it should be the central-compact criterion, or a criterion using the compact factor's root centralizer; affects a stated result.
- **Misprint** in ch26 at Theorem 8.5(3), p. 29, ch26 line 1384: the source says the F₄ B₃ point includes an additional ω₂ term; it should be ω₁+ω₃/2+ω₄/2; the printed point gives maximum adjoint weight 16 instead of 10; affects a stated result.
- **Misprint** in ch26 at proof of Theorem 8.5, case (2), p. 29, ch26 line 1422: the source says the surviving symplectic-centralizer indices j are odd; it should be j even, as in the theorem's symplectic partition convention; affects the proof.
- **Misprint** in ch26 at §9.1, p. 31, ch26 line 1492: the source says occurrence of an irreducible representation means multiplicity at least zero; it should be strictly positive multiplicity; affects nothing.
- **Misprint** in ch26 at proof of Theorem 10.3, p. 34, ch26 line 1665, line 1669 and line 1672: the source says the final comparison terms are again n_v, producing self-inequalities; it should be n_u in the final term of each displayed comparison; affects the proof.
- **Misprint** in ch26 at Tables 2–3, pp. 36–37, ch26 line 1813: the source says the entries are dimensions of filtration steps; it should be dimensions of graded weight pieces; the regular F₄ row begins 4,0,4 and cannot be filtration dimensions; affects nothing.
- **Misprint** in andre-bessel at §3, paragraph after the integrality theorem, p. 789, andre-bessel line 438: the source says nondivisibility of total rank by the slope denominator implies irreducibility; it should be nondivisibility of every proper positive subrank; integrality already forces divisibility of total rank, making the printed test vacuous; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "6c3c8b8fadbd3a4c069a649274823be690a1bceb", "job": "RT-GlobalShtukasAndFunctionFieldLanglandsPartII~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->

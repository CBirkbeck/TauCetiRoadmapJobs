# Review of HilbertModularForms (pull request #1724 at 8229a02)

**Verdict:** needs changes

The finite-nebentypus extension does not specify the global central character (R01). The root-power operation also needs a correct statement about collisions (R02). There are five findings, two blocking. The supplied gate, independent dependency check, direct elaboration and signature checks pass. No pull-request file was changed.

The previous review's twelve findings were checked first against this head. Locations below are in `TauCetiRoadmap/HilbertModularForms/README.md` unless stated otherwise. A repaired finding means that its specific witness is repaired; it does not certify unrelated claims in the section.

| Previous finding | Passage at this head and disposition |
|---|---|
| R01, CM infinity sign | **Repaired.** Line 1778 uses “n_τ+n_τ̄=1−k₀”; lines 1808–1814 distinguish the inducing values −1±2i from their inverses. Products are 5 and 1/5 respectively. |
| R02, adelic scalar and representative factor | **Repaired.** Line 1260 includes “N(rep(c))”; §6.3 uses inverse finite double cosets and then the dual/norm-twist comparison. At norm 4, weight four, the inverse scalar is 16, matching the classical scalar. |
| R03, Petersson linearity | **Repaired.** Line 867 conjugates the first argument. For a unit vector h, the pair (ih,h) now gives −i, as native L² does. The kernel formula in §9.6 uses the same convention. |
| R04, constant-form rejection | **Repaired.** Line 2254 says “at a nonzero μ”. The following constant example retains a(0)=1. |
| R05, zero-form superlevel | **Repaired.** Lines 835–838 separate “f≠0” and the zero-form bound C=0. The assertion no longer makes the whole noncompact cusp a compact superlevel set for f=0. |
| R06, general L-series convergence | **Repaired.** `Suggested.lean:442` states the general-form theorem; the cusp theorem remains at line 449. Weight four at s=6 satisfies 5<6 and 3<6 respectively. |
| R07, quaternion parity | **Repaired.** Lines 1965–1968 allow finite discriminant 1 in even degree. The parity values for (n,ω(𝔇))=(2,0),(3,0),(3,1) are 2,3,4. |
| R08, Euler-polynomial scalar | **Repaired as to normalization.** Lines 1821–1824 prescribe “h(0)=1” and the product of factors 1−αᵢʳT. This gives 1−5T+4T² in the former witness. The new multiplicity wording is addressed in R02. |
| R09, Fourier and zeta supplier claims | **Repaired.** Lines 267–276 name the product-torus convergence declarations, with their summability hypothesis; §2.1 owns the analytic upgrade. Lines 294–296 name the holomorphic zeta remainder theorem, not the residue constant. |
| R10, APIs, Checks and locators | **Partly repaired.** §§0.1–0.4 now have APIs and at least three Checks, and §10.2 points to QuaternionicModularForms §1.3. Claim-level locators and some exact target/Check formatting remain incomplete: R04. |
| R11, source manifest | **Not repaired.** There is still no `TauCetiRoadmap/HilbertModularForms/sources.toml`: R05. |
| R12, unused L-function wrapper | **Repaired.** The unused wrapper is absent. The actual general and cusp convergence signatures use the native coefficient regrouping and L-series predicates. |

No supplied repair report marks an outstanding finding “not actionable in this package.”

## R01 (P2) — Local level equivariance does not fix the global nebentypus

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:737`: “require right K₀(𝔫) equivariance by the inverse of `∏_{v|cond(η)_finite} η_v(d_v)`”; line 742 claims specialization to §5.2.

**Claim:** This condition, or its displayed componentwise classical law, defines the η-character space and specializes to the η central eigenspace of §5.2 for an unramified η. It only specifies the restriction of η to finite units. It cannot distinguish different unramified class characters.

**Witness:** Over F=ℚ(√10), let 𝔭=(2,√10), η([𝔭])=−1, level 1, weight zero, and every component f_c=1. The local multiplier is 1, but ⟨[𝔭]⟩f= f at the principal component, whereas η([𝔭])f=−f.

Here η is an ordinary ideal-class character, viewed as a finite-order unramified Hecke character with trivial infinity part. The ideal 𝔭 is nonprincipal: a generator would have norm ±2, impossible modulo 5. Also 𝔭²=(2). Finite class-group characters separate its nontrivial class, so η can be chosen with η([𝔭])=−1. This is within the roadmap's degree-two, nonzero-level domain; its weight-zero spaces and constant forms are explicitly retained.

The calculation can be checked directly from §§0.3 and 5.2. The matrix (2,√10;√10,6), of determinant 2, takes 𝒪_F² onto 𝔭𝒪_F². Both lattices have index 4, and every entry lies in 𝔭. At the principal component, the component-norm multiplier is 1, the weight-zero slash multiplier is N(2)⁻¹=1/4, and the normalized central multiplier is N𝔭²=4. Thus ⟨[𝔭]⟩1=4·(1/4)=1. All the §2.7 local conditions hold for both η and the trivial character because their finite conductors are 1.

The cited supplier already distinguishes this datum: `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:598` starts the finite-level construction with a chosen central character, and line 604 retains the transported central-character conditions on the summands. A K₀ character is additional level data, not a replacement for that condition.

**Repair:** Specify the full global central-character condition in the Γ₁/adelic construction, using the scalar and inverse conventions of §6.3; equivalently specify the full ray-class diamond action, including its unramified part. State the local K₀ law only together with this condition. Prove the claimed specialization to §5.2. Add the two characters above as a negative control: the constant tuple belongs to the trivial central space and is rejected by η because 1≠−1. Retain ramified characters and the nonparallel extension.

## R02 (P2) — Powering roots can increase their multiplicities

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:1823`: “This preserves degree and root multiplicities”.

**Claim:** The normalized root-power operation preserves individual root multiplicities. It preserves the total degree, but distinct roots can acquire the same image.

**Witness:** For h(T)=1−T² and r=2, the defined product is h⁽²⁾(T)=(1−T)². The input roots 1 and −1 each have multiplicity 1; the output root 1 has multiplicity 2.

The product definition itself is correct. This witness also occurs in the determinant formulation with A=diag(1,−1), A²=I. No zero root, zero residue degree or singular matrix is involved. The supplied R17.4.1 matrix-power rule has no assertion excluding collisions.

**Repair:** Replace the multiplicity assertion by the pushforward-multiset rule: the multiplicity at β is the sum of the input multiplicities at roots λ with λʳ=β. Retain degree preservation and constant term 1. Add this collision Check alongside the existing distinct-image example; its repaired values are 1+1=2 and h⁽²⁾(0)=1.

## R03 (P3) — The cusp-volume substitution confuses radius with norm

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:811`: “the substitution `y = s · u` with `N(u) = 1`”, followed by a radial integral with lower limit t and density s⁻².

**Claim:** That particular substitution gives the displayed radial integral. If y=s·u, then N(y)=sⁿ and the radial density is proportional to s⁻ⁿ⁻¹ds, starting at t¹⁄ⁿ. The s⁻² integral instead uses the norm coordinate.

**Witness:** For n=2 put y=(s eᵛ,s e⁻ᵛ). The Jacobian is 2s and N(y)²=s⁴, so the density is 2s⁻³ds dv; at s=3 it is 2/27, not 1/9.

**Repair:** Use r=N(y), write y=r¹⁄ⁿu, and specify the induced measure on the norm-one cross-section. In the witness dy₁dy₂/N(y)²=r⁻²dr dv and r≥t; the radial integral is 1/t. Alternatively retain s and correct both the exponent and lower limit. The finite-volume conclusion survives. Add this degree-two calculation, since the current rank-one Check cannot detect the coordinate error.

## R04 (P3) — Exact locators and some target statements remain incomplete

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:518`: “a milestone of the same shape”; see also §§2.3, 3.1, 3.3, 5.3, 7.4 and 8.2.

**Claim:** Every target has an exact statement and a claim-level locator, and each definition has its API and three discriminating Checks in the prescribed form. These requirements remain only partly met.

**Witness:** §3.3's Hecke-bound theorem has no theorem/page locator. §3.1 cites only Freitag Ch. I §2. §1.4 gives no actual nonsquarefree cusp-count equality. §9.3's definition has no three-bullet Checks list.

The local derivative and product-torus citations added in this repair resolve the previous pin-specific objections. They do not provide the missing locators for reduction theory, the Hilbert Hecke bound, the arbitrary-class/nonparallel character spaces or the functional equation. Diamond–Shurman Proposition 5.8.5 is a classical result; identify the Hilbert adapter's supplied inputs separately rather than treating the classical citation as the general-field theorem. The inaccessible books are recorded below, without guessing their theorem numbers.

**Repair:** State the full nonsquarefree count, with the precise unit image and indexing set; attach exact theorem/section and printed-page locators to the mathematical claims, or exact existing supplier targets when consumed. Separate §9.3's inducing-character, inverse-character and inert-prime controls into its required Check list, and provide its API list. A repaired cusp-count target must evaluate at unit level to h_F and at squarefree one-prime level to 2h_F, and include a prime-square test that actually exercises the unit quotient. Keep the corrected scalar test 16 versus 1 in §0.4.

## R05 (P3) — The cited works have no source manifest

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:2293`, “References”; the folder has no `sources.toml`.

**Claim:** The references supply the roadmap's source provenance. The required machine-readable record, including source identity, legal retrieval and verified/uncertified status, is absent.

**Witness:** The folder contains README.md and Suggested.lean but no sources.toml, although the References cite books, papers, knowls and code. The available Dembélé–Voight extraction is arXiv v2; the reference also names the published chapter.

**Repair:** Add the `tauceti-roadmap-sources/v1` manifest with one stable key per work, exact locators and the service's retrieval metadata. Record the version actually read and reconcile its numbering with the published reference; mark genuinely unavailable publisher texts uncertified where appropriate. Do not include cached source files. This review has not changed the folder or a manifest.

## Verified sound

This was a full read of all 56 numbered README targets, the worked/rejection examples, the scope and dependency paragraphs, and all 454 lines of Suggested.lean. The arithmetic below is a collection of adversarial instances, not a proof of the general theorems. “Pass” certifies the displayed calculation and its compatibility with the stated hypotheses; source-certification limits are recorded separately.

The library/general-theory ownership boundary is preserved: the retained nonparallel constructions compare with NoncommutativeAndEquivariantIwasawa §F.5 rather than replacing its parallel-weight spaces, integral lattices or Hecke operators. No executable algorithm, copied source passage, sorry'd data, forbidden import or `set_option` was found. Scope retains arbitrary class number, nonprincipal ideals, bad primes and finite nebentypus; R01 concerns the definition of that last extension.

The supplied gate reports all counters zero, including build, outside-folder and stray-files, and ends in `OK`. The head was confirmed and the diff outside `TauCetiRoadmap/HilbertModularForms/` is empty. The independently run dependency command reports:

```text
depcheck: 204 roadmaps, 1615 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Every Needs/Rests-on line and supplier citation was read. Local forward references to the Layer 6 comparison are explicitly distinguished from the earlier classical constructions; they do not require the comparison in order to define the spaces.

### Adversarial calculations

The 90 rows below cover all numbered targets, the 12 Lean headline statements, the seeded targets, and each mathematical finding. Row labels refine a subsection when it contains several different assertions. Except where a row explicitly tests an excluded case, number fields are totally real of degree greater than one, levels are nonzero, and newform statements retain k_w≥2. Empty sets, characteristic p, zero rings and rank-zero number fields are not covertly admitted by those carriers. Degree-one calculations are local sanity checks, not applications of the Hilbert Koecher theorem.

| Statement | Instances and computed values on the two sides | Result; change |
|---|---|---|
| 0.1 domain/action | Identity sends i to i; T sends i to 1+i; S sends 2i to i/2. Imaginary-part formula gives 2/4=1/2 in the last case. | Pass; none. |
| 0.1 action order and denominator | TS(i)=1+i, ST(i)=(−1+i)/2, so order matters. For S at 2i, denominator=2i and norm square=4>0. | Pass; no zero division and no abelian-action shortcut. |
| 0.2 holomorphy | f=1 has derivative 0; f(z)=z₁ has derivative 1 in coordinate 1 and 0 in coordinate 2. For conjugation the difference quotients along real and imaginary increments are 1 and −1. | Pass; the antiholomorphic wrong model is excluded. |
| 0.2 Cauchy estimate | On a radius-r circle, f(z)=z has derivative norm 1 and bound r/r=1. r=0 would produce junk 0/0 and is excluded by the pinned positive-radius hypothesis. | Pass. |
| 0.3 weight | k=(2,4) gives k₀=4, m=(1,0); k=(2,3) has odd difference −1 and is rejected. Parallel k=4 gives m=(0,0). | Pass; integer division has no parity truncation here. |
| 0.3 arithmetic scalar | For F quadratic, a=2, k=4: N(a)^(k₀−2)=4²=16; direct product is (4³·2⁻⁴)²=16. A norm −1 unit in odd k gives −1. | Pass. |
| 0.4 unitary normalization (sample) | Same scalar: unitary factor (4²·2⁻⁴)²=1; slash ratio N(det)¹=16. For a totally positive unit determinant, the ratio is 1. | Pass; wrong common normalization detected. |
| 1.1 lattices and stabilizers | In degree two, 𝒪⊕𝒪 has ℤ-rank 4, not 2. diag(1/2,2) has determinant 1 but fails a∈𝒪. L_(2) has index N(2)=4 in L_𝒪. | Pass. |
| 1.2 congruence groups | At level 1, all reductions are into the zero quotient and all three groups coincide. At level 2, upper unipotent with entry 1 is in Γ₁ but not Γ; lower entries 1 and 2 give false and true Γ₀ membership. | Pass. |
| 1.2 index and determinant | At a prime of norm 4 the index is 4(1+1/4)=5; at its square it is 16(1+1/4)=20. diag(ε,1) has determinant ε and lower-right entry 1. | Pass. |
| 1.3 conjugation | diag(1,2)(1,b;c,1)diag(1,2)⁻¹=(1,b/2;2c,1): upper and lower ideals become (2𝔟)⁻¹ and 2𝔟. | Pass; reverse transport fails. |
| 1.3 signed Steinitz class | Over ℚ(√6), 𝒪 and (√6) are ordinarily principal, but the displayed generator has norm −6; absence of a norm −1 unit leaves two narrow classes. | Pass; ordinary and narrow tests differ. |
| 1.4 cusps | h=1 and level 1 give 1 cusp; a squarefree one-prime level gives 1·2=2. (1:0)=(2:0) gives the same ordinary ideal class. | Pass for specified formulas; nonsquarefree formula missing (R04). |
| 1.5 representative choice | Replacing a representative by 2 times itself multiplies its norm by 4; normalized component transport contributes 1/4. Their product is 1. Identity transport contributes 1. | Pass. |
| 2.1 trace dual | Translation lattice 𝔟⁻¹ for 𝔟=2𝒪 is (1/2)𝒪; its dual is 2𝔡⁻¹, not (1/2)𝔡⁻¹. The pairing on a generator remains integral. | Pass. |
| 2.1 Fourier extraction/headline | For the constant function, normalized box mean=1 and nonzero-character means tend to 0. For exp(2πiTr(μz)), extraction at μ is 1; at a different lattice character it is 0. | Pass; coefficient and exponential reconstruction agree. |
| 2.1 torus convergence | A finite two-character sum has exactly two nonzero coefficients; absolute coefficient sum is finite and pointwise reconstructed values are their original sum. An arbitrary L² class has no chosen point values. | Pass; the latter is not used as a pointwise theorem. |
| 2.2 Koecher/headline | f=1 has a(0)=1 and all nonzero coefficients 0. A proposed mixed-sign μ has coefficient required to be 0; a nonzero value 1 would violate support. | Pass; constant is retained. |
| 2.3 form spaces (sample) | The zero function satisfies all slash laws with 0=0. Weight-zero 1 satisfies the Γ laws with determinant norm 1; at inversion and parallel weight −2, z=(2i,2i) gives multiplier 16≠1. | Pass; constants are not arbitrary-weight forms. |
| 2.3 normalized representative law | Quadratic F, representative changed by 2: norm multiplier 4 and prescribed component multiplier 1/4 give identical normalized data. Omitting the latter changes 1 into 4. | Pass. |
| 2.4 ideal coefficient | k=(2,4), m=(1,0): replacing μ by εμ multiplies raw a by ε₁⁻¹ and μ^m by ε₁, so c is unchanged. At ⊥, zeroExtend is 0. | Pass. |
| 2.4 full expansion/headline | Constant 1 has positive-ideal coefficients all 0 but constant vector (1,…,1); zero has (0,…,0). Full expansion distinguishes them. | Pass; positive coefficients alone do not. |
| 2.5 cusp independence | For upper triangular scalar 2 in degree two, weight four, the nonzero constant multiplier is 16: a₀=0 stays 0, a₀=1 becomes 16. | Pass; vanishing, not the numeric constant, descends without a trivialization. |
| 2.5 nonparallel cuspidality/headline | For k=(2,4), m=(1,0), a positive unit with ε₁≠1 gives a₀=ε₁⁻¹a₀. Thus a₀=0; a₀=1 would require 1=ε₁⁻¹. | Pass. |
| 2.6 cusp forms and decay | Zero has all constants 0; weight-zero 1 has constant 1 and is excluded. Along z=(it,it), exp(2πiTr(z)) has size exp(−4πt), tending to 0. | Pass; the exponential alone does not establish global modularity. |
| 2.6 cusp expansion/headline | Within cusp forms the constant vector is already 0; equality of all positive coefficients gives zero full difference. Outside cusp forms, 1−0 is the counterexample above. | Pass. |
| 2.7 finite nebentypus | Unramified η with η(𝔭)=−1 and trivial character both have local product 1. Constant tuple gives central action 4·1/4=1, while η demands −1. | Fail; R01. |
| 2.7 ramified scalar check | An order-three value ζ has square ζ²≠1; a quadratic value −1 has square 1. | Pass for the local twist law; does not repair the missing global condition. |
| 3.1 Siegel sets (sample) | Scalar εʲI has one projective image for every j. The point it becomes i/t under inversion; its cusp-coordinate height is t. For y=(t,t), min y=t and N(y)=t². | Pass; projective and coordinate qualifications are essential. |
| 3.2 invariant measure | z↦2z has real Jacobian 4 and denominator y² scaled by 4 in one coordinate, ratio 1; in two coordinates both scale by 16. | Pass. |
| 3.2 radial proof | y=(s eᵛ,s e⁻ᵛ): density 2s⁻³; at s=3 this is 2/27 versus the displayed s⁻²=1/9. With r=s² the density is r⁻²dr. | Coordinate error; R03. |
| 3.2 finite volume | In norm coordinate r≥t, ∫r⁻²dr=1/t; at t=2 it is 1/2. At t=0 it diverges. | Pass for repaired proof; t>0 matters. |
| 3.3 Hecke bound (sample/headline) | Zero form takes C=0, yielding 0≤0. For the stated weight-two norm-4 coefficient −3, the bound requires C≥3/4. Choosing C=1 satisfies 3≤4. | Pass; does not certify a uniform bound from one coefficient. |
| 3.3 nonparallel normalization | k=(2,4), m=(1,0): raw growth μ₁μ₂² multiplied by μ₁ gives (μ₁μ₂)²=N(μ)^(k₀/2). | Pass. |
| 3.3 compact superlevel | For f=0, threshold=0 and the whole unbounded cusp survives. For nonzero f, positive threshold excludes the decaying cusp tail. The revised argument only uses the latter. | Previous counterexample excluded. |
| 3.4 Petersson | For ‖h‖=1, ⟨ih,h⟩=−i and ⟨h,ih⟩=i. For scalar arithmetic slash 16, squared norm scales by 256. | Pass, including native order. |
| 3.5 finite-dimensional headlines | Zero space has dimension 0; stated level-31 cusp example has complex dimension 1; weight-zero constant line contributes dimension 1 to the full space. None is excluded by the signatures. | Pass as tests; general compactness proof remains a target. |
| 3.5 negative weights/headline | Weight −2 constant 1 fails inversion (16≠1); zero satisfies every condition. With zero level, translation-only invariance would admit constants, so the explicit nonzero-level hypothesis is retained. | Pass. |
| 4.1 Eisenstein definition | For a prescribed cusp basis vector the intended constant vector is (1,0,…); at another cusp the constant is 0. Weight four is in k>2, while weight two is not. | Correct separation of targets; source unavailable for existence. |
| 4.2 Hecke trick | Pole contribution sⁿ·ρ/(ns): n=2 gives ρs/2→0; n=1 gives ρ. The pole remainder is holomorphic on Re(z)>1−1/n, giving >1/2 for n=2. | Pass; the degree-one shortcut is excluded. |
| 4.2 worked constants | For the ℚ(√5) normalization, 2²/ζ_F(−1)=120, 2²/ζ_F(−3)=240, 2²/ζ_F(−5)=2520/67. | Consistent with the stated Eisenstein normalization. |
| 4.3 decomposition | A cusp form has all constants 0; the normalized Eisenstein constant vector is nonzero. The intersection has vector 0, and subtracting the prescribed Eisenstein part leaves constant vector 0. | Pass as the defining decomposition test. |
| 4.3 coefficient bound | At a norm-4 prime, σ₃(𝔭)=1+4³=65≤4⁴=256. For a squarefree product of norms 4,5,9, σ₁/N=(5/4)(6/5)(10/9)=5/3, already >1. | Pass; uniform O(N) is not asserted in weight two. |
| 5.1 cosets and factors | Norm q=4: good prime has 5 representatives, bad prime has 4. At p², all index-p² lattices number 1+4+16=21; excluding the scalar lattice would incorrectly give 20. | Pass. |
| 5.1 component direction | Source/target norm ratio with norms 1 and 1/2 is 1/2; reversed direction gives 2. | Pass; transport convention tested. |
| 5.2 central action | Principal (2), quadratic F, k=4: S=16 and N(2)^(−2)S=(1/16)16=1. For (√6), even weight gives sgn(−6)²=1, odd weight gives −1. | Pass; no claim that all narrow characters occur. |
| 5.3 relations (sample) | Good q=4,k=2,ψ=1,a=−3: c(p²)=9−4=5 and c(p³)=−3·5−4(−3)=−3. Bad a=−1 gives c(p²)=1, without a norm-31 term. | Pass. |
| 5.4 coefficient formula | Unit ideal coefficient of T_p f is c(p,f)+0. At m=p the second term is ψ(p)q^(k₀−1)c(1); with the preceding values, 5+4=9=a². | Pass. |
| 5.5 adjoints/diagonalization | For ψ=1 the good eigenvalue a=−3 equals its conjugate. For a unit character value i, the conjugate factor is −i, not i. Bad operators are not included in the unrestricted normality claim. | Pass. |
| 5.6 Fricke/Atkin–Lehner | Raw square at q=4,k=4 gives 16; normalization by 4⁻¹ on each application gives 16/16=1. At k=2 the normalization is 1. | Pass. |
| 5.6 nonprincipal comparison | The representative matrix with determinant 1 gives the component norm ratio 1/2; the return with determinant 2 combines with ratio 2. Omitting/reversing these factors does not give the same operator. | Pass for the stated two-component control. |
| 6.1 components (sample) | ℚ(√5) has one narrow class; ℚ(√6) has two though its ordinary class group has one. Determinant quotient therefore gives 1 and 2 components, respectively. | Pass; ordinary-class indexing fails the second test. |
| 6.2 adelization | Representative norm changed by 4 and classical component changed by 1/4 give Ψ unchanged. At the identity representative both factors are 1. | Pass. |
| 6.3 Hecke compatibility (sample) | q=4,k₀=4: positive finite scalar on Ψ is 1/16, inverse scalar is 16; dual then norm twist gives unitary central scalar 1. | Pass; classical scalar 16 is not identified with positive raw 1/16. |
| 6.3 spherical conversion | For trivial ψ, raw positive Hecke eigenvalue a/16 becomes a under duality, a/4 after the twist, and Satake trace a/8 after division by √q=2. Arithmetic trace is a. | Pass against supplier coordinates. |
| 6.4 occurring representations | A newvector level contributes dimension 1; one extra unramified level step contributes 2. Zero cusp space contributes no eigenrepresentation, not an arbitrary character. | Pass. |
| 7.1 oldforms | Normalized f has c(1)=1; V_p f has c(1)=0 and c(p)=1. f+tV_p f still has c(1)=1 but c(p)=a_p+t. | Pass; good-prime eigenvalues alone do not choose an old vector. |
| 7.2 normalization/newness | c(1) of f,2f,0 is 1,2,0. Only f is normalized; at its exact level the supplied local newvector dimension is 1. | Pass. |
| 7.3 decomposition | Level ratio 1 has one divisor; level ratio p has two. Thus one primitive representation contributes 1 versus 2 old vectors at these levels. | Pass. |
| 7.4 all Hecke eigenvalues (sample) | c(1,T_m f)=c(m,f) and c(1,f)=1 give λ_m=c(m,f). In the example, U_𝔫 eigenvalue −1 gives c(𝔫)=−1. | Pass; the eigenvector assertion itself uses newvector theory. |
| 7.5 coefficient field | t²=3 gives two embeddings t↦±t and degree 2; coefficient −2t satisfies X²−12. Rational integral eigenvalues have degree 1. | Pass. |
| 7.5 Galois weights/lattice | Permuting the real embeddings sends (2,4) to (4,2), but fixes (2,2). L⊗_L L=L has no forced descent to ℚ. | Pass; integral lattice is an explicit owned target, not inferred from field base change. |
| 7.6 bad primes (sample) | Unramified central character, q=4,k₀=4, exponent one: a_p²=4²=16, hence a_p=±4 for ψ=1. Exponent at least two gives a_p=0; no such assertion is imposed on arbitrary ramified η. | Pass. |
| 7.7 signs | Weight two, c(𝔫)=−1 gives ε_𝔫=1. At exponent≥2, c(p)=0 does not determine whether ε is 1 or −1. | Pass. |
| 8.1 Euler polynomial | a=−3,q=4,k=2 gives 1+3T+4T²; inverse coefficients begin 1,−3,5, agreeing with the Hecke recurrence. Bad a=−1 gives 1+T. | Pass. |
| 8.1 norm regrouping | Two prime ideals of norm 11 with coefficients 4 and −4 give norm coefficient 0, while the sum of absolute values is 8. | Pass; regrouping is not asserted to preserve the exact abscissa without a no-cancellation hypothesis. |
| 8.1 two convergence headlines | At k₀=4 and s=6: general threshold k₀+1=5<6; cusp threshold k₀/2+1=3<6. Zero form has series 0 for both statements. | Pass. |
| 8.2 Mellin normalization (sample) | ∫₀∞e^(−2πy)dy=1/(2π)=Γ(1)(2π)⁻¹. k=(2,4) has m=(1,0); gamma arguments are s−1,s. | Pass in the stated arithmetic convention. |
| 8.2 sign | k=(2,4) gives i⁶=−1; the incorrect k₀n rule would give i⁸=1. Parallel (2,2) gives i⁴=1. | Pass. |
| 8.3 L-card | n=2,k=2,level norm31,discriminant5: Q=31·25=775, degree4, arithmetic weight1, analytic shifts (1/2,1/2), completed translation factor 4·775^(−1/4). | Pass. |
| 8.3 rank parity | Self-dual ε=1 forces an even order at the centre; ε=−1 an odd order. A local model (s−s₀)² has order2 and is even; (s−s₀) has order1 and is odd. | Pass; raw nonsummable tsum is not used as the continuation. |
| 9.1 twisting | Quadratic χ(p)=−1 changes a_p=4 to −4, determinant unchanged because χ(p)²=1. Order-three χ(p)=ζ changes determinant by ζ². | Pass, subject to repairing the target character space in R01. |
| 9.1 twist uniqueness | If χ₀ is a nontrivial self-twist, χ=1 and χ=χ₀ both produce f; the fibre has at least two elements. Quotienting by self-twists identifies them. | Pass; no absolute uniqueness of χ asserted. |
| 9.2 inner twists/CM (sample) | At an inert prime χ(p)=−1, invariance forces a=−a, hence a=0 in ℂ. Proposed a=4 would demand 4=−4. At split primes χ(p)=1 imposes no vanishing. | Pass; characteristic two is not the coefficient field. |
| 9.3 CM induction (sample) | Norm-5 values −1±2i have sum−2, product5; inverses have sum−2/5, product1/5. Native infinity exponents (−1,0) give sum−1=1−2. | Pass. |
| 9.3 coefficient field and inert sign | Values generate ℚ(i), but the trace −2 is rational; the norm-fibre field can be smaller. Inert matrix (0,u;1,0) has trace0 and determinant−u. | Pass; equality of value and coefficient fields is not asserted. |
| 9.4 base change (sample) | h=1−3T+2T² has parameters1,2; degree2 gives parameters1,4 and polynomial1−5T+4T². The monic polynomial with the same T-roots has constant1/4 and is rejected. | Pass for normalization. |
| 9.4 collisions | h=1−T², r=2 gives 1−2T+T²; multiplicity at1 changes 1→2 through collision. | R02. |
| 9.4 identity/towers | h=1 stays1. r=1 fixes h. Parameters1,2 raised successively to powers2 and3 give1,64, agreeing with power6; constant term remains1. | Pass. |
| 9.4 inert and non-base-change tests | With b(2)²=−5 and χ₂=−1, c((2))=−5+4=−1. Conjugate split-prime values4 and−4 cannot both be a common base-change value. | Pass. |
| 9.5 existence/descent domain | In a prime-degree ℓ step, the exceptional block has rank2/ℓ: ℓ=2 gives1, ℓ=3 is not integral. A quadratic exceptional output has two character constituents, not a cusp newform. | Pass with the explicit Eisenstein exception and the supplier's solvable normal-tower scope. |
| 9.6 Doi–Naganuma | D=29, ramified b=−3+2√−5 gives trace−6 and norm29; split operators each have b(p), not 2b(p). For the inert norm4 test the value is−1 as above. | Pass in the prime-discriminant, class-one source range. |
| 9.6 kernel order | Native conjugate-first pairing has ⟨K,ig⟩=i⟨K,g⟩; reversing the kernel slot gives −i instead. | Pass. |
| 10.1 D-new | Empty finite discriminant 1 imposes no local new condition; at a squarefree prime discriminant the local conductor-one line has dimension1. | Pass; exact exponent restriction retained. |
| 10.2 Jacquet–Langlands parity | n+ω(𝔇): (2,0)→2 allowed; (3,0)→3 forbidden; (3,1)→4 allowed. Squarefull level does not change these sums. | Pass. |
| 10.3 Brandt traces | Worked full trace36 minus norm-character trace28 is8. A quadratic pair of eigenvalues5,−5 has trace0. Subtracting only a universal single Eisenstein scalar would give the wrong trace. | Pass. |
| 11.1 invariants (sample) | Weight-two level31 form over ℚ(√5): field prefix(2,2,5), level norm31, degree of coefficient field1, field bad primes{5}, level bad primes{31}. | Pass; field and level bad primes are distinct. |
| 11.1 rationality and CM density | Algebraic-integer coefficients in ℚ lie in ℤ; a coefficient t with t²=3 is not rational and has degree2. In C₂ the inert class has size1 of2, density1/2, and its coefficients are0. | Pass for a density-1/2 set of vanishing primes; no density inferred from a finite sample. |
| 11.2 label | F=ℚ(√5), level norm31 gives intrinsic prefix2.2.5 and31. Different arbitrary orbit letters do not change these numbers. | Pass; database order indices are excluded. |
| 11.3 attachment | With residue norm9 and #E(𝔽₉)=8, trace=9+1−8=2. Candidate coefficients4 and−4 over conjugate primes obstruct descent to ℚ. | Pass; an explicit base-field modularity witness and full local-factor input are retained. |
| Worked examples/rejection tests | (2), (2w−1), (3) have norms4,5,9 and coefficients−3,−2,2 in the stated level31 example. Bad level31 coefficient−1 gives sign1. Constant1 has a(0)=1 and no positive coefficients. | Compatible with the corresponding formulas; database-specific flags have the source limitations below. |

### Seeded source sample and version checks

All 15 seeded targets were examined. The README contains no separate list marking locators unverified. The following distinguishes a source read at its locator from a supplier contract resolved and from a text that could not be read. A numerical check alone is not counted as verification of a cited theorem.

| Seeded target | Text/locator inspected and scope | Outcome |
|---|---|---|
| 0.1 domain/action | Dembélé–Voight §2, printed pp.5–6: `dembele-voight` line 213 and line 281; native Möbius API below. | The componentwise action, determinant positivity and denominator convention agree. The source's early standing strict-class-number-one assumption is not needed for this action. |
| 0.4 unitary normalization | Dembélé–Voight (7.10), printed p.37, `dembele-voight` line 1847; (7.20), p.40, line 1981; the transformation law in `lmfdb-hilbert` line 99. | The source exponent k+m−1 yields the stated norm ratio. Scalar 2 at quadratic weight four detects 16 versus 1. The exact comparison is a calculation, not a verbatim theorem in the source. |
| 2.3 spaces | Dembélé–Voight Definition 2.1, p.5, line 248, is parallel weight two with the early class-number restriction. Example 7.26, pp.41–42, lines 2059–2115, gives the general component description. | Supports the component construction after changing the lattice convention; the source has Fourier-index slips listed below. Shimura's nonparallel coefficient normalization was not readable. The parallel supplier §F.5 was resolved independently. |
| 3.1 Siegel sets | Claimed Freitag Ch. I §2; no printed page or theorem supplied. | Not source-certified: book inaccessible. Projective-kernel and cusp-coordinate tests pass; see R04. |
| 3.3 Hecke bound | No claim-level theorem/page locator. Freitag Chapter I appears only in the references. | Not source-certified. The zero-form repair and exponents pass direct checks. This does not establish the compactness/maximum argument in general. |
| 5.3 relations | Shimura 1971, Theorem 3.24; no page. | Original theorem not readable; the resolver's book-review result was rejected. Prime-power lattice counts and both good/bad recurrences were recomputed. The Hilbert lattice adapter is owned here. |
| 6.1 double coset | Dembélé–Voight (7.16), printed p.39, lines 1955–1959; component decomposition p.40, lines 1965–1997. | Supports the determinant/narrow-class decomposition in the split/indefinite case. The source does not assert bijectivity of the reduced-norm map for a totally definite quaternion algebra. The cited SL₂ strong-approximation supplier has the required noncompact archimedean factor. |
| 6.3 Hecke compatibility | Dembélé–Voight (7.13)–(7.14), p.38, lines 1912–1921, uses inverse finite right translations; (7.22), p.41, line 2031. Supplier R16.4.4 coordinates also read. | The inverse convention agrees. The extra component normalization and dual/norm twist were checked algebraically; this is not a claim that Dembélé–Voight states this roadmap's exact rescaled formula. |
| 7.4 all Hecke eigenvalues | Diamond–Shurman Proposition 5.8.5, cited without page; AL.2.2.4 and R16.4.3–R16.4.4 supplier statements read. | Book text unavailable. The suppliers provide the local new line and global multiplicity-one inputs at the appropriate generality. The coefficient identity follows once the all-operator eigenvector assertion is supplied. |
| 7.6 bad coefficients | R16.3.1–R16.3.3 and AL.2.2.4–AL.2.2.5 at the supplied owner; Dembélé–Voight Example 6.6, p.29, lines 1426–1431, and Example 6.7, pp.29–30, lines 1441–1450. | Local special/ramified-principal/supercuspidal alternatives support the stated unramified-central-character restriction. The square-level examples have coefficient 0 at the level prime. A direct Hilbert textbook theorem/page locator is still missing. |
| 8.2 completion/functional equation | Shimura 1978 §4; the paper itself was not readable. LFunctions Layer 0 and Layer 3 and the classical ModularForms Layer 7 were read as interfaces. | Exact Hilbert theorem and its hypotheses not source-certified. Mellin factors, arithmetic centre, gamma shifts, conjugate form and i^(sum k_w) were checked; the ℚ-only theorem was not treated as a Hilbert theorem. |
| 9.2 inner twists/CM | AutomorphicGaloisRepresentations §§3.15–3.16 and GL₂ R17.4.16; `lmfdb-cm` line 5 is only a browser challenge. | Supplied regular-weight induction/CM characterization resolved. The finite-character zero/nonzero tests pass. The claimed knowl wording could not be checked. |
| 9.3 CM induction | GL₂ R17.4.16; native infinity-type and inverse ideal-character declarations below. | The repaired idelic sign, unitary norm twist, split trace and inert determinant agree. Source existence is consumed rather than reconstructed. No claim that the individual-character value field equals the coefficient field remains. |
| 9.4 base change | `lmfdb-base-change` lines 90–100, especially line 92; supplied R17.4.1 matrix-power formula. | The knowl omits scalar normalization. The roadmap now supplies constant term 1 correctly; R02 concerns its additional multiplicity wording. The proper-subfield definition and conjugate-prime necessary condition agree with the knowl. |
| 11.1 invariants | `mf.hilbert.eigenvalue` line 90; `mf.hilbert.dimension` line 90; `mf.hilbert.label` lines 90–98; `lmfdb-hmf-code` lines 146–151, 174–178, 450, 485–493 and 505–527; `lmfdb-hmf-web` lines 17–24, 122–136; `lmfdb-hmf-format` lines 23–32, 43–67. | Field/level/weight, eigenvalue field degree, prime ordering, absent-vs-empty AL data and flags match the data interfaces. These code paths are not proofs of a form's CM or base-change status. Four knowls were blocked; see below. |

The Dembélé–Voight text actually read is arXiv:1010.5727v2. Its visible numbering includes Definition 2.1, Theorem 3.9, Examples 6.3, 6.6, 6.7 and 7.26, and equations (7.10), (7.13), (7.14), (7.16), (7.20), (7.22). The published-chapter pagination was not assumed equal to the preprint's. R05 asks the manifest to make that distinction explicit.

Additional source checks: Zagier's author copy has Theorem 4 on printed p.31 (`zagier` line 1136), the prime-discriminant/class-one eigenform hypotheses at lines 1174–1176, (93a–c) at lines 1188–1190, (95a–c) on p.32 at lines 1196–1198, and Theorem 5 on p.33 at line 1245. Appendix 1 starts on printed p.39, line 1453, and addresses the weight-two limiting construction; it is not a proof for every degree or arbitrary class number. The split, inert and ramified formulas used by §9.6 agree with these source formulas. Freitas–Le Hung–Siksek arXiv:1310.7088v4, Theorem 1, printed p.2 (`flhs` line 87), has the real-quadratic modularity assertion; lines 65–81 specify the modularity meaning. This supports the real-quadratic clause, not unconditional modularity over every totally real field.

### Pinned library audit

Searches used the pinned Mathlib and Tau Ceti trees, by objects as well as proposed names. The following 17 entries record declarations whose actual bodies or signatures were opened; the paths are library-repository relative. These are not claims about a newer library version.

| Pinned location | Declaration and mathematical content checked |
|---|---|
| `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean:58` | `denom_ne_zero_of_im`, `denom_ne_zero` at 63 and `denom_cocycle` at 74: invertible real matrices and nonzero imaginary part supply the nonzero denominator. |
| `Mathlib/Analysis/Complex/UpperHalfPlane/MoebiusAction.lean:181` | `glAction`; `im_smul_eq_div_normSq` at 219 has absolute determinant. Positive determinant removes the conjugation branch in the Hilbert specialization. |
| `Mathlib/NumberTheory/ModularForms/SlashActions.lean:137` | `ModularForm.slash_def`: arithmetic determinant exponent k−1 and denominator exponent −k, with the determinant-sign conjugation on general GL₂(ℝ). |
| `Mathlib/RingTheory/DedekindDomain/Different.lean:379` | `FractionalIdeal.dual_inv`; `coeIdeal_differentIdeal` at 532: inverse trace-dual of 1 is the different. These give dual(𝔟⁻¹)=𝔟𝔡⁻¹. |
| `Mathlib/Analysis/Fourier/AddCircleMulti.lean:286` | `UnitAddTorus.hasSum_mFourier_series_L2`; the uniform theorem at 320 and pointwise theorem at 329 additionally use continuity and summable coefficients. They do not themselves prove the Hilbert holomorphic decay estimates. |
| `Mathlib/Analysis/Complex/LocallyUniformLimit.lean:45` | `Complex.cderiv_eq_deriv`; `Complex.norm_cderiv_le` at 49: positive-radius disk, domain inclusion, completeness and the sphere bound are retained. |
| `Mathlib/MeasureTheory/Function/L2Space.lean:136` | `MeasureTheory.L2.inner_def`, with the complex specialization at 180: conjugate-first pointwise inner product. |
| `Mathlib/Analysis/Normed/Module/FiniteDimension.lean:467` | `FiniteDimensional.of_isCompact_closedBall₀`, and its translated version at 474. Positive radius and the normed/continuous scalar action are required; radius zero would prove nothing. |
| `TauCeti/NumberTheory/NumberField/TotallyPositive.lean:71` | `NumberField.IsTotallyPositive`: positivity at every real place. It is vacuous for totally complex fields, so the actual totally-real hypotheses in analytic statements matter. |
| `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean:83` | `NarrowClassGroup`, `mk` at 96 and `mk_surjective` at 106: quotient of invertible fractional ideals by positive principal ideals, not the ordinary class group. |
| `TauCeti/NumberTheory/ArithmeticDirichletSeries/Basic.lean:79` | `IdealArithmeticFunction` is a function on nonzero ideals. Multiplicativity is a separate predicate, not an automatic property of coefficients. `zeroExtend` at 170 assigns zero to the zero ideal. |
| `TauCeti/NumberTheory/ArithmeticDirichletSeries/NormCoeff.lean:101` | `normCoeff` sums over finite norm fibres and is complex-linear; it does not preserve sums of absolute values under cancellation. |
| `TauCeti/NumberTheory/NumberField/DedekindZeta.lean:158` | `exists_differentiableOn_eq_dedekindZeta_sub`: holomorphic remainder on Re(s)>1−1/n, agreeing with ζ−ρ/(s−1) on Re(s)>1. |
| `TauCeti/NumberTheory/NumberField/Global/InfinityType/Basic.lean:273` | `AlgebraicInfinityType`; `embeddingCharacter` at 287 uses the positive integer-exponent monomial at the complex embeddings. |
| `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Ideal.lean:270` | `idealCharacter_apply_toPrincipalIdeal_eq_embeddingCharacter_inv`: matching infinity type, positive generator and congruence-one hypothesis give the inverse monomial. |
| `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:134` | `Newform.dirichletLift` extends the unit character by zero. It is a classical ℚ-side carrier, not a Hilbert-newform carrier. |
| `TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean:91` | `Newform.satakeParameters` is the root multiset of X²−a_pX+χ(p)p^(k−1); the definition accepts natural p, while the arithmetic interpretation requires a prime. |

Thus the former one-circle and residue-constant overclaims are absent. Searches did not find an existing pinned carrier supplying the complete nonparallel Hilbert newform/adelization interface. Existing Möbius, trace-dual, arithmetic-function, class-group and character objects are consumed rather than renamed as heavy definitions.

### Cross-roadmap ownership and supplier resolution

The supplied citation scan reported no missing cross-roadmap citation. Its ten unmatched-name leads were inspected: `Weight.IsParallel` is declared and elaborated in this Suggested.lean; the other nine are knowl identifiers or database fields, not claims of Lean declarations. They do not establish supplier drift.

The following supplier families were resolved against their available main text or the specified new-roadmap head. Paths below end in `README.md`; line numbers refer to the actual roadmap text, not the service's extra provenance line. The numbered contracts were read with their scope, rather than relying on name matches.

| Supplier and locator | Resolved content and boundary |
|---|---|
| `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:2466`, §F.5 | Parallel k≥2 forms, all components/cusps, character laws, both integral expansion lattices and good/bad Hecke operators. This is imported in the target's Scope; the kept nonparallel extension must compare with it. |
| `Completed/GlobalNumberFields/README.md`, Layers 2, 3A, 4, 7, 9, 10 | Moduli/ray classes, lattice estimates, finite adeles, idele quotient, finite-order and algebraic Hecke characters and infinity types. These are suppliers, not targets of this folder. |
| `TauCetiRoadmap/ModularForms/README.md:383`, Layers 2, 4–8 | Abstract Hecke formalism and classical ℚ-side newforms, multiplicity one, normalized Fricke, Euler/functional equations and coefficient fields. A classical theorem is not silently upgraded to arbitrary F. |
| `Completed/ArithmeticDirichletSeries/README.md:115`, Layers 0–3 and 5 | Nonzero-ideal functions, norm regrouping, Euler products and counting estimates. The realized Euler data has derived local series; no second Dirichlet-series framework is built here. |
| `TauCetiRoadmap/LFunctions/README.md:385`, Layer 0; Layer 3 | Arithmetic cards, normalization shift with N^(−w/4), continuation/FE predicates and Mellin interfaces. The Hilbert card is an instance with a proved comparison. |
| `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:597`, R16.1 | Actual finite-level automorphic carriers with chosen central character; local subgroups and right-translation convention. This supplies the missing datum identified in R01. |
| Same, R16.2–R16.3; R16.4.3–R16.4.5 at 1061 onward | Local classification, Steinberg monodromy, wild supercuspidals, arithmetic/unitary coordinates and both Hecke coordinates for multiplicity one. Newvector dimensions require the AL supplier below. |
| Same, R17.3.1, .3, .5, .9 at 1578, 1609, 1625, 1659 | Global JL, split-place Hecke comparison, non-norm multiplicity one and definite coefficient normalization. Norm characters are excluded from cuspidal transfer. |
| Same, R17.4.1, .3–.5, .8, .16 at 1754, 1823, 1833, 1841, 1865, 2127 | Satake powers, prime-cyclic all-place comparison/descent/cuspidality, solvable normal towers and quadratic induction. General matrix powers and induction are consumed, not rebuilt. |
| `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1639`, AL.2.2 | Last-row K₁, conductor as least nonzero level, dimension max(0,n−c+1), central-character new line and local factors. This is general nonarchimedean GL₂, not the ℚ-only classical adapter. |
| `TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md`, §§3.10, 3.15–3.16 | Hilbert Galois representations and regular-weight CM/induction characterization. This roadmap consumes them via its dictionary and does not own their construction. |
| `TauCetiRoadmap/AutomorphicBundles/README.md`, §§11.9, 11.18, 12.17–12.19 | Geometric/analytic comparison, defining-field base change, Hilbert expansion, expansion principle and cusp criterion. Field base change is not an integral-lattice theorem; §7.5 explicitly owns the extra nonparallel lattice construction. |
| `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md`, H1.10, H3.6, H3.8, H5.2 | Components/polarization, analytic quotient and isogeny comparisons, real-quadratic cusp geometry. The present general-field analytic tuple/adelic comparison is distinct. |
| `TauCetiRoadmap/QuaternionicModularForms/README.md`, §§0.1, 0.3, 1.3, 2.1, 3.1 | Quaternionic carriers, class sets, classical coefficients with determinant twist, evaluation and opposite-Hecke action. The repaired §1.3 citation resolves the former §1.1 mismatch. |
| `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:4176`, §4.2 | Strong approximation and its open-subgroup quotient consequence. For D=M₂(F), SL₂ has noncompact real factors, so the required finite-adelic quotient consequence applies. |
| `Completed/NumberFieldArithmetic/README.md:1209`, §4.3; §8.1 at 2139 | Ramified support and intrinsic degree/signature/discriminant label. No field or ideal ordering is reconstructed. |
| `TauCetiRoadmap/ClassFieldTheory/README.md:1723`, Layer 12; `TauCetiRoadmap/Chebotarev/README.md:409`, Layer 10 | Finite abelian class-field correspondence and Dirichlet-density #C/#G, with finite exceptional sets harmless. These give the quadratic CM character interpretation and inert density. |
| `TauCetiRoadmap/EllipticCurves/README.md:3` | The basic Weierstrass/elliptic-curve carrier is consumed. No unconditional totally-real modularity assertion is attributed to it. |
| `TauCetiRoadmap/PotentialModularityAndCompatibleSystems/README.md:1316`, §5.1 | Potential automorphy of specified lifts over an extension. It is correctly distinguished from the explicit base-field modularity input in §11.3. |

Ownership searches used `roadmaps grep` across main and indexed open heads and direct searches of the available board package READMEs, Lean files and designs. Terms included Hilbert forms/cusp forms, Koecher, Fourier coefficients, newforms, adelization, Hecke operators, coefficient fields, Doi–Naganuma and JL. The exact namespace search returned only this roadmap's Suggested.lean; no duplicate fully qualified declaration was found.

The relevant neighboring scopes were read. `TauCetiRoadmap/HilbertModularSurfaces/README.md:120` explicitly consumes this folder's groups, action, Koecher, finite dimension and component dictionary; its geometric compactifications and dimension formulas remain separate. `TauCetiRoadmap/BianchiModularForms/README.md:3` uses imaginary quadratic fields and harmonic/cohomological carriers. `TauCetiRoadmap/QuaternionArithmetic/README.md` leaves modular-form coefficients and JL to the named earlier owners. `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurvesPartII/README.md:7` owns mod-p cohomology and patching, not this classical analytic library. Board packages `packages/OverconvergentAutomorphicForms/README.md:7` and `packages/HodgeClassesForJacquetLanglands/design/README.md:31` own analytic p-adic coefficient sheaves and Hodge correspondences respectively, not the present classical tuple carrier. The other matching board passages consume Hilbert/automorphic data or concern Siegel, cohomological or spectral constructions. No new duplicate owner was established. No later roadmap was added as a supplier, and no ownership move is proposed.

### Lean headlines, signature binders and padding

Direct `lake env lean` elaboration of the original Suggested.lean succeeded with exactly 12 `sorry` warnings and no other warning/error. No additional build or cache update was needed. One scratch copy appended `#check @name` for every one of the 50 declared names and elaborated successfully. All types were compared with the definitions and README hypotheses.

The 24 heuristic binder alerts are not 24 missing assumptions. For example, `UpperHalfSpace`, `GL2Pos`, `Weight`, `IsHolomorphic` and the matrix-entry helpers are deliberately definable under fewer assumptions; the actual slash, analytic coefficient constructions and arithmetic theorems retain their needed number-field/totally-real binders. The three finite-dimensionality statements retain degree>1 and nonzero level; the negative-weight theorem retains both. Koecher retains μ≠0. `hasSum_fourier` need not assume degree>1: Fourier expansion of a periodic holomorphic function remains valid in degree one even though Koecher does not. No signature change was needed or made.

The twelve stated acceptance theorems are:

| README headline | Suggested.lean declaration and line | Padding probe |
|---|---|---|
| Fourier expansion | `hasSum_fourier`, 301 | `simp` did not close. |
| Koecher support | `koecher`, 309 | `simp` did not close. |
| Nonparallel cuspidality | `constantTerm_slash_eq_zero_of_not_isParallel`, 316 | `simp` did not close. |
| Full-expansion injectivity | `fullExpansion_injective`, 399 | `simp` did not close. |
| Cusp coefficient injectivity | `cusp_coeff_injective`, 405 | `simp` did not close. |
| Hecke coefficient bound | `exists_norm_coeff_le`, 412 | `simp` did not close. |
| Cusp finite dimension | `finiteDimensional_cuspForms`, 418 | `simp` did not close. |
| Component full-space finite dimension | `finiteDimensional_modularForms`, 423 | `simp` did not close. |
| Tuple full-space finite dimension | `finiteDimensional_hilbertModularForms`, 428 | `simp` did not close. |
| Negative-weight vanishing | `modularForms_eq_bot_of_top_neg`, 433 | `simp` did not close. |
| General-form L-series convergence | `LSeriesSummable_of_modularForm`, 442 | `simp` did not close. |
| Cusp-form L-series convergence | `LSeriesSummable_of_isCuspForm`, 449 | `simp` did not close. |

All twelve admissions were replaced by the single tactic in one scratch copy and that copy was elaborated; all twelve yielded unsolved goals. Reading the native definitions and available declarations found no one-lemma proof of these Hilbert analytic assertions at the pin. The proved elementary helper declarations support the kept group/submodule definitions; they are not admitted acceptance padding. No padding finding is raised.

The remaining README end theorems are cusp–Eisenstein decomposition, Hecke-equivariant classical–adelic comparison, newform decomposition, coefficient-field rationality/Galois action, the completed functional equation/card, twists and CM induction, base change and Doi–Naganuma, and the definite JL/Brandt comparison. Lines 19–26 of the module docstring name their missing carriers. They are not replaced with arbitrary functions, free predicates or hypotheses containing their conclusions. No additional statable headline omission was established at this pin; in particular the formerly omitted general L-series theorem is now present.

## Not verifiable

This is a completed review, not a request to park it. The following are limits on source certification, not invented contradictions in unavailable texts. The service was used for retrieval, no access barrier was bypassed, and no cached source was copied into a report or the repository.

- Freitag, *Hilbert Modular Forms*: publisher/paywall result only, treated as uncertified. Ch. I §2 and the unspecified Hecke-bound/finite-dimensionality locators could not be checked against the book.
- Miyake, *Modular Forms*, §§4.5–4.6; Doi–Naganuma (1969), pp.1–14; Atkin–Li, twisting/newform reference: publisher/paywall results only, treated as uncertified. The source statements were not reconstructed from those landing pages. Zagier's readable author copy supports the separately delimited §9.6 claims.
- Van der Geer and Garrett: bibliographic/publisher searches through the service supplied no legal full text. Their general-field cusp counts, reduction and Eisenstein claims remain uncertified here.
- Shimura 1978, §§2 and 4: DOI/Project Euclid landing page found, but no readable article text. Shimura 1971, Theorem 3.24: the bibliographic resolver found a review of the book, not the book. No theorem number or generality was inferred from that review.
- Diamond–Shurman Proposition 5.8.5: no full text through the initial resolver; a candidate McGill institutional PDF returned 404. The classical/Hilbert distinction was checked through the available supplier, not by claiming to have read this proposition.
- Iwaniec–Kowalski (5.7): the service reached the AMS publication landing page but obtained no open text. The norm-shift/card formulas were checked against the actual LFunctions supplier; the textbook equation was not certified.
- `mf.hilbert.level_norm`, `mf.hilbert.weight_vector`, `mf.cm`, `rcs.cande.mf.hilbert`: the retrieved text is a browser challenge at line 5, not the knowl. Other readable knowls and the fetched code establish some displayed-field meanings, but do not certify the missing knowls' content.
- Database-specific positive CM/base-change flags and claims about which form is the first in a database ordering are not established by the finite coefficient tests. `dq.mf.hilbert.reliability` lines 92–94 itself distinguishes negative certifications from positive evidence. The mathematical predicates and negative controls were reviewed; this review does not turn a stored flag into a proof.
- Publication-version numbering of Dembélé–Voight was not verified beyond the readable arXiv v2 text. The report's page numbers for that source refer to the preprint. Unavailable source requests were consolidated in the job's missing-reference record, without editing the roadmap manifest.

## Source issues

These are defects in the texts actually read, not additional findings against the repaired roadmap. Locators refer to the versions specified above.

- **Misprint** in dembele-voight at §2, after (2.4), printed p.6, line 288: the source says the slash invariance is equivalent to (3.3); it should be (2.2); affects nothing.
- **Misprint** in dembele-voight at §2, after (2.5), printed p.6, line 307: the source says the coefficient index satisfies 𝔫=(ν)𝔡⁻¹ with ν in 𝔡; it should be 𝔫=(ν)𝔡 with ν in 𝔡⁻¹; affects a stated result.
- **Error** in dembele-voight at §2, Hecke operators paragraph, printed p.6, lines 310–311: the source says all ideal-indexed Hecke operators are diagonalizable; it should be restricted to the good-prime algebra, with separate newvector statements for bad operators; affects a stated result.
- **Misprint** in dembele-voight at Example 6.6, printed p.29, line 1427: the source says the cusp space has dimension one; it should be dimension two, with one Hecke constituent of coefficient-field degree two; affects a stated result.
- **Misprint** in dembele-voight at Example 7.26, Fourier expansion, printed p.42, line 2104: the source says the exponent lattice is 𝔞𝔡⁻¹ for translation lattice 𝔞; it should be 𝔞⁻¹𝔡⁻¹; affects a stated result.
- **Misprint** in dembele-voight at Example 7.26, ideal coefficients, printed p.42, lines 2113–2114: the source says 𝔫=(ν)𝔞𝔡⁻¹ with ν integral; it should be 𝔫=(ν)𝔞𝔡 with positive ν in 𝔞⁻¹𝔡⁻¹; affects a stated result.
- **Error** in lmfdb-hilbert at mf.hilbert, web page, line 95: the source says the displayed matrix conditions define the lattice stabilizer without constraining its diagonal entries; it should be supplemented by diagonal integrality; affects a stated result.
- **Error** in mf.hilbert.q_expansion at the opening component description, web page, line 90: the source says cusps are indexed by the narrow class group; it should be components indexed that way, with a separate level-dependent cusp set on each component; affects a stated result.
- **Gap** in lmfdb-base-change at mf.base_change, root-power definition, web page, line 92: the source says roots and degree specify the new polynomial; it should be supplemented by constant term one for Euler polynomials; affects a stated result.

For the bad-operator source issue, an oldspace from a good-prime primitive eigenform raised to level p³ has U-characteristic polynomial X²(X²−a_pX+ψ(p)q^(k₀−1)) and a one-dimensional zero eigenspace. Since the last constant is nonzero, the zero eigenvalue has algebraic multiplicity two but geometric multiplicity one. For the lattice source issue, diag(1/2,2) passes the incomplete displayed conditions but does not stabilize 𝒪². For Example 6.6, the source's own coefficient t with t²=3 and its conjugate give two distinct eigenlines. These are short witnesses for the source corrections, independent of their use by this roadmap.

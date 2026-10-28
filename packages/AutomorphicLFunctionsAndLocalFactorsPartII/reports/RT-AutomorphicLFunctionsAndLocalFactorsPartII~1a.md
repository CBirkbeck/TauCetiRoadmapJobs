<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1023#issuecomment-6426422785 -->
Red team round 1 pass a (codex) of 389ebdc

Verdict: needs_changes

1. **F01** (P1) The doubling supplier does not cover the inducing characters consumed here

   **Location:** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:135`, `:264`, `:356`, `:436`, `:541`: “continuous quasi-character χ”; “Use the local integral of MetaplecticAutomorphicForms §§6.10a–6.11.”

   **Claim:** The general local functional equation and completed function for arbitrary χ can be obtained by transporting the supplied classical doubling theory.

   **Witness:** `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:621` requires χV restricted to F× to equal η^(dim V); `:1676` retains compatible splitting characters. For E=ℚ₃×ℚ₃ and χ=(quadratic conductor-3 character,1), χ(2,2)=−1; every splitting character and norm twist gives 1.

   **Exact repair text:** Add a named supplier extension, with the identical slug and needs in the README and `design/plan.json`: “What MetaplecticAutomorphicForms must provide (gap:arbitrary-character-unitary-doubling): For a characteristic-zero local field F, a quadratic étale E/F, a nondegenerate positive-rank Hermitian space V, and an irreducible smooth admissible or Casselman–Wallach representation π of U(V), establish the complete local-factor theorem of §6.10a for normalized Siegel induction from χ∘det times abs(det)_E^s and its standard-factor twist, for every continuous quasi-character χ:E×→ℂ×, without a restriction on χ restricted to F×. Use the supplier’s own parabolic convention; the EHLS inverse-character dictionary is proved in this package.” Cite this extension in §§2.1–2.4 and 3.4. Alternatively make that extension an explicit target here. Keep arbitrary χ in scope.

   **Repair test:** The split conductor-3 character is now an explicit extension input. Its restriction −1 on the diagonal unit cannot be hidden by inverse characters, norm shifts, Haar scalars or a change of polarization.



2. **F02** (P2) The field-compatible Cauchy theorem is absent from the acceptance test

   **Location:** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:643` and `packages/AutomorphicLFunctionsAndLocalFactorsPartII/Suggested.lean:15`: “Cauchy isomorphism”; “Holomorphic injection, branching and nonzero highest-line projection (README §§4.3–4.7)”.

   **Claim:** The acceptance file groups all of §§4.3–4.7 under missing Harish–Chandra carriers and contains no theorem. Section 4.4 is itself a deep, general equivariant decomposition theorem on existing carriers; it is not a small matrix identity or a Check.

   **Witness:** `Mathlib/RingTheory/MvPolynomial/Homogeneous.lean:87` supplies `MvPolynomial.homogeneousSubmodule`; `TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Basic.lean:429,441` supplies the shape modules and actions. For u=d=2 its full representation decomposition has dimensions 10=9+1, independently of Harish–Chandra modules.

   **Exact repair text:** Retain §4.4 as a headline and state its equivariant Cauchy isomorphism in Suggested.lean: “For every characteristic-zero field E and u,d∈ℕ, the degree-d part of E[Xᵢⱼ] with action f(X)↦f(g₁⁻¹Xg₂) is GL_u(E)×GL_u(E)-equivariantly linearly isomorphic to the direct sum, over Young diagrams λ of size d and at most u rows, of (TauCeti.weylModuleOfShape E u λ)∨⊗[E]TauCeti.weylModuleOfShape E u λ.” Use the pinned homogeneous-polynomial, linear-dual, tensor-product and representation-equivalence carriers; give only the simple action/specialization definitions needed, with real bodies, and admit the theorem with `sorry`. Import only its used individual TauCeti modules. Name the new theorem in README and remove §4.4 from the docstring's not-statable range. The field-extension/projector assertions may remain further README targets.

   **Repair test:** The statement covers u=d=2 over ℚ and ℚ(i), with dimension 10=3²+1², and u=d=0, with dimension 1=1. It asserts the full equivariant isomorphism, not those dimension Checks. The previous repair report's description of this as “supporting” does not make this newly owned general decomposition a one-lemma calculation.

3. **F03** (P3) Two supplier targets are cited in the wrong sections

   **Location:** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:69`, `:81`, `:1647`, and the matching rectangular-orbit-support needs in `design/plan.json`: “SR.5.3 mirabolic-derivatives”; “AL.3 … the Jacquet–Shalika Satake bound”.

   **Claim:** Those two targets occur in the named sections.

   **Witness:** At the indexed heads, `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:3647` places mirabolic-derivatives in SR.5.1; its SR.5.3 adapter starts at 4716. `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1820` places the Satake bound in AL.2, before AL.3 starts at 1952.

   **Exact repair text:** Replace “SR.5.3 mirabolic-derivatives” by “SR.5.1 mirabolic-derivatives and SR.5.3 highest-derivative-adapter” in the rectangular-orbit-support contract and its plan needs. Cite “AutomorphicLFunctionsAndLocalFactors AL.2, The Jacquet–Shalika Satake bound” everywhere this bound is consumed; retain AL.3 for pair factors and global Rankin–Selberg theory.

   **Repair test:** The replacement resolves to the actual derivative normalization and to the inequality q⁻¹ᐟ²<|α|<q¹ᐟ². For q=4 and α=1, the bound reads 1/2<1<2. No theorem or hypothesis changes.

4. **F04** (P3) The local-integral Checks do not test its additive-character convention

   **Location:** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:1013–1028`: “A zero matrix coefficient or zero section gives zero”; “At k=1, U₀=1”; “a coefficient multiplier a and section multiplier a⁻¹ have product 1”.

   **Claim:** The Checks discriminate the definition of the generalized local integral, including its ψ_U sign. The first three are repeated in the additional checks, while the remaining dimension check concerns the quotient carrier.

   **Witness:** Replace ψ_U by ψ_U⁻¹ in §6.1. Every listed Check still holds: zero gives 0, k=1 gives the same evaluation, central multipliers give aa⁻¹=1, and the quotient dimension remains 1. The two integrals need not agree.

   **Exact repair text:** Replace the repeated zero-data and k=1 checks by: “On a one-root open chart for k>1, take F=ℚ₃, vol(ℤ₃)=1 and ψ(1/3)=ζ₃. Specify a compactly supported section with root-coordinate restriction 1_(1/3+ℤ₃) and the remaining factors of integral 1. The ψ_U integral is ζ₃ and the ψ_U⁻¹ integral is ζ₃². Moving the support to −1/3+ℤ₃ exchanges the values. Multiplying that root Haar measure by 2 gives 2ζ₃.” Supply the chart and section when writing these Checks, so they test the actual carrier. Retain the nontrivial central-cancellation and GSpin₂ quotient-dimension checks.

   **Repair test:** ζ₃≠ζ₃² rejects the opposite additive-character convention; scaling that measure by 2 gives 2ζ₃ instead of ζ₃. Zero-data and k=1 checks alone reject neither convention.


5. **F05** (P2) The named p-adic consumer does not have the claimed scope

   **Location:** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:7`, `:1699`: “p-adic interpolation itself belongs to AutomorphicPadicLFunctionsPartII”; “The unitary pullback and critical archimedean sections supply complex analytic inputs for AutomorphicPadicLFunctionsPartII”.

   **Claim:** The current AutomorphicPadicLFunctionsPartII roadmap consumes these unitary-doubling outputs to construct their p-adic interpolation.

   **Witness:** At the supplied head, `TauCetiRoadmap/AutomorphicPadicLFunctionsPartII/README.md:1,3,7` scopes the roadmap to critical Hecke values, Eisenstein–Kronecker classes and ordinary ray-class interpolation. Its inputs are Hecke/ray classes, CM geometry and measures; it has no unitary-doubling target.

   **Exact repair text:** Replace the ownership clause in the introduction by “The base's Layer AL.5 owns period, sign and finite-correction interfaces; p-adic interpolation and integral congruence applications are outside this roadmap.” Replace the first downstream-consumer sentence by “The unitary pullback and critical archimedean sections are complex analytic outputs for subsequent arithmetic applications.” Do not attribute unitary interpolation to the current Hecke-value roadmap without an actual target there.

   **Repair test:** A rank-two unitary cuspidal representation and its Garrett pullback still lie in §§3–4 here. A Hecke character and its ray-class measure still lie in AutomorphicPadicLFunctionsPartII. The revised text no longer claims that the latter constructs the former's measure.

6. **F06** (P2) The gamma-zero polynomial needs the punctured-domain condition

   **Location:** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:1136`: “P(0)=1, whose zeros with multiplicity are the zeros of the normalized rational γ … as a function of X=q^(−s)”.

   **Claim:** The zero divisor of the rational function in X defines a polynomial with constant term 1. The domain of that divisor is not restricted to X≠0, nor is removal of a Laurent unit specified.

   **Witness:** Take SO₂ over ℚ₃, π=1, and τ the conductor-one quadratic character, τ(3)=1. With conductor-zero ψ, §6.11 gives γ=ε(τ)²=−3X², but L=1. Its rational-function zero at X=0 contradicts P(0)=1.

   **Exact repair text:** “Take the zero divisor of γ in ℂ×, with multiplicities, and let P∈ℂ[X], P(0)=1, have exactly that divisor on ℂ×. Ignore the order at X=0: powers of X are units in ℂ[X,X⁻¹]. Equivalently, require P(q^(−s)) and γ(s) to have the same zeros in the s-plane. Set L=P(q^(−s))⁻¹.” Add the SO₂ ramified-quadratic Check: “γ=−3X² has no zeros on ℂ×, so P=1 and L=1.” This is the domain used by CFK line 673.

   **Repair test:** The repaired divisor is empty for −3X², giving P(0)=1 and L=1, in agreement with both ramified Tate factors. An unramified factor 1−aX still contributes the nonzero root a⁻¹ and is retained.

7. **F07** (P2) The split-torus reduction does not cover ramified nonunitary characters

   **Location:** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:1136`, `:1221`: “Use the positive-exponent chamber a_d>r”; “Norm twists … reduce to this case by §6.6 and the Langlands product of §6.7.”

   **Claim:** The tempered gamma-zero construction, followed by the stated norm shifts and positive-chamber product, defines the factors for every ramified SO₂ character.

   **Witness:** Over ℚ₃ take μ=χ|·|⁻¹, τ=χ, χ ramified quadratic. The two exponents are −1,+1. A common τ shift u makes both zero only if u=1 and u=−1. SO₂ has no Weyl reflection; its parabolic is itself.

   **Exact repair text:** In §6.7 add a torus base case before the positive-chamber recursion: “For SO₂ and GSpin₂, write (α,β) as in the explicit cocharacter coordinates, without any unitarity or sign restriction. Define L=L_RS(α×τ)L_RS(β×τ) and ε=ε_RS(α×τ)ε_RS(β×τ); compare their gamma quotient with §6.6's multiplicativity for the improper parabolic P=G. The inequality a_d>r is imposed only for the nontrivial root directions of a proper Langlands parabolic.” In §6.11 replace the asserted common norm-shift reduction for arbitrary torus π by this base-case comparison. Keep the tempered zero-divisor argument as a consistency theorem, with R06's punctured domain.

   **Repair test:** For μ=χ|·|⁻¹ and τ=χ, the two factors are L(s−1,1)L(s+1,1). At s=2 they give (3/2)(27/26)=81/52. The original common-shift route cannot reach this ramified example; the explicit torus base case does. CFK lines 679–680 only permit a π norm shift in GSpin, so they do not supply the missing SO₂ step.

8. **F08** (P2) Two root transforms with different rank ranges share one hypothesis list

   **Location:** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:872`, `:874`, `:882`: “For τ … and 0<l<c”; “associated root-elimination transform onto the lower (k,l) model”.

   **Claim:** Both the c-splitting functional and the classical-group pole-reduction transform have the stated 0<l<c range. The latter's classical group and parabolic are not included in its hypotheses.

   **Witness:** CFK lines 837–863 use a classical Levi GL_l×G_(c−2l), its radical, and the composition (l,c−2l,l). At c=3,l=2, 0<l<c holds but c−2l=−1; the required radical and composition do not exist.

   **Exact repair text:** Separate the two assertions: “The MODELS Lemma 9 c-splitting functional has 0<l<c. For the CFK Lemma 3.16 pole-reduction transform, additionally fix a split classical G_c and a standard parabolic R with Levi GL_l×G_(c−2l), with 1≤l≤⌊c/2⌋ and the allowed low-rank tail. Its source is W_ψ(ρ_c(τ))⊗S_lin(U_R), and its target is the space of restrictions a↦W_l(diag(a,I_((k−1)l))) for W_l in |det|^((kc−kl−c+l)/2)W_ψ(ρ_l(τ)), as specified in R09.” Retain the unitary-τ or explicitly transported unitary-twist hypothesis. Give the two constructions separate API hypotheses and add the c=3,l=2 negative control.

   **Repair test:** c=3,l=2 remains a valid split of the GL model into sizes 2 and 1, but is excluded from the classical radical transform. The existing c=3,l=1,k=2 test remains valid and has exponent (6−2−3+1)/2=1.

9. **F09** (P2) The pole-reduction transform reaches a restriction space, not the full model

   **Location:** `packages/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:872`, `:882`: “transform onto the lower (k,l) model”; “surjects onto the required (k,l) model”.

   **Claim:** The transform has the complete lower Whittaker model as its codomain. CFK constructs functions only on GL_l, by restricting functions on GL_(kl); that restriction need not be injective.

   **Witness:** CFK lines 857–858 give only a↦W_l(diag(a,I_((k−1)l))). For k=3,l=1 over ℚ₃, W′=(R_(u₂₃(1/3))−ζ₃)W vanishes on diag(a,1,1), but W′(diag(1,2,1))=ζ₃²−ζ₃≠0 when W(diag(1,2,1))=1.

   **Exact repair text:** “Define the target restriction space as the image of |det|^((kc−kl−c+l)/2)W_ψ(ρ_l(τ)) under W_l↦(a↦W_l(diag(a,I_((k−1)l)))), a∈GL_l. The map W⊗μ↦(a↦T(diag(a,I_(kc−l))·W,μ)) is surjective onto this space. No injectivity of the restriction map or identification with the complete GL_(kl) model is asserted.” Use this codomain in the API and pole-reduction proof route, together with R08's classical-parabolic hypotheses.

   **Repair test:** Take c=k=3,l=1 and τ an irreducible unramified unitary principal series of GL₃(ℚ₃). Normalize a spherical Whittaker function W by W(1)=1 and take ψ(1/3)=ζ₃. The unit diagonal diag(1,2,1) lies in the spherical compact group, so W there is 1. The diagonal diag(a,1,1) commutes with u₂₃, giving W′=0 on the restricted domain; diag(1,2,1) scales its root coordinate by 2, giving the nonzero value ζ₃²−ζ₃. The twist exponent is 2, but both diagonals in the nonzero test have determinant norm 1, so it does not change the witness. The repaired target correctly identifies W′ with zero only after restriction.

## Verified sound

Read all 1,719 README lines and all 36 Suggested.lean lines, the repository rules, the three repair reports, the package report, plan and source manifest. The inventory is **64 numbered targets, 130 API bullets, 200 Check bullets, 21 current named gap contracts and 0 Lean declarations**. The sampled tables below retain instance computations; they do not prove the general analytic theorems. The per-target, API and complete Check ledgers are omitted for comment length. No Lean command was run. There is no declaration whose elaborated binder list could be inspected; the requested declaration/signature table has an empty domain.

| Suggested.lean inventory | Section/context | Computed inventory | Result |
|---|---|---|---|
| Imports and namespace | Sole `import Mathlib`; `TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactorsPartII` | 1 import; 0 variables, instances, definitions, theorems or examples | No binder-loss, admitted-data, duplicate-name or padding finding; R02 concerns omission |

The module docstring names seventeen headline groups whose missing analytic representation carriers were inspected at the pins. R02 identifies the additional statable equivariant Cauchy theorem. Ordinary block identities and minor evaluations would be padding if added instead.

Twelve explicitly cited pinned declarations were resolved in their named files: eight Mathlib declarations (`Matrix.fromBlocks`, `Matrix.fromBlocks_multiply`, `Matrix.conjTranspose`, `Matrix.IsHermitian`, `Matrix.trace`, `AddChar`, `lipschitzGroup`, `spinGroup`) and four Tau Ceti declarations (the Clifford-group comparison and three Weyl-module declarations). In particular, IsHermitian alone includes neither positivity nor nondegeneracy; AddChar alone includes neither continuity nor unitarity. The field, finite-dimension, nondegeneracy and invertibility-of-2 conditions of the Clifford comparison were retained. The Cauchy-carrier checks additionally inspected homogeneous polynomials, dual representations, tensor products and representation equivalences.

All **104 distinct source/start-line anchors** in README were located in the twelve supplied readable texts. These are locator checks, not certification of every proof; the CPS94 measure-normalization comparison and the three settled unavailable primary sources remain limited as described below. No new source was requested. All 15 works already have manifest entries. The 21 current needs sentences match their plan entries exactly. Supplier sections were checked across 13 named roadmap suppliers in 12 supplier subsections; the two misplaced target references are R03. The supplied 55 open-roadmap folders (110 README/Lean files) were searched by object, together with the indexed main/open-head ownership tool and the board packages. No declaration collision is possible with the empty Lean namespace.

### Conventions and excluded boundary inputs

| Statement/context | Instance | Values computed on both sides | Result/change |
|---|---|---|---|
| Local characteristic, residue norm | ℚ₂, ℚ₃ | abs(2)₂=1/2 versus abs(2)₃=1; q=2,3 | Both retained; q=1 and equal-characteristic fields excluded |
| Quadratic-étale norm | 2∈ℂ; (2,3)∈F×F | abs(2)ℂ=4, not 2; norm(2,3)=6 | Split algebra is not assigned a field instance |
| Hermitian convention | h(x,y)=conj(x)y, x=i,y=1 | h(i,1)=−i; h(1,i)=i | Detects conjugation reversal |
| Polarization | (3,1) | ((3−1)/2,(3+1)/2)=(1,2); reconstruction=(3,1) | Omitting halves yields (6,2) |
| Radical sign | rank one | i+conj(i)=0; 1+conj(1)=2 | Skew-adjoint radical, then trace-zero rescaling |
| Spectral parameters | s_G=1/2, s_U=3/2 | s_E=0; z=2; reflection z↦1−z gives s_U↦−3/2 | Two centers distinguished |
| Central quotient | GSpin₂ | center dimension 2; distinguished dimension 1; quotient dimension 1 | Full-center quotient would have dimension 0 |
| Characteristic 2 versus residue 2 | A and D over characteristic 2 | (x,−x)=(x,x), so A=D; over ℚ₂, 2 remains invertible | Characteristic 2 excluded, residue 2 retained |
| Zero ring/thickenings/inseparability | 0=1; dual numbers; purely inseparable extension | No characteristic-zero field structure on zero ring/dual numbers; characteristic-zero algebraic extensions are separable | Not admitted theorem instances |
| Finite sets, zero germs, total functions | empty Euler product; zero germ; n=0 | product=1; zero order is handled separately; s/n construction excludes n=0 | No 0/0 used |
| Arbitrary noncompact quotient | SO₂ adelic norm direction | integral from 1 to R of dr/r=log R→∞ | Global period excluded; Tate/RS branch retained |

### Sampled adversarial computations

These eighteen rows retain computed witnesses across the layers; the complete per-target ledger is omitted.

| Statement | Instances tried | Computed values | Result/change |
|---|---|---|---|
| 0.2 modulus | n=1,B=2,λ=1; scalar λ=4 | 1/4 versus inverse 4; 4^(n²)4^(−n²)=1; n(i)n(2i)=n(3i) | Modulus direction and radical sign distinguished |
| 1.2 Godement section | n=1,p=diag(4,1),s=0; Φ=0 | (0,x)p=(0,x); outer scaling=2; zero gives 0; Haar ×3 takes 2 to 6 | Row direction agrees |
| 2.2 denominator | n=0,1,2;q=2;s=0;η(ϖ)=−1 | d₀=1,d₁=2,d₂=(4/3)(2/3)=8/9; η=1 would give 8/3 | Parity distinguished |
| 2.3 spherical formula | split rank 1,X=1/2,Y=1/3 | Z=(1−1/6)/((1/2)(2/3))=5/2; d=6/5; dZ=3=L | Formula passes; full transport still R01 |
| 3.1 global identity | S₃ standard module, v=(1,−1,0),ℓ=x₃ | ℓ(v)=0, ℓ((23)v)=−1 | Correctly keeps the trilinear integral rather than inferring zero from one pairing |
| 4.4 Cauchy | u=d=2 over ℚ(i); u=0 | dimension 10=3²+1²; symmetric/alternating ranks 3,1; at u=d=0,1=1; positive d gives 0 | R02 acceptance omission; full theorem remains a target |
| 4.8 critical fiber | m=3,aχ=2,bχ=0,n=1,d=2 | t=2,scrit=3/2; 2⁻¹2⁻³=1/16=(1/2)4^(−3/2); phase i versus wrong −i | Parameter and inverse twist pass |
| 5.3 root elimination | c=2,l=1,k=2; c=3,l=1,k=2; c=3,l=2 | permutation (1,3,2,4); exponent 1 and norm factor 1/2; c−2l=−1 in last case | R08 separates the two domains  Restriction control: k=3,l=1 gives W′ restricted=0 but W′(diag(1,2,1))=ζ₃²−ζ₃; R09. |
| 5.6 growth estimates | ξ=0; scaling ξ by 3; rank-one positive chamber | bound 0≤0; seminorm scales by 3; ∫ℝ(1+x²)⁻¹dx=π, boundary ∫(1+x²)⁻¹ᐟ²dx=∞ | Open chamber and continuous seminorm necessary |
| 6.7 L and epsilon | P=1−2X; ramified SO₂ quadratic; empty Sp block | P(0)=1 versus 3P(0)=3; γ=−3X² should give L=1; empty Sp factor remains L(τ) | R06 punctured divisor; R07 torus base case |
| 6.11 torus local factors | SO₂ trivial at q=2; GSpin₂ χ(ϖ)=−1 at q=3; μ=χν⁻¹,τ=χ | 4 versus one-factor 2; 9/8 versus 9/4; at s=2 last product 81/52 | Formulas pass; all-character proof route needs R07 |
| 7.1 auxiliary integral | k=1,c=2; k=2,c=1; k=c=1 without Φ | exponents s+1/2,s−1/2; two shell tails require Re(s)>0 and Re(s)<0 | Schwartz cutoff cannot be dropped at k=1 |
| 7.4 RS pole attainment | ord L=−1,ord 𝔏=−2 | L/𝔏=t is entire; Z=t⁻² gives Z/L=t⁻¹, nonzero with a pole | Quotient direction correct |
| 8.3 residual exponents | c=2,Re(s₀)=1/4 | first −3/4; tail≤1/4; partial sums ≤−3/4,−1/2 | Last partial sum negative too; at boundary 0 strictness fails |
| 9.2 completion | good local L_v=2; F=ℚ,b=2 | partial factor ×1/2, correction ×2: product 1; norm 2·1/2=1; arbitrary idele norm 2 | Finite correction and rational-character independence agree |
| 9.4 entireness | ord Q=−1,ord(bZ)=0 | ord L=0−(−1)=1≥0 | Pole attainment sufficient; Q need not be holomorphic |
| 10.2 coarse transfer | trivial GL₂ versus Steinberg | support {ν¹ᐟ²,ν⁻¹ᐟ²} equal; gamma ratio cancellation −q^(1/2−s); L differs by L(s−1/2) | Correctly avoids nongeneric isomorphism uniqueness |
| 10.5 coarse at all places | target v₀; other bad v₁; auxiliary good w | η_v₀=1; at v₁ factors cancel by stability; at w by unramified π,Π comparison | Allows auxiliary ramification only where cancellation is available |

### Sampled README Checks

C indices are Check bullets in README order. All 33 construction/predicate Check blocks contain at least three printed Checks; §6.1 lacks additive-character discrimination (R04). Repeated zero-data and identity Checks are not independent convention tests.

| Check | Instance and computed values | Result/change |
|---|---|---|
| 0.1.C6 (README:173) | GU₀ elements with multipliers 1 and 2 both act on the unique zero vector | Values agree on the stated instance |
| 0.3.C7 (README:246) | dim quotient=2−1=1; quotient by full center=2−2=0 | Values agree on the stated instance |
| 1.1.C6 (README:292) | q=2,z=1,π(ϖ)=2,χ₁(ϖ)=2,χ₂(ϖ)=3/4: (X,Y)=(1/2,1/3), Z=5/2; inverse χ gives (2,3/16), Z=−10/13 | Values agree on the stated instance |
| 1.2.C4 (README:322) | p=diag(4,1): (0,x)p=(0,x), outer factor=2; using first row yields factor 1/2 | Values agree on the stated instance |
| 4.4.C4 (README:658) | X₂₁=t=1: upper first action changes X₁₁ by −1; lower first and upper second change it by 0 | Values agree on the stated instance |
| 4.6.C5 (README:703) | differences (0,1): degree 0·1+1·2=2; det and X₁₁² both degree 2 but values −2 and 1 | Values agree on the stated instance |
| 5.1.C3 (README:816) | k=3,c=1: adjacent sums 3 and 7 add to 10; top-right cross term 4 contributes 0 | Values agree on the stated instance |
| 5.3.C6 (README:898) | determinant norm 1/2, exponent 1: twist=1/2 versus omitted twist 1 | Existing Check passes; missing range controls R08–R09 |
| 6.1.C1 (README:1014) | zero coefficient or section: absolute integral=0 for either sign of ψ_U | True but insensitive to ψ sign; R04 |
| 10.2.C5 (README:1629) | q=4,s=1: (1−1/2)/(1−2)=−1/2=−4⁻¹ᐟ² | Values agree on the stated instance |

### Declared-contract audit

All 21 named contracts occur with the same slug, supplier and needs sentence in README and the plan. Standing characteristic-zero/local-category assumptions accompany them. Searches by object found no earlier theorem already giving the complete requested extension; the existing constructors they extend were inspected in the supplier audit. A contract awaiting its supplier is not reported as a missing theorem.

The six older G1–G6 records remain in the plan with supplier `none`. The disposition F01 in `packages/AutomorphicLFunctionsAndLocalFactorsPartII/reports/FIX-PKG-AutomorphicLFunctionsAndLocalFactorsPartII~2.md:7` is settled: those records are referenced from immutable coverage stages, while their obligations have been assigned to package targets or named supplier contracts. I did not re-raise their administrative presence. R01 concerns an actual unmatched character domain in the replacement contract, independently of those records. No other finding is a re-raising of a “not actionable in this package” disposition.

### Supplier and ownership evidence

The main checkout is 546d9e45; the citation index records main 546d9e4 and 354 open heads at its supplied timestamp. Thirteen suppliers were inspected against their current sections and target hypotheses; R01 and R03 retain the actionable domain and locator witnesses. The consumer citation checked at the supplied AutomorphicPadicLFunctionsPartII head is R05.

Ownership searches used the required roadmap index tool, the board packages, main/Completed and all 55 expressly supplied sibling folders. Object searches included Cauchy decomposition, highest-line projectors, generalized Speh models, doubling, Whittaker support, GSpin and holomorphic branching. The indexed generalized-Speh occurrence in EndoscopicTransferAndUnitaryTraceComparison concerns the already imported residual/type construction; it does not provide the characteristic-zero local model comparison and root transform here. The supplied classical-group and arithmetic consumers did not own the coefficient-field polynomial Cauchy isomorphism. These specialized comparisons remain owned by this package. No new foundation was inferred merely from a similar name.

The read-only change summary has nine changed files, all inside this package. Suggested.lean has no `set_option`, admitted data, examples or `lemma` declarations, and has exactly the prescribed Mathlib import. No external file edit, posting, git mutation or Lean build was performed during this pass.

The dependency gate returned exactly:

```text
moved: AutomorphicLFunctionsAndLocalFactorsPartII moved in the merge order from #26 to #167, right after its last supplier MetaplecticAutomorphicForms (SmoothRepresentationsOfLocalGroups, AdelicAlgebraicGroups, AutomorphicFormsOnReductiveGroups, GeometryOfNumbersAndQuadraticArithmetic, AutomorphicLFunctionsAndLocalFactors, AutomorphicSpectralTheory, GL2AutomorphicRepresentationsAndTransfer, EndoscopicTransferAndUnitaryTraceComparison also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 56 roadmaps, 650 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The permitted move is not a finding. The resolver found no citation or backticked name nowhere; R03 demonstrates why locating a name somewhere does not validate its stated section.

### Source verification evidence

| Source | Distinct README start-line anchors located | Scope inspected/result |
|---|---:|---|
| CFK | 52 | v5 definitions, Theorems 2.1 and 3.2–3.12, local estimates, constant-term/pole arguments, global/converse arguments and Appendix A; the primary local proof remains CFK22 |
| MODELS | 9 | Definition 1, Proposition 2 and derivative argument, Theorem 4, Claim 6 and root-elimination/model lemmas |
| GK | 5 | Theorem A, Theorem 1.4 and its conormal hypotheses, geometric setup and §3.2 unfolding; not a line-by-line reproof of all orbit cases |
| HLS | 2 | Unitary integral and compact local-section normalization; its own continuation caveat remains visible |
| GARRETT | 1 | Rational convolution theorem and surrounding compact-type model; PDF check preserves the conjugation bar lost in text extraction |
| HARRIS | 3 | Remark 4.4(iii)–(iv), pp.27–28; qualitative rationality does not itself compute this package's complete normalization |
| EHLS | 21 | Unitary right-action formulas, local/global identities, holomorphic compact-dual conventions and branching; PDF (95) has weak inequalities ≥ |
| HEN02 | 2 | Proposition 1.9 and §§5.1–5.3 support argument, including proof-text slips below |
| CPS94 | 2 | Lemmas 2.1–2.3 and their proofs; the PDF makes the printed local exponent readable; comparison with self-dual normalization remains unresolved |
| CKPSS01 | 3 | §2 twisted outside-S converse family and proof route |
| ADAMS14 | 2 | Theorem 1.2, Corollary 1.4 and the irreducible Harish–Chandra-module setting |
| GGS17 | 2 | Theorems E–F and Corollary G, with the quotient-category, dual and orbit conditions retained |
| CFK22, YAM14, KAP23 | 0 readable primary anchors | Three settled uncertified works; locators retained without pretending their proofs were read |

Source-error controls: an S₃ coefficient with v=(1,−1,0), ℓ=x₃ has ℓ(v)=0 but ℓ((23)v)=−1; a compact integral of mass 7 and pairing 2 equals 14; a lower-left block for k=2,c=3,l=1 has size 4×2, not 2×4; a GSpin twist with r=2,a=3/2 has a−r=−1/2 despite a>r/2; the GL₂ trivial/Steinberg pair has equal gamma tests but different monodromy. For Garrett’s adjoint sentence, K=U(1), τ(z)=z and z=i give i versus −i if the involution fixes K pointwise; inversion instead gives −i on both sides. These detect the source issues below without relying on a transcription alone.

## Not verifiable

- **CFK22 Lemma 7.3 and the full primary local construction; YAM14 Theorem 7.1; KAP23 Theorem 25.** The manifest settles all three as uncertified. Their primary proofs were not read, no renewed request was made, and no proof certification is inferred from CFK's citation of them.
- **Full analytic proof closure.** The unitary normalization transport, critical projected-kernel/Haar comparison, complete generalized-doubling distribution argument, pole-attainment construction, and converse/globalization proof chains remain substantial implementation theorems. The available source statements, cited proof steps, their hypotheses and the computed boundary instances were reviewed; the tables do not claim to reprove them. R01 identifies a specific unmatched supplier domain rather than treating every future proof as a gap.
- **CPS94 local measure normalization.** CPS94 line 249, printed p.163, has exponent nms−d with d=nm−m(m+1)/2. The requested self-dual law has exponent nm(s−1/2). For n=3,m=1,s=1/2 they are −1/2 and 0, respectively. Their difference is exactly the half-dimension of the auxiliary matrix integration space, up to sign. I could verify the print, but not an explicit convention conversion in the cited proof. The global product-formula argument cancels either norm power; it does not resolve this local discrepancy. The named epsilon-change gap must supply the conversion or a direct proof.
- **Elaboration.** No Lean command was run, as required by this read-only pass. There are zero named declarations, so there are no missing `#check @name` signature inspections. R02 is a carrier/source audit, not a claimed successful build of a proposed theorem.

## Source issues

- **Error** in EHLS at §4.1.4, printed p.47, EHLS lines 2019–2023: the source says a fixed-section doubling pairing is invariant and vanishes whenever the original vector pairing vanishes; it should be a trilinear equivariant integral, with the section transformed as well; affects a stated result.
- **Misprint** in HLS at (3.1.2.5), internal printed p.44, HLS line 1765: the source says the denominator parity includes an extra n−1 in its exponent; it should be the exponent without that extra n−1; affects a stated result; corrected in print at EHLS §4.2.1, p.49, EHLS lines 2111–2113.
- **Misprint** in HLS at §3.1.2, published p.439 (internal p.45), HLS line 1799: the source says the unramified base change has target GL_m; it should be GL_n; affects a stated result; corrected in print at EHLS §4.2.1, p.49.
- **Error** in HLS at (3.1.2.9), internal printed p.45, HLS line 1818: the source says the compact-support local integral is the subgroup volume for unrestricted local vector pairing; it should be that volume times the pairing, or explicitly require pairing one; affects a stated result.
- **Misprint** in GARRETT at §1, printed p.2, GARRETT lines 103–104: the source says the extreme coefficient is left N−-invariant and extends to N−K_C N+; it should be left N+-invariant on N+K_C N−, consistently with the preceding annihilation calculation; affects the proof.
- **Misprint** in GARRETT at §1, printed p.3, GARRETT line 115: the source says the adjoint involution fixes K pointwise; it should be the adjoint anti-involution restricting to inversion on K; affects the proof.
- **Misprint** in GARRETT at §1, printed p.3, GARRETT line 142: the source says the character defining the kernel at n+θn− is evaluated at k; it should be evaluated at θ; affects nothing.
- **Error** in MODELS at §1, printed p.2, MODELS lines 63–67: the source says twisted U-coinvariants carry an action of all R without normality or character-invariance assumptions; it should be an action of the stabilizer of the pair (U,ψ) in R; affects a stated result.
- **Misprint** in MODELS at §3.2, before (3.4), printed p.7, MODELS line 314: the source says the lower-left block has kl rows and k(c−l) columns; it should be k(c−l) rows and kl columns; affects nothing.
- **Misprint** in CFK at §1, printed p.7, CFK line 294: the source says the restriction of Υ_l uses the tail character Υ_(l−2k); it should be Υ_(l−2r), for the Levi with total GL-block size r; affects a stated result.
- **Misprint** in CFK at (3.16), printed p.17, CFK lines 686–687: the source says a_d>r/2 when abs(Υ)^(−r)π′ is tempered; it should be a_d>r with the displayed normalization of Υ and its Levi restriction; affects a stated result.
- **Gap** in CFK at (3.18), printed p.18, CFK lines 739–745: the source says the classical gamma comparison is tested against all irreducible GL representations; it should be restricted to the generic domain already constructed, or accompanied by a nongeneric extension; affects a stated result.
- **Misprint** in CFK at the proof of Lemma 4.3, printed p.36, CFK lines 1580–1583: the source says denominator holomorphy and numerator nonvanishing imply holomorphy after undoing normalization; it should be numerator holomorphy and denominator nonvanishing for L(2s)/L(2s+c′); affects the proof.
- **Misprint** in GK at §1.3 before Theorem 1.4, printed p.10, GK line 457: the source says the equivariance character is a character of the closed subset Z; it should be a character of the acting group C; affects nothing.
- **Gap** in GK at §3.2 after (3.8), printed p.73, GK lines 4193–4198: the source says the same global identity includes SO₂ by globalizing the low-rank argument; it should be accompanied by a separate split-torus construction because the unmodified period has an infinite norm direction; affects the proof.
- **Misprint** in HEN02 at Proposition 5.2(b)(i), printed p.601, HEN02 line 621: the source says the automorphic gamma tests use σ⊗ρ and σ′⊗ρ; it should be π×ρ and π′×ρ; affects a stated result.
- **Misprint** in HEN02 at the conclusions of §§5.2–5.3, printed p.602, HEN02 lines 651,655,658: the source says the gamma tests identify arbitrary representations themselves; it should be equivalence of Weil restrictions or equality of supercuspidal supports, as the propositions state; affects the proof.
- **Misprint** in HEN02 at §5.3, printed p.602, HEN02 lines 653–659: the source says the second gamma factor has additive-character argument s, tests π∈A₀(r), and places Weil parameters in A₀; it should be argument ψ, tests ρ∈A₀(r), and G₀ for Weil parameters; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "389ebdcbdbbefbbb55272e3a8a7f2d1ab32fe1a4", "job": "RT-AutomorphicLFunctionsAndLocalFactorsPartII~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->

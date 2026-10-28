<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1562#issuecomment-6397313718 -->
Review (codex) of 87b8e9a

Verdict: needs_changes

1. **F01** (P1) Twelve open gaps still have no supplier

   **Location:** `packages/TopologicalMirrorSymmetryForHitchinSystems/design/plan.json:3762`, continuing through line 3950; compare `packages/TopologicalMirrorSymmetryForHitchinSystems/README.md:35`. The first inherited entry has `"id": "G-ETII"` and `"status": "open"`.

   **Claim:** The package has declared, owned supplier contracts for its prerequisites.

   **Witness:** The twelve G-* entries have no supplier field. None of their twelve identifiers occurs as a gap in the README. Thirteen differently named contracts were appended; these do not resolve the original records.

   The affected identifiers and first lines are G-ETII (3762), G-MHS (3788), G-Groth (3807), G-HT (3822), G-unitary (3837), G-local (3847), G-moduli (3864), G-lowgenus (3881), G-HT-descent (3906), G-Kummer (3920), G-Higgs-purity (3930), G-Galois (3941). Their `neededBy` lists and open status remain populated. This is the brief's explicit unowned-gap case, not a complaint that an otherwise declared supplier has yet to implement its contract.

   **Exact repair:** Normalize the top-level gap registry and README together. External obligations must have a single operative slug, named earlier supplier, section and matching README contract. Reconcile G-ETII with the generic-orbifold/transgression and tame-trace contracts; G-MHS with geometric-compact-mhs; G-Groth with equivariant-grothendieck; G-HT with fractional-equivariant-hodge-tate; G-unitary with unitary-splitting-families; G-local with equal-characteristic-abelian-duality; G-moduli with the three relative geometry contracts; and G-Higgs-purity with higgs-sector-purity. Keep the actual local obligations as this roadmap's existing targets: G-lowgenus at §3.9, G-HT-descent at §§4.4–4.5, G-Kummer at §2.2, and G-Galois at §5.4. Do not leave those as unowned external supplier requests or introduce self-dependency edges. Preserve the mathematical obligations and the immutable target bodies while reconciling the allowed gap list.

   **Repair test:** At present the counts are 25 registry entries, 13 named suppliers, 12 missing suppliers, and 12 unmatched historical identifiers. After reconciliation every operative external gap must have exactly one matching README slug and a named earlier supplier; the four local obligations must still be named targets.

2. **F02** (P2) The integration gap requests an existing supplier's results

   **Location:** `packages/TopologicalMirrorSymmetryForHitchinSystems/README.md:73`: “Provide invariant-top-form measures with integral-unit normalization, Weil volume, Fubini and change of variables over all nonarchimedean local fields”. Also `packages/TopologicalMirrorSymmetryForHitchinSystems/design/plan.json:3975`, gap:local-field-integration.

   **Claim:** This entire integration interface is missing from LogicAndDefinabilityInNumberTheory.

   **Witness:** `packages/LogicAndDefinabilityInNumberTheory/README.md:445`, at supplied head d36cfa5, already states arbitrary-local-field gauge measures; lines 471, 483 and 549 state nullity, Weil volume and Fubini. Line 417 supplies analytic substitution.

   I read that package at the head in the supplied board index, rather than relying on the absent roadmap-folder search result. Its §2.7 includes integral-unit invariance and tensor-power normalization; §2.8 removes positive-codimension loci; §2.9 uses arbitrary smooth finite-type integral models; §2.13 specifies the base-first determinant convention. These are the requested objects and hypotheses, including equal characteristic.

   **Exact repair:** Consume LogicAndDefinabilityInNumberTheory §§2.5, 2.7–2.9 and 2.13 explicitly, replacing the LD.2 placeholder in the contract and relevant Needs lines. Remove the duplicate operative gap request; if an additional interface really remains, state only that residual requirement. Section 2.12 also supplies dual-abelian volume invariance and can be cited in §2.5's torsor specialization. Do not re-plan those generic theorems.

   **Repair test:** Over both Q₃ and F₃((t)), the supplied normalization gives vol(O)=1, vol(πO)=1/3, and density of π²(dx)⊗² equal to 1/3, taking π=3 and π=t respectively. Base-first Fubini gives da∧(−dx/x)=dx∧dy for a=xy. These are exactly the normalization requirements used by this package.

3. **F03** (P2) The generic transgression gap duplicates an earlier owner

   **Location:** `packages/TopologicalMirrorSymmetryForHitchinSystems/README.md:63`: “Provide tame finite-quotient inertia, tangent age, action-groupoid gerbe transgression and normalized orbifold integration”. Also `packages/TopologicalMirrorSymmetryForHitchinSystems/design/plan.json:3963`.

   **Claim:** Generic quotient inertia and coherent gerbe transgression must be supplied as new EndoscopicTransferAndUnitaryTraceComparison exports.

   **Witness:** `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:2342` already defines quotientGerbeTransgression with coherent centralizer descent; line 2358 states quotientInertiaComponents. Both are in §4.5 at the supplied open head.

   The existing transgression includes a commutative band, actual equivariant coherence, fixed-locus torsors, conjugation and pullback. Its inertia decomposition allows every finite constant group, without the new request's tameness restriction. SchemeAndStackFoundations §1.20 supplies inertia itself. The package cites many moduli sections, but omits the section that owns precisely these constructions.

   **Exact repair:** Add AlgebraicModuliForArithmeticGeometry §4.5, quotientGerbeTransgression and quotientInertiaComponents, to scope, exact suppliers and the relevant Needs lines, especially §§0.6–0.7. Restrict gap:generic-orbifold-transgression to genuine extensions: age/integration, the stated Hasse comparison and integral-to-special-fibre compatibility, and nonsplit finite-étale-group arithmetic descent. Have that contract consume the existing transgression and the separately owned tame-stack trace; do not assign their construction twice.

   **Repair test:** For a trivial S₃-action on a point, the existing decomposition gives three sectors, not six. For the identity action arrow, its unit modification makes the transgression torsor trivial, even for a nonneutral gerbe. Those outputs already supply the package's corresponding checks. The root-bound and nonsplit arithmetic extensions remain real obligations.

4. **F04** (P2) The low-genus route misses the trivial twist on a genus-zero curve

   **Location:** `packages/TopologicalMirrorSymmetryForHitchinSystems/README.md:784`: “For D=ω in genus zero and n>1, prove emptiness”; compare the full scope at line 949 and its proof at line 953.

   **Claim:** The specified low-genus calculations cover the cases not handled by the connected regular spectral/abstract-system argument.

   **Witness:** Take X=P¹, D=O, n=2, d=e=1 over C or F₃. Then deg(Dω⁻¹)=2 satisfies the main hypothesis, but D≠ω and the generic spectral cover is disconnected.

   Every rank-two degree-one bundle over the algebraic closure is O(a)⊕O(1−a), a≥1. The component of θ from O(a) to O(1−a) is zero because H⁰(O(1−2a))=0. Thus O(a) is θ-invariant and has slope a≥1>1/2. There are no stable objects. This is neither the positive-deg-D regular case nor either canonical-twist calculation explicitly specified in §3.9. The proof in §5.1 invokes only the canonical genus-zero and genus-one exceptions. The same missing branch affects the degree-independence route.

   **Exact repair:** Add to §3.9 the genus-zero, deg D=0 branch, with the geometric splitting argument for every n>1 and coprime degree. A maximal-degree block is invariant; if all degrees coincide then n divides d, excluded by coprimality. Conclude that both SL and PGL stable spaces are empty and their ordinary/twisted inertia invariants are zero. Wire that branch into §§4.1–4.3 and §5.1 and their Needs. Retain rank one separately: SL₁=PGL₁=point, while GL₁ for P¹,D=O is A¹. Add the displayed rank-two example as a negative control for a blanket regular-torsor certificate.

   **Repair test:** On the witness, the repaired comparison is 0=0; the instability inequality is 1>1/2 and the omitted matrix entry has section-space dimension 0. At rank one the comparison is 1=1, and the GL count is 3 over F₃. No genus or allowed twist is removed.

5. **F05** (P3) The compact-cohomology supplier locator points past its construction

   **Location:** `packages/TopologicalMirrorSymmetryForHitchinSystems/README.md:109`: “EtaleCohomologyFoundations F.5–F.7 for compact-support six operations, base change and smooth trace normalization”; repeated in Needs lines including §§0.1 and 5.3.

   **Claim:** Those precise sections provide the listed compact-support construction and finiteness/base-change interface.

   **Witness:** `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:592`, 613 and 1021 give lower shriek, compact-support cohomology and adic finiteness. F.5–F.7 instead give duality, purity and blow-ups, consuming those earlier sections.

   **Exact repair:** Cite §§F.2.1, F.2.4–F.2.7 and F.4.2–F.4.6 for the actual cohomology, base change, boundedness and rational Galois realization used here; retain F.5–F.7 for their duality/purity/blow-up roles. The targets exist, so this is locator precision, not an unowned prerequisite.

   **Repair test:** F.2.5 constructs RΓc but explicitly does not assert finiteness. F.4.4–F.4.5 supply the bounded finite-dimensional rational realization needed for the traces in §5.3. For A¹ the resulting complex has one Qℓ(−1) in degree 2, trace q, not the ordinary H⁰ trace 1.

6. **F06** (P2) One gap combines two independent geometric exports

   **Location:** `packages/TopologicalMirrorSymmetryForHitchinSystems/README.md:99`: “representable relative gerbe-splitting mapping stacks with Picard actions and base change, and extension of an invertible-sheaf trivialization”. The same compound request is at `packages/TopologicalMirrorSymmetryForHitchinSystems/design/plan.json:4005`.

   **Claim:** gap:smooth-stack-hartogs is one precise, minimal supplier contract.

   **Witness:** Section 1.2 uses this slug for splitting-stack representability; §2.3 uses it for Hartogs extension. The former concerns a proper relative gerbe and Picard action; the latter concerns a smooth normal stack and codimension-two open.

   The two exports have different hypotheses and consumers. A common supplier does not make their conjunction a single prerequisite. This is the brief's compound-needs case, not a finding merely because implementation is pending.

   **Exact repair:** Retain gap:smooth-stack-hartogs solely for invertible-sheaf trivializations on smooth normal locally noetherian algebraic stacks across a complement of codimension at least two. Add a separate gap:relative-gerbe-splitting-representability, with the same earlier supplier AlgebraicModuliForArithmeticGeometry, for the relative splitting-stack interface of §1.2: proper geometrically connected, degree-zero-cohomologically-flat families in the chosen Picard representability domain; arithmetic banded gerbes; invertible r for μr; Picard action, rigidification and base change. Give each slug its matching plan and README entry, and use only the relevant one in each Needs line. Import the existing gerbe and rigidification APIs rather than asking for them again.

   **Repair test:** For U=V=Spec C and the neutral μ₂-gerbe, the splitting groupoid has scalar automorphism group of order 2 and its rigidification has order 1. That is a splitting-interface test. Separately, the trivialization 1 on A² minus the origin extends as 1; t on G_m does not extend as an invertible function on A¹, since its value at 0 is 0. The two revised contracts preserve these outputs without making either consumer depend on the unrelated test.

7. **F07** (P2) The stronger fibrewise headline does not specify its comparison object

   **Location:** `packages/TopologicalMirrorSymmetryForHitchinSystems/README.md:997`: “an actual Gal(𝔽q)-equivariant isomorphism between the derived SL Hitchin-fibre cohomology and the twisted PGL inertia-fibre cohomology”. Compare the alternating-class convention at line 25 and §5.3.

   **Claim:** Section 5.4 specifies the stronger actual fibrewise theorem to be proved.

   **Witness:** Qℓ[0] and Qℓ[−2] have identical alternating Frobenius traces 1, but H⁰ dimensions 1 and 0. Section 5.4 gives neither a target-complex formula nor its cohomological shifts.

   An actual ungraded representation isomorphism, a degreewise isomorphism and a derived isomorphism are different statements. The age Tate twist specifies weights, not cohomological placement. Section 5.2 explicitly uses an even degree shift in the canonical case; §5.4 does not specify such a shift or justify its availability throughout its domain. Its two proposed proof routes do not resolve which object the headline promises. This defect is visible in the package without certifying GWZ20's unavailable text.

   **Exact repair:** State the source and target explicitly, with the base-point quantifier, the hypotheses inherited from §5.1, the inertia-sector summands, their gerbe local systems, centralizer invariants and age Tate twists, retaining Frobenius permutation/descent when Γ is nonsplit. Specify whether the intended actual comparison is in ungraded continuous representations, graded representations or a bounded derived category. If retaining the claimed derived comparison, specify every cohomological shift and establish that those shifts are integral in its stated range; an ungraded theorem cannot be labeled derived. Keep the stronger theorem as a target with its own geometric or semisimplicity/degree-separation proof obligation, and align the module docstring with the precise target. This does not ask for the missing theorem to be proved in the package.

   **Repair test:** An ungraded formulation must explicitly identify the two underlying one-dimensional representations in the displayed test; a derived formulation must distinguish them because their H⁰ dimensions are 1 and 0. In the age-one control of §5.2, a class in degree 2 and bidegree (1,1) is placed in degree 4 and bidegree (2,2); a Tate twist alone changes the bidegree and leaves degree 2. The repaired signature must determine these values without choosing an unstated convention.

Seven findings: one P1, five P2 and one P3. The six blocking findings concern the supplier registry, duplicated or compound supplier requests, an omitted low-genus branch and an underspecified stronger cohomological target. They do not establish a counterexample to the main mirror equality. There is no previous package review or settled repair finding to re-audit.

## Verified sound

### Extent and principles

Read all 44 numbered subsections, their API bullets, Checks, proof routes, Needs and layer dependency lists, plus conventions, scope, all four package files and the top-level gap registry. The 14 explicit construction/API blocks each have at least three Checks; the counts range from five to seven. All six layers have Examples and Dependencies. There are 30 theorem/comparison subsections beyond those construction blocks. The short Lean file is 52 lines, with one `import Mathlib`, one module docstring and the required namespace. It has zero declarations, zero sorry'd data, zero set_option commands, zero admitted examples and zero padding theorems. No executable algorithm is planned. No restriction to a convenient prime range was introduced beyond the explicitly stated source hypotheses; the scope retains the small-prime controls and full genus target, with R04 addressing one omitted proof branch.

The package builds a specialized SL/PGL comparison on the existing bundle, gerbe, Picard and Higgs directions; I found no wholesale re-planning requiring rejection. The duplicated requests in R02–R03 are repairable ownership defects. No roadmap or library declaration is redeclared in Lean. Mathematical formulas and the accessible source comparisons did not reveal copied source passages. Comparison with main's JacobianChallenge, AlgebraicVectorBundles and completed HodgeStructures established the upstream shape; this package retains its more detailed prose/API/Checks structure.

### Computed adversarial pass

This table records instances, not proofs of the general theorems. “Consistent” means the computed case agrees with the stated formula under its hypotheses; declared supplier obligations and inaccessible source proofs are not thereby certified. Qℓ[−j] below means a complex with Qℓ in degree j. Let E/F₃ be y²=x³−x, which is smooth and has four points. Its good-reduction volume is 4/3 over Q₃ and F₃((t)). Let ζ be a primitive cube root.

| Statement | Instances and values computed on both sides | Result / change |
|---|---|---|
| Conventions, §§0.1–0.2 | H_c²(A¹)=Qℓ(−1): eigenvalue q and E=xy. Z(1): bidegree (−1,−1). At q=3, q⁻¹=1/3≠3. | Negative Tate sign consistent. |
| 0.1 Character realizations | BC₂/F₃: ordinary mass 1/2+1/2=1, sign mass 1/2−1/2=0. Sign action on A¹: 1/2+1/2+1+1=3. Sign representation has χ-multiplicity 1; its square has 0. | Stack weights and nonmultiplicativity consistent. Empty variety gives 0. |
| 0.2 Fractional Lefschetz | q=4: s₂=2 versus −2; evaluations of ℒ^(1/2)−2 are 0 versus −4. Positive q=64: s₆²=2²=4=s₃. ℒ⁻¹ evaluates to 1/64. | Root dependence, refinement and localization consistent; denominator zero excluded. |
| 0.3 Equivariant Katz | G=1, X=A¹, Y=G_m⊔pt: counts q=(q−1)+1 for every extension; E is xy=(xy−1)+1. Nontrivial character on a trivial-action point gives 0 on both sides. | Consistent; equivariant reduction still needs its declared contract. |
| 0.4 Tate roots | ℓ=3,N=1, cyclotomic value 4 returns 4. For N=2 the principal-unit root is −2∈1+3Z₃ and (−2)²=4. In Q₃, v₃(log 4)=1, but v₃(3 log u)≥2 for u∈1+3Z₃, so u³=4 has no such root. | Finite denominator works; an all-3-power-root Q₃-valued system fails as stated. |
| 0.5 Fractional Katz | ℒ^(1/2) at q=9 gives 3 and bidegree (1/2,1/2); ℒ·ℒ⁻¹ gives 1 and bidegree (0,0). A representation in consecutive even/odd degrees gives V−V=0. | Fractional shifts/additive signs consistent; no actual isomorphism follows. |
| 0.6 Untwisted stringy | BC₂: 2 sectors × mass 1=2. BS₃: 3 conjugacy sectors × mass 1=3, not 6. [A¹/C₂]/F₃: 3+√3; E=xy+(xy)^(1/2). Two points freely exchanged by C₂ give 1, not 2. | Centralizers, ages and component stabilizers consistent; R03 ownership repair. |
| 0.7 Gerbe twist | Neutral twist on [A¹/C₂] preserves 3+√3. A nonneutral root gerbe on the base scheme P¹ has identity-sector trace 1 and E=1+xy. Inverse torsor phases are ζ,ζ⁻¹, unequal. | Band versus Brauer distinction and inversion consistent; R03. |
| 0.8 Stringy Katz | Two presentations of a free C₂-action on two points have count 1 and E=1. Refining age 1/2 to 3/6 changes neither √3 nor (xy)^(1/2). | Consistent. |
| 1.1 Arithmetic gerbes | A real constant μ₂-gerbe has class 1/2 before C/R and 0 afterwards: arithmetic true, neutral false. Root O(1) on P¹/C gives 1 mod 2≠0 but Brauer image 0: arithmetic μ₂ false. μ₁ and a pulled-back neutralization over k[ε]/ε² have class 0. | Three notions separated; nilpotent base does not invalidate pullback. |
| 1.2 Relative splittings | For a neutral gerbe on genus-one E, finite splitting sheaf E[2] has rank 4. For U=V it has one relative section. Over R, t²=1 has two R-points and t²=−1 has zero, although both associated line bundles are trivial. | Rigidification and retained power trivialization consistent; R06 separates this contract. |
| 1.3 Principal splitting | Neutral E example: finite torsor has 4 geometric points at r=2, principal torsor has dimension 1. For U=V=Spec R, relative Pic=0 and Split′ is one point even for constant Brauer class 1/2. | Point of Split′ does not force neutrality; Picτ must retain NS torsion. |
| 1.4 Constant Brauer | A pointless real conic kills the Hamilton class: 1/2 maps to 0. On Spec R, Split′ has one point while the same class stays 1/2, still in im Br(R). | Middle exactness and “constant”, rather than “zero”, conclusion consistent. |
| 1.5 Unitary splitting | Neutral elliptic case: Hom(Z²,U(1))=(S¹)² has real dimension 2, as does E∨; finite μ₂ splittings have cardinality 4 instead. | Principal versus finite comparison consistent; family theorem remains a contract. |
| 2.1 Abstract system | E×A¹ with its own group: boundary empty and relative dimension 1. Blow-up at a surface point: old boundary has codimension 1, not ≥2. Identity map with trivial group has relative dimension 0. | Structural bounds discriminate the wrong model. |
| 2.2 Dual systems | Identity elliptic pair: kernel degree 1, both torsor classes 0, both Brauer phases 1. [3] in characteristic 3 has degree 9 and zero differential, so is not allowed étale. A non-2-divisible Pic⁰ line gives nonzero Pic/2 with zero Brauer image. | Sufficient Brauer condition is weaker, as stated. |
| 2.3 Gauge forms | E×A¹: ω=dt∧θ. Integral unit multiplies density by 1; uniformizer at q=3 by 1/3. In a blow-up chart x=u,y=uv, dx∧dy=u du∧dv has vanishing order 1 on the exceptional divisor. | Codimension-two and unit hypotheses necessary; R02 supplies measure API and R06 separates Hartogs. |
| 2.4 Count/integral | A¹/O_F, α=0: #A¹(F₃)/3=3/3=1=vol(O_F). A phase f=ζ enters the prescribed integrand as ζ⁻¹, not ζ. | Total-dimension normalization and conjugation consistent. |
| 2.5 Dual volumes | E above, φ=[2]: ker order 4, cokernel order 4, and |2|=1. Both volumes are 4/3 over either local field. For φ=id both finite factors are 1. | Equal-characteristic control agrees; R02 avoids a duplicate volume foundation. |
| 2.6 Character integrals | Both nonempty neutral fibres: 4/3=4/3. Both empty: 0=0. Exactly one empty: the other averages c(1+ζ+ζ²)/3=0 for any constant phase c; symmetric case also 0. | All four cases consistent. |
| 2.7 Fibrewise counts | Neutral elliptic product: m=1 gives 1−0+3=4 on each side; m=2 gives 1−(−6)+9=16 on each side. Empty fibre has trace 0 for every m. | All-powers formulation consistent; nonsplit descent is not replaced by a splitting extension. |
| 2.8 Complex systems | Neutral elliptic pair: E=1−x−y+xy on both sides; point pair 1=1; empty pair 0=0. | Consistent, conditional on the declared realization/integration interfaces. |
| 3.1 SL moduli | n=1: θ=0, one determinant-fixed point, automorphism order 1. Rank-two stable determinant-fixed object in odd characteristic has scalar order 2. (O⊕O,0) has invariant slope 0=0 and is unstable. | Correct rigidification; the last test is deliberately outside coprime degree. |
| 3.2 Smoothness | n=2,g=2,deg D=2: rank End₀=3; Euler characteristic of its two-term complex is −3−3=−6, giving tangent dimension 6. n=1 gives 0. In characteristic 2 at n=2, tr(id)=0, so the excluded scalar survives. | Dimension and n-unit requirement consistent. |
| 3.3 PGL quotient | n=2,g=2: geometric Γ rank 16, not 2. A point fixed by Γ gives BΓ, not a point. For y²=x³+x+3/F₁₇ the cubic has zero roots: E[2](F₁₇) has order 1 versus geometric order 4, though 8 divides 16. | Stack and nonsplit-group controls pass. Frobenius diag(1,−1) has trace 0, square trace 2. |
| 3.5 Determinant twists | n=2,deg L=1,deg N=1: det(E⊗N) degree 3=1+2; inverse tensor returns 1. For E/F₃, J(k)/2J(k) has order 4=H¹(k,J[2]) since H¹(k,J)=0. Zero root-torsor class gives an actual tensor isomorphism. | Torsor and inverse-label convention consistent. |
| 3.6 Norm fibres | n=2,deg D=2,deg L=1: deg M=−2; target degree 3; det pushforward degree 3−2=1. Using LM would give −1−2=−3. n=1 gives M=O and one fibre point. | Inverse-M correction verified. |
| 3.7 PGL Prym | n=2,g=2 regular cover: gY=5, dim ker Nm=3, dim JY/JX=5−2=3, kernel rank 16. Rational-point shortcut fails for [2] on E/F₃: E(F₃)/E[2](F₃) has 1 element, but the quotient scheme (E/E[2])(F₃) has 4. | Sheaf quotient and H¹ correction required. Generic inclusion still requires stated hypotheses. |
| 3.8 Prym duality | n=1: both groups dimension 0 and pairing 1. n=2,g=2: both dimension 3, isogeny degree 16. Pairing orientation control: e₃(P,Q)=ζ entails e₃(Q,P)=ζ⁻¹; an order-two example cannot distinguish them. | Dimensions alone do not prove normalized duality; source proof remains uncertified. |
| 3.9 Regular/low genus | g=1,D=O,n=2 with distinct eigenvalues: spectral cover has 2 components, while the stable generic fibre has 0 objects. g=0,D=O,n=2,d=1: invariant line slope ≥1>1/2, so stable count 0; deg(Dω⁻¹)=2. | Canonical elliptic exclusion correct; R04 adds the second missing case. |
| 3.4 Properness | n=1 SL: point→point, fibre count 1. GL on E/F₃ with D=O: E×A¹→A¹ has fibres of count 4 and is proper; total space has 12 points and is not proper over the field. | Relative versus absolute properness distinguished. |
| 3.10 Torsor calculus | With n=2,deg L=1,deg M=−2: e=0 label has degree −2 and norm degree 0; e=2 label degree 4 and norm degree 6=2·3; e=−1 label degree −5 and norm degree −3. In Z/3, 2t≠0 for t=1 but 3t=0. | Integer powers, identity label and coprimality verified. |
| 4.1 GL degree counts | Rank one on E/F₃,D=O: all degrees give 4·3=12. On Z/3-torsor classes, d=1,e=3 gives t=1 versus et=0 despite gcd(d,e)=1. | gcd(e,n) is essential; R04 supplies the missing genus-zero trivial-twist branch. |
| 4.2 SL degree counts | n=2,deg D=2: deg M=−2,deg Q=−1,deg N=2−2=0; e=3 gives degree 3d, e=1 gives d. With deg D=1, required deg Q=−1/2 is impossible. | Sign, uniform correction and even-degree hypothesis consistent. |
| 4.3 Degree Hodge numbers | Rank-one E×A¹ has E-polynomial xy(1−x−y+xy), compact Betti numbers in degrees 2,3,4 equal to 1,2,1; ordinary Betti numbers 1,2,1 in degrees 0,1,2, independent of determinant degree. | Purity plus duality, rather than alternating E alone, separates degrees. |
| 4.4 HT gerbes | n=1 band order 1 and obstruction 0. n=2,g=2: Γ order 16, required root order 32. n=3,d=1,e=2: a=2 is allowed; powers are 2 on SL and 1 on PGL, not swapped. | Descent coherence remains an actual target, not a pointwise extension shortcut. |
| 4.5 Splitting duality | n=1: each side has one point and trivial action. Neutral elliptic comparison: finite neutralizations have rank r², extension to Pic⁰ has dimension 1 on each side. | Correct opposite-group type; arithmetic/global canonicity not certified by these examples or HT03 alone. |
| 4.6 Local Brauer | Evaluation at an integral point lands in Br(O_F)=0: invariant 0 and phase 1. A constant invariant 1/3 would give ζ≠1. A root O(1)/P¹ still has Kummer class 1 mod 2 with Brauer image 0. | The conclusion kills Brauer, not every μr obstruction. |
| 4.7 Dual-pair assembly | Rank-one: all groups trivial, degree 1, point invariants 1. Genus-one canonical fixed point with nontrivial Γ: free locus empty, complement codimension 0<2. | Assembly correctly cannot supply the low-genus nonfree case by itself; R04 adds another boundary branch. |
| 5.1 Main mirror | n=1 over F₂ and F₃: 1=1. Canonical genus-zero n>1: 0=0. n=2,g=2,q=3⁸: q−1=6560=32·205, p=3>2. Additional g=0,D=O witness gives 0=0. | Root and prime bounds pass; missing proof branch is R04. |
| 5.2 Canonical Hodge | Symplectic eigenvalues ζ,ζ⁻¹: age 1/3+2/3=1 and degree shift 2. k=2,(p,q)=(1,1) becomes degree 4,(2,2), sign +1 on both. A single −1 eigenvalue has age 1/2 and odd shift 1. | Canonical symplectic parity argument passes; nonsymplectic shortcut fails. |
| 5.3 Virtual fibres | I₂^m and J₂^m have trace 2 for every m≥1 and K₀ class 2[1]. Fixed dimensions are 2 and 1. V in degrees 0 and 1 has alternating class V−V=0. | Virtual conclusion justified by all-power character recognition; no actual action inferred. |
| 5.4 Actual fibres | Same I₂/J₂: equal traces 2, unequal fixed dimensions 2≠1. Qℓ[0] and Qℓ[−2] have equal ungraded trace 1 but H⁰ dimensions 1≠0. | R07 requires the precise comparison object; the package retains its stronger proof obligation. No counterexample to its particular geometric fibres is claimed. |
| 5.5 Sector variation | If (ν,γ)=ζ and Tγ(0)=1, the stated multiplier gives ζ⁻¹; reversing it gives ζ. For Q₃, (−3,−3)=(−3,−1)=−1 in the quadratic Hilbert symbol, invariant 1/2. | Inverse convention and nonisotropic complementary-block warning pass. |
| 5.6 Isotypic mirror | For C₃, the three Fourier rows are (1,0,0),(0,1,0),(0,0,1), using (1+ζ+ζ²)/3=0. Γ=(Z/2)^4 gives 16/16=1 on the selected character. On S₃, linear characters alone give sum 2 at a 3-cycle, not 0: abelian hypothesis matters. | Fourier projector consistent; C₃ here is a group/dual toy model, not an alternating Weil pairing on a cyclic group. |

Additional global controls: ranks 0 and n=0, denominator 0, q=1, and coefficient characteristic dividing the projector denominator are excluded explicitly. Empty varieties give zero compact cohomology and empty sector sums. Smoothness is used on the gauge and age domains, not silently assigned to singular/nonreduced spectral fibres. Multiplication by p in characteristic p is rejected as étale. Abelian local groups are compact; no argument integrates a nontrivial character over an arbitrary noncompact group with finite Haar volume. The trivial group, nonabelian S₃, split/nonsplit finite groups, square-zero bases, characteristic 2 and 3, and F₂/F₃ boundary inputs were included above. Naturals are not used for signed determinant degrees or torsor powers.

### Sources and the seeded sample

All four cited works already have one manifest key. No new fetch or manifest edit was needed. I read the three supplied legal extractions, with their actual version numbering. I did not fetch GWZ20 under a new key or seek another copy: its settled uncertified status is respected. The 15 seeded targets all principally cite GWZ20, so none of those 15 published locator checks can be reported as freshly text-certified. The independent computed checks above remain useful evidence.

| Seeded target | Locator recorded by author | Direct text verification this round |
|---|---|---|
| 0.1 | GWZ20 Definition 2.14, p.523 | Uncertified text unavailable. |
| 0.4 | GWZ20 Lemma 2.17, pp.525–526 | Uncertified; ITO04 §5.3 gives supporting fixed-denominator field construction, not the full scheme statement. |
| 1.1 | GWZ20 Definition 6.1, p.565 | Uncertified text unavailable. |
| 2.3 | GWZ20 Lemma 6.13, Remark 6.14, pp.570–571 | Uncertified; the form/Hartogs/unit calculations were checked independently. |
| 2.5 | GWZ20 Lemma 6.16, p.572 | Uncertified; local-index supplier hypotheses and examples were read. |
| 2.6 | GWZ20 Theorem 6.17, pp.573–574 | Uncertified; all four rational-point cases were computed. |
| 3.3 | GWZ20 Definition 7.4, Remark 7.5, p.577 | Uncertified; stack quotient and nonsplit example were checked. |
| 3.5 | GWZ20 Lemma 7.7, pp.578–579; §7.5, pp.590–591 | Uncertified; tensor determinant and Kummer direction were computed. |
| 3.6 | GWZ20 Lemma 7.8, pp.579–580 | Uncertified; determinant/norm identity independently computed. |
| 3.7 | GWZ20 Definition 7.9, p.580; Proposition 7.10, pp.580–582 | Uncertified; quotient dimensions and rational-point obstruction checked. |
| 5.2 | GWZ20 Corollary 7.22, p.589; HT03 §6, pp.17–18 | GWZ20 unavailable. HT03 section read: it compares Dolbeault/de Rham E-invariants; it does not by itself prove all stated sector purity. |
| 5.3 | GWZ20 Theorem 6.12, p.569; proof of Theorem 7.23, p.589 | Uncertified; virtual character inference checked independently. |
| 5.4 | GWZ20 Theorem 7.23, p.589 | Uncertified; the alleged source proof gap is not independently certified. |
| 5.5 | GWZ20 Lemma 7.25, equations (32)–(35), pp.591–593 | Uncertified; inverse multiplier and quadratic negative control checked. |
| 5.6 | GWZ20 Theorem 7.24, equations (30)–(32), pp.590–593 | Uncertified; Fourier projection and normalizing factor computed. |

Accessible locators actually read:

- HT03 line 385: Proposition 3.2, numbered pp.10–11, compares smooth unitary splitting torsors on the regular complex Hitchin locus. HT03 line 498: Proposition 3.6, numbered p.13, compares the opposite torsors. The finite torsor, extension of structure group, and normalized universal-bundle arguments were read at HT03 lines 368–426 and 472–525. These do not establish arithmetic-family descent merely by citation. The package correctly makes that a local construction obligation. The Poincaré sign sentence at line 426 has the issue recorded below.
- HT03 line 647: §6 starts on numbered p.17. Lemma 6.1 (line 651), Theorem 6.2 (line 680), Lemma 6.3 (line 693), and Theorem 6.4 (line 709) are present. They concern the Dolbeault/de Rham families and E-invariants; the requested general-D/fixed-determinant and sector-purity extensions remain substantive supplier work.
- ITO04 line 524: Lemma 4.3, numbered p.12, assumes the middle representation has its full Hodge–Tate dimension and proves additive period multiplicities. ITO04 line 555: Proposition 5.1, numbered p.13, gives equality of semisimplifications from Frobenius traces, not an actual nonsemisimple isomorphism. Definitions 5.2–5.3 at lines 573 and 611, and the fractional variant at lines 624–668, retain number-field, finite-ramification, weight and period hypotheses. The logarithmic root construction is on numbered p.15, not a theorem of lisse sheaves on every scheme model.
- BITTNER04 line 812: Lemma 7.1, numbered p.18, gives the good-finite-group scissor presentation by smooth complete/projective varieties and equivariant blow-ups. Lines 799–810 distinguish the scissor ring from its representation quotient; lines 830–844 require equivariant completion/resolution and weak factorization. With t=xy, the blow-up test Bl_pt(P²) gives 1+2t+t²; subtracting E(P¹)=1+t gives t+t², equal to E(P²)−1. The needed equivariant presentation is not obtained by dropping the group action.

### Library and duplication audit at the pins

The actual pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; both checkout HEADs match the manifest. Main is `8888d45eea61a0573e32d9b39a00c833f844fc44`. I used these pins, not the older design baseline. Each of the following native declarations was opened.

| Pinned source and declaration | Content used and limit |
|---|---|
| `Mathlib/Algebra/MonoidAlgebra/Defs.lean:64`, AddMonoidAlgebra | Finite coefficients M→₀R; with R=Z and M=Q×Q it is the rational-bidegree carrier. It is not geometric realization. |
| `Mathlib/RingTheory/IntegralDomain.lean:186`, sum_hom_units_eq_zero | Nontrivial finite-group homomorphism into a domain sums to 0; for C₂, 1+(−1)=0. |
| `Mathlib/LinearAlgebra/Matrix/Trace.lean:43`, Matrix.trace | Sum of diagonal entries; I₂,J₂ both give 2, with no semisimplicity assertion. |
| `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72`, TauCeti.Hodge.MixedHodgeStructure | Specified base-change models, bounded W/F and pure graded pieces; no variety, compact cohomology or geometric realization field. |
| `TauCeti/Geometry/Hodge/Tate/Basic.lean:160`, TauCeti.Hodge.tate_hodgeNumber | The value is 1 at p=−m and 0 otherwise; m=1 gives p=−1. |
| `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:112`, TauCeti.AlgebraicGeometry.InvertibleSheaf | Full subcategory of invertible modules, not a new Picard scheme. |
| `TauCeti/AlgebraicGeometry/LineBundle/Class.lean:50`, LineBundleClass; :104 inv_mk; :142 CommGroup instance | Skeleton of line bundles, inverse induced by dual, actual group law present at this pin. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`, AbelianVariety | Group object over Spec K with properness and geometric integrality; no relative dual abelian-scheme/Prym construction in this declaration. |
| `TauCeti/AlgebraicGeometry/PicardFunctor/Rigidified.lean:66`, rigidifiedPicardFunctor; `TauCeti/AlgebraicGeometry/PicardFunctor/Point.lean:40`, rigidifiedPicardPoint | Morphism f, section x₀ and x₀≫f=id are explicit data. These are rigidified class functors and a trivial class, not representability or Picτ. |
| `TauCeti/GroupTheory/FiniteAbelian/CharacterOrthogonality.lean:182`, CommGroup.sum_inv_mul_monoidHom_apply_eq_ite | Finite commutative group, domain, enough roots. Sum is cardinality at g=σ and zero elsewhere. Characteristic zero is the package's permitted specialization, not a missing library assumption. |

Object searches covered Higgs/Hitchin/Prym carriers, gerbes and splitting torsors, compact geometric MHS, finite étale/lisse Tate sheaves, character projectors, norms, quotient inertia, transgression, gauge measures, equivariant scissor/blow-up theory and Galois trace recognition. Native topology/cohomology and abstract Hodge carriers do not provide the geometric carriers in the docstring. No statable headline was found to have been omitted. The service's resolver says it did not check external Lean names because it had no pinned Lake packages on its host; I checked the supplied local pins directly instead.

The required roadmap grep/show tools searched main and the 363 indexed open heads by those objects. Main was preferred where it exists; the read new-roadmap heads have no main/completed folder. The board index was read before any absence claim. Logic's indexed board head supplied R02. EndoscopicTransferAndUnitaryTraceComparisonPartII at the indexed head has only a design folder for relative unitary Friedberg–Jacquet periods; it does not supply the generic orbifold construction. CountingBundlesAndHallAlgebrasOfCurves is readable as the local board design, with CB.7/canonical-higgs at line 2055, CB.7/higgs-moduli at 2151 and CB.9/higgs-purity at 2738. Thus its planned targets are not declared nonexistent merely because the roadmap search has no main/open-folder result. No separate sibling checkout paths were supplied; ownership against copies outside the supplied index and readable board/main context was not checked.

### Supplier resolution and gap precision

All Needs lines and supplier citations were inspected. The following are the principal resolved contracts; the geometric specializations remain distinct from their suppliers. The cited paths below are repository-relative. Open-head line numbers refer to the actual README, excluding the tool's added metadata line.

| Supplier source | Resolution and hypothesis boundary |
|---|---|
| `Completed/HodgeStructures/README.md:104`, :326, :378 | Core definitions, L2 strictness, L3 abstract period-domain data. These do not construct geometric compact-support cohomology. |
| `TauCetiRoadmap/AlgebraicVectorBundles/README.md:228`, :254 | L0B finite locally free bundles/duals and L0C determinant/polynomial operations; the Higgs bundle stays on X, not its parameter base. |
| `TauCetiRoadmap/JacobianChallenge/README.md:111`, :135, :143, :218, :332 | Layers A–E: degree, curve cohomology, relative base change, Picard sheaf/obstruction and abelian varieties. A real conic distinguishes Picard-sheaf degree-one points from actual lines. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:678`, :2502, :2589 | §0.6 reflexive Hartogs on schemes; §§1.15–1.16 torsors with local nonemptiness and contracted products. Stack Hartogs is a distinct extension. |
| Same, :2843, :2951, :2989, :3021 | §§1.20–1.23 inertia, quotient stacks, stack modules and coarse/tame moduli; generic inertia is already owned. |
| Same, :3656, :3867, :4428 | §§2.11,2.15,2.22 Kummer, field/Hochschild–Serre comparison, Azumaya/Brauer theory. Invertibility and geometric units are retained when needed. |
| Same, :4789, :4876, :4905, :4937, :5291 | §§3.4–3.7 Picard/norm/obstruction interfaces and §4.6 curve/line deformation obstructions. Norm is det π_*B divided by det π_*O. |
| `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:578`, :993, :1025 | §§1.3,2.1–2.2 Quot/Hilbert/parameter inputs, not Higgs properness. |
| Same, :1745, :1816, :1935, :4394, :7331, :8602 | §§4.1–4.3,4.9,4.20 gerbes/bandings/neutralizations/Isom/classification; §5.1 rigidification. These preserve automorphism information until rigidification. |
| Same, :2342, :2358 | §4.5 supplies the transgression and quotient-inertia constructions omitted from the package's supplier list; R03. |
| Same, :9172, :9489, :9721 | §§7.3,7.6.1 Picard-stack and rigidified-class interfaces; §8.2 effectivity/algebraization. Relative stable-Higgs GIT and properness still need their explicit adapter. |
| Same, :10128, :10154, :10202 | §§9.4–9.5,9.7 consume characteristic-zero resolution/SNC results. A group-equivariant Bittner presentation still requires the equivariant contract; an ordinary compactification alone is insufficient. |
| `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:766`, :878, :1023, :1065 | A1.3 invariant forms; A1.5 cube; A2.2 dual/Poincaré; A2.3 symmetric Mumford map. The normalized pulled-back Poincaré line is symmetric, addressing the HT03 source issue below. |
| Same, :1384, :1412, :1451, :1569 | A3.2 multiplication degree, A3.3 quotients, A3.5 dual kernels, A3.7 polarized Weil pairing. n=2,g=2 gives rank 16; n=p is finite flat, not étale. |
| `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:1236`, :1289, :1343 | §§3.6,3.8,3.10 Higgs/spectral/Picard actions, initially finite-field and with their actual regular-centralizer hypotheses. |
| Same, :1416, :1443, :1460, :1521 | §§3.12–3.14 anisotropic properness/codimension/weak abelian fibrations; §3.16 weighted trace includes the connected-group factor. These do not give generic finite-quotient integration or arbitrary relative stable-moduli properness. |
| `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:5967`, :6017 | D7.6 local gerbe-evaluation square and self-dual isogeny index; characteristic zero is explicit. The requested equal-characteristic extension is genuine. |
| `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:1037`, :1084, :3101, :3147 | §§1.7–1.8 semisimplification/Brauer–Nesbitt; §§5.1,5.3 density/recognition. §5.2 concerns prescribed quadratic symbols, so it is not needed for the general trace-recognition step. No actual nonsemisimple comparison is exported. |
| `TauCetiRoadmap/CohomologyComparisons/README.md:460` | §2.15 has Hodge–Tate terms H^a(Ω^b)(−b), proper smooth rigid domain, and degeneration rather than a universally canonical splitting. |
| `TauCetiRoadmap/DeligneWeightsAndPurity/README.md:2552`, :2618, :2678 | §§7.8,7.12 give bounds; §7.15 gives proper-smooth purity. No purity of every ordinary-degree singular-fibre stalk is supplied. |
| `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:3534`, :6562, :6758 | §3.7 coefficient trace comparison; §§6.3–6.4 scheme trace/local terms and additive specialization, on bounded constructible finite-Tor domains. General tame-stack traces remain an extension. |
| `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:592`, :613, :1021, :1179 | Compact supports, adic finiteness and duality exist at the sections distinguished in R05. |
| `TauCetiRoadmap/ReductiveGroupsPartII/README.md:5201` | RG2.3.7 Lang's theorem uses smooth connected groups; constant C₂ has Lang map 1 and H¹ of order 2, unlike the connected Jacobian. |
| `TauCetiRoadmap/ClassFieldTheory/README.md:920`, :1220, :1312 | Layers 5–7 give local invariants and arithmetic-Frobenius reciprocity; passage to geometric cohomological Frobenius requires the stated inverse. |
| `packages/LogicAndDefinabilityInNumberTheory/README.md:417`, :445, :471, :483, :539, :549 | Actual indexed board head supplies analytic substitution, gauge measures, nullity, Weil volume, dual volumes and Fubini; R02. Its §3.2 at line 599 is a definable scissor semiring, not the requested equivariant variety ring. |
| `packages/CountingBundlesAndHallAlgebrasOfCurves/design/README.md:2055`, :2151, :2738 | Canonical GL stability, proper coarse Hitchin map, and purity are planned with rank/genus/coprimality hypotheses. General-D, fixed-determinant and sector extensions are not claimed supplied by these statements. |

The thirteen new named gaps all have matching README slugs. Their precision/minimality audit is:

| Gap | Audit |
|---|---|
| geometric-compact-mhs | Geometric compact supports, finite-monodromy torsor descent and projectors are genuinely additional to abstract HodgeStructures. |
| unitary-splitting-families | Family-coherent rank-one/Pic⁰ comparison, not merely a fibrewise bijection; distinct from abstract weight-one structures. |
| generic-orbifold-transgression | Not minimal: generic inertia/transgression are already owned (R03). Retain only the genuinely additional integration/arithmetic comparison. |
| equivariant-grothendieck | Good finite actions, characteristic zero, scissor versus representation quotient are specified; Logic's definable semiring does not provide this ring. |
| local-field-integration | Not minimal: supplied at the indexed Logic head (R02). |
| fractional-equivariant-hodge-tate | Finite denominators and proper-smooth equivariance/period multiplicities are specified; §2.15 alone does not supply them. |
| equal-characteristic-abelian-duality | Precise prime-to-p extension from characteristic-zero D7.6 to k((t)); no automatic p-adic-only import. |
| relative-picard-norm-duality | Relative Picτ, abelian-torsor Pic⁰ and represented spectral norm/quotient compatibility are the needed adapters; generic abelian duals themselves are imported. |
| relative-higgs-git-properness | Relative general-D construction/properness is distinct from finite canonical GL or mere mapping-stack algebraicity. Curve/line lifting should consume SchemeAndStackFoundations §4.6 as its deformation input. |
| smooth-stack-hartogs | Compound: splitting-stack representability and smooth-stack Hartogs have different domains and consumers. R06 separates the contracts while retaining their named owner. |
| relative-hitchin-picard | Relative noetherian general-D stable fixed-determinant/singular-spectral adapter is identified; it does not follow from the anisotropic finite-field statements alone. |
| higgs-sector-purity | Fixed determinant, general D and canonical finite-character sectors with torsor covers are identified; ordinary canonical GL purity is insufficient. |
| tame-stack-trace | Finite-monodromy, bounded cohomology, base change and reciprocal-automorphism rational-torsor trace are specified beyond the cited scheme interfaces. |

The inherited twelve unowned gaps are R01; they are not silently counted as satisfied by this table.

The prescribed mechanical dependency command returned exactly:

```text
depcheck: 51 roadmaps, 592 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. I did not edit the order or tooling. The citation resolver found no cross-roadmap citation or own Lean name absent everywhere; that lexical success does not resolve the semantic ownership defects above. The narrow external-locator correction R05 does not change supply direction.

### Headline coverage and Lean

The 30 README headline theorem/comparison targets are all named in the Suggested.lean module docstring:

- Layer 0: equivariant Katz comparison (§0.3), finite-denominator Tate roots (§0.4), fractional Katz comparison (§0.5), stringy-count comparison (§0.8).
- Layer 1: constant Brauer classes from principal splittings (§1.4), unitary/arithmetic principal splitting comparison (§1.5).
- Layer 2: twisted count/integral formula (§2.4), equal regular-fibre volumes (§2.5), gerbe-character integrals (§2.6), fibrewise arithmetic mirror symmetry (§2.7), complex abstract mirror symmetry (§2.8).
- Layer 3: stable-moduli smoothness (§3.2), proper Hitchin maps (§3.4), determinant twists (§3.5), norm-preimage fibres (§3.6), Prym duality (§3.8), regular/low-genus system verification (§3.9), torsor products/powers/periods (§3.10).
- Layer 4: GL degree counts (§4.1), SL degree counts (§4.2), degree-independent Betti/Hodge numbers (§4.3), opposite splitting torsors (§4.5), local Brauer splitting (§4.6), SL/PGL dual-pair assembly (§4.7).
- Layer 5: main SL/PGL equality (§5.1), canonical Hodge numbers (§5.2), virtual fibre representations (§5.3), actual Galois comparison (§5.4), determinant-sector variation (§5.5), character-isotypic identity (§5.6).

The missing geometric carriers are identified per theorem: geometric compact-support Hodge/étale cohomology and equivariant realizations; lisse Tate sheaves on scheme models; represented relative Picard/Picτ, Brauer/splitting stacks; orbifold measures and abstract systems; stable Higgs moduli/spectral Prym torsors; and powered gerbes/inertia-fibre cohomology. Simple scalar, matrix or abstract group encodings would not state these headlines. The native pinned abstract carriers do not close that gap. An empty declaration list is therefore appropriate, rather than a catalogue of numerical controls.

Ran the required absolute-path `lake env lean` invocation from the pinned content checkout: exit code 0, no errors and no warnings. No TauCeti import needed building. The elaborated-signature inventory and one-tactic probe have zero candidates because the file declares no theorem, definition, instance or opaque object. No signatures were changed, and no dummy probe was inserted to create padding. This review’s Lean process completed; no command from this review was left running.

## Not verifiable

- GWZ20 is settled as uncertified. Its published theorem numbers, pages, hypotheses, conjugation bar, proof-internal steps and claimed source errors cannot be freshly verified against text here. This includes every seeded GWZ20 locator listed above and the additional GWZ20 citations throughout the package. I have not promoted inherited review descriptions to direct source evidence. No new missing-reference request was made for this settled work.
- The general truth/proof of the actual fibrewise Galois-isomorphism target, arithmetic gerbe descent, and the outstanding geometric supplier contracts was not established by the numerical tests. In particular, the Jordan example diagnoses an invalid general inference, not failure of the particular Hitchin-fibre theorem. The missing comparison-object and grading specification is R07; it must be supplied in the roadmap statement.
- HT03 proves complex smooth torsor comparisons at its cited locators, not the arithmetic-family result; §6 does not prove every requested general-D and sector-purity adapter. Those differences remain stated obligations, not source-certified conclusions.
- Nitsure/Faltings original moduli properness proofs were not directly inspected. The package imports that input through a declared supplier contract rather than presenting a direct locator certification.
- The listed sibling names came without separate filesystem checkout paths. The provided main/open-head service index and readable board heads/designs were searched; ownership against any other unavailable sibling copy was not checked.

## Source issues

- **Error** in HT03 at Proposition 3.2 proof, numbered p.11, HT03 line 426: the source says exchanging the two Jacobian factors inverts the normalized Poincaré bundle; it should be symmetric after pullback by the polarization, while the induced alternating torsion pairing reverses under exchange; affects the proof.
- **Misprint** in ITO04 at Definition 5.3 and §5.3, numbered pp.14–15, ITO04 lines 623, 663–668: the source says all stated Tate realizations land in polynomial rings with nonnegative exponents; it should allow Laurent exponents since the stated positive Tate twist has E-function u⁻¹v⁻¹; affects a stated result.
- **Error** in ITO04 at Definition 5.2(2)(b), its fractional variant and Example 5.5, numbered pp.13–15, ITO04 lines 583, 649, 666: the source says the integer-Frobenius-polynomial condition admits every fractional Tate twist in Example 5.5; it should enlarge the coefficient/integrality condition when adjoining those twists: Qℓ(1) already has polynomial 1−q⁻¹T; affects a stated result.

For the first issue, write the normalized polarization biextension as m*L⊗p₁*L⁻¹⊗p₂*L⁻¹ (with base rigidification). Swapping factors fixes this expression. On an elliptic curve with deg L=1 its diagonal pullback has degree 4−1−1=2, whereas its inverse has degree −2. Thus the two bundles cannot be identified. The package's normalized A2.3 supplier avoids copying that false sentence. For the Ito issues, the package's rational-exponent algebra allows negative exponents and its realization contract uses the relevant finite coefficient extensions; neither source slip should be copied into the formal category. No GWZ20 erratum is newly certified without its source text.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "87b8e9a593631dd68d5d0f17abe2fbe27416ec45", "job": "REV-PKG-TopologicalMirrorSymmetryForHitchinSystems", "model": "gpt-6-astra", "worker": "chris-13"} -->

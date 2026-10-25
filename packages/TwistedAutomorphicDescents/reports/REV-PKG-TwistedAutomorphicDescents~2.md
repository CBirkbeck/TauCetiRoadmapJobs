<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1535#issuecomment-6399350565 -->
Review (codex) of 4c618d9

Verdict: needs_changes

1. **F01** (P1) The unitary L-ratio is incompatible with the fixed bilinear integral

   **Location:** packages/TwistedAutomorphicDescents/README.md:541, 563, 617, 619; consequences at 694, 708, 877 and 1070. The defining numerator is “L_v(s+1/2,τ×φ_π∨)”; §3.4 requires “prove Z_v(s)=ℒ_v(s)”.

   **Claim:** The numerator with π∨ and the denominator cross factor with σ describe the induction τ⊗σ and bilinear integral fixed in §2.1. Section 4.1 promises to make these choices commute with self-pair poles and the descent output.

   **Witness:** Split U₂=GL₂, a=1, m=ℓ=0, q=2, s=1/2. Twist induction by η(det), test π by η⁻¹, η(ϖ)=i. The bilinear integrand is unchanged; the declared ratio changes from 3 to 1/3.

   Here is the complete computation. At a split unitary place write the inducing GL₁(E_v) character as τ=(χ₁,χ₂), so the GL₂ diagonal characters are (χ₁,χ₂⁻¹). Write BC(π)=(β,β⁻¹). Start with χ₁=χ₂=β=1. Put T=q^(−s−1/2)=1/2. The numerator is (1−T)⁻²=4; the split Asai denominator is (1−T²)⁻¹=4/3; ℒ=3. After twisting, τ=(i,−i) and BC(π)=(−i,i). The declared tensor τ×BC(π)∨ has weights (−1,−1), so its factor is (1+T)⁻²=4/9 and ℒ=1/3. The Asai weight χ₁χ₂ remains 1.

   Both data sets are unramified and unitary, with the same normalized spherical vectors, conductor and measures. On the embedded U₁ the determinant is its GL₁ coordinate, so η(det h)η(h)⁻¹=1 pointwise; unipotents have determinant 1. Unramified η is also trivial on the compact normalizations. Thus the normalized integrals agree. The two asserted spherical identities cannot both hold. This is a local instance of the advertised general theorem, not an excluded residual rank-zero construction. At q=3 the same contradiction is 2 versus 1/2.

   The denominator has an independent check already latent in §4.1. For split U₃ with dual Levi diag(χ₁,μ,χ₂⁻¹), the cross roots are χ₁μ⁻¹ and μχ₂. With BC(σ)=(μ,μ⁻¹), these are τ×BC(σ)∨, whereas §3.3 prescribes τ×BC(σ). Taking χ₁=μ=i, χ₂=−i gives actual weights (1,1) and declared weights (−1,−1): at cross-factor variable T=1/2 their factors are 4 and 4/9. This also resolves the roadmap's existing numerical root test: (χ₁,χ₂,μ)=(2,3,5) gives (2/5,15), not (10,3/5).

   **Exact repair:** Keep the bilinear integral and standard base-change convention. Its numerator must use τ×BC(π), and the unitary normalizer cross factor must use the actual root representation, giving τ×BC(σ)∨ in these coordinates. Consequently the self-pair inducing datum for a test π is BC(π)∨. For recovery of π with inducing BC(π), test against π∨ and transport both the smaller datum and inverse character as required by the conjugation identity. State this diagram definitively before the spherical theorem. Propagate the labels through §§3.3–3.5, 4.1–4.6, 5.7–5.9, 6.4 and 7.2; keep the bilinear/Hermitian statement of §4.7 consistent. A comparison hypothesis cannot make the displayed unequal factors equal.

   **Repair test:** With the corrected numerator, both U₂ inputs have tensor weights (1,1) and ratio 3; the U₃ cross factor has weights (1,1) and value 4. The original §4.1 root calculation now agrees with §3.3. Conjugate self-duality is never replaced by ordinary self-duality. The earlier F01 attribution repair remains valid: the published displays both have the unmarked numerator. This finding concerns the mathematics of the newly explicit convention, not the settled frozen-plan entry.

2. **F02** (P1) The internal supply graph has two cycles

   **Location:** packages/TwistedAutomorphicDescents/README.md:174, 196, 444, 466, 483. Section 2.4 says “the comparisons of §§2.3 and 2.6 supply the required matrix identities and character transports.”

   **Claim:** The numbered layers form a single direction of supply, and each target's Needs records its proof inputs.

   **Witness:** At lines 174/196, 0.2 needs 0.3 and 0.3 needs 0.2. At lines 444/483/466, 2.4 uses 2.6, 2.6 needs 2.5, and 2.5 needs 2.4. Both are directed cycles.

   The orthogonal range “§§0.1–0.3” also introduces self-edges. The open-cell cycle is substantive: §2.4 already concludes the inner-period identification which §2.6 is supposed to establish after the transform. The external roadmap dependency checker does not inspect these internal target edges. There are additional forward references: §1.5 needs the period of §2.1, and §3.4 uses the dictionary of §4.1 without listing it in Needs.

   **Exact repair:** Put the raw orthogonal flag/vector datum with the coordinate geometry before §0.2. Define the native partition from d and ℓ there; let §0.3 consume that partition, with no self-dependency. Restrict §2.4 to cell vanishing and the surviving representative/stabilizer. Leave the identification with the inner period in §2.6, after §2.5 constructs the transform, and remove §2.6 as an input of §2.4. Define the generic bilinear period before §1.5, separately from its Eisenstein specialization. Move the independent dual/root dictionary before §3.4 and list the actual edge; keep later residue applications later. Update layer dependency summaries to match.

   **Repair test:** The two displayed cycles become the chains 0.1 → 0.2 → 0.3 and 2.3 → 2.4 → 2.5 → 2.6 (arrows now mean supplier to consumer). Their strongly connected components have size 1 and no self-edge. The character integral (1−1)/2=0 used to kill the nonopen cell does not need the later inner-period identity.

3. **F03** (P3) The support partitions can coincide at the smallest allowed rank

   **Location:** packages/TwistedAutomorphicDescents/README.md:938: “p^1 and p are different partitions.”

   **Claim:** The two §6.1 partitions are always distinct.

   **Witness:** In the odd-SO smaller-group branch take a=2, m=1, d=2, j=0. Then k₀=1 and both formulas give [3,1,1], of size 5. These satisfy a=N≥2 and j<a.

   **Exact repair:** Replace the universal difference Check by “the partitions need not agree,” and retain both an equality boundary and an unequal example. Do not exclude a=2. For a=6,m=1 the outputs are [7,5,1] and [7,1⁶], both of size 13; for a=2,m=1 both remain [3,1,1]. These computations test the repaired wording.

4. **F04** (P3) The U₄ maximal Bessel partition is called regular

   **Location:** packages/TwistedAutomorphicDescents/README.md:1085, 1093: “for U₄ the regular partition [3,1]”.

   **Claim:** [3,1] is the regular nilpotent partition for U₄ and is directly the regular coefficient used in §7.3.

   **Witness:** After scalar extension U₄ becomes GL₄. A regular Jordan block has partition [4] and power ranks (3,2,1,0); [3,1] has ranks (2,1,0,0). Section 7.4 itself calls [3,1] subregular.

   **Exact repair:** Say “maximal Bessel partition [3,1]” for U₄. Explicitly retain the comparison from a nonzero regular Whittaker coefficient [4] to the needed [3,1] coefficient and its nonzero U₁ character projection. The two partitions must not be identified. The repaired Check has distinct power-rank lists, smaller dimension 1 and ambient dimension 9, so it preserves the correct nonempty U₁ datum.

5. **F05** (P3) Corollary 4.4 has the wrong printed page

   **Location:** packages/TwistedAutomorphicDescents/README.md:442: “Corollaries 4.4 and 4.6, pp.775,779”.

   **Claim:** JZ2020 Corollary 4.4 is on printed page 775.

   **Witness:** JZ2020 line 1595 starts printed page 776; Corollary 4.4 begins at JZ2020 line 1627, before the next page marker at line 1642.

   **Exact repair:** Change the paired page locator to pp.776,779. Corollary 4.4 is the a>ℓ zero-inner-period implication at line 1627; Corollary 4.6 is the a≤ℓ implication at line 1769. Both statements are at the corrected locators.

Five findings: two P1, no P2, three P3. The package is repairable. The blocking defects are the unitary factor dictionary and internal circular supply. None is a request to discharge a declared supplier gap. Authored package files were left unchanged.

## Verified sound

The scope remains a general relative descent library. It includes split and nonsplit unitary groups, determinant-one orthogonal groups, all characteristic-zero local places, and residue characteristics 2 and 3. No computational algorithm, good-prime exclusion, copied source passage, sorry'd data or set_option was found. The 49 numbered sections and two added subtargets were read, including every Needs line and definition API. All numbered sections have Needs and at least three listed Checks; the false Checks are isolated above. The README has the required eight layers, Examples and Dependencies endings, scope, conventions, supplier contracts and references. Metadata remains math.NT. The main roadmaps ReductiveGroups, OrthogonalSpinGroups and Completed/RestrictedProducts were read for shape as well as ownership.

The mathematical checks below are counterexample searches and exact convention computations, not claims that finite examples prove the general theorems. The sampled targets and all headline targets were reviewed afresh. For unchanged material, the previous review's computed rows were used only after checking their values against the present statement; a summary without computed values was not treated as evidence. Changed supplier contracts, local uniqueness, the new isobaric proposition, dictionary, classification scope and Laurent arguments were all read anew.

### Previous findings, checked individually

Locations in this table are in packages/TwistedAutomorphicDescents/README.md unless specified otherwise. Quoted fragments are the package's repaired wording, not source quotations.

| Previous finding | Status | Repaired passage and verification |
|---|---|---|
| F01: contradictory account of the printed numerator | Repaired as an attribution; further defect R01 | Line 541: “Both published displays (4.47) and (5.13) print the same numerator”. JZ2020 lines 1826 and 2130 agree. The new choice of dual still fails the twist test above. |
| F02: unowned general prerequisites | Repaired | Lines 66–133 name 16 supplier contracts; e.g. line 123, “identify the Arthur packets of the discrete constituents with the prescribed residual Langlands-quotient data”. Each slug and needs sentence matches design/plan.json. |
| F03: inverse character in the transform | Repaired | Line 460: “specified character ψ_(β−1,y_(−κ))”. JZ2020 line 1566 has the positive inducing character; with ψ(n)=i the product against the inverse-character functional is 1, not −1. |
| F04: cuspidal source used for isobaric support | Repaired | Line 968: “For simple φ, so that τ is cuspidal”; line 981 defines the “Distinct-isobaric anisotropic-SO₂ support proposition”. JLXXZ2016 line 189 assumes cuspidal τ. Section 6.5 retains the extra proposition for multiple blocks. |
| F05: gaps duplicate supplied factor and intertwiner theory | Repaired | Line 107 requests the “conjugate-self-dual signed-Asai type-pole dichotomy”; line 113 restricts the continuation gap to “noncuspidal smaller datum sigma”. AST §2.13 supplies intertwiner holomorphy; MLE §3.4 and AL.3 retain their existing square-type and pole results. |
| F06: compound classification contract and unconditional inner forms | Repaired | Lines 123–133 split six contracts. Line 770: “This premise concerns the spectrum before constructing any Bessel image, period or descent”. It is explicit in §§5.5,5.8,6.4,7.2. The generic multiplicity formula is not applied to ν₂ residual parameters. |
| F07: nonexistent orthogonal Part II owner | Repaired | Line 13: “This roadmap owns the orthogonal relevant pairs and Bessel data”. Main, indexed heads and all 19 board packages/designs were searched by object; finite-dimensional branching is not this local analytic uniqueness problem. |
| F08: RG2.4 misidentified as Witt/Levi theory | Repaired | Line 64: “Consume RG2.4 for the local adjoint-modulus formula”; line 60 names ReductiveGroups “Layer 7b for parabolics, Levi factors and their intersections”. The Hermitian Witt continuation is a separate declared gap. |
| F09: intermediate targets described as absent headlines | Repaired | Suggested.lean:59: “Sections 2.2–2.4 and 3.2 are intermediate unfolding targets”. The docstring separately identifies the actual 23 headlines and their missing carriers. |
| F10: local Jacquet theorem used for rational cells | Repaired | Line 432: “ReductiveGroups Layer 7 (split rational parabolic double cosets)”. Relative nonsplit rational orbit refinements remain owned here. The two small cell sets compute as stated. |
| F11: orthogonal local uniqueness hidden inside global decomposition | Repaired | Line 335 states “Orthogonal local Bessel uniqueness” with its own local hypotheses, Needs and four Checks. Published GGP2012 Theorem 14.1(i), Theorem 15.1, Corollary 15.3 and the archimedean remark were checked. |
| F12: broken references and wrong evaluation center | Repaired | Line 718 evaluates “Z_S*(1/2)=3”; with scalar 2 and leading coefficient 5, the residual value is 30. The cited section titles and prose references now resolve. |
| F13: conclusions assumed as nonvanishing hypotheses | Repaired | Line 660: “derive regularity and nonvanishing of the cross factors”. The route uses AL.3 pole/boundary theorems and §3.5, retaining the type-pole premise. Laurent products give order 2 for 3t⁻² and order 1 for t⁻¹. |

The repair report's frozen design/plan.json sourceIssues entry E4 is explicitly marked not actionable under the gaps-only edit rule. That reason is correct. It is not re-raised: the current README attribution is checked directly, and R01 supplies a different mathematical witness against its chosen normalization.

### Seeded source verification

All 15 seeded targets were opened at their locators. The source IDs refer to the supplied line-numbered legal extractions. Printed pages are used for JZ2020 and GGP2012; PDF pages for the specified preprints. An open source with an incomplete argument is distinguished from an unreadable source.

| Target | Locator opened | Result, hypotheses and extent of support |
|---|---|---|
| 0.2 Bessel partition | JZ2020 (2.9), p.755, line 694 | Parts [2ℓ+1,1^(d−2ℓ−1)] agree. The package correctly adds 2ℓ+1≤d, excluding the source's split-even terminal index. Rational datum and geometric partition stay separate. |
| 0.4 Anisotropic-vector normal form | JZ2020 Lemma 2.4, p.759, lines 844–852 | Nonzero norm and positive remaining Witt index are retained. The lemma's proof is omitted in the paper; the roadmap supplies Witt extension and determinant adjustment. It does not apply the hyperbolic normal form to an anisotropic remaining space. |
| 1.2 First occurrence index | JZ2020 Proposition 2.2, pp.756–757, lines 715–728 | It is a maximal nonzero Bessel index for a specified cuspidal realization. The paper expressly permits dependence on the realization. The package's nonzero input and valid-index restriction handle the empty set and split-even endpoint. |
| 2.4 Open-cell reduction | JZ2020 Proposition 4.1 and §§4.2–4.5, pp.768–779, lines 1190–1318; Corollaries 4.4/4.6, lines 1627/1769 | Character vanishing, cuspidality, both a>ℓ and a≤ℓ regimes and the twist agree. Corollary 4.4 is on p.776: R05. Its inner-period comparison is placed circularly: R02. |
| 3.6 Open-cell local nonvanishing | JZ2020 Proposition A.1, pp.811–817, lines 3292–3308; (A.6), p.812; (A.12)–(A.14), pp.813–814, lines 3387–3437 | Fixed vectors with b(vπ,vσ)≠0, any prescribed s₀, and a holomorphic smooth section are correct. The statement is selected-section regularity. The package explicitly repairs the missing YY′E₂ term and owns the split/archimedean cell estimates instead of treating an omitted argument as supplied. |
| 4.1 Pairing/contragredient dictionary | JZ2020 (4.47), p.780, line 1826; (5.6), p.785, line 2042; (5.13), p.787, line 2130; §5.5, p.791, lines 2284–2304 | The scalar conjugation identities are valid; the two printed numerators agree. The claimed full unitary dictionary is not supported as written: R01 supplies an invariant-theoretic counterexample. |
| 4.6 Reciprocal nonvanishing | JZ2020 Theorem 5.3, p.786, lines 2067–2087; Propositions 5.4–5.6, pp.787–790 | Nonzero residual module, prescribed pair, generic parameter/type data and choices of local sections matter. Orthogonal/self-dual convention checks agree; the package's unitary self-pair labels need R01. |
| 4.7 Period implies central value | JZ2020 Theorem 5.7, p.791, lines 2296–2304 | Cuspidal realizations and generic discrete parameters are retained; no Whittaker or multiplicity-one assumption is silently added. Bilinear versus Hermitian tensor arguments are distinguished. The unitary proof's one-sided dual change is not justified by conjugate self-duality; the package must use the corrected R01 diagram. |
| 5.2 Residual square integrability/membership | JZ2020 Proposition 6.1, p.793, lines 2366–2368; scope pp.740–741, lines 81–89; irreducibility citation p.804, lines 2946–2950 | Nonzero residual input and negative-exponent proof are retained. Membership, irreducibility and classification scope are separated; the generic inner-form formula is not asserted to classify nongeneric residual packets. The six explicit supplier contracts cover the missing continuations. |
| 5.5 Critical cuspidality | JZ2020 Proposition 6.3, pp.794–795, lines 2426–2483 | Zero critical image is allowed. The argument needs supports of every discrete member; the package now requests precisely that input and scopes inner forms. A single least-support computation is not treated as that classification. |
| 5.6 Outer stability | JZ2020 Proposition 6.4, pp.795–797, lines 2503–2539 | Rational outer translation and distinct orbit classes are retained. The roadmap corrects vector fixation to the required line/sign action; index zero is treated separately. |
| 5.7 Critical unramified parameter | JZ2020 Lemma 6.5, pp.797–800, lines 2563–2695 | The repaired critical index, output dimension and final character agree with direct dimension checks. The printed index, odd-unitary group label and dropped character have the defects recorded below. The unitary dual labels still depend on R01. |
| 5.8 Critical module structure | JZ2020 Theorem 6.6, p.800, lines 2702–2738 | Nonzero image, irreducible residual input, verified cuspidal Hilbert carrier and scoped classification are retained. The theorem does not prove nonvanishing. Multiplicity 1 and even-SO outer labels are distinct from uniqueness of a source representation. Apply R01 to unitary parameter transport. |
| 6.1 Residual support partitions | JZ2020 §6.3, p.804, lines 2960–2975 | All three formulas and total 2a+m agree; upper bound and existential support are separated. The package's universal inequality of the two partitions fails at a=2,m=1: R03. |
| 6.5 Odd orthogonal–torus criterion | JZ2020 Corollary 6.11, pp.806–807, lines 3077–3091; Proposition 6.9, p.805, lines 2982–2987; JLXXZ2016 Theorem 1.2(3),(6), PDF p.5, lines 189–209 | The cuspidal/single-block support input is supported. The source does not establish the distinct-isobaric extension from that theorem; the package now states it as a separate hypothesis for the multi-block criterion. |

Additional repaired or flagged locators were read: Zhang2022 Theorem 1.1, PDF pp.2–3, lines 80–113 and §§3–5; JLS2016 Theorem 11.2, PDF pp.21–22, lines 830–862, with its O/Sp/metaplectic scope rather than a unitary theorem; AGRS2010 Theorem 1′, PDF p.2, lines 50–65; JSZ2010 Theorem A, PDF pp.1–2, lines 12–31; GGP2012 Theorem 14.1(i), p.57, lines 2287–2301, Theorem 15.1, pp.59–62, lines 2351–2357, Corollary 15.3 and remark, pp.62–63, lines 2476–2490. The published GGP numbering, not arXiv v1's different corollary number, is used. JSZ's real orthogonal signature bounds and continuous completed tensor convention are carried into the local target.

### Computed adversarial pass

In this table t=s−1/2, “retain” means no change for the tested assertion, and conditional results retain their explicitly stated supplier/classification/support hypotheses. Abstract two-dimensional countermodels test the logical inference indicated, not the existence of an automorphic representation with invented spectral data. Actual group, root and matrix counterexamples are identified as such.

| Statement | Instances tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| Conventions: slots, bilinear pairing, modulus | h linear first; character χ²≠1 on volume-one U₁; GL₂ diagonal with norm 4 | h(i,1)=i, h(1,i)=−i; Q(χ,χ)=1, P(χ,χ)=0, P(χ,χ∨)=1; δ^(1/2)=2 versus inverse 1/2 | Retain; use in R01 |
| Right translation and coefficient character | Noncommuting g=(12),h=(23) in S₃, f indicator of gh; cyclic C₄ | Rg Rh f(1)=1, Rh Rg f(1)=0; R_generator⁴=id; ψ=i gives inverse weight −i | Fixes order and excludes abelian-only inference; retain |
| 0.1 coordinate comparison | Nonsplit quasi-split SO₄; SO₅,U₅; W=0 | Witt index 1 versus label 2; standard dimensions 4 versus 5; d=1,j=0 versus impossible d=0 anisotropic vector | Retain |
| 0.2 partition and domain | (d,ℓ)=(5,1),(3,0),(4,2) | [3,1,1] sum 5 length 3; [1,1,1] sum 3; invalid leading part 5>4 | Formula sound; R02 ordering |
| 0.3 rational orbit/character | E=F(δ), x=δ,1; real hyperbolic q=2xy | Tr(x/δ)/2=1,0; norms of (1,±1/2) are ±1 and perpendicular signatures are opposite | Excludes unmarked rational orbit; retain after R02 |
| 0.4 vector normal form | Hyperbolic e,f; κ=2; anisotropic real positive line | Norm(e+f)=2, norm(e−f)=−2; anisotropic line has Witt index 0 and no hyperbolic pair | Nonzero κ and remaining index required; retain |
| 0.5 stabilizer/Witt index | Real signature (2,1), removed norm +1 or −1; reflection | Complements have signatures (1,1),(2,0), Witt indices 1,0; reflection determinant −1, product of two +1 | Retain sign-sensitive rational comparison |
| 0.6 prescribed ambient datum | d=5,m=2,j=1,a=4; a=j+1 | k=2, ambient 10, 10−5=5; boundary k=0 and ambient d+1 | Retain actual isometry requirement |
| 1.1 Fourier image/Hilbert carrier | ℓ=0; ψ(1)=ζ,f=(1,i); constant on split torus | B=f restricted; conjugate sum 1−iζ; ∫₁∞1 dt/t=∞ despite zero proper constant terms | Retain continuity/central-character contract |
| 1.2 first index | Supported indices {0,2}, empty support, rank 0 | max=2 rather than 0; empty set has no supported maximum; valid nonzero rank-zero case gives 0 | Retain nonzero realization premise |
| 1.3 first-occurrence cuspidality | Constant-term comparison with higher coefficient 0; split SO₂ | Compared constant term=0; split torus has zero proper constant terms but infinite norm | Algebraic cuspidality and Hilbert inclusion stay separate |
| 1.4 global multiplicity | One class, two distinct outer classes, duplicated same class | Multiplicities 1; (1,1); duplicated same class has 2 | Retain distinct-class convention |
| 1.4 local orthogonal uniqueness | Trivial SO₁/SO₀; trivial action with target ψ=−1; reducible C² | Hom dimensions 1; 0 over C; 2 for trivial C² | Irreducibility and category hypotheses discriminate; retain |
| 1.5 Generic Summand | One witnessing copy among two; torus χ²≠1 | Witness count 1 suffices, universal assertion would need 2; Q=1 versus P=0 | Retain existential status; R02 period placement |
| 2.1 bilinear Z | Scale test vector by i; ℓ=0 | Z becomes iZ, Hermitian alternative −iZ; unipotent integral contributes 1 | Retain; supplies R01 invariant |
| 2.2 factorization | Local values 2,3, global 30; zero global functional | Scalar c=5 rather than 1; zero cannot be normalized to product 6 | Retain generic irreducibility restriction |
| 2.3 relative cells | a=1,r_W=0, ℓ=0 or 1 | Allowed pairs {(0,1)} or {(0,0),(1,1)}; open β=1 or 0 | Retain SO exceptional branches, not inequalities alone |
| 2.4 open-cell vanishing | C₂ root quotient with nontrivial/trivial character | (1−1)/2=0 versus (1+1)/2=1; β=max(a−ℓ,0) equals 1 or 0 in preceding row | Mathematics of vanishing retained; R02/R05 |
| 2.5 transform | ψ(n)=i; β=1; outer swap σ₁↔σ₂ | ψψ⁻¹=1 versus ψ⁻²=−1; β−1=0; t²σ₁=σ₁ | F03 repair verified; R02 order |
| 2.6 inner datum | (a,ℓ)=(3,2),(2,2) | a−ℓ−1=0 and ℓ−a=0 on their respective domains; inducing σ₁ yields inner σ₂ under a swapping t | Retain different domains; R02 order |
| 3.1 local integral | b replaced by 2b; a=ℓ | Z replaced by 2Z; inner index 0 | Retain normalization and continuous archimedean functional |
| 3.2 Euler product | c=5, factors 2,3; zero period | 5·2·3=30; zero period gives Z=0, not a quotient normalization | Retain |
| 3.3 L-ratio | Split U₂ determinant twist; U₃ root weights | Claimed twist ratios 3,1/3 despite equal integrands; actual/declared cross factors 4,4/9 | R01 |
| 3.4 spherical formula | Same U₂ inputs; T=1/2, weights 1,−1 | Claimed equal integrals have unequal ratios; separate determinant (1−T)(1+T)=3/4 and L=4/3 | R01; determinant Check itself sound |
| 3.5 shifted regularity | α=1/3,β=1/4; α=β=1/2 | 1−α−β=5/12; 3/2−α−β=11/12; 2−2α=4/3; boundary first argument 0 | Strict exponent premise sound; propagate R01 labels |
| 3.6 nonzero section | b(vπ,vσ)=2 or 0 | W(1)=1/2 gives 1; b=0 has no reciprocal | Retain |
| 3.6 actual isometry computation | README matrices p,u,J,w | det p=det u=1; pᵀJp=uᵀJu=J; puw=w; wᵀJw=2; CE₂=−1/2=1/2−1, omitted term gives +1/2 | Corrected source identity verified exactly |
| 4.1 dictionary | U₁ χ; split U₃ (χ₁,χ₂,μ)=(2,3,5); z=i | P(χ,χ∨)=Q(χ,χ)=1; cross roots 2/5,15 versus 10,3/5; zz⁻¹=1 versus z²=−1 | Scalar identities sound; complete labels fail R01 |
| 4.2 Laurent residue | A/t²+B/t+C; A=0 | Order-two coefficient A, not B; 0 if A=0 even when B≠0 | Retain single-variable definition |
| 4.3 maximal pole | Type t⁻² times cross 3 or t | Order-two coefficients 3 and 0; pole orders 2 and 1 | Two directions sound with derived cross-factor control; R01 labels |
| 4.4 bad-place product | Z=1/t,ℒ=2/t; factors t,1/t; empty S | Quotient 1/2; product 1 despite factor pole; empty product 1 | Retain meromorphic-germ quotient |
| 4.5 holomorphy | Z=6/t²+3/t, ℒ=2/t² or 1/t | Quotients 3+(3/2)t and 6/t+3 | Exact pole order necessary; R01 self-pair |
| 4.6 reciprocity | c=2, normalized product at 1/2=3, leading ratio=5; any factor 0 | Leading residual period 30 or 0 | Retain existence of nonzero choices; R01 unitary application |
| 4.7 central-value convention | Volume-one torus χ²≠1 | Q(χ,χ)=1 with tensor weight 1; P(χ,χ)=0 with nontrivial squared character | Statement's dual-second Hermitian form sound; R01 proof transport |
| 5.1 residual parameter | a=6,H_W=SO₃; ν₂ vs ν₁⊕ν₁ | Ambient dimension 15; standard 12+2=14; SL₂ weights z,z⁻¹ vs 1,1 | Retain determinant/sign conditions |
| 5.2 L² and classification | Exponents −1/2,0; one class with spectral multiplicity 2 | Integrals 1 and ∞; discrete sum has 2 copies, not 1 | Retain nonzero residue and scoped spectral premise |
| 5.3 critical index | d=6,m=1,j=2,a=6; invalid a=1,j=2 | k₀=3 and [7,1⁶] sums 13; truncated invalid k=0 gives m+1 rather than m+5 | Retain j<a and positive rank |
| 5.4 higher vanishing | Trivial n-action and ψ(n)=−1 | Twisted quotient has v=−v, hence v=0 over C; characteristic 2 gives no implication | Complex coefficients essential; no excluded residue prime |
| 5.5 critical cusp | Zero image of nonzero residue; two spectral support records | All constant terms of zero=0; computing one record supplies 1 of 2 needed records | Nonvanishing not asserted; all-member contract retained |
| 5.6 outer stability | Singleton/two-element orbit; diag(−1,−1) on e+(κ/2)f | Orbit sizes 1,2; vector maps to its negative, not itself; normalizer squared=1 | Retain line/character compensation |
| 5.7 critical Satake data | a=d=6,m=1,r_W=0; last two weights 2,3; a=5 unitary | k₀=3 gives output 6, erroneous k=2 gives 8; polynomial 1−5T+6T² vs degree 1; unitary weights count 5 | Index/weight repairs sound; R01 dual transport |
| 5.8 critical structure | Fixed outer class, two classes, zero image | Summand counts 1,2,0, surviving multiplicities 1 | Retain explicit nonzero/irreducible hypotheses; R01 |
| 5.9 descent definition | R=0; d=5,m=2,a=4,j=1 | D=0; critical [5,1⁵] has size 10 and complement dimension 5 | Retain zero as value; R01 labels |
| 6.1 support partitions | Even-SO (a,m)=(4,2); odd-SO (2,1),(6,1); unitary (4,1) | [5,5]/[5,1⁵], totals 10; [3,1,1]/[3,1,1], totals 5; [7,5,1]/[7,1⁶], totals 13; [5,4]/[5,1⁴], totals 9 | Formulas sound; R03 difference Check |
| 6.2 weak support | Empty support; one witnessing σ among two | Universal bound true on ∅, p¹∈∅ false; existential witness count 1 suffices | Retain actual global rational witness |
| 6.3 single-block support | n=1, smaller anisotropic SO₂ | a=2,m=2,k₀=1; ambient 6, [3,1³] sum 6 | Matches cuspidal JLXXZ premise |
| 6.3 distinct-isobaric proposition | n=2 with two GL₂ blocks; n=1 | a=4,m=2,k₀=2,[5,1⁵] sum 10; two positive even degrees have sum ≥4>2 | Explicit new support hypothesis, not inferred from single block |
| 6.4 central value to period | Rational critical [5,1⁵] in dimension 10; merely local labels | Stabilizer dimension 10−5=5; local labels alone supply 0 global rational witnesses | Retain coherence/classification/support premises; R01 |
| 6.5 orthogonal–torus criterion | Single cuspidal block vs two blocks; anisotropic vs split torus | Block counts 1,2; norm-one complex torus has norm 1; split constant norm integral ∞ | Known support only discharges single-block case |
| 7.1 recovery proposition | π fixed or exchanged by outer action | Required distinct-class sum has 1 or 2 terms; π⊕π has multiplicity 2 | Retain specified inner form and multiplicities |
| 7.2 recovery theorem | Unique local label at all places; two possible labels at one place; test π∨ | Candidate counts 1 versus ≥2; bilinear test π∨ detects (π∨)∨=π | Exact local premise needed; R01 self-pair transport |
| 7.3 regular recovery | U₄,U₃,SO₄,SO₅; U₄ nilpotent powers | Smaller dimensions 1,0,1,0; U₄ ambient 9; [4] ranks 3,2,1,0 versus [3,1] ranks 2,1,0,0 | Dimension corrections retained; R04 |
| 7.4 subregular summand | SO₆,SO₃,U₅ | [3,3]→Bessel [3,1³], smaller 3; [1³] gives smaller 2; U₅ [4,1]≠[3,1,1], both total 5 and latter smaller 2 | Rational split-SO₃ and independent unitary comparison remain explicit targets |
| 7.5 subregular recovery | SO₈ [5,3] versus [4,4]; U₅ [4,1] versus [3,2] | Prefixes (5,8)≥(4,8); (4,5)≥(3,5); regular [5] dominates [4,1] | Maximal-support singleton hypothesis matters; retain |

Additional domain checks: partitions were enumerated for every d≤12 and valid ℓ, and critical dimension/support identities for positive a≤10 in each allowed parity branch; all sums and complement dimensions matched. q=1 is excluded by finite residue size, not assigned a finite Euler factor: (1−1/q)⁻¹ is singular there. At q=2 and 3, the two-sign L-factor is 4/3 and 9/8. Positive-characteristic fields, inseparable quadratic extensions, zero rings, square-zero coefficient rings and degenerate forms do not satisfy the standing number-field/characteristic-zero/nondegeneracy hypotheses; finite places above 2 or 3 do satisfy them. Rank-zero smaller spaces and index-zero coefficients are retained; a=N=0 cannot satisfy the positive-rank residual hypotheses. No theorem was narrowed to avoid a test case.

### Libraries and statability at the pins

The pins inspected were Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 from the supplied content manifest. Paths below are relative to the respective pinned library root. Names and defining hypotheses were opened, not inferred from name search alone.

| Declaration | Pinned file and line | Native content and relevant limitation |
|---|---|---|
| Nat.Partition | Mathlib/Combinatorics/Enumerative/Partition/Basic.lean:52 | Native fields: “parts : Multiset ℕ”, “parts_pos : ∀ {i}, i ∈ parts → 0 < i”, “parts_sum : parts.sum = n”. No rational orbit, form or Fourier map. |
| Representation.IntertwiningMap | Mathlib/RepresentationTheory/Intertwining.lean:36 | Extends V →ₗ[A] W, with “toLinearMap ∘ₗ ρ g = σ g ∘ₗ toLinearMap”. No continuity, smooth admissibility or Casselman–Wallach topology. |
| MeromorphicOn | Mathlib/Analysis/Meromorphic/Basic.lean:494 | Body: “∀ x ∈ U, MeromorphicAt f x”, for the stated normed targets. No construction of locally convex Eisenstein sections. |
| TauCeti.RegularFormClass.wittDecomposition | TauCeti/LinearAlgebra/QuadraticForm/Witt/Decomposition.lean:262 | Regular finite-dimensional field-form decomposition with 2 invertible. Not a prescribed embedded Hermitian complement. |
| QuadraticMap.IsometryEquiv.exists_extension | TauCeti/LinearAlgebra/QuadraticForm/Witt/Extension.lean:50 | Finite ambient dimension and nondegenerate restricted subspace; does not require ambient nondegeneracy. These hypotheses are recorded correctly in the package. |
| TauCeti.equivalent_of_equivalent_prod | TauCeti/LinearAlgebra/QuadraticForm/Witt/Cancellation.lean:196 | Cancellation with the finite-dimensional nondegenerate cancelled summand. Not an arbitrary quadratic-ring theorem. |
| TauCeti.QuadraticMap.specialOrthogonalGroup | TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean:373 | Body: “orthogonalGroup Q ⊓ (LinearEquiv.det (R := R) (M := M)).ker”. For non-finite-free modules det defaults to 1; the roadmap supplies finite-dimensional field spaces. |
| TauCeti.QuadraticMap.det_reflection | TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean:887 | Determinant −1 under finite freeness and invertible Q(v). A nonzero vector alone is insufficient. |
| TauCeti.QuadraticMap.specialOrthogonalGroupEquivProdLastStabilizer | TauCeti/LinearAlgebra/QuadraticForm/SpecialOrthogonal/Stabilizer.lean:244 | Fixed last-vector stabilizer for Q.prod sq with its regularity/finite-free hypotheses. Section 0.5 still needs the prescribed arbitrary-norm rational embedding and Witt-index comparison, so is not a duplicate of this native equivalence. |

The first eight cited declarations were also checked together with their fully elaborated types in one scratch Lean file, using the four individual TauCeti modules. Exit 0; no binder mismatch or warning. Object files already existed, so no build was needed. Object searches included partitions, quadratic/Hermitian complements, stabilizers, intertwining maps, smooth/cuspidal representations, Fourier coefficients, Eisenstein series, Arthur parameters, tensor/Asai factors and meromorphic families. The finite-group gl2CuspidalRepresentation in TauCeti/RepresentationTheory/CharacterTable/GL2/Cuspidal/Irreducible.lean:318 has carrier Representation ℂ (GL (Fin 2) F) (Fin d → ℂ); it is not the adelic cuspidal carrier needed here. Algebraic intertwiners and scalar meromorphy cannot serve as the missing analytic carriers.

The acceptance file has one import Mathlib, one module docstring, the required namespace, zero own declarations, zero admitted examples and zero options. The required “lake env lean” elaboration of packages/TwistedAutomorphicDescents/Suggested.lean, run from the content checkout with the absolute file argument required by the brief, exited 0 with no output or warnings. There is no sorry warning because there are no theorem declarations. Consequently the one-tactic padding probe and the own-declaration #check inventory each have size zero. No acceptance theorem was replaced by a scalar or free-predicate stand-in.

The 23 README headlines accounted for individually in the docstring are: first-occurrence cuspidality; global multiplicity-free decomposition; local orthogonal uniqueness; spherical evaluation; shifted local-factor regularity; local nonvanishing; maximal-pole criterion; critical holomorphy; reciprocal nonvanishing; period-to-central-value implication; residual L²/membership; higher-index vanishing; critical cuspidality; outer stability; critical Satake parameter; critical structure; known support cases; central-value-to-period existence; orthogonal–torus criterion; concrete recovery; regular recovery; subregular generic summand; subregular recovery. None can presently be stated on its actual carriers using only a few simple definitions. Native partition arithmetic and relative quadratic geometry are intermediate targets, not missing automorphic headlines. Thus no padding or absent-statable-headline finding is raised.

### Ownership, supplier citations and merge direction

The roadmap service was used for by-object searches and to open supplier files at the indexed heads/current main. The supplied board-packages index was read before any absence claim. All 19 listed packages were inspected at their stated heads: four have package READMEs and fifteen have design READMEs. The additional design files were read rather than treating a missing package README as absence of the roadmap. Narrowed searches avoided the broad search's 200-result truncation. No competing relative twisted-descent construction or duplicate acceptance declaration was found. New-map ownership here is the specified rational relative comparison and its residue/Fourier application, not the generic carriers it consumes.

| Supplier citation resolved | File/section evidence and actual contract |
|---|---|
| ReductiveGroups Layers 0,3,7,7b | TauCetiRoadmap/ReductiveGroups/README.md:129,234,627,732. Algebraic carriers, split Bruhat theory, parabolics/Levi intersections; no claim that split Bruhat theory classifies the residual nonsplit rational orbits. |
| OrthogonalSpinGroups Layers 0–2 | TauCetiRoadmap/OrthogonalSpinGroups/README.md:306,383,585. Orthogonal/spinor/local structure, not local admissible Bessel multiplicity. |
| Completed RestrictedProducts Layers 0–3 | Completed/RestrictedProducts/README.md, Layers 0–3 (headings at 248,268,305,361 in the service's file). Maps and rational diagonals require supplied eventual integrality; injectivity/continuity are not automatic. |
| RepresentationTheory/ClassicalGroups Layer 6 | TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md:310. FDRep branching and Gelfand–Tsetlin rules, not the local smooth/Casselman–Wallach theorem. |
| ClassicalGroupsPartII CG.0–CG.3 | TauCetiRoadmap/ClassicalGroupsPartII/README.md:237,560,970,1211. Rational algebraic GSp representation/character theory; different object from relative automorphic descent. |
| ReductiveGroupsPartII RG2.4 | TauCetiRoadmap/ReductiveGroupsPartII/README.md:5509, decompositions/local modulus. Hermitian Witt theory is correctly requested as a continuation, not attributed to that heading. |
| GeometryOfNumbersAndQuadraticArithmetic §2.9 | TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:1194. Field Hermitian carrier/adjoint comes before odd-residue lattice classification; the latter is not imported here at p=2. |
| LieHighestWeightPartII N0/N2 | packages/LieHighestWeightPartII/design/README.md:75 and 349, nilpotent-orbit and classical-partitions. Algebraically closed geometric classification exists in the board design; rational localization and required dominance comparisons are explicitly declared continuations. |
| GanGrossPrasadUnitaryGroups §§1.1–1.3,2.1–2.6,3.9–3.11,4.1–4.4,7.1 | TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md; local model at 356, uniqueness at 510, global bilinear period at 868, tensor representation at 914, fixed-pair proposition at 940. Unitary carriers, framed pairs and local/global conventions are imported. Nonsplit tempered and stated split distinguished-member ranges remain restricted. The general fixed-pair proposition is not used as a theorem. Section 4.7 here explicitly extends the adjacent endpoint and owns the residue comparison. |
| SmoothRepresentationsOfLocalGroups SR.0–SR.4 | TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:558,800,1833,1962,2122,2487,2768,3083,3178,3247,3351. Smooth duals, normalized induction, ordinary Jacquet theory, support and Satake exist; twisted-quotient and spherical Whittaker/measure comparisons are the named supplements. |
| AutomorphicFormsOnReductiveGroups §§2.3,2.6–2.7,3.4–3.5,4.1–4.3 | TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:362,434,459,551,568,596,614,632. Real induction, generic unitary dual, globalization, tensors, constants and actual cuspidal realization. Restriction to a Bessel subgroup still needs the explicit growth/Hilbert contract. |
| AutomorphicLFunctionsAndLocalFactors AL.3–AL.4 | TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:1950,2758; whittaker-model, rs-global-poles, rs-global-functional-equation, rs-boundary-nonvanishing, isobaric-strong-multiplicity-one, l-group-local-factor, local-parameter-comparison, satake-factor-operations were opened. Signed-Asai/all-place normalizer refinements are not falsely claimed as already supplied. |
| AutomorphicSpectralTheory §§0.15,1.1–1.5,2.4–2.14,4.1–4.4 | TauCetiRoadmap/AutomorphicSpectralTheory/README.md; §2.4 at 1600, §2.4a at 1619, §2.8 at 1692, §2.9 at 1713, §2.13 at 1757, §2.14 at 1768. The actual Jiang–Zhang holomorphy theorem is imported; the remaining continuation gap is only the permitted noncuspidal smaller datum. |
| EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 | TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4171,4190,4219. Shared local and generic global unitary carriers/pairings, not an unconditional nongeneric inner-form residual classification. |
| ModularityAndLanglandsExtensions §§3.3–3.4,3.8,3.12,3.15–3.18,3.23–3.25,5.4 | TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:1883,1913,2007,2117,2186,2205,2224,2245,2374,2393,2412,3453. Type/poles, Arthur carriers and scoped classification, generic standard modules and classical GRS descent are imported. The six residual/coherent contracts ask for their specified continuations; ordinary GRS descent is not planned a second time. |

No cited supplier was found later than this roadmap in the supplied order. The required mechanical command with --depcheck, --name TwistedAutomorphicDescents, the supplied ORDER.txt and --movable exited 0 and printed exactly:

~~~text
depcheck: 52 roadmaps, 592 edges, 0 problem(s)
~~~

There was no UPWARD, CYCLE or moved line. The citation resolver also reported no unresolved roadmap citation or own Lean name; its limitation on external-library checking was covered by the pinned inspection above. This clean external graph does not remove R02's internal cycles.

### Declared-gap audit

All 16 slugs have a named supplier and matching top-level plan gap and Exact supplier contracts sentence. No gap has supplier none. Each is an identifiable continuation with the standing hypotheses, rather than a free assumption containing the desired descent. The split MLE contracts have separate outcomes. The following computations also distinguish the requests from already supplied weaker objects.

| Gap | Minimal missing comparison and discriminating value |
|---|---|
| hermitian-witt-complements | Prescribed Hermitian complements, not another field-form carrier. Hyperbolic plane and anisotropic real line have Witt indices 1 and 0; the local modulus does not choose either complement. |
| rational-nilpotent-orbits | Rational labels/localization beyond geometric classification. Real q=2xy gives norms ±1 and opposite perpendicular signatures for the same geometric partition. |
| classical-dominance | Required rank-specific dominance/special expansion. SO₈ [5,3] has prefixes (5,8)≥(4,8) of [4,4]; the latter retains two SO labels, one O label. |
| rational-fourier-support | Actual rational Fourier maps and topological support carrier. Zero realization has support ∅, nonzero coefficient supplies at least one orbit; a geometric partition alone supplies neither. |
| bessel-restriction-growth | Convergence/continuity and correct Hilbert target. Split-torus constant restriction has norm ∞; treating it as volume 1 is false. |
| twisted-jacquet-filtration | Character quotient comparison. Trivial n-action with ψ(n)=−1 kills the complex quotient, while the ordinary quotient retains the whole line. |
| spherical-whittaker-normalization | Specified spherical Whittaker and Haar comparisons. Rescaling b from 1 to 2 doubles Z even with the same spherical vector; neither Satake alone nor good-prime restrictions fix this. |
| all-place-signed-factors | Actual tensor/Asai representation and shifted regularity. For (1,−1), exterior weight −1 differs from symmetric (1,−1,1); m=1,2 gives Asai signs −,+. |
| type-poles-and-cross-factor | Signed unitary type and root-factor identity beyond the supplied self-dual square dichotomy. The trivial GL₁ exterior factor is 1 and symmetric factor has a pole; split U₃ cross weights are 2/5,15. R01 corrects the consumer's labels, not ownership of this contract. |
| isobaric-eisenstein-continuation | Noncuspidal smaller σ extension, not the existing isobaric GL realization. For P=G the family is f with denominator 1; a noncuspidal smaller realization does not satisfy a cuspidal inducing-data premise. |
| quasisplit-residual-packets-membership | Residual Langlands data matched to ν₂ blocks. One GL₂ block plus smaller standard dimension 2 gives 2·2+2=6, versus 4 after replacing ν₂ by ν₁. |
| residual-irreducibility | Irreducibility separate from L² membership. C and C⊕C have dimensions 1 and 2; square integrability of finite-dimensional models does not select one summand. |
| all-member-residual-support | Every discrete member's Levi/blocks/exponents. Two members require two support records; knowing one yields only one. |
| coherent-packets-comparison | Label-preserving classification comparison. Two rational forms can have the same dimension; the form-label set still has two elements. |
| generic-discrete-member-cuspidality | Generic-parameter discrete cuspidality, not a residual ν₂ claim. SL₂ dimensions 1 and 2 distinguish the permitted generic input. |
| standard-base-change-uniqueness | Uniqueness of GL target from standard Satake data, not source uniqueness. One standard polynomial can correspond to two outer source labels. |

These contracts were not raised as missing prerequisites. The verdict is needs changes for R01/R02, so no conditional acceptance is being recorded.

## Not verifiable

- GRS2011 remains the manifest's settled uncertified book: its full text was not legally available in the supplied cache. Its Theorems 5.1, 5.4, 5.6 and 7.3 are retained as uncertified. No new request or duplicate manifest key was made. The package imports the classical descent owner and states its own rational comparison; the open JZ2020 discussion is secondary evidence only.

The supplied extraction was used for the two printed numerator displays; the previous review also records its rendered-page comparison. A fresh visual PDF comparison was not possible because pdftoppm and Python PDF renderers are unavailable. R01 depends on the explicitly written README formulas and group calculations, not on deciphering an overbar.

All other cited works were readable in the supplied legal cache. Eight unique manifest entries were checked, with the published/preprint numbering distinguished; no source was fetched outside the service. Ownership against the indexed open heads and every supplied board head/design was checked. No network write, authored-source edit or source-text copy was made.

## Source issues

- **Error** in JZ2020 at §2.3, printed p.754 (JZ2020 line 640): the source says quasi-split form dimension determines Witt index by taking half; it should be n−1 for nonsplit quasi-split SO₂ₙ; affects a stated result.
- **Error** in JZ2020 at (2.9) and Proposition 2.2, printed pp.755–756 (JZ2020 line 695): the source says the Bessel index may reach the full split-even Witt index; it should be restricted also by 2ℓ+1≤d; affects a stated result.
- **Error** in JZ2020 at (2.13), printed p.758 (JZ2020 line 815): the source says the displayed flag-fixing subgroup is the full connected Levi character stabilizer; it should specify the chosen subgroup, since the unitary central torus also stabilizes the character; affects a stated result.
- **Misprint** in JZ2020 at Proposition 2.5, printed p.759 (JZ2020 line 859): the source says anisotropic-kernel representation is tested on y₋κ; it should test the removed vector yκ when deciding whether the kernel dimension decreases; affects a stated result.
- **Gap** in JZ2020 at Theorem 4.8, printed pp.780–781 (JZ2020 line 1865): the source says the general unramified evaluation is supplied by a separate work; it should provide or identify the complete split and nonsplit normalization calculation; affects the proof.
- **Gap** in JZ2020 at (4.47), (5.13) and Proposition 5.4, printed pp.780,787–788 (JZ2020 line 1826, line 2130, line 2150): the source says unmarked unitary tensor labels give the asserted full self-pair pole; it should track induction, ordinary duals, bilinear test vectors and output parameters in one consistent diagram; affects the proof.
- **Gap** in JZ2020 at §5.5, printed p.791 (JZ2020 line 2292): the source says the central-value conclusion follows after changing the smaller representation's dual; it should justify the simultaneous tensor duality and pairing transport, rather than identify a unitary parameter with its ordinary dual; affects the proof.
- **Gap** in JZ2020 at Proposition 6.3, printed pp.794–795 (JZ2020 line 2447, line 2455): the source says least cuspidal support lets the argument apply to all residual members; it should give the support comparison controlling each member’s relevant constant terms; affects the proof.
- **Misprint** in JZ2020 at Proposition 6.4, printed p.796 (JZ2020 line 2521): the source says the displayed outer normalizer fixes the anisotropic vector; it should say it negates that vector and track the compensating character action; affects the proof.
- **Misprint** in JZ2020 at Lemma 6.5, printed pp.798–799 (JZ2020 line 2619, line 2666): the source says the relevant even-output orthogonal critical index is a/2+r_W−1; it should be a/2+r_W, as forced by the output dimension; affects the proof.
- **Misprint** in JZ2020 at Lemma 6.5, printed p.798 (JZ2020 line 2630): the source says the even-a critical unitary output has dimension a+1; it should have dimension a; affects the proof.
- **Misprint** in JZ2020 at (6.6), printed p.799 (JZ2020 line 2687): the source says the unitary character list stops before the final inducing character; it should retain μ_floor(a/2), preserving the standard parameter's degree; affects the proof.
- **Gap** in JZ2020 at Proposition 6.9, printed p.805 (JZ2020 line 2985): the source says the cited anisotropic-SO₂ result covers the generic distinct-isobaric parameter; it should supply the multi-block extension, since the cited theorem assumes cuspidal τ; affects a stated result.
- **Error** in JZ2020 at §7.2, printed p.809 (JZ2020 line 3197): the source says the smaller datum is empty throughout regular recovery; it should retain the U₁ character for even unitary maximal Bessel descent; affects a stated result.
- **Misprint** in JZ2020 at Appendix A (A.14), printed p.814 (JZ2020 line 3421): the source says the upper-right relation has only (I−g)E₁; it should be CE₂=(I−g)E₁+YY′E₂; affects the proof.
- **Gap** in JZ2020 at Appendix B, printed pp.819–820 (JZ2020 line 3728): the source says nonzero rank-one intertwining factors complete the nonvanishing argument for their composition; it should also justify nonvanishing of the whole composition, which does not follow for arbitrary nonzero operators; affects the proof.
- **Gap** in Zhang2022 at Theorem 1.1 and Remark 1.2, PDF p.3 (Zhang2022 line 107): the source says the split general-linear integral is included while its justification remains outstanding; it should supply that split integral comparison before using the uniform formula; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "4c618d90bdb0ea591ddbe23c4b754ec513662735", "job": "REV-PKG-TwistedAutomorphicDescents~2", "model": "gpt-6-astra", "worker": "chris-20"} -->

<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13172#issuecomment-6787620613 -->
Review (codex) of cb45262

Verdict: needs_changes

1. **F01** (P2) The retained Spin₈ branching theorem has another owner

   **Location:** `packages/LocalLanglandsCorrespondenceForG2/README.md:149`, §0.1: “that vector representation restricts to 1 ⊕ q while each half-spin representation restricts to s”. The sentence assigns this theorem and its proof route to this roadmap.

   **Claim:** The repair imports the exceptional restrictions correctly but retains independent ownership of the consecutive Spin₈-to-Spin₇ restriction.

   **Witness:** Open ClassicalGroups revision #1192, `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md:1139` and line 1144: “the spin branching itself, with half-integral rows, is a target of this section and §6.7.” Its §6.2 uses the same fixed-nonisotropic-vector embedding. For r = 4, either half-spin weight λ = (½,½,½,±½) forces μ = (½,½,½) by its interlacing inequalities. The resulting B₃ module is exactly s, once. For λ = (1,0,0,0), the two possible μ are (1,0,0) and (0,0,0), giving q ⊕ 1. The vector branching is also covered by ClassicalGroups on main, Layer 6, line 319.

   **Exact repair:** Remove the independent branching proof obligation from §0.1 and make it a specialization of ClassicalGroups, Layer 6. Import its main-branch orthogonal branching for the vector part. The half-integral Spin extension is not yet stated there: declare `gap:classical-half-integral-spin-branching`, in Exact supplier contracts and the top-level `design/plan.json` gaps, owned by ClassicalGroups Layer 6, for the missing half-integral part: multiplicity-free restriction of complex Spin(2r) representations to the lifted fixed-vector Spin(2r−1), r ≥ 2, with dominant λ in (ℤ+½)^r and summands indexed by dominant μ in (ℤ+½)^(r−1) satisfying λ₁ ≥ μ₁ ≥ λ₂ ≥ ⋯ ≥ λ_(r−1) ≥ μ_(r−1) ≥ |λ_r|. The integral part is already supplied by main and is not part of this gap. Consume that contract at the two half-spin weights. Keep §0.1's parameter consequences, number, and numerical Checks. Do not make the revision of an existing roadmap a supplier dependency: #1192 establishes the ownership conflict, while the contract is on the roadmap on main.

   **Repair test:** The half-spin substitutions each leave exactly one summand of dimension 8; the vector substitution leaves dimensions 7 + 1. At the central element −1 the respective traces remain −8 and 8. Thus moving ownership changes none of the mathematics or downstream parameter formulas.

   The previous repair report explicitly noticed this overlap but proposed waiting until the revision merges. The binding ownership audit applies to open work now. This is the remaining instance of the duplication pattern, not a claim that the previously reported exceptional restrictions remain unrepaired.

2. **F02** (P3) The quadratic-twist Check omits its starting parameter

   **Location:** `packages/LocalLanglandsCorrespondenceForG2/README.md:159`: “two Spin₇-valued parameters differing by an unramified quadratic central character … have … spin images with Frobenius eigenvalues all 1 versus all −1”.

   **Claim:** As written, the Check asserts the two constant spectra for an arbitrary such pair. A central quadratic twist negates the existing eigenvalues; it need not produce these two spectra or distinguish the spin images.

   **Witness:** Use the unramified finite-image parameter with φ(Frob) = i j diag(−1,1,−1), trivial Deligne SL₂, and χ(Frob) = −1. README lines 154–156 give vector multiplicities 1³,(−1)⁴ and spin multiplicities 1⁴,(−1)⁴. Twisting leaves that spin multiset unchanged: traces 0 and 0, not 8 and −8.

   **Exact repair:** State the general rule as eigenvalues λ₁,…,λ₈ becoming −λ₁,…,−λ₈, with q unchanged. Then explicitly take φ to be the trivial parameter to obtain the intended all-1 versus all-minus-1 example. Keep the displayed finite-image example as a negative control against the assertion that every nontrivial central twist changes the weak class.

   **Repair test:** For φ = 1 the spin traces are 8 and −8, and both vector traces are 7. For the witness above the spin traces are 0 and 0 and both vector traces are −1. The corrected rule gives both pairs of values.

Two findings: one P2 ownership conflict and one P3 Check correction. Both findings from round 4 are repaired. Elaboration passes; neither admitted theorem is padding. The fourteen existing supplier gaps are declared contracts, not findings.

## Verified sound

### Previous findings and the changed passages

The prior review and repair report were read before the fresh audit. Neither previous finding was marked not actionable.

| Previous finding | Repaired passage and verification | Status |
|---|---|---|
| F01: duplicate exceptional branchings | README line 149 now imports “ExceptionalThetaCorrespondencesForG2, §0.6, Exceptional inclusions of complex dual groups” and uses “the transport of parameters … §0.7”. At the current #1736 head those sections are lines 247 and 268 and contain the two restrictions and parameter transport. The h-branching is imported from SpinRepresentations Layers 5–6. Scope and contracts at lines 11 and 52 agree. | Repaired. R01 is the remaining, different Spin₈ branching ownership conflict. |
| F02: abstract unacceptable pair used as local/discrete data | README line 234 now says “Prove also the local form, for every F as in Conventions” and cites CG Proposition 8.3. Line 243 says “The local pairs are not discrete”. The Checks in §§0.4, 0.6, 0.7 and the worked example now use the local construction; §8.2 instead tests the principal parameter and its central twist. | Repaired. CG lines 1207, 1215, 1232 and 1257 support the local construction and its limitation. |

The revised compact-to-complex polar-decomposition argument was checked, not merely its citation. If p r p⁻¹ is unitary and p is positive, uniqueness of the unitary-positive factors in p r = r(r⁻¹ p r) = (p r p⁻¹)p forces p r p⁻¹ = r. A complex conjugator would therefore yield a compact conjugator, contradicting CG. Finite image gives boundedness, finite inertia and semisimple Frobenius. The local parameters have N = 0; no discrete-parameter assertion has survived. The CG manifest entry retains its original key and now records §§8.2–8.4. The Lean change is confined to explaining the missing local-parameter carrier in its docstring.

The repaired patterns were sought throughout the remaining package. The exceptional and h-branchings are consistently consumed; the remaining independent branching is R01. No further use of the C₄² pair as parameters for every F, or as discrete parameters, was found. The separately existing quadratic-twist Check gives R02.

### Coverage, principles and shape

I read all 75 numbered targets, every Needs line, their APIs, Checks and worked examples. The 11 layers each end with Examples and Dependencies. Changed passages received a fresh adversarial pass. For unchanged material I retained the previous review's computed rows only, and inspected the passages they concern; the fifteen seeded targets were checked afresh against the text. The compact table below covers the sample, headline families and both findings, rather than reproducing an oversized per-target ledger.

The plan remains a general characteristic-zero local-field library, including residue characteristics 2 and 3. The limitation on full A₂ enhancement at 3 is stated explicitly; neither the underlying LLC nor the weak correspondence is restricted to good primes. Genericity, discrete series, temperedness, proper-Levi cases, full monodromy and the distinction between weak and actual conjugacy classes are retained. The intended final results are new to this roadmap; no existing G₂ LLC roadmap is replanned. The ownership defect is the small but explicit one in R01.

Main-branch ClassicalGroups, SpinRepresentations and ClassFieldTheory were read as shape/context examples. The package has the prescribed title, summary, ownership, conventions, supplier contracts, build explanation and references. Definitions have prose APIs and discriminating Checks; there is no API catalogue in Lean. No computational algorithm, source passage copied into the package, route-specific prime exclusion, process path, PR number, HTML anchor, `set_option`, `lemma`, sorry'd data, arbitrary predicate substitute or admitted example was found. Mathematical uses of “packet” refer to representation-theoretic packets. Layer names describe mathematics. Although several topics also occur in GS, the order is supported by explicit dependencies: construction precedes enhancement, the generic spin identity feeds diamond fibres, and classical globalization feeds the extended weak correspondence. No freely ordered run presented as following the source was found.

### Seeded source verification

All fifteen sampled targets were readable in the cached legal texts. Printed pagination was distinguished from PDF/extraction page markers. Numbering was checked in the versions recorded in the manifest. The only explicitly unsettled original text is Griess, already recorded as uncertified; it was not requested again.

| Target and README line | Text opened at locator | What the text supports and what was checked |
|---|---|---|
| 0.1, line 149 | GS §4.1, p.17, GS lines 687–710; §2.2, pp.9–10; §12.3, pp.35–36, GS lines 1480–1528 | The fixed-vector embedding and all four representation dimensions/restrictions. WD identities retain dρ(N). Mathematical formula sound; ownership R01 and Check R02 remain. |
| 0.9, line 247 | C Theorem E, p.100, C line 235; Corollary 6.8, statement p.150, C lines 2282–2288, proof through line 2314 | Totally real field, cuspidal GL₇, regular algebraic infinity, almost-all Satake condition iff a unique G₂ lift at every finite place. The cited pp.149–150 include the statement; proof continues on p.151. SU₂ is translated to algebraic SL₂ with N. |
| 1.1, line 280 | GS §10.2, p.28, GS lines 1167–1178 | Period detection is on automorphic realizations/multiplicity space, not automatically every copy of an isotypic representation. Compact quotient and pointwise quaternion stabilizer are retained. |
| 1.3, line 312 | GS proofs of 10.5 and 10.7, pp.28–30, GS lines 1184–1197 and 1223–1237; SV Theorem 16.3.2, p.245, SV line 11075, Remark 16.4.1, p.248, SV line 11239; ILM proof of Proposition 4.5, pp.19–20, ILM lines 950–983 | These explain weak containment and the spare-place arrangement. The package does not pretend they already state its entire all-residue-characteristic, archimedean contract: the exact additional strength is declared under poincare-weak-containment. Twisted left equivariance and the free archimedean place are explicit. |
| 2.3, lines 415 and 429 | GS §4.3, pp.17–18, GS lines 737–747, proof of 4.1 at lines 771–780; §12.6, p.38, GS lines 1591–1595 | Global spin transfer is isobaric. The generic construction and the later nongeneric Arthur comparison are distinguished. Everywhere local nonvanishing, Rallis and the Steinberg lower-tower vanishing enter via named contracts. |
| 3.5, line 523 | GS Main Theorem (i), p.3, GS lines 113–115, and §3.4, p.12, lines 511–516; HD Lemmas 13.4 and 13.8, pp.42,47, HD lines 1600–1606,1799–1814; Theorem 15.1(v), p.52, HD lines 2008–2009 | Positive normalized inducing data, Langlands quotient and the corresponding Levi parameter. N is not replaced by ordinary semisimplification. |
| 3.10, line 580 | GF Definition 2.1, p.3, GF lines 91–97 | Rank-7 standard transfer defines the G₂ × GL_r factor via Rankin–Selberg; the tensor has dimension 7r. The independent characterization is a subsequent theorem, not smuggled into the definition. |
| 4.1, line 659 | GS §3.5, pp.14–15, GS lines 613–625 and 638–653 | Three cubic forms, opposite algebra and contragredient JL, Kottwitz labels. The package separates the non-self-dual μ₃ case from the self-dual S₃ case, avoiding the source's overly uniform centralizer argument. |
| 5.5, line 772 | HD Theorem 15.2, pp.52–53, HD lines 2021–2031; GS Main Theorem (vi), p.4, and §3.2, p.11 | Non-self-dual induced partner and self-dual generic constituent. Discrete SL₃ data have no trivial direct summand, so the relevant self-dual case is HD (iii). The partner is tempered, not asserted discrete. Its full spin parameter has dimension 3+3+1+1. |
| 6.4, line 839 | GS proof of Lemma 8.3, pp.24–25, GS lines 1018–1051 | Two equal local components; generic split and nongeneric totally definite globalizations are separate. The regular-real and period inputs are named, and no genericity of all supercuspidals is assumed. |
| 7.1, line 896 | GS Main Theorem, pp.3–4, GS lines 102–176; Proposition 3.2, p.14, GS lines 603–608 | All listed LLC properties, with the source's tempered intermediate codomain corrected. The p=3 enhancement is an injection on the specified locus; the subregular fibre is complete. |
| 8.1, line 953 | GS Lemma 12.5 and proof, pp.37–38, GS lines 1574–1590 | The heart hypothesis at the selected place, local nonvanishing elsewhere, standard L-value and first occurrence. Archimedean nonvanishing and similitude Rallis are explicit additional contracts. |
| 9.2, line 999 | GS §12.3(b), pp.35–36, GS lines 1480–1509, and §12.4 at lines 1520–1528 | Both lower towers give vector 1⊕Λ²φ_τ and spin φ_τ⊕φ_τ∨. Quaternionic data first pass through JL; both duality and monodromy remain. |
| 10.7, line 1106 | GS proof of Theorem 12.7(ii), p.39, GS lines 1644–1647 | The source identifies this lower-tower case but leaves details to the reader. The package makes those details targets with the required tables, outer involution and JL inputs. Not represented as a fully printed proof. |
| 10.9, line 1126 | GS Theorem 12.7(ii), p.39, GS lines 1631–1634; final argument and §12.8, p.40, GS lines 1660–1680 | Fibres are unions of Xu packets; the G₂ diamond image gives a single distinguished packet. This stronger conclusion is not extended to arbitrary weak classes. |

The repaired local example was additionally checked at CG Example 1, pp.13–14, CG lines 490–512, formula (16) and Lemma 8.2, p.32, CG lines 1207–1222, Proposition 8.3, pp.32–33, CG lines 1232–1252, and Proposition 8.4(a), p.33, CG lines 1257–1263. All twelve cited works have one manifest key; eleven are certified and Griess is settled as uncertified. No new source was fetched or requested, and no manifest entry was changed.

### Computed adversarial evidence

These are falsification tests and convention checks, not substitutes for proofs of the deep theorems. Standing F is a finite extension of ℚ_p, coefficients are ℂ, and ranks are fixed. Zero rings, q=1, positive-characteristic local fields and rank zero are outside those hypotheses; they were not silently included in the tests. The native quadratic form still admits isotropic vectors, and semisimple WD parameters still have nonzero monodromy, as tested below. “Retained” means no change beyond the findings stated above.

| Statement | Instances tried | Values on the two sides / negative control | Result / change |
|---|---|---|---|
| §0.0 octonionAut | Identity, 2·id, conjugation on two upper Zorn basis vectors | At 1·1: 1=1 for identity, 2≠4 for scaling. Conjugation sends their product to lower −e₃; multiplying their conjugates gives lower +e₃. | Multiplicativity excludes scaling and the anti-automorphism. Retained. |
| §0.0 octonionRep; Griess headline | Γ=1; Γ=C₅, t=diag(ζ,ζ,ζ³) versus t² | Trivial action has conjugator 1. ζ-multiplicities are 2 versus 1 in v; adding the scalar line keeps 2 versus 1 in dimension 8. | Equal image subgroups do not imply the intertwining hypothesis. Retained. |
| §0.1 exceptional branchings | diag(2,3,1/6); identity; diag(−1,1,−1) | v spectrum {1,2,3,1/6,1/2,1/3,6}, determinant 1; s adds 1. Identity dimensions 7,8; sign polynomial (X−1)³(X+1)⁴. | Matches imported §0.6. |
| §0.1 Spin₈ restriction; R01 | Both D₄ half-spin parities, restricted torus; central −1 | Each set of 8 weights projects bijectively to (±½,±½,±½), multiplicities all 1. Vector weights are ±e₁,±e₂,±e₃,0,0. Central traces 8 and −8. | True, but exactly the other owner's branching specialization. Move ownership. |
| §0.1 central-twist Check; R02 | Trivial φ; φ(Frob)=ij diag(−1,1,−1) | Trivial: spin 1⁸ versus (−1)⁸, traces 8,−8. Second case: both spin spectra 1⁴,(−1)⁴, traces 0,0; both vector traces −1. | Missing premise refuted. General negation rule and explicit trivial example repair both tests. |
| §0.1 h-branching and parameter transport | −I in SL₄; φ_τ=Sym² | q trace 1+6=7; s trace −4−4=−8. For A₂ transport N ranks 0+2+2=4 on v and 0+0+2+2=4 on s. | Centre, dual and monodromy consistent. |
| §0.2 A₂ detection headline | Sym², cubic twist of Sym², principal G₂ SL₂, trivial parameter | Self-dual vector 1⊕2Sym² has invariants 1, S₃ order 6; non-self-dual cubic case has μ₃ order 3. Principal Sym⁶ has invariants 0; trivial v has 7 but is nondiscrete. | Discrete hypothesis excludes the wrong converse model. |
| §0.3 spin detection headline | Principal versus subregular SL₂ | Spin 1⊕Sym⁶ has invariants 1, raw centre order 2 and fixed-split quotient order 1. Subregular 2·1⊕2Sym² has invariants 2 and positive-dimensional centralizer. | Discreteness and central quotient retained. |
| §§0.4–0.5 standard injectivity and rigidity | τ,τ∨; principal versus trivial SL₂; ρ=1, χ≠1 | 1⊕τ⊕τ∨ equals 1⊕τ∨⊕τ. Principal N rank 6 versus 0. For ρ=1, (vρ)⊗χ has invariant dimension 0; spin traces change 8 to −8. | Duality quotient and spin condition are substantive. |
| §§0.6–0.7 weak equivalence | Central quadratic pair; unipotent principal versus identity | q traces 7=7, s traces 8≠−8. Principal spin Jordan blocks (7,1) versus eight 1-blocks, although both traces are 8. | q alone and semisimple traces alone are insufficient. |
| §0.8 finite unacceptability headline | Γ=C₄² and η=(0,2) | V weights sum to (4,4)=0 mod4. ηV equals neither V nor V∨. All 16 elements satisfy x even, y even or x+y even. At (0,1), spin spectra {1,−1,i,i,1,−1,−i,−i} and their negatives coincide. | Elementwise conjugacy does not imply a common conjugator. |
| sumSquaresSeven | 0, e₁, e₁+i e₂ | Q=0,1,0; polar matrix 2I₇ has determinant 128, associated half-polar matrix I₇ determinant 1. | Nondegenerate but isotropic, as required over ℂ. |
| §0.8 local repair and its reused Checks | ℚ₃, ℚ₅, ℚ₂ | Fourth-power quotient orders 8,16,32; only the first cannot surject onto C₄². Quadratic-character ranks 2,2,3 give at least two distinct quadratic extensions in every case. | CG Proposition 8.3 supplies all F; the abstract pullback alone does not. |
| §0.8 compact-to-complex step | p=diag(2,1/2), r=[[0,1],[−1,0]]; diagonal r | p r p⁻¹ has off-diagonal entries 4,−1/4 and column norms 1/4,4, so is not unitary. For diagonal r it equals r. | Positive conjugation preserving unitarity forces commutation; polar route survives. |
| §0.8 nondiscreteness | CG Example 1; type I construction | q=1⊕2c⊕d⊕d⁻¹⊕e⊕e⁻¹ has centralizer dimension 3. General type I has a repeated quadratic character and a Spin(2) centralizer, dimension at least 1. | These examples are not discrete. Corrected limitation retained. |
| §§0.9–0.10 descent headlines | Principal Sym⁶; S₃ density comparison | Weights −6,−4,−2,0,2,4,6 sum to 0 and give dimension 7. S₃ class densities 1/6,3/6,2/6 sum to 1; identity alone is 1/6. | Full almost-everywhere data and regular algebraicity retained. |
| §§1.1–1.2 period/generic spectra | Two copies V⊕V, functional p(x)+p(y) | Diagonal gives 2p(v), anti-diagonal gives 0. Nonzero measure scaling multiplies both by c≠0 and preserves the kernel. | Multiplicity-space realization matters. |
| §1.3 weak containment | ψ(n)=−1, f(1)=1; empty S; spare archimedean place | Twisted f(n)=−1 versus untwisted +1. Empty product group has size 1. Extra finite-place counts are 1 in (a),(b), 0 in (b′). | Correct equivariance and extra-place hypotheses, conditional on declared contract. |
| §§1.4–1.6 globalization headlines | Selected period copy; St plus trivial summands; real generic/nongeneric modules | Period 2p(v) versus 0. St multiplicity 1 in the full sum, 0 among trivial summands. Whittaker dimensions 1 versus 0. Split ranks G₂=2, PGSp₆=3 versus PGL₂=1. | Isolation and genericity are actual inputs; no rank-one shortcut. |
| §1.7 regular-weight globalization headline | h_t=(8t+3,4t+2,2t+1), t=0,1,2 | Spin weights at t=0: −3,−2,−1,0,0,1,2,3 (7 distinct). At t=1: ±10,±7,±4,±1; t=2: ±17,±12,±7,±2 (8 distinct each). | Growing sequence passes; boundary fails. |
| §§2.1–2.3 triality/global transfer headline | Centre C₂²; exceptional transfer 1⊞A | Three distinct order-2 kernels permuted by a 3-cycle, whose cube is 1. Restriction dimensions 1+7,8,8. GL₈ isobaric summands 1+7=8, with two summands. | Distinct quotients and isobaric, not necessarily cuspidal, transfer retained. |
| §§2.3,8.1 global theta | Steinberg upper parameter versus lower τ=Sym³ | Upper vector Sym⁶ has invariant dimension 0. Lower 1⊕Λ²Sym³=2·1⊕Sym⁴ has invariant dimension 2; hence it cannot be the Steinberg vector parameter. | Lower lift vanishes; nonzero upper first occurrence can be cuspidal. Other inputs explicitly contracted. |
| §2.4 spin gamma and cancellation headline | q=5, s=2, trivial spin Satake; ψ₅ versus ψ₀; one/two copies | One Tate ratio is (1−5⁻²)/(1−5)=−6/25; eight give (6/25)⁸. ψ scaling is 5⁻¹². R_u R_w R_σ=1 and R_u R_w R_σ²=1 give R_σ=1; an uncontrolled extra factor could instead permit R_σ=2. | Conductor and finite-place control are needed and present. |
| §2.5 twist headline | χ(Frob)=−1, then χ² | Seven vector eigenvalues unchanged; eight spin eigenvalues negated then restored. A GL₂ twist has rank 16, versus rank 8 for no twist. | Correct full theta/twist route, not an untwisted local converse. |
| §§3.1–3.8, especially 3.5 | Trivial versus Steinberg G₂ at q=5; subregular | Trivial/St semisimple WD eigenvalues both 5⁻³,…,5³, but N ranks 0,6. Subregular v=1⊕2Sym² has N rank 4. Arithmetic norm 1/5 versus supplier degree character 5; inversion sends 2 to 1/2. | Full N, normalized induction and reciprocal conventions distinguish the cases. |
| §§3.9–3.13 standard lift/gamma headlines | A₂ Sym²; rank-r twists; the two maximal Levis | Standard dimension 3+1+3=7, N rank 4. Tensor dimension 7r, determinant contribution det(τ)⁷. Levi dimensions 2+2+1+1+1=7 and 2+2+3=7. | Degree-7 factors and all required twists retained. |
| §3.14 theta characterization; §3.15 all-place headline | τ and τ∨; Steinberg place | Dual pair gives one G₂ class. Local Steinberg N rank 6 remains 6, rather than 0 after ordinary semisimplification. Density-one eligible prime set has density 1, empty set 0. | Uniqueness and universal irreducibility input are substantive; no conclusion assumed as a free hypothesis. |
| §§4.1–4.5 enhancements | Opposite cubic forms; μ₃ and S₃, including p=3 | Opposite: 1/3↦2/3↦1/3. μ₃ has 3 irreducibles. S₃ dimensions 1,1,2 have squares 1+1+4=6. Standard character at a 3-cycle is ζ+ζ⁻¹=−1; its restriction is χ⊕χ⁻¹, while sign restricts to 1. | Character restriction, self-duality and inner-form labels agree. |
| §§5.1–5.6 Kret–Shin/exceptional spin headlines, especially 5.5 | Principal and Siegel partner for τ=Sym² | Principal spin 1⊕Sym⁶ dimension 8, invariants 1. Siegel spin 2·1⊕2Sym² dimension 8, invariants 2, N rank 4. | Joint vector/spin constraints retained; generic Siegel partner is tempered and nondiscrete. |
| §6.4 two-place globalization | Same local character change at w₁,w₂ | For sign −1, product (−1)(−1)=1; changing only one gives −1. | Two equal places supply the multiplicity cancellation. |
| §§6.1–6.7 diamond fibre headline | Principal fibre; quadratic-character stabilizer H | Principal G₂ fibre and selected Xu packet each have size 1. Orbit size is [X:H], equal to 1 when H=X, not automatically the size of X. | One-in-all-in and nonfree twisting retained. |
| §7.1 LLC headline | Principal, subregular, general A₂ at p=3 | Principal fibre size 1. Subregular size 3, not order(S₃)=6. General A₂ injection at p=3 has cardinality ≤3; no assertion that all 3 occur. | Surjectivity of L and completeness of enhancements are distinguished. |
| §7.2 generic supercuspidal headline | Generic versus nongeneric subregular supercuspidal | Whittaker dimensions 1 versus 0; generic-supercuspidal parameter has N=0, whereas the nongeneric subregular example has N rank 4. | Genericity cannot be dropped. |
| §§7.3–7.4 partial enhancement headline | Principal diamond; full twist stabilizer | Raw Spin centre has order 2, fixed-split quotient order 1. Full twist stabilizer gives orbit size 1. | Central quotient and restricted enhancement domain correct. |
| §8.2 discrete heart headline and repaired Check | Principal φ̃ versus χφ̃; h=(11,6,3) | q remains Sym⁶; spin traces at (Frob,1) are 8 and −8. Local spin weights have two zeros; global Hodge weights ±10,±7,±4,±1 are distinct. A hypothetical 1+7 decomposition would have 2 Galois summands instead of an irreducible rank-8 one. | Local and global regularity are not conflated; repaired Check is discriminating. |
| §§9.1–9.2 lower towers | τ=Sym³; τ(Frob)=diag(2,3,5,1/30) | Λ²Sym³=1⊕Sym⁴, vector dimension 7 and N rank 4; spin 2Sym³ dimension 8 and N rank 6. Torus Λ² entries 6,10,1/15,15,1/10,1/6; spin entries 2,3,5,1/30,1/2,1/3,1/5,30. | Correct dual and wedge, including N. |
| §§9.3–9.4,10.1–10.2 weak LLC headline | All proper standard Levis; trivial/principal parameters | Proper C₃ subsets number 2³−1=7. Trivial centralizer dimension 21 versus principal dimension 0. | All Levi types included; boundedness/discreteness are not inferred from one scalar trace. |
| §§10.3–10.4 and 10.7 | Quadratic twist and outer duality of the preceding torus datum | Twist negates all 8 spin entries and leaves all 6 wedge entries unchanged. Duality permutes the same 8 spin entries. A second twist restores the original lists. | Lower-tower constancy and twist conventions survive both tests. |
| §10.6 packet replacement | Global component group trivial versus two nontrivial local signs | Actual global character product is 1 before and after replacement. Without that premise a single −1 change would turn 1 into −1. | Trivial global component group is explicitly used. |
| §10.9 fibres headline | Diamond image versus CG local unacceptable pair | Diamond spin has invariant dimension 1 and rigidity yields one Spin₇ class, hence one selected packet. CG local construction has at least 2 Spin₇ classes in one weak class. | Single-packet conclusion is correctly confined to the diamond image. |

### Lean acceptance test and headline coverage

The prescribed `lake env lean` invocation on `packages/LocalLanglandsCorrespondenceForG2/Suggested.lean`, from the content checkout, exited 0. Its only diagnostics were `declaration uses 'sorry'` at 118:8 and 137:8. The used Tau Ceti object file existed; no build or dependency update was needed. No Lean process was left running.

A scratch copy with `#check @` for all five declarations also elaborated. The three simple definitions have real bodies on native carriers. The signatures keep the Group instance in `octonionRep`, both semisimplicity hypotheses and the actual intertwining linear equivalence in `griess_conjugacy`, and the finite domain and ∀γ∃g versus ¬∃g∀γ distinction in `spin7_not_acceptable`. No binder disappeared. README and signatures agree; no signature was changed.

The one-tactic probe covered both admitted theorems. Separate copies replacing the two proofs with `simp`, `rfl`, and `infer_instance` failed at both targets: respectively unsolved existential goals, non-definitional-equality goals, and non-instance goals. The one-library-lemma alternative was checked by reading the pinned near matches: conjugation-orbit lemmas concern a single pair of elements, Maschke supplies semisimplicity, and quadratic-form equivalence supplies a change of quadratic coordinates. None concludes either headline. Neither theorem mirrors a Check, restates a definition, or treats only a small/boundary case. No padding finding.

| README headline family | Acceptance-test treatment |
|---|---|
| Griess conjugacy, §0.0 | `griess_conjugacy`, line 118, using `octonionAut` and `octonionRep`. |
| Finite Spin₇ unacceptability, §0.8 | `spin7_not_acceptable`, line 137, using native Clifford spin group and `sumSquaresSeven`. The newly stated local version is explicitly distinguished in the module docstring. |
| A₂ and spin detection, §§0.2–0.3; injectivity and rigidity, §§0.4–0.5 | Named as not statable: actual dual-group parameters, inclusions, component groups and their L-factors are missing. The native conjugacy core is stated. |
| Chenevier local/Galois descent, §§0.9–0.10 | Named: missing actual automorphic representations, Satake data and attached Galois representations. |
| Globalizations, §§1.4–1.7 | Named: adelic period/Whittaker realizations, relevant Fell duals and local discrete series are missing. |
| Triality spin transfer and gamma identities, §§2.2–2.5 | Named: classical theta, smooth representations, Arthur correspondence and factors are missing. |
| G₂ LLC and its characterizations/enhancements, §§3–4,7.1 | Explicit main entry and subsidiary gamma/component-group entries; missing the smooth G₂ and parameter carriers. |
| Kret–Shin, exceptional spin identity, §§5.1–5.6,8.2 | Named: GSpin Galois construction and actual vector/spin comparison carriers missing. |
| Diamond fibres and partial PGSp₆ enhancement, §§6.6,7.3 | Named: theta/Xu packet and parameter carriers missing. |
| Generic supercuspidal correspondence, §7.2 | Named: same representation/parameter carriers and Whittaker genericity missing. |
| Weak PGSp₆ correspondence and fibres, §§10.1,10.9 | Named: actual smooth representations and weak-parameter classes missing. |
| All-places compatibility, §3.15 | Named: automorphic and attached Galois representations missing. |

No statable headline was found absent or forced through an ad hoc encoding. All five own backticked names resolve to these declarations. The header has `import Mathlib` and the single used `TauCeti.Algebra.Octonion.Basic` import. Native Weil groups and spin groups were not mistaken for the missing categories of admissible dual-group parameters or smooth G₂ representations.

### Pinned library and object audit

Pins read from the content manifest: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Paths below are relative to those libraries. These files were opened; external search suggestions were not treated as pinned declarations.

| Pinned file and line | Declaration/content and its limit |
|---|---|
| `Mathlib/RepresentationTheory/Semisimple.lean:34` | `Representation.IsSemisimpleRepresentation` is complementedness of the subrepresentation lattice; it does not assert Γ finite or G₂-conjugacy. |
| `Mathlib/RepresentationTheory/Maschke.lean:180` | Finite-group semisimplicity, with field and invertible group-order assumptions; not a multiplicative octonion intertwiner. |
| `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean:62`, line 154, line 293, line 385 | Lipschitz closure, pin/unitary subgroup, even spin subgroup and group instance. Clifford star over ℂ is the algebraic involution, not a Hermitian compact-form condition. |
| `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1408`, line 1416 | `weightedSumSquares` and evaluation; actual coefficient weights here are all 1. |
| `Mathlib/LinearAlgebra/QuadraticForm/AlgClosed.lean:52`, line 62 | Equivalence to sums of squares/equivalence of nondegenerate finite-dimensional forms, with 2 invertible. This does not construct unacceptable homomorphisms. |
| `Mathlib/LinearAlgebra/QuadraticForm/IsometryEquiv.lean:172`, line 177 | Weighted diagonalization, including nondegeneracy hypotheses; likewise not either headline. |
| `Mathlib/Algebra/Group/Conj.lean:32`; `Mathlib/GroupTheory/GroupAction/ConjAct.lean:133`, line 207 | `IsConj`, conjugation action and single-element orbit membership, not a common conjugator for homomorphisms. |
| `Mathlib/Data/Matrix/Diagonal.lean:50`; `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140`, line 158 | Native diagonal and characteristic polynomial, including diagonal product formula. |
| `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:115`, line 119; `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:80` | Degree (nontrivial-ring hypothesis), monicity and diagonal determinant; the hypotheses hold over ℂ. |
| `TauCeti/Algebra/Octonion/Basic.lean:143`, line 336, line 354, line 365 | Zorn carrier, conjugation, multiplication reversal and trace; anti-automorphisms are not accepted by `octonionAut`. |
| Same file, lines 537,551,831,861 | Multiplicative norm, norm form, imaginary trace kernel, rank seven with its ring/rank hypotheses. It does not contain the Griess conjugacy conclusion. |
| `TauCeti/Algebra/Lie/D4/Tripled/Triality/Basic.lean:155`, line 197 | Integral triality and cube identity on the tripled carrier; comparison with the three F-rational classical quotient maps is additional work. |
| `TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/Basic.lean:181`, line 235 | Native Weil group and degree, with arithmetic Frobenius convention. The carrier alone does not include a G₂-valued WD parameter or its LLC. |

Object searches covered octonion automorphisms and intertwining representations, spin/half-spin restriction, Spin₇ simultaneous conjugacy, Weil–Deligne data, smooth representations, triality, gamma factors, relative isolation and weak containment. No pinned theorem with either kept headline's conclusion was found. No one of the five fully qualified names collides with the readable roadmap acceptance tests. R01 is the overlap found by object rather than by a Lean name.

### Current suppliers, overlap and merge direction

The board-package index was read before any absence claim. Indexed `roadmaps grep` and `roadmaps show` were used for ownership; the current `roadmaps resolve` reports no unresolved roadmap citations or Lean names. Its host did not perform a pinned-library scan, so direct inspection above supplies that check. The supplied overlap snapshot has no dropped cited ids, revision-only ids or conflicting head modifying this package. The direct overlaps command does not index this still-packaged roadmap as an open roadmap; this is not evidence that there are no overlaps. The readable scopes and object searches expose R01.

Every supplier citation was resolved against main or the supplied open head, not from memory. The table records the sections and the objects actually consumed. PR numbers identify review evidence here, not supplier citations to insert into the package.

| Supplier/head and repository locator | Resolved contract and comparison |
|---|---|
| #1736, `TauCetiRoadmap/ExceptionalThetaCorrespondencesForG2/README.md:247`, line 268, line 295 | §§0.6–0.8: exceptional inclusions/restrictions, parameter transport and raw/fixed-split component groups. These are imported after F01. |
| Same file, §0.1 and Layers 1,5,7–10; lines 1005,1018,1033,1045,1090,1216,1366,1514,1614 | Octonion model, partial unipotent labels, division Howe/nonvanishing and opposite algebra, split tables/dichotomy, quaternion relative embeddings, global exceptional lift/nonvanishing/cuspidality. The supplier's scope leaves full LLC and weak PGSp₆ LLC to this roadmap. |
| Main `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:564`, line 665, line 777, line 839, line 969 | Polar topology, faithful representations, B-to-D spin restriction, Spin₆≅SL₄ with vector Λ², triality. The B-to-D statement does not itself state the D-to-B branching retained here. |
| Main `TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md:319`; revision #1192, same file lines 1116,1139,1144 | Main owns consecutive SO branching; the revision owns general integral/half-integral Spin branching. R01 records the resulting collision without treating the revision as an allowed supplier. |
| #1180, `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:1488`, lines 1792,1850,2015,2047,2081,2253,3164 | §§2.43,3.5,3.8,3.15,3.17,3.19,3.27,5.1: irreducibility premise, GSp₄, Arthur, Xu, stabilizers, multiplicity and generic classical transfer. Trace-formula premises remain. SO₈ spinor-norm twisting is declared additional scope. |
| #999, `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:504`, lines 1872,1893,3597,4125,4208,4224 | §1.13, §§4.7a–4.8,10.1,10.26,10.30,10.31: Kottwitz/JL, full WD and factors, twists and inner forms. Geometric reciprocity is explicitly transported. Generic converse remains a declared supplement. |
| #1063, `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:786`, lines 844,1026,1108,1116,1714,1722 | §§3.10,3.17,3.34,3.41–3.42,6.13–6.14. The basic §3.41 statement is nonarchimedean; archimedean nonvanishing, all-Levi tables, complex comparison and the required similitude Rallis strength are separately contracted. |
| #924, `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:921`, line 1430, line 2278 | Epsilon/ψ normalization, AL.3 global functional equations, isobaric transfer, strong multiplicity one and boundary nonvanishing; AL.4 unramified factors. |
| #1756, `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:16`, line 1060 | Scope and Layer 6 generalized local factors. The Shahidi spin-factor contract extends this owner, shared with the exceptional-theta supplier. |
| #1688, `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:1916`, lines 2045,2205,2571,2875,4763 | SR.2.1–2.3, SR.3.1,3.3, SR.5.2: normalized induction/Jacquet, Whittaker, classification, full WD and classical LLC inversion. |
| #1815, `TauCetiRoadmap/SmoothRepresentationsOfLocalGroupsPartII/README.md:422`, lines 542,580,606,868,894,1016,1028 | Weak containment and Fell closure, isolated summands, finite-product topology contract, generic/discrete/Steinberg/supercuspidal isolation. No invalid increasing-subsequence statement or unconditional real isolation is consumed. |
| #1037, `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:416`, line 446, line 644, line 662 | §§2.4–2.5,4.2–4.3: real modules/parameters, compact quotient decomposition and actual cuspidal/Whittaker realizations. Poincaré control and regular-real bounds are additional precise contracts. |
| #925, `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:3148`, line 3176, line 3196 | §§6.16,6.18–6.19: trace formula, pseudo-coefficients, Euler–Poincaré functions. Weight-sequence Plancherel density is explicitly added, not presumed from these alone. |
| #1006, `TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:1263`, lines 1818,2149,2453,3226 | AG2.2, AG2.5, AG2.6: attached Galois representations, full N, irreducibility premises and totally real descent. GSpin-valued Kret–Shin remains the separately named contract. |
| Main `TauCetiRoadmap/ClassFieldTheory/README.md:1054`, line 1576; `TauCetiRoadmap/ReductiveGroups/README.md:3029` | Brauer invariant, local reciprocity/Weil groups and Chevalley–Demazure groups; no duplicate G₂ LLC here. |
| Main `Completed/OrthogonalSpinGroups/README.md:408`, line 610; `Completed/Chebotarev/README.md:410`; `TauCetiRoadmap/GlobalQuadraticForms/README.md:693`, line 833, line 1066 | Algebraic spinor norms, density, Hasse/isometry/classification. General-field algebraic statements are not restricted by narrower analytic examples. |
| #1758, `TauCetiRoadmap/TwistedAutomorphicDescents/README.md:7`; #1404, `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md:11` | Closest other scope leads own orthogonal descent and unitary relative periods. Neither owns this G₂ correspondence or its PGSp₆ spin comparison. |

All fourteen gap slugs match between the README and `design/plan.json`; every gap names an earlier supplier. Their hypotheses and requested APIs were compared with the supplier statements. They do not ask again for native spin groups, Weil groups, triality or the supplied exceptional theta construction. Related clauses specify the needed API of one object. No gap is unowned, imprecise or redundant at the allowed suppliers. In particular, the global spin-pole converse genuinely extends the ℚ-only GS20 theorem, and the Poincaré contract explicitly carries the extra scope not proved in the cited ILM setting.

The checked slugs are: `spin-pole-global-converse`, `gln-generic-local-converse`, `so8-spinor-norm-twist`, `pgsp6-similitude-theta-tables`, `pgsp6-pgso8-complex-theta`, `pgsp6-pgso8-archimedean-generic-theta`, `pgsp6-similitude-rallis`, `pgsp6-shahidi-spin-factor`, `relative-generic-isolation`, `poincare-weak-containment`, `regular-real-unitarity`, `regular-real-isolation`, `automorphic-plancherel-density`, `kret-shin-gspin-galois`.

The prescribed dependency check returned exactly:

```text
depcheck: 236 roadmaps, 2147 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No banned supplier was used. No package input, merge-order file, library or tooling file was edited. The present findings require changes only through the separate fix worker.

## Not verifiable

- Griess, Theorem 1: its original text remains settled as uncertified/paywalled. It was not requested again. C and HKT's uses are secondary corroboration, not a claim to have read the original.
- Declaring the fourteen supplier gaps does not prove them. Their exact interfaces were reviewed; acceptance after repairs would remain conditional on their delivery. The proposed R01 contract would also need declaration and intake handling.
- GS leaves lower-tower constancy and some proper-Levi/twist details to the reader. The stated formulas, hypotheses and supplier interfaces were tested; a complete proof is not available at those source locators.
- Supplier-owned works such as Arthur's book and the Xu papers were not independently fetched. The cited roadmap statements were resolved at their allowed heads/main.
- No claim is made to have individually inspected every one of the 439 open pull requests. Ownership was checked through the supplied board index, indexed object searches, overlap data, relevant readable heads and closest scopes. Open work supplied only by name without a readable relevant file/head was not independently inspected.

No new missing-reference request was necessary. The report and `review.json` are the only package writes.

## Source issues

- **Gap** in GS at Proposition 4.1(i), proof, pp.18–19: the source says the cited globalization leaves every other finite component spherical; it should be supplemented by the stronger globalization or control of its extra finite factor; affects the proof.
- **Error** in GS at Main Theorem (vi), p.4: the source says the intermediate PGSp₆ representation is generic discrete series; it should be generic tempered, allowing Siegel-induced partners; affects a stated result.
- **Misprint** in GS at Main Theorem (ix), p.4: the source says the gamma expression ends before its tensor factor; it should be the gamma factor of the full tensor product with φ_τ; affects nothing.
- **Misprint** in GS at §3.1, p.10: the source says Theorem 2.1(i) supplies the dichotomy; it should be Theorem 2.1(ii); affects nothing.
- **Misprint** in GS at §3.3, p.11: the source says the totally definite octonion algebra is over F; it should be over the totally real field k; affects nothing.
- **Error** in GS at Proposition 3.2, proof, pp.14–15: the source says every centralizer in the discrete A₂ locus has order three; it should be μ₃ for non-self-dual data and S₃ for self-dual data, with a separate enhancement argument; affects the proof.
- **Misprint** in GS at §4.4, p.19: the source says the functional-equation comparison concerns representations of G₂(F); it should be PGSp₆(F); affects nothing.
- **Gap** in GS at Theorem 9.1(ii), p.27: the source says enhanced PGSp₆ compatibility holds for every irreducible G₂ representation; it should be restricted to the diamond discrete domain where that enhanced assignment has been constructed; affects a stated result.
- **Gap** in GS at Lemma 12.4, proof, p.37: the source says Shin Theorem 5.8 supplies spin-regular infinity weights; it should invoke the weight-sequence limit of Corollary 4.12 with an explicit growing spin-regular sequence; affects the proof.
- **Misprint** in HD at §15.1, p.52: the source says Theorem 15.1(v) supplies temperedness of the nonzero tempered lift; it should cite Theorem 15.1(iv); affects nothing.

These source issues are not additional package findings. The package separates the self-dual enhancement, corrects the intermediate codomain and enhanced domain, and explicitly provides the missing globalization interfaces. Neither R01 nor R02 is an error in the cited source theorem.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "cb452623bb7d31708c587bdd073f26a240e1f2a0", "job": "REV-PKG-LocalLanglandsCorrespondenceForG2~5", "model": "gpt-6-astra", "worker": "chris-9"} -->

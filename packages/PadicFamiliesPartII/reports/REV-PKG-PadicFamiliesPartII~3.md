<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12987#issuecomment-6782030650 -->
Review (codex) of 0119354

Verdict: needs_changes

1. **F01** (P1) Contravariance reverses the cohomological index

   **Location:** `packages/PadicFamiliesPartII/README.md:999`, §7.1b. Quotation: “its i-th cohomology sheaf is `VB⁰(HCS_{w,λ}(H^i(M)))`”. The amplitude quantifier immediately following this at line 1001 also needs its domain made explicit.

   **Claim:** Applying the exact contravariant coefficient functor F=VB⁰∘HCS to a bounded complex preserves its cohomological index.

   **Witness:** Take a nonzero trivial coefficient V and M=V[1]. Then H¹(F(M))=F(V)≠0, while F(H¹(M))=F(0)=0. The README's own shift convention, line 53, puts V[1] in degree −1.

   The contradiction occurs before supported global sections or slope extraction. An exact contravariant functor on cochain complexes reverses degrees: F(M)ⁱ=F(M⁻ⁱ), with the corresponding reversed differential. Thus Hⁱ(F(M))=F(H⁻ⁱ(M)). The cached source has the same index slip: BCGP25 Definition 4.6.35 and following paragraph, p. 88, lines 3949–3963. Its being printed in the source is not evidence for this formula.

   **Exact repair:** Replace Hⁱ(M) on the right by H⁻ⁱ(M), state the degree-reversing extension to complexes, and add shifted-coefficient Checks. Specify that item (1)'s unshifted bounds are for M in the BGG category in degree zero. If bounds for complexes are retained, for M supported in [a,b] use cuspidal bounds [−b,ℓ(w)−a] and full bounds [ℓ(w)−b,d−a]. Recheck the totalizations in §§7.5 and 8.3 with this convention.

   **Repair tested:** For M=V[1], i=1, the corrected right side F(H⁻¹(M)) is F(V), agreeing with the nonzero left side. For V[−1], the nonzero degree is −1; for M=0 both sides vanish. For modular-curve cuspidal w=1 and M=V[1], the corrected bound is [1,1], rather than [0,0].

2. **F02** (P2) A general-parabolic twist requires a Levi character

   **Location:** `packages/PadicFamiliesPartII/README.md:980`, §7.1a. Quotation: “a standard parabolic `Q ⊇ B` and `λ ∈ X^*(T)_E`”. The same ambiguity affects the integration claim in §7.1, line 961, where M already denotes the Shimura Levi.

   **Claim:** The stated stabilizer construction works for any torus weight λ and any standard Q, including weights that do not extend to the Levi of Q.

   **Witness:** For GL₂, Q=G and λ=ε₁, a scalar Lie action would give 0 on [e₁₂,e₂₁], but λ(diag(1,−1))=1. BCGP25 line 2502 instead assumes λ∈X*(M_Q)_E.

   Use the modular-curve datum P=B, w=1 and the trivial module of the torus 𝔪_w. It satisfies the stated λ-algebraicity condition because 0−ε₁ is integral. Nevertheless, the required scalar Q_e-action through its abelianization does not exist: its differential must kill the derived algebra. BCGP25 lines 2537–2543 require precisely this action; lines 2562–2566 construct it from the M_Q-character. A character of the Shimura Levi M is not automatically a character of M_Q.

   **Exact repair:** For general Q state λ∈X*(M_Q)_E and name its inflation through Q→M_Q→M_Q^ab. Distinguish this M_Q from the Shimura Levi throughout §7.1's integration assertion. Keep the Borel specialization at its full torus-weight generality, since M_B=T. Check that the parabolic character used in §8.3 lies in the required character space. Add the failed GL₂ input as a negative-control Check, alongside the Borel and determinant examples.

   **Repair tested:** At Q=GL₂, λ=ε₁ is excluded; λ=ε₁+ε₂ is admitted and gives 1−1=0 on diag(1,−1), as required for det. At Q=B, ε₁ remains allowed and its value on diag(p,1) is p. The zero coefficient still yields the zero sheaf.

3. **F03** (P2) The completed enveloping algebra already has an earlier owner

   **Location:** `packages/PadicFamiliesPartII/README.md:961`, §7.1, and the ownership assertion at line 11. Quotation: “Prove that `Û(𝔤)` is a Fréchet–Stein algebra”.

   **Claim:** This package owns the PBW-norm completion, its Fréchet–Stein structure and its coadmissible-module setup.

   **Witness:** `packages/LocallyAnalyticDistributionsPartII/README.md:248`–258, §2.5, defines the same inverse limit of PBW completions and supplies its Fréchet–Stein structure, noetherian stages, coadmissible modules and exact completion.

   This is a board package, not an unavailable or hypothetical roadmap: the board was searched as well as main and the indexed open heads. In `merge-order/ORDER.txt`, LocallyAnalyticDistributionsPartII is at line 199 and PadicFamiliesPartII at line 256. Its README line 34 identifies its 𝒰(𝔤) with BCGP25's Û(𝔤). This is the same mathematical object, not the distinct single-radius completed enveloping algebra. The other generic input, the BGG category, is also supplied by `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:760`, §4.2; the λ-coset restriction and the particular analytic realization can remain here as extensions.

   **Exact repair:** Import LocallyAnalyticDistributionsPartII §2.5 for the completion and the listed structural properties. Remove their independent construction/proof claims from §7.1 and the claim of exclusive ownership from Scope. Add the supplier contract and dependency, and cite LocallyAnalyticRepresentationsOfLocalGroups §4.2 for the underlying parabolic category O. Retain and distinguish the λ-algebraic subcategory, the required O-to-completed-O equivalence, and the Coleman coefficient functors. Do not introduce a second declaration of the imported completion.

   **Repair tested:** At 𝔤=0, both definitions give E. At 𝔤=E·x abelian, both give the series Σaₙxⁿ satisfying |aₙ|rⁿ→0 for every r, with norm |xⁿ|ᵣ=rⁿ. The completion of E[x]/(x−a) has fibre E in both descriptions. Importing §2.5 therefore supplies the exact carrier and operations consumed here, and the edge points to an earlier package.

4. **F04** (P2) The divisor trace factorization does not define its maps

   **Location:** `packages/PadicFamiliesPartII/README.md:741` and `:753`, §§5.3–5.4. Quotation: “with the determinant unit δ … the normalized restriction satisfies `U_{w,2} = γ₂ γ₁`”.

   **Claim:** This is a specified normalized coefficient correspondence. In fact γ₁ is only described as a trace, γ₂ is never defined, neither has a source or target, and δ's line-bundle domain is omitted. The coefficient specialization needed for this identity is not stated here.

   **Witness:** BCGP21 line 6206 gives γ₁:F_*L→L⊗A^(p−1); lines 6375–6394 give γ₂:F_*(L⊗A^(p−1))→L. Here L=ω²|D_w and A=ω_w|D_w; these are distinct coefficient sheaves.

   These are the scalar-weight-two maps of BCGP21 equations (5.6.6), p. 128, and (5.7.7), pp. 131–132. The source starts this specialization at line 6163 and repeats it at line 6335. The normalized determinant in Proposition 5.7.4, lines 6294–6307, is a line-bundle isomorphism; after restriction δ identifies A with F²*A, and its inverse is a section of A^(1−p²), not an unspecified scalar unit. The labels δ⁻¹ in the explanatory sentence at source lines 6306–6307 conflict with this direction; use the typed map of Proposition 5.7.4 and its actual inverse. The source's short notation γ₂γ₁ suppresses F_* on the first map; it does not define either map. The preceding general-weight operators in §5.1 do not determine these twists.

   **Exact repair:** In §§5.3–5.4 define L, A, γ₁ and γ₂ with the displayed domains and targets, in parallel scalar weight two. Define them by the Kodaira–Spencer/adjunction identifications, the normalized twisted dualizing trace with factor Norm(x_w)³/p³, and δ⁻¹ in γ₂, citing the two equations. State the sheaf correspondence as γ₂∘F_*γ₁:(F²)_*L→L; γ₂γ₁ may then denote its action on sections. Specify δ:p₂*ω_w→p₁*ω_w, its restriction A→F²*A, and its inverse F²*A→A; the inverse supplies the A^(1−p²) multiplier in γ₂. Retain the geometric finite-flat degree statements at their existing generality. Add an API and three discriminating Checks for these newly explicit maps, including their twists and trace normalization.

   **Repair tested:** At p=3, γ₁ lands in LA², F_*γ₁ lands in F_*(LA²), and γ₂ returns to L, so the composite is typed. The degrees are 9 and 9, giving 81=p⁴. The δ and δ⁻¹ multipliers have A-exponents 8 and −8, respectively; γ₂ requires −8. On the local Frobenius model k[x,y] in characteristic 3, the dualizing trace sends x²y² dx∧dy to dx∧dy; its iterated trace sends x⁸y⁸ dx∧dy to dx∧dy. Ordinary inseparable function trace is zero and is excluded by this test. A weight (4,2) coefficient has rank 3, whereas L has rank 1, so it cannot silently be substituted into the scalar-weight-two definition.

Four findings: one P1 and three P2. The package is repairable. The authored README, Lean file, metadata, source manifest and design were not changed. The source sample was readable; the prescribed Lean elaboration passed without warnings; the dependency check passed. These checks do not establish the false derived identity in R01.

### Verification of the previous review's repairs

Locations in this table are in `packages/PadicFamiliesPartII/README.md`. Each quotation is from the repaired package, not a source.

| Previous finding | Repaired passage and location | Verification and disposition |
| --- | --- | --- |
| R01: homology versus cohomology | §7.2, line 1026: “Lie algebra homology”; §7.5, line 1083: “`E ⊗^L_{U(𝔲_{P_w})} M`” | **Repaired.** On the standard GL₂ module, diag(2,1) acts on H₀,H₁ by 1,4, versus 2,1/2 on H⁰,H¹. BCGP25 line 1187 and line 2690 use homology; the corrected §7.5 keeps degrees −1,0. Searched the other occurrences in §§7.1, 7.4–7.6; the cohomology example in §7.1 is explicitly distinguished. |
| R02: infinitesimal character | §7.2, line 1025: “If M has infinitesimal character λ” | **Repaired.** At λ=0 the determinant module has horizontal central value −2, whereas the proposed factors have value 0; it is now excluded. At λ=(1,1), the value is −2 on both sides. Repeated characters are grouped into generalized factors. BCGP25 Corollary 3.5.4 and Remark 3.5.5, p. 57, lines 2638–2652, support the corrected hypothesis and locator. |
| R03: derived localization and VB | §7.2, line 1023: “`Loc(M) = RHom_{𝔤,∗₂}(M, C^la)`”; §7.4, line 1070: “`VB_red`” | **Repaired.** The CE model retains both one-dimensional homology groups for the trivial GL₂ coefficient. The derived invariants in §8.3 retain X in degrees 0 and 1. The gap now distinguishes derived VB_red from exact VB⁰ on the specified LB category. This correction does not excuse the separate derived-index error in the newly added §7.1b. |
| R04: missing full BGG-coefficient Coleman functor | §7.1b, line 999: “These functors are defined before any slope extraction.” | **Partly repaired.** §§7.1a–7.1b now construct the missing sheaves and full functors, with comparisons rather than definitions by finite slopes. For U=0 on E, full dimension is 1 and finite-slope dimension 0. However, the added general-parabolic domain and derived formula fail the tests in R01–R02 below. The original missing ownership is repaired; the replacement is not yet correct. |
| R05: BGG normalization | §6.4, line 892, and supplier contract, line 92: “`θ ∘ U = p^{k+1} U ∘ θ`” | **Repaired.** At k=3 the reflected lower bound is −3+4=1, not −3−4=−7; the H⁰ threshold is 4. AIP15 Proposition 7.2.3, p. 34, lines 1511–1521, and the proof on p. 35, lines 1538–1540, give this direction. The inconsistent supplier formula is now an explicit, matching plan/README gap. |
| R06: duplicated relative vanishing | §3.3, line 529: “For the canonical `Ω(k,r)` at `n = 0` that theorem asserts nothing” | **Repaired.** AutomorphicBundlesPartII §5.2 at open PR #1823, `TauCetiRoadmap/AutomorphicBundlesPartII/README.md:943`, gives subcanonical vanishing at n=0, but canonical vanishing only for n>0. The gap now asks for the mixed-level chart criterion, not this theorem. The identity morphism gives Rⁱ=0 for i>0; no canonical n=0 generalization is used. |
| R07: former design labels | Lines 17–49: “Former design numbering” | **Repaired.** All 31 mapping rows have destinations. In particular E6/four-pieces → §7.8, S7/sen-cousin → §8.4, F8/central-character → §9.7 and K2/euler-zero → §3.5. The citations in PR #1817, `TauCetiRoadmap/GSp4NonregularModularityLifting/README.md:129`, now resolve through the explicit mapping. |

No previous finding was marked “not actionable in this package”; none is being re-raised against such a disposition. R03 below verifies the separate duplication lead recorded by the repair worker.

## Verified sound

### Extent, principles and shape

Read all 64 numbered targets and their APIs, Checks, routes and dependencies, including every changed passage from the repair report. The compact table below records the seeded targets, headlines, changed targets and findings; a per-target scratch ledger records the remaining computations. Earlier numerical rows were reused only after checking their applicability to the unchanged statements. No blanket earlier “sound” summary was treated as a computation.

There are nine layers, nine Examples sections, nine Dependencies sections and 65 Checks blocks, including Conventions. Every numbered target has a Needs line and at least three Check bullets. The new functors have APIs and discriminating zero, twist, central-action, Verma and slope tests, but those tests missed R01–R02. The unnamed γ₂ construction needs the API/Checks described in R04. No source-order heading, claim to follow a source's organization, computational algorithm, copied source passage, forbidden supplier, upward edge, cycle, sorry'd data or set_option was found. Layers 4–6 are forced in their relative order by the mixed loci, coefficients, doubling and comparison dependencies; Layers 7–9 are forced by localization, the filtration and Sen comparison. The introduction states where PadicFamilies stops and imports the general higher Hida/Coleman theory; R03 is the remaining object-level duplication.

The README has the required headings and Unicode prose. Mathematical backticked notation such as HCS is notation, not a promised Lean identifier; no undeclared ASCII Lean API name attributed to this roadmap was found. There are no process dates, PR numbers, machine paths, HTML anchors or implementation instructions in the roadmap text. The historical numbering table is the required citation-preservation mapping. The shape was compared with main's `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md` and `TauCetiRoadmap/SchemeAndStackFoundations/README.md`.

### Source sample

All six works in References have one manifest entry with a legal cached text and a version convention. There are no author-flagged unverified locators. All fifteen seeded targets were checked against the text, including surrounding hypotheses. Page numbers below refer to the versions explicitly identified in References, not to journal pagination. No manifest entry was changed and no missing-reference request was needed.

| Target | Source text opened and locator | Hypotheses, normalization and outcome |
| --- | --- | --- |
| 1.4 Uniform progress | BPS Proposition 3.2.1, HAL p. 16, lines 726–734; Corollary 3.2.2, p. 17, lines 739–745 | Closed degree band avoiding an integer; positive uniform progress on its quasi-compact inverse image. A closed exhaustion is used, not quasi-compactness of a half-open band. |
| 2.6 Kassaei sums | BPS Definition 4.5.2, p. 27, lines 1170–1184; Lemmas 4.5.3–4.5.5, lines 1190–1223; Propositions 4.5.6–4.5.7, pp. 28–29, lines 1224–1265 | First-good decomposition, bounded path norms and q<1 give Cauchy differences. The fixed lattice loss is retained in A_N, rather than claiming every truncated expression is integral. |
| 3.3 Ordinary amplitude | P20 Lemma 8.2.1, p. 52, lines 2402–2416; Proposition 8.2.1, p. 53, lines 2427–2435 | Local finiteness uses k>p+1,r≥2; amplitude uses sufficiently large k. Global comparison is a quasi-isomorphism for r≥3, only H⁰ isomorphism/H¹ injection at r=2. The coefficient is subcanonical on the special fibre. |
| 3.4 Away Hecke | P20 Proposition 15.1.1, p. 106, lines 4844–4863 | Raw normalizations ℓ⁻³ and ℓ⁻⁶ agree with the weight-(k,2) comparison. The spin polynomial is imported with its named Satake convention; it is not rebuilt here. |
| 3.5 Euler characteristic | P20 Theorem 15.2.1, p. 107, lines 4867–4888; proof §15.2.5, p. 109, lines 5001–5008 | Absolutely irreducible residual localization and singular balance are retained. The package supplies the component-by-component argument; Euler zero is not upgraded to torsion. The sign correction in Proposition 15.2.4.1 agrees with k=−λ₁−1. |
| 4.3 Commuting U | BCGP21 §4.5, pp. 100–105; Lemmas 4.5.15–4.5.17, lines 5079–5128 | Commuting cohomological correspondences, compatible coefficient identifications and chain models; multi-place normalization is a product. The second Iwahori operator alone is not confused with the compact composite of §6.3. |
| 4.5 Hida complex | BCGP21 Theorem 4.6.1, pp. 105–106, lines 5131–5164 | Perfect complex and derived arithmetic specialization, with the partial ordinary level and torus stated. Ordinary Hⁱ tensored with a character does not replace derived base change. |
| 5.1 First operators | BCGP21 §§5.2–5.4, pp. 119–124, especially lines 5856–5898 | Any weight allowed in the construction; exponent is min(l_w+1,3). The two ordinary components give the two formulas for l_w≤2 and l_w≥2; they agree at l_w=2. |
| 5.4 Second operator | BCGP21 Lemma 5.7.2 and Proposition 5.7.3, p. 129, lines 6277–6284; Proposition 5.7.4, p. 130, lines 6294–6307; Proposition 5.7.9, p. 132, lines 6414–6421 | Interior degree p⁴ and F² description are supported. The coefficient maps in the final factorization are incomplete in the package: R04. |
| 5.8 Doubling injection | BCGP21 Theorem 5.8.6, p. 135, lines 6531–6545 | Scalar weight two, actual restriction maps and the companion action. The source does not need an added non-Eisenstein hypothesis for this injection. |
| 6.2 Mixed amplitude | BCGP21 Theorem 6.2.6, p. 145, lines 7049–7052; proof p. 146, lines 7055–7078 | Radius inequality inf(n_v)≥sup(n_ε), cube cover and cuspidal analytic coefficients give length |I|. The naive full Čech complex length is not the asserted bound. |
| 6.3 Compact mixed U | BCGP21 §6.3, pp. 147–152, lines 7188–7208, 7247, 7275–7326; Lemma 6.3.14, lines 7329–7345 | I-places and complementary places use their different composites and kernels. Radius improvement supplies compactness; the standalone second Iwahori operator is not asserted compact. |
| 8.4 Sen–Cousin | BCGP25 Theorem 4.10.12, p. 108, lines 4816–4819, with lines 4794–4809 | The scalar is nonzero, the singular coefficient and twists are fixed, and the assertion concerns the specified ordinary generalized block. |
| 9.1 Four modules | BCGP25 §7.3, p. 163, lines 7478–7490; BP26 convention imported through HigherHidaAndColemanTheory §4.5 | Cuspidal degrees 0,1 and canonical degrees 2,3; the package explicitly transports the negative-character family by inversion. |
| 9.4 Coleman specialization | BCGP25 Theorem 7.3.1(3), p. 164, lines 7507–7515 | κ_w(λ) is M-dominant, the E(−λ) twist and T(ℤ_p)-invariants remain, and the support degree depends on w. This is not unqualified specialization at arbitrary characters. |

For the added targets the primary checks were BCGP25 Definition 3.4.17 and Propositions 3.4.18–3.4.19, pp. 54–56, lines 2502–2589; Definition 4.6.35, p. 88, lines 3949–3963; Theorems 4.6.45, 4.6.56–4.6.58, pp. 93, 96, 98. The general-Q character restriction and the derived index are precisely the exceptions R02 and R01. The source's ordinary de Rham criterion in Theorem 4.12.4, lines 5068–5079, was also checked: the package retains its ordered ordinary setting, rather than claiming Hodge–Tate implies de Rham for arbitrary representations.

### Computed adversarial table

“Agrees” means the stated test agrees with the formula and its hypotheses, not that a finite example proves the general theorem. Empty sets, zero coefficients and identity maps were used where they belong to the specified carriers. Ramified PEL data, p=2 in the Hilbert layers, arbitrary noncompact groups, and equal-characteristic coefficient fields are outside those layers' explicit hypotheses; they are not silently used as examples of their theorems. Layer 9 does retain p=2.

| Statement(s) | Instances tried | Values on the two sides / competing definitions | Result; change |
| --- | --- | --- | --- |
| Conventions; §7.1b | V in degree 0; M=V[1] | H⁻¹(M)=V, H¹(M)=0; H¹(F(M))=F(V), stated F(H¹M)=0 | Fails; R01 changes i to −i. |
| §1.4 | d_i a_i=1, band [1/2,3/4], uniform increment 1/8; empty terminal band | Three increments total 3/8>1/4; N=3 leaves the band. If already at the target, N=0 suffices | Agrees with positive uniform increment and closed-band exhaustion. |
| §§2.1,2.5,2.8,2.9 | n=3,c=4,s=0,ε=1/8; Siegel weights (6,6),(3,3); elliptic weight 4 | Bad norm exponent 3−4(1−1/8)=−1/2<0; classicality bounds 3,0; elliptic bound 3. At c=3,s=0 the exponent 3ε>0 fails | Agrees; strict inequalities exclude the boundary. |
| §2.6 | Q₃ scalar bad action 3, good seed 1 | Partial sums 1,4,13; successive differences 3,9 have norms 1/3,1/9; limit −1/2. With fixed loss L, A_N=N−L→∞ | Agrees; normalized q=1/3 gives geometric convergence. |
| §3.3 | r=2 versus 3; two-affine special-fibre cover; identity pushforward | Čech degrees 0,1; i>1 groups 0. r=2 gives only the two endpoint assertions, r=3 a quasi-isomorphism; Rⁱid_*=0 for i>0 | Agrees; no global integral amplitude inferred. |
| §3.4 | Formal Satake identity test q=1,T₀=1,T₁=T₂=4; raw ℓ=2 | Spin polynomial 1−4X+6X²−4X³+X⁴=(1−X)⁴; raw scalar factors 1/8,1/64 | Agrees with supplier convention. q=1 tests the polynomial, not a residue field. |
| §3.5 | Complex [Λ→⁰Λ]; p=5 versus p=2 | Ranks 1−1=0, but both cohomology modules have rank 1. At p=5 there are four tame components; at p=2 averaging over {±1} requires 1/2, unavailable integrally | Agrees: Euler zero is weaker than torsion; all components retained. |
| §§4.1,4.3 | d=2, |I|=0,1,2; two scalar normalized operators | Torus ranks 4,3,2; p⁻²p⁻¹=p⁻³=p⁻¹p⁻² | Agrees; verifies product normalization, not the full geometric commutation proof. |
| §§4.4–4.5,4.7 | |I|=0,1; Λ=ℤ_p[[T]], complex [Λ→ᵀΛ] | Bounds [0,0],[0,1]. At T=0 derived fibre has H⁰=H¹=ℤ_p, whereas H⁰ before base change is 0 | Agrees; derived control cannot be replaced by underived H⁰ base change. |
| §4.6 | p=3, one or two complementary places; k[x,y]/(x²,y²) | Cover counts 4,16; p-factors 3,9. Quotient length 4, not (2−1)²+1=2 | Agrees with one-exponent-at-a-time dévissage. |
| §5.1 | l_w=1,2,3 | Normalizing exponents 2,3,3; ordinary decompositions pU_Iw+Z, U_Iw+Z, U_Iw+pZ | Both formulas coincide at l_w=2; agrees. |
| §§5.2–5.4 | p=3; Norm(x_w) of valuation 1 | Ambient F degree 27, divisor degree 9; F² degree 81. v_p(Norm³/p³)=3−3=0 | Geometry agrees; trace types need R04. |
| §§5.3–5.4 | L=ω², A=ω_w, p=3; Frobenius on k[x,y] | γ₁:F_*L→LA²; F_*γ₁→F_*(LA²); γ₂→L. Dualizing traces of x²y² and x⁸y⁸ give 1,1; ordinary function trace gives 0 | Missing defining laws and domains; R04. |
| §§5.5–5.6,5.8 | T=5,U₂=6,U_Iw=2,Z=3; vector (1,1) | 2²−5·2+6=0. C(1,1)=(11,−1); Δ(1,1)=4, ΔC(1,1)=8=U_IwΔ(1,1). For (2,3), C=(28,−2) | Companion/equivariance agrees; injection uses geometry, not an arbitrary same-space Δ. |
| §5.7, input to §5.8 | p=3,5; f=Ha_w g; nonzero divisor restriction | g has scalar exponent 3−p=0,−2, within Corollary 5.4.5's l_w≤0. In the other branch, αβ=1 gives restricted U₂f=f≠0, whereas Ha_w U_Iw f restricts to 0 | Agrees with BCGP21 lines 5953–5958 and 6487–6516; R04 supplies the typed diagram. |
| §5.8 headline | Distinguish source direct sum and target Iwahori space | An arbitrary map (x,y)↦x+3y on E² has kernel E(−3,1); the source theorem's actual geometric injection excludes this substitute | No stand-in is stated in Lean. |
| §5.9 | Roots 2,3 over residue characteristic 5; repeated root | Difference −1 is a unit, both roots nonzero; repeated difference 0 has no inverse | Agrees with residual distinctness and unit hypotheses; generalized blocks retained. |
| §6.2 | |I|=0,1,2 | Cubical models have 1; 2 vertices/1 edge; 4 vertices/4 edges/1 face. Lengths 0,1,2; naive four-open Čech length is 3 | Agrees with the cube amplitude. |
| §6.3 | Diagonal compact model on c₀(Q₃), e_n↦3ⁿe_n; identity model | Truncation tail norm 3⁻ᴺ→0 versus identity tail norm 1. Composite kernel exponents 1,2,3 sum to 6, trace factor p⁻⁶ | Agrees; radius improvement is essential. |
| §6.4 and normalization gap | k=3, θe=f, Ue=e, Uf=3⁻⁴f | θUe=f=3⁴Uθe; target slope −4 and twisted slope 0; bound −3+4=1, not −7 | Repaired normalization agrees. |
| §6.5 | P(X)=(X+1)², U=−1 | Q=−X−2; UQ(U)=(−1)(−1)=1. Dropping the linear coefficient produces 0 rather than 1 | Agrees with polynomial inverse. |
| §§6.6–6.7 headline | [E→ᵗE], t=0,1; defects a,b≥0 | Dimensions (1,1) versus (0,0), Euler characteristic 0 in both. χ(source)−χ(target)=−a−b=0 implies a=b=0 | Agrees; constancy of individual cohomology ranks is not claimed. |
| §7.1 completion | 𝔤=0 and E·x; E[x]/(x−a) | E on both definitions; norm rⁿ for xⁿ in both; quotient fibre E in both | Same object as earlier owner; R03. |
| §7.1a general Q | GL₂, Q=G, λ=ε₁; then λ=det; Q=B | Bracket [e₁₂,e₂₁]=diag(1,−1): scalar commutator 0 but ε₁ value 1; det value 0; Borel ε₁(diag(p,1))=p | Fails for allowed general-Q input; R02. |
| §7.1a central sign/twist | Torus coefficient ν=(1,1), z=I; twist ε₁ at diag(p,1) | ν(I)=2; horizontal scalar −2; twist factor p shifts slope by +1 | Agrees; compatible with §7.2's repaired infinitesimal character. |
| §7.1b full and finite slope | E with U=0; sl₂ Verma sequence | Dimensions 1 versus 0. s·0=−2; M(−2)→M(0) has one-dimensional quotient E; contravariance reverses triangle arrows | Full functor now owned; R01 remains for complexes. |
| §§7.2,7.5 | GL₂ standard module, t=diag(2,1); trivial coefficient | Homology weights give 1,4, cohomology gives 2,1/2. For trivial coefficient CE homology is E in degree 0 and 𝔲 in degree −1 | Repaired homology and derived localization agree. |
| §§7.5–7.6 | p+q=1; genus two p=0,q=3 and p=1,q=2 | First pairs (0,1),(1,0); shifted coherent degrees 0 and 1 in the genus-two examples | Agrees with retained total-degree convention, subject to R01's coefficient correction. |
| §7.8 headline | λ=(1,1;2), then central coordinate −2 | Four scalars −2,−2,−3,−3 sum to −10; then 0,0,−1,−1 sum to −2 | Agrees; repeated eigenvalues do not justify four eigenspaces without the filtration. |
| §§8.1–8.3 | κ=(1,1); N=[[0,1],[0,0]]; germ f=1/(1+x) | Serre-dual weight (2,2); degrees 2,3 dual to 0,1. N²=0, rank N=1. ((x+1)∂+1)f=−1/(1+x)+1/(1+x)=0 | Matches corrections; no blanket injectivity on all germs is used. |
| §8.4 | c=3 over Q₃, rank-one N; c=0 negative control | ker(cN)=ker N=Ee₁ and im(cN)=Ee₁; if c=0 kernel dimension jumps from 1 to 2 | Agrees with nonzero comparison scalar. |
| §§8.5–8.6 headline | Four pieces each bounded by n; ordinary semisimple versus Jordan Sen block | Sum 4n forces all four dimensions n. Semisimple repeated block has N=0; Jordan block has rank N=1 | Agrees with balance and the source's ordered ordinary de Rham criterion, not a general Hodge–Tate criterion. |
| §9.1 | Cuspidal/canonical degrees; order-three tame χ at p=7 | Degrees 0,1 versus 2,3. χ(t)=ζ, χ⁻¹(t)=ζ²≠ζ; inversion twice gives χ | Agrees; inversion cannot be dropped. |
| §9.2 headline | [E→⁰E] versus actual supported localized complexes | Amplitude alone permits dim H⁰=dim H¹=1; the extra non-Eisenstein support vanishing removes the unwanted 1 before projectivity | No inference of concentration from amplitude alone. |
| §§9.3–9.4 | ν=(0,−2), four Weyl representatives | Weights (5,3),(5,1),(2,−2),(0,−2), with degrees 0,1,2,3; χχ⁻¹=1 under the retained twist | Agrees with dictionary and specialization conventions. |
| §9.5 headline | Complementary lengths 0/3 and 1/2; κ=(5,3) | 0+3=1+2=3; dual weight (3−3,3−5)=(0,−2) | Agrees with duality, cuspidal/canonical interchange and inversion. |
| §9.6 headline | Regular F₃[C₃]-module | Coinvariants and invariants both dimension 1; norm [1]↦1+g+g² is nonzero, whereas augmentation of that invariant is 3=0 | Agrees; freeness/norm comparison does not use averaging by 1/3. |
| §9.7 headline | p=2,r=7; p=3,r=7 and r=11 | (7−1)/2=3 odd; 7≡1 mod3 excluded; (11−1)/2=5 prime to3 | Agrees with the separated congruence cases. |

### Library and ownership audit

Opened the cited native declarations at the pins. These are genuine carriers and operations, but they do not provide the geometric headline objects:

| Declaration and pinned file | What the opened declaration supplies / limitation |
| --- | --- |
| Module.End, `Mathlib/Algebra/Module/LinearMap/End.lean:33` | Alias for M→ₗ[R]M; no finite generation, topology or compactness is bundled. |
| LinearMap.prod and LinearMap.coprod, `Mathlib/LinearAlgebra/Prod.lean:95` and `:199` | Pairing and addition of linear maps, enough for the companion operator, not the geometric doubling map. |
| Module.End.genEigenspace, `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:72` | Generalized kernels of f−μ; not analytic finite-slope projectors. |
| Polynomial.aeval, `Mathlib/Algebra/Polynomial/AlgebraMap.lean:259` | Polynomial evaluation in an algebra; the inverse computation in §6.5 uses it without importing a new abstract polynomial API. |
| Module.Projective, `Mathlib/Algebra/Module/Projective.lean:71` | Splitting/lifting property; finite projectivity needs the separate finiteness hypothesis. |
| DerivedCategory, `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87` | Native abstract derived category, not completed cohomology or a Shimura coefficient complex. |
| LinearMap.eventually_isCompl_ker_pow_range_pow, `Mathlib/RingTheory/Artinian/Module.lean:307` | Artinian assumption at line 286 and Noetherian assumption on the theorem; neither can be dropped when using this Fitting decomposition. |
| TauCeti.VermaModule, `TauCeti/Algebra/Lie/HighestWeight/Verma.lean:195` | Quotient by vermaIdeal; variables at lines 140–146 require characteristic zero, finite dimension, nondegenerate Killing form, a Cartan and triangularizability. A reductive centre is not covered. The README states this limitation. |

The line adjacent to a declaration sometimes begins its doc comment; the README's native references all resolve to the stated declarations. Searches by object across pinned Mathlib and Tau Ceti found no PEL Iwahori moduli, partial Igusa coefficient complexes, supported higher Coleman cohomology or the completed Shimura tower needed to state these headlines. General algebraic geometry, Lie modules and generic derived categories do not supply those carriers through a few simple definitions.

Object searches used the roadmap tools over main and the indexed open heads, plus the board packages. The generic completion duplication is R03. The full BGG-coefficient Coleman sheaf/functor is not the algebraic/analytic-character finite-slope theory of HigherHidaAndColemanTheory; its placement here is justified, subject to R01–R02. AutomorphicBundlesPartII owns relative vanishing, PerfectoidShimuraVarieties the VB/Sen interface, and this package the particular supported cohomological applications.

The five closest open scopes were read: GSp4NonregularModularityLifting (#1817), AutomorphicBundlesPartII (#1823), OverconvergentAutomorphicForms (#1422), AlgebraicModularFormsAndSerreWeightsPartII (#1822), PerfectoidShimuraVarieties (#1085). The modularity consumer does not own the same four-module construction. Its additional horizontal-control contract is an outstanding consumer request, not evidence that this package has proved that stronger statement. The overlap index reports no competing head changing this roadmap, no dropped cited id and no dependency on numbering found only in an open revision. The historical design citations were checked separately as above. With no Lean declarations here, there is no fully qualified Lean-name collision.

### Suppliers, gaps and order

Resolved every named cross-roadmap section in Scope, Exact supplier contracts, Needs and layer Dependencies against the available main/head copy or the board package, then read the supplied statement. The two automatic unresolved leads are real earlier board packages: HigherHidaAndColemanTheory §9.6 and LocallyAnalyticRepresentationsOfLocalGroups §3.5. Neither is an absent prerequisite. The additional earlier owner discovered by the object audit is R03.

The principal resolved interfaces are:

| Supplier file, under TauCetiRoadmap unless marked packages | Sections resolved and distinction checked |
| --- | --- |
| `packages/HigherHidaAndColemanTheory/README.md` | §§1.1–1.2, 2.3, 3.7, 4.5–4.6, 4.8–4.9, 5.1–5.6, 5.8, 6.1–6.3, 6.6, 8.3, 8.5, 9.1, 9.4–9.8; finite-slope versus full theory and the normalization gap. |
| `PadicFamilies/README.md` | §§0a.22, 0a.25, 2a.15–2a.16; ordinary projectors and spectral charts, not the new singular coherent results. |
| `PELModuli/README.md`; `HodgeTateAndCanonicalSubgroups/README.md` | All numbered moduli/flag and canonical-subgroup references in the supplier block; the unprovided Hilbert–Siegel models, partial Igusa and frame torsor are explicitly gaps. |
| `ShimuraCompactifications/README.md`; `AutomorphicBundles/README.md` | The cited compactifications, boundary/refinement geometry and coefficient/trace sections, including §§11.16, 12.1, 12.11, 12.15 for coefficients; no source citation alone is substituted for a supplier. |
| `AutomorphicBundlesPartII/README.md:917`, `:942` | §§5.1–5.2; subcanonical chart criterion and relative vanishing, with n=0 distinction. |
| `AdicSpacesPartIII/README.md`; `SchemeAndStackFoundations/README.md:4265` | §§R2.10, R3.4, R3.6–R3.7 and §§2.19–2.20; bounded gluing and non-finite-flat fundamental classes have the stated gap contracts. |
| `SmoothRepresentationsOfLocalGroups/README.md`; `IntegralHeckeAndGaloisDeterminants/README.md` | §SR.4.5 and §3a.2; Satake/spin normalization. |
| `AutomorphicFormsOnReductiveGroups/README.md`; `EndoscopicTransferAndUnitaryTraceComparison/README.md` | §§6.4–6.6 and §11.1; multiplicities and transfer; the two singular balance/stability statements remain explicit contracts. |
| `CompletedCohomologyPartII/README.md`; `PerfectoidShimuraVarieties/README.md` | §§2.2, 6.7, 7.1, F.4 and the cited period-map, tube and boundary sections; the full solid VB/Sen interface remains gap:solid-vb-sen. |
| `PadicHodgeTheory/README.md`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md` | §4.4 and §R07.P7.2; the cyclotomic Sen value is +1 in both. |
| `ArithmeticGaloisRepresentations/README.md`; `AutomorphicGaloisRepresentations/README.md` | §§5.11, 7.6 and §1.1; the specified GSp₄ Eichler–Shimura relation is an explicit gap. |
| `PadicMeasuresIwasawaAlgebras/README.md`; `DeformationAndDerivedPatchingAlgebra/README.md` | §§1.1, 1.7 and §§5.9, 7.1, 7.3; Iwasawa carriers, residual amplitude detection and Sylow projectivity. |
| `LieHighestWeight/README.md`; `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md` | Layer 3 and §§3.5, 4.1, 4.6; highest weights, λ-smooth solid representations, Harish–Chandra and Kostant homology. R03 adds the missed §4.2 ownership citation. |
| `LocallyAnalyticDistributions/README.md`; `PadicLocalLanglandsForGL2Qp/README.md` | §§0.0, 0.3, 4.16 and §0.1; analytic duality, compact slope theory and coadmissibility. R03 identifies the precise completed-enveloping supplier. |

Checked all fifteen gap slugs against the top-level design gaps and README contracts: pel-iwahori-complements, hilbert-siegel-models, kodaira-spencer-isogeny, hilbert-siegel-partial-igusa, hilbert-siegel-frame-torsor, bounded-section-gluing, partial-hasse-regularity, mixed-cube-cover, tame-boundary-stabilizers, lci-fundamental-class, gsp4-singular-balance, gsp4-weight-two-stability, solid-vb-sen, gsp4-eichler-shimura, klingen-bgg-normalization. All have named earlier suppliers and matching slugs. Each requests one mathematical construction or interface with its necessary compatibilities; none has supplier “none”. The narrowed partial-Hasse contract avoids duplicating AutomorphicBundlesPartII §5.2. The solid VB contract distinguishes its categories and exactness hypotheses. The BGG contract fixes a known incompatible supplier normalization. Their future fulfillment is a contract, not an unowned prerequisite or a finding in this review.

The prescribed dependency check, run on this README with the supplied order, movable mode and content checkout, returned exit 0:

```text
depcheck: 236 roadmaps, 2156 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The proposed R03 supplier is also earlier in the recorded order. No merge-order file was edited.

### Headline coverage, elaboration and padding

The eight explicit end-theorem groups in Summary and their Lean treatment are:

| Headline | Suggested.lean coverage and missing native carrier |
| --- | --- |
| PEL small-slope classicality, §2.8, with §2.9 | Named in the module docstring; missing PEL Iwahori varieties, rigid coefficient sheaves and normalized geometric U. |
| Klingen Euler characteristic, §3.5 | Named; missing the Klingen Iwasawa coefficient complex and coherent cohomology. The deep intermediate amplitude §3.3 is also named. |
| Hilbert derived ordinary control, §4.7 | Named; missing Hilbert–Siegel moduli, partial Igusa tower and coefficient complex. |
| Weight-two doubling, §5.8 | Named; missing the geometric Hilbert–Siegel restriction spaces and correspondence. The arbitrary companion-operator identity is correctly excluded as a substitute. |
| One-place rational comparison, §6.7 | Named; missing both actual ordinary cohomology complexes and their restriction map. |
| Four-piece filtration, §7.8 | Named, together with §§7.5–7.7; missing completed tower, derived analytic localization and BGG-coefficient Coleman functors. |
| De Rham ordinary classicality, §8.6 | Named, together with Sen–Cousin §§8.4–8.5; missing the arithmetic Sen action on the actual completed cohomology and supported complexes. |
| Four projective Hida modules, §§9.2–9.7 | Named with specializations, duality and tame group-ring projectivity; missing universal supported Iwasawa complexes of Siegel threefolds. |

`packages/PadicFamiliesPartII/Suggested.lean` has exactly one import, Mathlib, the required module docstring and namespace, and zero declarations. The prescribed `lake env lean` invocation on its absolute filename, from the pinned content checkout, returned exit 0 and no output: no errors and no warnings, including no sorry warnings. No TauCeti object build was needed.

The all-declaration one-tactic probe has domain of size zero: there are no sorried theorems to replace by simp, rfl, infer_instance or a library exact. Likewise the requested #check @name pass has zero declarations; there are no implicit section hypotheses to lose and no signatures to change. No padding, sorry'd data, admitted example, stand-in predicate or absent statable headline was found. Native endomorphism identities in §5.6 are algebra on arbitrary inputs, not this roadmap's geometric headline, and rightly remain in the README. The short Lean file is appropriate despite the prose findings.

## Not verifiable

- No cited source was inaccessible; all fifteen sampled targets and the newly added source-dependent definitions were readable in the supplied legal cache.
- The fifteen declared supplier contracts are not implemented theorems checked by this package's Lean file. Their precision, ownership, locations and direction were checked; fulfillment remains conditional on the named suppliers, as permitted by the brief.
- There is no claim that Lean proves any of the geometric headlines: the file explicitly declares none because their carriers are absent. The successful elaboration certifies only that acceptance-file form.
- Ownership was checked against main, the supplied board packages and the tool's indexed open heads. No unavailable or unindexed open-PR content was assumed, and no proof of an entire source theorem is claimed from the finite adversarial tests.

## Source issues

The following includes the newly detected grading slip and the earlier source corrections whose numerical witnesses were retained or recomputed in this pass. No copied source passage is used.

- **Misprint** in BCGP21 at the paragraph after Proposition 5.7.4, printed page 130: the source labels A→F²*A and its positive-power section as δ⁻¹; it should label them δ; the inverse used in (5.7.7) has A-exponent 1−p²; affects nothing.
- **Misprint** in BCGP25 at Definition 4.6.35 and following paragraph, printed page 88: the source says exact contravariant coefficient realization has cohomology F(Hⁱ(M)); it should be F(H⁻ⁱ(M)), with reversed cochain degrees; affects a stated result.
- **Error** in BPS at Lemma 4.4.3, HAL printed page 24: the source treats the joint quotient map to X^k as finite étale; it should use the individual coordinate maps, since for k=2 the dimensions differ; affects the proof.
- **Gap** in BPS at Lemma 4.4.5, HAL printed page 25: the source multiplies a degree bound by a terminal weight without a sign condition; it should require nonnegative terminal minimum, which the later strict-slope region supplies; affects the proof.
- **Misprint** in P20 at Proposition 13.3.3.1, printed page 90: the source puts p^(−k−1)U on the reflected BGG term; it should put p^(k+1)U there, agreeing with AIP15 and the stated thresholds; affects a stated result.
- **Misprint** in BCGP21 at §6.4, printed page 154: the source's displayed intertwining raises standard slopes; it should lower them, with θU_source=p^mU_targetθ, agreeing with the following positive twist; affects a stated result.
- **Misprint** in P20 at Corollary 14.6.2, printed page 99: the source omits the linear coefficient from its continuation polynomial; it should retain that coefficient in −(P−P(0))/(XP(0)); affects the proof.
- **Misprint** in P20 at Proposition 15.2.4.1, printed page 109: the source requires a positive first singular coordinate; it should require a negative coordinate, since k=−λ₁−1≥0; affects a stated result.
- **Error** in BCGP21 at Lemma 3.8.5, printed page 58: the source claims the augmentation splitting for every finite group étale-locally; it should require invertible group order for that map, which fails on the characteristic-p regular module; affects the proof.
- **Gap** in BCGP21 at Proposition 4.6.19, printed pages 113–114: the source uses a simultaneous-powers short exact sequence for several parameters; it should vary one exponent at a time; two parameters at exponent two give lengths four versus two; affects the proof.
- **Gap** in BCGP21 at Theorem 6.6.4, printed page 167: the source applies the dimension comparison to full analytic groups; it should use the actual multiplicative-locus restriction defects, whose nonnegative sum vanishes; affects the proof.
- **Misprint** in BCGP25 at Remark 4.10.7, printed page 107: the source gives the degree-zero piece weight (1,1;−w); it should give (2,2;−w), matching Serre duality and the next subsection; affects a stated result.
- **Gap** in BCGP25 at Proposition 3.6.15, printed pages 66–67: the source invokes injectivity of (x+1)∂_x+1 on germs; it should exclude 1/(1+x) from the constrained fibre or establish nonvanishing there another way; affects the proof.
- **Misprint** in BCGP25 at the choice preceding Lemma 7.3.8, printed page 167: the source combines odd-prime and p=2 congruences simultaneously; it should separate the cases, permitting r=7 when p=2; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "0119354619540b1e75d9c1bed3ac69ebb8845862", "job": "REV-PKG-PadicFamiliesPartII~3", "model": "gpt-6-astra", "worker": "chris-32"} -->

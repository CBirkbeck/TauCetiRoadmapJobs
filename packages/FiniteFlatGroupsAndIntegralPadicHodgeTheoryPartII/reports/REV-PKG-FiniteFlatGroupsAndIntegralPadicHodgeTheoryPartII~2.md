<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1244#issuecomment-6396448329 -->
Review (codex) of e873ba6

Verdict: needs_changes

1. **F01** (P1) Ordinary translations use the supplier's opposite sign

   **Location.** `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md:1472`, with the supplier citation at line 1482 and its use at line 1487: “a lift of a σ-straight translation `t_{μ′}`”. Compare the positive valuation convention at line 36 and the GL₂ Check at line 1478.

   **Claim.** The translation and admissible set imported from ReductiveGroupsPartII §RG2.4.3 provide the positive-Hodge ordinary representative used in §§6.0–6.3.

   **Witness.** `TauCetiRoadmap/ReductiveGroupsPartII/README.md:5999` defines its translation through −λ under Kottwitz, represented by λ(p)⁻¹. For G_m, μ=1, it gives p⁻¹, with valuation −1; the package's ordinary multiplicative object has b=p, valuation 1.

   This is the new-roadmap head 1383569, not an older convention remembered from another source. The supplier explicitly records κ(t^λ)=−λ and ν_std(t^λ)=dom(−average(λ)) at lines 6018–6020; its admissible set at line 6141 uses those translations. Integral σ-conjugacy preserves valuation. Thus p cannot be normalized to this t¹. For this μ the imported admissible set excludes the intended ordinary class, making the normalization assertion vacuous on that class. In GL₂ the determinant valuations are likewise 1 for diag(p,1) and −1 for diag(p⁻¹,1). The latter does not even satisfy bW²⊂W². The package's inverse local-model label at line 30 does not repair the explicit positive μ in §6.0 and its Checks.

   **Exact repair.** Introduce the convention adapter before §6.0: t_here^λ=t_RG^(−λ), and Adm_here(μ)=Adm_RG(−μ), using the dominant representative of −μ when a dominant label is required. State how the same identification transports Frobenius, Bruhat order and length. Use these adapted labels consistently in §§6.0–6.6 and in the supplier contract; preserve κ(p)=1 and the existing Hodge convention. This imports the supplier's construction rather than rebuilding it.

   **Retest.** t_here¹=t_RG⁻¹ is represented by p, has κ=ν=1, and satisfies pW⊂pW⊂W. The adapted GL₂ representative is diag(p,1), with determinant valuation 1, Hodge rank 1 and slopes (1,0). Add both calculations as negative controls against the unadapted convention. KZ25 lines 1115–1176 supports the positive ordinary normalization used locally here.

2. **F02** (P2) Normal-section detection is already supplied by Part I

   **Location.** `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md:70`: “What SchemeAndStackFoundations must provide (gap:normal-base-integral-section-detection)”. It is consumed at line 646 and declared in `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/design/plan.json` under the same slug.

   **Claim.** Detection of s∈R inside R[1/p] by all finite-extension DVR points requires a new supplier gap.

   **Witness.** `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:4073` already states `deJongBoundedFormalFunctions`: for O-flat formally normal formal schemes in FS_O, formal functions equal analytic functions bounded by one at every rigid point.

   At the new-roadmap head 34f4657, FS_O at lines 4032–4037 includes formal variables and locally Noetherian formal schemes with reduction locally of finite type over k. For the gap's R, Spf R with its maximal-ideal topology is in that class: its reduction is a finite residue extension of k, it is O-flat, and it is formally normal. The function s∈R[1/p] is analytic on its generic fibre. Its values have norm at most one exactly when ξ(s)∈O_K for the continuous local O-maps in the gap. The supplier's isomorphism, including injectivity, therefore supplies precisely the requested assertion. This is a failure of the minimal-gap rule, not an objection to a gap merely being unimplemented.

   **Exact repair.** Remove this slug from the plan's top-level gaps list and from the README's gap declarations. Add Part I §R07.2.27, `deJongBoundedFormalFunctions`, to the exact contract and §2.6 Needs; record the Spf R specialization just explained. Retain the Witt-coordinate division argument in §2.6 as this roadmap's application. No other part of the accepted plan needs changing.

   **Retest.** On R=ℤ_p[[x]], s=x/p fails both formulations: x↦π with π²=p gives v_K(ξ(s))=−1. For s=1 both give an integral formal function with value of norm one at every point. This is also the package's existing discriminating Check at line 643.

3. **F03** (P2) The Lie(G) connection assertion needs restriction to the adapted locus

   **Location.** `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md:1334`: “Connection coefficients must lie in Lie(G)”; line 1336 constructs the connection in that Lie algebra. Line 1343 repeats the assertion for the universal application.

   **Claim.** The universal connection on the ambient A used to transport tensors has coefficients in Lie(G), before passage to A_G.

   **Witness.** Kisin17 line 4258 asserts this for ∇ on R_G; line 4269 explicitly restricts to A_G. For F(t)=(1+tE₂₁)diag(p,1), Frobenius horizontality forces N(0)=−E₂₁, outside the diagonal Lie algebra.

   Here R=W[[t]], φ(t)=t^p, Fil¹=Re₁, G is the diagonal torus cut out by E₁₁, and ∇=d+N(t)dt is the ambient ordinary two-term deformation connection. Horizontality reads dF+NF=Fφ(N)p t^(p−1)dt. At t=0 its right side is zero and dF/dt=pE₂₁, so N(0)diag(p,1)=−pE₂₁. In particular [N(0),E₁₁]=−E₂₁≠0. This calculation is compatible with the integral formal solution N(t)=−(Σ_{r≥0}t^(p^r−1))E₂₁. Over K₀[[t]], the horizontal transport of E₁₁ is E₁₁+h(t)E₂₁ with h(t)=Σ_{r≥0}t^(p^r)/p^r. Its linear coefficient is 1. It preserves Fil¹ exactly when h(t)=0, so its Fil⁰ ideal is (h(t))=(t). Thus the tensor-adapted quotient is t=0; there the pullback of dt is zero and the restricted connection has coefficients in Lie(G). Confusing these two connections would make the constant tensor horizontal on the whole ambient deformation space.

   **Exact repair.** In §5.10 construct and integrate the ambient connection in Lie(GL(D)). State separately that its restriction to R_G, in the tensor frame, has coefficients in Lie(G), using the Frobenius-stability hypothesis of Kisin17 E.1. In §5.11 use that restricted assertion to obtain σ_a restricted to A_G=s_a⊗1; retain the tangent-space argument for the reverse inclusion. Replace the current Check by the two-term computation above. Keep A′_G=A_G and the theorem's full generality.

   **Retest.** The repaired ambient assertion permits N(0)=−E₂₁. Restriction to t=0 gives zero connection form; E₁₁ is horizontal there. With no tensors, G=GL₂ and the ambient coefficient already belongs to Lie(GL₂), so A′_G=A remains correct.

Three findings: one P1 and two P2. The package is a repairable Part II extension. Its authored files were not changed. The empty acceptance-test file is permitted by the stated policy and elaborates successfully.

## Verified sound

The review read all 92 numbered targets, all 92 Needs lines, the seven layer dependency summaries, the conventions, supplier contracts, references, metadata, source manifest and acceptance-test file. It revisited all 13 previous findings, inspected all 15 seeded targets at their source locators, and resolved the supplier citations at the versions recorded below. The tables record computed tests, not claims that finite examples prove the general theorems. The source and dependency checks complement those tests.

### Previous findings, checked before the new pass

The quoted fragments in this table are from the repaired README, not copied source passages. “Repaired” concerns the particular earlier finding; it does not preclude a new defect found in the changed passage.

| Previous finding | Repaired passage and location | Status and verification |
| --- | --- | --- |
| F01, ownership of relative comparison | §5.5, line 1255: “Contravariant crystal evaluation” constructs the map; line 62 requests only relative ring constants. | Repaired. Étale and multiplicative factors give 1 and t respectively; invert t for the latter. Kisin17 lines 455–476. |
| F02, type-A and Dᴴ enlargement inputs | §3.15, line 929: “On W=V⊕V̄ use the alternating trace form”; §3.16, line 963, uses the different; §3.17, line 971, constructs the enlargement. | Repaired. Inverse-index dual chains are nested; same-index self-dual members need not be. Pairing and tame-different values are below. |
| F03, relative Frobenius and filtration | §5.2, line 1197: “Extend Witt Frobenius uniquely”; the construction distinguishes the PD ideal containing p from ker θ. | Repaired. For x=[p♭]−p, θ(x)=0 but θ(φ(x))=p^p−p≠0; divisibility belongs to the PD calculation. |
| F04, integral-section and flatness inputs | Lines 70–72: “Noetherian normal complete local domain” and “henselian local ring”; §2.6 specifies closed-fibre pointed maps. | Repaired as to exact hypotheses and independent statements. The new minimality defect is R02. The generic map ℤ_p→ℚ_p is not a valid pointed local detector. |
| F05, imprecise additional prerequisites | Lines 78, 90–108 split patching, purity, components and local-model geometry; §4.13 owns reduced lifting; line 118 states rational Hodge comparison. | Repaired. All 15 slugs match the plan and have named suppliers; the one already supplied gap is R02. |
| F06, empty Suggested.lean | Module lines 9–52: “None of the following headline theorems is statable at the pins.” | Settled, not actionable in this package. The repair report's policy reason is correct: the brief explicitly permits this form when the necessary carriers are absent. The pin audit below supports it. |
| F07, prose/style | §5.4 heading “Hyperspecial adapted lift”; module heading and text consistently use Breuil–Kisin and the required README distinction. | Repaired. No process-only concluding sentence or forbidden option remains. |
| F08, locator corrections | §1.4 cites “§7.3.1(2), pp.85–86”; §3.10 cites “Lemma 5.3.7(b) and Remark 5.3.8”; §4.12 cites “Theorem 7.1.3”. | Repaired. Also reopened the corrected locators in §§0.12, 1.5, 2.3, 3.11–3.12, 4.6–4.7 and the reference entry. See source table and source issues. |
| F09, target/dependency shape | Headings “2.0 Rational σ-centralizer” and “6.0 Ordinary integral σ-conjugacy normalization”; §6.0 now owns its Bruhat reduction subtargets. | Repaired as to numbering, ownership and Needs. No redundant layer dependency table or unused Tau Ceti continuity contract remains. R01 concerns the newly resolved supplier convention. |
| F10, claimed dual misprint and connection label | §5.14 retains the linear dual convention; §5.11 is “Equality of the horizontal Fil⁰ locus and the adapted locus”. | Repaired. Mixed tensors already include dual factors in Kisin17 lines 284–287. R03 is the separate ambient/restricted issue. |
| F11, PEL display ownership | Line 7: “PELModuli §M2.15 owns displays over W(R)”; this package specifies Ŵ(R) and all p-divisible groups. | Repaired. Supplier §M2.15 has the formal/nilpotent range, not this complete comparison. |
| F12, unnecessarily algebraically closed perfect-ring base | §0.5, line 209: “Over a perfect F_p-algebra R”. | Repaired. R=F_p gives (F,V)=(p,1); R=F_p×F_p permits projective ranks (0,1). |
| F13, extra neutral-closure hypothesis and wrong component | §3.5 requires goodness of the neutral closure; §2.4 uses “𝒢°” followed by component reduction. | Repaired. The hyperbolic GO₂ example separates the swap component from the neutral diagonal one. KPZ26 lines 2667–2672; KP18 lines 2127–2135. |

### Source sample and changed source-dependent assertions

All 15 seeded targets were read. No manifest entry is flagged as an unresolved author locator; RZ96 is the separately settled uncertified citation. Page numbers below are printed/source-version pages, not PDF page indices.

| Target | Locator read | Support and precise boundary |
| --- | --- | --- |
| 0.5 | Lau14 Lemma 2.4, p.2216, lines 639–655; vanHoften24 Example 2.2.10, p.14, lines 614–620; Zhu17 proof of Proposition 3.11, pp.461–463, lines 2408–2437 | Finite projective perfect-ring modules, integral V=pF⁻¹ and the converse. The latter two are the stated algebraically closed-base instances. |
| 1.2 | KPZ26 §5.1.8, Lemma 5.1.9, p.50, lines 2174–2186 | The enlarged-ideal comparison factors the tilde construction; the ring map here is the identity and the frame maps are strict. |
| 1.3 | KPZ26 Lemmas 5.1.11 and 5.1.15, pp.50–51, lines 2196–2255; (5.1.18), p.52, lines 2261–2281 | Canonical relative-frame construction and explicit lower-left divided Frobenius. The Frobenius square alone is insufficient after p-torsion base change. |
| 3.5 | KPZ26 §5.3.19, Proposition 5.3.20, pp.61–62, lines 2657–2699 | Smooth closure and goodness of the neutral embedding; equality of the relevant congruence kernels gives descent. No goodness assumption on both embeddings is required. |
| 3.6 | KPZ26 Lemma 5.3.7(a), p.55, lines 2407–2420 | A good direct summand inherits very-goodness by splitting the comparison. |
| 3.13 | KPZ26 Theorem 6.1.1, pp.62–65, lines 2703–2732 and its proof | Nonexceptional cases, R-smoothness, minuscule representations, derived-group and prime-to-p fundamental-group conditions are retained. The source's exclusions are not silently discarded. |
| 3.16 | KPZ26 Theorem 6.1.9, p.66, lines 2890–2917 | Similitude-compatible perfect pairings, trace/different normalization and dual chains. The repaired descent formula avoids the misprint at lines 2913–2914. |
| 3.17 | KPZ26 §6.2.8, Corollary 6.2.10, pp.69–70, lines 3040–3080 | Dᴴ enlargement and very-goodness of the resulting chains, including the specified central scalar action. |
| 4.4 | KZ25 Proposition 3.3.2, p.25, lines 1074–1097; KP18 Proposition 3.3.8, p.180, lines 2433–2456 | Integral crystalline/Witt tensors, Fil⁰ and tensor frames. The newer hypotheses are read from KZ25; the older KP18 theorem has the additional tame/no-E₈ setting. |
| 4.10 | KP18 Lemma 3.2.14 and (3.2.16), pp.174–175, lines 2217–2278 | Four equivalent infinitesimal conditions, with the torsion-free DVR coefficient requirement in the scaling argument. |
| 5.4 | Kisin17 §§1.1.8–1.1.9, pp.8–9, lines 349–385 | Hyperspecial adaptedness, crystalline tensors and the Hodge cocharacter; the PD evaluation ring is not identified with 𝔖. |
| 5.10 | Kisin17 E.1–E.3, p.96, lines 4253–4274 | The horizontal Fil⁰ locus and equality are supported. Lie(G) applies after restriction to R_G/A_G: R03. |
| 5.14 | Kisin17 Proposition 1.1.13 and (1.1.14), pp.9–10, lines 410–446 | Integral étale recognition with its specified tensor type. Mixed tensors include duals; the source is not asserting a wrong dual-Tate convention. |
| 6.3 | KZ25 Theorem 3.4.5, pp.27–28, lines 1189–1219; Zhou20 v2 §4.6, proof of Proposition 4.8, pp.14–15, lines 586–624 | The central modification and normalized E-factor specialize correctly. Its imported ordinary normalization still needs R01. |
| 6.5 | KZ25 §3.4.4 and Theorem 3.4.5, pp.27–28, lines 1183–1219 | All rational centralizer elements preserve the central filtration and act by quasi-isogenies; integrality of the element is not required. |

Additional repair readbacks: KPZ26 lines 2282 onward for display base change, 2412 and 2439 onward for repeated copies, 2347 onward for the very-good/Hoff comparison, 3191–3211 for versality, and 3790–3813 for the corrected rational Witt topology; Hoff23 lines 1338–1378 for reduced local-model lifting and universality; KP18 lines 2110–2138 for gluing and component reduction, 2170–2202 for integral tensors and flattening, and 2189 onward for the rigid section; deJong95 lines 2831–2838 and 2952–2967 for bounded functions; Anschuetz22 lines 1345–1391 for Proposition 10.3; Wintenberger97 lines 1610–1654 for the period-torsor class implication. RG71 I, Theorem 4.1.2, printed p.27, was read visually in the legally cached scan because the extraction did not recover that page's mathematics. Its henselian-local pointed flattening statement matches the repaired contract.

### Computed adversarial pass: conventions and domains

In the following tables W=W(k), ε²=0, E_ij is a matrix unit, and p>2 unless a rejected boundary is specified. “Pass” means the stated instance agrees and the listed wrong model is excluded; it does not certify an arbitrary unsampled proof. Rows mentioning R01 or R03 distinguish a sound local calculation from its defective global interface.

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| Hodge rank and quotient convention | (h,d)=(0,0),(1,0),(1,1),(2,1) | Fil¹ ranks 0,0,1,1; quotient ranks 0,1,0,1; each sum is h | Pass; d>h is outside the stated range, not natural-number subtraction. |
| Cartier dual/Tate twist | Étale and multiplicative lines | F multipliers 1,p; dual gives 1,p⁻¹, then twist −1 gives p,1 | Pass; agrees with Part I R07.2.10 and R07.4.25. |
| Hodge inverse and Frobenius | Ordinary ordered pair | μ₀(z)=diag(z⁻¹,1); σ(μ₀⁻¹)(p)=diag(p,1); Fil¹=ke₁ | Pass for this convention; translation adapter is separately R01. |
| E normalization | E=u−p; E(0)=ap | E(0)/p=−1 or a; c_E=pE/E(0) has c_E(0)=p in both cases | Pass; E alone has residual ap. |
| First-order coefficient quotient | p=aπ_E² | O_E/(m²+p)=O_E/(π_E²), with π_E≠0; O_E/(m²+π_E)=k, with π_E=0 | Pass; the common further quotient is essential. |
| Tensor variance | c=1+εE₂₁, s=id or E₁₁ | c id c⁻¹=id; cE₁₁c⁻¹=E₁₁+εE₂₁ | Pass; acting on the dual without inverse does not preserve evaluation. |
| Right quasi-isogeny action | g=[[1,1],[0,1]], h=[[1,0],[1,1]] | gh=[[2,1],[1,1]], hg=[[1,1],[1,2]]; T(q_h∘q_g)=(gh)ᵗ | Pass; this noncommutative example distinguishes left from right. |
| Positive Kottwitz and dual lattice | g=1,p,p⁻¹ on L | L,pL,p⁻¹L have κ=0,1,−1; their dual Tate lattices are T,p⁻¹T,pT | Pass; integral-unit restriction would lose two allowed cases. |
| Perfect coefficients and ranks | R=F_p×F_p; M=0×ℤ_p | Component ranks (0,1), F=(0,p), V=(0,1), FV=p on M | Pass; a global rank-one basis does not exist. |
| Empty and zero inputs | Empty tensor family; zero module; zero frame | Fixer GL_h; unique endomorphism of zero; tilde module zero and comparison unique | Pass. Numerical rank assertions expressly use nonzero coefficients. |
| Excluded coefficients | Equal-characteristic DVR F_p[[u]], imperfect F_p(t), p=2 in the complete-local display layers | p=0 is not an Eisenstein uniformizer; Frobenius on F_p(t) has t outside its image; the p>2 standing hypothesis excludes p=2 | Domain checks, not extensions of those assertions. At p=3 the stated wild type-A case remains included. |

### Computed adversarial pass: all numbered targets

Each row covers the indicated target's statement and its displayed formulas; the following API table separately tests operations and laws used by the definitions. The Checks and worked examples are evaluated against these same computations.

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| 0.1 Zink ring | k; k[ε]/ε²; W(k) | Ŵ(k)=W(k); a finite ε-tail tends to 0 but a constant nonzero ε-tail does not; char-p section into W(k) would give p=0 although p≠0 | Pass. |
| 0.2 Perfect-ring anti-equivalence | Rank 0; F=1,p,p² on W; disconnected R | V=0,p,1,p⁻¹ respectively; the last is not integral; component ranks (0,1) remain projective | Pass; height-one bound excludes F=p². |
| 0.3 Frame and strictness | I=(p) in W[[u]] | φ₁(pu)=u^p and pφ₁(pu)=pu^p=φ(pu); multiplying φ₁ by v≠1 changes φ₁(p) from 1 to v | Pass; strictness rejects the rescaling. |
| 0.4 Logarithmic coordinates | PD square-zero ideal; first two logarithmic coordinates | Extended inverse V sends [ε,0,…] to 0 and [0,ε,0,…] to [ε,0,…]; sum of first-coordinate ε vectors gives first-coordinate 2ε | Pass; zero map fails the second value. |
| 0.5 Height-one shtuka | F=1,p and M=0 | V=p,1 and 0; FV=VF=p on each module; F=p² gives p⁻¹ outside W | Pass; both directions and uniqueness use p-torsion-freeness. |
| 0.6 Frame pair | d=0,h; split rank two | M₁=IM or M; for M₁=Se₁⊕Ie₂, E₂₁(e₁)=e₂ has lower-left coefficient 1∉I | Pass; arbitrary module maps do not preserve the pair. |
| 0.7 Relative frame | Trivial PD kernel; square-zero kernel | With kernel 0 the frame is D_R; the extended inverse V kills logarithmic first coordinate ε and sends the second to ε | Pass; ordinary V⁻¹ alone has too small a domain. |
| 0.8 Invariant tilde | Split rank two; lower-left Vε | Upper-right coefficient 1 becomes p; lower-left Vε becomes ε; φ(Vε)=pε | Pass; the divided-Frobenius block rule respects composition. |
| 0.9 Strict base change | Identity; two quotient maps; mod-p map | Identity comparison I₂; composed comparisons I₂I₂=I₂; base-changed tilde has dimension 2 although the specialized j image has dimension 1 | Pass; do not replace base-changed tilde by an image. |
| 0.10 Pullback comparison j | Multiplicative, étale, ordinary | j=1,p,diag(1,p); modulo p its ranks are 1,0,1 while source dimensions are 1,1,2 | Pass; integral isomorphism is not asserted. |
| 0.11 Contravariant display | Ordinary pair, zero group | Ψ=I₂, Φ=diag(p,1), Fil¹ rank 1; zero has all modules 0 | Pass; group maps reverse direction. |
| 0.12 Display base change | R/m³→R/m²→k; ordinary constant matrix | Ψ specializes to I₂ at every level; both composite base changes give I₂ | Pass. |
| 0.13 Display/group comparison | Étale and multiplicative lines | (F,V)=(1,p),(p,1); dimensions 0,1 and heights 1,1; zero has height/dimension 0 | Pass; connected-only equivalence would omit the first line. |
| 1.1 Marked filtration deformation | h=0; (h,d)=(1,0),(1,1),(2,1) | d(h−d)=0,0,0,1; completed rings O,O,O,O[[t]] | Pass; marked graph e₁+te₂ has one independent parameter. |
| 1.2 Enlarged ideal factorization | Identity enlargement; square-zero graph | Identity comparison I₂; after enlarging by the kernel both graphs reduce to the same pair and tilde comparison I₂ | Pass; ring map stays the identity. |
| 1.3 Canonical first order c | ε²=0; pε=0 | c=I+εE₂₁, c⁻¹=I−εE₂₁, cc⁻¹=I; a p-multiplied square sees pε=0 for both c and I | Pass; square does not characterize c. |
| 1.4 Rational Witt section | Constant display; scalar lattice | Marked Frobenius section I; pⁿW is proper and intersection is 0; in W[1/p] the ideal (p) is the entire ring | Pass; lattice topology, not unit-ideal topology. |
| 1.5 Rigid first order | Ψ₀=I, c=I+εE₂₁ | Ψ=I−εE₂₁ yields Ψc=I; using Ψ=I yields I+εE₂₁≠I | Pass; reflex quotient retained. |
| 1.6 Section and tensors | Constant id and projector | I·id·I=id and I E₁₁ I=E₁₁; inverse transport gives the same values | Pass. |
| 1.7 Crystalline deformation | Dual numbers and ordinary Hodge line | Lifts Re₁→R(e₁+aεe₂) are indexed by a; each quotient has rank 1; a=0 and a=1 differ as marked lifts | Pass; locally PD-nilpotent hypothesis retained. |
| 1.8 Universal marked display | Ordinary and rank-one cases | Tangent dimensions 1 and 0 equal d(h−d); nonzero ε-graph is distinct from constant graph | Pass. |
| 2.0 Rational σ-centralizer | G_m,b=p; GL₂,diag(p,1); zero rank | J_b(Q_p)=Q_p×; off-diagonal equation gives v(x)=v(x)+1, hence x=0, leaving two Q_p× factors; rank zero gives {1} | Pass. |
| 2.1 Tensor datum | Empty family, id, E₁₁ | Fixers GL₂, GL₂, diagonal torus; [I+εE₂₁,E₁₁]=εE₂₁≠0 over nonreduced coefficients | Pass; geometric points alone do not impose the scheme equations. |
| 2.2 Filtration lattice | Fil=0, full, e₁ in rank two | F=E𝔖^h, 𝔖^h, 𝔖e₁⊕E𝔖e₂ respectively; E times ambient lies in each | Pass; E is nonzero in the coefficient domain. |
| 2.3 Completed orbit ring | GL₂ minuscule line | Local ring O[[t]], generic graph e₁+te₂, tangent dimension 1; global flag variety is P¹, not the completed affine chart | Pass. |
| 2.4 Tensor lattice torsor | Empty tensors, diagonal projector | Frames I and block-diagonal frames; induced component class 1 permits neutral reduction, while a nontrivial component class does not | Pass; only neutral purity is imported before extension of structure group. |
| 2.5 BK/tilde comparison | E=u−p at the PD specialization | θ(E)=0, φ(E) is p times a unit; constant reduction E(0)=−p gives divided Frobenius −1 | Pass; φ(E) itself is not a unit. |
| 2.6 Integral tensors/flatness | f=p,1; s=x/p; empty tensors | f/p=1 versus 1/p∉O_K; x↦π,π²=p gives valuation −1; GL_h flattening ideal 0 | Mathematics of tests passes; reuse Part I by R02. |
| 2.7 Tensor horizontality | id and E₁₁, c=I+εE₂₁ | Transport defects 0 and εE₂₁; inverse dual cancels on evaluation | Pass; the condition discriminates tensors. |
| 2.8 Parahoric display | GL₂ versus projector torus | Ambient graph parameter t is free; preserving E₁₁ forces off-diagonal t=0; first-order c differs by εE₂₁ | Pass; rationalizing away ε cannot test adaptedness. |
| 2.9 Adapted deformation | Empty family; multiplicative line; wrong integral tensor | Empty conditions impose 0 equations; multiplicative Fil¹=D; p⁻¹E₁₁ is not an integral tensor of the specified type | Pass. |
| 2.10 Very-goodness | Empty tensors and nontrivial projector transport | Empty family has defect 0; cE₁₁c⁻¹−E₁₁=εE₂₁≠0 | Pass; pointwise/all-points quantifiers are distinguished. |
| 2.11 Cutting-family independence | Add evaluation or E₂₂=1−E₁₁ | Evaluation defect 0; E₂₂ transport defect is minus that of E₁₁; both ideals cut the same fixer | Pass. |
| 2.12 Unramified detection | a∈F_p² outside F_p; faithful unramified base change | σ(a)=a^p≠a; a nonzero εE₂₁ remains nonzero after faithful flat extension; zero defect remains zero | Pass; φ* on coefficients cannot be dropped. |
| 2.13 Periodic chain embedding | One lattice; r repeated lattices; periodic rescaling | Total ranks h and rh; multiplication by p is matrix I between the lattice bases of Λ and pΛ | Pass; compare lattice bases, not ambient integrality of p⁻¹. |
| 3.1 Curvewise tensors | Filtration e₁ in S² | Modified lattice Se₁⊕pSe₂; E₁₁ preserves it and has diagonal matrix (1,0); zero filtration gives pS² | Pass. |
| 3.2 Endomorphism horizontality | Split projector and commuting comparison | Tilde projector diag(1,0); commuting c has c₁₂=c₂₁=0, hence cE₁₁c⁻¹−E₁₁=0 | Pass. |
| 3.3 Formal-curve comparison | u↦ε, lower-left graph Vε | Curve comparison and c both have lower-left ε; their difference is 0 | Pass. |
| 3.4 Products | Two rank-one factors | Projection tensors cut off-diagonal blocks to 0; product fixer has two scalar parameters, diagonal scalar subgroup only one | Pass; product is not a diagonal identification. |
| 3.5 Generic neutral closure | Hyperbolic GO₂ at odd p | diag(s,t): det=multiplier=st, ratio 1; swap: det=−1, multiplier=1, ratio −1; a comparison ≡1 has ratio 1 | Pass; generic connectedness alone does not prove smooth closure. |
| 3.6 Summand descent | Projector E₁₁ and c; zero second summand | cE₁₁=E₁₁c gives c₁₂=c₂₁=0; c₁₁ is a unit; zero summand leaves exactly c₁₁ | Pass. |
| 3.7 Curve-spanned tangent criterion | Node xy=0 | Axes have derivatives (1,0),(0,1), spanning dimension 2; the putative curve x=y=t gives xy=t²≠0 | Pass; spanning does not mean every vector is realized by one curve. |
| 3.8 Centralizer criterion | E₁₁ and I+εE₂₁ | Commutator εE₂₁ is nonzero; diagonal first-order comparisons give commutator 0 | Pass; negative control excludes arbitrary good embeddings. |
| 3.9 Arithmetic curves | t↦π, π²=p, modulo π² | t has first-jet coefficient 1; further residue specialization kills π and gives coefficient 0 | Pass; the specified first-order quotient matters. |
| 3.10 Isomorphic copies | Two identical representations with identity intertwiner | Product block scalars (a,b) commute with the intertwiner iff a=b; hence the diagonal, not arbitrary product, is cut out | Pass; unrelated summands are not asserted. |
| 3.11 Wild type A | Division algebra of index 3 over Q₃, m=1 | dim_Q₃ D=9; division-uniformizer valuation 1/3; endomorphisms commuting with right D are left D | Pass at residue characteristic dividing the index; m=0 is not a faithful realization. |
| 3.12 Determining segment | Add a periodic translate pΛ | New block rank h; scaling is I in the respective bases; original total is a direct summand | Pass; summand descent recovers the original representation. |
| 3.13 Nonexceptional chains | GL₂/GSp₂; index-3 type A at p=3 | Derived π₁=0 and flag tangent dimension 1 in the first case; 3 divides the division index in the second, violating NE | Pass; the excluded second case is handled by 3.11, not discarded. |
| 3.14 Dᴴ pairing | Quaternion i²=−1, j²=3; split symplectic plane | Balanced trace terms from i⊗1 and 1⊗i both give −2; reversing alternating arguments changes −2 to 2; plane values 1,−1 | Pass; zero multiplicity loses faithfulness. |
| 3.15 Type-A enlargement and chain | Split rank one, a=1; Λ_i=p⁻ⁱW | ψ(e,f)=−1, ψ(f,e)=1; inverse-index pair is p⁻ⁱWe⊕p⁻ⁱWf, dual indexed by −i; same-index pair p⁻¹We⊕pWf is incomparable with W² | Pass; paired-chain correction is necessary. |
| 3.16 Perfect pairing and different | L=Q_p(π),π²=p, M=πO_Le⊕O_Lf | M^Γ=pZ_pe⊕Z_pf; its dual Z_pe⊕p⁻¹Z_pf equals (δ⁻¹M♯)^Γ for δ=2π; omitting δ gives Z_p² | Pass; unramified/no-extension δ=1 recovers ordinary duality. |
| 3.17 Dᴴ enlargement | Two scalars; noncentral matrix; left/right D actions | diag(a,b) has multiplier ab; a noncentral block does not act by one scalar on cross-pairing; l(xd)=(lx)d but arbitrary right multiplication need not commute | Pass; centrality and the action side are substantive. |
| 4.1 Punctured exactness | Koszul maps (−u,p) and (p,u) | Composite −pu+up=0; last cokernel 𝔖/(p,u) is nonzero on the full disc and zero on D(p) and D(u) | Pass; no whole-ring exactness claimed. |
| 4.2 Galois Kottwitz | Rank-one crystalline character | Image in Z_p× has valuation 0; scalar p has valuation 1 and is not an automorphism of its integral Tate lattice | Pass. |
| 4.3 Integral tensor frames | Trivial GL torsor over strict henselian base | Identity frame I_h gives a section; its determinant is 1, not p | Pass; smooth torsor lifting is used with the stated residue assumptions. |
| 4.4 Integral crystalline/Witt comparison | Étale and multiplicative lines | L=Z_p and Z_p(−1); F=σ and pσ; Fil¹ ranks 0,1; omitted twist would give wrong F | Pass; same normalization as the supplier. |
| 4.5 Hodge filtration | b=diag(p,1), conjugate diag(1,p) | Hodge lines e₁ and e₂; both rank 1, but unequal in a fixed marking | Pass; unmarked generic conjugacy does not fix the special filtration. |
| 4.6 Rigid tensor section | c=I+εE₂₁ | Ψ=Ψ₀(I−εE₂₁) gives Ψc=Ψ₀; multiplying by a congruence element changes the lift but not its reduction | Pass; no unsupported uniqueness of the integral lift. |
| 4.7 Hoff compatibility | Opposite weight convention | Inversion changes weights (0,−1) to (0,1); lower-left ε term is carried to the same divided-Frobenius comparison after this adapter | Pass; forgetting inversion exchanges the Hodge summands. |
| 4.8 DVR tangent lifting | Lines e₁+aεe₂ | Each is a direct summand of rank 1 with rank-one quotient; a=0,1 give two distinct lifts | Pass. |
| 4.9 Interpolation | Endpoints a,b congruent mod π | b−a=πc; a+cT evaluates to a,b at T=0,π; endpoints (0,1) are not congruent and are outside the fibre product | Pass. |
| 4.10 Four criteria | DVR dual numbers; GL₂ and torus | Multiplication ε↦pⁿε has kernel 0 over O_K, but kills ε over k for n>0; tangent dimensions 1 and 0 match dim G/P | Pass with the DVR hypothesis. |
| 4.11 Point factorization | B=O[[T]], saturated ideal | T^m∈(T^n) iff m≥n, so intersection is 0; p-torsion-free B/I gives I=B∩I[1/p] | Pass; saturation is an independent necessary assumption. |
| 4.12 Versal adapted theorem | GL₂ and diagonal torus | Quotients O[[t]] and O with t↦0; E₁₁ transport has coefficient t, vanishing exactly on the latter | Pass under very-goodness. |
| 4.13 Universal parahoric display | O[[t]]→k[ε]/ε², t↦ε | ε≠0 is a real first-order deformation; every map k[ε]/ε²→O_K kills ε | Pass; lifting uses a reduced source, not DVR detection on the nonreduced test ring. |
| 4.14 Integral étale recognition | E₁₁ versus p⁻¹E₁₁ | First matrix lies in End(Z_p²), second has coefficient 1/p∉Z_p | Pass; the fixed integral tensor type is retained. |
| 5.1 Hyperspecial frames | Connected finite-field group; constant Z/2 | Lang torsor set has one element for the connected group; H¹(F_q,Z/2)=Z/2 | Pass; connectedness cannot be discarded. |
| 5.2 Relative periods | R=W(k), geometric cover; x=[p♭]−p | θ(x)=0; θ(φx)=p^p−p≠0; φx∈pA_cris; θ(p)=p≠0; φ(t)=pt | Pass; the cover is the completed geometric cover, not W(k) itself. |
| 5.3 Toral weak admissibility | δ=p, inverse cocharacter jump 1 | t_N=1=t_H; replacing the jump by 0 gives t_H=0≠1 | Pass; the inverse Hodge convention is necessary. |
| 5.4 Hyperspecial adapted lift | Ordinary pair and projector | F=diag(p,1); E₁₁ is φ-invariant under conjugation and has tensor weight 0; Fil¹ rank 1 | Pass; the PD ring and BK ring have different scalar maps. |
| 5.5 Relative comparison | Zero, étale, multiplicative, ordinary | Matrices 0,1,t,diag(t,1); inverses after t-inversion are 0,1,t⁻¹,diag(t⁻¹,1); θ(t)=0 excludes t a unit | Pass; owned here, not delegated to a later comparison roadmap. |
| 5.6 Cocharacter/double coset | Ordinary and permuted frame | h=1 gives diag(p,1); the permutation gives diag(1,p) and moves the Hodge line from e₁ to e₂ | Pass. |
| 5.7 Explicit height-one lift | E(0)=ap, E=u−p | c_E=E/a, c_E(0)=p; multiplicative −E specializes to p, étale factor 1 specializes to 1 | Pass. |
| 5.8 Connection integrality after φ-pullback | A coefficient with denominator p^r | Pullback differential gains p^n, giving p^(n−r), integral for n≥r; for n<r this test coefficient is nonintegral | Pass; this is not integrality before pullback. |
| 5.9 Correctly framed datum | b=1,p,diag(p,1),diag(1,p) | Inverse images of pD are pD,D,We₁⊕pWe₂,pWe₁⊕We₂; Hodge spaces 0,D,e₁,e₂ | Pass; independent simultaneous Hodge framing is excluded. |
| 5.10 Horizontal Fil⁰ locus | No tensors; ordinary torus example of R03 | Empty coefficient ideal 0 gives A′_G=A; N(0)=−E₂₁ has off-diagonal entry −1, whereas Lie(T) requires 0 | R03 for the connection Check and route; locus definition itself supported. |
| 5.11 Equality of loci | Same ordinary torus | A_G=K₀ at t=0 and A′_G has the same zero-dimensional formal locus; restricted connection form 0, ambient form has coefficient −E₂₁ | R03: distinguish restriction before using Lie(G). |
| 5.12 Smooth hyperspecial quotient | GL₂ and torus Hodge types | Relative dimensions 1 and 0; rings W[[t]] and W; flag dimensions 1 and 0 | Pass; proof route depends on repaired 5.10–5.11. |
| 5.13 Universal étale tensors | Connected versus disconnected test bases | One connected component has one locally constant integral type; two disconnected components can carry two types; empty tensors impose 0 equations | Pass; connectedness and fixed type are used. |
| 5.14 Hyperspecial recognition | Multiplicative line and evaluation tensor | L=Z_p(−1), evaluation=1, crystalline F=p; replacing L by the unshifted dual-Cartier Tate line gives F=1 | Pass. |
| 5.15 Geometric realization | Identity and projector from a given abelian family | Identity trace 2g on both realizations; projector satisfies E₁₁²=E₁₁ on both sides | Pass; the family and rational Hodge comparison are explicit inputs. |
| 5.16 Lattice specialization | g=1,p,ph with h integral unit | Crystal lattices W,pW,pW have κ=0,1,1; dual Tate lattice for g=p is p⁻¹T | Pass; representative changes by units do not change the coset. |
| 5.17 Isogenous adapted lift | Central scalar p, height h | Crystal lattice pD has index p^h; quasi-isogeny height h; rational inverse has height −h | Pass; no integral-unit restriction. |
| 5.18 Hodge bound/Kottwitz | G_m, b=p, g=g₀=p | g₀⁻¹bσ(g₀)=p; κ(g)=κ(g₀)=1; bound remains the slope-one bound | Pass. |
| 5.19 Quotient specialization | Identity quotient, g=p; frame unit h | Both quotient cosets pW×; changing frame by h gives phW×=pW× | Pass. |
| 6.0 Ordinary normalization | GL₂ μ=(1,0); G_m μ=1 | Intended straight lengths 1,2 and slopes (1,0); supplier t¹ has κ=−1 instead of required 1 | R01; sign adapter required before applying ordinary normalization. |
| 6.1 Ordinary datum | Ordinary and supersingular height two | Newton slopes (1,0) versus (1/2,1/2); Newton Levis torus versus GL₂; μ-average (1,0) distinguishes them | Local test passes; imported representative needs R01. |
| 6.2 Central filtration | M=G_m², λ=diag(z,1) | Every diagonal element preserves Ke₁; a lower unipotent sends e₁ to e₁+e₂ | Pass for the central Levi; needs corrected 6.0 normalization. |
| 6.3 Central BK lift | Ordinary pair, E=u−p | On F=𝔖e₁⊕E𝔖e₂ choose Θ=diag(1,−E⁻¹) in ambient coordinates; Θ(−E·id)=diag(−E,1), with residual diag(p,1); Θ at u=0 agrees with b/p on D₁ | Pass for this construction between the named lattices; its ordinary input needs R01. |
| 6.4 Ordinary existence | μ_{p∞}⊕Q_p/Z_p | Lift slopes (1,0), central filtration Ke₁, height 2 and dimension 1 | Pass locally; no very-goodness assumption is inserted into this explicit construction. |
| 6.5 Rational action | Central p,p⁻¹; two étale unipotents g,h | Heights h,−h; (gh)ᵗ=[[2,1],[1,1]] differs from (hg)ᵗ=[[1,1],[1,2]] | Pass; rational quasi-isogenies and right action retained. |
| 6.6 Specified nonordinary Levi | M=T inside GL₂ with its specified line | Adding E₁₁ cuts tangent dimension 1 to 0; forgetting that tensor gives the ambient adapted object | Pass as a conditional Levi theorem; filtration existence is not inferred from ordinary theory. |

### Definition/API law tests

These rows supplement the main target rows. They test equality, functoriality, inverses, scalar maps, representing conditions and the plausible wrong operations, rather than merely counting the Checks.

| Statement | Instance | Computed values | Result / change |
| --- | --- | --- | --- |
| 0.1 inclusion and reduction | Finite ε-tail | Its image retains coordinate ε≠0; reduction to k gives coordinate 0 | Inclusion injective in the test; reduction is not inclusion. |
| 0.1 inverse-limit identification | Compatible ε modulo mⁿ | At n=1 value 0, at every n≥2 value ε; reconstructed element ε | Agrees with completion; constant nondecaying tail remains excluded. |
| 0.1 inverse V, additivity, scalar law | Vε, Vη, scalar a | V⁻¹(Vε+Vη)=ε+η; V⁻¹(aVε)=φ(a)ε; φ(Vε)=pε | Matches the frame law; plain linearity would give aε. |
| 0.3 identity/composition of strict maps | Identity followed by quotient | φ₁(p)=1 before and after either composite; residue map sends u to its residue | Unit-rescaled φ₁(p)=v fails strictness. |
| 0.3 equality of frame data | Fixed I,φ,φ₁ | Both maps give φ₁(pu)=u^p; changing φ₁(p) from 1 to v changes the structure | The data, not proof fields, determine the frame. |
| 0.4 logarithmic addition and divided-power shift | Square-zero PD ideal | First-coordinate values ε+η and ε+η; shift of (ε,η,0,…) is (η,0,…) | The shift has its specified domain and is not arbitrary zero. |
| 0.6 source/quotient and normal decomposition | M₁=Se₁⊕Ie₂ | M/M₁=(S/I)e₂, rank 1; the split first summand has rank 1 | Filtration and quotient are different summands. |
| 0.6 pair morphism composition | Two lower-left coefficients in I | Lower-left block CA′+DC′ lies in I; taking C=1 when 1∉I fails | Pair-preserving maps form the claimed category. |
| 0.7 absolute/relative frame maps | Kernel b=0, then b=(ε) | First map is identity at b=0; with b=(ε), enlarged ideal adds ε and residue kills ε | Source and target of strict factorization agree. |
| 0.8 identity and composition | Identity; B=1,C′=Vε | Identity tilde I; the cross block uses pφ₁(Vε)=pε=φ(Vε) on both composition formulas | Divided block formula composes. |
| 0.8 independence of splitting | Change by I+V(ε)E₂₁ | Transition tilde I+εE₂₁, inverse I−εE₂₁, product I | Unmarked splitting choices are compared, not identified by fiat. |
| 0.9 base-change cocycle | Three identity/truncation maps | Comparison products I·I=I; ε maps ε then 0, equal to direct residue map 0 | Identity and transitivity hold in the test. |
| 0.10 naturality and rational inverse | Ordinary split module | j=diag(1,p), j⁻¹=diag(1,p⁻¹), jj⁻¹=I after inverting p | Reducing first would give diag(1,0), which has no inverse. |
| 0.11 recovery of Frobenius and display map | Ψ=I on ordinary pair | Φ=diag(p,1); F on first line p and second line 1 | Arbitrary Φ without Ψ's invertibility can fail height one. |
| 0.12 inverse systems of displays | Constant ordinary system | Every transition of Ψ is I₂ and limit Ψ is I₂; F stays diag(p,1) | Formation retains the marked integral lattice. |
| 1.1 representing maps | O[[t]]→O[ε]/ε² | t↦0 and t↦ε give distinct graphs e₁ and e₁+εe₂ | Represents marked filtrations, not their unmarked isomorphism class. |
| 1.2 factorization and cocycle | Two ideal enlargements | Both composite τ maps are I on a normal basis; forgotten graph ε maps to 0 in final residue | Ring/ideal changes are kept separate. |
| 1.3 naturality and inverse | ε↦aε | c becomes I+aεE₂₁ by both constructions; inverse I−aεE₂₁ | Fixes the coefficient and map direction. |
| 1.4 specialization and uniqueness normalization | Constant module, candidate 2I | I reduces to marked I; 2I reduces to 2I≠I over K₀ | “Frobenius-equivariant” alone would not determine the section. |
| 1.5 prescribed reduction | Ψ₀ and a congruence lift | Ψc=Ψ₀; Ψ reduced at origin is Ψ₀; a nontrivial constant multiple changes this value | Marking excludes the rescaled section. |
| 2.0 group operations and conjugacy transport | G_m; g=p,h=p⁻¹ | gh=1, g⁻¹=p⁻¹, σ(g)=g; for b′=x⁻¹bσ(x), transported centralizer element is x⁻¹gx | Direct substitution gives g′⁻¹b′σ(g′)=b′. |
| 2.1 base-change tensor equations | E₁₁ over W and W[ε]/ε² | Equations c₁₂=c₂₁=0 in both rings; ε fails them in the second | Exact scheme fixer, not reduced pointwise fixer. |
| 2.1 cutting-family replacement | E₁₁ versus E₁₁,E₂₂,id | New equations are negatives of old ones and 0=0 | Same tensor-frame torsor. |
| 2.2 quotient/base change | F=𝔖e₁⊕E𝔖e₂ | Ambient/F=(𝔖/E)e₂; reducing modulo E gives the chosen line e₁ | No arbitrary lattice with the same rank is substituted. |
| 2.3 special point and generic orbit | GL₂ graph coordinate | t=0 is e₁; generic t gives e₁+te₂; completion has one tangent coordinate | Origin is part of the marking. |
| 2.7 canonical tensor transport | E₁₁ versus identity | Defects εE₂₁ versus 0; mapping ε↦0 kills both | Horizontality is a real first-order condition. |
| 2.8 frame changes | Tensor-preserving diagonal h | hE₁₁h⁻¹=E₁₁; n=I+εE₂₁ gives E₁₁+εE₂₁ | Only allowed frame changes preserve the datum. |
| 2.9 identity/base-change of adaptedness | Identity point and faithful unramified extension | Defect 0 stays 0; defect εE₂₁ remains nonzero faithfully flat | Both directions of detection hold in this test. |
| 2.10 definition excludes wrong c | Replace c by I | For id tensor both defects 0; for E₁₁ actual defect εE₂₁, substitute defect 0 | Actual canonical comparison, not an arbitrary chosen identity, is required. |
| 2.13 periodicity and totalization | r=1,2; Λ↦pΛ | Total rank h,2h; periodic scalar changes the chosen lattice but not its abstract free rank | No out-of-range lattice index is used: indexing is integral and periodic. |
| 3.15 alternating form | Split e,f and vector e+f | ψ(e,f)=−1, ψ(f,e)=1, ψ(e+f,e+f)=0 | Symmetric sum would give −2 rather than 0 at odd p. |
| 3.15 scheme intersection | Product scalars with multipliers 1 and 2 at p=3 | Similitude equation 1=2 fails; common multiplier 1=1 passes | Intersection is a genuine equation, also after nilpotent base change. |
| 3.15 chain duality law | Λ′_i=p⁻ⁱW² | (Λ′_i)∨=p^iW²=Λ′_(−i); Λ′_0⊂Λ′_1 | Inverse indexing restores both inclusion and duality. |
| 3.17 scalar extension and action order | l,x,d in D | l(xd)=(lx)d; with noncommuting i,j, (xi)j=x(ij) differs from (xj)i=x(ji) by sign | The two actions are distinguished. |
| 4.6 rigid reduction versus uniqueness | Multiply a lift by 1+π_E A | Both reductions equal Ψ₀; lifts differ by π_E A if A≠0 | Only prescribed first-order reduction is asserted. |
| 4.9 interpolation endpoints and marking | a+cT, b=a+πc | At 0 get a; at π get b; both residues equal a mod π | Incompatible residues have no such marked interpolation. |
| 5.2 PD extension versus filtration | x∈ker θ; p | φ(x)=p((p−1)!γ_p(x)+y)∈J; θ(p)=p≠0 | J containing p permits extension; Fil¹ is not J. |
| 5.2 group/scalar functoriality | Period t and γ | φγ(t)=pχ(γ)t=γφ(t); compatible scalar maps send 1 to 1 and t to the specialized t | Frobenius/Galois compatibility has a value, not a free predicate. |
| 5.4 adaptedness excludes wrong filtration | Ordinary F and line e₂ | Intended Fil¹=e₁; e₂≠e₁ in the fixed marking | Crystalline frame and Hodge type must be tied to the lift. |
| 5.7 residual Frobenius law | Rank-one multiplicative factor | φ multiplier −E has residual p; E alone has residual −p | Normalizing constant is essential. |
| 5.9 independent cocharacter compatibility | Fixed b=diag(1,p), prescribed μ=diag(z,1) | Actual Hodge line e₂ differs from prescribed e₁ | Merely being in a double coset does not fix the marked line. |
| 5.10 locus representing property | Test algebra with parameter t | All Fil⁰ defect coefficients vanish iff their coefficient ideal maps to 0; empty family generates ideal 0 | Representing quotient is sound; R03 concerns its connection construction. |
| 5.13 integral type under specialization | Constant framed connected family | Specialized evaluation tensor is 1 at both points; projector remains integral with eigenvalues 1,0 | An arbitrary rational rescaling p⁻¹ is not the same integral type. |
| 5.16 lattice representative independence | g and gh, h∈G(W) | ghW^h=gW^h; g=p gives pW^h and index p^h | Right cosets and linear-dual action are fixed. |
| 5.17 marking and isogeny variance | Multiplication by p | D-map is p, inverse in isogeny category p⁻¹; composite 1 | Does not turn every rational map into an integral isomorphism. |
| 6.1 forgetful datum | Ordinary diagonal pair | Forgetting M leaves b=diag(p,1), Fil¹=e₁ and the same projector | Local compatibility passes after R01. |
| 6.3 modification map and specialization | F=𝔖e₁⊕E𝔖e₂, Θ=diag(1,−E⁻¹) | Θ(e₁)=e₁, Θ(Ee₂)=−e₂; Θc_E=diag(−E,1); at u=0 it is diag(p,1) | Θ is integral between the named lattices despite its ambient E⁻¹ coefficient. |

### Supplier gaps: declaration, precision and minimality

All 15 slugs occur both in the README exact contracts and the plan's top-level gaps array, with the same named owner. None has supplier `none`. The contracts remain conditional inputs; absence of their implementation is not treated as a finding. R02 is the single demonstrated redundant request. The following values test their boundaries and their uses.

| Gap slug | Owner and boundary tested | Computed values / outcome |
| --- | --- | --- |
| perfect-residue-bt-realization | Part I R07.4.20; perfect residue not finite | W(F_p(t)^perf)[1/p] is not finite over Q_p; rank-one height-one data still have F=p,V=1. The cited R07.4.20 explicitly says finite K/Q_p; the extension remains declared. |
| relative-crystalline-constants | PadicPeriodRings 4.3; absolute instance versus relative cover | In the absolute instance φ-fixed Fil⁰ constants are Q_p; φ(t)=pt≠t. No tensor-comparison assertion is hidden in the contract. |
| normal-base-integral-section-detection | SchemeAndStackFoundations 0.6 versus Part I R07.2.27 | x/p at x=π, π²=p has valuation −1 under both formulations. Already supplied: R02. |
| tensor-isomorphism-flatness-descent | SchemeAndStackFoundations 4.12; pointed local henselian flattening | For A=Z_p and X=Spec(A/p), flattening ideal is (p); a local injective detector cannot kill it. A→Q_p removes the closed fibre and is not such a detector. |
| formal-dvr-point-detection | SchemeAndStackFoundations 4.7–4.8 | T∈O[[T]] is detected at T=π; ε in k[ε]/ε² is killed by every DVR map; intersection of (T^n) is 0. Reducedness and ideal saturation have distinct roles in this single factorization input. |
| punctured-disc-torsor-patching | SchemeAndStackFoundations 1.15 | Trivial torsors with overlap cocycle 1 glue to the trivial torsor, with unique compatible identity; the closed point is still absent. Uses formal gluing on D(p), then Zariski descent. |
| full-fixer-cutting-tensors | ReductiveGroupsPartII RG2.3.5 | Empty tensors cut GL₂, E₁₁ cuts the torus, εE₂₁ violates its equations. Finite scheme-theoretic cutting and base change, not merely pointwise stabilizers. |
| parahoric-disc-purity | ReductiveGroupsPartII RG2.3.3 | Trivial G_m torsor extends to free rank-one O[[u]]; extension does not assert all residue-field torsors trivial. General perfect residue is retained. |
| full-fixer-component-reduction | ReductiveGroupsPartII RG2.3.3 | Component class 1 permits reduction; nontrivial class in a Z/2 torsor does not. Does not infer neutral reduction from connected generic fibre alone. |
| ordinary-levi-full-fixer | ReductiveGroupsPartII RG2.3.3 | Diagonal M in GL₂: M(K₀)∩GL₂(W)=diag(W×,W×)=M(W). Full fixer=connected parahoric is an explicit ambient hypothesis. |
| scheme-local-model-representative | GeometricSatakeAndFusion GS0 | GL₂ minuscule model P¹ has generic/special dimension 1 and reduced special fibre. A scheme representative and its normality are additional to the supplied v-sheaf. |
| scheme-local-model-hodge-immersion | GeometricSatakeAndFusion GS0 | Two copies of a rank-two Hodge representation have rank 4 and Hodge rank 2. Repetition and full-fixer cases are specified rather than assumed universally. |
| schubert-curve-spanned-tangents | GeometricSatakeAndFusion GS0 | Smooth one-dimensional cell has tangent dimension 1 from its coordinate curve; node control has two spanning axes but no t↦(t,t) curve. Prime-to-p fundamental group and no-Dᴴ restrictions remain explicit. |
| local-model-curve-spanned-tangents | GeometricSatakeAndFusion GS0 | GL₂ special-fibre flag P¹ has tangent dimension 1 at each point. General claim is restricted to the minimal stratum when Dᴴ occurs. |
| integral-hodge-realization-extension | ShimuraVarieties 7.0i | Identity tensor has trace 2g in both rational realizations; projector squares to itself in each. Despite its historical slug, the stated request is rational comparison only; integral extension is constructed locally here. |


### Pinned-library and object-ownership audit

The pins in `lake-manifest.json` are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Main is `63835771ae53669f03c706d3df5ed5605e046e3f`. The following declarations were opened at those pins; a scratch signature file was also elaborated successfully with the eight Mathlib names below.

| Pinned file and line | Declaration/content inspected | What it supplies and does not supply |
| --- | --- | --- |
| `Mathlib/RingTheory/WittVector/Defs.lean:52` | `WittVector` | Coefficient sequences with Witt operations; no Zink decay subring. |
| `Mathlib/RingTheory/WittVector/Frobenius.lean:218` | `WittVector.frobenius` | Ring homomorphism for a prime and commutative coefficient ring. |
| `Mathlib/RingTheory/WittVector/Frobenius.lean:283` | `WittVector.frobeniusEquiv` | Requires both `CharP R p` and `PerfectRing R p`; does not assert invertibility on arbitrary mixed-characteristic R. |
| `Mathlib/RingTheory/WittVector/Verschiebung.lean:109` | `WittVector.verschiebung`; coordinate/injectivity laws at lines 150,154 | Additive map with coordinate shift, not a ring equivalence or a Zink frame construction. |
| `Mathlib/RingTheory/WittVector/Isocrystal.lean:113` | `WittVector.Isocrystal` | Module structure with semilinear equivalence; finite dimensionality is not a field of the class. |
| `Mathlib/RingTheory/DividedPowers/Basic.lean:77` | `DividedPowers`, scalar field `DividedPowers.dpow_mul` at line 86 | Explicit ideal and membership in the scalar axiom. Does not construct a Fontaine envelope. |
| `Mathlib/RingTheory/Grassmannian.lean:66` | `Module.Grassmannian` | Submodule with finite projective quotient and quotient stalk rank k. It is not the scheme-valued represented Grassmannian, and k is the quotient rank. |
| `TauCeti/Algebra/AlgebraicGroup/Reductive/Over.lean:38` | Reductivity over a base | Smooth geometric reductivity predicate; no parahoric/full-fixer or local-model construction. |
| `TauCeti/RingTheory/WittVector/Frobenius.lean:60` | Frobenius continuity block, through line 79 | Retains the characteristic-p coefficient hypothesis. The repaired package no longer imports this unused contract. |

Searches in both pinned libraries used the objects, not proposed theorem names: p-divisible/Barsotti–Tate categories, Dieudonné displays, Zink rings, Breuil–Kisin modules, crystalline representations, integral tensor fixers, parahorics, Kottwitz maps and affine Grassmannians. Hits for ordinary Witt operations and rational isocrystals are the native APIs above; unrelated “weakly admissible” terminology and author names do not provide these carriers. No declaration in this package duplicates a fully qualified declaration from another Suggested.lean: it has zero declarations.

The board package index was read before ownership judgments. Authorized `roadmaps grep` searches covered the indexed open heads and main by display, Zink, very-good embedding, tensor deformation, normal bounded functions, relative crystalline constants, ordinary centralizer, local model and full-fixer objects. Relevant hits were opened, including Part I's bounded-functions target (R02), PEL's W(R) display theory, and the Drinfeld special O_D-linear deformation application in `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:4353`. That last target constructs its special moduli problem, not the general Zink/display or tensor deformation library here. The additional ordinary and period search hits concerned orbital-integral lifts or relative cohomology, not this central p-divisible lift.

The available board design `packages/GeometricSatakeAndFusionPartII/design/README.md:15` and its local-model discussion at line 130 separate scheme local-model/tangent geometry from displays and very-good embeddings. Those geometric objects are requested here from the earlier GS0 owner through declared contracts; no citation to the later Part II is inserted. This package is the owner of the tensor-display applications, not of a second scheme local model. The Lubin–Tate design's scope at `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/design/README.md:3` and LT.0–LT.6 list at line 37 supports the formal-module boundary; it is not a Needs edge.

### Resolved cross-roadmap contracts

For new-roadmap folders the listed open head was read; existing roadmaps were read on main, even when a revision pull request exists. All line numbers refer to their README files. Every row has path form `TauCetiRoadmap/<name>/README.md`. These are resolutions of the package's citations, not claims that the targets have already been implemented.

| Roadmap / version | Sections and actual locations inspected | Resolution |
| --- | --- | --- |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory / 34f4657 | R07.1.6–1.8 at 828–960; 1.22 at 1797; 2.10–2.12 at 3314–3391; 2.27 at 4029–4192 | Carriers, contravariant rank-one conventions, generic full faithfulness, smooth-base theory and bounded functions exist as planned targets. The last also supplies R02's gap. |
| Same | R07.3.2–3.3 at 4515–4626; 4.1 at 5345; 4.13 at 5895; 4.16–4.21 at 5994–6272; 4.25 at 6405–6434 | Weak admissibility, Kummer coefficients, tensor functor, height-one equivalence and dual-Tate integral comparisons. R07.4.20 explicitly retains finite K/Q_p, explaining its declared extension. |
| AbelianSchemesAndArithmeticModuli / 71ecc01 | A4.CR.7.2 at 2059–2184, particularly 2067–2113 and 2123–2144 | Crystal evaluation, dual twist −1, Hodge sequence and marked Grothendieck–Messing deformation theory. |
| CrystallineCohomology / 013a921 | CR.1 starts 601; CR.7.1 at 11177–11277 | Finite locally free coefficient evaluation, completed systems and connections with tensor/dual compatibility. |
| DerivedDeRhamCohomology / 83d00dd | PD.7 at 2735–2880; names at 2766–2769 and 2846–2858 | `Crystalline.fontaineEnvelope_initial` and `Crystalline.fontaineEnvelope_periodPDEnvelope` are present here. The two earlier resolver leads are not missing declarations. |
| PadicPeriodRings / 8839b29 | §3 at 333–356; §4.1 at 359–390; §4.3 at 412–432 | Absolute Fontaine envelope, Frobenius/action/filtration and fundamental identity. The relative constants extension is explicitly a gap. |
| SchemeAndStackFoundations / main | §0.6 at 678–757; §1.15 at 2502–2575; §2.3 at 3330–3363 | Reflexive/Hartogs and common geometric/fppf torsor carriers. These alone are not normal-section detection. |
| Same | §§4.1–4.4 at 5066–5243; §§4.7–4.8 at 5339–5447; §4.12 at 5613–5642 | Lifting, deformation/hull and completion statements exist. The local henselian pointed flattening result is a genuine additional contract; generic flattening is not substituted. |
| ModularCurves / main | §0G at 427–443 | Relative Grassmannian charts, gluing and universal quotient in its finite-free Hopf-algebra setting. For the fixed free module used here, the constant finite group has Hopf module O^h; quotient rank is h−d. No claim of a native represented Mathlib scheme is made. |
| ReductiveGroupsPartII / 1383569 | RG2.1.5 at 2446, positive torus Kottwitz at 2625; RG2.2.4 at 3615–3644 | π₁/Kottwitz and division-algebra chains are owned there. Positive valuation matches this package. |
| Same | RG2.3.3 at 4335–4367; RG2.3.5 at 4669–4780; RG2.3.7 at 5203–5215 | Connected parahoric/full-fixer distinction, lattice-chain/tame realization and Lang vanishing. |
| Same | RG2.4.3 at 5994–6021, 6104–6126, 6141 onward | Translations, length and admissible sets exist, but their negative-Kottwitz labels require R01. |
| GeometricSatakeAndFusion / 0652974 | GS0 at 824–851 and 946–966 | Witt components and intrinsic v-sheaf local models. The scheme/tangent extensions are the four named gaps. |
| VectorBundlesAndIsocrystals / c380d7d | VB0 at 228–251; VB4 at 2293–2304 | Finite tensor isocrystals and scheme tensor-functor reconstruction for the connected smooth affine group. Component reduction is separate. |
| PadicHodgeTheory / 4c4f1e8 | §5.5 at 1075–1131, particularly 1095,1105,1119 | General perfect-residue admissibility and period-torsor class. Rational neutrality does not supply an integral tensor frame. |
| ShimuraVarieties / d377db7 | §7.0i at 1868–1882 | Absolute Hodge tensors and rational complex-family realizations. The mixed-characteristic rational comparison is explicitly added as a gap; no integral moduli model is consumed. |
| PELModuli / e6a4fe8 | M2.15 at 2577–2623 | W(R) display/formal-group range supports the repaired ownership distinction. |

The dependency command specified in the brief was run with this README, this roadmap name, the supplied merge order and `--movable`. It exited 0 and returned exactly:

```text
depcheck: 50 roadmaps, 586 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The citation resolver also returned no unresolved roadmap/Lean-name citation; its external-library caveat was addressed by the direct pin reads above. The sign mismatch is mathematical supplier drift that the dependency graph cannot detect.

### Headline coverage and Lean acceptance test

`Suggested.lean` has one `import Mathlib`, one module docstring, the required namespace and no declarations. It has no sorry'd data, `set_option`, admitted example, API padding or weakened scalar substitute. The required `lake env lean` invocation was run on this file from the pinned content checkout: exit 0, no output and no warnings. There are no Tau Ceti imports needing targeted builds. There are zero authored signatures to inspect with `#check @name` and zero sorried theorems to subject to the one-tactic probe. The separate native-signature probe also exited 0 and confirmed the explicit typeclass requirements in the pin table; no package signature was changed.

The README's headline results and the module's corresponding carrier obstructions are:

| Headline / README targets | Missing carrier named by the module |
| --- | --- |
| Perfect-ring anti-equivalence, 0.2/0.5 | General p-divisible category and integral finite-projective Dieudonné category |
| Complete-local display anti-equivalence, 0.13 | Zink rings/frames/displays and crystalline group functor |
| Universal marked displays, 1.8 | Marked display deformation functor and formal base |
| Integral filtration and tilde tensor torsors, 2.4/2.6 | Integral fixer, filtration local model, tilde functor and tensor torsor |
| Formal/arithmetic curve criteria, 3.7/3.9 | Good Hodge embedding, local model and canonical first-order transport |
| Nonexceptional very-good chains, 3.13/3.16 | Parahoric models, Hodge embeddings and pointwise very-goodness |
| Dᴴ PEL/enlargement existence, 3.14/3.17 | Classical integral fixers and their tensor displays |
| Wild type-A/enlargement existence, 3.11/3.15 | Integral division-algebra chains, local models and displays |
| Integral crystalline comparison/étale recognition, 4.4/4.14 | Crystalline Galois lattices, Tate/crystalline realization and integral tensor type |
| Versal adapted deformation, 4.12 | Marked p-divisible deformations, very-goodness and local-model quotient |
| Universal marked parahoric display, 4.13 | Parahoric display category, local-model pair and tilde torsor |
| Hyperspecial tensor frames, 5.1 | Crystalline-lattice functor and integral tensor-isomorphism torsor |
| Explicit hyperspecial lifts, 5.7 | Height-one BK module, comparison and group realization |
| Frobenius-pullback connection integrality, 5.8 | Smooth-base crystals and their integral connection lattices |
| Toral weak admissibility, 5.3 | Filtered tensor G-isocrystals, cocharacters and Newton/admissibility structures |
| Horizontal/adapted equality and smooth quotient, 5.11/5.12 | Universal connection, transported tensors and both formal loci |
| Lattice specialization/Kottwitz equality, 5.16/5.18/5.19 | Integral BK family and reductive affine Grassmannian components |
| Admissible filtration realized by isogenous adapted lift, 5.17 | Filtered crystalline tensors, realization and integral comparison lattice |
| Ordinary integral σ-normalization, 6.0 | Parahoric affine Weyl action and ordinary G-isocrystal classes |
| Central ordinary lift and rational action, 6.3–6.5 | Newton-Levi modification, height-one realization and group isogeny category |
| Specified nonordinary Levi lift, 6.6 | Compatible Levi local model, very-good embedding and marked deformation functor |

These 21 headline groups are all identified in the module docstring. A finite-projective F,V predicate could itself be written with a few definitions, but would not state the headline anti-equivalence without the missing group category. Likewise a matrix normalization or an abstract connection identity would be a substitute for, rather than a statement of, the promised deformation theorem. No statable omitted headline was found.

### Shape and principles

The scope genuinely continues Part I and distinguishes the PEL and Lubin–Tate directions. The package retains wild standard type A, Dᴴ, nonconnected full fixers with their component steps, ramified reflex bases, arbitrary perfect residue where stated, and rational nonunit quasi-isogenies. It does not replace these by a convenient route-specific special case. No copied source passage, computational algorithm, process narrative, forbidden Lean import/option or duplicated native API block was found. Source-dependent proof inputs are named targets, resolved suppliers or declared gaps, subject to R01–R03. The seven layers each have Examples and Dependencies. Definition blocks have prose APIs and at least three Checks; theorem-only blocks need not repeat a definition's tests. The wrong-model calculations above check those tests rather than treating their presence as evidence of truth. The main-branch shapes of `TauCetiRoadmap/ComplexTori/README.md` and `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md` were read for comparison. Metadata is the single topic assignment `math.NT`; source entries use unique lifetime keys.

## Not verifiable

- RZ96, Proposition 1.21, remains the manifest's settled `uncertified` source. Its paywalled text was not opened, fetched again or placed in a new references request. The package cites the locator; the use in §5.3 was compared with Kisin17's surrounding argument. This limitation does not affect readability of any of the 15 seeded samples.
- The indexed board README reads for PELModuliPartII (head d4bb48d), PadicHodgeTheoryPartII (6502997) and CrystallineCohomologyPartII (84ea77e) returned HTTP 404. Their board-package contents could not be checked. No claim that these packages exist nowhere is made. The available geometric and Lubin–Tate designs, main and the indexed open roadmap heads were inspected as recorded above.

## Source issues

- **Gap** in KPZ26 at proof of Corollary 6.3.5, p.71, lines 3139–3144: the source says each paired lattice is self-dual and the collection is a chain; it should be a chain pairing Λ_i with the dual of Λ_(−i), preserving nesting and indexed duality; affects the proof.
- **Misprint** in KPZ26 at proof of Theorem 6.1.9, p.66, lines 2913–2914: the source says the lattice being dualized after invariants also has the inverse-power/different twist; it should be the original lattice (π^mΛ)^Γ, with dual (π^(−m)δ⁻¹Λ∨)^Γ; affects the proof.
- **Gap** in Zhu17 at §3.2, p.461, lines 2314–2345: the source says any double-coset representative b admits the independently prescribed μ-weight-one Hodge line; it should be a corresponding one-sided representative, or the marked cocharacter must be adjusted; affects a stated result.
- **Misprint** in Kisin17 at proof of Lemma 1.2.18, p.16, lines 708 and 718: the source says the rational comparison elements belong to G(O_L) and G(S); it should be G(L) and G(S[1/p]), retaining their integral right cosets; affects the proof.
- **Gap** in KZ25 at Proposition 3.3.4, p.25, lines 1106–1112: the source says integral étale tensors imply adaptedness without checking the preceding comparison's integral fixer hypotheses; it should be conditional on the fixed integral tensor type, including the required stabilizer model; affects a stated result.
- **Error** in KP18 at proof of Lemma 3.1.9, p.166: the source says a Frobenius square determines the first-order comparison, although it loses information after p-torsion base change; it should be constructed through relative-frame factorization; affects the proof; corrected in print at KPZ26 Lemma 5.1.15 and Remark 5.1.17, pp.51–52.
- **Gap** in KP18 at proof of Lemma 3.1.17, p.169: the source says the rationalized Zink construction converges in a topology for which that ring is not complete; it should be justified using the integral lattice's p-adic neighborhoods and logarithmic coordinates; affects the proof; corrected in print at KPZ26 §7.3.1(2), p.86.
- **Gap** in KP18 at §3.2.12, p.173: the source says a tensor-preserving rigid section exists without requiring tensor compatibility of the canonical first-order comparison; it should be conditional on very-goodness before constructing that section; affects a stated result; corrected in print at KPZ26 Definition 5.2.5 and §7.1.4, and KZ25 §3.2.5(C).

<!-- tauceti-roadmap-review {"agent": "codex", "head": "e873ba6ace6ebb6e514078125b8138475b57e1c6", "job": "REV-PKG-FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII~2", "model": "gpt-6-astra", "worker": "chris-7"} -->

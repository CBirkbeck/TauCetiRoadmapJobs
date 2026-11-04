<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1219#issuecomment-6629057412 -->
Red team round 2 pass b (claude) of 4d3145d

Verdict: needs_changes

1. **F01** (P3) ShimuraCompactifications is cited by section numbers that no longer exist at its head

   **Location.** `packages/GSp4NonregularModularityLifting/README.md` line 144: "C3, especially C3.9–C3.10; C5, especially C5.12 and C5.13–C5.18"; the same numbers at lines 297, 329, 628, 718, 769, 784, 913, and "ShimuraCompactifications C5" at line 649.

   **Claim.** The supplier's sections C3.9–C3.10 (fan compatibility, level maps, pullback and trace), C5.12 (logarithmic Kodaira–Spencer) and C5.13–C5.18 (integral genus-two models, the Hodge line and its positivity) exist under those labels.

   **Witness.** ShimuraCompactifications at its open head (#1053, read through the roadmap service, index of 2026-11-04) numbers its layers 0–8 with sections `n.m`; no heading starts with "C". The cited content is at "### 4.9 The boundary ideal along refinements", "### 4.10 Coherent cohomology does not depend on the cone system", "### 7.12 Logarithmic Kodaira–Spencer" and 7.13–7.18 (semiampleness of the Hodge line, finite generation of the Hodge section algebra, Fourier–Jacobi expansions, the integral minimal compactification, the Hodge line on it, quasi-projectivity at good primes). Level maps and toroidal Hecke correspondences are 4.2–4.3. The citation resolver reports the same four leads. The round-1 pass b found "C3.9" at an index of 2026-10-26, so the supplier renumbered since.

   **Repair.** Replace every "C3.9–C3.10" by "4.9–4.10", every "C5.12" by "7.12", every "C5.13–C5.18" by "7.13–7.18", the heading-level "C3" and "C5" at line 144 by "Layer 4" and "Layer 7", and "ShimuraCompactifications C5" at line 649 by "ShimuraCompactifications Layer 7". Since the contract text at line 144 attributes "toroidal level maps, pullback and unnormalized trace" to the Layer, write line 144 as: "Layer 4, especially 4.2–4.3 and 4.9–4.10; Layer 7, especially 7.12 and 7.13–7.18. Use the logarithmic Kodaira–Spencer isomorphism Sym²E≅Ω¹(log D) of 7.12 on the neat smooth toroidal model, …" (rest unchanged). Tested: after the substitution every cited number is a heading at #1053 (4.2, 4.3, 4.9, 4.10, 7.12–7.18 listed above) and `roadmaps resolve` has no ShimuraCompactifications lead left.

2. **F02** (P3) Two supplier subsections for one roadmap

   **Location.** `README.md` line 76 and line 124: both read "### From TauCetiRoadmap.ModularityAndLanglandsExtensions".

   **Claim.** Each supplier has one subsection under "Exact supplier contracts", where the intake reads its contract.

   **Witness.** `grep -n "^### From"` shows the heading twice; the first (lines 76–78) cites §§3.2, 3.9, 3.26, 3.30 and 3.5(vii), the second (lines 124–126) cites §§3.2, 3.9, 3.26 with the "GSp4ClassificationInputs" contract and the twisted weighted fundamental-lemma hypothesis. No other supplier heading is duplicated.

   **Repair.** Delete the heading at line 124 and append its paragraph (line 126) to the first subsection, after line 78, as: "With the “GSp4ClassificationInputs” contract, use the classification of GSp₄ packets and multiplicity bookkeeping with its full real-group components, central character and transfer normalization. Retain the specified twisted weighted fundamental-lemma/stabilization hypothesis wherever that source route assumes it; unitary classification alone does not establish the GSp₄ input." Tested: the merged subsection cites §§3.2, 3.5(vii), 3.9, 3.26 and 3.30, all headings at #1180 (lines 1683, 1793, 1883, 2230, 2337), and nothing else in the file refers to the second heading.

Two P3 findings (S01, S02). Every round-1 finding is repaired at this head and no repair introduced an error (table below). The head carries the package folder only (`git diff --stat origin/main...HEAD`: README, Suggested.lean, design/plan.json, metadata.toml, six reports, sources.toml).

## Round-1 findings at 4d3145d

| Id (review) | Status | Witness at this head |
| --- | --- | --- |
| a.F01 (P2) six-point model | repaired | `README.md` line 1218: "Import the six-point symplectic model and the S₆≅Sp₄(𝔽₂) identification from AbelianSchemesAndArithmeticModuli A3.12"; A3.12 exists at its head (#849, heading line 1742) with the even-subset model and the pairing (−1)^{|{i,j}∩{k,l}|}; ORDER line 48 < 260. |
| a.F02 (P2) residual pairing | repaired | line 677: "ModularityAndLanglandsExtensions §3.30 supplies a continuous semisimple residual GL₄ representation … and, when it is absolutely irreducible, its nondegenerate alternating pairing"; §3.30 at #1180 line 2337 states exactly this for a≥b≥2 with its unitary-descent hypotheses; new Check at line 688 (ε̄^(−12)=1 vs ε̄^(−4)≠1 at p=7) recomputed: ord ε̄ = 6, −4 ≢ 0 mod 6. |
| a.F03 (P2) paramodular contract | repaired | line 158: "irreducible admissible generic GSp₄(ℚ_ℓ)-representation … with unramified central character … at the Artin conductor … vanishes at smaller levels"; `design/plan.json` needs sentence identical (checked programmatically, all 20 slugs MATCH); three contract Checks at lines 162–164, the ramified control recomputed: χ(9)=χ(3)²=ζ₃²≠1. |
| a.F04 (P1) adic selector | repaired | line 380: "Over O the selected summand is the simultaneous residual-root factor … No identification with exact generalized eigenspaces on a characteristic-zero fiber is asserted"; Check at line 397 (ℤ₁₁, T=16: 11^(n!)→0, ker 11ⁿ=0) recomputed; Conventions line 17 and the two "generalized-root" phrases carry the same wording. |
| a.F05 (P1) theta self-edge | repaired | lines 765–767: three ordered local steps (ordinary-locus operators; pole cancellation and extension on a smooth formal base; injectivity via §3.1a); line 769 imports Gauss–Manin from A4.3 (exists, #849 line 1900, connection for a base smooth over a field) and logarithmic Kodaira–Spencer from ShimuraCompactifications (exists as 7.12 at #1053; the number cited is stale: S01). The *Needs* line 784 no longer names §4.2. Yam14 line 1235 does read D_ij=∂/∂t_ij ∈ Der(R) with R=Ô/m². |
| a.F06 (P1) crystalline supplier | repaired | line 66: AG2.6 "stated for good p-level and regular weight (a,b) with a≥b≥3 … Family continuation … is AutomorphicGaloisRepresentations §0.4"; §0.4 exists at #1007 line 830 with the `G_{F_v}`/`φ^{f_v}` version and Q(0) nonzerodivisor; §2.4 route line 501 verifies the hypotheses on a family; Check line 507 ((1,0,0) outside AG2.6) is correct since b=0<3. |
| a.F07 (P3) projector Checks | repaired | lines 985–987: 𝔽₁₁ roots (2,3,4,6): recomputed αδ=βγ=12≡1, blocks 6,8,7,2, R(6)=(−2)(−1)(4)=8, R(8)=R(7)=R(2)=0; 𝔽₁₃ (2,4,11,9): αδ=18≡5=βγ=44≡5, αβ=8=γδ=99≡8; diag products diag(1,0,0,0). The Q=∅ identity stays an API bullet (line 980). |
| a.F08 (P3) annihilator ring | repaired | line 667: "kernel Ann_T(ke₁)=0×k and selected image Tsel≅k … Jsel=Ann_Tsel(ke₁)=0 … Tsel=O acting on O/ϖᵐ: Jsel=ϖᵐO"; Layer 3 Example line 714 reworded the same way. |
| a.F09 (P3) p=7 witness | repaired | line 1210: p=11, a=4, λ=2: recomputed 5³=125≡4, ε̄(Frob₅)=5⁻¹=9, 9⁻³=5³=4=λ²; p=7: cubes in 𝔽₇^× are ±1 so no surjective r̄; gcd(a−1,p−1)=1 stated at line 1199. |
| a.F10 (P2) Frobenius convention | repaired | line 1199: "Since ν(r̄(σ))=ε̄(σ)^(1−a)=λ²≠1, ε̄(σ)≠1, and therefore q=ε̄(σ)⁻¹≢1 modulo p"; no other "q=ε̄(" in the file (grep). |
| a.F11 (P1) neighbour transport | repaired | line 874: reverse coset Δ∨={pM⁻¹}, reciprocity [P]∈F_Δ([Q]) iff [Q]∈F_Δ∨([P]), SL₂(ℤ/N) transport before the scalar recurrence; Check line 883 recomputed: det M=182−175=7; 7M⁻¹PM⁻ᵗ=(8456,−3255,1253)/7=(1208,−465,179), discriminant 930²−4·1208·179=−28, residues (3,0,4) vs Q≡(2,0,1); diag(3,2): (27,16)≡(2,1). |
| b.F01 (P3) empty locus | repaired | line 634: "On the compactified nonordinary divisor in odd characteristic the secondary section is a unit on the rank-one open and vanishes along the reduced supersingular curve to order two (its square root, of weight (p²−1)/2, vanishes to order one)"; "rank-one open of the supersingular" occurs nowhere (grep). |
| b.F02 (P3) A4 Check | repaired | line 1568: "At n=4, a seed whose r̄(c_v) is GL₄(k)-conjugate to (Ψ₄,1)j at every real place … fails A4 … One real place with r̄(c_v) conjugate to (1₄,1)j restores A4". |
| b.F03 (P3) §5.18 title | repaired | line 148: "§§5.9–5.10 and 5.18, “Pilloni genus-two convention comparison”". |

Repairs introduced no new error: the new Checks of a.F02, a.F03, a.F04, a.F07, a.F08, a.F09, a.F11 and b.F02 were recomputed above and agree with their sections; the new supplier edges (A3.12, A4.3, §3.30, §0.4) resolve at their heads with the hypotheses the README attributes to them; the gate output below shows no UPWARD or CYCLE line.

## Verified sound

**Read.** All 1683 lines of `README.md` and all 44 lines of `Suggested.lean`; `design/plan.json`, `sources.toml`, `metadata.toml`; the three round-1 reports; the repository README and CONTRIBUTING. Declarations read: 0 (the Lean file has a module docstring, the namespace and nothing else; the signature table is empty, no `#check` audit was possible, no padding, no sorry'd data, one `import Mathlib`, no `set_option`). Targets read: 61 numbered subsections, the Conventions, 24 supplier-contract blocks, 20 gap contracts, the Conditional theorem contracts, Downstream consumers and References. Check blocks: 66 with 224 bullets; 41 bullets or worked examples recomputed with values (table below). Source locators opened this round: 31 (CG20 12, BCGP25 13, Tho17 2, Yam14 4, P12 3, M14 1), each naming the cited statement. Sibling citations resolved at the current copy: 10 roadmaps (ShimuraCompactifications #1053, LocalGaloisDeformationRings #923, ModularityAndLanglandsExtensions #1180, AbelianSchemesAndArithmeticModuli #849, AutomorphicGaloisRepresentations #1007, IntegralHeckeAndGaloisDeterminants #1689; board designs on the board's main for OrdinaryAutomorphicFormsAndModularityLiftingPartII, AutomorphicBundlesPartII, PadicFamiliesPartII, PotentialAutomorphyInfrastructurePartII), 47 section or layer citations, all present except the ShimuraCompactifications numbers of S01. The resolver's two Lean-name leads (`GSp4.MinimalAt`, `GSp4.SiegelOrdinary`) are LocalGaloisDeformationRings' own names (its README lines 2087, 3155), cited as such; neither is a name of this roadmap.

**Headline theorems.** §8.2–8.3 (minimal R=T, positive cuspidal freeness), §8.5 (classical weight-(a,2) modularity), §9.2–9.4 (variable-weight ordinary R=T, p-adic and parabolic lifting), §10.7 (local freeness), §11.5–11.6 (four-chamber rank one, classical weight-two lifting). None is statable at the pins: Tau Ceti `a91d3aa` has no Siegel modular forms, GSp₄-valued Galois representations, pseudocharacters or Hida modules (grep of `TauCeti/**` for Siegel, GSp4, GSp₄, Hida, Pseudocharacter: two unrelated hits), and Mathlib `6b7abb3` has `Matrix.symplecticGroup` but no automorphic or Galois carrier. The docstring names every headline and the carrier it lacks. The only elementary statable statement (S₆≅Sp₄(𝔽₂) on `Equiv.Perm (Fin 6)` and `Matrix.symplecticGroup (Fin 2) (ZMod 2)`) is now an imported illustration (A3.12), so its absence is right.

**Gaps.** `plan.json` lists 20 gaps, each with a named supplier and section; the README has the same 20 slugs (2–11 occurrences each), each stated once as "What <Supplier> must provide (gap:<slug>): …" with a `needs` sentence byte-identical to the plan (checked programmatically). Each `needs` names one object with its hypotheses. None asks for what a pin or an earlier roadmap provides: IntegralHeckeAndGaloisDeterminants §1.5 `symplectic_coefficient_descent` still carries `p > 2` (#1689 line 2534); AutomorphicGaloisRepresentations §0.4 supplies continuation, not the GSp₄ family; the two OrdinaryAutomorphicFormsAndModularityLiftingPartII gaps name sections 1.3, 2.1–2.2, 3.1–3.2, 4.7–4.8, 5.2, 5.4–5.6, 6.3–6.4, all headings of the accepted design on the board's main (review status "accepted", 2026-10-26; the branch checkout carries only its reports folder, the design is on `origin/main`), with q_v≡1 mod 9 at p=3 (its lines 595, 634) and the six hypotheses of BCGP25 Theorem 5.7.14 (BCGP25 lines 6092–6102). The two rulings "not actionable in this package" (round-2 F04: selected rank belongs to AutomorphicBundlesPartII IC.8; round-3 F03: supplier admission and merge order) stand; IC.8 is now the declared gap `selected-coherent-rank-inequality` and the design is accepted on the board's main.

**Supply direction.** Complete gate output, exit 0:

```text
depcheck: 205 roadmaps, 1768 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Supplier positions in ORDER.txt: SmoothRepresentationsOfLocalGroups 27, IntegralHeckeAndGaloisDeterminants 29, AbelianSchemesAndArithmeticModuli 48, LocalGaloisDeformationRings 88, ShimuraCompactifications 177, AutomorphicGaloisRepresentations 184, ModularityAndLanglandsExtensions 255; this roadmap 260; its consumer AbelianSurfacesModularity 261 (its open head cites "GSp4NonregularModularityLifting NR2.5–NR2.6 and NR11.2–NR11.6" and declares two gaps on this roadmap); AlgebraicModularFormsAndSerreWeightsPartII 276 (later, not cited).

**Source passages checked this round against README claims.** CG20 Assumption 4.1 H1–H3 (lines 519–526) match §0.3's three image conditions; Assumption 4.2 and the surjectivity remark (529–536) match §8.3; Assumption 4.3 and Remark 4.4 (537–592): "r|I_x can never be of type P" under a cyclotomic multiplier, as §0.3 states; Definition 4.6 (616–642) matches §5.2's conditions (inverse scalar inertia on the two Q-planes, split unramified plane at p); Definition 6.15 (1758–1764) matches §1.3's eigenvalue equations and takes η in the canonical space, as §1.3 records; Theorem 7.2 (1843–1855): R_x, the ideal generators and the misprinted R′_x, as §6.1 states; Lemma 8.3 (2273–2289): a(UF;Q)=a(F;pQ), the Z sum over integral determinant-p representatives with M·Q=det(M)⁻¹MQMᵗ (2880), as §4.1; §8.8 (2860–2868): ZF=βF+β⁻¹X₂F, F−X₂F in ker Θ, Z₂F=0, as §§4.6–4.7; Theorem 9.1 and proof (2999–3078): R∞=O[[x₁,…,x_{q−1}]], Δ≅(ℤ/pᴺ)^q, (H_N)_Δ=H, balance by Theorem 7.11, as §§8.1–8.2. BCGP25 Theorem 1.8.17 (641–659): p split completely, ν=ε⁻¹, (1.8.18) with |ν|^{−3/2}, diagonal (α,β,β⁻¹ε⁻¹,α⁻¹ε⁻¹), as §2.5; Lemma 4.12.1 (5020–5029): entries 3–4 printed with a double inverse, as §2.7 corrects; Lemma 4.12.3 (5046–5053) and V=H³(…) (5041), as §2.8; Theorem 5.7.14 (6088–6102), Hypothesis 6.3.1 (6628–6641), Definition 7.1.1 (6927–6932), Hypothesis 7.1.3(7)–(8) (6968–6969), Definition 7.4.1 (7683–7690: r>5, the misprinted congruence, ρ unramified, ordered roots), Lemma 7.4.7 (7768), Definition 7.5.7 (8091–8095), Lemma 7.5.8 (8096–8098), Proposition 7.5.10 (A1)–(B5) (8129–8155), Theorem 7.5.11 (8241–8248), all as the README states. Tho17 Lemma 2.15 (433): h³=h⁰(F(S)/F⁺, ad r̄(1)); proof of Proposition 2.21 (614): the count uses h³=1, as the contract Check says. Yam14: Propositions 3.10 and 3.13 (1246, 1327: shifts (p+1,p+1) and (p−1,p+1)), Theorem 4.7 (2205), D_ij ∈ Der(R) with R=Ô/m² (1235). P12 Theorem 7.1 (1768–1800: p≥5, K neat or p≥7, admissibility 1–5, the weight list iκ′), Definition 5.3 (976–990: λ_r|I_p=χ^{−i_r}, the r<r′ direction), (H1)–(H3) (1140–1147). M14 Proposition 4.16 (1677–1683).

**Adversarial values** (one row per statement instantiated; values on each side; "agrees" means the README's claim and my computation coincide).

| Statement | Instances | Values | Result |
| --- | --- | --- | --- |
| Conventions, WD convention | r(F)=diag(1,q), N=E₁₂, q=3 | diag(1,3)E₁₂diag(1,1/3)=E₁₂/3 | agrees |
| Conventions, polynomials | roots 2,3 | X²−5X+6; 1−5X+6X² | agrees |
| Conventions, d(Q) | Q=diag(1,1), p=7 | d=−4≡3, squares mod 7 {1,2,4}: nonsquare; det 1 square | agrees |
| §0.1 | 𝔽₁₁ (2,3),(2,6),(1,3) | 3·8·(−1)·35≡2·(−1)·2=−4≡7; 4·36=144≡1 → factor 0; α²−1=0 | agrees |
| §0.3 Check 2 | N₀=E₂₃, N=N₀+η(E₁₂−E₃₄), J antidiagonal (1,1,−1,−1) | E₃₂J+JE₂₃=E₃₃−E₃₃=0; (E₂₁−E₄₃)J+J(E₁₂−E₃₄)=(E₂₄+E₄₂)−(E₄₂+E₂₄)=0; N²=η(E₁₃−E₂₄) | agrees |
| §0.3 Check 3 | I+η(E₁₂−E₃₄) | upper triangular, e₂↦e₂+ηe₁ in ⟨e₁,e₂⟩, plane block I₂+ηE₁₂ | agrees |
| §0.3 oddness | a=4,5 | (−1)^{−3}=−1; (−1)^{−4}=1 | agrees |
| §0.4 H²(ℚ_q,ad⁰) | eigenvalues λ_i, ε̄(Frob_q)=q⁻¹ | Frob on ad⁰(1): (λ_i/λ_j)q⁻¹; fixed vector iff some ratio = q (i=j gives q=1) | agrees |
| §0.5 | 𝔽₁₃ (2,4,11,9) | αδ=18≡5, βγ=44≡5; αβ=8, γδ=99≡8 → rejected | agrees |
| Descent Checks | C=I+εE₁₄, ε²=0 | E₄₁J+JE₁₄=E₄₄−E₄₄=0 | agrees |
| Ordinary-import Checks | n=4,[F⁺:ℚ]=1; n=2 | 4≡0; 2≢0 mod 4 | agrees |
| Ordinary-import Checks | u=diag(1,3), n=2 | 1⁰·3⁻¹=1/3 | agrees |
| Ordinary-import Checks | p=2, n=2, [F⁺:ℚ]=2, #T=3, q=5, h²=1 | χ=1−3−5+2=−5; h¹=1−1+5=5; g=5+3−1−2=5; Tho17 line 614 count has "−2", so h³=1 there | agrees |
| Ordinary-import Checks | p=3: q_v=7, 19 | 7≡1 (3), 7≢1 (9); 19≡1 (9) | agrees |
| §1.1 Q_{p,2} | b=2 | exponent 2−b=0 | agrees |
| §1.2 selectors | T=diag(c,c+1), Q=diag(d+1,d); Q=diag(d,d) | e_T(c)e_Q(d)=diag(1,0)diag(0,1)=0; union formula I; diag(1,0) | agrees |
| §1.2 Check 4 | ℤ₁₁, T=16, c=5 | 11^{n!}→0 so e=1; ker 11ⁿ=0; mod 11ᵐ: 11ᵐ=0 | agrees |
| §2.2 | (j,k)=(2,2),(4,2),(3,3), x=3 | exponents −1,0,0; 3⁻¹ has valuation −1 | agrees |
| §2.3 | diag(1,2,3,6) | e₁=12, e₂=47, e₃=72, e₄=36 | agrees |
| §2.5 | ℓ=3 | ν=3, det=9; wrong twist 1/3, 1/9 | agrees |
| §2.7 | w=0,2; χ₂(u)=ζ₃ | −1,−1,−2,−2; −2,−2,−3,−3; ζ₃⁻¹ | agrees (BCGP25 line 5027 prints the double inverse) |
| Layer 2 Example | HT {0,0,1,1}, multiplier ε⁻¹ | dual {0,0,−1,−1}+3={2,2,3,3}; ε·ε⁻⁶=ε⁻⁵ | agrees |
| §3.1 | p=2; ϖ²=2 | 3²=9≡1 (4); (1+ϖ)²−1=2ϖ+ϖ²=ϖ³+ϖ² ∈(ϖ²) | agrees |
| §3.1 congruence | a≡b mod ϖʲ, e=v(p) | a^p−b^p ∈ (pϖʲ, ϖ^{jp}) ⊂ (ϖ^{j+1}) for j≥1 | agrees, needs only p∈ϖO |
| §3.1a weight | mult. rank 1, étale rank 1 | v∈ω_{Gᵒᵒ}^{p+1}, v^{p−1}∈ω_{Gᵒᵒ}^{p²−1}; Hasse(Gᵐ)^{p+1}∈ω_{Gᵐ}^{p²−1}; det ω_G=ω_{Gᵐ}⊗ω_{Gᵒᵒ} | agrees (p=5: 24) |
| §3.3 Check 4 | p=7, t=6,2 | −12≡0, −4≡2 mod 6 | agrees |
| §3.4 | (a,b)=(4,3) | 0,−1,−3,−4; pairs −4 | agrees |
| §4.1 identities | Legendre multiplier | disc(M⁻¹·pQ)=p²disc(Q)≡0 → Z₂X₂=0; disc(pQ)≡0 → UX₂=0; (±1,0)³=same → X₂³=X₂ | agrees |
| §4.2 | p=7: k=8; (2,2),(4,2),(6,2) | 8·15=120≡1; degrees −2, 0; 4<5 and 6<6 fails | agrees |
| §4.4 Check 2 | c=6 in 𝔽₁₁ | 216−6=210≡1 → F=0 | agrees |
| §4.6 scalar system | ZF=βF+β⁻¹X₂F (CG20 line 2862), X₂F=αβF₀ | β⁻¹·αβF₀=αF₀ | agrees |
| §4.7 scalar step | h weight (p−1,p−1), expansion 1 | h(F−X₂F)=hF−hQ₂F+Z₂(hF), Z₂ formal in Sym⁰ so hZ₂F=Z₂(hF); Θ at k=p+1: p∤(p+1)(2p+1) | agrees |
| §4.7 Check 4 | Γ(5), p=7, M=[[2,5],[35,91]] | det 7; 7M⁻¹PM⁻ᵗ=(1208,−930,179); disc −28; mod 5 (3,0,4)≠(2,0,1); diag(3,2) gives (27,16)≡(2,1) | agrees |
| §6.1 Checks | 𝔽₁₁ (2,3,4,6); 𝔽₁₃ (2,4,11,9) | blocks 6,8,7,2; R(6)=8, others 0; αβ=γδ=8 | agrees |
| §6.2 GL₂ model | q=11, p=5, δ²=−43 | αβ=11, α+β=1; (qα−β)/((q+1)(α−β))=(5+6δ)/(12δ)=1/2−5δ/516≡3; v=6−5δ/43≡1 | agrees |
| §6.2 Klingen degree | x≡1 mod p | 1+x+x²+x³≡4; 4·(1/4)=1 | agrees |
| §7.1 bundle | a=4 | ω(a,2)^∨=ω(−2,−a); ⊗ω(3,3)=ω(1,3−a)=ω(1,−1); ω(3,3)⊗ω(a−3,−1)=ω(a,2) | agrees (needs Sym^{a−2} self-dual, p>a−2) |
| §7.3 defects | S=O[C_p]: S, k, S⊕k; Tor₁^S(k,O) | 1−0=1; 1−2=−1; 0; periodic resolution T,N: Tor₁=k/Nk=k, dim 1 | agrees |
| §7.3 bounds | (7,4),(7,5) | 5>4,7>2,6>4; 5>5 ✗, 7>3 ✓, a=5 odd excluded | agrees |
| §8.1 inertia | diag(χ,χ,χ⁻¹,χ⁻¹), χ⁻²=⟨u⟩ | multiplier 1; untwisted diag(1,1,⟨u⟩,⟨u⟩) has multiplier ⟨u⟩ | agrees (CG20 line 3063 prints the untwisted shape) |
| §8.3 | p=11,a=4,λ=2; p=7; p=3 | gcd(3,10)=1; 5³≡4, 9⁻³=4; cubes mod 7 = ±1; 𝔽₃^×={±1} | agrees |
| §8.4 | q=2; (12); (123) | 15·8·3·2=720; 2³=8 fixed, dim 3; (123)-stable even subsets 8, classes 4, dim 2 | agrees |
| §8.5 slopes | a=4; a=2 | 0,0,3,3 no pair differs by 1 → N=0; 0,0,1,1 admits N | agrees |
| §9.3/9.4 | κ′=(4,2),(2,2),(1,1); k′=3 | (0,0,−3,−3),(0,0,−1,−1),(0,1,0,1); (0,−1,−2,−3) | agrees |
| §10.2 torus | T(𝔽_q)/Z(𝔽_q) | (𝔽_q^×)³/𝔽_q^× ≅ (𝔽_q^×)²; p-part (𝔽_q^×(p))² | agrees |
| §10.6 | k[C₂], char 2 | regular: N[1]=1+g, iso; trivial: N=0, invariants dim 1 | agrees |
| §10.7 | (1+t)^{pᴺ}−1 | t-coefficient pᴺ≠0 in O | agrees |
| §11.1 | R=3: (−4,−1),(0,3),(−1,−4); R=0 | 3,3; 3,−5; −3; R≥1 required | agrees |
| §11.3 | E=ℚ₇, (t²−3) | squares mod 7: 0,1,2,4; [E′:E]=2 | agrees |

**Degenerate instances with no finding.** Q=∅ (§§0.4, 6.1, 6.2, 6.4, 8.2 state it); the zero selected module and the zero action ring (§§3.2, 7.4, 10.4, 10.5); rank zero (§§10.3, 10.7, 11.5); p=2 (excluded from the CG and P12 branches by their hypotheses, carried in the BCGP branch with the dyadic gaps and the no-division-by-8 Checks); p=3 (q_v≡1 mod 9 retained); a odd (excluded by oddness); m=0 coefficients (excluded from §6.4); type P primes (empty under the cyclotomic multiplier, CG20 Remark 4.4); the constant series (excluded from the minimal-discriminant argument by cuspidality).

**Policy.** No `lemma`, `set_option`, `#check`, `#eval`, pull-request number, machine path, process word or computational algorithm in README or Lean (grep; the only hits for "lemma" are source lemma numbers in citations). Every numbered target has a source locator with a line reference (78 "line N" references). The pull request changes only the package folder.

**Ownership.** Searched by object (theta operators, Hasse invariants, Klingen level comparison, paramodular newvectors, Taylor–Wiles patching for GSp₄, higher-Hida multiplicity) in the sibling checkouts named by the brief and through `roadmaps grep` at the index of 2026-11-04. The earlier owners found in round 1 (A3.12, §3.30, §0.4, A4.3, 7.12) are now cited. The consumer AbelianSurfacesModularity (rev/1746) imports this roadmap rather than re-planning it. One overlap for the maintainer, not a finding under the gap rules: SiegelModularForms (rev/1714), §10.4 "Local paramodular newforms and the classical comparison", plans the Roberts–Schmidt generic newvector uniqueness theorem for GSp₄(F) with trivial central character as its own target on SmoothRepresentationsOfLocalGroups carriers; this roadmap declares the same theorem as `gap:gsp4-paramodular-newvector` on SmoothRepresentationsOfLocalGroups SR.4.5 (its third contract Check reduces unramified to trivial central character). SiegelModularForms is not in the merge order and is not an admissible supplier here, so the gap stays; the duplication is for SiegelModularForms to resolve by importing from SmoothRepresentationsOfLocalGroups.

## Not verifiable

- BCGP21 Propositions 2.4.24, 2.4.26, Hypothesis 7.8.1 and Proposition 7.9.8 (gap text and §6.4): the BCGP21 cache was not reopened this round; round 1 pass a checked them.
- P20 and PS16 locators (§§0.2, 1.1, 2.1, 2.3, 3.1, 3.1a): not reopened this round; round 1 pass b opened each and found the cited statement.
- The GSp₄ Klingen trace constant v_x≡1 and the one-dimensionality of the selected refinement lines (§§6.2, 11.3): declared gaps; only the GL₂ analogue was recomputed.
- The exact old numbering of ShimuraCompactifications: the head the round-1 passes read is no longer available through the service, so S01's mapping C3.x→4.x and C5.x→7.x rests on the round-1 line numbers (1677/1697 and 2498–2630) and on the content of 4.9–4.10 and 7.12–7.18 at #1053.
- Ownership against open pull requests was checked through the sibling checkouts the brief names and the roadmap service's index of 2026-11-04T10:44:09Z (441 open roadmap pull requests); pull requests opened later were not searched.

## Source issues

- **Misprint** in BCGP25 at Definition 7.4.1, p.167 (line 7685): the congruence is printed as both r≢1 mod p and r≢1 mod 4 when p=2, which no odd r satisfies; it should be r≢1 mod p for odd p and r≢1 mod 4 for p=2; affects nothing.
- **Misprint** in BCGP25 at Lemma 4.12.1(2), p.112 (line 5027): the third and fourth diagonal entries carry a double inverse of χ₂ and χ₁; it should be a single inverse as in the first two entries; affects nothing.
- **Error** in BCGP25 at §5.4, p.123 (line 5569): it says the hⁱ_{S,T} vanish for i≠1,2 when T is nonempty; by Tho17 Lemma 2.15 (line 433) h³=h⁰(F(S)/F⁺, ad r̄(1)), which is 1 at p=2 because the scalars are j-fixed, and Thorne's own count (line 614) uses that value; affects the proof (the generator count, by one).
- **Misprint** in CG20 at Theorem 7.2, p.847 (line 1854): pr_x is a limit of powers of an undefined R′_x; it should be R_x; affects nothing.
- **Error** in CG20 at Theorem 7.3, p.847 (lines 1863–1865): the inverse of pr_Q∘i is given as d_Q⁻¹tr with d_Q the covering degree; the composite is the unit v_Q/d_Q, not 1, as the GL₂ model shows; it should be (tr∘pr_Q∘i)⁻¹∘tr; affects a stated result (the isomorphism survives).
- **Misprint** in CG20 at Lemma 8.4, p.859 (lines 2317–2330): the symbol is written with det(Q) and with r²−4mn as if equal; they differ by (−1/p); it should be the discriminant r²−4mn; affects a stated result for p≡3 mod 4.
- **Gap** in CG20 at Theorem 9.1, proof (a), p.879 (line 3063): inertia at x∈Q_N is printed as diag(1,1,⟨u⟩,⟨u⟩), of multiplier ⟨u⟩, for a deformation of fixed multiplier; it should be the twisted shape diag(χ,χ,χ⁻¹,χ⁻¹) with χ⁻²=⟨u⟩; affects the proof.
- **Gap** in CG20 at Definition 6.15, p.844 (line 1762): the witness is taken in the canonical space while the subcanonical selected space is later asserted nonzero (line 1783); it should take a cuspidal witness or invoke boundary vanishing; affects the proof.
- **Error** in Yam14 at §3.2, p.22 (line 1235): D_ij=∂/∂t_ij is declared a derivation of R=Ô_x/m²; a derivation of R kills t₁₁² while D(t₁₁²)=2t₁₁≠0 for p odd, so it is not one; it should be computed on the smooth formal base before truncating; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4d3145d776d4bab689186fd8d414c1b96df0a2b5", "job": "RT-GSp4NonregularModularityLifting~2b", "model": "fable", "worker": "chris-x11"} -->

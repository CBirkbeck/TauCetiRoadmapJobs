# Review of ArakelovGeometryAndAbelianHeightsPartII (pull request #1833 at 12ef4f6)

**Verdict:** needs changes

Three findings, all P3 locators; nothing blocking. The gate passes, the dependency check reports no problem, the seeded sample of fifteen targets agrees with the sources at the cited theorem and page, and the adversarial table below found no false statement. The `Suggested.lean` is empty by design and the docstring's list of unstatable headlines is correct at the pins (no Berkovich spaces, metrized graphs, adelic line bundles, Faltings height or arithmetic intersection theory exist in Mathlib or Tau Ceti at the pins; Tau Ceti has only elliptic-curve canonical heights). The three repairs below are requests to make before the next review.

## R01 (P3) — Garbled page locator for Gao–Habegger §A.3

Location: `TauCetiRoadmap/ArakelovGeometryAndAbelianHeightsPartII/README.md` line 1046, §6.4: "(gao-habegger-2019, §A.2, p. 56; §A.3, p. 57–2655; …)".

Claim: the specialization limit is in Gao–Habegger §A.3 at "p. 57–2655".

Witness: in the cached arXiv v3 text, Proposition A.1 is on p. 55 (gao-habegger-2019 line 2556), §A.2 and (A.2) on pp. 55–56 (lines 2583–2592), and §A.3 begins on p. 56 (line 2625) and continues on p. 57 (lines 2637–2660). "2655" is a line number of the extraction, not a page.

Repair: replace "§A.3, p. 57–2655" by "§A.3, pp. 56–57". Tested: the Moriwaki-height Silverman limit the route cites is the bullet at lines 2651–2655, on p. 57.

## R02 (P3) — Looper–Silverman–Wilms Proposition 6.1 is on p. 17, not p. 14

Location: README line 2022, §13.4: "looper-silverman-wilms-2021, Proposition 6.1, p. 14"; and line 1399, §8.8: "over function fields in looper-silverman-wilms-2021, §6, p. 14".

Claim: the function-field lower bound ω_a² ≥ (max(2, g−1)/(2g+1))Σφ(Γ_v) and the Hodge-index application are on p. 14 of the cited arXiv v3.

Witness: §6 "An application of the arithmetic Hodge index theorem" starts at looper-silverman-wilms-2021 line 689, after the marker for page 17 (line 687); Proposition 6.1 is at line 704, also p. 17. Page 14 (lines 535–584) belongs to §5.

Repair: write "Proposition 6.1, p. 17" in §13.4 and "§6, p. 17" in §8.8. The statement itself (with max(2, g−1), and 2(g−1) in characteristic 0 or for hyperelliptic curves) matches what §13.4(1) says.

## R03 (P3) — Cinkir 2015 "concluding summary, p. 18" does not carry the genus-3 constant

Location: README line 2022, §13.4: "(cinkir-2015, Introduction, item (iii), p. 1; concluding summary, p. 18 (arXiv v1))".

Claim: c(3) = 17/288 is also recorded in a concluding summary on p. 18.

Witness: cinkir-2015 p. 18 (lines 1043–1090) contains the end of the proof that T₈ ≥ 0 and the reference list; the only occurrences of 17/288 are on p. 1 (line 42, item (iii)) and p. 2 (line 50, attained by the regular tetrahedral graph). The p. 1 locator already in the README is the right one.

Repair: delete "concluding summary, p. 18" and keep "Introduction, item (iii), p. 1; p. 2 for attainment by the regular tetrahedron" (the attainment is already cited correctly in §13.8).

## Verified sound

**Gate and dependency check.** The worker's gate at 12ef4f6 reports every check 0 and OK (set_option, blob, latex, prnum, sorry-data, residue, imports, readme-ids-missing, depcheck, stray-files, outside-folder, build). I re-ran the dependency check with `--movable`:

```
depcheck: 241 roadmaps, 2362 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The outside-folder diff against `origin/main` is empty. `lake env lean` on `Suggested.lean` exits 0 with no output (the file declares nothing, so no `sorry` warning either); the `module` / `public import Mathlib` header is the right one at this Mathlib pin. There is no named declaration, so no `#check` comparison was needed.

**Declared gaps.** The four gaps of `design/plan.json` (singular-pluripotential-products → ComplexComparisonPartII C5.4; curve-moduli-noether-positivity → StableReductionPartII MC.4–MC.6; bertini-normal-sections → SchemeAndStackFoundations 4.13; cube-for-products → JacobianChallenge Layer E) are stated in the README's supplier contracts with the same slugs and the same one-sentence needs. Each is precise and minimal: SchemeAndStackFoundations §4.13 on main has only `bertini_smoothness` (README line 5680 there), which assumes X smooth and says nothing about normality; JacobianChallenge Layer E on main proves the cube only for an abelian variety's triple product (its README lines 332–340); ComplexComparisonPartII C5.4 is the smooth current calculus. StableReductionPartII at its open head (#1841) already carries §§4.8, 5.1, 5.2, 5.9, 5.19, 5.20, 5.21, 6.1, 6.2, 6.8, 6.9, 6.10, 6.21, 6.22 with the content the contract names (integral Noether 12λ ≅ ⟨ω,ω⟩ ⊗ O(Δ); semi-canonical isomorphisms unique up to ±1; nef and big Hodge line under maximal variation in characteristic 0, over an arbitrary field in §6.22, descent through finite covers in §6.21); that is the contract being met, not a redundant gap.

**Seeded sample (15 targets), each read at the locator.**

| Target | Source and locator | Checked |
|---|---|---|
| 1.2 boundary norm, adelic divisors | yuan-zhang-2025 Lemma 2.4.1 and Remark 2.4.2, pp. 37–38 (lines 1298–1346); yuan-2026 §2.1, pp. 18–19 (lines 615–637) | norm axioms (1)–(3) including the strictness clause of (3), equivalence of norms for two boundary divisors, Cauchy-sequence form −εᵢE₀ ≤ D_j − Dᵢ ≤ εᵢE₀, continuous Green functions allowed: all as stated |
| 1.3 groupoid of adelic line bundles | yuan-zhang-2025 §2.5.1–2.5.2 (lines 1476–1500); yuan-2026 pp. 19–20 (lines 641–682) | objects (L,(Xᵢ,L̄ᵢ,ℓᵢ)) with boundary-Cauchy d̂iv(ℓᵢℓ₁⁻¹), morphisms ι with d̂iv(ℓ′ᵢιℓᵢ⁻¹) → 0, ℚ-line-bundle Hom as a colimit: as stated |
| 1.4 divisor presentation | yuan-zhang-2025 Prop 2.5.1 pp. 41–42, Lemma 2.4.3 p. 39; yuan-2026 p. 20 (lines 683–686) | surjection D̂iv → P̂ic with kernel the model principal divisors; P̂r discrete: as stated |
| 1.7 complex valued base | yuan-zhang-2025 §2.7 (headings at lines 1953–2085, printed p. 54 in the table of contents); yuan-2026 proof of Thm 3.10 p. 58 (lines 1971–1992) | B = (ℂ,|·|), model pairs (D,g_D), boundary (E₀,g₀) strictly positive, completion; the README's mixed-coefficient variant is a stated refinement of Yuan's ℚ-coefficient group |
| 3.5 total mass | yuan-zhang-2025 Lemma 5.4.4, printed p. 170 (lines 6767–6782) | mass of c₁(L̄₁)_v···c₁(L̄ₙ)_v is L̃₁···L̃ₙ, global field, every place: as stated |
| 4.5 bigness under finite covers | yuan-zhang-2025 Prop 4.1.2, printed p. 105 (lines 3943–3953); yuan-2026 p. 55 (lines 1880–1884) | projection formula with deg(f) = 0 for non-dominant f; Yuan's sentence that a nef bundle is big iff its pull-back to a finite surjective cover is big: as stated |
| 4.6 heights of algebraic points | yuan-2026 §4.1.2 pp. 63–64 (lines 2154–2170); yuan-zhang-2025 §5.3.1–5.3.5 (headings lines 5945–6117) | h_L(x) = deĝ(L|_x̃)/deg(x̃/ℚ) for k = ℤ and /deg(x̃/K) for k a field, Yuan's remark that this differs from YZ §5.3 by the degree over K: as stated |
| 7.3 canonical admissible measure | yuan-2026 Prop A.2 pp. 108–109 (lines 3662–3683), Prop A.5 pp. 117–118 (lines 3975–4008) | unique probability measure with "admissible iff integrable and c₁ = deg·μ_a", defined from θ_α, flat curvature for algebraically trivial M via [YZ1, Thm 5.16], Calabi uniqueness; explicit formula (1/g)i_*(Σ g_vδ_v + Σ_e (1/(r_e+1))δ_e): as stated |
| 8.8 arithmetic Hodge index inequality | yuan-zhang-2025 Thm 6.5.8, printed p. 209 (lines 8381–8389); wilms-2022 Thm 1.2 p. 3 (line 121); looper-silverman-wilms-2021 Prop 6.1 p. 17 (lines 704–716) | hypotheses (F finitely generated, tr.deg ≥ 1 and k algebraically closed in F when k is a field; X geometrically integral and geometrically normal of dimension n ≥ 1; M̄ integrable ℚ-bundle; L̄ᵢ nef with big underlying Lᵢ; M·L₁···Lₙ₋₁ = 0) and the pseudo-effectivity conclusion: exactly as stated; only the LSW page is wrong (R02) |
| 10.1 Zhang's graph invariants | zhang-2010 (4.1.4) p. 66 (line 2297), Lemma 3.5.4 p. 62 (line 2148); baker-rumely-2007 Thm 14.1 p. 36 (lines 1906–1916), Lemma 14.4 p. 37 (lines 1953–1961); yuan-2026 p. 47 (line 1588), p. 49 (line 1654), p. 86 (line 2912) | ε = ∫∫ r δ_K μ, φ = −ℓ/4 + ¼∫ g_μ(x,x)((10g+2)μ − δ_K), g_{μcan} = −r/2 + τ, τ = ¼∫(∂_x r)² dx: as stated |
| 10.5 boundary bound for ε | yuan-2026 Lemma 3.5 pp. 47–48 (lines 1599–1634) | (2g−2)Δ_S − E_S effective, via r ≤ ℓ(path) and ε ≤ (2g−2)ℓ, Green function of Δ_S at discrete v is ℓ(Γ_v) log e_v: as stated |
| 10.8 boundary bound for φ | yuan-2026 Thm 3.7 p. 53 (lines 1795–1806); cinkir-2011 Thm 2.9 p. 5 (lines 177–187) | Φ_S − Δ_S/39 effective from φ(Γ) ≥ ℓ(Γ)/39; Cinkir's constants t(2) = 1/27, t(3) = (892 − 11√79)/14580 ≈ 0.0545, t(g) = (g−1)²/(2g(7g+5)) ≥ 3/88 for g ≥ 4: as stated |
| 10.13 admissible Noether divisor | yuan-2026 §4.5.2 pp. 90–91 (lines 3030–3075) | S over ℤ or ℚ, Ξ_S = d̂iv(t) for the inverse semi-canonical isomorphism, underlying divisor 0, Green function δ_v + ε_v at normalized discrete v and δ_v − 4g log 2π at archimedean v, image Ẽ + Δ under D̂iv(S/ℤ) → D̂iv(S_ℚ/ℚ): as stated |
| 12.3 criterion for potential bigness | yuan-2026 Thm 4.1 pp. 60–63 (lines 2044–2145) | the three equivalent conditions; the README's "m ≥ max{1, dim S}" is Yuan's "m ≥ dim S" made safe at dim S = 0; the term b_m = a^{m−d}M^d and the vanishing of N(r₁,…,r_m) unless a permutation of (e+1,e,…,e): as stated |
| 13.6 Wilms' δ bound | wilms-2017 Cor 1.2 p. 1 (lines 44–45), proof inputs p. 2 (lines 49–52); yuan-2026 p. 93 (lines 3134–3137) | δ(X) > −2g log 2π⁴ (strict), from ∫ log‖θ‖ ν^g/g! < −(g/4) log 2 and φ ≥ 0: as stated |

**Other locators opened.** yuan-2026 Lemma 2.1 (p. 25–26), Lemma 2.2 (pp. 26–27), Thm 2.3 (p. 28), Def 2.4 and Def 2.5 (p. 30), Prop 2.6 (p. 31), §2.2.3 (p. 32), Prop 2.7 and Thm 2.8 (pp. 33–34), Thm 2.9 (pp. 35–36), Thm 2.10 (pp. 37–39), Thms 3.1–3.2 (p. 40), Thm 3.3 and §3.1.2–3.1.3 (pp. 42–43), Lemma 3.4 (pp. 43–44), Thm 3.6 (p. 51), §3.3.5 (pp. 53–54), Thm 3.8 and Remark 3.9 (pp. 54–55), Thm 3.10 (pp. 56–58), Thm 4.2 and Lemma 4.3 (pp. 64–67), §4.3.1 and Lemma 4.9 (pp. 72–76), §4.4.1 (p. 78), Thm 4.10 explanation (p. 82), Thm 4.11 and Remark 4.12 (pp. 85–88), §4.5.2 (pp. 89–91), Thm 4.14 (pp. 92–95), Thm A.1 (pp. 104–105), §A.3 (pp. 107–109), Thm A.3 (pp. 110–111), §A.5 (pp. 114–117), §A.6 (pp. 118–119); yuan-zhang-2025 Lemma 2.6.1 (p. 49), §3.2 (pp. 71–72), Lemma 3.1.1, Props 3.3.1 and 3.4.1 (located), Prop 4.1.1, Thm 4.1.3 (p. 106), Thm 4.2.3, Lemma 4.6.1, Lemma 5.1.2, Lemma 5.1.7, Thms 5.2.1–5.2.2, Thm 5.2.9 (p. 148), Lemma 5.2.10 (p. 149), Thm 5.3.3 and Lemma 5.3.4 (pp. 158–159), Thm 5.3.7 (p. 163), Thm 5.4.3, Thm 5.5.1 (p. 175), Thms 6.1.1–6.1.3 (pp. 180–184), Thms 6.2.2–6.2.3, Thm 6.5.4, Cor 6.5.5, Thm A.6.1 (p. 246), Cor A.6.2 (p. 247); zhang-2010 Thm 1.3.1 and Cor 1.3.3 (pp. 6–7), Lemma 2.3.3 (p. 32), Thm 2.3.5 (p. 34), Thm 2.5.1 and Prop 2.5.3 (pp. 36–38); yuan-2008 Def 2.1 and Thm 2.2 (p. 10), Thm 2.3 and Cor 2.4 (p. 11); moriwaki-2000 Cor 3.3.5 and Def 3.3.6 (p. 14), Prop 3.3.7 (p. 15), Props 3.4.1–3.4.2 (p. 16), Thm 4.3 (p. 20); gao-habegger-2019 (A.1) p. 54, Prop A.1 p. 55, (A.2) and Prop A.2 pp. 55–56, §A.3 pp. 56–57; demarco-mavraki-ye-2026 §4 (p. 19 onward); wazir-2006 Thms 0.2–0.3 (pp. 4–5); de-jong-2018 Prop 9.2 (p. 31); gaudron-remond-2014 Def 2.1 (pp. 6–7), Cor 8.4 (p. 37); cinkir-2015 item (iii) p. 1 and p. 2; seidenberg-1950 Theorem 7 (p. 368) and Theorem 7′ at the end of §4; gross-schoen-1995 Example 6.2 (p. 660) and Prop 6.11 (p. 664); milne-av Theorem 5.1; stacks-pullback Lemma 36.32.6 (0E0L); stacks-irreducible-fibres Lemma 37.27.5 (0559). The YZ printed pages equal the PDF page minus 10 from chapter 4 on and are the ones the README uses.

**Adversarial table.** One row per statement; values on both sides.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: Green function and degree sign | O on Spec ℤ, ‖1‖ = e⁻¹, e⁻², f = 2 | degrees 1, 2; tensor e⁻³ gives 3; for f = 2 finite term log 2 cancels −log 2 | consistent with (div f, −log|f|) | none |
| Conventions: Faltings vs Deligne norm | g = 1, 2 | squared-norm ratio π^g; h_Del − h_Fal = (g/2)log π: 0.5724 (g = 1), 1.1447 (g = 2) | matches gaudron-remond-2014 p. 7 line 322 | none |
| Conventions: Θ = Δ_J^*(P^∨), h_Θ̄ = 2ĥ | elliptic fibre, [2] | Δ_J^*P = O(−(θ + [−1]^*θ)) (Yuan Thm A.3(4)), degree −2, so Θ has degree 2; [2] multiplies 2ĥ by 4 | sign fixed by the dual | none |
| Conventions: unit loop τ and ramified renormalization | ℓ = 1, 2 | τ = ℓ/12 = 1/12, 1/6 | matches BR Thm 14.1 and scaling | none |
| 0.3 Siu on Spec ℤ | A = O(2), B = O(1), ε = 1 | 2 − 1·1 = 1 = vol(O(1)) | equality case | none |
| 0.3 geometric volume at d = 0 | Spec 𝔽₂, Spec 𝔽₄ over 𝔽₂ | h⁰ = 1, 2 for every m; vol = 1, 2; no mixed term | consistent with §3.1's deg_k[X] | none |
| 1.2 strict scaling clause | normal U; non-normal U with torsion in Div(U) | ‖aD‖ = |a|‖D‖ unless D̄ ≠ 0 and aD̄ = 0 | matches YZ Lemma 2.4.1(3) verbatim | none |
| 1.2 Spec ℤ with E₀ = (0,1) | (0,c) | ‖(0,c)‖ = |c|; nonzero finite part has norm ∞ | model group complete | none |
| 1.3 irrational coefficient on Spec ℤ[1/2] | aᵢ[2] → √2[2] | 2-coordinate √2 mod ℤ irrational; no rational model representative | §1.8 presentation separates it | none |
| 1.4 principal divisor of 2 | Spec ℤ | finite log 2, Green −log 2, degree 0; O(1) degree 1 not principal | kernel = P̂r_mod | none |
| 1.7 growth at 0 on ℂ^× | (log|z|)² vs log|z| | ratio (log|z|)²/|log|z|| → ∞ | excluded by the boundary norm | none |
| 1.8 P̂ic⁰(ℚ) | K = ℚ | ℚ^×/{±1} free on primes; (K^×/μ)⊗ℝ/ℤ = ⊕_p ℝ/ℤ | matches YZ Lemma 2.6.1 | none |
| 2.4 archimedean test exponents | t = 1/2, 2 | |1+1|^{1/2} = √2 ≤ 2; |1+1|² = 4 > 2 | t ≤ 1 required | none |
| 2.7 canonical metric on ℙ¹ over trivially valued K | |t| = 2, 1/2; φ(t) = t² | ‖X₀‖ = 1/2 at |t| = 2, 1 at |t| = 1/2; ‖X₀²‖ = 1/4 = ‖φ^*X₀‖ at |t| = 4 | tensor and pullback laws hold; constant metric fails | none |
| 3.1 d = 0 projection formula | 𝔽₄/𝔽₂; 𝔽₂(t) ⊂ 𝔽₂(u) ⊂ 𝔽₂(v), u² = t, v² = u | 2 = 2·1; 4 = 2·2 (inseparable) | matches YZ Prop 4.1.2 with deg = field degree | none |
| 3.4 injectivity needs geometric reducedness | E: y² = x³+3x+2 over 𝔽₅, Frobenius | discriminant 216 ≡ 1 ≠ 0; points O,(1,±1),(2,±1): #E = 5; P = (1,1) of order 5; F^*O(P−O) = O(5P−5O) = O | Pic pullback not injective; README's added hypothesis is needed (Yuan Lemma 2.1(1) omits it: source issue) | none |
| 3.5 nonproper mass | 𝔾_m ⊂ ℙ¹_ℚ, max O(1) | mass 1 at every place; trivial-metric O gives 0 | mass is the adelic intersection, not the algebraic bundle | none |
| 4.1 small sections on Spec ℤ | c = −1, 0, 1 | #Ĥ⁰ = 1, 3, 5; ĥ⁰ = 0, log 3, log 5 | matches Ĥ⁰ = {|n| ≤ e^c} | none |
| 4.3(4) large twist | ℙ¹_ℚ, L̄ = max O(1) ⊗ O(−1), N̄ = O(1) | c < 1: every nonzero integer polynomial has sup-norm ≥ 1, scaled by e^{m(1−c)} > 1, volume 0; c > 1: top self-intersection 2(c−1) > 0 | small twist insufficient, as stated | none |
| 4.4 pairing on ℙ¹ × S | S = Spec ℤ, M = O(1), max vs Fubini–Study | ⟨L,L⟩ degrees 0 + 2 = 2 and 1/2 + 2 = 5/2 | first summand detectable | none |
| 4.5 finite cover | degree 2, M̄^d = 1, 3, 0 | pullback 2, 6, 0 | positivity equivalent both ways | none |
| 4.6 normalizations | [1:2] over ℚ and over quadratic K; [1:t] over k(t) and k(u), t = u² | log 2 absolute, 2 log 2 relative; 1 and 2 | matches Yuan p. 64 and HRPO §0.11 | none |
| 4.7(2) small twist | N̄ of degree 1 | (L̄ + cN̄)^d = L̄^d + dcL̃^{d−1} > 0; h shifts by c/a_K | matches YZ proof of Thm 5.3.7 line 6420 | none |
| 4.8 point case | Spec K, [K:ℚ] = 2, O(1) | raw 2/(2·1·1) = 1 = e₁; without a_K: 2 ≤ 1 false | a_K necessary | none |
| 5.1 uniqueness needs q > 1 | f = id, q = 1 on ℙ¹ | O(1) and O(2) both invariant | hypothesis q > 1 retained | none |
| 5.4 Deligne vs Faltings on the Hodge line | g = 2, [K:ℚ] = 2 | degree 2h, absolute h; Deligne shift (g/2)log π = log π, not 2 log π | none |
| 6.3 quadraticity | P of order 2; height a at [0],[1],[2] | 0; 0, a, 4a | quadratic, not linear | none |
| 7.2a clamp example | ℙ¹/ℚ_p, metrics max(|x₀|,|x₁|), max(|x₀|,|px₁|) | f = clamp of log|t| to [0, log p]; c₁ = δ_{ζ₁} − δ_{ζ_p}; M̄² = 0 − log p = −log p = −∫(f′)² over length log p | sign and equality clause confirmed | none |
| 7.3 banana measure | genus 2, three unit edges | r_e = 1/2; density (1/2)(1/(1+1/2)) = 1/3 per edge; total 1 | matches Yuan Prop A.5 and Foster's theorem | none |
| 7.5 / 8.3 circle Green value | circle of length n, uniform μ | g_μ(x,y) = d²/(2n) − d/2 + n/12, mean 0, g_μ(x,x) = n/12 | ‖·‖_a = ‖·‖_model·e^{n/12} | none |
| 8.6 non-integrable continuous metric | f = Σ 2⁻ⁿcos(2π4ⁿx) on ℂ/(ℤ+iℤ) | Laplacian Fourier coefficient at (4ⁿ,0): −2π²·8ⁿ, unbounded; a finite measure has bounded coefficients | not integrable | none |
| 8.7 quadratic field | absolute theta height a, [K:ℚ] = 2 | deĝ(ι^*Θ̄) = 4a; deĝ⟨M̄,M̄⟩ = −4a; normalized −2a | factor [K:ℚ] needed | none |
| 8.8 sharpness and strictness | M̄ = π^*N̄; M̄ = (O, clamp) | 0; −log p < 0 | inequality not strict in general | none |
| 9.1 expansion | general d, g; d = 1, g = 2; d = 0; g = 1 | d⁴⟨w,w⟩ + 4d³⟨w,ᾱ⟩ − (4g−4)d²⟨ᾱ,ᾱ⟩ with fibre degree 2gd²; A + 8b; 0 = 0; 4x^*w both ways | both identities in (2) agree after substituting ι^*Θ̄ = −⟨M̄,M̄⟩ | none |
| 9.2 coefficients | g = 2, 3 | 4g(g−1) = 8, 24; 16g(g−1)³ = 32, 384; 4g = 8, 12; 16(g−1)³ = 16, 128 | matches Yuan Thm 2.10 | none |
| 9.3 cancellation | g = 2, 3 | −1/8 + 32/256 = 0; −1/24 + 384/9216 = 0 | w = i^*Θ̄/(4g(g−1)) + π^*P/(4g(g−1)) | none |
| 10.1 one-loop graph | g, ℓ; g = 2, ℓ = 1 | μ = ((g−1)δ_v + dx/ℓ)/g, ε = (g−1)ℓ/(3g) = 1/6, τ = ℓ/12 = 1/12, φ = (g−1)ℓ/(6g) = 1/12 via de Jong; the same φ from Zhang (4.1.5) with Zhang's τ_Z = ℓ(2g−1)/(12g²) | two independent formulas agree | none |
| 10.2(3) constants | t(3), t(4), t(5), limit | 0.0545; 3/88 = 0.0341 > 1/39 = 0.0256; 1/25; → 1/14; 2i(g−i)/g ≥ 1 | φ ≥ ℓ/39 | none |
| 10.3(2) spectral coefficient | ω-basis orthonormal for (i/2)∫ vs β = ω/√2 orthonormal for i∫ | c₁(O(Δ)_a)|_Δ = 2μ − iΣ(β_j∧β̄_j)·2 = (2−2g)μ fixes the cross term; T² = 2Σ(β_j∧β̄_k)(x)(β_k∧β̄_j)(y); φ = 2Σ(1/λ)|∫φ_λβ_j∧β̄_k|² = Σ(1/(2λ))|∫φ_λω_j∧ω̄_k|² | README's formula is the correct one; Zhang Thm 1.3.1 and Yuan p. 49 print 2/λ in the (i/2) basis (source issue) | none |
| 10.7 expansion | general g; g = 2, 3 | 8 − 24 + 24 + 12(g−1) = 12g − 4: 20, 32; Φ coefficient −8 | matches Yuan Thm 3.6 | none |
| 10.9 coefficient | g = 2 | (1 + 39·15/2)P = 587/2 P ≤ 300P; 12/300 = 1/25 = 3/(5·15) | matches Yuan Thm 3.8 | none |
| 10.9a closures | smooth x ≠ e₀, W = {x}×𝒳₀×𝒳₀; two components, x ∈ A, e₀ ∈ B | signs 1−1−0−1+1+0+0 = 0; naive closure meets {x}×A×A in one transversal point; correction (p̄ − ē + A)·A = 1 − 1 = 0, ·B = −1 + 1 = 0 with A² = −1, A·B = 1 | correction necessary and sufficient | none |
| 10.10 place weights | y² = (x² − t² − 1)(x−1)(x−2)(x+1/2) over ℚ(t), v = (t²+1) | unit factor (−1)(−2)(1/2) = 1 at x = 0; node y² = x², thickness 1, type 0; φ_v = 1/12, deg v = 2, contribution 1/6; weighting the e⁻² normalization again would give 1/3 | as stated | none |
| 10.11 g = 1 | Wilms formula | δ = −24I − 8 log 2π; rescaling theta norm by e shifts by −24 | Fourier normalization necessary; δ > −9 for g = 1 is Wilms p. 1 | none |
| 10.12 Noether constant | g = 2, [K:ℚ] = 1 | −8 log 2π | matches Yuan p. 89 | none |
| 10.13 Green values | g = 2 unit node | δ + ε = 1 + 1/6 = 7/6 | sign change of s invisible | none |
| 11.1 boundary approximation | a = 1/156 | 1/39 − 2a = 1/78 > 0 | matches Yuan p. 58 | none |
| 11.3 lower bound | g = 2, d = 1, [K:ℚ] = 2 | (2c₀/5)·2 = 4c₀/5 | empty geometric degree [K:ℚ] | none |
| 11.4 bigness of w | g = 2, d = 0, [F:k] = 2; d = 1 | a = 16; 1·16·2 = 32; 32/8 = 4 = 2·[F:k]; 2·16·P¹ | matches Yuan p. 40 | none |
| 12.2 selected terms | d = 0, Y = ℙ¹_F, [F:k] = 2, L = O(2), m = 1, 2 | 2·2 = 4, 4·2 = 8 = a^m deg_k[S] | as stated | none |
| 12.3 fibre powers | m = 1, 2 | m!·2^m·[F:k] = 4, 16; selected term at m = 2 is 8 with binomial 2 | as stated | none |
| 12.4 mixed-dimension degree bound | m = 2, Z = ({p}×C) ∪ (C×{p}) ∪ {(q,q)}, Σ = {p,q} | Σ² ⊂ Z; deg = 1+1+1 = 3; d = 1: 2 ≤ 3; d = 2 would give 2 ≤ √3 false | d = m − max dim is the right reading; matches Yuan Lemma 4.3 proof (dim Zᵢ ≤ m − d) | none |
| 12.5 generically finite | blow-up of a genus-2 Jacobian at a point | twice-theta: degree 0 on the exceptional curve, (2θ)² = 4·2 = 8 > 0 | nef big, not ample | none |
| 13.1 scaling | degree 3 on a degree-2 semistable extension | h_Fal = 3/2 | as stated | none |
| 13.3 hyperelliptic consistency | g = 2, h = 1/10, δ = 1, ε = 1/6 | W_model = 1/5, W_a = 1/30 = (2/5)(1/12) | Zhang's correction and Cor 1.3.3 agree | none |
| 13.4 Hodge-index expansion | a = g−1, N = (g+1)W − 2aD − π^*P/a, M = aD − W | geometric: D² = −2a, D·W = 4a, W² = 8a², so M·N = 4a²(a+1−g) = 0, N² = 8a²g(g−1) = 8g(g−1)³ (192 at g = 3), M² = −2a³; arithmetic: W³ = 12aω², W²D = 4ω², WD² = −2ω², D³ = ω² − φ give deĝ(M̄²N̄) = 2a³φ − 2a²(2g+1)ω² ≤ 0 | ω_a² ≥ ((g−1)/(2g+1))φ, the Wilms/LSW bound | R02 locator only |
| 13.4(3) constants | c(2) = 1/27, c(3) = 17/288, c(4) = 3/88, c ≥ 1/25, c → 1/14 | A = 213.5 (and 107.25 hyperelliptic), 96.94, 139, ≤ 109.625, → 47 | matches Yuan pp. 87–88 | R03 locator only |
| 13.6 numerics | g = 1, 2 | −2 log(2π⁴) = −10.5441, −21.0883 | strict by Wilms | none |
| 13.7 Bost constant | g = 1 | h_Del min ≈ −0.749 > −(1/2)log 2π = −0.919; h_Fal ≈ −1.321 > −(1/2)log(2π²) = −1.491; c = 1.4913 + 1 | Yuan p. 78 prints the Deligne-normalization bound against Faltings' metric (source issue); README's constant is the right one | none |
| 13.8 tetrahedron | K₄, unit edges, g = 3 | r_e = 1 (r_eff = 1/2), μ = ds/6 per edge; r(v,y) = t(2−t)/2 on adjacent edges (∫ = 1/3), 1/2 + t(1−t)/2 on opposite edges (∫ = 7/12); ε = 4·(1/6)(3·1/3 + 3·7/12) = 11/6; φ = 17/288·6 = 17/48; D̃ value (483/17)(17/48) − 6 − 11/6 = 107/48 < 6, D̃ − c(3)Δ = 15/8 > 0 | the printed "D̃ − Δ̃ effective" of Yuan p. 94 fails; the proved c(g) version holds (source issue) | none |
| 13.9 constant identity | g = 1, 2 | 2 log(2π⁴) + 4 log 2π = 6 log(2π²) = 17.8956, 35.79 | as stated | none |
| 13.10 convex combination | h ≤ 1; h ≥ max(1, 24|c₅|) | lower constant c′; h/12 + c₅ ≥ h/24 | c₃, c₄ exist; function fields c₃ = 4^{−4g²}/12, c₄ = 12 | none |

**Library declarations at the pins.** `NumberField.prod_abs_eq_one` at `Mathlib/NumberTheory/NumberField/ProductFormula.lean:98` with hypothesis `x ≠ 0` and infinite-place multiplicities `w.mult`; `Projectivization.logHeight` at `Mathlib/NumberTheory/Height/Projectivization.lean:51`; `TauCeti.AlgebraicGeometry.InvertibleSheaf` at `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean:112` (full subcategory, morphisms are module maps); `TauCeti.AlgebraicGeometry.AbelianVariety` at `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` (group object over Spec K, proper, geometrically integral); `InvertibleSheaf.eulerDegree` and `LineBundleClass.eulerDegree` in `LineBundle/Degree.lean` (documented at lines 21–39, definitions in that file); `eulerDegree_canonicalBundle` at `LineBundle/SerreDuality.lean:168`. No Berkovich space, metrized graph, adelic line bundle, Faltings height or arithmetic intersection pairing exists at the pins; Tau Ceti's `canonicalHeightQuadratic` and `neronTatePairing` are for elliptic curves only (`EllipticCurve/CanonicalHeight/Basic.lean:341, 368`), so no headline is statable and the empty `Suggested.lean` with its docstring is correct.

**Cross-roadmap citations resolved** (on main or at the open head the merge order places before this roadmap): SchemeAndStackFoundations §§0.1, 0.3, 0.20, 0.21, 3.5, 4.11–4.13, 5.1–5.3, 5.5, 5.6, 5.10, 5.12 (main); JacobianChallenge Layer E (main, "Layer E, abelian varieties", cube for an abelian variety's triple product); StableReductionPartII §§4.8, 5.1, 5.2, 5.9, 5.19, 5.21, 6.1, 6.2, 6.8, 6.9, 6.10, 6.21, 6.22 (#1841 head); HeightsRationalPointsAndObstructions §§0.11, 0.16, 0.18–0.20, 0.26–0.29, 5.17a–5.17f (its §5.17a has the symmetric multilinear `arithmeticIntersection` with Cartier recursion and [K′:K] scaling on singular models, §5.17b the adelic metrized bundles); ArithmeticDynamics §§4.1a, 4.3, 4.3a, 4.4, 4.40 (§4.3a builds the global-field quasi-projective adelic Picard group with boundary topology, intersection and normalized heights, as §4.9 says); TropicalAndBerkovichArithmetic §§0.1, 0.12, 0.15, 0.22, 0.23, 2.7, 2.13, 3.1, 3.3, 6.1–6.8 (§6.6 has μ_a = (1/g)(Σ g(v)δ_v + Σ_e ds/(ℓ_e+r_e)) and the constancy of g_μ(K,x) + g_μ(x,x)); GrossZagierAndArithmeticHeights §§2.2–2.4, 2.8, 2.10, 2.12 (Faltings–Hriljac relative to the base field, with the minus sign), 2.13; JacobianChallengePartII §§1.2–1.4, 2.2, 2.4–2.7, 3.1, 3.3–3.13, 4.5–4.9, 5.1–5.2, 6.3; ArakelovGeometryAndAbelianHeights §§1.1–1.15, 2.1, 2.7–2.8, 3.4, 5.0b, 5.3–5.4, 5.9, 6.5 (§6.5 states Bost's bound in both normalizations, −(g/2)log(2π) Deligne and −(g/2)log(2π²) Faltings, exactly as §13.7 uses it); NeronModelsAndSemistableAbelianVarieties §§3.3, 3.9–3.12; MotivesAndAlgebraicCycles §§2.2–2.3; LefschetzPencilsAndVanishingCycles §5.1 (its text makes Jouanolou's Bertini irreducibility part of the target in the generality the README quotes); ComplexComparisonPartII §C5.4. All sections exist with the content cited; no upward citation (every supplier precedes this roadmap in the merge order, StableReductionPartII at line 300 against this roadmap at 324).

**Ownership.** `roadmaps grep` over the open pull requests and main: adelic line bundles appear in ArithmeticDynamics (its global-field §4.3a, which §4.9 identifies with the carrier here), HeightsRationalPointsAndObstructionsPartII (a consumer: it cites this roadmap 55 times) and JacobianChallengePartII (algebraic Poincaré and theta bundles only); admissible metrics in GrossZagierAndArithmeticHeights (archimedean only, no Zhang non-archimedean metrics) and TropicalAndBerkovichArithmetic (graph measures); Faltings' δ-invariant, metrized-graph invariants, Moriwaki heights, potential bigness, the arithmetic Hodge index inequality for adelic bundles and the admissible Deligne pairings have no other owner. Ownership against open pull requests outside the sibling checkouts named in the brief was checked through the grep index only.

**Policy.** No process words, pull-request numbers, LaTeX delimiters or local paths in the README; every target carries a locator; no `lemma`, no `set_option`, no sorry'd data; the README's backticked Lean names are the six pinned library declarations above and the supplier's `bertini_smoothness`, none of this roadmap's own.

## Not verifiable

- moret-bailly-1989 Théorème 2.5 (the arithmetic Noether constant, §10.12): settled as uncertified; the normalization used is the one printed in yuan-2026 p. 89 (line 2998), which I read.
- faltings-1984 Theorem 6 and pp. 401–402 (δ, §§10.11–10.12): settled as uncertified; the theta-integral characterization is taken from wilms-2017 Theorem 1.1, which I read.
- Heinz, Proposition 4.3 (restriction of an admissible diagonal metric, §7.4 route) is cited only through yuan-2026 p. 112 (line 3777), which I read; the Heinz text itself was not consulted.

## Source issues

- **Error** in yuan-2026 at Lemma 2.1(1), printed page 25: the source says π^* : P̂ic(S) → P̂ic(X) is injective for every projective flat π with geometrically connected fibres; it should also assume geometrically reduced fibres (so that π_*O_X = O_S), since the Frobenius of y² = x³+3x+2 over 𝔽₅ kills the order-five class O((1,1) − O); affects a stated result (its applications to smooth curves are unaffected; the README's §3.4 adds the hypothesis).
- **Error** in yuan-2026 at §4.4.1, printed page 78: the source says h_Fal(X_s) ≥ −g log√(2π) with the Faltings-normalized metric of p. 73; it should be −(g/2)log(2π²), the Bost–Gaudron–Rémond bound converted from the Deligne normalization (gaudron-remond-2014 Cor 8.4 and p. 7; the genus-one minimum −0.749 − (1/2)log π ≈ −1.321 lies below −0.919); affects the proof (the constant c there and hence the uniform constants; the README's §13.7 uses the corrected constant).
- **Error** in zhang-2010 at Theorem 1.3.1, printed pages 6–7, copied in yuan-2026 §3.3.1, printed page 49: the source says the archimedean φ equals Σ(2/λ)|∫φ_λ ω_j∧ω̄_k|² for ω_j orthonormal under (i/2)∫α∧β̄; it should be Σ(1/(2λ))|…|² in that basis, since the derivation in Proposition 2.5.3 (p. 38) uses the basis orthonormal under i∫α∧β̄, which is forced by the diagonal restriction of the curvature of O(Δ); affects a stated result (a factor 4 in the explicit value, not positivity; the README's §10.3(2) states the corrected form).
- **Misprint** in zhang-2010 at Proposition 2.5.3, printed page 38: the source writes the second cross term of the curvature of O(Δ̂) as ω_i(y)ω̄_i(y); it should be ω_i(y)ω̄_i(x); affects nothing.
- **Misprint** in yuan-2026 at proof of Theorem 4.14, printed page 94: the source says the key is that D̃_S − Δ̃_S is effective on S/ℚ; it should say D̃_S − c(g)Δ̃_S, which is what the displayed chain on p. 95 proves and uses (for the regular tetrahedron of genus 3 the printed form fails, value 107/48 < 6); affects nothing.
- **Misprint** in yuan-zhang-2025 at §3.2.2, printed page 72: the source says the metric attached to an arithmetic divisor (D,g) is e^{−g/2}; it should be e^{−g}, since §3.2.1 takes g + log|f| continuous, the principal divisor (div f, −log|f|) and the inverse map (div s, −log‖s‖); affects nothing.

# Review of ArakelovGeometryAndAbelianHeightsPartII (pull request #1833 at bd9a1f5)

**Verdict:** needs changes

Incremental re-review of the 6 changed README lines since 12ef4f6 (three locator edits in §6.4, §8.8 and §13.4; `Suggested.lean` and everything outside the folder unchanged). One P3 finding, nothing blocking: the repair of the previous R02 moved two Looper–Silverman–Wilms page locators from the printed page to a page index of the text extraction, against the README's own convention for that source. The previous R01 is repaired; the previous R03 was a false finding and the author was right to leave the Cinkir locator alone. The gate passes on this head (re-run, every check 0), the dependency check reports no problem, and the Lean file elaborates with no output.

## R01 (P3) — Looper–Silverman–Wilms §6 and Proposition 6.1 are on printed page 14, not 17

Location: `TauCetiRoadmap/ArakelovGeometryAndAbelianHeightsPartII/README.md` line 2022, §13.4: "looper-silverman-wilms-2021, Proposition 6.1, p. 17"; and line 1399, §8.8: "over function fields in looper-silverman-wilms-2021, §6, p. 17".

Claim: the function-field lower bound ω_a² ≥ (max(2, g − 1)/(2g + 1))·Σ_v φ(Γ_v) and the Hodge-index application are on p. 17 of arXiv 2101.11593v3.

Witness: the README's reference entry (line 2166) says to use the cited preprint "and its printed numbering". In that PDF, page 14 carries the running head "14 NICOLE LOOPER, …" and opens with "6. An application of the arithmetic Hodge index theorem", followed by Proposition 6.1; PDF page 17 (running head "… FIELDS 17") lies inside §7, the proof of Theorems 1.1 and 1.3. The cached extraction is what misled the previous review: its markers from printed page 13 on run three ahead of the printed pages (phantom markers 10–12 inside printed page 9), so its "page 17" block starts with the printed running head "14" (looper-silverman-wilms-2021 line 688, then §6 at line 689 and Proposition 6.1 at line 704).

Repair: restore "§6, p. 14" at line 1399 and "Proposition 6.1, p. 14" at line 2022 (the text the previous review had asked to change). Tested: `pdftotext -f 14 -l 14` on the cached PDF prints the §6 heading and Proposition 6.1 on that page; page 17 does not contain them.

## Previous findings

- R01 — repaired: §6.4 now reads "(gao-habegger-2019, §A.2, p. 56; §A.3, pp. 56–57; …)"; in the Gao–Habegger extraction the printed and extraction pages agree (marker "page 57" followed by the printed "57", line 2637–2638), §A.3 begins at line 2625 on p. 56 and the Moriwaki-height Silverman limit is the bullet at lines 2651–2655 on p. 57.
- R02 — partly repaired, and the repair introduced this report's R01: both occurrences were changed from "p. 14" to "p. 17" as requested, but by the README's declared printed numbering (line 2166) the correct page is 14; the previous witness read the extraction's page markers, which are offset by three there.
- R03 — not repaired, and no repair is needed: the finding was false. Cinkir 2015 p. 18 (cinkir-2015 lines 1051–1057) does carry a concluding summary of the established inequalities, ending with φ(Γ) ≥ (17/288)ℓ(Γ) for g = 3; the previous search for "17/288" missed it because the extraction prints the fraction as "17288" (also at lines 42, 50, 824, 827, 833). The README's "Introduction, item (iii), p. 1; concluding summary, p. 18 (arXiv v1)" is correct as it stands.

## Verified sound

**Gate and dependency check.** The worker's gate at bd9a1f5 reports every check 0 and OK; I re-ran it on this head with the same result (set_option, blob, latex, prnum, sorry-data, residue, private-paths, imports, readme-ids-missing, depcheck, stray-files, outside-folder, source-material, build all 0). The dependency check with `--movable`:

```
depcheck: 239 roadmaps, 2344 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `git diff --stat origin/main...HEAD` outside the roadmap folder is empty. `lake env lean` on `Suggested.lean` exits 0 with no output: the file declares nothing (its docstring lists the unstatable headlines, unchanged since the previous review, whose check of the pins stands), so there is no `sorry` warning and no `#check` comparison to make.

**The changed passages.** All three edits change only the parenthetical locator; the statements, routes, Checks and `*Needs:*` lines of §6.4, §8.8 and §13.4 are byte-identical to the head the previous review read, and their consumers (§8.7's route cites §8.8's source, §13.3 and §13.10 use §13.4) are unchanged. Locators re-read at this head:

| Target | Source and locator | Checked |
|---|---|---|
| 6.4 Silverman–Tate and specialization with Moriwaki heights | gao-habegger-2019 §A.2 p. 56 (lines 2596–2624), §A.3 pp. 56–57 (lines 2625–2660) | height inequality for a big polarization, the Moriwaki-height version of Silverman's limit via the height machine of Prop. A.1, ample comparison bundle on S̄: as stated; locator now correct |
| 8.8 arithmetic Hodge index inequality | yuan-zhang-2025 Thm 6.5.8 p. 209 (lines 8381–8389); looper-silverman-wilms-2021 §6 printed p. 14 (lines 689–703: the inequality part for X², N nef and big, M·N = 0) | hypotheses and the pseudo-effectivity conclusion exactly as stated; only the LSW page is wrong (R01) |
| 13.4 lower bounds of ω_a² by φ | looper-silverman-wilms-2021 Prop. 6.1 printed p. 14 (lines 704–707: max(2, g − 1), and 2(g − 1) in characteristic 0 or for hyperelliptic X); cinkir-2015 p. 1 line 42 and p. 18 lines 1051–1057 | statement matches §13.4(1); c(3) = 17/288 on both cited pages; only the LSW page is wrong (R01) |
| 8.7 (consumer of §8.8's source) | yuan-2026 Thm 2.8 p. 34 (lines 1150–1160) | π_*⟨M̄, V⟩ = 0 for vertical V and π_*⟨M̄, M̄⟩ = −ι^*Θ̄ in P̂ic(S/k)_ℚ: as stated |
| 13.3 (consumer of §13.4's objects) | yuan-2026 §4.5.1 p. 86 (lines 2893–2898), §4.5.2 p. 89 (lines 2996–3001) | ω_a² = ω²_𝒞 − ε(C), Noether ω²_𝒞 = 12h_Fal − δ over a function field; arithmetic Noether with −4g[K:ℚ]log(2π): as stated |
| 13.10 (consumer of §13.4) | yuan-2026 Thm 1.4 pp. 14–15 (lines 477–494), Thm 4.11 p. 85 (lines 2871–2880) | c₃·max{h_Fal, 1} ≤ [ω_a²] ≤ c₄·max{h_Fal, 1}, [·] = division by [K:ℚ] for number fields only, non-isotrivial hypothesis in the function-field case; function-field constants 4^{−4g²}/12 and 12: as stated |

The seeded sample's other targets (2.6, 3.4, 4.3, 4.6, 7.2a, 7.6, 8.1, 9.3, 10.13, 12.2, 12.3, 13.1) do not fall in the changed lines; the previous review's sample and locator list (fifteen targets and some ninety further locators) stand for them.

**Adversarial table.** New rows for the changed statements, with computed values; the rows for untouched statements are carried from the previous review (marked r1), whose values I did not recompute.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 6.4(2) normalization of the limit | S′ → S of degree 2, x defined over K′ = k₀(S′); base height degree-one normalized | h_S∘ρ/h_{S′} → deg ρ = 2; K′-height of x is 2·ĥ_{K,A}(x), divided by [K′:K] = 2 gives ĥ_{K,A}(x); the ratio ĥ^B(σ_x(t))/h^B_S(ρ(t)) is unchanged by rewriting both through S′ | the stated division by [K′ : K] is the one that makes the limit independent of the cover | none |
| 6.4(1) scope without bigness | polarization with every H̄ᵢ nef but not big (volume 0) on B; abelian scheme over S | the bound |ĥ − h| ≤ c·max{1, h_S} uses only additivity, functoriality and boundedness below (moriwaki-2000 Prop 3.3.7(2)–(3)), none of which needs vol > 0; Northcott (finiteness) fails when vol = 0, which is why (2) keeps bigness: with vol = 0 the base height can be bounded and h_S → ∞ is impossible | scope split as stated | none |
| 8.8, n = 1, g = 0 | X = ℙ¹_F, M of degree 0, so M ≅ O; M̄ = (O, f) with f a vertical Green function | −π_*⟨M̄, M̄⟩ has degree −∫ f c₁(M̄) ≥ 0 at every place (Calabi inequality, §7.2a; archimedean ∫ df∧dᶜf ≥ 0): for the clamp metric on ℙ¹/ℚ_p the value is +log p ≥ 0 | pseudo-effective as stated, strict for a non-constant f | none |
| 8.8 and LSW's choice of bundles | X² with a = g − 1, N̄ = f^*Θ̄/a, M̄ = aD − W (§13.4 route) | f^*Θ̄/a = (g + 1)W − 2aD − π^*P/a, which is LSW's N (line 714) with ω̂₁₂ = W, Δ_a = D, ω_a² = deg P; LSW's M = (g − 1)Δ_a − ω̂₁₂ = M̄ | the two roadmap sections and the source use the same bundles | none |
| 13.4(1) the bound at g = 2, 3 | hyperelliptic g = 2 with φ = 1/12; g = 3 | g = 2: ((2−1)/5)·(1/12) = 1/60 ≤ ω_a² = (2/5)(1/12) = 1/30 (equality form (2) gives 1/30); LSW's max(2, g−1) = 2 at g = 2, 3 gives 2/5 and 2/7, i.e. the 2(g−1) form at g = 2 and twice the README's (g−1)/(2g+1) at g = 3 | README's (1) states the weaker uniform coefficient and names LSW's stronger one in words | none |
| Conventions: Green function and degree sign (r1) | O on Spec ℤ, ‖1‖ = e⁻¹, e⁻², f = 2 | degrees 1, 2; tensor e⁻³ gives 3; for f = 2 finite term log 2 cancels −log 2 | consistent with (div f, −log|f|) | none |
| Conventions: Faltings vs Deligne norm (r1) | g = 1, 2 | squared-norm ratio π^g; h_Del − h_Fal = (g/2)log π: 0.5724 (g = 1), 1.1447 (g = 2) | matches gaudron-remond-2014 p. 7 line 322 | none |
| Conventions: Θ = Δ_J^*(P^∨), h_Θ̄ = 2ĥ (r1) | elliptic fibre, [2] | Δ_J^*P = O(−(θ + [−1]^*θ)) (Yuan Thm A.3(4)), degree −2, so Θ has degree 2; [2] multiplies 2ĥ by 4 | sign fixed by the dual | none |
| Conventions: unit loop τ and ramified renormalization (r1) | ℓ = 1, 2 | τ = ℓ/12 = 1/12, 1/6 | matches BR Thm 14.1 and scaling | none |
| 0.3 Siu on Spec ℤ (r1) | A = O(2), B = O(1), ε = 1 | 2 − 1·1 = 1 = vol(O(1)) | equality case | none |
| 0.3 geometric volume at d = 0 (r1) | Spec 𝔽₂, Spec 𝔽₄ over 𝔽₂ | h⁰ = 1, 2 for every m; vol = 1, 2; no mixed term | consistent with §3.1's deg_k[X] | none |
| 1.2 strict scaling clause (r1) | normal U; non-normal U with torsion in Div(U) | ‖aD‖ = |a|‖D‖ unless D̄ ≠ 0 and aD̄ = 0 | matches YZ Lemma 2.4.1(3) | none |
| 1.2 Spec ℤ with E₀ = (0,1) (r1) | (0,c) | ‖(0,c)‖ = |c|; nonzero finite part has norm ∞ | model group complete | none |
| 1.3 irrational coefficient on Spec ℤ[1/2] (r1) | aᵢ[2] → √2[2] | 2-coordinate √2 mod ℤ irrational; no rational model representative | §1.8 presentation separates it | none |
| 1.4 principal divisor of 2 (r1) | Spec ℤ | finite log 2, Green −log 2, degree 0; O(1) degree 1 not principal | kernel = P̂r_mod | none |
| 1.7 growth at 0 on ℂ^× (r1) | (log|z|)² vs log|z| | ratio (log|z|)²/|log|z|| → ∞ | excluded by the boundary norm | none |
| 1.8 P̂ic⁰(ℚ) (r1) | K = ℚ | ℚ^×/{±1} free on primes; (K^×/μ)⊗ℝ/ℤ = ⊕_p ℝ/ℤ | matches YZ Lemma 2.6.1 | none |
| 2.4 archimedean test exponents (r1) | t = 1/2, 2 | |1+1|^{1/2} = √2 ≤ 2; |1+1|² = 4 > 2 | t ≤ 1 required | none |
| 2.7 canonical metric on ℙ¹ over trivially valued K (r1) | |t| = 2, 1/2; φ(t) = t² | ‖X₀‖ = 1/2 at |t| = 2, 1 at |t| = 1/2; ‖X₀²‖ = 1/4 = ‖φ^*X₀‖ at |t| = 4 | tensor and pullback laws hold; constant metric fails | none |
| 3.1 d = 0 projection formula (r1) | 𝔽₄/𝔽₂; 𝔽₂(t) ⊂ 𝔽₂(u) ⊂ 𝔽₂(v), u² = t, v² = u | 2 = 2·1; 4 = 2·2 (inseparable) | matches YZ Prop 4.1.2 | none |
| 3.4 injectivity needs geometric reducedness (r1) | E: y² = x³+3x+2 over 𝔽₅, Frobenius | #E = 5; P = (1,1) of order 5; F^*O(P−O) = O(5P−5O) = O | README's added hypothesis needed | none |
| 3.5 nonproper mass (r1) | 𝔾_m ⊂ ℙ¹_ℚ, max O(1) | mass 1 at every place; trivial-metric O gives 0 | mass is the adelic intersection | none |
| 4.1 small sections on Spec ℤ (r1) | c = −1, 0, 1 | #Ĥ⁰ = 1, 3, 5; ĥ⁰ = 0, log 3, log 5 | matches Ĥ⁰ = {|n| ≤ e^c} | none |
| 4.3(4) large twist (r1) | ℙ¹_ℚ, L̄ = max O(1) ⊗ O(−1), N̄ = O(1) | c < 1: volume 0; c > 1: top self-intersection 2(c−1) > 0 | small twist insufficient | none |
| 4.4 pairing on ℙ¹ × S (r1) | S = Spec ℤ, M = O(1), max vs Fubini–Study | ⟨L,L⟩ degrees 2 and 5/2 | first summand detectable | none |
| 4.5 finite cover (r1) | degree 2, M̄^d = 1, 3, 0 | pullback 2, 6, 0 | positivity equivalent both ways | none |
| 4.6 normalizations (r1) | [1:2] over ℚ and quadratic K; [1:t] over k(t), k(u), t = u² | log 2 absolute, 2 log 2 relative; 1 and 2 | matches Yuan p. 64 | none |
| 4.7(2) small twist (r1) | N̄ of degree 1 | (L̄ + cN̄)^d = L̄^d + dcL̃^{d−1} > 0; h shifts by c/a_K | matches YZ proof of Thm 5.3.7 | none |
| 4.8 point case (r1) | Spec K, [K:ℚ] = 2, O(1) | raw 2/(2·1·1) = 1 = e₁; without a_K: 2 ≤ 1 false | a_K necessary | none |
| 5.1 uniqueness needs q > 1 (r1) | f = id, q = 1 on ℙ¹ | O(1) and O(2) both invariant | hypothesis q > 1 retained | none |
| 5.4 Deligne vs Faltings on the Hodge line (r1) | g = 2, [K:ℚ] = 2 | degree 2h, absolute h; Deligne shift log π, not 2 log π | consistent | none |
| 6.3 quadraticity (r1) | P of order 2; height a at [0],[1],[2] | 0; 0, a, 4a | quadratic, not linear | none |
| 7.2a clamp example (r1) | ℙ¹/ℚ_p, max(|x₀|,|x₁|) vs max(|x₀|,|px₁|) | c₁ = δ_{ζ₁} − δ_{ζ_p}; M̄² = −log p = −∫(f′)² | sign and equality clause confirmed | none |
| 7.3 banana measure (r1) | genus 2, three unit edges | r_e = 1/2; density 1/3 per edge; total 1 | matches Yuan Prop A.5 | none |
| 7.5 / 8.3 circle Green value (r1) | circle of length n | g_μ(x,x) = n/12 | ‖·‖_a = ‖·‖_model·e^{n/12} | none |
| 8.6 non-integrable continuous metric (r1) | f = Σ 2⁻ⁿcos(2π4ⁿx) on ℂ/(ℤ+iℤ) | Laplacian coefficient at (4ⁿ,0): −2π²·8ⁿ, unbounded | not integrable | none |
| 8.7 quadratic field (r1) | absolute theta height a, [K:ℚ] = 2 | deĝ(ι^*Θ̄) = 4a; deĝ⟨M̄,M̄⟩ = −4a; normalized −2a | factor [K:ℚ] needed | none |
| 8.8 sharpness and strictness (r1) | M̄ = π^*N̄; M̄ = (O, clamp) | 0; −log p < 0 | inequality not strict in general | none |
| 9.1 expansion (r1) | general d, g; d = 1, g = 2; d = 0; g = 1 | d⁴⟨w,w⟩ + 4d³⟨w,ᾱ⟩ − (4g−4)d²⟨ᾱ,ᾱ⟩; A + 8b; 0 = 0; 4x^*w | identities agree | none |
| 9.2 coefficients (r1) | g = 2, 3 | 8, 24; 32, 384; 8, 12; 16, 128 | matches Yuan Thm 2.10 | none |
| 9.3 cancellation (r1) | g = 2, 3 | −1/8 + 32/256 = 0; −1/24 + 384/9216 = 0 | w = i^*Θ̄/(4g(g−1)) + π^*P/(4g(g−1)) | none |
| 10.1 one-loop graph (r1) | g = 2, ℓ = 1 | ε = 1/6, τ = 1/12, φ = 1/12 by two formulas | agree | none |
| 10.2(3) constants (r1) | t(3), t(4), t(5), limit | 0.0545; 3/88 > 1/39; 1/25; → 1/14 | φ ≥ ℓ/39 | none |
| 10.3(2) spectral coefficient (r1) | (i/2) vs i orthonormal bases | φ = Σ(1/(2λ))|∫φ_λω_j∧ω̄_k|² in the (i/2) basis | README correct; source prints 2/λ | none |
| 10.7 expansion (r1) | g = 2, 3 | 12g − 4: 20, 32; Φ coefficient −8 | matches Yuan Thm 3.6 | none |
| 10.9 coefficient (r1) | g = 2 | 587/2 P ≤ 300P; 12/300 = 1/25 | matches Yuan Thm 3.8 | none |
| 10.9a closures (r1) | smooth x; two components | signs sum 0; correction (p̄ − ē + A)·A = 0, ·B = 0 | correction necessary and sufficient | none |
| 10.10 place weights (r1) | y² = (x² − t² − 1)(x−1)(x−2)(x+1/2) over ℚ(t), v = (t²+1) | φ_v = 1/12, deg v = 2, contribution 1/6 | as stated | none |
| 10.11 g = 1 (r1) | Wilms formula | δ = −24I − 8 log 2π; δ > −9 | Fourier normalization necessary | none |
| 10.12 Noether constant (r1) | g = 2, [K:ℚ] = 1 | −8 log 2π | matches Yuan p. 89 | none |
| 10.13 Green values (r1) | g = 2 unit node | δ + ε = 7/6 | sign of s invisible | none |
| 11.1 boundary approximation (r1) | a = 1/156 | 1/39 − 2a = 1/78 > 0 | matches Yuan p. 58 | none |
| 11.3 lower bound (r1) | g = 2, d = 1, [K:ℚ] = 2 | 4c₀/5 | as stated | none |
| 11.4 bigness of w (r1) | g = 2, d = 0, [F:k] = 2; d = 1 | a = 16; 32/8 = 4 = 2·[F:k]; 2·16·P¹ | matches Yuan p. 40 | none |
| 12.2 selected terms (r1) | Y = ℙ¹_F, [F:k] = 2, L = O(2), m = 1, 2 | 4, 8 = a^m deg_k[S] | as stated | none |
| 12.3 fibre powers (r1) | m = 1, 2 | 4, 16; selected term 8 with binomial 2 | as stated | none |
| 12.4 mixed-dimension degree bound (r1) | m = 2, Z = ({p}×C) ∪ (C×{p}) ∪ {(q,q)} | deg 3; d = 1: 2 ≤ 3; d = 2 false | d = m − max dim | none |
| 12.5 generically finite (r1) | blow-up of a genus-2 Jacobian at a point | (2θ)² = 8 > 0, degree 0 on the exceptional curve | nef big, not ample | none |
| 13.1 scaling (r1) | degree 3 on a degree-2 semistable extension | h_Fal = 3/2 | as stated | none |
| 13.3 hyperelliptic consistency (r1) | g = 2, h = 1/10, δ = 1, ε = 1/6 | W_model = 1/5, W_a = 1/30 = (2/5)(1/12) | Zhang's correction and Cor 1.3.3 agree | none |
| 13.4 Hodge-index expansion (r1) | a = g−1, N = (g+1)W − 2aD − π^*P/a, M = aD − W | M·N = 0, N² = 8g(g−1)³ (192 at g = 3), M² = −2a³; deĝ(M̄²N̄) = 2a³φ − 2a²(2g+1)ω² ≤ 0 | ω_a² ≥ ((g−1)/(2g+1))φ | R01 locator only |
| 13.4(3) constants (r1) | c(2) = 1/27, c(3) = 17/288, c(4) = 3/88, c ≥ 1/25, c → 1/14 | A = 213.5 (107.25 hyperelliptic), 96.94, 139, ≤ 109.625, → 47 | matches Yuan pp. 87–88 | none |
| 13.6 numerics (r1) | g = 1, 2 | −10.5441, −21.0883 | strict by Wilms | none |
| 13.7 Bost constant (r1) | g = 1 | h_Fal min ≈ −1.321 > −1.491; c = 1.4913 + 1 | README's constant right | none |
| 13.8 tetrahedron (r1) | K₄, unit edges, g = 3 | ε = 11/6; φ = 17/48; D̃ value 107/48 < 6; D̃ − c(3)Δ = 15/8 > 0 | proved c(g) version holds | none |
| 13.9 constant identity (r1) | g = 1, 2 | 6 log(2π²) = 17.8956, 35.79 | as stated | none |
| 13.10 convex combination (r1) | h ≤ 1; h ≥ max(1, 24|c₅|) | lower constant c′; h/12 + c₅ ≥ h/24 | c₃, c₄ exist | none |

**Library declarations, cross-roadmap citations, ownership, declared gaps, policy.** The diff touches no Lean name, no supplier citation and no gap: the previous review's resolution of the six pinned library declarations, of every cross-roadmap citation (SchemeAndStackFoundations, JacobianChallenge, StableReductionPartII at #1841's head, HeightsRationalPointsAndObstructions, ArithmeticDynamics, TropicalAndBerkovichArithmetic, GrossZagierAndArithmeticHeights, JacobianChallengePartII, ArakelovGeometryAndAbelianHeights, NeronModelsAndSemistableAbelianVarieties, MotivesAndAlgebraicCycles, LefschetzPencilsAndVanishingCycles, ComplexComparisonPartII), of the four declared gaps and of ownership stands unchanged; the dependency check above confirms the direction mechanically at this head. The edited lines contain no process word, pull-request number, LaTeX delimiter or local path (gate: prnum, latex, round-labels, private-paths all 0). Ownership against open pull requests outside the sibling checkouts the brief names was checked only through the grep index in the previous round.

## Not verifiable

- moret-bailly-1989 Théorème 2.5 (arithmetic Noether constant, §10.12): settled as uncertified; the normalization is the one printed in yuan-2026 p. 89 (lines 2996–2998), read this round.
- faltings-1984 Theorem 6 and pp. 401–402 (§§10.11–10.12): settled as uncertified; the theta-integral characterization is taken from wilms-2017 Theorem 1.1 (previous round).
- Heinz, Proposition 4.3 (§7.4 route): cited only through yuan-2026 p. 112; the Heinz text itself was not consulted (unchanged since the previous round).

## Source issues

- none

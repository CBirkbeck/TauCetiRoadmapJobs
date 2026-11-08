# Review of ArakelovGeometryAndAbelianHeightsPartII (pull request #1833 at 1dce7a6)

**Verdict:** accepted

Incremental re-review of the 4 changed README lines since bd9a1f5: two locator edits, in §8.8 (line 1399) and §13.4 (line 2022), each changing "looper-silverman-wilms-2021 … p. 17" back to "p. 14". `Suggested.lean`, `metadata.toml` and everything outside the folder are unchanged. No finding, new or carried: the previous R01 is repaired exactly as asked, the gate passes on this head (re-run, every check 0), the dependency check reports no problem, and `Suggested.lean` elaborates with no output.

## Previous findings

- R01 — repaired: line 1399 now reads "over function fields in looper-silverman-wilms-2021, §6, p. 14" and line 2022 "looper-silverman-wilms-2021, Proposition 6.1, p. 14". In the cached PDF of arXiv:2101.11593v3, page 14 carries the running head "14 NICOLE LOOPER, …", the heading of §6 and Proposition 6.1 (its statement with max(2, g − 1), and 2(g − 1) in characteristic 0 or for hyperelliptic X); page 17 lies inside §7 (the proof of Theorems 1.1 and 1.3). The PDF page index equals the printed page, so the README's convention "the cited preprint version and its printed numbering" (line 2166) is met. The repair introduced nothing else: the diff touches only the two parenthesised locators.

## Verified sound

**Gate and dependency check.** The worker's gate at 1dce7a6 reports every check 0 and OK, including build=0. I re-ran the gate on this head: set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder, source-material all 0, OK. The dependency check with `--movable`:

```
depcheck: 239 roadmaps, 2427 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `git diff --stat origin/main...HEAD` outside the roadmap folder is empty. `lake env lean` on `TauCetiRoadmap/ArakelovGeometryAndAbelianHeightsPartII/Suggested.lean` exits 0 with no output: the file is unchanged since the first review and declares nothing (its module docstring lists every headline theorem as not statable at the pins, with the missing carrier for each), so there is no `sorry` warning, no `#check` comparison and no one-tactic probe to run.

**The changed passages.** Both edits change only the page number inside a parenthetical locator; the statements, routes, Checks and `*Needs:*` lines of §8.8 and §13.4 are byte-identical to the head the previous review read, and their consumers (§8.7, §13.3, §13.10, and the §13.4 route's use of §8.8 with n = 2) are unchanged. Locators re-read at this head against the PDF (`pdftotext -f 14 -l 14` and `-f 15 -l 15`) and the cached extraction:

| Target | Source and locator | Checked |
|---|---|---|
| 8.8 arithmetic Hodge index inequality | looper-silverman-wilms-2021 §6, printed p. 14 (PDF p. 14; extraction lines 689–703 under the offset marker "page 17") | the inequality part for X²: N nef, N big, M·N = 0 implies M·M·N ≤ 0, stated for integrable line bundles over the function field, depending only on the numerical class of N; the README's §8.8 is the general Yuan–Zhang form (Theorem 6.5.8, unchanged) of which this is the n = 2 curve-square case, as the README says |
| 13.4 lower bounds of ω_a² by φ | looper-silverman-wilms-2021 Proposition 6.1, printed p. 14 (PDF p. 14; extraction lines 704–707) | any smooth projective geometrically connected curve of genus g ≥ 2 over K satisfies ω_a² ≥ (max(2, g − 1)/(2g + 1))·Σ_v φ(Γ_v); max(2, g − 1) replaced by 2(g − 1) when char k = 0 or X is hyperelliptic: as the README's clause (1) states |
| 13.4 route (consumer of the same page) | looper-silverman-wilms-2021 proof of Proposition 6.1, printed pp. 14–15 | N = (g + 1)ω̂₁₂ − 2(g − 1)Δ_a − ω_a²/(g − 1), M = (g − 1)Δ_a − ω̂₁₂, vol(N) = N² = 8g(g − 1)³ > 0, M·N = 0: the bundles and values of the README route |

**Adversarial table.** New rows for the changed statements, with values computed at this head; the rows for untouched statements are carried from the previous reviews (r1 = first review, r2 = the review at bd9a1f5), whose values I did not recompute.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 8.8 at the LSW locator, n = 2 on X² | g = 3: W = ω̂₁₂, D = Δ_a, N̄ = f^*Θ̄/a with a = 2 | N² = 8·3·8 = 192 > 0 (source p. 15: 8g(g − 1)³); M·N = 0; §8.8 gives deĝ(M̄²N̄) ≤ 0 | the source's inequality (p. 14) and the README's n = 2 instance use the same bundles and sign | none |
| 13.4(1) coefficient versus Proposition 6.1 (p. 14) | g = 2, 3, 4 | README (g − 1)/(2g + 1): 1/5, 2/7, 1/3; LSW max(2, g − 1)/(2g + 1): 2/5, 2/7, 1/3; hyperelliptic or char 0 form 2(g − 1)/(2g + 1): 2/5, 4/7, 2/3 | README's (1) is implied by the source for every g ≥ 2 and names the stronger forms in words | none |
| 13.4(1) at g = 2 with the equality of (2) | hyperelliptic g = 2, φ = 1/12 | (1): ω_a² ≥ 1/60; (2): ω_a² = (2/5)(1/12) = 1/30 ≥ 1/60 | (1) and (2) consistent | none |
| 6.4(2) normalization of the limit (r2) | S′ → S of degree 2, x over K′ = k₀(S′) | h_S∘ρ/h_{S′} → 2; K′-height 2·ĥ, divided by [K′:K] = 2 | division by [K′ : K] makes the limit cover-independent | none |
| 6.4(1) scope without bigness (r2) | nef, non-big polarization on B | bound uses additivity, functoriality, boundedness below only; Northcott fails when vol = 0 | scope split as stated | none |
| 8.8, n = 1, g = 0 (r2) | ℙ¹_F, M̄ = (O, f) vertical | −∫ f c₁(M̄) ≥ 0; clamp metric on ℙ¹/ℚ_p: +log p | pseudo-effective, strict for non-constant f | none |
| 8.8 and LSW's choice of bundles (r2) | X², a = g − 1, N̄ = f^*Θ̄/a, M̄ = aD − W | f^*Θ̄/a = (g + 1)W − 2aD − π^*P/a = LSW's N; LSW's M = M̄ | same bundles | none |
| 13.4(1) the bound at g = 2, 3 (r2) | hyperelliptic g = 2, φ = 1/12; g = 3 | 1/60 ≤ 1/30; LSW 2/5 and 2/7 | README states the weaker uniform coefficient | none |
| Conventions: Green function and degree sign (r1) | O on Spec ℤ, ‖1‖ = e⁻¹, e⁻², f = 2 | degrees 1, 2; tensor 3; log 2 cancels −log 2 | consistent | none |
| Conventions: Faltings vs Deligne norm (r1) | g = 1, 2 | ratio π^g; h_Del − h_Fal = 0.5724, 1.1447 | matches gaudron-remond-2014 p. 7 | none |
| Conventions: Θ = Δ_J^*(P^∨), h_Θ̄ = 2ĥ (r1) | elliptic fibre, [2] | Δ_J^*P degree −2, Θ degree 2; [2] multiplies by 4 | sign fixed by the dual | none |
| Conventions: unit loop τ (r1) | ℓ = 1, 2 | τ = 1/12, 1/6 | matches BR Thm 14.1 | none |
| 0.3 Siu on Spec ℤ (r1) | A = O(2), B = O(1), ε = 1 | 2 − 1 = 1 = vol(O(1)) | equality case | none |
| 0.3 geometric volume at d = 0 (r1) | Spec 𝔽₂, Spec 𝔽₄ | h⁰ = 1, 2; vol = 1, 2 | consistent with §3.1 | none |
| 1.2 strict scaling clause (r1) | normal U; non-normal U with torsion | ‖aD‖ = |a|‖D‖ unless D̄ ≠ 0, aD̄ = 0 | matches YZ Lemma 2.4.1(3) | none |
| 1.2 Spec ℤ with E₀ = (0,1) (r1) | (0,c) | ‖(0,c)‖ = |c|; nonzero finite part norm ∞ | complete | none |
| 1.3 irrational coefficient on Spec ℤ[1/2] (r1) | √2[2] | 2-coordinate irrational mod ℤ | §1.8 separates it | none |
| 1.4 principal divisor of 2 (r1) | Spec ℤ | degree 0; O(1) degree 1 not principal | kernel = P̂r_mod | none |
| 1.7 growth at 0 on ℂ^× (r1) | (log|z|)² vs log|z| | ratio → ∞ | excluded | none |
| 1.8 P̂ic⁰(ℚ) (r1) | K = ℚ | ⊕_p ℝ/ℤ | matches YZ Lemma 2.6.1 | none |
| 2.4 archimedean test exponents (r1) | t = 1/2, 2 | √2 ≤ 2; 4 > 2 | t ≤ 1 required | none |
| 2.7 canonical metric on ℙ¹, trivially valued K (r1) | |t| = 2, 1/2; φ(t) = t² | ‖X₀‖ = 1/2, 1; ‖X₀²‖ = 1/4 = ‖φ^*X₀‖ | tensor and pullback laws hold | none |
| 3.1 d = 0 projection formula (r1) | 𝔽₄/𝔽₂; inseparable tower | 2 = 2·1; 4 = 2·2 | matches YZ Prop 4.1.2 | none |
| 3.4 injectivity needs geometric reducedness (r1) | E over 𝔽₅, Frobenius | #E = 5; F^*O(P−O) = O | hypothesis needed | none |
| 3.5 nonproper mass (r1) | 𝔾_m ⊂ ℙ¹_ℚ | mass 1; trivial metric 0 | as stated | none |
| 4.1 small sections on Spec ℤ (r1) | c = −1, 0, 1 | #Ĥ⁰ = 1, 3, 5 | matches | none |
| 4.3(4) large twist (r1) | ℙ¹_ℚ, max O(1) ⊗ O(−1), N̄ = O(1) | c < 1: 0; c > 1: 2(c−1) | small twist insufficient | none |
| 4.4 pairing on ℙ¹ × S (r1) | S = Spec ℤ, M = O(1) | degrees 2 and 5/2 | first summand detectable | none |
| 4.5 finite cover (r1) | degree 2, M̄^d = 1, 3, 0 | 2, 6, 0 | positivity equivalent | none |
| 4.6 normalizations (r1) | [1:2] over ℚ, quadratic K; [1:t] | log 2, 2 log 2; 1, 2 | matches Yuan p. 64 | none |
| 4.7(2) small twist (r1) | N̄ of degree 1 | L̄^d + dcL̃^{d−1} > 0 | matches YZ Thm 5.3.7 | none |
| 4.8 point case (r1) | Spec K, [K:ℚ] = 2, O(1) | 1 = e₁; without a_K false | a_K necessary | none |
| 5.1 uniqueness needs q > 1 (r1) | id, q = 1 on ℙ¹ | O(1), O(2) both invariant | q > 1 retained | none |
| 5.4 Deligne vs Faltings on the Hodge line (r1) | g = 2, [K:ℚ] = 2 | shift log π | consistent | none |
| 6.3 quadraticity (r1) | order 2; a at [0],[1],[2] | 0; 0, a, 4a | quadratic | none |
| 7.2a clamp example (r1) | ℙ¹/ℚ_p | c₁ = δ_{ζ₁} − δ_{ζ_p}; M̄² = −log p | sign confirmed | none |
| 7.3 banana measure (r1) | genus 2, three unit edges | 1/3 per edge | matches Yuan Prop A.5 | none |
| 7.5 / 8.3 circle Green value (r1) | circle of length n | n/12 | as stated | none |
| 8.6 non-integrable continuous metric (r1) | lacunary f on ℂ/(ℤ+iℤ) | coefficient −2π²·8ⁿ | not integrable | none |
| 8.7 quadratic field (r1) | [K:ℚ] = 2 | 4a; −4a; −2a | factor needed | none |
| 8.8 sharpness and strictness (r1) | M̄ = π^*N̄; clamp | 0; −log p | not strict in general | none |
| 9.1 expansion (r1) | general d, g; d = 1, g = 2; d = 0; g = 1 | d⁴⟨w,w⟩ + 4d³⟨w,ᾱ⟩ − (4g−4)d²⟨ᾱ,ᾱ⟩ | identities agree | none |
| 9.2 coefficients (r1) | g = 2, 3 | 8, 24; 32, 384; 8, 12; 16, 128 | matches Yuan Thm 2.10 | none |
| 9.3 cancellation (r1) | g = 2, 3 | −1/8 + 32/256 = 0; −1/24 + 384/9216 = 0 | as stated | none |
| 10.1 one-loop graph (r1) | g = 2, ℓ = 1 | ε = 1/6, τ = 1/12, φ = 1/12 | agree | none |
| 10.2(3) constants (r1) | t(3), t(4), t(5), limit | 0.0545; 3/88; 1/25; → 1/14 | φ ≥ ℓ/39 | none |
| 10.3(2) spectral coefficient (r1) | (i/2) vs i bases | 1/(2λ) in the (i/2) basis | README correct | none |
| 10.7 expansion (r1) | g = 2, 3 | 20, 32; −8 | matches Yuan Thm 3.6 | none |
| 10.9 coefficient (r1) | g = 2 | 587/2 ≤ 300; 1/25 | matches Yuan Thm 3.8 | none |
| 10.9a closures (r1) | smooth x; two components | correction ·A = 0, ·B = 0 | necessary and sufficient | none |
| 10.10 place weights (r1) | genus-2 curve over ℚ(t), v = (t²+1) | φ_v = 1/12, deg 2, contribution 1/6 | as stated | none |
| 10.11 g = 1 (r1) | Wilms formula | δ = −24I − 8 log 2π > −9 | normalization necessary | none |
| 10.12 Noether constant (r1) | g = 2, [K:ℚ] = 1 | −8 log 2π | matches Yuan p. 89 | none |
| 10.13 Green values (r1) | g = 2 unit node | δ + ε = 7/6 | as stated | none |
| 11.1 boundary approximation (r1) | a = 1/156 | 1/78 > 0 | matches Yuan p. 58 | none |
| 11.3 lower bound (r1) | g = 2, d = 1, [K:ℚ] = 2 | 4c₀/5 | as stated | none |
| 11.4 bigness of w (r1) | g = 2, d = 0, [F:k] = 2; d = 1 | 16; 4 = 2·[F:k]; 2·16·P¹ | matches Yuan p. 40 | none |
| 12.2 selected terms (r1) | ℙ¹_F, [F:k] = 2, O(2), m = 1, 2 | 4, 8 | as stated | none |
| 12.3 fibre powers (r1) | m = 1, 2 | 4, 16; 8 with binomial 2 | as stated | none |
| 12.4 mixed-dimension degree bound (r1) | m = 2, three-component Z | deg 3; d = 1 holds, d = 2 fails | d = m − max dim | none |
| 12.5 generically finite (r1) | blow-up of a genus-2 Jacobian | (2θ)² = 8; 0 on exceptional curve | nef big, not ample | none |
| 13.1 scaling (r1) | degree 3 on degree-2 extension | 3/2 | as stated | none |
| 13.3 hyperelliptic consistency (r1) | g = 2, h = 1/10, δ = 1, ε = 1/6 | 1/5; 1/30 | agree | none |
| 13.4 Hodge-index expansion (r1) | a = g−1, N, M as in the route | M·N = 0, N² = 8g(g−1)³, M² = −2a³; 2a³φ − 2a²(2g+1)ω² ≤ 0 | ω_a² ≥ ((g−1)/(2g+1))φ | none (locator now right) |
| 13.4(3) constants (r1) | c(2) = 1/27, c(3) = 17/288, c(4) = 3/88, ≥ 1/25, → 1/14 | 213.5 (107.25), 96.94, 139, ≤ 109.625, → 47 | matches Yuan pp. 87–88 | none |
| 13.6 numerics (r1) | g = 1, 2 | −10.5441, −21.0883 | strict | none |
| 13.7 Bost constant (r1) | g = 1 | −1.321 > −1.491 | as stated | none |
| 13.8 tetrahedron (r1) | K₄, g = 3 | ε = 11/6; φ = 17/48; 15/8 > 0 | holds | none |
| 13.9 constant identity (r1) | g = 1, 2 | 17.8956, 35.79 | as stated | none |
| 13.10 convex combination (r1) | h ≤ 1; h ≥ max(1, 24|c₅|) | h/12 + c₅ ≥ h/24 | constants exist | none |

**Library declarations, cross-roadmap citations, ownership, declared gaps, policy.** The diff touches no Lean name, no supplier citation and no gap: the first review's resolution of the six pinned library declarations, of every cross-roadmap citation (SchemeAndStackFoundations, JacobianChallenge, StableReductionPartII at its open head, HeightsRationalPointsAndObstructions, ArithmeticDynamics, TropicalAndBerkovichArithmetic, GrossZagierAndArithmeticHeights, JacobianChallengePartII, ArakelovGeometryAndAbelianHeights, NeronModelsAndSemistableAbelianVarieties, MotivesAndAlgebraicCycles, LefschetzPencilsAndVanishingCycles, ComplexComparisonPartII), of the four declared gaps and of ownership stands unchanged; the worker's citation and overlap scans at this head list nothing (no citation found nowhere, no dropped id, no other open pull request changing this roadmap), and the dependency check above confirms the direction mechanically. The two edited lines contain no process word, pull-request number, LaTeX delimiter or local path (gate: prnum, latex, round-labels, private-paths all 0). Ownership against open pull requests outside the sibling checkouts the brief names was checked only through the grep index in the first round.

## Not verifiable

- moret-bailly-1989 Théorème 2.5 (arithmetic Noether constant, §10.12): settled as uncertified; the normalization is the one printed in yuan-2026 p. 89 (unchanged).
- faltings-1984 Theorem 6 and pp. 401–402 (§§10.11–10.12): settled as uncertified; the theta-integral characterization is taken from wilms-2017 Theorem 1.1 (unchanged).
- Heinz, Proposition 4.3 (§7.4 route): cited only through yuan-2026 p. 112; the Heinz text itself was not consulted (unchanged).

## Source issues

- none

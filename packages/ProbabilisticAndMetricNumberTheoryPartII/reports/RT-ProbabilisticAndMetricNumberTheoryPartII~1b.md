<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2200#issuecomment-6413496485 -->
Red team round 1 pass b (claude) of 12545ad

Verdict: needs changes

1. **F01** (P2) The explicit `n = 3` counting asymptotic is a headline that is statable at the pins but absent

   - **Location.** `packages/ProbabilisticAndMetricNumberTheoryPartII/README.md` line 19 ("For `n = 3` the roadmap identifies `β(3) = 2` and `B(w) = 3/(π² w₂)` through the Gauss map"), lines 1285–1291 (the `n = 3` constants, `B(w) = 3/(π² w₂)`), line 1249 ("`N(w, r) ~ 3e^{2r}/(π² w₂)` uniformly"); `Suggested.lean` lines 231–236 (`eigenprobability_three`).
   - **Claim.** The Summary and §7.2 present the explicit asymptotic `N(w, r) ~ 3 e^{2r}/(π² w₂)` for `n = 3` as a result of the roadmap, and the Worked examples test it numerically. `Suggested.lean` states only its input `eigenprobability_three` (twice Lebesgue is a `2`-conformal probability); neither the exponent `β(3) = 2` nor the constant `3/(π² w₂)` appears in the acceptance test, which contains no statement mentioning `π`.
   - **Witness.** Every carrier of the explicit statement exists in the file (`wordCount`, `orderedSimplex`) or in Mathlib (`Real.pi`, `TendstoUniformlyOn`); on `orderedSimplex 1` the denominator `1 − x 0 ≥ 1/2` never vanishes. I recomputed the constant: `h₂ = 1/(2 log 2 · w₂)` has `∫ h₂ dν₂ = (1/log 2)·log 2 = 1`; `λ′₂ = (1/log 2)∫₀¹ log y/(1+y) dy = −π²/(12 log 2)`; `B = h₂/(2|λ′₂|) = 3/(π² w₂)`. Exact rational recursion of `N(w, log 150)` at `w₁ = 0, 1/4, 1/2` gives `6858, 9124, 13699` against `3·150²/(π² w₂) = 6839.2, 9118.9, 13678.4` (ratios `1.0028, 1.0006, 1.0015`), so the stated constant is the right one. The docstring of `eigenprobability_three` itself derives `β(3) = 2` only by combination with `conformal_exponent`.
   - **Repair.** In `Suggested.lean`, Layer 7, add after `eigenprobability_three`:

     ```lean
     /-- **The `n = 3` counting asymptotic.** On the chart segment `Δ₃ = [0, 1/2]`,
     `N(w, r) / (3 e^{2r} / (π² w₂)) → 1` uniformly, with `w₂ = 1 − w₁`
     (Gamburd–Magee–Ronan 2019, Theorem 13 at `n = 3`, with the Gauss–Kuzmin constants). -/
     theorem counting_three :
         TendstoUniformlyOn
           (fun r (x : Fin 1 → ℝ) =>
             (wordCount 1 x r : ℝ) / (3 / (Real.pi ^ 2 * (1 - x 0)) * Real.exp (2 * r)))
           (fun _ => 1) atTop (orderedSimplex 1) := by
       sorry

     /-- **The exponent for `n = 3` is `2`**: every `s`-conformal probability on `Δ₃` has `s = 2`. -/
     theorem conformal_exponent_three (s : ℝ) (ν : Measure (Fin 1 → ℝ))
         (hν : IsEigenprobability 1 s 1 ν) : s = 2 := by
       sorry
     ```

     Name both in README §7.2 (the bold target "The `n = 3` constants" becomes "Prove `counting_three` and `conformal_exponent_three`: …") and keep `eigenprobability_three` as the stated witness. If the author prefers not to state the constant, delete the sentence of the Summary that claims the identification of `B(w)` and the `~` line of the Layer 6 Examples; the acceptance test must then not be read as covering it.

2. **F02** (P3) The p-series enclosure of §7.4 is named in the Summary as a result but is not in the acceptance test

   - **Location.** README line 20 ("it proves `β(n) ≥ β(n − 1)` and explicit p-series bounds for `β(n)`"), lines 1329–1333 (§7.4).
   - **Claim.** Of the two Summary-level results named in that sentence, monotonicity is stated (`conformal_exponent_mono`) and the enclosure is not, although it is statable at the pins with the file's own `IsEigenprobability`.
   - **Witness.** The enclosure follows from testing `f = 1` in the eigen-relation and the termwise bounds `(A + 3)/2 ≤ q_a ≤ A + 2` (§2.2); numerically `d·Σ_{A≥0}(A+2)^{−β} = 1` at `β = 1.7286` (`n = 3`) and `2.1853` (`n = 4`), `2^β d Σ_{A≥0}(A+3)^{−β} = 1` at `β = 2.4241` and `3.2899`, so the README's `1.728 < β(3) < 2.425` and `2.18 < β(4) < 3.3` hold.
   - **Repair.** Either add to Layer 7 of `Suggested.lean`

     ```lean
     /-- **p-series enclosure of the exponent.** A `β`-conformal probability forces
     `d Σ_{A≥0} (A+2)^{−β} ≤ 1 ≤ 2^β d Σ_{A≥0} (A+3)^{−β}` (README §7.4). -/
     theorem conformal_exponent_pseries (d : ℕ) {β : ℝ} {ν : Measure (Fin d → ℝ)}
         (hν : IsEigenprobability d β 1 ν) :
         (d : ℝ) * ∑' A : ℕ, ((A : ℝ) + 2) ^ (-β) ≤ 1 ∧
           1 ≤ 2 ^ β * (d : ℝ) * ∑' A : ℕ, ((A : ℝ) + 3) ^ (-β) := by
       sorry
     ```

     and name it in §7.4 ("Prove `conformal_exponent_pseries`: …"), or rewrite the Summary sentence so that the enclosure is presented as a Check of §7.4 rather than as an end result. (The hypothesis forces `β > 1`, so both native sums are genuine.)

3. **F03** (P3) Morris–Noussair's Theorem 2.6 is on p.167, not pp.166–167

   - **Location.** README line 697 ("Morris–Noussair, Theorem 2.6, pp.166–167"); `sources.toml`, MN75 `locator` ("Theorem 2.6 and its proof, pp.166–167").
   - **Claim.** The printed page of the theorem is wrong by one.
   - **Witness.** MN75 extraction: the page footers are at line 76 ("166") and line 113 ("167"); Theorem 2.6 is at MN75 line 99, between them, so on p.167, and its proof runs past the footer at line 113 onto p.168 (ends before line 151, footer "168"). Lemma 2.3 (line 62) is on p.166 as stated.
   - **Repair.** In both places write "Theorem 2.6, p.167, with its proof on pp.167–168; Lemma 2.3, p.166".

4. **F04** (P3) The compact inclusion `C¹ → C⁰` is attributed to a passage of GMR19 that does not contain it

   - **Location.** README lines 390–392: "the value inclusion `C¹(K; ℂ) → C(K; ℂ)` is compact (GMR19, Lemma 46 and its use in the proof of Lemma 38, pp.798–799)".
   - **Claim.** The locator supports the pullback and Leibniz parts of the block, not the compactness claim.
   - **Witness.** GMR19 lines 2239–2245 (Lemma 46 and its proof: the two-norm inequality, "boils down to the chain rule") and lines 2247–2271 (proof of Lemma 38: truncation and the `C¹ ≪ C⁰` tail bound) say nothing about compactness of an inclusion; the only mention is footnote 21, GMR19 lines 2090–2092 ("compactness arguments relying on the Ionescu Tulcea–Marinescu type inequality"), p.794. Compactness is Arzelà–Ascoli, which the section's *Needs:* line already names.
   - **Repair.** Split the citation: "(chain rule and Leibniz: GMR19, Lemma 46 and its proof, pp.798–799; compactness of the inclusion: Arzelà–Ascoli, used by GMR19 in footnote 21, p.794)".

Reviewed at the pull request's current head `12545ad` (board checkout confirmed equal to the head reported by a read-only `gh pr view`). No pass-a report exists on the pull request at the time of this pass: its two comments are the CI job comment and the round-1 review. The round-1 review's two P3 findings (F01, F02) are addressed under "Pass-a and round-1 findings" below.

Files read in full: `packages/ProbabilisticAndMetricNumberTheoryPartII/README.md` (1456 lines), `Suggested.lean` (245 lines, 19 declarations), `sources.toml`, `metadata.toml`, `design/plan.json` diff. Four findings: one P2, three P3; no P1.

## Pass-a and round-1 findings

No pass-a report exists on the pull request, so there is nothing to confirm from pass a. On the round-1 review (both P3):

- **F01 confirmed.** GMR19 line 2401 prints (5.1) with `1 ≤ i ≤ n − 2`; README line 451 transcribes the same range; the sentence at README line 1392 corrects nothing.
- **F02 confirmed.** At the pinned Tau Ceti, `TauCeti/Analysis/Normed/Operator/Compact/RieszTheory.lean` lines 161, 173, 194 declare `IsCompactOperator.finiteDimensional_ker_one_sub`, `isClosed_range_one_sub`, `finiteDimensional_quotient_range_one_sub`, and `TauCeti/Analysis/Normed/Operator/Compact/Eigenspace.lean` line 132 declares `IsCompactOperator.finiteDimensional_genEigenspace_nat`; README line 166 says no Tau Ceti declaration is consumed while §3.5 uses exactly these facts for the compact case.

## Verified sound

**Head, files, policy.** Board checkout at `12545ad`; `git diff --stat origin/main...HEAD` touches only the package folder (README, Suggested.lean, metadata.toml, sources.toml, design/plan.json, the PKG report). plan.json's only change since the design is the removal of gap `G1` (now `[]`), whose Brouwer dependency is now a plain citation of DifferentialGeometry 10.5, which exists (below). README: no pull-request numbers, no process words, no local path, no `set_option`, no LaTeX delimiters; every `lemma` hit is a source citation. Lean: `theorem` throughout, single `import Mathlib`, no `#eval`/`#print`/`#synth`, no `True` placeholder, no sorry'd data (8 definitions with real bodies, 11 sorried theorems), no `variable` block.

**Elaboration and `#check` audit.** A scratch copy of `Suggested.lean` with `#check @name` for all 19 declarations elaborated under the pinned toolchain: exit 0, exactly 11 `declaration uses 'sorry'` warnings, no error; all 19 elaborated types printed as written (no section variables exist, so no binder could be lost). Nothing changed. Mathlib at `6b7abb3`, Tau Ceti at `a91d3aa` (the manifest's pins).

**Gate.** `tauceti-roadmap … gate --depcheck … --movable` output: `depcheck: 56 roadmaps, 640 edges, 0 problem(s)` (no UPWARD, CYCLE or `moved:` line). `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.

**Adversarial table** (values computed; 19 declarations and all 40 targets read).

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| `orderedSimplex` (0.1) | `d = 0, 1`; `n = 4` vertices; interior point | `d = 0`: the single point; `d = 1`: `0 ≤ x₀ ≤ 1/2`; vertices `(0,0), (0,1/2), (1/3,1/3)`; `w = (1/6,1/3,1/2)` sums to 1, strict | holds; GMR19 (1.5) line 230 includes `y = 0`, the README's `∖{0}` is its stated convention |
| `branchDenom`, `branchMap` (0.2) | `n = 4`, `w = (1/6,1/3,1/2)`, `(0,1)`, `(1,2)`; reversed `γ₂γ₃`; chart-sum identity | `q = 11/6`, `F = (2/11,3/11,6/11)`; `q = 7/3`, `F = (1/14,3/14,5/7)`; `(1/16,3/8,9/16)`, last `8/3`; `1 − (1−w_j)/q = (1 + A(1−w_j))/q` | holds; matches GMR19 (4.5)–(4.6) lines 1953–1957 |
| `wordDelay`, `wordCount` (0.3) | `[(0,1),(1,2)]` at `n = 4`; `n = 3`, `w₁ = 1/2`, `r = log 2`; `n = 4`, `(1/4,1/4,1/2)`; exact recursion at `R = 150` | `log(11/6) + log(27/11) = log(9/2)`, homogeneous last coordinate `9/2`; `N = 3`; both letters give `(1/7,2/7,4/7)`, `N = 3`; `6858, 9124, 13699` | holds; `q ≥ 3/2` gives finiteness on `Δ` |
| `C1BoundedOn` (0.4) | `f = x₀` on `[0,1/2]`; `2x+3`; `(0,1)` jet; factor two | `1/2 + 1 = 3/2`; norm `7`; segment identity forces `0 = y − x`; `‖f‖_∞ + ‖D‖_∞ ≤ 2 sup(‖f‖+‖D‖)` | holds |
| Ten bounds (1.2) | `dγ₃` at `(1/6,1/3)`; `dγ₂` at `(0,1/2)`; `d(γ₂∘γ₁)`, `d(γ₂∘γ₂)`, `d(γ₂∘γ₃∘γ₂)` at `(0,0)` | columns `(1+2w₂)/(1+b)²`, `(1+2w₁)/(1+b)²`, max `20/27`; `4/3`; `[[0,1/3],[1/9,−1/9]]` → `4/9`; `[[1/3,0],[−1/9,1/9]]` → `4/9`; `[[1/5,0],[−2/25,1/25]]` → `7/25` | README's squared (5.5), (5.9) hold; unsquared would give `4/3`, `7/5` |
| Uniform contraction (1.3) | `n = 3` pairs; Lemma 48 cases | `|(F_A∘F_B)′| = (1 + (A+1)(x+B+1))^{−2} ≤ 1/4`; Case I `1·6/7·1·1`, Case II `4/5`, Case III `6/5·4/5 = 24/25`, `32/49` | holds; GMR19 lines 2443–2468 |
| Core/cusp (1.1) | `(0,0,1)`, `(0,1/2,1/2)`, `(0,1/3,2/3)`, `(1/5,1/5,3/5)`, `(1/3,1/3,1/3)` | `1 − 2b = 1, 0, 1/3, 1/5, −1/3` against `w₂ = 0, 1/2, 1/3, 1/5, 1/3` | holds; `Δ_core ∪ Δ_cusp = {b ≤ 1/2}` |
| `transferOp` (2.1), C⁰ bounds (2.2) | `n = 3`, `s = 2`, `w₁ = 0, 1/2`; `h = 1/w₂`; `s ≤ 1`, `f = 1` | `ζ(2) − 1 = 0.6449`; `4(ζ(2) − 5/4) = 1.5797`; `Σ 4/((A+2)(A+3)) = 2`; positive series diverges, native `0 ≠ 1` | holds; printed factor `2` (GMR19 line 2297) gives `0.790 < 1.5797` |
| Two-norm inequality (2.3), holomorphy (2.4) | `m = 0`; truncation route | `|Df| ≤ C|s||f| + D|Df|` needs `D ≥ 1`; tails dominated by `q^{−σ₀}` | holds; GMR19 lines 2240 (complex operator printed), 2247–2271 |
| Laplace/Mellin adapters (2.5) | `1_{[c,∞)}`; `e^{−|t|}`; `1_{[1,∞)}` | `e^{−sc}/s`; `1/(1+s) + 1/(1−s)`; `∫₁^∞ u^{−s−1} du = 1/s` | holds; Mathlib `mellin f s = ∫ t^{s−1} f` so `−s` is forced |
| `schauder_tychonoff` (3.1) | `C = ∅`; `[0,∞)` translation; circle rotation; `V = 0` | none, none, none; `{0}` fixed | holds; MN75 Theorem 2.6 (line 99) with `F = A = C` |
| `IsEigenprobability` (3.2) | `n = 3`, `σ = 2`, `f = w₁²`; Dirac at `0`; `d = 0` | `∫ f dν₂ = 2·(1/8)/3 = 1/12`; `F_A(0) = 1/(A+2) ≠ 0`; alphabet empty, `L = 0`, `0 ≠ 1` | holds |
| Hilbert distance, Birkhoff (3.3) | `(1,2),(3,6)`; `(1,1),(1,4)`; `(1,0),(0,1)`; `C_{κa}` diameter | `0`; `α = 1, β = 4`, `log 4`; `α = 0`; `α ≥ (1−κ)/(1+κ)·inf g/sup f`, diameter `≤ 2 log((1+κ)/(1−κ)) + 2κa diam Δ` | holds; LIV95 Theorem 1.1 line 144, footnote 2 line 152 waives the lattice and topology |
| `hennion_essential_radius` (3.5) | `p = 0`; `R < 0`; `B = 0`; `r = 0` compact; `χ(T^{ks+1})` | vacuous; stronger hypothesis; empty spectrum; `T^{k+1}` compact; `≤ 2‖T‖ r^{ks}` | holds; HEN95 Théorème 3.1 lines 386–395 ("précompacte" = finite cover by seminorm balls, line 394), Prop 3.1 lines 374–380, Cor 5.2 lines 724–743 |
| Cone convergence (3.6), `ruelle_perron_frobenius` (3.7) | `|DL^Q f| ≤ (Cσ + Dρ^Q a)L^Q f`; `m = 0`; uniqueness with `(μ, c′)` | choose `Dρ^Q < κ`, `a > Cσ/(κ − Dρ^Q)`; `M ≥ 1 + sup(h + |Dh|)`; testing `h` gives `c′ = c`, then `μ = (∫h dμ)ν = ν` | holds; GMR19 Theorem 39 lines 2035–2042 |
| `simple_eigenvalue_analytic` (4.1–4.2) | `diag(2,1)`; Jordan block; `[[0,1],[z,0]]`; `B = ℂ`; derivative | `P = diag(1,0)`, `T − 2 = −1` on `ℂe₂`; left eigenvectors `∝ e₂*` kill `e₁`; `±√z`; `ker φ₀ = 0`; `λ′ = φ₀(T′h₀)` from `φ₀T₀ = λ₀φ₀` | holds; KLO19 lines 87–109, 145–148, 441–457 |
| Fixed-point test (5.2) | `A = 0, 1, 2`; eigenvector | `t = 1.6180, 2.4142, 3.3028`, gaps `0.4002, 0.3134`; `(1, t, t(t−A))`: `1 + t = t² − At` | holds; GMR19 lines 2123–2153 |
| `wielandt_separation` (5.3) | constant delays; `m = 0`; `t ≠ 0`, every `σ > 1` | `L_{σ+it} = e^{−itc}L_σ`, radius `λ_σ`; `C ≥ 1`; Theorem 41 is for all `Re s > 1`, `Im s ≠ 0` (line 2102) | non-lattice needed; holds |
| `pressure_eigenvalue` (5.4) | derivative bound; limits; `n = 3` | `λ′ = ν(L′h) ≤ −log(3/2)λ`; `λ_σ ≥ (n−2)Σ(A+2)^{−σ} → ∞`, `≤ 2^σ(n−2)Σ(A+3)^{−σ} → 0`; `λ′₂ = −1.1866 ≤ −0.4055` | holds; GMR19's own existence of `β` uses Baragar (lines 2170–2182), the README's IVT route is its own and correct; the claim `q ≥ 3/2` is GMR19 line 2350 |
| Growth, transform, pole (6.1–6.3) | `w₁ = 1/2`, `r = log 2`; both resolvent identities on `h` | `3/4 > 6/π² = 0.608`; printed form gives `(1−λ)^{−1}h + h`, corrected `(1−λ)^{−1}h`; `B = h/(β|λ′|) = 3/(π² w₂)` | holds; GMR19 line 2197, LAL89 lines 733, 748 |
| `uniform_renewal_tauberian` (6.4–6.5) | one-point `X`, `α = e^{at}`; `X = ∅`; `B < 0`; `r < 0` | `F = 1/(s−a)`, `B = 1`; vacuous; impossible since `F(σ) ≥ 0` for real `σ > a`; only `atTop` matters | holds; LAL89 Lemma 8.2 lines 883–896, (8.9)–(8.12) lines 884–938; `hbound` is used by the Lalley route (Lemma 8.1), not needed for truth (P3 note, not a finding) |
| `uniform_counting`, `conformal_exponent` (6.6–6.7) | `n = 3`, `R = 150`; `s ≤ 1`; Jacobians `n = 3, 4` | ratios `1.0028, 1.0006, 1.0015`; no eigenprobability; `q^{−2}`, `det dγ₁(1/6,1/3) = (6/11)³ = 216/1331` | holds; Theorem 13 line 402 is uniform in `y ∈ H − 0`, Theorem 10 line 366 has exponent `β/(n−1)` |
| Gauss conjugacy, `eigenprobability_three` (7.1–7.2) | `x = 0, 1`; branch substitution | weights `(A+2)^{−s}` vs `(A+1)^{−s}`; `q_A^{−s}(1+F_A x)^s(1+x)^{−s} = (x+A+1)^{−s}`; `dv/dt = q^{−2}`, images `[1/(A+3), 1/(A+2)]` tile `(0,1/2]`, `2·(1/2) = 1` | holds; GMR19 Examples 34, 37 lines 1959–2025 |
| Rauzy (7.3), enclosure (7.4), `conformal_exponent_mono` (7.5) | row moves; roots; `(1/3,2/3) ↦ (0,1/3,2/3)`; `d = 0` | `A₁, A₂, A₃` as stated, GMR19 lines 295–320 ("up to permutation matrices"); roots above; `q_{(A,1)}(w) = q_{(A,2)}(ιw) = 1 + 2(A+1)/3`; vacuous | holds; Remark 14 lines 423–425 |

**Sources** (all six certified, all read through the sources cache; 56 locators verified against the text, page numbers from the extractions' page markers and printed headers): GMR19 (1.3) line 96, (1.4) line 205, (1.5) line 230 and the basis `e_j` lines 255–259 (p.756), freeness line 228 with footnote 5 line 262, Examples 8–9 lines 265–320, Figure 1 line 340, Theorem 10 line 366, Remarks 11–12 lines 379–393, (1.7) lines 396–400, Theorem 13 lines 402–415 with (1.8), Remark 14 lines 423–425, the `RP²` geodesic count lines 451–459 (p.761), Theorem 3 line 120, (4.1) line 1893, the `w`-coordinates line 1903, the two-sided Laplace transform line 1910, (4.2)–(4.4) lines 1919–1944, Lemma 33 line 1953, Example 34 line 1959, Lemma 35 line 1972, Corollary 36 line 1991 (Schauder–Tychonoff named line 1990), Example 37 line 1994, the `C¹` norm lines 2026–2028, Lemma 38 line 2030, Theorem 39 line 2035, the attractor lines 2062–2069, Definition 40 line 2077, Theorem 41 line 2095, Proposition 42 line 2105, Proposition 43 line 2158, §4.3 lines 2167–2209, Lemma 44 line 2211, Proposition 45 line 2225, Lemma 46 line 2239, proof of Lemma 38 lines 2247–2271, §4.4 lines 2272–2278, §4.5 lines 2279–2351, §5.1 lines 2355–2387, Remark 47 line 2388, (5.1)–(5.10) lines 2393–2438, Lemma 48 lines 2443–2468, proof of (5.1) lines 2483–2546, Table 1 lines 2510–2538; GMR19 arXiv v3 displays of (5.5), (5.9) at its lines 2047, 2062 and their proofs at lines 2277–2335, 2446–2510. LAL89: Theorem 1 line 255 and (2.5) line 265 (pp.8–9), (7.5) line 733, Proposition 7.2 with (7.7) lines 746–749 (p.25), "lower semicontinuous" lines 738 and 754, Lemma 8.1 lines 842–873 (pp.28–29), Lemma 8.2 lines 883–896 (p.30), (8.9)–(8.12) lines 884–922 (pp.30–32). HEN95: Définition 3.1 line 362, Proposition 3.1 line 374, Théorème 3.1 line 386 (p.11), Proposition 3.3 line 430 (p.12), Corollaire 3.1 line 450 (p.13), Définition 5.1 line 650, Proposition 5.1 line 654 with "non vide" line 678 (p.19), Définition 5.2 line 686, Proposition 5.2 line 689 (p.20), Corollaire 5.2 line 724 (p.21), Appendice line 1551 (p.43). LIV95: projective metric lines 134–141 and Theorem 1.1 line 144 (p.4), footnote 2 line 152, Lemma 1.3 line 201 (p.6), Lemma 2.2 line 281, Theorem 2.5 before line 415 (pp.8–12). KLO19: qualitative theorem lines 87–109 (p.177), Definition 1.1 line 145 (p.178), Corollary 1.13 line 288 (p.182), Propositions 3.1–3.2 lines 441–457 (p.186). MN75: Lemma 2.3 line 62 (p.166), Theorem 2.6 line 99 (p.167, R03). Every locator other than R03 and R04 resolves to the stated theorem and page with the stated hypotheses.

**Notes on the sources, re-verified at the text.** Factor `2` for `2^σ` (GMR19 line 2297); complex operator on the right of Lemma 46 (line 2240); the resolvent decomposition that counts the eigendirection twice (GMR19 line 2197; LAL89 line 748, with (7.5) line 733 holding for `n ≥ 1` only); the leading coefficient written as `h_{β₀}` (line 2205); strict cusp inequality (line 2386); Table 1's repeated `w₂` (line 2517); the attractor called compact as the image of the coding map (lines 2066–2069); unsquared denominators in the displayed (5.5), (5.9) of both the published text (lines 2405, 2428) and arXiv v3 (lines 2047, 2062), squared in the arXiv proofs (lines 2335, 2510); Hennion's nonempty `K₀` (lines 660, 678); Lalley's "lower semicontinuous" (lines 738, 754). Ten of eleven bullets are corrections the text needs; the eleventh is round-1 F01.

**Duplication by object at the pins.** Tau Ceti: no Schauder–Tychonoff, Brouwer, Hilbert projective metric, Birkhoff cone contraction, transfer operator, Ruelle–Perron–Frobenius, conformal measure, pressure, Hennion/Ionescu-Tulcea–Marinescu inequality, measure of noncompactness, Gauss map, Rauzy gasket, Markoff–Hurwitz count or renewal theorem (the `Birkhoff` hits are Lie-theoretic, the `Hurwitz` hits are function-field genus bounds, the `Ionescu` hits are Mathlib's `Kernel.trajMeasure`, `Kuratowski.lean` is the Fréchet–Kuratowski embedding). Tau Ceti's Laplace transforms (`Analysis/CompletelyMonotone/Laplace/Representation.lean` line 73, `Kernel.lean` line 133, `PositiveDefinite/SemigroupGroup/FourierLaplace/Transform.lean` line 88) are measure-side transforms on `ℝ≥0`, not the two-sided function transform of §2.5, which is built on ArithmeticDirichletSeriesPartII's `HasLaplace`. Mathlib: no Laplace transform, no Schauder or Brouwer theorem, no essential spectral radius; Perron–Frobenius only for finite irreducible matrices. The Mathlib names the README cites all exist at the pin (`Real.tendsto_integral_exp_smul_cocompact` is for `f : ℝ → E` with any complex normed `E`, `RiemannLebesgueLemma.lean` line 206; `integral_comp_exp` and `integrable_comp_exp`, `IntegralEqImproper.lean` lines 1175, 1182; `maxGenEigenspace`, `IsFredholm`, `ext_of_forall_integral_eq`, `isCompact_setOfPred_probabilityMeasure_mass_eq_compl_isCompact_le`, `continuous_integral_continuousMap`, `hasFDerivAt_tsum_of_isPreconnected`, `Complex.summable_one_div_nat_cpow`, `Convex.norm_image_sub_le_of_norm_fderivWithin_le`, `ImplicitFunctionData.differentiableAt_implicitFunction`, `spectrum.hasFDerivAt_resolvent`, `subalgebra_topologicalClosure_eq_top_of_separatesPoints`, `arzela_ascoli`, `contDiffOn_succ_iff_fderivWithin`, `uniqueDiffOn_convex`, `integral_tsum`, `tendsto_integral_filter_of_dominated_convergence`, `hasSum_zeta_two`, `gelfand_formula`, `isOpen_resolventSet`, `LocallyConvexSpace`, `DifferentiableOn.analyticOnNhd`, `mellin`, `MellinConvergent`).

**Ownership against roadmaps.** `roadmaps grep` over main and the open heads for Markoff/Hurwitz, Rauzy, transfer operator/Ruelle/Perron–Frobenius, Schauder/Tychonoff/Brouwer, Hilbert metric/Birkhoff contraction, renewal/Tauberian/Ikehara, Hennion/Lasota/essential spectral radius, analytic perturbation, Gauss map, pressure/conformal measure, Lalley: the only owners of shared objects are the ones the README cites. Main's "Rauzy" hits are the Christol–Kamae–Mendès France–Rauzy theorem in ClassicalArithmeticCompletion; main's Perron–Frobenius is the matrix theorem (PivotalSpherical, TypeAHeckeAlgebras); BanachSpaceTheory's Schauder hits (open heads #1121, #1416) are Schauder bases; CongruenceSpectralGap and ArithmeticStatisticsPartV cite Wiener–Ikehara and Tauberian counts, not a uniform renewal theorem. Ownership against open pull requests beyond the sibling checkouts named in the brief was checked only through `roadmaps grep`.

**Supplier citations, resolved at the heads named in the brief** (14 citations, 8 roadmaps). ProbabilisticAndMetricNumberTheory at `58cbb88` (the pull request's current head; merge order 281 < 294): §4.4 "The Gauss map, measure, digits and invariance" (README line 4911) with `gaussMap` (`Suggested.lean` 484, `Int.fract x⁻¹`), `gaussMeasure` (487), inverse branches `v_a = 1/(a+x)` (README 5040), the density telescope (5057); §4.8 "Density transfer and normalized transfer" (5817) with `gaussDensityTransfer` (`Suggested.lean` 568, `Σ_k f(1/(k+1+x))/(k+1+x)²`, so the README's `a = A + 1` is right) and the target `gaussDensityTransfer_duality` (README §4.8, relative to restricted Lebesgue measure); §4.9 (5969). ArithmeticDirichletSeriesPartII at `bfcff51` (current head): HP.0.1 (README 269, `HasLaplace` at `Suggested.lean` 48 with `[NormedSpace ℝ E] [SMul ℂ E]` and default measure `volume.restrict (Ioi 0)`), HP.1.1 (429, `squaredSinc` 76), HP.3.1 (742, `monotoneUnsmoothing` 141), HP.3.2 (790, `delangeLaplace` 157); its Downstream consumers lines 1133–1134 name the Markoff–Hurwitz renewal use. On main: DifferentialGeometry Layer 10 item 10.5 lists `exists_fixedPoint_closedBall` (README 890–892; `Suggested.lean` 3065 under `[Fact (finrank ℝ E = n + 1)]`, consistent with §3.1's separate zero-dimensional case); OptimalTransport 13B item 9 (lines 1528–1531, strictly positive finite kernel, `tanh(Δ(K)/4)`); BanachAlgebras A2 (heading line 161; Riesz idempotents, orthogonality, sum one, commutation, corner spectra, closed invariant decomposition, lines 255–258); OperatorTheory has `SelfAdjointSpectralTheory` and `SpectralSubspacePerturbation` folders; MarkovChainsAndRenewal Layers 4–6 (lines 287, 311, 356; key renewal theorem line 367); ClassicalArithmeticCompletion §§4.38, 4.57, 4.78, 4.105 (lines 8723, 9217, 9827, 10528). All suppliers are on main or earlier in the merge order; no `*Needs:*` line cites a later roadmap; no declared gap.

**Checks tested:** 34 README Checks recomputed (the table), all true and discriminating; every definition has at least three (0.1: 4, 0.2: 5, 0.3: 4, 0.4: 5, 1.1: 4, 3.2: 3, 3.3: 4, 3.4: 4, 4.1: 3, 5.1: 3).

**README and Lean agree.** Every Lean name appears in the README (backtick counts 1–7); every backticked own name of the README is declared; the five simplex theorems carry `1 ≤ d` where the README has `d ≥ 1`; `conformal_exponent_mono` needs none (`d = 0` makes its hypothesis false). The spectral-gap statements are stated in the `C1BoundedOn` form because `C¹(Δ; ℂ)` is not a carrier at the pins, and the module docstring says so; the pointwise form is within a factor two of the jet norm, so nothing is weakened.

**Padding probe (by reading).** No sorried theorem follows in one tactic from the library or restates a definition; `eigenprobability_three` needs the branch change of variables for every continuous test function and is kept as the witness (R01 adds the headline it feeds).

## Not verifiable

- The published layout of GMR19 (5.5), (5.9) and Table 1 loses superscripts in the extraction; that the published displays print the denominators unsquared is inferred from the absence of the trailing `2` that the extraction preserves in (5.2) and in Table 1's `(2 − w_i)2`, and from the arXiv v3 displays, which also lack it.
- The arXiv v3 page numbers "pp.46–53" cited for the case computations were checked only at the proofs of (5.5) and (5.9) (arXiv lines 2277–2335, 2446–2510).
- Ownership against open pull requests that the brief lists without files was not checked beyond `roadmaps grep`.

## Source issues

- **Misprint** in GMR19 at §4.5, proof of Proposition 43, printed p.799: the source bounds the branch sum by `2(n−2)‖f‖_∞ Σ (A+3)^{−s}`; the factor should be `2^s`, since `(1 + (A+1)/2)^{−s} = 2^s (A+3)^{−s}`; affects nothing.
- **Misprint** in GMR19 at Lemma 46, printed p.798: the right side of the two-norm inequality uses the complex operator `L_s`; it should be `L_{Re s}` for an order inequality between real quantities; affects the proof.
- **Error** in GMR19 at §4.3 item (1), printed p.797, and in LAL89 at Proposition 7.2, (7.7), printed p.25: the resolvent is written as the eigenterm plus the full inverse `(1 − L′_s)^{−1}`, which on the eigenvector returns `(1−λ)^{−1}h + h`; it should be `(λ/(1−λ))P + (1−L′)^{−1}`, since (7.5) holds only for `n ≥ 1`; affects the proof, not the residue.
- **Misprint** in GMR19 at §4.3, printed p.797: the leading coefficient of `N(w, r)` is written as the `ν`-normalised `h_{β₀}`; it should be `h_β/(β|λ′_β|)`; affects a stated result up to the constant Theorem 13 leaves free.
- **Gap** in GMR19 at §4.2, printed p.794: the image of the coding map is called a compact attractor; for `n = 3` the image omits `w₁ = 0`, the limit of the branch fixed points, so it should be the closure of the image; affects the support statement of the proof.
- **Misprint** in GMR19 at (5.5), printed p.801, and (5.9), printed p.802 (also in arXiv v3's displays): the denominators are printed unsquared; they should be `(3 + b − 2w_j)²` and `(5 + b − 4w_{n−2})²`, as the arXiv proofs and the value `4/9` at `(0,0,1)` show; affects nothing.
- **Misprint** in GMR19 at §5.1, printed p.801: the cusp inequality is printed strict, `w_{n−1} > (1 + w_{n−2})/2`; it should be `≥`, attained at `(1/5, 1/5, 3/5)`; affects nothing.
- **Misprint** in GMR19 at Table 1, printed p.804: the third surviving-coordinate row repeats `w₂` in the exceptional column; it should be `w₃`; affects nothing.
- **Gap** in HEN95 at Proposition 5.1(v), printed p.19: `γ(A + K) = γ(A)` for compact `K` is stated without nonemptiness, which the proof assumes; it should require `K` nonempty; affects a stated result in the degenerate case only.
- **Misprint** in LAL89 at §7, before Propositions 7.2–7.3, printed p.25: lower semicontinuity of the spectral radius is invoked to keep nearby radii below a bound; it should be upper semicontinuity or a finite-power Gelfand bound; affects the proof only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "12545ad", "job": "RT-ProbabilisticAndMetricNumberTheoryPartII~1b", "model": "fable", "worker": "fable-rt224"} -->

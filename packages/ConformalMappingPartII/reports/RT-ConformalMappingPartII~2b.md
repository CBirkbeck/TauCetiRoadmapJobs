<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/132#issuecomment-6334886836 -->
Red team round 2 pass b (claude) of 3620f39

Verdict: needs_changes

1. **F01** (P2) `gauss_terminating_checks` is ill-typed: its numerals elaborate in ℕ and ℤ, not ℂ

   **Location:** `packages/ConformalMappingPartII/Suggested.lean:303`: “ordinaryHypergeometric 0 1 1 x = 1 ∧ ordinaryHypergeometric (-1) 1 1 x = 1 - x”.

   **Claim:** The statement is the Lean mirror of the two terminating Checks of §4.1 (README lines 564–565), ₂F₁(0,1;1;x)=1 and ₂F₁(−1,1;1;x)=1−x on all of ℂ.

   **Witness:** Elaborating the submitted file as a probe copy under the pinned Mathlib fails at this declaration with `failed to synthesize instance of type class Field ℕ` (column 4) and `Field ℤ` (column 41): the parameters `a b c` of `ordinaryHypergeometric` fix the scalar field before `x` is seen, so `0 1 1` elaborate in ℕ and `(-1) 1 1` in ℤ. The file does not elaborate as submitted (exit 1); every other declaration produces only `declaration uses 'sorry'` warnings.

   **Exact repair text:**
   ```lean
   /-- The terminating checks give 1 and 1-x, including outside the unit disc. -/
   theorem gauss_terminating_checks (x : ℂ) :
       ordinaryHypergeometric (0 : ℂ) 1 1 x = 1 ∧
         ordinaryHypergeometric (-1 : ℂ) 1 1 x = 1 - x := by sorry
   ```
   (verified in a probe copy: elaborates with only the `sorry` warning).

2. **F02** (P3) Four linter diagnostics in the proved examples

   **Location:** `packages/ConformalMappingPartII/Suggested.lean:95`, `:216`, `:222`, `:223`.

   **Claim:** The only diagnostics are `declaration uses 'sorry'` warnings.

   **Witness:** The probe elaboration reports `linter.unnecessarySimpa` at line 95 (“`simp` already closes the goal”), `linter.unusedSimpArgs` at line 216 (`iteratedDeriv_zero` unused) and `linter.unnecessarySeqFocus` at lines 222 and 223 (`<;>` where `;` suffices).

   **Exact repair text:** line 95: replace `simpa [iteratedDeriv_one, iteratedDeriv_zero, ha x hx] using hc` by `simp [iteratedDeriv_one, iteratedDeriv_zero, ha x hx] at hc`; line 216: `simp [schwarzian, iteratedDeriv_succ', hd, iteratedDeriv_const]`; lines 221–223:
   ```lean
     norm_num [schwarzian, iteratedDeriv_pow, deriv_pow_field]
     field_simp [hx]
     ring
   ```
   (all three verified in a probe copy: the examples close with no diagnostics).

3. **F03** (P3) Two consumed supplier sections are missing from the scope list and the exact contracts

   **Location:** `packages/ConformalMappingPartII/README.md:217`: “ConformalMapping L1 normal families and L3 planar Riemann maps”; `README.md:362`: “FuchsianOrbifolds Layers 3–4 cusp charts and compactification”.

   **Claim:** The scope paragraph (`README.md:7`) reuses ConformalMapping **L2**, **L3**, **L4** only and the contract (`README.md:83`) opens “From ConformalMapping L2 consume …”, with no L1 clause; the scope paragraph for FuchsianOrbifolds (`README.md:11`) lists **Layer 0**, **Layer 2** and **Layer 3** only, while `README.md:87` and §1.12 consume its Layer 4.

   **Witness:** `TauCetiRoadmap/ConformalMapping/README.md:102` is the L1 item (normal families / Montel), which §1.1’s `SurfaceUniformization.limitEmbedding` needs for the compactness of normalized univalent functions; `TauCetiRoadmap/FuchsianOrbifolds/README.md:286` is “## Layer 4: compactified quotient Riemann surfaces”. Neither appears where the roadmap says what it consumes from each supplier.

   **Exact repair text:** in `README.md:7` write “**L1** (normal families: a locally bounded family of holomorphic functions on 𝔻 has a locally uniformly convergent subsequence), **L2** (…)”; in `README.md:83` prepend “From ConformalMapping L1 consume Montel’s theorem for the normalized univalent limit in §1.1.”; in `README.md:11` write “**Layer 3** (primitive cusp data, full stabilizers, cusp charts and transport), and **Layer 4** (the cusp compactification of a cofinite quotient)”.

## Verified sound

Read every line of `packages/ConformalMappingPartII/README.md` (1164 lines, 96 numbered subsections, 24 Checks blocks), `Suggested.lean` (499 lines: 3 structures, 13 real-bodied definitions, 44 `sorry`’d theorems, 15 proved examples, 75 declarations), `sources.toml` (11 entries), `metadata.toml`, `design/plan.json` (one gap, `little-picard`, supplier ModularForms, same slug as `README.md:97`) and the round-1 repair report; read all five earlier comments on the pull request.

**Elaboration.** The submitted `Suggested.lean` was elaborated as a probe copy against the pinned Mathlib: exit 1, one error pair (F01), 44 `declaration uses 'sorry'` warnings, four linter warnings (F02), nothing else. All 15 examples are genuinely proved (the round-1 F01/r1b-F02 repair holds). Single `import Mathlib`; no `set_option`, no `lemma`, no `sorry`’d data, no `True` placeholder, no section `variable`; at most two examples per definition; every one of the 60 named declarations occurs literally in the README (grep, 0 missing); the README title has no proper name to capitalise; no process words, issue or pull-request numbers in README or docstrings (the only grep hits are “Lemma n.m.k” source locators and “roots of unity removed”).

**Trivial-proof probe.** For the 44 `sorry`’d theorems I tried one-tactic closers in a second probe copy on the candidates that looked routine (`RootsCover.quarterTurn`, `schwarzian.inverse`, `ExceptionalCuspSet.zero_not_mem`, `inverseRatio.levelTwo_initial`, the interior-omission conjunct of `RootsCover.realRadialLimit`). None of the theorems closes with one tactic; only two sub-conjuncts do (`inverseRatio 2 0 = 0` by `simp [inverseRatio]`; `∀ z ∈ ball 0 1, F.toFun z ≠ 1` from `F.mapsTo`), which is not a whole-theorem finding. The named boundary theorems are legitimately `sorry`’d targets.

**Adversarial pass (every Lean signature and every numbered target).** Instances tried: n = 1, 2, 3 and zero coefficients for Layer 0; Ω = 𝔻, D(0,2), ℂ∖{0}, ℂ∖{±1}, a disconnected two-ball union, an infinitely connected domain; N = 1, 2, 3 and N → ∞; z = 0, the real radius t → 1⁻, a quarter-turn and both half-turns e^{±πi/N}; f = affine, z², 1/z, 1/(z−a) with r = |a|, constants including 0, the `scalarSpike` representative; a = 0, ±1 and |a| = 1 for Blaschke factors, empty and boundary-only families; (a,b,c) = (0,1,1), (−1,1,1), c = 0; g = 1, i, exp(az), g ≡ 0 in the Herglotz and quotient targets; M > 0 and the witness t^N = 1 − e^{−MN}/2; r → 0 and r → 1 in Layers 7–9. Found true as typed: `PointedCover.extremal` (the lift exists on the simply connected disc, is unique with l(0)=0, Schwarz gives the bound and rotation equality; the derivative set is a singleton since two based covers differ by a rotation), `RootsCover.realRadialLimit` (F is real on (−1,1) by conjugation symmetry forced by F′(0) > 0, strictly increasing, and a limit L < 1 would be an interior point whose path lift converges to 1 ∉ 𝔻), `RootsCover.power_descent` (G′(0) = F′(0)^N since equivariance kills the z^{N+1} term; uniqueness because z ↦ z^N is onto the ball), `roots_inverse_schwarzian` (branch-independent by Möbius invariance; value 3/2 at N = 2, x = 0), `half_rotation_involution` (the lift of the Möbius involution w ↦ w/(w−1) of the (N,∞,∞) orbifold fixing the cone point is the half-rotation; both signs valid), `ExceptionalCuspSet.rotated_large` (via (e^M+1)^N ≥ e^{MN}+1), `discCounting.*`, `discCharacteristic.*`, `local_first_main_translation` (N_D(f) = N_D(f−a), then the inversion identity and the translation bound), `gauss_equation`/`gauss_equation_terminating` (radius 1 resp. ⊤ at the pins; c excluded from −ℕ), `gammaRadius.positive_expansion` (E_N > 0 since all odd-zeta terms are positive and exp(x) − 1 > x), `large_n_max_growth`, `uniform_mean_growth`, `normalized_log_derivative` (constants log 2 + 1/e via the kernel mean 1/(R²−r²), the L¹ identity 2m(R,g) and the entropy bound 1/e). The README’s generality equals the Lean’s in every mirrored target (hypotheses on Ω, N ≥ 2, 0 < r < 1, zero-free closed discs, order ≠ ⊤ are all explicit binders). No vacuous or hypothesis-contains-conclusion statement.

**Checks recomputed (31).** C(0)=i, C(1/2)=3i, C(e^{iθ}) = −cot(θ/2); initialJet(z²)(2) = 2; b_1 = −1, b_{−1} = 1 from the rational formula; γ₂ = Γ(1/4)⁴/(4π²) ≈ 4.3769 and γ₃ = Γ(1/6)³/(12π^{3/2}) ≈ 2.5811 by reflection and duplication; γ_N → 1; the odd-zeta series (even powers cancel, coefficient (2^{2k}−1)ζ(2k+1)/(2^{2k−1}(2k+1))), the terms ζ(3)/(2N³), 3ζ(5)/(8N⁵) and the exponentiated ζ(3)²/(8N⁶); J₂ coefficients 3/8, 1/8, cubic 1/4, J₂‴(0) = 3/2; the DLMF 15.8.10 specialisation (k = 0 term −log x − 2γ − 2ψ(a), Γ(2a) restored from 15.2.2); ψ(2) − ψ(3/2) = 2 log 2 − 1 and the monotonicity of ψ(k+1) − ψ(k+a); the indicial exponents {0, 1/N}, {1/2, 1/2}, {a_±} of (4.2) and the two hypergeometric solutions with c = 2a_±; Hempel’s three constraints as the X⁻¹, X⁻², X⁻³ coefficients and m₀ = 0, m_k = −(1/2 + 1/(2N))ζ^{−k}; S(ax+b) = 0, S(x²) = −3/(2x²), S(1/x) = 0, S(log) double-pole coefficient 1/2; h₂ = 2, areas 2π(N−1), 2π − 2π/N, π − π/N, and that the ideal 2N-gon is the Dirichlet domain at 0 (each side is the bisector of 0 and γ0 by the reflection symmetry); the N = 3, τ = 2i matrix computation giving ζ₃⁻¹/3; E(I,1) = 1 with centre 1/2; p₂(2) = 4/3 and the partial fractions; N_D(r,1/z) = log r, boundary pole weight 0, T_D(r,1/z) = 0; the 9.5 radii ρ < R, R − ρ ≥ (1−r)/4; the log 4 of 9.12; the 3.9 inequality via log⁺|g| = max(log|hg|, log|h|) − log|h| and Jensen. No false, vacuous or definition-restating Check found; every Check statable on a carrier in the file has a proved example or a named theorem.

**Locators (46 groups) verified against the cached legal copies.** CDT (journal pagination from the running heads in the cached copy): §1.1.6 p.632; Corollary 2.0.5 p.636; Lemma 2.3.1 pp.639–641; Remark 2.3.3 p.641; Definition 5.1.1 p.667; Lemma 5.1.2, Theorem 5.1.4 and (5.1.6) p.668; Lemma 5.1.8 and Remark 5.1.10 p.669; (5.1.13), (5.1.14) p.670; Definition 5.1.15 p.671; Lemma 5.1.16 pp.671–672; Lemma 5.1.20 p.672; Example 5.1.22 p.673; Proposition 5.2.1 and Definition 5.2.3 p.674; Lemma 5.2.6 and Remark 5.2.8 p.675; Lemmas 5.2.9 and 5.2.12 p.676; Lemma 5.2.16 p.677; Lemma 5.2.18 p.678; Theorem 6.0.1, §6.1.1, Lemma 6.1.2, (6.1.3) p.679; Lemma 6.1.7, (6.1.9)–(6.1.12) p.680; its proof p.681; §6.2.2, (6.2.3), (6.2.4), (6.2.7) p.682; Corollaries 6.2.9, 6.2.11, (6.2.13) p.683; (6.2.15), (6.2.16) p.684 — all statements present and supporting the cited targets (CDT-journal lines 275, 489, 711, 886, 2342, 2357, 2382, 2392, 2420, 2423, 2498, 2514, 2552, 2560, 2654, 2738, 2795, 2830, 2848, 2857, 2870, 2901, 2939, 2957, 3017, 3030, 3047, 3054, 3084, 3104, 3118, 3127, 3221, 3232, 3236, 3243, 3253, 3279, 3359, 3420, 3435). Uniformization: Theorem 1 (line 39), Theorem 6 (152), Proposition 9 (213), Theorem 10 (253), Theorem 12 (383), Lemma 13 (470), with the stated content. McMullenRS: Theorem 2.9 (line 318, page footer 9) and Theorem 17.1 (line 5726, footer 157). TeschlODE: (1.18) (line 444) and Theorem 4.7 with proof (6243–6254). DLMF: 15.8.10 (DLMF-15-8 line 516), 15.2.2 (DLMF-15-2 line 145), 5.7.3 (DLMF-5-7 line 127), 5.7.6 (line 254), 15.10.1 (DLMF-15-10 line 76). Tsu52: Theorem 11 (line 610). All nine `sha256` extractions of `sources.toml` are present in the cache.

**Suppliers.** All ten cited roadmaps are on `main`: ClassicalArithmeticCompletion §6.20 (`TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:12529–12542`, with `conformalRadius_deriv`, `_mono`, `_affine` exactly as consumed; also `merge-order/ORDER.txt:79`), DiophantineApproximationAndTranscendence §5.1 (lines 2928–2967 contain the disc initial-value theorems at 2960–2964), ComplexCurveModuli D0.4 (`README.md:50`), ModularForms Layer 10 (`README.md:1024`; no Picard export, which is the declared gap), FuchsianOrbifolds Layers 0/2/3/4 (headings at 193, 235, 263, 286; anchors match), Completed/UniversalCovers Stages 0 and 2 (headings at 63, 98; anchors match), DifferentialGeometry Layer 2 (`README.md:341`; anchor matches), ConformalMapping L1–L4 (`README.md:102–118`) and its assignment of Picard to ModularForms (`README.md:6`, `154–158`). No `Completed/` supplier is headed `TauCetiRoadmap.X`. The one declared gap is precise, minimal and declared in both places; it is not raised. Pinned declarations named in the contracts were grepped at Tau Ceti `a91d3aaf` and Mathlib `6b7abb3c`: all 48 names exist (including `exists_eqOn_const_mul_of_leftInvOn_ball_of_map_zero`, `logDeriv_deriv_comp`, `isFundamentalDomain_dirichletDomain`, `CuspDatum`, the two Shimizu forms, the horodisc pair, `volume_triangle` in namespace `TauCeti.UpperHalfPlane`, `descendPow`/`descendPow_pow`/`differentiableOn_descendPow` in `RootsOfUnity/Descent.lean`, `image_pow_ball` in `RootsOfUnity/Quotient.lean`, the Cayley pair, the `UniversalCover` instances and `isLocalDiffeomorph_proj`, `IsNormalizedRiemannMapOn`, `circleAverage_herglotzRieszKernel_smul_re_add`, the Schwarz, Poisson, divisor, Jensen, proximity, hypergeometric, Gamma, digamma and `volume_def` names); the stated `rotation θ = !![cos θ, sin θ; -sin θ, cos θ]` convention matches the Tau Ceti module docstring, so r̃_N = `rotation (-π/N)` is correct.

Dependency gate on the unchanged package README:

```text
NOT IN ORDER: ConformalMappingPartII (insert it after its last supplier)
depcheck: 8 roadmaps, 49 edges, 1 problem(s)
```

No UPWARD or CYCLE line. The gate reads the merge order of the board’s `main`, where an imported package is not yet listed (the branch’s own `merge-order/ORDER.txt:148` carries the name); per the brief this is not a defect.

**Not re-raised.** Round-1 findings r1a-F01–F15 and r1b-F01–F14: checked at this head through the repair report’s alias map and found repaired or settled (proved examples confirmed by elaboration; §6.20 owner cited; Log/PosLog module paths; all 17 names present; `PointedCover.exists_cover`; `gauss_equation` without `ha`/`hb`; `cuspComparison`; TeschlODE locators; Lean mirrors; `sources.toml`; the positive membership witness; the (5.1.13)/(5.1.14)/§6.2.2 locators; single import; §5.1 owner; no library-only examples; no fragment anchors; no “deferrals”; pinned geometry cited; pre-Schwarzian; the r̃_N sign note). r1a-F07 is settled by the declared gap. Round-2 pass a S01 (chain-rule base point), S02 (metric uniqueness unowned in §1.12), S03 (Hausdorff/second-countability re-owned), S04 (Perron/Green without the PDE owner), S05 (§1.6 → §1.12 → §1.11 forward dependency) and S06 (`merge-order/ORDER.txt` in the diff) are listed here as not re-raised; this pass found no reason to dispute them.

## Not verifiable

- Hem88 (Theorem 3.1, Lemma 3.3) and KR16 (§1) are recorded `uncertified` in `sources.toml`; their texts were not read, and the README states that the invoked results are proved here.
- Page numbers for TeschlODE (p.7, p.130), Uniformization (pp.2–14) and Tsu52 (printed p.25): the cached extractions carry no page markers, so only the theorem/equation numbers and their content were verified.
- The truth of the 44 `sorry`’d theorems and of the README-only heavy targets (`SurfaceUniformization.*`, `FinitePuncturedCover.cuspComparison`, the Layer 6 group constructions, the effective constants of Layers 8–9) is checked by adversarial reading only, not by proof.
- `gap:little-picard` is a declared contract; its export does not exist in ModularForms Layer 10 at `main`.

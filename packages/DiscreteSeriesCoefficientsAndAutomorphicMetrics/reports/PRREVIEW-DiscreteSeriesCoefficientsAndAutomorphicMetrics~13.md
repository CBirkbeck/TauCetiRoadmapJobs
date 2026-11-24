# Review of DiscreteSeriesCoefficientsAndAutomorphicMetrics (pull request #3027 at cd123f8)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/DiscreteSeriesCoefficientsAndAutomorphicMetrics/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 258 changed lines since `74a09b7`. Accepted: the changed statements (the `K_∞¹` hypothesis of 10.1–10.2 and its Conventions paragraph, the origin, method and corollary labels, the new supplier citations) were recomputed on `GL₂`, modular curves, unitary similitude groups and small class sets, and checked against Mumford, Müller, Harish-Chandra, Hecht–Schmid, Thorne and the cited supplier sections at this head; nothing false was found. The folder has not changed since the previous review, so its three small corrections and one format note stand as before, none blocking: two origin labels (10.1, 9.1) credit a source with more than its statement has, and one sentence of the description is out of date. Nothing is left for the human reviewers.

## C01 — The origin label of 10.1 credits Mumford with the `K_∞¹` form, but his Main Theorem 3.1 is stated for a semisimple adjoint group and does not contain the bundle `ω` that the hypothesis admits

Lines 494–496 call 10.1 published in the setting of AutomorphicBundles §5.3 (Mumford 1977), and the Labels paragraph (lines 33–35) lists only "the form of 10.1 for general data" as the roadmap's own, so a reader takes the `K_∞¹` form to be Mumford's. Mumford takes `G` semisimple adjoint and a representation of its maximal compact subgroup (mumford-1977 lines 579 and 672–682). The character giving `ω` on `X(N)`, used by the first Check of 10.1 and both Checks of 10.2, restricts to `e^{iθ}` on `K_∞¹ = SO(2)` and is `−1` at `−1 ∈ SO(2)`, so it is not a representation of the maximal compact subgroup `SO(2)/{±1}` of `PGL₂(ℝ)`. His argument, run on the derived group, gives the theorem; his statement does not contain it.

The label could read "adapted from Mumford (1977), Main Theorem 3.1, stated for a semisimple adjoint group; here for representations unitary on `K_∞¹`", or the `K_∞¹` form could join the own formulations at lines 33–35.

## C02 — Müller (1989), Corollary 8.8, gives the discrete clause of 9.1 only over `ℚ` and when `Z(ℝ)⁰ = A_G(ℝ)⁰`

The origin label of 9.1 (line 451) and its discrete route (line 473) cite Müller (1989) for the discrete clause for `K_∞`-finite `f`, for a connected reductive group over a number field on `L²_disc([G]¹)`. Corollary 8.8 (muller-1989 lines 2102–2117, printed p. 84) is for a group over `ℚ`, on the discrete spectrum of `L²(Z(ℝ)⁰G(ℚ)\G(𝔸))`, which is the `[G]¹` space only when `Z(ℝ)⁰ = A_G(ℝ)⁰`; this fails for `Res_{F/ℚ}GL_n`, `F ≠ ℚ`. AutomorphicSpectralTheory §6.4a, of which 9.1 is a corollary, says so itself. The stated result is unaffected, Müller (1998) covering general `f`. The label could add "over `ℚ`, when `Z(ℝ)⁰ = A_G(ℝ)⁰`" after "Müller (1989)".

## C03 — The pull request's description still calls 10.1–10.2 corollaries of AutomorphicBundles §§5.3a–5.3b without restriction

The description says "DiscreteSeriesCoefficientsAndAutomorphicMetrics §§10.1–10.2 are corollaries of them". At this head they are corollaries only for representations unitary on `K_∞`; the cases unitary only on `K_∞¹`, among them `ω` and the Hodge summands the family uses, are stated and proved here (README lines 506–511 and 543–548). The sentence could read: "… are corollaries of them for representations unitary on `K_∞`, and state themselves the cases unitary only on `K_∞ ∩ G(ℝ)¹`."

## N01 — 7.5b has statements to prove but no method label

The family index asks for `*Method of the formal proof:* none` where the formal proof has no such statement; 7.5b (line 286) carries the origin label only, and the Labels paragraph (line 29) records that. One line under the origin would align it with the other sections.

## Questions for the author

- The Labels paragraph (lines 30–33) says that [FormalProof] has a statement of 7.5c (trivial stabilisers) and of 10.1 (Hodge metrics), yet neither section names a declaration and the [FormalProof] entry of the References lists the citing targets without them. Which declarations are meant? I opened only two files of that repository (below), not these.

## Previous findings

- The previous review, of `c832fa9`, had no finding. The folder is unchanged since that head, so its small corrections C01–C03 and format note N01 are not taken up and are repeated above with the evidence checked again; its question to the author stands.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Conventions, `K_∞¹` | `GL₂`, stabiliser of `i` | `K_∞ = {[[a,b],[−b,a]]} = ℝ_{>0}·SO(2)`; with `|det| = a²+b² = 1`: `SO(2)` | true | none |
| Conventions, compactness clause | `GL₂`; control `Res_{F/ℚ}GL₂`, `F` real quadratic | centre ranks ℝ/ℚ: 1/1, compact; control 2/1, `(t, 1/t) ∈ K_∞¹` unbounded, `O_F^×` not discrete in `𝔸_f` | true, hypothesis needed | none |
| Conventions, transitivity and arithmetic subgroups | general `G` | `G(ℝ) = G(ℝ)¹·A_G(ℝ)⁰`, `A_G` central fixes `X`; `χ(γ) ∈ ℤ^× = {±1}` | true | none |
| 10.1 (sample) | `ω` on `X(N)`; `(𝔤/𝔮)^∨` | centre `t ↦ t`, not unitary on `K_∞`; `e^{iθ}` on `SO(2)`; `‖dz‖² = −log|q|/2π`; adjoint action trivial on centre | hypothesis admits both | none |
| 10.1 origin against Mumford | mumford-1977 lines 579, 672–682 | adjoint `G`, representation of its `K`; `−1 ∈ SO(2)` acts on `ω` by `−1` | label wider than source | C01 |
| 10.2 (sample), first Check | `X(3), X(4), X(5), X(7)` | `(g, c) = (0,4), (0,6), (0,12), (3,24)`: `deg ω = 1, 2, 5, 14 = index/12`; `κ = −1, −2, −5, −14`; `κ·deg O(−1) = deg ω` | true | none |
| 10.2, second Check and sign | `X(3)²`; AutomorphicBundles §5.3b | left `1`; right `κ²·(−1)(−1) = 1`; curve: `(−1)^{dim X}·v < 0`, `κ < 0` | consistent | none |
| 10.2, constant by Gauss–Bonnet | curve; `T X̌` | `deg T(−log D) = 2 − 2g − c = χ(Y)`; `c_top(T X̌) = χ(X̌)`; ratio `κ_K` | true | none |
| 7.5a (sample), corollary line | AdelicAlgebraicGroups §4.5a; `GL₁/ℚ`; index-2 level | `vol(G_∞J/A_∞) = vol(U)·vol(G_∞/A)`; mass `1/2`; `mass J′ = 1 = 2·(1/2)` | agree | none |
| 7.5a origin, Thorne | thorne-2012 lines 1472–1499 | hypothesis "no element of order `l`" in Lemma 6.4; pairing weighted by inverse stabiliser order in its proof | supports label | none |
| 7.5b (sample) | one class, `Γ = {±1}`, kernel `1` | `K_k 1 = 1/2`; `N_J·K_k 1 = 1` integral | true | N01 (label) |
| 7.5c (sample), corollary line | `Γ = {±1}`, trivial and sign | `dim = 1 = 1/2 + 1/2`; `0 = 1/2 − 1/2`; central form `2·(1/2)·1 = 1`, `0` | true | none |
| 9.1 (sample) | AutomorphicSpectralTheory §6.4a; `GL₁` | same statement; restriction of a trace-class operator to a closed invariant subspace is trace class; `L²_cusp = L²_disc` | true | none |
| 9.1 origin, Müller 1989 | muller-1989 lines 2102–2117 | Corollary 8.8, p. 84: over `ℚ`, modulo `Z(ℝ)⁰`, `K`-finite | label wider than source | C02 |
| 2.4a (sample), Check and method label | `U(1,1)`, gap `h` | `Φ_λ = cosh(t)^{−(h+1)}`; (a): `log cosh t ≥ min(t²/4, t/8)`, at `t = 1`: `0.434 ≥ 0.125` | true | none |
| 2.4b (sample), method label `r_s` | `n = 2`, `μ₁ − μ₂ = h` | `r₁ = (h+1)/h`, `r₂ = (h−1)/h`, sum `2 = dim ℂ²`; `d(D_{h+2})/d(D_{h+1}) = (h+1)/h`; `r₂ = 0` at `h = 1` | true | none |
| 2.4b, Hecht–Schmid hypothesis | hecht-schmid-1975 lines 98–133 | `⟨μ + e_s, e_a − e_b⟩ ≥ h − 1 > 0` for `h ≥ 2`; (1.3) p. 130, (1.4), (1.5) p. 131 | true | none |
| 6.8 (sample), origin | AutomorphicFormsOnReductiveGroups §6.8a; `D_k⁺` | semisimple `G` there; `K`-types `k, k+2, …` | consistent | none |
| 6.8a (sample), method label | `p = q = f = 1`; [FormalProof] `SumBoundStatement` | count `R^{4fn²}` times `R^{−2s}`: ratio `4^{2fn²−s}`; threshold `8`; the declaration has `2·f·(p+q)² < s` | agree | none |
| 8.1, 8.2 (sample), origins | hc-1953 lines 971, 1713, 1723, 1817 | §7 p. 209; Lemma 34 and Theorem 5 p. 228; Theorem 8 p. 231; permissible, finite-dimensional isotypic parts | supports labels | none |
| 8.3 (sample), method label | `U(2)`, `λ = (3/2, −1/2)`, `s = 1` | step factor `(3/2 + 1 + 1/2)/2 = 3/2`; dimensions `2 → 3` | true | none |
| Headline (4), Lean docstring | README lines 5, 21, 513, 550; `Suggested.lean` lines 47–57 | same `K_∞¹` hypothesis and triviality on the unipotent radical in each | consistent | none |

- Source locators checked against the text: 14 (mumford-1977 lines 170, 579, 681, 902, 993 with printed pages 242, 256, 262, 264; muller-1989 lines 2102–2117; hc-1953 lines 971, 1713, 1723, 1817; hecht-schmid-1975 lines 98, 121, 132; thorne-2012 line 1472; van Haastrecht–Zhang arXiv:2412.18382, §4 and Proposition 4.3).
- [FormalProof] at the commit the README names: `SumBoundStatement` (6.8a) and `MumfordProportionality` (10.2) opened; the first has the threshold `2·f·(p+q)² < s`, the second a covolume as constant, as the labels say.
- Library declarations: `Suggested.lean` declares nothing, so no `#check` comparison and no one-tactic probe applies. The eight library names of its docstring exist at the pins (for example `FDRep.average_char_eq_finrank_invariants`, Mathlib `RepresentationTheory/Character.lean` line 214; `TauCeti.OperatorIdealFamily.traceClass`, `Analysis/OperatorIdeal/Family/TraceClass.lean` line 59).
- Cross-roadmap citations resolved at this head: AutomorphicBundles §§0.5, 5.3, 5.3a, 5.3b, 6.1; AutomorphicSpectralTheory §§0.8, 0.9, 3.4, 4.4, 4.5, 6.4, 6.4a, 6.17; AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7, 6.1, 6.8, 6.8a, 7.4, 7.5, 7.5a; AdelicAlgebraicGroups §§2.3, 2.4, 3.4, 4.5a; SingularHermitianMetricsAndL2Methods §§5.1–5.5; NoncompactQuantumSymmetry Layer 3 (M0), item 3 (on main, unchanged by this pull request).
- Record: the head has every heading of the README at the merge base and adds one (the supplier subsection for NoncompactQuantumSymmetry); no layer, section or item is removed or changes subject; `Suggested.lean` had and has no declaration.
- Automatic checks: all pass. Dependency check: `depcheck: 132 roadmaps, 1476 edges, 0 problem(s)`. Elaboration of `Suggested.lean`: exit 0, no output.
- Changes outside the folder: every changed file lies in a roadmap folder or family index that this pull request owns.
- Headlines: four (formal degree 8.3; coefficients 2.4a (b), (c); mass and dimension 7.5a, 7.5c; goodness and proportionality 10.1–10.2); none statable at the pins, each named in the module docstring with what it lacks.

Overlap check: read AutomorphicBundles, AutomorphicSpectralTheory, AutomorphicFormsOnReductiveGroups, AdelicAlgebraicGroups, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, BesselPoincareSeriesAndGramBounds and ProjectiveModelsAndPeriodBoundsOnShimuraVarieties. Shared objects and owners: goodness and proportionality for `J` unitary on `K_∞`, AutomorphicBundles §§5.3a–5.3b; trace class on the cuspidal and discrete spectrum, AutomorphicSpectralTheory §6.4a; class-set integration and the mass, AdelicAlgebraicGroups §4.5a; the class-set inner product and the published lowest-weight case, AutomorphicFormsOnReductiveGroups §§7.5a, 6.8a. This roadmap cites each as a corollary source and its scope section no longer claims them. No open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only; 11 passages compared with 6 sources (mumford-1977, muller-1989, hc-1953, hecht-schmid-1975, thorne-2012, van Haastrecht–Zhang 2024), none shared; largest share mumford-1977 and hc-1953, about 12 each of about 58 locators; the arrangement was not compared, the change adding, removing and reordering no layer.

Research link: Layer 10 is Mumford's proportionality in the non-compact case (Mumford 1977), Layer 8 the formal degree of Harish-Chandra (1966) and Atiyah–Schmid (1977), Layer 9 Müller's trace-class theorem (1989, 1998), Layer 7 Gross's algebraic modular forms (1999); the family uses them for the formal proof announced by Alpöge (2026). Rests on the README's References and on mumford-1977, muller-1989.

## Not verifiable

- Sun (2007) (origin of 2.4a, method label of 8.3): no legal copy found through the sources service (the publisher's page only).
- Gross (1999), Harish-Chandra (1966), Müller (1998): recorded as uncertified; cited by locator.
- Zuckerman (1977), Gould (1980, 1985), Atiyah–Schmid (1977), Harris (1989), Dixmier–Malliavin (1978), Knapp (1986): not opened; the labels cite them without a statement number, except Gould's Theorem 3.
- [FormalProof]: two of its declarations opened (above); the other method labels were read for internal consistency only.

## Source issues

- none

## For the human reviewers

- none

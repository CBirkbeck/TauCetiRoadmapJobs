<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2463#issuecomment-6675809673 -->
Review (claude) of a38f2ef

Verdict: needs_changes

1. **F01** (P2) §3.4 applies PerfectoidTowers P9.6 to a cover its hypotheses do not reach

   **Location.** `packages/VectorBundlesAndIsocrystalsPartII/README.md` 626–630: "For the normalized sympathetic closed-disc cover, compare continuous `H_C`-cochains with pro-étale `O`-cohomology … *Needs:* §3.2; PerfectoidTowers §P9.6; PerfectoidSpaces §P6." and 129: "PerfectoidTowers §P9.6 supplies *almost-cohomology-of-tower* and *function-descent-along-tower*, with their stated base and coefficient topologies."

   **Claim.** P9.6 supplies the comparison of continuous `H_C`-cohomology of the sympathetic closure `C̃{X}` with pro-étale `O`-cohomology of the disc, which §3.4 then rationalizes and decompletes to `H¹_cts(H_C, C̃{X}) = C{X}·ψ_1`.

   **Witness.** PerfectoidTowers README at #816, P9.6 (lines 2461–2490): both named statements are for `X` a smooth rigid space over a complete discretely valued `k` with perfect residue field and `X_∞ → X` a pro-étale `G`-tower over `X`, the almost statement read after base change to `C` for `U_∞ = U ×_X X_∞`. The cover of §3.4 is the sympathetic closure `C̃{X}/C{X}` with group `H_C = Aut(C̃{X}/C{X})` (CN25 line 1054–1058), a cover built over `C` that is not the base change of a tower over `k`. Only the explicit tower of §3.2 (p-power roots of `exp(pX)` and of `p`, CN25 line 1070–1082) is such a base change (of the Kummer–cyclotomic tower of the disc over `ℚ_p`). The step from that tower to `H_C` is the almost-étale descent CN25 line 1090 calls "standard"; no target or supplier states it, and §3.4's *Needs* line omits PerfectoidSpaces §P3 (almost purity), which §3.8's line lists.

   **Repair.** In §3.4 write the route in two steps: (1) apply P9.6's *almost-cohomology-of-tower* to the tower of §3.2 read as the base change to `C` of the tower of the disc over `ℚ_p` obtained by adjoining the `p`-power roots of `exp(pX)` and of `p` and all `p`-power roots of unity (a pro-étale Galois tower; Hochschild–Serre removes the constant part after base change), obtaining `H¹_proet(Sp(C{X}), O⁺/p^m)` almost isomorphic to `H¹_cts(ℤ_p(1), O⁺(Ĉ{X}_∞)/p^m)`; (2) state as part of §3.4 that inflation from the Kummer group to `H_C` is an isomorphism on `H¹` of the completed structure sheaf, because `C̃{X}` is a pro-finite-étale, hence almost-étale (PerfectoidSpaces §P3), extension of the perfectoid `Ĉ{X}_∞`, so the kernel's continuous cohomology of `O⁺/p^m` is almost zero in positive degrees. Add "PerfectoidSpaces §P3" to §3.4's *Needs* line and to the Layer 3 Dependencies (already there) and name the two-step route in the supplier contract at line 129. Tested on the instance that refuted the original: with the sympathetic closure alone, no cited statement has `U_∞ = U ×_X X_∞`; with the Kummer tower, P9.6's hypotheses (smooth `X` over `ℚ_p`, pro-étale `G`-tower, `U_∞` affinoid perfectoid by CN25 Lemma 4.9) hold.

2. **F02** (P3) Supplier drift: the parent no longer has a "Layer VB3"

   **Location.** `README.md` 103: "Layer VB3 supplies *Sympathetic Vector Spaces*…", and 33 further occurrences of "Layer VB3" (34 in all); `design/plan.json` 2927: `"section": "Layer VB3, VS Hom vanishing from torsion period modules"`.

   **Claim.** The parent's Banach–Colmez layer is named VB3.

   **Witness.** VectorBundlesAndIsocrystals README at #1205 contains no "VB" label; its layers are "Layer 0" to "Layer 6", and the Banach–Colmez material is "## Layer 5: Banach–Colmez spaces" (parent line 1062). All 18 cited headings exist as `####` subsections of that layer (parent lines 1288 *Sympathetic Vector Spaces* … 1618 *Nonpositive curvature extension criterion*).

   **Repair.** Replace "Layer VB3" by "Layer 5" throughout the README (34 occurrences) and in the `section` field of the `G-HOM` gap in `design/plan.json` (the only plan field the package stage may change). The 18 heading names stay as they are.

3. **F03** (P3) Supplier drift: three LocallyAnalyticDistributions declaration names

   **Location.** `README.md` 117: "its strict derived category and left heart `naLeftHeart`"; "`naFunctionalExtension_countableType` (continuous functional extension in countable type), and `naProjectiveLimit_cohomology_finiteDimensionalML`".

   **Claim.** LocallyAnalyticDistributions declares these three names.

   **Witness.** At head #854 neither `README.md` nor `Suggested.lean` of LocallyAnalyticDistributions contains any of the three strings. The targets exist in prose: *Left hearts and strict exactness* (§0.0, its README line 940), *Continuous functional extension in countable type* (§0.2, line 1098), *Strict countable inverse limits and cohomology* (§0.2, line 1126).

   **Repair.** Replace the three backticked names at line 117 by these italic target names (§4.7's *Needs* line already uses the prose name).

4. **F04** (P3) Supplier drift: `senModule` and `senOperator`

   **Location.** `README.md` 113: "Section 4.4 supplies `senModule` and `senOperator` on finite-dimensional semilinear `C`-representations".

   **Claim.** PadicHodgeTheory §4.4 declares `senModule` and `senOperator`.

   **Witness.** At head #1062 neither PadicHodgeTheory's README nor its `Suggested.lean` contains either string. §4.4 "Sen and differential de Rham realizations" (its README line 895) supplies the Sen module and Sen operator of a finite-dimensional continuous semilinear `C`-representation in prose.

   **Repair.** Write "Section 4.4 supplies the Sen module and the Sen operator of a finite-dimensional continuous semilinear `C`-representation" without backticks.

5. **F05** (P3) Stale pin hashes and six line numbers

   **Location.** `README.md` 66: "The pin is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`." and 92: "The pin is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`."

   **Claim.** These are the pinned Mathlib and Tau Ceti commits.

   **Witness.** `lake-manifest.json` pins Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`; the elaboration below ran against these. At the manifest pin, 13 Mathlib rows and both Tau Ceti rows are exact, and six rows point at a docstring or section line one to eight lines above the declaration: `krullTopology` is at KrullTopology.lean:134, `ContinuousLinearMap.isOpenMap` at Banach.lean:229, `exists_preimage_norm_le` at Banach.lean:162, `Monoid.End` (whose `to_additive` is `AddMonoid.End`) at Hom/Defs.lean:975, `Abelian.Ext.mapExactFunctor` at Ext/Map.lean:126, `WittVector.fontaineTheta` at FontaineTheta.lean:166. (All 19 were exact at `6b7abb3`.)

   **Repair.** Update the two hashes to the manifest pins and the six line numbers as listed.

6. **F06** (P3) Locator slips

   **Location.** `README.md` 1097 and 1133: "TVS25 … Proposition 4.21, pp. 28–29"; `sources.toml` 98 (TVS25 locator "Proposition 4.21"); `README.md` 500: "(CN25 … Appendix A, pp. 58–60)" and 814: "(CN25, Appendix A.4, pp. 59–60 …)".

   **Claim.** TVS25's statement 4.21 is a Proposition; CN25's Appendix A runs to p. 60.

   **Witness.** TVS25 line 1288 (p. 28): "Lemma 4.21". CN25's Appendix A occupies pp. 58–59 (lines 2873–2952); line 2953–2955 (p. 60) begins the bibliography; Proposition A.4 is at line 2922, p. 59.

   **Repair.** "Lemma 4.21, p. 28" in both README places and in the TVS25 manifest locator; "Appendix A, pp. 58–59" at line 500 and "Appendix A.4, p. 59" at line 814.

7. **F07** (P3) Redundant hypothesis in `fundamental_extension_surjective`

   **Location.** `Suggested.lean` 94: `(hV : ∀ (σ : PadicAlgCl p ≃ₐ[K] PadicAlgCl p), ∀ v ∈ V, ρ σ v ∈ V)`.

   **Claim.** Stability of `V` is an independent hypothesis.

   **Witness.** It follows from `hq_ker` and `hq_equiv`: for `v ∈ V`, `q (ρ σ v) = ρW.act σ (q v) = ρW.act σ 0 = 0` (additive endomorphism), so `ρ σ v ∈ q.ker = V.toAddSubgroup`. The statement holds without it on every instance.

   **Repair.** Delete `hV`; the README sentence at 1.8 ("`V` a stable finite-dimensional subspace") may stay, stability being a consequence. Re-run the `#check @` audit after the deletion.

8. **F08** (P3) Process phrase in Scope

   **Location.** `README.md` 7: "No roadmap on main or in an open pull request constructs these objects."

   **Claim.** None; the sentence records a state of the pull-request queue.

   **Witness.** House rule: no pull-request references and no process narrative; a reader a year from now cannot read "open pull request" as a mathematical statement.

   **Repair.** "No other roadmap constructs these objects."

Reviewed on 2026-11-06 against the board branch (package files as listed below), content main `ffac513`, the open heads the tool indexes (parent VectorBundlesAndIsocrystals at #1205, LocallyAnalyticDistributions #854, PadicPeriodRings #940, PadicHodgeTheory #1062, FiniteFlatGroupsAndIntegralPadicHodgeTheory #879, ArithmeticGaloisRepresentations #856, ArithmeticGaloisDuality #858, PerfectoidTowers #816, CohomologyComparisons, CstConjectureForDaggerVarieties #1759) and the pins of `lake-manifest.json` (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`). No previous review of this package. One P2 and seven P3 findings; no P1. The package files were not changed; the sources manifest was not changed (every cited text was already in the cache).

## Verified sound

**Principles.** No route-specific shortcut, no re-planned roadmap (the parent's Layer 5 is imported by heading, Fontaine's and Colmez–Nizioł's theory is built from the published sources), no copied passages (the sampled paragraphs are paraphrases of the sources read at their locators), no algorithm, no sorry'd data, no `set_option`, single `import Mathlib`, `theorem` only. Supply is downward only (below).

**Elaboration.** `lake env lean packages/VectorBundlesAndIsocrystalsPartII/Suggested.lean` from the content checkout: exactly two warnings, `65:8 declaration uses sorry` and `88:8 declaration uses sorry`, 5.6 s. `#check @` audit of the four declarations on a scratch copy: elaborated types agree with the README statements of Conventions, §0.2 and §1.8; every binder (`[FiniteDimensional ℚ_[p] K]`, `[FiniteDimensional ℂ_[p] Wᵢ]`, `[IsModuleTopology ℂ_[p] Wᵢ]`, `[CompleteSpace E]`, `[FiniteDimensional ℚ_[p] V]`, `hW`, continuity, surjectivity, kernel and equivariance of `q`) is in the declaration's own signature; nothing changed.

**Padding probe.** Both sorried theorems were tried on a scratch copy with `first | (simp; done) | rfl | infer_instance | (simp_all; done) | tauto`: every tactic reports "does not change the goal" and the `sorry` branch is reached (log lines 65:8 and 94:8). Neither restates a definition, mirrors a Check or computes a value. No padding.

**Headline theorems.** README summary: Fontaine's full faithfulness and duality, the disc extension isomorphism, full faithfulness of reasonable qBCs in TVS, the height–rank formula, plus the fundamental theorem of §1.8. Stated at the pins: full faithfulness for `ℂ_p`-representations (`semilinearRep_equivariant_map_smul`) and the fundamental theorem (`fundamental_extension_surjective`). Named in the module docstring as not statable, with the missing carrier: full faithfulness for `B_dR⁺`-representations (Mathlib's `BDeRhamPlus`, BDeRham.lean:75, has no functoriality in `R` and no Galois action: checked, the file has no `map`); structure theorem and Euler–Poincaré duality (no `B(G_K)`, `C(G_K)` or `Ext` in it); the disc class (no TVS, left heart or sympathetic algebra); qBC full faithfulness; the height–rank formula (no VS category). None of these admits a stand-in at the pins; the docstring's reasons are correct.

**Definitions in Suggested.lean.** `galoisAct p σ := UniformSpace.Completion.map σ`: `σ` is a `K`-algebra automorphism of `PadicAlgCl p`, hence a `ℚ_[p]`-algebra automorphism, hence isometric for the spectral norm (`spectralNorm_eq_of_equiv`, SpectralNorm.lean:451, read over `ℚ_[p]`), so `Completion.map` is the genuine continuous extension and its junk branch is never used. `SemilinearRep`: action into `AddMonoid.End W` (composition), semilinearity law through `galoisAct`, joint continuity for the Krull topology (instance at KrullTopology.lean:134, in scope by elaboration). Adversarial rows below.

**Sources: the seeded sample (15 targets) and the headline locators.** Verified at the text, with page and hypotheses:

- 0.4: CN25 line 400–408 (§2.2.1, p. 9: almost isomorphism with finite-dimensional stable `V_i`, `ht = dim V₂ − dim V₁`), Remark 2.3 line 404 (arbitrary `K`); Fontaine03 §1.4 line 257–264 (p. 291). Matches.
- 0.6: CN25 line 411–414 (p. 9); Fontaine03 Théorème C line 272–274 (p. 291, "cf. §5.5"). Matches.
- 0.8: Colmez12 Théorème 3.1(ii) line 294–297 (pp. 116–117, `K̄` dense in `B_dR⁺`, which is its separated completion), standing hypotheses line 137–138 (`k` perfect, `K` finite over `W(k)[1/p]`, i.e. the README's general base); CN25 Proposition 2.13(ii) line 492–495 (p. 11). Matches.
- 1.4: CN25 Proposition 2.7 line 445–449 and (2.8) line 451 (p. 10): the displayed complex and differentials, with `χ⁻¹(γ)`; Fontaine03 Théorème 2.14 line 1014–1023 (p. 309; proof to p. 311). Matches (the README's `χ⁽¹⁾(γ)⁻¹` is Fontaine's lift-independent character).
- 2.1: CN25 Definition 4.1 line 960–965 (p. 20), Remark 4.3 line 971–989 (p. 21, algebraic quotient well defined); Schneiders99 Corollary 1.2.21 line 852–864 (pp. 24–25). Matches; the homeomorphism of quotients is the roadmap's own target.
- 2.5 and 2.6: CN25 Definition 4.4(i) and footnote 10, line 992–1018 (p. 21: completed balanced tensor, countable Banach basis, `B_m(Λ) ≃ ℓ∞₀(I, B_m)`, realization `ℓ∞₀(I, W)`); Remark 4.20 line 1264–1271 (p. 26); Appendix A line 2873–2952 (pp. 58–59). Matches; "same type" in 2.6 is automatic for a strict exact sequence.
- 3.2: CN25 Lemma 4.9 and footnote 12, line 1070–1082, 1116 (p. 23). The odd-`p` formulas match; `p = 2` is the roadmap's own extension (row below).
- 3.6: CN25 Proposition 4.10(i) line 1085–1086, Lemma 4.11 line 1108–1113, Remark 4.14 line 1169–1184 (pp. 23–25). Matches, including the bound `‖g‖ ≤ p·sup‖τh − h − h(τ)‖` and the rank-zero splitting `s(x) = (τ_{x/v} − 1)ℓ_v`.
- 3.7: CN25 Proposition 4.10(ii) line 1087–1088, 1099–1107 (p. 23: `λ_E = 1` for `B₂` with `x ↦ tx`). Matches.
- 3.8: CN25 Remark 4.15(i)–(ii) line 1185–1191 (p. 25); Colmez02 Théorème 10.5 line 3320–3323 (p. 76), Proposition 10.18 line 3613–3614 and Remarque 10.19 line 3615–3619 (p. 82). Matches (`(σ−1)(a f_{a,1}) = ψ_a(σ) − aψ_1(σ)`).
- 4.9 and 4.10: CN25 §4.3.2 line 1259–1262 (p. 26, "reasonable" `B_m`-module without separability), Remark 4.20, Proposition 4.22 line 1291–1338 (p. 27: `W[t^d]`, `W/t^d`, dévissage on `m` then `d` with `0 → B₁ → B_d → B_{d−1} → 0`, first map `t^{d−1}`). Matches.
- 4.14: CN25 Lemma 4.29 line 1500–1524 (p. 30); context line 1472 (`W₁, W₂` killed by `t`), line 1487–1489 (open mapping for `ℓ ↦ ℓ(1)`). Matches; the nonunit case is the roadmap's addition (source gap below).
- 6.1: CN25 §3.3 line 912–920 (p. 19: `h(W)`, the colimit and tensor identifications "thanks to the arguments in the proof of Corollary 3.18"), Corollary 3.18 line 828–842 (p. 18). Matches.
- Headlines: Fontaine03 Théorème A line 213 (p. 290), Théorème A′ line 254 (p. 291), standing hypothesis `[K:ℚ_p] < ∞` line 167 (p. 289); Théorème 4.1 line 1816–1820 (p. 329), proof ending line 2294 (p. 340); CN25 Theorem 2.1 line 387–392, Theorem 2.6 line 431–436, Proposition 3.27 line 939–955; FF18 Théorème 2.25 line 948 (p. 21), Remarque 2.26 line 972 (p. 22), Proposition 2.28 line 1012 (p. 23); Fontaine04 Proposition 6.2 line 4274 (p. 107). TVS25 Definition 3.32 line 1054 (p. 23), Theorem 4.1 line 1084 (pp. 24–25), Corollary 4.7 line 1165 (p. 26), Corollary 4.25 line 1341 (p. 30); LeBras18 Théorème 4.1 line 1176 (p. 26); AnschutzLeBras25 Theorems 3.1, 3.9 and Corollaries 3.8, 3.11 at lines 818, 993, 972, 1169. The author flagged no locator as unverified.

**Adversarial table** (sampled targets, headlines, and the targets a finding touches).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `galoisAct` | `σ = id`; `K = ℚ_p`, `χ(σ) = a`; `K = ℚ_p(ζ_p)` | `Completion.map id = id`; `ζ_p ↦ ζ_p^a ≠ ζ_p` for `a ≢ 1 (p)`; `ζ_p` fixed. Uniform continuity: `‖σx‖_sp = ‖x‖_sp` (restriction of scalars to `ℚ_p`) | determined; wrong model "arbitrary extension" excluded by `map_coe` | none |
| `SemilinearRep` | `ℂ_p` with `galoisAct`; `ℂ_p` with `act σ = id`; `W = 0` | law `σ(cw) = σ(c)σ(w)` holds; trivial action fails at `c = ζ_p, w = 1`: `ζ_p ≠ σ(ζ_p)`; zero module trivially | excludes the trivial structure | none |
| `semilinearRep_equivariant_map_smul` | `W₁ = 0`; `W₁ = W₂ = ℂ_p`, `f = a·`, `a ∈ K`; `W₂ = ℂ_p(1)`; `K = PadicAlgCl p` | `0 = 0`; `f(cw) = acw = c f(w)`; equivariant `f : ℂ_p → ℂ_p(1)` is `0` since `H⁰(G_K, ℂ_p(−1)) = 0`; `K = ℚ̄_p` excluded by `[FiniteDimensional ℚ_[p] K]` | holds (Fontaine03 Th. A, finite `K`) | none |
| same, generality | README "continuous `ℚ_p`-linear" vs Lean `→+` continuous | additive gives `ℚ`-linear (`f(x) = n f(x/n)`), continuity and density of `ℚ` in `ℚ_p` give `ℚ_p`-linear under the module topology | equal generality | none |
| `fundamental_extension_surjective` | `E = V ⊕ ℂ_p`, `η = (g, 1)`; `η = (g, 0)`; `V = 0`, `W = ℂ_p(1)`; `V = 0`, `W = ℂ_p`, `η = id`; `E = U₁`, `V = ℚ_p t`, `η = θ` | kernel `{(v, −g v)}`, `finrank = dim V`; `range η = η(V)` so excluded, kernel `ker g ⊕ ℂ_p` infinite; every `η` is `0`, hypothesis fails; surjective with kernel `0 = dim V`; `θ(ℚ_p t) = 0 ≠ θ(U₁) = C`, kernel `ℚ_p t`, dimension `1` | holds (Fontaine03 Th. 4.1) | `hV` redundant (R07) |
| same, strictness | `q` continuous surjective, `W` finite-dimensional with module topology | `W` complete, `E/V` Banach, continuous bijection `E/V → W` is a homeomorphism by the open mapping theorem | no strictness binder needed | none |
| §0.4 `(dim, ht)` | `ℚ_p`; `C`; `C/ℚ_p`; `C ⊕ ℚ_p` two presentations | `(0, 1)`, `(1, 0)`, `(1, −1)`; `1 − 0 = 1` and `2 − 1 = 1` (unsigned would give `3`) | consistent with CN25 line 408 and with the parent's `dim F₁ − dim F₂` (`ℚ_p`: `1 − 0`; `C/ℚ_p`: `0 − 1`) | none |
| §0.6 | `B₂`; `C(1)`; `0`; `ℚ_p` | `(2, 0)` almost `C²`; `(1, 0)` with `Hom(C, C(1)) = Hom(C(1), C) = 0`; `(0, 0)`; `(0, 1)` not a period module | consistent | none |
| §0.8 density | modulo `t`; `K` in place of `K̄`; `B₂` | `K̄ ⊂ C` dense; `K` closed in `C`, fails; `t` reduces to `0` so density of residues does not suffice | hypotheses needed | none |
| §1.4 complex | `W = C`; `W = C(1)`; `d₁d₀` on `z = 1 ∈ B₂`, both conventions | `K → 0 ⊕ K → 0`, cohomology `(K, K, 0)`; `(0, K, K)`; right convention `t′γz − t′z − (t′γz − t′z) = 0`, wrong one `(1 − χ⁽¹⁾(γ)²)t′ ≠ 0` since `χ⁽¹⁾(γ) ∈ 1 + 2pℤ_p` is a topological generator | pins the inverse | none |
| §1.5–1.6 | `X = Y = ℚ_p`; `(k, j) = (1, 0), (1, 1), (2, 1)` | `1 − ([K:ℚ_p] + 1) + 0 = −[K:ℚ_p] = −[K:ℚ_p]·1·1`; `(1,1,0)`, `(0,1,1)`, `(0,0,0)` from Lemma 2.10 | consistent | none |
| Conventions, `χ⁽¹⁾` | `p = 3`, lifts `u, −u`; `p = 2`, `5` | `log(−1) = 0` so `exp(log u) = exp(log(−u))`; `log 5 ∈ 4ℤ_2`, `exp(log 5) = 5` | lift-independent | none |
| §2.1 boundedness | `[0 → C]`; `[C → C]`; `T(x)_n = p^n x_n` on `c₀` | usual bounded sets; `0`; `(p^n) ∉ T(c₀)` (would need `x_n = 1`), Hausdorff quotient `0` | non-Hausdorff quotient kept | none |
| §2.5–2.6 | `M = B_m`; `M = c₀₀`; `M = 0`; `Λ = C`; split `C → C² → C`; diagonal injection | evaluations `B_m`, `c₀`, `0`; `I` singleton; `Λ → Λ² → Λ` strict; `c₀(I, W₁) → c₀(I, W₂)` injective coordinatewise, not strict | consistent | none |
| §3.2, odd `p` | `p = 3`, `n = 0`; general `n` | `(p^{1/p}Y₀ + 1)^p = e^{pX}` gives `Y₀^p + Σ_{1≤j<p} (binom(p,j)/p) p^{j/p} Y₀^j = X + Σ_{k≥2} p^{k−1}X^k/k!`, `v_3(3^{k−1}/k!) = k − 1 − v_3(k!) ≥ (k−1)/2 > 0`; so `Y₀³ ≡ X (mod 3^{1/3})` | matches CN25 line 1077–1079 | none |
| §3.2, `p = 2` | `n = 0`; `n ≥ 1`; unnormalized `exp(2X)` | `(2Y₀ + 1)² = e^{4X}`, `Y₀² + Y₀ = Σ 4^{k−1}X^k/k!`, `v_2 ≥ k − 1`; `Y_n² + 2^{1−1/2^n}Y_n = Y_{n−1}`; coefficient `2^{k−1}/k!` has `v_2 = s_2(k) − 1 = 0` at `k = 2^r` | odd-`p` formula fails at `2`; normalized one holds; `E_2 = E_1²` so `ψ_2 = 2ψ_1` | none |
| §3.4 descent (R01) | sympathetic closure `C̃{X}`; explicit tower of §3.2 | no `X_∞ → X` over `k` with `C̃{X} = U ×_X X_∞`; the Kummer tower is the base change of a tower over the disc over `ℚ_p`, `U_∞` affinoid perfectoid by Lemma 4.9 | P9.6 applies to the second only | R01 |
| §3.5 bound | `f = c`; `f = YZ`, `p = 2`; `k = p`, `k = p^r m` | `u = −c`; `u = X²/2`, `a_2 = b_{1,1}/binom(2,1)`; `i = 1`, `binom(p,1) = p`; Kummer: adding `p^{r−1}` and `p^{r−1}(pm − 1)` carries exactly once, `v_p(binom(k, p^{r−1})) = 1`; with CN25's `i = p^r` and `k = p^r`, `i = k` is out of range | README's choice correct, source slip recorded | none |
| §3.6 | split `V₁ ⊕ V₁`; `B₂` with `c ↦ tc`; `v = 0` | `λ_v = 0`, rank `0`; `λ_v = v`, rank `1` for `v ≠ 0`; zero lift | consistent with Prop. 4.10 | none |
| §3.7 | split class; `B₂`; pushout by `c ∈ C^×`; `Ext¹_{C(G_K)}(C, C(1))` | `0`; `1`; `c`; `K ≠ C` (different category and scalars) | consistent | none |
| §4.4 sign | `m = d = 1`, `W = C`, `w = 1`, both relations | `(B₂ ⊕ C)/{(tc, −c)} → B₂`, `(b, c′) ↦ b + tc′` is well defined (`tc − tc = 0`) and restricts to `c′ ↦ tc′` on `W`: class `1`; with `{(tc, c)}` the map is `b − tc′`, class `−1` | README's sign is the pushout; source slip recorded | none |
| §3.8 | `a = 0`; `a = 1`; `p = 2` | coboundary `0`; `ψ_1 − ψ_1 = 0`; `ψ_2 − 2ψ_1 = 0`; invariants `H⁰(T_C, C{X}) = C` | consistent | none |
| §4.9–4.10 | `W = B_m`, `d`; `d ≥ m`; `d = 0`; `W = c₀(I, C)`, `I` uncountable | `B_m[t^d]` and `B_m/t^d` both of length `min(d, m)`; both `W`; `B_0 = 0` gives `0 = W[t⁰] = W/t⁰W`; coordinate functionals separate points so Prop. 4.18's argument runs | consistent; nonseparable general case is the roadmap's target (source gap) | none |
| §4.13 misprint | `d = 1`, `W = C` | `Hom(ℚ_p t, C) = C → Ext¹(B₁, C) = C` is the quotient map `W → W/tW`, the identity here, so `Ext¹(U₁, C)` sits between a surjection and `Ext¹(ℚ_p t, C) = 0` and vanishes | source display `W` refuted | none |
| §4.14 | `c = 0`; `c = p`; `c = −1`; nonunit `c` | both sides `0`; `1 + p` unit; `ℓ_v(−x) = ℓ_{−v}(x) = −ℓ_v(x)`; `c = (1 + c) − 1` with both units | README extends the source's unit case | none |
| §5.1–5.4 | `ℚ_p`; `C/ℚ_p`; `U₁/ℚ_p t_x`; `p·` on `C/ℚ_p` | curvature `< 0`, height `1`; curvature `> 0`, height `0 − 1 = −1`; `t_x` unit on `B_m` since `θ(t_x) ≠ 0`, Hom `0`; `p` maps `ℚ_p` onto `ℚ_p`, isomorphism preserving `−1` | consistent with CN25 Cor. 3.20 and Prop. 4.25 | none |
| §6.1 gap G-HOM | pointwise vs uniform reading | `B_dR(Λ) = ⋃_N t^{−N}B_dR⁺(Λ)` makes the pointwise reading empty; CN25 line 837–841 gives one `N` from `α(ℚ_p^r)` and finitely many `α(ℓ_i)`; the parent's target (its line 1572–1574) says the bounded-image lemma is not proved there | precise and minimal | none |
| §6.5–6.7 | `k = 0`; `ℚ_p`; `C`; `C/ℚ_p`; `0 → ℚ_p → ℚ_p ⊕ C → C → 0` | `Hom(V₁, B⁺) = 0`, `Hom(V₁, t⁻¹V₁) = C`; ranks `(1, 0)`, `1 = 1 + 0`; `(0, 0)`, `0 = 0 + 0`; `h(C/ℚ_p) ⊂ h(C) = 0`, and `0 → 0 → B_dR → Ext¹(C/ℚ_p, B_dR) → 0` gives rank `1`, `0 = −1 + 1`; `0 → 0 → B_dR → B_dR → 0` exact | consistent with Prop. 3.27 | none |

**Duplication audit.** Grepped the pinned Mathlib and Tau Ceti for a Galois action on `ℂ_[p]` (`PadicComplex` occurs only in Complex.lean and BDeRham.lean, neither with `Gal` or `AlgEquiv`), for semilinear representations (Tau Ceti has finite-group Galois descent in `RepresentationTheory/GaloisDescent` and `FieldTheory/Galois/SemilinearDescent`, not continuous representations of a profinite group over a completion), and for Banach–Colmez, sympathetic, left-heart and quasi-abelian objects (none). The two Lean definitions duplicate nothing at the pins. Against roadmaps: the parent owns BC theory (imported by heading), LocallyAnalyticDistributions the left heart, PadicPeriodRings the period rings; CstConjectureForDaggerVarieties (#1759, its line 15) cites this roadmap's §§0.9, 2.3, 2.7–2.8, 4.2–4.3, 5.1–5.3 and 6.6–6.7 as the owner, with section numbers that match this README. Ownership against the open pull requests was checked through the sibling heads the tool indexes.

**Supplier-order audit.** `tauceti-roadmap … gate --depcheck … --movable` output: `depcheck: 242 roadmaps, 2482 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Merge order: this roadmap at line 138, right after the parent (137); PerfectoidSpaces 12, PerfectoidTowers 16, PadicPeriodRings 19, ArithmeticGaloisRepresentations 47, ArithmeticGaloisDuality 48, FiniteFlatGroupsAndIntegralPadicHodgeTheory 52, LocallyAnalyticDistributions 76, PadicHodgeTheory 135; AlgebraicVectorBundles is on main. CohomologyComparisons (209) and CstConjectureForDaggerVarieties (210) are named only as consumers. Every `*Needs:*` line cites §-numbers of this README, the parent's headings (all 18 resolved, R02), or the sections listed above: PadicPeriodRings §§1.5, 2 (its line 283–286 gives `H⁰(G_K, C(i)) = 0`, `i ≠ 0`, on the general base, and line 294 the identification with `PadicComplex`), 4.1–4.3; PadicHodgeTheory §4.4 (R04); FiniteFlatGroups §R07.P7.2 (line 1597); ArithmeticGaloisRepresentations §1.1 (line 707); ArithmeticGaloisDuality §§R02.1.3 (line 701), R02.2.1 (line 1191), D7.4 (line 5393); PerfectoidTowers §P9.6 with both named targets (lines 2461, 2487; R01 on their hypotheses); PerfectoidSpaces P1, P3, P6 and AlgebraicVectorBundles L0–L2 on main; LocallyAnalyticDistributions §§0.0–0.3 and Layer 1 (R03 on three names). The declared gap `G-HOM` has supplier, section and a one-sentence uniform `needs` in both `plan.json` and the README; the parent's target states that the bounded-image lemma is not proved there, so the gap asks for nothing already provided.

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, seven roadmaps), How to read the build, seven layers each ending in Examples and Dependencies, Downstream consumers, References. 64 `**Checks.**` blocks, each with at least three bullets (minimum 3, counted mechanically); every definition carries an API list; every target a locator and its hypotheses in the sentence; no LaTeX delimiters, no `lemma`, no field lists or target-numbering tables, no local paths or job ids (R08 on one phrase). All ten cited works are in `sources.toml` with locators, `cited_for` and the service's fields.

## Not verifiable

- Truth of §§4.8–4.9 beyond the separable (resp. nuclear Fréchet) cases: CN25 states Propositions 4.18 and 4.22 at that generality but proves less (source gaps below); the roadmap owns them as targets with a route, as the accepted design does. No counterexample found; not refuted.
- The printed page numbers 3670–3681 of AnschutzLeBras25 were not matched to the cached text's page markers (the JEMS header is not in the text layer); the theorem and corollary numbers were matched.

## Source issues

- **Misprint** in CN25 at Remark 4.3, p. 21: the source cites Schneiders Corollary 1.2.20 for the localization description of the left heart; it should be Corollary 1.2.21 (Schneiders99 line 852, printed p. 24); affects nothing.
- **Misprint** in CN25 at Remarks 4.17 and 4.21, pp. 25 and 27: the pushout `E_w` is written as the quotient by the pairs `(c, cw)`, resp. `(t^d c, cw)`; the pushout of the two maps is the quotient by `(c, −cw)`, resp. `(t^d c, −cw)`, or the map from `W` carries a sign; affects nothing.
- **Error** in CN25 at Lemma 4.13, proof, p. 24: the choice `i = p^r` with `r = v_p(k)` lies outside `1 ≤ i ≤ k − 1` when `k = p^r`; `i = p^{r−1}` is in range and gives `v_p(binom(k, i)) = 1`; affects the proof (the bound `u ∈ p^{−1}O_C{X}` stands).
- **Misprint** in CN25 at Lemma 4.24(i), p. 28: the statement displays `Ext¹_TVS(U_d, 𝐖) ≅ W`; the proof derives that this group is `0`, and for `d = 1`, `W = C` the long exact sequence forces `0`; affects a stated result.
- **Gap** in CN25 at Lemma 4.29, p. 30: the statement asserts `ℓ_v(cx) = (c·ℓ_v)(x)` for all `c ∈ O_C`, the proof treats only units; nonunits follow by additivity from `c = (1 + c) − 1`; affects the proof.
- **Gap** in CN25 at Proposition 4.22, p. 27, with §4.3.2, p. 26: "reasonable `B_m`-module" is defined without separability, while the proof reduces to Proposition 4.18, whose hypothesis (§4.3, p. 25) includes separability; the nonseparable case is not covered; affects the proof.
- **Gap** in CN25 at Proposition 4.18, proof, p. 26: the Fréchet case is argued only for nuclear Fréchet `W`, while the statement covers every reasonable `W`; affects the proof.
- **Gap** in CN25 at Lemma 4.9, p. 23: the tower uses `E_1`, which is defined only when `p ∈ 2pO_C`, false at `p = 2`; at `p = 2` the tower must be built from `E_2` with the normalization `Y_n = (E_{2/2^n} − 1)/2^{2/2^{n+1}}`; affects a stated result at `p = 2`.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a38f2ef35ca26bc74dbd5640e2fd4b6905a52021", "job": "REV-PKG-VectorBundlesAndIsocrystalsPartII", "model": "fable", "worker": "chris-x9"} -->

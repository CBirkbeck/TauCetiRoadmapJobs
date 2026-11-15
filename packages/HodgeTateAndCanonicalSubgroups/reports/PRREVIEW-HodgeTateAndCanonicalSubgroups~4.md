# Review of HodgeTateAndCanonicalSubgroups (pull request #1084 at a3bff2c)

**Verdict:** needs changes

Six P3 findings, none blocking. The gate passes and the dependency check reports no problem.

## Previous findings

- R01 (759 undeclared backticked names) — repaired: `TauCeti.HodgeTate.`, `TauCeti.LogAdic.` and `ShimuraTower.` have 0 hits; line 170 reads "`ω_H := e*Ω¹_{H/S}`, over Spec R the augmentation cotangent space"; the only own names left are the two that `Suggested.lean` declares (lines 162, 259). Two names survive without backticks (R01 below).
- R02 (AI-assistance sentence) — repaired: the description reads "GPT-6 (Codex) for the port … Claude Fable 5.1 and Claude Opus 5.5 for the review repairs"; the head commit's trailer names Claude Opus 5.5.

## R01 (P3) — Two Lean identifiers left in the prose by the name removal

**Location:** `TauCetiRoadmap/HodgeTateAndCanonicalSubgroups/README.md` line 782 ("and quotientAction of `K_p/K′_p = 𝔽_p^×` is translation") and line 971 ("the map equals hodgeTateFlagPoint with the fixed quotient convention").

**Claim:** every term is standard or defined; the README names no Lean declaration of its own beyond the two in `Suggested.lean`.

**Witness:** `quotientAction` and `hodgeTateFlagPoint` occur once each in the README, are defined nowhere in it, and are not declared in `Suggested.lean`.

**Repair:** line 782: "and the action of `K_p/K′_p = 𝔽_p^×` on it is translation whose trivially acting subgroup is {±1}". Line 971: "On (C′,C′⁺)-points the map equals the flag point `π_HT(A, β)` of 2.7, with the fixed quotient convention."

## R02 (P3) — Checks refer to numbered items that their sections do not have

**Location:** README lines 1222 (3.12: "the level-one ambiguity that (2) resolves"), 1964 (6.15: "(4) is the identity"), 2135 (6.25: "(3) is the Hochschild–Serre spectral sequence"), 2196–2197 (6.28: "(2) gives", "hypothesis in (2)"), 2625 (7.15: "(2) is the identification"); line 986 (2.12: "test cases below").

**Claim:** each Check evaluates a named statement of its section.

**Witness:** none of 3.12, 6.15, 6.25, 6.28, 7.15 has an enumerated statement: these are the only lines of their sections containing "(2)", "(3)" or "(4)". In 2.12 the three test cases precede line 986.

**Repair:** 1222: "that the level-(n+1) hypothesis resolves through the level-two subgroup". 1964: "and `Rε_ét,*O = O`, `ε_ét,*M = M` hold trivially". 2135: "the spectral sequence is the Hochschild–Serre …". 2196: "the split-cover statement gives"; 2197: "the hypothesis that every finite étale cover splits is needed". 2625: "the identification of period sheaves is that of the ordinary ones". 986: "cases above".

## R03 (P3) — Code spans that swallow a section reference or a word, or are split mid-formula

**Location:** README lines 101 (`` `α_p (TauCeti.AlphaP.CoordinateRing)` ``), 117 (`` `O_C (0.25)` ``), 247, 715, 825 (`` `p^{1/(p−1)} (0.5)` ``), 825 (`` `α_G ⊗ C (0.4)` ``), 1099, 1176, 1267, 1344, 1426; 431 (`` `R07.2's Ha(A[p])` ``); 139, 754, 812, 816; 1397.

**Claim:** code spans hold mathematics; cross-references and prose are outside them.

**Witness:** line 247 reads as `p^{1/(p−1)}` applied to 0.5; line 139 splits one formula into `` `H^i(X_ét, F) ≅` `H^i(X_proét`, `ν^*F`) ``; line 754 splits `X(Np^m, ζ)_C`; line 1397 has `` `H_m → A[p^m]'` ``.

**Repair:** close the span before the reference, e.g. "`p^{1/(p−1)}` (0.5)", "`O_C` (0.25)", "`α_p` (`TauCeti.AlphaP.CoordinateRing`)", "R07.2's `Ha(A[p])`", "`C_m = A[p^m]^0` (multiplicative)"; rejoin "`H^i(X_ét, F) ≅ H^i(X_proét, ν^*F)`", "`X(Np^m, ζ)_C`", "(C, `O_C`)-points".

## R04 (P3) — Repeated Checks, sentences and `*Needs:*` items

**Location:** README lines 358 and 360 (0.10: `[p]` on an abelian scheme has divisor `V(p^g)`, twice); lines 1395 and 1397 (5.2: the corrected indexing of BHW Proposition 7.11 stated twice); `*Needs:*` line 645 (A3.5 twice) and line 1194 (`ShimuraCompactifications` §8.48 twice).

**Claim:** each Check tests something the others do not; a `*Needs:*` line lists each input once.

**Witness:** line 360 "For `f = [p]` on an abelian scheme of dimension g, `D_f = V(p^g)`" restates line 358 and the API bullet of line 353.

**Repair:** delete lines 360 and 1397 and the second occurrence in each of the two `*Needs:*` lines.

## R05 (P3) — Three source locators

**Location:** README line 1805 (6.8: "Def. 3.2.1, p. 26"); line 1192 (3.10: "[BHW], … §7.1, p. 29"); line 2447 (7.6: "[SW20], Thm. 10.5.1 and proof, … pp. 82–88").

**Claim:** each locator points at the statement used, on the page given.

**Witness:** DLLZ-adic line 1247: log derivations are Def. 3.2.2 (Def. 3.2.1, line 1218, is pre-log Huber rings). BHW line 1372: Def. 7.1(1) is on p. 28. SW20 line 3596: the proof ends on PDF p. 99, printed p. 89.

**Repair:** 6.8: "Def. 3.2.1(4), Def. 3.2.2 and Rem. 3.2.3, p. 26". 3.10: "§7.1, Def. 7.1(1), p. 28". 7.6: "pp. 82–89".

## R06 (P3) — No layer ends with `### Examples` and `### Dependencies`

**Location:** README, Layers 0–8 (lines 164–3054): each layer ends with its last `### k.n` target.

**Claim:** the README has the roadmap form, in which every layer closes with its worked examples and its dependencies.

**Witness:** `^### Examples` and `^### Dependencies` have 0 hits; the only layer-level dependency statement is the Layer 0 batch table of lines 149–158 and the build-order sentence of line 160.

**Repair:** close each layer with `### Examples` (two or three computed instances, e.g. for Layer 0: `μ_p`, `ℤ/p` and supersingular `E[p]` with `ω`, `α`, degree and HN slopes) and `### Dependencies` (the earlier layers and supplier sections the layer uses; move the batch table and line 160's orders there).

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0.5 Lean headline | `n = 0`; `p = 2`, `A = 𝒪[t]/(t²−1)`; one-tactic probe | cotangent space 0; `‖a‖ ≤ ‖2‖` is `v(a) ≥ 1`, span = `𝒪·[t−1]` = whole `𝒪/2`; `rfl`, `simp`, `infer_instance`, `exact`, `aesop` all fail | holds; not padding |
| 0.5 all primes | FAR10 Thm. 7 (`p ≠ 2`); FAR11 Thm. 2 (line 1268, pp. 24–25); CDM12 Thm. 4.13 | FAR11 Thm. 2 and CDM12 carry no restriction on p (FAR11 line 1225: only the crystalline statement of Thm. 1 weakens at 2) | supported for every p |
| 0.9 divisor, duality | BP26 line 2163, p. 41; `μ_p` over `ℤ_p[p^{1/2}]` | `D_i + D_{2g+1−i} = V(p^n)`; `d/e = 2/2 = 1 = deg μ_p`; `D = V(p^{1/2})`: `1/2`, `b = 2`, `a = 1` | matches |
| 0.9 Check `p = 2`, `x² = ax` | `Δx = x₁ + x₂ − bx₁x₂`, `ab = 2` | `(Δx)² = a(x₁+x₂) + (a²b² + 2 − 4ab)x₁x₂ = a(x₁+x₂) − 2x₁x₂ = aΔx`; `I/I² = R/(a)`, degree r | holds |
| 2.2 Check (line 782) | `𝔾_m`, `K′_p = 1+pℤ_p`, p odd | `ℚ^×\𝔸_f^×/K^pK′_p = ℤ_p^×/±(1+pℤ_p) = 𝔽_p^×/±1`; kernel of the `𝔽_p^×` action `{±1}` | holds |
| 3.4 | SCH15 lines 1133–1139, 1167; `p = 2, m = 2`, `w = 1/6`, `1/16`; `R′ = {a ≡ b mod 2}`, `s = (−1,1)` | `S₂w = 1/2` (weak fails), `4/16 < 1/2`; `(s−1)/√2 = (−√2, 0) ∉ R′` | matches; only `⊇` holds in general |
| 3.5 | FAR11 lines 2001–2024, pp. 37–38; `p = 5`, `w = 1/10`, `1/6` | `min(Ha(E), 9/10) = 1/2`; at `1/6`: `pw = 5/6 = 1 − w`, only `Ha(E) ≥ 5/6` | matches |
| 3.7 | SCH15 lines 1177–1190 (i), (ii), (iv); `p = 2, m = 2, w = 1/7` | weak `3/7 < 1/2`, strong `4/7 ≥ 1/2`; `p^{mg}·p^{mg} = p^{2mg}` | matches |
| 3.10 | BHW line 721 (`ε_m^can = p^{−(m+1)}`), line 1372; AIPH line 458, p. 11 | `n = 1` ramified uses level 2: `p^{−3}`; rank `p^{ng}`, `O_F`-stable, dual étale-locally `O_F/p^n` | matches (page: R05) |
| 3.11 | `ℤ_p⟨S,T⟩/(S²−p²T)`, `S = pT′`; cusp `V² = U³` | `A₀ = ℤ_p⟨pT′, T′²⟩`: odd coefficients in `pℤ_p`, so `T′ ∉ A₀`; normalization `ℤ_p⟨T′⟩`; cusp normalizes to the disc | holds |
| 3.12 Check (line 1222) | `(𝔽_p[π]/π)²` over `𝔽_p[π]/π²` | order `p²`, killed by π; free of rank one would have `π ≠ 0` | holds (wording: R02) |
| 5.2 | BHW lines 1448–1462, p. 30; `γ = diag(a,d)`, `diag(a,1)` | `γ^∨ = diag(d,a)`: `α′(e₁) = d·α(e₁)`, `ψ ↦ dψ`; `diag(a,1)^∨ = diag(1,a)` fixes `e₁` | matches; source misprint below |
| 6.1 | DLLZ-adic lines 4810–4841, pp. 97–98; disc | `H¹(X_ét, μ_p) ⊇ ℚ_p^×/(ℚ_p^×)^p ≠ 0`, `H¹(O) = 0` | matches |
| 6.7 | DLLZ-adic lines 983–989, p. 21; `D² → D`; p-th root | chart `0 → 0`, comparison of relative dimension 1, not étale; cokernel `ℤ/p`: `p = 0` in characteristic p, a unit of O in characteristic 0 | matches |
| 6.8 | DLLZ-adic line 1247; `B = k⟨T⟩`, `L = B`, `B/(T)` | `d(T) = T = T·δ(1)` forces `δ(1) = 1`; in `B/(T)`: `0 = T·1` | holds (locator: R05) |
| 6.21 | DLLZ-adic lines 3575–3582, 3602, p. 70; discs `{|T| ≤ |ϖ|^n}` | limit space `{T = 0}`, closed and not open | matches |
| 6.27 | DLLZ-adic lines 3782–3797, pp. 74–75; `ℕ[1/p]`; chart 0 over `ℚ_p` | `1` has no q-th root for `q ≠ p`; chart 0 divisible but `ℚ_p` not perfectoid | matches |
| 6.33 | DLLZ-adic lines 4341–4348, p. 88; constant `𝔽_p` | `L_{n+1}/p^n = 𝔽_p`; `p = 0` on it, so zero up to isogeny | matches |
| 7.13 | DLLZ-RH lines 924–988, pp. 20–21; `D¹` | `∂/∂y` on `B⁺_dR[[y]]`: kernel `B⁺_dR`, surjective; q-th term in `Fil^{r−q}` | matches; see Source issues |
| 7.15 | DLLZ-RH lines 636–645 (p. 14), 859 (p. 18), 940, 974; CohomologyComparisons §6.1 | `Res(dlog q) = 1`; `Ω¹` in place of `Ω¹(D)` has no such section | matches (wording: R02) |
| Pull request text | title, summary block, prose against the head | adds the folder (3188 insertions, 0 deletions); two Lean declarations; suppliers as in the README | agrees |

- Source locators checked against the text: 33, in 10 sources (FAR10 1, FAR11 3, SCH15 3, BHW 4, AIPH 3, BP26 1, CDM12 1, DLLZ-adic 10, DLLZ-RH 6, SW20 1).
- Library declarations opened at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, equal to `lake-manifest.json`): all 42 of lines 54–95 found with the stated kind and file; the 13 of lines 99–104 and `OnePoint.instGLAction`, `OnePoint.smul_some_eq_ite` (Mathlib `Topology/Compactification/OnePoint/ProjectiveLine.lean` lines 126, 149) found.
- Cross-roadmap citations resolved at the open heads: CohomologyComparisons §6.1 (l.1097), §6.2 `smallHasseCanonicalSubgroups` (l.1141); AutomorphicBundles §8.1 (l.2653), §8.2 (l.2727), §8.3 with the four comparisons (ll.2828–2834), §10.1 (l.3242), §10.7 (l.3646); PrismaticCohomologyPartIV §8.60 (l.1333); ShimuraData §§3.8–3.9 `parabolicTypeVariety` (ll.535, 567); FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.20a, R07.1.24a, R07.1.40, R07.2.21, R07.6.6; DiamondEtaleCohomology C0.17, C0.23.
- Gate at `a3bff2c`: every counter 0, `build=0`. Nothing outside the folder is changed.
- Dependency check: `depcheck: 245 roadmaps, 2246 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap is line 185 of the merge order, after CohomologyComparisons (182) and AutomorphicBundles (184).
- Elaboration: `lake env lean` on `Suggested.lean` gives one warning, `declaration uses sorry` at line 54; `#check @` on both declarations shows every binder (five field instances, `Nat.Prime p`, `‖p‖ < 1`, four Hopf-algebra instances, `finrank = p^n`, `‖a‖^(p−1) ≤ ‖p‖`), the README's 0.5 finite-flat clause at the same generality. Headlines 0.19, 2.12, 3.6, 4.6, 5.12, 7.3, 7.20, 8.1 are named in the docstring with the missing carriers; none is statable at the pins.
- Change since `a8b6690`: 761 README lines changed; 649 differ only by a removed name prefix, 112 are reworded. Read in full at this head: lines 1–1310 (Conventions through 4.5), the sampled targets of Layers 5–7, 7.14 and 8.1; of the reworded lines after 1310, the 21 most changed were read against the old text (same mathematics). The other targets of Layers 4–7 were checked by scans and the diff only; their rows stand as in the review of `06ce518`. 155 sections, each with `Sources:`, `*Needs:*` and Checks.
- Overlap check: read PerfectoidShimuraVarieties, AutomorphicBundles, CohomologyComparisons, PrismaticCohomologyPartIV; nothing shared (towers and open `π_HT`: this roadmap, imported by PerfectoidShimuraVarieties l.14; `rationalHTLeviTorsor` and `smallHasseCanonicalSubgroups`: the suppliers, with agreement proved here in 2.10 and 3.6; fs log-adic carriers: PrismaticCohomologyPartIV §8.60). PerfectoidShimuraVarieties l.88 still cites the removed `ShimuraTower.*` names beside §§2.1–2.3; the section ids are unchanged.

Source independence: 14 passages compared with 7 sources (0.9, 3.4, 3.5, 3.7, 3.10, 5.2, 6.1, 6.7, 6.8, 6.21, 6.27, 6.33, 7.13 and the `Suggested.lean` docstrings against BP26, SCH15, FAR11, AIPH, BHW, DLLZ-adic, DLLZ-RH), none shared beyond formulas; largest share DLLZ-adic, 42 of 219 locators; contents compared with DLLZ-adic: independent (its 17 sections of §§2–5 against the 38 targets of Layer 6: Appendix A first, §4.2 after §4.4, §6.3 before §6.1, and 6.5, 6.14, 6.18, 6.25, 6.28, 6.31, 6.36, 6.37 without counterpart; the remaining order is forced by the `*Needs:*` lines of 6.7, 6.12, 6.21, 6.27).

## Not verifiable

- HALO author copy (SHA 154459bd…): not in the sources cache; Cor. A.2 and Props. A.1–A.3 were not read this round, so 3.10's HALO clause rests on BHW Def. 4.1 and AIPH Prop. 3.2, which cite it.
- OGU18 (Ogus, Prop. I.4.1.2): behind the publisher's paywall, cited by locator only.
- Stacks tag 031T (0.9) and ZIE v2 (2.11, 2.14): not opened this round.

## Source issues

- **Misprint** in BHW at Prop. 7.11 (proof), printed p. 30: the source says the dual of the inclusion of `H_n` into `A[p^m]` and labels an arrow `(1,0) mod p^n` in a level-m statement; it should be `H_m` and `mod p^m`; affects nothing.
- **Error** in SCH15 at Cor. III.2.6, printed p. 33: the source says the points of `C_m` over every p-adically complete flat `ℤ_p^cycl`-algebra are exactly the sections congruent to zero modulo `p^{(1−ε)/p^m}`; it should be that these sections are contained in `C_m(R′)`, with equality when `R′` is integrally closed in `R′[1/p]`; affects a stated result.
- **Gap** in DLLZ-RH at Cor. 2.4.6, printed p. 21: the source says the first term of the relative Poincaré complex is an ordinary tensor product over the pulled-back period sheaf; it should be the filtration-completed tensor product, which is the power-series ring its proof computes with; affects a stated result.

## For the human reviewers

- **Licence.** BPC25 (Boxer–Pilloni, *Higher Coleman theory*) is cited from an author manuscript dated 3 March 2025, not a published version; it carries 12 locators (2.10, 2.12, 2.13, 8.1 and the Hodge-type flag of Layer 7).

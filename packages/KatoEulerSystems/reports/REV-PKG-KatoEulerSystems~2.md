<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/163#issuecomment-6392206075 -->
Review (claude) of 5fb6ef4

Verdict: needs changes

1. **F01** (P2) `gap:kato-padic-regulators` asks for what its supplier already provides, and its needs sentence is compound and vague

   - **Location.** `packages/KatoEulerSystems/README.md` lines 348–351 and `packages/KatoEulerSystems/design/plan.json` (`gaps[0]`, added at the package stage). The README quote: "What PadicHodgeRegulators must provide (gap:kato-padic-regulators): the de Rham dual exponential …, the crystalline and de Rham Iwasawa regulators on their stated domains for every p, and the elliptic Coleman map …".
   - **Claim.** `PadicHodgeRegulators` cannot be opened, so its sections are declared as a gap. The repair report says it "could not be opened at main, the indexed open heads, or the supplied board package index".
   - **Witness.** `PadicHodgeRegulators` is a board package on the board's main branch (`packages/PadicHodgeRegulators/README.md`), earlier in the merge order (line 210). It states every cited section: §1.4 line 466, §8.8 line 1483, §8.22 line 1671, §§9.31–9.36 lines 2102–2172.
   - **Also.**
     - The needs sentence bundles three objects (a dual exponential, two regulators, a Coleman map).
     - It defers their domains to "their stated prime and character domains".
     - The README version says "for every p", which contradicts the contract right below it and the supplier's §8.22 ("odd p").
   - **Repair.**
     - Delete the gap paragraph (README lines 348–351) and the `kato-padic-regulators` entry of `plan.json`'s `gaps`.
     - Keep the plain contract paragraph that follows (lines 353–361), which cites the supplier by section.
     - Tested on the refuting instance: every section that paragraph cites resolves in the board package, at the lines above (and §§1.7, 1.11, 8.13–8.16, 8.18, 8.20–8.21 at lines 509, 564, 1559–1657). The dependency check is unchanged (the supplier is earlier in the order).
     - If a gap is nevertheless wanted, split it into one precise needs sentence per object, each with its prime domain (odd p for §§8.8–8.22 and §9.36; all p for §§9.31–9.35).

2. **F02** (P3) The F01 repair attributes a sign convention to Kato §8.4 that the text does not state

   - **Location.** `packages/KatoEulerSystems/README.md` lines 157–159: "In Kato's notation `c_(2,2)({u,v})` is minus the cup product of the Kummer classes and `ch_(2,2) = −c_(2,2)` (Kato §8.4, pp. 182–183; …)".
   - **Claim.** Kato §8.4 uses the notation `c_(2,2)` and states the minus sign.
   - **Witness.** Kato2004 lines 2583–2591 (pp. 182–183) only say that the Chern character `K₂ → H²` sends `{f,g}` to the cup product of the two Kummer classes. A search for `c_(2,2)` in the text has no hit.
   - **Repair.**
     - Replace the sentence with: "Kato's Chern character `K₂(X) → H²(X, ℤ/pⁿ(2))` sends `{u,v}` to the cup product of the Kummer classes of u and v (Kato §8.4, pp. 182–183; `PadicFamilies` §4.0.1)."
     - Drop the `c_(2,2)` clause, or attribute it to a source that defines Soulé's Chern classes.
     - Tested on the refuting instance: the corrected sentence states exactly what lines 2583–2591 contain, and the sign used below ("product-normalized") is unchanged.

3. **F03** (P3) Leftover names of declarations deleted from `Suggested.lean`: one undefined, one without a definition, several named in Checks

   - **Location.** `packages/KatoEulerSystems/README.md`:
     - lines 991 and 1508: "criticalSign encodes this" and "criticalSign fixes the parity";
     - line 1762: "The definition ordinaryEulerFactor records the two unramified factors";
     - Checks naming identifiers: line 455 (`rationalSmoothing 5 g g`), lines 1145 and 1148 (`upperUnipotent 2`, `upperUnipotent 0`), lines 1268–1269 (`upperUnipotent 1`, `upperUnipotent p`).
   - **Claim.** These are terms of the roadmap.
   - **Witness.** `criticalSign` occurs only at lines 991 and 1508, and no sentence defines it (F05 deleted its `Suggested.lean` definition). `ordinaryEulerFactor` has no body, API or Checks. House style: a Check never names a Lean counterpart.
   - **Repair.**
     - At lines 991 and 1508, write "the sign `(−1)^(k−r−1)χ(−1)` of the Conventions" in place of `criticalSign`.
     - At line 1762, either define the factor explicitly, `(1 − p^(r−1)α^(−1))(1 − ε(p)p^(k−r−1)α^(−1))`, with the three 6.4 Checks as its Checks, or delete the sentence.
     - In the Checks listed above, name the object instead of the identifier (for example "the unipotent with parameter 2").
     - Tested on the refuting instance: after the edit, every term in 3.3 and 5.3 is defined in the Conventions (line 169). At `k = 4, r = 2` with χ even, the sign still evaluates to −1, as both Checks require.

4. **F04** (P3) The modularity supplier is never cited, though 4.7 and the elliptic signatures of 7.9 need it

   - **Location.** `packages/KatoEulerSystems/README.md` line 1371: "Let E/ℚ be an elliptic curve without complex multiplication. Prove serre_openImage: for every p the image of `ρ_(E,p)` is open in `GL₂(ℤ_p)`…". The *Needs:* line at 1389 lists 4.1, `AutomorphicGaloisRepresentations` §7.5, `ModularCurves` §2E and `EllipticCurves` Layers 4 and 6. Scope (lines 48–49) claims only "the consequences of Serre's open-image theorem".
   - **Claim.** These inputs prove Serre's theorem for every non-CM `E/ℚ`.
   - **Witness.** 4.1 and `AutomorphicGaloisRepresentations` §7.5 concern newforms. Applying them to E needs modularity and `V_p(E) ≅ V(f_E)`: `EllipticCurveModularity` R29.4/R29.6 (open head, merge-order line 187). The README never cites `EllipticCurveModularity`.
   - **Also.** The `Suggested.lean` signatures of 7.9 replace "modular" by a q-expansion hypothesis. Passing from that hypothesis to `A_f`, or to `V_λ(f)`, is `EllipticCurveModularity` R29.4–R29.5 (the attached form gives `J₀(M) → E`). This is not in the 7.9 *Needs:* (lines 2307–2310).
   - **Repair.**
     - Add a `From EllipticCurveModularity` contract: R29.4 (rational Tate-module comparison), R29.5 (modular parametrisation from an attached form) and R29.6 (modularity).
     - Add these sections to the *Needs:* of 4.7 and of 7.9's elliptic signatures.
     - Give 4.7 its route: "E is attached to a weight-two newform with rational coefficients, so Γ is trivial and B is split. admissible_of_split and integralImage_almostAll then give an open subgroup, and `SL₂(ℤ_p)` for almost all p. The Weil pairing (`ModularCurves` §2E) makes the determinant the cyclotomic character."
     - Change the Scope clause to "Serre's open-image theorem for E/ℚ through modularity, and its consequences".
     - Ownership note: `HeegnerPointEulerSystems` (later, open head) asks `ArithmeticGaloisRepresentations` for the adelic number-field form through `gap:elliptic-adelic-open-image`. If that roadmap accepts the gap, 4.7 should cite it instead of proving the theorem.
     - Tested on the refuting instance: for non-CM `E/ℚ` with F = ℚ and Γ = {1}, every input of the stated route is then a named target or supplier section.

5. **F05** (P3) The real period `Ω_E` and the global minimal model have no supplier

   - **Location.** `packages/KatoEulerSystems/README.md` lines 1802–1803: "`ω_E` the invariant differential of a global minimal model (`EllipticCurves` Layers 1 and 4) and `Ω_E` its real period". `Ω_E` is also used at lines 1821–1822, 1975 and 2097–2099.
   - **Claim.** `EllipticCurves` Layers 1 and 4 supply these objects.
   - **Witness.** In main `TauCetiRoadmap/EllipticCurves/README.md`, Layer 4 is local. The global minimal equation over ℚ is Layer 4.5b (line 1013); its real period, an explicit integral, is Layer 7 (line 1262). The contract (lines 383–388) lists Layers 1, 4, 6.
   - **Repair.**
     - Add `EllipticCurves` Layer 4.5b (global minimal model over ℚ) and Layer 7 (the real period) to the `From EllipticCurves` contract and to the *Needs:* of 6.6, 7.4 and 7.8.
     - State which normalisation Rubin's "fundamental real period" is. It differs from `∫_{E(ℝ)}|ω|` by at most the number of real components, a factor absorbed in `r_E`, which is irrelevant for odd p.
     - Tested on the refuting instance: 6.6's two displayed formulas then use only supplied objects.

6. **F06** (P3) The module docstring leaves some non-statable headlines unnamed, the Layer comment's title differs from the README, and the 7.9 prose overstates the second signature

   - **Location.**
     - `packages/KatoEulerSystems/Suggested.lean` lines 11–17 (the list of non-statable headlines);
     - `Suggested.lean` line 22: "Layer 7: arithmetic consequences";
     - README lines 2224–2225: "`ellipticRationalPoints_finite` states the elliptic case of Corollary 14.3".
   - **Claim.** The docstring names every non-statable headline, and the signature is "the elliptic case" of Corollary 14.3.
   - **Witness.** The Summary (README lines 9–10) lists 7.4 and 7.6 as end theorems; the docstring names neither. Corollary 14.3 (Kato2004 lines 4609–4614) concerns χ-parts over abelian K. The README's Layer 7 heading is "divisibility and elliptic applications".
   - **Repair.**
     - Add to the docstring: 7.4 and 7.6 lack the Iwasawa Selmer module over `ℚ_∞` and the Mazur–Swinnerton-Dyer p-adic L-function.
     - Say why the χ-part form of Corollary 14.3 for elliptic curves over abelian K is not stated, or state it over `ℚ(ζ_m)`. Tau Ceti `WeierstrassCurve.pointGaloisAction` (`TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean` line 47) and Mathlib `IsCyclotomicExtension.autEquivPow` exist at the pins. A χ-part and a twisted `LSeries` would be the only new definitions.
     - Retitle the section comment "Layer 7: divisibility and elliptic applications".
     - In README line 2225, write "the case K = ℚ, χ = 1 of Corollary 14.3 for elliptic curves".
     - Tested on the refuting instance: the edited docstring names 7.4 and 7.6 with their missing carriers, and line 2225 no longer claims the χ-parts.

7. **F07** (P3) Manifest fields and References that no longer match the README

   - **Location.** `packages/KatoEulerSystems/sources.toml` and README lines 2397–2398 (References).
   - **Claim.** `cited_for` and the locators record where each work is cited.
   - **Witness.** `Schneider1985` has `cited_for = ["7.6"]`, `PerrinRiou1990` `["4.4, 7.6"]`; the README cites both at 7.5 and 7.7 (lines 2021–2022, 2066–2067). The `Nakamura2023` locator omits A.1, A.4, A.5. The text never cites Jacquet–Shalika.
   - **Repair.**
     - Set `cited_for` to `["7.5, 7.7"]` for both works.
     - Add "Theorem A.1, pp. 86–87; Definition A.4, p. 88; Corollary A.5, p. 89" to the `Nakamura2023` locator.
     - Either cite Jacquet–Shalika in 4.2 as the source of the supplier theorem (as its manifest entry says), or delete it from the References.
     - Tested on the refuting instance: after the edit, each key's `cited_for` matches a `grep` of the README for its first author.

All twelve round-1 findings are repaired (F01–F12, checked one by one under *Verified sound*). The round-2 package has 7 findings. One is blocking: R01 (P2), the supplier gap the repair introduced, which is redundant, compound and vague. The other six are P3 notes. Most of them are residue of the round-1 repairs or the same missing-supplier pattern as F11, found elsewhere in the README. `Suggested.lean` elaborates at the pins, with only the two `sorry` warnings. Its two headline theorems are true, correctly hypothesised, and are not padding.

## Verified sound

### Round-1 findings (each checked against the repaired text)

| Id | Status | Repaired passage (quoted or located) and check |
|---|---|---|
| F01 | repaired | A search for `MotivicEtaleKTheory` returns 0 hits, including §3.4's *Needs:* and the Layer 3 Dependencies (lines 1069–1084). The replacement attribution is R02. |
| F02 | repaired | `Suggested.lean` has 2 headline theorems; its docstring opens "KatoEulerSystems: target signatures" and says the roadmap is README.md. README lines 23–26 now describe the acceptance test. Completeness of the docstring is R06. |
| F03 | repaired | `criticalBadReductionComparison` and "vector comparison" have 0 hits. Lines 104–107 defer to `ModularSymbolsPadicLFunctions` §3.3 with an arithmetic section "outside this roadmap"; 6.5 (lines 1780–1798) asserts no comparison. |
| F04 | repaired | Lines 1160–1166 cite `AutomorphicLFunctionsAndLocalFactors` AL.3, anchor `rs-boundary-nonvanishing` (open head #924, line 2263), and `GL2AutomorphicRepresentationsAndTransfer` §R16.5.3 (head #931, line 1171). Both say what is claimed, and both are earlier in the merge order (lines 93, 103). |
| F05 | repaired | No definitions, examples or small theorems remain in `Suggested.lean`. The residue in the README is R03. |
| F06 | repaired | No backticked name of the roadmap's own except the two declared ones; the resolver finds none missing. |
| F07 | repaired | `ModularForm.eisensteinSeriesMF` is at `Mathlib/NumberTheory/ModularForms/EisensteinSeries/Basic.lean` line 35, in namespace `ModularForm` (line 27), and `#check` succeeds. Its index set is the gcd-one class (`Defs.lean` lines 43, 202), as "coprime-class" says. |
| F08 | repaired | 23 entries, each with authors, title, year, locator and `cited_for`; the waiver is restored. The residual mismatches are R07. |
| F09 | repaired | 5.4 now cites Theorem A.1, pp. 86–87; Definition A.4, p. 88; Corollary A.5 and Remark A.6, p. 89 (Nakamura2023 lines 3749, 3831, 3840, 3853). 5.1 cites pp. 229–232 (13.9 at Kato2004 line 4356, p. 229). 1.1 cites 2.11 at p. 131 (line 583). |
| F10 | repaired | `y² = x³ − x` over `𝔽₃` has the points ∞, (0,0), (1,0), (2,0), so `a₃ = 0`, `α² = −3`, `v₃(α) = 1/2`, `α⁻¹ = −α/3`, and `(1+α/3)² = 2/3 + 2α/3`. With α = 2 the trace would be 7/2. |
| F11 | repaired | 4.4's *Needs:* includes `ArithmeticGaloisDuality` §§R02.4.3–R02.4.4 (line 1317), and 7.3's includes `EulerSystemsAndKolyvaginSystems` §§2.5, 4.17 (line 1966). The same pattern found elsewhere is R04 and R05. |
| F12 | repaired | `RankZeroOneBSDPartII` is a board package on the board's main branch (merge-order line 283). `EllipticRegulators` is deleted. `HeegnerPointEulerSystems` (head #1423) cites "KatoEulerSystems §§6.6, 7.4, 7.7" for its §6.9 route (its README lines 59 and 225–227). |

### Elaboration and Lean form

- **Elaboration.** `lake env lean` on `packages/KatoEulerSystems/Suggested.lean`, run from the content checkout, exits 0 in 3.6 s. The only warnings are 2 `sorry` warnings, at lines 29 and 40. The file has a single `import Mathlib`, no `set_option`, no sorry'd data and `theorem` only.
- **`#check @` dump (scratch copy).** Both declarations keep `[W.IsElliptic]`, the full existential modularity hypothesis and every explicit binder (`m`, `hm`; `F`, `hF`, `hcont`, `hne`). No section binder is lost, and nothing changed. The generality equals README 7.9 (lines 2220–2249).
- **One-tactic probes.**
  - `infer_instance` fails for `Finite W.toAffine.Point`, for the tower `AddGroup.FG`, and even for `AddGroup.FG W.toAffine.Point`, so neither theorem is padding.
  - Two probes do close, and both confirm a hypothesis: `simp` proves the m = 1 field is `⊥`, and the m = 0 set is `Set.univ`.
  - `simp` proves `W.LFunction 0 = 0`.
- **Fully qualified names.** No collision: a search of all roadmaps for both names has no hit.

### Dependency check (verbatim)

```text
depcheck: 45 roadmaps, 462 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The citation resolver lists no cross-roadmap citation and no Lean name found nowhere.

### Seeded sample (15 targets): locators read in the text

| Target | Locators checked (source line) | Result |
|---|---|---|
| 0.4 | Kato Lemma 2.12, p. 131 (line 606); 2.13, p. 132 (line 614) | sound: A ≥ 1, c prime to 6A and the orders, a product over β′ only |
| 2.2 | Nakamura §3.1.2, p. 33 (line 1334, display (3)); Lemma A.3, p. 88 (lines 3814–3828); S′ eigenvalue (line 3809) | sound |
| 2.3 | Nakamura §§3.1.3–3.1.4, pp. 35–40 (lines 1514, 1582; display (14) at line 1737: factor `1 − T′σ⁻¹ + ℓS′σ⁻²`); Lemma 2.10, p. 29 (line 1185) | sound |
| 3.4 | Kato 2.5, Thm 2.6 (p. 127, lines 432, 456); 2.7 (p. 127, line 458); 2.9 (p. 129, line 520); 2.10 (p. 130, line 551) | sound: `Re s > 2`, `prime(M) ⊂ prime(N)` |
| 4.3 | Kato Thm 13.4(2)–(3), p. 226 (lines 4231–4256); Rubin draft hypotheses, p. 27 (line 1373); Thm II.3.3, p. 28 (line 1408) | sound: (3) needs p ≠ 2, residual irreducibility and a free rank-one cokernel |
| 4.4 | Kato Thm 12.4, p. 221 (line 4046); 13.8, p. 227 (line 4297); 15.14–15.15, pp. 264–265 (lines 5731, 5738); Burungale–Tian Thm 2.3, p. 4 (line 182) | sound; the admissibility restriction is a correction (*Source issues*) |
| 5.1 | Kato Thm 12.5(1), p. 221 (lines 4052–4070: minus conjugation); 13.9, p. 229 | sound |
| 5.2 | Kato Thm 12.6, p. 222 (lines 4096–4102: both families with their coprimality); 13.12, p. 231 (line 4443) | sound |
| 5.5 | Nakamura Lemma 3.4, Remark 3.5, p. 47 (lines 2076–2089) | sound; the admissibility proviso is the README's own restriction, consistent with 4.4 |
| 6.3 | Kato Thm 16.2, p. 269 (line 5902); `ModularSymbolsPadicLFunctions` §1.3 (head #968, line 1404: weight `k+2`) | sound (Gauss-sum and power conversions recomputed in rows 18–19) |
| 6.5 | Kato 16.4, Rem. 16.5(2), p. 270 (lines 5932, 5957–5966); proof of 16.6, p. 271 (line 5994: strict slope) | sound |
| 6.6 | Rubin Prop. III.5.1, p. 48 (line 2200); Def. 5.2 and Thm 5.3, pp. 48–49 (lines 2211, 2247) | sound for odd p, as stated; the p = 2 failure of the source is recorded under *Source issues* |
| 7.4 | Rubin 5.13–5.15, p. 52 (lines 2374, 2392, 2409); 5.16, p. 53 (line 2421); Kato 17.2–17.4(1)–(2), pp. 272–273 (lines 6040–6078, no parity condition in (1)–(2)) | sound |
| 7.5 | Rubin, proof of Cor. III.5.17, p. 53 (line 2433) | sound |
| 7.7 | Rubin, proof of Cor. III.5.18, pp. 53–54 (line 2455); Greenberg Thm 4.1, arXiv p. 35 (lines 1480–1488) | sound: the cokernel order is the Tamagawa p-part times `|Ẽ(𝔽_p)_p|²` |

No author-flagged unverified locator exists.

### Adversarial table (passages the repairs changed or added, and the sample)

| # | Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|---|
| 1 | Tower headline, m = 1 | `x^(1^n) = 1` | ⇔ x = 1; `adjoin ℚ {1} = ⊥` (elaborated); conclusion = Mordell–Weil (`EllipticCurves` `Suggested.lean` line 994) | holds | none |
| 2 | Tower headline, junk m = 0 | n = 1 | `x^(0^1) = x^0 = 1` for all x, so the set is ℂ (elaborated); `E(ℂ)` is uncountable, not FG | `hm` necessary | none |
| 3 | Tower headline, m = 6 | `6^n ∣ 6^(n+1)` | `ζ₆ ∈ μ_6`, `ζ₃₆ ∈ μ_36`; the fields are nested, and the adjoin is the union `ℚ(μ_(6^∞))` | holds (Kato 14.4: any m ≥ 1) | none |
| 4 | Nonsingularity | `y² = x³` | Δ = 0; the nonsingular group is ≅ (ℚ,+) via `(x,y) ↦ x/y`, contains 1/n for all n, so it is not FG | `IsElliptic` necessary | none |
| 5 | Modularity hypothesis | zero cusp form | `a₁(0) = 0`; `W.LFunction 0 = 0` (elaborated), `a₁(E) = 1` (multiplicative Euler product, `ArithmeticFunction/LFunction.lean` line 312) | zero form excluded | none |
| 6 | Continuation | `F₁, F₂` entire, equal on `Re s > 3/2` | `F₁ − F₂ = 0` on an open set, hence on ℂ; `F₁(1) = F₂(1)` | value well defined | none |
| 7 | Rank-zero headline | 11a vs 37a | 11a: `L(E,1) ≈ 0.254 ≠ 0`, `E(ℚ) ≅ ℤ/5`; 37a: `L(E,1) = 0`, rank 1 | `hne` necessary, conclusion consistent | none |
| 8 | 4.2 boundary shift | (k,r) = (3,2), (4,3), (2,1) | unitary s = 1 (boundary), 3/2 (interior), 1/2 (central: Rohrlich's clause) | supplier covers exactly the non-central cases | none |
| 9 | 4.2 pole exception | π₂ = 1 on GL₁ | `π₂ ≅ π₁∨ ⊗ |det|^(−it)` needs rank 1 = 2 | no pole | none |
| 10 | 6.4 Check | `y² = x³ − x`, p = 3 | 4 points, `a₃ = 0`, `α² = −3`, `(1+α/3)² = 2/3 + 2α/3` | correct | none |
| 11 | 6.4 negative control | α = 2, p = 3 | β = 3/2, `a₃ = 7/2` | non-integral, so it cannot occur | none |
| 12 | 6.5 supercuspidal | `a_p = ε(p) = 0` | `X²`, only root 0, `D_crys = 0` | no scalar comparison | none |
| 13 | 6.5 critical slope, k = 2 | `μ = log_p(s)` | `log_p(ζ) = 0` at torsion points; `log_p(γ) ≠ 0` for `γ ∈ 1+pℤ_p∖{1}` | values do not determine μ | none |
| 14 | Chern sign (F01 text) | Kato §8.4 | `ch{f,g} = h(f) ∪ h(g)`; swapping slots gives `−h(f) ∪ h(g)` | sign right, attribution wrong | R02 |
| 15 | 0.4 count | A = 4 | 4 roots β′ (one coordinate) vs 16 (both) | Kato 2.12 | none |
| 16 | 2.2 literal dual | Sym², b = 1; k = 4, ℓ = 3 | antidiagonal (−2,1,−2): det = −4, not a unit in ℤ₂; `ℓ^(2(k−2)) = 81` vs `ℓ^(k−2) = 9`, ratio ℓ² | Lemma A.3 | none |
| 17 | 2.3 operator | T′ = S′ = σ = 1, ℓ = 3; σ = 0 | 1 − 1 + 3 = 3; 1 | Nakamura (14) | none |
| 18 | 6.3 Gauss sum | χ mod 3 | `ζ₃ − ζ₃² = i√3`; `G² = −3 = χ(−1)·3` | correct | none |
| 19 | 6.3 powers | general k, r | `(2πi)^(k−r−1) / (2πi)^(−r) = (2πi)^(k−1)`, independent of r | absorbed by periods | none |
| 20 | 3.4 regulator | `η_(2,z)` on `𝔾_m` | `log 2 · i dθ`; integral `2πi log 2`; `η_(f,f) = 0` | Kato 2.10 | none |
| 21 | 4.3 integral parity | pro-3 on 2 lines; p = 2 | orbit sizes 1 or 3, so each line is fixed; an order-2 swap is possible | p odd needed (13.4(3)) | none |
| 22 | 4.4 rank at p = 2 | odd V, complex conjugation c | `rank H¹ − rank H² = dim V^(c=−1) = 1`, and H² is torsion | rank one | none |
| 23 | 5.5 injectivity | `Λ ⊕ Λ/(T) → Λ` | isomorphism at (0); kernel `Λ/(T) ≠ 0` | torsion-freeness needed | none |
| 24 | 6.6 dyadic lattice | `y² + xy = x³ + 1` | b₂ = 1, b₄ = 0, b₆ = 4, b₈ = 1, Δ = −1 − 432 = −433; `log(2u) = 2u + 2u² + (8/3)u³ + …`; `2u(1+u) ≡ 0 mod 4` | image ⊂ 4ℤ₂ | none (source issue) |
| 25 | 7.4 Coleman factor | α = 1, −1 | `1 − α⁻¹` = 0 and 2 | augmentation kept; 2 a unit for odd p | none |
| 26 | 7.5 norms | `Ẽ(𝔽_p)[3^∞] = ℤ/9`, p = 3 | norm = ·3, and `3·3 = 0` | limit 0 | none |
| 27 | 7.7 local error | unit α, β = p/α | `v_p(1−β) = 0`, so `v_p(#Ẽ) = v_p(1−α) = v_p(1−α⁻¹)` | Greenberg 4.1 | none |
| 28 | Gap text vs contract | §8.22 | gap says "for every p"; contract and supplier say odd p | contradiction | R01 |
| 29 | 4.7 route | non-CM E/ℚ | F = ℚ, Γ = {1}, B = M₂(ℚ) split; 4.1 gives an open subgroup of `SL₂(ℤ_p)`, and det = κ onto `ℤ_p^×` | holds only with modularity | R04 |
| 30 | Statability of Cor. 14.3 χ-parts | ℚ(ζ_m) | `pointGaloisAction` (Tau Ceti) and `autEquivPow` (Mathlib) exist; a χ-part and a twisted LSeries are simple | statable or name it | R06 |

### Duplication and ownership (by object; open roadmap pull requests through `roadmaps grep`)

- **Tower finite generation.** No other roadmap states it. `EllipticCurves` Layer 6 (main) owns Mordell–Weil over number fields, which is the m = 1 case.
- **Rank-zero finiteness of `E(ℚ)`.** No `Suggested.lean` states it. `GrossZagierAndArithmeticHeights` leaves rank deductions to the rank-zero/one BSD roadmap (its README line 7), which is later.
- **Serre's open image.** No owner: `ArithmeticGaloisRepresentations` §6.4 (head #856, line 3918) only defines open-image predicates; `HeegnerPointEulerSystems` asks for the adelic form through a gap. This roadmap owns the E/ℚ case through modularity (R04).
- **De Rham Perrin-Riou map (6.1).** `PadicHodgeRegulators` §§9.31–9.35 give the regulator on a high-conductor domain, and on all of weight space only in the crystalline case. 6.1's η-pairing form for de Rham V on the (16.4.1) domain is distinct, so this roadmap owns it.
- **Classical Ш and Selmer carriers.** Owned by `EllipticCurves` Layer 7 and `SelmerIwasawaCohomology` §§2.12–2.12a (head #869, lines 645, 671); the README imports them.

### Supplier citations resolved this round

- **Repair-touched suppliers.** The AL.3 anchor and R16.5.3 (above).
- **`PadicHodgeRegulators`.** The 18 cited sections (board main, lines 466–2172).
- **`AutomorphicGaloisRepresentations` §§6.1, 7.5** (head #1007, lines 2441, 2959). §7.5 keeps the inner-twist field and the quaternion algebra in its open-image form, as 4.1 uses them.
- **`SelmerIwasawaCohomology`.** §§2.12, 2.12a, 3.0–3.3, 3.5–3.7, 3.9–3.11, 3.13, 3.15, 3.18, 3.20, 4.9 and 4.26 are present under the cited numbers.
- **`ModularSymbolsPadicLFunctions` §§0.2, 0.7, 0.8, 1.1–1.3, 2.5, 3.0, 3.2–3.3** (head #968).
- **`PadicFamilies` §4.0** (head #1019, line 2351; the Chern image is the cup product, line 2355).
- **`EllipticCurveModularity` R29.4–R29.6** (head #1018, lines 1249, 1464, 1598): for R04.
- **`EllipticCurves`** (main) Layers 4.5b, 6 and 7 (lines 1013, 1200, 1262): for R05.

### Pinned library declarations opened

| Declaration | File and line at the pin |
|---|---|
| `WeierstrassCurve.LFunction` (uses the local minimal model, line 44), `WeierstrassCurve.LSeries` | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean` lines 79, 84 |
| `WeierstrassCurve.Affine.Point` | `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean` line 477 |
| `ArithmeticFunction.eulerProduct`, `isMultiplicative_eulerProduct` | `Mathlib/NumberTheory/ArithmeticFunction/LFunction.lean` lines 260, 312 |
| `ModularForm.eisensteinSeriesMF`; `EisensteinSeries.gammaSet`; `eisensteinSeries` | `Mathlib/NumberTheory/ModularForms/EisensteinSeries/Basic.lean` line 35; `Defs.lean` lines 43, 202 |
| `CuspForm`; `UpperHalfPlane.qExpansion` | `Mathlib/NumberTheory/ModularForms/Basic.lean` line 80; `QExpansion.lean` line 171 |
| `ContinuousCohomology.tateShafarevich` (its TODO for the classical Ш, line 28) | `Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean` line 71 |
| `TauCeti.kummerMap` | `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean` line 249 |
| `WeierstrassCurve.pointGaloisAction` | `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean` line 47 |
| `WeierstrassCurve.tateModuleGaloisRepresentation` | `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean` line 71 |

All other contract names (`Units.map`, `DirichletCharacter.LFunction`, `Module.IsTorsion`, `Module.IsTorsionFree`, `LocalizedModule`, `Ideal.height`, `ringKrullDim`, `Matrix.vecMul`, `PadicInt`, `LSeries`, `CongruenceSubgroup.Gamma0`, `IsCyclotomicExtension.autEquivPow`) elaborate in a scratch `#check` file.

## Not verifiable

- **Image-only scans (no OCR on this worker).** `Serre1972`, `Ribet1985` and `Ribet1981` were fetched but could not be read. The claims citing them are checked only through `Loeffler2017` §1 and Theorems 2.2.2/2.3.1, Rubin pp. 49–50, and Kato 12.8.
- **Paywalled (uncertified, cited by locator).** `JacquetShalika1976`, `Rohrlich1984`, `Rohrlich1988`, `Ribet1980`, `PerrinRiou1990`, `PerrinRiou1994`, `Schneider1985`, `BlochKato1990`, `DiamondShurman2005`. `FontaineMessing1987` is waived.
- **Nakamura2023.** Only arXiv v2 was read; the README consistently uses arXiv v2 pagination.
- **5.4's factor `(2πi)^(1−k)`.** Corollary A.5 of Nakamura2023 (line 3852) displays no power of `2πi`. The factor depends on the Betti normalisation of the `(1−k)` twist in Lemma A.3, which the source leaves implicit, so it is not decided here.
- **The sign exponent in Kato 16.2(i).** The OCR garbles it (line 5913). It was checked only through its consistency with 12.5(1), and 16.2(ii) at line 5919.
- **Ownership against open pull requests** was checked only through the roadmap service's index (349 heads) and the board's main branch.

## Source issues

- **Error** in Rubin2000 at Proposition III.5.1, draft p. 48: the source says the dual exponential of the singular local classes is the local index times `p⁻¹ℤ_p` for every p, because the logarithm maps `E₁(ℚ_p)` onto `pℤ_p`; it should restrict to odd p, since at p = 2 the image can be `4ℤ₂` (`y² + xy = x³ + 1`); affects a stated result.
- **Error** in Kato2004 at Remark 12.8, (12.8.2), p. 223: the source says that for every coefficient place of a non-CM form the image contains an open subgroup of `SL₂(ℤ_p)`; it should require that Momose's quaternion algebra split at the place below, since division-algebra images contain no nontrivial unipotent; affects a stated result (12.4 at such places, through 13.8).
- **Misprint** in Kato2004 at Theorem 16.4(ii), p. 270: the source says the auxiliary vector lies in `D_crys` of the form's own representation; it should be `D_crys(V*(1))`, the space of η; affects nothing.
- **Misprint** in Kato2004 at Theorem 14.5(3), p. 236: the source says the condition "(12.5.1)" of Theorem 12.5(4); it should be the image condition (12.5.2), which 14.14 uses; affects nothing.
- **Misprint** in Nakamura2023 at the proof of Theorem A.1, arXiv v2 p. 87: the source says the conductor-n smoothing factor has first scalar d; it should be `d²`, as in the conductor-one factor displayed just above it; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5fb6ef4", "job": "REV-PKG-KatoEulerSystems~2", "model": "opus", "worker": "fable-rev81"} -->

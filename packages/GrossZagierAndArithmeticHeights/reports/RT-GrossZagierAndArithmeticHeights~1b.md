<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/147#issuecomment-6336257466 -->
Red team round 1 pass b (claude) of 140543f

Verdict: needs_changes

1. **F01** (P2) The characteristic-3 example of `heegnerAverage` does not elaborate at the review pins

   **Location:** `packages/GrossZagierAndArithmeticHeights/Suggested.lean:158`: “example (x : ZMod 3) : heegnerAverage (Representation.trivial (ZMod 3) (Multiplicative (ZMod 3)) (ZMod 3)) 1 x = 0”.

   **Claim:** The file is submitted as elaborating with only `sorry` warnings, but at the pinned Mathlib and Tau Ceti of the review environment the statement of this example fails: instance synthesis for `Module (ZMod 3) (ZMod 3)` does not succeed when the `[Module L V]` argument of `heegnerAverage` is unified against the instance carried by `Representation.trivial`. The remaining 30 declarations elaborate (six `sorry` warnings, lines 49, 57, 169, 174, 223, 240). Naming the type arguments (`(L := ZMod 3) (G := …) (V := …)`) does not repair it; supplying the module instance explicitly does.

   **Witness:** Elaboration of a probe copy of the file as submitted, output line `159:4: error(lean.synthInstanceFailed): failed to synthesize instance of type class  Module (ZMod 3) (ZMod 3)`, exit status 1. A second probe copy with the explicit instance below elaborated without error.

   **Exact repair text:** Replace lines 157–165 by:
   ```lean
   /-- When the characteristic divides the group order the average is zero, not a projector. -/
   example (x : ZMod 3) :
       @heegnerAverage (ZMod 3) (Multiplicative (ZMod 3)) (ZMod 3) _ _ _ _ Semiring.toModule
         (Representation.trivial (ZMod 3) (Multiplicative (ZMod 3)) (ZMod 3)) 1 x = 0 := by
     have h : (Fintype.card (Multiplicative (ZMod 3)) : ZMod 3) = 0 := by
       rw [Fintype.card_multiplicative, ZMod.card]
       rfl
     simp only [heegnerAverage]
     rw [h, inv_zero, zero_smul]
   ```

2. **F02** (P3) Two sorried theorems close by one `simp` call from Mathlib

   **Location:** `packages/GrossZagierAndArithmeticHeights/Suggested.lean:174`: “theorem heegnerAverage_pairing … (hcard : (Fintype.card G : L) ≠ 0)”; `Suggested.lean:223`: “theorem bdpLFunction_evaluation”.

   **Claim:** Both are stated as milestone targets with `sorry`, but each is one tactic from the pinned Mathlib: `heegnerAverage_pairing` is bilinearity plus `(c⁻¹)² = (c²)⁻¹`, and `bdpLFunction_evaluation` is `map_mul`/`map_pow`. The hypothesis `hcard` of `heegnerAverage_pairing` is not used by the proof (the identity holds when the group order is zero in `L`, both sides being `0`), so README 8.2 (line 4965: “`heegnerAverage_pairing` states the bilinear inverse-square scaling when (#G:L)≠0”) and 8.8 (line 5141) overstate the needed hypothesis. `heegnerAverage_isotypic` (line 169) does not close by `simp` with the unfolding lemmas and is a genuine target; `bdpEulerFactor_ne_zero` (line 240) needs a nine-line argument with `Real.sq_sqrt`, `Real.sqrt_lt_sqrt`, `abs_le` and `nlinarith` (verified in a probe copy) and is not a one-tactic target.

   **Witness:** A probe copy in which `theorem heegnerAverage_pairing_try1 … := by simp [heegnerAverage, sq, mul_assoc]` and `theorem bdpLFunction_evaluation_try … := by simp [bdpLFunction]` elaborated with no error (only the linter warnings that `hcard` is unused and that `mul_inv` is an unused simp argument).

   **Exact repair text:** Replace the two `sorry` proofs by
   ```lean
   theorem heegnerAverage_pairing {W : Type*} [AddCommGroup W] [Module L W]
       (ρ : Representation L G V) (ρ' : Representation L G W)
       (χ : G →* Lˣ) (x : V) (y : W) (B : V →ₗ[L] W →ₗ[L] L) :
       B (heegnerAverage ρ χ x) (heegnerAverage ρ' χ⁻¹ y) =
         ((Fintype.card G : L) ^ 2)⁻¹ * B (heegnerFinite ρ χ x) (heegnerFinite ρ' χ⁻¹ y) := by
     simp [heegnerAverage, sq, mul_assoc]
   ```
   and
   ```lean
   theorem bdpLFunction_evaluation {S : Type*} [CommRing S]
       (ev : PowerSeries R →+* S) (root : PowerSeries R)
       (normalization : (PowerSeries R)ˣ) :
       ev (bdpLFunction root normalization) =
         ev (normalization : PowerSeries R) * ev root ^ 2 := by
     simp [bdpLFunction]
   ```
   and in `README.md:4965` replace “and `heegnerAverage_pairing` states the bilinear inverse-square scaling when (#G:L)≠0” by “and `heegnerAverage_pairing` states the bilinear inverse-square scaling for every finite G, with both sides zero when (#G:L)=0”; `README.md:5141` needs no change.

3. **F03** (P3) Bibliography numbers of Gross–Zagier are carried into the roadmap at nine further places

   **Location:** `packages/GrossZagierAndArithmeticHeights/README.md:973`: “(quoted, Lang [24])”; `README.md:1931`, `:2226`, `:5071`: “N = 1 is treated in [18]”; `README.md:3398`: “([14] = Gross, 'Local heights on curves')”; `README.md:3724`: “equals the global height pairing of the classes of a and b [14]”; `README.md:3807`: “in the sense of Gross [13]”; `README.md:4129`: “(quoted, Eichler [10, p. 118])”.

   **Claim:** These are reference numbers of the source's own bibliography (the published Gross–Zagier paper), not of this roadmap's References, which has no numbering; a reader cannot resolve them, and they show that the sentences were carried over from the source rather than restated. This is the defect class of pass a's F10 (line 1903, “[17]”), at locations that finding does not cover.

   **Witness:** gz86 lines 3675, 3681, 3683, 3688, 3690, 3700 (the source's bibliography entries 10, 13, 14, 17, 18, 24).

   **Exact repair text:** At line 973 write “(quoted from Lang, *Les formes bilinéaires de Néron et Tate*, Sém. Bourbaki 274)”; at lines 1931, 2226 and 5071 write “N = 1 is treated in Gross–Zagier, *On singular moduli*, J. Reine Angew. Math. 355 (1985)”; at line 3398 write “(Gross, *Local heights on curves*)” and at line 3724 “(Gross, *Local heights on curves*)” in place of “[14]”; at line 3807 write “in the sense of Gross, *Heegner points on X₀(N)*”; at line 4129 write “(Eichler, *Lectures on modular correspondences*, Tata Institute Lecture Notes 9 (1956), p. 118)”; add the four works that the References list does not yet carry (Lang 1964, Gross–Zagier 1985, Eichler 1956, Gross *Local heights on curves*) to `## References`.

4. **F04** (P3) Process narrative in a citation

   **Location:** `packages/GrossZagierAndArithmeticHeights/README.md:5209`: “Erratum items 1 and 16 (directly read erratum)” and “Erratum items 28–31, 47, 57, 62 (directly read erratum)”.

   **Claim:** “directly read” records how the author worked, not what the roadmap states; the timeless rule excludes it.

   **Witness:** The same erratum is cited at lines 444, 1731, 2092, 2444 and 3362 without the phrase.

   **Exact repair text:** Delete both occurrences of “ (directly read erratum)” at line 5209.

## Verified sound

Read all 5,926 README lines and all 243 Lean lines. The inventory covers 31 Lean declarations (9 definitions, 6 sorried theorems, 16 examples) and all 292 section targets of Layers 0a–9 with their Checks; the seven standing hypothesis blocks (C), (H), (G), (L), (Q), (Q′), (D) were read against their targets.

Elaboration. The file as submitted was elaborated in a probe copy at the review pins (Tau Ceti a91d3aaf, Mathlib 6b7abb3c): six `declaration uses 'sorry'` warnings and the one error of F01. It has the single `import Mathlib`, no `set_option`, no `lemma`, no `#eval`/`#print`, no sorried data, at most two proved examples per definition, and every Lean declaration name appears in the README. The trivial-proof probe is F02; the four other sorried theorems were checked by hand as true as typed (the derivative constant √N/π uses Γ_ℂ(1) = 1/π; the discriminant trichotomy gives 3, 2, 1; the average lies in the inverse-character eigenspace also when the group order is zero in L; `1 + p − a ≥ (√p − 1)² > 0` for p > 1).

Checks recomputed (46): #Pic(ℤ[3i]) = 2, Cl(−23) = C₃ with ζ = 2 ∈ 𝔽₇; the norm-5 and norm-7 cyclic ideals and their kernel generators (2−i)/5, (3+ω)/7; both embedding matrices of 0a.3 (((2,−1),(5,−2))² = −I, det 1; ((−3,−1),(7,2)) satisfies M²+M+I = 0, det 1); the degrees 16/4/4 and the ω/2 transport of 0a.5; the LMFDB regulator halves of 0.1; Δ(37a1) = 37; the C₃ Atkin–Lehner orbit 0 → 2 → 0 of 0.12; φ_(O)(P) = [−P]−[O] and the e_χ adjoint of Layer 1; the mass 1 of μ_Ar and the ddᶜ/unsquared-metric conventions of Layer 2 (consistent with the supplier conversion G = 2g); the Faltings–Hriljac sign and the 2h_(O) diagonal; ω_f ∧ i ω̄_f = 8π²|f|² dxdy; the δ_p rule of 3.8 against CNS Theorem 6.12; the weight-four projection factor of 6.1; V_0(t) = −2πi e^{−2πt} by residues, q₀′ and the bound q_n ≤ e^{−t}/t; the D = −3, n = ±3 signs of 6.16; r_A(m|D|) = r_A(m); the Mellin constants of 6.18 (expanded to the displayed ½ term); C_{p^ν}⁻¹ for ν = 1, 2; the coefficient −1/7 of 6.21; the self-dual volume of 6.23; the whole classical chain 6.55 → 6.71 → 6.74 → 6.78, recomputed from (6.5): the pole 24α(1)σ₁(m)/s cancels and the finite part reproduces 6.78's “2 + 2ζ′/ζ(2)” and the r_A(m) bracket exactly; n_ℓ at q = 3, s = 1 (2, 6, 8) and the orbit sizes of 7.2; k_{v,0} = ½ log((1−λ)/(−λ)) and Q₀; the 1/(N−1) multiplicity; the S₂ integral (1−N⁻¹)²(1−3/(1+N+N²)); the Euler product of 7.18; −69 ≡ 1 mod 7 and 11 ≡ −3 mod 7; the D = −4 matrix identity of 7.81; the u = 3 correction of 7.93; the ζ/3 eigenvector of 8.2; the sign of 11a1 over ℚ(√−11); the embedding matrix of 8.5 (trace −7, det 14, 11 | 22, 11 split in ℚ(√−7)); the constants of 8.6, 8.15 and 8.17 against each other; the CST example constant 9 of 8.16; #E(𝔽₅) = 10 for y² = x³+3x, the p ≥ 7 / p = 5 dichotomy and the 11a1 values a₅ = 1, a₂₃ = −1 of 9.7 and 9.15; (1+T)² of 9.15; the valuation −2 of 9.12; the gamma and π exponents of 9.9 against 9.15.

Locators verified against the cached legal copies (55), by line and running head: gz86 I (4.3) p. 228, (5.3) p. 229, (6.4) p. 230; II (2.1) pp. 236–237, §4 p. 248; III (0.1) p. 252, (8.3) p. 263; IV (0.3)–(0.4) p. 268 (the pdf has front matter: page offsets are not uniform, running heads were used), (3.2) p. 277, (5.1) p. 288, (6.2) p. 295, (6.5) and the p. 298 derivation, (6.9) p. 305; V §2 pp. 310, 312; gross84 (4.1), (4.2), (5.1), (5.2); yzz-erratum-pku items 10, 62, 63 (64 items in all, dated 28 June 2026); cns Theorems 1.1–1.2 p. 3, 3.14–3.15 p. 21, Proposition 5.14 p. 39, Theorem 5.15 and Remark 5.16 p. 40, Proposition 6.2 p. 41, Lemma 6.5 p. 42, Example 6.7 p. 43, Remark 6.11 p. 45, Theorem 6.12 and Corollary 6.14 p. 46, Theorem 7.2 p. 47, the 11a3 example; cst Theorem 1.8 p. 10, Proposition 3.7 p. 9, Lemma 3.1 p. 21, Lemma 3.5 p. 23, Propositions 3.11–3.12 pp. 26–27, Lemmas 3.13–3.14 pp. 30–31 (the three δ-conditions of 4.7(c) match Lemma 3.13), (2.1) p. 13; yuan-bigness-pku §A.1 p. 102, §A.6 pp. 118–119; yuan-modular §4.2 p. 58, §4.3 p. 63 with Lemma 4.2, §4.4 p. 67 with Remark 4.4; yuan-zhang §9.2 from p. 628; jetchev §1 p. 812. The statements at these locators support the targets as written; CNS 6.12's three clauses are reproduced verbatim-correctly in 3.1 and 3.8.

Suppliers. All ten cited Tau Ceti declarations (`frickeCompletedL`, `frickeCompletedL_eq_cpow_mul_Λ`, `canonicalHeightQuadratic`, `canonicalHeight_nsmul`, `tendsto_naiveHeight_two_pow_nsmul_div_four_pow`, `regulator_eq_abs_det_neronTateGramMatrix`, `regulator_eq_one_of_finrank_eq_zero`, `neronTatePairing_self`, `hasse_bound`, `frobeniusTrace_sq_le_four_mul_card`) and twelve cited Mathlib names exist at the pins. Of the 42 roadmap names cited, 15 are on `main` under `TauCetiRoadmap/` (none is cited as `TauCetiRoadmap.X` while living only under `Completed/`) and 25 are above the roadmap in the merge order on `main` (`merge-order/ORDER.txt` line 167); the five supplier names of pass a's F07 that are now in that order (TropicalAndBerkovichArithmetic 155, AnalyticNumberTheory 82, AbelianSchemesAndArithmeticModuliPartII 102, PadicHodgeRegulators 162, QSeriesPartitionsAndMockModularForms 132) all precede line 167. AutomorphicPadicLFunctions and GeneralizedHeegnerCycles remain absent from `main` and the order (F07, not re-raised). RankZeroOneBSD and HeegnerPointEulerSystems (line 182) occur only as consumers. The clone's `merge-order/ORDER.txt` (147 lines) does not list the roadmap; the gate reads the current order:

```text
depcheck: 9 roadmaps, 100 edges, 0 problem(s)
```

Policy: no pull-request or issue numbers, no `lemma`, no `set_option`, no LaTeX delimiters; the title keeps “Gross–Zagier” capitalised; "current"/"removed" occurrences are the version discussion of pass a's F01 or mathematical usage.

Not re-raised (pass a, F01–F16): the f790474/a91d3aaf version discussion (F01), the §3.1/§3.8 order (F02), pseudo-theta convergence (F03), the (Q′)/(D) scope of 7.47 (F04), placewise finiteness in 6.57 (F05), the dyadic CM constants (F06), the unowned suppliers (F07), semistable integration ownership (F08), the missing height headline (F09), the copied announcement aside at line 1903 (F10), the missing `sources.toml` (F11), the missing example mirrors (F12, F13), the α = 0 and ramified valuation defects of 7.62/7.75 (F14, F15), the Skinner edition links (F16).

## Not verifiable

- The package has no `sources.toml` (F11); the sha256 of each cached copy was taken from the manifest the earlier pass recorded, so the cache mapping is that pass's, not the package's.
- The 2013 Yuan–Zhang–Zhang book and its 6 November 2011 draft: no legal copy in the cache; the draft is linked from a ResearchGate profile page, which is not among the source classes the rules name, and could not be fetched. Book-only inputs (Proposition 5.8, Theorem 7.8(4)) remain as pass a recorded them.
- Bosch–Lütkebohmert–Raynaud §7.5 Theorem 4: uncertified, paywalled.
- Waldspurger (Compositio 1985) and Saito (Compositio 1993): the cached texts are OCR of scans and theorem numbers could not be located; the pages cited in 5.1, 5.3 and 4.2 were not confirmed.
- Brooks, BDP, Castella–Hsieh, Skinner, JSW, Disegni, Prasanna, DIT, Burungale, Fuchs–Pham, BSW, Conrad locators: not re-checked in this pass beyond what pass a recorded.
- The root cause of F01 (which `AddCommMonoid`/`Module` instance path the unifier takes at the pin) was not traced; only the failure and the repair were tested.
- `bdpEulerFactor_ne_zero` and `heegnerAverage_isotypic` were not proved in a single tactic; the nine-line proof of the former is in a probe copy, the latter was not attempted beyond `simp`.

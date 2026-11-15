<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13054#issuecomment-6899747255 -->
Review (claude) of bb8ee73

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) §13.8 uses Thorne 2024 Theorem 7.5, which the cited supplier section does not state

   - **Location:** `packages/ModularityAndLanglandsExtensionsPartII/README.md:4892–4894` (§13.8, proof
     sketch): "PotentialAutomorphyInfrastructurePartII Layer 8, "The ANT lifting theorem with weak
     primitivity", which contains th24 Theorem 7.5"; the same title in the *Needs* line (README:4905)
     and in the contract (README:295–296).
   - **Claim:** the supplier provides the lifting theorem that nt26 Proposition 6.3 applies.
   - **Witness:** the alias resolves to ModularityAndLanglandsExtensions §4.2, which requires
     `F(ζ_ℓ) ⊄ F^{ker ad(ρ̄^{ss})}` (its README at the open head, §4.2, fourth bullet). th24 Theorem 7.5
     (th24 lines 1965–1983, p. 44) replaces exactly that clause by a place `w` with
     `H⁰(F_w, ad ρ̄(1)) = 0`. Instance where §4.2 fails: `p = 7`, `F⁺ ⊇ ℚ(ζ_7)⁺`, residual image with
     projective image `PGL_2(𝔽_{7³})`, `det r̄ = ε̄^{−1}`. Then `[F(ζ_7) : F] = 2`, `−1` is a non-square in
     `𝔽_{343}` (`343 ≡ 3 mod 4`), so `ε̄` is the sign character of the projective image and
     `F(ζ_7) ⊂ F^{ker ad ρ̄}`. The supplier's own §8.16 says of th24 Theorem 7.5 only that it "states
     the lifting variant", and proves the finiteness variant.
   - **Repair:**
     1. Add to the contracts of PotentialAutomorphyInfrastructurePartII, and to the top-level `gaps`
        of `design/plan.json` with supplier `PotentialAutomorphyInfrastructurePartII`, section
        `§8.16 (Layer 8)`, the line
        "What PotentialAutomorphyInfrastructurePartII must provide (gap:auxiliary-place-reducible-lifting):
        beside §8.16 (Layer 8), the lifting form of that variant (Thorne 2024 Theorem 7.5, th24
        pp. 44–45): under the hypotheses of ModularityAndLanglandsExtensions §4.2 with the clause
        `F(ζ_l) ⊄ F̄^{ker ad(ρ̄^{ss})}` replaced by a place `w ∤ l` of `F` at which `ρ̄` is unramified and
        `H⁰(G_{F_w}, ad ρ̄(1)) = 0`, with weak primitivity tested over `k̄` and `ρ̄(G_{F(ζ_l)})` without
        nontrivial quotient of `l`-power order, `ρ` is the Galois representation of an ι-ordinary
        RACSDC automorphic representation."
     2. In §13.8 replace the parenthesis by "(PotentialAutomorphyInfrastructurePartII,
        gap:auxiliary-place-reducible-lifting, which is th24 Theorem 7.5; the form of
        ModularityAndLanglandsExtensions §4.2 does not apply, since `F(ζ_p)` can lie in the field cut
        out by `ad r̄`)", add to the sketch "the place `w` comes from `σ ∈ G_F` with `ε̄(σ) = −1` when
        `[F(ζ_p) : F] = 2`, and in general with `ε̄(σ)(α/β)^j ≠ 1` for `|j| ≤ p + r − 1`, `α`, `β` the
        eigenvalues of `r̄(σ)` (th24 proof of Theorem 7.6, p. 46)", and put the gap in the *Needs* line in
        place of the alias.
     3. Add the instance above as a negative-control Check of §13.8.
     Tested on the instance: with `ε̄(σ) = −1` and `(α/β)^i ≠ −1` for `1 ≤ i ≤ p + r − 1`, the
     eigenvalues `q_w(α/β)^j = −(α/β)^j` of Frobenius on `ad r̄(1)` are never `1` (`j = 0` gives `−1`), so
     the hypothesis of the gap holds where that of §4.2 fails. §13.9 uses §13.8 and needs no further
     change.

2. **F02** (P3) §6.2: the reason given in a Check contradicts the source and the supplier

   - **Location:** README:2557–2558: "If some `R_v` is the Steinberg ring, `P_D → 𝕋_D` is not asserted:
     the Hecke algebra is of level prime to `v`."
   - **Witness:** nt21 line 3866 (p. 79): for `R_v = R^1_v` or `R^{St}_v` the level is Iwahori at `ṽ`
     with trivial coefficients; the supplier's "Ordinary deformation data" section says "Iwahori level
     at unipotent and Steinberg places". §6.3's own Check speaks of "the Iwahori-level Hecke support".
   - **Repair:** "…is not asserted: the level at `v` is Iwahori, as for the unipotent ring, so forms
     unramified at `v` contribute to `𝕋_D`, and their Galois representations do not satisfy the Steinberg
     condition." Tested on §6.3's instance (`n = 3`, `p = 5`, `q_v = 11`, Frobenius `1`): eigenvalue ratios
     `1 ≠ 11`, an Iwahori-level point outside `R^{St}_v`.

3. **F03** (P3) five locator slips

   - **§3.3, README:1229–1230:** "The printed statement labels the twin by the original index `i`".
     nt21 line 2657 (Lemma 3.3, p. 54) prints the original point `z` with the index `i′`; the slip is
     the point, not the index. Repair: "The printed statement writes `z ∈ X_{i′}`; the twin `z′` is
     meant, as its proof says."
   - **§5.2, README:2142:** "Lemma 4.5 and proof, p. 61". The proof continues on p. 62 (nt21 line 3010;
     the step at `T_2`, which the sketch uses, is there). Repair: "pp. 61–62".
   - **§9.4, README:3363:** "nt21b §2, unitary Hecke modules, pp. 9–11". Page 9 (nt21b lines 377–435)
     is quaternionic; the unitary group starts at line 443, p. 10. Repair: "pp. 10–11".
   - **§13.8, README:4880:** "nt26 Proposition 6.3 and proof, p. 49". The proof ends on p. 50 (nt26
     page marker inside the proof, before Theorem 6.4). Repair: "pp. 49–50".
   - **§14.2, README:5027–5028:** "Theorem 8.1;" has no page. nt21 line 4435 is on p. 91. Repair:
     "Theorem 8.1, p. 91".

4. **F04** (P3) §12.6: a Check about a case the statement excludes

   - **Location:** README:4525 (§12.6): "For `γ = 0` there is no twisting action and `R′_∞ = R_∞`."
   - **Witness:** the statement has `q ≥ |S ∪ S_∞|` and `γ = 2 − |S ∪ S_∞| + q` (nt26 line 1643), so
     `γ ≥ 2`; `γ = 0` never occurs and the Check tests nothing. (The same sentence in §9.6, README:3456,
     is a genuine boundary case there, since §9.6 states `q ≥ |S ∪ S_∞| − 2`, nt21b line 789; it stays.)
   - **Repair:** "Since `q ≥ |S ∪ S_∞|`, `γ ≥ 2`: for `q = |S ∪ S_∞| = 3`, `γ = 2` and `Ĝ_m^γ[2](𝒪) = {±1}²`
     has order `4`. With `q < |S ∪ S_∞| − 2` the formula would give `γ < 0`, which is why the bound on `q`
     is part of the statement." (`2 − 3 + 3 = 2`; `2 − 3 + 0 = −1`.)

5. **F05** (P3) a work cited by theorem number without a manifest entry

   - **Location:** README:415–416: "§3.2 (supersingular residual local form: `a_p = 0` gives an
     irreducible local residual representation, Edixhoven Theorem 2.6)".
   - **Witness:** `sources.toml` has 18 entries, none for Edixhoven; `## References` has none either.
     The supplier's §3.2 carries the attribution itself.
   - **Repair:** delete ", Edixhoven Theorem 2.6" from the contract line (the supplier section is the
     citation).

Five findings, one blocking (R01). All ten repairs of round 6 are present and correct. The fifteen
sampled targets agree with their sources. `Suggested.lean` elaborates with `sorry` as its only
warning and is not padded. The blocking point is the last step of §13.8: it needs Thorne's
auxiliary-place form of the Allen–Newton–Thorne lifting theorem, and the supplier section cited
for it states the older form, whose hypothesis fails over some totally real fields. No package file
was changed.

## Verified sound

### Round-6 findings, checked first

| Id | Status | Repaired passage (quoted) and check |
|---|---|---|
| F01 (P2) | repaired | §11.1: "over `F_2`, the base change of `π` unramified at every place above `v_0`, and at those places `q ≡ 1` modulo `p^N`"; API bullet and negative-control Check added. Recomputed: inertia of an unramified extension is unchanged, parameter `θ|_I ⊕ θ^q|_I` of order `p`. |
| F02 (P2) | repaired | §13.7 *Needs*: "ModularityAndLanglandsExtensions §2.1 (potential diagonalizability of ordinary and Fontaine–Laffaille representations)"; §13.8: ""Finiteness of ordinary locally Steinberg deformation rings", §8.7". Both headings exist at the open heads (§2.1 "Potential diagonalizability and its criteria"; §8.7). The alias left in §13.8 is R01. |
| F03 (P3) | repaired | "nt26 pp. 12–25", "pp. 12–13", "pp. 37–50", gap text "pp. 29–30; Propositions 4.8–4.9, pp. 34–35". Markers: p. 13 at nt26 line 571, §3 at 554; Propositions at 1586 (p. 34) and 1643 (p. 35). |
| F04 (P3) | repaired | README §14.4 and the docstring: "nt21 Theorem A, p. 2; the entire continuation follows by Godement–Jacquet, as nt21 Corollary C, p. 2, records for semistable elliptic curves". |
| F05 (P3) | repaired | "(nt21 §1, the data fixed under the standard assumptions, p. 9)", "(ct17 §2.1, p. 4;", "(ct17 §2.1, p. 6)" twice. A search for "line N" locators in README, Lean file and manifest finds none. |
| F06 (P3) | repaired | `Nat.multiplicity_pow_two_sub_one` in four places; `#check` at the pin gives `1 < x → ¬2 ∣ x → n ≠ 0 → Even n → multiplicity 2 (x ^ n - 1) + 1 = …`, no deprecation warning. |
| F07 (P3) | repaired | §12.6: "For odd `p`, `q ≥ 0` is the common size of the Taylor–Wiles sets of §12.3". nt26 line 1586: "an integer `q ≥ 0`". |
| F08 (P3) | repaired | §11.1: "`x = r_{X,ι}`, `y = r_{Y,ι}` satisfy `x x^c = ε`, `y y^c = ω_p`"; §11.3: "`s^c ≅ s^∨ ⊗ ε^{1−2r} ω_p^{r−1} (y y^c)^{1−r}`". |
| F09 (P3) | repaired | Layer 11 and §§5.1, 5.7, 9.1, 11.1, 13.2 carry mathematical titles; no heading contains "§". |
| F10 (P3) | repaired | Contracts list IntegralHeckeAndGaloisDeterminants §1.4, GlobalGaloisDeformations §§5.3–5.5, 8.4, PotentialAutomorphyInfrastructurePartII §8.5, ModularityAndLanglandsExtensions §4.13; all are headings at the open heads. |

The repaired patterns were searched again: no page range starting one page late other than those of
R03; no other extraction line number; no deprecated library name (24 declarations opened); no other
undefined symbol in Layer 11.

### Source sample (15 targets, each read at the lines given)

| Target | Text read | Outcome |
|---|---|---|
| §1.3 | nt21 lines 2140–2195 (Lemma 2.29, pp. 44–46) | hypotheses, both cases and the Vandermonde step agree |
| §2.2 | nt21 lines 2535–2577 (Lemma 2.34, pp. 51–52) | agrees; surjectivity is the README's stated addition |
| §3.3 | nt21 lines 2656–2667 (Lemma 3.3, p. 54) | agrees; the misprint is misdescribed (R03) |
| §3.7 | nt21 lines 2745–2782 (Lemma 3.7, pp. 56–57) | six conclusions, `m_π`, `k′`, `i′` agree |
| §4.2 | nt21 lines 553–600 (Propositions 1.6, 1.7, pp. 12–13) | agree; the normalised coefficient is the source's "coefficient" with value `1` |
| §5.2 | nt21 lines 2973–3010 (Lemmas 4.3, 4.5, Remark 4.4, pp. 61–62) | agree; page range R03 |
| §6.2 | nt21 lines 3836–3895 (deformation data, Lemma 6.4, Lemma 6.6, pp. 78–79) | agree; one Check R02 |
| §7.2 | nt21 lines 4073–4116 (Lemma 7.2, pp. 83–84), 4205–4212 (p. 86) | five conclusions and the bound `(p − 1)/8` agree |
| §8.3 | nt21 lines 4446–4500 (Proposition 8.2, pp. 91–92) | agrees, with the seed in place of Theorem 7.7 |
| §9.4 | nt21b lines 443–526 (pp. 10–11) | levels, exponents, Lemma 2.4, Proposition 2.5 agree; page range R03 |
| §10.2 | nt21b lines 928–953, 1037–1052 (Lemmas 3.4, 3.5, pp. 20–23) | agree |
| §10.4 | nt21b lines 1068–1110 (Proposition 3.7, pp. 23–24) | agrees; the sandwich is from the proof |
| §11.10 | nt26 lines 584–588 (Theorem 3.2, p. 13), 1144–1152 (p. 25) | agree |
| §12.5 | nt26 lines 1547–1580 (Lemma 4.7, pp. 33–34) | agrees |
| §13.6 | nt26 lines 2058–2103 (Theorem 5.9, pp. 44–45) | seven hypotheses, both conclusions and the route agree |

Read in addition: nt26 Theorem 4.1 and reductions (10)–(16) (lines 1183–1262), Propositions 4.8–4.9
(lines 1586–1680), Theorem 5.5 (lines 1855–1874), Proposition 6.3 (lines 2311 ff.); th24 Theorem 7.1,
Corollary 7.2, Lemma 7.3, Proposition 7.4, Theorems 7.5, 7.6 (lines 1864–2080); nt21b Definition 3.6.
No locator is flagged by the author as unverified.

### Adversarial table (values computed this round)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §1.3 derivative matrix | `I = {0, 2}`; falling factorials | `[[1, 1], [0, 2]]`, det `2 = 2 − 0`; row `h` is a monic polynomial of degree `h` in `i`, so det `= ∏_{i<j}(j − i)` | sound |
| §2.2 Checks | `pℤ_p ⊂ ℤ_p`; `⟨2⟩ ⊃ ⟨4⟩` mod 3 | `t ↦ t^p`, derivative `p t^{p−1}` a unit, `p` roots `t_0ζ` with `|ζ − 1| < 1`; `2^a ≡ (−1)^a` | sound |
| §2.1 weight valuation | `p = 2`, `η(5) = −1`; `Δ` | `v_2(−2) = 1 < 2`; slopes `3 + 8 = 11` | sound |
| §3.2 | `k = 3, 4, 6` (`m = 0`); `m = 1, 2` | `v_2(4) = 2`, `v_2(24) = 3`, `v_2(624) = 4`; `v_2(−2) = 1`, `v_2(i − 1) = 1/2` | annulus `0 < v < 3` as stated |
| §3.3 | weights `3`, `2` (`m = 1`), `5` | `2/2 = 1`, `1/1 = 1`, `4/2 = 2` | sound |
| §3.7 | `i = 1` | `2^{m+1} > 5`, `m_π = 2`, `k′ = 9`, `s = 2 < 7/2`, `i′ = 4 − 1 = 3`, twin slope `6 = 3·2` | sound |
| §4.2 normalisation | `U_1(ℝ)`, constants `1`, `2` | traces `1`, `2`; right side `ϵ`, `2ϵ` | normalisation needed |
| §5.2 sign Check | `sp(2)`, `χ·sp(2)` | signs `(+1)(−1) = −1`, `(−1)(−1) = +1 = (−1)^{n−1}` | sound |
| §6.2 (R02) | `n = 3`, `p = 5`, `q_v = 11`, Frobenius `1` | ratios `1 ≠ 11`: Iwahori-level point outside `R^{St}_v` | Check's reason wrong |
| §7.1 | `a_2`, `a_5`, `a_8` | `(1 + i)⁴ = −4`; `(2 + i)⁴ + (2 − i)⁴ = −14`; `(−4)³ = −64` | sound |
| §7.2 | `n = 3`, `p = 577` | `48·6 = 288`, `577 = 2·288 + 1` prime; `576/8 = 72 > 12`; `ε^{3(n−1) − 4(n−1)} = ε^{1−n}`; order of `g^k ≥ 12/2 > 6` | sound |
| §8.1, §8.2 | `n = 3`; `n = 3`, `k = 2` | `Sym²`: `α², αβ, β²` repeat iff `α = ±β`; `p > max(8, 4)`, `(n − 1)(k − 1) = 2 ≤ p − 2` | sound |
| §9.4 exponents | `n = 2, 3` | `(1, −1)`; `(1, 0, −1)` | sound |
| §10.3 | `n = 3` | `t > 48`, `t = 53`; `q + 1 = 159` gives `158`, not prime; `q = 211` prime | sound |
| §10.4 | `p^a ≤ 2n − 1` | `p^{2a} − 1 ≤ 4n(n − 1) < t/2` | bound follows |
| §11.10 | `r = 2, 3` | weights `{0,1} + {0,2,…,2r−2} = {0,…,2r−1}`; `SP_{r±1}`: `(1, 3)`, `(2, 4)` | sound |
| §12.1 polarization | multiplier of `r_T` | `ε^{−1}·ε^{1−r}·r_χ(XX^c)^{−1}(YY^c)^{1−r} = ε^{−r}·ε^{1−r} = ε^{1−2r}` with `r_{|·|} = ε` | sound |
| §12.5 | `r = 2`, weights `{0,1}` for `σ` | `{0,1} + {0,1}` repeats `1` | regularity needed |
| §12.6 (R04) | `q = |S ∪ S_∞| = 3`; `n = 4` | `γ = 2`; `nq − q = 9` | `γ = 0` impossible |
| §13.6 | `M > p^{a₀(p)}` | `p^a > M` gives `a > a₀(p)`; `4r < 4p ≤ p³` | `S5-global` (4) follows |
| §13.8 (R01) | `p = 7`, `F⁺ ⊇ ℚ(ζ_7)⁺`, `a = 3` | `[F(ζ_7) : F] = 2`; `343 ≡ 3 mod 4`; `F(ζ_7) ⊂ F^{ker ad r̄}`; with `ε̄(σ) = −1`: `−(α/β)^j ≠ 1` | cited form fails, th24 form holds |
| §13.9 | `p = 5, 7`; `n = 11` | `SP_4, SP_3, SP_2 ⇒ SP_6, SP_7, SP_8`; `SP_6, SP_5, SP_4 ⇒ SP_8, SP_9, SP_{10}`; `11 = 7 + 4` only | sound |
| §13.10 | `n = 6, 7, 11, 12` | `(5,1)`, `(5,2)`, `(7,4)`, `(7,5)` or `(11,1)`; indices `r + 1 ≤ p < n`; Bertrand on `⌊n/2⌋` gives `n/2 < p < n` | sound |
| §14.1 Check | `r̄` trivial, `q_v ≡ 1` | `T_v² ≡ 4 ≡ (q_v + 1)²` | sound |
| §14.4 headline | `Δ`, `n = 2`; `n = 0` | `576 − 2048 = −1472`; `ζ(s)` | `1 ≤ n` needed |
| §14.5 headline | CM form of level 32, `n = 4`; weight one; `M = 0` | `α²β² = p²` gives `ζ(s − 2)`, pole at `3 = n(k−1)/2 + 1`; `Nat.Coprime p 0 ⇔ p = 1` | hypotheses needed |

### Lean acceptance test

- `lake env lean` on `packages/ModularityAndLanglandsExtensionsPartII/Suggested.lean` from the
  content checkout: exit 0; the only output is two "declaration uses `sorry`" warnings (lines 98,
  117). No `TauCeti.*` module needed building. Header: `import Mathlib` and the one Tau Ceti module
  used. No `set_option`, `lemma`, `#eval`, sorry'd data.
- `#check @name` for the four declarations in a scratch copy: types equal the worker's
  elaborated-signature list and the README (`1 ≤ n`; Satake hypotheses; `[NeZero N]`, `2 ≤ k`,
  `¬HasQuadraticSelfTwist f`, product over `p ∤ N`). Nothing lost.
- One-tactic probe on both sorried theorems with `simp`, `rfl`, `infer_instance`, `trivial`,
  `aesop`, `decide`, `simp [symPowerEulerFactor]`: all fourteen fail; `exact?` proposes only the
  sorried declaration itself. No padding. The one proved `example` is the reindexing symmetry of
  the kept definition.
- Pinned declarations opened with `#check` (20 library names, all present, none deprecated):
  `Nat.multiplicity_pow_two_sub_one`, `Polynomial.discr`, `Nat.exists_prime_lt_and_le_two_mul`,
  `NumberField.abs_discr_gt_two`, `DirichletCharacter.changeLevel` with `changeLevel_injective`,
  `changeLevel_eq_one_iff`, `changeLevel_eq_cast_of_dvd'`, `ZMod.unitsMap`, `MulChar.map_nonunit`,
  `ZMod.χ₄`, `UpperHalfPlane.qExpansion`, `GaussianInt`, `Complex.cpow`, `HeckeRing.GL2.Newform`,
  its `satakeParameters`, `exists_satakeParameters_eq_pair`,
  `LSeries_eulerProduct_hasProd_satakeParameters`, `prod_map_one_sub_mul_satakeParameters`, and
  `CuspForm.hasEntireExtension_qExpansion_coeff`.
- Headlines: §§2.4, 3.8, 5.4, 5.10, 6.4, 6.7–6.9, 7.5–7.7, 8.3, 9.8, 11.10, 12.7, 13.5, 13.6, 13.10,
  14.1–14.3 are named in the module docstring with the missing carrier; §§14.4–14.5 are stated. No
  statable headline is absent. The four backticked names of the roadmap's own are declared.

### Suppliers, order, gaps, overlaps

- Dependency check output: `depcheck: 246 roadmaps, 2269 edges, 0 problem(s)`; no UPWARD, CYCLE or
  `moved:` line.
- `roadmaps resolve` leads: none. Opened at their heads this round: ModularityAndLanglandsExtensions
  §§2.1, 4.2, 4.13; PotentialAutomorphyInfrastructurePartII §§8.5, 8.7, 8.8, 8.16, its mapping table
  and "Ordinary deformation data"; IntegralHeckeAndGaloisDeterminants §1.4;
  GlobalGaloisDeformations §§4.6, 4.11, 5.3–5.5, 5.7, 8.1–8.6. One citation does not carry what it
  is cited for (R01).
- Gaps: 13 slugs, each README line equal to the `needs` of `design/plan.json` (compared by script),
  each with a named earlier supplier. R01 adds a fourteenth.
- Shape: 110 numbered targets, each with one `*Needs:*` line, a locator and at least three Checks
  (counted by script); 15 layers with Examples and Dependencies; no LaTeX delimiters, pull-request
  numbers, paths, HTML or process words.
- Duplication by object: `roadmaps grep` for `HasQuadraticSelfTwist`, `symPowerEulerFactor`,
  `symPowerEulerProduct`, "twin involution" finds nothing outside this package; "seasoned" occurs
  only in the proof route of ModularityAndLanglandsExtensions §4.29, which this roadmap proves.
- Kazhdan–Lusztig classification: settled in round 4 as not actionable here; not re-raised (see the
  last section).
- Overlap facts: no other pull request changes this roadmap, no cited id is dropped, none is defined
  only by an open revision.

Overlap check: read PotentialAutomorphyInfrastructurePartII, ModularityAndLanglandsExtensions, OrdinaryAutomorphicFormsAndModularityLiftingPartII (open), SmoothRepresentationsOfLocalGroups, ModularForms, ReductiveGroupsPartII (main); statements of symmetric power functoriality and the Allen–Newton–Thorne lifting theorem: ModularityAndLanglandsExtensions, proofs here; residually reducible finiteness and its auxiliary-place variant: PotentialAutomorphyInfrastructurePartII; Iwahori–Matsumoto presentation: SmoothRepresentationsOfLocalGroups SR.1.5; Kazhdan–Lusztig classification: this roadmap §4.9.

### Copyright, wording and arrangement

Twenty-one passages were set beside the sources: the fifteen sampled targets, and §10.3 (nt21b
Definition 3.6), §12.1 and §12.7 (nt26 lines 1183–1262), §12.6 (nt26 lines 1586–1680), §13.8 (th24
lines 1908–1983) and the two theorem docstrings. Numbered hypothesis lists (§§10.3, 12.7, 13.2)
keep the source's items, which the mathematics forces; the sentences are the roadmap's own, and no
run longer than the standard phrase "an unramified twist of the Steinberg representation" is
shared. No table, figure or list of examples is taken over. Contents of nt21 (§1 unitary groups,
§2 eigenvarieties, §3 ping pong, §4 level raising, §5 finiteness, §6 Steinberg, §7 level one, §8
higher levels) against Layers 0–8: §2 is split over Layers 0–2, §1 comes after §3 and is merged
with ct17 §§2–3, §4 with ct17 §4, §6 with ct17 §5 and th24 §6, §5 is left to a supplier: no
one-to-one run.

Source independence: 21 passages compared with 4 sources (nt21, nt21b, nt26, th24), none shared beyond standard phrases; largest share nt21, 91 of 254 source references; contents compared with nt21: independent.

## Not verifiable

- kl87 (Theorem 7.12, §8), bbm82 (Théorème 3.1.1), kw09 (Proposition 9.3): settled as uncertified;
  not read.
- at20, ct15, ct17, bk05, con99, chen14, moe07, kv12, dm18, ls20, wes04 were not reopened this
  round; no sampled target cites them and no repair touched their locators. Rounds 2–6 record
  their checks.
- §4.2's Check "for `H = G` the sign is `+1`" was not derived from a text: the Kottwitz sign of the
  compact form is `(−1)^{(n²−1)/4} = +1` for odd `n` (`n = 3`: `2`; `n = 5`: `6`), which is consistent
  with it but is not the whole normalisation.
- Whether the alternative of R01 could be avoided by a choice of `p` or of `ι` in §13.10 was not
  decided; for `n = 11` only `p = 7` is available.

## Source issues

- **Misprint** in nt21 at Lemma 3.3, statement, p. 54: the source says the original point `z` lies on the annulus component of index `i′`; it should be the twin `z′`, as its proof says; affects nothing.
- **Misprint** in th24 at Corollary 7.2, proof, p. 42: the source says Bertrand gives a prime `p` with `n < p < 2n` and then writes `n = p + r`; it should be `n/2 < p < n`; affects the proof.
- **Gap** in nt26 at Theorem 4.1, reductions (12)–(13), p. 26: the source says the set `Σ` of bad places is where `π` ramifies while `σ` is only Iwahori-spherical everywhere; it should include the places where `σ` ramifies in `S` and the unitary level; affects the proof.

## For the human reviewers

- Ownership: SmoothRepresentationsOfLocalGroupsPartII (open; its §7.4) states the Kazhdan–Lusztig classification citing kl87 and not §4.9 here, while README "Downstream consumers" says it consumes §4.9; the edit belongs to that roadmap.
- Arrangement: Layers 11, 12, 13 correspond to nt26 §3, §4, §§5–6 (the last merged with th24 §7); §13.4's *Needs* force 13 after 11 and 12, and 11, 12 are independent of each other.
- Licence: ct17, ct15, bk05, con99 were read from authors' pages (`sources.toml`, `licence_class = "author-page"`); kl87, bbm82, kw09 are cited by locator only.
- Scope: nt26 is cited by arXiv v2 pages with the venue "Ann. of Math. 203 (2026)"; the published pagination was not compared.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "bb8ee732ce5141fe49ed5084b659b31c8aab4d03", "job": "REV-PKG-ModularityAndLanglandsExtensionsPartII~7", "model": "fable", "worker": "chris-x79"} -->

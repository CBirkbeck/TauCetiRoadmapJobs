<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13795#issuecomment-6796749541 -->
Review (claude) of 63c2853

Verdict: needs_changes

1. **F01** (P3) A Check of the universal property fails for curves

   **Location:** `packages/NashBlowups/design/README.md:558`: “For `X` smooth over `k`, `F = Ω_{X/k}` and `h : Bl_p X → X` the blowup of a closed point … `q = h`, a morphism to `N = X` that is not an isomorphism”. Also `packages/NashBlowups/design/plan.json`, target 1.3, test `lift_blowup_not_terminal`.

   **Claim:** For every smooth `X` the blowup of a closed point is a non-isomorphic lift.

   **Witness:** `X = 𝔸¹_k`, `p` the origin: the ideal `(x)` is invertible, so `Bl_p X = X` and `h = q` is the identity, an isomorphism. The Check is true only in dimension `≥ 2` (and vacuously different in dimension `0`, where `Bl_p X = ∅`).

   **Repair:** In both files write “for `X` smooth of relative dimension `r ≥ 2`” (or use `X = 𝔸²`, as the §2.4 Check already does). Tested: `𝔸²` at the origin has exceptional fibre `ℙ¹`, so `h` is not an isomorphism; `𝔸¹` is excluded by the new hypothesis.

2. **F02** (P3) Proposed names of this roadmap written in code

   **Location:** `packages/NashBlowups/design/README.md:757`, `:768`, `:769` (`NashIterationResolves X d`, `NashIterationResolves X 2`, `NashIterationResolves X 1`) and `:1283` (`NormalizedNashIterationResolves X d`); the last two of §2.7 stand inside a Check.

   **Claim:** By the Conventions (line 114) code spans are declarations of the pinned libraries or of other roadmaps.

   **Witness:** Both predicates are this roadmap's own (introduced in italics at lines 749 and 1271). They need the Nash blowup, which is not statable at the pins, so the ported package cannot declare them, and a backticked own name is checked against `Suggested.lean`; a Check also may not name a Lean counterpart.

   **Repair:** Write the four occurrences as italic name plus prose (“*NashIterationResolves* holds for `X` with `d = 2`”, “the iteration with `d = 2` resolves `X`”). Nothing else changes. Tested on the instance: with `d = 2` the characteristic-2 cusp has `X_sm^{(2)} = ∅`, `X^{(1)} = ∅`, smooth; with `d = 1` every iterate is the cusp; the prose keeps both values.

3. **F03** (P3) A Check of Seidenberg's lemma calls a non-stable ideal stable

   **Location:** `packages/NashBlowups/design/README.md:953`: “In `ℚ[x]` with `∂ = d/dx`, the stable ideal `(x²)` has minimal prime `(x)`, which is not `∂`-stable: but `(x²)` is not `∂`-stable”.

   **Claim:** The first clause.

   **Witness:** `∂(x²) = 2x ∉ (x²)`; the same sentence says so. The plan's test `seidenberg_unstable_square` is worded correctly (“`(x²)` is not stable; only `0` and `ℚ[x]` are”).

   **Repair:** Reword as in the plan: “In `ℚ[x]` with `∂ = d/dx`, `(x²)` is not `∂`-stable (`∂(x²) = 2x`), so its non-stable minimal prime `(x)` is no counterexample; the only `∂`-stable ideals are `0` and `ℚ[x]`.” Tested: a nonzero stable ideal contains a polynomial of least degree `n`; its `n`-th derivative is `n!·(leading coefficient)`, a unit.

4. **F04** (P3) The base-change comparison map of §0.2 has no stated definition

   **Location:** `packages/NashBlowups/design/README.md:320`: “the map `c_{g'} : g'*Ω_{X/R} → Ω_{X'/R'}` (§0.1 for the square over `Spec R' → Spec R`)”. Also `plan.json`, target 0.2.

   **Claim:** §0.1 supplies this map.

   **Witness:** §0.1 defines `c_f` only for two schemes over one base `Spec R`, with target `Ω_{X'/R}`. For `R = k`, `R' = k(s)`, `X = Spec k`: §0.1 gives `0 → Ω_{k(s)/k} = k(s)·ds`, not an isomorphism; the intended target `Ω_{k(s)/k(s)} = 0` gives one.

   **Repair:** State the map: the composite of §0.1's `c_{g'} : g'*Ω_{X/R} → Ω_{X'/R}` (with `X'` over `Spec R`) with the canonical surjection `Ω_{X'/R} → Ω_{X'/R'}`; equivalently the adjoint of the `R`-derivation `h ↦ d_{X'/R'}(g'*h)`. Tested: on the witness the composite is `0 → 0`; for `ℤ → 𝔽₂`, `X = 𝔸¹_ℤ` it is `𝔽₂[T]·dT → 𝔽₂[T]·dT`, the identity, agreeing with `KaehlerDifferential.tensorKaehlerEquiv`.

5. **F05** (P3) Layer 0 skips the number 0.5

   **Location:** `packages/NashBlowups/design/README.md:360` and `:396`: `### 0.4 Grassmannians along a surjection` is followed by `### 0.6 Smoothness at closed points over a perfect field`; `plan.json` has ids 0.4, 0.6, 0.7.

   **Claim:** The numbering is timeless.

   **Witness:** A missing number records that a target was withdrawn. No roadmap on main or in an open pull request cites NashBlowups (`roadmaps grep` for “Nash blow” and “Nash modification”: no match), so nothing depends on the present numbers.

   **Repair:** Renumber §0.6 → §0.5 and §0.7 → §0.6 in the README (headings and every `§0.6`, `§0.7` reference: Scope, §§4.4, 5.4 and 6.3 with their *Needs* lines, and the Layer 6 Dependencies), the `plan.json` ids and `target:` prerequisites, and the `cited_for` entries of `stacksVarieties` and `stacksAlgebra` in `sources.toml`. Tested by listing the references: §0.6 is used by §§4.4 and 5.4, §0.7 by Scope, §6.3 and the Layer 6 Dependencies; no external citation exists to break.

Five findings, all P3; no P1 or P2. Each carries a repair to apply, so the verdict asks for changes. The six findings of round 4 are all repaired. No design file and no manifest entry was changed by this review. No supplier gap is declared.

## Verified sound

**Previous review, finding by finding (REV-DESIGN-NashBlowups~4).**

- **R01 (P1), repaired.** README 802–809: “over a field of characteristic `0` or `≥ 5`, `Φ(t) = [1 : 3t/2]`” and “in characteristic `3`, `df = 2y dy` … `Φ` is the constant `[1 : 0]`; in characteristic `2` … `[0 : 1]`. In both cases the closure of the graph is `X × {Φ} ≅ X`”. Recomputed: `3·2⁻¹ = 4` in `𝔽₅`; on `X_sm` (origin removed) `y`, resp. `x`, is a unit. Plan tests `gauss_cusp`, `gauss_cusp_small_char` match.
- **R02 (P1), repaired.** README 849: “let `n ≥ 1` and `f ∈ k[x_1, …, x_n]`”, with the Check at 868–871; plan hypothesis `1 ≤ n`. Recomputed: `(n, f) = (0, 0)` gives `J_f = 0`, `Bl = ∅`, `X* = Spec k`, excluded; `(1, x_1)` gives `J_f = (1)`, both `Spec k`; `(n, 0)` with `n ≥ 1` is not pure of dimension `n − 1`; a nonzero constant gives `∅ = ∅`.
- **R03 (P2), repaired.** README 862–867: “with `q ≥ 2` and `gcd(p, q) = 1` … For `q = 1` the curve `y = x^p` is the smooth line … for `p | q` … not reduced”. Recomputed for `(p, q) = (2, 3)`: `J = (3y²) = (y²)`; `(3, 2)`: `J = (y)`; `t ↦ (t^q, t^p)` satisfies `x^p = t^{pq} = y^q`.
- **R04 (P2), repaired.** Target 0.5 is gone from README and plan; Scope (lines 62–65) and the Tau Ceti contract (199–205) import `KaehlerDifferential.kerCotangentToTensor_bijective_of_formallyEtale`; §§4.1 and 4.4 name it in route and *Needs*. Opened at the pin: `TauCeti/RingTheory/Kaehler/Conormal.lean:76`, hypotheses `[Algebra.FormallyEtale R S]` and surjectivity of `algebraMap P S` only; `Mathlib/RingTheory/Etale/Field.lean:98` `of_isSeparable [Algebra.IsSeparable K L] : FormallyEtale K L`; `Mathlib/RingTheory/LocalRing/ResidueField/Basic.lean:33` `ker_residue`; `Mathlib/RingTheory/Kaehler/Basic.lean:801` `kerCotangentToTensor`. The widened second clause of §4.1 (`Algebra.IsSeparable k κ`) is exactly the supplier's generality.
- **R05 (P3), repaired.** `packages/NashBlowups/sources.toml:182`: “pp. 314-491 (the whole article; background only)”; the version note sends the algebraic proof to nashModificationNotes2024 Section 2. Checked against nashModificationNotes2024 line 151 (reference 21, pages 585–587).
- **R06 (P3), repaired.** §2.7 (README 752–758) and §7.1 (1278–1286) carry prose API bullets: evaluation with the shift, preservation of the Setting, the predicate, smooth stabilisation, normality for `i ≥ 1`. R02 above concerns only the code spans these bullets introduced.

No repair was marked not actionable; nothing is re-raised. No maintainer notes were supplied. No gap is declared (`plan.json` `gaps: []`, README line 268).

**Adversarial pass on the repaired and added passages, and the repaired patterns elsewhere.** Natural-number subtraction: only `n − 1` (§3.3, now guarded), `β − α` (§5.1, under `α ≤ β`), `q − 1` (`q ≥ 2`). Small-characteristic cusp formulas: §§2.1, 2.4, 2.5, 3.3 and the Layer 2 Examples are each scoped to characteristic `0`, `0 or ≥ 5`, or split by characteristic. Unscoped “smooth” with a free `d`: §2.7 Check and §7.1 theorem now carry “relative dimension `d`” or the Setting. R01 and R03 above are the two Check defects the pass found outside the repaired lines.

**Computed table** (sampled targets, headlines, targets touched by findings and repairs). `C_p` is the cusp `y² = x³` in characteristic `p`.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Quotient convention | line `y = 2x` | `Ω = (dx, dy)/(dy − 2dx)`, quotient `dx ↦ 1, dy ↦ 2`: `[1 : 2]`; conormal gives `[2 : −1]` | direction fixed |
| 0.2 (R04) | `k → k(s)`, `X = Spec k`; `ℤ → 𝔽₂`, `𝔸¹` | §0.1 alone: `0 → k(s)ds`; composite `0 → 0`; `𝔽₂[T]dT → 𝔽₂[T]dT` identity | statement true, map to be stated |
| 1.2 | `O ⊕ O/(x)` on `𝔸¹`, `r = 1`; ideal `(x, y)` on `𝔸²`; `F` free | `N = 𝔸¹` at `[1 : 0]`, Grassmann fibre `ℙ¹`; `P(I) = Proj Rees = Bl₀𝔸²`; `N = X` | closure, not the Grassmannian |
| 1.3 | torsion quotient `(a, b) ↦ b` at the origin; two quotients `M, M'` on reduced `Z`; `Bl_p` of `𝔸¹`, `𝔸²` | point `[0 : 1] ∉ N`, `h⁻¹(U) = ∅`; `ker M → M'` vanishes on a dense open of a reduced scheme, so is `0`; `Bl_p 𝔸¹ = 𝔸¹` (iso), `Bl₀𝔸²` has fibre `ℙ¹` | theorem sound; Check 3: R01 |
| 1.4 | `r = 0`; `r = 1`; rank 2 in `O⁴` | `∧⁰F = O`, both sides `X`; identity; six minors, `∧²` of identity quotient is identity quotient of `∧²F|_U` | sound |
| 1.5 | `V ⊆ U`; `g = U ↪ X`; `{0} → 𝔸²` for `(x, y)` | `V`; `U = U`; fibre product `ℙ¹` versus `N({0}, k², 1, ∅) = ∅` | flatness and density needed |
| 2.1 | `C_0`; node; `Spec k`, `d = 0` | `ν*Ω = k[t]²/t³·(−3t, 2) ≅ k[t] ⊕ k[t]/(t³)`, `L`: `dx ↦ 2, dy ↦ 3t`; branches `[1 : 0]`, `[0 : 1]`, `X* = 𝔸¹ ⊔ 𝔸¹`; `X` | sound |
| 2.2 | `C_0`; `y² = x²z`, char `≠ 2`; smooth `X` | finite, not iso (`t ∉ k[t², t³]`); `ν⁻¹(0) = ℙ¹` (nobile1975 line 319); witness `X` | proper, not finite in general |
| 2.4 | `Bl₀𝔸² → 𝔸²`; `C_0` normalisation; one line of `𝔸¹ ⊔ 𝔸¹`; converse direction | lift `π`, fibre `ℙ¹`, not a closed immersion; `t ↦ (t², t³, [1 : 3t/2])` closed; closed immersion, lift not onto; `q(X₁)` closed and `⊇ ν⁻¹(X_sm)` dense, so `q` is a surjective closed immersion into reduced `X*` | iff holds with surjectivity |
| 2.5 headline | `C_2`, `C_3`, `C_0` | relation `x² dx`: quotient `(0, 1)` free; relation `2y dy`: `(1, 0)` free; `b = (3t/2)a` in `k[[t², t³]]` forces `a, b` both non-units | iso: yes, yes, no |
| 2.7 | `C_0`; `C_2` with `d = 1, 2`; `𝔸²`, `d = 1` | `X^{(1)} = 𝔸¹`; all iterates `C_2`; `X_sm^{(2)} = ∅`, `X^{(1)} = ∅` smooth; `∅` | junk value pinned; R02 on notation |
| 3.1 | `C_5`, `C_3`, `C_2` | `[1 : 4t]`, ring `k[t]`; `[1 : 0]`, ring `k[t², t³]`; `[0 : 1]`, ring `k[t², t³]` | repaired |
| 3.2 | `dx ↦ x` on `𝔸¹`; `I = 0`, `X ≠ ∅`; `d = 0`; kernel argument | `Bl_{(x)} = 𝔸¹`; `Bl₀ = ∅ ≠ X*`; `O → I` iso on dense open gives `I = (g)`, `g` a nonzerodivisor, `Bl = X = X*`; image of `ker(ν*∧^dΩ → ∧^dL)` in `O_{X*}` vanishes on a dense open of a reduced scheme | sound |
| 3.3 | `(0, 0)`, `(1, x_1)`; `x^p − y^q` for `(2, 3), (3, 2), (2, 1), (2, 4)`; signs for `f = xy` | see R02 of round 4 above; `J = (y²), (y), (1), ` non-reduced; `dx ↦ −f_y`, `dy ↦ f_x` | repaired |
| 4.1 | `k[x, y]_{(x,y)}`; `C_3` origin; `d = 0`; `𝔽_p(t)[x]_{(x^p − t)}` | `∂_i = ∂/∂x_i`; `ker q = R dy/(y dy)`; `ker q = Ω`; `d(a(x^p − t)) = (x^p − t)da`, so `q(dm) ⊆ m` | separability needed for `x_j ∈ m` |
| 4.2 | `∂ = d/dx`; `∂ = x d/dx`; `k[x]/(x²)`, char `≠ 2`; derivation `∂⊗1 + 1⊗∂` on `a(1⊗b − b⊗1)` | `L(x dx) = dx`, `L(dx) = 0`; `L(dx) = dx`; `L(x dx) = 2x dx = 0`; gives `∂a·db + a·d(∂b)` | well defined |
| 4.3 (R03) | `ℚ[x]`, `(x²)`; `ℚ[x, y]`, `(y²)`, `∂_x`; `𝔽_p[x]`, `(x^p)` | `∂(x²) = 2x ∉ (x²)`; `(y)` stable; `∂(x^p g) = x^p g'` stable, `∂x = 1 ∉ (x)`; route: `x²∂y ∈ J`, `(x∂y)² ∈ J`, `∂y ∈ (J : x) = P` | theorem sound (hamann2003 lines 56–64); Check wording R03 |
| 4.4 | stable contraction to `k[X_1..X_d]`; `C_0`; `C_2` | least-degree element has a nonzero derivative of lower degree, so contraction `0`, `trdeg κ(P) ≥ d`, `P` minimal, `T_P = 0` against `P ⊇ Ann M`; no quotient; quotient exists, singular | characteristic 0 needed |
| 4.5 headline | point; `C_0`; node; `C_2` | (smooth, iso) = (T, T), (F, F), (F, F); `C_2` gives (F, T), excluded | sound over any field of characteristic 0 |
| 5.1 | `p = 2, d = 1`; `p = 3, d = 1`; `d = 0`; `C_3` | matrix `((1, x), (0, 1))`, `φ_0 = id − x∂`, `φ_1 = ∂`, `φ_0(x) = 0`; `((1, x, x²), (0, 1, 2x), (0, 0, 1))`; identity; orders of `Σ r_i³ x^i` lie in `{3a, 3b + 2, 3c + 4}`, `a, b, c ∈ {0, 2, 3, …}`, never `3` | exact formula `binom(β, α)x^{β−α}` holds without commuting derivations |
| 5.3 | DVR versus `C_3`; `ρ_Q ψ_Q(e_α)`; `𝔽_p(t)[s]_{(s)}` | `sf ∈ R_Q`, `f^p ∈ R_Q` gives `f ∈ R_Q`; cusp: `t ∉ R`; `σ_Q(1)e_α = e_α`, surjection of free modules of equal rank is bijective; `[K : K^p] = p²` against rank `p` | normality and perfectness both used |
| 5.4 headline | cone `z² = xy`, `p ≠ 2`; `C_2`; `x^p + y² + t` over `𝔽_p(t)` | `J = (x, y, z)` not invertible, not smooth, not iso; not normal; `df = 2y dy`, quotient `(1, 0)`, iso, regular, not smooth | sound |
| 6.1 | `C_0`, `C_2`; node; `y² = x²z` in char 2 | `X̄* = 𝔸¹` both; `η = id`; `J = (x²)` principal on an integral surface, `X* = X` | normalise `X*`, not `X` |
| 6.3 | `C_0` to `ℚ(i)`, `ℚ(u)`; `x^p + y² + t`, `k' = k(t^{1/p})` | `𝔸¹` on both sides; `u^p + y² = 0`, `s ↦ (−s², s^p)`: `(−s²)^p + s^{2p} = 0`, bijective, not iso | separability needed |
| 6.4 headline | `C_2`; smooth line; regular non-smooth curve | (normal, `ν` iso, `ν̄` iso) = (F, T, F), (T, T, T), (T, T, T); section `s = η ∘ ν̄⁻¹`, `ν ∘ s = id` | iff sound |
| 7.1 | `𝔸¹`; `∅`; `𝔸²` with `d = 1`; `C_2` | `Y_i = 𝔸¹`; `∅`; outside the Setting, `Y_1 = ∅`; `Y_0` cusp, `Y_1 = 𝔸¹`, `X^{(1)}` cusp | Setting hypothesis present |
| 7.2 | `U = Y`; `U = Y_sm`; induction step | identity; `U`; `Y^{(i)} ⊇ V_i ≅ Z^{(i)}` gives `ν⁻¹(V_i) ≅ V_i* ≅ Z^{(i+1)}`; `Y_{(j+1)m} ⊇ (Y_{jm} ⊇ X)_m ⊇ Y_m ⊇ X` | sound |
| 7.3 headline | `C_2`, `m = 1`, Nash; `C_0`, `m = 0` | no smooth iterate; `Y_0 ⊇ X` but `Y_1` smooth | `m ≥ 1` needed; `j = ⌈i/m⌉` |

Zero ring and empty scheme: all constructions are empty, pure of every dimension, smooth; no singularity hypothesis is met. Group, compactness and valuation tests do not apply.

**Sources: the seeded sample**, each read at its locator in the cached text.

| Target | Locator read | Supports |
|---|---|---|
| 1.2 | nashModificationNotes2024 lines 216–225; gonzalezSprinberg1982 lines 85–90 | closure of the section in the Grassmannian of quotients; coherent `F`, dense `U` |
| 1.3 | nashModificationNotes2024 lines 226–229, 153–162; gonzalezSprinberg1982 lines 94–98 | universal property; the notes omit density (see Source issues), the roadmap states it |
| 1.4 | gonzalezSprinberg1982 lines 99–104; nashModificationNotes2024 line 230 | Plücker closed immersion; `SN(F) ≅ SN(∧^d F)` |
| 1.5 | stacksNormalization line 421 (Lemma 29.6.3, 01R8), line 2198 (Lemma 29.26.16, 081I) | image of a quasi-compact map restricts to opens; commutes with flat base change |
| 2.2 | nashModificationNotes2024 lines 152–155; gonzalezSprinberg1982 line 94; nobile1975 lines 314–324 | proper birational; Example 4 has `p⁻¹(0)` a projective line, char `≠ 2` |
| 2.4 | nashModificationNotes2024 lines 153–162 | Teissier's formulation, algebraically closed field |
| 2.5 | nashModificationNotes2024 lines 170–171; duarteNunezBetancourt2020 lines 152–156 (Lemma 2.4); nobile1975 lines 136–141 | one direction in the sources; Examples 1 and 2 as cited |
| 2.7 | nobile1975 lines 202–203 | iterated blowing-up `X^{(q)}` |
| 3.2 | nobile1975 line 105 (Theorem 1), proof lines 107–116; nashModificationNotes2024 lines 243–247 | locally a blowup; ideal from Jacobian minors weighted by separating functions |
| 4.3 | hamann2003 lines 56–64 | Noetherian, contains `ℚ`; exactly the stated lemma |
| 4.5 | nobile1975 line 143 (Theorem 2); nashModificationNotes2024 line 143; duarteNunezBetancourt2020 line 136; lines 140–141 | algebraically closed in the sources; the roadmap's route (§§2.5, 4.4) needs none |
| 5.1 | duarteNunezBetancourt2020 lines 271–283; nashModificationNotes2024 lines 394–407 | operators `(1/α!)δ^α`, inverse matrix, `R^p`-linearity |
| 6.1 | castilloDuarteLeytonLiendo2026 lines 20–21; gonzalezSprinberg1982 lines 60–69; stacksNormalization lines 6498, 6521 | Nash blowup followed by normalisation; 035N, 035P |
| 6.4 | nashModificationNotes2024 lines 515–517; stacksNormalization line 6636 (0H7D) | normalisation is an isomorphism iff the scheme is normal |
| 7.2 | castilloDuarteLeytonLiendo2026 lines 58–67 | items (i)–(iii) and the consequence; propagation is the roadmap's own step |

Also read for the repairs: nobile1975 lines 129–133 (Remark 2), castilloDuarteLeytonLiendo2026 lines 33–35, duarteNunezBetancourt2020 line 127 (Definition 2.1), line 256 (Theorem 3.10), nashModificationNotes2024 lines 105–112 and 362–364. No locator is flagged unverified by the author. All fifteen manifest entries have keys, no local path, and the five paywalled entries stay `uncertified`; no source was fetched and `needs-references.toml` was not created.

**Supplier-order audit.** Gate output:

```
candidate: NashBlowups is not in the merge order yet; checked as if placed after DeformationAndDerivedPatchingAlgebra (the intake inserts it when its design is accepted)
depcheck: 227 roadmaps, 2055 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. Citations resolved again at the heads of this run:

- AlgebraicModuliForArithmeticGeometry (open new-roadmap pull request, earlier in the order): `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md:610` §1.3 `coherentGrassmannian` (arbitrary `S`, finite-type quasi-coherent `E`, classifying maps, base change, `Gr_1 = P(E)`, properness over `Spec R`), `:663` `plucker`; `:8675` §5.4 `DMNormalization.stack` (agreement with `Scheme.Hom.normalization` of the generic points, lifting, isomorphism for normal `X`, smooth charts), `:8701` `.finite`, `:8711` `DMSchematicClosure.stack` (flat base change). Its normalisation is for locally Noetherian objects; every use here is of finite type over a field.
- SchemeAndStackFoundations (main): §0.7 `:923`, §0.11 `:1129` (`field_extension_descent` `:1131`), §0.17 `:1310`, §0.23 `:1634` with the name mapping at `:1651`, §0.30 `:2050`, §4.11 `:5820` (`IsModification.Witness` `:5833`), §4.13 `:5945` (`regularLocus_eq_smoothLocus` `:5970`, mapping `:6000`).
- EnhancedDerivedSheaves (main) §E1.6 `:689`, `isRegular_of_frobenius_flat` `:800`. DiophantineApproximationAndTranscendence (main) §5.6 `:3555`, `lieDerivativeOneForm` `:3692`.
- DerivedDeRhamCohomology (open) §0.23 `README.md:451`, the two-way p-basis statement `:460`; `Suggested.lean:53` `IsPBasis`, `:64` `pBasis_kaehler_basis`. DeformationAndDerivedPatchingAlgebra (open) §3.14 `README.md:832`, F-finiteness `:836`.

**Pins opened this round** (Mathlib and Tau Ceti at the pins of `plan.json`). Mathlib: `Morphisms/Smooth.lean:291, 300, 320, 333, 361`; `Geometrically/Reduced.lean:44`; `IdealSheaf/Subscheme.lean:661, 706`; `IdealSheaf/Basic.lean:844`; `Morphisms/ClosedImmersion.lean:206, 409`; `Morphisms/Separated.lean:289`; `Normalization.lean:371, 576`; `FieldTheory/TranscendentalSeparable.lean:72, 76`; `Morphisms/FiniteType.lean:112`; `Topology/JacobsonSpace.lean:105`; `Morphisms/UniversallyInjective.lean:106`; `Kaehler/TensorProduct.lean:238`; `Kaehler/Basic.lean:801, 869`; `LocalRing/ResidueField/Basic.lean:33`; `Etale/Field.lean:98`. Tau Ceti: `Modules/Differentials/Basic.lean:101`, `Quasicoherent.lean:96, 146`, `Restriction.lean:157`, `LocallyFree.lean:54`, `Rank.lean:74`; `Morphisms/Smooth/RelativeDimension.lean:94`, `Regular.lean:43`, `Locus.lean:46, 53`; `Topology/PureDimension.lean:52` (every irreducible component of dimension `d`; no nonemptiness); `Scheme/KrullDimension.lean:263`; `IdealSheaf/VanishingIdeal.lean:99`; `Blowup/IdealSheaf.lean:124, 191`, `UniversalProperty.lean:297, 372`, `ExceptionalDivisor.lean:203`; `Sheaf/ExteriorPower/Basic.lean`; `Normalization/IsIso.lean:114`; `Scheme/Normal.lean:84, 203`; `Morphisms/Modification/Basic.lean:53` (proper, dense open with dense preimage, no integrality); `Depth/Bijectivity.lean:120` (no finite-source hypothesis; Noetherian ring); `Kaehler/Conormal.lean:55, 76`. Every name cited in the supplier contracts exists where cited.

**Duplication and ownership.** `roadmaps grep` over main and the indexed open heads for: Nash blow, Nash modification, 0C3M, geometrically normal, Seidenberg, differential ideal, lieDerivative, Gauss map, 0B8X, p-monomial. No Nash construction, no normality-ascent along separable extensions, no derivation-stable-prime lemma and no general-algebra Lie derivative is owned elsewhere; the field-case Lie derivative, p-bases, F-finiteness, Grassmannians and normalisation are imported. Pinned libraries searched for `GeometricallyNormal` and `lieDerivative`: none. The overlap file lists no pull request changing this roadmap, no dropped or revision-only id; the closest roadmaps (SchemeAndStackFoundations revisions, DirectSummandsAndBigCohenMacaulay, PurityOfBranchLocus) own none of these objects. The open-pull-request list and the board-packages index contain no other Nash package.

**Shape.** Summary, Scope and ownership, Conventions, supplier contracts, How to read the build, eight layers each ending in Examples and Dependencies, consumers, references. The eight definitions (0.1, 0.3, 1.2, 2.1, 2.7, 4.2, 6.1, 7.1) each have an API list and at least three Checks; every theorem has hypotheses and a locator; `plan.json` parses, 37 targets, all `target:` prerequisites resolve, baseline equals the manifest pins. Layers are named by their mathematics and ordered by their dependency lines (Layers 4 and 5 both start from §4.1; 6 needs 2, 4, 5; 7 needs 2 and 6); no sentence follows a source. No process words, pull-request numbers, machine paths or LaTeX delimiters in the roadmap text.

**Headlines.** §2.5 triviality criterion, §4.5 Nobile, §5.4 Duarte–Núñez-Betancourt, §6.4 normalised criteria, §7.3 never-resolves. None is statable at the pins (the scheme Grassmannian and the Nash blowup are absent); the package docstring must say so for each. There is no `Suggested.lean` at the design stage, so there are no declarations for the padding probe, the `#check` comparison or the import check.

## Not verifiable

- Lean elaboration: not available (this lane does not elaborate). No Lean command was run; there is no `Suggested.lean` to elaborate.
- `hironaka1983`, `spivakovsky1990`, `semple1954`, `teissier1982`, `ega1`: settled uncertified background texts, not opened.
- Journal numbering of duarteNunezBetancourt2020 and castilloDuarteLeytonLiendo2026: the locators are bound to the arXiv versions read, as the manifest says.
- Ownership against open pull requests rests on the supplied index of open heads.

## Source issues

- **Misprint** in nashModificationNotes2024 at Theorem 5.1, printed p. 10: the source says the Nash map of a normal variety is an isomorphism exactly when the variety is singular; it should be nonsingular; affects a stated result.
- **Misprint** in nashModificationNotes2024 at Theorem 6.2, printed p. 13: the source says the normalised map is an isomorphism exactly when X is an isomorphism; it should be exactly when X is nonsingular; affects a stated result.
- **Gap** in nashModificationNotes2024 at Section 3, printed p. 6: the source says every morphism with a rank-d quotient factors through the closure; it should require a reduced source with dense preimage of the open; affects a stated result.
- **Misprint** in nashModificationNotes2024 at Section 1, printed p. 3: the source says the closure of the graph is taken in the Grassmannian; it should be in the product of X with the Grassmannian; affects nothing.
- **Misprint** in hamann2003 at Lemma 0.1 proof, printed p. 2: the source says the radical J is the annihilator of an element outside J; it should be that P is the ideal quotient of J by such an element; affects the proof.
- **Misprint** in castilloDuarteLeytonLiendo2026 at Introduction, printed p. 1: the source says the normalised Nash blowup is the pair with the map η followed after ν; it should be ν applied after the normalisation map η; affects nothing.
- **Misprint** in duarteNunezBetancourt2020 at Theorem 3.10 proof, printed p. 6: the source says the second sum for δ_t(x_j) uses coefficients indexed by k; it should be indexed by t; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "63c2853a11113a661fb5c933a4144387d99a0de5", "job": "REV-DESIGN-NashBlowups~5", "model": "fable", "worker": "chris-l"} -->

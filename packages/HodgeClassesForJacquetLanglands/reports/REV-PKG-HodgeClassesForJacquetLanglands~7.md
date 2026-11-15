<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13148#issuecomment-6900887720 -->
Review (claude) of cdccd95

Verdict: needs_changes

1. **F01** (P2) EndoscopicTransferAndUnitaryTraceComparison §1.8 does not state the dual group it is cited for

   **Location.** `packages/HodgeClassesForJacquetLanglands/README.md:2302–2304` (§9.1): "For the unitary
   similitude group of §8 the dual group is `GL₄(ℂ) × ℂ^×`, with the nontrivial element of `Gal(E/F)`
   acting by `θ̂(g, ν) = (θ₄(g), ν·det g)` (EndoscopicTransferAndUnitaryTraceComparison §1.8; …)". Also
   lines 98–99 (Scope), 468–469 (supplier contract), 2322 (*Needs:* of §9.1) and 2425 (Dependencies of
   Layer 9).

   **Claim.** The supplier's §1.8 gives the dual group, with its Galois action, of the unitary
   similitude group `GU_E(V)` over `F` and of `G̃ = Res_{F/ℚ}GU_E(V)` used in §§9.1–9.2.

   **Witness.** `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:414` (open head):
   §1.8 treats the group over `ℚ` with `ℚ`-valued multiplier for `F = F⁺F₀`, `F₀` imaginary quadratic,
   with dual `ℂ^× × ∏_σ GL_N(ℂ)`. For `F = ℚ(√2)`, `E = F(i)`: dimension `1 + 2·16 = 33`, against
   `(GL₄(ℂ) × ℂ^×)²`, dimension `34` (IP23 line 4177).

   The two agree only for `F = ℚ`, where `d < n = 1` forces `d = 0`. A CM field `E` that contains no
   imaginary quadratic field (allowed by §10.2) is outside §1.8 altogether. The object is nevertheless
   owned: ReductiveGroupsPartII §RG2.5.1 (line 6725 on main) gives the dual based root datum with its
   Galois action for every connected reductive group, and §RG2.5.2 (line 7088, *dual-of-weil-restriction*)
   gives `Ĥ = ∏_τ Ĝ′` with the induced action for `H = Res_{K′/K}G′`.

   **Exact repair.**

   1. §9.1, first sentence. Replace by: "Prove that the dual group of `G = GU_E(V)` over `F` is
      `Ĝ = GL₄(ℂ) × ℂ^×`, with `Γ_E` acting trivially and the nontrivial element of `Gal(E/F)` acting by
      `θ̂(g, ν) = (θ₄(g), ν·det g)`, `θ₄` the pinned outer automorphism of `GL₄`, and that the dual group of
      `G̃ = Res_{F/ℚ}G` is `Ĝ^{Σ_∞}` with the induced action (ReductiveGroupsPartII §§RG2.5.1–RG2.5.2;
      IP23, §11.5, p. 91). *Proof route:* over `E`, `g ↦ (g, ν(g))` identifies `G_E` with `GL₄ × 𝔾_m`;
      on the characters `e₁, …, e₄, e₀` of its diagonal torus the conjugation is `e_i ↦ e₀ − e_{5−i}`,
      `e₀ ↦ e₀`, whose transpose on cocharacters is `f_i ↦ −f_{5−i}`, `f₀ ↦ f₀ + f₁ + f₂ + f₃ + f₄`."
   2. §9.1, Checks. Add: "The similitude coordinate is one per real place. For `F = ℚ(√2)` the dual
      group of `G̃` is `(GL₄(ℂ) × ℂ^×)²`, of dimension `34`; the unitary similitude group over `ℚ` with
      rational multiplier has dual `ℂ^× × GL₄(ℂ)²`, of dimension `33`, and is a different group."
   3. Line 2322 and line 2425: delete "EndoscopicTransferAndUnitaryTraceComparison §1.8".
   4. Lines 98–99: replace "with the unitary similitude dual group of
      EndoscopicTransferAndUnitaryTraceComparison §1.8" by "including the `L`-group of a Weil
      restriction; the dual group of `GU_E(V)` over `F` is computed from them in §9.1".
   5. Lines 464–469: remove EndoscopicTransferAndUnitaryTraceComparison from the heading and delete its
      sentence; add to the §RG2.5.2 clause "with the `L`-group of a Weil restriction, `Ĥ = ∏_τ Ĝ′` with
      the induced action".

   **Repair test.** On the refuting instance `F = ℚ(√2)`: §RG2.5.2 gives `∏_τ Ĝ = (GL₄(ℂ) × ℂ^×)²`,
   dimension 34, as IP23 has. The transpose computed above sends the dual torus coordinate `ν̂` to
   `ν̂·s₁s₂s₃s₄` and `s_i` to `s_{5−i}⁻¹`, which is `(θ₄(g), ν·det g)` on the torus, the formula of
   IP23 line 4175. ReductiveGroupsPartII is on main, so no dependency is added.

2. **F02** (P3) The negative control of §1.4 is false for alternating forms

   **Location.** `packages/HodgeClassesForJacquetLanglands/README.md:1035–1036`: "For `σ = id` and a
   non-symmetric bilinear form the identity fails: the Hermitian hypothesis is necessary."

   **Claim.** With `σ = id`, `L∘L = vol` fails as soon as the form is not symmetric.

   **Witness.** Standard symplectic form on `ℚ⁴` (`H(e₁,e₂) = H(e₃,e₄) = 1`, alternating),
   `d_U(e₁₂₃₄) = −1`: `L(e₁₂) = −e₃₄`, `L(e₃₄) = −e₁₂`, `L(e₁₃) = e₁₃`; `L∘L = 1 = det/1 = vol`. The
   alternating Gram matrix with rows `(0,1,2,3), (−1,0,4,5), (−2,−4,0,6), (−3,−5,−6,0)` gives
   `L∘L = 64 = det`.

   In general `L∘L = det(A)·⋀²(A⁻ᵀA)` for the Gram matrix `A`, and `⋀²(−1) = 1`. No instance is given in
   the Check, so it cannot be evaluated as written.

   **Exact repair.** Replace the bullet by: "Some symmetry is needed. For `σ = id` and the bilinear form
   with Gram matrix `1 + E₁₂` (`H(e₁, e₂) = 1`, `H(e₂, e₁) = 0`, `H(e_i, e_i) = 1`) and
   `d_U(e₁₂₃₄) = −1`, the volume is `1` but `L(L(e₁₃)) = e₂₃`. Symmetry up to sign suffices for the
   identity itself: for an alternating form `L∘L = det[H(b_i, b_j)]/c²` still holds, because `⋀²` does
   not see the sign."

   **Repair test.** Computed with exact rational arithmetic from the defining identity: for `1 + E₁₂`,
   `det = 1` and the column of `L∘L` at `e₁₃` is `e₂₃` (and at `e₂₃` it is `−e₁₃ + e₂₃`), so the
   identity fails; the symmetric matrix with rows `(2,1,0,3), (1,5,7,0), (0,7,1,1), (3,0,1,4)` gives
   `L∘L = −11 = det`.

3. **F03** (P3) §10.1 cites IP23 §10.2 for the representation `τ`, which is in §10.4

   **Location.** `packages/HodgeClassesForJacquetLanglands/README.md:2441–2442`: "contains `τ`,
   antiholomorphic above `Σ` and holomorphic outside `Σ` (IP23, §12.2.4, pp. 96–97; §10.2, pp. 65–66)".

   **Claim.** IP23 §10.2, pp. 65–66, describes `τ` and the norm-image subgroup.

   **Witness.** IP23 line 2833: §10.2 is "Weil representations" (polarizations and the three Weil
   representations). `τ`, with weights `−k_v − 1` above `Σ` and `k_v + 1` elsewhere, and
   `H(𝔸)⁺ = {ν(h) ∈ N(𝔸_E^×)}` are IP23 lines 3008–3014: §10.4, p. 68.

   **Exact repair.** Write "(IP23, §12.2.4, pp. 96–97; §10.4, p. 68)". The manifest's locator for IP23
   already covers §10 as a whole and needs no change.

4. **F04** (P3) Tau Ceti's conjugate Hodge star is not cited

   **Location.** `packages/HodgeClassesForJacquetLanglands/README.md:185–187`: "the Hodge star needs a
   bijective bilinear form. Neither accepts a conjugate-linear form: that is the content of
   §§1.3–1.4." Also lines 43–48 (Scope) and the `From Tau Ceti` list (lines 201–222).

   **Claim.** The pinned libraries have no conjugate-linear Hodge star, so §§1.3–1.4 have no library
   special case to cite.

   **Witness.** `TauCeti/Analysis/InnerProductSpace/HodgeStar/Complex.lean:125`,
   `Orientation.barHodgeStar : ℂ ⊗[ℝ] ⋀[ℝ]^k V →ₗ⋆[ℂ] ℂ ⊗[ℝ] ⋀[ℝ]^l V`, and line 143,
   `barHodgeStar_barHodgeStar`: its square is `(−1)^(k*l)`.

   For `E = ℂ`, `U = ℂ ⊗_ℝ V` with `V` oriented Euclidean of dimension four and `H` the sesquilinear
   extension, the module documentation gives `α ∧ barStar β = h(β, α) vol`, which in degree `(2,2)` is
   the defining identity of `IsExteriorStar` for `d_U(vol) = 1`. The three Lean targets are not
   instances of it (arbitrary field and endomorphism, indefinite or degenerate form, no real structure),
   so nothing is deleted.

   **Exact repair.**

   1. Add to `### From Tau Ceti`: "`Orientation.barHodgeStar` and `Orientation.barHodgeStar_barHodgeStar`
      (`TauCeti/Analysis/InnerProductSpace/HodgeStar/Complex.lean`): the conjugate-linear Hodge star on
      the complexified exterior powers of an oriented real inner product space, with square
      `(−1)^{kl}`. The operator `L` of §1.3 differs in allowing any field with a ring endomorphism and
      any sesquilinear form, indefinite or degenerate, with the volume as the square."
   2. Line 187: replace "Neither accepts a conjugate-linear form" by "Neither accepts a
      conjugate-linear form, and Tau Ceti's `Orientation.barHodgeStar` covers only the positive
      definite form of a complexified real space".
   3. §1.3, Checks, add: "For `E = ℂ`, `U = ℂ ⊗ ℝ⁴` with the standard positive form and
      `d_U(e₁₂₃₄) = 1`, `L` is Tau Ceti's conjugate Hodge star, and with `d_U(e₁₂₃₄) = −1` its negative;
      in both cases `L∘L = 1 = (−1)^{2·2}`."

   **Repair test.** For `H = diag(1,1,1,1)`, `d_U(e₁₂₃₄) = −1`: `L(e₁₂) = −e₃₄` (README line 1013), and
   the real star gives `⋆e₁₂ = e₃₄`, so `L = −barStar`; `L∘L = 1 = vol`.

Four findings: one P2 and three P3. All three findings of round 6 are repaired, and the passages the
repair added (the fibre condition of §0.2, its three new Checks, the rewritten gap contract, the
AutomorphicBundles supplier subsection) survive the adversarial pass. `Suggested.lean` elaborates
with `sorry` as the only warning and none of its theorems is padding. The blocking finding is a
supplier citation in Layer 9 that the supplier does not state for the group of this roadmap; the
three others are a Check that is false on alternating forms, a locator slip, and a pinned Tau Ceti
declaration the README should cite.

## Verified sound

### Round 6 findings, checked first

| Round 6 finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P2): coefficient local systems owned twice | Lines 28–30: "It also owns the cohomology of compact Shimura varieties with automorphic coefficient systems as compatible realizations". Lines 93–96 defer the local systems to "AutomorphicBundles §§0.1–0.2, 3.4, 3.5, 3.7 and 3.8". Lines 594–598 cite §3.4. The downstream paragraph (lines 2660–2666) no longer names an earlier roadmap. | **Repaired.** AutomorphicBundles is line 183 of the order, this roadmap line 290. Its §§0.1, 0.2, 3.4, 3.5, 3.7, 3.8 exist at its head (lines 418, 464, 1424, 1464, 1552, 1576) with the six names cited. |
| F02 (P2): the quotient by `G(ℚ)Z(ℝ)°` | Lines 259–260: "from the discrete decomposition, at each level `K`, of `L²` of the compact space `G(ℚ)A_∞∖G(𝔸)/K = ⊔_g Γ_g∖G(ℝ)¹`". Lines 268–271 say why the two other quotients are not used. | **Repaired**, and the repair's own change (dividing by `A_∞`, not `Z(ℝ)°`) is right: see the table. |
| F03 (P3): two ClassFieldTheory names | Lines 447–448: "`sumLocalInv_brLocalization_eq_zero`, `brLocalization_injective`". | **Repaired.** Both are in `TauCeti/NumberTheory/ClassFieldTheory/Global/Brauer/SumFormula.lean`; the roadmap's table maps the old names (main, lines 301–302). |

The repaired patterns were searched in the rest of the package. No other passage claims that
factoring through `G/Z_s` gives trivial action of central units; §0.3 needs no new hypothesis (a
stabilizer at a neat level maps into the central group of the target, which acts trivially). No
other quotient by `Z(ℝ)°` occurs. No other old ClassFieldTheory name occurs. One further supplier
citation of the same kind as F01 (a supplier cited for more than it states) was found: R01.

### Computed adversarial table

Basis of `⋀²` is `e₁₂, e₁₃, e₁₄, e₂₃, e₂₄, e₃₄`; `ε = 1 + √2`.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §0.2 fibre condition needed | `T = Res¹_{ℚ(∛2)/ℚ}𝔾_m`, `ρ = σ₁` | `(u+1)³ = 2` gives `u³+3u²+3u−1`, norm `1`; character module of rank 2, irreducible for `S₃`; `T(ℝ) = {(a,z) : a·zz̄ = 1} ≃ ℂ^×`, real split rank 1, rational 0; `Z_s = 1`; `σ₁(u^m) = (∛2−1)^m ≠ 1` | Check correct |
| §0.2 equal ranks suffice | torus split by a CM field | conjugation central; quotient cocharacters are the `−1` part plus the invariants, so both split ranks equal the rank of the invariants; Mil17 Theorem 5.26 then gives discreteness; a neat level kills the finite image | holds |
| §0.2 equal ranks, non-example | cubic torus above | ranks `(0, 1)`: no rational character, `T(ℝ)` not compact | not discrete, as stated |
| §0.2, `K(3)` torus Check | `Res_{ℚ(√2)/ℚ}𝔾_m` | `ε² ≡ −√2`, `ε⁴ ≡ −1 mod 3`, order 8 of 8 units: one point; `−ε⁴ ≡ 1`, signs `(−,−)`, shift `8 log ε` | `(dim H⁰, dim H¹) = (1, 0)` |
| §0.2 not Hausdorff | same torus | `(1,1;ε^{2m}) = ε^{2m}·(ε^{−2m}, ε′^{−2m})_∞`; a limit `(1,1;u)` forces a totally positive unit `q = u`, so `u ∈ ε^{2ℤ}` | Check correct |
| Gap: spectral space | same torus, `K(3)` | `T(ℝ)¹` is four lines; `−ε⁴` pairs them: two circles of length `16 log ε`, exchanged by `(1,−1)`; invariants of dimension 1 | equals `dim H⁰` |
| Gap: compact part of `Z(ℝ)°` | `Res_{ℚ(i)/ℚ}𝔾_m`, `h(z) = z`, `ρ = σ₁`, neat `K` | units in `K`: none but 1; cochains transform by `z⁻¹`; `|N|^{1/2}` is `|z|`; product `|z|/z`, nontrivial on the circle; a `Z(ℝ)°`-invariant space gives 0 against `#Sh_K ≥ 1` | `A_∞` is the right quotient |
| Gap: twist | weight `λ` of `A_∞`, `χ|A_∞ = Nλ` | `φ(ga) = λ(a)⁻¹φ(g)` and `|χ(a)|^{1/N} = λ(a)`, so the product is unchanged by `a`; `|χ|` is trivial on `G(ℚ)` by the product formula | `A_∞`-invariant |
| Gap: `Γ_g ⊂ G(ℝ)¹` | `γ ∈ G(ℚ) ∩ gKg⁻¹` | `|χ(γ)|_p = 1` for all `p`, so `|χ(γ)|_∞ = 1` | holds |
| §0.3 degree formula | `K(9) ⊂ K(3)` | order of `ε` mod 9 is 24 of 72 units, `ε¹² ≡ −1`: 3 points; index 9; degree 3 | `3·(1/3) = 1` |
| §0.6 types | `d = 2`, weights `(2,2)` and `(2,4)` | `(2,0),(1,1),(1,1),(0,2)`; `(1,0)+(2,−1) = (3,−1)`, `(1,0)+(−1,2) = (0,2)`, `(2,0)`, `(−1,3)` | Checks correct |
| §1.2 | scalar `α`; `diag(i,1,1,1)` on the unit form | `N(α⁴) = N(α)⁴`; `ν = 1`, `det = i`, `N(i) = 1` | holds; `det ≠ ν²` possible |
| §1.3 basis list | `diag(2,3,5,7)`, `d_U(e₁₂₃₄) = −1` | images `−6e₃₄, 10e₂₄, −14e₂₃, −15e₁₄, 21e₁₃, −35e₁₂` | list correct |
| §1.4 headline | that diagonal form; a non-diagonal symmetric form | `L∘L = 210 = 2·3·5·7`; `−11 = det` | true |
| §1.4 Check 3 | alternating forms; `1 + E₁₂` | `L∘L = det` (1 and 64); `L(L e₁₃) = e₂₃` | **R02** |
| §1.5 negative control | `diag(i,1,1,1)` | `L e₁₂ = −i e₃₄`, `L e₃₄ = −e₁₂`; `b(Le₁₂,e₃₄) = σ(−i)·i = −1`, `b(Le₃₄,e₁₂) = 1` | Check correct |
| §1.7 headline | `g = t`, scalar | `ν = t²`, `det = t⁴`, factor `ν²/det = 1`, `⋀²t = t²` | consistent |
| §2.7 | `U₃ ⊥ U₄` | `L` exchanges `⋀²U₃` and `U₃ ⊗ U₄` (the diagonal list: `e₁₂ ↔ e₃₄`, `e₁₃ ↔ e₂₄`, `e₂₃ ↔ e₁₄`) | `Wj = ⋀²U₃` |
| §3.2 | `(z, z, N(z))`; `t₁ = t₂ = 1` | `(N(z)², N(z)², N(z)²)`; `(1, ν, ν)` | Checks correct |
| §8.1 | `ω_σ = ξ_E` | `As⁺∘BC = Sym² ⊕ (⋀² ⊗ ξ_E)`, `⋀²σ ⊗ ξ_E = 1` | `L(Sym²σ)·ζ_F`, pole at 1 |
| §9.1 dual group | `G_E ≃ GL₄ × 𝔾_m` | characters `e_i ↦ e₀ − e_{5−i}`; dual `ν̂ ↦ ν̂·∏s_i` | formula right; citation wrong: **R01** |
| §9.1 | `d = 0, 1` | dimensions 1, 6; `ν` acts by `ν⁻¹` | Checks correct |
| §9.2 lowest line | `W_{±1} = ρ_E|·|^{∓1/2}` | `⋀²W₋₁ ⊗ |·|⁻² = |·|^{1−2}`; `(|·|⁻¹)^{⊗d}|·|^d = 1` | trivial after twist `(d)` |
| §9.3 | `c` unramified; `c = log χ` | `H¹_f(K, ℚ_ℓ)` of dimension 1; `H¹_g/H¹_f` dual to `D_cris(ℚ_ℓ(1))^{φ=1} = 0`; `log χ` is not Hodge–Tate-split | iff holds |
| §10.1 | `k_v = 2` | auxiliary weight 3, odd | consistent with §7.1 |
| §§10.7–10.9 headlines | `d = 0`; `d = 1`, weight 2 | rank one of type `(0,0)`; types `(1,0)+(0,1)` paired into `(1,1)`, `(0,0)` after `(1)`; weight `d + d − 2d = 0` | consistent with §§0.5–0.7 |

The rows of round 6 that carry computed values (§§1.1, 1.8, 2.1–2.6, 3.3–3.5, 4.2–4.5, 5.2–5.3,
7.4–7.9, 8.6–8.7, 9.4, 10.2, 10.6) are relied on for text no repair touched.

### Seeded source sample

No locator in the manifest is flagged unverified. All 15 targets were read against the text.

| Target | Evidence read | Result |
| --- | --- | --- |
| 0.2 | IP23 lines 680–706 (§2.2.2, p. 16); Mil17 lines 2792–2807 (Theorem 5.26, Remark 5.27, p. 64) | Agrees; the fibre condition and the reading relative to `K_h` are the README's additions, marked as such. |
| 0.3 | IP23 lines 707–738 (§2.2.3, Remark 2.2, pp. 16–17); Mil17 lines 2819–2834 (p. 65) | Agrees. |
| 0.6 | IP23 lines 832–857 (§3.3, Theorem 3.2), 4513–4523 (Proposition 12.3, p. 98) | Agrees. |
| 1.2 | IP23 lines 1086–1121 (Proposition 5.1, (5.1)–(5.3), pp. 25–26) | Agrees. |
| 1.3 | IP23 lines 1147–1171 (§5.2, pp. 27–28), 1201–1212 (p. 29) | Agrees, signs included. |
| 1.4 | IP23 lines 1175–1213 (Definition 5.2, Proposition 5.3, pp. 28–29) | Agrees; the source assumes a nondegenerate Hermitian form, the README proves more. |
| 2.7 | IP23 lines 1539–1562 ((5.16), Proposition 5.15, pp. 37–38) | Agrees. |
| 3.2 | IP23 lines 1706–1733 (Lemma 6.1, p. 41) | Agrees. |
| 6.5 | IP23 lines 2624–2640 (Proposition 9.5, p. 61), 2770–2803 (§9.5.4, p. 64) | Agrees. |
| 7.10 | IP23 lines 3065–3128 (§10.5, Proposition 10.1, pp. 70–71), 3476–3509 (pp. 77–78) | Agrees: `2^n` signs, the three conditions at `v₀`. |
| 8.1 | IP23 lines 3603–3630 ((11.1), Lemma 11.1, p. 80), 3971–3985 (p. 86) | Agrees. |
| 9.1 | IP23 lines 4157–4215 (§11.5, pp. 91–92) | Agrees with the source; the supplier citation is R01. |
| 9.3 | IP23 lines 4133–4148 (Remark 11.10, p. 90) | Agrees. |
| 10.1 | IP23 lines 4451–4461 (§12.2.4, pp. 96–97), 3008–3014 (§10.4, p. 68) | Statement agrees; the second locator is wrong: R03. |
| 10.8 | IP23 lines 4293–4300 (Definition 12.1), 4533–4564 (Theorem 12.4(ii) and proof), 843–856 (Theorem 3.2(ii)) | Agrees. |

### Lean acceptance test

- `lake env lean` on `packages/HodgeClassesForJacquetLanglands/Suggested.lean`, from the content
  checkout: exit 0; the output is three `declaration uses 'sorry'` warnings, at lines 70, 81 and 95.
  The single import is `Mathlib`; no `set_option`, no `lemma`, no sorry'd data.
- `#check @name` for the four declarations in a scratch copy: the types are those of
  `scratch/signatures.md`; each keeps `[FiniteDimensional E U]`, `σ`, `vol`, `hkl`, and `comp_self`
  keeps `hH` and `b`, `map_similitude` keeps `g`, `ν`, `hg`. They agree with §§1.3, 1.4, 1.7.
- One-tactic probe on all three theorems, in one scratch copy, with
  `first | simp [IsExteriorStar] | rfl | infer_instance | aesop | simp_all [IsExteriorStar]`: the
  first and third fall through to `sorry`; on `comp_self` `simp_all` stops with a recursion-depth
  error. None closes. No padding.
- Headlines from the Summary: the Hodge class (§10.7), the conditional all-`ℓ` statement (§10.8),
  the weight-two correspondence (§10.9) and the exceptional isomorphism as algebraic groups are
  named in the docstring with the missing carriers, as are §§6.5, 7.10, 8.8, 4.5–4.6, 9.4. The
  statable ones (§§1.3, 1.4, 1.7) are stated. No statable headline is absent.
- The four backticked names of the roadmap's own in the README are the four declarations.

### Library declarations opened at the pins

| Declaration | File and line |
| --- | --- |
| `exteriorPower.wedgePairing`, `Module.Basis.topVector`, `isUnit_apply_topVector`, `instIsPerfPairWedgePairing` | `Mathlib/LinearAlgebra/ExteriorPower/WedgePairing.lean:42`, 78, 92, 130 |
| `exteriorPower.hodgeStar`; `LinearMap.BilinForm.exteriorPower` | `Mathlib/LinearAlgebra/ExteriorPower/HodgeStar.lean:48`; `BilinForm.lean:34` |
| `MvPolynomial.funext`; `groupCohomology.H1ofAutOnUnitsUnique` | `Mathlib/Algebra/MvPolynomial/Funext.lean:83`; `Mathlib/RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean:107` |
| `TauCeti.BrauerGroup.quaternionClass_mul`; `tensorAlgEquivTensorMatrix` | `TauCeti/Algebra/Quaternion/BrauerClass.lean:255`; `TensorProduct.lean:192` |
| `TauCeti.symPowerRep` | `TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean:57` |
| `HodgeStructureOn`, `tateTwist`, `internalHom` | `TauCeti/Geometry/Hodge/Structure.lean:62`; `Tate/Twist.lean:63`; `InternalHom/Basic.lean:271` |
| `IsCoveringMap.singularTransfer` | `TauCeti/AlgebraicTopology/Singular/Transfer/Basic.lean:179` |
| `Orientation.barHodgeStar`, `barHodgeStar_barHodgeStar` (not cited: R04) | `TauCeti/Analysis/InnerProductSpace/HodgeStar/Complex.lean:125`, 143 |

The five ClassFieldTheory names, `globalArtinMap` and
`localArtinMap_quadratic_eq_nontrivial_iff_not_norm` were found in
`TauCeti/NumberTheory/ClassFieldTheory/` (`Global/Brauer/SumFormula.lean`, `Exactness.lean`,
`Global/InvariantSum.lean`, `Global/Reciprocity.lean`, `Local/Quadratic.lean`).

### Supplier citations resolved

Every cited section was looked up this round, on main or at the supplier's open head.

- AutomorphicBundles §§0.1, 0.2, 3.4, 3.5, 3.7, 3.8 with `centralSplitQuotient`,
  `centralSplitQuotient_factor_iff`, `ineffectiveFibreDescent`, `bettiCoefficientLocalSystem`,
  `etaleCoefficientLocalSystem`, `realizationComparison`, `coefficientTensorHecke`. Its §0.1 carries
  the same cubic-torus Check; its scope does not own the cohomology, Matsushima or traces.
- ArithmeticLocallySymmetricSpaces §§ALS.0.4, 0.6, 3.6, 5b.1, 5b.4 (lines 1310, 1400, 2989, 4259,
  4385); AutomorphicSpectralTheory §§0.25, 0.26, 4.7 (`compact_quotient_spectrum`, line 2335, for a
  cocompact lattice in a real reductive group); AdelicAlgebraicGroups §§3.4, 4.3.
- ShimuraData §§3.1, 3.3, 3.10, 4.3, 4.9 (`Z_s(H)` and `H^c`, line 1018); ShimuraVarieties §§1.3,
  1.6, 4.2, 4.3, 4.9, 6.7, 8.1, 8.3, 8.5, 8.6, 8.7 with the seven names (the eight "found nowhere"
  leads of `scratch/citations.md` are these planned names and this roadmap's own
  `map_similitude`; the resolver now reports none).
- MetaplecticAutomorphicForms: all 28 cited sections and 14 names; §3.32a keeps the common split
  real place, §3.35 reads as transcribed with its `k = 3` Check.
- GL2AutomorphicRepresentationsAndTransfer §§R16.1.8, R16.4.4, R16.4.5, R16.6.3, R17.3.1,
  R17.3.5–R17.3.8, R17.4.2, R17.4.13 (line 2662), R17.4.16.
- MotivesAndAlgebraicCycles §§2.2, 2.3, 2.6, 2.7, 7.1, 7.15; AutomorphicFormsOnReductiveGroups
  §§2.6, 4.2, 5.1, 5.2, 5.4, 5.7; PadicHodgeTheory §§3.3, 4.4, 7.2, 8.1; PadicPeriodRings §1.4;
  SelmerIwasawaCohomology §§2.7, 4.9; AutomorphicLFunctionsAndLocalFactors §AL.3.6.3;
  GeometryOfNumbersAndQuadraticArithmetic §4.3 (`polynomial_fischer_decomposition`, line 1548);
  ComplexComparisonPartII C6; ArithmeticGaloisRepresentations §1.2.
- On main: ClassFieldTheory Layers 6–8, 10, 11, with the former §5.4 mapped to W.4 by its table (line
  276); ComplexKahlerGeometry K6.0, K6.1; AlgebraicTopology §§2.6, 5.3; EtaleCohomologyFoundations
  §§0.8, F.2.1, F.2.2, F.3; ReductiveGroups; ReductiveGroupsPartII §§RG2.5.1, RG2.5.2;
  GlobalNumberFields.
- EndoscopicTransferAndUnitaryTraceComparison §1.8 exists and does not state what it is cited for:
  R01.

No forbidden roadmap is cited.

### Declared gaps

The eight slugs agree between the README and `design/plan.json`, each with a named earlier supplier
and the heading form `What <Supplier> must provide (gap:<slug>)`. `shimura-matsushima-comparison`
is now precise (the three quotients are distinguished with instances) and minimal (the local system
is an input, defined by the descent the supplier already uses; no later roadmap is named). The other
seven are unchanged since round 6. Acceptance would be conditional on all eight; it is withheld for
the findings above.

### Dependency check

    depcheck: 244 roadmaps, 2256 edges, 0 problem(s)

There is no `UPWARD`, `CYCLE` or `moved:` line.

### Duplication and overlap

`IsExteriorStar` and `PGU_E`/`PGU_B` occur in no other roadmap, on main or at an open head. Four
open roadmaps cite the same article (AutomorphicFormsOnReductiveGroups, MetaplecticAutomorphicForms,
ModularityAndLanglandsExtensions, MotivesAndAlgebraicCycles) for inputs this roadmap imports from
them; none states the exterior construction, the nonvanishing, the purity or the end theorems.
ModularityAndLanglandsExtensions §3.21 is the general Adams–Johnson comparison, not the three
modules of §8.2, and §8.5 says its route does not use a global classification. `scratch/overlaps.md`
lists no conflicting head, no dropped id and no id that only a revision defines. The two other
packages on the board are on other subjects.

Overlap check: read MetaplecticAutomorphicForms, AutomorphicLFunctionsAndLocalFactorsPartII, ExceptionalThetaCorrespondencesForG2, ShimuraData, EndoscopicTransferAndUnitaryTraceComparison (open), AdelicAlgebraicGroups, SpinGeometry (main), the third list being empty, and also AutomorphicBundles; the coefficient local systems are AutomorphicBundles' and are cited; the unitary similitude dual group of §9.1 is not EndoscopicTransferAndUnitaryTraceComparison's (R01) and is computed here from ReductiveGroupsPartII; nothing else is shared.

### Shape, policy and copyright

75 numbered targets, 75 Checks blocks (each with at least three bullets, counted mechanically), 75
*Needs:* lines, 11 Examples and 11 Dependencies subsections. No pull-request number, date, round
label, machine path, HTML anchor, LaTeX delimiter, "optional" or "deferred" in the README or the
Lean file.

Wording: the 15 sampled passages and 6 further ones (the definition of `Z_s` in §0.2 against IP23
line 682, which is the literature's standard definition of some fifteen words; the route of §0.2
against p. 16; the docstring of `IsExteriorStar` against §5.2; §7.10's hypotheses against §10.5;
§9.2 against p. 93; the new Checks of §0.2 against Mil17 Example 5.25) were put beside the sources.
Nothing beyond formulas and standard definitions is shared.

Arrangement: IP23 has 118 of the 132 source locators. Its sections map to the layers as
`§§2–3, 4.1 → 0`, `§5 → 1–2`, `§§6, 7.2 → 3`, `§8 → 4`, `§§4.2–4.3, 12.2 → 5`, `§9 → 6`, `§10 → 7`,
`§§11.1–11.3 → 8`, `§§11.4–11.5 → 9`, `§12 → 10`: §5 and §11 are split, §§6–7 merged, §4 moved after
§8, the appendix left to a supplier. The order of Layers 3–10 is forced by the *Needs:* lines (§4.4
needs §3.1; §5.4 needs §§3.4, 4.1; §7.4 needs §6.2; §8.1 needs §§6.5, 7.10; §9.2 needs §8.1; §10.6
needs §§8.8, 10.4).

Reuse: the table under Worked examples is the roadmap's own form. No public formalisation with these
Lean names was found.

Source independence: 21 passages compared with 2 sources (IP23, Mil17), none shared; largest share IP23, 118 of 132 locators; contents compared with IP23: independent. Wal85 was not reopened this round.

## Not verifiable

- The supplier contracts and gaps were checked for existence, statement and ownership, not as
  proofs: none of the cited open roadmaps is formalised.
- The three Lean theorems have `sorry` bodies; they were checked by exact computation on the
  instances in the table, not by a proof.
- Wal85 was not reopened: no passage citing it changed since round 5 read it.
- IP23 Proposition A.14 (p. 113) was not reopened; its hypothesis was read through
  MetaplecticAutomorphicForms §3.32a, which restates it.

## Source issues

- **Misprint** in IP23 at §3.2, printed page 19: the source says the isotypic component is concentrated in degree `2d`; it should be degree `d`, the dimension of the quaternionic variety, as §12.2.10 uses; affects nothing.
- **Gap** in IP23 at Remark 2.2, printed page 17: the source says any Haar measures on the finite adelic groups make the pushforward independent of the levels; it should use volumes modulo the closure of the central rational points; affects a stated result.
- **Gap** in IP23 at §12.2.4, printed page 97: the source says the auxiliary representation is a summand of the restriction to elements of positive norm at infinity; it should restrict further to the norm-image subgroup of §10.4; affects the proof.
- **Gap** in IP23 at §2.2.2, printed page 16: the source says a representation trivial on the real-split, rationally anisotropic central torus gives a local system; it should also require central units of small levels to act trivially; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "cdccd9519590e65a800dba8a598fb384185e045c", "job": "REV-PKG-HodgeClassesForJacquetLanglands~7", "model": "fable", "worker": "chris-x90"} -->

<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12984#issuecomment-6849498161 -->
Review (claude) of e0b4ee2

Verdict: needs_changes

1. **F01** (P1) The polarization of the primitive parts has the wrong sign for odd `k`

   **Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:387`, §3.2: “`N` is a morphism `Ψ_λ → Ψ_λ(−1)` and the primitive parts are polarized by `Q(·, N^k ·)`”, with `N = (2πi)⁻¹ log T_u` and `T` the positive-loop transport (Conventions, line 49).

   **Claim:** With this roadmap's `T`, the form `Q(·, N^k ·)` satisfies the Hodge–Riemann positivity on the `k`-th primitive part.

   **Witness:** Tate curve `ℂ/(ℤ + ℤτ)`, `q = e^{2πiτ}`. Cycles `a = 1`, `b = τ`; the positive loop is `τ ↦ τ + 1`, so `T b = a + b`. On the dual basis `α, β` of `H¹`: `Tα = α − β`, `Tβ = β`, `(log T)α = −β`. The polarization is `Q(α, β) = 1`, since `i·Q(α + τβ, α + τ̄β) = 2 Im τ > 0`. Then `Q(α, (log T)α) = −1 < 0` on the type-`(1, 1)` primitive class, where positivity needs `> 0`.

   The same computation in the supplier's convention: `F¹(z) = ℂ(α + zβ)` gives `F¹(z + 1) = exp(N_j) F¹(z)` with `N_j α = β`, so `Q(α, N_j α) = +1`. ShimuraVarieties §3.5b.1 (heading at line 963 of its README at the open head) uses `Φ̃(z + e_j) = T_j Φ̃(z)`, `N_j = log T_j`; hence `T_j = T⁻¹` and `N_j = −2πi·N`. The README already records `T_j = T⁻¹` in the rank-three Check of §3.3, but §3.2 states the polarization with the roadmap's `N`, which is off by `(−1)^k` after the Tate twist absorbs `(2πi)^k`.

   **Exact repair:**

   1. In §3.2 replace “polarized by `Q(·, N^k ·)`” by “polarized by `Q(·, (−N)^k ·)`, with values in the Tate twist; equivalently by `Q(·, N_j^k ·)` for the operator `N_j = log T_j = −2πi·N` of ShimuraVarieties §3.5b.1, whose `T_j` is `T⁻¹`”.
   2. Add the Tate-curve computation above as a Check of §3.2 (it gives `−1` for `log T` and `+1` for `N_j`). The existing Legendre Check has `N² = 0`, `N ≠ 0` and does not see the sign.
   3. Same pattern elsewhere: §4.3 (“with the induced polarizations on primitive parts”) and its API bullet, and §5.3, do not write the form. State it once in §4.3 as the form that restricts, for a smooth variation on a punctured curve, to the one of §3.2, namely `ψS ∘ (id ⊗ (−N)^k)` for this roadmap's `N = −(x∂_x + α)`; Saito's sign in Sai88 5.2.10 is for his own `N` and is not copied without this check.
   4. Add one clause to the Conventions bullet “Specialization”: `N = −(2πi)⁻¹ N_j` for the `N_j` of ShimuraVarieties §3.5b.1.

   The repaired statement on the witness: `Q(α, (−log T)α) = +1 > 0`.

2. **F02** (P3) §8.1 uses the rigidity theorem 5.6 without listing it

   **Location:** `README.md:834`, §8.1: “An object `Π N` is classical exactly when the localized Fourier transform `(FT N)(∗0)` of 6.6 is a constant connection on `G_m` … *Needs:* 6.2, 6.3, 6.4, 6.6; 4.7; 5.3”; repeated in the Dependencies line 865.

   **Claim:** The criterion follows from 6.6 alone.

   **Witness:** 6.6 is an identity of underlying `D`-modules. It gives only that `Π N` has the `D`-module `(j_! O_{G_m})^r`; that the smooth Hodge module `j^* Π N` on `G_m`, with constant local system, is `a^* V[1]` is 5.6. FSY line 3164 invokes exactly this step.

   **Exact repair:** In the proof route write “the criterion from 6.6 and 5.6: if `(FT N)(∗0)` is constant, `Π N = j_! j^* Π N` with `j^* Π N` smooth on `G_m` with constant local system, hence `a^* V[1]` by 5.6, and `j_!(a^* V[1]) = I(V)`”. Add 5.6 to the `*Needs:*` line of 8.1 and to the Layer 8 Dependencies line. Layer 5 precedes Layer 8, so no cycle arises. Tested on `N = δ_0 ℚ`: `Π N = K = j_! pℚ_{G_m}`, `j^* K = a^* ℚ[1]`, `V = ℚ`, `I(ℚ) = K`.

3. **F03** (P3) Three locator slips

   **(a) Location:** `README.md:295`, §2.2: “(FSY, §2.1, Proposition 2.4 and its proof, pp. 10–11; Appendix A.1, p. 61)” for exactness, inversion with `r`, `FT(δ_a) = E^{at}` and `FT(O) = δ_0`.

   **Witness:** FSY line 441: Proposition 2.4 is the statement that the Kloosterman connection sits in degree zero; its proof (FSY lines 457–462) concerns the localized transform, which is §2.4's citation. FSY lines 2773–2779 give the definition and holonomic exactness only.

   **Repair:** In §2.2 cite FSY Appendix A.1, p. 61 (FSY lines 2773–2779) for the definition and exactness; cite MT, Appendix, p. 39 (MT lines 2104–2107) for the Weyl-algebra correspondence, noting that MT uses the kernel `E^{−tτ}`, so its signs are the opposite ones; and say that the inversion `FT_t FT_τ ≅ r_+` and the two cyclic identifications are computed in this target from the transported actions. Keep “Proposition 2.4 and its proof” in §2.4 only.

   **(b) Location:** `README.md:570`, §5.2: “(Sai90, Proposition 0.3, pp. 223–224; §4.5 …”.

   **Witness:** Sai90 lines 100–104: Proposition 0.3 is the gluing equivalence along a principal divisor. The weight statement of the introduction is Sai90 lines 166–171, printed p. 225.

   **Repair:** Replace “Proposition 0.3, pp. 223–224” in §5.2 by “Introduction, p. 225, Sai90 lines 166–171”. Keep Proposition 0.3 in §4.6, where it is the right locator. In `sources.toml`, add “Introduction p. 225” to the Sai90 locator.

   **(c) Location:** `README.md:726`, §6.6: “citing Katz, Proposition 12.3.5”.

   **Witness:** Katz's book is neither in `## References` nor in `sources.toml` (21 keys, none for Katz).

   **Repair:** Delete the clause “, citing Katz, Proposition 12.3.5”; the identity is proved in the target's own route (`FT K = O(∗0)`).

4. **F04** (P3) §12.5: the route applies Hochster's theorem to the wrong ring and “transfers” in the direction that fails in general

   **Location:** `README.md:1134`, §12.5 proof route: “the cone algebra … is Cohen–Macaulay by Hochster's theorem …; Kouchnirenko's comparison of its Newton-graded ring with the ring graded by the faces of `Δ` transfers the Cohen–Macaulay property”.

   **Claim:** Cohen–Macaulayness of `ℂ[C_Δ ∩ ℤ^n]` passes to its Newton-graded ring.

   **Witness:** A Cohen–Macaulay ring can have a non-Cohen–Macaulay associated graded ring: in `k[x, y]` with `I = (x⁴, x³y, xy³, y⁴)`, `J = (x⁴, y⁴)`, the element `x⁶y²` lies in `J ∩ I²` and not in `JI`, so `gr_I` has depth `< 2` (Valabrega–Valla).

   **Exact repair:** Rewrite the sentence as: “for every face `σ` of `Δ` not containing `0`, the semigroup of lattice points of the cone over `σ` is finitely generated and saturated in the group it generates, so its algebra is Cohen–Macaulay by Hochster's theorem (gap:normal-semigroup-cohen-macaulay); the Newton-graded ring is the ring in which `x^m · x^{m′} = x^{m+m′}` when `m, m′` lie in the cone over a common such face and `0` otherwise, and Kouchnirenko's exact complex of these face algebras gives its Cohen–Macaulayness (Kou, §2)”. The gap as declared already covers the lower-dimensional face semigroups; nothing else changes. On `φ = x + x⁻¹`: the faces are `{1}` and `{−1}`, the face algebras `ℂ[x]`, `ℂ[x⁻¹]`, and the graded ring `ℂ[x, y]/(xy)` is Cohen–Macaulay of dimension one, with `x − y` a nonzerodivisor and quotient of dimension `2 = 1!·vol[−1, 1]`.

Four findings: one P1 and three P3; one blocking. The three round-5 findings are repaired. `Suggested.lean` elaborates with `sorry` as its only warning, its one theorem is not padding, and the dependency check reports no problem. All findings concern `README.md` (R03 also touches two locator strings of `sources.toml`).

## Verified sound

### Round-5 findings

| Finding | Repaired passage (current README) | Status |
|---|---|---|
| F01 (P2), ambient boundary in admissibility | §3.3: “admissible relative to `S̄` when, for every holomorphic map `φ : Δ → S̄` with `φ(Δ^*) ⊂ S`, the pullback of `L` to `Δ^*` is admissible”; independence of the compactification; three locality bullets; the `A²` Check | Repaired. Recomputed: saturation `O(s e₀ + e₁)`, limit `F⁰` dimensions `(1, 0)` on `(gr_{−2}, gr_0)` against required `(0, 1)`; split control `(0, 1)`. Zariski-locality argument checked (a test disc meets `S̄ ∖ U_i` in a discrete set). |
| F02 (P1), `var_top = 2πi·var` | §1.4: “exactly when `var ∘ N_φ = 0`, in particular when `N_φ = 0`”; §4.2: “exactly when `x ∘ N_φ = 0`” | Repaired. Recomputed `j_!`: `var = B`, `var_top = 2πiB`, `N_φ = B ≠ 0`, `var∘N_φ = B² = 0`. `Rj_*`: `var = (2πi)⁻¹(1 − πiB)`, `var∘can = B`, `var∘N_φ = (2πi)⁻¹B ≠ 0`. `D/D(x∂_x)²`: `(x∂_x+1)∂_x = ∂_x x∂_x`, so `N_φ ∂m_1 = −∂m_0`, `x∘N_φ = 0`. |
| F03 (P3), impossible rank-one odd-weight piece | §3.3 and §4.6: the rank-three example `V = H ⊕ ℚe`, `F⁰(z) = span(a + ib, e − za)` | Repaired. Recomputed: `i·Q(a+ib, a−ib) = 2`; frame coordinates `exp(zJ)(e − za) = e`; forced `M_{−2} = 0`, `M_{−1} = H`, `M_0 = V`; `Ne = (2πi)⁻¹a ∉ M_{−2}`. The descent `F(z+1) = T⁻¹F(z)` is the correct one for this roadmap's `T`; the same observation is the source of R01. |

The repaired pattern of F02 (a necessary condition where only a sufficient one holds) and of F03 (unrealizable Hodge data) was searched for in the rest of the text; no further instance.

### Principles, shape, residue

No route-specific shortcut, re-planned roadmap, upward or cyclic supply, copied passage, algorithm, sorry'd data or `set_option`. 12 layers, each ending with Examples and Dependencies; 65 Checks blocks; every definition has an API and at least three Checks; layer titles are mathematical and the order is forced by the `*Needs:*` lines (Betti/RH → Fourier → variations → Hodge modules → operations → `Π` → Deligne filtration → classical embedding → pairs → `tg` → Fourier cohomology → Newton). No pull-request number, date, machine path, HTML anchor or LaTeX delimiter in README or Lean. `metadata.toml` is `topic = "math.AG"`. The former-numbering map resolves the ids H.0/…, H.1/… and P that EllAdicHomotopyTypesAndWeights and TopologicalMirrorSymmetryForHitchinSystems cite.

Remark, no change needed here: TopologicalMirrorSymmetryForHitchinSystems (open, later in the merge order) declares a gap on this roadmap (`gap:geometric-compact-mhs`, extension of the compact-support realization to separated varieties). It is that roadmap's contract; this README neither promises nor excludes it.

### Lean

`lake env lean` on `packages/MixedHodgeModulesAndIrregularHodgeTheory/Suggested.lean`, from the content checkout: exit 0, single diagnostic `Suggested.lean:146:8: warning: declaration uses sorry`. Imports: `import Mathlib` only. The 13 declarations match §§12.4 and 12.6; all binders are explicit, there is no section variable (elaborated signatures compared with the README: nothing changed).

One-tactic probe on the only sorried theorem, on a scratch copy: `simp`, `rfl`, `infer_instance`, `exact ⟨fun _ _ => le_rfl, inferInstance, rfl⟩`, `exact FiniteDimensional.of_finrank_pos`, `aesop`, and `simp` with all twelve definitions unfolded each fail (unsolved goals, not a definitional equality, not a class goal, instance synthesis failure). Not padding.

Headlines: 1.5, 3.4, 4.4/4.5/4.7/5.2, Layer 6, 7.5/7.6, 10.1/10.2, 11.2/11.3/11.6, 12.3/12.7/12.9 are each named in the module docstring with the missing carrier (algebraic `D`-modules, perverse sheaves on analytifications, variations, Hodge modules, `Π`, the Deligne filtration). 12.6 is stated in full. No statable headline is absent and none is forced through a stand-in.

### Adversarial table

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §3.2 polarization of primitive parts | Tate curve, `k = 1` | `(log T)α = −β`, `Q(α, (log T)α) = −1`; `N_j α = β`, `Q(α, N_j α) = +1` | R01 |
| §3.2 limit weights | constant; Legendre at `0`; rank one, `T = −1` | `N = 0`, pure; weights `0, 2` of rank `1, 1`; `Ψ_1 = 0`, `Ψ_{−1}` rank `1` | sound apart from R01 |
| §3.4 example | Legendre on `P¹ ∖ {0, 1, ∞}` | `χ = 2·(−1) + (1 + 1 + 0) = 0`, `H⁰ = H² = 0`, `H¹ = 0` | sound |
| §1.1 (sample) | `G_m → A¹`; `xy` | compactification `A¹`, fibres of cardinality `0, 1`; `Γ(P¹, O) = ℂ` excludes `P¹`; fibres `ℂ^×` and two lines | sound; source unread |
| §2.2 (sample) | `δ_a`, `O`, `D/D(τ∂_τ − α)` | coker of `∂_τ + t` gives `t = −∂_τ`, `∂_t = τ`; `δ_a ↦ D/D(∂_t − a) = E^{at}`; twice: `δ_{−a}`; `τ∂_τ − α ↦ −(t∂_t + 1 + α)` | sound; locator R03(a) |
| §2.3 | `O ⋆ O` | `s_+ O_{A²}` has `H^{−1} = O`; `Tor₁(δ_0, δ_0) = δ_0`, `Tor₀ = 0` | sound |
| §4.1 | identity `ℂ → ℂ`, filtrations from `1` and `0`; `i_+ V` | `coker R_F u = ℂ[z]/z`; `F_{p+1}(i_+V)/∂F_p = F_p V` | sound |
| §4.2 | `O(∗0)`, Kummer, `δ_0`, log connection, `D/D(x∂_x)²` | indices `−k`, `−a−k`, `k+1`; `N e_1 = −e_0 = var(can e_1)`; `can` an isomorphism, `var ∂m_0 = 0` | sound |
| §4.3 (sample) | `pℚ_{A¹}`; `ℚ(m)`; non-polarizable weight one on `ℚ⁴` | weight `1`; weight `−2m`; excluded | sound; primitive form R01(3) |
| §4.5 | `P¹ → pt`; blow-up of `A²` | degrees `∓1`, weights `0, 2`; `pℚ_{A²} ⊕ δ_0ℚ(−1)`, both weight `2` | sound |
| §4.7 (sample) | `δ_0ℚ → j_!pℚ`; `ℚ(1) → E` | image `= W_0`; `W_{−2} ∩ F^{−1}` of `E` is the image | sound |
| §5.2 (sample) | `G_m → pt`; Tate lines; `ℚ[−1]` | `H⁰a_*`: weight `2 ≥ 1`; `H⁰a_!`: `0 ≤ 1`; `D`: `2 ↦ −2`; `ℚ[−1]`: `≤ −1`, dual `≥ 1` | sound; locator R03(b) |
| §5.4 | `j_!*L[1]`, one block of size two | `i^*F = L^T[1]`, `i^*Rj_*L[1]` ranks `1, 1`; `H¹i^! = 1 = dim coker N` | sound |
| §5.5 (sample) | `{0} ⊂ A¹`; node in `A²` | kernel of `j_!pℚ → pℚ` is `δ_0ℚ = i_*pℚ_D`, so `i^*pℚ_U = pℚ_D[1]`; node costalk ranks `2, 1` against `1, 0` | sound; corrects FSY A.3 |
| §6.6 | `δ_0`, `O` | `FT K`: `0 → O → FT K → δ_0 → 0`, so `O(∗0)`; `δ_0(∗0) = 0` | sound |
| §7.1 | `δ_0ℚ(−1)` | degree-one term `F_{−λ+1}(i_+V) ⊇ F_{−λ}V = F^λV`; index `⌊−λ⌋ = −⌈λ⌉` | sound |
| §7.2 (sample) | chart at infinity | `z∂_θ + τ = −x²(z∂_x − τ/x²)`, as in ESY (2.3.2) | sound |
| §7.3 (sample) | flat frame of norm `abs(t)^{1/2}`, index `1/4`; trivial line on `P¹` | lattices `O` against `tO`; twistor weights `−1, 1` against Hodge weights `0, 2` | sound |
| §8.1 (sample) | `ℚ`; `δ_a`, `a ≠ 0` | `I(ℚ) = K`; `FT = E^{at}(∗0)`, not constant, `φ_{θ,1} = 0`; criterion needs 5.6 | R02 |
| §9.3 (sample) | `(G_m, ±x)`; `(A¹×A¹, x + 0)` | `I(ℚ) ⊗ I(ℚ(−1)) → I(ℚ(−1))`; `0 ⊗ − = 0`; same sign lands in `H²_c(G_m, 2x) = 0` | sound |
| §9.4 (sample) | `(G_m, x)`; `(A¹, x²)` | weights `0 ≤ 1 ≤ 2`, middle `0`; `f_*pℚ = pℚ ⊕ j_*L[1]`, `RΓ(j_*L) = 0`, pure weight `1` | sound |
| §10.2 | `g = x`; `g = xy` | `I(ℚ(−1))` in degree `2` both ways; `H²_Z = H¹(G_m²) = ℚ(−1)²`, `H³_Z = ℚ(−2)` | sound |
| §11.2 (sample) | `pℚ_{A¹}`, `δ_0V`, `K` | `ℚ(−1)` in degree `1`; `V` in degree `0` (pair degree `1`); `ℚ`, `ℚ(−1)` against `H^•_dR(O(∗0)) = ℂ, ℂ` | sound; input-line `i_0` |
| §11.3 (sample) | `pℚ_{A¹}`; block of size two; `δ_0V` | `gr¹` rank `1 = rank gr⁰_F O`; cokernel `1` against generic rank `2`; hypothesis fails, `H⁰ ≠ 0` | sound |
| §11.5 (sample) | `D/D(τ∂_τ)²`; `O`; `δ_a` | `FT M = D/D(∂_t t)²`, `gr^V_1 = ⟨e, (t∂_t+1)e⟩`, `can` of rank `1`, `var` an isomorphism; at infinity `N = −s∂_s`; one block of size two on both sides | sound |
| §11.6 | `δ_0ℚ` | `M″ = pℚ_{A¹}`, fibre weight `0`, object weight `1 = w + 1`; `P_k(−1)` gives `w + k + 2` | sound |
| §12.3 | `(G_m, x)`, `(A¹, x²)` on `P¹` | `H⁰(Ω¹(log{0,∞})) = ℂ` for `0 < λ ≤ 1`; `O(−1 + ⌊2(1−λ)⌋)`: sections for `λ ≤ 1/2` only | sound |
| §12.5 | `x²`; `x + x⁻¹`; `I = (x⁴, x³y, xy³, y⁴)` | `H_Q = 1 + t^{1/2}`, value `2`; `ℂ[x,y]/(xy, x − y)` of dimension `2`; `x⁶y² ∈ J ∩ I² ∖ JI` | statement sound; route R04 |
| §12.6 headline (Lean) | `n = 0`; `x`; `x + x⁻¹`; `Σx_i`; `x` on `G_m²`; `φ = 0`, `n = 1` | `1 = 0!·1`; `1`; `2`; `n!·(1/n!) = 1`; affine span of dimension `1 < 2`, `H¹ = H² = ℂ`; `Δ = {0}` not full | sound; vertices are automatically nondegenerate (`m_j a_m x^m`, `m ≠ 0`) |
| §12.7 (sample) | `x`; `x + x⁻¹` | `h(0) = 0 ≤ 1 − λ` iff `λ ≤ 1`; heights `0, 1, 1` | sound |
| §12.8 | `x + y + 1/(xy)` | triangle area `3/2`, `2!·3/2 = 3` | sound |
| §12.9 | `(G_m, x)`, `d = 1` | `λ ≤ 0`: annihilator `0 = F^{>1−λ}`; `λ > 0`: both the whole line; matches Yu (14) | sound |

### Seeded source sample

| Target | Locator read | Outcome |
|---|---|---|
| 1.1 | Verdier | not readable (below) |
| 2.2 | FSY lines 441–462, 2773–2779; MT lines 2104–2107 | definition and exactness supported; Proposition 2.4 is not the statement: R03(a) |
| 4.3 | Sai88 line 3352 (5.1.6, pp. 955–956), line 3740 (5.2.10, pp. 967–968) | supported |
| 4.7 | Sai90 lines 66–71 (p. 222); §4.1 at line 3158 (p. 314) | abelian, `rat` faithful and exact: supported |
| 5.2 | Sai90 lines 3513–3519 (p. 324), 3656–3662 (p. 328), 166–171 (p. 225); Sai88 lines 138–140; FSY lines 3024–3047 | supported; Proposition 0.3 is not the statement: R03(b) |
| 5.5 | FSY lines 2872–2896 (p. 63) | supported with the README's shift correction |
| 7.2 | ESY lines 1088–1094, 1095–1136, 1172–1190, 1245–1262, 1371–1383 | supported: injectivity of `τ − z`, the quotient formula for `α ∈ [0, 1)`, the endpoint, strict direct image |
| 7.3 | Sab05 lines 5345–5352, 5402–5411, 6405–6408, 1834, 596–597, 804 | supported; printed pages are the file's pages minus six |
| 8.1 | FSY lines 2961–2971 (p. 65), 3204–3207 (p. 70) | supported; the rigidity step is R02 |
| 9.3 | FSY lines 3061–3085; Yu lines 711–715 (p. 15) | duality supported; A.22 is the torus-sum case, the general Künneth being this target's own route (exact `⊗_E`) |
| 9.4 | FSY lines 3024–3047 | supported |
| 11.2 | FSY lines 3241–3253 (p. 71) | supported |
| 11.3 | FSY lines 3256–3277 (p. 72) | supported, including smoothness for the rank formula |
| 11.5 | MT lines 2108–2116 (p. 39) | supported; MT's kernel is `E^{−tτ}`, harmless as the README says |
| 12.7 | Yu lines 1423–1425, 1663–1670 (p. 31), 1397–1416 | supported; convenience is not assumed |

Also read: AS lines 395–445 and 569–626 for §§12.5–12.6 (the graded statement (4.3) is quoted from Kouchnirenko for nondegenerate `f` without convenience; AS line 617 is Hochster for one graded cone). No author-flagged unverified locator exists beyond the settled uncertified and waived works. All 21 cited works have one manifest key each; nothing was fetched or added.

### Library declarations opened at the pins

`TauCeti/Geometry/Hodge/Mixed/Strictness.lean:88`, `:110`, `:131` (the three strictness theorems); `Mixed/Basic.lean:72`; `Mixed/Category.lean:56`; `Mixed/Abelian.lean:33`; `Structure.lean:62`; `Polarization.lean:72`, `:159`, `:221`; `Tate/Basic.lean:93`, `:102`; `Tate/Twist.lean:63`; `TauCeti/RingTheory/CohenMacaulay/Ring.lean:40` (Noetherian plus Cohen–Macaulay localizations; no theorem on semigroup algebras); `TauCeti/AlgebraicTopology/LocalCoefficient.lean:46`. Mathlib: `Algebra/Module/ZLattice/Covolume.lean:318`; `Analysis/Convex/Measure.lean:38`; `Algebra/MonoidAlgebra/Module.lean:73`; `Analysis/Convex/Exposed.lean:55`; `Algebra/Polynomial/Derivative.lean:228`; `RingTheory/LaurentSeries.lean:101`. Every backticked library name of the README resolves; none proves the Lean headline.

### Suppliers, gaps, ownership

Sections resolved at main or the open heads: SpringerResolutionAndCharacteristicCycles §§8.2–8.5, 9.1, 9.2, 9.4–9.7; ComplexComparisonPartII §§C-1.1, C5.1, C5.6, C6.0, C6.1; PadicDifferentialEquationsAndRigidCohomology §§RD.6.52a, RD.6.53; LefschetzPencilsAndVanishingCycles §§1.3, 1.4, 1.5, 1.7, 3.4; ShimuraData §§3.1–3.3; ShimuraVarieties §§3.5b.1–3.5b.2; AlgebraicTopologyPartII §§16.1a–16.1e; StratifiedSpacesAndTameTopology §§7.2–7.3 (another author's open new roadmap); SchemeKTheoryOperations §5.7; AnalyticToricGeometryPartII §§0.1–0.3; FormalConnectionsOpers §F2.2 (another author's open new roadmap); on main GroebnerGeometry §G2, EtaleCohomologyFoundations §§G.1–G.2, ResolutionOfSingularitiesCharacteristicZero §§5.1, 5.2, 6.2, EnhancedDerivedSheaves, SchemeAndStackFoundations, AlgebraicCurves; completed AnalyticToricGeometry. No drift.

The seven declared gaps have the same slugs and suppliers in `design/plan.json` and in the README's supplier contracts; each is precise and minimal, none has supplier `none`. They are contracts, not findings.

Ownership searched by object over main and the open heads (`roadmaps grep`): “mixed Hodge module”, “admissible variation”, “variation of mixed Hodge”, “irregular Hodge”, “exponential mixed Hodge”, “Kashiwara–Malgrange”, “regular Riemann–Hilbert”. Hits are consumers only (EllAdicHomotopyTypesAndWeights, SheafConvolutionOnAbelianVarieties, TopologicalMirrorSymmetryForHitchinSystems, and PadicDifferentialEquationsAndRigidCohomology, which takes FSY's filtration as filtered input). EtaleDualityAndPerverseSheaves compares étale perverse sheaves with analytic ones for finite and adic coefficients; the rational and complex Betti categories are owned here. Completed HodgeStructures names variations as a successor roadmap and does not own them; pure variations are imported from ShimuraData. The board packages index was read: no package of this subject under another name.

`scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, none is defined only by an open revision.

Overlap check: read LefschetzPencilsAndVanishingCycles, EtaleDualityAndPerverseSheaves, SheafConvolutionOnAbelianVarieties, ComplexComparisonPartII, PadicDifferentialEquationsAndRigidCohomology, EtaleCohomologyFoundations, HodgeStructures (the third list is empty); nothing shared.

Dependency check, full output:

```text
depcheck: 206 roadmaps, 1908 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

## Not verifiable

- **Verdier** (settled uncertified): Théorème 3.3 and Corollaire 5.1 for the sampled §1.1 were not read. The Checks of §1.1 were computed independently.
- **Dimca, Schmid, SZ, Kash76, Kou** (settled uncertified) and **Zucker** (waived): not read. R01 rests on a direct computation, not on Schmid's text; R04 rests on the general direction of the implication and on AS, not on Kouchnirenko's text.
- Saito's sign for the polarization of primitive parts (Sai88 5.2.10) in his right-module convention was not traced through the OCR text; R01(3) therefore asks for the form to be fixed by the curve case and not by quotation.
- Printed page numbers of Sab05 were checked through the constant offset of six from the file's pages, at three locators.

## Source issues

- **Misprint** in FSY at Appendix A.2, printed p. 61, FSY line 2800: the source says the right filtration is the left one with index lowered by the dimension; it should be raised by the dimension; affects a stated result.
- **Misprint** in FSY at Appendix A.2, printed p. 62, FSY line 2832: the source says the dual of the constant perverse object carries the twist minus the dimension; it should carry plus the dimension; affects a stated result.
- **Misprint** in FSY at Example A.3, printed p. 63, FSY line 2876: the source says the inverse image of the constant object on a divisor is in degree zero; it should be the divisor's constant object shifted by one; affects a stated result.
- **Misprint** in FSY at Example A.27, printed p. 71, FSY line 3222: the source says the composed direct image from the zero locus is zero; it should say the function is zero there, its direct image factoring through the origin; affects the proof.
- **Misprint** in FSY at Theorem A.30, printed p. 71, FSY line 3241: the source says the costalk is taken at the origin of the output line; it should be the origin of the input line carrying the module; affects a stated result.
- **Misprint** in AS at §4, printed p. 68, AS lines 423–424: the source says forms of degree l are bounded by weight k/e minus l; it should be k/e plus l for the differential to preserve the filtration; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e0b4ee2c5af49fbb70b4df85cf53d6c5d1285ac3", "job": "REV-PKG-MixedHodgeModulesAndIrregularHodgeTheory~6", "model": "fable", "worker": "chris-x12"} -->

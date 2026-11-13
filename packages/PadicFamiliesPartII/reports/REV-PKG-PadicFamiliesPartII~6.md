<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12987#issuecomment-6849925549 -->
Review (claude) of b4d8aba

Verdict: needs_changes

1. **F01** (P2) §6.1 admits the zero parameters, and §6.2 drops the hypotheses of the amplitude theorem

   **Location.** `packages/PadicFamiliesPartII/README.md:928`, §6.1: "integers `n_v ≥ 1` and rationals `0 ≤ w_v ≤ ε_v ≤ n_v − 1/(p−1)`"; `:930`: "For rationals `0 ≤ u_v ≤ w_v`"; `:960`, §6.2: "for every admissible tuple of §6.1 and every w-analytic κ_A the cuspidal analytic complex is concentrated in `[0, |I|]`".

   **Claim.** The frame torsor and u-analyticity are defined for every `u_v ≥ 0`, and the amplitude `[0, |I|]` holds at every admissible tuple, including `ε_v = w_v = 0` and `n_v = 1`.

   **Witness.** At `u_v = 0`, `T⁰_u(R) = 1 + p⁰R = R` contains 0 and is not a group, so there is no torsor and no pairing `T_u × Spf A → 𝔾_m`. BCGP21 line 7049 (Theorem 6.2.6) assumes `ε ∈ ℚ_{>0}^{S_p}` and `inf_v n_v ≥ sup_v n(ε_v)`; the affine charts exist only then (lines 7017–7020, 7038–7043). The supplier's one-place form, HigherHidaAndColemanTheory §9.6, has `0<ε≤n−1/(p−1)` and `0<w′≤w≤ε`.

   **Repair.**
   - §6.1: make the inequalities strict at zero, `0 < u_v ≤ w_v ≤ ε_v ≤ n_v − 1/(p−1)`, and say that the closed interval printed in BCGP21 §§6.1.4–6.1.7 is read as open at 0 (add it to the Source issues list).
   - §6.2: state the amplitude for admissible tuples with `n_v ≥ n(ε)` at every v, where `n(ε)` is the threshold of BCGP21 §6.2 (p. 145) above which the Hodge–Tate sections lift modulo `p^ε` to sections of the ample `det ω^mod`. Add that these tuples are cofinal, so `H^†_{κ_A}` has cohomology in `[0, |I|]` (BCGP21 Proposition 6.3.7, p. 148), which is what §6.6 uses.
   - Add a negative-control Check: at `u_v = 0` the set `1 + R` contains 0, so the parameter is excluded.

   **Repair tested.** At `p = 3` the tuple `(n, ε, w, u) = (1, 1/4, 1/8, 1/16)` of the third Check stays admissible, and `1 + 3^{1/16}R` is a group (inverse by the geometric series). `(1, 0, 0, 0)` is excluded. The tuple `((1)_v, ε₁)` used for `β_κ` has `ε₁ = 1 − 1/(p−1) = 1/2 > 0` at `p = 3`. Cofinality: given `(n, ε, w)`, take `n′ ≥ max(n, n(ε))`.

2. **F02** (P2) gap:mixed-cube-cover asks for a cover of the wrong space

   **Location.** `packages/PadicFamiliesPartII/README.md:142` and the same slug in `design/plan.json`: "The cover of the mixed-level Hilbert–Siegel minimal compactification by the `2^{|I|}` affinoids indexed by `[2,3]^I`"; the same wording in §6.2, `:960`.

   **Claim.** The minimal compactification itself has such a cover.

   **Witness.** At `I = ∅` the sentence asks for the minimal compactification, proper of dimension `3[F:ℚ]`, to be a single affinoid. BCGP21 lines 7034–7043 (Lemma 6.2.3) cover the neighbourhood `X^*_{K(p^n)}(ε)`, for `ε_v > 0` and `n ≥ n(ε)`, by the opens indexed by `(i_v) ∈ {2,3}^I`.

   **Repair.** In the README contract line and in the `needs` of the plan's gap (same slug), ask for: for `ε_v > 0` and `n_v ≥ n(ε)`, the cover of the image `X^*_{K(p^n)}(ε)` of the Hodge–Tate neighbourhood `X_{K(p^n)}(ε)` in the minimal compactification by the `2^{|I|}` affinoids indexed by the vertices of `[2,3]^I`, the intersections along the faces being acyclic for the toroidal-to-minimal pushforward of the analytic coefficients (BCGP21 Lemma 6.2.3 and Theorem 6.2.6, pp. 145–146). Use the same wording in §6.2.

   **Repair tested.** At `I = ∅` the request is one affinoid neighbourhood of the image of the ordinary-multiplicative locus, which exists (BCGP21 Lemma 6.2.3: the non-vanishing locus of a section of an ample sheaf), and the amplitude is `[0, 0]`. At `|I| = 1` it is two affinoids and their intersection, amplitude `[0, 1]`, the first Check of §6.2.

3. **F03** (P2) §7.3 does not name the target of `CC_λ`, and §7.6 uses finite-slope parts that nothing defines

   **Location.** `packages/PadicFamiliesPartII/README.md:1156`, §7.3: "define `CC_λ(M) = RHom_𝔤(M, RΓ̃^{la})` … with the λ-twisted torus action"; `:1203`, §7.6: "the finite-slope functors `CC^fs_λ(M(𝔤)_λ)` and `CC^fs_{cusp,λ}` have slopes `≥ 0`, and the ordinary part".

   **Claim.** `CC_λ` carries a torus action only, and `CC^fs_λ`, `CC^{=0}_λ`, `HC^{=0}_{w,λ}` are available.

   **Witness.** BCGP25 lines 4427–4430: `CC_λ` has values in `D(Mod^{λ-sm}_{B(ℚ_p)}(E))`. Lines 4266–4291: the finite-slope part is defined from the `T⁺(ℚ_p)`-action on `K_U`-invariants, `K_U ⊂ U(ℚ_p)`, so it needs the `B(ℚ_p)`-action. No section of the README or of LocallyAnalyticRepresentationsOfLocalGroups §3.5 defines it.

   **Repair.**
   - §7.3: state `CC_λ, CC_{cusp,λ} : O(𝔤,𝔟)_{λ-alg} → D(Mod^{λ-sm}_{B(ℚ_p)}(E))`, contravariant, with `B(ℚ_p)` acting through the tower and through the integrated action on `M(−λ)` of §7.1, and add an API bullet that the maps of §7.5 are `B(ℚ_p)`-equivariant.
   - §7.1b (where `HC^fs` is introduced): define, for N in `D(Mod^{λ-sm}_{B(ℚ_p)}(E))`, the Hecke action of `t ∈ T⁺(ℚ_p)` on `N^{K_U}` (t followed by the normalized trace from `tK_Ut⁻¹` to `K_U`), the finite-slope part `N^fs` in `D(Mod^{λ-sm}_{T(ℚ_p)}(E))`, its independence of `K_U`, and the slope-`=λ′` and slope-`≥λ′` parts, the ordinary part being slope 0 (BCGP25 §§4.6.46–4.6.53, pp. 94–96). Say that `HC^fs`, `CC^fs`, `HC^{=0}` and `CC^{=0}` are these functors applied to `HC` and `CC`, and that for `HC` this agrees with the Banach-model description already given (BCGP25 §4.6.54, p. 96).
   - Add the new locators to `sources.toml` (BCGP25).

   **Repair tested.** On a line on which `T⁺(ℚ_p)` acts through a character χ the slope is `v_p ∘ χ`; for `χ(t) = p` it is nonzero and the line is not ordinary, for χ unramified it is. With `U_t = 0` the finite-slope part is 0, the third Check of §7.1b. With only a torus action there is no `K_U` and none of these is computable.

4. **F04** (P3) §1.1 cites the wrong section for the degree function

   **Location.** `packages/PadicFamiliesPartII/README.md:267`: "`δ = (δ_1,…,δ_h) : X_Iw^rig → ∏_i [0, d_i a_i]` (BPS §3.1–§3.2, HAL pp. 15–16)".

   **Claim.** The degree coordinate and `X_Iw(0)` are defined at that locator.

   **Witness.** BPS lines 483–509 (§1.5, printed p. 11) define δ, `δ_i` and `X_Iw(ε)`; BPS line 719 (§3.2, p. 16) only recalls them ("nous avons défini").

   **Repair.** Cite "BPS §1.5, HAL p. 11" for the definition (keeping §3.2, p. 16, for the recall if wanted) and add "§1.5 (p. 11)" to the BPS locator in `sources.toml`. Tested: line 487 has the map to `[0, fl]` and line 508 the opens `X_Iw(ε)`.

5. **F05** (P3) two page locators

   **Location.** `packages/PadicFamiliesPartII/README.md:766`, §5.1: "(BCGP21 §§5.2–5.4, pp. 119–124)"; `:1063`, §7.1: "(BCGP25 Lemma 3.4.6, p. 54)".

   **Witness.** BCGP21 §5.2 starts at line 5791 (p. 119) and §5.5 at line 5959 (p. 122); the two identities are at lines 5889–5890, p. 121; pages 123–124 are §5.5. BCGP25 Lemma 3.4.6 is stated at lines 2473–2474, the foot of p. 53; only its proof is on p. 54.

   **Repair.** "(BCGP21 §§5.2–5.4, pp. 119–122; the identities on p. 121)" and "(BCGP25 Lemma 3.4.6, pp. 53–54)".

6. **F06** (P3) four Mathlib line locators are off by one

   **Location.** `packages/PadicFamiliesPartII/README.md:73`: "`Module.End` (Mathlib/Algebra/Module/LinearMap/End.lean:32)", "`Module.End.genEigenspace` (…/Eigenspace/Basic.lean:71)", "`Module.Projective` (…/Projective.lean:70)", "(Mathlib/RingTheory/Artinian/Module.lean:308)".

   **Witness.** At the pin (Mathlib 1b1ccf4) the declarations are at End.lean:33, Eigenspace/Basic.lean:72, Projective.lean:71 (line 70 is its attribute) and Artinian/Module.lean:307.

   **Repair.** Use 33, 72, 71 and 307. The other three (`Prod.lean:95`, `:199`, `AlgebraMap.lean:259`, `DerivedCategory/Basic.lean:87`, `Verma.lean:195`) are exact.

7. **F07** (P3) Layer 7's Dependencies omit a library item its target needs

   **Location.** `packages/PadicFamiliesPartII/README.md:1245`, Layer 7 `### Dependencies`.

   **Witness.** §7.1's `*Needs:*` (`:1065`) lists "Tau Ceti `TauCeti.VermaModule`"; the layer's Dependencies line does not, while Layers 5, 6 and 8 list their Mathlib names. A mechanical comparison of every `*Needs:*` line with its layer's Dependencies found this one omission.

   **Repair.** Add "Tau Ceti `TauCeti.VermaModule`" to the Layer 7 Dependencies.

8. **F08** (P3) §6.7 is narrower than its source

   **Location.** `packages/PadicFamiliesPartII/README.md:1037`: "Assume `|I| = 1`".

   **Witness.** BCGP21 lines 7986 and 8004 (Theorems 6.6.4 and 6.6.5) assume `#I ≤ 1`. §6.6(2)–(3) already cover `|I| ≤ 1`.

   **Repair.** "Assume `|I| ≤ 1`", and in the route: for `I = ∅` both complexes are in degree 0, r is injective and the dimensions agree by §6.6(3). Tested at `I = ∅`: `b = 0`, `χ(source) − χ(target) = −a`, so equality gives `a = 0`; the global statement then needs `l_v ≥ 4` at every v.

Eight findings: three P2 and five P3. The five findings of round 5 are repaired. The new blocking findings are all in text the round-5 repairs wrote or made precise (§6.1's parameter set and what §6.2 and one gap now say about it) and in one sampled definition (§7.3). No authored file was changed by this review; `sources.toml` needed no addition.

## Verified sound

### Round-5 findings, checked first

| Round-5 finding | Repaired passage | Status and test |
| --- | --- | --- |
| F01 geometric against analytic coefficients | §6.5: "the restriction `res^†_κ : RΓ(X_{K_p(I)K^p}, ω^κ(−D)) → G^†_κ`"; §6.1 defines `G^†_κ` and `β_κ` | **Repaired.** BCGP21 lines 7514–7533 keep `ω^κ(−D)` on both sides. At `(k_v, l_v) = (2, 2)`: geometric bound 1, all-degree BGG bound −2, `H⁰` bound 1. At `(5, 2)`: 4, 1, 4. |
| F02 parameters of the analytic family | §6.1: "An admissible tuple `(n, ε, w)` … integers `n_v ≥ 1` and rationals `0 ≤ w_v ≤ ε_v ≤ n_v − 1/(p−1)`" | **Repaired** as asked (BCGP21 lines 6863–6889, 6928–6939, 7150–7155 agree). The boundary at 0, which the repair made explicit, is R01. |
| F03 unowned inputs of the ordinary comparison | New §4.4a; §6.6 route: "at `v ∈ I` by the Katz–Mazur integrality of §4.4a"; contract "§8.8: …" | **Repaired.** P20 lines 4677–4737 and BCGP21 lines 7955–7985 read. `(α, β) = (1/3, 3)`, `k_v = 4`: valuations `(−1, 1, 2, 4)` against Hodge `(0, 0, 3, 3)`, both of sum 6. AutomorphicBundlesPartII §8.8 exists at its open head with the stated hypotheses. |
| F04 extension of coefficients to O | §9.2: "`M_w^• ⊗^L_{ℤ_p} O ≃ 𝓜_w[−ℓ(w)]` in `D(Λ)`" | **Repaired.** BCGP25 lines 7480–7490. For O unramified quadratic and `C = ℤ_p[0]`: `ℤ_p`-ranks 1 before, 2 and 2 after. |
| F05 locator of the nonnegative slopes | §2.1: "(BPS §4, introductory paragraph before §4.1, HAL p. 17)" | **Repaired.** BPS line 736 carries the printed 17; the weights are at lines 747–771. |

No item of the repair report was marked not actionable. The repaired patterns were looked for in the rest of the text: every other statement about `H^†` or `G^†` names its coefficient; every scalar-extension statement of Layer 9 is over Λ; the BPS page numbers of §§1.2–2.9 match the printed headers (printed page = extraction marker − 1), except the section in R04.

### Seeded source sample

Every sampled locator was opened in the cached text. No locator was flagged as unverified by the author, and no text was unreadable.

| Target | Text opened | Result |
| --- | --- | --- |
| 1.1 Morita degrees | BPS lines 483–509, 716–724 | Statement agrees; the locator is R04. |
| 1.4 Uniform progress | BPS lines 726–745 (Prop. 3.2.1 p. 16, Cor. 3.2.2 p. 17) | Agrees: `0 ≤ n_i ≤ d_ia_i − 1`, `0 < η ≤ ν < 1`, minimum of the increment on the closed band. |
| 2.5 Bad-path contraction | BPS lines 1104–1111 (Lemma 4.4.5, p. 25), 1181–1200 (p. 27) | Agrees: bound `p^{n_i − ν c_i}`, `u₀ = p^{n_i + s − (1−ε)c_i} < 1`. |
| 3.5 Euler characteristic | P20 lines 4867–4888 (Thm 15.2.1, p. 107), 5001–5009 (§15.2.5, p. 109) | Agrees; the per-component witness is the README's own strengthening, stated as such. |
| 4.4a Klingen Satake integrality | P20 lines 4677–4737, 4738–4765; BCGP21 lines 7955–7985 | Agrees. P20's `T_{p,2}` is the operator of Lagrangian kernels in `G[p]` (line 4748), the README's "Siegel-type" operator. |
| 4.6 Trace congruence | BCGP21 lines 5283–5305, 5439–5480, 5520–5524 | Agrees: `n ≥ 1`, factor `p^{#Jᶜ}`, modulus `p^{inf(k_w − l_w)}`, weights of §4.6.8. |
| 5.1 First operators | BCGP21 lines 5863–5890 | Identities agree; page range is R05. |
| 5.8 Doubling injection | BCGP21 lines 6432–6446, 6487–6493, 6531–6545 (p. 135) | Agrees, with the matrix `((U_Kli, U_{w,2}), (−1, 0))`. |
| 6.1 Analytic and dagger complexes | BCGP21 lines 6863–6939, 7136–7155, 7463–7533; AIP15 lines 324–331 | Agrees except the boundary at 0 (R01). |
| 6.2 Mixed Coleman amplitude | BCGP21 lines 7017–7085 | Hypotheses dropped: R01, R02. |
| 7.1a Higher Coleman sheaves | BCGP25 lines 2396–2423, 2525–2599 | Agrees (Definition 3.4.17, p. 56; `µ ∈ X^*(M_Q)` in Remark 3.4.15). |
| 7.1b Higher Coleman functors | BCGP25 lines 3084–3100, 3949, 4154–4155, 4309–4324, 4388–4397 | Agrees: amplitudes `[0, ℓ(w)]` and `[ℓ(w), d]`, comparisons at `λ = 0` and at `dν`. |
| 7.3 Completed-cohomology functor | BCGP25 lines 4426–4436 | Target category missing: R03. |
| 8.2 Repeated Sen block | BCGP25 lines 4794–4811 (pp. 107–108) | Agrees: `(Θ + 1 + w/2)² = 0`, `Gr³ ⊂ V_a → Gr²`. |
| 9.6 Tame group-ring projectivity | BCGP25 lines 7519–7565 | Agrees: normal `K₁^p ⊂ K₂^p`, p may divide the index, stabilizers prime to p. |

Pages checked against the page markers for 33 further BCGP21 and 33 BCGP25 locators (Propositions 2.4.24–2.4.26, 3.4.1, §3.9.19–20, Theorems 3.10.1, 4.2.1, 4.6.1, 6.2.6, 6.3.16, 6.5.8, 6.6.4–6.6.5; BCGP25 §§3.3–3.4, 4.6–4.7, 4.10.8, 7.3): all agree with the README except Lemma 3.4.6 of BCGP25 (R05).

### Adversarial table

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 1.1 | modular curve, supersingular, `p = 2, 3`; `M₂` | degrees 1/3, 1/4; `1/(p+1) + p/(p+1) = 1`; unreduced range `[0, 2]` against `[0, 1]` | pass |
| 1.4 | `ν = 1/2`, `η = 1/4`, increment 1/20; `η = ν` | `N = 6`: `6/20 ≥ 1/4`; `N = 0` | pass |
| 2.1, 2.5 | `(n, c, s) = (3, 4, 0)`, `(3, 3, 0)`, `(3, 4, 1/2)` | exponent at `ε = 1/8`: −1/2; `3ε > 0`; negative iff `ε < 1/8` | pass |
| 2.8 headline | Siegel `(6, 6)`, `(6, 3)`; elliptic k | bounds 3, 0, `k − 1` | pass |
| 3.1 | `p = 2`; `r = 2, 3` | `2 + 4 + 8 + 16 = 30` cosets; scalar `p^{3−r} = 2, 1`; divisibility `k + 2r ≥ 2 + r` is `k + r ≥ 2` | pass |
| 3.5 headline | `[Λ₁ → Λ₁]` zero map; `p = 5`, `p = 2` | χ = 0 with free cohomology; 4 components; 1 component | pass |
| 4.4a | `p = 3`, `k_v = 4`, `(1/3, 3)`; Klingen level | `(−1, 1, 2, 4)` and `(0, 0, 3, 3)` sum to 6; `αβ` unit and `α + β` integral give both units | pass |
| 4.6 | `p = 3`, one and two places, `n = 0, 1`, `l = 2` | degrees 4, 16; factors 3, 9; `4f − 3f = f`; `3^{−5}`; `(9 − 1)·3 = 24` of valuation 1 | pass |
| 4.7 headline | `[Λ → Λ]` by T at `T = 0`; `I = ∅` | fibre `ℤ_p, ℤ_p` against `H⁰ ⊗ = 0`; amplitude `[0, 0]` | pass |
| 5.1 | `l_w = 1, 2, 3` | `pU_Iw + Z`; `U_Iw + Z` twice; `U_Iw + pZ`; exponent `min(3, l_w + 1) = 2, 3, 3` | pass |
| 5.6, 5.8 headline | `T = 5`, `U = 6`, `(2, 3)`; symbolic | `C = (28, −2)`; `C² − TC + U = 0` and both inverses without commutation; `Δ∘C = U_Iw∘Δ` uses `U_Iw Z = U_{w,2}` only | pass |
| 6.1 | `p = 3`: `(1, 1/4, 1/8, 1/16)`; `ε = 3/4`; order-3 χ; `u = 0` | `1/4 ≤ 1/2`; `3/4 > 1/2`; χ analytic iff `u > 1`, `(2, 3/2, 3/2, 3/2)` admissible; `1 + R ∋ 0` | R01 |
| 6.2 | `I = ∅`; `|I| = 1, 2`; `ε = 0` | one chart; Čech lengths `2^{|I|} − 1 = 1, 3` against `|I| = 1, 2`; Theorem 6.2.6 needs `ε > 0`, `n ≥ n(ε)` | R01, R02 |
| 6.4 | `m_v = 4`; reversed identity | reflected bounds `−3 + 4 = 1`, `H⁰`: 4; reversed: `−7`. AIP15 line 1520 has `Θ U = p^{m} U Θ` | pass |
| 6.5 | `P = X² + 2X + 1`, `U = −1`; weights `(2,2)`, `(5,2)` | `Q = −X − 2`, `UQ(U) = 1`; thresholds 1, −2, 1 and 4, 1, 4 | pass |
| 6.6 | `(h⁰, h¹)` = (1,2), (1,1), (1,1); witness weights | χ = −1, 0, 0; `β_κ`: `χ^an ≤ χ^geo`; r: `χ^geo ≤ χ^M`; `(p−1)p^N` even; pair products of valuations `2 − k_v, 1, 1, k_v` | pass |
| 6.7 headline | defects a, b; `l_v = 3, 4` on `Iᶜ`; `I = ∅` | `χ_s − χ_t = −a − b`; `0 < l_v − 3` iff `l_v ≥ 4`; `b = 0` | pass; R08 |
| 7.1a | `GL₂`: `ε₁`, det on `diag(1, −1)`; `ν = (1, 1)` | 1 and 0; central value `2 ↦ −2` | pass |
| 7.1b | modular curve; `V[1]` | cuspidal `[0,0]`, `[0,1]`; full `[0,1]`, `[1,1]`; bound `[−b, ℓ − a] = [1, 1]` | pass |
| 7.3, 7.6 | split sequence; a line with `T⁺` acting by χ | zero connecting map; slope `v_p∘χ` needs the `K_U`-invariants | R03 |
| 7.8 headline | `λ = (1,1;2)`, `(1,1;−2)` | `−2, −2, −3, −3`; `0, 0, −1, −1`; sum `−6 − 2w` | pass |
| 8.2, 8.4, 8.6 headline | `w = 2`; Jordan block | `a = −2`; `N_a ≠ 0` with equal graded scalars; semisimple gives `N_a = 0` | pass |
| 9.2 headline | O quadratic unramified, `C = ℤ_p[0]` | ranks 1 against 2 before, 2 and 2 after | pass |
| 9.3, 9.5 headlines | `ν = (0, −2)`, `ν + ρ = (−1, −4)` | the four orbit points with `a − b ≥ 1` give `(5,3), (5,1), (2,−2), (0,−2)`; duals `(3 − κ₂, 3 − κ₁)` pair lengths 0/3 and 1/2 | pass |
| 9.6 headline | `𝔽_p[ℤ/p]` regular; trivial module | invariants: the norm line, not a summand; on the trivial module the norm is `p = 0` | pass |
| 9.7 headline | `p = 2, r = 7`; `p = 3, r = 7, 11` | `7 ≡ 3 mod 4`, index 3; `7 ≡ 1 mod 3` excluded; `11 ≡ 2`, index 5 | pass |

### Pins, Lean and headlines

- Pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The nine library declarations the README names were opened; all exist, four with a line number off by one (R06). `TauCeti.VermaModule` has the hypotheses the README states (`IsKilling`, finite-dimensional, characteristic zero, splitting Cartan: Verma.lean:140–146).
- `lake env lean` on `packages/PadicFamiliesPartII/Suggested.lean` from the content checkout: exit 0, no output, no warning. The file imports `Mathlib` only and declares nothing, so the one-tactic probe and the `#check @name` comparison have no subjects; nothing changed.
- Headlines (§§2.8–2.9, 3.3, 3.5, 4.7, 5.8, 6.7, 7.5–7.8, 8.4–8.6, 9.2–9.7): each is named in the module docstring with its missing carriers. Searches of both pins for Shimura varieties, Igusa towers, Klingen level, completed cohomology, Fréchet–Stein and Arens–Michael algebras, category O and Iwasawa algebras found no carrier, so none is statable. The companion identities of §5.6 are rightly left as a README target.
- No backticked name of the README is presented as this roadmap's own Lean declaration; the eight dotted names are library names.

### Suppliers, gaps, duplication

- All 26 suppliers were resolved now, at main, at the open heads (`roadmaps show`) or, for HigherHidaAndColemanTheory, LocallyAnalyticRepresentationsOfLocalGroups and LocallyAnalyticDistributionsPartII, in the board packages (the resolver's three leads; all three precede this roadmap in the merge order). 136 section citations checked (repeats included): every cited section heading exists. Contents were read for AutomorphicBundlesPartII §§5.1, 5.2, 8.5, 8.8; HigherHidaAndColemanTheory §§4.5, 9.5, 9.6, 9.7; SchemeAndStackFoundations §§0.17, 2.7; CompletedCohomologyPartII §7.8; PadicLocalLanglandsForGL2Qp §0.1; LocallyAnalyticRepresentationsOfLocalGroups §3.5; HodgeTateAndCanonicalSubgroups §0.6; SmoothRepresentationsOfLocalGroups §SR.4.5.
- The 15 gaps: same slug, supplier and section in `design/plan.json` and in the README, and the two texts agree up to the word "supply". 14 are precise and minimal; gap:mixed-cube-cover is R02.
- Dependency check: `depcheck: 206 roadmaps, 1919 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Object searches over main and the open heads for Kassaei continuation, the Sen–Cousin comparison, higher Coleman sheaves, the Arens–Michael envelope, the Katz–Mazur inequality in this sense and a finite-slope functor on λ-smooth representations found no second owner. GSp4NonregularModularityLifting imports E6, S7 and F8, which the former-numbering table resolves; its "corrected cuspidal doubling" is a theta construction over ℚ, not the Hecke doubling of Layer 5. The formal Fourier-coefficient operators of AlgebraicModularFormsAndSerreWeightsPartII Layer 5 are not the cohomological correspondences of §5.1.
- `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, none is defined only by an open revision.

Overlap check: read GSp4NonregularModularityLifting, AutomorphicBundlesPartII, AlgebraicModularFormsAndSerreWeightsPartII, OverconvergentAutomorphicForms, PerfectoidShimuraVarieties; nothing shared.

### Shape and principles

All 64 numbered subsections have a `*Needs:*` line and at least three Checks (66 Checks blocks); every layer ends with Examples and Dependencies; the Dependencies agree with the Needs lines except R07. No process words, pull-request numbers, machine paths, LaTeX delimiters, `lemma`, `set_option` or sorried data. The layer order is forced by the Needs lines (2 on 1; 4 on §3.2; 5 on 4; 6 on 1 and 4; 8 on 7); no layer is named after a source's chapter. No route-specific shortcut was found: §4.4a states the general Hilbert statement rather than a further localization, and Layer 9 keeps every prime. Maintainer notes: none.

## Not verifiable

- The declared gaps are contracts on suppliers; their future statements cannot be checked now.
- The headline theorems have no carriers at the pins, so the elaboration tests imports and syntax only.
- Ownership was checked against main, the open heads the tools index and the board packages in this checkout, not against unlisted branches.
- The existence of the m-localized form of §6.6(1) (local constancy of the localized analytic Euler characteristic) is taken from BCGP21 as the README does; the source does not spell it out.

## Source issues

- **Gap** in BCGP21 at §§6.1.4–6.1.7, printed pp. 141–142: the source says the radii ε, w and w′ range over closed intervals starting at 0; it should exclude 0, where `1 + p^{w′}R` is not a group; affects nothing.
- **Misprint** in BCGP21 at the proof of Corollary 6.4.3, printed p. 154: the source says the power of p stands on the side where θ is applied first; it should be `θ ∘ U = p^{k_v−l_v+1} U ∘ θ`, as in AIP15 Proposition 7.2.3; affects the proof.
- **Misprint** in BCGP21 at the proof of Lemma 4.6.16, printed p. 112: the source says the kernels have order `p^{3n}`; it should be `p^{4n}`, the order of the extension it describes; affects nothing.
- **Gap** in BCGP21 at Proposition 6.6.2, printed pp. 165–166: the source says the Euler characteristics agree with no localization; it should assume the non-Eisenstein localization its use of Theorem 3.10.1(2) needs; affects a stated result.
- **Misprint** in P20 at Proposition 15.2.4.1, printed p. 109: the source says `λ₁ > 0`; it should be `λ₁ < 0`, the singular case fixed in §15.2.1; affects a stated result.
- **Misprint** in BCGP25 at Remark 4.10.7, printed p. 107: the source says the length-zero term has weight `(1, 1; −w)`; it should be `(2, 2; −w)`, as in §4.10.8; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b4d8aba6af351e8906568928660d404766b51335", "job": "REV-PKG-PadicFamiliesPartII~6", "model": "fable", "worker": "chris-x59"} -->

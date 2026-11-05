# FIX-PKG-DrinfeldModulesAndTModulesPartII~2

This round answers the review `REV-PKG-DrinfeldModulesAndTModulesPartII`: nine findings (F01–F09). I checked every finding against the cited source text, the pinned Mathlib, and small exact computations. These were truncated Laurent series in u = 1/θ over F₂ and F₃, compared through u³⁰ (q = 2) and u³⁵ (q = 3), plus composition enumeration. All nine findings are correct. Seven are applied as asked. F03 and F06 are applied with the variations explained below.

## F01 (P1) — applied

`packages/DrinfeldModulesAndTModulesPartII/README.md` §2.3, Checks. Old: "B*_(q)(R_1) followed by subtraction of C_((1,q−1))(R_1) is BC_q(R_1), whose fixed part is S_d(q,q)". New: "BC_q(R_1) = B*_(q)(R_1) − D_1C_((1,q−1))(R_1)", with the q = 2, d = 1 values 0, D₁⁻³, D₁⁻². The unscaled subtraction is now a negative-control Check: it leaves (D₁−1)(S_d(q,1,q−1)+S_d(q)S_d(1,q−1)) in the fixed part. Computed: S₁(2) = D⁻², S₁(2)S_{<2}(1,1) = D⁻³, S₁(2,2) = D⁻².

## F02 (P1) — applied

§4.1. Old: "the kernel of the genuine K(t)-linear map `frobeniusResidual`". New: "the F(t)-linear map …; it is not linear over K(t) = F(θ, t)". There is a new Check in weight 0 (tree {∅}). For f = 1 the residual is 0, and for t·f it is 0. For θ·f it is θ^q − θ ≠ 0. The Lean signature (`→ₗ[RatFunc F]`, with t = `RatFunc.X`) was already correct and is unchanged. "K(t)" occurred only here.

## F03 (P2) — applied differently

Both headlines are statable on existing carriers, as the review says.

- **Grading.** I added `zeta_algebra_graded`. It states `iSupIndep` of the K̄-spans of the weight-w MZVs (w ≥ 0) in any field E that contains K∞ and K̄ with compatible K-embeddings. This is Chang's Theorem 2.2.1(1) itself (CHANG14 line 220).
  - I did not use the review's single union-of-Thakur-families form. Given `thakur_basis_algebraicClosure` the two are equivalent, and the `iSupIndep` form does not tie Chang's 2014 theorem to the later basis theorem.
  - §3.9 now names it and has three Checks: the 1+1+2 values at q = 3; the normalised value ζ_A(2)/π̃² ∈ K as a negative control; and π̃^(q−1) ∉ K̄.
- **Twisted rigidity.** I added `twisted_system_rigidity`, as proposed. It uses the forward-twisted equations with c_∅ = γ on `reducedPrefixes` (checked against IKLNDP24 lines 4164–4171 and the root step at 4293–4298).
  - I also included the (q−1) ∤ w case, which is Case 1 at lines 4302–4386 and holds for any ε. The hypothesis is therefore `¬ q−1 ∣ w ∨ ε ≠ 1`, with w > 0.
  - §4.6 states it, and has Checks for the weight-0 counterexample and for the q = 3, w = 2 residual (1−γ)(t−t³)(t−θ³)².
- **Docstring.** The module docstring no longer lists twisted rigidity as not statable. It keeps the general MZ-property descent as not statable and says its grading consequence is stated.

## F04 (P2) — applied

- **Lean.** `directIndices` is extended to weight 3q−2 with the Note's endpoint family (q > 2) and the three tuples (2,1,1), (1,2,1), (1,3) for q = 2 (IKLNDP-NOTE line 191). In `direct_small_weight_independent`, `hq : 2 < q` is removed and the bound changes from 3q−3 to 3q−2. Theorem 1.6 (line 262) carries no condition q > 2; §§5.6 and 5.10 prove the q = 2 cases.
- **README.** §5.13(2) now reads "every q, w ≤ 3q−2; |AT′_w| = s(w) only for w ≤ 3q−3". The proof route covers §§5.9–5.10.
- **New Checks:**
  - At q = 3, w = 7: 37 indices and 1040 arrays, against s(7) = 1042.
  - At q = 2, w = 4: the old rule would select a dependent triple, with relation ζ(1,1,2)+D₁(ζ(1,1,1,1)+ζ(1,2,1)) = 0 (checked numerically).

## F05 (P2) — applied

§3.5(1) is now stated under the whole-tuple condition (CPY19 (2.3.1), line 275; Proposition 2.3.3, line 325), including the case where some Q_i = 0. The proof route groups the terms with d_r < j into (Ω^(s_r)Q_r)⁽ᵈʳ⁾ times the twisted prefix series, which is entire by §3.4, so only the first column is used. Checks: the q = 3, Q = (1, t+θ⁴) tuple, where the tail series diverges, and Q = (1, 0). Same pattern elsewhere: the Layer 3 intro sentence; §3.8 now cites §3.5(1). §3.6 keeps the termwise bound, because it needs the full tail matrix.

## F06 (P2) — applied

Every vague gap was given a precise one-sentence `needs`, and independent interfaces were split. This was done in the README contracts and in the top-level `gaps` of `design/plan.json`, with the same slugs and text:

- **`anderson-thakur-generating-series`.** The explicit K[[x]] identity Σ S_d(n)x^(n−1) = ℓ_d⁻¹(1 − Σ γ_j(θ^(q^d))(x/ℓ_d)^(q^j)/D_j)⁻¹. I checked it by hand at d = 0 and d = 1 and derived it from the standard formula for e_d (AT90 line 750, §§3.6–3.7).
- **`parent-period-analytic-field`.** e_C, log_C on |z| < q^(q/(q−1)), and ker e_C = π̃A.
- **New gaps:**
  - `parent-carlitz-omega` (DM.2/omega)
  - `parent-twisted-analytic-rings` (DM.8): twist, T, E, and T^σ = E^σ = F_q[t], Frac(T)^σ = K̄(t)^σ = F_q(t) (PAP08 lines 346, 564)
  - `abp-entire-from-equation` (ABP04 line 409)
  - `frobenius-constant-denominator` (CPY19 line 245, rational U)
  - `frobenius-fundamental-matrix` (PAP08 line 1033)
- **`parent-abp-interface`.** Now ABP lifting only (ABP04 line 346); its section changes from DM.8 to DM.8/abp-lifting.

## F07 (P3) — applied

Gaps added to *Needs* lines:
- §0.5: `DM.6 (gap:general-power-sum-degree)`
- §3.2: `DM.6 (gap:anderson-thakur-generating-series)`
- §5.14: `DM.6/v-adic-special-values (gap:v-adic-mzv-specialisation)`

The same gaps were added to the Layer 0, 3 and 5 dependency summaries; Layer 5's "External inputs: ." is filled. Same pattern elsewhere: the empty *Needs* line of §0.11 was filled, and §1.3 now names `gap:integral-positive-index-stuffle`.

## F08 (P3) — applied

README only; Lean unchanged.
- **§1.7** gains four Checks: the unit; q = 3 ζ(1)² = ζ(2)+2ζ(1,1) against the uncorrected form; q = 2 ζ(1)ζ(2) = ζ(3)+ζ(1,2) against the stuffle expansion; and the alternating q = 3 square ζ(−1;1)² = ζ(2)+2ζ(−1,−1;1,1). All were verified numerically.
- **§5.7** gains three Checks at q = 2: R₁ = 0 against the wrong model R_w = H_w; R₂ = ⟨[2]+D₁[1,1]⟩; and R₃ with two pivots, of dimension 4−2 = 2.

## F09 (P3) — applied

The Mathlib contract now cites `Finsupp` in `Mathlib/Data/Finsupp/Defs.lean` (line 88) and `Finsupp.single` in `Mathlib/Data/Finsupp/Single.lean` (line 47). It also states what `single` does, including empty support for b = 0. I re-checked every other Mathlib and Tau Ceti file locator in the contracts at the pins; all are correct. `iSupIndep` (`Mathlib/Order/SupIndep.lean:328`) was added for the new headline.

## Checks run

- **Elaboration.** `lake env lean packages/DrinfeldModulesAndTModulesPartII/Suggested.lean` (from the content checkout) exited 0. It gave 20 warnings, all "declaration uses `sorry`" (18 before plus 2 new theorems), and no errors. The only import is `Mathlib`, so no Tau Ceti build was needed. There is no `set_option`, `lemma`, `#eval` or `#print`; the file is 400 lines.
- **`#check @name`.** I put all 36 declarations in one scratch file and elaborated it once: no errors. I compared each elaborated type with its README statement. Changed:
  - `direct_small_weight_independent`: now `∀ w ≤ 3 * card F - 2`, with no `2 < card F`.
  - `directIndices`: body only.
  - `zeta_algebra_graded`, `twisted_system_rigidity`: new; every binder (field, finite, decidable-equality, two algebra and two scalar-tower instances; `0 < w`, `hε`) is present.
  - Nothing else: the file has no section `variable`s, so no binder can drop.
- **Depcheck** (`gate --depcheck … --movable`), complete output:

  ```text
  depcheck: 51 roadmaps, 583 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
- **Citation resolver** (`roadmaps resolve` on the README): no cross-roadmap citations and no Lean names unresolved.
- **README ↔ Lean.** Every one of the 36 Lean names appears in the README. The only other lower-case backticked names are the Mathlib `composition_card`, `iSupIndep` and `tsum`. No LaTeX and no machine paths.

## Adversarial pass (statements added or changed)

| Statement | Instances | Computed values | Result / change |
|---|---|---|---|
| §2.3 BC_q(R_1) = B* − D₁C | q=2, d=1 | fixed parts 0, D⁻³; 0 − D·D⁻³ = D⁻² = S₁(2,2) | holds; unscaled gives D⁻³ (neg. control) |
| §4.1 residual scalars | w=0, f=1, θf, tf | residuals 0, θ²−θ (q=2), 0 | F(t)-linear only; Check added |
| `zeta_algebra_graded` | q=3, w=0,1,2; normalised ζ(2)/π̃² | 1+1+2 values; ζ(2)/π̃² = −D₁⁻¹ ∈ K | true (Chang 2.2.1(1)); normalisation breaks grading (Check) |
| same, choice of E | two composita | differ by an element of Aut(K̄/K) on coefficients | independence unchanged |
| `twisted_system_rigidity` | w=0, any ε | δ_∅ = 1 solves δ⁽¹⁾ = δ | hypothesis 0 < w needed, kept |
| same | q=3, w=2, γ=1 vs γ²=−1 | root sides t³−θ⁹ = (t−θ³)³; residual (1−γ)(t−t³)(t−θ³)² | pair solves only γ = 1 |
| same | q=2 | q−1 = 1 ∣ w and ε = 1 | hypothesis false, so vacuous (consistent with X_w a line) |
| same | (q−1)∤w, any ε | Case 1 of the source, valid for any ε | included in `hε` |
| `directIndices` / independence | q=2..5, w ≤ 3q−2 | weighted counts equal s(w) up to 3q−3; endpoint 1040/1042 (q=3), 733902/733908 (q=4), 3 = 3 (q=2) | count claimed only up to 3q−3 |
| same, q=2 | w = 1..4 | {(1)}, {(1,1)}, {(1,1,1),(1,2)}, three listed | matches Note §§5.6, 5.10 |
| old rule at q=2, w=4 | (1,1,1,1),(1,1,2),(1,2,1) | ζ(1,1,2)+D(ζ(1,1,1,1)+ζ(1,2,1)) = 0 through u³⁰ | dependent; Check |
| §3.5(1) whole-tuple | q=3, s=(2,2), Q=(1,t+θ⁴); Q=(1,0) | exponent ≤ −8·3^(d₂); tail term 3^(3^d); series 0 | (1) applies to full series only |
| §3.5(1) | q=2, s=(1), Q=1, j=1 | (−D⁻¹)² = D⁻² | holds |
| generating series | d=0; d=1 | both (1−x)⁻¹; both 1/(ℓ₁ + x^q − x) | holds |
| log_C domain | abs. value of term | q^(q/(q−1))·(abs(z)/q^(q/(q−1)))^(q^d) | converges iff abs(z) < q^(q/(q−1)) |
| Ω / π̃ | ρ ↦ ξρ, ξ ∈ Fˣ | π̃ ↦ ξπ̃; Ω⁽⁻¹⁾ = ρ^(q−1)(1−t/θ)Ω = (t−θ)Ω | normalisation independent of ρ |
| ABP / entire-from-equation | Φ = ((t−θ,0),(t−θ,1)); zero matrix | det t−θ, det Φ(0) = −θ; det 0 | both hypotheses hold; zero excluded |
| constant denominator | Φ_i = (1), U = 1/t; U = 1/(t−θ) | U⁽⁻¹⁾ = U, denominator t; 1/(t−θ^(1/q)) ≠ U | rational U needed (CPY19 misprint) |
| fixed fields | T, E, Frac(T), K̄(t) | F_q[t], F_q[t], F_q(t), F_q(t) | PAP08 §2.2, Lemma 3.3.2 |
| §1.7 Checks | q=3, q=2, alternating q=3 | residuals 0 through u³⁵/u³⁰; ζ(1)²−ζ(2) has leading term u³ | all hold |
| §5.7 Checks | q=2, w=1,2,3 | dimensions 0, 1, 2 = 1−1, 2−1, 4−2; relations vanish through u³⁰ | hold |
| `iSupIndep` contract | lines K̄·1, K̄·x | x = −1/D₁ ∈ K̄ gives the same line | Check stated |

## Ownership, sources, untrusted text

- **Ownership.** `zeta_algebra_graded` and `twisted_system_rigidity` state targets §3.9 and §4.6, which this roadmap already owns.
  - I searched by object with `roadmaps grep` over main and all 362 open roadmap PR heads (multizeta/Thakur, Frobenius difference/twisted system, Anderson–Brownawell–Papanikolas): no competing owner. I also searched the board packages in this checkout.
  - Packages on other board branches (the 20-entry board index) were not fetched, so ownership against them was not checked.
- **Sources.** No new source. In `sources.toml` I extended the locators of IKLNDP-NOTE (definition p. 3, §§5.1–5.10), CPY19 (Proposition 2.2.1, (2.3.1)), PAP08 (§2.2, Lemma 3.3.2), ABP04 (§§2.3–2.4) and AT90 (§§3.6–3.7). Nothing was added to `needs-references.toml`.
- **Untrusted text.** The review contained no instructions outside its findings; nothing suspicious.

## For the maintainer

- **The parent roadmap does not exist anywhere.** `DrinfeldModulesAndTModules` is not on main, not at any open roadmap PR head, and not among the board packages. Every parent interface this Part II uses is therefore a registered gap; there are now 14:
  - 5 new slugs: `parent-carlitz-omega`, `parent-twisted-analytic-rings`, `abp-entire-from-equation`, `frobenius-constant-denominator`, `frobenius-fundamental-matrix`;
  - `parent-abp-interface` now names the section DM.8/abp-lifting.
- **Lean names that changed:**
  - new: `zeta_algebra_graded`, `twisted_system_rigidity`;
  - signature changed: `direct_small_weight_independent` (no `hq`, bound 3q−2);
  - body changed: `directIndices`.

  No other roadmap cites these names.
- **Plan metadata.** The `detail` field of the `anderson-thakur-generating-series` gap in `design/plan.json` still carries a design-stage remark about the proof not being reread. Only `needs` was changed there.

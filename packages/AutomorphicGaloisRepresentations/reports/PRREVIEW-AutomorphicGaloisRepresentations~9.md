# Review of AutomorphicGaloisRepresentations (pull request #1007 at 79040a7)

**Verdict:** needs changes

This is an incremental re-review of the 105 lines changed since 34d87ef. It finds one P2, in the new splitting-independence route of §0.2e. The previous R01 is repaired. The gate passes, the dependency check is clean, and `Suggested.lean` elaborates with `sorry` as its only warning.

## R01 (P2) — §0.2e's splitting route needs a slash that the analytic coefficients do not have

**Location:** `TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md`, lines 1089–1092:

> "applies the conjugation invariance of CompactOperators §1.4 (…`charPowerSeries_conj`) to the slash by the conjugating element of GL2AutomorphicRepresentationsAndTransfer §R17.3.8c, a bounded isomorphism of form spaces intertwining the two controlling operators."

**Claim:** The route is stated at the generality of §0.2d's clause (lines 1029–1030), "under the hypotheses of §R17.3.8c on the conjugating element at the places of `P`". At that generality it fails, for two reasons.

- **The cited statement is about classical forms.** §R17.3.8c's "Splittings with nebentypus" (GL2AutomorphicRepresentationsAndTransfer README, lines 2008–2018 at its head) moves forms by the coefficient map `P ↦ P|h_v⁻¹`. It states this only for the classical spaces `M_{n,s}(U,ε;K)`, whose coefficients `L_{n,s}(K)` are `GL₂(K)`-modules. This README's own supplier contract (line 340) also restricts the change of splitting to "the classical forms".
- **The slash is not defined here.** On the analytic modules of §§0.2a–0.2b only `Σ₀(ϖ_v^t)` acts (§0.2a: "For `γ∈Σ₀(ϖ_v^t)` let `w_γ` …"). §R17.3.8c's two assumptions allow conjugating elements for which neither `h_v` nor `h_v⁻¹`, nor any scalar multiple of them, lies in `Σ₀(ϖ_v^t)`. For such an element, "the slash by the conjugating element" is not an operator on `A_{κ,r}`, so it gives no bounded isomorphism of form spaces.

The statement of §0.2d remains true, but by a different map: right translation. Both of §R17.3.8c's assumptions together force `j_v⁻¹(h_v)` to normalize the level component.

**Witness:** At `F_v=ℚ₂`, `t=1`, level `K₀(2)`, take `h_v=W=((0,1),(2,0))`.

- `WγW⁻¹=((d,c/2),(2b,a))` and `a≡d≡1` mod 2, so both assumptions hold.
- `W^{±1}` have `d`-entry 0, so neither lies in `Σ₀(2)`.
- `z↦1/(2z)` sends 1 to `1/2`.

**Repair:** In §0.2e, lines 1089–1092, replace the sentence from "The splitting independence applies" to "intertwining the two controlling operators." with:

> The splitting independence applies the conjugation invariance of CompactOperators §1.4 (Tau Ceti's `ContinuousLinearMap.IsPrCompact.charPowerSeries_conj`) to right translation `φ↦φ(·w⁻¹)` by `w=j_v⁻¹(h_v)`, for the conjugating element `h_v` of GL2AutomorphicRepresentationsAndTransfer §R17.3.8c. Its two assumptions make `w` normalize the level component `K₀(𝔭_v^t)` or `K₁(𝔭_v^t)` of §0.2d. The conjugate of that component is a subgroup of `Σ₀(ϖ_v^t)`, so it lies in the unit group `K₀(𝔭_v^t)`, and it has the same volume; the congruence on `d` keeps `K₁` inside `K₁`. Right translation is therefore an isometry of form spaces at every stage. It carries the operator of `UηU` for `j_v` to that of `Uw⁻¹ηwU` for `j′_v`, and `j′_v(w⁻¹ηw)=j_v(η)`, so it carries `U_P` to `U_P`. The coefficient map of §R17.3.8c, the slash by `h_v⁻¹`, acts on analytic coefficients only when `h_v∈F_v^×·K₀(𝔭_v^t)`.

Then make two further changes:

- Add `GL2AutomorphicRepresentationsAndTransfer §R17.3.8c` to the `*Needs:*` line of §0.2e (line 1188).
- Add this Check to §0.2e:

  > At `F_v=ℚ₂` and `t=1`, `h_v=((0,1),(2,0))` meets both assumptions of §R17.3.8c, since `h_vγh_v⁻¹=((d,c/2),(2b,a))` and every unit is 1 mod 2. But `z↦1/(2z)` sends 1 to `1/2∉ℤ₂`, so no slash by `h_v^{±1}` acts on `A_{κ,r}`. Right translation still applies, because `h_v` normalizes `K₀(2)`.

**Tested on the witness:**

- `W` normalizes `K₀(2)`: for even `c` and odd `a`, `d`, the matrix `((d,c/2),(2b,a))` lies in `K₀(2)`. A random check of 2000 integer matrices of `Σ₀(2)` with odd `a` found every conjugate in `Σ₀(2)` and `d`-congruent.
- With `w=j⁻¹(W)`, `φ′=φ(·w⁻¹)` satisfies `φ′(gu)=φ(gw⁻¹)|j(wuw⁻¹)=φ′(g)|j′(u)`.
- The coset representatives `y_t=w⁻¹x_tw` satisfy `j′(y_t)=j(x_t)∈Σ₁(2)`. So `(U_2φ)′` is the `j′`-operator of the double coset of `j′⁻¹(diag(2,1))`, and no slash by `W` occurs.
- The map is isometric for the norm `max_g|φ(g)|` (Buzzard-Eigenvarieties lines 2622–2623, p. 73).
- `U_P` is row compact (§0.2d), so `charPowerSeries_conj` applies.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 37–42 now read "on the unit-radius module R⟨z_σ⟩ of README §0.2a each slash operator … is a Tau Ceti weighted substitution …, and on the stages of README §0.2b, finite products of Tate algebras, it is a finite matrix of such substitutions".

The new R01 above is in text this head adds. It is not a regression of the previous repair. The previous report marked no finding "not actionable", so nothing is re-raised.

## Verified sound

### Gate, dependency check, Lean

- **Gate**, rerun by hand on this head: every check is 0, then `OK`, exit 0. The hand run prints no `build` field. The worker's gate at this head reports `build=0`, and my elaboration below agrees.
- **Dependency check:** `depcheck: 238 roadmaps, 2369 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. In `ORDER.txt`, the open suppliers cited by the changed text come before this roadmap: LocallyAnalyticDistributions is at line 44, GL2AutomorphicRepresentationsAndTransfer at line 99, and this roadmap at line 164. CompactOperators is on main.
- **Files:**
  - `git diff --stat origin/main...HEAD` outside the folder is empty.
  - The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 in 3.3 s. Its only warning is `declaration uses 'sorry'` at line 89.
- **Signatures:** I ran `#check @` on both declarations in one scratch copy.
  - `ordinaryGoodPrimes : {N : ℕ} → [NeZero N] → HeckeRing.GL2.Newform N 2 → Set (HeightOneSpectrum (𝓞 ℚ))`.
  - `fixedSquarefreeForm_ordinary_density_one` keeps `[NeZero N]`, `Squarefree N` and `f.χ = 1`.
  - No binder is lost, and both match README §7.7. This head changes only the docstring.
- **Signature tool:** `signatures.md` again reports a spurious declaration `for` at line 32. It comes from the docstring words "theorem for the automorphy factors".
- **One-tactic probe** on the §7.7 theorem:
  - `simp` makes no progress;
  - `rfl` fails;
  - `infer_instance` gives "type class instance expected".

  It is not padding.
- **Pins:** the branch and main manifests agree, with Mathlib `1b1ccf4b08…` and Tau Ceti `2fd255d997…`, and the docstring states the same pins.
- **Process words and never-cite list:** a grep of the added lines for process words, pull-request numbers, LaTeX and every never-cite roadmap finds nothing.

### Changed passages

- **Supplier paragraph** (README lines 226–255), checked at the Tau Ceti pin:
  - `TauCeti.MvPowerSeries.norm_restrictedWeightedSubstCLM_apply_le` (`TauCeti/RingTheory/MvPowerSeries/TateAlgebra/WeightedSubst.lean:105`) gives `‖restrictedWeightedSubstCLM g h hh f‖ ≤ ‖g‖ * ‖f‖` under `hh : ∀ i, ‖h i‖ ≤ r i`. That matches "bounds `‖g·f(h)‖` by `‖g‖‖f‖`" and "norm at most `‖j_κ(γ)‖`".
  - `ContinuousLinearMap.IsPrCompact.charPowerSeries_comp_comm` (`…/Nonarchimedean/PrModule/Basic.lean:180`) takes a row-compact `u : M →L[R] N` and any `v : N →L[R] M`. It concludes `(u.comp v).charPowerSeries = (v.comp u).charPowerSeries`.
  - `…charPowerSeries_conj` (line 198) takes a row-compact `u : M →L[R] M` and `e : M ≃L[R] N`.
  - Both theorems sit under `[NormOneClass R] [IsUltrametricDist R] [CompleteSpace R] [TauCeti.NormedRing.IsTate R]`. That is "Over the same scalars".
  - `IsPrCompact` (`RowCompact/PrModule.lean:105`) requires (Pr) presentations of both source and target. That matches "between two modules with property (Pr)".
  - The unit-radius scoping and the stage-matrix sentence are correct. They are computed in the table.
- **§0.2a** (lines 777–779): the norm-one sentence now cites the lemma, with `‖w_γ‖≤1` as `hh`. For `γ∈Σ₀(ϖ_v^t)`, `w_γ=b/d+(det γ/d²)z∑(−cz/d)^k` has integral coefficients tending to 0, so `hh` always holds.
- **§0.2a `*Needs:*`** (lines 857–861): the added name exists at the pin, as above.
- **§0.2b** (lines 875–881): the new sentences check out.
  - If `det γ` is a unit, then `a=(det γ+bc)/d` is a unit, so `γ∈K₀(𝔭_v^t)` and `γ⁻¹∈Σ₀`.
  - `|w_γ(z)−w_γ(z′)|=|det γ||z−z′|`, so `w_γ` is an isometry when `det γ` is a unit and a contraction otherwise.
  - Buzzard-Eigenvarieties lines 2593–2594 (p. 72) give the matching map `A_{κ,rm}→A_{κ,r}` for `|det γ_j|=m_j`.
- **§0.2b new Check** (lines 902–908): recomputed in the table. Both operators and the idempotent argument are correct.
- **§0.2e radius route** (lines 1092–1096): the route is sound.
  - With the links `cα=U_P` on stage `r` and `αc=U_P` on stage `r′` (§0.2d), `comp_comm` with `u=α` and `v=c` gives `H(U_P|_{r′})=H(U_P|_r)`.
  - Restriction to radius `r′<r` has matrix entries `binom(m,n)β^{m−n}ρ^n` with `|β|≤1` and `|ρ|=r′/r`, so row `n` is bounded by `(r′/r)^n`.
  - The clause "at every `v∈P`" is needed, as §0.2d's Check on an uncontracted variable shows.
- **§0.2e splitting route:** R01.
- **§0.2e slope summands and 𝕋** (lines 1097–1108):
  - CompactOperators §3.4 (main, README line 739) builds `M=ker Q*(u)⊕M_S`, with the first summand finite projective.
  - §3.5 (line 767): commuting bounded operators preserve the summands, and over a complete splitting field there is a common eigenvector.
  - §4.3 (line 805) gives the slope summands over `K` and over `R`.
  - The finiteness of 𝕋's image is correct. `End_R(P)` is a direct summand of `M_n(R)`, and a submodule of a finite module over Noetherian `R` is finite.
- **§0.2e Source paragraph** (lines 1160–1163):
  - CompactOperators Layers 1, 3 and 4 and §1.7 (`c0_completedBaseChange`, `charPowerSeries_map`) exist on main.
  - LocallyAnalyticDistributions §4.2 at its open head contains "Completed scalar extension of ON modules and determinants".
- **§0.2e `*Needs:*`** (lines 1188–1195): both added names exist at the pin.
- **Docstring** (`Suggested.lean` lines 35–43): this is the previous R01 repair, and it agrees with the supplier paragraph.

### Seeded source sample

The changed passages contain three of the sampled targets: 0.2a, 0.2b and 0.2e. The README flags no locator as unverified (grep: 0 hits).

| Target | Locator checked | Result |
|---|---|---|
| 0.2a | Buzzard-Eigenvarieties lines 2556–2594 (pp. 71–72): `A_{κ,r}=O(B_r×X)`, the action `n(cz+d)v(det γ)h((az+b)/(cz+d))`, and norm-decreasing when `n`, `v` have sup norm 1. This supports the norm-one sentence. | Supported |
| 0.2b | Buzzard-Eigenvarieties §10, lines 2531–2632 (pp. 70–73): the module attached to a weight. Lines 2593–2594: the contraction by `|det γ|`. | Supported |
| 0.2e | Now cites roadmaps only. CompactOperators §§1.4, 1.7, 3.4, 3.5, 4.3 on main and LocallyAnalyticDistributions §4.2 at its head, as above. | Supported. The splitting route is R01. |

The other sampled targets (0.1, 0.4, 3.7, 3.17, 4.9, 4.10, 4.11, 4.13, 5.4, 6.8, 6.11, 7.4) are unchanged since 34d87ef and were not re-read.

### Adversarial table

New rows, for the statements this head changes:

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Supplier: slash on `R⟨z_σ⟩` is `W(j_κ(γ),w_γ)` with norm ≤ `‖j_κ(γ)‖` | Trivial weight with `diag(p,1)`, `f=z`; `n(u)=u^k` with `((1,0),(p,1))`, `f=1`; non-member `((1,0),(1,1))` | `‖pz‖=p⁻¹≤1·1`. `j=(pz+1)^k` has Gauss norm 1, and `‖f|γ‖=1≤1`. `z/(z+1)` has coefficients `(−1)^{m−1}`, not tending to 0, so `hh` fails, as §0.2a's Check requires. | True |
| Supplier: on a stage, the slash is a matrix of weighted substitutions | `p=3`, `s=1`, `γ=((1,1),(0,1))`; `diag(3,1)` | First case: a permutation matrix with entries `W(1,w)`, `W(1,w)`, `W(1,1+w)`. Second: column 0 holds `W(1,3w)`, `W(1,1+3w)`, `W(1,2+3w)`, and the other entries are `W(0,·)=0`. The substituted series have Gauss norms `1/3, 1, 1 ≤ 1`. | True |
| §0.2b: unit `det` permutes discs; `|det γ|<1` merges them | `((1,0),(3,1))`; `((1,1),(0,1))`; `diag(3,1)` | `z/(3z+1)` sends discs 0, 1, 2 to discs 0, 1 (`1/4≡1`), 2 (`2/7≡2`). The translation cycles 0→1→2→0. `diag(3,1)`: `|3z−3z′|=|z−z′|/3`, and all three discs go into disc 0. | True |
| §0.2b new Check | `f` on discs `z=a+3w` | `((1,1),(0,1))`: disc 2 gets `f(3+3w)=f₀(1+w)`. `diag(3,1)`: disc `a` gets `f(3a+9w)=f₀(a+3w)`. `1_{3ℤ₃}` is an idempotent ≠ 0, 1, and `K⟨w⟩` is a domain. | True |
| §0.2e radius independence via `comp_comm` | `f↦f(pz)` at radius 1 and at radius `1/3` (`p=3`); a link uncontracted at one place | Radius 1: `H=∏(1−3^jT)`. Radius `1/3`: `(Uf)_a=f₀(a+3w)`, block lower triangular with zero blocks for `a≠0`, so again `H=∏(1−3^jT)`. Uncontracted `z₂`: the identity on `K⟨z₂⟩`, not row compact, so "every `v∈P`" is needed. | True |
| §0.2e splitting via the slash by `h_v` | `h_v=((1,0),(3,1))∈K₀(3)`; `h_v=((0,1),(2,0))` at `ℚ₂`, `t=1` | First: the slash is invertible, with inverse the slash by `((1,0),(−3,1))`. Second: §R17.3.8c's assumptions hold (2000 random checks, 0 failures), but the `d`-entries of `W^{±1}` are 0 and `z↦1/(2z)` sends 1 to `1/2`. No slash exists. | False at `q_v=2` (R01) |
| §0.2e splitting via right translation (repair) | the same `W` | `W` normalizes `K₀(2)`. `W⁻¹diag(2,1)W=diag(1,2)`, and `j′(w⁻¹ηw)=j(η)=diag(2,1)`. The norm `max|φ(g)|` is preserved. | True |
| §0.2e: 𝕋 preserves slope summands; finite image | `U=diag(1,p)` on `K²`, `Q=1−T`; `T=diag(α,β)` against `((0,1),(1,0))`; `R=K×K`, `P=eR` | `Q*(U)=U−1` has kernel `Ke₁`. The diagonal `T` preserves it and the swap does not, so commuting is needed. `End(eR)≅K` is finite. | True |
| Supplier: `comp_comm` and `conj` as described | `u=(1,1)ᵀ:K→K²`, `v=(a,b)`; `u=(1,0)ᵀ`, `v=(0,1)` | `det(1−T·uv)=1−(a+b)T=det(1−T·vu)`. The nilpotent `uv=((0,1),(0,0))` and `vu=0` both give `H=1`. | True |
| Docstring: slash on stages (repaired) | `p=3`, `s=1` | The same matrices as above. | True |

Rows carried from PRREVIEW r8 (at 34d87ef), for statements this head leaves untouched:

| Statement | Instances | Values (r8) | Result |
|---|---|---|---|
| Composition order of `restrictedWeightedSubstCLM_comp` | `(1+X,5X)` then `(X,X²)`, `f=X` | `125X³+125X⁴` on both sides; the reverse order gives `5X³+5X⁵`. | True |
| Action law: the cocycle and `w_{γδ}=w_γ∘w_δ` | `γ=((1,1),(5,1))`, `δ=((2,0),(5,3))`, `k=3`, `z=7/10` | `79/135` on both sides; `19683/8` on both sides. | True |
| Banach–Tate scalars have `‖1‖=1` | `K`; `K[ε]/ε²`; the norm `2|x|`; `R=0` | `‖px‖=p⁻¹‖x‖`. `‖1‖=2` refutes `IsTate`. | True |
| §0.2e `H_κ=det(1−T·BE)` | trivial stabiliser; sign stabiliser; two certificates; `p=2` | `∏(1−ϖ^jT)`; `H=1`; `BE=B′E`; `‖E_i‖≤2`. | True |
| Docstring: `BDeRham*` are bare rings | `#check @BDeRhamPlus` | It derives only `CommRing`. | True |
| Docstring: determinant laws | `det` against trace against `det²` | `det(sX)=s²det X`; `tr(1)=2≠1`; `det²` has degree 4. | True |
| Docstring: Layer 6 not statable | `Γ₀(88)`; 11a1 at `ℓ=5` | Char poly `x²(x²+2x+2)`; `ρ_𝔪≅1⊕χ̄₅`. | True |

Rows that r8 carried from r7 (at f8d3cf8) and r6 (at 0ae744f), still untouched:

| Statement | Instances | Values (r7/r6) | Result |
|---|---|---|---|
| §0.2a dyadic Check | `u=3`, `5`, `−1` | `v₂(log 3)=2`; `exp(log 3)=−3`; `exp(log(−1))=1`. | True |
| §0.2c unit Check | `ℚ(√2)`, `ε=1+√2` | `N(ε)=−1`; acts by `−1` at `w=1`. | True |
| §0.2e bound with `⌊·⌋₊` | `(2,1,1)`, `(3,1,2)`, `(1,1,½)`, `(2,1,−1)` | 6<8, 15<18, 2<3, 0<4. | True |
| §0.2f Bol over any field; small-slope criterion | `𝔽₂`; `e_v=2`, `v_p(μ)=¼` | `D²(N²L⁻¹)=0`; `|c/μ|=p^{−¼}<1`. | True |
| Conventions `λ_p`; §1.7 | `E₄`; `2Δ`; `Δ(3τ)` | `2160`; `−48`; `−24`; trace `9=λ₂`. | True |
| §0.1 | `ε_p`, `ϖ=p` | `φ=p⁻¹`. | True |
| §0.2a right action; scalars | `diag(p,1)`, `((1,0),(p,1))`; `2I` | `f(p/(p+1))` against `f(p/(p²+1))`; `2^k`, `2^{k+2}`. | True |
| §0.2c level/radius; `C_U` | `F=ℚ`; `N=5` | `p^s(k+1)`; order 2. | True |
| §1.1, §1.3, §3.3a, §3.15 | `𝔽₁₇`; `n=3`; 11a1 at 3; `y²=x³−x` at 5 | `a₁₇=2`; `648`; `X²+X+3`; `a₅=−2`. | True |
| §4.11, §6.4a, §6.7, §6.11, §7.3 | as in r6 | `t_H=t_N=0`; `p²` against `p³`; `a₇=−2`, `a₁₉=0`; sign kept; `24≤90.5`. | True |
| §7.7 and Lean (headline) | 11a1 at 3, 19, 11 | `−1∉(3)`, `0∈(19)`, `11∣11`. | True |

### Library declarations opened at the pins

- **Tau Ceti:**
  - `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/WeightedSubst.lean`, lines 90, 98, 105 and 115;
  - `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/AnalyticSubst.lean:178`;
  - `TauCeti/Analysis/Normed/Operator/Nonarchimedean/PrModule/Basic.lean`, lines 91, 148, 180, 198 and 208;
  - `TauCeti/Analysis/Normed/Operator/RowCompact/PrModule.lean`, lines 105, 144, 149, 279 and 290.
- **Mathlib:** this head cites no new Mathlib name.

### Cross-roadmap citations resolved

- **CompactOperators** (main): §1.4 at line 400, §1.7 at line 444, §3.4 at line 739, §3.5 at line 767 and §4.3 at line 805.
- **LocallyAnalyticDistributions** (open head): §4.2 at line 2145 of the head's README.
- **GL2AutomorphicRepresentationsAndTransfer** (open head): §R17.3.8c at line 1979 and its "Splittings with nebentypus" clause (lines 2008–2018).
- **Resolver leads:** `roadmaps resolve` reports no cross-roadmap citation found nowhere. Its two Lean-name leads, `Determinant.exists_realization_of_henselian` and `existsUnique_isCoefficientChange_of_compact`, sit in untouched text and were resolved by the previous report: they are at IntegralHeckeAndGaloisDeterminants `Suggested.lean`, lines 205 and 365.

### Ownership and overlaps

- **Overlaps:** `overlaps.md` reports no open pull request changing this roadmap and no dropped or revision-only id.
- **New objects:** the changed passages own no new object. `roadmaps grep` finds the three newly cited Tau Ceti names only in this README.

### Remarks on untouched text, and the previous remarks

- **Previous remarks:** all three r8 remarks on untouched text are now addressed by this head:
  - the slope-summand locator now points to CompactOperators §§3.4–3.5 and 4.3;
  - the norm-one sentence cites `norm_restrictedWeightedSubstCLM_apply_le`;
  - CompactOperators §1.4 is tied to `charPowerSeries_comp_comm` and `charPowerSeries_conj`.
- **Finitely many eigensystems:** "only finitely many eigensystems there (CompactOperators §3.5)", at lines 1106–1107, is a changed line. §3.5 supplies the common eigenvector. The finiteness is linear algebra on the finite-dimensional summand. No change is requested.

## Not verifiable

- **T. Saito, *Modular forms and p-adic Hodge theory*, Theorem 1 (`SaitoMFPH`):** recorded as uncertified (paywalled) and cited by its locator; that is settled.
- **Jacobs, equation (1.5.13), p. 19:** the extracted text loses the sign of the exponent of `(cz+d)`, as in earlier reports. It is unchanged and outside the changed passages.

## Source issues

- none

# Review of AutomorphicGaloisRepresentations (pull request #1007 at 480c64f)

**Verdict:** accepted

This is an incremental re-review of the 53 lines changed since 79040a7, all in `README.md` §§0.2d–0.2e. It finds no defect. The previous R01 is repaired, and the repair introduces no new problem. The gate passes, the dependency check reports no problem, and `Suggested.lean`, unchanged since 79040a7, elaborates with `sorry` as its only warning.

## Previous findings

- R01 — repaired: README lines 1096–1106 now read "Right translation `R:φ↦φ(·w⁻¹)` then carries forms for `j_v` to forms for `j′_v` at the same level and stage … so it intertwines the two operators `U_P`." The repair also cites `charPowerSeries_conj` for a non-isometric equivalence, adds the three Checks and adds §§R17.3.8b–R17.3.8d to *Needs:*.

The previous report marked no finding "not actionable", so nothing is re-raised.

## Verified sound

### Gate, dependency check, Lean

- **Gate**, rerun by hand on this head: every check is 0, then `OK`, exit 0. The hand run prints no `build` field. The worker's gate at this head reports `build=0`, and my elaboration agrees.
- **Dependency check:** `depcheck: 239 roadmaps, 2381 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. In `ORDER.txt` the suppliers cited by the changed text come first: GL2AutomorphicRepresentationsAndTransfer is at line 98, and this roadmap at line 164. CompactOperators is on main.
- **Files:** `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`. `git diff 79040a7 HEAD` touches only `README.md`.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 in 9.2 s. Its only warning is `declaration uses 'sorry'` at line 89.
- **Signatures:** I ran `#check @` on both declarations in one scratch copy.
  - `ordinaryGoodPrimes : {N : ℕ} → [NeZero N] → HeckeRing.GL2.Newform N 2 → Set (HeightOneSpectrum (𝓞 ℚ))`.
  - `fixedSquarefreeForm_ordinary_density_one` keeps `[NeZero N]`, `Squarefree N` and `f.χ = 1`.
  - No binder is lost. Both match README §7.7, and nothing changed.
- **Signature tool:** `signatures.md` again lists a spurious declaration `for` at line 32. It comes from the docstring words "theorem for the automorphy factors".
- **One-tactic probe** on the §7.7 theorem: `simp` makes no progress, and `rfl` fails because `ordinaryGoodPrimes f` is not definitionally `1`. It is not padding.
- **Text:** a grep of the added lines for process words, pull-request numbers and round labels finds nothing. The gate's LaTeX, never-cite and statement-hygiene counts are 0.

### Changed passages

**§0.2d** (line 1030). The clause now reads "on the splitting, up to the right translation of §0.2e". The operators for `j_v` and `j′_v` act on different spaces, so "up to `R`" is the correct form of the claim. It points forward to §0.2e, where the determinant is also defined. §0.2d's own targets (certificates, compactness, links) do not use it, so there is no cycle.

**§0.2e splitting route** (lines 1088–1111), checked step by step against GL2AutomorphicRepresentationsAndTransfer at its open head:

- **`j′_v(x)=j_v(w_vxw_v⁻¹)`** with `w_v=j_v⁻¹(h_v)`: immediate from `j′_v=h_vj_vh_v⁻¹`.
- **Normalizing the level:**
  - `j′_v(U_v)=h_vU′h_v⁻¹` lies in `Σ₀(ϖ_v^t)` by §R17.3.8c's first assumption (head README lines 2008–2018).
  - A subgroup of a monoid lies in its units. The units of `Σ₀(ϖ_v^t)` are `K₀(𝔭_v^t)` (§R17.3.8a, head line 1847), because `a=(det+bc)/d` is a unit.
  - For `U′=K₁`, the second assumption gives `d(hγh⁻¹)≡d(γ)≡1`.
  - `GL₂(F_v)` is unimodular, so a compact open subgroup contained in `U′` with the same volume equals `U′`.
  - `U` is a product `U^vU_v`, as §R17.3.8d's operators already require, so `w` normalizes `U`.
- **`R` maps forms to forms:** `Rφ(gu)=φ(gw⁻¹·wuw⁻¹)=Rφ(g)|j_v(wuw⁻¹)=Rφ(g)|j′_v(u)`, and left `D^×`-invariance is untouched.
- **Norms:**
  - Because `w` normalizes `U`, `{c_iw}` is a set of class representatives, and `Rφ(c_iw)=φ(c_i)`.
  - The stabilisers are `w⁻¹Γ_iw`, and they act through `j′_v(w⁻¹sw)=j_v(s)`. So in block coordinates `R` is the identity, hence an isometry.
  - For other representatives, §R17.3.8b's norm comparison applies (head line 1942: the new norm lies between `C_U⁻¹` and `C_U` times the old one).
- **Intertwining:**
  - With `y_t=w⁻¹x_tw`, `R(T_ηφ)(g)=Σφ(gy_t⁻¹w⁻¹)|j′_v(y_t)=T′_{w⁻¹ηw}(Rφ)(g)`.
  - `Uw⁻¹ηwU=⊔Uy_t`, and `w⁻¹ηw∈Δ′` because `j′_v(w⁻¹ηw)=j_v(η)∈Σ₀`.
  - For `η=j_v⁻¹(diag(ϖ_v,1))`, `w⁻¹ηw` is exactly `j′_v⁻¹(diag(ϖ_v,1))`, so `U_v` goes to `U_v`. At the other places `w⁻¹ηw=η`.
- **Lemma:** `charPowerSeries_conj` (Tau Ceti `TauCeti/Analysis/Normed/Operator/Nonarchimedean/PrModule/Basic.lean:198`) takes a row-compact `u : M →L[R] M` and an equivalence `e : M ≃L[R] N`, and its docstring says `e` "need not be an isometry". This is the README's wording. `U_P` is row compact by §0.2d.
- **`K₀` case:** if `h_v∈K₀(𝔭_v^t)`, then `w∈U` and `φ(gw⁻¹)=φ(g)|h_v⁻¹`. That is §R17.3.8c's coefficient map. The clause "need not act" is correct: for `h_v∈K₀` at a `K₁` level, the coefficient map acts and differs from `R` by a diamond operator.

**§0.2e Checks** (lines 1205–1218) are recomputed in the table below. **§0.2e *Needs:*** (lines 1220–1221) adds §§R17.3.8b–R17.3.8d, which are the three sections the route uses: norms and representatives, the splitting assumptions, and the operators.

**Text that cites the changed passages.** The supplier paragraph (lines 249–255) says `charPowerSeries_conj` gives invariance "under conjugation by a continuous linear equivalence" and "carr[ies] the … splitting independence of §0.2e". That still matches the new route. §0.2f's *Needs:* (line 1357) cites §§0.2a–0.2e and is unaffected.

### Seeded source sample

None of the sampled targets (0.2, 1.3, 1.6, 3.1, 3.3a, 3.7, 3.9, 3.10, 4.2, 6.12, 7.1, 7.3, 7.4, 7.6, 7.7) falls in the changed passages: §0.2 at line 718 is a different section from §§0.2d–0.2e. The changed text cites roadmap sections and a pinned declaration only, with no new source locator. The README flags no locator as unverified (grep: 0 hits). So no source was re-read in this round.

### Adversarial table

New rows, for the statements this head changes:

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §0.2e: §R17.3.8c's assumptions make `w` normalize the level | `ℚ₂`, `t=1`, `h=((0,1),(2,0))`, level `K₀(2)`; `ℚ₃`, `t=1`, `((0,1),(3,0))`, levels `K₀(3)` and `K₁(3)` | `hγh⁻¹=((d,c/2),(2b,a))`; for `γ=((3,5),(4,7))` it is `((7,2),(10,3))`. All 3000 random elements of `K₀(2)` and of `K₀(3)` conjugate into `K₀`. Assumption 2 at `ℚ₂`: 4908 pairs, 0 failures. At `ℚ₃`, `diag(2,1)∈K₁(3)` goes to `diag(1,2)∉K₁(3)`, so assumption 2 is needed for `K₁`. | True |
| §0.2e: `R` carries `j`-forms to `j′`-forms and `T_η` to `T′_{w⁻¹ηw}` | Finite model: `G=S₄`, `Γ=⟨(0 1)⟩`, `U=V₄`, `w` a 3-cycle (normalizes `V₄`, not in it), coefficients `ℤ⁴` with `a\|x=a∘x` | Every `Rφ` satisfies the `j′` transformation law. `R∘T_η=T′_{w⁻¹ηw}∘R` holds for 8 random `η`, with 3 nonzero forms each. The wrong conjugate `wηw⁻¹` gives a different operator for 12 of the 24 `η`. | True |
| §0.2e: `U_2` goes to `U_2` at `ℚ₂` (Check) | `x_α=((2,0),(2α,1))`, `α=0,1`; `y_α=h⁻¹x_αh` | `j(y_0)=diag(1,2)`, `j(y_1)=((1,1),(0,2))`, and `j′(y_α)=x_α`. `j_v(w⁻¹ηw)=h⁻¹diag(2,1)h=diag(1,2)`, and `j′_v(w⁻¹ηw)=diag(2,1)`. | True |
| §0.2e Check: no slash by `h^{±1}` at `ℚ₂` | `h=((0,1),(2,0))`, `h⁻¹=((0,½),(1,0))` | The lower-right entries are 0 and 0. Both Möbius maps are `z↦1/(2z)`, and `1↦½` with `v₂(½)=−1`. | True |
| §0.2e Check: `ℚ₃` element fails assumption 2 | `((0,1),(3,0))`, `γ=diag(2,1)` | The conjugate is `diag(1,2)`, so `d` changes from 1 to 2, and `2≢1 (mod 3)`. Control: the Atkin–Lehner element at `ℚ₂`, `t=2`, sends `diag(3,1)` to `diag(1,3)`, and `3≢1 (mod 4)`, so the `ℚ₂`, `t=1` example is special to `t=1`. | True |
| §0.2e Check: `K₀` case | `h=((1,1),(3,4))∈K₀(3)` | `w∈U`, so `φ(gw⁻¹)=φ(g)\|h⁻¹`. `φ(gu)\|h=(φ(g)\|h)\|(h⁻¹j(u)h)` by the right-action law. All 2000 random conjugates `h⁻¹K₀(3)h` stay in `K₀(3)`. | True |
| §0.2e: `charPowerSeries_conj` applies to `R` | the signature at the pin | It needs only `u.IsPrCompact` and `e : M ≃L[R] N` with `N : Type u`; the docstring says "need not be an isometry". | True |
| §0.2d: "up to the right translation of §0.2e" | operators for `j` and `j′` | They act on `M_j` and `M_{j′}` respectively, and `U_P^{j′}=R U_P^j R⁻¹`. | True |

Rows carried from PRREVIEW r9 (at 79040a7), for statements this head leaves untouched:

| Statement | Instances | Values (r9) | Result |
|---|---|---|---|
| Supplier: slash on `R⟨z_σ⟩` is `W(j_κ(γ),w_γ)` with norm ≤ `‖j_κ(γ)‖` | `diag(p,1)`, `f=z`; `((1,0),(p,1))`; `((1,0),(1,1))` | `‖pz‖=p⁻¹`; `‖f\|γ‖=1`; `z/(z+1)` has coefficients `(−1)^{m−1}`, so `hh` fails. | True |
| Supplier: on a stage, the slash is a matrix of weighted substitutions | `p=3`, `γ=((1,1),(0,1))`; `diag(3,1)` | A permutation matrix; column 0 holds `W(1,3w)`, `W(1,1+3w)`, `W(1,2+3w)`. | True |
| §0.2b: unit `det` permutes discs; `\|det γ\|<1` merges them | `((1,0),(3,1))`; translation; `diag(3,1)` | Discs 0→0, 1→1, 2→2; 0→1→2→0; all three discs go into disc 0. | True |
| §0.2b Check | discs `z=a+3w` | `f₀(1+w)`; `f₀(a+3w)`; `1_{3ℤ₃}` idempotent. | True |
| §0.2e radius independence via `comp_comm` | `f↦f(3z)` at radii 1 and `1/3`; an uncontracted `z₂` | `H=∏(1−3^jT)` on both; the identity on `K⟨z₂⟩` is not row compact. | True |
| §0.2e: 𝕋 preserves slope summands; finite image | `U=diag(1,p)`; `diag(α,β)` against the swap | `ker(U−1)=Ke₁`, preserved by the diagonal and not by the swap. | True |
| Supplier: `comp_comm`, `conj` | `u=(1,1)ᵀ`, `v=(a,b)`; nilpotent | `1−(a+b)T` on both sides; `H=1` on both. | True |
| Composition order of `restrictedWeightedSubstCLM_comp` (r8) | `(1+X,5X)` then `(X,X²)` | `125X³+125X⁴` on both sides. | True |
| Action law (r8) | `γ=((1,1),(5,1))`, `δ=((2,0),(5,3))`, `k=3`, `z=7/10` | `79/135`; `19683/8`. | True |
| Banach–Tate `‖1‖=1` (r8) | the norm `2\|x\|` | `‖1‖=2` refutes `IsTate`. | True |
| §0.2e `H_κ=det(1−T·BE)` (r8) | trivial and sign stabilisers; `p=2` | `∏(1−ϖ^jT)`; `H=1`; `‖E_i‖≤2`. | True |
| Docstring: Layer 6 not statable (r8) | `Γ₀(88)`; 11a1 at 5 | `x²(x²+2x+2)`; `1⊕χ̄₅`. | True |
| §0.2a dyadic Check (r7) | `u=3`, `5`, `−1` | `v₂(log 3)=2`; `exp(log(−1))=1`. | True |
| §0.2c unit Check (r7) | `ℚ(√2)`, `ε=1+√2` | `N(ε)=−1`, which acts by `−1`. | True |
| §0.2e bound with `⌊·⌋₊` (r7) | `(2,1,1)`, `(3,1,2)`, `(1,1,½)`, `(2,1,−1)` | 6<8, 15<18, 2<3, 0<4. | True |
| §0.2f Bol; small slope (r6) | `𝔽₂`; `v_p(μ)=¼` | `D²(N²L⁻¹)=0`; `p^{−¼}<1`. | True |
| Conventions, §§0.1, 0.2a, 0.2c, 1.1, 1.3, 3.3a, 3.15, 4.11, 6.4a, 6.7, 6.11, 7.3 (r6) | as in r6 | `2160`; `φ=p⁻¹`; `p^s(k+1)`; `a₁₇=2`; `648`; `X²+X+3`; `a₅=−2`; `t_H=t_N=0`; `a₇=−2`; `24≤90.5`. | True |
| §7.7 and Lean (headline) (r6) | 11a1 at 3, 19, 11 | `−1∉(3)`, `0∈(19)`, `11∣11`. | True |

### Library declarations opened at the pins

- **Tau Ceti** at `2fd255d997…`: `TauCeti/Analysis/Normed/Operator/Nonarchimedean/PrModule/Basic.lean`, lines 122 (the section scalars), 148, 180 and 198.
- **Mathlib:** this head cites no new Mathlib name.

### Cross-roadmap citations resolved

- **GL2AutomorphicRepresentationsAndTransfer** (open head):
  - §R17.3.8a's monoids at line 1847 (`K₁` means `d≡1`);
  - §R17.3.8b at line 1900, with its norm comparison at line 1942;
  - §R17.3.8c at line 1979, with "Splittings with nebentypus" at lines 2008–2018;
  - §R17.3.8d at line 2084.
- **CompactOperators** (main): §1.4 "Cyclicity and invariance" at line 400.
- **Resolver:** `roadmaps resolve` reports no cross-roadmap citation found nowhere. Its two Lean-name leads are in untouched text and were resolved in earlier reports, at IntegralHeckeAndGaloisDeterminants `Suggested.lean`, lines 205 and 365.

### Ownership and overlaps

- **Overlaps:** `overlaps.md` reports no open pull request changing this roadmap and no dropped or revision-only id.
- **Ownership:** the changed text owns no new object. `roadmaps grep` for right translation near "splitting" finds only this README, plus one unrelated metaplectic hit. GL2AutomorphicRepresentationsAndTransfer owns the classical change of splitting, and the supplier contract (line 340) still assigns it only that.

## Not verifiable

- **T. Saito, *Modular forms and p-adic Hodge theory*, Theorem 1 (`SaitoMFPH`):** recorded as uncertified (paywalled) and cited by its locator; that is settled. It is outside the changed passages.

## Source issues

- none

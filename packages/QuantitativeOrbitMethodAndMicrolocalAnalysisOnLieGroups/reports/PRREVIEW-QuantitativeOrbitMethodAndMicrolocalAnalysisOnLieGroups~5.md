# Review of QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups (pull request #1842 at 1678559)

**Verdict:** accepted

Incremental re-review of 9 changed lines (5 insertions, 4 deletions) in the folder since ee22726. The commit renames the local instance in `Suggested.lean` (the repair of R01) in three places and rewords one clause of the module docstring about the BCH coefficients. Both are correct at the pins. The gate passes, the file elaborates, and this review has no findings.

## Previous findings

- R01 — repaired: `Suggested.lean:81` `attribute [local instance] LieGroup.minSmoothness_of_isRCLikeNormedField`; the same name in the docstring (`Suggested.lean:70`) and in `README.md:56` ("supplied by `LieGroup.minSmoothness_of_isRCLikeNormedField` (`TauCeti/Geometry/Lie/Basic.lean`), a local instance in Suggested.lean").

## Verified sound

**What changed.** `git diff ee22726..HEAD`: one commit and two files: `README.md` (1 line) and `Suggested.lean` (6 lines), as in `scratch/changes.md`. `git diff --stat origin/main...HEAD` outside the folder: empty. `lake-manifest.json` and `lean-toolchain` did not change since ee22726 and equal main's (`origin/main` = `71c8f21`). The pins are Tau Ceti `2fd255d`, Mathlib `1b1ccf4` and toolchain `v4.36.0-rc2`, the same ones the previous report reviewed against.

**The R01 repair at the pin.** Tau Ceti `2fd255d`, `TauCeti/Geometry/Lie/Basic.lean:45`: `LieGroup.minSmoothness_of_isRCLikeNormedField [IsRCLikeNormedField 𝕜] {n : ℕ∞ω} [LieGroup I n G] : LieGroup I (minSmoothness 𝕜 n) G`. It is a theorem that files opt into as a local instance, which matches the README's "a local instance in Suggested.lean". Mathlib `1b1ccf4`, `Analysis/Calculus/FDeriv/Symmetric.lean:497–502` defines `minSmoothness 𝕜 n := if IsRCLikeNormedField 𝕜 then n else ω`, so over ℝ it equals `n`. `mulInvariantExp` (`TauCeti/Geometry/Lie/Exponential/Basic.lean:56`) still requires `[LieGroup I (minSmoothness ℝ 3) G]`, and the theorem at `n = 3` supplies exactly that. The README's "`C³` regularity" is therefore accurate. Every occurrence of the old name is gone: a grep of the folder finds `minSmoothnessThree` 0 times.

**Gate and direction.** I ran the gate on this head myself:
- Every text check is zero: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.
- The worker's gate at the same head also reports `build=0`.
- The dependency check gives `depcheck: 233 roadmaps, 2263 edges, 0 problem(s)`. It prints no UPWARD, CYCLE or moved line; the roadmap is at line 295 of the merge order.
- `scratch/overlaps.md`: no other pull request changes this roadmap, and no cited id is dropped or defined only by an open revision.
- `scratch/citations.md`: no unresolved citation and no unresolved Lean name. The new backticked name resolves at the pin, as shown above.

**Elaboration.**
- `lake env lean` on `Suggested.lean` exits 0. The only output is seven `declaration uses sorry` warnings, at lines 115, 171, 184, 200, 221, 239 and 253; each is one line lower than before because the docstring gained a line.
- Negative control: a scratch copy without line 81 fails at line 103 (`quantize`) with `failed to synthesize LieGroup 𝓘(ℝ, E) (minSmoothness ℝ 3) G`. The local instance is needed, and it is the renamed one that discharges the goal.
- `#check @name` on all 13 declarations in one scratch file: each elaborated type is identical, after whitespace normalization, to the type recorded in `scratch/signatures.md`. These are also the types the previous reports compared with the README. No binder was lost; for example, `quantize` keeps `[LieGroup 𝓘(ℝ, E) ∞ G] [T2Space G] [FiniteDimensional ℝ E] [CompleteSpace V]`.
- The file still has the single `import Mathlib` plus the two `TauCeti.*` modules, whose `.olean` files exist at the pin, and no `set_option`.

**The reworded docstring clause (`Suggested.lean:40–44`).** It now says that the pins have only the local logarithm "with its expansion through the bracket term". I checked this at Tau Ceti `2fd255d`:
- What the pins have:
  - `lieLog` (`Geometry/Lie/Exponential/LocalInverse.lean:280`).
  - The germ `lieLocalBCH` (`Geometry/Lie/Exponential/BCH/Basic.lean:89`) and its smoothness at the origin (`:161`).
  - The bracket term `isBigO_lieLocalBCH_representative_sub_bracket` (`BCH/Bracket.lean:235`): `bch X Y − (X + Y + ½⁅X,Y⁆) = O(‖(X,Y)‖³)`.
  - For units of normed algebras, `NormedSpace.isBigO_log_exp_mul_exp_sub_firstOrder` (`Analysis/Normed/Algebra/BCH/FirstOrder.lean:154`), to the same order.
- What they lack: no file at the pin has a cubic or higher BCH term (a grep for Campbell/BCH finds seven files: the four named above, `Units/BCH.lean`, and two docstrings in `Analysis/Normed/Algebra/Exponential.lean` and `Logarithm/Basic.lean`; none states a term beyond the bracket).
- The clause therefore describes the pins correctly.
- Its conclusion still holds. In the README's §1.2 formula, `C_j` collects the monomials `x^α y^β ζ^γ` of `e^{{x,y}ζ}` with `|α| + |β| − |γ| = j`. The cubic term of `{x,y}`, which is `(1/12)(⁅x,⁅x,y⁆⁆ + ⁅y,⁅y,x⁆⁆)` up to the sign convention, has `|α| + |β| = 3` and `|γ| = 1`, so it already contributes to `C_2`. So `C_j` for j ≥ 2 needs Taylor data the pins do not identify. The smooth germ makes iterated derivatives definable, but writing the `c_{αβγ}` from them is still the long encoding the docstring declines.
- Independently, the bullet's first reason (no Sobolev scale or Nelson operator at the pins) is unchanged and is enough for non-statability.
- This answers the remark of the previous report.

**Seeded sample.** Of the sampled targets, only §0.5 (`quantize`) depends on a changed passage, through the local instance its definition needs. I checked its locators against nv21, the Acta Math. 226 text in the sources cache, read with a text extraction in scratch:
- §2.2, p. 25: the cutoff class (smooth with compact support in the neighbourhood, even, valued in [0,1], equal to 1 near 0).
- (2.1), p. 25 and (2.2), p. 26: `Op` and its rescaled form `Op_h`.
- §2.3, p. 26: the adjoint is `Op(ā, χ)`.
- §2.4, p. 26: the equivariance identity, under the hypothesis `Ad(g) supp χ ⊆ 𝒢`.
- Lemma 8.8, p. 61: `‖Op_h(a)‖ ≤ ‖a^∨‖_{L¹}`. The README's `‖χ a^∨‖_{L¹}` is at most this because 0 ≤ χ ≤ 1, and it has the same one-line proof.
- Proposition 8.7(ii), p. 61: δ ∈ [0, 1/2), with a bound uniform in h. This is the locator of `exists_norm_quantize_le`, whose statement did not change.

The other sampled targets (§§2.1, 2.4, 2.7, 3.1, 3.4, 3.7, 4.4, 4.6, 6.1, 7.4, 7.6, 8.3, 8.5, 9.5) are untouched and were verified in the full review. The README flags no locator as unverified.

**Not re-run, because the statements did not change.** The one-tactic padding probe, the headline audit, the duplication and ownership audit, and the declared gaps all stand as in the previous reports. Ownership against open pull requests was re-checked only through `scratch/overlaps.md` and `scratch/citations.md`, which report nothing.

**Adversarial pass.** There are three new rows, one for each changed statement and one for the sampled §0.5. The rows of the previous reports are carried forward unchanged and marked with the report that computed them: r4 is the report at ee22726, r3 at d8dd99f, r2 at 70c9a0e and r1 at 3cf9ad8.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `Suggested.lean:81` local instance `LieGroup.minSmoothness_of_isRCLikeNormedField` | 𝕜 = ℝ, n = 3, `G` with `[LieGroup 𝓘(ℝ, E) ∞ G]`; the line deleted; a non-RCLike field (ℚ_p) | `minSmoothness ℝ 3 = (if IsRCLikeNormedField ℝ then 3 else ω) = 3`. With the line: 0 errors, 7 sorry warnings. Without it: line 103 `failed to synthesize LieGroup 𝓘(ℝ, E) (minSmoothness ℝ 3) G`. Over ℚ_p: `minSmoothness = ω` and the `IsRCLikeNormedField` hypothesis fails, so the theorem does not apply (the file uses only ℝ) | needed and sufficient; all 13 types unchanged | none |
| `README.md:56` supplier contract for `mulInvariantExp` | Tau Ceti `2fd255d`, `Geometry/Lie/Basic.lean:45`; `Exponential/Basic.lean:56` | the theorem's conclusion at n = 3 is `LieGroup I (minSmoothness ℝ 3) G`, which is exactly `mulInvariantExp`'s instance argument; "C³" = `minSmoothness ℝ 3` = 3 | name, file and role correct | none |
| `Suggested.lean:40–44` BCH clause | Heisenberg `[X,Y] = Z`; generic 𝔤 at order 3 | Heisenberg: `{x,y} = ½[x,y]` exactly, so C₂ comes from the square of the bracket term. Generic: the cubic `{x,y}` term has `|α|+|β| = 3` and `|γ| = 1`, which gives j = 2. The pin stops at `O(‖(X,Y)‖³)` (`BCH/Bracket.lean:235`) | describes the pins correctly; the C_j encoding remains not statable | none |
| (sample) §0.5 locators | nv21 pp. 25–26, 61 | the cutoff class has 3 conditions plus compact support; (2.1) p. 25, (2.2) p. 26; the adjoint `Op(ā,χ)`; equivariance under `Ad(g) supp χ ⊆ 𝒢`; Lemma 8.8: `‖Op_h a‖ ≤ ‖a^∨‖_{L¹}` ≥ the README's `‖χa^∨‖_{L¹}`; Prop. 8.7(ii) with δ < 1/2 | locators and hypotheses match | none |
| (r4) `quantize` instance resolution (R01) | pin `2fd255d` | at ee22726: `Unknown constant LieGroup.minSmoothnessThree` and line 103 unsynthesized; with the rename: 0 errors | repaired at this head (row 1 above) | none |
| (r3) Line 179 contract and §8.6 Check 2 | `S = SO(2)`, `Γ = {1}`, standard representation on ℝ² | SO(2) compact ⇒ `{1}` a lattice; rotation by θ has eigenvalues `e^{±iθ}`, unipotent iff θ ∈ 2πℤ, unipotent set `{1}`; closure `{1} ⊇ {1}` (lattice form holds); `borel_density_zariski` conclusion: `{1} ≠ SO(2)` (fails); `borel_density_unipotent_generated` conclusion: line `ℝ(1,0)` is Γ-invariant, not SO(2)-invariant (fails); supplier hypothesis fails too (SO(2) has no nontrivial unipotent one-parameter subgroup) | Check correct; each name now attached to the statement the supplier gives it | none |
| (r2) §8.6 lattice form, Check 1 | `S = {[[1,t],[0,1]]}`, `Γ = ℤ`; `Γ = {1}` | polynomial restricted to S is a polynomial in t; vanishing on ℤ ⇒ zero, closure = S; `{1}` infinite covolume, closure `{1}` ∌ `t = 1` | lattice hypothesis needed | none |
| (r2) §8.6 lattice form, Check 3 | `u = [[1,1],[0,1]]`, `v = (0,1)ᵀ` | `Nv = (1,0)ᵀ`, `N²v = 0`; `[(1,1/n)] → [(1,0)]`, unique fixed line; point mass forced; rotation-invariant measure has no atom | correct | none |
| (r2) §8.6 lattice form, step 1 | `k = 0`; `S/Γ_S` with full-support Haar | `Λ⁰W` scalar line fixed; conull closed right-Γ_S-stable set is S; `s = 1` gives `ρ(u)W = W` | sound | none |
| (r2) §8.6 lattice form, step 2 | `V_d = det^{−d}·(deg ≤ d)`; `f = x₁₁⁵` | `R_g(det^{−d}q) = det(g)^{−d}det(x)^{−d}q(xg)`, V_d R-stable; `det^{−5}x₁₁⁵ ∈ V_5`, `det u = 1` | route sufficient | none |
| (r2) §8.6 lattice form, GL vs SL | `S = ℝ^× ⊂ GL₁`, `Γ = {±2ⁿ}` | unipotent set `{1}`; closure of Γ in `ℝ[x,x⁻¹]` is `ℝ^×` | consistent | none |
| (r2) §8.6 route, density step | `Γ_S s U` dense, `Z := Zcl(Γ_S)(ℝ) ∩ S` | `Γ_S s U ⊆ Z s` closed ⇒ `Z s = S` ⇒ `Z = S` | sound, matches nv21 (27.5) | none |
| (r2) §8.6 route, ergodic kernel | compact `Γ\G_∞`, U locally compact second countable | kernel values U-invariant, U-ergodic a.e., `μ = ∫ κ(x) dμ` | hypotheses of `exists_actionErgodicKernel` met | none |
| (r2) §8.6 route, Poincaré in Mathlib | `ℝP^{m−1}`, `f = Λ^kρ(u)` | `IsFiniteMeasure`, second countable, opens measurable, `MeasurePreserving` ⇒ a.e. recurrence | Mathlib statements cover Lemma 4.7.3 | none |
| (r1) Conventions Fourier sign | `b(η)=e^{−π(η−1)²}`, x = 1/4 | `−i·e^{−π/16}` vs `+i·e^{−π/16}` vs `e^{−ix}e^{−x²/(4π)}` | separates the three conventions | none |
| (r1) §0.1 forward kernel | indicator of [0,1] at η = 1, 1/2 | `0`; `2i/π`; Mathlib kernel `−2i/π` | correct | none |
| (r1) §0.1 density j | SU(2), ax+b | `j = (sin(|x|/2)/(|x|/2))²`; `j(−x)=e^{x₁}j(x)` | even iff unimodular | none |
| (r1) §0.2 Nelson operator | character `e^{itx}`; trivial rep | `Δ = 1 + t²`; `Δ = 1` | sign pinned | none |
| (r1) §0.3 Definition 3.1 | identity; `dπ(∂_x)`; `e^{ix²}` multiplier | commutators 0 / order 1 / `[∂_x, M] = 2ixM` unbounded | `Ψ⁰ ⊊` bounded | none |
| (r1) §0.5 `quantize` | `E = 0`; character with inactive cutoff; `M = 0` | `b(0)·v`; `b(t/2π)·v`; bound 0 | consistent, not vacuous | none |
| (r1) §0.5 adjoint | even real χ | `conj(a^∨(−x)) = (ā)^∨(x)` | `Op(a)* = Op(ā)` | none |
| (r1) §1.2 `C₁` | linear symbols | `C₁(a,b) − C₁(b,a) = ξ([x₀,y₀])` | factor ½ forced | none |
| (r1) §1.2 `C₂` Heisenberg | `[X,Y]=Z` | `{x,y} = ½[x,y]`; `e^z − 1 − z = −ε²/2+…` | `C₂ ≠ 0` | none |
| (r1) §1.9 bound vs L¹ | `a_K = θ(ξ)ψ(2^{−K}ξ)` | `‖a_K^∨‖_{L¹} ≍ K`; telescoped L¹ ≤ `2‖ψ^∨‖` | strictly stronger than L¹ | none |
| (r1) §1.10 symmetrization | Weyl algebra `X=q, Y=∂, Z=−1` | `sym(⟨ξ⟩⁴) = Δ² − Z²` | correct | none |
| (r1) §2.1 SL₂ parameters | `I(s)`, `D_k` | `λ(H) = ±s`; `k − 1` | ρ-shift consistent | none |
| (r1) §2.4(ii) | quadratic Casimir | `γ(sym p) − p = −|ρ|²` | consistent | none |
| (r1) §2.6 a-priori estimate | `G = H = {1}`, `a(h) = e^{1/h}` | `e^{1/h} > h^{−M}` | boundedness hypothesis present | none |
| (r1) §2.7 invariant distance | `q(x) = x²`, `x = h^δ` vs `h^{δ/2}` | `h^{2δ} < h^δ` vs `h^δ` | correct; source error listed in r1 | none |
| (r1) §3.1 dilation exponent | 2-dim orbit; SO(3) sphere | `t^{−1}ω_{tO}`; mass `2r = 2l+1` | exponent d | none |
| (r1) §3.2 fibre counts | 𝔰𝔩₂ over ℂ, ℝ | (2,1,1), (3,1,2) | bounds 2, 3 | none |
| (r1) §3.3 Rossmann SU(2) | spin l | `2 sin(rθ)/θ = ∫_O e^{xξ}dω` | needs `j^{1/2}` | none |
| (r1) §3.4 limits | spin-l, `h → 0`; U(1); point masses | `h(2l+1) → 0` vs 1; `in → ∅` | topology separates | none |
| (r1) §3.6 generic criterion | Sp₄(ℝ) holomorphic DS | GK dim 3 < 4 | empty limit | none |
| (r1) §3.7 trace exponent | character of ℝ; spin l | `d = 0`; `h·dim π = 2` | consistent | none |
| (r1) §3.9 approximate inverse | `G = ℝ`, `N = 2` | `4 · 1/4 = 1` | square used | none |
| (r1) §4.1 κ | `K = SO(3)`, torus | `(1+l+l²)² ≥ (2l+1)²`; `2L > r` | source error listed in r1 | none |
| (r1) §4.2 Plancherel mass | compact G, open U | `Σ dim π·dim π^U = vol(U)^{−1}` | consistent | none |
| (r1) §4.5 conjugation in `H_σ` | SO(3) ⊃ SO(2) | `1` vs `0`; `−1` vs `1` | (18.6) misprint | none |
| (r1) §4.5 compact H | σ of dim 2 | `H_σ = 1/2` | normalization pinned | none |
| (r1) §5.2 orthogonal, Lean | SO(3) ⊃ SO(2) | `X²+a²+b²+c²` vs `X²+a²`; coprime iff `b²+c² ≠ 0` | iff both ways | none |
| (r1) §5.2 small ι | `ι = ∅`, `Unit` | `(1,1)`; `(X²+b², 1)` | both sides true | none |
| (r1) §5.2 unitary, Lean | GL₂ ⊃ GL₁ | common root iff `bc = 0` | iff | none |
| (r1) §5.2 `ggpSpectralPolynomial` | `m = 1, x = 0`; `m = 0`; 𝔰𝔬₄ | `1`; `1`; forced root removed | needed | none |
| (r1) §5.3 torsor, Lean | SO(3) ⊃ SO(2) | `{b²+c² = s}`; `s = 0` two lines; `s < 0` empty over ℝ | consistent | none |
| (r1) §5.3 torsor, `ι = Unit` | 𝔰𝔬₂ ⊃ 𝔰𝔬₁ | fibre `{y}`, `h = 1` | Pfaffian encoded | none |
| (r1) §5.3 unitary torsor | GL₂ ⊃ GL₁ | `bc = p`, stable iff `p ≠ 0` | consistent | none |
| (r1) §5.3 surjectivity | four models | always solvable over k̄ | nonempty without stability | none |
| (r1) §5.3 sphericity | SL₂ on ℙ¹ | Borel stabilizer a torus; nilcone | trivial stabilizer needed | none |
| (r1) §6.1 `d_M = dim S` | SO(3)⊃SO(2), GL₂⊃GL₁ | `d_G + d_H = 1 = dim H` | holds | none |
| (r1) §6.2 narrow symbol mass | `b(hη) = h^{δ′dim s}Θ^∨(h^{δ′}η)` | `∫ b = h^{dim s}` | cancellation confirmed | none |
| (r1) §6.3 separation and tail | GL₂ ⊃ GL₁, `t = 2`; `Ξ(diag(t,1))` | `3r < √5/2`; `X^{−1/2}log X` | partition needed; polynomial gap right | none |
| (r1) §7.1 weights and PSL₂ window | spin l, `l = 1`; `h = 1/10` | weights `1, 2, 0`; `D_8, D_10` | consistent | none |
| (r1) §7.7 example polynomial | `q = 5, α = 2, n = 4` | `341/64 > 2`; `−5/2 < 1` | source error listed in r1 | none |
| (r1) §8.4 rigidity | principal SL₂ ⊂ SL₃ | e, not e² | full centralizer needed | none |
| (r1) §8.7 components | binary anisotropic; definite in indefinite | index 2 / trivial vs `{±1}` | source error listed in r1 | none |
| (r1) §9.1 periods | two copies | sum 2, not 4 | multiplicity once | none |
| (r1) §9.5 scaling | Haar times c | both sides `c^{−1}` | consistent | none |
| (r1) Global setting | `τ(G) = τ(H) = 2` | SO(n), U(n): 2; tori `2` | consistent | none |

## Not verifiable

- Nothing new. The sources recorded as uncertified (rossmann78, kostant78, barbasch-vogan80, rangarao72, kostant63, kostant59, whitney57) are still cited by locator only, as in the previous reports. The cached text extraction of nv21 is empty (the cache's PDF is encrypted and its extractor failed). The §0.5 locators were therefore read from the cached PDF itself, through a text extraction kept in scratch and not in the repository.

## Source issues

- none

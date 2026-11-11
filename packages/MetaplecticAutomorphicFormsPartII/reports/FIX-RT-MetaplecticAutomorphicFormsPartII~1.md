# Repair of MetaplecticAutomorphicFormsPartII (red team, round 1)

Two reviews were merged: pass a has seven findings and pass b has four. 1a/F07 and 1b/F03 overlap on the §1.4 attribution, so they are settled in one section. Every finding was checked against the sources and the pins and found correct, and every one is applied. Files changed: `packages/MetaplecticAutomorphicFormsPartII/README.md` and `packages/MetaplecticAutomorphicFormsPartII/Suggested.lean`. `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged; the plan's `gaps` list stays `[]`.

## RT-MetaplecticAutomorphicFormsPartII~1a/F01 (P2) — applied

§0.1: "Construct subspaces `V₀` and `J` with `V = I ⊕ V₀ ⊕ J`, …" → "… `V₀` and `J`, with `J` isotropic, such that …". The proof route now says why the constructed `J` is isotropic. New Check: the reviewer's `𝔽₃⁴` complement `⟨f₁ + e₂, f₂⟩`, whose internal pairing is 1, is not admissible; `⟨f₁, f₂⟩` is.

Verification:
- `ω(f₁ + e₂, f₂) = 0 + ω(e₂, f₂) = 1`.
- `j ↦ ω(·, j)|_I` sends `f₁ + e₂` to `(1, 0)` and `f₂` to `(0, 1)`, so this `J` passes every other condition.
- With `J` isotropic, the form on `I ⊕ V₀ ⊕ I*` computes to `λ′(i) − λ(i′) + ω(v₀, v₀′)`, which is the stated standard form.
- No other place restates the decomposition: §3.1 and the §0.1 API cite it.

## RT-MetaplecticAutomorphicFormsPartII~1a/F02 (P2) — applied

§0.1: "a field `k` of characteristic not 2" → "a field `k`, of any characteristic". Conventions: "From Layer 1 on, `k` is a finite field of odd characteristic …; Layer 0 is linear algebra over an arbitrary field." The proof route uses the pinned Tau Ceti `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J_inl_eq`, with its second half negated. New Check: the `𝔽₂` plane.

Verification:
- The pinned theorem is at `TauCeti/LinearAlgebra/BilinearForm/LagrangianBasis.lean:131`. It holds in every characteristic and uses the `Matrix.J` convention, so `B(fᵢ, eⱼ) = δᵢⱼ`.
- It is added to the Tau Ceti contracts.
- MordellLawrenceVenkatesh §3.2 states the same thing. That citation is replaced by the pinned declaration in Scope, the contracts, §0.1 *Needs* and the Layer 0 dependencies. MordellLawrenceVenkatesh §3.1 is kept.

## RT-MetaplecticAutomorphicFormsPartII~1a/F03 (P2) — applied

The old docstring said §3.3 was "not statable: the action is not a carrier". That reason is wrong, and §3.3 is now stated as `weilHeisenberg_parabolic_induction`. Two new definitions with real bodies support it:
- `heisenbergAction ω : isometryGroup ω →* MulAut (Heisenberg ω)`, the action `(t, v) ↦ (t, g v)`;
- `parabolicSubgroup ω I P`, the join of `inl(H(I^⊥))` and `range inr`.

Changes elsewhere: README §1.1, §2.4, §3.3, How to read the build, Conventions, contracts.

Why the finding holds, checked at the pins:
- Mathlib's `SemidirectProduct` (`Mathlib/GroupTheory/SemidirectProduct.lean:46`) takes any `G →* MulAut N`.
- The action's multiplicativity is proved in the file in a few lines from `TauCeti.BilinForm.mem_isometryGroup_iff`.
- `Representation.ind` (`Mathlib/RepresentationTheory/Induced.lean:77`) induces along any homomorphism, with no universe restriction.

Pass b said `I^⊥/I` is not polarized. That is handled by an explicit presentation: a linear map `r : V → X₀ × X₀*` that on `I^⊥` is onto, has kernel `I` and preserves the forms, together with `p₂` satisfying `r(gv) = p₂(g)(r v)`. This is the same transport the README already uses for Layer 2.

`Ω` and `σ` are quantified with hypotheses giving their defining formulas, not defined: defining them needs their multiplicativity, which is §2.4 content. The `IsSquare` split mirrors §4.1, so the file keeps `[Finite k]` throughout.

## RT-MetaplecticAutomorphicFormsPartII~1a/F04 (P3) — applied

The `heisenbergFactorSet` docstring "of an alternating form … commutator `(ω(v, w), 0)`" → "defined for every bilinear form …; when `ω` is alternating and `ringChar k ≠ 2` … the commutator is `(ω(v, w), 0)`; in characteristic 2 … the extension is abelian." README §1.1 now says the same.

Check: over `𝔽₂`, `1/2` takes the value 0 and the commutator is `(0, 0)`. Over `𝔽₃` it is `2 − 1 = 1`.

## RT-MetaplecticAutomorphicFormsPartII~1a/F05 (P3) — applied

§2.1 Checks: "`μ(1) = id`, so `c(1, g) = c(g, 1) = 1`" and "For `V = 0` … §2.2 removes the choice" were removed. They are replaced by:
- the choice `μ(J) = F_ψ`, `μ(−1) = R`, with `c(J, J) = 1`, and `c(J, J) = 4` after rescaling by 2;
- `tr R = 1` with `Rδ₁ = δ₂`, which excludes a conjugate equal to `−R`.

Verification:
- The `V = 0` Check was wrong: `Sp(0) = {1}` and `μ(1) = 1` already fix `μ`.
- `J² = −1`, and `F_ψ² f(z) = q^{−n} Σ_u f(u) Σ_w ψ(w·(z+u)) = f(−z)`.
- The coboundary is `2·2/1 = 4`.

## RT-MetaplecticAutomorphicFormsPartII~1a/F06 (P3) — applied

§1.3: "(N02, Lemma 2.1 and its proof, p. 16)" → "(N02, Lemma 2.1, p. 16, and its proof, p. 17)". Same pattern in the `finite_stoneVonNeumann_exists` docstring, which now reads "N02, §2 and Lemma 2.1, p. 16, with the irreducibility shown in its proof, p. 17".

Source: N02 line 81 is Lemma 2.1, and line 83 is the page header "NEUHAUSER 17". The trace computation and irreducibility follow at N02 lines 84–95. The other N02 locators were checked against the page markers and are correct.

## RT-MetaplecticAutomorphicFormsPartII~1a/F07, RT-MetaplecticAutomorphicFormsPartII~1b/F03 (P3) — applied

- **§1.4 and the docstrings of `fullyRamified_exists` / `fullyRamified_unique`.** The general theorem is now "proved here by the route below". S08 Proposition 3.5 (setting `J¹ ⊇ H¹`) and F21 Lemma 7.7 with the proof of Lemma 7.8 (Heisenberg `p`-group, centre of order `p`) are cited as instances.
- **§3.4 and the docstring of `fullyRamified_isotropicInvariants`.** Same pattern: the theorem is derived here; S08 Lemmas 5.6, 5.12 and Corollary 5.7, and FS25 Lemma 3.3.4(b), are cited as instances.
- **§1.5.** FS25 is now cited only for the induced models. The operators `T_{BA}` are "derived here".
- **§4.2.** The citations are now F21 p. 30 (the tensor description) and p. 32 (proof of Lemma 7.10), and S08 Lemma 5.6(ii) and the display after Lemma 5.12.

Sources:
- S08 line 571: skew semisimple stratum. S08 line 1251: Lemma 5.6(ii), p. 30. S08 lines 1401–1406: the tensor display.
- F21 line 1208: centre of order `p`. F21 lines 1178–1186 and 1286–1293: the tensor statements.
- FS25 lines 544–559: Lemma 3.3.4 has no intertwiner between two polarized models.

## RT-MetaplecticAutomorphicFormsPartII~1b/F01 (P3) — applied

- **§1.1 API, new bullet.** For a unit `c`, `isometryGroup (c • ω) = isometryGroup ω`, via `mem_isometryGroup_iff`. With `c = 1/2`, `heisenbergAction ω` is the parent's §0.8 action composed with this identification.
- **Contract for MetaplecticAutomorphicForms §§0.7–0.8.** It now records that the parent's action has domain `isometryGroup (ω/2)`.
- **New Check.** In characteristic 2, `c = 0` is not a unit and `isometryGroup 0` is all of `V ≃ₗ V`.

The parent's §0.8 was checked at its head: the action is defined "from the native `isometryGroup B`".

## RT-MetaplecticAutomorphicFormsPartII~1b/F02 (P3) — applied

- **Statement.** "`j : P ≃ H(V)` inducing the identity of `V` on `P/Z(P)` (a special isomorphism)" → "a group isomorphism `j : P ≃* H(V)` (in applications a special isomorphism…; not used here)".
- **Change of data.** "A compatible change of `(j, s)`" is replaced by two precise statements, each with a proof route and an API bullet: `Ad(0, w) ∘ j` for `w` fixed by `s(K)`, intertwined by `π(0, w)`; and `(g₀ · j, g₀ s g₀⁻¹)`, intertwined by `W(g₀)`.
- **Checks.** The exponent Check now reads "no group isomorphism". New Check: the fixed-vector hypothesis.

Verification:
- `s(k)·Ad(0, w)(x) = Ad(0, s(k)w)(s(k)·x)`.
- `π(g₀·h) W(g₀ g g₀⁻¹) = W(g₀) π(h) W(g) W(g₀)⁻¹`.

## RT-MetaplecticAutomorphicFormsPartII~1b/F04 (P3) — applied

§4.2 *Needs:* "§1.3; §2.2; §2.4; §2.5 (for pullbacks through special isomorphisms); §4.1; Mathlib `LinearMap.single`" → "§0.2 (transport to polarized coordinates); §1.3; §2.2; §2.4; Mathlib `LinearMap.single`".

Checked: the statement and route of §4.2 use Schur, uniqueness, `Ω` and the transport of §0.2. The sum map `∏ H(Vᵢ) → H(V)` is not an isomorphism, so §2.5 does not apply, and no Lagrangian occurs, so §4.1 is not needed.

## Checks

- **Elaboration.** `lake env lean` on the package `Suggested.lean`, run from the content checkout:
  - It exits 0.
  - It prints exactly nine warnings `declaration uses 'sorry'`, at lines 107, 119, 146, 161, 232, 268, 331, 366 and 396. These are the eight earlier theorems and the new `weilHeisenberg_parabolic_induction` (line 268).
  - There are no errors.
  - `heisenbergAction` and `parabolicSubgroup` are fully proved definitions; neither has a `sorry`.
  - There is no `set_option`, `lemma`, `#eval` or `#print`, and no import changed.
- **Signatures.** I appended `#check @name` for all 17 declarations to a scratch copy and elaborated it once.
  - The 14 earlier declarations have the same elaborated types as in the worker's `signatures.md`; only docstrings changed, confirmed by a diff of the code lines.
  - The three new declarations keep every binder:
    - `heisenbergAction`: `ω`, with result `isometryGroup ω →* MulAut (Heisenberg ω)`.
    - `parabolicSubgroup`: `ω`, `I`, `P`.
    - `weilHeisenberg_parabolic_induction`: `[Finite k]`, `[FiniteDimensional k X]`, `hk`, `hψ`, `W`, `hW`, `I`, `hI`, `P`, `hP`, `X₀` with `[FiniteDimensional k X₀]`, `W₀`, `hW₀`, `r`, `hr`, `hrI`, `hrω`, `p₂`, `hp₂`, `Ω`, `hΩ`, `σ`, `hσ`.
  - Each type matches its README statement in §1.1 and §3.3.
- **Dependency check** (exact output):

```text
depcheck: 237 roadmaps, 2144 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or moved line.
- **`roadmaps resolve`** on the README: no cross-roadmap citation and no Lean name is unresolved. I checked the new pinned names myself:
  - Mathlib: `SemidirectProduct.inl` / `inr` (`Mathlib/GroupTheory/SemidirectProduct.lean:100,120`), `AddSubgroup.toSubgroup` (`Mathlib/Algebra/Group/Subgroup/Lattice.lean:88`), `Representation.ind` (`Mathlib/RepresentationTheory/Induced.lean:77`).
  - Tau Ceti: `TauCeti.FactorSet.rightHom` (`TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean:306`), `TauCeti.BilinForm.mem_isometryGroup_iff` (`TauCeti/LinearAlgebra/BilinearForm/Isometry.lean:196`), `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J_inl_eq` (`TauCeti/LinearAlgebra/BilinearForm/LagrangianBasis.lean:131`).
- **README and Lean agreement.** Every declaration of `Suggested.lean` is named in the README, and every backticked name of this roadmap in the README is declared in the file. There are no LaTeX delimiters.
- **Sources.** No new source is cited and `needs-references.toml` was not written. All new locators point into texts already in the manifest; Gerardin77 stays cited as uncertified, by its locator.

## Adversarial pass on new and changed statements

| Statement | Instances | Computed values | Result / change |
|---|---|---|---|
| §0.1 with `J` isotropic, any field | reviewer's `𝔽₃⁴` complement; `𝔽₂` plane; `I = 0`; two `𝔽₃` planes with `I` a line | `ω(f₁+e₂, f₂) = 1`, but the standard form gives 0 on `I* × I*`. `𝔽₂`: `ω(e,f) = 1`, `2 = 2·1 + 0`. `I = 0`: dimensions `(0, dim V, 0)`. Two planes: `4 = 2·1 + 2`, not `3` | Isotropy added; two Checks added. |
| `heisenbergFactorSet` docstring | `𝔽₃²`; `𝔽₂²` | `𝔽₃`: `α(e₁,e₂) = 2`, `α(e₂,e₁) = 1`, commutator `1 = ω(e₁,e₂)`. `𝔽₂`: `α = 0`, commutator `0 ≠ 1` | Hypotheses added to the claim. |
| `heisenbergAction` | `g = J` on `𝔽₃²`; non-isometry `diag(2,1)`; the pair `J`, `u(1)`; `V = 0` | `J`: image of the product `(2,(1,−1))` equals the product of images `(2,(1,−1))`. `diag(2,1)`: `(2,(2,1))` versus `(1,(2,1))`. `J u(1)`: `(0,(1,−1))` both ways; the `g⁻¹` convention gives `(0,(0,1))` versus `(0,(1,1))`. `V = 0`: trivial action. Lean checks `map_mul'` by `rfl` with MulAut's `(f*g)x = f(g x)` | Sound; Checks added. |
| `isometryGroup (c•ω) = isometryGroup ω` | `c = 2` in `𝔽₃`; `c = 0` in characteristic 2 | `2ω(gx,gy) = 2ω(x,y)` exactly when `ω(gx,gy) = ω(x,y)`. `isometryGroup 0 = ⊤`, while `isometryGroup ω` is proper for `ω ≠ 0` | Unit hypothesis kept; Check added. |
| §2.1 new Checks | `𝔽₃`, `μ(J) = F_ψ` or `2F_ψ`; `R` versus `−R` | `F_ψ² = R`, so `c(J,J) = 1`; `(2F_ψ)² = 4R`, so `c = 4 = 2·2/1`. `tr R = 1` (only `z = 0` is fixed); `tr(−R) = −1` | Checks replaced. |
| §2.5 change of data | `𝔽₃` plane, `K = ⟨u(1)⟩`, `w = (0,1)` and `w = (1,0)`; `g₀ = J` | `w = (0,1)`: `ω(w, u(1)x − x) = ω((0,1),(0,x₁)) = 0`, equivariant. `w = (1,0)`, `x = (1,0)`: central coordinates `1` versus `0`. `g₀`: `W(J)π(h)W(g)W(J)⁻¹ = π(J·h)W(JgJ⁻¹)` by covariance | Both statements true; fixed-vector Check added. |
| `parabolicSubgroup` | `I = 0`; Lagrangian line in `𝔽₃²` with `P = 1`; line in `𝔽₃⁴`; `P = ⟨J⟩` with `I` the `x`-axis | `I = 0`: whole group, index 1. Lagrangian line: order `9`, index `27/9 = 3`. Line in `𝔽₃⁴`: `|H(I^⊥)| = 81`, index `243/81 = 3 = 3^{dim I}`. `⟨J⟩`: contains `(0,(1,0))` and `(0,(0,−1))`, whose commutator `(−1,0)` generates the centre, so all of `H(V)` | Correct when `P` stabilizes `I` (then `P` stabilizes `I^⊥`); the non-stabilizing case is a Check. |
| `weilHeisenberg_parabolic_induction`: truth | `𝔽₅` plane, `I = {0}×X*`, `P = {m(a)}`; `I = 0`; line in `𝔽₃⁴`; split model `X = Y ⊕ X₀`, `I = Y*` | `𝔽₅`: `σ(m(2)) = χ₅(det(m(2)|_I)) = χ₅(3) = −1` and `W(m(2))δ₀ = χ₅(2)δ₀ = −δ₀`, so Frobenius gives a nonzero map. Without the twist `σ′(m(2)) = 1`; the `I`-invariants are `ℂδ₀` only, so `Hom = 0`. `I = 0`: index 1, and conjugation by the Schrödinger intertwiner of `r` gives `W₀`, by uniqueness and `tr R = 1`. `𝔽₃⁴`: `3 · 3 = 9`. Split model: on `S^I` = functions on `{0} × X₀`, `π(t,(x₀,(η,y₀)))` acts as `π₀(t, x₀, y₀)`; `m(a ⊕ 1)` acts by `χ(det a) = χ(det(a^{−T}))`, `u(C)` by `W₀(u(C₀₀))` | Sound. |
| same: hypotheses satisfiable, no vacuity | product of `x = ((t,v),g)` and `y = ((s,w),g′)` in `Q` | Central coordinate of `xy`: `t+s+ω(v,gw)/2`. In `σ(x)σ(y)`: `t+s+ω₀(rv, p₂(g)rw)/2 = t+s+ω₀(rv, r(gw))/2 = t+s+ω(v,gw)/2`, using `hp₂` and `hrω` with `v, gw ∈ I^⊥`. `Ω` is multiplicative by covariance. `r` exists by §0.1, §0.2 and extension off `I^⊥` | `σ` and `Ω` exist; the statement is not vacuous. |
| same: junk values and degenerate data | `I = 0`; `X₀ = 0`; `hk`, `hψ` | `det` on the zero module is `1`, a square. `g|_I` is injective on the finite-dimensional `I`, so `det ≠ 0` and `IsSquare 0` never occurs. `X₀ = 0`: `X₀ → ℂ = ℂ`, with `π₀(t, 0) = ψ(t)`. Characteristic 2 is excluded by `hk`; `ψ = 1` is excluded by `hψ` | Sound. |
| same: dependence on `r` | `r′ = e ∘ r` on `I^⊥` | `σ′(h,g) = W₀(e) σ(h,g) W₀(e)⁻¹`, because `W₀(e)π₀(t,u)W₀(e)⁻¹ = π₀(t, eu)` and `p₂′ = e p₂ e⁻¹` | Independent of `r`; API bullet. |
| Locators changed (F06, F07, 1b/F03) | page markers | N02 `=== page 3 ===` at line 82, header "17" at line 83. S08 page 30 begins at line 1250, Lemma 5.6(ii) at 1251. F21 page 30 runs 1165–1215, the tensor description at 1178–1186. FS25 page 15 begins at 535, Lemma 3.3.4 at 544–559 | Corrected. |
| §4.2 *Needs* | route items | Schur (§1.3), uniqueness (§2.2), `Ω` (§2.4), transport (§0.2); §2.5 and §4.1 unused | Corrected. |

## Ownership and overlaps

- **The new definitions.** `heisenbergAction` specializes MetaplecticAutomorphicForms §0.8 to the half-form factor set and its domain `Sp(V)`, as `heisenbergFactorSet` already does for §0.1. The README names the parent's `extensionIsometryAction` as the owner. `parabolicSubgroup` serves this roadmap's own §3.3, which no other roadmap plans.
- **Name collisions.** `roadmaps grep` finds no match for `heisenbergAction`, `parabolicSubgroup` or `weilHeisenberg_parabolic_induction` on main or in any of the 440 indexed open roadmap pull requests. A grep of the board packages finds them only in this package.
- **Overlaps.** Ownership against open pull requests was checked through that index only. `scratch/overlaps.md` lists no open pull request that changes this roadmap and no dropped or revision-only id.

## For the maintainer

- **New names in `Suggested.lean`.** `heisenbergAction`, `parabolicSubgroup` and `weilHeisenberg_parabolic_induction` are new. No name was removed or renamed, and no other roadmap cites a name of this package.
- **Supplier change.** MordellLawrenceVenkatesh §3.2 is no longer a supplier: its statement is consumed from the pinned Tau Ceti `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J_inl_eq`. MordellLawrenceVenkatesh §3.1 is still cited, so the dependency edge is unchanged.
- **For MetaplecticAutomorphicForms.** Its §0.8 might state the identification `isometryGroup (c • B) = isometryGroup B` for units `c`. This package states what it needs in §1.1, so nothing waits on it.
- **No suspicious instructions.** No text in the reviews, the sibling roadmaps or the sources tried to direct the work.

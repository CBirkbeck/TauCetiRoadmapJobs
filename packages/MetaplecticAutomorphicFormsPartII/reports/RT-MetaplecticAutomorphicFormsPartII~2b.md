<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13037#issuecomment-6794348884 -->
Red team round 2 pass b (claude) of 808232d

Verdict: needs_changes

1. **F01** (P3) The two existence theorems carry hypotheses their conclusions do not use

   - **Location.** `packages/MetaplecticAutomorphicFormsPartII/Suggested.lean:146–153` (`fullyRamified_exists`, hypotheses `hcomm`, `hnd`) and `:107–113` (`finite_stoneVonNeumann_exists`, hypotheses `hk`, `hω`, `hnd`, `hψ`); `README.md:199` "Then there is an irreducible representation `η` of `J` with `η(h) = θ(h) · id`".
   - **Claim.** Existence of an irreducible representation with the prescribed action of `H` (resp. of the centre) is stated under the nondegeneracy hypotheses.
   - **Witness.** `J = C₃`, `H = 1`, `θ = 1`: `hnd` fails (every commutator is 1), yet the trivial representation satisfies the conclusion. In general any irreducible constituent of `Ind_H^J θ` works for `H` normal and `θ` invariant, which is the first sentence of the README's own route (`README.md:201`). For the Heisenberg case, `k = 𝔽₃`, `ψ = 1`: the trivial representation; `inl` is central for every bilinear `ω` because the factor set is normalized.
   - **Repair.**
     1. `fullyRamified_exists`: delete `hcomm` and `hnd` from the signature; docstring: "Let `H` be normal in the finite group `J` and `θ` a `J`-invariant character of `H`. Then some irreducible complex representation of `J` restricts to `H` as the scalar character `θ` (an irreducible constituent of the induced representation). The abelian quotient and the nondegenerate commutator pairing enter only in `fullyRamified_unique`."
     2. `finite_stoneVonNeumann_exists`: delete it from `Suggested.lean`. Without the unused hypotheses it is the case `J = Heisenberg ω`, `H = range inl` of item 1. README §1.3 keeps the statement, with "existence is the Schrödinger model of §1.2" in place of the name `finite_stoneVonNeumann_exists`.
     3. README §1.4, after the statement: "Existence (`fullyRamified_exists`) needs only that `H` is normal and `θ` is `J`-invariant; the commutator and nondegeneracy hypotheses are used for the dimension, the character and uniqueness (`fullyRamified_unique`)."
     Tested: at `J = C₃`, `H = 1`, `θ = 1` the repaired existence statement holds (trivial representation), and `fullyRamified_unique` is not applicable there (three inequivalent characters), as the README's abelian Check says.

2. **F02** (P3) The §0.1 locator points to texts that do not contain the decomposition

   - **Location.** `README.md:74` "(FS25, Lemma 3.3.4 and the paragraph before it, p. 15, and N02, §2, p. 16, in odd characteristic; …)".
   - **Claim.** These passages give the adapted decomposition `V = I ⊕ V₀ ⊕ J` of an isotropic subspace.
   - **Witness.** N02 §2 (N02 lines 51–81) defines the form, the Heisenberg group and the Schrödinger operators only; no isotropic subspace occurs. FS25 line 540 starts from a given partial polarization; the notion is defined at FS25 line 1698 (Appendix A, p. 44), and existence for a prescribed `I` is not proved in either place.
   - **Repair.** Replace the parenthesis by: "(the decomposition is a partial polarization in the sense of FS25, Appendix A, p. 44, with `V⁺ = I` and `V⁻ = J`; FS25 uses it in the paragraph before Lemma 3.3.4, p. 15. Its existence for a prescribed isotropic `I`, in every characteristic, is proved here by the route below.)" Add FS25 Appendix A, p. 44 to the FS25 line of the References and to the `locator` of `FS25` in `sources.toml`.

3. **F03** (P3) §2.2 Check 1 is vacuous

   - **Location.** `README.md:290` "For `n = 0`, `S = S⁺ = ℂ` and `μ(g) = a(g)`; then `κ(g) = a/a² = a⁻¹` and `W(g) = id`."
   - **Claim.** The Check tests the formula `κ = det μ/(det μ|_{S⁺})²` on a scalar `a`.
   - **Witness.** For `n = 0`, `Sp(X × X*) = {1}` and §2.1 requires `μ(1) = 1`, so `a = 1` is the only instance and the formula is not exercised. This is the defect 1a/F05 found in §2.1, in its §2.2 twin.
   - **Repair.** Replace the bullet by: "For `n = 0`, `Sp(X × X*)` is trivial and `W = 1`; the identity reads `1 = 1²`. For `q = 3`, `n = 1` and `g = u(1)`: `W(g) = diag(1, ζ, ζ)` has determinant `ζ²`, and on `S⁺ = span(δ₀, δ₁ + δ₂)` it is `diag(1, ζ)`, so `(det W(g)|_{S⁺})² = ζ²`: the identity holds." Tested: `1·ζ·ζ = ζ²` and `(1·ζ)² = ζ²`; with the order-3 twist `λ(g) = ζ` the left side stays `ζ³·ζ² = ζ²` and the right side becomes `(ζ·ζ²)² = 1`, in agreement with Check 2.

4. **F04** (P3) Layer 0 and Layer 1 definitions sit under the Layer 2 heading, with a locator to the Conventions

   - **Location.** `Suggested.lean:176` `/-! ## Layer 2: Genuine finite Weil representations -/`, followed by `polarizationForm` (`:184`, docstring "(README, Conventions)") and `schrodingerOp` (`:197`, "(README §1.2)").
   - **Claim.** The layer comments follow the README order and each docstring locates its target.
   - **Witness.** `polarizationForm` is the target of README §0.2 (`README.md:98` "Define `polarizationForm k X`"), in Layer 0; `schrodingerOp` is §1.2, in Layer 1. The file has no Layer 0 heading.
   - **Repair.** Insert `/-! ## Layer 0: Finite symplectic coordinates -/` before `polarizationForm` and change its docstring locator to "(README §0.2)"; put `schrodingerOp` under the Layer 1 heading (a second `section` with `variable {k X : Type*} [Field k] [AddCommGroup X] [Module k X]` suffices), leaving `evenPart`, `IsNormalizedWeil` and `existsUnique_isNormalizedWeil` under Layer 2. No statement changes; recheck with `#check @name` that the three elaborated types are unchanged.

Four new findings, all P3 (S01–S04). All eleven round-1 findings are repaired at this head and no repair introduced an error. No statement of `packages/MetaplecticAutomorphicFormsPartII/Suggested.lean` and no README target was refuted by the instances computed below.

## Round-1 findings at this head

| Finding | Status | Witness at 808232d |
|---|---|---|
| 1a/F01 (isotropy of `J`) | repaired | `README.md:74` "Construct subspaces `V₀` and `J`, with `J` isotropic, such that"; Check at `:91` (`ω(f₁ + e₂, f₂) = 1`, recomputed). |
| 1a/F02 (characteristic 2 in Layer 0) | repaired | `README.md:74` "over a field `k`, of any characteristic"; `:17` "Layer 0 is linear algebra over an arbitrary field"; `:92` the `𝔽₂` plane, `2 = 2·1 + 0`. Pinned `exists_basis_toMatrix_eq_J_inl_eq` (`TauCeti/LinearAlgebra/BilinearForm/LagrangianBasis.lean:131`) has hypothesis `U = B.orthogonal U` and Gram matrix `Matrix.J = fromBlocks 0 (-1) 1 0`, so `B(eᵢ, fⱼ) = −δᵢⱼ`; the README's "negate its second half" is correct. |
| 1a/F03 (Gérardin headline absent) | repaired | `Suggested.lean:268` `weilHeisenberg_parabolic_induction`, with `heisenbergAction` (`:80`) and `parabolicSubgroup` (`:251`), both with real bodies; module docstring `:36` "Every headline theorem of the roadmap is stated." Truth recomputed below (rows 13–14). |
| 1a/F04 (factor-set docstring) | repaired | `Suggested.lean:59–61` "When `ω` is alternating and `ringChar k ≠ 2` … in characteristic `2` the division takes the value `0` and the extension is abelian". |
| 1a/F05 (§2.1 Checks) | repaired | `README.md:267` (`c(J, J) = 1`, `4` after rescaling by 2) and `:269` (`tr R = 1`). The same vacuity survives in §2.2: S03. |
| 1a/F06 (N02 page) | repaired | `README.md:176` "(N02, Lemma 2.1, p. 16, and its proof, p. 17)"; N02 line 81 is the lemma, N02 line 83 the header of p. 17. |
| 1a/F07 + 1b/F03 (attributions) | repaired | `README.md:199` "proved here by the route below … are instances in their settings"; `:440` "derived here from §1.4"; `:221` "derived here"; `:496` cites F21 p. 30/p. 32 and S08 Lemma 5.6(ii); `Suggested.lean:142–145`, `:159–160`, `:327–330`. |
| 1b/F01 (domain of the isometry action) | repaired | `README.md:135` "For a unit `c` of `k`, `isometryGroup (c • ω) = isometryGroup ω`"; contract `:58`; Check `:147`. |
| 1b/F02 (§2.5 "special", "compatible change") | repaired | `README.md:339` "a group isomorphism `j : P ≃* H(V)` (in the applications a special isomorphism … not used here)", the two changes of data, API `:347–348`, Check `:355` (central coordinates `1` and `0`, recomputed). |
| 1b/F04 (§4.2 *Needs*) | repaired | `README.md:516` "*Needs:* §0.2 (transport to polarized coordinates); §1.3; §2.2; §2.4; Mathlib `LinearMap.single`." |

## Verified sound

Counts: 17 declarations read (8 definitions, 9 theorems), 18 README targets read (§§0.1–0.2, 1.1–1.5, 2.1–2.5, 3.1–3.4, 4.1–4.2), 35 locators verified against the cached texts (F21 7, S08 6, N02 11, FS25 11), 76 Check bullets and 8 worked examples recomputed, 21 sibling citations resolved (MetaplecticAutomorphicForms 13 sections, MordellLawrenceVenkatesh 2, InductionRestriction 5 layers, CharacterTheory 1) and 44 pinned declarations resolved by grep at the pins (the remaining contract names, such as `LinearMap.det`, `Subgroup.index` and `SemidirectProduct.inl`, are core Mathlib or are used by the elaborated `Suggested.lean`).

### Pass table: `Suggested.lean` declarations

Contexts: F(V) = `{k V : Type*} [Field k] [AddCommGroup V] [Module k V]`; FO adds `[Finite k]`, finite dimension, `ringChar k ≠ 2`, `ψ ≠ 1`; G = `{J : Type*} [Group J] [Finite J]`, `H` normal, `hcomm`, `θ : H →* ℂˣ`, `hinv`, `hnd`. `ζ = exp(2πi/3)`.

| # | Declaration; section; context | Instances and computed values | Result |
|---|---|---|---|
| 1 | `heisenbergFactorSet`; Heisenberg; F(V), any `ω` | `𝔽₃²`: `α(e₁,e₂) = 1/2 = 2`, `α(e₂,e₁) = −1/2 = 1`, commutator `2 − 1 = 1 = ω(e₁,e₂)`. `𝔽₂`: `α = 0`. `inl` central for every `ω` (`α(0,v) = α(v,0) = 0`). | Sound. |
| 2 | `Heisenberg`; same | `V = 0`: group `k`, order `q`. `𝔽₃²`: order 27. | Sound. |
| 3 | `heisenbergAction`; same | `g = J` on `𝔽₃²`: image of `(2,(1,1))` is `(2,(1,−1))`; product of images `(0,(0,−1))(0,(1,0)) = (ω/2, ·) = (1/2, ·) = (2,(1,−1))`. `J u(1)`: `(1,0) ↦ (1,1) ↦ (1,−1)` both as one map and in two steps; `MulAut` product is composition, as is `V ≃ₗ V`. | Sound. |
| 4 | `finite_stoneVonNeumann_exists`; FO, `ω` alternating nondegenerate | `V = 0`: `E = ℂ`, `ρ = ψ`. `𝔽₃²`: Schrödinger model, `dim 3`. Also true for `ψ = 1` (trivial representation). | True; S01. |
| 5 | `finite_stoneVonNeumann`; FO, two irreducibles with central character `ψ` | `q = 3, n = 1`: `3² = 9 = Nat.card V`; `tr T = tr M = 0`; norm `27⁻¹·3·9 = 1`; `27 = 9·1 + 2·9`. `n = 0`: `1 = 1`. `ψ = 1` on a plane: 9 inequivalent characters, excluded by `hψ`. `g.right ≠ 1` is `v ≠ 0`. | Sound. |
| 6 | `fullyRamified_exists`; G | `J = H`: `ρ = θ`. `Q₈`, `H = {±1}`: the 2-dimensional representation. `C₃`, `H = 1`: conclusion holds although `hnd` fails. | True; S01. |
| 7 | `fullyRamified_unique`; G, two irreducibles | `Q₈`: `2² = 4 = [Q₈ : ±1]`, character `(2, −2, 0, 0, 0)`. Central product of order `p⁴`: `d² = p²`. `C₃`, `H = 1`: three extensions, excluded by `hnd`. Trace argument: `tr ρ(g)(1 − θ([x,g])) = 0`. | Sound. |
| 8 | `polarizationForm`; Weil; `k X` explicit | `X = k`: `((1,0),(0,1)) ↦ 1`, swapped `−1`, diagonal `y(x) − y(x) = 0`. Agrees with N02 line 68. | Sound. |
| 9 | `schrodingerOp`; Weil | Exponent of `π(t,x,y)π(s,x′,y′)` at `z`: `t+s+y(z)+y′(z)+y′(x)+y(x)/2+y′(x′)/2`; at the product: `T + (y+y′)(z) + (y+y′)(x+x′)/2` with `T = t+s+(y′(x) − y(x′))/2`; equal. `TM = ζMT`. Agrees with N02 line 72. | Sound. |
| 10 | `evenPart`; `(X) [AddCommGroup X]` | `X = C₃`: `eδ₁ = (δ₁+δ₂)/2`, `e² = e`, rank 2. | Sound; no binder lost. |
| 11 | `IsNormalizedWeil`; Weil | Egorov checked for `u(C)`: both sides `t + y(z) + y(x)/2 + zᵀCx + xᵀCx/2`; for `m(A)`: `π(t, Ax, y∘A⁻¹)`; for `J`: `ψ(t − x·z − x·y/2)(Ff)(z+y) = π(t, y, −x)`. `𝔽₃`, `u(1)`: `det = ζ²`, `(det|_{S⁺})² = ζ²`. | Sound. |
| 12 | `existsUnique_isNormalizedWeil`; FO | Scalar `a` with `aW` normalized: `a^{qⁿ} = a^{qⁿ+1}`, so `a = 1` (pointwise; no perfectness used). `κκ′ = c^{qⁿ − (qⁿ+1)}κ = c⁻¹κ`. `q = 3`: twist `λ³ = 1` versus `λ⁴ = λ`. `n = 0`: `1 = 1²`. | Sound, including `Sp₂(𝔽₃)`. |
| 13 | `parabolicSubgroup`; ParabolicInduction; `{k} [Field k]`, `{V}` in signature | `I = 0`: whole group. Line in `𝔽₃⁴`: `|H(I^⊥)| = 81`, index `243/81 = 3`. `P = ⟨J⟩`, `I` the `x`-axis: contains `(0,(1,0))`, `(0,(0,−1))`, so all of `H(V)`. Elaborated type keeps `ω`, `I`, `P`. | Sound. |
| 14 | `weilHeisenberg_parabolic_induction`; same, all binders in the signature | Split model `X = Y ⊕ X₀`, `I = {0} × Y*`: `I^⊥ = X₀ × X*`, `S^I` = functions supported on `X₀`, `π(t,(x₀,(η,y₀)))` acts as `π₀(t,x₀,y₀)`; `m(a ⊕ 1)` by `χ(det a) = χ(det a^{−T})`; `1 ⊕ g₀` by `W₀(g₀)` (row 17 with `W_Y(1) = 1`). `σ` multiplicative: central coordinate `t+s+ω₀(rv, p₂(g)rw)/2 = t+s+ω(v,gw)/2`. Dimensions `q^{dim I}·q^{n − dim I} = qⁿ`. `I = 0`: transport along the isometry `r`, by uniqueness and `TRT⁻¹ = R₀`. `𝔽₅`, Lagrangian `I`: `σ(m(2)) = χ₅(3) = −1 = W(m(2))` on `δ₀`. `det` on the zero module is 1; `g|_I` injective, so `IsSquare 0` never occurs. | Sound; hypotheses satisfiable, not vacuous. |
| 15 | `fullyRamified_isotropicInvariants`; G, `U`, `hU`, irreducible `ρ` | `θ_U` well defined (`h′⁻¹h = u′u⁻¹ ∈ U ∩ H`), multiplicative, `Q`-invariant. `[J:H] = [J:Q]²[Q:HU]`. Coset `gQ`: `u` acts by `θ([g⁻¹,u])`. `U = 1`: `d²|H| = |J|`. Heis(`p³`), `U` a line: `1·p² = p²`. Line in `𝔽₃⁴`: `3²·9 = 81`. `U = H`, `θ ≠ 1`: `0·|H| ≠ |J|`, excluded by `hU`. `D₈`, `U = ⟨s⟩`: `1²·4 = 4`. | Sound. |
| 16 | `isNormalizedWeil_lagrangian_fixed`; FixedLine; FO | `L = {0} × X*`: fixed line `ℂδ₀`; `m(A)` gives `χ(det A)`, `det(m(A)|_L) = det A⁻¹`; `u(C)` gives 1. General `L = hL₀` by conjugation. `𝔽₅`, `m(2)`: `−1`. `𝔽₉`, `g = −1`: `+1`. `X = 0`: `W = id`. `f = 0`: `0 = 0`. | Sound. |
| 17 | `isNormalizedWeil_pi_tensor`; Tensor; all binders in the signature | Two factors: `det(W₁⊗W₂) = α₁^{2n₂}α₂^{2n₁}`, `det|_{S⁺} = α₁^{n₂}α₂^{n₁}` (using `det Wᵢ⁻ = αᵢ`). `ι = ∅`: both sides the constant 1. Two `𝔽₃` planes, `J ⊕ J` on `δ₀₀`: `(−i)⁶/3 = −1/3 = (−i/√3)²`. | Sound. |

### Pass table: README targets

| Target | Instances and computed values | Result |
|---|---|---|
| §0.1 | `I = 0`: `(0, dim V, 0)`. Plane: `2 = 2·1 + 0`. Two planes: `4 = 2·1 + 2`. `⟨f₁+e₂, f₂⟩`: pairing 1. `𝔽₂` plane. Form on `I ⊕ I*`: `y′(x) − y(x′) = ω(x,j′) + ω(j,x′)`. | Sound; locator S02. |
| §0.2 | `J(1,0) = (0,−1)`, `J(0,1) = (1,0)`, form on images `0 − (−1)·1 = 1`. `u(C)`: `(Cx′)(x) = (Cx)(x′)` by symmetry. `Matrix.J` sends `(x,y)` to `(−y,x)`. | Sound. |
| §1.1 | Map to `TauCeti.HeisenbergGroup` (pinned law `z + z′ + x y′`): image of the product has `z = t+s+xy/2+x′y′/2+xy′`. `diag(2,1)`: `(2,(2,1))` versus `(1,(2,1))`. `g⁻¹` convention: `(0,1)` versus `(1,1)`. | Sound. |
| §1.2 | Coset factor `(0,z,0)(t,x,y) = (t+y(z)+y(x)/2, 0, y)(0,z+x,0)`. `Mδ₁ = ζδ₁`, `Tδ₁ = δ₀`. | Sound. |
| §1.3 | Trace `ψ(t)Σ_z ψ(y(z)) = 0` for `y ≠ 0` (a nonzero functional is onto `k`). `𝔽₉`: `ψ(z₀) = 1` for trace-zero `z₀`, sum still 0. | Sound. |
| §1.4 | Pairing bimultiplicative and alternating; five Checks recomputed (orders `p⁴`, `p³`; abelian `J`; `H = J`; `H(V)`). | Sound; S01. |
| §1.5 | `(T_{BA}F)((t,b′)h) = ψ(t)(T_{BA}F)(h)`. Composite `= |A| Σ_{b ∈ A∩B} F((0,b)h) = |A||A∩B| F(h)`. Values 9, 3, 1. | Sound. |
| §2.1 | `μRμ⁻¹ = cR`, `tr R = 1`, so `c = 1`. `F² = R` gives `c(J,J) = 1`; rescaled: 4. Pinned `IsProjectiveRep.mul_apply` is `ρ g₁ ρ g₂ = α(g₁,g₂) ρ(g₁g₂)` and `rescale` multiplies by `c g₁ c g₂ / c(g₁g₂)`, as the README states. | Sound. |
| §2.2 | `det(κμ)/(det κμ|_{S⁺})² = κ⁻¹·κ = 1`. `𝔽₅`: `5 − 2·3 = −1`. `W(−1) = χ(−1)ⁿR`. | Sound; Check 1 S03. |
| §2.3 | `q = 3`: `W(u(1)) = diag(1,ζ,ζ)`, Vandermonde `(ζ−1)(ζ²−1)(ζ²−ζ) = 3·(−i√3)`, `det F = −i`. `q = 5`: eigenvalues `1,1,−1,i,−i`, `det F = −1`. Sign of `diag(a,1,…)` on `kⁿ`: `q^{n−1}` cycles of even length, `−1`. Operators agree with N02 lines 185–193. | Sound. |
| §2.4 | `π(h)W(g)π(h′)W(g′) = π(h(g·h′))W(gg′)`. Reversed order: `J⁻¹(1,0) = (0,1) ≠ (1,0)`. | Sound. |
| §2.5 | `π(0,w)W(s(k))π(0,w)⁻¹ = W(s(k))` when `s(k)w = w`. `w = (1,0)`, `k = u(1)`: central coordinates 1 and 0. | Sound. |
| §3.1 | `F((0,j)(0,i)) = ψ(ω(j,i))F((0,j))`; invariants supported at `j = 0`; dimensions 9 and 3 for a line in `𝔽₃⁴`. | Sound. |
| §3.2 | `𝔽₅`: `y`-axis `χ₅(3) = −1`, `x`-axis `χ₅(2) = −1`. Radical acts on `S^I` by a scalar commuting with `H(V₀)`; `u(C)δ₀ = δ₀`; upper shear `= J u(C) J⁻¹` fixes constants. | Sound. |
| §3.3 | As row 14; five Checks recomputed (`3·3 = 9`; `I = 0`; `I` Lagrangian; `P = ⟨J⟩`). | Sound. |
| §3.4 | As row 15; `uq = qu[u⁻¹,q⁻¹]`; five Checks recomputed. | Sound. |
| §4.1 | As row 16; `det(u|_L) = det(u|_I)det(u|_{L₀})`; `q = 3`, `g = −1`: `−1` on constants and on `δ₀`. | Sound. |
| §4.2 | As row 17; `ψ₁ ≠ ψ₂`: central tuple `(t,−t)` acts by `ψ₁(t)ψ₂(−t)`. | Sound. |

### Other checks

- **Headlines.** Seven, from the Summary: Stone–von Neumann, fully ramified, normalized Weil existence and uniqueness, corrected Gérardin induction, isotropic invariants, Lagrangian fixed line, tensor compatibility. All seven are stated. Apart from S01 item 2, no declaration is padding: none follows in one tactic, restates a definition or computes a value; there are no examples.
- **Suppliers.** MetaplecticAutomorphicForms and MordellLawrenceVenkatesh are open roadmaps earlier in the merge order (lines 151 and 161; this roadmap is line 200). At their heads: MetaplecticAutomorphicForms §§0.1, 0.5, 0.6, 0.7, 0.8, 0.9, 0.9a, 0.10 exist with `bilinearFactorSet`, `halfForm_commutator`, `halfForm_center`, `extensionIsometry`, `extensionIsometryAction`, `polarization_cocycle`, `exists_lagrangianComplement`, `polarizationEquiv` and the cited hypotheses (commutative ring, 2 invertible; §0.9a over every field); its §§0.15–0.16 are for local fields and its §4.7 is the discriminant-module representation, so nothing here duplicates it. MordellLawrenceVenkatesh §3.1 states the dimension criterion over every field. InductionRestriction Layers 0, 2, 4, 5, 7 and CharacterTheory are on main with the cited content. The group-law, Schrödinger and `inl (ofAdd t)` conventions agree with the parent's `Suggested.lean`.
- **Pins.** All Mathlib and Tau Ceti names in the supplier contracts exist at the pins with the stated content, including `Representation.ind` (`Mathlib/RepresentationTheory/Induced.lean:77`), `Rep.indResHomEquiv` (`:132`), `AddChar.sum_mulShift`, `AddSubgroup.toSubgroup`, `TauCeti.IsProjectiveRep.rescale`, `TauCeti.indFDRep`, `TauCeti.finrank_indFDRep`, `FDRep.ofLinearCharacter`. No pinned declaration proves a target.
- **Ownership.** `roadmaps grep` for Stone–von Neumann, Weil–Heisenberg, fully ramified, Gérardin, special isomorphism, finite Weil representation, Schrödinger model, extraspecial and the twelve declaration stems: no other owner of the finite-field theory on main or in the indexed open heads, and no shared fully qualified name. Ownership against open pull requests was checked through that index only.
- **Signatures.** The 17 elaborated types in the worker's `signatures.md` match the README statements; no binder is lost. I ran no Lean.
- **Policy.** The pull request changes only the package folder (README, `Suggested.lean`, two reports). No `set_option`, `lemma`, `#eval`, pull-request number or process narrative in the README or docstrings. `plan.json` has `gaps = []` and the README declares none.
- **Unused hypotheses (note).** `[FiniteDimensional ℂ E]` in the uniqueness theorems is implied by irreducibility over a finite group; harmless.
- **Dependency check** (exact output):

```text
depcheck: 236 roadmaps, 2143 edges, 0 problem(s)
```

- **Untrusted text.** Nothing in the reviews, the sibling roadmaps or the sources tried to direct the work.

## Not verifiable

- Gerardin77, Theorem 2.4: settled as uncertified, cited by locator. F21 line 1326 says only "a (quadratic) character" of `GL(V⁺)`; that it is `χ ∘ det` is this roadmap's own computation (rows 14 and 16), which I confirmed.
- Whether the parity-determinant normalization is the linearization Gérardin singles out for `Sp₂(𝔽₃)` (FS25 line 630): the README does not assert it; it cannot be checked without Gerardin77.
- N02 line 66 prints the Heisenberg law with the bracket of the second vector with itself; the extraction is OCR, so I cannot tell a misprint from a recognition error. The Schrödinger formula (N02 line 72) fixes the intended law.
- Elaboration of `Suggested.lean`: not rerun (no Lean builds in this pass).

## Source issues

- **Misprint** in N02 at the computation after Theorem 4.3, p. 23: the source says the cyclic permutation of the nonzero elements by a generator is even, then gives its sign as −1; it should be odd, a single cycle of even length; affects nothing.
- **Misprint** in FS25 at equation (3.3.3), p. 14: the source says the form on two cosets is the commutator of the first representative with an undeclared third letter; it should be the commutator of the two representatives; affects nothing.
- **Error** in Gerardin77 at Theorem 2.4(b): the source says, as reported by F21 footnote 3, that the inducing representation is the plain pull-back from the smaller Weil–Heisenberg group; it should be tensored with the quadratic determinant character on the isotropic subspace; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "808232db5af5894dcb980040b18ba7ee04504b3b", "job": "RT-MetaplecticAutomorphicFormsPartII~2b", "model": "fable", "worker": "chris-x10"} -->

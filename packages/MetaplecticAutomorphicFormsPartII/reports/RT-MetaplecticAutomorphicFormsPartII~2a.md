<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13037#issuecomment-6849442580 -->
Red team round 2 pass a (claude) of 808232d

Verdict: needs_changes

1. **F01** (P3) §0.1 cites N02 §2 for a decomposition that text does not contain

   - **Location.** `packages/MetaplecticAutomorphicFormsPartII/README.md:74`: "(FS25, Lemma 3.3.4 and the paragraph before it, p. 15, and N02, §2, p. 16, in odd characteristic; in every characteristic by the route below)".
   - **Claim.** N02 §2 and the FS25 paragraph give the adapted decomposition `V = I ⊕ V₀ ⊕ J` of an isotropic `I`.
   - **Witness.** N02 lines 51–81 (§2, p. 16) contain only the standard form on `K²ⁿ`, the group law and the Schrödinger formula; no isotropic subspace occurs. FS25 line 540 takes a partial polarization as given; the notion is that of its Appendix A (FS25 lines 526–528).
   - **Repair.** Replace the parenthesis by: "(the partial polarizations `V₊ ⊕ V₀ ⊕ V₋` of FS25, Appendix A, as used in the paragraph before Lemma 3.3.4, p. 15, for `𝔽_p`-spaces; that a given isotropic `I` has such a decomposition, over every field, is proved by the route below)". Tested on the instance: N02 is no longer cited for §0.1, which also agrees with the manifest (`sources.toml` records N02 for Layers 1, 2, 4 only).

2. **F02** (P3) §3.2 route: §2.3 has no formula for the elements of `Sp(V₀)` outside `m` and `u`

   - **Location.** `README.md:396`: "For the Levi subgroup `GL(I) × Sp(V₀)` the generator formulas of §2.3 give `χ(det|_I)` times the smaller normalized Weil action."
   - **Claim.** §2.3 computes `W` on the whole Levi factor.
   - **Witness.** In `𝔽₃⁴` with `I = {0} × k·y₁`, the Levi element `1 ⊕ J₀ : (x₁, x₂, y₁, y₂) ↦ (x₁, y₂, y₁, −x₂)` is none of `u(C)`, `m(A)`, `J` of §2.3. `Sp(V₀) = Sp₂(𝔽₃)` has characters of order 3, so a twist is not excluded for free.
   - **Repair.** Insert after that sentence: "For the factor `Sp(V₀)`: by §3.1 and Schur the action of `Sp(V₀)` on `S^I ≅ S_{ψ,V₀}` is `c · W₀` for a character `c` of `Sp(V₀)`. §2.3 gives `c(u(C₀)) = 1` and `c(m(d)) = 1`. In each coordinate plane `J = v(1) u(−1) v(1)` with `v(b) = J u(−b) J⁻¹`, so `c(J₀) = 1`, and `c = 1` because `u`, `m`, `J₀` generate `Sp(V₀)` (N02, Theorem 3.3, p. 18); this includes `Sp₂(𝔽₃)`." Tested: `(1,1;0,1)(1,0;−1,1)(1,1;0,1) = (0,1;−1,0) = J` and `J u(c) J⁻¹ = (1,−c;0,1)`; then `c(J) = c(u(−1))³ = 1`. Cross-check of the value by determinants: the partial transform `1 ⊗ F₀` has `κ = (det F₀)^{q^r}(−1)^{n₁⁻n₀⁻}` and `(det F₀)^{q^r − 1} = (−1)^{n₀⁻n₁⁻}`, so `κ = det F₀ = κ_{J₀}`.

3. **F03** (P3) Scope does not say where the Weil theory stops in characteristic 2

   - **Location.** `README.md:7–13` (Scope and ownership) and `:541` "only the odd-characteristic parts are used".
   - **Claim.** The scope section states what is owned and what is left to others.
   - **Witness.** FS25, the source of §§2.4–2.5, treats `p = 2` as well (FS25 lines 621–625 and 663–665): there the centre-fixing automorphisms map to an orthogonal group, with a non-split kernel `V` for `dim V > 2`. The README excludes this only through the hypothesis `ringChar k ≠ 2`, with no boundary statement.
   - **Repair.** Add to Scope and ownership: "Layers 2–4 are the odd-characteristic theory. For a Heisenberg `𝔽₂`-group the automorphisms fixing the centre map onto the orthogonal group of the quadratic form `x ↦ x²` on `P/Z(P)`, with kernel `V`, and this extension splits only for `dim V ≤ 2` (FS25, Fact 3.4.1(b), p. 17); there is no action of `Sp(V)` on `H(V)` to linearize, and the replacement theory (FS25, §3.4, for `p = 2`) is not planned in this roadmap. The finite-group theorems of §1.4 and §3.4 make no assumption on the order of `J` and apply to 2-groups." Tested: `Q₈` with `H = {±1}`, `θ(−1) = −1` satisfies §1.4 with `d² = 4 = [Q₈ : H]`, while `heisenbergFactorSet` over `𝔽₂` gives an abelian group (`README.md:142`).

4. **F04** (P3) No Check pins the sign of the half term `y(x)/2` of `schrodingerOp`

   - **Location.** `README.md:165–170` (§1.2 Checks).
   - **Claim.** The Checks discriminate the definition `ψ(t + y(z) + y(x)/2) f(z + x)`.
   - **Witness.** The wrong model `π′(t, x, y)f(z) = ψ(t + y(z) − y(x)/2) f(z + x)` passes all four Checks: each uses only `T = π(0, 1, 0)`, `M = π(0, 0, 1)`, `X = 0` or `ψ = 1`, where `y(x) = 0`.
   - **Repair.** Add the Check: "Over `𝔽₃`, `(0, (1, 0))(0, (0, 1)) = (2, (1, 1))` (§1.1), and `π(2, 1, 1)f(z) = ζ^{2 + z + 2} f(z + 1) = ζ^{z+1} f(z + 1) = (TMf)(z)`. With the phase `−y(x)/2` the same operator would be `ζ^{z} f(z + 1) = (MTf)(z) ≠ (TMf)(z)`, so the sign of the half term is forced by multiplicativity." Tested: `1/2 = 2` in `𝔽₃`; `2 + 2 = 1`; `2 − 2 = 0`.

Four new findings, all P3 (S01–S04). No statement of `packages/MetaplecticAutomorphicFormsPartII/Suggested.lean` and no README target was refuted by the instances computed below. All eleven round-1 findings are repaired at this head, and no repair introduced an error.

## Round-1 findings at this head

| Finding | Status | Witness at 808232d |
|---|---|---|
| 1a/F01 (`J` isotropic in §0.1) | repaired | `README.md:74` "Construct subspaces `V₀` and `J`, with `J` isotropic, such that …"; Check at `README.md:91`. Recomputed: `ω(f₁+e₂, f₂) = ω(e₂, f₂) = 1`; with `J` isotropic the transported form is `λ′(i) − λ(i′) + ω(v₀, v₀′)`. |
| 1a/F02 (characteristic 2 in Layer 0) | repaired | `README.md:74` "over a field `k`, of any characteristic"; `README.md:17`; `𝔽₂` Check at `README.md:92`. The pinned `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J_inl_eq` (`TauCeti/LinearAlgebra/BilinearForm/LagrangianBasis.lean:131`) takes `hU : U = B.orthogonal U`, no characteristic hypothesis, Gram matrix `Matrix.J`, so `B(fᵢ, eⱼ) = δᵢⱼ`, `B(eᵢ, fⱼ) = −δᵢⱼ`, as `README.md:42` says. |
| 1a/F03 (§3.3 headline absent) | repaired | `Suggested.lean:268` `weilHeisenberg_parabolic_induction`, with `heisenbergAction` (`:80`) and `parabolicSubgroup` (`:251`), both with real bodies. Truth recomputed below. |
| 1a/F04 (factor-set docstring) | repaired | `Suggested.lean:57–61` "defined for every bilinear form … When `ω` is alternating and `ringChar k ≠ 2` … in characteristic `2` … the extension is abelian". |
| 1a/F05 (§2.1 Checks) | repaired | `README.md:267–269`. Recomputed: `F_ψ² = R`, so `c(J, J) = 1`; `(2F_ψ)² = 4R`, `c = 4 = 2·2/1`; `tr R = 1`, `tr(−R) = −1`. |
| 1a/F06 (N02 page) | repaired | `README.md:176` "(N02, Lemma 2.1, p. 16, and its proof, p. 17)"; N02 line 81 (Lemma), N02 line 83 (page header 17). |
| 1a/F07, 1b/F03 (attributions) | repaired | `README.md:199`, `:221`, `:440`, `:496`; docstrings at `Suggested.lean:139–145`, `:155–160`, `:321–330`. S08 line 1251 (Lemma 5.6(ii), p. 30), S08 lines 1401–1408 (p. 33), F21 lines 1178–1186 (p. 30), F21 lines 1286–1293 (p. 32). |
| 1b/F01 (domain of the isometry action) | repaired | `README.md:135` and `:58`; `c = 2` in `𝔽₃`: `2ω(gx, gy) = 2ω(x, y)` iff `ω(gx, gy) = ω(x, y)`. Parent §0.8 at its head: action "from the native `TauCeti.BilinForm.isometryGroup B`". |
| 1b/F02 (§2.5 special isomorphisms) | repaired | `README.md:339–348`. Recomputed: `ρ′(a, k) = π(0, w)π(j a)π(0, w)⁻¹W(s k)` and `W(s k)π(0, w) = π(0, s(k)w)W(s k) = π(0, w)W(s k)`; Check `:355`: `ω((1,0), (1,1)) = 1`, `ω((1,0), (1,0)) = 0`. |
| 1b/F04 (§4.2 *Needs*) | repaired | `README.md:516` "§0.2 (transport to polarized coordinates); §1.3; §2.2; §2.4; Mathlib `LinearMap.single`". |

## Verified sound

Counts: 17 declarations read (8 definitions, 9 theorems), 18 README targets read (§§0.1–0.2, 1.1–1.5, 2.1–2.5, 3.1–3.4, 4.1–4.2), 28 locators verified against the cached texts, 76 Check bullets and the worked examples recomputed, 18 sibling citations and 64 pinned names resolved. I ran no Lean; the elaborated types are those of the worker's `signatures.md` (17 declarations, none with a lost binder), compared one by one with the README statements.

### Declaration table

Contexts: H = `{k V} [Field k] [AddCommGroup V] [Module k V]` with the local instance `TauCeti.trivialMulDistribMulAction`; HF adds `[Finite k] [FiniteDimensional k V]`, `ringChar k ≠ 2`, `ω.IsAlt`, `ω.Nondegenerate`, `ψ ≠ 1`; G = `{J} [Group J] [Finite J]`, `H` normal, `hcomm`, `θ : H →* ℂˣ`, `hinv`, `hnd`; W = `{k X} [Field k] [AddCommGroup X] [Module k X]`; WF adds `[Finite k] [FiniteDimensional k X]`, `ringChar k ≠ 2`, `ψ ≠ 1`. `ζ = exp(2πi/3)`.

| Declaration (line; context) | Instances | Values computed on each side | Result |
|---|---|---|---|
| `heisenbergFactorSet`, `Heisenberg` (62, 73; H, any `ω`) | `𝔽₃²`; `V = 0`; `𝔽₂²` | `(0,e₁)(0,e₂) = (2, e₁+e₂)`, reverse `(1, e₁+e₂)`, commutator `2 − 1 = 1 = ω(e₁,e₂)`. `V = 0`: `k`. `𝔽₂`: `1/2 = 0`, commutator `0`. Pinned law `⟨a,g⟩⟨b,h⟩ = ⟨a·g•b·α(g,h), gh⟩` (`TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean:211`) | sound |
| `heisenbergAction` (80; H) | `J`, `diag(2,1)`, `J u(1)` on `𝔽₃²` | `J`: image of `(2,(1,1))` is `(2,(1,−1))`; product of images `(ω((0,−1),(1,0))/2, (1,−1)) = (2,(1,−1))`. `diag(2,1)`: `(2,(2,1))` versus `(1,(2,1))`. `J u(1)(1,0) = (1,−1)`; with `g⁻¹`: `(0,1)` versus `(1,1)` | sound; `g`, not `g⁻¹` |
| `finite_stoneVonNeumann_exists`, `finite_stoneVonNeumann` (107, 119; HF) | `q = 3, n = 1`; `n = 0`; `ψ = 1`; `𝔽₉` | norm `27⁻¹·3·9 = 1`; `3² = 9 = Nat.card V`; `n = 0`: `1 = 1`; `ψ = 1`: 9 inequivalent lines; `𝔽₉`: `Σ_z ψ(z) = 0` although `ψ(z₀) = 1` for a trace-zero `z₀` | sound |
| `fullyRamified_exists`, `fullyRamified_unique` (146, 161; G) | `H = J`; `Q₈`, `H = {±1}`; `C₃`, `H = 1`; order `p⁴` central product | `d² = 1`; `2² = 4 = 8/2`, character `(2, −2, 0, 0, 0)`; `C₃`: `hnd` fails, 3 extensions; `p² = p⁴/p²`. Vanishing: `tr ρ(g) = θ([x,g]) tr ρ(g)` with `θ([x,g]) = θ([g,x])⁻¹ ≠ 1` | sound |
| `polarizationForm` (184; W) | `X = k`; `X = 0` | `((1,0),(0,1)) ↦ 1`, swapped `−1`; `X = 0`: zero form on `0`, nondegenerate | sound |
| `schrodingerOp` (197; W) | composition; `𝔽₃` | exponent of `π(t,x,y)π(s,x′,y′)` at `z`: `t+s+y(z)+y′(z)+y′(x)+y(x)/2+y′(x′)/2`, equal to that of `π` at `(t+s+(y′(x)−y(x′))/2, x+x′, y+y′)`. `TM = ζMT`; `π(2,1,1) = TM` | sound; S04 |
| `evenPart`, `IsNormalizedWeil` (205, 215; W) | `𝔽₃` shear; order-3 twist; `X = 0` | `W(u(1)) = diag(1,ζ,ζ)`: `det = ζ²`, on `S⁺ = span(δ₀, δ₁+δ₂)`: `ζ`, squared `ζ²`. Twist `λ`: `λ³ = 1` versus `λ⁴ = λ`. `X = 0`: `1 = 1²` | sound |
| `existsUnique_isNormalizedWeil` (232; WF) | `n = 0`; `q = 3`; `q = 5` | `κκ′ = c^{N−(N+1)}κ(gg′) = c⁻¹κ(gg′)`; `a^{N} = a^{N+1}` forces `a = 1` (`N = qⁿ`); `n = 0`: `κ = a⁻¹`, `W = id`. `μRμ⁻¹ = R` since `tr R = 1` | sound, including `Sp₂(𝔽₃)` |
| `parabolicSubgroup` (251; H plus `I`, `P`) | `I = 0`; line in `𝔽₃⁴`; `P = ⟨J⟩` not stabilizing | whole group, index 1; `|H(I^⊥)| = 81`, index `243/81 = 3`; `⟨J⟩`: contains `(0,(1,0))`, `(0,(0,−1))`, hence `H(V)` | sound |
| `weilHeisenberg_parabolic_induction` (268; WF plus `X₀` finite-dimensional, `W`, `W₀` normalized, `r`, `p₂`, `Ω`, `σ`) | split model `X = Y ⊕ X₀`, `I = {0} × Y*`; `𝔽₅` plane; `I = 0`; `X₀ = 0`; product of two elements of `Q` | `S^I` = functions supported on `X₀`. `m(a ⊕ d)`: `χ(det a)·χ(det d) f(d⁻¹z₀)`, and `det(g|_I) = det a⁻¹`. `u(C)`: `ψ(−z₀ᵀC₀₀z₀/2)`, `det(g|_I) = 1`. `1 ⊕ g₀`: `1 ⊗ W₀(g₀)` (`det = α^{2q^r}`, on `S⁺`: `α^{q^r}`). Radical dimension `2r(n−r) + r(r+1)/2` reached. `𝔽₅`: `χ₅(3) = −1 = χ₅(2)`. `σ(x)σ(y)`: central term `ω₀(rv, p₂(g)rw)/2 = ω(v, gw)/2`. Dimensions `q^{dim I}·q^{dim X₀} = qⁿ`. `Representation.ind` acts by `⟦h₁ ⊗ a⟧ ↦ ⟦h₁h⁻¹ ⊗ a⟧` on coinvariants (`Mathlib/RepresentationTheory/Induced.lean:77`): genuine induction | sound; hypotheses consistent |
| `fullyRamified_isotropicInvariants` (331; G plus `U`, `hU`, irreducible `ρ`) | `U = 1`; `U = H`, `θ ≠ 1`; Heisenberg `p³`; line in `𝔽₃⁴`; general count | `dim E^U = ⟨χ_E, θ_U⟩_{HU} = d|H|/|HU|`; `(dim E^U)²|HU| = |J|/|Ū| = |H|·|Ū^⊥| = |Q|`. `1·p² = p²`; `3²·9 = 81`; `U = H`: `0 ≠ |J|`, excluded by `hU`. `θ_U(q·hu·q⁻¹) = θ(h)θ([q,u]) = θ(h)` | sound |
| `isNormalizedWeil_lagrangian_fixed` (366; WF plus `L`, `g`, `f`) | `L = {0} × X*`; `𝔽₅`; `𝔽₉`; `X = 0`; `f = 0` | fixed line `ℂδ₀`; `m(A)|_L = A^{−T}`, `W(m(A))δ₀ = χ(det A)δ₀ = χ(det A⁻¹)δ₀`; `u(C)|_L = 1`, `W(u(C))δ₀ = δ₀`. `𝔽₅`: `m(2)`: `det 3`, eigenvalue `−1`. `𝔽₉`: `−1 = i²`, eigenvalue `+1` | sound |
| `isNormalizedWeil_pi_tensor` (396; finite `ι`, WF for each `Xᵢ`) | two factors; `ι = ∅`; `J ⊕ J` on two `𝔽₃` planes | `det(W₁⊗W₂) = α₁^{2n₂}α₂^{2n₁}`, on `S⁺`: `α₁^{n₂}α₂^{n₁}`; pointwise uniqueness gives equality. Empty family: `1 = 1`. `J ⊕ J`: `(−i)⁶·3⁻¹ = −1/3 = (−i/√3)²` | sound |

### README targets

| Target | Instances | Values | Result |
|---|---|---|---|
| §0.1 | `I = 0`; plane; two planes; `𝔽₂` plane; `𝔽₃⁴` non-isotropic `J` | `(0, dim V, 0)`; `2 = 2·1+0`; `4 = 2·1+2`; `ω(e,f) = 1` over `𝔽₂`; `ω(f₁+e₂, f₂) = 1` | sound; S01 |
| §0.2 | `X = k`; `J`; `m(2)` over `𝔽₅`; `u(C)` | `1`, `−1`; `J(1,0) = (0,−1)`; `2·3 = 1`; `x′ᵀCx − xᵀCx′ = 0` | sound |
| §1.1 | map to `TauCeti.HeisenbergGroup` | `z = t+t′+(xy′−yx′)/2+(x+x′)(y+y′)/2 = z₁+z₂+xy′`; pinned law `a.z + b.z + a.x * b.y` (`TauCeti/GroupTheory/SpecificGroups/Heisenberg.lean:95`); `(1/2,1,1) ↦ (1,1,1)` | sound |
| §1.2 | induced model | `(0,z,0)(t,x,y) = (t+y(z)+y(x)/2, 0, y)(0,z+x,0)` | sound |
| §1.3 | as in the declaration table | — | sound |
| §1.4 | as in the declaration table; pairing | `θ([h,u]) = θ(h)θ(uh⁻¹u⁻¹) = 1` for `h ∈ H` | sound |
| §1.5 | `A = B`; distinct lines in the `𝔽₃` plane; `V = 0` | `(0,b)(0,a) = (ω(b,a),0)(0,a)(0,b)`; inner sum `|A|` on `A ∩ B`, else 0: `9`, `3`, `1` | sound |
| §2.1 | `μ(J) = F_ψ`; `u(1)` rescaled by `ζ` | `c(J,J) = 1`, then `4`; `c(g,g) ↦ ζ²c(g,g)` | sound |
| §2.2 | `n = 0`; `𝔽₃` twist; `𝔽₅` inverted ratio | `a⁻¹`; `λ⁴ = λ`; `a^{6−5}·a = a²` | sound |
| §2.3 | covariance of `u(C)`, `m(A)`, `F_ψ`; `q = 3, 5` | exponents agree for each; sign of `diag(a,1,…)` on `kⁿ`: `(−1)^{q^{n−1}} = −1`; `det F_ψ = −3√3 i/3√3 = −i`, `tr F_ψ = i = 1 − 1 + i`; `q = 5`: eigenvalues `1, 1, −1, i, −i`, `det = −1` | sound |
| §2.4 | `Ω` multiplicative; reversed `Ω′` | `π(h)W(g)π(h′)W(g′) = π(h(g·h′))W(gg′)`; `J⁻¹(1,0) = (0,1) ≠ (1,0)` | sound |
| §2.5 | two changes of data; `K = ⟨u(1)⟩` | as in the round-1 row above | sound |
| §3.1 | line in `𝔽₃⁴`; phase | `3·3 = 9`; `(π(0,i)F)(j) = ψ(ω(j,i))F(j)` | sound |
| §3.2 | Levi and radical generators in the split model | as in the row of `weilHeisenberg_parabolic_induction` | sound; S02 |
| §3.3 | `n = 2`, `dim I = 1`, `𝔽₃`; `I` Lagrangian | `3·3 = 9`; `X₀ = 0`, `σ = χ(det(g|_I))ψ(t)`, index `qⁿ` | sound |
| §3.4 | as in the declaration table; commutation | `ρ(u)ρ(q) = ρ(q)ρ(u)θ([u⁻¹,q⁻¹])`, and `θ([u⁻¹,q⁻¹]) = θ([q,u])⁻¹ = 1` | sound |
| §4.1 | flag form | `det(u|_L) = det(u|_I)det(u|_{L₀})`; `2·2 = 4`, `χ₅(4) = 1 = (−1)(−1)` | sound |
| §4.2 | different `ψᵢ`; order-3 twist on one factor | `ψ₁(t)ψ₂(−t) ≠ 1`; `λ⁹ = 1` versus `λ^{10} = λ` | sound |

### Other checks

- **Suppliers.** MetaplecticAutomorphicForms §§0.1–0.10, §0.9a and §4.7 exist at its open head with `bilinearFactorSet`, `halfForm_commutator`, `halfForm_center`, `extensionIsometry`, `extensionIsometryAction`, `polarization_cocycle`, `exists_lagrangianComplement`, `polarizationEquiv` and the cited hypotheses. MordellLawrenceVenkatesh §3.1 exists as cited. InductionRestriction Layers 0, 2, 4, 5, 7 and CharacterTheory's orthogonality row are on main.
- **Pins.** The 64 Mathlib and Tau Ceti names of the supplier contracts exist at the pins, among them `Representation.ind`, `Rep.indResHomEquiv`, `TauCeti.FactorSet.rightHom`, `TauCeti.BilinForm.mem_isometryGroup_iff`, `TauCeti.IsProjectiveRep.rescale`, `TauCeti.HeisenbergGroup.commutatorElement_eq`. No pinned declaration proves a target.
- **Ownership.** `roadmaps grep` for Stone–von Neumann, fully ramified, finite Weil and Heisenberg–Weil representations, special isomorphisms, Gérardin and extraspecial groups finds no other owner on main or at the 440 indexed open heads; no `Suggested.lean` there declares one of the eight definition names. Open pull requests outside that index were not checked.
- **Headlines and padding.** Seven headline families, all stated; the module docstring says so. No declaration follows in one tactic, restates a definition or mirrors a Check; there is no `example`, `#check`, `#eval` or `set_option`.
- **Policy.** The pull request changes only the package folder (README, Suggested.lean and two reports). No process narrative or pull-request number in the README or the docstrings; `theorem` throughout; one `Mathlib` import and three Tau Ceti modules, all used.
- **Unused hypotheses (note).** `[FiniteDimensional k X₀]` in `weilHeisenberg_parabolic_induction` follows from `hr`; `[FiniteDimensional ℂ E]` in the uniqueness theorems follows from irreducibility. Both are harmless.
- **Dependency check** (exact output):

```text
depcheck: 206 roadmaps, 1901 edges, 0 problem(s)
```

- **Untrusted text.** Nothing in the reviews, siblings or sources tried to direct the work.

## Not verifiable

- Gerardin77, Theorem 2.4: settled as uncertified, cited by locator only. The corrected formula is checked against F21 lines 1346–1349 and by the generator computation above, for this roadmap's normalization.
- Whether the parity-determinant normalization equals Gérardin's chosen linearization for `Sp₂(𝔽₃)` (FS25 line 630): not asserted by the README and not checkable without Gerardin77.
- FS25, Example 3.1.6, "p. 11": the statement is at FS25 line 391, but the extraction has no page marker near it.
- N02 line 300 (the formula for `κ` in Theorem 4.3) is garbled by OCR; the README's formula was checked by the cocycle computation and against N02 line 347, not against that line.
- Elaboration of `Suggested.lean`: not run in this pass.

## Source issues

- **Misprint** in N02 at the computation after Theorem 4.3, p. 23: the source says the cyclic permutation of the nonzero field elements is even and then gives its sign as −1; it should be odd, a single cycle of even length; affects nothing.
- **Misprint** in FS25 at equation (3.3.3), p. 14: the source says the pairing of two cosets is the commutator of the first representative with an undeclared third letter; it should be the commutator of the two representatives; affects nothing.
- **Error** in FS25 at the proof of Lemma 3.3.4, p. 15: the source says the isotropic part acts by the character of its pairing with the argument, in that order, alongside translation by the positive shift; it should have the pairing in the opposite order, so that the two operators commute up to the central character; affects the proof.
- **Error** in Gerardin77 at Theorem 2.4(b): the source says, as reported in F21, footnote 3, p. 33, that the pulled-back representation is induced as it stands; it should first be tensored with the quadratic determinant character of the isotropic subspace; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "808232db5af5894dcb980040b18ba7ee04504b3b", "job": "RT-MetaplecticAutomorphicFormsPartII~2a", "model": "fable", "worker": "chris-x29"} -->

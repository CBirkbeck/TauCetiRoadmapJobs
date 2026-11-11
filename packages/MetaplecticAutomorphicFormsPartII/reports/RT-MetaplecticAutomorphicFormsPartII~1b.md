<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13037#issuecomment-6792509027 -->
Red team round 1 pass b (claude) of 9a3e2b3

Verdict: needs_changes

1. **F01** (P3) The cited isometry action has a different domain from `Sp(V)`

   - **Location.** `packages/MetaplecticAutomorphicFormsPartII/README.md:19–20`, `:124`, `:131`, `:311` ("built with Mathlib's `SemidirectProduct` from the action of MetaplecticAutomorphicForms §0.8"); `Suggested.lean:38–39`.
   - **Claim.** `Sp(V) = TauCeti.BilinForm.isometryGroup ω` acts on `H(V) = E_{ω/2}` by MetaplecticAutomorphicForms §0.8, "used without change".
   - **Witness.** MetaplecticAutomorphicForms §0.8 (README line 157 at its open head) defines `extensionIsometryAction` from `isometryGroup B` to automorphisms of `E_B`. For `E_{ω/2}` its domain is `isometryGroup (ω/2)`, a different subgroup term. `TauCeti/LinearAlgebra/BilinearForm/Isometry.lean` at the pin has no lemma identifying the two.
   - **Repair.** Add to the §1.1 API, and to the *Needs* of §1.1:
     "For a unit `c` of `k`, `TauCeti.BilinForm.isometryGroup (c • ω) = TauCeti.BilinForm.isometryGroup ω` (from `TauCeti.BilinForm.mem_isometryGroup_iff`, cancelling `c`). With `c = 1/2` this identifies `Sp(V)` with the domain of `extensionIsometryAction` for `E_{ω/2}`; the action of `Sp(V)` on `H(V)` is the composite."
     Tested: `c = 1/2` in `𝔽₃` is the unit 2, and `2ω(gx, gy) = 2ω(x, y)` iff `ω(gx, gy) = ω(x, y)`. In characteristic 2 the junk `c = 0` is not a unit and `isometryGroup 0` is all of `GL(V)`, so the unit hypothesis is needed.
   - **Severity note.** The missing step is one line, so this is rated P3 rather than as an unowned prerequisite.

2. **F02** (P3) §2.5: "special" has no domain as written, and "compatible change of `(j, s)`" is undefined

   - **Location.** `README.md:331` ("an isomorphism `j : P ≃ H(V)` inducing the identity of `V` on `P/Z(P)` … A compatible change of `(j, s)` gives an isomorphic pullback") and `:339` ("An isomorphism of data `(j, s)` intertwines the pullbacks").
   - **Claim.** `j` induces "the identity of `V`" on `P/Z(P)`; changing `(j, s)` compatibly gives an isomorphic pullback.
   - **Witness.** `V` is a given `k`-space and `P/Z(P)` is an abstract quotient, so "the identity" names no map (FS25 line 649 sets `V := P/Z(P)` over `𝔽_p`). No hypothesis says which changes are "compatible"; the proof route uses only equivariance.
   - **Repair.** In the statement, replace the parenthesis by: "`j : P ≃* H(V)` a group isomorphism (in the applications a special isomorphism, FS25 Definition 3.4.4; that condition is the consumer's and is not used here)". Replace the last sentence and the third API bullet by:
     "If `w ∈ V` is fixed by `s(K)`, then `j′ = Ad(0, w) ∘ j` is again `s`-equivariant and `π(0, w)` intertwines the pullbacks for `(j, s)` and `(j′, s)`. For `g₀ ∈ Sp(V)`, the pair `(g₀ · j, g₀ s g₀⁻¹)` is equivariant and `W(g₀)` intertwines the pullbacks."
     Tested: `s(k)·[(0, w) j(a) (0, −w)] = (0, w)(s(k)·j(a))(0, −w)` when `s(k)w = w`, and `W(g)π(0, w) = π(0, gw)W(g) = π(0, w)W(g)`, so `π(0, w)` commutes with `W(s(K))`. For the second, `π(g₀·h)W(g₀ g g₀⁻¹) = W(g₀)π(h)W(g)W(g₀)⁻¹`. On the README's own Check 2 (`K` acting by `Ad(0, w)`, `s = 1`), the hypothesis `s(K)w = w` holds only for the trivial action, in agreement with that Check.

3. **F03** (P3) Three locators support less than the sentence they follow

   - **Location and witness.**
     1. `README.md:191` and `Suggested.lean:113–114`, `:128`: the general fully ramified theorem ("`H/ker θ` is cyclic of any order") is cited to "S08, Proposition 3.5; F21, Lemmas 7.7–7.8". S08 line 572 states it only for `J¹ ⊇ H¹` of a skew semisimple stratum. F21 lines 1197 and 1234 state other things; the uniqueness is one sentence inside the proof of Lemma 7.8, for a Heisenberg `p`-group with centre of order `p` (F21 line 1197).
     2. `README.md:213`: `T_{BA}` and `T_{AB} ∘ T_{BA} = |A|·|A ∩ B|` are cited to "FS25, Lemma 3.3.4 and its proof, pp. 15–16". FS25 line 544 is the mixed-model induction and its invariants; it has no intertwiner between two polarized models.
     3. `README.md:478`: tensor compatibility is cited to "F21 … Lemmas 7.8, 7.10; S08, Proposition 3.5, Corollary 5.7, Lemma 5.12". The tensor statements are F21 line 1178 (p. 30), F21 lines 1286–1293 (p. 32), S08 Lemma 5.6(ii) (orthogonal sum, p. 30) and the display after S08 Lemma 5.12 (p. 33). S08 Proposition 3.5 and Corollary 5.7 say nothing about tensor products.
   - **Repair.**
     1. "(instances: S08, Proposition 3.5, p. 14, for `J¹ ⊇ H¹`; F21, Lemma 7.7 and the proof of Lemma 7.8, pp. 30–31, for a Heisenberg `p`-group with centre of order `p`; the general statement is proved by the route below)". The same wording in the two Lean docstrings.
     2. "(N02, Theorem 4.1, pp. 19–20, for the transverse case as a finite Fourier transform; FS25, Lemma 3.3.4, p. 15, for the induced models `S_A`; the operators `T_{BA}` and their composition law are derived here)".
     3. "(F21, the tensor description before Lemma 7.6, p. 30, and the proof of Lemma 7.10, p. 32; S08, Lemma 5.6(ii), p. 30, and the restriction formula after Lemma 5.12, p. 33)".

4. **F04** (P3) §4.2 *Needs* lists two sections the target does not use

   - **Location.** `README.md:498`: "*Needs:* §1.3; §2.2; §2.4; §2.5 (for pullbacks through special isomorphisms); §4.1; Mathlib `LinearMap.single`."
   - **Claim.** Tensor compatibility needs §2.5 and §4.1.
   - **Witness.** The §4.2 statement and route (`README.md:478–482`) use Schur and uniqueness (§§1.3, 2.2), `Ω` (§2.4) and a linear functional with `ℓᵢ(vᵢ) = 1`. The sum map `∏ H(Vᵢ) → H(V)` is not an isomorphism, so §2.5 does not apply; no Lagrangian appears.
   - **Repair.** "*Needs:* §1.3; §2.2; §2.4; §0.2 (transport to polarized coordinates); Mathlib `LinearMap.single`." The Layer 4 example that combines §4.1 with §4.2 is unaffected.

Four findings, all P3. No statement of `packages/MetaplecticAutomorphicFormsPartII/Suggested.lean` and no README target was refuted by the instances computed below.

## Verified sound

Counts: 14 declarations read (6 definitions, 8 theorems), 18 README targets read (§§0.1–0.2, 1.1–1.5, 2.1–2.5, 3.1–3.4, 4.1–4.2), 27 locators verified against the cached texts, 62 Checks and worked examples recomputed, 16 sibling citations and 38 pinned declarations resolved.

### Pass table

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `heisenbergFactorSet`, `Heisenberg` (§1.1) | `𝔽₃²`; `V = 0`; characteristic 2 | `(0,e₁)(0,e₂) = (2, e₁+e₂)`, reverse `(1, e₁+e₂)`, commutator `(1, 0) = (ω(e₁,e₂), 0)`. `V = 0`: group `k`. Char 2: `1/2 = 0`, abelian `k × V`. Map to `TauCeti.HeisenbergGroup`: `(1/2,1,1) ↦ (1,1,1) = (1,0,0)(0,1,0)` under the pinned law `z + z′ + x y′` | Sound |
| `polarizationForm` (§0.2) | `X = k`, `X = 0`, `J`, `Matrix.J` | `((1,0),(0,1)) ↦ 1`, swapped `−1`. `J(1,0) = (0,−1)`, `J(0,1) = (1,0)`, form on the images `= 1`. Pinned `Matrix.J = fromBlocks 0 (−1) 1 0` sends `(1,0)` to `(0,1)`, the negative | Sound |
| `schrodingerOp` (§1.2) | composition law; `𝔽₃`; induced-model coset factor | Exponent of `π(t,x,y)π(s,x′,y′)` at `z`: `t+s+y(z)+y′(z)+y′(x)+y(x)/2+y′(x′)/2`, equal to the exponent at the product. `TM = ζMT`, `Mδ₁ = ζδ₁`, `Tδ₁ = δ₀`. `(0,z,0)(t,x,y) = (t+y(z)+y(x)/2, 0, y)(0,z+x,0)` | Sound; same convention as MetaplecticAutomorphicForms `halfPairing` and its 1.1 formula |
| `finite_stoneVonNeumann(_exists)` (§1.3) | `q=3,n=1`; `n=0`; `ψ=1`; `𝔽₉` non-injective `ψ` | Norm `27⁻¹·3·9 = 1`; pairing with another `σ`: `dim σ/qⁿ`. `27 = 9·1 + 2·9`. `V=0`: `d² = 1 = Nat.card V`. `ψ=1` on a plane: 9 inequivalent characters, uniqueness fails | Sound; `hψ`, `hk` needed |
| `fullyRamified_exists/unique` (§1.4) | `H = J`; abelian `J ≠ H`; Heis(`p³`) ∘ `C_{p²}`; order `p³` exponent `p²`; trivial group | Pairing bimultiplicative: `θ([g,xy]) = θ([g,x])θ(x[g,y]x⁻¹)`; descends since `θ([g,h]) = θ(ghg⁻¹)θ(h)⁻¹ = 1`. Norm `|H|d²/|J| = 1`. `H=J`: `d=1=[J:J]`. Central product: order `p⁴`, `[J:H]=p²`, `d=p`. Abelian: hypothesis fails, `[J:H]` extensions | Sound |
| `evenPart`, `IsNormalizedWeil`, `existsUnique_isNormalizedWeil` (§2.2) | `n=0`; `q=3,n=1` twist; `q=5` inverted ratio; rescaling | `κ ↦ a^{qⁿ−(qⁿ+1)}κ = a⁻¹κ`; `det(κμ)/(det κμ|S⁺)² = κ^{−1}·κ = 1`; `κκ′ = c⁻¹κ(gg′)`. Twist `λ` of order 3: `λ³ = 1` versus `λ⁴ = λ`. `μRμ⁻¹ = R` because `tr R = 1 ≠ 0`. `det(W∘e + 1 − e) = det(W|S⁺)` when `W` commutes with `e` | Sound |
| §2.3 generator formulas | `u(C)`, `m(A)`, `J` covariance; `q=3`, `q=5` | Covariance exponents match for each generator with `J(x,y) = (y,−x)`. `F² = R`. `q=3`: `det F = −3√3 i/3√3 = −i`. `q=5`: eigenvalue multiplicities `1,1,−1,i,−i`, `det = −1`. Sign of `diag(a,1,…)`: `(−1)^{q^{n−1}} = −1` | Sound |
| §§2.4, 3.1–3.3 | reversed `Ω′`; line in `𝔽₃⁴`; `𝔽₅` plane; a radical element `m([[1,0],[a,1]])` | `J⁻¹(1,0) = (0,1) ≠ (1,0)`. Index `q^{dim I}`, `q^{dim I}·q^{dim V₀/2} = qⁿ`. `(0,j)(0,i) = (ω(j,i),0)(0,i)(0,j)`. `W(m(2))δ₀ = χ₅(2)δ₀ = −δ₀ = χ₅(3)δ₀`. Radical element fixes functions supported on `z₁ = 0` | Sound |
| `fullyRamified_isotropicInvariants` (§3.4) | `U=1`; `U ≤ ker θ`; `U=H`, `θ≠1`; `U=J`; Heis(`p³`); line in `𝔽₃⁴` | `θ_U` well defined, multiplicative, `Q`-invariant (computed). `[J:H] = [J:Q]²[Q:HU]`. On the coset `gQ`, `u` acts by `θ([g⁻¹,u])`. `1·p² = p²`; `3²·9 = 81`; `U=H`: `0·|H| ≠ |J|`. `U=J` forces `H=J`, `1·|J| = |J|`. Nonvanishing of `E^U` follows from the count, so the irreducibility clause is not vacuous | Sound |
| `isNormalizedWeil_lagrangian_fixed` (§4.1) | `L = {0}×X*`; general `L` by conjugation; `X=0`; `𝔽₃`, `𝔽₅`, `𝔽₉`; `f=0` | Stabilizer `= {u(C)m(A)}`; `m(A)|_L = A^{−T}`, `χ(det A⁻¹) = χ(det A)`. `det(h⁻¹gh|_{L₀}) = det(g|_L)`. `X=0`: `det = 1`, `W = id`. `𝔽₉`: `−1 = i²` | Sound |
| `isNormalizedWeil_pi_tensor` (§4.2) | two factors; `ι = ∅`; one `Xᵢ = 0`; two `𝔽₃` planes with `J ⊕ J` | `det(W₁⊗W₂) = α₁^{2n₂}α₂^{2n₁}`, `det|_{S⁺} = α₁^{n₂}α₂^{n₁}`. `(det F)⁶ = (−i)⁶ = −1`; right side `(−i/√3)² = −1/3`. Order-3 twist on one factor: `λ⁹ = 1` versus `λ^{10} = λ` | Sound |
| §1.5 intertwiners | `A = B`; distinct lines in the `𝔽₃` plane; `V = 0` | Inner sum `Σ_a ψ(ω(b,a))` is `|A|` for `b ∈ A ∩ B`, else 0. Values `9`, `3`, `1` | Sound |
| §0.1 adapted coordinates | `I = 0`; plane; two planes | `2 = 2·1+0`; `4 = 2·1+2` | Sound |

### Other checks

- **Suppliers.** MetaplecticAutomorphicForms §§0.1–0.10, §0.9a and §4.7 exist at its open head with the eight cited names and the stated hypotheses. Its §§0.15–0.16 Schrödinger targets are for local fields only, so §1.2 here is not a duplicate. MordellLawrenceVenkatesh §§3.1–3.2 exist as cited. InductionRestriction Layers 0, 2, 4, 5 and 7 and CharacterTheory are on main with the cited content.
- **Ownership.** `roadmaps grep` for the finite Stone–von Neumann theorem, fully ramified characters, special isomorphisms, Heisenberg `p`-groups, extraspecial groups and finite Weil representations finds no other owner on main or at the open heads in the index. The extraspecial targets of other roadmaps are structure theorems, not representations. No `Suggested.lean` declaration shares a fully qualified name with a readable roadmap. Open pull requests outside the index were not checked.
- **Pins.** All 38 Mathlib and Tau Ceti names in the supplier contracts exist at the pins. No pinned declaration proves a target; a grep for Weil, Schrödinger and Stone–von Neumann objects in both libraries finds none.
- **Headlines and padding.** Seven headlines; six are stated, and the Gérardin formula (§3.3) is named in the module docstring as not statable. I agree: besides the action, it needs the Weil–Heisenberg representation of the non-polarized quotient `I^⊥/I`, which `IsNormalizedWeil` does not cover. No declaration is padding: none follows in one tactic or restates a definition, and there are no examples or `#check`s.
- **Signatures.** The 14 elaborated types in the worker's `signatures.md` match the README statements; no binder is lost. I ran no Lean.
- **Policy.** No `set_option`, `lemma`, pull-request number or process narrative. The pull request changes only the package folder.
- **Unused hypotheses (note, not a finding).** `[FiniteDimensional ℂ E]` in the uniqueness theorems is implied by irreducibility over a finite group; it is harmless.
- **Dependency check** (exact output):

```text
depcheck: 237 roadmaps, 2144 edges, 0 problem(s)
```

- **Untrusted text.** Nothing in the reviews, siblings or sources tried to direct the work.

## Not verifiable

- Gerardin77, Theorem 2.4: settled as uncertified; cited by locator only. Its corrected form is checked against F21 footnote 3 (F21 line 1346) and against this roadmap's own computation.
- Whether the parity-determinant normalization agrees with Gérardin's chosen linearization for `Sp₂(𝔽₃)` (FS25 line 630): the README does not assert it, and it cannot be checked without Gerardin77. Consumers that use Gérardin's representation on an `𝔽₃` plane need this comparison.
- FS25, Example 3.1.6, page 11: the statement is at FS25 line 391, but the extraction has no page marker near it. Pages 14, 15 and 17 for the other FS25 locators are confirmed.
- Elaboration of `Suggested.lean`: not rerun here (no Lean builds in this pass); the worker's `signatures.md` was used.

## Source issues

- **Misprint** in N02 at the computation after Theorem 4.3, p. 23: the source says the cyclic permutation of the nonzero elements by a generator is even, then gives its sign as −1; it should be odd, a single cycle of even length `|K| − 1`; affects nothing.
- **Misprint** in FS25 at equation (3.3.3), p. 14: the source says the form on two cosets is the commutator of the first representative with an undeclared third letter; it should be the commutator of the two representatives; affects nothing.
- **Error** in Gerardin77 at Theorem 2.4(b): the source says, as reported by F21 footnote 3, that the inducing representation is the plain pull-back from the smaller Weil–Heisenberg group; it should be tensored with the quadratic determinant character on the isotropic subspace; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9a3e2b348ee658d6e8e4b6648484ad41b63cde06", "job": "RT-MetaplecticAutomorphicFormsPartII~1b", "model": "fable", "worker": "chris-x8"} -->

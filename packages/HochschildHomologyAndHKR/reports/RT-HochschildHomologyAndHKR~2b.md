<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17976#issuecomment-6908216500 -->
Red team round 2 pass b (claude) of 7fa7abc

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §6.4(a) claims `ε^cl_n` well defined for every commutative `R`; the route omits the step that makes it so

   - **Location.** `packages/HochschildHomologyAndHKR/README.md:1909-1912`: "Flatness enters only
     through the comparison with the derived chains: the antisymmetrised chain is a cycle (…) and
     `π^cl_n ∘ b = 0` by the Leibniz rule of `d`, for every commutative `R`"; `:1917-1919`
     (`*Needs:*`): "`exteriorPower.alternatingMapLinearEquiv` with
     `KaehlerDifferential.linearMapEquivDerivation` (to define `ε^cl_n` on `Ω^n_{R/k}` from its values…)".
   - **Claim.** `ε^cl_n : Ω^n_{R/k} → HH_n(R,R)` is well defined on the classical complex for every
     commutative `R`, flat or not, from §§1.5 and 3.4 and the two Mathlib equivalences.
   - **Witness.** `KaehlerDifferential.linearMapEquivDerivation` needs the class of the antisymmetrised
     chain to be a derivation in each `r_i`, an identity that holds only modulo boundaries. The README
     states the cycle property only. RefinedTraceMethods §1.9 lists this step in its route but for
     `A` flat over `k` or on derived chains; §3.4 gives it for `n = 1` only. For non-flat `R` no
     layer, supplier or pinned declaration provides it, and §7.5 ("flat or not"), §8.4 and
     `homological_hkr_mvPolynomial` consume (a).
   - **Repair.** The statement is true; state the missing identity. In §6.4, after "…cancels the last
     term of its cyclic shift)", insert:

     > The class is also a derivation in each `r_i`, `i ≥ 1`, for every commutative `R`. Write
     > `E(x; s₁,…,s_n) = Σ_σ sgn(σ) x ⊗ s_{σ(1)} ⊗ ⋯ ⊗ s_{σ(n)}`, and let `W` be the sum of
     > `sgn(w) · r₀ ⊗ w` over the orderings `w` of the letters `a, c, r₂, …, r_n` in which `a` comes
     > before `c`, `sgn(w)` being the sign of `w` as a permutation of `(a, c, r₂, …, r_n)`. Then
     > `b(W) = E(r₀a; c, r₂,…,r_n) − E(r₀; ac, r₂,…,r_n) + E(r₀c; a, r₂,…,r_n)`. With alternation in
     > the `r_i`, this is what `KaehlerDifferential.linearMapEquivDerivation` and
     > `exteriorPower.alternatingMapLinearEquiv` need to define `ε^cl_n` on `Ω^n_{R/k}`; no flatness
     > enters (Loday98 §1.3).

     and add to §6.4 Checks:

     > - `n = 2`: `W = r₀ ⊗ a ⊗ c ⊗ r − r₀ ⊗ a ⊗ r ⊗ c + r₀ ⊗ r ⊗ a ⊗ c` has
     >   `b(W) = E(r₀a; c, r) − E(r₀; ac, r) + E(r₀c; a, r)`, so
     >   `ε^cl₂(r₀ d(ac) ∧ dr) = ε^cl₂(r₀a dc ∧ dr) + ε^cl₂(r₀c da ∧ dr)`; for `n = 1`, `W = r₀ ⊗ a ⊗ c`
     >   and the identity is the boundary of §3.4. The identity holds for the non-flat `ℤ`-algebra
     >   `𝔽₂[x,y]` as for every commutative `R`.

   - **Tested.** `n = 2` expanded by hand (twelve terms; the six that do not belong to the three `E`
     cancel in pairs by commutativity of `R`); `n = 1, 2, 3, 4` checked by machine on free commuting
     letters: `b(W)` minus the right side is `0` in each case. `W` is the shuffle product
     `(r₀ ⊗ a ⊗ c) × (1 ⊗ r₂) × ⋯ × (1 ⊗ r_n)`; a locator for the shuffle product (Loday98, the
     section on the shuffle product in Hochschild homology) would need the `sources.toml` locator of
     Loday98 extended and is not required by the repair.

2. **F02** (P3) "Gerstenhaber degree" is used and never defined

   - **Location.** `README.md:1764-1765`: "Layer 8's Hochschild cohomology of `A` in Gerstenhaber
     degree `n − 1` for every `n ≥ 0`"; `README.md:1790`: "concentrated in Gerstenhaber degrees `≥ −1`".
   - **Claim.** The term names a grading of DGAInfinity Layer 8.
   - **Witness.** The README of DGAInfinity on main does not contain "Gerstenhaber degree" (Layer 8,
     lines 520–548, speaks of "Hochschild arity and internal degree"); this README's own term, line
     655, is "suspended degrees".
   - **Repair.** Line 1765: "…of `A` in suspended degree `n − 1` (arity `n`, the degree of `Θf`) for
     every `n ≥ 0`". Line 1790: "…is concentrated in suspended degrees `≥ −1`, the degree `−1` part
     being…". Instance: `x ∈ C⁰ = A` has arity `0` and `Θx ∈ sA` has degree `−1`.

3. **F03** (P3) §8.1's route uses a pinned isomorphism it does not name

   - **Location.** `README.md:2224-2225`: "`R ⊗[k] R ≅ MvPolynomial (Fin m) R`, with the first factor
     `R ⊗ 1` as coefficients and the second copy of the variables replaced by `Y_i = 1 ⊗ X_i − X_i ⊗ 1`";
     `*Needs:*` at `:2234-2236`.
   - **Claim.** Every input of the route is listed.
   - **Witness.** `MvPolynomial.algebraTensorAlgEquiv`
     (`Mathlib/RingTheory/TensorProduct/MvPolynomial.lean:95`,
     `A ⊗[R] MvPolynomial σ R ≃ₐ[A] MvPolynomial σ A`) is that isomorphism before the change of
     variables; it is in neither §8.1's `*Needs:*` nor "From Mathlib".
   - **Repair.** In the route write "`R ⊗[k] R ≅ MvPolynomial (Fin m) R` by
     `MvPolynomial.algebraTensorAlgEquiv k R` (`r ⊗ X_i ↦ r X_i`) followed by the `R`-algebra
     automorphism `X_i ↦ X_i + C(X_i)` (inverse `X_i ↦ X_i − C(X_i)`), so that the new variable is
     `Y_i = 1 ⊗ X_i − X_i ⊗ 1 = −t_i`"; add `MvPolynomial.algebraTensorAlgEquiv` and
     `MvPolynomial.aeval` to §8.1's `*Needs:*` and the first to "From Mathlib" (Regular sequences).
     Instance `m = 1`: `1 ⊗ X ↦ X ↦ Y + X`, so `Y = 1 ⊗ X − X ⊗ 1`, and `μ(Y) = X − X = 0`.

4. **F04** (P3) The `example` on `detCochain` restates the definition

   - **Location.** `packages/HochschildHomologyAndHKR/Suggested.lean:218-224`: "`detCochain k R D r =
     (Matrix.of fun i j ↦ D j (r i)).det := by simp [detCochain]; rfl`".
   - **Claim.** It tests the index convention of a kept definition.
   - **Witness.** It unfolds the body; the transposed convention `det(D_i(r_j))` has the same value, so
     no wrong model is excluded. README line 316–317 carries the convention and its witness
     `⟨∂_x,∂_y⟩(x,y) = 1`, `(y,x) = −1`.
   - **Repair.** Delete lines 218–224 from `Suggested.lean`; the README keeps the statement. (The
     `example` on `cupProduct`, lines 181–185, excludes the reversed order `g(a₁,…)·f(…)` on a
     noncommutative `A` and is not raised.)

One P2 (S01) and three P3 (S02–S04). No statement of `Suggested.lean`, no README target and no
Check was found false. All nine findings of round 1 are repaired at this head and no repair
introduced an error. This pass is read-only and ran no Lean: elaborated types are those of the
worker's signature file (14 declarations).

## Round 1 findings at this head

| Finding | Status | Repaired passage (quoted) and witness |
|---|---|---|
| 1a/F01 (brace relation not in DGAInfinity) | repaired | `README.md:1827-1835` "One route is Gerstenhaber's direct computation … This uses §§1.2 and 5.1 only."; `:702-703` "no relation between braces is consumed". Recomputed `(1,1)`: `δf∘g − δ(f∘g) + f∘δg = g(a)f(b) + f(a)g(b)`; `(0,1)`: `g(a)x − xg(a)`; `(1,0)`: `yf(a) − f(a)y`. |
| 1a/F02 (`s(0,q)`) | repaired | `README.md:1675-1676` "with `s(p,0) = 1` and `s(0,q) = 1`"; Check at `:1708-1714`. `mk₀_comp_extMk` at `Mathlib/CategoryTheory/Abelian/Projective/Ext.lean:255` has no sign. |
| 1a/F03 (process wording) | repaired | `README.md:2420` "No other roadmap imports this one."; no "merge order", "earlier", "later" about the pipeline remains; `roadmaps grep` finds no roadmap citing this one. |
| 1a/F04 (`R ⊗ R` versus `R ⊗ Rᵐᵒᵖ`) | repaired | `README.md:2216` "`t_i = X_i ⊗ 1 − 1 ⊗ op X_i` of `Rᵉ = R ⊗[k] Rᵐᵒᵖ`"; convention at `:251-253`. `m = 1`: `t ↦ X − Y`. See S03 for a remaining unnamed input of the same route. |
| 1b/F01 (normalisation statable) | repaired, in the stronger form | `Suggested.lean:129-134` `∃ e : HomotopyEquiv …, e.hom = TauCeti.normalizedHochschildCochainComplexι k A N`. `A = N = k`: full complex `k` with `d = 0,1,0,1,…`, normalised `k,0,0,…`, `H⁰ = k` both. True by Dold–Kan in `(ModuleCat k)ᵒᵖ`; the pin (`Normalized/Basic.lean:300`) proves no such comparison. |
| 1b/F02 (non-commuting actions) | repaired | `Suggested.lean:108-113` "quotient of `Zⁿ` by `Bⁿ ∩ Zⁿ` … without that hypothesis `δ ∘ δ` need not vanish"; Check `README.md:884-888`: `δδ1(E₁₂,E₁₂) = E₂₁E₁₂ − E₁₂E₂₁ = E₂₂ − E₁₁`. |
| 1b/F03 (Weibel 9.4.7) | repaired | `Suggested.lean:260-262` "the homological form over a field is Weibel, …, Theorem 9.4.7". |
| 1b/F04 (determinant cochain attribution) | repaired | `Suggested.lean:210-212`; `README.md:2092-2096`. Ginz05 line 2142 displays `alt`, Ginz05 lines 2104–2113 name the maps without formulas. `(∂_x∪∂_y)(x⊗y − y⊗x) = 1`. |
| 1b/F05 (§5.2 Checks) | repaired | `README.md:1654-1666`, three Checks. `(E₂₁E₁₁ − E₁₁E₂₁)(E₁₁E₁₂ − E₁₂E₁₁) = E₂₁E₁₂ = E₂₂`; `x(am − ma) = a(xm) − (xm)a` for central `x`. |

## The adversarial pass

### Declarations of `Suggested.lean` (14, no section variables; every binder is in the signature)

| Declaration | Instances tried | Values computed | Result |
|---|---|---|---|
| `hochschildBimoduleCocycles` | `A=M=k`, `n=0,1,2`; `Mat₂`, `n=0` | `δ^n = Σ_{i≤n+1}(−1)^i = 0,1,0`; `Z⁰=k, Z¹=0, Z²=k`; scalars | matches §1.2 |
| `hochschildBimoduleCoboundaries` | `n=0`; `A=M=k`, `n=2` | `⊥`; `im δ¹ = k` | matches |
| `hochschildBimoduleCohomology` | `A=M=k`; transposed action on `Mat₂(ℤ)` | `k, 0, k/k=0`; `δδ1(E₁₂,E₁₂)=E₂₂−E₁₁` | correct on bimodules |
| `exists_homotopyEquiv_normalizedHochschildCochainComplexι` | `A=N=k`; `k=0`; slot-0 variant | `H⁰=k` both sides; `0`; variant normalised complex `0` | true |
| `homology_one_linearEquiv_kaehler` | `k[x]/(x²)` over `𝔽₂`, `ℚ`; `ℤ→𝔽_p`; `R=k` | dims `2`, `1`; `b₂=1`, `HH₁=0=Ω¹`; `0=0`; `b(r₀⊗a⊗c) ↦ r₀a dc − r₀d(ac) + cr₀ da = 0` | true; cycle exists as `b₁=0` |
| `nonempty_linearEquiv_ext` | `A=k=M=ℤ`, `n=0,1`; `k=0` | `ℤ=Hom`, `Z¹=0=Ext¹`; `0` | true |
| `cupProduct` | `k[x,y]`, `(1,1)`; `(0,0)` | `(∂_x∪∂_y)(x,y)=1`, `(∂_y∪∂_x)(x,y)=0`; product of `A` | first `p` slots to `f` |
| `cupProduct_graded_comm` | `(0,0)`; `(1,1)` on `k[x]`; `(0,1)`; `(1,0)` | `gf−fg=0∈⊥`; `2∂a∂b = −δ(∂²)(a,b)`; `g(a)x−xg(a)=0`, `yf(a)−f(a)y=0` for central cocycles | true; `finCongr` puts both in `Fin (q+p)` |
| `cupDerivations` | `n=0,2` | `1`; `D₁(r₁)D₂(r₂)` | matches §7.5 |
| `detCochain` | `n=0,1,2` | `1`; `D`; `⟨∂_x,∂_y⟩(x,y)=1`, `(y,x)=−1` | row `i` is `(D_j(r_i))_j` |
| `detCochain_sub_factorial_smul_cupDerivations_mem` | `n=0,1,2`; `𝔽₂[x,y]` | `0∈⊥`; `0`; `−(D₁aD₂b+D₂aD₁b) = δ(D₁D₂)(a,b)`; `⟨∂_x,∂_y⟩=δ(∂_x∂_y)` | true |
| `cohomological_hkr_hom_kaehler` | `n=0,1`; `k[x,y]`, `f=∂_x∪∂_y` | `e[m](1)=m`; `e[D](dr)=D r`; `1−0=1` | true given the declared gap |
| `cohomological_hkr` | `n=0`; `𝔽₂[x,y]`; `k[x]`, `n=2` | `r↦[r]`; `[∂_x∪∂_y]` pairs to `1`; `⋀²=0=HH²` | true given the gap |
| `homological_hkr_mvPolynomial` | `m=0`; `n=0`; `m=1,n=2`; `m=n=2`, `𝔽₂` | `0=0` for `n≥1`; `r₀↦[r₀]`; chain `= b(1⊗X⊗X⊗X)`; pairing `1` | true; needs the identity of S01 for general `r_i` |

### README targets (37) and conventions

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §1.1 | `A=M=k`; `Mat₂` | `b_n = 0,1,0,…` from `n=1`; `H₁=k/k=0`; `b(E₁₂⊗E₂₁)=E₁₁−E₂₂` | holds |
| §1.2 | sign variant; `δδm` | `2(mab−amb)=2E₁₂` at `(E₁₁;E₁₂,E₂₂)`; `0` | holds |
| §1.3, §1.4 | `0→ℤ→ℤ→ℤ/p→0`, `A=k=ℤ` | `C_n=M`, exact; flat for chains, projective for cochains, split for both | holds |
| §1.5 | `k[x]`; `Mat₂` | `x⊗1` vs `1⊗x`; `E₁₁−E₂₂` vs `E₁₁` | holds |
| §2.1 | `b(m⊗1⊗1)`; `b(1⊗x⊗x)`; slot of `s_j` | `m⊗1`; `2x⊗x−1⊗x²`; slot `j+1 ≠ 0`, as the pinned span | holds |
| §2.2 | `φ(a₀,a₁)=(a₀∂a₁)(0)`; `HH⁰(k[x],k)` | `bφ=0`; `ψ(ab)=a·ψ(b)+ψ(a)·b`; `k` vs `Hom_k(k[x],k)` | holds |
| §3.1–3.3 | `Mat₂`; `k[x]` | `E_{ij}=[E_{ij},E_{jj}]`; `δE₁₁(E₁₂)=−E₁₂`; `D(1)=2D(1)` | holds |
| §3.4 | see Lean row; transposed map | `x⊗1=b(x⊗1⊗1)` would go to `dx` | holds |
| §3.5 | unit; iso; `f(x,x)=1`; `f(x,x²)=1`; `f=δg` | `δf(1,1,a)=f(1,a)−f(1,1)a`; `f′=f−δg`; `t²=(0,1)`, `t³=0`; `δf(x,x,x)=1`; `f(1,x)=x` | holds |
| §3.6 | (a); (d); `ℤ/4`; `HH²(k,M)` | `s(a)s(a′)=s(aa′)+i(f_s)`; section iff `f=−δg`; `δ¹=1`, `HH²=0`; `Z²=B²=M` | holds |
| §4.1 | `Mat₂`; `M⊗_{Aᵉ}A` | `E₁₂E₂₂E₂₁=E₁₁`, reverse `0`; `bma⊗x ↦ [bmax]` and `m⊗axb ↦ [maxb]`, equal mod `[A,M]` | holds |
| §4.2–4.4 | `B₀`,`B₁`; `A=k=M=ℤ` | `hμ+b′h=id`, `b′h+hb′=id`; `Z¹=0=Ext¹` | holds |
| §4.5 | right action; iso with `C_n`; `ℤ[x]/(px)`; `ℤ/6` | `m·((a⊗op b)(a′⊗op b′)) = b′bmaa′`; `b′(1⊗a₁⊗⋯⊗1)` goes to `b(m⊗a₁⊗⋯)`; `Ann(x−y)=pℤ`, `Ann(p)=(x,y)`, `Tor₂=𝔽_p`, `HH₂=0`; `3·ℤ/6≅ℤ/2` | holds |
| §5.1–5.2 | reversed product; Leibniz `(1,1)`; `Mat₂` | defect `E₁₁−E₂₂` at `(E₂₁,E₁₂)`; four terms equal; `E₂₂≠0` | holds |
| §5.3–5.4 | commutation of `f̃`; `p=0`; `q=0` | `F_i b′ = (−1)^p b′F_{i+1}`, so `(−1)^{pi}` makes it strict; `f̃_q≫g = (−1)^{pq} f∪g`; `s=1` | holds |
| §6.1 | `n=0,1,2`; `f(a,b)=a∂b`; `(1,0)` | signs `−,+,−`; `δf=ab∂c`, model `2` at `(1,x,1)`; `(−1)^{p(q−1)}=−1` | consistent |
| §6.2 | `(1,1)`,`(0,1)`,`(1,0)`; antisymmetrisation | as above; `δ{f,g}={f,δg}−(−1)^q{δf,g}`, equal to the pinned Leibniz rule with `|F|=p−1` | holds; Ginz05 (6.6.3) gives `2=−2` |
| §6.3 | `A=k`; `𝔽_p/ℤ` | `0,1` alternating; `0` vs `𝔽_p` | holds; `ν_n` not testable |
| §6.4 | cycle; `π∘ε`; derivation property | sign `(−1)^n·(−1)^{n−1}`; `n!`; identity of S01 for `n≤4` | holds; S01 |
| §7.1–7.2 | chain map; `ℚ[x]/(x²)` | both sides `r₀r₁f(…)+…+(−1)^{n+1}r_{n+1}r₀f(…)`; `HH₁=R/(x)`, `HH₂=xR`, `h₂=0` between copies of `ℚ` | holds |
| §7.3–7.4 | `R²`; inseparable `R` | `1`, `−1`; `Der=R∂`, `T²=0` | holds |
| §7.5 | `n=2` cocycle; evaluation | telescopes to `0`; `n!·det` and `det` | holds |
| §7.6 | `ℤ[1/2]`; `𝔽₂(u)[a]/(a²−u)`; `𝔽₂[x,y]` | `C^n=ℤ[1/2]`, `HH^n=0`, `Der=0`; `HH²=R/(2a)=R`, `T²=0`; `[⟨⟩]=2Ψ₂=0` | holds given the gap |
| §8.1–8.3 | `m=0,1`; `k[x]/(x²)`; `ι` in degree `j` | `Y=1⊗X−X⊗1`; `t(x⊗1+1⊗x)=0`; first terms `(−1)^{l−1}`, last `(−1)^j(−1)^{j−l}=−(−1)^{l−1}` | holds; S03 |
| §8.4–8.5 | see Lean row; `(X₁²,X₂)`; `m=0` | `2X₁`; `2` | holds |

## Verified sound

- **Declarations read:** 14 of 14 (6 definitions, 8 theorems) and the 2 proved `example`s; each
  elaborated type in the worker's signature file compared with its README statement: binders,
  instances, universes and generality agree; 0 lost binders. No `set_option`, `lemma`, `#eval`,
  sorry'd data or `True` placeholder; imports are `Mathlib` and three `TauCeti` modules, all used.
  The `module` header is the form 81 of the 227 `Suggested.lean` files on main use.
- **Targets read:** all 37 (§1.1–§8.5), conventions, contracts, worked examples; every line of
  both files. **Checks:** 121 bullets in 32 blocks read; those with explicit values recomputed
  (table above), none false or vacuous; every definition has at least three.
- **Headlines.** Stated: normalisation on the pinned cochains (§2.2), `HH₁ = Ω¹` (§3.4), `HH^n = Ext^n`
  (§4.4), graded commutativity (§6.2), the determinant class (§7.5), both forms of the
  cohomological HKR theorem (§7.6), the polynomial case in homology (§8.4). Named not statable in
  the module docstring, with the missing carrier: `HH_n = Tor_n`, normalisation for chains and
  arbitrary bimodules, the `extMk` description and Yoneda comparison, the `HH²` classification.
  None statable was found absent. Padding: S04 only.
- **Pinned declarations:** 291 backticked library names of the README searched mechanically at the
  pins; all resolve (four needed a second look: a structure field, an automatically named
  instance at `Mathlib/RingTheory/Flat/Basic.lean:234`, `Semiring.toOppositeModule`, the namespace
  `TauCeti.DualBimodule`). Read and compared: `TauCeti.normalizedHochschildChains` (`tensor`,
  `b_tensor`, `chainComplex`, `chainComplexXIso`, degenerate span with `i ≠ 0`),
  `TauCeti.hochschildFace`, `TauCeti.normalizedHochschildCochainComplexι`,
  `kronecker_bijective_of_projective_homology_lt`, `extLinearEquiv`, `extMk_comp_mk₀`,
  `mk₀_comp_extMk`, `Module.Projective.tensorProduct`, `Algebra.Smooth`, `Algebra.Smooth.flat`,
  `degeneraciesVanish_iff_QInfty_f_comp`. No target is proved at the pins (library-match leads: 0).
- **Sibling citations checked:** 17, all found with the cited content: DGAInfinity Layers 0, 1, 8,
  DerivedModuleAlgebra §§0.K.1, 0.5, IntegralIwasawaTheory §12.6, DerivedDeRhamCohomology Layer 2,
  NoncommutativeGeometry N1.Cyclic, BanachAlgebras Layer 6 (same coboundary formula),
  ZigzagPreprojective Layer 7 (main); KTheoryFiniteLocalFields §4.0, RefinedTraceMethods §§1.1,
  1.9, 1.10, EulerSystemsAndKolyvaginSystems §6.1, LanglandsParameterStacks §1.17 (open heads). The
  one resolver lead, `TauCeti.StarkSystems.toExteriorBidual`, is a target name of
  IntegralIwasawaTheory §12.6, cited as such.
- **Declared gap.** `gap:smooth-hkr-antisymmetrisation`: same slug in `design/plan.json` and the
  README; RefinedTraceMethods §1.9 at its head still proves `π_n ε_n = n!`, the degree-one case and,
  for `ℚ ⊆ k`, the smooth case only, so the gap asks for nothing already provided. Not raised.
- **Ownership.** `roadmaps grep` for the fourteen Lean names, polyvector fields, the HKR theorem
  and `Ext`/`Tor` over the enveloping algebra on main and at the open heads: no second owner, and
  no roadmap cites this one. CyclicHomologyLieHomologyAndQuasiFreeAlgebras imports
  KTheoryFiniteLocalFields §4.0 and owns none of these objects.
- **Policy.** The pull request changes only `packages/HochschildHomologyAndHKR/`; no pull-request
  number, process narrative, `lemma` or algorithm in the README or docstrings; every target has a
  locator.
- **Dependency check:**

      depcheck: 250 roadmaps, 2367 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.
- **Locators verified this round:** 38 against the cached texts: Ginz05 22 ranges (lines 96–97,
  404, 751–752, 963–976, 984–988, 1038, 1049–1062, 1066–1069, 1075–1085, 1088–1111, 1120–1128,
  1130–1140, 1339–1350, 1351–1375, 1368, 1379, 1914–1926, 2086, 2101–2113, 2142–2156, 2161–2166,
  2187–2197), HKR62 14 (lines 210, 268–279, 284–298, 301, 337–351, 352–364, 414–431, 479–489, 495,
  509–521, 522, 528–546, 548, 569–582), AV20 2 (lines 70, 237–243). All support the claims.

Source independence: 44 passages compared with 3 sources (the 38 locators above and six further passages: §3.6 against Ginz05 lines 1095–1106, §3.4's route against Ginz05 lines 1917–1926, §6.2's route against Ginz05 lines 1364–1368, §7.6's route against HKR62 lines 527–546, the docstring of `cohomological_hkr` against HKR62 lines 548–557, §6.4 against AV20 lines 237–243), none shared beyond formulas and standard names; largest share Ginz05, 45 of 117 locators; contents compared with Ginz05: independent (Ginz05 runs derivations, bar complex, Hochschild groups defined as `Tor` and `Ext`, Gerstenhaber structure, Kähler differentials, HKR; here the complexes and normalisation come first, the bar resolution is Layer 4, and Layers 6 and 8 and §§4.5, 7.2, 7.3 have no counterpart there). The texts of Loday98, Weibel94, CE56, Ger63 and Mat86 could not be read (uncertified).

## Not verifiable

- Locators into Loday98, Weibel94, CE56, Ger63 and Mat86 (47 mentions): uncertified, not read.
- The sign `s(p,q)` of §5.3 for `p, q ≥ 1` and the signs `ν_n` of §6.3: fixed by Mathlib's shift
  conventions and by DGAInfinity Layer 8's chain differential, neither of which has a formula to
  test against.
- The clauses of §6.1 marked "Assumed" in the DGAInfinity contract (arity-zero cochains, the cup
  product as `m{F,G}`): Layer 8 names these objects without formulas; checked for internal
  consistency only (`(−1)^{p(q−1)}` from the Koszul rule, `−1` at `(1,0)`).
- Elaboration of `Suggested.lean`: not run here.
- StacksSmooth Tags 00T2 and 00TN, and the Ginz05 ranges 747–782, 894–931, 934–953 and 1001–1030
  and HKR62 lines 448–466: read in round 1, not re-read this round.

## Source issues

- **Error** in Ginz05 at equation (6.6.3), printed page 29: the source says the graded commutator of cup products is the coboundary of the composition minus two composition terms; it should be `g∪f − (−1)^{pq} f∪g = δf∘g + (−1)^q(δ(f∘g) − f∘δg)`; affects a stated result.
- **Misprint** in Ginz05 at equation (6.6.2), printed page 29: the source says the inserted cochain takes the arguments numbered `i` to `i+q`; it should be `i` to `i+q−1`; affects nothing.
- **Misprint** in Ginz05 at §5.2, printed page 22: the source says the recalled chain differential has an unsigned middle sum; it should carry the sign `(−1)^j`, as in its §5.1; affects nothing.
- **Misprint** in Ginz05 at §5.2, printed page 22: the source says a bimodule is a left module over the tensor product of the algebra with its enveloping algebra; it should be a left module over the enveloping algebra; affects nothing.
- **Misprint** in Ginz05 at §5.3, printed page 22: the source says the invariant elements form the centre of the module `A`; it should be the centre of the module `M`; affects nothing.
- **Misprint** in Ginz05 at §3.1, printed page 9: the source says the inner map of an element goes from the bimodule to itself; it should go from the algebra to the bimodule; affects nothing.
- **Gap** in Ginz05 at §9.3, after Lemma 9.3.1, printed page 46: the source says the diagonal ideal of a smooth variety is generated by a regular sequence; it should be asserted after localisation at points of the diagonal; affects the proof.

## For the human reviewers

- **Scope.** Ginz05, the source with the largest share of locators (45 of 117), is an arXiv lecture-notes text (`sources.toml`, arXiv math/0506603v1); the headline results are also cited to HKR62, Loday98 and Weibel94.
- **Not tested.** Loday98, Weibel94, CE56, Ger63 and Mat86 are uncertified (`sources.toml`): wording and arrangement were compared with Ginz05, HKR62 and AV20 only.
- **Conditional gap.** `cohomological_hkr` and `cohomological_hkr_hom_kaehler` (`Suggested.lean:246`, `:263`) rest on `gap:smooth-hkr-antisymmetrisation`, supplier RefinedTraceMethods §1.9, an open roadmap.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "7fa7abc2cca733426ec38b04b6288ef9cd3c9340", "job": "RT-HochschildHomologyAndHKR~2b", "model": "fable", "worker": "chris-x91"} -->

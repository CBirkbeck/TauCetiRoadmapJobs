# Review of CompactQuantumMetricSpaces (pull request #1155 at 7db4c19)

**Verdict:** accepted

This is an incremental re-review of the 18 lines (8 insertions, 10 deletions) changed in `TauCetiRoadmap/CompactQuantumMetricSpaces/Suggested.lean` since c4343b9: the module docstring's paragraph on the headlines not statable at the pins. `README.md` and `metadata.toml` are unchanged, the Lean declarations are unchanged, and nothing changed outside the folder. The one finding of the previous review is repaired, the repair introduces no new problem, and the gate passes. No finding remains.

## Previous findings

- R01 — repaired: `Suggested.lean` lines 28–31, "Both of the last two need the twisted group C*-algebra `A_Θ = C*(ℤᵈ, σ_Θ)` of §6.0, which neither pinned library provides: Tau Ceti has the finitely supported twisted monoid algebra `TauCeti.twistedMonoidAlgebra`, with no involution, norm or completion." The sentence naming `TauCeti.SmoothNoncommutativeTorus` and its file, absent at this branch's pin a91d3aa, is gone. Every library claim of the new text is true at the branch's pin a91d3aa and at main's pin 2fd255d (values below).

## Verified sound

**The changed passage, clause by clause.**

- "the isometric star isomorphism `Φ_θ` (§6.1) from `A_Θ(θ)` onto the rotation C*-algebra `A_θ`": README §6.1 (line 1526) constructs "the isometric star isomorphism `Φ_θ : A_Θ(θ) → A_θ`", and line 1523 calls `A_θ` the rotation algebra. The docstring names the same map in the same direction.
- "the uniform continuity of the quantum tori `Θ ↦ (A_Θ, L_Θ)` in quantum Gromov–Hausdorff distance (§6.5)": README §6.5 (lines 1664–1668) concludes exactly this, for a fixed norm on the skew matrices, every `ε`, one `δ` for all parameters.
- "the twisted group C*-algebra `A_Θ = C*(ℤᵈ, σ_Θ)` of §6.0": §6.0 (lines 1444–1446) defines `A_Θ` as `C*_r(ℤᵈ, σ_Θ)` in its regular model and (line 1456) uses `C*(ℤᵈ, σ_Θ) = C*_r(ℤᵈ, σ_Θ)`; the two names agree.
- "Tau Ceti has the finitely supported twisted monoid algebra `TauCeti.twistedMonoidAlgebra`": at a91d3aa, `TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean` line 282, `noncomputable def twistedMonoidAlgebra : Subalgebra k (Module.End k (G →₀ k))`, the `k`-span of the twisted translations; at 2fd255d the same definition at line 288. "Finitely supported": its carrier is a span of operators on `G →₀ k`, with basis indexed by `G` (file header, "Main definitions"), so its elements are finite combinations of the `W_p`, as §6.0 line 1449 says.
- "with no involution, norm or completion": at a91d3aa, `grep -E 'Star|Norm|CStar|Complet'` (minus "normal") over `Twisted/Basic.lean`, `Twisted/Finite.lean` and the two `ProjectiveRepresentation` files that mention the algebra: 0 hits; at 2fd255d over `Twisted/Basic.lean` and `Twisted/Finite.lean`: 0 hits. The README contract (lines 241–250) says the same of the pin.
- "neither pinned library provides" the twisted group C*-algebra: at a91d3aa, `TauCeti/Analysis/CStarAlgebra/` holds only `CharacterSpaceMeasure.lean` and `UnitaryCharacter.lean`, and no file of Tau Ceti mentions a rotation algebra, a twisted group C*-algebra or a noncommutative torus. At 2fd255d (searched by `git ls-tree -r` over the whole tree for "Twisted", "Rotation", "CStar" and "NoncommutativeGeometry" in a path, then by content in every candidate file) Tau Ceti has `Analysis/CStarAlgebra/Action/CrossedProduct/Full.lean` (the full crossed product `A ⋊_α G` of a point-norm continuous action on a C*-algebra, completion of `C_c(G, A)` in the universal seminorm), `Action/KMS/Rotation.lean` (the rotation action of `ℝ` on `C(S¹, ℂ)`, not an algebra) and `NoncommutativeGeometry/SmoothTorus/Basic.lean` (a star algebra with no norm instance; its only norms are those of the coefficient estimates); none is `C*(ℤᵈ, σ)` for a cocycle `σ`, none of the crossed-product, covariant-representation or continuous-map action files mentions a rotation algebra, a twisted group or a noncommutative torus, and a twisted group C*-algebra is not an instance of a crossed product of a C*-algebra by a group without further construction. At the Mathlib pin the only hits for "rotation algebra", "twisted group" or "irrational rotation" are `Dynamics/Circle/RotationNumber/TranslationNumber.lean`, `Dynamics/Ergodic/AddCircleAdd.lean` and `Topology/Instances/AddCircle/DenseSubgroup.lean`, circle dynamics. So `Φ_θ`, whose source is `A_Θ(θ)`, is not statable at either pin, and §6.5's family `(A_Θ, L_Θ)` is not either.
- "`L_Θ` as an `ExtendedLipschitzSeminorm` on the self-adjoint part, whose density and kernel fields are Layer 4 and Layer 6 theorems": `Suggested.lean` lines 82–88, the structure has fields `dense_finite : Dense {a | toFun a < ∞}` and `kernel_iff : ∀ a, toFun a = 0 ↔ ∃ r, a = r • e`; §6.2 (line 1566) builds `L_Θ` on `selfAdjoint A_Θ` from the gauge action by 4.3, whose closed Lip-norm theorem supplies the density and the kernel.

**Gate and direction.**
- The worker's gate at 7db4c19 passes every check, `build=0` included. My rerun (`--base origin/main`) prints the same line without the build field, then `OK`, exit 0.
- My rerun of the dependency check with `--movable`:

```
depcheck: 236 roadmaps, 2419 edges, 0 problem(s)
```

- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- `scratch/overlaps.md`: no other open pull request changes this roadmap, no cited id is dropped by an open pull request, no cited id is defined only by an open revision. The closest open roadmaps in vocabulary (HeisenbergImprimitivity, SpectralManifolds, OperatorAlgebraDynamics, HilbertModules, VonNeumannAlgebras) were compared in the previous reviews; the diff touches no ownership statement.

**Elaboration and signatures.**
- `lake env lean` on a scratch copy of `Suggested.lean` with `#check @name` appended for its 37 named declarations: exit 0, 17 "declaration uses `sorry`" warnings, 37 printed types, no other diagnostic (10.7 s).
- The Lean declarations have no diff since 92ab84b, so every elaborated type equals the one the previous reviews compared with the README; I re-read the three statements the docstring describes (`stateEDist_integrationState`, `exists_limit_of_cauchySeq_quantumGHEDist`, `totallyBounded_quantumGHEDist_iff`): carriers `[MetricSpace X] [CompactSpace X] [MeasurableSpace X] [BorelSpace X]` with two probability measures, and sequences `E : ℕ → Type u` of ordered normed spaces with `[∀ n, CompleteSpace (E n)]` on the completeness statement only, as the README's §3.3, §5.5 and §5.6 state them.
- Padding probe: on a copy with each of the 17 `sorry` lines replaced by `first | rfl | simp | infer_instance | (intros; rfl) | (intros; simp) | aesop`, all 17 fail (10 "aesop made no progress", 7 unsolved goals). Nothing closes in one tactic.

**Headlines.** Unchanged since the previous review: `tendsto_stateEDist_iff`, `closedLipNorm_recovery`, `stateEDist_integrationState`, `exists_closedLipNorm_actionLip`, `quantumGHEDist_eq_quotientQuantumGHEDist`, `quantumGHEDist_triangle`, `quantumGHEDist_eq_zero_iff`, `exists_limit_of_cauchySeq_quantumGHEDist` and `totallyBounded_quantumGHEDist_iff` are stated. The docstring names three items as not statable, the §5.5 isometry-class space, `Φ_θ` (§6.1) and the §6.5 continuity, and now grounds the last two in the absence of `A_Θ` at the pins, which the values above confirm.

**Sources: the seeded sample where it falls in the changed passage.** Of the sample, only §6.2 ("Lip-norms on quantum tori") is named by the changed text, through `L_Θ`. Its locator, Rieffel 2000 §9, is unchanged and was checked in the full reviews (rieffel00, the twisted algebra at line 1629 and Theorem 9.2 at line 1666); the docstring makes no source claim. The other sampled targets (0.3, 0.4, 1.4, 1.5, 2.2, 2.4, 2.5, 3.3, 4.1, 4.2, 4.3, 4.5, 5.5, 5.6) are untouched by the diff and their locators were not re-read.

**Cross-roadmap citations.** The diff cites no roadmap. The README's citations are unchanged since c4343b9, where the previous review resolved them at the current heads (OperatorKTheory K7.5, HeisenbergImprimitivity §3.1, NoncommutativeGeometry N6 and N7, CompactGroups Layer 0); `scratch/citations.md` lists nothing unresolved.

**Adversarial table.** The first 4 rows are new, with values computed this round for the changed statement (the docstring's library and cross-reference claims). The 73 rows after them are carried from the previous review (~7) for statements the diff leaves untouched; of these, 14 date from ~7 and 59 from ~6 and ~5.

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| Docstring: `TauCeti.twistedMonoidAlgebra` exists at the pins, finitely supported, no star, norm or completion | a91d3aa; 2fd255d | `Twisted/Basic.lean` line 282 (a91d3aa), line 288 (2fd255d): `Subalgebra k (Module.End k (G →₀ k))`, span of `twistedTranslation`; `Star`/`Norm`/`CStar`/`Complet` hits in `Twisted/*.lean` and the two `ProjectiveRepresentation` files: 0 and 0 | true at both pins | none |
| Docstring: no twisted group C*-algebra at either pin | a91d3aa `CStarAlgebra/`; 2fd255d `CStarAlgebra/Action/`; Mathlib pin | a91d3aa: 2 files, no crossed product, no rotation algebra; 2fd255d: `FullCrossedProduct α μ` for an action on a C*-algebra `A`, `SmoothTorus` without norm, no `C*(G, σ)` by path or in the candidate files' text; Mathlib: 3 hits, all circle dynamics | `A_Θ`, hence `Φ_θ` and §6.5, not statable | none |
| Docstring agrees with the README on `Φ_θ`, `A_Θ`, `L_Θ` | §6.0 lines 1444–1456; §6.1 line 1526; §6.2 line 1566; §6.5 lines 1664–1668 | `A_Θ = C*_r(ℤᵈ, σ_Θ) = C*(ℤᵈ, σ_Θ)`; `Φ_θ : A_Θ(θ) → A_θ` isometric star isomorphism; `L_Θ` on `selfAdjoint A_Θ` by 4.3; `dist_q((A_Θ, L_Θ), (A_Ψ, L_Ψ)) < ε` for `‖Θ − Ψ‖ < δ` | same objects, same direction | none |
| Docstring: `ExtendedLipschitzSeminorm` has density and kernel fields | `Suggested.lean` lines 82–88 | `dense_finite : Dense {a | toFun a < ∞}`, `kernel_iff : ∀ a, toFun a = 0 ↔ ∃ r, a = r • e`; for `L_Θ` these are 4.3's closed Lip-norm theorem (Layer 4) and §6.1's fixed algebra `ℂ·1` (Layer 6) | true | none |
| Scope and contract: OperatorKTheory 7.5 hypotheses at `c = σ_Θ` | `σ_Θ(p,q) = exp(πi pᵀΘq)`; `d = 2`, `Θ₁₂ = −θ` | `σ(0,q) = σ(q,0) = 1`; cocycle sides both `exp(πi(pᵀΘq + pᵀΘr + qᵀΘr))`; `\|σ\| = 1` | `TauCeti.IsFactorSet` with `\|c\| = 1` holds | none (carried from ~7) |
| Contract: supplier star formula against §6.0 | `W_x* = conj(c(x,−x))W_(−x)`; `p = (1,0)`, `q = (m,n)` | `c(p,−p) = exp(−πi pᵀΘp) = 1`; `W_(1,0)*δ_q = conj(exp(−πiθn))δ_(m−1,n) = exp(πiθn)δ_(m−1,n) = W_(−1,0)δ_q` | `W_p* = W_(−p)`, as §6.0 says | none (carried from ~7) |
| 6.1 supplier's `C*(L, c)` equals `A_Θ` | `W_0δ_q = σ(0,q)δ_q`; `W_pW_q = σ(p,q)W_(p+q)` | `W_0 = 1`; products and adjoints of `W`'s stay in the span; closure of the span equals the C*-algebra generated | the same operator algebra on `ℓ²(ℤᵈ)` | none (carried from ~7) |
| 6.1 `Ad(M_χ) = α_z` | `d = 2`, `z = (i, −1)`, `p = (1,0)`, `q = (0,1)` | `M_χ*δ_q = −δ_(0,1)`; `W_p`: `−exp(−πiθ)δ_(1,1)`; `M_χ`, `χ(1,1) = −i`: `i·exp(−πiθ)δ_(1,1)`; `χ(p)W_pδ_q = i·exp(−πiθ)δ_(1,1)` | equal | none (carried from ~7) |
| 6.1 `z ↦ χ_z` continuous into `L̂` | discrete `ℤᵈ` (compact-open = pointwise); `d = 0` | each `z ↦ z^p` is continuous; `d = 0`: `T⁰` is a point, `A_Θ = ℂ` | continuous | none (carried from ~7) |
| 6.1 point-norm, not uniform, continuity | `d = 1`, `a = W_1`, `z = e^(iε)`; supremum over the `W_p` | `‖α_z(W_1) − W_1‖ = 2\|sin(ε/2)\| → 0`; for `0 < ε < 2π/3` some `p` has `pε ∈ [2π/3, 4π/3]`, so `sup_p ‖α_z(W_p) − W_p‖ ≥ √3` | "norm continuous at each element" is the right notion | none (carried from ~7) |
| 6.1 Check, `d = 1` | `χ(p) = z^p`, `δ_q` | `Ad(M_χ)W_1δ_q = z^(q+1)z^(−q)δ_(q+1) = zW_1δ_q`; `M_χ*W_1M_χδ_q = z^(−q−1)z^qδ_(q+1) = z^(−1)W_1δ_q` | Check correct; it separates the reversed convention | none (carried from ~7) |
| Contract, compact form | Tau Ceti lines 83, 115, 161 | `[MeasurableSpace] [PseudoMetricSpace] [CompactSpace] [OpensMeasurableSpace]`, two `IsProbabilityMeasure`, no moment | matches README lines 233–234 | none (carried from ~7) |
| Contract, basepoint form | Tau Ceti lines 184–185, 304–305 | `[PseudoMetricSpace] [OpensMeasurableSpace] [SecondCountableTopology] [StandardBorelSpace]`, `hμ hν : HasFiniteMoment 1 _`, `x₀ : X`, no `CompactSpace` | matches lines 234–237 | none (carried from ~7) |
| Contract: instances on compact metric Borel `X` | Lean probe | `inferInstance` closes `OpensMeasurableSpace`, `SecondCountableTopology`, `StandardBorelSpace`, `PolishSpace` (exit 0) | true | none (carried from ~7) |
| 3.3 every probability measure has a finite first moment | Lean probe; `X = ∅` | `MemLp.of_enorm_bound` with `C = ediam univ < ∞`; `X = ∅` is impossible since `μ univ = 1 ≠ 0` | proved | none (carried from ~7) |
| 3.3 Check: first moments | `[0, 1]`, `μ = δ_1`, `x₀ = 0`; the Cauchy law | `∫\|t − x₀\| dμ ≤ 1`, attained (`= 1`) at `δ_1`, `x₀ = 0`; Cauchy `∫_(−R)^R \|t\| dμ = (1/π)ln(1 + R²) → ∞` | Check correct | none (carried from ~7) |
| 3.3 absolute value removed by `f ↦ −f` | `X = {0, 1}`, `μ = δ_0`, `ν = δ_1`, `f = id` | `ofReal(f(0) − f(1)) = ofReal(−1) = 0`; `−f` gives `1`; supremum `1 = \|f(0) − f(1)\| = W₁` | the Tau Ceti supremum equals `ρ_L` | none (carried from ~7) |
| Docstring: smooth torus at the pins (the sentence R01 removed) | a91d3aa; 2fd255d | `ls-tree`: 0 paths under `NoncommutativeGeometry/` at a91d3aa; at 2fd255d structure at line 230, ring and star instances, no `Norm` | false at the branch's pin; the sentence is gone at this head | R01 repaired |
| 4.6 `actionLip = classicalLip` on `C(G/H)`, abelian | `G = T`, `ℓ = \|θ\|`, `H = {0, π}`, `f = cos 2θ` | `classicalLip = sup\|f′\| = 2`; `‖f(·−x) − f‖ = 2\|sin x\|`, `sup 2\|sin x\|/\|x\| = 2` (as `x → 0`) | equal | none (carried from ~6) |
| 4.6 the witness `x = gh⁻¹k⁻¹`, non-abelian | `S₃`, `ℓ` = transposition length (conjugation-invariant), `H = ⟨(12)⟩`, `g = e`, `k = (13)` | `d = min(ℓ(13), ℓ((13)(12))) = min(1, 2) = 1`; `x = (13)`: `x⁻¹gH = (13)H = kH`, `ℓ(x) = 1 = ℓ(g⁻¹k)` | both identities hold | none (carried from ~6) |
| 4.6 conjugation invariance needed for well-definedness | `S₃`, Coxeter length for `{(12), (23)}`, `H = ⟨(12)⟩`, representatives `e` and `(12)` of `H`, `k = (23)` | `min(ℓ(23), ℓ((23)(12))) = min(1, 2) = 1`; `min(ℓ((12)(23)), ℓ((12)(23)(12))) = min(2, ℓ(13) = 3) = 2` | `d` ill-defined without the hypothesis; the hypothesis is present | none (carried from ~6) |
| 5.1 Check: domain of `M_ε` | `E = C([0,1], ℝ)`, `a = √t`; `ℝ² × ℝ` with `M_δ` | `L_E(√t) = sup √s/s = ∞`, so `M_ε(a, b) = ∞`; `N_ε(a, b) ≤ ε⁻¹ max(1, ‖b‖) < ∞`; for `M_δ`, `N_ε ≤ ε⁻¹‖v‖`, `dom M_ε = ℝ³ = ℝ² × ℝ` | Check correct | none (carried from ~6) |
| 6.1 average extended from positive `a` | `a = W_p`, not positive | `∫ z^p dz · W_p = δ_(p,0)W_p = τ_Θ(W_p)·1`; `W_p` = combination of four positives, both sides linear | consistent | none (carried from ~6) |
| 0.1 interval formula | `ℝ²`, `e=(1,1)`, `a=(1,1)` | Euclidean `√2`, max norm `1`; `−e ≤ a ≤ e` | formula selects the max norm | none (carried from ~6, r5) |
| 0.1 non-Archimedean Check | cone `{x>\|y\|} ∪ {(t,−t)}`, `a=(−1,−1)`, `(0,1)` | `εe−a=(1+ε,1)` in cone ∀ε; `−a=(1,1)` not; `a+re=(r−1,−1)` in cone iff `r>2` or ray at `r=2`: `‖a‖=2`; `(0,1)`: `(r,−1)` in cone iff `r≥1`, `(r,1)` iff `r>1`: inf `1`, fails at `r=1`; `(ε,−1)` in cone iff `ε≥1` | Check correct | none (carried from ~6, r5) |
| 0.1 `a ≥ 0 ↔ ‖‖a‖e−a‖ ≤ ‖a‖` | `(1,0)`; `(1,−1)` | `‖(0,1)‖=1 ≤ 1`; `‖(0,2)‖=2 > 1` | both directions | none (carried from ~6, r5) |
| 0.1 Archimedean from the formula | `a ≤ εe ∀ε` | `b=a+‖a‖e`: `0 ≤ b ≤ (‖a‖+ε)e` so `‖b‖ ≤ ‖a‖`, then `b ≤ ‖a‖e` | derivation valid | none (carried from ~6, r5) |
| 0.2 normalization without positivity | `2a₁−a₂`; `f(0)−f(1)+f(1/2)` | value `1` at `e`, norm `3`; unital, norm `3` | not states, not contractive | none (carried from ~6, r5) |
| 0.3 `norm_eq_iSup_states` | `(1,−1)`; `E=0` | `sup\|2t−1\|=1`; `‖0‖=0≠1` so `he` excludes it; `iSup` over a bounded family | holds | none (carried from ~6, r5) |
| 0.4 dual ball | `λ=(1/2,−1/2)` | `‖λ‖=1`, `t=1/2`, `φ=(3/4,1/4)`, `ψ=(1/4,3/4)`, `φ−ψ=λ`; `φ′−ψ′=(1,−1)≠λ` | exact | none (carried from ~6, r5) |
| 0.4 quotient norm | `a=(3,1)` | `(3−1)/2=1=‖(1,−1)‖` | holds | none (carried from ~6, r5) |
| 0.5 algebraic quotient by `o(t)` | class of `t` | `ε−t+max(t−ε,0)=max(ε−t,0) ≥ 0`; `−t=h+g`, `h≥0`, `g=o(t)` impossible near `0` | non-Archimedean | none (carried from ~6, r5) |
| 1.1 `map_smul` junk | `r=0`, `L a=∞` | `L 0=0=0·∞` | consistent | none (carried from ~6, r5) |
| 1.1 kernel axiom | `\|a₁\|`; `∞` off `ℝe` | kernel `{a₁=0}`; domain not dense | excluded | none (carried from ~6, r5) |
| 1.2 `ρ(δ_x, Leb)` | `x=0, 1/2` | `x²−x+1/2`: `1/2`, `1/4` | holds | none (carried from ~6, r5) |
| 1.3 radius, centered ball | `\|a₁−a₂\|`, `φ=ev₂` | diam `1`, `r=1/2`; ball `[−1,1]×{0}`, norm sup `1=diam > 1/2` | holds | none (carried from ~6, r5) |
| 1.4 section bound | `a=(1,−1)`, `φ=ev₁` | `‖q(a)‖=1`, `‖a−φ(a)e‖=‖(0,−2)‖=2` | constant `2` sharp | none (carried from ~6, r5) |
| 1.5 separability | `{L≤1} ⊆ B_φ+ℝe`, `dom L=⋃ n{L≤1}` | `a−φ(a)e ∈ B_φ`; `ℓ^∞` nonseparable | no Lip-norm on `ℓ^∞` | none (carried from ~6, r5) |
| 1.6 `G_n` | `n=2` | `G_n′=min(n\|t\|,1)`, `L(G_n)=1`; `‖G_n−(t+1)‖=∫₀^{1/n}(1−ns)ds=1/(2n)`; `L(t+1)=2` | not closed | none (carried from ~6, r5) |
| 2.1 kernel loss | `p_n=∫q_n`, `q_n→g′` | `L(p_n) ≤ ‖q_n−g′‖_∞→0`, `‖q(p_n)‖→1/2` | `g` in closure kernel, radius `∞` | none (carried from ~6, r5) |
| 2.2 `closedLipNorm_recovery` | `a∉dom L`, sup `=C<∞` | `a` in the `E`-closure of `C·{L≤1}={L≤C}` by closed sublevel sets, so `L(a)≤C` | `∞` case holds | none (carried from ~6, r5) |
| 2.2 `√t` | `φ=δ_h`, `ψ=δ_0` | `√h/h=h^(−1/2)→∞` | sup `∞=L(a)` | none (carried from ~6, r5) |
| 2.3 simplex | `K⊆ℝ³` | `K−K={Σx=0, Σ\|x\|≤2}` (`c=(1−Σx⁺)/3≥0`); `‖(1/2,1/2,−1)‖₂=√1.5<√2=W₁` | extreme points do not recover `L` | none (carried from ~6, r5) |
| 2.3 `\|x−y\|²` | `0,1/2,1` | `1 > 1/4+1/4` | metric hypothesis needed | none (carried from ~6, r5) |
| 2.4 pullback direction | `T=id`, `L_F=L_E/2` | `ρ_E(T*φ,T*ψ)=ρ_F/2` | correct | none (carried from ~6, r5) |
| 2.5 edge quotient; restriction vs quotient; image norm | `max\|a_i−a_j\|`; `\|a₁−a₂\|+2\|a₂−a₃\|`; `b=(0,1)` | `\|b₁−b₂\|` at `a₃=(b₁+b₂)/2`; `\|b₁−b₃\|` at `t=b₃` vs `2\|a₁−a₃\|`; image norm `1`, every lift has `a(1)=2` | all Checks correct | none (carried from ~6, r5) |
| 3.1 `classicalLip`, Leibniz | `t²` on `[0,1]`; `X=∅` | `sup(s+t)=2 ≤ 1+1`; `0` | holds | none (carried from ~6, r5) |
| 3.2 `exists_closedLipNorm_classicalLip` | `X=∅` | `C(∅)=0`, `L=0` satisfies every field, `TotallyBounded` of `{0}` | statement also true for empty `X`; `Nonempty` keeps the README's generality | none (carried from ~6, r5) |
| 3.2 `√x`, inverse law | `f_r=min(rx,√x)`; `1/t` on `[1,2]` | error `1/(4r)` at `x=1/(4r²)`; `classicalLip(1/t)=1=1²·1` | sharp | none (carried from ~6, r5) |
| 3.3 `stateEDist_integrationState` | `{0,1}`; `δ_(1/2)` vs Leb | `\|t−s\|`; `1/4`; KR sup over `LipschitzWith 1 f` of `∫f dμ−∫f dν` equals the `\|·\|` form by `f↦−f` | equals `W₁` | none (carried from ~6, r5) |
| 3.5 `M₂`, `D=diag(1,−1)` | `[D,a]` | entries `2a₁₂`, `−2a₂₁`; kernel diagonal `ℂ²` | not a Lip-norm | none (carried from ~6, r5) |
| 3.5 maximal-domain closedness (owned) | `a_n→a`, `‖[D,a_n]‖≤C` | `D a_nξ` bounded, weak subsequence limit in the closed graph: `aξ∈dom D`, `‖[D,a]ξ‖≤C‖ξ‖` | true | none (carried from ~6, r5) |
| 4.1 inverse law | `C(T)`, `2+z` | `L(f)=1`, `‖f⁻¹‖=1`, `L(f⁻¹)=sup 1/\|2+z\|²=1` | equality | none (carried from ~6, r5) |
| 4.3 `exists_closedLipNorm_actionLip` | `T`, `ℓ=\|θ\|`; `ℤ/2`; `A=0` | `∫ℓ=π/2`, diam `π` sharp; `1/2`, diam `1`; `L=0` satisfies all fields | true, Lean needs no `A≠0` | none (carried from ~6, r5) |
| 4.4 `ℓ` dominates a Lie length (owned) | `ℓ(x_k)/d(x_k)→0` | `ℓ(x_k^{m_k}) ≤ m_kℓ(x_k)→0` on the shell `d∈[r/2,r]` where `ℓ≥c>0` | contradiction, claim true | none (carried from ~6, r5) |
| 4.4 kernels | `T`, `1⊕z`; `ℤ/2`, `1⊕sgn`; `T`, `1⊕z²` | `2+2cosθ`, support `{−n..n}`; `k_n=2δ_1`, `δ_n=0`; maxima at `0,π`, `δ_n→π/2` | Checks correct | none (carried from ~6, r5) |
| 4.5 `actionLip=L_der` | path; `exp(tX)` | `≤` by `∫‖c′‖`; `≥` by `ℓ(exp tX) ≤ \|t\|‖X‖` | equality for any norm | none (carried from ~6, r5) |
| 4.6 Jordan factor | `a∘b=(ab+ba)/2` | `L ≤ (L(ab)+L(ba))/2 ≤ L(a)‖b‖+‖a‖L(b)` | factor `1` | none (carried from ~6, r5) |
| 5.1 `M_δ` | `ℝ²` vs `ℝ` | `ρ_M(φ_t,ψ)=\|t−1/2\|+δ`, Hausdorff `1/2+δ`; `dist_q=1/2` by diameters | Check correct | none (carried from ~6, r5) |
| 5.1 `ρ_M ≤ ρ_(M_ε) ≤ ρ_M+2ε` | `M_ε≤M`; `M_ε(v)≤1` | `‖v−w‖≤ε(1+η)`, `M(w)≤1+η`: `\|φ(v)−ψ(v)\| ≤ (1+η)(ρ_M+2ε)` | both inequalities | none (carried from ~6, r5) |
| 5.2 compatibility | `P=id`, `L_F=L_E/2` | diam `1` vs `2`, `dist_q ≥ 1/2` | Check correct | none (carried from ~6, r5) |
| 5.2 quotient estimate | `K₁={δ_0}`, `K₂={δ_1}`; `K=S(E)` | `dist_q(ℝ,ℝ)=0 < 1=W₁`; quotient by `S(E)` is `E` since restriction is injective | strict case, special case | none (carried from ~6, r5) |
| 5.3 two-point spaces | `d=1` vs `d=2` | `ghDist=1/2`, `dist_q ≥ (2−1)/2` | equality | none (carried from ~6, r5) |
| 5.4 `quantumGHEDist_eq_zero_iff` | `C¹` vs `C[0,1]` | distance `0`; `C¹` fails `CompleteSpace`, `‖f′‖_∞` fails closedness | hypotheses needed and present | none (carried from ~6, r5) |
| 5.4 closed = Rieffel-closed | complete `E`, closed sublevel sets | Kadison onto `Aff_c`; a `1`-Lipschitz affine `â` has `L(a)≤1` by recovery | `E` is `A^c` | none (carried from ~6, r5) |
| 5.5 limit of `(D,L_D)` | closed completion | diagonal bridge with `{L_D≤t}` dense in `{L̄≤t}`: `dist_q(D,D̄)=0` | closed limit exists | none (carried from ~6, r5) |
| 5.6 `Fin`, `Scv`, nets | `{δ_(k/n)}`; `[0,1]`; `(ℝ²,t\|a₁−a₂\|)` | `dist_H(co(net),S)=1/(2n)` (nearest grid point; `δ_(1/(2n))` attains), `n+1 ≤ 1/ε+2`; `⌈1/(2ε)⌉`; `Fin≤2`, diam `1/t` | Checks correct | none (carried from ~6, r5) |
| 6.0 relation, `d=2` | `Θ₁₂=−θ` | `W_(1,0)W_(0,1)=e^(−πiθ)W_(1,1)`, `W_(0,1)W_(1,0)=e^(πiθ)W_(1,1)`: `U₂U₁=e^(2πiθ)U₁U₂` | matches N6 | none (carried from ~6, r5) |
| 6.0 supplier convention; `δ_p∗δ_q` | HI's `c(x,y−x)h(y−x)`; (9.1) | `λ_c(x)δ_q=c(x,q)δ_(x+q)`; `(δ_p∗δ_q)(p+q)=σ(p,p+q)=σ(p,q)` | matches | none (carried from ~6, r5) |
| 6.0 negative control | `d=1`, `B=C({±1})` | `V_2=1`, `τ_B(V_2)=1≠0` | hypothesis fails, map not injective | none (carried from ~6, r5) |
| 6.1 `V*π_τ(U₂)V` | `δ_(m,n)` | phase `πiθmn+2πiθm−πiθm(n+1)=πiθm`; `σ((0,1),(m,n))=e^(πiθm)` | equal | none (carried from ~6, r5) |
| 6.1 `E_p` | `a=W_q` | `∫z^(q−p)dz·W_q=δ_(p,q)W_q=τ(W_qW_p*)W_p` | holds | none (carried from ~6, r5) |
| 6.2 Dirac bound | `W_(1,0)+W_(−1,0)` | `x=2πi(W−W*)`, `‖x‖=4π`, `y=0`; `σ₁x−σ₂y=[[0,x+iy],[x−iy,0]]` | both bounds attained | none (carried from ~6, r5) |
| 6.3 Følner boxes; Harper | `d=2,n=1,k=(1,0),(1,1)`; `θ=1/2` | `4≤4`, `6≤8`; cross terms cancel, `A+B` with `A=2+2cos2x`, `B=2+2cos2y` central: `‖H‖²=8` vs `16` at `0` | Checks correct | none (carried from ~6, r5) |
| 6.4 support functions | `a=(−1,−3)`, `R=1,2,3` | `max(\|R−1\|,\|R−3\|)−R=1,−1,−1`; `max(a)=−1` | `R≥2` needed | none (carried from ~6, r5) |
| 6.5 coboundary | `N₁₂=1`, `p=(1,0)`, `q=(0,1)` | `σ_(Θ+N)/σ_Θ=e^(πi p₁q₂−πi p₂q₁)`; `b(p)b(q)/b(p+q)=e^(−πi(p₁q₂+p₂q₁))`; ratio `e^(2πi p₁q₂)=1` | `equivOfCoboundary` hypothesis `β·c(p+q)=α·c(p)c(q)` holds | none (carried from ~6, r5) |
| 6.5 global `δ` | `D` fundamental domain, `K={dist(·,D)≤1}` | `‖Θ−Ψ‖<δ≤1`, `Θ−N∈D` gives `Ψ−N∈K`; `dist_q(A_Θ,A_Ψ)=dist_q(A_(Θ−N),A_(Ψ−N))<ε` | Theorem 9.2 as stated | none (carried from ~6, r5) |

**Remark on untouched text (no change asked).** At main's pin 2fd255d, Tau Ceti's `FullCrossedProduct` would let a reader assemble the rotation C*-algebra `A_θ` itself as `C(S¹, ℂ) ⋊ ℤ`; the branch's pin a91d3aa has no such file, and `Φ_θ`'s source `A_Θ(θ)` is absent at both, so the docstring's "not statable" stands at both pins. After a pin bump to 2fd255d the sentence stays true as written.

**Checks per definition.** The diff changes no README section; every `### k.n` still carries at least three Checks and a *Needs:* line, and each layer ends with `### Examples` and `### Dependencies` (headings listed at lines 337–1700).

**Counts.** 4 new and 73 carried adversarial rows; 37 Lean declarations elaborated; 17 sorried statements probed for padding; 2 Tau Ceti revisions and the Mathlib pin searched for the twisted group C*-algebra (0 owners); 5 README passages (§6.0, §6.1, §6.2, §6.5, the Tau Ceti contract) and 1 Lean structure re-read against the docstring; 0 cross-roadmap citations in the diff.

## Not verifiable

- hkls81 (Høegh-Krohn–Landstad–Størmer, Ann. of Math. 114 (1981)): the DOI resolves to JSTOR, which is paywalled. This roadmap consumes it only through VonNeumannAlgebras V8.CompactErgodicActions. Unchanged from the previous reviews; nothing in the diff cites it.

## Source issues

- none

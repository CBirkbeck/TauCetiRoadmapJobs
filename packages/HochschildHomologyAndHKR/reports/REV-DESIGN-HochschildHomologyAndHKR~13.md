<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13788#issuecomment-6900748656 -->
Review (claude) of 464d55d

Verdict: needs_changes

1. **F01** (P3) §4.5's flat-resolution route uses three facts that no bullet states

   **Location.** `packages/HochschildHomologyAndHKR/design/README.md` §4.5, fourth and fifth API
   bullets (lines 1354–1375): "Free, hence projective, left `Aᵉ`-modules are flat" and "The `P_j` and
   `F_j` being flat, a short exact sequence of bimodules … stays short exact after `− ⊗_{Aᵉ} P_•`".

   **Claim.** The route is complete from the listed bullets and pinned declarations.

   **Witness.** (i) `P_j` is projective, not free; the bullet proves flatness for free modules only.
   (ii) Flatness as defined gives injectivity only; exactness needs right exactness in the bimodule
   variable. (iii) `TauCeti/LinearAlgebra/TensorProduct/Balanced/Finsupp.lean:69` is `M ⊗[A] (P →₀ A)`;
   no first-variable form exists.

   **Repair.** In the fourth bullet replace "Free, hence projective, left `Aᵉ`-modules are flat" by
   "Free left `Aᵉ`-modules are flat, and so are projective ones, as direct summands of free modules".
   Add one API bullet before the flat-resolution bullet: "For every left `Aᵉ`-module `F`, the functor
   `N ↦ N ⊗_{Aᵉ} F` on bimodules is `k`-linear, right exact and commutes with direct sums; for a free
   bimodule `Q = (I →₀ Aᵉ)`, `Q ⊗_{Aᵉ} F ≅ (I →₀ F)` (`TauCeti.BalancedTensorProduct.lid` on each
   summand)." In the route, cite that bullet at "stays short exact" and at "direct sums of copies".
   The plan's API entry `HochschildHKR.flat_of_free` takes the same two changes. Tested: (i) for
   `k = A = ℤ/6`, `Aᵉ = ℤ/6` and `P = ℤ/2` (projective, not free), `N ⊗ P = N/2N` is the 2-primary
   summand of `N`, which preserves injections; (ii) for `k = A = ℤ`, `F = ℚ` and
   `0 → ℤ --p--> ℤ → ℤ/p → 0`, the tensored sequence is `0 → ℚ --p--> ℚ → 0 → 0`, exact, where
   injectivity alone would not give the zero on the right; (iii) `(ℤ ⊕ ℤ) ⊗_ℤ ℚ = ℚ ⊕ ℚ`. The
   statements of §4.5 are true as written; only the list of route inputs is short.

One finding, R01 (P3): the proof route added to §4.5 in the last repair uses three elementary facts
that no API bullet states. No P1 or P2 finding; the verdict asks for changes because R01 carries a
repair, and nothing else is to be changed. The declared gap `smooth-hkr-antisymmetrisation`
(supplier RefinedTraceMethods §1.9), used only in §6.4(d) and §7.6, is precise, minimal and
declared in both files: it is a contract, not a finding.

Files reviewed: `packages/HochschildHomologyAndHKR/design/README.md` (2205 lines, 8 layers, 37
targets), `packages/HochschildHomologyAndHKR/design/plan.json` (8 layers, 37 targets, 1 gap),
`packages/HochschildHomologyAndHKR/sources.toml` (9 entries). Pins from the roadmap repository's
`lake-manifest.json`: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (unchanged since round 11); roadmap
main at `a40f789b`. No maintainer notes were supplied. This is a design: there is no
`Suggested.lean`, and elaboration is not available (this lane does not elaborate).

## Verification of the previous repair

| Round-12 finding | Repaired passage | Assessment |
| --- | --- | --- |
| F01 (P3): `HH_n ≅ Tor_n` stated for `k`-projective `A` only | README §4.5 (line 1337): "for `A` flat as a `k`-module `HH_n(A,M) ≅ Tor_n^{Aᵉ}(M,A)`, naturally in `M`"; Generality (lines 206–208): "`HH_n ≅ Tor_n` for `A` flat as a `k`-module, where it is a resolution by flat `Aᵉ`-modules"; Summary, Scope (Layer 4 bullet), How to read the build and plan target 4.5 (`Module.Flat k A`) carry the same hypothesis | **Repaired.** §4.4 and §5.4 keep `k`-projectivity, where it is needed. The two departures from the suggested repair (a prose definition of flatness over `Aᵉ`; a route by δ-functors in `M` instead of dimension shifting in the resolved variable) are sound: see the table. |

Every passage the repair added or changed was put through the adversarial pass (rows marked
"new"). The repaired pattern (a projectivity hypothesis where flatness suffices) was looked for in
the rest of the design: §1.4 already separates flat (chains) from projective (cochains); §4.2,
§4.4, §5.4, §7.2 and §7.6 use projectivity for `Hom` or `Ext`, where it is needed (§7.6 Checks
show the conclusion can hold without it, the route cannot be run); §6.3 uses flatness. No other
instance.

## Verified sound

### Principles and shape

- **General library.** `k` is an arbitrary commutative ring in all 37 targets; flatness,
  `k`-projectivity and smoothness are per-target hypotheses, each with a negative control.
- **No re-planning; one direction of supply.** DGAInfinity (Layers 0, 1, 8 at README lines 263,
  293, 520), DerivedModuleAlgebra (§0.K.1 line 649, §0.5 line 1339), NoncommutativeGeometry
  (N1.Cyclic), BanachAlgebras (Layer 6, line 1379) and ZigzagPreprojective (Layer 7, line 1047)
  are on main; DerivedDeRhamCohomology, IntegralIwasawaTheory, LanglandsParameterStacks,
  KTheoryFiniteLocalFields, EulerSystemsAndKolyvaginSystems and RefinedTraceMethods are at
  merge-order lines 23, 29, 80, 90, 104 and 331. None is on the never-cite list.
- **Hygiene.** One scan of the README for LaTeX delimiters, `set_option`, pull-request numbers,
  round labels, machine paths, HTML anchors, "so far", "checkpoint", "handoff", "optional",
  "deferred", "for later": no match. `lemma` occurs only in "five lemma" and in source locators
  ("Lemma 4.1", "Lemma 9.3.1"). No algorithm; no sorry'd data (no Lean file). No locator is
  flagged unverified.
- **Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
  build, eight layers each ending with Examples and Dependencies, Downstream consumers, Worked
  examples, References. Every numbered subsection has a `*Needs:*` line. No backticked name is
  presented as this roadmap's own.
- **Organisation.** Layers are named by their mathematics and ordered by their Needs lines (§2.1
  needs §1.1; §3.5 needs §2.2; §4.3 needs §1.2; §5.4 needs §4.4; §6.1 needs §5.1; §7.5 needs §§6.2
  and 6.4(a); §8.4 needs §§7.1, 7.4, 7.5).

### Adversarial table

`E_ij` are matrix units. Values computed this round for the repaired passages, the fifteen sampled
targets and the headlines.

| Statement | Instances tried and values computed | Result |
| --- | --- | --- |
| 4.5 `HH_n ≅ Tor_n`, `A` `k`-flat (new) | `k = ℤ`, `A = M = ℚ[x]`: `Aᵉ = ℚ[x,y]`, resolution by `x − y` becomes `ℚ[x] --0--> ℚ[x]`; `Tor = ℚ[x], ℚ[x], 0`; `HH = ℚ[x], ℚ[x]dx, 0`. `A = k`: `M, 0, 0` both sides (`b_n = Σ_{i≤n}(−1)^i`). | holds |
| 4.5 flatness dropped (new Check) | `A = ℤ[x]/(px) = ℤ ⊕ x𝔽_p[x]`, `M = 𝔽_p`: `Ā = x𝔽_p[x]`, normalised chains `V^{⊗n}` over `𝔽_p`, `HH = 𝔽_p, 𝔽_p, 0`. In `Aᵉ = ℤ ⊕ (x,y)𝔽_p[x,y]`: `(x−y)(c+g) = (x−y)(c̄+g)` in the domain `𝔽_p[x,y]`, so `ann(x−y) = pℤ = p·Aᵉ`; `ann(p) = (x,y)`. All three differentials vanish mod `(p,x,y)`: `Tor = 𝔽_p, 𝔽_p, 𝔽_p`. | `HH₂ = 0 ≠ 𝔽_p = Tor₂`: Check correct |
| 4.5 flatness over `Aᵉ` (new) | `N ⊗_{Aᵉ} (Aᵉ ⊗ X)`: `outerFactors` with `(M,L,N,P) = (N,k,Aᵉ,X)` gives `(N ⊗_{Aᵉ} Aᵉ) ⊗ (k ⊗ X)`; pinned `rid : M ⊗[A] A ≃ M` (`Unit.lean:122`) gives `N ⊗ X`. `X = 𝔽_p` over `k = A = ℤ`: `pℤ ↪ ℤ` becomes `𝔽_p --0--> 𝔽_p`, not injective. | holds; flat `X` needed |
| 4.5 flat resolutions compute `Tor` (new) | Induction: `S(0)`: both `H₀ = M ⊗ N`. `n = 1`: `H₁(M) = ker(H₀(L) → H₀(Q))` on both sides. `n ≥ 2`: `H_n(M) ≅ H_{n−1}(L)` since `H_n(Q) = H_{n−1}(Q) = 0`. Five-lemma shape: `0, 0, H_n(M), H_{n−1}(L), H_{n−1}(Q)` with vertical maps epi, iso, ?, iso, mono. `ℤ/p`, `N = ℚ/ℤ`, `F_• = [ℤ → ℚ]`: `H₁ = ker(ℤ/p → 0) = ℤ/p = (ℚ/ℤ)[p]`. Non-flat terms: `F_• = [𝔽_p]`, `M = 𝔽_p`: `H₁ = 0 ≠ 𝔽_p = Tor₁`. | holds; R01 on the inputs |
| 1.5 (sampled) | `d_n`: `a_n(rm) = r(a_n m)` needs `R` commutative. Wrong action `r ⊗ s ↦ r ⊗ xs`: `b(1⊗x⊗1) = x⊗1 − 1⊗x + 1⊗x = x⊗1`; action on `b(1⊗1⊗1) = 1⊗1` gives `1⊗x`. `Mat₂`: `b(E₁₁E₁₂⊗E₂₁) = E₁₁ − E₂₂`, `E₁₁·b(E₁₂⊗E₂₁) = E₁₁`. | holds |
| 2.2 (sampled) | `δg(1,1) = g(1) − g(1) + g(1) = 1` for `g(1) = 1`. Pinned example: `bφ = (a₀a₁∂a₂ − a₀∂(a₁a₂) + a₂a₀∂a₁)(0) = 0`; `ψ′(1)(x) = φ(1,x) = (∂x)(0) = 1`. `HH⁰(k[x],k) = k` against `Hom_k(k[x],k) ↠ k²`. | holds |
| 3.1 (sampled) | `E₁₂ = [E₁₂,E₂₂]`, `E₁₁ − E₂₂ = [E₁₂,E₂₁]`: trace-zero matrices; `HH₀(Mat₂) = k`. `Mat₀ = 0`: `HH₀ = 0`, trace `0 → k` not iso for `k ≠ 0`. Commutative, symmetric: `[A,M] = 0`. | holds |
| 3.2 (sampled) | `δm(a) = am − ma`; `E₁₁E₁₂ − E₁₂E₁₁ = E₁₂ ≠ 0`; commutative `A`: `Z⁰ = A`; `B⁰ = 0`. | holds |
| 4.2 (sampled) | `B₀`: `hμ + b′h = 1⊗a₁a₂ + a₁⊗a₂ − 1⊗a₁a₂`. `B₁`: five terms summing to `a₀⊗a₁⊗a₂`. `A = k`: `b′_n = Σ_{i≤n}(−1)^i = 1, 0, 1, …`, augmented complex exact. `h(x·(1⊗1)) = 1⊗x⊗1 ≠ x⊗1⊗1`. | holds |
| 6.2 (sampled, headline) | `(1,1)`: `δf∘g − δ(f∘g) + f∘δg = g(a)f(b) + f(a)g(b)`, all eight other terms cancel. `(0,1)`: both sides `g(a)x − xg(a)`. `(1,0)`: ten terms on the right reduce to `yf(a) − f(a)y`. `k[x]`: `δ(∂^{[2]})(a,b) = −∂a∂b`. Ginz05 (6.6.3) at `(x,x)`: `2 = −2`. Matches Gerstenhaber's Theorem 3 after multiplying by `(−1)^q`. | holds |
| 7.1 (sampled) | Transpose of `b` on `r₀⊗…⊗r_{n+1}`: `r₀r₁f(r₂,…) + Σ ± r₀f(…r_ir_{i+1}…) + (−1)^{n+1} r_{n+1}r₀f(r₁,…,r_n) = r₀·δf` for symmetric `M`. Non-symmetric `k` (`x ↦ 1` left, `0` right): `δm(x) = m`, transpose of `b₁ = 0`. `h₁(∂_x)[1⊗x] = 1`. | holds |
| 7.2 (sampled) | `ℚ[x]/(x²)`: differentials after `R ⊗_{Rᵉ} −`: `0, 2x, 0, 2x`; `HH₁ = R/(x)`, `HH₂ = xR`; `HH²(R,ℚ) = ℚ = Hom_R(xR,ℚ)`, `h₂(f)(x e₂) = x f(e₂) = 0`. `𝔽_p` over `ℤ`: `C_j = 𝔽_p`, `δ^i = 0, 1, 0, …`, all `h_i` bijective. Index: `j < i ≤ n ⇒ j < n`. | holds |
| 7.3 (sampled) | Types: `⋀^n P* → Hom(⋀^n P**, R) → Hom(⋀^n P, R)`. Evaluation `det(ev(v_j)(f_i)) = det(f_i(v_j))`, transpose of `det(f_j(v_i))`. `R²`: `1`; `e₂*∧e₁*`: `−1`. `R^{(ℕ)}`: image forms have finite rank. | holds |
| 7.4 (sampled) | `τ₁(D)(dr) = D(r)`; `τ₂(∂_x∧∂_y)(dx∧dy) = det(I₂) = 1`. `𝔽₂(u)[a]/(a²−u)`: `D(a²−u) = 2aD(a) = 0`, `Der = R∂`, `T² = ⋀²(R) = 0`. `d` generators: `⋀^n = 0` for `n > d`. | holds |
| 7.5 (sampled) | `n = 2`: `δf(a,b,c)` six terms cancel for a biderivation. `det(D_j(r_i)) = Σ_σ sgn(σ) Π_i D_{σ(i)}(r_i)`. `δ(D₁D₂)(a,b) = −(D₁aD₂b + D₁bD₂a)`; characteristic `2`: the determinant. Pairings with `1⊗x⊗y − 1⊗y⊗x`: `2` and `1`. Injectivity: `⟨ξ⟩(r) = τ_n(ξ)(dr₁∧…∧dr_n)`, the `dr_I` span `Ω^n`. | holds |
| 7.6 (headline) | `ℤ[1/2]`: `C^n = ℤ[1/2]`, `δ = 0, 1, …`, `HH^n = 0 = T^n` for `n ≥ 1`. Inseparable `R`: Hom-differentials `0` and `2a = 0`, `HH² = R`, `T² = 0`. `𝔽₂[x,y]`: `[⟨∂_x,∂_y⟩] = 2Ψ₂ = 0`, `Ψ₂ ≠ 0`. Alternation of `Ψ_n`: `h_n[D₁∪⋯∪D_n](ε(r₀dr₁⋯)) = r₀det(D_j(r_i))`. | holds under smooth, `k`-projective and the gap |
| 8.1 (sampled) | `Y_i = −t_i`; multiplication is `Y ↦ 0`; sign change keeps `(Y₁..Y_j)`. `m = 0`: kernel `0`. `k[x]/(x²)`: `t(x⊗1 + 1⊗x) = x²⊗1 − 1⊗x² = 0`. | holds |
| 8.2 (sampled) | `d(e_i∧e_j) = t_ie_j − t_je_i` from `u∧v ↦ φ(u)v − φ(v)u`. `t_i ↦ 0` in `R`: both induced complexes have zero differential, so both hypotheses of `extLinearEquiv` hold. `m = 1`: `0 → Rᵉ --t--> Rᵉ → R → 0`. | holds |
| 8.3 (touched by 8.4) | `j = 2`: `b′(ι(e₁∧e₂)) = X₁⊗X₂⊗1 + 1⊗X₁⊗X₂ − X₂⊗X₁⊗1 − 1⊗X₂⊗X₁ = t₁(1⊗X₂⊗1) − t₂(1⊗X₁⊗1)`. | holds |
| 8.4 (sampled, headline) | `h_n[∂_I](ε(dX_J)) = det(∂_{i_a}X_{j_b}) = δ_{IJ}`; `(∂_I)∘ι_n(e_J) = δ_{IJ}`. Polynomial `R` is `k`-free: §4.4 and §4.5 apply. No gap used. | holds |
| 8.5 (sampled) | `(X₁², X₂)`: `det = 2X₁`, normalised `gX₁`. `m = 1`: `g∂`. `m = 0`, `g = 2`: `2`; empty-family reading `1`. `𝔽₂`, `m = 2`: `⟨∂₁,∂₂⟩ = δ(∂₁∂₂)`. | holds |

For the targets not in this table the round-11 and round-12 tables carry computed values and their
text is unchanged since (the diff of the last two heads touches only the passages listed in the
repair report). While reading the whole README this round I recomputed, with no discrepancy: the
unit `(1, −f(1,1))` and the `k[t]/(t³)` example of §3.5, the three-case comparison of §3.6
(`ℤ/4 → 𝔽₂`, the symmetric coboundary), the lift `f̃_i` of §5.4 at `p = 1`, the `n = 0, 1, 2`
sign witnesses of §6.1 and the `(p,q) = (1,0)` cup sign.

### Sources: the seeded sample

No locator is flagged unverified by the author. Read this round in the cached extractions:

| Target | Locator read | Outcome |
| --- | --- | --- |
| 1.5 | Ginz05 lines 2160–2166 | The centre acts on Hochschild homology through the coefficient factor; for commutative `A` this is an `A`-module structure. Supports the statement. |
| 2.2 | Ginz05 lines 1120–1128 | Reduced cochains as `Hom_k(Ā^{⊗n}, M)`; the ground field restriction is stated in the README. |
| 3.1 | Ginz05 lines 941–953, 1000–1008 | `M ⊗_{Aᵉ} A = M/[M,A]`, `HH₀`; the trace on matrices. Loday98 not readable. |
| 3.2 | Ginz05 lines 1066–1069 | Degree-zero cocycles are the central elements; `HH⁰(A) = Z_A`. |
| 4.2 | Ginz05 lines 747–782; HKR62 lines 433–447 | Bar complex, homotopy and its check on two factors; right-linear homotopy and `S`-projectivity for `K`-projective `R`. |
| 6.2 | Ginz05 lines 1358–1380 | (6.6.2), (6.6.3), Proposition 6.6.4 at the cited lines; (6.6.3) is the identity the README corrects. Ger63 and Loday98 not readable. |
| 7.1 | HKR62 lines 284–298, 352–364 | The map `h` by restriction to cycles; its degree-one form `f′(Σ x dy) = Σ x·ζ(y)`. |
| 7.2 | HKR62 lines 301–330 | Lemma 4.1: `Tor_i` projective for `i < k` gives `h_i` bijective for `i ≤ k`; the README's index range agrees. |
| 7.3 | HKR62 lines 531–535 | Dual of an exterior algebra of a finitely generated projective module, by embedding in a free one. |
| 7.4 | Ginz05 lines 1130–1140; HKR62 line 548 | Polyvector fields as sections of exterior powers of the tangent sheaf; the exterior algebra over derivations. Mat86 not readable. |
| 7.5 | Ginz05 lines 2101–2156; HKR62 lines 509–521; AV20 lines 237–243 | Alternation and projection, `π∘alt = p!`; alternating forms; the factorial remark. |
| 8.1 | HKR62 lines 268–271; Ginz05 lines 2193–2196 | As the README describes: a cited regular sequence in a regular local ring; an unproved assertion for the diagonal. |
| 8.2 | HKR62 lines 268–279; Ginz05 lines 2187–2197 | Koszul resolution with zero boundary after base change; Lemma 9.3.1 stated without proof. |
| 8.4 | HKR62 lines 210–215, 264–279; Ginz05 line 2187 | Theorem 3.1 has Noetherian and regularity hypotheses, as the README says; the Koszul computation needs only the regular sequence. |
| 8.5 | Ginz05 lines 2142–2156; HKR62 lines 495, 548 | `π∘alt = p!`; the product formula; Theorem 5.2 over a perfect field. |

Also read: Ginz05 lines 96–97 (the standing ground field), HKR62 lines 410–431 and 522–552
(Theorems 5.1 and 5.2 with the `K`-projective hypothesis), AV20 lines 70–74 (Proposition 1.2 over
any commutative `k`). All nine cited works have exactly one manifest entry; the Weibel94 entry now
lists §§2.2 and 3.2 and `§4.5` is in its `cited_for`. `sources.toml` was not changed by this
review and no `needs-references.toml` was written.

### Pinned declarations and library claims

Opened this round, in the pinned copies, for everything the repair added:
`Mathlib/RingTheory/Flat/Basic.lean:83` (`[CommSemiring R]`: `Module.Flat` has commutative scalars
only), `:114` (the class), `:121` (`rTensor_preserves_injective_linearMap`), `:234` (the
tensor-product instance); `Mathlib/Algebra/Homology/HomologySequenceLemmas.lean:56`
(`δ_naturality`); `Mathlib/CategoryTheory/Abelian/DiagramLemmas/Four.lean:138`;
`Mathlib/CategoryTheory/Abelian/Projective/Resolution.lean:92` (`lift`, whose target is a
`ProjectiveResolution`, as the README says);
`TauCeti/LinearAlgebra/TensorProduct/Balanced/Finsupp.lean:69` (`finsuppScalarRight`),
`Unit.lean:48` (`lid : A ⊗[A] N ≃ N`), `Unit.lean:122` (`rid : M ⊗[A] A ≃ M`),
`OuterFactors.lean:88`. By object: the only `class … Flat` in pinned Mathlib over modules is
`Module.Flat`; no file of `TauCeti/LinearAlgebra/TensorProduct/Balanced/` states injectivity or
exactness of the balanced tensor product; `TauCeti/CategoryTheory/Abelian/LeftDerived.lean` has
the length-one case only (`leftDerivedOneIsoKernel`, line 162; `isZero_leftDerived_add_two`, line
117) and no long exact sequence of left derived functors. So flatness over `Aᵉ` and the
flat-resolution computation are new here and are not duplicates. The other pinned declarations of
the contracts were opened in rounds 11 and 12 at the same pins.

### Duplication, citations and overlaps

Resolved now, at main `a40f789b` and at the open heads the roadmap tool serves (its `resolve` run
on this README lists no citation and no Lean name found nowhere):

| Citation | Where it resolves | Agreement |
| --- | --- | --- |
| RefinedTraceMethods §1.1 | open head, "1.1 Cyclic objects and the cyclic bar" | "For A k-flat, HH(A/k) is the homology of `C_•(A/k)`"; `HH₂(𝔽_p/ℤ) ≅ 𝔽_p`. |
| RefinedTraceMethods §1.9 | open head, "1.9 Antisymmetrization and the smooth HKR comparison" | `ε_n`, `π_n`, `π_nε_n = n!`, `ε₁` an isomorphism; a smooth quasi-isomorphism only for `ℚ ⊆ k`. |
| RefinedTraceMethods §1.10 | open head, "1.10 Derived HKR, circle tensors and a nonflat example" | heading present. |
| KTheoryFiniteLocalFields §4.0 | "4.0 Genuine equivariant and cyclic foundations" | heading present. |
| EulerSystemsAndKolyvaginSystems §6.1 | "6.1 Exterior biduals of Selmer modules" (and its own contract "From IntegralIwasawaTheory §12.6") | present. |
| IntegralIwasawaTheory §12.6 | "12.6 Rubin's lattice and the higher-rank consequence away from 2" | present. |
| LanglandsParameterStacks §1.17; DerivedDeRhamCohomology Layer 2 | "1.17 Hochschild operators and singular support of parameter complexes"; "Layer 2: Ordinary and derived de Rham cohomology" | scope deferrals. |
| DGAInfinity Layers 0, 1, 8; DerivedModuleAlgebra §§0.K.1, 0.5; NoncommutativeGeometry N1.Cyclic; BanachAlgebras Layer 6; ZigzagPreprojective Layer 7 | main | headings present. |

New ownership (§4.5: flatness of `Aᵉ`-modules, `Tor` over `Aᵉ` by flat resolutions), searched by
object at main and the open heads: DerivedModuleAlgebra §0.2 owns K-flat resolutions and the
derived tensor product, and says it "covers arbitrary, possibly unbounded complexes over arbitrary
commutative rings"; SpectralSequencesAndConvergencePartII (open) lists "Tor of one-sided modules
over noncommutative rings" among what it excludes; no other match for flat modules or `Tor` over a
noncommutative ring. This roadmap is the owner, for the enveloping algebra only.

`scratch/overlaps.md`: no other pull request changes this roadmap, no dropped id, no id only an
open revision defines, no closest roadmap by results. There is no `HochschildHomologyAndHKR`
folder on main, and the name is in neither the open-pull-request list nor the board-packages
index: no second copy.

Overlap check: read CyclicHomologyLieHomologyAndQuasiFreeAlgebras, RefinedTraceMethods (open, at
their heads this round), DGAInfinity, NoncommutativeGeometry, DerivedModuleAlgebra (main); shared:
derived tensor products and K-flat resolutions over commutative rings, owner DerivedModuleAlgebra
§0.2 (this roadmap's `Tor` is over the noncommutative `Aᵉ`, underived, and does not restate it);
commutative square-zero extensions, owner DerivedModuleAlgebra §0.5, cited; the normalised
quotient over `ℂ`, owner NoncommutativeGeometry N1.Cyclic, cited; antisymmetrisation and derived
chains, owners RefinedTraceMethods §1.9 and KTheoryFiniteLocalFields §4.0, imported; braces and
bracket, owner DGAInfinity Layers 0 and 8, imported; Koszul complex, owner DerivedModuleAlgebra
§0.K.1, imported; cyclic homology and its `Tor` over the cyclic category, owner
CyclicHomologyLieHomologyAndQuasiFreeAlgebras, not stated here. Nothing has two owners.

### Supplier order

```text
candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2239 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Edges inside the roadmap run forward only; the repair added no roadmap
supplier. §8.4 needs §6.4(a), not §6.4(d), §7.2 or §7.6, so the polynomial case does not use the
gap.

### Gap

`smooth-hkr-antisymmetrisation` (supplier RefinedTraceMethods, §1.9). Precise: one statement with
its hypotheses (every commutative `k`, every smooth commutative `A`, every `n`). Minimal:
RefinedTraceMethods §1.9 at its head has `π_nε_n = n!`, the degree-one case and a smooth
quasi-isomorphism only for `ℚ ⊆ k`, which give nothing when `n! = 0` (`𝔽₂[x,y]`, `n = 2`); §8.4
here covers polynomial algebras only. Declared in both places with the same slug: README lines
691–698 and the plan's `gaps` (`supplier` RefinedTraceMethods, `section` §1.9, `neededBy` 6.4 and
7.6).

### Headline theorems and Lean

Headlines of the summary: normalisation over every `k` (2.1, 2.2); the low degrees and the `HH²`
classification (3.1–3.6); `HH^n ≅ Ext^n` for `k`-projective `A` and `HH_n ≅ Tor_n` for `k`-flat
`A` (4.4, 4.5); cup equals Yoneda up to sign (5.4); the homotopy formula and graded commutativity
(6.2); the cohomological HKR theorem with `[⟨D₁,…,D_n⟩] = n!·Ψ_n` (7.6); polynomial algebras (8.4,
8.5). There is no `Suggested.lean` at the design stage, so the padding probe, the binder audit and
the import check do not apply yet.

### Copyright and arrangement

- **Wording.** 18 passages set beside the sources at their locators: Ginz05 at lines 747–782,
  941–953, 1066–1069, 1120–1128, 1130–1140, 1358–1380, 2086–2090, 2101–2110, 2142–2166, 2187–2197;
  HKR62 at lines 210–215, 264–279, 284–298, 301–330, 410–447, 479–495, 522–552; AV20 at lines
  70–74 and 237–243, against §§1.5, 2.2, 3.1, 3.2, 4.2, 4.5, 6.2, 7.1–7.6, 8.1, 8.2, 8.4, 8.5.
  Nothing is shared beyond formulae and standard names; the new §4.5 route follows no readable
  source (its locators are Weibel94 §§2.2 and 3.2, and its argument, by δ-functors in the
  coefficient variable, is the README's own).
- **Arrangement.** Ginz05 has the largest share (46 of 124 source mentions). Its sections run §3
  derivations, §4 bar complexes, §5 Hochschild theory defined as `Tor` and `Ext` with the low
  degrees, §6 Gerstenhaber structures, §8 Kähler differentials, §9 HKR. The roadmap builds the
  complexes from simplicial modules, normalises before the low degrees and puts both before the
  bar resolution; Layers 2, 6 and 8 have no counterpart section. No one-to-one run.
- **Reuse.** No table, figure, exercise list or data set is taken from a source.

Source independence: 18 passages compared with 3 sources (Ginz05, HKR62, AV20), none shared;
largest share Ginz05, 46 of 124 locators; contents compared with Ginz05: independent. Loday98,
Weibel94, CE56, Ger63 and Mat86 could not be read (settled uncertified).

## Not verifiable

- Loday98, Ger63, Weibel94, CE56, Mat86: settled uncertified; their section and theorem numbers
  were not checked against the texts. In the sample this covers the Loday98 locators of 2.2, 3.1,
  3.2, 4.2, 6.2, 8.1 and 8.4, the Weibel94 locators of 4.2 and 8.4, the Ger63 locator of 6.2 and
  the Mat86 locator of 7.4; and the two Weibel94 locators the repair added (§2.2 for the comparison
  theorem with an exact target, §3.2 for flat resolutions over any ring), whose statements were
  recomputed above instead.
- Lean elaboration and the one-tactic probe: no Lean file at this stage, and this lane does not
  elaborate.
- The closed form of `s(p,q)` (§5.3) for `p, q ≥ 1` and the signs `ν_n` (§6.3) for `n ≥ 1`: the
  design states their existence; they depend on Mathlib's shift conventions and on DGAInfinity
  Layer 8's chain differential.
- The declared gap is a contract on RefinedTraceMethods §1.9, not a statement that exists today.

## Source issues

- **Error** in Ginz05 at §6.6, identity (6.6.3), p. 29 (line 1368): the source says the graded commutator of cup products is `d(f∘g) − df∘g − (−1)^p f∘dg`; it should be, for the coboundary of line 1058, `g∪f − (−1)^{pq} f∪g = df∘g + (−1)^q(d(f∘g) − f∘dg)`; affects a stated result.
- **Misprint** in Ginz05 at §6.6, formula (6.6.2), p. 29 (line 1363): the source says the inner cochain takes the arguments `a_i,…,a_{i+q}`; it should be `a_i,…,a_{i+q−1}`, `q` arguments; affects nothing.
- **Misprint** in Ginz05 at §5.3, p. 22 (line 1068): the source says the set of `m` with `am = ma` is the centre of the module `A`; it should be the centre of the bimodule `M`; affects nothing.
- **Gap** in Ginz05 at §9.3, proof of Theorem 9.1.3, p. 46 (lines 2193–2196): the source says the diagonal ideal of `A ⊗ A` is generated by a regular sequence when `X` is smooth; it should be claimed only after localising at points of the diagonal; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "464d55de12833262656bb280101aa780b2edc8bb", "job": "REV-DESIGN-HochschildHomologyAndHKR~13", "model": "fable", "worker": "chris-x89"} -->

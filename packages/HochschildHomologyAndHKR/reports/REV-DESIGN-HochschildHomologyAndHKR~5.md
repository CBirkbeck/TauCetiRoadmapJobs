<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13788#issuecomment-6849817927 -->
Review (claude) of 401470b

Verdict: needs_changes

1. **F01** (P3) A Check attributes the field case to a theorem with a narrower standing hypothesis

   **Location.** `packages/HochschildHomologyAndHKR/design/README.md:1602`: "For `k` a field and `R`
   smooth of finite type, `Module.Projective k R` holds automatically and the theorem is Ginz05
   Theorem 9.1.3 and, for `k` perfect, HKR62 Theorem 5.2." The same sentence is the first test of
   plan target 7.6 (`plan.json` line 1635).

   **Claim.** Ginz05 Theorem 9.1.3 is the theorem over every field.

   **Witness.** Ginz05 lines 96–97 fix the ground field as algebraically closed of characteristic
   zero for the whole text; Theorem 9.1.3 (line 2086) is stated for the coordinate ring of a smooth
   affine variety over that field. `𝔽₂[x,y]` is outside it.

   **Exact repair.** Replace by: "For `k` a field, `Module.Projective k R` holds automatically; the
   theorem is then HKR62 Theorem 5.2 when `k` is perfect, and Ginz05 Theorem 9.1.3 when `k` is
   algebraically closed of characteristic zero." Same wording in plan 7.6. No statement changes.

   **Repair test.** `k = 𝔽₂`, `R = 𝔽₂[x,y]`: perfect field, regular affine, so HKR62 Theorem 5.2
   (line 548) applies and Ginz05 is not invoked; `k = ℂ`: both apply.

2. **F02** (P3) Two Needs lines omit pinned exterior-power declarations their statements use

   **Location.** §8.2, lines 1665–1676: "`K_j = ⋀^j (Rᵉ)^m` free of rank `C(m,j)`, for every
   commutative `k`", Needs without any exterior-power declaration. §7.5, lines 1531–1539: "so that it
   defines the unnormalised HKR map `T^n_{R/k} → C^n(R,R)`", Needs "Mathlib `Matrix.det`,
   `Derivation`".

   **Claim.** The Needs lines list what the statements and routes use, item by item.

   **Witness.** `Mathlib/LinearAlgebra/ExteriorPower/Basis.lean:95` (`Module.Basis.exteriorPower`),
   `:162` (`exteriorPower.instFree`), `:174` (`exteriorPower.finrank_eq`, which assumes
   `[Nontrivial R]`); `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean:212`
   (`exteriorPower.alternatingMapLinearEquiv`). The Mathlib contract (line 322) lists two of them; no
   Needs line does.

   **Exact repair.** §8.2 Needs and plan 8.2: add `exteriorPower.instFree` and
   `Module.Basis.exteriorPower`; reword "free of rank `C(m,j)`" as "free, with basis the wedges
   `e_I` for the `j`-element subsets `I` of `{1,…,m}`" (a rank is not defined over the zero ring, and
   `exteriorPower.finrank_eq` needs nontriviality). §7.5 Needs and plan 7.5: add
   `exteriorPower.alternatingMapLinearEquiv`. Add `Module.Basis.exteriorPower` to the Mathlib
   contract.

   **Repair test.** `m = 2`, `j = 1`, `k = 0`: the basis statement holds (two basis vectors of the
   zero module) while "rank 2" has no meaning; `k = ℤ`: `C(2,1) = 2` basis wedges `e₁, e₂`. §7.5 at
   `n = 2`: `(D₁, D₂) ↦ ⟨D₁, D₂⟩` is alternating (`⟨D, D⟩ = 0`), so it factors through `⋀²` by the
   named equivalence.

3. **F03** (P3) The agreement with the pinned normalised chains is asserted in the scope and stated nowhere as a target

   **Location.** `packages/HochschildHomologyAndHKR/design/README.md:142–144`: "for `M = A` the terms
   agree under `⨂[k]^{n+1} A ≅ A ⊗[k] A^{⊗n}`, and so do the boundaries"; §2.1 (lines 723–742) has no
   bullet for it and no Needs entry.

   **Claim.** The comparison holds; the reader of §2.1 is told where it is proved.

   **Witness.** `TauCeti/RingTheory/CyclicCohomology/Normalized/Chains.lean:69`
   (`TauCeti.normalizedHochschildChains`, quotient by tensors with a unit in a noninitial slot) and
   `:242` (its boundary `b`). The file's docstring says it does not compare with the full complex,
   which is §2.1's addition.

   **Exact repair.** Add to §2.1 one API bullet: "For `M = A`, the isomorphism
   `⨂[k]^{n+1} A ≅ A ⊗[k] A^{⊗n}` carries the degenerate subcomplex `D_n` onto
   `TauCeti.degenerateHochschildChains k A n` and induces an isomorphism of `N_n(A,A)` with
   `TauCeti.normalizedHochschildChains k A n` commuting with the boundaries", and add both names to
   §2.1's Needs, to the Tau Ceti contract and to plan 2.1.

   **Repair test.** `n = 1`, `A = k[x]`: `D₁` is spanned by the `m ⊗ 1`, the pinned degenerate
   tensors are the `a₀ ⊗ 1` (index `1 ≠ 0`, value `1`): the same span. `A = k`: both quotients are
   `0` in degree `≥ 1` and `k` in degree `0`.

Three findings (R01–R03, all P3; no P1, no P2), each with a repair to apply, so the design is
returned for a fix round rather than accepted. The declared gap `smooth-hkr-antisymmetrisation`
(RefinedTraceMethods §1.9) is precise, minimal and declared in both files, and is no finding. The three findings of round 4 are repaired. This is a design review:
there is no `Suggested.lean`, and nothing was elaborated (this lane does not elaborate).

Files reviewed: `packages/HochschildHomologyAndHKR/design/README.md` (1842 lines, 37 targets in 8
layers), `packages/HochschildHomologyAndHKR/design/plan.json`,
`packages/HochschildHomologyAndHKR/sources.toml`. Pins: Mathlib
`1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`
(the checkouts are at these revisions, and the plan's `baseline` agrees). No maintainer notes were
supplied.

## Verification of the previous repairs

Round-4 review: three findings F01–F03, all P3. Each was checked against the design and against
`packages/HochschildHomologyAndHKR/reports/FIX-DESIGN-HochschildHomologyAndHKR~5.md`.

| Round-4 finding | Repaired passage (`packages/HochschildHomologyAndHKR/design/README.md`) | Assessment |
| --- | --- | --- |
| F01 (P3): pinned declarations consumed by Layers 4 and 8 not named | Lines 452–467: "`MvPolynomial.isWeaklyRegular_map_X` … with no nontriviality hypothesis"; "`TauCeti.koszulComplex` … These are the pinned form of DerivedModuleAlgebra §0.K.1"; lines 332–339: "what neither library states is its transport to the differences `t_i`"; §4.1 line 971: "whose module structure is Mathlib's `instModuleTensorProductMop`"; §8.1 route and Needs, §8.2 Needs, plan 4.1, 8.1, 8.2 | **Repaired.** Opened at the pins: `TauCeti/RingTheory/MvPolynomial/RegularSequence.lean:44` (`(l : List σ) (hl : l.Nodup)`, no `Nontrivial`; `:63` adds it); `TauCeti/RingTheory/KoszulComplex/Basic.lean:122, 137, 219, 399`; `Regular.lean:140` (`x : Fin n → R`, `IsWeaklyRegular R (List.ofFn x)`, exact at `k + 1`); `Mathlib/Algebra/Azumaya/Defs.lean:39` (an `abbrev`, `:= TensorProduct.Algebra.module`), `:52` (`a * x * b.unop`); `Mathlib/RingTheory/Regular/RegularSequence.lean:190`; `Mathlib/RingTheory/MvPolynomial/Ideal.lean:63`. |
| F02 (P3): Layer 5 and Layer 8 Dependencies did not match their Needs lines | Layer 5, lines 1184–1187: "No Tau Ceti declaration is used directly"; Layer 8, lines 1782–1790; Layer 6, lines 1390–1398 (also corrected) | **Repaired.** Compared supplier by supplier with the Needs lines of §§5.1–5.4, 6.1–6.4, 8.1–8.5: every supplier named in a Dependencies paragraph occurs in a Needs line of its layer and conversely, up to R02 below (two Mathlib exterior-power declarations that neither names). |
| F03 (P3): second locator of §4.3 | Line 1024: "HKR62 lines 480–489, for commutative `A` and `M = A`" | **Repaired.** HKR62 lines 480–484 give the value-wise product through evaluation at `1 ⊗ x₁ ⊗ ⋯ ⊗ x_p ⊗ 1`; line 489 gives `x₀ ζ(x₁) x₂`. §7.1 keeps lines 284–298, which define `h`. |

The repaired pattern (a pinned declaration that a route consumes but no Needs line names) was then
searched for in the rest of the design; it gave R02. The repaired locator pattern (a locator that
supports less than the sentence says) gave R01.

## Verified sound

### Principles and shape

- **General library.** Arbitrary commutative `k` throughout; characteristic two kept (the theorem
  is for the canonical map `Ψ`, and the determinant map is `n!` times it); the zero ring handled by
  a convention; flat, projective and smooth cases separated by hypotheses, never excluded.
- **Nothing re-planned.** Brackets, braces, derived chains, antisymmetrisation, the Koszul complex
  and the exterior bidual are imported by section; the seven kept variants each state their
  difference (lines 131–154).
- **No** algorithm, copied passage, `set_option`, sorry'd data (no Lean file), process word,
  pull-request number, date, HTML anchor, machine path or LaTeX delimiter in the README (searched).
- **Organisation.** Layers are named by their mathematics; the README does not say it follows a
  source. The order is forced by the Needs lines: complexes → normalisation → low degrees → bar
  resolution, `Ext`, `Tor` → cup and Yoneda → sign dictionary and homotopy formula → duality and
  HKR → polynomial case.
- **Shape.** 37 targets, 37 Needs lines, every layer ends with Examples and Dependencies.
  Checks counted per target: every definition or construction has at least three (1.1: 3, 1.2: 3,
  1.5: 3, 2.1: 3, 2.2: 3, 3.3: 4, 3.5: 4, 3.6: 3, 4.1: 3, 4.2: 3, 4.5: 4, 5.1: 3, 6.1: 4, 6.3: 3,
  6.4: 4, 7.1: 3, 7.2: 3, 7.3: 3, 7.4: 3, 7.5: 4, 8.1: 3, 8.2: 3, 8.3: 3, 8.5: 4); the theorem-only
  targets 1.3, 1.4, 3.2, 4.3, 4.4, 5.2, 5.3, 8.4 carry fewer, as allowed. Every target has a
  locator.
- **Gap.** `smooth-hkr-antisymmetrisation` has the same slug in README lines 537–542 and in the
  plan's `gaps` (supplier RefinedTraceMethods, section §1.9). It is precise (every commutative `k`,
  every smooth commutative `A`, every `n`, the named map `ε_n`) and minimal: RefinedTraceMethods
  §1.9 at its open head proves `π_n ε_n = n!`, `ε₁` an isomorphism, and the smooth
  quasi-isomorphism only for `ℚ ⊆ k`; KTheoryFiniteLocalFields §4.0 asserts an isomorphism without
  naming the map; Layer 8 here proves the polynomial case only.

### Adversarial table

Values computed in this round. `E_ij` are matrix units.

| Statement | Instances tried and values computed | Result |
| --- | --- | --- |
| §8.1 route (repaired) | `R ⊗ k[X] ≅ R[X]`: `1 ⊗ X_i ↦ X_i`, `X_i ⊗ 1 ↦ C(X_i)`, so `Y_i ↦ X_i − C(X_i)`; after `X_i ↦ X_i + C(X_i)`, `Y_i ↦ X_i`; `μ(Y_i) = 0`, `μ(r ⊗ 1) = r`. Pinned kernel lemma at `s = univ`: `aeval (fun _ ↦ 0)`, kernel `span(X_i)`. `m = 0`: empty list, kernel `0`. `k = 0`: weakly regular holds. Sign: `(t₁..t_j) = (Y₁..Y_j)`, `t x = 0 ⇔ Y x = 0`. | holds |
| §8.2 (repaired) | Pinned degree-two formula at `v = (e₁, e₂)`: `φ(e₁) e₂ − φ(e₂) e₁ = t₁e₂ − t₂e₁`. `m = 1`: `0 → Rᵉ –t→ Rᵉ`, `t` acts by `0` on `R`, both hypotheses of `extLinearEquiv` hold. `m = 0`: `K = k`. Rank over `k = 0`: undefined. | holds; R02 |
| §4.1 (repaired) | `(E₁₂ ⊗ op E₂₁)·E₂₂ = E₁₂E₂₂E₂₁ = E₁₁`; reversed `E₂₁E₂₂E₁₂ = 0`; pinned `a * x * b.unop` agrees. | holds |
| §4.3 (repaired) | `φ ∘ b′` at `1 ⊗ a ⊗ b ⊗ 1`: `a f(b) − f(ab) + f(a) b`; HKR62 line 489 at `p = 1`: `x₀ ζ(x₁) x₂`. | holds |
| 1.1 | `A = M = k`: `b₁ = 0`, `b₂ = 1`, so `HH₀ = k`, `HH₁ = k/k = 0`, `HH₂ = 0`. `b(E₁₂ ⊗ E₂₁) = E₁₁ − E₂₂`. | holds |
| 1.2 | Wrong last sign: `δ′δm(a,b) = 2mab − 2amb`; `m = E₁₁, a = E₁₂, b = E₂₂`: `mab = E₁₂`, `amb = 0`, value `2E₁₂`. | holds |
| 1.5 | `b(1 ⊗ x ⊗ 1) = x ⊗ 1 − 1 ⊗ x + 1 ⊗ x = x ⊗ 1`; `b(1 ⊗ 1 ⊗ 1) = 1 ⊗ 1`, wrong action gives `1 ⊗ x`. `E₁₁ b(E₁₂ ⊗ E₂₁) = E₁₁ ≠ E₁₁ − E₂₂`. | holds |
| 2.1 | `b(m ⊗ 1 ⊗ 1) = m ⊗ 1`; `b(1 ⊗ x ⊗ x) = 2x ⊗ x − 1 ⊗ x²`. `A = k`: `Ā = 0`. | holds; R03 |
| 2.2 | `g(1) = 1`: `δg(1,1) = 1 − 1 + 1 = 1`. `D(1) = 2D(1)`. | holds |
| 3.1 | `[E_ij, E_jj] = E_ij` for `i ≠ j`; `[E_ij, E_ji] = E_ii − E_jj`; `Mat₀(k) = 0`. | holds |
| 3.2 | `E₁₁E₁₂ − E₁₂E₁₁ = E₁₂`; commutative `A`: `δm = 0`. | holds |
| 3.3 | `δE₁₁(E₁₂) = E₁₂E₁₁ − E₁₁E₁₂ = −E₁₂`; pinned `innerDerivation E₁₁ (E₁₂) = +E₁₂`. | holds |
| 3.5 | Unit: `(1,−f(1,1))(a,m) = (a, m − f(1,1)a + f(1,a))`, and `δf(1,1,a) = f(1,a) − f(1,1)a`. Gauge: `f′ = f − δg` termwise. `k[x]/(x²)`: `δf` vanishes at `(x,x,x), (1,x,x), (x,x,1), (x,1,x)`; `t² = (0,1)`, `t³ = 0`. `k[x]`, `f(x,x²) = 1`: `δf(x,x,x) = 1`, products `(x³,0)`, `(x³,1)`. | holds |
| 3.6 | Section `a ↦ (a, g(a))` multiplicative iff `f = −δg`; then `g(1) = −f(1,1)`, the unit. `k = ℤ`, `A = M = 𝔽₂`: `δ¹ = 1`, `δ² = 0`, `HH² = 𝔽₂/𝔽₂ = 0`; `ℤ/4` not `ℤ`-split. | holds |
| 4.2 | `(b′h + hμ)(a₀ ⊗ a₁) = a₀ ⊗ a₁ − 1 ⊗ a₀a₁ + 1 ⊗ a₀a₁`. `A = k`: `… k –1→ k –0→ k –id→ k → 0`. | holds |
| 4.5 | `m ⊗ (a₀ ⊗ ⋯ ⊗ a_{n+1}) ↦ a_{n+1} m a₀ ⊗ ⋯`: first face gives `(a_{n+1} m a₀) a₁`, last `a_n (a_{n+1} m a₀)`, the faces of `b`. Non-structure: `E₂₁E₁₂ = E₂₂ ≠ E₁₁`. | holds |
| 5.1 | Reversed product: defect `bax − bxa + abx − axb` at `x = E₁₁, a = E₂₁, b = E₁₂`: `E₁₁ − 0 + 0 − E₂₂`. | holds |
| 5.2 | `p = q = 1`: both sides `a f(b) g(c) − f(ab) g(c) + f(a) g(bc) − f(a) g(b) c`. | holds |
| 6.1 | `n = 2`: `m{Θf} = s(f(a,b)c − a f(b,c))`, `Θf{m} = s(f(ab,c) − f(a,bc))`, sum `= −Θ(δf)`. `f(a,b) = a ∂b`: `δf = ab ∂c`, model `2a(∂b)c − ab∂c`, at `(1,x,1)`: `0` versus `2`. `(1,0)` cup: `−s(f(a)y)`. | holds |
| 6.2 | `(1,1)` termwise: `f∘δg + δf∘g − δ(f∘g) = g(a)f(b) + f(a)g(b)`. `(1,0)`: both sides `y f(a) − f(a) y`. `(0,1)`: `g(a)x − x g(a)`. General: the brace relation with `DΘf = (−1)^{p+1}Θδf`, `m{Θf,Θg} = (−1)^{p(q−1)}Θ(f∪g)` gives exactly the displayed identity (exponents reduced mod 2). | holds |
| 6.4 | Cyclic-shift cancellation: sign `(−1)^n · (−1)^{n−1} = −1`. `r_i = r_j`: `σ` and `σ ∘ (i j)` cancel exactly, also in characteristic two. `π₂ε₂(dx ∧ dy) = 2 dx ∧ dy`. | holds |
| 7.1 | `(φ ∘ b)(r₀ ⊗ ⋯ ⊗ r_{n+1}) = r₀ δf(r₁,…,r_{n+1})` using `r_{n+1} r₀ f = r₀ f r_{n+1}`. Asymmetric `k`: `δm(x) = m`. | holds |
| 7.2 | Pinned theorem in degree `i` needs `∀ j < i`; `i ≤ n` gives it. `n = 1`: only `HH₀ = R`. | holds |
| 7.3 | `P = R²`: `det I₂ = 1`, transposed wedge `−1`. Infinite rank form not in the image (finite sums of rank `≤ 2`). | holds |
| 7.5 | `Σ_σ sgn σ Π_i D_{σ(i)}(r_i) = det(D_j(r_i))`. `δ(D₁D₂)(a,b) = −(D₁a D₂b + D₂a D₁b)`. | holds; R02 |
| 7.6 (headline) | (2) well defined: `[D₁ ∪ ⋯ ∪ D_n]` is the preimage of `τ_n(D₁ ∧ ⋯ ∧ D_n)`, alternating. `𝔽₂[x,y]`: `Ψ₂` pairs to `1`, determinant class `2Ψ₂ = 0`. `ℤ[1/2]`: `C^n = ℤ[1/2]`, `δ` alternates `0`, `id`. Inseparable: `t² = 2u − 2a ⊗ a = 0`, `HH² = R`, `T² = 0`. | holds under smooth, `k`-projective and the gap; R01 |
| 8.3 | Unsigned `ι′`: defect `2(X₂ ⊗ X₁ ⊗ 1 + 1 ⊗ X₂ ⊗ X₁ − 1 ⊗ X₁X₂ ⊗ 1)`. | holds |
| 8.4 (headline) | Without §7.2: `[∂_J ∪]` restricted along `ι` is `e_I ↦ det(∂_{j_a} X_{i_b}) = δ_IJ`, the dual basis of `Hom(K_n, R)`. | holds, no gap |
| 8.5 | `m = 2`, `(X₁², X₂)`: `2X₁`. `m = 0`, `g = 2`: `2`. | holds |

### Sources: the seeded sample

Read in the cached extractions. No locator is flagged as unverified by the author.

| Target | Locator read | Outcome |
| --- | --- | --- |
| 1.1 | Ginz05 lines 973–976 | The boundary of the conventions. |
| 1.5 | Ginz05 lines 2161–2166 | Action of the centre on the coefficient factor; commutes with the differential. |
| 2.2 | Ginz05 lines 1120–1128 | Reduced cochains `Hom_k(Ā^{⊗n}, M)`; field setting, as the README says. |
| 3.1 | Ginz05 lines 941–953, 1001–1030 | `HH₀ = M/[M,A]`; the trace argument with both commutator identities. |
| 3.2 | Ginz05 lines 1066–1069 | Centre of `M`; `HH⁰(A) = Z(A)`. |
| 3.3 | Ginz05 lines 398–411, 1075–1085 | Derivations, inner derivations, both exact sequences. |
| 3.6 | Ginz05 lines 1088–1111 | Linear splitting, cocycle condition, coboundary criterion, Remark 5.5.1. |
| 4.1 | Ginz05 lines 751–752, 934–947 | Left action `a₁ m a₂`; right module and `M ⊗_{Aᵉ} A`. |
| 4.5 | Ginz05 lines 944–976 | `Tor` definition, the identification `a_n m a₀ ⊗ ⋯` (lines 963–966), the differential. |
| 5.1 | Ginz05 lines 1335–1341; HKR62 lines 479–484 | Cup formula; value-wise product from the diagonal. |
| 5.2 | Ginz05 lines 1342–1350 | Leibniz rule, descent, Yoneda identification asserted. |
| 7.3 | HKR62 lines 531–535 | Direct summand of a finite free module; dual of exterior algebra. |
| 7.6 | HKR62 lines 301, 495, 522, 528–546, 548, 569–582; AV20 lines 70, 237–243; Ginz05 line 2086 | All present. Theorem 5.1 assumes `K`-projective `R`; Theorem 5.2 perfect field; Ginz05 narrower than the Check says (R01). |
| 8.4 | HKR62 lines 210, 268–279; Ginz05 line 2187 | Koszul computation inside the proof; Lemma 9.3.1 for a regular sequence. |
| 8.5 | Ginz05 lines 2142–2156; HKR62 line 548 | Alternation map and `π ∘ alt = p!`. |
| Conventions | StacksSmooth lines 16920, 17399 | Tags 00T2 and 00TN present. |

Every cited work has exactly one manifest entry; `sources.toml` was not changed and no
`needs-references.toml` was written.

### Pinned declarations

All 267 backticked identifiers of the README were extracted; 232 are library names and each was
resolved to a declaring line at the pins (the other 35 are mathematical symbols such as `HH₀`, plus
`TauCeti.StarkSystems.toExteriorBidual`, which is a supplier's target, below). Opened by hand this
round, beyond the repair rows above:

- `Mathlib/RingTheory/Smooth/Basic.lean:71, 111`; `Mathlib/RingTheory/Smooth/Flat.lean:57`;
  `Mathlib/RingTheory/Extension/Cotangent/Basic.lean:521`;
  `Mathlib/Algebra/Module/Projective.lean:240`; `Mathlib/Algebra/Category/ModuleCat/Projective.lean:27`;
  `Mathlib/Algebra/Category/ModuleCat/Ext/HasExt.lean:27` (needs `Small.{v} R`);
  `Mathlib/CategoryTheory/Abelian/Ext.lean:56` (`ChainComplex.linearYonedaObj`);
  `Mathlib/CategoryTheory/Abelian/LeftDerived.lean:109`;
  `Mathlib/RingTheory/TensorProduct/Basic.lean:565` (`TensorProduct.Algebra.module`, protected, not
  an instance); `Mathlib/Algebra/TrivSqZeroExt/Basic.lean:84, 88, 853, 882`;
  `Mathlib/RingTheory/Derivation/Basic.lean:278`; `Mathlib/RingTheory/Kaehler/Basic.lean:251`;
  `Mathlib/LinearAlgebra/ExteriorPower/Pairing.lean:64, 71`, `Basis.lean:29, 162, 182`,
  `Basic.lean:260, 452`; `Mathlib/Algebra/Homology/Opposite.lean:428`;
  `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:97` (`Rep.Tor`),
  `GroupCohomology/Basic.lean:202`.
- `TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean:212, 234` (terms projective by
  instance, `∀ j < n`); `TauCeti/Algebra/Homology/Kronecker.lean:106, 113, 124`;
  `TauCeti/Algebra/Homology/Ext/ProjectiveResolution.lean:107` (both vanishing hypotheses);
  `TauCeti/LinearAlgebra/TensorProduct/Balanced/Basic.lean:92, 147, 160`, `Unit.lean:48, 122`;
  `TauCeti/RingTheory/Derivation/Bimodule.lean:84, 89, 101`;
  `TauCeti/RingTheory/HochschildCohomology/Complex.lean:137` (degree `n` takes `n + 1` arguments),
  `Dual.lean:138`; `TauCeti/Algebra/Homology/AInfinity/Algebra/Hochschild/Complex.lean:49, 87`,
  `Cohomology.lean:80`; `TauCeti/LinearAlgebra/ExteriorPower/Basic.lean:145`.
- Library claims: Mathlib has no Koszul complex (the word occurs only in a TODO and a docstring)
  and no Hochschild complex (one docstring mention under group cohomology); the only
  weak-regularity statements for polynomial or tensor objects are Mathlib's two flat-tensor lemmas
  and Tau Ceti's variable lemma. These agree with the README.

No backticked identifier is presented as this roadmap's own Lean declaration.

### Duplication, citations, overlaps

| Citation | Where it resolves | Agreement |
| --- | --- | --- |
| DGAInfinity Layers 0, 1, 8 | main, `TauCetiRoadmap/DGAInfinity/README.md:263, 293, 520` | Headings exist. |
| DerivedModuleAlgebra §0.K.1 | main, `TauCetiRoadmap/DerivedModuleAlgebra/README.md:649` | Koszul complex of a finite sequence. |
| KTheoryFiniteLocalFields §4.0 | open head, README lines 639, 651 | "Cyclic homology foundations"; HKR comparison asserted, map unnamed. |
| RefinedTraceMethods §§1.1, 1.9, 1.10 | open head, README lines 84, 404, 445 | §1.1 cyclic enhancement (flat case is the cyclic bar; `𝔽_p/ℤ` differs); §1.9 `ε_n`, `π_n ε_n = n!`, `ε₁`; smooth case only for `ℚ ⊆ k`; §1.10 `HH_{2n}(𝔽_p/ℤ) = 𝔽_p`. |
| EulerSystemsAndKolyvaginSystems §6.1 | open head, README line 3943 | "Prove that evaluation is an isomorphism for finite projective X", for any `R`-module carrier. |
| IntegralIwasawaTheory §12.6 | open head, README lines 1846–1848 | Owns `exteriorBidual` and `toExteriorBidual` in `TauCeti.StarkSystems`, arguments `R, r, M`. |
| DerivedDeRhamCohomology Layer 2; LanglandsParameterStacks §1.17 | open heads, README lines 3040; 525 | Scope deferrals only. |
| NoncommutativeGeometry N1; BanachAlgebras Layer 6; ZigzagPreprojective Layer 7 | main, lines 479; 1379; 1047 | Scope deferrals only; BanachAlgebras §6.1 uses the same coboundary formula. |

`roadmaps resolve` on the README (main at `8970bf3`, 436 open heads): no cross-roadmap citation and
no Lean name found nowhere. The overlaps report lists no other pull request changing this roadmap,
no dropped id, no id defined only by an open revision. Main has no `HochschildHomologyAndHKR`
folder and no open pull request or board package carries one: no second copy. Searched the open
roadmaps and main, by object, for the `HH²` classification of square-zero extensions, the bar
resolution over the enveloping algebra and a cohomological HKR theorem with polyvector fields: no
other owner. CyclicHomologyLieHomologyAndQuasiFreeAlgebras §4.1 characterises quasi-free algebras
by `Ext²` over `Aᵉ` through `instModuleTensorProductMop`; it does not own Hochschild cohomology
with bimodule coefficients and hands nothing to this roadmap.

Overlap check: read CyclicHomologyLieHomologyAndQuasiFreeAlgebras, RefinedTraceMethods,
IntegralHeckeAndGaloisDeterminants (vocabulary only, no Hochschild object), DGAInfinity,
DerivedModuleAlgebra, NoncommutativeGeometry; nothing shared (antisymmetrisation and derived
chains: RefinedTraceMethods and KTheoryFiniteLocalFields, imported; brackets, braces and graded
cochains: DGAInfinity, imported; Koszul complex: DerivedModuleAlgebra, imported; the ungraded
complexes with bimodule coefficients, the `Ext` and `Tor` comparison and the cohomological HKR
theorem: this roadmap).

### Supplier order

```text
candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 206 roadmaps, 1900 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Suppliers: DGAInfinity and DerivedModuleAlgebra (main);
IntegralIwasawaTheory, KTheoryFiniteLocalFields, EulerSystemsAndKolyvaginSystems and
RefinedTraceMethods (all earlier than the placement). None is on the never-cite list. Every Needs
line was read: local edges run forward only; Layer 8 uses §6.4(a), not §6.4(d) or §7.6, so the
polynomial case does not depend on the gap.

### Headline theorems and Lean

Headlines from the summary: normalisation over every `k`; the low-degree identifications and the
`HH²` classification; `HH^n ≅ Ext^n` and `HH_n ≅ Tor_n` for `k`-projective `A`; cup equals Yoneda
up to sign; the sign dictionary, the homotopy formula and graded commutativity; the cohomological
HKR theorem with `[⟨D₁,…,D_n⟩] = n! Ψ_n`; the polynomial bases and the top-degree formula. No
`Suggested.lean` exists at the design stage, so no padding probe, binder audit or import check
applies. For the package stage: §7.2 and §8.1 are transports of single pinned theorems and belong
in the README, not among the sorried statements.

## Not verifiable

- Loday98, Ger63, Weibel94, CE56, Mat86: settled uncertified; their section and theorem numbers
  were not checked against the texts.
- Lean elaboration and the one-tactic probe: no Lean file at this stage, and this lane does not
  elaborate.
- The closed form of the sign `s(p,q)` of §5.3 for `p, q ≥ 1`: the design makes its existence a
  target and states no formula; only `s(p,0) = 1` and the `p = 0` lemma were checked at the pin.
- The signs `ν_n` of §6.3: they depend on DGAInfinity Layer 8's chain differential, which is a
  roadmap section, not a pinned declaration.
- The declared gap is a contract on RefinedTraceMethods §1.9, not a statement that exists today.
- Whether the slips in Ginz05 below are in the typeset text or only in the extraction.

## Source issues

- **Misprint** in Ginz05 at §3.1, the definition of inner derivations, printed p. 9 (line 404): the source says the map attached to an element of the bimodule goes from the bimodule to itself; it should go from the algebra to the bimodule; affects nothing.

The issues recorded in earlier rounds (Ginz05 lines 1049–1053 and 2147–2150) were re-read and stand
as recorded.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "401470b0094d9b40e1a86e648405ebdd37589000", "job": "REV-DESIGN-HochschildHomologyAndHKR~5", "model": "fable", "worker": "chris-x55"} -->

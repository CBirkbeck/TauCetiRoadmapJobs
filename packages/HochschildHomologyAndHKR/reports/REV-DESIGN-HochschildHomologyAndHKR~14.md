<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13788#issuecomment-6901374217 -->
Review (claude) of dfc5b79

Verdict: needs_changes

1. **F01** (P3) §1.4 needs the flatness and projectivity of `A^{⊗n}`, stated only in §4.2

   **Location.** `packages/HochschildHomologyAndHKR/design/README.md` §1.4, line 833: "*Needs:* §1.3;
   Mathlib `CategoryTheory.ShortComplex.ShortExact.δ`, … `Module.Flat`, `Module.Projective`."; §4.2,
   line 1283: "`A^{⊗n}` is a projective `k`-module when `A` is, by induction … likewise flat when `A`
   is flat."

   **Claim.** §1.4's statement follows from §1.3 and the listed Mathlib declarations.

   **Witness.** Exactness of `M ↦ M ⊗[k] A^{⊗n}` needs `⨂[k]^n A` flat, and of `M ↦ Hom_k(A^{⊗n}, M)`
   needs it projective. Neither pin has an instance for `PiTensorProduct` or `TensorPower` (searched
   by object); the fact is §4.2's first bullet.

   **Repair.** Add to §1.4 the API bullet "`A^{⊗n}` is a flat `k`-module when `A` is, and projective
   when `A` is, by induction on `n` with `TensorPower.mulEquiv`, the flatness of a tensor product of
   flat modules and `Module.Projective.tensorProduct`", and add `TensorPower.mulEquiv`,
   `Module.Projective.tensorProduct` and the flat tensor-product instance of
   `Mathlib/RingTheory/Flat/Basic.lean` to §1.4's *Needs:* line. Replace §4.2's first bullet by a
   citation of §1.4 and leave the references "(§4.2)" in §§4.5 and 7.6 pointing at it, or repoint
   them to §1.4. The plan's target 1.4 takes the same API entry and prerequisites. Tested: for
   `k = ℤ`, `A = ℤ[x]`, `A^{⊗2} = ℤ[x,y]` is free, and `0 → M' ⊗ ℤ[x,y] → M ⊗ ℤ[x,y] → M'' ⊗ ℤ[x,y] → 0`
   is exact; for `A = ℚ`, `A^{⊗2} = ℚ` is flat and not projective, so the chain clause applies and the
   cochain clause does not. The statement of §1.4 is true as written; only its inputs are listed late.

One finding, R01 (P3): §1.4 uses the flatness and projectivity of the tensor powers
`A^{⊗n}`, a fact the README first states three layers later, in §4.2, and that §1.4's *Needs:* line
does not list. No P1 or P2 finding; the verdict asks for changes because R01 carries a repair. The
declared gap `smooth-hkr-antisymmetrisation` (supplier RefinedTraceMethods §1.9), used only in
§6.4(d) and §7.6, is precise, minimal and declared in both files, and is no finding.

Files reviewed: `packages/HochschildHomologyAndHKR/design/README.md` (2245 lines, 8 layers, 37
targets, read in full this round), `packages/HochschildHomologyAndHKR/design/plan.json` (8 layers,
37 targets, 1 gap) and `packages/HochschildHomologyAndHKR/sources.toml` (9 entries). Pins from the
roadmap repository's `lake-manifest.json`: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (unchanged since
round 11). No maintainer notes were supplied. This is a design: there is no `Suggested.lean`, and
elaboration is not available (this lane does not elaborate).

## Verification of the previous repair

| Round-13 finding | Repaired passage | Assessment |
| --- | --- | --- |
| F01 (P3): §4.5's flat-resolution route used three facts no bullet stated | §4.5 new first bullet (line 1363): "the functor `N ↦ N ⊗_{Aᵉ} F` on bimodules, and … `M ⊗_{Aᵉ} −` on left `Aᵉ`-modules, are `k`-linear, right exact … and commute with arbitrary direct sums, each being a left adjoint"; flatness bullet (line 1376): "Projective left `Aᵉ`-modules are flat too, as direct summands of free ones"; route (line 1390): "Each `− ⊗_{Aᵉ} P_j` and `− ⊗_{Aᵉ} F_j` is right exact (first bullet) and preserves injective maps" | **Repaired.** The fourth input the repair added on its own (`Tor_0` needs right exactness in the second variable, `leftDerivedZeroIsoSelf`) is correct: the pinned declaration requires `[F.Additive] [PreservesFiniteColimits F]`. The bullet numbers in the route paragraph ("fifth", "sixth") match the list. |

Every passage the repair added or changed was put through the adversarial pass (rows marked "new").
The repaired pattern (a route input no bullet or pin states) was looked for in the rest of the
design, by reading each *Needs:* line against its statement: one further instance, R01.

## Verified sound

### Principles and shape

- **General library.** `k` is an arbitrary commutative ring in all 37 targets; flatness,
  `k`-projectivity and smoothness are per-target hypotheses, each with a negative control
  (`ℤ[x]/(px)` in §4.5, `ℤ[1/2]` and the inseparable extension in §7.6, `ℚ[x]/(x²)` in §7.2).
- **No re-planning; one direction of supply.** DGAInfinity (Layers 0, 1, 8 at its README lines 263,
  293, 520), DerivedModuleAlgebra (§0.K.1 line 649, §0.5 line 1339), NoncommutativeGeometry,
  BanachAlgebras (Layer 6, line 1379) and ZigzagPreprojective (Layer 7, line 1047) are on main;
  DerivedDeRhamCohomology, IntegralIwasawaTheory, LanglandsParameterStacks,
  KTheoryFiniteLocalFields, EulerSystemsAndKolyvaginSystems and RefinedTraceMethods are earlier in
  the merge order. None is on the never-cite list.
- **Hygiene.** One scan of the README for LaTeX delimiters, `set_option`, pull-request numbers,
  round labels, machine paths, HTML anchors, "so far", "checkpoint", "handoff", "optional",
  "deferred", "for later", "to be checked", "currently": no match. No algorithm; no sorry'd data
  (no Lean file). No locator is flagged unverified by the author.
- **Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
  build, eight layers each ending with Examples and Dependencies, Downstream consumers, Worked
  examples, References. Every numbered subsection has a *Needs:* line; every definition (§§1.1,
  1.2, 2.1, 2.2, 3.3, 3.5, 4.1, 4.2, 4.5, 5.1, 6.1, 7.1, 7.3, 7.4, 7.5, 8.2, 8.3) has at least three
  Checks. No backticked name is presented as this roadmap's own.
- **Organisation.** Layers are named by their mathematics and ordered by their *Needs:* lines (§2.1
  needs §1.1; §3.5 needs §2.2; §4.3 needs §1.2; §5.4 needs §4.4; §6.1 needs §5.1; §7.5 needs §§6.2
  and 6.4(a); §8.4 needs §§7.1, 7.4, 7.5). The README nowhere says it follows a source.

### Adversarial table

`E_ij` are matrix units. Values computed this round for the repaired passages, the fifteen sampled
targets and the headlines.

| Statement | Instances tried and values computed | Result |
| --- | --- | --- |
| 4.5 right exactness, both variables (new) | Adjunction actions: `(e·(e′·φ))(n) = φ(n·ee′) = ((ee′)·φ)(n)`, left; `((φ·e)·e′)(f) = φ(ee′f) = (φ·(ee′))(f)`, right. `k = A = ℤ`, `F = ℤ/p`: `ℤ/p --0--> ℤ/p --id--> ℤ/p → 0`, kernel of the first map `ℤ/p`. `(Π_ℕ ℤ) ⊗ ℚ → Π_ℕ ℚ` misses `(1, 1/2, 1/3, …)`. | holds |
| 4.5 free bimodule and the swap (new) | Right structure on `Aᵉ`: `(x ⊗ op y)·(a ⊗ op b) = bx ⊗ op(ya)`; `τ` of it is `ya ⊗ op(bx) = (y ⊗ op x)(a ⊗ op b)`. So `Aᵉ` with the §4.1 right structure is the right regular module through `τ`, and `lid` applies. | holds |
| 4.5 `Tor_0` (new) | Pinned `leftDerivedZeroIsoSelf` (`LeftDerived.lean:359`) under `[F.Additive] [PreservesFiniteColimits F]` (line 338). `A = k = ℤ`, `M = ℤ`, `N = ℤ/p`: `Tor_0 = ℤ/p`. | holds |
| 4.5 projective ⇒ flat (new) | `(f ⊗ P)x = 0 ⇒ (f ⊗ Q)(id ⊗ i)x = 0 ⇒ (id ⊗ i)x = 0 ⇒ x = (id ⊗ r)(id ⊗ i)x = 0`. `ℤ/6`: `3² = 3`, `4² = 4`, `3 + 4 = 1`, `3·4 = 0`; `P = {0,3}`, two elements, `2 ≠ 6^r`; `N ⊗ P = 3N`. | holds |
| 4.5 flat resolutions, induction (new) | `n = 1`: five-lemma row `H₁(Q) = 0, H₁(M), H₀(L), H₀(Q), H₀(M)` with maps epi (`0 → 0`), ?, iso, iso, iso. `n ≥ 2`: `H_n(Q) = 0, H_n(M), H_{n−1}(L), H_{n−1}(Q) = 0, H_{n−1}(M)` with epi, ?, iso (induction on `L`), iso, iso (induction on `M`). `ℤ/p`, `F_• = [ℤ → ℚ]`: `H₁ = ker(ℤ/p → 0) = ℤ/p`. | holds |
| 4.5 wrong-side action (Check) | Applying `E₁₂ ⊗ 1` then `E₂₁ ⊗ 1` to `1` under `a m b`: `E₂₁E₁₂ = E₂₂`; the product `E₁₁ ⊗ 1` gives `E₁₁`. | Check correct |
| 1.1 (sampled) | `A = M = k`: `b_n = Σ_{i=0}^n (−1)^i = 0, 1, 0, 1` for `n = 1..4`; `HH₀ = k`, `HH₁ = k/k = 0`, `HH₂ = ker(id) = 0`. Without `d_n`: `b₁ = id`, `HH₀ = 0`. `Mat₂`: `b(E₁₂ ⊗ E₂₁) = E₁₁ − E₂₂`; with `m a_n` in the last face `b₁ = 0`. | holds |
| 1.2 (touched by 1.1's convention) | `A = M = k`: `δ^n = Σ_{i=0}^{n+1}(−1)^i = 0, 1, 0` for `n = 0, 1, 2`. Variant sign: `a(bm − mb) − (abm − mab) − (am − ma)b = 2(mab − amb)`; at `m = E₁₁`, `a = E₁₂`, `b = E₂₂`: `mab = E₁₂`, `amb = 0`. | holds |
| 1.3 (sampled) | Last face under `φ`: `φ(a_n)·n ⊗ φ(a₁) ⊗ ⋯` on both sides, since `a·n = φ(a)n` in `φ*N`. Cochains: `(f∘φ^{×n})` of `δ⁰`: `φ(a₁) f(φ(a₂),…)`, the `φ*N` action. `φ = id`: identity. | holds |
| 1.4 (sampled) | Flat: `− ⊗ A^{⊗n}` exact when `A^{⊗n}` is flat; `k = ℤ`, `A = ℤ[x]`: `A^{⊗2} = ℤ[x,y]` free. Projective: `Hom_k(A^{⊗n}, −)` exact. `A = ℚ` over `ℤ`: flat, not projective, `Hom_ℤ(ℚ, ℤ) = 0 → Hom_ℤ(ℚ, ℤ/p) = 0`, no control available there; the two hypotheses are stated separately. | holds; R01 on the inputs |
| 1.5 (sampled) | `d_n`: `a_n(rm) = r(a_n m)` needs `R` commutative. Wrong action on the first algebra factor: `b(1 ⊗ x ⊗ 1) = x ⊗ 1 − 1 ⊗ x + 1 ⊗ x = x ⊗ 1`, action on `b(1 ⊗ 1 ⊗ 1) = 1 ⊗ 1` gives `1 ⊗ x`. `Mat₂`: `b(E₁₁E₁₂ ⊗ E₂₁) = E₁₁ − E₂₂`, `E₁₁·(E₁₁ − E₂₂) = E₁₁`. | holds |
| 3.1 (sampled) | `HH₀ = M/im b₁`, `b₁(m ⊗ a) = ma − am`. `E₁₂ = E₁₂E₂₂ − E₂₂E₁₂`; `E₁₁ − E₂₂ = [E₁₂, E₂₁]`: trace-zero matrices. `Mat₀ = 0`: `HH₀ = 0`, `0 → k` not bijective for `k ≠ 0`. | holds |
| 3.2 (sampled) | `δm(a) = am − ma`, `B⁰ = 0`. `E₁₁E₁₂ − E₁₂E₁₁ = E₁₂ ≠ 0`. Commutative `A = M`: `Z⁰ = A`. | holds |
| 3.3 (sampled) | `(a, Da)(b, Db) = (ab, aDb + Da·b)`; unit: `D(1) = 2D(1)`. `δE₁₁(E₁₂) = E₁₂E₁₁ − E₁₁E₁₂ = −E₁₂`; `innerDerivation E₁₁ (E₁₂) = E₁₁E₁₂ − E₁₂E₁₁ = E₁₂`: opposite signs, as stated. `k[x]`: `Inn = 0`, `HH¹ = k[x]∂`. | holds |
| 3.4 (sampled) | `b(1 ⊗ a ⊗ c) = a ⊗ c − 1 ⊗ ac + c ⊗ a`. `k[x]/(x²)`: `Ω¹ = R dx/(2x dx)`: `𝔽₂`: dimension `2`; `ℚ`: `R/(x)`, dimension `1`; Koszul-type resolution gives `HH₁ = R/(2x)`, the same. `ℤ`, `𝔽_p`: `C_n = 𝔽_p`, `b₂ = 1` onto `C₁`, `HH₁ = 0 = Ω¹`. | holds |
| 3.5 (touched by 3.3) | Unit: `(1,u)(a,m) = (a, m + ua + f(1,a))`, `f(1,a) = f(1,1)a` from `δf(1,1,a) = 0`, so `u = −f(1,1)`. `k[x]/(x²)`, `f(x,x) = 1`: `δf` vanishes on the four triples with two `x`; `t² = (0,1)`, `t³ = (0, x·1) = 0`. `(a,m) ↦ (a, m + g(a))`: target cocycle `f + g(aa′) − ag(a′) − g(a)a′ = f − δg`. | holds |
| 4.1 (sampled) | `(E₁₂ ⊗ op E₂₁)·E₂₂ = E₁₂E₂₂E₂₁ = E₁₁`; reversed `E₂₁E₂₂E₁₂ = 0`. `m ⊗ x = mx ⊗ 1 = xm ⊗ 1` in `M ⊗_{Aᵉ} A`, so `M ⊗_{Aᵉ} A = M/[A,M]`. `A = k`: `Aᵉ = k`. | holds |
| 4.2 (sampled) | `B₀`: `hμ + b′h = 1 ⊗ a₁a₂ + a₁ ⊗ a₂ − 1 ⊗ a₁a₂`. `B₁`: `b′h = a₀⊗a₁⊗a₂ − 1⊗a₀a₁⊗a₂ + 1⊗a₀⊗a₁a₂`, `hb′ = 1⊗a₀a₁⊗a₂ − 1⊗a₀⊗a₁a₂`, sum `a₀⊗a₁⊗a₂`. `A = k`: `b′_n = 1, 0, 1`, augmented complex exact. `h(x·(1⊗1)) = 1⊗x⊗1 ≠ x⊗1⊗1`. | holds |
| 5.1, 5.2, 5.4 (used by 6.2 and 7.6) | Reversed cup: defect at `(E₂₁, E₁₂)`, `x = E₁₁`, `g = id`: `E₁₂E₂₁E₁₁ − E₁₂E₁₁E₂₁ + E₂₁E₁₂E₁₁ − E₂₁E₁₁E₁₂ = E₁₁ − 0 + 0 − E₂₂`. Leibniz at `(1,1)`: both sides `af(b)g(c) − f(ab)g(c) + f(a)g(bc) − f(a)g(b)c`. `f̃_q ≫ g = (−1)^{pq} f ∪ g` on `1 ⊗ a₁ ⊗ ⋯ ⊗ 1`. | holds |
| 6.1 (sampled) | `n = 0`: `m{Θx}(sa) = s(xa) − s(ax)`, `Θ(δx)(sa) = s(ax − xa)`: sign `−1 = (−1)^{0+1}`. `n = 1`: `[m,Θf] = s(f(a)b + af(b) − f(ab))`: `+1`. `n = 2`: `m{Θf} = s(f(a,b)c − af(b,c))`, `Θf{m} = s(f(ab,c) − f(a,bc))`, sum `= −Θ(δf)`. `f(a,b) = a∂b`: `δf = ab∂c`; model without `(−1)^q` gives `s(2ac∂b − ab∂c)`, `2` at `(1,x,1)`. Arity: a word of length `m` has degree `−m`; degree `n − 1` into degree `−1` forces `m = n`. `(1,0)` cup: `−s(f(a)y)`, `(−1)^{1·(0−1)} = −1`. | holds |
| 6.2 (sampled, headline) | `(1,1)`: `δf∘g = g(a)f(b) − f(g(a)b) + f(g(a))b + af(g(b)) − f(ag(b)) + f(a)g(b)`; minus `δ(f∘g)` plus `f∘δg` leaves `g(a)f(b) + f(a)g(b)`. `(1,0)`: twelve terms reduce to `yf(a) − f(a)y`. `(0,1)`: `g(a)x − xg(a)`; `Mat₂(ℤ)`: `−E₁₂`. `k[x]`: `δ(∂^{[2]})(x,x) = 0 − 1 + 0`, `(∂∪∂)(x,x) = 1`. Ginz05 (6.6.3) at `(x,x)`: `2 = −2`. Brace relation at degrees `(0,0)`: `Θ(δf∘g + f∘δg − δ(f∘g)) = Θ(f∪g + g∪f)`. | holds |
| 6.4 (used by 7.5, 7.6) | `π∘ε = n!`: `2 dx∧dy` at `n = 2`. `k[x]/(x²)`: `Ω² = 0` (one generator), `HH₂ = xR` over `ℚ`, `R` over `𝔽₂`. | holds |
| 7.2 (sampled) | Pinned theorem (`UniversalCoefficient/Basic.lean:212`): terms projective, `H_j` projective for `j < n` ⇒ bijective in degree `n`; applied in degree `i ≤ n` since `j < i ≤ n ⇒ j < n`. `ℚ[x]/(x²)`: `R ⊗_{Rᵉ} −` gives differentials `0, 2x, 0`; `HH₁ = R/(x)`, `HH₂ = xR`; `HH²(R,ℚ) = ℚ = Hom_R(xR,ℚ)`, `h₂(f)(xe₂) = xf(e₂) = 0`. `𝔽₂`: differentials `0`, all `HH_j = R`. `ℤ`, `𝔽_p`: `δ^i = 0, 1, 0, 1`; `HH⁰ = M`, `HH^i = 0`. | holds |
| 7.5 (sampled) | `n = 2`: `af(b,c) − af(b,c) − bf(a,c) + bf(a,c) + cf(a,b) − f(a,b)c = 0`. `det(D_j(r_i)) = Σ_σ sgn(σ) Π_i D_{σ(i)}(r_i)`, the value of `Σ sgn(σ) D_{σ(1)}∪⋯∪D_{σ(n)}`. `δ(D₁D₂)(a,b) = −(D₁aD₂b + D₂aD₁b)`; characteristic `2`: the determinant. Pairings with `1⊗x⊗y − 1⊗y⊗x`: `1 − (−1) = 2` and `1 − 0 = 1`. Injectivity: `⟨ξ⟩(r) = τ_n(ξ)(dr₁∧⋯∧dr_n)` and the `dr_I` span `Ω^n`. | holds |
| 7.6 (sampled, headline) | Well-definedness of `Ψ_n`: `τ_n(D₁∧⋯∧D_n)(r₀dr_I) = r₀det(D_j(r_i)) = h_n[D₁∪⋯∪D_n](ε^cl_n(r₀dr_I))`. `ℤ[1/2]`: `C^n = ℤ[1/2]`, `δ = 0, 1`, `HH^n = 0 = T^n` for `n ≥ 1`. Inseparable `R`: Hom-differentials `0`, `2a = 0`; `HH² = R`, `T² = ⋀²(R∂) = 0`. `𝔽₂[x,y]`: `[⟨∂_x,∂_y⟩] = 2Ψ₂ = 0`, `Ψ₂` pairs to `1`. `k[x,x⁻¹]`: `Der = R∂_x = R·x∂_x`. (5): `Ω^n = 0` for `n > d`. | holds under smooth, `k`-projective and the gap |
| 7.3 (used by 7.6) | Pinned `pairingDual_ιMulti_ιMulti`: `det (fun i j ↦ f j (v i))`, the README's `det(f_j(v_i))`. `R²`: `1`; `e₂*∧e₁*`: `−1`. | holds |
| 8.4, 8.5 (headlines) | `h_n[∂_I](ε(dX_J)) = det(∂_{i_a}X_{j_b}) = δ_{IJ}`. `(X₁², X₂)`: `det = 2X₁`. `m = 0`, `g = 2`: `2`. No gap used: §8.4 needs §6.4(a) only. | holds |

For the targets not in this table (§§2.1, 2.2, 3.6, 4.3, 4.4, 5.3, 6.3, 7.1, 7.4, 8.1–8.3) the round-13
table carries computed values and their text is unchanged since (the diff of the last two heads
touches only §4.5, two contract entries, the Layer 4 Dependencies and the Weibel94 reference).
While reading the whole README I recomputed, with no discrepancy: the kernel description of `D_n`
in §2.1, the `ℤ/4 → 𝔽₂` case of §3.6 (`δ¹ = 1` on `𝔽₂`), the `ℤ` example of §4.4, the three Checks
of §7.4 and the `j = 2` chain-map identity of §8.3.

### Sources: the seeded sample

No locator is flagged unverified by the author. Read this round in the cached extractions:

| Target | Locator read | Outcome |
| --- | --- | --- |
| 1.1 | Ginz05 lines 963–976 | The boundary with the wrap-around last term `(−1)^n a_n m`; the identification of `M ⊗_{Aᵉ} A^{⊗n}`. Supports the statement. |
| 1.3, 1.4 | Loday98 §1.1, Weibel94 §9.1, CE56 Chapter IX | Not readable (uncertified); the statements were recomputed instead. |
| 1.5 | Ginz05 lines 2160–2166 | The centre acts through the coefficient factor; for commutative `A` an `A`-module structure. |
| 3.1 | Ginz05 lines 941–953, 1001–1030 | Commutator quotient and `HH₀`; the trace argument with the two commutator identities. |
| 3.2 | Ginz05 lines 1066–1069 | Degree-zero cocycles are the central elements. |
| 3.3 | Ginz05 lines 398–411, 1075–1085 | Derivations, inner derivations with `ad m = ma − am` (line 404, as the conventions say), the four-term exact sequence. |
| 3.4 | Ginz05 lines 1914–1926 | Kähler differentials as the quotient by degree-two boundaries; `Ω¹ ≅ HH₁`. |
| 4.1 | Ginz05 lines 751–752, 934–947 | Left `Aᵉ`-action `a₁ m a₂`; bimodules as left or right `Aᵉ`-modules; `M ⊗_{Aᵉ} A`. |
| 4.2 | Ginz05 lines 747–782; HKR62 lines 414–447 | Bar complex, homotopy and its check on two factors; the resolution `Y`, its right-linear homotopy and `S`-projectivity for `K`-projective `R`. |
| 6.1 | Ginz05 lines 1351–1375 | Composition (6.6.2) with sign `(−1)^{(i−1)(q−1)}`, the bracket of line 1373. |
| 6.2 | Ginz05 lines 1058, 1368, 1379 | The coboundary, identity (6.6.3) (which the README corrects) and Proposition 6.6.4. Ger63 and Loday98 not readable. |
| 7.2 | HKR62 lines 301–330 | Lemma 4.1: `Tor_i` projective for `i < k` gives `h_i` bijective for `i ≤ k`. Index range agrees. |
| 7.5 | Ginz05 lines 2101–2156; HKR62 lines 509–521; AV20 lines 237–243 | The alternation map and `π∘alt = p!`; weakly alternating forms; the factorial composite. |
| 7.6 | HKR62 lines 301, 495, 522–552, 569–582; AV20 line 70; Ginz05 lines 96–97, 2086–2088 | Theorem 5.1 under `K`-projectivity; the product formula; the deduction to Theorem 5.2 over a perfect field; the characteristic-two example; Proposition 1.2 over any commutative `k`; Ginzburg's standing field and Theorem 9.1.3. |

All nine cited works have exactly one manifest entry; the Weibel94 entry lists §2.6 since the last
repair and its `cited_for` contains `§4.5`. `sources.toml` was not changed by this review and no
`needs-references.toml` was written.

### Pinned declarations

Every Mathlib and Tau Ceti declaration the README names was searched at the pins this round (about
150 names); all resolve. Opened for the repaired passages and the sample:
`Mathlib/CategoryTheory/Abelian/LeftDerived.lean:359` (`leftDerivedZeroIsoSelf`, hypotheses at line
338) and `:109` (`isoLeftDerivedObj`); `Mathlib/RingTheory/Flat/Basic.lean:121`, `:173`
(`of_retract`), `:234`; `Mathlib/CategoryTheory/Abelian/DiagramLemmas/Four.lean:138`;
`Mathlib/Algebra/Homology/HomologySequenceLemmas.lean:56`;
`Mathlib/CategoryTheory/Abelian/Projective/Resolution.lean:92`, `:180`;
`Mathlib/CategoryTheory/Abelian/Projective/Ext.lean:139`–`286`;
`Mathlib/Algebra/Homology/Opposite.lean:428` (`Homotopy.op`);
`Mathlib/RingTheory/Smooth/Basic.lean:71` (the field `projective_kaehlerDifferential`), `:111`;
`Mathlib/RingTheory/Smooth/Flat.lean:57`; `Mathlib/RingTheory/Extension/Cotangent/Basic.lean:521`;
`Mathlib/LinearAlgebra/ExteriorPower/Pairing.lean:64`, `:71`; `Basis.lean:29`, `:95`, `:162`,
`:174` (`finrank_eq` under `[Nontrivial R]`, as the README says), `:182`;
`Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:97` (`Rep.Tor`);
`TauCeti/LinearAlgebra/TensorProduct/Balanced/Basic.lean:184` (`liftEquiv`), `Unit.lean:48`, `:122`,
`OuterFactors.lean:88`, `Finsupp.lean:69`;
`TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean:212`, `:234`;
`TauCeti/RingTheory/HochschildCohomology/Coboundary.lean:226`–`396`;
`TauCeti/RingTheory/Derivation/Bimodule.lean:41`, `:84`, `:101`;
`TauCeti/Algebra/Homology/AInfinity/Algebra/Hochschild/Basic.lean:75`, `:86`, `:166`,
`Complex.lean:49`, `:87`, `Cohomology.lean:80`, `:197`;
`TauCeti/LinearAlgebra/TensorCoalgebra/Brace.lean:94`, `:160`, `:340`;
`TauCeti/RingTheory/KoszulComplex/Basic.lean:219`, `Regular.lean:140`. By object: neither pin has a
flatness or projectivity instance for `PiTensorProduct` or `TensorPower` (R01), and neither has
`toExteriorBidual` (see below).

### Duplication, citations and overlaps

Resolved now, on main and at the open heads the roadmap tool serves:

| Citation | Where it resolves | Agreement |
| --- | --- | --- |
| RefinedTraceMethods §1.1 | "1.1 Cyclic objects and the cyclic bar", target "The cyclic enhancement of supplied derived Hochschild chains" | `k`-flat: the totalisation of the cyclic bar; "For A k-flat, HH(A/k) is the homology of `C_•(A/k)`"; `HH₂(𝔽_p/ℤ) ≅ 𝔽_p`. |
| RefinedTraceMethods §1.9 | "1.9 Antisymmetrization and the smooth HKR comparison", target "The antisymmetrisation map and the HKR projection" | `ε_n` (summed over `σ⁻¹`, the same chain), `π_n`, `π_nε_n = n!`, `ε₁` inverse to `a₀⊗a₁ ↦ a₀da₁`; flat or derived; a smooth quasi-isomorphism only for `ℚ ⊆ k`. |
| RefinedTraceMethods §1.10 | "1.10 Derived HKR, circle tensors and a nonflat example" | `HH_{2n}(𝔽_p/ℤ) = 𝔽_p`. |
| KTheoryFiniteLocalFields §4.0 | "4.0 Genuine equivariant and cyclic foundations", target "Cyclic homology foundations" | derived chains on DGAInfinity Layer 8, the smooth HKR comparison stated without naming the map. |
| EulerSystemsAndKolyvaginSystems §6.1 | "6.1 Exterior biduals of Selmer modules" | "This map is an isomorphism for finite projective X". |
| IntegralIwasawaTheory §12.6 | "12.6 Rubin's lattice and the higher-rank consequence away from 2" | owns `exteriorBidual` and `toExteriorBidual` in `TauCeti.StarkSystems`, arguments `R, r, M`, by flipping `pairingDual`. |
| LanglandsParameterStacks §1.17; DerivedDeRhamCohomology Layer 2 | headings present | scope deferrals. |
| DGAInfinity Layers 0, 1, 8; DerivedModuleAlgebra §§0.K.1, 0.5; NoncommutativeGeometry N1; BanachAlgebras Layer 6; ZigzagPreprojective Layer 7 | main | headings present; Layer 8 lists chains, cochains, cup product, braces, bracket and `[m,−]`. |

The worker's resolver lead `TauCeti.StarkSystems.toExteriorBidual` (README §7.3 and the contract)
is not a pinned declaration and the README does not present it as one: it is the carrier that
IntegralIwasawaTheory §12.6 owns as a target, cited under that roadmap's contract. No finding.

Ownership by object, searched at main and at the open heads: "polyvector" and the HKR theorem by
name have no other match; the bar resolution of an algebra over its enveloping algebra is stated
by no other roadmap (the other matches are bar resolutions of groups); `HH²` and square-zero
extensions appear only in LanglandsParameterStacks §1.17, which the scope defers to.
CyclicHomologyLieHomologyAndQuasiFreeAlgebras §4.1 characterises quasi-free algebras by
`Ext²_{Aᵉ}(A,M) = 0` in Mathlib's `Ext` directly and states no Hochschild complex, bar resolution
or `HH²` classification.

`scratch/overlaps.md`: no other pull request changes this roadmap, no dropped id, no id only an
open revision defines, no closest roadmap by results. There is no `HochschildHomologyAndHKR` folder
on main, and the name is in neither the open-pull-request list nor the board-packages index: no
second copy.

Overlap check: read CyclicHomologyLieHomologyAndQuasiFreeAlgebras, SpectralSequencesAndConvergencePartII, RefinedTraceMethods (open), DGAInfinity, NoncommutativeGeometry, DerivedModuleAlgebra (main); shared: antisymmetrisation and derived chains, owners RefinedTraceMethods §1.9 and KTheoryFiniteLocalFields §4.0, imported; braces, bracket and DG Hochschild cochains, owner DGAInfinity Layers 0 and 8, imported; Koszul complex and commutative square-zero extensions, owner DerivedModuleAlgebra §§0.K.1 and 0.5, imported or cited; the normalised quotient over `ℂ`, owner NoncommutativeGeometry N1, cited; cyclic homology and quasi-free algebras, owner CyclicHomologyLieHomologyAndQuasiFreeAlgebras, not stated here. Nothing has two owners.

### Supplier order

```text
candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 241 roadmaps, 2247 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Edges inside the roadmap run forward only, with the one exception of R01
(§1.4 uses a fact stated in §4.2). §8.4 needs §6.4(a), not §6.4(d), §7.2 or §7.6, so the polynomial
case does not use the gap.

### Gap

`smooth-hkr-antisymmetrisation` (supplier RefinedTraceMethods, §1.9). Precise: one statement with
its hypotheses (every commutative `k`, every smooth commutative `A`, every `n`). Minimal:
RefinedTraceMethods §1.9 at its head has `π_nε_n = n!`, the degree-one case and a smooth
quasi-isomorphism only for `ℚ ⊆ k`, which give nothing when `n! = 0` (`𝔽₂[x,y]`, `n = 2`);
KTheoryFiniteLocalFields §4.0 asserts an isomorphism without naming the map; §8.4 here covers
polynomial algebras only. Declared in both places with the same slug: README lines 695–702 and the
plan's `gaps` (`supplier` RefinedTraceMethods, `section` §1.9, `neededBy` 6.4 and 7.6); the plan's
targets 6.4 and 7.6, and no other, list `gap:smooth-hkr-antisymmetrisation`.

### Headline theorems and Lean

Headlines of the summary: normalisation over every `k` (2.1, 2.2); the low degrees and the `HH²`
classification (3.1–3.6); `HH^n ≅ Ext^n` for `k`-projective `A` and `HH_n ≅ Tor_n` for `k`-flat `A`
(4.4, 4.5); cup equals Yoneda up to sign (5.4); the homotopy formula and graded commutativity
(6.2); the cohomological HKR theorem with `[⟨D₁,…,D_n⟩] = n!·Ψ_n` (7.6); polynomial algebras (8.4,
8.5). There is no `Suggested.lean` at the design stage, so the padding probe, the binder audit and
the import check do not apply yet.

### Copyright and arrangement

- **Wording.** 21 passages set beside the sources at their locators: Ginz05 at lines 398–411,
  747–782, 934–976, 1001–1030, 1055–1069, 1075–1106, 1335–1380, 1914–1926, 2086–2088, 2101–2166,
  2187–2197; HKR62 at lines 301–330, 410–447, 479–495, 509–552, 569–582; AV20 at lines 70–74 and
  237–243, against §§1.1, 1.5, 3.1–3.5, 4.1, 4.2, 4.5, 5.1, 6.1, 6.2, 7.2, 7.5, 7.6. Nothing is
  shared beyond formulae and standard names; the §4.5 route by connecting maps in the coefficient
  variable follows no readable source.
- **Arrangement.** Ginz05 has the largest share (46 of 126 source mentions). Its sections run §3
  derivations, §4 bar complexes, §5 Hochschild theory defined as `Tor` and `Ext` with the low
  degrees, §6 Gerstenhaber structures, §8 Kähler differentials, §9 HKR. The roadmap builds the
  complexes from simplicial modules, normalises before the low degrees and puts both before the
  bar resolution; Layers 2, 6 and 8 have no counterpart section. No one-to-one run.
- **Reuse.** No table, figure, exercise list or data set is taken from a source.

Source independence: 21 passages compared with 3 sources (Ginz05, HKR62, AV20), none shared; largest share Ginz05, 46 of 126 locators; contents compared with Ginz05: independent. Loday98, Weibel94, CE56, Ger63 and Mat86 could not be read (settled uncertified).

## Not verifiable

- Loday98, Ger63, Weibel94, CE56, Mat86: settled uncertified; their section and theorem numbers
  were not checked against the texts. In the sample this covers every locator of 1.3 and 1.4, the
  Loday98 locators of 1.1, 3.1, 3.2, 3.4, 4.2 and 6.2, the Weibel94 locators of 1.1, 3.3 and 4.2,
  the CE56 locators of 1.1 and 3.3, the Ger63 locator of 6.1 and 6.2, and the Weibel94 §2.6 locator
  the last repair added, whose statement (left adjoints are right exact) was recomputed above.
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
- **Misprint** in Ginz05 at §3.1, p. 9 (line 404): the source says `ad m` is a map `M → M` giving a derivation of `M`, for `m ∈ m`; it should be a map `A → M`, a derivation from `A` to `M`, for `m ∈ M`; affects nothing.
- **Gap** in Ginz05 at §9.3, proof of Theorem 9.1.3, p. 46 (lines 2193–2196): the source says the diagonal ideal of `A ⊗ A` is generated by a regular sequence when `X` is smooth; it should be claimed only after localising at points of the diagonal; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "dfc5b7956ccc0cf4fefc47a78b5956547f46415b", "job": "REV-DESIGN-HochschildHomologyAndHKR~14", "model": "fable", "worker": "chris-x89"} -->

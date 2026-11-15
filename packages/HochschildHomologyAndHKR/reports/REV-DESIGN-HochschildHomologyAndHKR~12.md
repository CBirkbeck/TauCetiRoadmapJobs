<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13788#issuecomment-6899946258 -->
Review (claude) of f0240b7

Verdict: needs_changes

1. **F01** (P3) `HH_n ≅ Tor_n` is stated for `k`-projective `A` only; it holds for `k`-flat `A`

   **Location.** `packages/HochschildHomologyAndHKR/design/README.md` §4.5 (line 1322): "for `A`
   projective as a `k`-module `HH_n(A,M) ≅ Tor_n^{Aᵉ}(M,A)`, naturally in `M`"; the same restriction
   in the Generality paragraph (lines 204–206) and in plan target 4.5.

   **Claim.** The identification with `Tor` needs `A` projective over `k`.

   **Witness.** `k = ℤ`, `A = M = ℚ[x]` (flat, not projective): `C_n = ℚ[x]^{⊗_ℚ(n+1)}`, so `HH_n` is
   `ℚ[x], ℚ[x], 0, …`; `Aᵉ = ℚ[x,y]` and `Tor_n^{Aᵉ}(A,A)` is `ℚ[x], ℚ[x], 0, …`. §6.3 already uses
   flatness alone.

   **Repair.** In §4.5 state the homology clause for `A` flat as a `k`-module, keeping §4.4 (`Ext`) for
   `k`-projective `A`. Add to §4.5's API: for a bimodule `M`, `Tor_n^{Aᵉ}(M,F) = 0` for every flat
   left `Aᵉ`-module `F` and `n ≥ 1`, and `Tor_n^{Aᵉ}(M,N)` is the homology of `M ⊗_{Aᵉ} F_•` for every
   resolution `F_• → N` by flat modules (dimension shifting from the projective case). Route: for
   `k`-flat `A`, `A^{⊗n}` is `k`-flat (§4.2, first API bullet), so `B_n(A) ≅ Aᵉ ⊗[k] A^{⊗n}` is a flat
   `Aᵉ`-module, and §4.2's quasi-isomorphism holds over every `k`. Add the witness above as a Check
   (a flat, non-projective `A` with `HH₁ ≅ Tor₁ ≅ ℚ[x]`), and change "stated for `A` projective as a
   `k`-module" in the Generality paragraph to "`Ext` for `k`-projective `A`, `Tor` for `k`-flat `A`".
   Tested on the instance: the repaired statement gives `HH_n(ℚ[x],ℚ[x]) ≅ Tor_n^{ℚ[x,y]}(ℚ[x],ℚ[x])`
   over `ℤ`, both `ℚ[x]` for `n ≤ 1` and `0` above (`ℚ ⊗_ℤ ℚ = ℚ`, so the chains are those of
   `ℚ[x]` over `ℚ`; on the other side the Koszul complex of `x − y` on `ℚ[x,y]`). The statement as
   written is true; the finding is that its hypothesis is stronger than needed, shown by the instance.

One finding, R01 (P3): a hypothesis stronger than the statement needs, with an instance where the
statement holds without it and a tested repair. No P1 or P2 finding. Everything else was checked
and found sound; the declared gap `smooth-hkr-antisymmetrisation` (supplier RefinedTraceMethods
§1.9), used only in §6.4(d) and §7.6, is precise, minimal and declared in both files.

Files reviewed: `packages/HochschildHomologyAndHKR/design/README.md` (2138 lines, 8 layers, 37
targets), `packages/HochschildHomologyAndHKR/design/plan.json`,
`packages/HochschildHomologyAndHKR/sources.toml`. Pins read from the roadmap repository's
`lake-manifest.json`: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (unchanged since round 11); roadmap
main at `1a19c9fc`. No maintainer notes were supplied. This is a design: there is no
`Suggested.lean`, and elaboration is not available (this lane does not elaborate).

## Verification of the previous repair

| Round-11 finding | Repaired passage | Assessment |
| --- | --- | --- |
| Finding F01 of round 11, priority 3: a section written with `x` where the element of the extension is `t` | README lines 1127–1129 (§3.5 Checks): "An algebra section would send `x` to some `(x,c) = t + c t²` with `c ∈ k`, whose square is `t² ≠ 0` although `x² = 0`"; plan target 3.5, test `twisted_dual_numbers`, carries the same witness | **Repaired.** `(x,c) = (x,0) + c·(0,1)`, `t² = (x², x·0 + 0·x + f(x,x)) = (0,1)`, so `(x,c) = t + ct²`; `(x,c)² = (0, x·c + c·x + 1) = (0,1) = t²`, since `x` acts by `0` on `k`. |

The repair changed one Check and one plan test (the diff of the two heads touches nothing else in
the design). The pattern (an element of `A` written where an element of `A ⊕_f M` is meant) was
searched for in the rest of the README and plan: §3.6 third case (`t + c t²`), the
`twisted_nonassociative` and `twisted_unit` Checks, the commutator Check on `k[x,y]` and the Worked
example all write elements of the extension as pairs or in `t`. No other instance.

## Verified sound

### Principles and shape

- **General library.** `k` is an arbitrary commutative ring in all 37 targets; flatness (§§1.4,
  6.3, 6.4), `k`-projectivity (§§1.4, 4.2, 4.4, 4.5, 5.4, 7.6) and smoothness (§§6.4(d), 7.6) are
  per-target hypotheses, each with a negative control; R01 is the one hypothesis found stronger
  than needed.
- **No re-planning, one direction of supply.** DGAInfinity, DerivedModuleAlgebra,
  NoncommutativeGeometry, BanachAlgebras, ZigzagPreprojective are on main; DerivedDeRhamCohomology,
  IntegralIwasawaTheory, LanglandsParameterStacks, KTheoryFiniteLocalFields,
  EulerSystemsAndKolyvaginSystems, RefinedTraceMethods are at merge-order lines 23, 29, 80, 90,
  104, 331. None is on the never-cite list.
- **Hygiene.** One scan of the README for LaTeX delimiters, `set_option`, `lemma`, pull-request
  numbers, round labels, machine paths, HTML anchors, "so far", "current", "removed", "optional",
  "deferred", "for later", "follows <a source>": no match. No algorithm; no sorry'd data (no Lean
  file).
- **Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
  build, eight layers each with Examples and Dependencies, Downstream consumers, Worked examples,
  References. 37 `*Needs:*` lines for 37 numbered subsections. `plan.json` parses: 8 layers, 37
  targets, one gap.
- **Organisation.** Layers are named by their mathematics; the order is forced by the Needs lines
  (§2.1 needs §1.1; §3.5 needs §2.2; §4.3 needs §1.2; §5.4 needs §4.4; §6.1 needs §5.1; §7.5 needs
  §§6.2, 6.4(a); §8.4 needs §§7.1, 7.4, 7.5).

### Adversarial table

`E_ij` are matrix units. Values computed this round for the sampled targets, the headlines, the
repaired Check and R01.

| Statement | Instances tried and values computed | Result |
| --- | --- | --- |
| 1.1 (sampled) | Simplicial identities at the ends: `d₀s₀(m⊗a₁) = m·1⊗a₁`, `d_{n+1}s_n(m⊗…⊗a_n) = 1·m⊗…⊗a_n`. `A = M = k`: `b_n = Σ_{i=0}^n(−1)^i` = `0,1,0,1` for `n = 1,2,3,4`; `HH₀ = k`, `HH₁ = k/k = 0`, `HH₂ = ker 1 = 0`. Without `d_n`: `b₁ = id`, `HH₀ = 0`. `Mat₂`: `b(E₁₂⊗E₂₁) = E₁₁ − E₂₂`; with `m a_n` last: `ma − ma = 0`. `k[x]`: `π₁[1⊗x] = dx ≠ 0`. | holds |
| 1.4 (sampled) | Chains: `−⊗A^{⊗n}` exact for flat `A^{⊗n}`, or split sequences stay split. Cochains: `Hom_k(A^{⊗n},−)` exact for projective `A^{⊗n}`. `k = ℤ`, `A = 𝔽_p`: every bimodule sequence is `𝔽_p`-split, hence `ℤ`-split, so both sequences exist although `𝔽_p` is neither flat nor projective. `A = 0`: all complexes `0`. | holds |
| 3.2 (sampled) | `δm(a) = am − ma`, `B⁰ = 0`. `Mat₂`: `E₁₁E₁₂ − E₁₂E₁₁ = E₁₂ ≠ 0`. Commutative `A = M`: `HH⁰ = A`. `A = M = ℤ`: `Z⁰ = ℤ`. | holds |
| 3.3 (sampled) | `δE₁₁(E₁₂) = E₁₂E₁₁ − E₁₁E₁₂ = −E₁₂`; `innerDerivation E₁₁ (E₁₂) = +E₁₂`. Section `a ↦ (a,Da)`: product `(ab, aDb + Da·b)`, unit forces `D1 = 0 = 2D1 − D1`. `k[x]`: `Inn = 0`, `Der ≅ k[x]`. Exactness at `M`: `ker(m ↦ δm) = M^A = HH⁰`. | holds |
| 3.5 (repaired Check) | `k[x]/(x²)`, `f(x,x) = 1`: `t² = (0,1)`, `t³ = (x,0)(0,1) = (0, x·1) = 0`; `(x,c)² = (0,1)`; over `𝔽₂` the cross term `2c t³` is `0` already. Unit: `δf(1,1,a) = f(1,a) − f(1,1)a`, so `(1,u)(a,m) = (a, m + (u + f(1,1))a)`, `u = −f(1,1)`. | holds |
| 4.1 (sampled) | Left law: `(a⊗op b)(a′⊗op b′) = aa′⊗op(b′b)` acts by `aa′mb′b` both ways. Right law `m·(a⊗op b) = bma`: `b′(bma)a′ = (b′b)m(aa′)`. `Mat₂`: `(E₁₂⊗op E₂₁)·E₂₂ = E₁₂E₂₂E₂₁ = E₁₁`; reversed `E₂₁E₂₂E₁₂ = 0`. `M⊗_{Aᵉ}A → M/[A,M]`: `(ymx)⊗a ↦ [ymxa]`, `m⊗xay ↦ [mxay]`, equal in the quotient. `A = k`: `Aᵉ = k`. | holds |
| 4.2 (sampled) | `B₀`: `hμ + b′h = 1⊗a₁a₂ + a₁⊗a₂ − 1⊗a₁a₂`. `B₁`: `b′h + hb′` = five terms, sum `a₀⊗a₁⊗a₂`. `A = k`: `μ = 1`, `b′₁ = 0`, `b′₂ = 1`; exact at `B₀` (`ker μ = 0`) and `B₁` (`ker 0 = im 1`). `h(x·(1⊗1)) = 1⊗x⊗1 ≠ x⊗1⊗1`. `A = 0`: zero. | holds |
| 4.3 (sampled) | `φ(b′(1⊗a⊗b⊗1)) = aφ(1⊗b⊗1) − φ(1⊗ab⊗1) + φ(1⊗a⊗1)b`: `δ`, no sign. `n = 0`: `φ(b′(1⊗a⊗1)) = am − ma`. | holds |
| 4.5 (sampled; R01) | Balance: `m⊗(xa₀⊗…⊗a_{n+1}y) ↦ a_{n+1}ymxa₀⊗…` and `(ymx)⊗(a₀⊗…) ↦` the same. Faces: `i = 0` gives `a_{n+1}ma₀a₁⊗a₂…= d₀`; `i = n` gives `a_na_{n+1}ma₀⊗a₁…a_{n−1} = d_n`, sign `(−1)^n`. `Mat₂`: `E₂₁E₁₂ = E₂₂` against `E₁₁`. `A = k`: `M, 0, 0, …` on both sides. `ℤ → ℚ[x]`: `ℚ[x], ℚ[x], 0` on both sides without projectivity. | holds; R01 |
| 5.2 (sampled) | `f,g ∈ C¹`: `δ(f∪g)(a,b,c) = af(b)g(c) − f(ab)g(c) + f(a)g(bc) − f(a)g(b)c`; in `δf∪g − f∪δg` the terms `±f(a)bg(c)` cancel, leaving the same four. `x ∈ C⁰`: `δ(x∪g)(a,b) = axg(b) − xg(ab) + xg(a)b`. | holds |
| 5.3 (sampled) | Cocycle: `d^P f̃_q g = f̃_{q+1} d^Q g = 0`. `q = 0`: pinned `extMk_comp_mk₀` (`Projective/Ext.lean:234`) reads `(extMk f).comp (mk₀ g) = extMk (f ≫ g)`, no sign, so `s(p,0) = 1`. Degrees: `Ext X Y p`, `Ext Y Z q`, target `Ext X Z (p+q)`. | holds |
| 5.4 (sampled) | `μ f̃₀(a₀⊗…⊗a_{p+1}) = a₀f(a₁..a_p)a_{p+1}`. `p = 1`: `b′f̃₁ = −(a₀f(a₁)a₂⊗a₃ − a₀f(a₁)⊗a₂a₃)` and `f̃₀b′ = a₀a₁f(a₂)⊗a₃ − a₀f(a₁a₂)⊗a₃ + a₀f(a₁)⊗a₂a₃`, equal by Leibniz. `f̃_q ≫ g = (−1)^{pq} f∪g`. `(0,0)`: composition in `Z(A)`. | holds |
| 6.2 (headline) | `(1,1)`, `f = g = ∂` on `k[x]`: `−δ(∂²)(a,b) = 2∂a∂b = 2(∂∪∂)(a,b)`. Ginz05 (6.6.3) gives `δ(∂²) = −2∂a∂b` on the right: `2 = −2` at `(x,x)`. | holds |
| 6.4(a)–(c) | Cycle: the `d_n` term of `σ∘(cycle)` has sign `(−1)^n(−1)^{n−1} = −1` against the `d₀` term of `σ`. `π₂ε₂(dx∧dy) = 2dx∧dy`. | holds; (d) rests on the gap |
| 7.2 | `ℚ[x]/(x²)`: `(x⊗1−1⊗x)(x⊗1+1⊗x) = 0`; after `R⊗_{Rᵉ}−`: `0, 2x`; `HH₁ = R/(x)`, `HH₂ = xR`; `HH²(R,ℚ) = ℚ = Hom_R(xR,ℚ)`, `h₂(f)(x e₂) = x f(e₂) = 0`. | holds |
| 7.3 (sampled) | Types: `⋀^n P* → Hom(⋀^n P**, R) → Hom(⋀^n P, R)`. Pin: `pairingDual (ιMulti f)(ιMulti v) = det(of fun i j ↦ f j (v i))` (`ExteriorPower/Pairing.lean:71`). Evaluation: `det(ev(v_j)(f_i)) = det(f_i(v_j))`, the transpose. `R²`: `1`; `e₂*∧e₁*`: `−1`. `P = 0`: `⋀⁰ = R`. `R^{(ℕ)}`: images of `f∧g` have rank `≤ 2`. | holds |
| 7.5 | `δ(D₁D₂)(a,b) = −(D₁aD₂b + D₂aD₁b)`; in characteristic `2` this is `det`. Pairings with `1⊗x⊗y − 1⊗y⊗x`: `2` and `1`. Injectivity: `⟨ξ⟩(r₁..r_n) = τ_n(ξ)(dr₁∧…∧dr_n)` and the `dr_I` span `Ω^n`. | holds |
| 7.6 (sampled, headline) | Alternation of `Ψ_n` from (1): `h_n[D₁∪⋯∪D_n](ε(r₀dr₁⋯)) = r₀det(D_j(r_i))`. `ℤ[1/2]/ℤ`: `ℤ[1/2]⊗ℤ[1/2] = ℤ[1/2]`, `δ⁰ = 0`, `δ¹ = 1`, `HH^n = 0 = T^n` for `n ≥ 1`. Inseparable `R`: `Rᵉ = R[b]/(b−a)²`, Hom-differentials `0` and `2a = 0`, `HH² = R`, `T² = 0`. `𝔽₂[x,y]`: `[⟨∂_x,∂_y⟩] = 2Ψ₂ = 0`, `Ψ₂ ≠ 0`. (5): `Ω^n = 0` for `n > d`. | holds under smooth, `k`-projective and the gap |
| 8.1 (sampled) | `R⊗R ≅ R[Y]`, `X_i⊗1 ↦ X_i`, `1⊗X_i ↦ X_i + Y_i`; multiplication is `Y ↦ 0`. Sign change `t_i = −Y_i` keeps the ideals `(Y₁..Y_j)`. `m = 0`: empty sequence, kernel `0`. `k[x]/(x²)`: `t(x⊗1+1⊗x) = x²⊗1 − 1⊗x² = 0`. `k = 0`: weak regularity holds vacuously (pinned `isWeaklyRegular_map_X` has no `Nontrivial`). | holds |
| 8.4 (headline) | `h_n[∂_I](ε(dX_J)) = det(∂_{i_a}X_{j_b}) = δ_{IJ}`; no gap used. | holds |
| 8.5 (sampled) | `(X₁², X₂)`: `det = 2X₁`, normalised `gX₁`. `m = 1`: `g∂`. `m = 0`, `g = 2`: `2`; empty-family reading gives `1`. `𝔽₂`, `m = 2`: `⟨∂₁,∂₂⟩(x,y) = 1`, a coboundary. `k = 0`: rank `1` by `rank_subsingleton` (`Dimension/Basic.lean:168`), consistent with "free of rank one". | holds |

For the targets not in this table (2.1, 2.2, 3.1, 3.4, 3.6, 4.4, 5.1, 6.1, 6.3, 7.1, 7.4, 8.2,
8.3) the round-11 table carries computed values and their text is unchanged since; I recomputed
the unit and commutator formulas of §§3.5–3.6, `D_n = ker(M⊗A^{⊗n} → M⊗Ā^{⊗n})` of §2.1 (right
exactness) and the inverse maps of §3.4 while reading, with no discrepancy.

### Sources: the seeded sample

No locator is flagged unverified by the author. Read this round in the cached extractions:

| Target | Locator read | Outcome |
| --- | --- | --- |
| 1.1 | Ginz05 lines 963–976 | Identification of terms and the boundary with the signs of the conventions. Loday98, Weibel94, CE56 not readable. |
| 1.4 | Weibel94, CE56 | Not readable (settled uncertified); statement recomputed above. |
| 3.2 | Ginz05 lines 1066–1069 | Degree-zero cocycles are the central elements; `HH⁰(A) = Z(A)`. |
| 3.3 | Ginz05 lines 398–411, 1075–1085 | Derivations, inner derivations, sequences (3.1.1) and (5.4.1). |
| 4.1 | Ginz05 lines 751–752, 934–947 | `(a₁⊗a₂ᵒᵖ)m = a₁ma₂`; right `Aᵉ`-module view and `M⊗_{Aᵉ}A = M/[M,A]`. |
| 4.2 | Ginz05 lines 747–782; HKR62 lines 433–447 | Bar complex, homotopy, its check on two factors; right-linear homotopy and projectivity from `K`-projective `R`. |
| 4.3 | Ginz05 lines 1033–1062; HKR62 lines 480–489 | Bimodule maps out of the bar complex as multilinear maps. |
| 4.5 | Ginz05 lines 944–976 | `Tor` as derived functors of `M⊗_{Aᵉ}−`; `a_n m a₀` identification. |
| 5.2 | Ginz05 lines 1342–1350 | Leibniz rule with `(−1)^{deg f}`; descent; Yoneda product. |
| 5.3 | HKR62 lines 425–431 | The product on `Ext_S(R,−)`. CE56 not readable. |
| 5.4 | Ginz05 lines 1348–1350; HKR62 lines 479–484 | Cup equals Yoneda; the explicit product on the bar resolution. |
| 7.3 | HKR62 lines 531–535 | Dual of an exterior algebra of a finitely generated projective module. |
| 7.6 | HKR62 lines 301–330, 495, 522–552; AV20 lines 70–71, 237–243; Ginz05 lines 2086–2088 | Lemma 4.1 (`i < k` projective gives `i ≤ k`), product formula, Theorems 5.1 and 5.2 with the `K`-projective standing hypothesis (line 411); Proposition 1.2 over any commutative `k`; the factorial remark; Theorem 9.1.3. |
| 8.1 | HKR62 lines 268–271; Ginz05 lines 2193–2196 | As the README describes: a cited regular sequence in a regular local ring; an unproved assertion for the diagonal. |
| 8.5 | Ginz05 lines 2142–2156; HKR62 lines 495, 548 | Alternation map and `π∘alt = p!`; product formula; Theorem 5.2. |

All nine cited works have exactly one manifest entry; `sources.toml` was not changed and no
`needs-references.toml` was written.

### Pinned declarations and library claims

Opened this round, in the pinned copies:
`Mathlib/AlgebraicTopology/AlternatingFaceMapComplex.lean:161, 343`; `ExtraDegeneracy.lean:74`;
`Mathlib/CategoryTheory/Abelian/Projective/Ext.lean:139, 154, 188, 196, 209, 224, 234, 255, 286`;
`Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:171`, `Ext/Linear.lean:88`;
`Mathlib/CategoryTheory/Abelian/LeftDerived.lean:105, 109`; `Abelian/Ext.lean:56`;
`Abelian/Projective/Resolution.lean:162, 180`; `Mathlib/Algebra/Homology/Homotopy.lean:870, 946`;
`HomologySequence.lean:293`; `Embedding/Basic.lean:226`;
`Mathlib/Algebra/Azumaya/Defs.lean:39`; `Mathlib/Algebra/Module/Projective.lean:240`;
`Mathlib/Algebra/Category/ModuleCat/Projective.lean:27` (from `Module.Projective` to
`CategoryTheory.Projective`, the direction §7.2 uses);
`Mathlib/LinearAlgebra/TensorPower/Basic.lean:75`;
`Mathlib/LinearAlgebra/ExteriorPower/Pairing.lean:64, 71`, `Basis.lean:182`, `Basic.lean:212, 418`;
`Mathlib/LinearAlgebra/Dual/Lemmas.lean:141, 145`, `Dual/Defs.lean:216`;
`Mathlib/LinearAlgebra/Dimension/Basic.lean:168`;
`Mathlib/RingTheory/Regular/RegularSequence.lean:190`; `MvPolynomial/Ideal.lean:63`;
`Kaehler/Polynomial.lean:63`; `Smooth/Basic.lean:71`; `Smooth/Flat.lean:57`;
`Derivation/Basic.lean:278`; `Mathlib/Algebra/TrivSqZeroExt/Basic.lean:853`;
`TauCeti/LinearAlgebra/ExteriorPower/Basic.lean:145`;
`TauCeti/RingTheory/MvPolynomial/RegularSequence.lean:44`;
`TauCeti/LinearAlgebra/TensorProduct/Balanced/Basic.lean:55`, `OuterFactors.lean:88`,
`Unit.lean:122`; `TauCeti/Algebra/TensorProduct/Module.lean:51, 103`;
`TauCeti/Algebra/CentralSimple/Bimodule.lean:156, 160, 184`;
`TauCeti/RingTheory/HochschildCohomology/Coboundary.lean:226, 359, 382`;
`TauCeti/RingTheory/Derivation/Bimodule.lean:41, 84, 101`;
`TauCeti/Algebra/Lie/Derivation/Basic.lean:272, 352`;
`TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean:212, 234`;
`TauCeti/Algebra/Homology/Ext/ProjectiveResolution.lean:107`;
`TauCeti/RingTheory/KoszulComplex/Basic.lean:399`, `Regular.lean:140`.
The other pinned declarations of the contracts were opened in round 11 at the same pins.

By object, in the pinned Tau Ceti: the files matching "Hochschild" are the bimodule coboundary and
the `n + 1`-argument complex (`RingTheory/HochschildCohomology`), the cyclic theory, the
`A∞` positive-arity complex, the Banach variant and consumers; there is no bar resolution of an
algebra over `Aᵉ` (the matches for "bar resolution" are group-homological), no cup product on
bimodule cochains (the matches are the `A∞` bracket and monoidal chain complexes), no
`Tor` over a noncommutative ring (`ModuleCat/Monoidal/Tor.lean` is the monoidal one), no Hochschild
homology and no polyvector or HKR statement. The design cites what exists and plans the rest.

The worker's lead `TauCeti.StarkSystems.toExteriorBidual` (README §7.3): not at the pin and not
claimed to be; it is IntegralIwasawaTheory §12.6's target (namespace `TauCeti.StarkSystems`,
arguments `R, r, M`), cited as such.

### Duplication, citations and overlaps

Resolved now, at main `1a19c9fc` and at the open heads the roadmap tool serves:

| Citation | Where it resolves | Agreement |
| --- | --- | --- |
| RefinedTraceMethods §1.1 | open head, section "1.1 Cyclic objects and the cyclic bar", target "The cyclic enhancement of supplied derived Hochschild chains" | flat `A`: `(C_•(A/k), b)`; non-flat example `k = ℤ`, `A = 𝔽_p`. |
| RefinedTraceMethods §1.9 | open head, "1.9 Antisymmetrization and the smooth HKR comparison", target "The antisymmetrisation map and the HKR projection" | `ε_n` over `σ⁻¹`, `π_nε_n = n!`, `ε₁`, flat or derived; no integral smooth isomorphism (formality only for `ℚ ⊆ k`). |
| RefinedTraceMethods §1.10 | open head, "1.10 Derived HKR, circle tensors and a nonflat example" | `HH_{2n}(𝔽_p/ℤ) = 𝔽_p·u^{[n]}`. |
| KTheoryFiniteLocalFields §4.0 | "4.0 Genuine equivariant and cyclic foundations", target "Cyclic homology foundations" | derived chains on DGAInfinity Layer 8; smooth HKR, map unnamed. |
| EulerSystemsAndKolyvaginSystems §6.1 | "6.1 Exterior biduals of Selmer modules" | "This map is an isomorphism for finite projective X". |
| IntegralIwasawaTheory §12.6 | "Shared exterior-bidual core" | carrier, flip of `pairingDual`, determinant formula. |
| DerivedDeRhamCohomology Layer 2; LanglandsParameterStacks §1.17 | headings present | scope deferrals. |
| DGAInfinity Layers 0, 1, 8; DerivedModuleAlgebra §§0.K.1, 0.5; NoncommutativeGeometry N1; BanachAlgebras Layer 6; ZigzagPreprojective Layer 7 | main | unchanged since round 11 (main is at the same commit). |

`scratch/overlaps.md`: no other pull request changes this roadmap, no dropped id, no id only an
open revision defines, no closest roadmap by results. No `HochschildHomologyAndHKR` folder on main
and none in the open-pull-request list or the board-packages index: no second copy.

Overlap check: read CyclicHomologyLieHomologyAndQuasiFreeAlgebras, RefinedTraceMethods,
SpectralSequencesAndConvergencePartII, RationalHomotopyModels, CohomologyOfGroups (open; the scope
readings of round 11 stand, RefinedTraceMethods reread at its head this round), DGAInfinity,
NoncommutativeGeometry, DerivedModuleAlgebra (main, unchanged); shared: commutative square-zero
extensions, owner DerivedModuleAlgebra §0.5 (cited; this roadmap owns the noncommutative `k`-split
case); the normalised quotient over `ℂ`, owner NoncommutativeGeometry N1.Cyclic, cited;
antisymmetrisation and derived chains, owners RefinedTraceMethods §1.9 and
KTheoryFiniteLocalFields §4.0, imported; braces and bracket, owner DGAInfinity Layers 0 and 8,
imported; Koszul complex, owner DerivedModuleAlgebra §0.K.1, imported. Nothing has two owners.

### Supplier order

```text
candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2245 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Edges inside the roadmap run forward only; §8.4 needs §6.4(a), not
§6.4(d), §7.2 or §7.6, so the polynomial case does not use the gap.

### Gap

`smooth-hkr-antisymmetrisation` (supplier RefinedTraceMethods, §1.9): one statement with its
hypotheses (every commutative `k`, every smooth commutative `A`, every `n`). Not already provided:
§1.9 at its head has `π_nε_n = n!` and the degree-one case, which give nothing when `n! = 0`
(`𝔽₂[x,y]`, `n = 2`); §4.0 names no map; §8.4 here covers polynomial algebras only. Same slug in
the README (lines 681–686) and in the plan's `gaps` (`supplier` RefinedTraceMethods, `section`
§1.9, `neededBy` 6.4 and 7.6).

### Headline theorems and Lean

Headlines of the summary: normalisation over every `k` (2.1, 2.2); the low degrees and the `HH²`
classification (3.1–3.6); `HH^n ≅ Ext^n` and `HH_n ≅ Tor_n` (4.4, 4.5); cup equals Yoneda up to
sign (5.4); the homotopy formula and graded commutativity (6.2); the cohomological HKR theorem
with `[⟨D₁,…,D_n⟩] = n!·Ψ_n` (7.6); polynomial algebras (8.4, 8.5). There is no `Suggested.lean`
at the design stage, so the padding probe, the binder audit and the import check do not apply yet.

### Copyright and arrangement

- **Wording.** 19 passages set beside the sources at their locators: Ginz05 at lines 398–411,
  747–782, 934–976, 984–988, 1033–1062, 1066–1069, 1075–1085, 1339–1350, 2086–2088, 2142–2156,
  2187–2197; HKR62 at lines 210–215, 268–279, 301–330, 410–447, 448–495, 522–552; AV20 at lines
  70–74, 237–243, against §§1.1, 3.2, 3.3, 4.1, 4.2, 4.3, 4.5, 5.2, 5.3, 5.4, 7.2, 7.3, 7.6, 8.1,
  8.4, 8.5 and the conventions. Nothing is shared beyond formulae and standard names.
- **Arrangement.** Ginz05 has the largest share (46 of 122 source mentions). Its sections run §3
  derivations, §4 bar complexes, §5 Hochschild theory defined as `Tor` and `Ext` with the low
  degrees, §6 Gerstenhaber structures, §8 Kähler differentials, §9 HKR. The roadmap builds the
  complexes from simplicial modules, normalises before the low degrees and puts both before the bar
  resolution; Layers 2, 6 and 8 have no counterpart section. No one-to-one run.
- **Reuse.** No table, figure, exercise list or data set is taken from a source.

Source independence: 19 passages compared with 3 sources (Ginz05, HKR62, AV20), none shared;
largest share Ginz05, 46 of 122 locators; contents compared with Ginz05: independent. Loday98,
Weibel94, CE56, Ger63 and Mat86 could not be read (settled uncertified).

## Not verifiable

- Loday98, Ger63, Weibel94, CE56, Mat86: settled uncertified; their section and theorem numbers
  were not checked against the texts. In the sample this covers the Loday98 locators of 1.1, 3.2,
  4.2, 4.5, 5.2 and 7.6, the Weibel94 locators of 1.1, 1.4, 3.3, 4.2, 4.5 and 7.6, the CE56 locators
  of 1.1, 1.4, 3.3, 5.3 and 5.4 and the Ger63 locator of 5.2. In particular whether Weibel94 §9.1
  or Loday98 §1.1 already state the flat form of R01 was not checked.
- Lean elaboration and the one-tactic probe: no Lean file at this stage, and this lane does not
  elaborate.
- The closed form of `s(p,q)` (§5.3) for `p, q ≥ 1` and the signs `ν_n` (§6.3) for `n ≥ 1`: the
  design states their existence; they depend on Mathlib's shift conventions and on DGAInfinity
  Layer 8's chain differential.
- The declared gap is a contract on RefinedTraceMethods §1.9, not a statement that exists today.

## Source issues

- **Error** in Ginz05 at §6.6, identity (6.6.3), p. 29 (line 1368): the source says the graded commutator of cup products is `d(f∘g) − df∘g − (−1)^p f∘dg`; it should be, for the coboundary of line 1058, `g∪f − (−1)^{pq} f∪g = df∘g + (−1)^q(d(f∘g) − f∘dg)`; affects a stated result.
- **Misprint** in Ginz05 at §3.1, p. 9 (line 404): the source says `ad m` maps `M → M` and is a derivation of `M`, for `m ∈ m`; it should be a map `A → M`, a derivation from `A` to `M`, for `m ∈ M`; affects nothing.
- **Misprint** in Ginz05 at §6.6, formula (6.6.2), p. 29 (line 1363): the source says the inner cochain takes the arguments `a_i,…,a_{i+q}`; it should be `a_i,…,a_{i+q−1}`, `q` arguments; affects nothing.
- **Misprint** in Ginz05 at §5.2, p. 22 (lines 1049–1053): the source says the inner terms of the recalled chain boundary carry no sign; it should be `(−1)^j` on the `j`-th term, as at lines 973–976; affects nothing.
- **Misprint** in Ginz05 at §5.2, p. 22 (line 1038): the source says the rank-one free bimodule `A⊗A` is a left module over `A ⊗ Aᵉ`; it should be a left module over `Aᵉ`; affects nothing.
- **Misprint** in Ginz05 at §5.3, p. 22 (line 1068): the source says the set of `m` with `am = ma` is the centre of the module `A`; it should be the centre of the bimodule `M`; affects nothing.
- **Gap** in Ginz05 at §9.3, proof of Theorem 9.1.3, p. 46 (lines 2193–2196): the source says the diagonal ideal of `A ⊗ A` is generated by a regular sequence when `X` is smooth; it should be claimed only after localising at points of the diagonal; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f0240b7453bd309647a3e683dd7a3910cee65b9f", "job": "REV-DESIGN-HochschildHomologyAndHKR~12", "model": "fable", "worker": "chris-x55"} -->

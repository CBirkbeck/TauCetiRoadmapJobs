<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13788#issuecomment-6898126864 -->
Review (claude) of 4dc1c22

Verdict: needs_changes

1. **F01** (P2) The commutative case of §3.6 is the pinned `TauCeti.SquareZeroExtension` (DerivedModuleAlgebra §0.5), uncited

   **Location.** `packages/HochschildHomologyAndHKR/design/README.md`, scope, lines 169–171: "the
   `HH²` classification of §3.6 is for an arbitrary bimodule without a deformation parameter, where
   DGAInfinity Layer 8 reads `HH²(A,A)` as infinitesimal deformations and BanachAlgebras Layer 6
   classifies bounded extensions"; §3.6, lines 1065–1078; Layer 3 Dependencies, lines 1100–1103;
   plan target 3.6.

   **Claim.** §3.6 defines square-zero extensions of `A` by `M` with their isomorphisms, and proves
   that the class is zero exactly when the projection has an algebra section; the scope lists only
   `TrivSqZeroExt` as existing.

   **Witness.** At the pin, `TauCeti/RingTheory/Extension/SquareZero/Basic.lean:69`
   (`TauCeti.SquareZeroExtension A B M`: commutative `E`, surjective `π`, injective additive `ι` onto
   `ker π`, `x * ι m = ι (π x • m)`), `:122` (`Hom`), `:211` (`Splitting`), `:317` (`Exal`), `:387`
   (`extensionClass_eq_zero_iff`: zero class iff a splitting exists). On main,
   `TauCetiRoadmap/DerivedModuleAlgebra/README.md` lines 1339–1349 (§0.5) plans exactly this. For
   commutative `R`, symmetric `M` and commutative `E`, §3.6's object is this one plus a `k`-linear
   section.

   **Why P2.** One object (commutative `k`-split square-zero extensions of `R` by a symmetric `M`,
   their isomorphisms, and "zero class iff split") has an owner on main and a pinned formalisation, and
   this text states it again without naming either. It is the pattern of round 8's F01.

   **Exact repair.** No statement changes and no supplier edge is needed (the pinned declarations are
   cited from Tau Ceti).

   - Scope, "Already in the pinned libraries": after "`TrivSqZeroExt`," add "Tau Ceti's commutative
     square-zero extensions `TauCeti.SquareZeroExtension` with `TauCeti.SquareZeroExtension.Splitting`,
     `TauCeti.Exal` and `TauCeti.SquareZeroExtension.extensionClass_eq_zero_iff` (the formalisation of
     DerivedModuleAlgebra §0.5),".
   - Scope, the variants bullet on §3.6 (line 171): append "; DerivedModuleAlgebra §0.5 and Tau Ceti's
     `TauCeti.SquareZeroExtension k R M` classify square-zero extensions of a commutative `R` by an
     `R`-module by commutative rings, with no `k`-splitting, and keep that statement; §3.6 allows a
     noncommutative `E` and an arbitrary bimodule and requires a `k`-linear section, and the two meet
     in the commutative `k`-split extensions, where `R ⊕_f M` for a symmetric cocycle `f` is a
     `TauCeti.SquareZeroExtension k R M` whose splittings are the algebra sections of §3.6(d)".
   - "From Tau Ceti": a bullet for `TauCeti/RingTheory/Extension/SquareZero/Basic.lean` naming the four
     declarations with their hypotheses (`A`, `B` commutative rings, `M` a `B`-module, `ι` additive).
   - §3.6: one API bullet stating the comparison above (for commutative `R`, symmetric `M` and `f` with
     `f(a,b) = f(b,a)`, the ring `R ⊕_f M` is commutative and, with its projection and `m ↦ (0,m)`, is a
     `TauCeti.SquareZeroExtension k R M`; (d) for it is `extensionClass_eq_zero_iff`); add the four
     names to its Needs line and to plan 3.6's prerequisites; and one Check (the repair test below).
   - Layer 3 Dependencies: name the pinned file beside `TrivSqZeroExt`.

   **Repair test.** Shared case: `k` nonzero, `R = k[x]/(x²)`, `M = k`, `f(x,x) = 1` is symmetric,
   `R ⊕_f M = k[t]/(t³)` is commutative, a `TauCeti.SquareZeroExtension k R k` with no splitting
   (`(x + ct²)² = t² ≠ 0`), nonzero in both classifications. Pinned only: `k = ℤ`, `R = M = 𝔽₂`,
   `ℤ/4 → 𝔽₂` is a pinned extension with no splitting, not `ℤ`-split, and `HH²(𝔽₂,𝔽₂) = 0`. §3.6 only:
   `R = M = k[x,y]`, `f = ∂_x ∪ ∂_y`, `f(x,y) = 1 ≠ 0 = f(y,x)`, so `(x,0)(y,0) = (xy,1) ≠ (xy,0) =
   (y,0)(x,0)`: not commutative, hence not a pinned object. The new clause describes all three.

One finding, R01 (P2): the commutative case of §3.6 is an object the pinned Tau Ceti and
DerivedModuleAlgebra §0.5 (on main) already have, and the design neither cites it nor says how §3.6
differs. No statement of the roadmap is false; the repair is three sentences and one Check. Both
round-8 repairs are in place. The declared gap `smooth-hkr-antisymmetrisation` is precise, minimal
and declared under the same slug in the README and in `plan.json`; it is no finding.

Files reviewed: `packages/HochschildHomologyAndHKR/design/README.md` (2029 lines, 37 targets, 8
layers), `packages/HochschildHomologyAndHKR/design/plan.json`,
`packages/HochschildHomologyAndHKR/sources.toml`. Pins read from the checked-out packages: Mathlib
`1b1ccf4b`, Tau Ceti `2fd255d9`. Roadmap main at `1a19c9f`. No maintainer notes were supplied.
This is a design: there is no `Suggested.lean`, and elaboration is not available (this lane does
not elaborate).

## Verification of the previous repairs

| Round-8 finding | Repaired passage | Assessment |
| --- | --- | --- |
| F01 (P2): §2.1's complex case shared with NoncommutativeGeometry N1.Cyclic | Scope lines 152–156: "NoncommutativeGeometry N1.Cyclic constructs, for a unital complex algebra, the normalised form quotient `A ⊗ (A/ℂ·1)^{⊗n}` and its comparison with the pinned normalised chains, the case `k = ℂ`, `M = A` … and keeps that statement"; contract lines 460–461; Layer 2 Dependencies lines 924–927 | **Repaired.** Main, `TauCetiRoadmap/NoncommutativeGeometry/README.md` lines 609–611 read as described; lines 18 and 119 fix complex scalars from N1.Cyclic on. |
| F02 (P3): the (6.6.3) negative control gave the true value | §6.2 Checks lines 1463–1464: "Ginz05 (6.6.3) would read `2(∂ ∪ ∂) = δ(∂²)`, that is `2∂a∂b = −2∂a∂b`, which fails at `(a,b) = (x,x)` (`2 = −2`) unless `4 = 0` in `k`"; plan 6.2 test `homotopy_11`, same wording | **Repaired.** Ginz05 line 1368 at `f = g = ∂`: left side `2(∂∪∂)`, right side `δ(∂²)`; `δ(∂²)(x,x) = 0 − 2 + 0 = −2`, `2(∂∪∂)(x,x) = 2`. |

The F01 pattern (an existing owner of a special case, uncited) was searched for again by object in
the pins and on main, and gave R01. The F02 pattern (a negative control that does not fail) was
recomputed on every "would give" passage of the README (lines 687, 689, 735, 739, 860, 909, 942,
1138, 1274, 1327, 1426, 1470, 1898, 1953); all fail as stated.

## Verified sound

### Principles and shape

- **General library.** `k` is an arbitrary commutative ring in all 37 targets; flatness,
  projectivity and smoothness are per-target hypotheses with negative controls.
- **Hygiene.** Searched and absent: LaTeX delimiters, `set_option`, pull-request numbers, job ids,
  process words, machine paths, HTML anchors, `lemma`, "optional", "deferred", a sentence saying
  the roadmap follows a source. The two hits of "round" are "round trips".
- **Shape.** 37 Needs lines for 37 targets; every layer ends with Examples and Dependencies;
  `plan.json` parses (8 layers, 37 targets, one gap); no definition or construction in the plan
  has fewer than three tests; every target has a locator.

### Adversarial table

Values computed this round (`E_ij` matrix units, `∂ = ∂_x`).

| Statement | Instances tried and values computed | Result |
| --- | --- | --- |
| 1.5 (sampled) | `b(1⊗x⊗1) = x⊗1 − 1⊗x + 1⊗x = x⊗1`; first-factor action on `b(1⊗1⊗1) = 1⊗1` gives `1⊗x`. `Mat₂`: `b(E₁₂⊗E₂₁) = E₁₁ − E₂₂`, `E₁₁·b = E₁₁`. Linearity of `d_n` needs `a_n(rm) = r(a_n m)`. | holds |
| 2.1 (repaired scope) | `b(m⊗1⊗1) = m⊗1`; `b(1⊗x⊗x) = 2x⊗x − 1⊗x²`; `A = k`: `Ā = 0`. | holds |
| 3.3 (sampled) | `δE₁₁(E₁₂) = E₁₂E₁₁ − E₁₁E₁₂ = −E₁₂`; `D(1) = 2D(1)`; section `a ↦ (a,Da)` multiplicative iff Leibniz. | holds |
| 3.5 (sampled) | Unit: `δf(1,1,a) = f(1,a) − f(1,1)a`, so `(1,−f(1,1))(a,m) = (a,m)`; `c·(1,−f(1,1))` is central. Transport: `f′ = f + g(aa′) − a g(a′) − g(a)a′ = f − δg`. `k[x]/(x²)`: `t² = (0,1)`, `t³ = (0, x·1) = 0`. `k[x]`, `f(x,x²) = 1`: `δf(x,x,x) = 1`, products `(x³,0)`, `(x³,1)`. `f = δg`: `f(1,x) = x`. | holds |
| 3.6 (R01) | `𝔽₂/ℤ`: `δ¹ = 1`, `δ² = 0`, `HH² = 0`, `ℤ/4` not split. Three instances of the repair test. | holds; R01 |
| 4.1 (sampled) | `(E₁₂⊗op E₂₁)·E₂₂ = E₁₁`, reversed `0`. Right structure: `(m·(a⊗op b))·(a′⊗op b′) = b′b m aa′ = m·(aa′⊗op(b′b))`. `m⊗x = mx⊗1 = xm⊗1` in `M ⊗_{Aᵉ} A`. | holds |
| 4.2 (sampled) | `A = k`: `b′₁ = 0`, `b′₂ = 1`, `μ = 1`, exact. `B₁`: `(b′h + hb′)(a₀⊗a₁⊗a₂) = a₀⊗a₁⊗a₂`. `h(x⊗1) = 1⊗x⊗1 ≠ x⊗1⊗1`. | holds |
| 4.3 (sampled) | `φ(a₀⊗…⊗a_{n+1}) = a₀φ(1⊗a₁…a_n⊗1)a_{n+1}`; `φ∘b′(1⊗a⊗b⊗1) = aφ(b) − φ(ab) + φ(a)b`, the `δ` of the conventions, no sign. | holds |
| 4.4 (sampled) | `A = k = M = ℤ`: `δ⁰ = 0`, `δ¹ = 1`, `Z¹ = 0`, `HH¹ = 0`, not `C¹ = ℤ`. Degree one: `a₀D(a₁)a₂` is `Aᵉ`-linear and a cocycle iff Leibniz. | holds |
| 4.5 (sampled) | `m⊗(a₀⊗…⊗a_{n+1}) ↦ a_{n+1}ma₀⊗…`; `b′(1⊗a₁⊗…⊗a_n⊗1)` maps to `ma₁⊗… + ⋯ + (−1)^n a_n m⊗…`. Wrong structure: `E₂₁E₁₂ = E₂₂` against `E₁₁`. | holds |
| 5.1, 5.4 | Reversed cup: defect at `(E₂₁,E₁₂)`, `x = E₁₁`: `E₁₁ − 0 + 0 − E₂₂`. Unsigned lift, `p = 1`: `f̃₀b′ = −a₀f(a₁)a₂⊗a₃ + a₀f(a₁)⊗a₂a₃ = −b′f̃₁`. | holds |
| 5.3 (sampled) | `q = 0`: `extMk_comp_mk₀`, `s(p,0) = 1`. `(0,0)`: composition in `End_{Aᵉ}(A)`, `·x` then `·y` is `·xy`. For `p,q ≥ 1` the statement asserts only that a sign depending on `(p,q)` exists. | holds as stated |
| 6.1 | `f(a,b) = a∂b`: `δf(a,b,c) = ab∂c`; model without `(−1)^q`: `2a(∂b)c − ab∂c`, value `2` at `(1,x,1)` where `δf = 0`. | holds |
| 6.2 (headline; repaired Check) | Derived from the brace relation: `(DF){G} + (−1)^{|F|}F{DG} − D(F{G}) = m{F,G} + (−1)^{|F||G|}m{G,F}` (the six terms `F{m,G}`, `F{G,m}` cancel in pairs); with `DΘf = (−1)^{p+1}Θ(δf)` and `Θ(f∪g) = (−1)^{p(q−1)}m{Θf,Θg}`, multiplying by `(−1)^{p−1}` gives `δf∘g + (−1)^q(δ(f∘g) − f∘δg) = g∪f − (−1)^{pq}f∪g`. `δ(∂^{[2]})(a,b) = −∂a∂b`. | holds |
| 6.3 (sampled) | `A = k`: both complexes `k` with differentials `0, 1, 0, …`. `𝔽_p/ℤ`: classical `b₂ = 1`, `HH₂ = 0`; derived `HH₂ = 𝔽_p` (RefinedTraceMethods §1.10). Only `ν₀ = 1` is fixed; the rest is stated as existence. | holds as stated |
| 6.4 (sampled) | `π₂ε₂(dx∧dy) = 2dx∧dy`. `k[x]/(x²)`: `Ω² = 0`; `HH₂ = ker(2x) = xR` (char ≠ 2) or `R` (char 2), nonzero. `𝔽_p/ℤ`: both sides `0` for `n ≥ 1`. | holds; (d) rests on the gap |
| 7.2 (sampled) | `ℚ[x]/(x²)`: differentials `0, 2x`; `HH₁ = R/(x)`, `HH₂ = xR`; `HH²(R,ℚ) = ℚ`, `Hom_R(xR,ℚ) = ℚ`, `h₂(f)(x e₂) = x f(e₂) = 0`. `𝔽_p/ℤ`: `δ^i = 0` (even), `1` (odd). `n = 0`: `H⁰ = Hom(coker d₁, Y)` always. | holds |
| 7.5 (sampled) | `det(D_j(r_i)) = Σ_σ sgn(σ) Π_i D_{σ(i)}(r_i)`. `δ(D₁D₂)(a,b) = −(D₁aD₂b + D₂aD₁b)`, the determinant in characteristic two. On `1⊗x⊗y − 1⊗y⊗x`: `⟨∂_x,∂_y⟩ ↦ 1 − (−1) = 2`, `∂_x∪∂_y ↦ 1 − 0 = 1`. Injectivity: `τ_n` bijective and `dr₁∧…∧dr_n` generate `Ω^n`. | holds |
| 7.6 (headline) | `Ψ_n` well defined through `h_n`, `ε^cl_n` bijective and `τ_n`: `h_n[D₁∪⋯∪D_n](ε(r₀dr₁…)) = r₀det(D_j(r_i))`, alternating. `ℤ[1/2]`: `C^n = ℤ[1/2]`, `HH^n = 0 = T^n`. Inseparable: `b² − u = (b−a)(b+a)`, Hom-differentials `0`, `2a = 0`, `HH² = R`, `T² = 0`. | holds under smooth, `k`-projective and the gap |
| 8.3 | `b′ι(e₁∧e₂) = t₁·(1⊗X₂⊗1) − t₂·(1⊗X₁⊗1)`; unsigned defect `2(X₂⊗X₁⊗1 + 1⊗X₂⊗X₁ − 1⊗X₁X₂⊗1)`. | holds |
| 8.4 (sampled, headline) | `t_i` acts by `0` on `R`, so both Koszul complexes have zero differential; `(∂_I)(ι e_J) = δ_{IJ}`: dual bases, hence `h_n` bijective and `[∂_i∪∂_i] = 0` without the gap. `m = 0`: `HH₀ = HH⁰ = k`. | holds, no gap |
| 8.5 (sampled) | `(X₁²,X₂)`: `det = 2X₁`. `m = 0`, `g = 2`: cochain, class, `Φ⁰` all `2`; first-column reading gives `1`. Zero ring: rank `1` (`rank_subsingleton`). | holds |

### Sources: the seeded sample

No locator is flagged unverified by the author. Read in the cached extractions:

| Target | Locator read | Outcome |
| --- | --- | --- |
| 1.5 | Ginz05 lines 2161–2166 | Centre acts on `HH_p(M)` through the coefficient; agrees. |
| 3.3 | Ginz05 lines 398–411, 1075–1085 | Derivations, inner derivations, the two exact sequences; line 404 has `ma − am`, as the conventions say. |
| 3.5 | Ginz05 lines 1088–1106 | Product twisted by a 2-cochain, associative iff cocycle, isomorphic iff cohomologous. |
| 4.1 | Ginz05 lines 751–752, 934–947 | `(a₁⊗a₂ᵒᵖ)m = a₁ma₂`; `M ⊗_{Aᵉ} A = M/[M,A]`. |
| 4.2 | Ginz05 lines 747–782; HKR62 lines 433–447 | Bar complex, homotopy, the check counted in tensor factors; right-linear homotopy and projectivity from `K`-projective `R`. |
| 4.3 | Ginz05 lines 1033–1062; HKR62 lines 480–489 | Bimodule maps out of the bar complex as multilinear maps; the coboundary formula. |
| 4.4 | Ginz05 lines 984–988; HKR62 lines 337–351 | Cohomology defined as `Ext`; derivations as `Ext¹`. |
| 4.5 | Ginz05 lines 944–976 | `Tor` over `Aᵉ`, the identification of terms and the boundary. |
| 5.3 | HKR62 lines 425–431 | The product on `Ext`. CE56 not readable. |
| 6.3 | Ginz05 lines 963–976 | Identification of the underlying modules. Loday98 not readable. |
| 6.4 | Ginz05 lines 2142–2156; AV20 lines 237–243 | Alternation map, projection, `p!`; the projection is not the HKR map, composite `t!`. |
| 7.2 | HKR62 lines 301–330 | Lemma 4.1: projective below `k` gives isomorphisms for `i ≤ k`. |
| 7.5 | Ginz05 lines 2101–2156; HKR62 lines 509–521 | The maps of §9.2; alternating forms on derivations. |
| 8.4 | HKR62 lines 210, 268–279; Ginz05 line 2187 | Theorem 3.1 with its Noetherian and regularity hypotheses; the Koszul computation; Lemma 9.3.1. |
| 8.5 | Ginz05 lines 2142–2156; HKR62 lines 495, 548 | Product formula; Theorem 5.2 over a perfect field. |

Also read: Ginz05 lines 96–97 (ground field), 894 (§4.5), 1001–1030 (trace), 1120–1128, 1339–1379,
1914–1926, 2086; HKR62 line 522; AV20 line 70; StacksSmooth lines 16920 (Tag 00T2) and 17399
(Tag 00TN). All nine cited works have exactly one manifest entry; `sources.toml` was not changed
and no `needs-references.toml` was written.

### Pinned declarations and library claims

All 245 backticked identifiers of the README were searched at the pins; those not found are
mathematical symbols (`C_n`, `h_n`, …), the namespace `TauCeti.DualBimodule`
(`TauCeti/RingTheory/HochschildCohomology/Dual.lean:50`), the structure field
`Algebra.FormallySmooth.projective_kaehlerDifferential` (`Mathlib/RingTheory/Smooth/Basic.lean:71`)
and `TauCeti.StarkSystems.toExteriorBidual`, which is IntegralIwasawaTheory §12.6's target, not a
pinned declaration, and is cited as such. Opened this round, among others:
`TauCeti/Algebra/Homology/Kronecker.lean:106`; `TauCeti/RingTheory/HochschildCohomology/Coboundary.lean:226, 303, 318, 345, 351, 396`;
`TauCeti/RingTheory/Derivation/Bimodule.lean:41, 84, 89, 101`;
`TauCeti/RingTheory/CyclicCohomology/Normalized/Chains.lean:53, 70`;
`TauCeti/LinearAlgebra/TensorCoalgebra/Brace.lean:94`;
`TauCeti/Algebra/Homology/AInfinity/Algebra/Hochschild/Basic.lean:75`, `Complex.lean:49, 103`,
`Cohomology.lean:197, 213, 228`, `Normalized.lean:311`;
`TauCeti/Algebra/Homology/Ext/ProjectiveResolution.lean:107`;
`TauCeti/RingTheory/MvPolynomial/RegularSequence.lean:44, 63`;
`TauCeti/RingTheory/KoszulComplex/Regular.lean:140`;
`TauCeti/LinearAlgebra/TensorProduct/Balanced/Basic.lean:55`;
`TauCeti/Algebra/TensorProduct/Module.lean:47, 51`; `TauCeti/Algebra/CentralSimple/Bimodule.lean:110, 184`;
`TauCeti/LinearAlgebra/ExteriorPower/Basic.lean:145`; `Mathlib/Algebra/Azumaya/Defs.lean:39, 43, 52`;
`Mathlib/Algebra/Module/Projective.lean:240`; `Mathlib/LinearAlgebra/Dual/Lemmas.lean:141, 145`;
`Mathlib/LinearAlgebra/ExteriorPower/Basis.lean:162, 182`; `Mathlib/RingTheory/Smooth/Flat.lean:57`;
`Mathlib/CategoryTheory/Abelian/Projective/Ext.lean:154, 188, 196, 286`;
`Mathlib/AlgebraicTopology/DoldKan/Degeneracies.lean:180`, `HomotopyEquivalence.lean:81`;
`Mathlib/RingTheory/MvPolynomial/Ideal.lean:63`; `Mathlib/RingTheory/Regular/RegularSequence.lean:190`;
`Mathlib/RingTheory/Kaehler/Polynomial.lean:63`; `Mathlib/LinearAlgebra/Dimension/Basic.lean:168`.
"Mathlib has no Hochschild complex, no Koszul complex, no projectivity of exterior powers":
confirmed by search (the only Mathlib hits for "Koszul" are a docstring, a TODO and the Koszul
formula of a connection). Searched by object and not duplicating a target:
`TauCeti/RepresentationTheory/Quiver/PathAlgebra/BimoduleResolution.lean` (path algebras only),
`TauCeti/Algebra/Homology/Monoidal/Cup.lean` (cup along a diagonal in a monoidal category, not
`⊗_A`), `Mathlib/RingTheory/Derivation/ToSquareZero.lean` (commutative, ideal form; §3.3's bimodule
statement is not at the pins).

### Duplication, citations and overlaps

| Citation | Where it resolves now | Agreement |
| --- | --- | --- |
| DGAInfinity Layers 0, 1, 8 | main, README lines 263, 293, 520 | Braces with Koszul signs (Layer 0); chains, cochains, cup product, braces, bracket, `[m,−]` (Layer 8). The brace relation with the multiple brace is listed by the contract as assumed of Layer 0. |
| DerivedModuleAlgebra §0.K.1 | main, README line 126 (contract row) | As cited. §0.5 is R01. |
| NoncommutativeGeometry N1.Cyclic; BanachAlgebras Layer 6; ZigzagPreprojective Layer 7 | main, lines 609–611; 1379; 1047 | Scope clauses. |
| RefinedTraceMethods §§1.1, 1.9, 1.10 | open head, lines 84/115–117, 404–443, 445 | Flat `A`: cyclic bar; non-flat example `𝔽_p/ℤ`; `ε_n` over `σ⁻¹`, `π_nε_n = n!`, `ε₁`; smooth case only for `ℚ ⊆ k`. |
| KTheoryFiniteLocalFields §4.0 | open head, lines 663–681 | Derived chains on DGAInfinity Layer 8; `HH₀(A) = A/[A,A]`; smooth HKR asserted, map unnamed. |
| EulerSystemsAndKolyvaginSystems §6.1; IntegralIwasawaTheory §12.6 | open heads, lines 3943–3962; 1846–1848 | Isomorphism for finite projective `X`; carrier in `TauCeti.StarkSystems`, arguments `R, r, M`. |
| DerivedDeRhamCohomology Layer 2; LanglandsParameterStacks §1.17 | open heads, lines 3044; 527 | Scope deferrals. |

`scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id and no id
only an open revision defines. No `HochschildHomologyAndHKR` folder is on main or in an open pull
request: no second copy. Searched all roadmaps for "Hochschild–Kostant", "polyvector" and a bar
resolution over the enveloping algebra: no match. CyclicHomologyLieHomologyAndQuasiFreeAlgebras
§4.1 uses `Ext²_{Aᵉ}(A,M) = 0` directly over a field and defines quasi-freeness by lifting; it
owns no `HH²` classification.

Overlap check: read CyclicHomologyLieHomologyAndQuasiFreeAlgebras, RefinedTraceMethods,
RationalHomotopyModels, SpectralSequencesAndConvergencePartII, CohomologyOfGroups (the last three
by search), DGAInfinity, NoncommutativeGeometry, DerivedModuleAlgebra; shared: commutative
square-zero extensions and "zero class iff split", owner DerivedModuleAlgebra §0.5, with this
roadmap owning the noncommutative `k`-split case once R01 is applied; the normalised quotient over
`ℂ`, kept by NoncommutativeGeometry N1.Cyclic as now stated; antisymmetrisation and derived
chains, RefinedTraceMethods and KTheoryFiniteLocalFields, imported; brackets and braces,
DGAInfinity, imported; Koszul complex, DerivedModuleAlgebra §0.K.1, imported.

### Supplier order

```text
candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2245 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Suppliers: DGAInfinity and DerivedModuleAlgebra (main);
IntegralIwasawaTheory, KTheoryFiniteLocalFields, EulerSystemsAndKolyvaginSystems and
RefinedTraceMethods (earlier in the merge order); none is on the never-cite list. Edges inside the
roadmap run forward only; §8.4 needs §6.4(a), not §6.4(d), §7.2 or §7.6, so the polynomial case is
free of the gap.

### Gap

`smooth-hkr-antisymmetrisation` (RefinedTraceMethods §1.9): one statement, with its hypotheses
(every commutative `k`, smooth commutative `A`, every `n`). Not already provided: §1.9 at its head
gives the smooth case only for `ℚ ⊆ k`, and `π_nε_n = n!` gives nothing when `n! = 0`
(`𝔽₂[x,y]`, `n = 2`). Same slug in the README (lines 629–634) and in the plan's `gaps`.

### Headline theorems and Lean

Headlines of the summary: normalisation over every `k` (2.1, 2.2); the low degrees and the `HH²`
classification (3.1–3.6); `HH^n ≅ Ext^n`, `HH_n ≅ Tor_n` for `k`-projective `A` (4.4, 4.5); cup
equals Yoneda up to sign (5.4); the homotopy formula and graded commutativity (6.2); the
cohomological HKR theorem with `[⟨D₁,…,D_n⟩] = n!·Ψ_n` (7.6); polynomial algebras (8.4, 8.5). There
is no `Suggested.lean` at the design stage, so the padding probe, the binder audit and the import
check do not apply yet.

### Copyright and arrangement

- **Wording.** The passages at the 24 locators of the sample and six further ones (the bimodule
  convention against Ginz05 lines 934–947, §3.6 against lines 1107–1111, §5.2 against lines
  1342–1350, the §7.3 route against HKR62 lines 531–535, §7.6's route against lines 536–546, the
  §4.2 Check against Ginz05 lines 774–782) were set beside the sources. Nothing is shared beyond
  formulae and standard names.
- **Arrangement.** Ginz05 has the largest share (45 of 113 source mentions). Its sections run §3
  derivations, §4 bar complex, §5 Hochschild theory defined as `Tor` and `Ext`, §6 Gerstenhaber
  structures, §8 Kähler differentials, §9 HKR. The roadmap builds the complexes from simplicial
  modules first, puts the low degrees before the bar resolution, and Layers 2, 6 and 8 have no
  counterpart section. No one-to-one run.
- **Reuse.** No table, figure, exercise list or data set is taken from a source.

Source independence: 30 passages compared with 3 sources (Ginz05, HKR62, AV20), none shared;
largest share Ginz05, 45 of 113 locators; contents compared with Ginz05: independent. Loday98,
Weibel94, CE56, Ger63 and Mat86 could not be read (settled uncertified).

## Not verifiable

- Loday98, Ger63, Weibel94, CE56, Mat86: settled uncertified; their section and theorem numbers
  were not checked against the texts. This covers the CE56 locator of 5.3 and the Loday98 locator
  of 6.3 in the sample.
- Lean elaboration and the one-tactic probe: no Lean file at this stage, and this lane does not
  elaborate.
- The closed form of `s(p,q)` (§5.3) for `p, q ≥ 1` and the signs `ν_n` (§6.3) for `n ≥ 1`: the
  design states their existence; they depend on Mathlib's shift conventions and on DGAInfinity
  Layer 8's chain differential, a roadmap section and not a pinned declaration.
- The declared gap is a contract on RefinedTraceMethods §1.9, not a statement that exists today.

## Source issues

- **Error** in Ginz05 at §6.6, identity (6.6.3), p. 29 (line 1368): the source says the graded commutator of cup products is `d(f∘g) − df∘g − (−1)^p f∘dg`; it should be, for the coboundary of line 1058, `g∪f − (−1)^{pq} f∪g = df∘g + (−1)^q(d(f∘g) − f∘dg)`; affects a stated result.
- **Misprint** in Ginz05 at §3.1, p. 9 (line 404): the source says `ad m` maps `M → M` and is a derivation of `M`, for `m ∈ m`; it should be a map `A → M`, a derivation from `A` to `M`, for `m ∈ M`; affects nothing.
- **Misprint** in Ginz05 at §6.6, formula (6.6.2), p. 29 (line 1363): the source says the inner cochain takes the arguments `a_i,…,a_{i+q}`; it should be `a_i,…,a_{i+q−1}`, `q` arguments; affects nothing.
- **Misprint** in Ginz05 at §5.2, p. 22 (lines 1051–1053): the source says the inner terms of the recalled chain boundary carry no sign; it should be `(−1)^j` on the `j`-th term, as at lines 973–976; affects nothing.
- **Gap** in Ginz05 at §9.3, proof of Theorem 9.1.3, p. 46 (lines 2193–2196): the source says the diagonal ideal of `A ⊗ A` is generated by a regular sequence when `X` is smooth; it should be claimed only after localising at points of the diagonal; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4dc1c2233079b1185e984a290abc68f79b933288", "job": "REV-DESIGN-HochschildHomologyAndHKR~9", "model": "fable", "worker": "chris-x55"} -->

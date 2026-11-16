# PKG-EllipticCurveModularityImaginaryQuadraticPartII

Package of the accepted design (review of 2026-11-15: accepted, no finding, conditional on the
declared gap `acc-torsion-inertial-comparison`). Deliverables:
`packages/EllipticCurveModularityImaginaryQuadraticPartII/README.md`, `Suggested.lean`,
`metadata.toml` (`topic = "math.NT"`, as on main), `sources.toml`, and the `gaps` entry of
`design/plan.json` (wording of `needs` only).

## Headline theorems

| Headline | Lean | What it lacks at the pins |
|---|---|---|
| Theorem 2.5: every elliptic curve over a CM field with `ζ₅ ∉ K` is modular, with all-prime realization, full WD compatibility away from `ℓ`, all finite local factors, complex parameter and `L(E/K, s) = L(π_E, s − 1/2)` | not statable | automorphic representations of `GL₂(𝔸_K)` and their attached Galois representations; WD representations and local Langlands; `L`-functions of elliptic curves and automorphic representations over number fields. The Galois side exists (Tau Ceti `WeierstrassCurve.tateModuleGaloisRepresentation`, checked by `#check`), Mathlib has `NumberField.AdeleRing`, but nothing automorphic |
| Theorem 6.2: potentially Barsotti–Tate lifting at five over CM fields with a protected place | not statable | the same automorphic carriers, plus potentially semistable `p`-adic local representations with labelled Hodge–Tate weights (no Hodge–Tate or Weil–Deligne declaration in either pinned tree) |
| Theorem 8.1: every elliptic curve over every CM field is modular, same conclusions | not statable | as Theorem 2.5 |

`Suggested.lean` therefore declares nothing: `module`, `import Mathlib`, the module docstring
naming the three headlines and their missing carriers, and the empty namespace
`TauCetiRoadmap.EllipticCurveModularityImaginaryQuadraticPartII` (the form of
`TauCetiRoadmap/CFSGStatement/Suggested.lean` on main). Layer 1 (CM-ness of cyclotomic extensions)
and Layer 3 (finite-group and local cohomology) are statable at the pins but are proof ingredients,
not headlines, and stay in the README with their Checks.

## Elaboration

`lake env lean` on the absolute path of `Suggested.lean`, run from the content checkout: exit 0, **0
`sorry` warnings, no other message**. No `TauCeti.*` import, so nothing was built. There is no
declaration, so the `#check @name` comparison of elaborated types against the README has nothing to
compare; instead a scratch file `#check`ed every pinned declaration the README cites (all
elaborate): `NumberField.IsCMField`, `NumberField.IsCMField.of_isAbelianGalois`,
`IsCyclotomicExtension.Rat.isCMField` (hypothesis `∃ n ∈ S, 2 < n`, now stated in the contract),
`IsCyclotomicExtension`, `IsPrimitiveRoot`, `NumberField.isTotallyComplex_of_algebra`,
`Matrix.SpecialLinearGroup.toGL`, `Matrix.SL2.commutator_eq_top` (hypotheses `a ≠ 0`, `a² ≠ 1`),
`groupCohomology`, `groupCohomology.map`, `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd`,
`Representation.linHom`, `LinearMap.trace`, `NumberField.maximalRealSubfield`,
`TauCeti.ClassFieldTheory.eulerCharacteristic_mixed`,
`TauCeti.ClassFieldTheory.tateDualityPairing_perfect_mixed`,
`WeierstrassCurve.tateModuleGaloisRepresentation`, `continuousCohomology`, `NumberField.AdeleRing`.
Pins read from `lake-manifest.json`: Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…`.

## Corrections to the design, and what the design could not support

- **Supplier contracts reshaped.** "From other roadmaps" and "Supplier obligations" became one
  `From TauCetiRoadmap.<X>` subsection per supplier, each with the sections consumed and what is
  assumed; the gap sentence now sits in the AutomorphicGaloisRepresentationsPartII subsection as
  `What AutomorphicGaloisRepresentationsPartII must provide (gap:acc-torsion-inertial-comparison): …`,
  and `plan.json` `gaps[0].needs` was reworded to match (slug, supplier, section unchanged).
- **FaltingsFinitenessAndIsogenyTheorems.** The design attributed "absolute irreducibility of `H¹` of
  a non-CM curve over every finite extension" to R28.6.2–R28.6.3. Those sections state
  semisimplicity and the Tate Hom comparison only; the contract now says absolute irreducibility is
  derived from them (`End_{ℚ_ℓ[G_L]} V_ℓE = End_L(E) ⊗ ℚ_ℓ = ℚ_ℓ`), as the parent's §8.4 does.
- **Lean paragraph.** A first draft said Tau Ceti has no `ℓ`-adic objects; the pinned tree has
  `WeierstrassCurve.tateModuleGaloisRepresentation` (`TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean`).
  README and docstring now say the Galois side exists and the automorphic side is missing.
- **MordellLawrenceVenkatesh §1.4** (largest CM-or-totally-real subfield) is now cited with §1.3 in
  Scope, contracts and Theorem 1.1(b): with `K = L` CM it gives every subfield of `L` totally real or
  CM, which is 1.1(b) before the totally-complex step.
- **Missing `*Needs:*` lines** added to the three definitions §3.3, §5.1, §5.2.
- **Timeless wording.** "No roadmap cites these outputs" (Downstream consumers) removed; the
  section is now a list of consumers, naming EllipticCurveModularityTotallyReal. "Status of the
  sources" renamed "Sources". "Outside this roadmap" names EllipticCurveModularityTotallyReal.
- **References.** ACC23 Proposition 6.5.13, listed but cited nowhere in the body, dropped; CN23
  Theorem 4.2.15 (p. 71, line 3749) and Lemma 5.6.4 (p. 85, line 4397), cited in the
  CrystallineLocalGlobalCompatibilityCM contract, added; contract citations normalised to `CN23, …`.
- **`sources.toml`.** Locators of CN23, ACC23, AKT23 and OpenAI26 trimmed to what the README cites;
  ACC23 `cited_for` now `["Conventions", "5.3", "6.1", "Exact supplier contracts"]` (the "Supplier
  obligations" heading no longer exists). No new source, no fetch, no `needs-references.toml`.

No notion was moved down from a later roadmap.

## Duplication sweep (by object)

Nothing was deleted: no target exists elsewhere in the form stated here.

| Object | Searched | Finding | Action |
|---|---|---|---|
| 1.1(a) cyclotomic extension of a CM field is CM | Mathlib `CMField.lean` (all declarations listed), Tau Ceti `ComplexConjugation/*`, roadmaps grep | Mathlib only over `ℚ`; EllipticCurveModularityTotallyReal §1.1 (later, order 207) owns the totally real base and names this roadmap for CM bases; ShimuraData §additional axioms uses "a compositum of CM fields is CM" as a remark, no target | kept, owner here |
| 1.1(b) intermediate fields of CM fields | MordellLawrenceVenkatesh §§1.3–1.4 | follows from §1.4 with `K = L` | kept as the instance; §1.4 cited |
| 1.2 descent of decomposed genericity | AGR-II AG2.7, PAI §2.1 | AG2.7 defines, PAI §2.1 goes up along disjoint extensions; descent not stated | kept |
| 3.1 `H⁰(SL₂(k), ad⁰) = 0` | ArithmeticGaloisRepresentations §7.7 | stated there only for finite `k`, odd characteristic, `#k ≠ 5` | kept variant: every `k` with `2 ∈ k^×`, `𝔽₅` included |
| 3.2 detection by `⟨U⟩` | AGRep §7.7, CLGC-CM §9.3, roadmaps grep | none | kept |
| 3.3–3.5 protected data, unipotent-inertia ring, tangent line | LGDR §§2.3, 2.5, 2.8, 2.21; AGD R02.4.2 | LGDR §2.5 is for trivial residual data; R02.4.2 assumes `M` unramified | kept variants, differences stated |
| 4.1–4.3, 5.1–5.4, 6.1–6.2 | CLGC-CM §§9.1–9.12, AKT-based §9.3, roadmaps grep "protected", "SL₂(𝔽₅)" | CLGC-CM excludes exactly this case (clause (15)); no other owner | kept |
| 7.1–7.5 | parent Layers 2, 6, 7; roadmaps grep "width-three" | parent has width-one nodes only; §7.4 extends `switch_five` | kept |
| ACC Theorem 3.1.1 (torsion inertial comparison) | AGR-II AG2.5 at its head (no "3.1.1" of ACC), PAI, CLGC-CM | consumed by three roadmaps, stated by none | gap kept |

Ownership against open work: the overlap listing (`roadmaps overlaps`) shows no pull request changing this roadmap, no
dropped id. Read the scope of the closest roadmaps (EllipticCurveModularityImaginaryQuadratic,
EllipticCurveModularityTotallyReal, PotentialAutomorphyInfrastructurePartII,
CrystallineLocalGlobalCompatibilityCM, OrdinaryAutomorphicFormsAndModularityLiftingPartII) at their
heads; nothing shared. No `Suggested.lean` declaration exists, so no name collision is possible.

## Citations resolved this round

Every supplier README was read at its current head (`roadmaps show`) or on main:
EllipticCurveModularityImaginaryQuadratic (§0.2, §0.3 with every named target, §§1.1, 1.3, 2.1–2.3,
4.1–4.4, 5.1–5.3, 6.1, 6.3, 6.5, 6.6, 7.1–7.4, 8.1–8.6, Downstream; "imaginary CM" there means
CM, so §0.3 and §§5.2–5.3 hold over every CM field), CrystallineLocalGlobalCompatibilityCM (§§7.5,
8.1–8.7, 9.1 clauses (5)–(15), 9.3–9.12), PotentialAutomorphyInfrastructure (§§2.1, 2.3, 2.5),
AutomorphicGaloisRepresentationsPartII (AG2.0, AG2.5, AG2.7 names), AutomorphicGaloisRepresentations
§3.13, AbelianSchemesAndArithmeticModuli A6 (main), PotentialModularityAndCompatibleSystems
§§2.12–2.16, GL2ModularityLifting §1.7, GL2AutomorphicRepresentationsAndTransfer R16.3.2, R17.4.16,
GlobalGaloisDeformations §§3.4, 3.6, 3.7, 5.1, 5.5, 5.6, LocalGaloisDeformationRings §§1.10, 2.3,
2.5, 2.6, 2.8, 2.15, 2.16, 2.21, 3.14, 4.14, 4.15, 6.6, DeformationAndDerivedPatchingAlgebra
§§8.1–8.5, ArithmeticGaloisDuality R02.2, R02.4.2, ArithmeticGaloisRepresentations §§2.1, 4.3, 6.3,
7.2, 7.7, 7.9 (`ResidualImage.adZeroRep` at its line 5249), MordellLawrenceVenkatesh §§1.3–1.4,
FaltingsFinitenessAndIsogenyTheorems R28.6.2–R28.6.3, NeronModelsAndSemistableAbelianVarieties
§§3.1, 3.12, 5.1, EllipticCurves Layers 4–5, ClassFieldTheory Layers 5 and 11,
SchemeAndStackFoundations §§4.13, 4.18, Chebotarev Layer 10 (main), ModularityAndLanglandsExtensions
§§2.29–2.30 (named only as out of scope and downstream). `roadmaps resolve` on the final README:
no Lean name found nowhere; three leads `LeHung26, §4.4`, `OpenAI26, §9.4`, `CaptainSude26, §4`
are source keys followed by a section, not roadmaps (false positives). Source line locators
spot-checked in the cached texts: CaptainSude26 lines 26, 120, 177, 231, 242, 291, 410, 503, 533,
538, 604, 634, 671; LeHung26 86, 125, 352, 357; CN23 3749, 3849, 4261, 4334, 4397, 4404, 4513,
4545, 4562, 4574; ACC23 2346, 7163; AKT23 3979; MilneCM 273, 292, 296: each is the cited statement.

## Adversarial pass

Values computed by hand and, for the finite groups, by brute-force linear algebra over `𝔽_p` on all
of `SL₂(𝔽_p)` (cocycle equations on generators `U`, `[[0,−1],[1,0]]`).

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: Frobenius witness | `q_v = 11, 7` over `𝔽₅` | `U¹¹ = [[1,11],[0,1]] = U`; `U⁷ = [[1,2],[0,1]]`; `7⁻¹ ≡ 3 mod 5` | scalar Frobenius iff `q_v ≡ 1`; arithmetic vs geometric separated | none |
| Conventions: `Ad(U)`, Gram matrix | basis `e, h, f` | `UhU⁻¹ = [[1,−2],[0,−1]] = h − 2e`; `UfU⁻¹ = [[1,−1],[1,−1]] = f + h − e`; Gram `[[0,0,1],[0,2,0],[1,0,0]]`, det `−2` | holds; degenerate in char 2 | none |
| 1.1(a) | `ℚ(i) ⊂ ℚ(ζ₂₀)`; `S = {1,2}`; `ℚ(√−3)`, `S = {4}`; `ℚ(2^{1/3})` | `Gal = {1,9,13,17} ≅ C₄`; middle field `ℚ(i,√5)`; `L = K`; `ℚ(ζ₁₂)`; `S₃` 3-cycle moves `2^{1/3}` | true for CM `K`; control fails | none |
| 1.1(b) | `ℚ(i) ⊂ ℚ(i,√5) ⊂ ℚ(i,√3,√5)`; `ℚ(√5) ⊂ ℚ(ζ₂₀)` | 7 quadratic subfields `d ∈ {−1,±3,±5,±15}`, roots of unity `μ₁₂`; `ℚ(√5)` totally real | true; `K ⊆ K'` needed | MLV §1.4 cited |
| 1.2 and converse | `1 ⊕ 1` over `𝔽₃`, `ℚ ⊂ ℚ(ζ₃)` | over `ℚ`: `q = 2`, ratio `1 ≠ 2`; over `ℚ(ζ₃)`: split `q ≡ 1 mod 3`, ratio `1 = q` | descent holds, converse fails | none |
| Layer 1 Examples: `K₆₀` | `(ℤ/60)ˣ` | `{a : a ≡ ±1 mod 15, a ≡ 1 mod 4} = {1, 29}`; `29 ≡ 4 mod 5`, `29 ≡ 2 mod 3` | `ζ₅ ∉ K₆₀`, `K₆₀(ζ₃) = ℚ(ζ₆₀)` | none |
| 2.1 | `K₆₀`; imaginary quadratic `K` | parent §5.3 needs `ζ₅ ∉ L` for `L = K`, holds; §7.4(1) pair `(3,5)` gives the residual hypotheses over `F`, Theorem 1.2 moves them to `K` | seed over `K`, not `F` | none |
| 2.2 | lifting primes | rows at `p, 3, p` with `p > 100`; `χ_(h(t))² = 1` | five-adic clause never used | none |
| 2.3 | `q_v = 4`, `a = 4`; split mult.; `ℚ(ζ₈)`, `z = i` | `T² − 4T + 4 = (T−2)²`, unitary roots `1,1`; `((1−T)(1−4T))⁻¹` vs `(1−T)⁻¹`; two complex places, `diag(i,−i)`, trace 0, det 1 | holds | none |
| 2.4 | `y² = x³ − x`, `y² = x³ + 1` over `ℚ(ζ₈)`; `y² = x³ − x` over `ℚ(√−3)` | quadratic subfields of `ℚ(ζ₈)`: `ℚ(i), ℚ(√2), ℚ(√−2)`; `ℚ(ζ₈,√−3) = ℚ(ζ₂₄)` | sum vs induction as stated | none |
| 2.5 (headline) | `ℚ(i)`, `K₆₀`, `ℚ(i,√5)`, `ℚ(ζ₅)` | `ζ₅ ∈ K`: no, no, no (`(ℤ/2)²` has no `C₄` quotient), yes | applies ×3, excludes `ℚ(ζ₅)` | none |
| 3.1 | `X = [[x,y],[z,−x]]`; `diag(2,3)`; char 2 | `UX − XU = [[z,−2x],[0,−z]]`, `UᵀX − XUᵀ = [[−y,0],[2x,y]]`; `2·3⁻¹ = 3·2⁻¹ = 4` in `𝔽₅`; `tr 1 = 0` in char 2; brute force `dim H⁰(SL₂(𝔽_p), ad⁰) = 0` for `p = 3, 5, 7` | invariants vanish iff `2 ∈ k^×` | none |
| 3.2 | `p = 5`; `p = 7`; `p = 3`; order-3 subgroup | brute force: `dim H¹(SL₂(𝔽₅),ad⁰) = 1` (`Z¹ = 4`, `B¹ = 3`), `dim H¹(⟨U⟩) = 1`, restriction rank 1; `p = 7`: `0`, `1`, rank 0; `p = 3`: `H¹(⟨U⟩) = 0`; restriction to `⟨[[0,−1],[1,−1]]⟩` rank 0; norm `5 + 10N + 10N² ≡ 0`, `(D−1)² f = −2e` | bijective exactly at five | none |
| 3.3 (definition) | `M = [[0,−1],[1,−1]]`, `Φ = [[4,1],[0,1]]` over `𝔽₅`, `q = 11`; `e = 3, 5` | `M² = [[4,1],[4,0]]`, `M³ = 1`, `Φ² = 1`, `ΦMΦ⁻¹ = [[4,1],[4,0]] = M¹¹`, char. poly `X² + X + 1`; `ρ̄(φ)Uρ̄(φ)⁻¹ = 1 + (a/d)E₁₂` forces `a/d = q_v`; `φτ^{−b}` makes `a(1+bE₁₂)` scalar; `U⁵ = 1` | non-example excluded; protection lost iff `p ∣ e` | `*Needs:*` added |
| 3.4 | `N = [[a,b],[−a²/b,−a]]`; `q = 11`; first-order lifts; `𝔽₂₅` | `det N = −a² + a² = 0`; `q(q+1)²δ² = (1+q)²ψ(φ)`: `11·144 = 1584`; `(1+εf)U` trace `2+ε`, `(1+εh)U` trace 2 det `1−ε²=1`; `φτ^x` shifts `ζ` by `x ∈ 𝔽₅` | equivalence, dimension 3 | none |
| 3.5 | `p ≥ 5`, `q ≡ 1 mod p`; `q ≡ 2 mod 5` | `Σ_{j<q} D^j = q + C(q,2)N + C(q,3)N² ≡ 1`; `Z¹ = 3 + 1`, `B¹ = 2`, `h¹ = 2`; Euler char `2 = 1 + 1`; `φ` scales `e` by 2: `h⁰ = 0` | holds; `p ≥ 5` used | none |
| 4.1 | `ρ̄(I_v)` of order 2; image `SL₂(𝔽₇)` | restriction to order-2 is 0 (2 invertible); brute force `H¹(SL₂(𝔽₇),ad⁰) = 0` | protected place needed only at five | none |
| 4.2 | `g = diag(2,3)` | `det = 6 ≡ 1`; `Ad(g)` eigenvalues `4,1,4`; `(Ad g − 1)M = ⟨e,f⟩`; coinvariants 1-dim | holds | none |
| 4.3 | `ℚ(ζ₅)`, `t=1`, `r=6`; `d=2`, `t=3`, `r=10` | `g = 6−6−1+1 = 0`; `g = 10−6−1+3 = 6`; `1+9+4 = 14`, `14+6 = 20 = 10+12−2`; `1+11+10 = 22` | deficit `d` | none |
| 5.1 (definition) | `[F⁺:ℚ] = 40`, degrees `(8,8,24)`; five 8's; `d = 36` | `24 > 20`, `8 < 20`; `24 > 20` everywhere; `d = 36` forces all 8, `8 ∤ 36`; `d > 32` | least `d = 40` | `*Needs:*` added |
| 5.2 (definition) | `d = 40`, ten places of degree 8, `R = ∅` | `1 + 10·11 = 111 = 1 + 30 + 80` | holds | `*Needs:*` added |
| 5.3 | `v ∈ P`; `w = v^c`, `q_w = 11` | torus operators trivial, `P_{v,σ} = (X−1)²`; with `χ_v`: `(X−χ_v(u))(X−χ_v(u)⁻¹)`; Iwahori index 12, diamond kernel 60; `diag(1+ε,1−ε)¹¹ = diag(1+11ε,1−11ε) = itself` in `𝔽₅[ε]` | `Q ∩ S^c = ∅` needed | none |
| 5.4 | `d = 40`, `t = 10`, `r = 111` | `g = r − 111 = 0`; `dim R_∞ = 111 + 40 − 40 = 111`; `dim S_∞ = 151` | deficit `40 = l₀` | none |
| 6.1 | `p_b = 109`, `p_c = 2617`, `q = 11`; `E = ℚ(√31,√59,√71)` | both prime; `2617 = 6·436 + 1`; `109 ≡ 2617 ≡ 10 mod 11`, `436 ≡ 7 mod 11`; Legendre `(−436/11) = (−4·2617/11) = (−2617/109) = (−109/2617) = 1`; `31,59,71` squares mod 5 and mod 11, all `≡ 3 mod 4`; `16 − 2 − 2 = 12 > 8` | holds | none |
| 6.2 (headline) | `𝔽₂₅`, `μ² = 2`, `γ = diag(1,2)`; `det ρ̄` of order 4 | `det(μγ) = 4 = −1`, `tr = 3μ ∉ 𝔽₅`, `(μγ)² = diag(2,3)`; group order 240, scalars `±1`, projective order 120; both kernels index 120; order 4: `240 > 120` | `ζ₅ ∈ F` not implied by failure of (4); reduction to `SL₂(𝔽₅)` correct | none |
| 7.1 | involution on 3 nodes; `2(P₀ + rT') = c₀`; `p = 101` | 1 or 3 fixed, 3 gives genus 2; `2P₀ ∈ ker`, unique `r ∈ ℤ/3`; thickness `2+1 = 1+1+1 = 3`; `606`, `303·R_* = a/2` | type `I₃` | none |
| 7.2 | `v(s) = 1, 5, 7` | `v(Δ_min) = 3, 15, 21` | `5 ∤ m_v` needed | none |
| 7.3 | `v(q_A) = 3, 15` | residual inertia `[[1,3],[0,1]]`, trivial | holds | none |
| 7.4 | `Σ = ∅` | reduces to `switch_five` (parent §0.3, no `ζ₅ ∉ F` hypothesis) | holds | none |
| 7.5 | transvections with coefficient 3 | brute force: `⟨[[1,3],[0,1]],[[1,0],[3,1]]⟩` has order 120, one transvection order 5; `v ≠ v^c` for `q` split completely | image `SL₂(𝔽₅)`, hypotheses of 6.2 met | none |
| 8.1 (headline) | `ℚ(ζ₅)`, `ℚ(ζ₁₅)`, `ℚ(ζ₂₀)`, `K₆₀`, `ℚ(i,√5)` | `ζ₅ ∈ K`: yes, yes, yes, no, no; `K₆₀(ζ₅) = ℚ(ζ₆₀)` | branches exhaustive | none |
| Contract: Faltings | non-CM `E/L` | `End_L(E) = ℤ` ⇒ commutant `ℚ_ℓ`; semisimple + commutant `ℚ_ℓ` ⇒ absolutely irreducible | derived, not stated by supplier | wording fixed |
| Contract: PAI §2.3, §2.5; AG2.7; MLV §1.4 | read at heads | statements as summarised | holds | new wording |
| `Suggested.lean` docstring | pinned trees | no `AutomorphicForm`, `WeilDeligne`, `HodgeTate`, local Langlands; Tate-module representation present | docstring accurate after fix | fixed |

## Dependency check

```text
depcheck: 241 roadmaps, 2269 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap is already in the merge order (line 206, right after
EllipticCurveModularityImaginaryQuadratic); every supplier named in the contracts is earlier
(the latest, EllipticCurveModularityImaginaryQuadratic at 205) or on main. The later roadmaps
EllipticCurveModularityTotallyReal (207), ModularityAndLanglandsExtensions (208) and
BianchiModularForms (209) are named only in Scope ("Outside this roadmap") and Downstream consumers.

## Not checked, and notes for humans

- The global patching arguments of CaptainSude26 (lines 315–408, 445–498) beyond their hypotheses,
  counts and local computations: no refereed source states them.
- The human-review questions of the accepting review (scope resting on unrefereed CaptainSude26 and
  LeHung26; licences of CaptainSude26, OpenAI26, MilneCM, LeHung26) are unchanged.
- No untrusted text contained instructions.

<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13499#issuecomment-6793485178 -->
Red team round 2 pass b (claude) of 350b71b

Verdict: needs_changes

1. **F01** (P2) §4.3: `π_E = AI_{KT/K}(ξ)` is off by the half twist; "unitarily normalized" is not a defined operation

   **Location.** `packages/EllipticCurveModularityTotallyReal/README.md:1338–1340`: "the quadratic
   automorphic induction `π_E = AI_{KT/K}(ξ)`, unitarily normalized, is cuspidal of type `(2,0)` with
   trivial central character and `ρ_{π_E,ι} ≅ H¹(E)`"; and README:1358–1359: "The good polynomials of
   `AI(ξ)` and of `Ind ξ_ι` agree".

   **Claim.** With ξ the algebraic Hecke character whose value at a good place is the geometric
   Frobenius eigenvalue on `H¹(E)` (README:1354–1355), `AI_{KT/K}(ξ)` has type `(2,0)`, trivial central
   character and attached representation `H¹(E)`.

   **Witness.** GL2AutomorphicRepresentationsAndTransfer R17.4.16 defines `AI_{K/F}(θ)` for any Hecke
   character, with local parameter `Ind θ_w` and central character `η_{K/F}·θ|_{𝔸_F^×}`. The roadmap's
   Conventions (README:142–143) read the Galois side through `rec(π_v ⊗ |det|_v^{−1/2})`. For
   `y² = x³ − x` over ℚ at the split prime 5 (README:1375–1377, `ξ(𝔭) = −1 ± 2i`):

   | Object | Satake parameters at 5 | product (central character at `ϖ₅`) | trace of `rec(π₅ ⊗ \|det\|^{−1/2})` |
   |---|---|---|---|
   | `AI(ξ)` | `−1 ± 2i` | 5 | `√5·(−2) = −2√5` |
   | `AI(ξ‖·‖^{1/2})` | `(−1 ± 2i)/√5` | 1 | `−2 = a₅` |

   So `AI(ξ)` has central character `‖·‖⁻¹`, not trivial, and `t₅ = −2√5 ≠ a₅`. The source states the
   twist explicitly (OpenAI26 line 1210: the induced representation is normalised by `|det|^{1/2}`),
   and the parent's §8.6 names "the algebraic-to-unitary norm twist". No Check of §4.3 pins it.

   **Repair.**

   1. README:1338–1340, replace "and the quadratic automorphic induction `π_E = AI_{KT/K}(ξ)`,
      unitarily normalized, is cuspidal …" by: "and, with `ξ^u = ξ·‖·‖_{KT}^{1/2}` the unitary Hecke
      character of KT (`‖ϖ_w‖ = q_w⁻¹`, so `ξ^u(ϖ_w) = ξ(w)q_w^{−1/2}`), the quadratic automorphic
      induction `π_E = AI_{KT/K}(ξ^u) = AI_{KT/K}(ξ) ⊗ |det|^{1/2}` is cuspidal of type `(2,0)` with
      trivial central character and `ρ_{π_E,ι} ≅ H¹(E)`."
   2. README:1358–1359, replace "The good polynomials of `AI(ξ)` and of `Ind ξ_ι` agree, and
      recognition identifies the representations." by: "By R17.4.16 the local parameter of `π_{E,v}` is
      `Ind ξ^u_w`, so `rec(π_{E,v} ⊗ |det|_v^{−1/2})` is `Ind ξ_w`, the parameter of `Ind ξ_ι`; the good
      polynomials agree and recognition identifies the representations. The central character is
      `η_{KT/K}·ξ^u|_{𝔸_K^×} = 1`: `det Ind ξ_ι = ε_ℓ⁻¹` gives `ξ|_{𝔸_K^×} = η_{KT/K}‖·‖_K⁻¹`, and
      `‖·‖_{KT}^{1/2}` restricts to `‖·‖_K`."
   3. Add to the Checks of §4.3: "Normalisation: for `y² = x³ − x` over ℚ at 5, `AI(ξ)` has Satake
      parameters `−1 ± 2i`, of product 5, and `rec(π₅ ⊗ |det|^{−1/2})` would have trace `−2√5`;
      `AI(ξ‖·‖^{1/2})` has parameters `(−1 ± 2i)/√5`, of product 1, and trace `−2 = a₅`. At the inert
      prime 3, `ξ(3) = −3 = η(3)·|3|⁻¹`, so `ξ|_{𝔸_ℚ^×} = η‖·‖⁻¹` and the central character of `π_E` is
      trivial."

   Tested on the refuting instance: with `ξ^u`, the product of the parameters at 5 is
   `(1 + 4)/5 = 1` and the shifted trace is `√5·(−2/√5) = −2`; at 3 (inert, `a₃ = 0`, Frobenius
   eigenvalues `±√−3` on `H¹`), `ξ(3𝒪) = (±√−3)² = −3 = (−1)·3`.

One new finding (S01, P2): the normalisation of the CM automorphic induction in §4.3. The three
round-1 findings are repaired and the repairs introduced no error. The three declared supplier gaps
are not raised.

## Round-1 findings at this head

| Earlier finding | Status | Witness at 350b71b |
|---|---|---|
| 1a/F01 (P3), "reducible restriction … several descents" | repaired | `packages/EllipticCurveModularityTotallyReal/README.md:1264–1275`: "If `ρ\|G_L` is irreducible and `ρ′\|G_L ≅ ρ\|G_L` … `ρ′ ≅ ρ ⊗ ψ`; the `[L:K]` twists are pairwise non-isomorphic", then the S₃ example with one descent and `1 ⊕ 1` with three. Recomputed: disc(`x³−4x+1`) = 256 − 27 = 229; `f(1) = −2`, `f(−1) = 4`; representations of `C₂` of dimension two: `1⊕1`, `1⊕sgn`, `sgn⊕sgn`. |
| 1b/F01 (P2), JacobianChallenge cited for a curve without a rational point | repaired | README:272–275: "curve over a field with a rational point … the curves `C^δ_m` have one, `φ⁻¹(O, 1)` of §1.2(6)"; README:586–592 proves it. Recomputed: `f(−Z)f(Z) = 1` and `f(O) = 1` (parent §1.2), so `w(O,1) = (−O, 1⁻¹) = (O,1)`; for `δ(g) = −1`, `g ⋆ (O,ζ) = w(O,ζ⁻¹) = (O,ζ)`. |
| 1b/F02 (P3), EllipticCurves contract and *Needs:* lines | repaired (differently, reason holds) | README:258–268 lists Layers 4, 4.5a, 5, 0.5 and 1 with their uses; README:1315–1318 and 1367 carry the *Needs:*. Layer titles on main: 0.5 "base change, Galois actions, translations, and descent", 4 "reduction, Tate's algorithm, the Tate curve", 4.5a "invariant theory over a Dedekind domain", 5 "twists". The pinned predicates `HasGoodReduction`, `HasMultiplicativeReduction`, `HasAdditiveReduction`, `HasSplitMultiplicativeReduction` are at `Mathlib/AlgebraicGeometry/EllipticCurve/Reduction.lean:324, 341, 348, 360`, each extending `IsMinimal` (line 275). |

No repair report item was marked `not actionable in this package`; nothing is re-raised.

## Verified sound

**Suggested.lean declarations (2 read, both compared with the elaborated signatures supplied in the
scratch directory; no Lean was run in this read-only pass, and no binder is lost).**

| Declaration | Section, context | Instances and values | Result |
|---|---|---|---|
| `realCyclotomic_isCMField` | Layer 1; no `variable` block; own binders `[NumberField k] [IsTotallyReal k] [NumberField M] [Algebra k M] (hn : 2 < n) [IsCyclotomicExtension {n} k M] (hζ)` | k = ℚ, n = 3: `ζ+ζ⁻¹ = −1`, L = ℚ = `maximalRealSubfield ℚ(√−3)`. n = 4: `ζ+ζ⁻¹ = 0`, L = ℚ. `k = ℚ(√2)`, n = 8: `ζ₈+ζ₈⁻¹ = √2`, L = k, `[M:L] = 2`. `k = ℚ(√5)`, n = 5: `(−1+√5)/2 ∈ k`. n ≤ 2 excluded by `hn` (`ζ+ζ⁻¹ = ±2`, M = k real). k not totally real (`ℚ(i)`, n = 3): L = `ℚ(i)` ≠ `ℚ(√3)`, excluded by `IsTotallyReal k`. | true as typed; equals README §1.1 item 4 |
| `three_five_switch` | Layer 2; own binders `[NumberField K] [DecidableEq (AlgebraicClosure K)] (W) [W.IsElliptic]` | `ζ₃ ∈ K`: image is exactly `SL₂(𝔽₃)`, statement asks only for `SL₂`. Basis independence: `SL₂(𝔽₃) ⊴ GL₂(𝔽₃)`, and the clause quantifies over all g, so row or column conventions do not matter. `α = 2·id` on `E[5]` is equivariant with `e₅(2P,2Q) = e₅(P,Q)⁴`, excluded by the pairing clause. Infinite set: the j-map is finite of degree 60 on the twist. | true as typed; equals README §2.3 |

Pinned carriers read: `NumberField.IsCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean:70`,
fields `IsTotallyComplex` and `IsQuadraticExtension (maximalRealSubfield K) K`),
`NumberField.CMExtension.eq_maximalRealSubfield` (:456), `NumberField.IsCMField.ofCMExtension` (:510),
`IsCyclotomicExtension.Rat.isCMField` (:564, base ℚ only: the relative statement is not at the pin,
so `realCyclotomic_isCMField` is not a one-lemma consequence);
`WeierstrassCurve.torsionGaloisAction`, `TauCeti.Isogeny.weilPairing`,
`TauCeti.Isogeny.pointTorsionModule`, `WeierstrassCurve.nonempty_basis_torsionBy`,
`WeierstrassCurve.weilPairing_torsionGaloisAction`, `TauCeti.det_tateModuleGaloisRepresentation`,
the quadratic-twist declarations and `TauCeti.Isogeny.Hom.pullbackDifferential*` at the Tau Ceti pin.
Imports: `import Mathlib` and three existing `TauCeti.*` modules, each used. No `set_option`, `lemma`,
`#eval`, sorry'd data or placeholder. No other roadmap declares either name.

**Headline theorems.** §4.4 (endpoint), §4.2, §4.1, §4.3, §§2.1, 2.2, 2.4, 2.5, §§1.2–1.6,
§§3.1–3.3: not statable at the pins, each named in the module docstring with its missing carrier.
§1.1 item 4 and §2.3: stated. No padding found: neither declaration follows from one library lemma.

**Adversarial pass (all 18 numbered sections read, with the Conventions and supplier contracts;
values computed).**

| Statement | Instances tried | Values | Result |
|---|---|---|---|
| Conventions, 11a1 at 3 | `a₃ = −1` | `X²+X+3`; `L(s−½,π₃) = (1+3^{−s}+3^{1−2s})⁻¹`; reversed shift `(1+3^{−s−1}+3^{−2s−1})⁻¹` | agree |
| Conventions, `y²=x³−x+1` over `𝔽₅` | point counts | 8 points, `a₅ = −2`; twist `y² = 3(x³−x+1)`: 4 points, `a₅ = 2` | agree |
| Conventions, twist rule on `H¹` | `X: y²=x³+1`, `b³ = 2` | `a_g(x,y) = (ζ₃⁻¹x, y)`; transported action `ζ₃ω`; `(a_g⁻¹)^*ω = ζ₃ω`, `a_g^*ω = ζ₃⁻¹ω` | agree |
| §1.1 fifth item | k totally real, ℓ odd, ℓ ∣ n | `L ⊊ L(ζ_ℓ) ⊆ M`, `[M:L] = 2` | true |
| §1.2 genus and twist | m = 3; forced cubic at n = 5 | `2g−2 = 2·2 = 4`, g = 3; four branch points: `2g−2 = 8`, g = 5 | agree |
| §1.2(2) | `δ(g) = −1` | `φ⁻¹w u_{ζ⁻¹} wφ = u′_ζ`; `R² = [[−1,1],[−1,0]] = R⁻¹ = WRW`, `R³ = I` | agree |
| §1.4 pairing | `[x,y] = ⟨x, w′^*y⟩` | `[y,x] = ⟨w′^*y, x⟩ = −[x,y]`; `W_θ^∨ ≅ W_θ ⊗ ε_ℓ`, roots `{α/q, β/q} = {β⁻¹, α⁻¹}`, labels `−{0,1} = {0,1} − 1` | det `ε_ℓ⁻¹` |
| §1.4 restriction witness | k = ℚ, n = 3, v = 5 | `P_{1,5} = X²−2X+5`; `(1±2i)² = −3±4i`, `X²+6X+25`; 32 points over `𝔽₂₅` | agree |
| §1.4 ramified witness | `L′ = ℚ(√5)` | e = 2, f = 1, polynomial unchanged; −3 ≡ 2 nonsquare mod 5 | agree |
| §1.5 chain | n = 3p | mod p: `χ̄ = η̄`, `ψ̄ = 1`; mod 3: `χ̄ = ψ̄`, `η̄ = 1` | four congruences as stated |
| §1.6 | `D_t = C₃/⟨w⟩` | w has 4 fixed points; `4 = 2(2g′−2) + 4`, `g′ = 1`; invariants of dimension 2 | agree |
| §2.2 gap alternative (b) | `𝔽₂₅`, `a² = 3` | `B² = 2I`, `C² = I`, `det B = 3`, `det C = 4`; with an `𝔽₅`-model, `PSL₂(𝔽₅)` forces `√5 ∈ F`, `[F(ζ₅):F] = 2`, no index-two quotient of `A₅` | agree with FLHS15 lines 241–265 |
| §2.3 group orders | `GL₂(𝔽₃)` | Borel 12, Cartan normalizers 8 and 16, `SL₂` 24; a CM image has an abelian subgroup of index ≤ 2, `SL₂(𝔽₃)` has none | agree |
| §2.5 | stabilisers in `SL₂(𝔽₃)` | rational line: 6; non-rational line: divides 4; both < 24 | absolutely irreducible |
| §3.1 against parent §7.4 | items 1–5 | (3,p) → item 1; (p,3) → item 2; `V̄_{1,p}` → item 3; (3,5) with `V_η ≅ H¹(A_t)` → item 4; "A_t non-CM" → item 5; `L(ζ_ℓ) = M` for ℓ ∈ {3,p}; order of 3 mod 101 is 100 (`3⁵⁰ ≡ −1`, `3²⁰ ≡ 84`); order mod 7 is 6 | hypotheses and conclusions match |
| §3.3 table | rows 1–3 | primes p, 3, p all odd and ≠ 5; irreducibility from §3.1(1), (2), (3) | §2.2 applies in each row |
| §4.2 examples | `y²=x³−x+1` | Δ = −368 = −2⁴·23, `c₄ = 48`, `j = −6912/23`; 5 is a nonsquare mod 23 | agree |
| §4.3 | `y²=x³−x`, `y²=x³+1` | 4 points over `𝔽₃`, 8 over `𝔽₅`; 6 over `𝔽₅`; `[i]^*ω = iω`; normalisation of `AI`: see S01 | S01 |

**Supplier citations (every cited section of the 22 supplier roadmaps located at its open head or
on main; the statements of those quoted with hypotheses in the README were read and match).**
EllipticCurveModularityImaginaryQuadratic §§0.2, 1.1–1.3, 3.1, 4.1–4.4, 5.1, 7.1, 7.4, 8.1, 8.6 and
the 20 names cited; GL2ModularityLifting §§5.7 and 5.10 (hypotheses as described);
PotentialAutomorphyInfrastructure §2.3 `soluble_base_change_and_descent` part (2);
ComplexMultiplicationAndExplicitReciprocity §§1.1, 4.1 (both named paragraphs) and 4.2;
GL2AutomorphicRepresentationsAndTransfer R16.2.13, R16.3.2, R16.3.5, R16.3.6, R16.4.4, R16.6.3–4,
R17.4.16, R17.5.14; AutomorphicGaloisRepresentations §§3.10, 3.13, 3.14, 4.4, 4.7;
AutomorphicGaloisRepresentationsPartII AG2.0 `IsAttached`, AG2.P `Weak`/`Strict` and "Independent
classical and Hilbert members"; SmallRamificationAndAbelianVarietyBaseCases §5.0d (carrier and its
restriction rule); PotentialModularityAndCompatibleSystems §§1.1, 1.6;
InverseGaloisAndArithmeticFundamentalGroups IG.2.4, IG.2.6, IG.2.7; ModularCurvesPartII §4.10
`fixedPairingGeometricConnectedness`; ArithmeticGaloisRepresentations §§4.1, 5.3, 6.1, 6.2 with
`GaloisRep.IsOdd`, `GaloisRep.iso_of_frobenius_charpoly_eq`, `TateModule.residualRep` (the three
names the resolver listed are that roadmap's own); AbelianSchemesAndArithmeticModuli A4.1, A6.11;
NeronModelsAndSemistableAbelianVarieties §§3.10, 5.1, 5.3, 5.6, 6.10;
FaltingsFinitenessAndIsogenyTheorems R28.4; ShimuraVarieties §5.3; EtaleCohomologyFoundations §0.11;
ModularCurves §0E, Layers 3 and 5B; EllipticCurves Layers 0.5, 1, 4, 4.5a, 5; JacobianChallenge
Layers D–F; HilbertModularForms §11.3 (consumer).

**Ownership.** No open roadmap or roadmap on main states the reflection twist, the real cyclotomic
data or the descended systems (searched by object). The CM branch over a totally real base is a
kept variant of the parent's §8.6, which is stated for imaginary quadratic bases.

**Declared gaps.** The three slugs are in `design/plan.json` and in the README's supplier contracts
with the same statements; each names a supplier and a section; none asks for something a cited
section already states (R17.5.14 gives weight one only; GL2ModularityLifting §§5.7 and 5.10 need
potentially Barsotti–Tate; ComplexMultiplicationAndExplicitReciprocity §1.1 treats curves over ℚ).

**Locators verified against the cached texts.** LeHung26 lines 86, 136–138, 221–224, 231, 234, 237–249, 250–260,
264–271, 357–366; FLHS15 lines 66–77, 87, 116, 127, 221–265, 343, 355, 404, 411, 421, 426–452; BD14
lines 2144–2146 and 2171; BLGG12 lines 2024 and 2198; BLGG13II lines 82, 122–125, 129–145, 149;
Kisin09 line 3976; BCDT01 line 15; OpenAI26 lines 480, 521, 547, 571, 990, 1200–1215; SW99 Theorems
A and B and Hypothesis H (located at SW99 lines 2468, 2495 and 2491; printed pages not confirmed).
The section headings of the sibling roadmaps that were matched by heading only, without reading the
body: NeronModelsAndSemistableAbelianVarieties §§3.10, 5.1, 5.3, 5.6, 6.10,
FaltingsFinitenessAndIsogenyTheorems R28.4, ShimuraVarieties §5.3, AbelianSchemesAndArithmeticModuli
A4.1 and A6.11, InverseGaloisAndArithmeticFundamentalGroups IG.2.4–IG.2.7, ModularCurves §0E and
Layers 3 and 5B, EtaleCohomologyFoundations §0.11.

**Checks read: 78 Check bullets and 5 convention witnesses.** Every one with a numerical or
group-theoretic value was recomputed (the values in the table above and in the round-1 table); the
remaining ones, which compare with a supplier's statement, were read against that supplier. None
was found false, vacuous or a restatement. Every definition has at least three.

**Policy.** The pull request changes only the package folder. No process words or pull-request
numbers in the README or docstrings; every target has a locator.

**Dependency check.**

```text
depcheck: 237 roadmaps, 2157 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The overlap list names no dropped id and no other pull request
that changes this roadmap.

Note, not a finding: in §2.2 the hypothesis "labelled Hodge–Tate weights `{0,1}`" follows from
dimension two and determinant `ε_ℓ⁻¹` for a summand of `H¹` of an abelian variety; it matches the
source (LeHung26 line 232) and the supplier contract, so it stays.

## Not verifiable

- The equivalence of the Conventions' residual modularity (some cohomological weight) with
  "modulaire" in BD14 Théorème 3.2.2: part of the declared GL2ModularityLifting contract.
- Kisin09 Theorem (3.5.7), p.1172: the extraction garbles the label; Theorem (3.5.5) is at
  Kisin09 line 3976.
- "ModularityAndLanglandsExtensions … §4.4 removes degree restrictions on the base field there"
  (Downstream consumers): a statement about a later roadmap; no single section was identified.
- EllipticCurveModularityImaginaryQuadraticPartII is cited only as a neighbour and consumer; it is
  not among the heads supplied, so its content was not read.
- The value `ξ|_{𝔸_K^×} = η_{KT/K}‖·‖_K⁻¹` used in the repair of S01 was derived from
  `det H¹(E) = ε_ℓ⁻¹` and checked at 3 and 5 for `y² = x³ − x`; R17.4.16's central-character
  formula was read at the open head, not at a merged version.
- No Lean was elaborated in this pass (read-only); the two signatures were compared with the
  elaborated types supplied by the worker.

## Source issues

- **Misprint** in BLGG12 at proof of Theorem 6.1.5, preprint p.42 (BLGG12 line 2067): the source says the residual representation of the representation indexed 2 restricts correctly over the first field; it should be the representation indexed 1, just constructed there; affects the proof.
- **Misprint** in FLHS15 at proof of Lemma 4.2, preprint p.9 (FLHS15 line 398): the source says the determinant is applied to the quotient of the index-two subgroup by the whole group; it should be the quotient by the determinant kernel; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "350b71b1ae44e766a74332ad1ffeded5693bc6e4", "job": "RT-EllipticCurveModularityTotallyReal~2b", "model": "fable", "worker": "chris-x10"} -->

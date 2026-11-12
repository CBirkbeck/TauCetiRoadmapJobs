<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13499#issuecomment-6791602284 -->
Red team round 1 pass b (claude) of ef42b48

Verdict: needs_changes

1. **F01** (P2) JacobianChallenge is cited for a Jacobian "without a rational point"; it assumes one

   **Location.** `packages/EllipticCurveModularityTotallyReal/README.md:260–261`: "Layers D–F: the
   Jacobian `Pic⁰` of a smooth proper curve without a rational point and its abelian-variety
   structure. Used for `J^δ_n = Pic⁰(C^δ_n)` in §§1.3–1.4." The same supplier is the only source of
   `J^δ_m` in the *Needs:* line of §1.2 (README:577) and in the API of §1.2 (README:585).

   **Claim.** JacobianChallenge Layers D–F supply the Jacobian, as an abelian variety with its
   endomorphism action, of a curve that has no rational point.

   **Witness.** `TauCetiRoadmap/JacobianChallenge/README.md:22–25` (the end goal is for a curve "with
   a `k`-rational point `x₀`") and `:488–491` ("The `k`-rational point is assumed"; the pointless case
   is "out of scope for v1"). Only the Picard-scheme representability bullet of Layer D (`:258`) drops
   the point.

   **Why the roadmap is still sound.** The hypothesis is met, so the repair is a citation and one
   sentence, not a new target. On `C_m`, `f(O) = 1` (EllipticCurveModularityImaginaryQuadratic §1.2,
   value 1 at O) and O is not a branch point (§1.1 there: `O, ±R, ±S` pairwise distinct), so `(Z, Y) =
   (O, 1)` is a k-rational point of `C_m`. The reflection `w(Z, Y) = (−Z, Y⁻¹)` sends it to
   `(−O, 1⁻¹) = (O, 1)`. With the Conventions' rule `g ⋆ x = a_g(gx)` and `a_g = w^{e(g)}`:
   `g ⋆ (O,1) = w^{e(g)}(O,1) = (O,1)` for every `g ∈ G_L`, so `φ⁻¹(O,1)` is an L-rational point of
   `C^δ_m`. (Control: the two branch points over `±S` are exchanged by w, `w(S, 0) = (−S, ∞)`, so for
   `δ(g) = −1` they are conjugate and are not L-rational on the twist; `(O,1)` is the point to use.)

   **Repair.**

   1. Replace README:260–261 by: "Layers D–F: the Jacobian `Pic⁰` of a smooth proper geometrically
      connected curve with a rational point, and its abelian-variety structure. Used for
      `J^δ_n = Pic⁰(C^δ_n)` in §§1.2–1.4; the rational point is `φ⁻¹(O, 1)` of §1.2."
   2. Add to the numbered list of §1.2 an item: "`C^δ_m` has an L-rational point: `(O, 1)` is a
      k-rational point of `C_m`, because `f(O) = 1` and O is not a branch point, and it is fixed by
      `w(Z, Y) = (−Z, Y⁻¹)`, hence by the cocycle; so `φ⁻¹(O, 1) ∈ C^δ_m(L)`."
   3. Add to the Checks of §1.2: "The branch points over `±S` are exchanged by w, so for δ nontrivial
      they are conjugate over `M/L` and give no L-rational point of `C^δ_m`; the rational point is
      `φ⁻¹(O, 1)`."

   Tested on the instance: with the repair, the hypothesis `x₀ ∈ X(k)` of JacobianChallenge is
   satisfied by `X = C^δ_m`, `k = L`, `x₀ = φ⁻¹(O,1)`.

2. **F02** (P3) EllipticCurves contract and *Needs:* lines disagree; Layer 4.5a is misdescribed

   **Location.** README:254–256: "Layer 0.5 (Galois actions on curves and morphisms, and descent),
   Layer 4.5a (curve, equation and local minimal model comparisons) and Layer 5 … Used in §§1.2, 1.6,
   4.1 and 4.2." Also README:127–128 and README:154–157.

   **Claim.** The contract lists what the roadmap consumes from EllipticCurves and where.

   **Witness.**

   - `TauCetiRoadmap/EllipticCurves/README.md:905` titles Layer 4.5a "invariant theory over a Dedekind
     domain (AEC VIII.8)"; reduction types and local minimal models are Layer 4 (`:793`, "reduction,
     Tate's algorithm, the Tate curve").
   - The *Needs:* lines of §4.1 (README:1229–1232) and §4.2 (README:1274–1277) cite no EllipticCurves
     layer, and no *Needs:* line cites Layer 0.5 or Layer 4.5a (only Layer 5, at README:577 and 843).
   - §4.2 items 5, 7 and 8 use good, split and non-split multiplicative and additive reduction and
     `#Ẽ(k_v)`; the Conventions (README:156) and the CM contract route (README:446) use Layers 4 and 1,
     which the contract does not list.

   **Repair.**

   1. Replace README:254–256 by: "Layer 0.5 (Galois actions on curves and morphisms, and descent),
      Layer 1 (isogenies and the invariant differential), Layer 4 (reduction types on local minimal
      models, the Tate curve) and Layer 5 (quadratic twists and their Galois action). Used in §§1.2,
      1.6 and 4.2, and in the route of the contract required of
      ComplexMultiplicationAndExplicitReciprocity."
   2. In the Conventions (README:127–128) replace "(EllipticCurves Layer 4.5a)" by "(EllipticCurves
      Layer 4)".
   3. Append to the *Needs:* line of §1.2 "EllipticCurves Layer 0.5" and to the *Needs:* line of §4.2
      "EllipticCurves Layer 4 (reduction types and the Tate curve, for items 5, 7 and 8)".

Two findings, one P2 and one P3. No statement of the roadmap was found false, no supplier citation
is upward, and both `Suggested.lean` declarations are true as typed. The three declared supplier
gaps are not raised.

## Verified sound

Counts: 2 Lean declarations read; 18 bold or "Prove:" targets read (§§1.1–1.6, 2.1–2.5, 3.1–3.3,
4.1–4.4); 37 source locators (line ranges) verified against the cached texts; 82 Checks and
convention witnesses read, every numerical one recomputed; 77 sibling and main-roadmap citations
and 22 pinned library names resolved (at main `3930ad9`, at the open heads through `roadmaps show`,
and at the pins `1b1ccf4` and `2fd255d`).

### Dependency check

```text
depcheck: 237 roadmaps, 2157 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` changes only files under
`packages/EllipticCurveModularityTotallyReal/`.

### Lean declarations

Elaborated types were read from the worker's `#check @name` output for both declarations and
compared with the README; nothing was lost and nothing changed (no Lean was run in this pass).

| Declaration | Context and binders | Instances tried, values | Result |
|---|---|---|---|
| `realCyclotomic_isCMField` | no section variables; `k M` fields, `NumberField`, `IsTotallyReal k`, `Algebra k M`, `2 < n`, `IsCyclotomicExtension {n} k M`, `ζ` primitive | k=ℚ, n=3: adjoin = ℚ = (ℚ(√−3))⁺. k=ℚ, n=4: `ζ+ζ⁻¹ = 0`, ℚ = ℚ(i)⁺. n=6: `ζ+ζ⁻¹ = 1`. k=ℚ(√2), n=8: `ζ+ζ⁻¹ = √2 ∈ k`, adjoin = k = ℚ(ζ₈)⁺. k=ℚ(√5), n=5: adjoin = k. Dropping `IsTotallyReal`: k=ℚ(i), n=3 gives adjoin = ℚ(i) ≠ ℚ(√3). Dropping `2 < n`: n=2 gives M = k, not CM | true as typed; equals README §1.1 item 4; `IsCMField` at the pin is totally complex plus quadratic over `maximalRealSubfield` (`Mathlib/NumberTheory/NumberField/CMField.lean:70`) |
| `three_five_switch` | no section variables; `K` number field, `DecidableEq (AlgebraicClosure K)`, `W` elliptic | W′ = W, α = id satisfies the 5-torsion clause; α = [2] fails the pairing clause (`e₅(2P,2Q) = e₅(P,Q)⁴`); `ζ₃ ∈ K`: image ⊆ SL₂(𝔽₃), so asking for GL₂ would be false and SL₂ is right; SL₂(𝔽₃) normal, so "every basis" equals "one basis"; basis type inhabited by `WeierstrassCurve.nonempty_basis_torsionBy` | true as typed; equals README §2.3; the written-out condition agrees with `SymplecticTorsionEquiv` at the head of EllipticCurveModularityImaginaryQuadratic (same direction, same pairing) |

Pinned names used by the file and the README, all found at the pins with the stated files:
`NumberField.IsCMField`, `IsCMField.ofCMExtension`, `CMExtension.eq_maximalRealSubfield`,
`IsCyclotomicExtension.Rat.isCMField`, `NumberField.maximalRealSubfield`,
`isTotallyReal_maximalRealSubfield`, `IsTotallyReal.le_maximalRealSubfield`, `WeierstrassCurve.j`
(`Δ'⁻¹ * c₄ ^ 3`), `WeierstrassCurve.torsionGaloisAction`, `TauCeti.Isogeny.weilPairing`,
`WeierstrassCurve.weilPairing_torsionGaloisAction`, `TauCeti.Isogeny.pointTorsionModule` (a global
instance, so the `ZMod 3` basis type elaborates), `WeierstrassCurve.nonempty_basis_torsionBy`,
`TauCeti.det_tateModuleGaloisRepresentation`, `WeierstrassCurve.tateModuleGaloisRepresentation`,
`quadraticTwistOf`, `quadraticTwist`, `quadraticTwistPointEquiv`,
`quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`, and the three
`TauCeti.Isogeny.Hom.pullbackDifferential*` names. The three `TauCeti.*` imports exist and are used.

Headlines and padding. Headline theorems: §4.4 (with §§4.1–4.3), §§2.2, 2.4, 2.5, 3.3, the
congruence chain of §1.5, the 3–5 switch §2.3 and the field statement §1.1. Only the last two are
statable at the pins and both are stated; the module docstring names the rest with the missing
carriers (no automorphic representations of `GL₂` over a number field, no Hilbert attachment, no
covers or étale `H¹` of higher-genus curves). One-tactic probe: `realCyclotomic_isCMField` needs
total complexity of M, total reality of the adjoined field, the quadratic degree and then two
library lemmas, so it is not one tactic or one lemma; `three_five_switch` needs Hilbert
irreducibility on a twisted modular curve. Neither restates a definition or mirrors a Check. No
`set_option`, `lemma`, `#eval`, sorry'd data or foreign import. The namespace
`TauCetiRoadmap.EllipticCurveModularityTotallyReal` shares no fully qualified name with any
readable roadmap.

### Adversarial pass (README targets)

| Statement | Instances tried and values computed | Result |
|---|---|---|
| §1.1 data `(M, L, δ)` | n=9: `x³ − 3x + 1` at `2cos(2π/9)` gives `2cos(2π/3) + 1 = 0`. n=15: `φ(15)/2 = 4`, contains ℚ(ζ₅)⁺ = ℚ(√5). k=ℚ(i), n=3: M = ℚ(ζ₁₂), L = ℚ(i), M⁺ = ℚ(√3). `L(μ_ℓ) = M` for odd ℓ dividing n: `L(μ_ℓ)` is not real, `[M:L] = 2` | sound |
| Conventions, twist rule on `H¹` | `φ(x,y) = (bx,y)`, `ᵍφ = (ζ₃bx, y)`, `a_g = (ζ₃⁻¹x, y)`; `(a_g⁻¹)^*ω = ζ₃ω`, equal to `g(bω′)/bω′ = ζ₃`; dual of `a_g∘ρ(g)` is `(a_g⁻¹)^*∘ρ_{H¹}(g)` | sound |
| §1.2(2) rotations descend | `ᵍu′_ζ = φ⁻¹w^e u_{g(ζ)} w^e φ = φ⁻¹u_{g(ζ)^{δ(g)}}φ = u′_ζ`; matrices: `R³ = I`, `WRW = [[−1,1],[−1,0]] = R²` | sound |
| §1.2 negative control | valuations of f at `S, −S, R, −R` are `1, −1, −n, n` (sibling §1.2). n=5 cubic cover: 4 branch points, `2g − 2 = 8`, g = 5. n=15: 2 branch points, g = 3 | sound |
| §1.3 eigenspaces | `e_θ` on a θ-eigenvector: `n⁻¹Σθ(ζ)⁻¹θ(ζ) = 1`; `u_ζ^*w^*x = w^*u_{ζ⁻¹}^*x = θ(ζ)⁻¹w^*x`; induction non-example: rank `2[M:L] = 4` | sound |
| §1.4 determinant, oddness | `⟨y, w^*x⟩ = ⟨w^*y, x⟩ = −⟨x, w^*y⟩`, so `Λ²W_θ ≅ ℚ̄_ℓ(−1)`; `ε_ℓ⁻¹(c) = −1`; duality: `α⁻¹ = β/q_v`, `−{0,1} = {0,1} − 1` | sound |
| §1.4 restriction witnesses | `y² = x³ − x + 1` over 𝔽₅: 8 points, `a₅ = −2`; twist `y² = 3(…)`: 4 points; `P_{1,5} = X² − 2X + 5`; `(1+2i)² = −3+4i`, `X² + 6X + 25`, `26 − 32 = −6`; ℚ(√5): `f = 1`, `−3 ≡ 2` nonsquare mod 5 | sound |
| §1.5 lattices and chain | `H¹ ≅ ℤ_ℓ[μ_n]²` tensored over the evaluation gives `O²`; mod p `χ̄ = η̄`, mod 3 `χ̄ = ψ̄`, mod p `ψ̄ = 1`; mod 3 `η̄ = 1` gives `W_η ≡_3 W_1` (LeHung26 lines 136–138) | sound |
| §1.6 endpoints | `dim H¹(C^δ_3)^{w′} = 0 + 2`; w acts by `[−1]` on `B_t`, trivially on `D_t`; pull-back then norm is `n/d`: 15, p, 3 | sound |
| §2.1 change of prime | 11a1 at 3: `X² + X + 3` for every ℓ ≠ 3; needs semisimplicity (nonsplit extension control) | sound |
| §2.2 and its five-adic clause | `B² = 2I`, `C² = 6I = I`, `det C = 3·(−2) = 4`, `det B = 3` nonsquare; with an `𝔽₅`-model, `PSL₂(𝔽₅)` image forces `√5 ∈ L`, `[L(ζ₅):L] = 2`, no index-2 quotient of `A₅` (FLHS15 lines 258–265) | sound; equals the declared contract |
| §2.3 switch | orders 24 versus 12, 8, 16; P has `φ(3) = 2` geometric components of degree 24; j-map finite | sound |
| §2.4, §2.5 seeds | chain 48, 24, 8, 2, 1 with abelian quotients; stabiliser of a line in `SL₂(𝔽₃)`: 6 (rational) or dividing 4 (norm-one of `𝔽₉^×`), both `< 24`; generic `E[5]`: `G_{K(ζ₅)}` image `SL₂(𝔽₅)`, so alternative (a) fails and (b) is needed | sound |
| §3.1 parameter | sibling §7.4 gives all five items on `G_{M(ζ_ℓ)}` with the same hypotheses on p; `c = 3` at a cube root; order of 3 mod 101 is 100 (`3⁵⁰ ≡ −1`, `3²⁰ ≡ 84`), mod 7 is 6; `3⁴ − 1 = 80 < 101` | sound |
| §3.2, §3.3 | each row: residual modularity from the previous row after §2.1, irreducibility from §3.1(1)–(3); lifting primes p, 3, p are odd and not 5 | sound |
| §4.1 descent | hypotheses of PotentialAutomorphyInfrastructure §2.3(2) met: `L/K` abelian, both totally real, `H¹(B_t)|G_L` irreducible and automorphic | sound |
| §4.2 local statements | 11a1: `a₃ = −1`, `a₁₁ = 1`, factor `(1 − 11^{−s})⁻¹ = L(s − 1/2, St)`; `Δ = −16·23 = −368`, `c₄ = 48`, `j = −6912/23`; 5 nonsquare mod 23; `Γ_ℂ(s + 1/2) → Γ_ℂ(s)`; `π ⊗ |det|` has type `(2, −2)` in the supplier's convention | sound |
| §4.3 CM branch | `y² = x³ − x`: 4 points mod 3, 8 mod 5, `−1 ± 2i` of norm 5; `y² = x³ + 1`: 6 points mod 5; `[i]^*ω = d(−x)/(2iy) = iω`; Frobenius pulls ω to 0 in characteristic 2 and 3; weights 0 and 1 give `ξ_ι ≠ ξ^c_ι` | sound |
| §4.4 endpoint | assembles §§4.1–4.3; ℚ(√29) example exists (Tate's curve) | sound |

### Citations resolved

- EllipticCurveModularityImaginaryQuadratic (open head): §0.2 `fixed_pairing_twist`,
  `fixed_pairing_twist_rational`, `SymplecticTorsionEquiv`; §0.3 `modular_elliptic_all_coefficients`;
  §1.1 `switchParameterOpen`; §1.3 `cyclicCover`; §3.1 `integral_regular_module_etale`; §4.1
  `characterSystem`, `character_system_properties`; §4.2 `character_order_quotient`,
  `trivial_character_twist`, `auxiliaryEllipticCurve`, `cubic_character_elliptic`; §4.3
  `characterLattice`; §4.4 `prime_switch_congruences`; §5.1 `nonCM_elliptic_large_residual_primes`;
  §7.1 `character_geometric_irreducibility`; §7.4 `simultaneous_specialization`; §8.1, §8.5, §8.6.
  All exist with the hypotheses the README restates (arbitrary number field, `t ∈ U(k)`).
- AutomorphicGaloisRepresentations §§3.10, 3.13, 3.14, 4.4, 4.7 and its type `(k,w)` convention;
  AutomorphicGaloisRepresentationsPartII AG2.0 (`IsAttached`, `r_{l,ι}(χ)`) and AG2.P ("Independent
  classical and Hilbert members"); PotentialAutomorphyInfrastructure §2.3
  `soluble_base_change_and_descent` (2); GL2AutomorphicRepresentationsAndTransfer R16.2.13, R16.3.2,
  R16.3.5, R16.3.6, R16.4.4, R16.6.3–R16.6.4, R17.4.16, R17.5.14; GL2ModularityLifting §§5.7, 5.10;
  InverseGaloisAndArithmeticFundamentalGroups IG.2.4, IG.2.6, IG.2.7;
  SmallRamificationAndAbelianVarietyBaseCases §5.0d (carrier, restriction rule as described);
  PotentialModularityAndCompatibleSystems §§1.1, 1.6; ModularCurvesPartII §4.10
  `fixedPairingGeometricConnectedness`; ArithmeticGaloisRepresentations §§4.1, 5.3, 6.1, 6.2 with
  `GaloisRep.IsOdd`, `GaloisRep.iso_of_frobenius_charpoly_eq`, `TateModule.residualRep` (the three
  "found nowhere" leads are roadmap names there, not library names);
  AbelianSchemesAndArithmeticModuli A4.1, A6, A6.11; NeronModelsAndSemistableAbelianVarieties §§3.10,
  5.1, 5.3, 5.6, 6.10; FaltingsFinitenessAndIsogenyTheorems R28.4; ShimuraVarieties §5.3 (over ℂ, as
  the README says); ComplexMultiplicationAndExplicitReciprocity §§1.1, 4.1 (both named targets), 4.2;
  HilbertModularForms §11.3; on main: ModularCurves §0E, Layers 3 and 5B; EllipticCurves Layer 5;
  EtaleCohomologyFoundations §0.11.
- Ownership against open work, checked by object with `roadmaps grep` over main and the open heads:
  no other roadmap states the 3–5 switch curve over a number field, the FLHS seeds over totally
  real fields, the relative real cyclotomic CM statement or the descended systems. The nearest
  objects (`switch_five` and `switch_three` of EllipticCurveModularityImaginaryQuadratic §0.3) are
  CM-field statements with prescribed local types and are different theorems. The CM
  field-of-definition contract has no earlier owner (the nearest, AbelianSchemesAndArithmeticModuli
  on the n-torsion field, is a different statement).
- Declared gaps: the three slugs appear in `design/plan.json` and in the README in the required
  form, each with a named supplier and section; each `needs` is one statement with its hypotheses;
  none is provided by an earlier roadmap, Mathlib or Tau Ceti.

### Source locators verified

LeHung26 lines 86, 136–138, 221–224, 231, 234, 237–249, 250–260, 264–271, 357–366 (pages 2, 3, 5,
6, 7, 9 as cited). FLHS15 lines 66–77, 87, 116, 127, 221–265, 343, 355, 404, 411, 421, 426–452
(pages 2, 3, 5–6, 8, 9, 10). BD14 lines 2144–2146 and 2171 (pp.36–37; the hypotheses and the
universal conclusion are as restated). BLGG12 lines 2024 (p.41) and 2198 (p.45). BLGG13II lines 82
(p.2), 122–145 (Theorem 3.1.1 and proof, p.3; its hypotheses are as the README restates) and 149
(p.4). Kisin09 line 3976 (printed p.1170). SW99 Theorem A (printed p.74) and Theorem B with
Hypothesis H (printed p.75). BCDT01 line 15. OpenAI26 lines 480, 521, 547, 571, 990, 1200–1215
(pages 12, 13, 14, 23, 27–28).

## Not verifiable

- Kisin09, Theorem (3.5.7), p.1172: the extraction garbles the label, so the page was not confirmed;
  the neighbouring Theorem (3.5.5) is at the cited page and page 1172 exists in the range.
- "ModularityAndLanglandsExtensions and its Part II consume elliptic modularity … §4.4 removes degree
  restrictions on the base field there" (Downstream consumers): no single section of that roadmap
  states a restriction that §4.4 removes; the sentence is about a later roadmap and was not checked
  further.
- EllipticCurveModularityImaginaryQuadraticPartII and ModularityAndLanglandsExtensionsPartII exist
  only as packages on the board, not as open roadmap pull requests or on main; they are cited only
  as out-of-scope neighbours and consumers, so nothing depends on their content.
- ModularCurves Layers 3 and 5B "the Chinese-remainder splitting of full level 15" (*Needs:* of
  §2.3): the layers exist; the specific splitting statement was not located.
- The equivalence of the Conventions' residual modularity (some cohomological weight) with the sense
  of "modulaire" in BD14 Théorème 3.2.2 is part of the declared GL2ModularityLifting contract and was
  not checked here.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ef42b482db6af03deb3d348a89856200611d89b6", "job": "RT-EllipticCurveModularityTotallyReal~1b", "model": "fable", "worker": "chris-x8"} -->

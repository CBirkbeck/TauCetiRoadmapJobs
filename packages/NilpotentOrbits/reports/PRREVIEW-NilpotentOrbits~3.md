# Review of NilpotentOrbits (pull request #2628 at f010181)

**Verdict:** needs changes

**Summary.** All five earlier remarks are repaired. The two new Brieskorn–Slodowy statements are true. Their Dynkin conventions agree with the pins: `so₂ₙ₊₁` matches `B n`, which gives `xy + z^(2n)`. Two findings block, both false sentences in the docstrings of new definitions:

- `basePointIdeal` is said to be maximal whenever `ad e` is nilpotent, which fails for central elements of reductive Lie algebras.
- `subregularEquation` is said to give no singularity of the right type outside the valid ranges, which fails at `B 1`, `C 2` and `D 3`.

There is one small correction: the pin proves the orbit scheme representing `G/B` smooth, but the docstring says it does not and §1.2 plans it as a target. There are no format notes, and nothing is left for a human to decide.

## R01 (P2) — The docstring of `basePointIdeal` says it is maximal whenever `ad e` is nilpotent, which fails for central elements of reductive Lie algebras

The definition is stated for any field and any Lie algebra. A reader who uses it at that generality, or who carries Layers 6–8 to the reductive groups of Layer 5, is told the base point is a point. It can be the empty scheme.

The docstring (`Suggested.lean`, lines 177–179) ends: "When `ad e` is nilpotent it is a maximal ideal." Take `𝔤𝔩₂` over `ℂ`, `e = I` and `f = 0`:

- `ad e = 0` is nilpotent.
- The trace is a Lie invariant with zero constant term, so it lies in `nilpotentConeIdeal`.
- `restrictAffine` sends the trace to `2 + tr|_V`, and `tr|_V` lies in the augmentation ideal.
- So `basePointIdeal` contains `2` and is the unit ideal.

This is the distinction Convention 2 draws: in a reductive Lie algebra every central element is ad-nilpotent. The one-dimensional abelian Lie algebra with `e = 1` fails the same way over every field: the coordinate `s` goes to `1 + t`.

The repair is to state the hypothesis that makes the sentence true. For example: "When `e` is a common zero of `nilpotentConeIdeal`, it is a maximal ideal with residue field `K`. For `L` finite-dimensional with nondegenerate Killing form over a field of characteristic zero, that means `ad e` nilpotent (`TauCeti.isNilpotent_ad_iff_forall_lift_eval_eq_zero`)."

## R02 (P2) — The docstring of `subregularEquation` says that outside the valid ranges its values are not singularities of their type, but `B 1`, `C 2` and `D 3` give exactly those singularities

The docstring (`Suggested.lean`, lines 217–219) says that "Outside the valid rank ranges of `TauCeti.DynkinType.Valid` the values are not singularities of that type". This misstates why `T.Valid` is needed in `nonempty_algEquiv_adicCompletion_sliceConeRing`.

- `B 1` gives `xy + z²`, the `A₁` singularity, which is the subregular surface of `so₃ ≅ sl₂`.
- `C 2` and `D 3` give `x² + y²z + z²`. §8.1's own Check rewrites this as an `A₃` equation, and `A₃` is the subregular surface of `sp₄ ≅ so₅` and of `so₆ ≅ sl₄`.

The values fail only at the other excluded names:

- `C 1` and `D 2` give hypersurfaces smooth at the origin.
- `A 0` gives `xy + z`, also smooth.
- `B 0`, `C 0`, `D 0` and `D 1` do not vanish at the origin; for `D 0` and `D 1` this is through the truncated subtraction `n - 1 = 0`.

A sentence that would be true: "Outside the valid rank ranges the value need not be the subregular singularity of the Lie algebra of that name: `C 1` names `sp₂ = sl₂`, whose surface is `A₁`, but gives `x² + y²z + z`, which is smooth at the origin."

## C01 — The pin proves that the scheme representing `G/B` is smooth; the docstring says it does not, and §1.2 plans it as a target

The module docstring (`Suggested.lean`, lines 42–46) explains why the Springer resolution cannot be stated. It says Tau Ceti's locally free sheaf of differentials needs smoothness, "which the pin does not prove". §1.2 (line 329) likewise asks to "Prove that `ℬ` is smooth and proper".

The pin already has this. `TauCeti.Comodule.smooth_projectiveOrbitToSpec` (`Algebra/AlgebraicGroup/Representation/ProjectiveOrbit/Smooth.lean:57`) is an instance: every projective orbit scheme of a reduced Hopf algebra of finite type over an algebraically closed field is smooth over that field.

- That is the scheme through which `TauCeti.HopfIdeal.exists_fppfHomogeneousQuotient_iso_projectiveOrbitPoints` represents `G/B`.
- Smoothness is exactly the hypothesis of `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.relativeDifferentials` (`AlgebraicGeometry/Modules/Differentials/LocallyFree.lean:95`).
- §0.3 already consumes `TauCeti.smoothOfRelativeDimension_adjointOrbit`, which is built on the same file.

The headline stays unstatable, because the Springer map is data the pin does not supply. The repair:

- In §1.2, cite the declaration in the text, the *Needs:* line and the Tau Ceti contracts, and keep only properness as a target.
- In the docstring, name what is missing: the incidence scheme `𝒩̃ ⊆ 𝔤 × ℬ`, its identification with the cotangent bundle formed from `FiniteLocallyFreeSheaf.relativeDifferentials` and `totalSpaceScheme`, and hence the Springer map.

The description's "has neither its cotangent bundle nor the incidence scheme" would change with it.

## Verified sound

| Target | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.4 component groups, regular elements | SL₂, PGL₂, sl₃ | `C_SL₂(E₁₂) = {±[[1,t],[0,1]]}`, two components; PGL₂ connected; `diag(1,1,−2)`: 4 > 2; `diag(1,0,−1)`: 2 | Checks true |
| 1.2 flag and incidence variety | PGL₂; Tau Ceti pin | `x(ℂ²) ⊆ ℓ ⊆ ker x`: total space of `O(−2)`, dimension 2; orbit schemes smooth at pin (Smooth.lean:57) | Check true; smoothness already pinned (C01) |
| 1.3 Borel nilradicals | sl₃, `E₁₂`, `E₁₂ + E₂₃` | `E₁₂V₂ ⊆ V₁ ⊆ ker E₁₂ = ⟨e₁,e₃⟩` forces `V₁ = ⟨e₁⟩` or `V₂ = ⟨e₁,e₃⟩`; regular element: one flag | true |
| 2.2 open orbit in degree two | sl₃ triples; DG07 l.92–94, 143–153 | `diag(2,0,−2)` gives (2,2), `diag(1,0,−1)` (1,1), `diag(1,−1,0)` 2, −1; Lemma 3: orbit map dominant onto `𝔤(2)` | true; locators support |
| 2.4 finiteness | sl₃; `L = 0`; BMIY22 l.908–912 | orbit dimensions 0, 4, 6; one orbit `{0}`; Prop. 4.11: `N(k)/H(k)` finite | true; locator supports |
| 3.2 products | sl₂ × sl₂ | `dim 𝒩 = 4`; components `{0} × 𝒩₂`, `𝒩₂ × {0}`, dimension 2, codimension 2, meeting at 0 | true |
| 5.0 complete intersection | sl₂, sl₃, 𝔤𝔩₂; BMIY22 l.223–230, LNS10 l.127–132 | `a² + bc` irreducible; `tr X²`, `det X`, length `2 = r`; integral, dimension; normal complete intersection fibres | true; locators support |
| 6.2 slice surface Checks | sl₃, `e = E₁₂`, `f = E₂₁`; SL₂ | `tr Y² = 6a² + 2b`, `det Y = −2a³ + 2ab + cd`; on 𝒩 `cd = 8a³`; `Ad(u)(e + tf) = [[t, 1−t],[t, −t]]` | true |
| 7.1 Springer resolution | sl₂; sl₃ `E₁₂`; Yun16 l.136–140, 178–181 | fibre ℙ¹ over 0; two lines meeting at `⟨e₁⟩ ⊂ ⟨e₁,e₃⟩`; projective map; regular fibre a point | true; locators support |
| 7.2 normality | sl₂, `L = 0`; BMIY22 l.229–230, LNS10 l.127–132 | quadric cone singular only at the vertex, codimension 2; a point; normal by Kostant | true; locators support |
| 8.1 germs and Checks | A₂, D₃; Yun16 l.289–297, LNS10 l.51–54, 78–81 | `xy + z³` after `x = c, y = d, z = −2a`; `x² + y²z + z² = x² + u² − y⁴/4`, `u = z + y²/2` | true; locators support |
| 8.2 exceptional lattice | A₁, Aₘ, Dₘ, E₆–E₈; Yun16 l.275–286, 297–300 | determinants `m+1`, 4, 3, 2, 1; `det(−C_{Aₘ}) = (−1)ᵐ(m+1)`; intersection matrix negative Cartan (simply laced) | true; Slo80 not read |
| 8.3 non-simply-laced types | B₂ = C₂, C₁; LNS10 l.78–81, Yun16 l.279–286 | `A₃` and `D₃ = A₃` agree; `C₁ → D₂ = A₁ × A₁` against `A₁` | true; locators support |
| 9.1 centralizer decomposition | sl₂, `e = 0`; BMIY22 l.456–462 | `C_G(0,0,0) = G` on one ℙ¹; Prop. 3.3: `Z_H(N) = U_N ⋊ Z_H(θ)` | true; locator supports |
| 9.2 diagram action | G₂, C₃, D₄; GHR06 l.149–187 | Table 1: S₃ for G₂, S₂ for Cᵣ; G₂, C₃, D₄ curves coincide; S₃ and ℤ/3 same orbits on D₄ | true; locator supports |
| `finite_orbits_isNilpotent_ad` | `L = 0`, sl₂ | one orbit `{0}`; orbits `{0}` and `𝒩 ∖ 0` | true |
| `lift_eval_eq_zero_of_forall_isCentralizerRegular` | `L = 0`, sl₂ | `0` regular when `L = 0`; `𝒩 ∖ 0` dense in the irreducible cone | true |
| `ringKrullDim_quotient_nilpotentConeIdeal` | `L = 0`, sl₂, sl₃ | `0 = 0 − 0`, `2 = 3 − 1`, `6 = 8 − 2`; rank ≤ finrank, no ℕ junk | true |
| `exists_subregular_orbit` | sl₂, sl₃, G₂ | sl₂: `e = 0`, `3 = 1 + 2`; sl₃: `E₁₂`, `4 = 2 + 2`; G₂: orbit of dimension 10 | true |
| `exists_isRegular_ofList_eq_nilpotentConeIdeal` | `L = 0`, sl₂, sl₃ | `[]` gives `⊥`; `[a² + bc]`; `[tr X², det X]` | true |
| `nilpotentConeIdeal_isPrime` | `L = 0`, sl₂ × sl₂ | `⊥` prime in ℂ; tensor product of two quadric-cone domains is a domain | true |
| `isIntegrallyClosed_quotient_nilpotentConeIdeal` | sl₂, `L = 0` | `A₁` cone normal; ℂ | true |
| `sliceConeRing_normal_surface_of_subregular` | sl₂, sl₃; LNS10 l.127–132 | sl₂: relations force `(0,0,0)`, ring `ℂ[a,b,c]/(a² + bc)`; sl₃: `ℂ[a,c,d]/(cd − 8a³)`, dimension `4 − 2` | true; locator supports |
| `nonempty_algEquiv_adicCompletion_sliceConeRing` | A 1, B 2, C 3, B 3 against C 3; LNS10 l.51–54, 78–81 | `xy + z²`; `xy + z⁴` (A₃); C 3 gives D₄; `CartanMatrix.B` has `−2` at `⟨α_{n−1}, α_n^∨⟩`, as `pairing` | true; orientation consistent |
| `restrictAffine`, `sliceConeRing` | sl₂, `e = E₁₂`, `f = E₂₁` | `a² + bc ↦ t` on `[[0,1],[t,0]]`, as in §6.1's Check; image ideal, not its radical | correct objects |
| `basePointIdeal` docstring | 𝔤𝔩₂ with `e = I`, `f = 0`; abelian `K`, `e = 1` | `tr ↦ 2 + tr|_V`, ideal contains 2; `s ↦ 1 + t`; both unit ideals | false as stated (R01) |
| `subregularEquation` docstring | B 1, C 2, D 3; C 1, D 2 | `xy + z²` (A₁, so₃); `x² + y²z + z²` (A₃, sp₄ and so₆); C 1, D 2 smooth | false as stated (R02) |
| Springer resolution (not statable) | Tau Ceti pin | Smooth.lean:57 makes orbit schemes smooth; LocallyFree.lean:95 needs exactly that; the Springer map is still data | not statable; stated reason wrong (C01) |
| Exponential isomorphism (not statable) | Tau Ceti pin | unipotence only on points (`IsUnipotentPoint`); the scheme map would be data | docstring stands |
| Minimal resolution, −2-curves, component actions (not statable) | Mathlib and Tau Ceti pins | no minimal resolutions of surfaces or intersection numbers of curves | docstring stands |

- Earlier remarks:
  - R01 repaired: both slice statements are at lines 191–250, with `hT : T.Valid` and bracket relations that admit sl₂'s zero triple.
  - C01 repaired: "for that consumer" is gone (l. 1137–1138) and ReductiveGroups is no longer a consumer (l. 1162–1168).
  - C02 repaired: "for simply laced `𝔤`, Yun16 … 291–298; for types `Bₙ`, `Cₙ`, `F₄` and `G₂`, Slo80, §6" (l. 984–986).
  - C03 repaired (l. 325–327, 341–343, 1330–1332).
  - C04 repaired: the description now reads "here".
- Source locators: 29 of 31 read at their lines, all supporting their claims (Yun16 10, LNS10 8, BMIY22 7, DG07 2, GHR06 2); Slo80 (2) is settled as uncertified.
- Library declarations opened at the pins:
  - `TauCeti.DynkinType`, `.Valid`, `.cartanMatrix`, `TauCeti.HasCartanType` (DynkinType.lean:105, 153, 219, 418);
  - `CartanMatrix.B`, `.C` (Cartan/Basic.lean:132, 141); `RootPairing.Base.cartanMatrixIn` (RootSystem/CartanMatrix.lean:53); `RootPairing.pairing` (RootSystem/Defs.lean:195);
  - `IsRegularLocalRing` (RegularLocalRing/Defs.lean:52); the `AdicCompletion` algebra instance (AdicCompletion/Algebra.lean:103);
  - `TauCeti.HopfIdeal.exists_fppfHomogeneousQuotient_iso_projectiveOrbitPoints` (Quotient.lean:241), `TauCeti.Comodule.smooth_projectiveOrbitToSpec` (Smooth.lean:57), `FiniteLocallyFreeSheaf.relativeDifferentials` (LocallyFree.lean:95), `TauCeti.SymmetricAlgebra.lieInvariants` (LieModule.lean:171), `TauCeti.isNilpotent_ad_iff_forall_lift_eval_eq_zero` (InvariantZeroLocus.lean:77).
- Cross-roadmap citations resolved:
  - Consumers, all through the numbering table: McKaySkewGroup N6–N8 (l. 289, 1944–1950); K3SurfacesAndSymplecticBoundedness N8 (l. 240); SpringerResolutionAndCharacteristicCycles N1, N5.0, N7; LanglandsParameterStacks N1, N5.0–N5.2; LieHighestWeightPartII at its open head, N0.2, N0.3, N2.1, N2.2, N2.4, N4.
  - FormalConnectionsOpers, CharacteristicClasses and AlgebraicVectorBundles list this roadmap as a consumer.
- Automatic checks: all passed. Dependency check output: `depcheck: 200 roadmaps, 2203 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives nine `sorry` warnings and nothing else. The elaborated types of all 14 declarations match the README statements, with no binder lost.
- Padding probe, decided by reading the definitions and the near-matches at the pins: no declaration closes in one tactic. No library declaration states either new theorem or defines an affine restriction or a slice coordinate ring.
- Ownership against open pull requests: searched every open head and main by object (Brieskorn, Kleinian and du Val, the ADE equations, the four new Lean names). Only this roadmap owns them.

Overlap check: I read LieHighestWeightPartII (on main and at its open head), LieHighestWeight, ReflectionInvariantTheory, AdoIwasawa, RealSemisimpleLieGroups and ReductiveGroups, and also McKaySkewGroup, K3SurfacesAndSymplecticBoundedness and SpringerResolutionAndCharacteristicCycles. Shared objects and their owners:

- `Ad(G) = Int(L)`: LieHighestWeightPartII §0.2, cited.
- Conjugacy of triples over other algebraically closed fields: LieHighestWeightPartII §0.3, a variant both roadmaps record.
- Weyl-group invariants: ReflectionInvariantTheory §3, cited.
- The ADE resolutions and the completed slice comparison: this roadmap, Layer 8, consumed by McKaySkewGroup and K3SurfacesAndSymplecticBoundedness.
- The cone over other fields: SpringerResolutionAndCharacteristicCycles, a consumer.
- Nothing else is shared.

Source independence: 22 passages compared with 5 sources: the README at each verified locator, §1.2, the overview's fourth headline, and the docstrings of `sliceConeRing`, `sliceConeRing_normal_surface_of_subregular` and `nonempty_algEquiv_adicCompletion_sliceConeRing`. No shared run is longer than a standard term ("minimal resolution", "normal surface", "reduced closed subscheme"). The largest share of locators is Yun16, 10 of 31. Contents compared with Yun16 (Lecture I §§1.1–1.7, Lectures II–IV; all ten locators fall in §§1.2–1.3): independent.

Research link: Layer 5's exponential isomorphism is Proposition 2.3 of Bertoloni Meli–Imai–Youcis (2022), used for the Jacobson–Morozov morphism of Langlands parameters. Layers 6–8 are the slice and subregular ADE setup that Lehn–Namikawa–Sorger (2010) deform as Poisson varieties, and Layer 7 is the Springer resolution of Yun (2016). This rests on the README's references and on BMIY22 §2.1, LNS10 §§1–2 and Yun16 §1.

## Not verifiable

- Slo80, §6 (the restricted resolution as the minimal resolution, and the `−2`-curves, for `Bₙ`, `Cₙ`, `F₄`, `G₂`, cited in §§7.3 and 8.2): paywalled and settled as uncertified; cited by its section and not opened.

## Source issues

- **Misprint** in BMIY22 at §2.1, p. 5: the source says the nilpotent variety is the unique reduced subscheme whose k-points are the nilpotent elements; it should say points over every extension of k, since k-points do not determine it; affects nothing.
- **Gap** in BMIY22 at Proposition 2.3, proof of (1), p. 5: the source checks that exp is bijective on k-points before invoking Zariski's main theorem; it should check bijectivity over an algebraic closure; affects the proof.
- **Misprint** in GHR06 at §2.2, p. 4: the source says a line of type α meets −⟨α, β⟩ lines of type β; with Example 2.1's Cartan matrix it should be −⟨β, α⟩, else G₂'s short line meets one long line; affects nothing.

## For the human reviewers

- none

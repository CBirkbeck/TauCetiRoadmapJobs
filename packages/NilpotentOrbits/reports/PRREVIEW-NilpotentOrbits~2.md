# Review of NilpotentOrbits (pull request #2628 at f321adf)

**Verdict:** needs changes

**Summary.** All eight previous remarks are repaired. Every Check and worked example recomputes, and the eight declarations of `Suggested.lean` are true. One finding blocks acceptance. Part of the Brieskorn–Slodowy headline can be stated against the pins, but `Suggested.lean` omits it and gives a reason the pins refute: that `S ∩ 𝒩` is a normal surface, singular only at `e`, whose completed local ring at `e` is the ADE singularity of its type. There are four small corrections and no format notes:

- a consumer claim about ReductiveGroups that its README does not support;
- a locator in §7.3 that covers only the simply laced case;
- a representability theorem at the Tau Ceti pin that §1.2 does not cite;
- a misplaced pointer in the description.

Nothing is left for a human to decide.

## R01 (P2) — The slice-surface part of the Brieskorn–Slodowy headline can be stated at the pins, but `Suggested.lean` omits it and gives a reason the pins refute

The acceptance test leaves out the one part of the fourth headline that can be stated against the pins. That part is the classical heart of Brieskorn's theorem: `S ∩ 𝒩` is a normal surface, singular only at `e`, with an ADE singularity at `e`.

The module docstring (lines 39–42) says this headline cannot be stated because "completed local rings of these surfaces, minimal resolutions of surfaces and intersection numbers of curves on them are missing". Only the last two are missing. The pins have:

- Mathlib: `AdicCompletion` with its algebra structure (`RingTheory/AdicCompletion/Algebra.lean:103`) and `IsRegularLocalRing` (`RingTheory/RegularLocalRing/Defs.lean:52`);
- Tau Ceti: `TauCeti.DynkinType` (`LinearAlgebra/RootSystem/DynkinType.lean:105`), `TauCeti.DynkinType.Valid` and `TauCeti.HasCartanType` (same file, lines 153 and 418).

The coordinate ring of `S ∩ 𝒩` is a quotient of `SymmetricAlgebra ℂ (Dual ℂ (ker (ad f)))`, by the image of the `nilpotentConeIdeal` the file already defines. The statement below elaborates against the pins with a single `sorry` warning. It was elaborated in a separate file, with the file's own imports and the Tau Ceti module `TauCeti.LinearAlgebra.RootSystem.DynkinType` added. It needs four short definitions with real bodies:

```lean
/-- `p ↦ (v ↦ p (e + v))`: polynomial functions on `L` restricted to `e + V`. -/
noncomputable def restrictAffine (e : L) (V : Submodule ℂ L) :
    SymmetricAlgebra ℂ (Dual ℂ L) →ₐ[ℂ] SymmetricAlgebra ℂ (Dual ℂ V) :=
  SymmetricAlgebra.lift ((Algebra.linearMap ℂ _).comp (Dual.eval ℂ L e) +
    (SymmetricAlgebra.ι ℂ (Dual ℂ V)).comp V.subtype.dualMap)

/-- The coordinate ring of `S ∩ 𝒩`, `S = e + ker (ad f)`. -/
abbrev sliceConeRing (e f : L) := SymmetricAlgebra ℂ (Dual ℂ (LinearMap.ker (ad ℂ L f))) ⧸
  (nilpotentConeIdeal ℂ L).map (restrictAffine e (LinearMap.ker (ad ℂ L f)))

-- basePointIdeal e f: the image of `RingHom.ker SymmetricAlgebra.algebraMapInv`, the point `e`.
-- subregularEquation : TauCeti.DynkinType → MvPolynomial (Fin 3) ℂ, with `A m ↦ xy + z^(m+1)`,
--   `D m ↦ x² + y²z + z^(m-1)`, the three `E` equations, and
--   `B n ↦ xy + z^(2n)`, `C n ↦ x² + y²z + zⁿ`, `F4 ↦` the `E₆` and `G2 ↦` the `D₄` equation.

theorem … [FiniteDimensional ℂ L] [IsSimple ℂ L] [IsKilling ℂ L] {h e f : L}
    (t : IsSl2Triple h e f) (he : finrank ℂ (LinearMap.ker (ad ℂ L e)) = rank ℂ L + 2)
    (H : LieSubalgebra ℂ L) [H.IsCartanSubalgebra] (b : (IsKilling.rootSystem H).Base)
    (T : TauCeti.DynkinType) (hTv : T.Valid) (hT : TauCeti.HasCartanType _ b T) :
    IsDomain (sliceConeRing e f) ∧ IsIntegrallyClosed (sliceConeRing e f) ∧
      ringKrullDim (sliceConeRing e f) = 2 ∧
      (∀ (m : Ideal (sliceConeRing e f)) [m.IsPrime], m.IsMaximal → m ≠ basePointIdeal e f →
        IsRegularLocalRing (Localization.AtPrime m)) ∧
      Nonempty (AdicCompletion (basePointIdeal e f) (sliceConeRing e f) ≃ₐ[ℂ]
        MvPowerSeries (Fin 3) ℂ ⧸
          Ideal.span {MvPolynomial.coeToMvPowerSeries.ringHom (subregularEquation T)})
```

The hypothesis `T.Valid` is needed. `HasCartanType` matches Cartan matrices only, and `C 1` has the matrix of `A 1` (the docstring of `Valid`, line 151), but its equation `x² + y²z + z` is smooth at the origin.

The repair is to add such a statement, with its few definitions, to `Suggested.lean`, under Layer 6 or 8, and name it in §§6.2 and 8.1. The docstring's list of statements that are not statable should then keep only the minimal resolution, its `−2`-curves and their intersection matrix (§§7.3, 8.2), and the component actions (§§9.1–9.3).

## C01 — Nothing in ReductiveGroups consumes §9.3, and if a section did, the two roadmaps would supply each other

The overview (lines 38–39) and Downstream consumers (line 1139) say that ReductiveGroups' geometric folding application uses §9.3, and §9.3 (line 1108) exports its comparison squares "for that consumer". The ReductiveGroups README on main names this roadmap only at lines 2180 and 6656, both about the orbit theorems of its Layer 3A. No other roadmap's README, on main or at an open head, mentions such an application. ReductiveGroups supplies this roadmap (Layers 0–8, 9A.1b, 11C), so a ReductiveGroups section consuming §9.3 would make the two roadmaps supply each other.

The smallest repair is to say that §9.3 compares the subregular data with ReductiveGroups' pinned folding (9A.1b), and to drop "for that consumer".

## C02 — The locator for the minimal resolution in §7.3 covers only simply laced 𝔤

§7.3 (line 970) cites Yun16 lines 292–298 for the theorem that the restricted Springer resolution is a minimal resolution in every subregular case. Yun16 states it after assuming that `G` is simply laced (Yun16 lines 291–292), and refers the other types to Slodowy (Yun16 lines 300–303). For `Bₙ`, `Cₙ`, `F₄` and `G₂` the section therefore has no locator; §8.3's locators give the surface types, not the resolution. The repair is to mark the present locator as the simply laced case and to cite Slodowy's book, at a locator the author checks, for the other types.

## C03 — §1.2 plans the representability of `G/B`, which Tau Ceti already proves

§1.2 (lines 324–329) constructs `ℬ = G/B` as Tau Ceti's `CommHopfAlgCat.fppfHomogeneousQuotient`, "represented by a scheme". The pinned Tau Ceti proves that representability: `TauCeti.HopfIdeal.exists_fppfHomogeneousQuotient_iso_projectiveOrbitPoints` (`Algebra/AlgebraicGroup/Representation/ProjectiveOrbit/Quotient.lean:241`). For every closed subgroup of a reduced affine group of finite type over an algebraically closed field, the fppf quotient is represented by a projective orbit scheme, locally closed in a projective space. Neither §1.2's *Needs:* line nor the Tau Ceti contracts name it.

The repair is to cite it in both places. The docstring's reason for the Springer resolution (lines 37–38) could then say what the pin lacks: smoothness and properness of that scheme, its cotangent bundle and the incidence scheme.

## C04 — The description points to the wrong roadmap's §§2.2 and 2.4

The description says that LieHighestWeightPartII's §0.3 "is the variant of §§2.2 and 2.4 there". The variant is of §§2.2 and 2.4 of this roadmap. LieHighestWeightPartII's own §§2.2 and 2.4 are its orthogonal and symplectic partitions and its classical recognition. The sentence would read "is the variant of §§2.2 and 2.4 here".

## Verified sound

| Target | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.1 `Ad(G(ℂ)) = Int(𝔤)`; ad- and ρ-nilpotence | `𝔤𝔩₂`, `x = I`; LieHighestWeightPartII §0.2 | `ad I = 0` nilpotent, `ρ(I) = I` not; §0.2 there states `Ad(G(K)) = Int(L)`, needs only ReductiveGroups and Tau Ceti | Check true; citation resolves, also at the open revision |
| 0.2 Jordan decomposition | sl₂ `[[1,1],[0,−1]]`; `D = ad h`; `𝔤𝔩ₙ` | eigenvalues `±1`, `xₙ = 0`; `D²[e,f] = 0` vs `8h`; `(I,0)` and `(0,I)` both valid | Checks true; Tau Ceti hypotheses as stated |
| 0.4 component groups, regular elements | SL₂, PGL₂, sl₃ | `C_SL₂(E₁₂) = {±[[1,t],[0,1]]}`, order-two component group; PGL₂ connected; `dim C(diag(1,1,−2)) = 4 > 2`; `diag(1,0,−1)`: 2 | true |
| 1.2 incidence variety | PGL₂ | pairs `x(ℂ²) ⊆ ℓ ⊆ ker x`: total space of `O(−2)`, dimension 2, image `𝒩` | true; pin's representability not cited (C03) |
| 1.4 reductive case | `𝔤𝔩₂` | `{cI + N}` has dimension `1 + 2 = 3`; zero fibre adds `tr x = 0`: dimension 2 | true |
| 2.1 group Jacobson–Morozov | SL₂, PGL₂ | `φ = id`, trivial kernel; `SL₂ → PGL₂`, kernel `{±I}` | true |
| 2.3 regular orbit | sl₃ `E₁₂+E₂₃`, `E₁₂+E₁₃`; `L = 0` | centralizer 2 = r; `E₁₂+E₁₃` rank 1, square 0, type (2,1); `dim 𝒩` = 6, 2, 0; Yun16 l.178–181, BMIY22 l.228–229 | true; locators support |
| 2.4 finiteness | sl₃; `L = 0`; BMIY22 Prop. 4.11 | orbit dims 0, 4, 6; one orbit `{0}`; Prop. 4.11 (l.908): orbits over the algebraic closure finite, H split reductive, char 0 | true; locator supports |
| 3.1 subregular orbit | sl₃, sl₂, G₂ | `E₁₂`: centralizer `4 = r+2`, orbit `4 = 6−2`; sl₂ `{0}`: `0 = 2−2`; G₂: 12 and 10; Yun16 l.273–274 | true |
| 4.2 type A dimensions | (3), (2,1), `𝔤𝔩₆`, sl₄ | 3 and 6 vs wrong 9 and 0; 5 and 4; `(4,1,1)` and `(3,3)` both 18; ranks (2,1) vs (3,0); sl₄: 12, 10, 8, 6, 0 | true |
| 5.0 complete intersection | sl₂, sl₃, `𝔤𝔩₂` | `a²+bc` irreducible; `tr X²`, `det X` of degrees 2, 3, length `2 = r`; `tr X`, `det X` cut out sl₂'s cone; BMIY22 l.223–230, LNS10 l.127–132 | true; locators support (slice at 0) |
| 5.1 unipotent scheme | `𝔾_m`, two reps; `−I ∈ SL₂` | `J = (t−1)`; `−(t+t⁻¹−2)T` gives `((t−1)²)`; `1+ε` admitted then excluded; char poly `(T+1)²`; BMIY22 l.243–249 | true |
| 6.2 subregular slice | sl₃, `e = E₁₂`, `f = E₂₁` | `ker ad f` 4-dim; `tr Y² = 6a²+2b`; `det Y = −2a³+2ab+cd`; on `𝒩`, `cd = 8a³`, so `xy+z³`; `Ad(u)(e+tf)` has diagonal `t, −t` | true |
| 7.2 normality, flatness | sl₂; `L = 0`; BMIY22 l.229–230; LNS10 l.127–132 | quadric cone, singular locus of codimension 2; point | true; locators support |
| 9.2 diagram action | G₂, C₃, D₄; GHR06 l.151–153, 186–187 | component groups: G₂ `S₃`, `C_r` `S₂`; same curve for G₂, C₃, D₄ | true |
| `nilpotentConeIdeal` | `L = 0`; sl₂ | `S(0*) = ℂ`, augmentation-zero invariants are 0, ideal `⊥`; `(a²+bc)` | correct object |
| `finite_orbits_isNilpotent_ad` | `L = 0`; sl₂; ℚ-structure | one orbit `{0}`; `{0}` and `𝒩 ∖ 0`; a ℚ-module structure on a ℂ-space is unique | true |
| `lift_eval_eq_zero_of_forall_isCentralizerRegular` | `L = 0`; sl₂ | `x = 0` regular when `L = 0`; `𝒩 ∖ 0` dense in the irreducible cone | true |
| `ringKrullDim_quotient_nilpotentConeIdeal` | `L = 0`, sl₂, sl₃ | `0 = 0−0`; `2 = 3−1`; `6 = 8−2`; rank ≤ finrank, so no ℕ-subtraction junk | true |
| `exists_subregular_orbit` | sl₂, sl₃, G₂; 1-dim abelian | sl₂: `e = 0`, `3 = 1+2`, closure `{0}` = non-regular nilpotents; sl₃: `4 = 2+2`; abelian excluded by `IsSimple.non_abelian` (Semisimple/Defs.lean:92) | true |
| `exists_isRegular_ofList_eq_nilpotentConeIdeal` | `L = 0`, sl₂, sl₃; degree-0 junk | `ofList [] = ⊥`; `[a²+bc]`; `[tr X², det X]`; a nonzero constant would give `⊤`, excluded by the equality | true |
| `nilpotentConeIdeal_isPrime` | `L = 0`, sl₂ × sl₂ | `⊥ ⊂ ℂ` prime; `ℂ[x]/(q₁) ⊗ ℂ[y]/(q₂)` a domain | true |
| `isIntegrallyClosed_quotient_nilpotentConeIdeal` | sl₂, `L = 0` | A₁ cone normal; ℂ | true |
| Brieskorn–Slodowy, slice part (called not statable) | probe at the pins; `C 1` | probe elaborates; without `Valid`, `C 1` matches sl₂ and `x²+y²z+z` is smooth | statable (R01) |
| Springer resolution (not statable) | Tau Ceti pin | `G/N` represented by a projective-orbit scheme (Quotient.lean:241); no smoothness, cotangent bundle or incidence scheme | not statable; §1.2 should cite it (C03) |
| Exponential isomorphism (not statable) | Tau Ceti pin | unipotence only on points (`IsUnipotentPoint`); scheme map would be data | docstring accepted |
| 7.3 restricted resolution | Yun16 l.291–303 | simply laced assumed at l.291–292; other types referred to Slodowy, l.300–303 | locator narrower than claim (C02) |
| Downstream: ReductiveGroups folding | ReductiveGroups README on main | this roadmap named only at l.2180, 6656 (Layer 3A orbits) | claim unsupported (C01) |
| 2.2 Checks; DG07 | sl₃ triples | `diag(2,0,−2)` gives (2,2), `diag(1,0,−1)` gives (1,1); `diag(1,−1,0)`: 2 and −1; DG07 l.92–94, 143–153 | true; locators support |
| 6.1 slice, contracting action | sl₂ | `S = [[0,1],[t,0]]`, `a²+bc` restricts to `t`; weight on `f` `2−(−2) = 4`; LNS10 l.112–114: `ρ_t = t²λ_{t⁻¹}`, weight `2−d` | true |
| 7.1 Springer fibre | sl₃, `E₁₂` | `V₁ = ⟨e₁⟩` or `V₂ = ⟨e₁,e₃⟩`: two lines meeting in one flag; Yun16 l.136–140 projective | true |
| 5.2 binomial curve | `u = I+E₁₂+E₂₃` | `c_u(2) = I+2X+E₁₃ = u²`; `c_u′(0) = X − E₁₃/2 = log u`; `log₃ exp₃ X = X` | true |
| 8.1, 8.2 Checks | `D₃`; `A_m`, `D_m`, `E₆–E₈` | `x²+y²z+z² = x²+(z+y²/2)²−y⁴/4`; dets `m+1`, 4, 3, 2, 1; `(−1)^m(m+1)`; `CartanMatrix.E_det` 9−n | true |
| 8.3, 9.3 types and folding | B₂, C₂, C₁, B₃ | `A₃` and `D₃ = A₃`; `C₁` would give `D₂`; `sl₆` fixed by the diagram automorphism is `sp₆ = C₃` | true |
| 9.1 centralizer decomposition | BMIY22 Prop. 3.3, l.462 | `Z_H(N) = U_N ⋊ Z_H(θ)`, `u_N = im ad N ∩ ker ad N` | locator supports |

- Earlier remarks: R01 repaired (all eight Lean declarations over ℂ; Convention 3, lines 99–100). R02 repaired (§0.1, lines 159–162, and the contract at lines 1354–1358 cite LieHighestWeightPartII §0.2). R03 repaired (`exists_subregular_orbit`, `exists_isRegular_ofList_eq_nilpotentConeIdeal`). R04 repaired, with one locator narrower than its claim (C02). C01 repaired (numbering table, lines 1197–1215, covers every old id that the eight citing roadmaps on main use). C02 repaired (the description now says ℂ). N01 repaired (lines 1346, 1360, 1370). N02 repaired (line 985).
- Source locators checked against the text: all 23 (Yun16 8, BMIY22 7, LNS10 5, DG07 2, GHR06 1).
- Library declarations opened at the pins: `TauCeti.intLieAlgebra` (InnerAutomorphismGroup.lean:70), `LieAlgebra.IsCentralizerRegular` (Regular.lean:102), `TauCeti.SymmetricAlgebra.lieInvariants` (LieModule.lean:171), `TauCeti.isNilpotent_ad_iff_forall_lift_eval_eq_zero` (InvariantZeroLocus.lean:77), `IsSl2Triple.root_apply_eq_zero_or_eq_one_or_eq_two` (WeightedDiagram/Basic.lean:124), `IsSl2Triple.contractingAction`, `IsSl2Triple.lift_eval_contractingAction_apply`, `TauCeti.slodowySlice_zero_right`, `TauCeti.isNilpotent_ad_sl_iff`, `LieDerivation.exists_isNilpotent_isSemisimple`, `TauCeti.exists_mem_positiveNilradical_of_isNilpotent_ad`, `Module.Basis.vanishingIdeal_setOfPred_isCentralizerRegular_eq_bot`, `Module.Dual.isCentralizerRegular_iff_forall_ringKrullDim_le`, `LieHom.isNilpotent_apply_iff_isNilpotent_ad`, `LieHom.isSemisimple_apply_iff_isSemisimple_ad`, `IsNilpotent.log_exp`, `IsNilpotent.exp_log`, `IsNilpotent.normedSpace_exp_eq_exp`, `TauCeti.HopfIdeal.exists_fppfHomogeneousQuotient_iso_projectiveOrbitPoints`, `TauCeti.DynkinType`, `TauCeti.HasCartanType`; Mathlib `LieAlgebra.IsSimple`, `CartanMatrix.E_det`, `AdicCompletion`, `IsRegularLocalRing`. Every library name in code font in the README matches a declaration at the pins (checked by final component, and opened where the README states hypotheses).
- Cross-roadmap citations resolved on main: ReductiveGroups Layers 0–8, 3A, 5P, 6A, 9A.1b (l.972), 11C (l.6392). FormalConnectionsOpers §2.4 (l.827) and §4.3 (l.1617). LieHighestWeight Layer 7 (l.1744, 1832–1843). LieHighestWeightPartII §0.2 (l.155; also at its open revision). RootSystems §§5.2, 6.1. ReflectionInvariantTheory §§1, 3. LieGroups Layers 0, 3, 7. CharacteristicClasses §5.1 (l.2212). ComplexKahlerGeometry §3.1 and Layer 1. ComplexComparisonPartII §C-1.1 (l.1003). Downstream claims checked against the consumers (C01).
- Automatic checks: all passed. Dependency check: `depcheck: 200 roadmaps, 2203 edges, 0 problem(s)`. LieHighestWeightPartII consumes N0.2, N2.1 and N4 (N2.2 and N2.4 as comparison), and this roadmap now consumes its §0.2, but the section graph has no cycle: its §0.2 needs only ReductiveGroups and Tau Ceti.
- Elaboration: `lake env lean` on `Suggested.lean` gives seven `sorry` warnings and nothing else. `#check @` of all eight declarations, elaborated together: the elaborated types match the README statements, with no binder lost. The R01 probe (with `T.Valid`) elaborates with one `sorry` warning.
- Padding probe, decided by reading the definitions and the near-matches at the pins: no declaration closes in one tactic or restates a definition; no library declaration states any of the seven theorems.
- Overlap check: read LieHighestWeightPartII, LieHighestWeight, ReductiveGroups, ReflectionInvariantTheory, RealSemisimpleLieGroups, AdoIwasawa, and also SpringerResolutionAndCharacteristicCycles, McKaySkewGroup and FormalConnectionsOpers. Shared objects and their owners:
  - `Ad(G) = Int(L)`: LieHighestWeightPartII §0.2, cited.
  - Triple conjugacy over other algebraically closed fields: LieHighestWeightPartII §0.3, a variant both roadmaps record; its own Scope (line 11) leaves the complex classification and finiteness to this roadmap.
  - Kostant slice and regular orbit: FormalConnectionsOpers §4.3, cited.
  - The cone over other fields: SpringerResolutionAndCharacteristicCycles §6.1, cited.
  - Quotient singularities: McKaySkewGroup, cited.
  - Nothing else is shared.
- Ownership against open pull requests: checked across the open heads. No open pull request changes this roadmap, and the open revision touching LieHighestWeightPartII keeps its §0.2.

Source independence: 16 passages compared with 5 sources:

- README §§2.2, 2.3, 3.1, 5.0, 5.1, 5.2, 6.1, 7.1, 7.3, 8.1, 8.2, 8.3, 9.1 and 9.2, the overview's fourth headline, and the docstring of `exists_subregular_orbit`;
- set against Yun16 l.136–140, 178–181, 272–303; BMIY22 l.220–262, 456–475, 908–916; LNS10 l.43–132; DG07 l.79–94, 139–153; GHR06 l.136–187.

No shared run is longer than a standard term ("reduced closed subscheme", "unique nilpotent orbit", "negative of the Cartan matrix"). The largest share of locators is Yun16, 8 of 23. Contents compared with Yun16 (Lecture I §§1.1–1.7, Lectures II–IV on affine Springer fibres, orbital integrals and the Hitchin fibration; all eight locators fall in §§1.2–1.3): independent.

Research link: Layer 5's exponential isomorphism is Proposition 2.3 of Bertoloni Meli–Imai–Youcis (2022), used there for the Jacobson–Morozov morphism of Langlands parameters. Layers 6–8 are the slice and subregular setup Lehn–Namikawa–Sorger (2010) use for universal Poisson deformations, and Layer 7 is the Springer resolution of Yun's lectures (2016). Rests on the README's references and BMIY22 §2.1, LNS10 §§1–2, Yun16 §1.

## Not verifiable

- Slodowy, *Simple singularities and simple algebraic groups* (1980), the primary source for the cases of §7.3 that are not simply laced: not cited by the README, not opened.

## Source issues

- **Misprint** in BMIY22 at §2.1, p. 5: the source says the nilpotent variety is the unique reduced subscheme whose k-points are the nilpotent elements; it should say points over every extension k′ of k, since k-points do not determine it; affects nothing.
- **Gap** in BMIY22 at Proposition 2.3, proof of (1), p. 5: the source checks bijectivity of exp on k-points before applying Zariski's main theorem; it should check it on points over an algebraic closure; affects the proof.

## For the human reviewers

- none

# Review of OperatorAlgebraDynamics (pull request #1137 at 2ccd93b)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` (3088 lines) and `Suggested.lean` (339 lines) at 2ccd93b. The 254 lines changed since 0e44b61 were read line by line, and the rest of the roadmap was read again.

**The three findings of the previous review (r15, at 0e44b61):**

- **r15 R01 (D8 against QuantumFoundations §6.4): repaired.** Scope (lines 109–130) now gives §6.4 "the bosonic creation and annihilation operators `a(f)`, `a†(f)` on the finite-particle domain … the strong continuity of `f↦π_F(W(f))` for the norm topology of h". D8 keeps "the CAR and Weyl algebraic relations … the symmetric Fock representation `π_F` … its regularity along each line". The Downstream bullet (2954–2965) says the same. Both agree with QuantumFoundations at 824bab8, lines 15, 55 and 742. The phrase "the exponential vectors" is gone.
- **r15 R02 (HeisenbergImprimitivity and CompactQuantumMetricSpaces): repaired in this folder.**
  - D1.CentralTwists (690–693) now leaves "the Heisenberg cocycle with its commutator character, the symplectic annihilators and the lattice theory" to HeisenbergImprimitivity.
  - The Downstream bullets (2924–2945) state what each of those roadmaps keeps, and that the Schrödinger family and `C*(L,c)` are owned here.
  - HeisenbergImprimitivity at ea88c1a still claims both objects (its Scope, lines 21 and 30–40). This roadmap is on main and earlier in the supply order, so it is the owner, and the repointing belongs to HeisenbergImprimitivity's own review.
- **r15 R03 (D4.Harmonic restating V11): repaired.** Lines 1671–1683 now read "VonNeumannAlgebras V11 … identifies the reduced group C*-algebra … That isomorphism is consumed, not rebuilt". The single-owner list (50–52), the supplier contract (264–272), the *Needs:* line (1764–1766) and the NoncompactQuantumSymmetry bullet (2916–2918) follow it. I checked the cited V11 text below.

**The new findings.** The worker's gate fails `depcheck` (R01). The pinned Tau Ceti already contains the full crossed product, its integrated forms and the KMS theory. Because of that:

- the docstring declares statable headlines unstatable (R02);
- the README plans that library work as open targets (R03);
- `Suggested.lean` restates it (R05).

Three gaps on VonNeumannAlgebras ask for sections that VonNeumannAlgebras on main already has (R04). Five smaller defects follow (R05–R09).

## R01 (P2) — The gate fails: a roadmap on main cites CStarAlgebras, which is still an open pull request

Location: `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` lines 185–189 ("CStarAlgebras C1–C2 supplies representations, approximate units, multipliers, ideals and quotients; C5 supplies tensor products…"). The same citation appears in the *Needs:* lines at 420, 528, 719, 828, 896, 1003, 1030, 1084, 1203, 1324, 1405, 1480, 1627, 1848, 1982, 2166, 2240, 2318, 2376, 2490, 2577, 2739 and 2887, and in the Dependencies paragraphs.

Claim: CStarAlgebras C1, C2 and C5–C8 are supplied sections.

Witness: the gate reports `depcheck=1`, with "UPWARD: OperatorAlgebraDynamics (on main) -> CStarAlgebras (#6) at README lines [185, 419, 525, 718, 826, 893]". My run of the prescribed check gives the same line and `239 roadmaps, 2365 edges, 1 problem(s)`. CStarAlgebras exists only at its open head 33ddcef. HilbertModules is also open but is not flagged, because it is consumed only through `gap:hilbert-module-induction`.

Repair: consume CStarAlgebras the way HilbertModules is consumed.

1. Under Exact supplier contracts, replace the bullet at 185–189 with declared gaps, one per need, each naming its section at 33ddcef:
   - `What CStarAlgebras must provide (gap:cstar-multipliers)`: approximate units, multiplier algebras with the strict topology, and nondegenerate multiplier extension (C1.4, C1.7).
   - `gap:cstar-irreducibles`: irreducible representations, the scalar-commutant criterion for nonzero nondegenerate representations, and the primitive ideal space with its hull–kernel topology (C2.2, C2.6).
   - `gap:cstar-tensor-limits`: the minimal and maximal C*-tensor products, inductive limits and the universal unitary algebra (C5.1, C5.4).
   - `gap:cstar-nuclear-exact`: nuclearity with CP approximations, and exactness (C6, C7).
   - `gap:toeplitz-extension`: the Toeplitz extension with symbol `S↦z` (C8.4).
2. Cite these slugs in every *Needs:* and Dependencies line in place of "CStarAlgebras Cn".

I tested this on a scratch copy of the README with every CStarAlgebras citation routed through a declared gap slug. The check then reports `239 roadmaps, 2364 edges, 0 problem(s)`. If CStarAlgebras merges first, as the description intends, re-running the gate after that merge also clears it. Until the gate passes, this folder cannot be accepted.

## R02 (P2) — Headlines declared "not statable" are statable on the pinned full crossed product

Location: `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean` lines 30–35:

- "the universal property of `A ⋊_α G`, the full and reduced comparison … : no crossed-product C*-algebra";
- "the full-algebra form `C*(G) ≅ C₀(Ĝ)` … and the identification `C*(Ĝ) ≅ C₀(G)` (D4.Harmonic): no group C*-algebra `ℂ ⋊ G`".

Claim: no crossed product or group C*-algebra exists at the pins.

Witness: the pinned Tau Ceti (2fd255d) has the following.

- `TauCeti.CStarAction.FullCrossedProduct` (`TauCeti/Analysis/CStarAlgebra/Action/CrossedProduct/Full.lean:266`), a `NonUnitalCStarAlgebra`, with `FullCrossedProduct.of` and `CovariantRepresentation.integratedFull` (`Full.lean:417`).
- `CovariantRepresentation.regular` (`Action/Covariant/Regular.lean:127`).
- `CStarAction.trivial` (`Action/Basic.lean:145`), so `ℂ ⋊ G` is `FullCrossedProduct CStarAction.trivial μ`.
- `TauCeti.Amenable` (`TauCeti/GroupTheory/Amenable/Basic.lean:130`).

These statements elaborate in a scratch file against the pins, with only `sorry` warnings:

```lean
theorem fourier_fullGroupCStarAlgebra (μ : Measure G) [μ.IsHaarMeasure] [μ.Regular] :
    ∃ e : FullCrossedProduct (CStarAction.trivial : CStarAction G ℂ) μ ≃⋆ₐ[ℂ]
        C₀(PontryaginDual G, ℂ),
      ∀ (f : C_c(G, ℂ)) (χ : PontryaginDual G),
        e (FullCrossedProduct.of CStarAction.trivial μ (ConvolutionAlgebra.toConv f)) χ =
          ∫ g, f g * (χ g : ℂ) ∂μ := by sorry      -- G : CommGroup, LCH, Borel
theorem injective_integratedFull_regular_of_amenable [TauCeti.Amenable G] (α : CStarAction G A)
    (μ : Measure G) [μ.IsHaarMeasure] [μ.Regular]
    (ρ : A →⋆ₙₐ[ℂ] (H →L[ℂ] H)) (hρ : Function.Injective ρ) :
    Function.Injective ((CovariantRepresentation.regular α ρ μ).integratedFull μ) := by sorry
theorem exists_covariantRepresentation_integratedFull (α : CStarAction G A) (μ : Measure G)
    [μ.IsHaarMeasure] (L : FullCrossedProduct α μ →⋆ₙₐ[ℂ] (H →L[ℂ] H))
    (hL : Dense (Submodule.span ℂ {η : H | ∃ x ξ, L x ξ = η} : Set H)) :
    ∃ P : CovariantRepresentation α H, P.integratedFull μ = L := by sorry
```

Two more statements also elaborate:

- The abelian case of full = reduced: with `A = ℂ`, the trivial action and a faithful `ρ : ℂ →⋆ₙₐ[ℂ] (ℂ →L[ℂ] ℂ)`, the regular `integratedFull` is injective.
- `C*(Ĝ) ≅ C₀(G)`: `FullCrossedProduct (CStarAction.trivial : CStarAction (PontryaginDual G) ℂ) ν ≃⋆ₐ[ℂ] C₀(G, ℂ)`, with `of f ↦ (t ↦ ∫ χ, f χ * χ t ∂ν)`.

These are the D4.Harmonic headlines (1707–1711), the D2 amenable comparison (968–969) and the Hilbert-space form of D1's universal property with pair recovery (385–388).

Repair:

1. State these five in `Suggested.lean`, importing `TauCeti.Analysis.CStarAlgebra.Action.CrossedProduct.Full`, `TauCeti.Analysis.CStarAlgebra.Action.Covariant.Regular` and `TauCeti.GroupTheory.Amenable.Basic`, and name them in backticks at their README targets.
2. Rewrite the not-statable list so each item names the carrier it still lacks at the pins:
   - twisted crossed products `A ⋊_(α,ω) G`;
   - C*-tensor products, which neither Mathlib nor Tau Ceti has (needed for `A⋊_id G≃A⊗max C*(G)`, the coefficient-tensor identification and Takai's `A⊗K(L²G)`);
   - the dual action on the pinned crossed product (needed for Takai);
   - an imprimitivity-bimodule carrier (needed for D3).

## R03 (P2) — The README plans, as open targets, crossed-product and KMS theory that the pinned Tau Ceti already proves, and misstates what the library lacks

Location:

- README lines 360–368: "The existing convolution theorem is abelian and has `SecondCountableTopologyEither`; prove the nonabelian twisted formula first for compact-support integrands".
- D1 (332–391): the `C_c(G,A)` convolution algebra, the integrated form, the regular covariant representation and its injectivity, the full norm, `A⋊αG`, the canonical multiplier maps and functoriality, all written as constructions.
- D7 (2439–2470, 2493–2546): the generator, entire analytic elements, `IsKMS`, invariance, the dense criterion, pullback, restriction, weak-* limits, convexity and compactness of K_β, the GNS implementing group, ground states and the Gibbs state, all written as constructions.
- The "From Tau Ceti" contract (204–207) lists only `ContRepresentation.IsUnitary`, `integratedOperatorL1` and `circleEquivPontryaginDualInt`.

Claim: these are open targets, and the library's convolution theorem is abelian and second-countable.

Witness, at the pin (files under `TauCeti/Analysis/CStarAlgebra/`):

- D1 material:
  - `CStarAction` (`Action/Basic.lean:41`) and `CovariantRepresentation` (`Action/Covariant/Basic.lean:33`).
  - `CovariantRepresentation.integratedOperator_convolution` (`Action/Covariant/Integrated.lean:161`): nonabelian twisted multiplicativity on `C_c` for a left-invariant μ, with no countability hypothesis.
  - `integratedOperator_eq_coefficient_mul_integratedOperatorL1` (`Integrated.lean:222`) and `injective_integratedOperator_regular` (`Regular.lean:341`).
  - `FullCrossedProduct.coefficientMultiplier` and `groupMultiplier` (`Action/CrossedProduct/Multiplier.lean:144, 224`) and `Hom.fullCrossedProductMap` (`Action/CrossedProduct/Functoriality.lean:66`).
- D7 material:
  - `IsKMSState` (`Action/KMS/Basic.lean:222`), `IsKMSState.apply_action` (`:303`), `isKMSState_iff_of_dense` (`Action/KMS/Dense.lean:109`) and `isCompact_kmsStates` (`Action/KMS/StateSpace.lean:148`).
  - `gnsCovariantRepresentation` (`Action/Covariant/GNS.lean:138`).
  - `IsGroundState.of_tendsto_isKMSState` (`Action/GroundState/Basic.lean:465`).
  - `Matrix.IsHermitian.isKMSState_iff_eq_gibbsState` (`Action/Gibbs.lean:117`).
  - `perturbed` and `generator_perturbed` (`Action/Perturbation.lean:192, 275`).
- D9 material: `QuantumSpin.Interaction.isKMSState_localDynamics_iff` (`QuantumSpin/Interaction.lean:244`).

Repair:

1. In "From Tau Ceti", list these declarations with their files and what is assumed of them: `CovariantRepresentation` requires a unitary, strongly continuous group but allows a degenerate coefficient representation; `integratedOperator` is defined on `C_c` only; `FullCrossedProduct` is normed over Hilbert spaces in universe `max u v`.
2. In Conventions (158), take `TauCeti.CStarAction` as the action carrier.
3. In D1, D7 and D9, turn the corresponding "construct/prove" sentences into consumption. Keep as targets only what the pin lacks, for example:
   - the L¹ completion and the L¹ integrated form (`Integrated.lean`'s docstring leaves "extension to coefficient-valued L¹" open);
   - reduced crossed products, the ideal exact sequence and the universal property into `M(B)`;
   - the KMS simplex;
   - D9's quasi-local algebra and thermodynamic limit.
4. Delete the false sentence at 365–368.

## R04 (P2) — Three declared gaps ask for what VonNeumannAlgebras on main already provides

Location: README lines 251–262 (`gap:lca-fourier-plancherel`), 274–287 (`gap:measurable-hilbert-fields`) and 289–300 (`gap:diagonal-reduction`), and every *Needs:* and Dependencies line that names these slugs (for example 1768, 2064–2065, 2161).

Claim: these objects are missing from their supplier and are consumed as declared gaps.

Witness: VonNeumannAlgebras is on main at f8dfe0ad and already has all three, for arbitrary locally compact abelian G where relevant (its line 3150):

- README lines 3233–3242 give inversion for `f∈L¹` with `f̂∈L¹`, the Plancherel unitary with `Fλ(f)F*=M_f̂`, `ev:G→dual(dual G)` as a topological group isomorphism, and the Fourier/Haar rescaling.
- V4.0.Fields (1181–1200) has the fundamental-sequence fields, the decomposable-map criterion for two fields, fibrewise unitarity, the change-of-measure unitary and the zero-extended λ-field.
- V4.0.Decomposition (1279–1305) has the reduction of separable C*-representations commuting with the diagonal, and names "OperatorAlgebraDynamics D5" as its consumer.

The README already cites V11's Fourier isomorphism this way (264–272).

Repair:

1. Replace the three "What VonNeumannAlgebras must provide (gap:…)" paragraphs with plain supplier citations of the V11 inversion/Plancherel/duality paragraph, V4.0.Fields and V4.0.Decomposition, keeping their statements as what is assumed.
2. Replace each slug in the *Needs:* and Dependencies lines with the section name.

Tested together with R01 on the scratch copy: `239 roadmaps, 2364 edges, 0 problem(s)`.

## R05 (P3) — `Suggested.lean` restates pinned Tau Ceti declarations

Location: `Suggested.lean` lines 60–64 (`IsCovariant`), 68–71 (`convolution`), 88–100 (`integrated_convolution`), 298–314 (`IsKMS`), 316–323 (`kms_invariant`) and 325–335 (`kms_entire_identity`).

Claim: these are definitions the headlines need, and open headline theorems.

Witness:

- `IsKMS` is, field for field, `TauCeti.CStarAction.IsKMSState` (`KMS/Basic.lean:222`).
- `kms_invariant` restated on `CStarAction` closes with `exact hφ.apply_action hβ _ a` (scratch probe, no error).
- `kms_entire_identity` is `IsKMSState.apply_mul_entireExtension_mul_I` (`:231`).
- `IsCovariant` and `convolution` are `CovariantRepresentation.covariance` and `CStarAction.convolution` (`Convolution/Basic.lean:113`).
- `integrated_convolution` is `integratedOperator_convolution` with the unitarity hypothesis dropped.

Repair:

1. Delete the six declarations, and in the README replace their backticked names (347, 354–355, 2453, 2460, 2466, 2493) with the pinned names.
2. Restate `exists_integratedOperator` on the pinned carrier, as the L¹ extension the pin lacks. This elaborates: for `P : CovariantRepresentation α H`, `[μ.InnerRegularCompactLTTop]` and `Integrable f μ`, there is a `T` with `T ξ = ∫ g, P.coefficient (f g) (P.group g ξ) ∂μ` and `‖T‖ ≤ ∫ ‖f‖`.
3. Correct the docstring's "Stated here" sentence (lines 20–28) accordingly.

## R06 (P3) — A D4.Harmonic Check is false for G = ℤ

Location: README lines 1729–1734: "For noncompact G neither `C*(G)` nor `C₀(Ĝ)` has a unit, since Ĝ is compact exactly when G is discrete … for G=ℤ the right side is the unital `C(𝕋)`".

Claim: noncompactness rules out a unit.

Witness: ℤ is noncompact and `C*(ℤ)≅C(𝕋)` has the unit `δ_0`, as the Check's own last clause says. Conversely 𝕋 is compact and `C*(𝕋)≅c₀(ℤ)` has no unit. Unitality matches discreteness, not compactness.

Repair: "For nondiscrete G neither … has a unit, since Ĝ is compact exactly when G is discrete: for G=ℝ the right side is `C₀(ℝ)`, and for the compact nondiscrete G=𝕋 it is `c₀(ℤ)`; for the discrete noncompact G=ℤ it is the unital `C(𝕋)` with `δ_0↦1`."

## R07 (P3) — τ^P has the opposite sign to D7's own first paragraph and to the pinned `perturbed`

Location: README lines 2441–2442 ("bounded self-adjoint perturbations `δ+i[P,·]` … construct the perturbing unitary cocycles"), against 2548–2553 ("the perturbed dynamics `τ^P` with generator `δ−i[P,·]`, constructed above through its unitary cocycle … the Gibbs state of `K−P`") and the Check at 2567–2570.

Claim: τ^P is the cocycle perturbation constructed above.

Witness: the pinned `generator_perturbed` (`Perturbation.lean:275`) gives the generator `δ + i(P·−·P)`, and `isKMSState_perturbed_iff_eq_gibbsState` (`Gibbs.lean:174`) gives the Gibbs state of `K+P`. At `K=P=diag(0,1)`:

- the pinned `perturbed` has generator `i[diag(0,2),·]` and KMS weights proportional to `(1,e^(−2β))`;
- the README's τ^P is the trivial dynamics, with the trace `(½,½)`.

Repair: at 2548, define `τ^P` explicitly as the pinned `perturbed τ (−P)`, the perturbation of 2442 at −P, with generator `δ−i[P,·]`, and keep the Check. Alternatively, adopt the pinned sign throughout 2548–2553 and in the Check, using P = −diag(0,1). D9's state perturbation `Q=βπ_ω(W_Φ(Λ))` is unaffected.

## R08 (P3) — An open pull request rewrites this `Suggested.lean`, and no merge order is stated

Location: the pull request description; its revision-dependencies paragraph names #1097, #1771, #1015 and #863, but not #1187.

Claim: the stated merge order covers the open pull requests that change this roadmap.

Witness: `scratch/overlaps.md` reports "#1137 and #1187 conflict in … `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean`". #1187 (head 66ed0d4) edits main's version of this file for the Tau Ceti pin ab00ba392: three `_root_.ContRepresentation.IsUnitary` become `ContRepresentation.IsUnitary`. This pull request replaces the whole file.

Repair: state the order in the description. Either #1187 merges first and this branch is rebased on it, with `Suggested.lean` re-elaborated at ab00ba392 and the qualifier change applied, or this pull request merges first and #1187 drops its OperatorAlgebraDynamics hunk.

## R09 (P3) — D4.Harmonic re-proves BanachAlgebras A7's Riemann–Lebesgue and character formula

Location: README lines 1665–1669 ("prove `f̂∈C₀(Ĝ)`, `‖f̂‖_∞≤‖f‖₁`, `(f*g)^=f̂ĝ`, `(f*)^=conj(f̂)`, and that `f↦f̂` is the Gelfand transform of `L¹(G)` under A7's correspondence") and the API bullet at 1705–1706.

Claim: these are D4.Harmonic's targets.

Witness: BanachAlgebras on main, A7.CharactersAndUniqueness (its lines 1739–1753), identifies every nonzero character of `L¹(G)` with `χ_γ(f)=∫f(x)γ(x)dμ(x)`, "with no conjugation", homeomorphically, and consumes "A3's vanishing-at-infinity Gelfand transform to obtain Riemann–Lebesgue". So `f̂(γ)=χ_γ(f)` is already the Gelfand transform, lies in `C₀(Ĝ)`, is multiplicative, and is bounded by `‖f‖₁`.

Repair: cite A7.CharactersAndUniqueness for these four facts, in the paragraph and in the API bullet. Keep only `(f*)^=conj(f̂)` (for abelian G, `∫conj(f(x⁻¹))γ(x)dx=conj(∫f(y)γ(y)dy)`), either as a one-line target or as a Check.

## Verified sound

**Gate, dependency check and elaboration.**

- The worker's gate passes every check except `depcheck=1` (R01). My dependency check gives the same single UPWARD line. `git diff --stat origin/main...HEAD` outside the folder is empty.
- `lake env lean` on `Suggested.lean` gives eleven `declaration uses sorry` warnings (lines 79, 92, 157, 175, 196, 216, 227, 256, 279, 319, 329) and nothing else, in 7.7 s.
- One-tactic probe, on a scratch copy with each `sorry` replaced by `first | rfl | simp | infer_instance | simp_all | (intros; simp_all) | trivial | exact?`: all eleven leave goals as written. On the pinned carrier, `kms_invariant` closes in one step (R05).
- No `set_option` and no sorried data. The imports are `Mathlib` and `TauCeti.RepresentationTheory.Continuous.Unitary.Basic`.
- The five "dropped binder" leads in `scratch/signatures.md` are instances that the elaborated type does not mention and the README statement does not need. Every theorem keeps the binders its README statement has.
- To elaborate the probes I built the pinned modules `…CrossedProduct.Full`, `…Covariant.Regular`, `…KMS.Basic` and `TauCeti.GroupTheory.Amenable.Basic`.

**Headline theorems (item 7).** Each headline's status at the pin:

| Headline | Status at the pin |
|---|---|
| D1 integrated form on L¹ and its bound | stated |
| D1 multiplicativity | already proved in Tau Ceti (R05) |
| D1 universal property with pair recovery | statable, absent (R02) |
| D1.CentralTwists projective integrated form | stated |
| D2 amenable full = reduced | statable, absent (R02) |
| D2.OrbitRepresentations commutant | stated |
| D2.FreeGroups: Powers partition, simplicity, unique trace | stated |
| D4.Harmonic `C*(G)≅C₀(Ĝ)` and `C*(Ĝ)≅C₀(G)` | statable, absent (R02) |
| D4.LCAWeyl classification | stated |
| Takai, D3 imprimitivity, `A⋊_id G≃A⊗max C*(G)` | not statable: no C*-tensor products in Mathlib's `Analysis/CStarAlgebra` or in Tau Ceti; no imprimitivity-bimodule carrier |
| D5–D6 groupoid algebras and `O_n` | not statable |
| D6 residue-class Cuntz family | stated |
| D7 invariance and analytic identity | already in Tau Ceti (R05) |
| D7 KMS simplex | not statable |
| D8 CAR and Weyl algebras, D9 quasi-local algebra | not statable: none of these carriers exists in Tau Ceti (grep) |

**Pinned library declarations opened.** All are under `TauCeti/Analysis/CStarAlgebra/` unless another path is given.

- `Action/Basic.lean`: 41, 145.
- `Action/Covariant/Basic.lean`: 33. `Action/Covariant/Integrated.lean`: 88, 115, 161, 222. `Action/Covariant/Regular.lean`: 127, 341. `Action/Covariant/GNS.lean`: 138.
- `Action/Convolution/Basic.lean`: 113. `Action/Convolution/Algebra.lean`: 76, 111.
- `Action/CrossedProduct/Full.lean`: 266, 345, 417. `Action/CrossedProduct/Multiplier.lean`: 144, 224. `Action/CrossedProduct/Functoriality.lean`: 66.
- `Action/KMS/Basic.lean`: 83, 222, 231, 303. `Action/KMS/Dense.lean`: 109. `Action/KMS/StateSpace.lean`: 148.
- `Action/GroundState/Basic.lean`: 220, 465. `Action/Gibbs.lean`: 117, 174. `Action/Perturbation.lean`: 192, 275.
- `QuantumSpin/Interaction.lean`: 244.
- `TauCeti/GroupTheory/Amenable/Basic.lean`: 130.

**Cross-roadmap citations resolved** (heads from `roadmaps list`, 2026-11-07):

- On main:
  - VonNeumannAlgebras V11: lines 3150–3246, covering arbitrary LCA G with positive characters, V11.UnitizationCharacters at 3185, V11.FourierUniqueness at 3203 and the Plancherel paragraph at 3233. Also V4.0.Fields (1181) and V4.0.Decomposition (1279).
  - BanachAlgebras A7.CharactersAndUniqueness (1739).
- At open heads:
  - QuantumFoundations 824bab8: lines 15, 24, 55, 742.
  - HeisenbergImprimitivity ea88c1a: lines 19–40, 160–166, 203–215.
  - CStarAlgebras 33ddcef: C1.4 (380), C1.7 (468), C2.2 (568, the scalar-commutant criterion), C2.6 (695), C5.4 (1203), C8.4 (1676, `S ↦ z`).
  - OperatorKTheory c0a811d: K7 (lines 7, 224).
  - NoncompactQuantumSymmetry 04e6334: lines 19 and 96, consuming D1.BorelPrefix, D1.TwistedBorel and D4.Harmonic's full-algebra form.
  - CStarClassification db5a0c5: lines 56, 633, 786.
- The resolver found no lead. #1097, which also changes this roadmap, has a stated order: it merges first.

**Sources** (`williams-cpcsa-draft31`; cache page = printed page + 12):

- Theorem 4.24 at line 8504 (p. 133, "G a locally compact group").
- Definition 4.26 at 8646 (p. 135): `S_γR_s=γ(s)R_sS_γ`, which gives the README's `R_sS_χR_s*=conj(χ(s))S_χ`.
- Theorem 4.29 at 8788 (p. 137, locally compact abelian, direct sum of Schrödinger copies, no separability), matching `lcaWeyl_classification`.
- Definition E.16 at 23770 and Theorem E.17 at 23776 (p. 405: H separable, X second-countable LCH, µ finite).
- Definition F.1 at 23897 (p. 409, cache page 421).
- `arici-mesland2019` lines 103–127: page 3; `T(f_n)=f_(n+1)`; Definition 2.1; the relations (3); the extension (4); "`T_z` corresponds to the unilateral shift".
- `delaharpe2007`: Definition 9 at 323–326 (p. 7, matching `exists_powers_partition` field for field); Corollary 12(i) at 367–368 (p. 8); Theorem 14 at 423 (p. 10); the orthogonal-range `1/√N` bound at 486–488.

**Adversarial table.** One row per statement; values computed this round.

| Statement (README line / Lean) | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Matrix units `E_ij=M_(1_{i})U^(i−j)` (1352, Check 1390) | `Uδ_n=δ_(n+1)`; opposite shift | `E_ijδ_n=M_(1_{i})δ_(n+i−j)=[n=j]δ_i`, `E_ijE_kl=[j=k]E_il`; with `Uδ_n=δ_(n−1)`, `[n=2i−j]δ_i` | rank-one units, sign pinned | none |
| Band identity `T=Σ_kM_(f_k)U^k` (1342–1345) | general band-N T | `⟨δ_i,M_(f_k)U^kδ_j⟩=f_k(i)[i=j+k]`, so the sum gives `f_(i−j)(i)=⟨δ_i,Tδ_j⟩` | holds | none |
| No characters of R or Q (1380–1382) | `p=M_(1_{2ℤ})` | `UM_fU*=M_(f(·−1))`, so `UpU*=M_(1_{2ℤ+1})=1−p` and `χ(p)=1/2∉{0,1}` | holds | none |
| `Prim(R)={η}⊔Prim(Q)` (1375–1377) | closed ideals 0 and `q⁻¹(J')` | `hull(0)=Prim(R)`; `hull(q⁻¹J')⊆Prim(Q)` (η=0 contains no nonzero ideal), so the opens are ∅ and `{η}∪O` | η open and dense | none |
| `K(H)` essential in R (1356–1358) | `T≠0`, `Tδ_j≠0` | `E_iiTE_jj=⟨δ_i,Tδ_j⟩E_ij≠0` for some i | holds | none |
| Toeplitz corner (1445–1453; Check 1465) | `e=M_(1_[0,∞))` | `eUeδ_n=δ_(n+1)` (n≥0); `eU^(−1)eδ_0=0`; `1−SS*` projects onto `δ_0`; `q(e)=ℓ₊(1_[0,∞))=1`, `q(eUe)=z` | matches arici-mesland (3), (4) | none |
| B type I, not CCR (1437–1443) | `1_[0,∞)∈C₊` | limit 0 at −∞ and 1 at +∞; `M_e` has infinite rank; characters have image `ℂ=K(ℂ)` | as stated | none |
| Strong-effectiveness Check (2306–2312) | ℤ on `ℤ⊔{+∞}` | isotropy interior = units (neighbourhoods of `(k,+∞)` contain `(k,n)`, n large); invariant opens ∅, ℤ, all; `C₊⋊ℤ` has the ideals `q⁻¹(I_F)`, F⊆𝕋 closed | effective, not strongly effective | none |
| Saddle flow (1492–1507) | `B(0,δ)`; `{x>0,|xy|<ε}` | saturation of `B(0,δ)` is `{|xy|<δ²/2}` (branch `xy=r` meets `(√r,√r)`); the half-axis neighbourhood excludes the origin; +x and +y neighbourhoods share quadrant-I branches `r<ε` | T₀, not T₁, not Hausdorff | none |
| D5.Fields varying dimension (2043–2048) | `N(x)={0}` (x<½), `{0,1}` (x≥½) | `E_10e_0=e_1∉span{e_0}`; `E_01e_0=0`; `1_(x≥½)E_01` sends `e_1↦e_0∈H(x)` | as stated | none |
| D5.Fields Borel condition (2049–2053) | `S⊆[0,1]` not measurable | section `1_S(x)e_0` has non-measurable coordinate `1_S` | Borel hypothesis needed | none |
| Residue Cuntz family (Lean 279–290; Check 2407) | n=1; n=2, `b_3` | n=1: `S_0=Id`; `S_0*b_3=0`, `S_1*b_3=b_1`, `(S_0S_0*+S_1S_1*)b_3=S_1b_1=b_3`; generally `S_i*S_jb_k=[(nk+j)%n=i]b_((nk+j)/n)=[i=j]b_k` | relations hold, `0<n` guards `/` and `%` | none |
| LCAWeyl phase (Lean 262–263; Check 1835) | ℤ/3, `U_1` shift, `V=diag(1,ω,ω²)` | `U_1VU_1*e_t=ω^(t−1)e_t=ω⁻¹Ve_t=conj(χ(1))Ve_t`; Schrödinger: `χ(s⁻¹t)=conj(χ(s))χ(t)` | `conj(χ(s))` is right | none |
| Full-algebra Fourier form (1677–1683; Check 1715) | ℤ/2 | `f̂=(f_0+f_1,f_0−f_1)`; ‖δ_e+δ_a‖=2, ‖δ_a‖=1; `(δ_a*δ_a)^=(1,1)` | as stated; statable (R02) | R02 |
| Unit Check (1729) | ℤ, ℝ, 𝕋 | ℤ noncompact, `C*(ℤ)=C(𝕋)` unital; 𝕋 compact, `C*(𝕋)=c₀(ℤ)` nonunital; ℝ gives `C₀(ℝ)` | false as worded | R06 |
| τ^P sign (2548–2553; Check 2567) | `K=P=diag(0,1)` | README `δ−i[P,·]=i[K−P,·]=0`, trace `(½,½)`; pinned `perturbed`: `i[diag(0,2),·]`, weights ∝ `(1,e^(−2β))` | opposite conventions | R07 |
| `kms_invariant` needs β≠0 (Lean 319) | rotation on `C(S¹)`, `ev_1`, `f=z`, `t=π/2` | `ev_1` is tracial (0-KMS) but `ev_1(f∘R_t)=i≠1` | hypothesis needed; already proved at pin | R05 |
| `kms_entire_identity` sign (Lean 329; Check 2476) | `M_2`, `K=diag(0,1)`, `a=E_12`, `b=E_21` | `τ_(iβ)(b)=e^(−βK)be^(βK)=e^(−β)b`; `ω(aτ_(iβ)b)=e^(−β)/(1+e^(−β))=ω(E_22)=ω(ba)`; opposite sign `e^β/(1+e^(−β))` | sign pinned | R05 |
| Schrödinger family (683–690) | `x=(m,χ)`, `y=(n,ψ)` | `Π_xΠ_yξ(t)=χ(t)ψ(t+m)ξ(t+m+n)=ψ(m)Π_(x+y)ξ(t)`; `ω(x,−x)=ω(−x,x)=conj χ(m)=ω(x,x)⁻¹`; `Π_x*=conj(ω(x,−x))Π_(−x)` | matches HI §1.1 | none |
| Cocycle Check ℤ/2 (699–705) | `ω(a,a)=−1`, `b(a)=i` | `ω^b(a,a)=i·i·(−1)·1=1`; `T_b δ_a=iδ_a`, `(iδ_a)²=−ω(a,a)δ_e=δ_e` | direction ω^b→ω | none |
| Powers estimate (1236–1240) | `T_j=P_jT_j+(1−P_j)T_jP_j` | `T_j` maps `ℓ²(γ_jC)` into `ℓ²(γ_jfC)⊆ℓ²(γ_jD)`; each sum `≤‖x‖/√N` by orthogonal ranges (de la Harpe 486–488); N=1 gives `2‖x‖` | holds | none |
| `exists_powers_partition` (Lean 196) | `F={b}`, `w=ab²`; ℤ at `F={1}`, N=3 | `wbw⁻¹=aba⁻¹`, `(aba⁻¹)c` starts with a for c starting with `b^(±1)`; on ℤ, C has density ≤½, so D ≥½, but three disjoint translates force D ≤⅓ | two basis elements needed | none |
| Weyl norm and twisted family (2645–2660) | `W(−g)W(f)` | `=e^(iσ(g,f)/2)W(f−g)`, so `‖W(f)−W(g)‖=‖W(f−g)−z̄‖=2`; `U_fU_gδ_v` phase `−[σ(g,v)+σ(f,g)+σ(f,v)]/2` = that of `e^(−iσ(f,g)/2)U_(f+g)δ_v` | product law holds | none |
| `transitive_commutant_scalar` (Lean 175) | `I={p,q}`, ℤ/2 swap | `T_pq(f(p)−f(q))=0` gives T diagonal; swap gives `d_p=d_q` | scalar | none |
| Convolution direction (Check 404–410) | ℤ/3 shift, `f=δ_1⊗e_0`, `g=δ_1⊗e_2` | `(f*g)(2)=e_0α_1(e_2)=e_0`; inverse convention `e_0e_1=0` | displayed convention | none |
| Dual measure (Check 1742) | ℤ/n, `f=δ_e` | `f̂≡1`, `Σ_χ|f̂|²=n` vs `‖f‖₂²=1`, so `μ̂=(1/n)·counting` | as stated | none |

**Ownership.** By object, this roadmap is the single owner of:

- the central twisted products and the Schrödinger family (on main and earlier than HeisenbergImprimitivity, which must cite them);
- the Borel prefix objects (consumed by NoncompactQuantumSymmetry at 04e6334, line 19).

D8 against QuantumFoundations §6.4 is now settled the same way at both heads.

## Not verifiable

- Brown–Ozawa, Proposition 5.1.3; Cuntz 1977, §1; Bratteli–Robinson vols. 1–2 (§§5.2–5.4, 6.2); Renault, LNM 793; Rudin, Theorems 1.5.1, 1.6.1, 1.7.2. These are settled as uncertified and cited by locator. The ℤ model, the Cuntz relations and the KMS and Gibbs signs were checked by computation above.
- The board package has no `design/plan.json`, so the gap slugs (including those proposed in R01) are declared only in the README.

## Source issues

- none

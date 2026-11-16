<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13148#issuecomment-6904937139 -->
Red team round 1 pass b (claude) of 14accbd

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) the Periods-I splitting is used as if MetaplecticAutomorphicForms §3.32a constructed it

   - **Location.** `packages/HodgeClassesForJacquetLanglands/README.md:430` ("§3.32a the Periods-I
     splitting for `V = B₁ ⊗_E B₂` and its comparison with §3.24"), `:451–455` (gap text "formed with
     the Periods-I splitting of §3.32a"), `:1769`, `:1799–1800` ("the Periods-I splitting of
     MetaplecticAutomorphicForms §3.32a, which is defined on the whole similitude dual pair").
   - **Claim.** §3.32a supplies the splitting `s̃` and its domain; §6.2 and
     gap:quaternionic-shimizu-lift form the theta lift with it.
   - **Witness.** MetaplecticAutomorphicForms §3.32a (head of its pull request, README line 1013) proves
     only that "the ratio `ζ=tilde s/s` is an automorphic character"; `tilde s` occurs there only in
     §§3.30–3.32a and is never defined, nor is its domain stated. IP23 takes it from another paper (IP23
     line 2452; IP23 lines 5072–5073).
   - **Repair.** (a) In the MetaplecticAutomorphicForms contract replace the §3.32a clause by:
     "§3.32a `quaternionSplitting_periodsI`, the comparison of the Periods-I splitting with §3.24 on the
     norm-image group, which assumes `F` totally real, `E` CM and a real place split in both `B₁` and
     `B₂` (here `d ≥ 1`); the Periods-I splitting itself is not constructed there and is part of
     gap:quaternionic-shimizu-lift". (b) Begin the gap text (README and the `needs` of the same slug in
     `design/plan.json`) with: "for `V = B₁ ⊗_E B₂` and `W = B`, construct the Periods-I splitting: for
     every place `v` a map `s̃_v : GU(V_v)° × GU(W_v) → ℂ¹` trivialising the Weil cocycle of the
     similitude dual pair on the pairs with equal multipliers, with product one on rational points (the
     splitting that §3.32a compares with §3.24; IP23, §9.3, p. 58, and §A.10, p. 112); and prove that the
     global similitude theta lift formed with it, from `B^×` to …" (rest unchanged). (c) In §6.2 replace
     "the Periods-I splitting of MetaplecticAutomorphicForms §3.32a, which is defined on the whole
     similitude dual pair" by "the Periods-I splitting of gap:quaternionic-shimizu-lift, which is defined
     on the whole similitude dual pair", and in the Layer 6 preamble (`:1769`) "the Periods-I splitting
     of gap:quaternionic-shimizu-lift". Tested: after the change every use of `s̃` points at a contract
     that states its construction.

2. **F02** (P2) §6.1 cites a stable-range statement the supplier makes only for orthogonal–symplectic pairs

   - **Location.** `README.md:1779–1781` ("local nonvanishing, given by the stable range at split
     places"), `:1791–1793` (*Needs:* MetaplecticAutomorphicForms §3.9), contract `:426–427`.
   - **Claim.** MetaplecticAutomorphicForms §3.9 gives the nonvanishing of `θ(χ_v)` from `U(1)` to the
     two-dimensional skew-Hermitian unitary group at every place where `B` splits.
   - **Witness.** §3.9 (`theta_persistence_stableRange`, supplier line 773) is "a fixed orthogonal Witt
     tower … paired with `Sp(W)`", for "nonarchimedean local `F` in Kudla's stated odd-residue range"
     (line 775). The pair of IP23's proof (IP23 lines 2427–2436) is unitary, and the split places
     include every real place (`E_v = ℂ`) and the dyadic ones.
   - **Repair.** Add a declared gap (README contract and `design/plan.json`), supplier
     MetaplecticAutomorphicForms §3.9: "What MetaplecticAutomorphicForms must provide
     (gap:unitary-stable-range): for a local field `F_v` of characteristic zero, archimedean or not and
     of any residue characteristic, and a quadratic étale `E_v/F_v`, the theta lift of every character
     of the unitary group of a one-dimensional Hermitian `E_v`-space to the unitary group of the split
     two-dimensional skew-Hermitian `E_v`-space is nonzero (the stable range for unitary dual pairs;
     IP23, proof of Lemma 9.1, p. 57)". In §6.1 write "given by gap:unitary-stable-range at the places
     where `B` splits" and replace §3.9 by the gap in the *Needs:* line, the Layer 6 and Layer 0–10
     dependency lines and the Scope list. Tested on the instance: `v` real, `E_v = ℂ`, `U(1) × U(1,1)`
     is now covered by a stated contract.

3. **F03** (P2) the coefficient descent along an infinite central kernel is attributed to AutomorphicBundles §0.2, which excludes it

   - **Location.** `README.md:338–340` ("§0.2 `ineffectiveFibreDescent`: a coefficient descends along an
     arithmetic group whose ineffective central kernel acts trivially on the fibres"), `:615–616`
     ("descended under the fibre condition by its §0.2").
   - **Claim.** AutomorphicBundles §0.2 proves the descent used for `Res_{F/ℚ}B^×`, where
     `Z(ℚ) ∩ K` has rank `[F : ℚ] − 1`.
   - **Witness.** AutomorphicBundles §0.2 (supplier lines 468–471): the stated result is "for a finite
     tame quotient in characteristic zero"; "An infinite arithmetic central kernel needs the separate
     effective-quotient argument". For `F = ℚ(√2)` and `K(3)`, `Z(ℚ) ∩ K ∋ −ε⁴` is infinite (README
     `:782`).
   - **Repair.** In §0.2 replace "it is the local system `Γ_g∖(X⁺ × V)` of AutomorphicBundles §3.4,
     descended under the fibre condition by its §0.2" by: "put `Γ̄_g = Γ_g/(Γ_g ∩ Z(ℚ))`; for neat `K`
     it acts freely and properly discontinuously on `X⁺` (an element of `Γ_g` fixing a point is
     central, by the argument of §0.3), and `Γ_g ∩ Z(ℚ) = Z(ℚ) ∩ gKg⁻¹ = Z(ℚ) ∩ K` acts trivially on
     `V` by the fibre condition, so the diagonal action on `X⁺ × V` factors through `Γ̄_g` and
     `Γ̄_g∖(X⁺ × V)` is a local system on `Γ_g∖X⁺`: the local system of AutomorphicBundles §3.4 for
     the effective group `Γ̄_g`. AutomorphicBundles §0.2 proves descent only for finite tame quotients
     and leaves the infinite central kernel to this effective-quotient argument". In the contract
     replace the §0.2 sentence by: "§0.2 `ineffectiveFibreDescent`: for a finite tame quotient a
     coefficient descends exactly when the stabilizers act trivially on the fibres; it records that a
     neat level can contain central units of infinite order and leaves that case to an
     effective-quotient argument, which §0.2 of this roadmap states". Tested on `ℚ(√2)`, `K(3)`:
     `Γ̄ = 1`, the descent is the constant sheaf on the point, `dim H⁰ = 1` as in the Check at `:668`.

4. **F04** (P2) §4.2 needs the real Weil operators; the cited §2.5 is nonarchimedean

   - **Location.** `README.md:1539` (*Needs:* "MetaplecticAutomorphicForms §§0.15–0.17, 2.5"), `:426`
     ("§2.5 Weil operators on generators"), `:1650`.
   - **Claim.** §2.5 supplies the action of `𝔤 × 𝔤′` on `S(V)` for which `ι` of §4.2 is equivariant.
   - **Witness.** MetaplecticAutomorphicForms §2.5 (supplier lines 523–525): "In the polarized
     nonarchimedean model … `F` is nonarchimedean, `char≠2`". §4.2 is over `ℝ` with
     `ψ(x) = exp(2πix)`; a search of that roadmap's headings and of "Fock", "infinitesimal" and
     "archimedean Weil" found no section stating the real generator formulas (§§0.15–0.17 and §2.4c
     give the real model and representation, not the operators).
   - **Repair.** State the action in §4.2, which the Scope already owns ("their polynomial Fock
     description"), and drop §2.5 from the *Needs:* lines of §4.2 and of Layer 4 and from the contract.
     Insert after "(MetaplecticAutomorphicForms §§0.15–0.17)": "The action of `𝔤 × 𝔤′`,
     `𝔤 = 𝔬(V)`, `𝔤′ = 𝔰𝔩₂(ℝ)`, on `S(V)` is the differential of the real Weil representation
     `ω = ω_ψ` of §2.4c of that roadmap in this model: `𝔬(V)` acts by the derivative of
     `(ω(g)φ)(x) = φ(g⁻¹x)`, and `𝔰𝔩₂(ℝ)` by the derivatives of `ω(n(b))φ(x) = ψ(½b⟨x, x⟩)φ(x)` and
     `ω(m(a))φ(x) = a^{m/2}φ(xa)`, `a > 0`, together with the Fourier transform for the Weyl element;
     proving that these formulas hold for the real model and preserve the polynomial-times-Gaussian
     subspace is part of this target (IP23, §8.3, pp. 50–51)." Tested: `(x_α + (2π)⁻¹∂_α)φ₀ = 0` and
     `ι⁻¹(z₁²) = (2πi)²(4x₁² − π⁻¹)φ₀` (README `:1532`, `:1536`) use only operators now defined in the
     section.

5. **F05** (P2) the layers and their sections follow the sections of IP23

   - **Location.** `README.md:531–551` and the eleven layer headings.
   - **Claim.** The organisation is the roadmap's own (principle 5).
   - **Witness.** IP23 has 124 of the 142 source mentions. By number: `Layer 0 ↔ §§2–3`,
     `Layers 1–2 ↔ §5` (`1.2, 1.1, 1.3–1.4, 1.5, 1.6, 1.7, 1.8 ↔ Prop. 5.1, Def. 5.2, Prop. 5.3,
     Lemma 5.4, (5.6), Prop. 5.6, Prop. 5.7`; `2.3, 2.4, 2.1, 2.5, 2.6, 2.7 ↔ 5.10, 5.11, 5.12, 5.13,
     5.14, 5.15`), `Layer 3 ↔ §§6–7` (`3.2–3.4 ↔ Lemmas 6.1, 6.2, Cor. 6.3`; `3.5 ↔ §7.2`),
     `Layer 4 ↔ §8` (`4.1–4.4 ↔ §§8.2–8.5`, `4.5–4.6 ↔ Props. 8.1–8.2`), `Layer 6 ↔ §9`,
     `Layer 7 ↔ §10` (`7.4–7.9 ↔ Lemmas 10.2–10.7`, `7.10 ↔ Prop. 10.1`), `Layers 8–9 ↔ §11`
     (`8.2, 8.3, 8.5, 8.6–8.7, 8.8, 9.5 ↔ Prop. 11.2, Lemma 11.3, Prop. 11.4, Prop. 11.6, Cor. 11.7,
     Prop. 11.8`), `Layer 10 ↔ §12`. Only §4 of the source is redistributed (to §2.8 and Layer 5).
     The dependency lines force `1 → 2 → 3`, `6 → 7 → 8 → 9 → 10` and `4.3 → 4.5, 4.6`; they do not
     force the scope of Layers 3, 8, 9 and 0, which is the source's.
   - **Repair.** Regroup by subject the targets whose scope the dependencies do not fix; no statement
     changes. (1) A first layer "Realizations of compact Shimura cohomology" with §§0.2–0.3, §8.6 and
     §§9.3–9.4: the general library the Scope claims; their *Needs:* name only suppliers and each
     other. (2) Layer 0 keeps §§0.1, 0.4–0.7 (the target). (3) §9.1 (the dual group of `GU_E(V)` and the
     representation `r`), whose *Needs:* is §5.1 and ReductiveGroupsPartII, joins Layer 5. (4) One
     archimedean layer "Cohomological representations of `U(2,2)` and `SO(4,2)` and their Hodge types"
     with §3.5, §§8.2–8.3 and §8.7 (their *Needs:* are §§3.4, 5.1, 8.2, 8.6 and suppliers; §8.7 also
     lists §8.5, which its local statement, six rows computed from §§8.2 and 8.6, does not use: drop
     that entry, or leave §8.7 in the eigenspace layer), after Layer 5;
     Layer 3 keeps §§3.1–3.4. (5) One layer "The theta Hecke eigenspace: parameter, degree, purity and
     Galois action" with §§8.1, 8.4, 8.5, 8.8, 9.2, 9.5. Layers 1–2, 4, 6, 7 and 10 keep their content.
     Record the former numbering in a table (`former § → new §`). Add at least two further sources for
     the main results, fetched and certified through the sources service: Vogan–Zuckerman, *Unitary
     representations with non-zero cohomology*, Compositio Math. 53 (1984), for the cohomology and
     Hodge bidegrees of `A_q(λ)` (§§3.5, 8.2); Bloch–Kato, *L-functions and Tamagawa numbers of motives*
     (1990), Example 3.9, for §9.3 (the reference IP23 itself gives, IP23 line 4145); Kudla–Millson,
     *Intersection numbers of cycles on locally symmetric spaces and Fourier coefficients of holomorphic
     modular forms in several complex variables*, Publ. Math. IHÉS 71 (1990), for the scalar forms of
     §4.3 (FM06 line 791). Their locators are to be read from the texts, not from this report.

6. **F06** (P3) `artinComparison` is the finite-coefficient theorem; the rational one is `adicArtinComparison`

   - **Location.** `README.md:500–501` ("ComplexComparisonPartII C6 `artinComparison` for constructible
     coefficients and Betti local systems"), used for `ℚ_ℓ`-cohomology at `:626–628`.
   - **Witness.** `TauCetiRoadmap/ComplexComparisonPartII/README.md:4900–4901`: `artinComparison` is for
     "finite commutative `Λ`"; the `ℤ_ℓ`/`ℚ_ℓ` statement is §C6.6 `adicArtinComparison` (line 5152).
   - **Repair.** Contract: "ComplexComparisonPartII §C6.3 `artinComparison` (finite coefficients) and
     §C6.6 `adicArtinComparison` (the integral and rational Artin comparison used for `𝕍_ℓ`)"; in §0.2
     write "Artin's rational comparison for their cohomology (ComplexComparisonPartII §C6.6)".

7. **F07** (P3) two PadicHodgeTheory citations in the proof route of §0.2 exceed the cited sections

   - **Location.** `README.md:640–641` ("a locally algebraic abelian representation (PadicHodgeTheory
     §3.3)"), `:644–645` and `:518–520` ("through the algebraic–analytic comparison of its §8.1").
   - **Witness.** PadicHodgeTheory §3.3 (supplier line 694): the character criterion is "for a
     `ℚ_p`-valued character"; larger coefficient fields "are not all one cyclotomic power" and are
     sent to §3.6, which treats ordinary flags only. §8.1 (line 1385) states the algebraic–analytic
     passage for the constant system `V^i = H^i_et(X_C, ℚ_p)` only.
   - **Repair.** (a) Add a declared gap, supplier PadicHodgeTheory §3.3: "What PadicHodgeTheory must
     provide (gap:locally-algebraic-abelian-derham): a continuous representation of `G_K`, `K/ℚ_p`
     finite, on a finite-dimensional `ℚ_p`-space that factors through `G_K^ab` and whose restriction
     to an open subgroup of `𝒪_K^×`, under local reciprocity, is given by the `ℚ_p`-points of an
     algebraic homomorphism `Res_{K/ℚ_p}𝔾_m → GL(V)`, is de Rham", and cite it at `:640–641`.
     (b) For the cohomology of the algebraic components cite the owner of the proper
     algebraic–analytic comparison of étale cohomology with lisse coefficients,
     ClassicalAdicEtaleCohomology §8.2 ("Universal compactifications and proper algebraic comparison",
     Huber's comparison for a proper morphism of schemes and its analytification), in place of "its
     §8.1", and add it to the *Needs:* of §0.2, to the Layer 0 dependencies and to the contracts; it is
     earlier in the merge order.

8. **F08** (P3) a Check of §7.10 contradicts the statement and the Example

   - **Location.** `README.md:2129–2130`: "For `d = 1` there are two signs at the split place and the
     statement gives two nonzero pairings for one class."
   - **Witness.** The statement (`:2119`) has `2^n` sign vectors, `ε ∈ {±1}^{Σ_∞}`; `d < n` forces
     `n ≥ 2`, so at least `4`; the Example (`:2142–2144`) says four for `F` real quadratic, `d = 1`.
   - **Repair.** "For `F` real quadratic and `d = 1` there are `2² = 4` sign indices and the statement
     gives four nonzero pairings for one class; when `k_v = 2` at the compact place the weights
     `±ε_v(k_v − 2)` are `0`, so `f^ε` does not depend on `ε_v` up to a scalar and the four pairings
     are two up to scalars."

9. **F09** (P3) a Check of §7.9 attributes a tensor-product statement to a section that has none

   - **Location.** `README.md:2104–2105` ("The tensor product of two holomorphic discrete series
     contains the holomorphic discrete series of the summed weight as its minimal `K`-type component
     (AutomorphicFormsOnReductiveGroups §2.6)").
   - **Witness.** AutomorphicFormsOnReductiveGroups §2.6 (supplier lines 463–486) has the `K`-type rays,
     the raising and lowering operators and the classification; no statement on `D_k ⊗ D_l`.
   - **Repair.** "The lowering operator is a derivation, so the product of two functions it kills, of
     weights `k_v` and `1`, is killed by it and has weight `k_v + 1`; by the `K`-type rays of
     AutomorphicFormsOnReductiveGroups §2.6 a nonzero such vector generates the holomorphic discrete
     series of weight `k_v + 1` (and dually outside `Σ`)."

10. **F10** (P3) the correspondence action with coefficients is cited to a constant-coefficient section

   - **Location.** `README.md:906–907` ("it sends `ξ` to `x ↦ p₂,*(ξ ∪ p₁^* x)`, using the coefficient
     pairing (MotivesAndAlgebraicCycles §2.3)").
   - **Witness.** MotivesAndAlgebraicCycles §2.3 (supplier line 374) states `c_*(α) = pr₂,*(cl(c) ∪
     pr₁*α)` for Weil cohomology of smooth projective varieties with constant coefficients; `p₂,*` on
     `H^*(Sh₁ × Sh₂, 𝕍 ⊠ 𝕍′)` is not there, and §0.3 builds pushforwards only for central isogenies.
   - **Repair.** "…sends `ξ` to `x ↦ p₂,*(ξ ∪ p₁^* x)`, where `p₂,*` is the transpose of `p₂^*` under
     the Poincaré duality with coefficients of §0.2 and the cup product uses the coefficient pairing;
     for constant coefficients this is the correspondence action of MotivesAndAlgebraicCycles §2.3."

11. **F11** (P3) title in lower case

   - **Location.** `README.md:1`: "# Roadmap: hodge classes for the jacquet–langlands correspondence".
   - **Witness.** `Suggested.lean:4` and the roadmaps on main capitalise proper names
     (`TauCetiRoadmap/AdelicAlgebraicGroups/README.md:1`).
   - **Repair.** "# Roadmap: Hodge classes for the Jacquet–Langlands correspondence".

12. **F12** (P2) gap:quaternion-ramification-classification asks for what an earlier roadmap already states

   - **Location.** `README.md:469–473` (gap text), `:834`, `:2539–2540`, and the same slug in
     `design/plan.json`.
   - **Claim.** No roadmap provides the classification of quaternion algebras by ramification sets or
     the realization of every even set of non-complex places.
   - **Witness.** GL2AutomorphicRepresentationsAndTransfer §R17.1.5 (head of its pull request, README
     lines 1530–1532; earlier in the merge order, already a supplier here): "Ramification realization"
     for `|S_f| + |S_∞|` even with `S_∞` real, and "Two quaternion algebras are `F`-isomorphic iff their
     splitting predicates agree at every … place", with `existsQuaternionRamification_iff` and
     `nonempty_quaternionAlgEquiv_of_localSplitting`.
   - **Repair.** Cite §R17.1.5 for the classification and realization (contract of
     GL2AutomorphicRepresentationsAndTransfer, Scope list, *Needs:* of §§0.4 and 10.2, dependency
     lines); the order-two clause of §0.4 then follows from them with ClassFieldTheory Layer 10
     (`brLocalization_injective`, `exists_br_of_sum_eq_zero`). Narrow the gap (README and plan) to what
     is left: "What ClassFieldTheory must provide (gap:quaternion-ramification-classification): for a
     quaternion algebra `B` over a number field `F` and a quadratic extension `E/F`, `E` embeds in `B`
     exactly when no place of `F` ramified in `B` splits in `E` (IP23, §12.2.1, p. 94)". Tested on
     §0.4's Check: `Ram(B₁) = {∞₂, 𝔭}`, `Ram(B₂) = {∞₂, 𝔮}` gives `{𝔭, 𝔮}`, even, realized and unique
     by §R17.1.5.

Findings: 1 P1, 5 P2, 6 P3. No statement of `Suggested.lean` and no formula, Check or worked
example of the README was found false on the instances computed (table at the end); the findings are
supplier citations that do not carry what the README attributes to them, the arrangement against the
main source, and small Check and policy defects.

## Verified sound

Counts: 4 declarations read (all of `Suggested.lean`), 75 targets read (every line of the README),
72 locators verified against the cached texts (IP23 58, Mil17 5, Wal85 5, FM06 4), about 70 Checks and
worked values recomputed, about 150 sibling citations located (with helpers; the passages behind
the findings and the discarded leads were read by me at the suppliers' heads) and 23 pinned declarations
grepped at the pins.

- **Dependency check** (command of the brief): `depcheck: 237 roadmaps, 2250 edges, 0 problem(s)`;
  no UPWARD or CYCLE line. The roadmap is at line 290 of the merge order, after every supplier named.
- **Package scope**: the pull request's diff touches only `packages/HodgeClassesForJacquetLanglands/`.
- **Policy**: no `lemma`, `set_option`, `#eval`, sorry'd data or second import in `Suggested.lean`;
  75 numbered sections, each with a locator, a *Needs:* line and at least three Checks; no pull-request
  numbers, process words or machine paths in the README or the docstrings.
- **Gaps**: the eight slugs of `design/plan.json` are the eight of the README, each with a named
  supplier and section. Seven are not raised (R01 extends one whose text presupposes an object);
  R12 raises one that asks for what an earlier roadmap provides.
- **Elaborated signatures**: compared the four elaborated types of the worker's signature listing
  with §§1.3, 1.4, 1.7; binders agree, no section variable is lost (the file has no `variable`). No
  Lean was run in this pass. `[FiniteDimensional E U]` is implied by `2 + 2 = finrank E U`
  (note, not a finding).
- **Headlines and padding**: headline theorems are Theorem 3.2/12.4(i), (ii), Theorem 1,
  Propositions 5.3, 5.6–5.7, 9.5, 10.1, 11.6 and Remark 11.10. Statable at the pins: Proposition 5.3
  and the point-level identity of 5.6, both stated; the others are named in the module docstring
  with the missing carriers (checked: no de Rham, automorphic or Shimura carrier at the pins). One-tactic
  probe: none of the three theorems follows from a pinned lemma (`pairingDual_ιMulti_ιMulti` and
  `instIsPerfPairWedgePairing` are inputs, not the statements); no padding.
- **Pinned declarations** (all found): `exteriorPower.wedgePairing`, `pairingDual`,
  `pairingDual_ιMulti_ιMulti`, `instIsPerfPairWedgePairing`, `hodgeStar`,
  `Module.Basis.topVector`, `exteriorPower.isUnit_apply_topVector`, `MvPolynomial.funext`,
  `groupCohomology.H1ofAutOnUnitsUnique`, `LinearMap.BilinForm.exteriorPower` (Mathlib);
  `LinearMap.map_exteriorPower_finrank_eq_det_smul`, `Module.Basis.exteriorPowerTopEquiv`,
  `QuaternionAlgebra.normMulEquiv`, `rescaleJEquiv`, `tensorAlgEquivTensorMatrix`,
  `BrauerGroup.quaternionClass_mul`, `symPowerRep`, `Orientation.barHodgeStar`,
  `barHodgeStar_barHodgeStar`, `Hodge.HodgeStructureOn`, `tateTwist` (weight `n − 2m`, `F` shifted by
  `m`), `internalHom`, `IsCoveringMap.singularTransfer` (Tau Ceti). The module documentation of
  `Mathlib/LinearAlgebra/ExteriorPower/HodgeStar.lean` lists `Δ • ⋆⋆x = (−1)^{kl} x` as a TODO, as
  the README says.
- **Sibling citations found as cited**: ShimuraVarieties §§1.3, 1.6, 4.2, 4.3, 4.9, 6.7, 8.1, 8.3,
  8.5, 8.6, 8.7 with the seven names; ShimuraData §§3.1, 3.3, 3.10, 4.3, 4.9; AutomorphicBundles
  §§0.1, 3.4, 3.5, 3.7, 3.8; MotivesAndAlgebraicCycles §§2.2–2.3, 2.6–2.7, 7.1, 7.15;
  ArithmeticLocallySymmetricSpaces §§ALS.0.4, 0.6, 3.6, 5b.1, 5b.4; AlgebraicTopology §§2.6, 5.3;
  EtaleCohomologyFoundations §§F.2.1, F.2.2, F.3, 0.8; PadicPeriodRings §1.4;
  SelmerIwasawaCohomology §§2.7, 4.9; AdelicAlgebraicGroups §§3.4, 4.3;
  ArithmeticGaloisRepresentations §1.2; MetaplecticAutomorphicForms §§0.15–0.17, 3.3c, 3.4, 3.7,
  3.16, 3.23–3.28, 3.30–3.31, 3.33–3.36, 3.38, 5.6, 6.4, 6.10, 6.10a, 6.11–6.15, 6.22;
  GL2AutomorphicRepresentationsAndTransfer §§R16.1.8, R16.4.4, R16.4.5, R16.6.3, R17.3.1,
  R17.3.5–R17.3.8, R17.4.2, R17.4.13, R17.4.16; AutomorphicFormsOnReductiveGroups §§2.6, 4.2, 5.1,
  5.2, 5.4, 5.7; AutomorphicSpectralTheory §§0.25–0.26, 4.7; AutomorphicLFunctionsAndLocalFactors
  §AL.3.6.3; ClassFieldTheory Layers 6–8, 10, 11 and the five Layer 10 names (its "§5.4" is the
  former numbering, mapped by that roadmap's own table to Worked example W.4: valid);
  GlobalNumberFields Layers 1, 2, 4, 6, 9, 10; ReductiveGroups Layers 3, 6; ReductiveGroupsPartII
  §§RG2.5.1–RG2.5.2; SchurWeyl Layer 9; SpinRepresentations Layer 6;
  GeometryOfNumbersAndQuadraticArithmetic §4.3.
- **Leads discarded after reading**: the eight names of the worker's citation listing are
  ShimuraVarieties' own (found at its head); §8.5 of ShimuraVarieties covers the map to the one-point
  torus datum of §5.2 (its own Check uses a one-point torus target); ComplexKahlerGeometry "K6.1" is
  that roadmap's label for its §6.3.

### The adversarial table

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `IsExteriorStar`, `existsUnique_isExteriorStar` | `H = diag(a_i)`, `c = d_U(e₁₂₃₄)`; `H = 0`; `σ` not surjective (`t ↦ t²`); wrong model `−L`, `σ(·)`-conjugate | `L(e₁₂) = (a₁a₂/c)e₃₄`, `L(e₁₃) = −(a₁a₃/c)e₂₄`, `L(e₁₄) = (a₁a₄/c)e₂₃`; `H = 0 ⇒ L = 0` unique; existence by restriction of scalars along `σ`; `−L` fails the identity at `y = e₁₂` | true as typed |
| `IsExteriorStar.comp_self` | diagonal Hermitian; `H = 0`; `σ = id` symmetric; non-symmetric `1 + E₁₂`; alternating Pfaffian `8` | `L²e₁₂ = σ(a₁a₂/c)(a₃a₄/c)e₁₂ = (∏a_i/σ(c)c)e₁₂`; general: `L² = (σ(c)c)⁻¹ S C₂(A)ᵀ S C₂(A) = det A/(σ(c)c)` (complementary minors); `1 + E₁₂`: `L²e₁₃ = e₂₃ ≠ e₁₃`; alternating: `64 = 8²` | true; hypothesis needed |
| `IsExteriorStar.map_similitude` | `g = diag(g_i)`, `σ(g_i)g_i = ν`; degenerate `a₁ = 0`; `H = 0`, any `ν`; scalar `t` | both sides `σ(g₁g₂)(a₁a₂/c)e₃₄`, using `σ(g₁g₂) = ν²/(g₁g₂)`; `a₁ = 0`: on `e₃₄` both `ν²/(g₃g₄)·…`; `H = 0`: `0 = 0`; `t`: `ν²/det = 1` | true |
| §1.1 volume | `diag(1,−J₁,1,−J₂)`, `c = −1`; `α = 2`; rank `0`, `σ(t) = t²` | `J₁J₂`; `−10 ↦ −5/2`; `t⁻³` versus `σ = t⁻⁶` | as stated |
| §1.3 basis table, Example of Layer 1 | six basis vectors, `c = −1` | `−a₁a₂e₃₄, a₁a₃e₂₄, −a₁a₄e₂₃, −a₂a₃e₁₄, a₂a₄e₁₃, −a₃a₄e₁₂`; images `e₂₄, J₁e₁₄, J₂e₂₃, J₁J₂e₁₃` | agree |
| §1.3 versus `hodgeStar`, `barHodgeStar` | `σ = id`; `ℂ ⊗ ℝ⁴`, `c = ±1` | `B(⋆Lx, y) = vol(Lx ∧ y) = B(x, y)` so `⋆L = id`; `L(e₁₂) = ±e₃₄`, `L(ie₁₂) = ∓ie₃₄` | agree |
| §1.5 | diagonal Hermitian; `diag(i,1,1,1)` | `b(Le₁₂,e₃₄) = b(Le₃₄,e₁₂) = −i∏a_i`; non-Hermitian `−1` versus `1`; `σ(b(Lx,Ly)) = −Jb(x,y)` from the first | agree |
| §1.6 form and rescaling | `γ = j`; `d′ = αd` | `⟨x,Ly⟩ = ⟨x,y⟩j` componentwise; `j′² = J/N(α)`, `j′ ↦ σ(α)⁻¹j` | agree |
| §§2.1, 2.3, 2.4, 2.6 | `β = (1+2i) + j·i`, `α = 2−i`, `J = −3`; block `g` | `Nrd = 8`, `ν = 8/5`, `det = (24+32i)/25`; `L₁² = −a₁a₂`; dimensions `8 = 8`; `β = α₁α₂` gives `[[b₁,b₂], Nrd(b₁)α₁⁻¹α₂]` and `N(·) = Nrd b₁ Nrd b₂`; `diag(1,−J₁,−J₂,J₁J₂)` | agree |
| §§3.2–3.5 | central `(z,z,N z)`; `y = (1,1,1,−1)`, `(1,1,i,i)`; `(2,0,0)`, `(0,0,2)`; `k = 2, 3` | `(N²,N²,N²)`; `(−1,−1,−1)`, `(1,1,−1)`; `(1,−1,1,−1)`, `(1,1,−1,−1)`; inverse `l = (k₁+k₃, k₁+k₄, k₁+k₂)`, sum `2k₁`; `(1+t²)²`, lowest `K`-type `(k,0,0)` | agree |
| §§4.1–4.6 | `ℓ = 0, 1, 2`; `(4,2)`, `(0,6)` | `ι⁻¹(z₁²) = (2πi)²(4x₁²−π⁻¹)φ₀`; wedge pairings `1, −1, εi, εi`; projection of `e₁²` with coefficient `1/4`; compact case signs `(−1)^ℓ·(−1)^ℓ = 1`; weights `ℓ + 3`, `−ℓ − 3` | agree |
| §§0.2–0.3 Checks | `ℚ(√2)`, `K(3)`, `K(9)`; `ℚ(∛2)`; `ℚ(i)` | `ε⁴ ≡ −1 mod 3`, `−ε⁴ ≡ 1`; orders `8`, `24`; points `1`, `3`; degree `3`, index `9`; `u³+3u²+3u−1 = 0`, norm `1`; types `(0,0)`, `(−1,−1)`; `K₂ ∩ Z(ℚ)⁻ ⊂ (K₂ ∩ Z(ℚ))K₁` | agree |
| §§0.5–0.7 | `d = 1, 2`; weights `(2,2)`, `(2,4)` | types `(2,0),(1,1),(1,1),(0,2)`; `(3,−1),(2,0),(0,2),(−1,3)`; weight `d + d − 2d = 0` | agree |
| §§5.2–5.3 | `Z → T`; `j(s)` | `([t²,1],α) = ([t,t],α)`; kernel `([−1,1],1)`; `η_T(j(s)) = η(s⁻¹) = 1` | agree |
| §§7.5–7.9 weights | `Σ`, outside `Σ` | `+k_v`, `−k_v`; `±1`; sums `±(k_v+1)` | agree |
| §8.1 | Asai of a base change | `As⁺ = Sym²σ ⊕ ∧²σ·ξ_E`, `∧²σ = ξ_E`, factor `ζ_F`; `χχ^σ = 1`, `χ ≠ χ^σ ⇔ χ² ≠ 1` | agree |
| §§8.6–8.7 | six Kostant rows, `k = 4` | `(1,1)+(k−2,k−2)`, `(0,4)+(0,2k−4)`; weights `2k−2`, `2k+2`; after shift `(1,1)` | agree |
| §9.1 | `θ̂²`; `F = ℚ(√2)` | `ν·det g·det θ₄(g) = ν`; `34`, `33` | agree |
| §§9.3–9.4 | trivial `V = ℚ_ℓ` | `dim H¹_f = 1`, `H¹_g/H¹_f ≅ D_cris(ℚ_ℓ(1))^{φ=1} = 0`; pushouts of `W` along coordinates are quotients, so de Rham | agree |
| §10.6 | `diag(x₁c₁, x₂c₂)`; `(i)` over `ℚ(i)/ℚ` | `x₁x₂c₁c₂`; average `0` | agree |

## Not verifiable

- The construction of the Periods-I splitting and the Shimizu lift for it (Ichino–Prasanna, *Periods of
  quaternionic Shimura varieties. I*, Appendix C and Proposition 4.2.3): not in the sources cache; IP23
  cites it and R01 asks that the gap state it.
- The eight declared gaps are absent from their suppliers today, as expected of gaps; their
  mathematical content was read for precision only.
- The analytic statements of Layers 6–7 (doubling residue, see-saw, simultaneous nonvanishing) were
  checked for hypotheses, weights and locators against IP23, not re-derived.
- The locators of the further sources named in R05 (Vogan–Zuckerman, Bloch–Kato, Kudla–Millson) were
  not opened; only Bloch–Kato's Example 3.9 is confirmed, through IP23 line 4145.

## Ownership

Checked by object against the roadmaps on main and the open roadmap pull requests at their heads
(the search tool of the brief; hits re-read where a finding rests on them).

- **Owned here, no other owner found**: the Hermitian exterior operator and the exceptional maps
  (no hit for the Hermitian exterior square, `PGU(2,2)`, `GSO(6)` or a sesquilinear star; the four
  Lean names occur in no other `Suggested.lean`; Mathlib has the bilinear `hodgeStar` and Tau Ceti
  the positive definite `barHodgeStar`, both cited); the harmonic Schwartz forms (no roadmap states
  Kudla–Millson or Funke–Millson forms); the dual group of `GU_E(V)` over `F` and the degree-`2d`
  Kottwitz hypothesis (EndoscopicTransferAndUnitaryTraceComparison §1.8 is the rational-multiplier
  group, as the README says); pullback and normalized trace along morphisms of Shimura data.
- **Special cases elsewhere, not second owners** (no finding; the general statement is only here):
  HilbertModularVarietiesAndShimuraCurves §§R18.4.1–R18.4.2, R18.4.25 and
  AutomorphicGaloisRepresentations §§0.7, 3.1 state the `ℓ`-adic multiplicity spaces of §0.5 for
  `d = 1, 2`; EndoscopicTransferAndUnitaryTraceComparison §§9.1, 13.9 the compact unitary PEL case
  of §0.2; PerfectoidShimuraVarieties §0.3 the effective deck groups of §0.3 for normal `p`-levels;
  SelmerIwasawaCohomology §4.9 and PadicHodgeTheory §3.3 the two halves of §9.3 (both cited).
- **Second owner**: the quaternion classification of gap:quaternion-ramification-classification
  (R12).

Source independence: 14 passages compared with 4 sources (IP23 Theorem 3.2, Remark 2.2, §3.2, Lemma
9.1 and its proof, §9.3, Proposition 10.1, Lemma 10.5 and its proof, Propositions 11.8–11.9, Remark
11.10, Theorem 12.4 and its proof, (8.2); Mil17 Lemma 5.13; Wal85 Lemmas I.2.1–I.2.2; FM06 §§5.2,
6.2), no sentence reproduced and no shared wording beyond formulas, names and hypothesis lists; largest
share IP23, 124 of 142 source mentions; contents compared with IP23: the layers and their sections follow
its §§5–12 (R05).

## Source issues

- **Misprint** in IP23 at §3.2, p. 19: the source says the isotypic component of the cohomology of the quaternionic Shimura variety is concentrated in degree `2d`; it should be degree `d`, the complex dimension; affects nothing.
- **Error** in IP23 at Proposition 8.2, p. 55: the source says the contraction in signature `(0,6)` is `(−1)^ℓ(x₁ + εix₂)^ℓφ₀`; it should be `(x₁ + εix₂)^ℓφ₀`, the sign of (8.2) cancelling that of the negative definite pairing; affects nothing (`ℓ` is even in the application).
- **Gap** in IP23 at the proof of Theorem 12.4, p. 99: the source says the Galois group acts trivially on the components, so every rational component class is invariant, without argument; it should take the class in the Galois-invariant subspace; affects the proof.
- **Gap** in IP23 at §10.2, p. 66: the source uses the agreement of the two splittings for `B₁ ⊗_E B₂` for every `Σ`; Proposition A.14, p. 113, proves it when some real place splits both algebras; affects the proof (case `d = 0`).

## For the human reviewers

- **Scope.** The roadmap plans the main theorems of one refereed article (IP23, Forum of Mathematics, Pi, 2023); 124 of its 142 source mentions are to it. Whether a single-article roadmap of this size is wanted is yours to decide.
- **Licence.** IP23 is open access under a Creative Commons Attribution licence (IP23 lines 45–46). Mil17 is read from the author's page; `sources.toml` records it as `open-repository`, not `author-page`.
- **Licence.** No public formalisation with the names `IsExteriorStar`, `existsUnique_isExteriorStar`, `comp_self`, `map_similitude` was searched for outside the pinned libraries and the roadmap pull requests.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "14accbdb5bf4296b975b63aef1a82dc9057f2b9b", "job": "RT-HodgeClassesForJacquetLanglands~1b", "model": "fable", "worker": "chris-x88"} -->

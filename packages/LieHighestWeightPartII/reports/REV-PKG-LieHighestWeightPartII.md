<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2394#issuecomment-6628720605 -->
Review (claude) of 1806182

Verdict: needs_changes

1. **F01** (P2) Type-D half-spin headline is statable at the pin but absent

   - **Location.** `packages/LieHighestWeightPartII/Suggested.lean` lines 23–29 (module docstring): "the pins have half-spin Lie modules only on Tau Ceti's Clifford-polarisation carrier, with no Lie algebra isomorphism to Mathlib's `LieAlgebra.Orthogonal.so`"; README §2.3 and §2.4 ("adding the half-spin module … determines the class in all cases").
   - **Claim.** Half-spin separation of very even classes, and with it full type-D recognition, cannot be stated at the pins.
   - **Witness.** `TauCeti/RepresentationTheory/Spin/Polarization/TypeD/Representation.lean` line 96: `typeDSpinPlusLieRep (hline : P.line = ⊥) : LieAlgebra.Orthogonal.typeD ι K →ₗ⁅K⁆ Module.End K (spinPlus Q P)`, with binders `P : SpinPolarizationData Q`, `b : Module.Basis ι K P.W`, `[Fintype ι] [DecidableEq ι] [Invertible (2 : K)]`. The domain is Mathlib's split type-D Lie algebra, not a Clifford carrier; `TauCeti/RepresentationTheory/Spin/Polarization/Irreducible.lean` lines 202–206 already make `spinPlus Q P` a `LieModule K (typeD ι K)` by `LieModule.compLieHom`. The README's own Mathlib contract says `so` and `typeD` are isomorphic over `K` in even dimension, and the `sp` headline is already stated on Mathlib's split carrier `sp l K`.
   - **Repair.** Add a theorem `exists_innerAut_of_finrank_weightFiltration_typeD` on `LieAlgebra.Orthogonal.typeD ι K`: for `P`, `b`, `hline` as above (`Invertible (2 : K)` from `CharZero` by `invertibleOfNonzero two_ne_zero`), two zero-inclusive triples whose weight filtrations agree on the standard module `ι ⊕ ι → K` and on `spinPlus Q P` (instances supplied by `letI … compLieHom` in the statement, as in `Irreducible.lean` line 202) are conjugate under `innerAutGroup K (typeD ι K)`. Add `[FiniteDimensional K (spinPlus Q P)]` or derive it from `b`. Remove the half-spin entry from the docstring's not-statable list (keep the Layer-4 finite-test-family entry, whose reason, the typed decomposition into simple ideals, still stands). In the README §2.4, say the Lean statement is on the split carrier and backtick the new name there. Tested on the instance: with `ι = Fin 4`, `P` the standard even polarisation of `K⁸`, the two `(4, 4)` triples have equal standard filtrations and half-spin top indices `4` and `3`, so the new hypothesis pair separates exactly the case the `so` theorem excludes.

2. **F02** (P2) The positive-real-part docstring names missing carriers the pin has

   - **Location.** `packages/LieHighestWeightPartII/Suggested.lean` lines 17–22: "The pins have no connected semisimple algebraic group together with its category of finite-dimensional algebraic representations and the character lattice of a maximal torus".
   - **Claim.** Recognition of the positive real part (CH Proposition 10.2) is not statable at the pins for lack of those carriers.
   - **Witness.** At the pinned Tau Ceti: `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean` line 70 (`reductiveCommHopfAlgProperty`), `TauCeti/Algebra/AlgebraicGroup/Torus/Maximal.lean` line 50 (`HopfIdeal.IsMaximalTorus`), `TauCeti/Algebra/AlgebraicGroup/Representation/SemisimplePoint.lean` line 80 (`IsSemisimplePoint` for points `WithConv (H →ₐ[k] K)`), the connectedness predicates under `TauCeti/Algebra/AlgebraicGroup/Connected/`, the character lattice under `CommHopfAlgCat/CharacterLattice/`, the Jordan decomposition of points under `Representation/JordanDecomposition/`, and finite comodules with their point action (`Representation/`). Every carrier the docstring says is missing is present.
   - **Repair.** Either state the headline on these carriers: a connected reductive commutative Hopf `ℂ`-algebra `H`, semisimple points `s, s'`, the weight pattern of a point defined as the multiplicity function of eigenvalue absolute values `q^(i/2)` of its action on each finite-dimensional comodule, the positive real part as a predicate on a point `r` (on every finite comodule `r` acts on the `λ`-eigenspace of `s` by `|λ|`), and conclude that positive real parts of two `q`-geometric points with equal patterns are conjugate by a point of `H`; existence of `r(s)` stays a README target. Or, if after trying an encoding the fix worker finds one carrier genuinely missing (for instance the identification of the points of a torus with homomorphisms from its character lattice), rewrite the docstring to name that one declaration-level gap precisely instead of the three carriers that exist. The README (§5.3–5.5) is unchanged either way; it is correct.

3. **F03** (P2) NilpotentOrbits N2.2 is cited over `K` for facts it states over `ℂ`

   - **Location.** README §0.3 ("by NilpotentOrbits N2.2, `[L_0, e] = L_2`"), §3.1 ("The bound `a_i ≤ 2` is NilpotentOrbits N2.2"), the supplier contract "From TauCetiRoadmap.NilpotentOrbits", and the scope bullet that calls §0.3 a kept variant "over every algebraically closed field of characteristic zero".
   - **Claim.** The two Lie-algebraic facts (surjectivity of `ad e : 𝔤(0) → 𝔤(2)`, simple-root labels in `{0, 1, 2}`) are supplied by N2.2 at the generality of this roadmap.
   - **Witness.** `TauCetiRoadmap/NilpotentOrbits/README.md` line 13: the principal setting is an adjoint semisimple group over `ℂ`; N2.2 (lines 168–178) is written in that setting. Only its Lean `Triples` section (`Suggested.lean` lines 120–133, Jacobson–Morozov and the transverse complement) is over a general `K`; neither of the two facts used here is among its Lean statements.
   - **Repair.** State both facts as targets of this roadmap over `K`: in §1.3 or §0.3, "for a zero-inclusive triple in a finite-dimensional `L` over `K`, `ad e` maps `L_0` onto `L_2`" (one line from the `V(n)` decomposition of the adjoint module: in `V(n)` the weight-`0` vector, present when `n` is even, is sent to the weight-`2` vector, so every weight-`2` vector is hit); and in §3.1, "every simple root takes a value in `{0, 1, 2}` at a dominant neutral element", with the standard argument (if `α(h) ≥ 3` for a simple `α`, then `[e, x_(−α)] ∈ L_(2−α(h))` is a sum of root vectors of negative roots `β − α` with `β(h) = 2`, impossible for dominant `h`, so `x_(−α)` is a vector of weight `≤ −3` killed by `e`, which `sl₂` theory forbids). Keep the N2.2 citation as the `ℂ` comparison only. Refuting instance for the citation as written: the roadmap is stated for `K = ℚ̄`, which N2.2 never mentions.

4. **F04** (P2) The identification of `so(n, K)` and `sp(2l, K)` with Killing algebras of their type is cited to a section that does not state it

   - **Location.** README §2.4 *Needs:* "LieHighestWeight Layer 7 (Serre presentation identifying a simple algebra of classical type with its standard model)"; §4.1 proof route ("the hypothesis gives that factor's recognition hypothesis, classical (§2.4) … using the type decomposition of RootSystems Layer 5").
   - **Claim.** LieHighestWeight Layer 7 identifies an abstract simple ideal of type `B_r`, `C_r` or `D_r` with Mathlib's `so n K` or `sp l K`, which §4.1 needs to apply the matrix theorems to the simple factors of an abstract `L`.
   - **Witness.** `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md` lines 1158–1196: Layer 7 presents a given Killing algebra with a split Cartan as `Matrix.ToLieAlgebra` of its transposed Cartan matrix. It never states that `LieAlgebra.Orthogonal.so n K` or `LieAlgebra.Symplectic.sp l K` is Killing, has a split Cartan subalgebra, or has root system `B`, `C` or `D` (grep for `Orthogonal.so`, `Symplectic.sp`, `typeD` in that README: no hit); `ClassicalGroups/README.md` has none either (line 129 only names `IsKilling.rootSystem` as a Mathlib tool). Layer 9 covers `sl n` (its diagonal Cartan and matrix-unit positive system, lines 1448–1452), so type `A` is supplied.
   - **Repair.** Add a target to Layer 2 (before §2.4): "`so(n, K)` (`n ≥ 3`) and `sp(2l, K)` (`l ≥ 1`) are finite-dimensional Killing Lie algebras with the split Cartan subalgebra of the diagonal matrices (for `so`, after the isomorphism with `typeD`/`typeB`), with root systems `D_r`, `B_r`, `C_r` in the coordinates of the Conventions", with the root vectors listed as its API and three Checks (`so(3) ≅ sl₂`, `so(4) ≅ sl₂ × sl₂`, `sp(2) = sl₂`), citing a textbook locator; or declare it as `gap:classical-matrix-types` against LieHighestWeight (plan.json `gaps` plus the README contract). Then §2.4 and §4.1 cite that target together with Layer 7. Instance refuting the citation as written: a reader looking for "so(8) is of type `D₄`" in Layer 7 finds no sentence to cite.

5. **F05** (P3) Uniqueness of the dominant representative needs a named lemma

   - **Location.** README §3.1: "Some `Int(L)`-conjugate of `h` lies in `H` and is dominant, and it is unique" and the route "where it is unique (RootSystems Layer 4)".
   - **Claim.** Uniqueness follows from the fundamental-domain theorem.
   - **Witness.** RootSystems Layer 4 (`RootSystems/README.md` lines 296–315) gives uniqueness up to the Weyl group, for a root pairing over `ℝ`. Two dominant elements of `H` that are `Int(L)`-conjugate must first be shown `W`-conjugate; that step is used again for the `−w₀` invariance ("uniqueness gives `a = −w₀ a`"). It is derivable from LieHighestWeight Layer 7's Chevalley restriction (`LieHighestWeight/README.md` lines 1049–1064: invariant polynomials restrict onto `W`-invariants) plus separation of finite-group orbits by invariant polynomials, but the README names neither.
   - **Repair.** Add one sentence to the §3.1 route: "two elements of `H` conjugate under `Int(L)` are `W`-conjugate, because `Int(L)`-invariant polynomials restrict onto `W`-invariant polynomials on `H` (LieHighestWeight Layer 7, Chevalley restriction) and `W`-invariant polynomials separate `W`-orbits of the finite group `W`"; and note that the ℝ-form of RootSystems Layer 4 is applied to the rational span of the coroots, on which every neutral element lies since its root values are integers. Note for the fix worker: §3.4 does not need uniqueness (any dominant representatives with equal profiles are equal), so no headline changes.

6. **F06** (P3) "Centralizer reductive of full rank (LieHighestWeight Layer 9)" is not a Layer 9 statement

   - **Location.** README §3.1 route: "its centralizer is reductive of full rank (LieHighestWeight Layer 9), so it lies in a Cartan subalgebra".
   - **Witness.** `LieHighestWeight/README.md` lines 1432–1460: Layer 9 is the structure of `HasCentralRadical` algebras and `gl_n`; it does not state that the centralizer of an ad-semisimple element of a Killing algebra is reductive.
   - **Repair.** Replace by the direct argument: let `L_0 = ker(ad h)`; a Cartan subalgebra `H'` of `L_0` contains the central element `h` and is self-normalising in `L` because an element normalising `H'` has `[x, h] ∈ L_0`, which forces its nonzero `ad h`-components to vanish; so `H'` is a Cartan subalgebra of `L` containing `h`. Cite Mathlib's existence of Cartan subalgebras for `L_0` and LieHighestWeight Layer 7 for conjugacy to `H`.

7. **F07** (P3) Exceptional identification cites Layer 7 where Layer 8 is the owner

   - **Location.** README §3.4 route: "The identification of `L` with a split algebra with root system of type `T` is LieHighestWeight Layer 7"; Lean docstring of `exists_innerAut_of_finrank_weightFiltration_adjoint_exceptional`.
   - **Witness.** `LieHighestWeight/README.md` lines 1197–1226: Layer 8 is where `LieAlgebra.g₂ K`, `f₄`, `e₆`, `e₇`, `e₈` are shown finite-dimensional, Killing-simple, with split Cartan and root system of their type (via concrete models and the Layer 7 presentation). Layer 7 alone presents a Killing algebra one already has; it does not say that Mathlib's Serre quotient of `CartanMatrix.G₂` has root system `G₂`.
   - **Repair.** In §3.4 *Needs:* and Dependencies add "LieHighestWeight Layer 8 (Mathlib's exceptional Serre algebras are Killing of their type)"; keep the Lean hypotheses `[FiniteDimensional K L] [LieAlgebra.IsKilling K L]` as they are (they are redundant given Layer 8 but harmless; say so in the docstring instead of "so that the statement does not depend on Serre's presentation theorem", since the proof does).

8. **F08** (P3) ReductiveGroups citations in §0.2 name statements the layers make only in pieces

   - **Location.** README §0.2: "`G(K)` is generated by its root subgroups `U_α(K) = exp(K e_α)` (ReductiveGroups Layer 7)" and "a central isogeny is surjective on `K`-points and has central kernel (ReductiveGroups Layer 6)".
   - **Witness.** `ReductiveGroups/README.md` lines 627–686: Layer 7 states the Bruhat decomposition, the rank-one maps `n_α(a) = x_α(a) x_(−α)(−a⁻¹) x_α(a)` and generation of `U⁺` by positive root subgroups; generation of a semisimple `G` by all root subgroups needs the extra sentence that the coroot images `α∨(K×) = n_α(a) n_α(1)⁻¹` generate `T` when `G` is semisimple. Lines 466–480: Layer 6 names central isogenies but not surjectivity on points over an algebraically closed field.
   - **Repair.** Spell the route: Bruhat decomposition and rank-one maps (Layer 7), `T` generated by coroot images because the coroots span `Y(T) ⊗ ℚ` for semisimple `G` (RootSystems Layer 6 root datum), and for the isogeny statement cite Layer 6 together with the standard fact or add it as a Check-level remark. The §0.2 `SL₂` Check already computes the rank-one factorisation `diag(c, c⁻¹) = w(c) w(1)⁻¹`; it is the right witness and should be referred to from the route.

9. **F09** (P3) Minusculeness of `ω_r` in type `D_r` is used but not owned

   - **Location.** README §2.3 route: "has the stated weights by Layer 6 (minuscule)"; §2.3 *Needs:* "LieHighestWeight Layers 4, 6".
   - **Witness.** `LieHighestWeight/README.md` lines 858–866 define "minuscule" and prove the Pieri rule for a minuscule weight; they do not prove that `ω_r` of `D_r` is minuscule, which is the root-system computation `⟨ω_r, α∨⟩ ∈ {0, ±1}` for every root `α = ±ε_i ± ε_j`. SpinRepresentations Layer 5 gives the weights over `ℂ` only.
   - **Repair.** Add to §2.3 the sentence "`ω_r` is minuscule: `⟨ω_r, (±ε_i ± ε_j)∨⟩ ∈ {0, ±1}`" with the one-line computation as a Check (values `½(±1 ± 1)`), so that the weights of `L(ω_r)` over `K` are the `W`-orbit of `ω_r`, which is the even-sign-vector set.

10. **F10** (P3) Scope: an unnamed owner and two consumer-facing deferrals

   - **Location.** README Scope: "The analytic comparison `Ad(G) = Int(𝔤)` for real Lie groups belongs to its analytic owner".
   - **Witness.** The owner is not named; the worker's report names NoncompactQuantumSymmetry (open pull request, README line 775). Separately, the open pull request TwistedAutomorphicDescents cites this roadmap by the design-stage names "N0, nilpotent-orbit" and "N2, classical-partitions" (its README lines 17, 81, 83, 212, 960) and declares two gaps against this roadmap, rational nilpotent orbits and dominance of classical partitions; the package deleted N0/nilpotent-orbit (now NilpotentOrbits N0.3, N2.4) and renamed N2/classical-partitions to §2.2, and neither rational orbits nor the dominance order is mentioned anywhere in the Scope.
   - **Repair.** Name NoncompactQuantumSymmetry (by roadmap name, as a kept-variant note) for the analytic statement. In Scope, add that nilpotent orbits as varieties, their rational forms and the dominance order of partitions are not treated here and belong to NilpotentOrbits (N2.4, N4), so a consumer that needs them cites that roadmap; this is what lets TwistedAutomorphicDescents repoint its gaps.

11. **F11** (P3) The docstring is silent on the half-integrality test named as an end theorem

   - **Location.** README Summary: "A second strand proves the highest-weight half-integrality test"; `Suggested.lean` module docstring lists stated and not-statable headlines without it.
   - **Witness.** CH Lemma 6.30 (CH line 1158) is the summary's second-strand end theorem; the docstring neither states it nor says why it is omitted. It is a short coset argument on top of LieHighestWeight Layer 3, so stating it would be padding; but the brief asks that each headline named by the README be either stated or named in the docstring.
   - **Repair.** One sentence in the docstring: the half-integrality test (CH Lemma 6.30, README §5.2) is a corollary of LieHighestWeight Layer 3 and is kept in the README as a target rather than stated here.

12. **F12** (P3) Licence class of the Sommers notes

   - **Location.** `packages/LieHighestWeightPartII/sources.toml`, entry `SOM`: `licence_class = "author-page"`, `url` on a colleague's page at a university domain.
   - **Witness.** The file is hosted on Peter Trapa's page at the University of Utah, not on the author's (Sommers) page; the manifest's own vocabulary has `institutional` for university-hosted copies.
   - **Repair.** Change `licence_class` to `institutional` (the worker records it; the entry is otherwise kept as the author wrote it). No locator changes: SOM line 361–365 supports §0.3 (Mal'cev injectivity of the neutral-element map) and lines 366–374 support §3.1.

Previous review: none. The package was read in full (README, Suggested.lean, metadata.toml, sources.toml, design/plan.json, the worker's package report). Every cross-roadmap citation was resolved on main (LieHighestWeight, NilpotentOrbits, ReductiveGroups, RootSystems, SpinRepresentations) or on the board (ReductiveGroupsPartIII design, Layer RG3.0), every library name at the pins (file and line below), every sampled locator at the cited line of the cached texts. The exceptional-type numbers were recomputed from the Bourbaki Cartan matrices with my own script, not taken from the README or from the worker's report.

## Verified sound

**Principles.** No route-specific shortcut (every statement is over a general algebraically closed `K` of characteristic zero, Layer 5 over `ℂ` as its source); no re-planning (Jacobson–Morozov, Kostant, weighted diagrams, type-`A` partitions, `Int(L)`, highest-weight modules and character separation are imported by name and section, and I confirmed each at its owner: NilpotentOrbits N2.1/N2.2/N2.4/N4, LieHighestWeight Layers 0–7, 9, ReductiveGroups Layers 2, 5P, 6, 7, 10B, ReductiveGroupsPartIII RG3.0 `highest-weight-character-basis` and `character-separation` on the board design, RootSystems Layers 4–6, SpinRepresentations Layer 5); supply is downward (depcheck below); no copied passages (every source statement is paraphrased and I compared the CH, DG, SOM lines); no algorithm (§3.3 is a finite injectivity theorem; the design's checker language is gone); no sorry'd data, no `set_option`, imports `import Mathlib` plus one existing `TauCeti.*` module.

**Dependency check** (run by me, output verbatim):

```
depcheck: 205 roadmaps, 1750 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Merge order: this roadmap at line 309; ReductiveGroupsPartIII at 239, ReductiveGroupsPartII at 23; the other suppliers are on main. `roadmaps resolve` on the README: no unresolved cross-roadmap citation, no unresolved Lean name.

**Elaboration.** `lake env lean` on `Suggested.lean` from the content checkout (object file of `TauCeti.Algebra.Lie.InnerAutomorphism` present): exactly six `declaration uses 'sorry'` warnings at lines 76, 93, 107, 123, 143, 163, exit code 0, nothing else. Signatures: the nine elaborated types in the worker's signature file were compared with the README statements; each carries `[IsAlgClosed K] [CharZero K]`, the finiteness and Killing hypotheses and the `Type (max u v)` module quantifier as the README states them; no section binder is lost (every declaration has its binders in its own signature). One-tactic probe: a scratch copy with each `sorry` replaced by `first | rfl | simp | infer_instance | exact trivial` elaborates with six errors, one per theorem, so none of the six closes trivially; none restates a definition, mirrors a Check or computes a value. No padding.

**Sampled sources (every target of the seeded sample, read at the cited line).**

| Target | Locator | Found at | Supports the statement as written |
| --- | --- | --- | --- |
| 0.1 | CH §2.1 (2.1) p.6 | CH line 277–280 | yes: the three relations; `e` nilpotent |
| 0.3 | DG §3 Lemmas 2–3 p.4; SOM §3.1 pp.15–16 | DG line 139–153; SOM line 361–365 | yes: open `G_h`-orbit in `g(2)`; Mal'cev: neutral element determines the class |
| 1.1 | CH Appendix proof of 10.9 p.35 | CH line 1707–1708 | yes: span of the triple is `sl₂`, module determined by the filtration |
| 1.2 | CH Def. 2.2 p.6 | CH line 288–294 | yes: increasing `ℤ`-filtration, `e` raises by 2, `h` acts by `i` on `gr_i` |
| 1.4 | CH Def. 2.2 p.6 | CH line 284–290 | yes: symmetric monoidal functor to filtered spaces |
| 2.1 | LieHighestWeight Layer 0 | main, Layer 0 lines 319–350 | standard `sl₂` theory; invariant-form statement is this roadmap's own small lemma (ownership search: no owner on main, board or open heads) |
| 2.2 | CH line 1709–1715 | yes | partition classification cited to Collingwood–McGovern; roadmap proves it from §2.1 |
| 2.3 | CH line 1716–1727 | yes | half-spin separation; the source's chamber misprint recorded below |
| 2.4 | CH line 1709–1727 | yes | classical recognition |
| 3.2 | DG §2 p.3 | DG line 82–86 | yes: grading `g(k)`, `η(α)` |
| 3.3 | CH line 1728–1730 | yes | adjoint separation asserted for realised orbits; candidate set is this roadmap's strengthening |
| 3.5 | CH Tables 2–4; DG Tables 2, 3, 6 | CH line 1734–1837; DG line 262–301, 530 | yes; the table-header misprint recorded below |
| 5.2 | CH Lemma 6.30 p.24 | CH line 1158–1171 | yes, with coroot/root roles dualised consistently |
| 5.3 | CH §10.1 p.32; Def. 2.5 p.7 | CH line 1549–1553; 323–331 | yes |
| 5.5 | CH Prop. 10.2 p.32 | CH line 1554–1565 | yes: proof via characters generating `O(T)^W` |

Author-flagged unverified locators: none. Also checked: §0.2 (CH line 1703: the quantifier is over all Lie-algebra modules), §4.1 (CH line 296–300, 1701–1706), §5.4 (CH line 1555–1556).

**Library declarations opened at the pins.** Tau Ceti: `expAd` (`Algebra/Lie/InnerAutomorphism.lean` 107), `ratLieAlgebra` (97), `expAd_apply_eq_exp_mul_exp_neg` (206), `weylAut` (`Algebra/Lie/Sl2/Weyl/Automorphism.lean` 106) with `weylAut_apply_h` (165, `h ↦ −h`), `isNilpotent_toEnd_of_isNilpotent_ad` (`RepresentationTheory/Lie/AdNilpotent.lean` 93, hypotheses `[FiniteDimensional K L] [IsKilling K L]` as the README says), `exists_lie_eq_self_of_isNilpotent_ad` (`Algebra/Lie/Killing/AdNilpotent.lean` 146), `exists_int_of_hasEigenvalue` (`Sl2/Spectrum.lean` 147, over a characteristic-zero domain), `iSup_eigenspace_toEnd_intCast_eq_top` (292) and `isInternal_eigenspace_toEnd_intCast` (305) in a section with `[Field K] [CharZero K] [IsAlgClosed K] [FiniteDimensional K M]` and no hypothesis on `L`, `Sl2Std.exists_isInternal_lieModuleEquiv` (`Sl2/Decomposition.lean` 68), `finrank_eigenspace_toEnd_neg` (`Sl2/WeightMultiplicity.lean` 201, `[Field K] [CharZero K]`), `lieHomOfSl2Basis` (`Sl2/Basic.lean` 315; relations with `(2 : K) •`, equivalent to the `2 •` of the Lean structure), `DynkinType.cartanMatrix` (`LinearAlgebra/RootSystem/DynkinType.lean` 222, `G₂` as `CartanMatrix.G₂ᵀ`, matching the Conventions), `oppositionPerm` (`LinearAlgebra/RootSystem/Opposition.lean` 198), `typeDSpinPlusLieRep` (see R01). `DynkinType.numRoots` is not a pinned declaration (only `F4.numRoots` exists at the pin); the README cites it as a RootSystems Layer 6 target, which is where it is stated. Mathlib: `IsSl2Triple` (`Algebra/Lie/Sl2.lean` 38, fields as the README lists), `LieDerivation.exp` (`Algebra/Lie/Derivation/Basic.lean` 398), `LieDerivation.IsKilling.exists_eq_ad` (`Derivation/Killing.lean` 108), `IsNilpotent.exp` (`RingTheory/Nilpotent/Exp.lean` 50), `sl`/`sp`/`so`/`typeD` (`Algebra/Lie/Classical.lean` 92, 157, 166, 252), `g₂ … e₈` (`Algebra/Lie/SerreConstruction.lean` 152–164), `CartanMatrix.F₄` and `G₂` (`LinearAlgebra/Matrix/Cartan/Basic.lean` 106, 114: `F₄` has `A₂₃ = −2`, `G₂` is the transpose of Bourbaki's), `CartanMatrix.E` (55: edges `(1,3), (2,4), (3,4), …` in Bourbaki labels), `FilteredObject` (`CategoryTheory/Filtration/Basic.lean` 72).

**Adversarial table** (sampled targets, headlines and every target a finding touches; values computed by me).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 `IsSl2TripleOrZero` ⇔ zero or `IsSl2Triple` | `(0,0,0)`; `(H,E,F)`; `(0,E,0)`; `(H,F,E)`; `(−H,F,E)`; `e=0`; ring with `2=0` | `[0,E]=0≠2E`; `[F,E]=−H`; `e=0 ⇒ h=[e,f]=0 ⇒ 2f=0 ⇒ f=0`; with `2=0` any `(0,e,f)` satisfies all three | holds in char 0 | none |
| §0.2 `Int(sl₂)=Ad(SL₂)` witness | `diag(c,c⁻¹)` | `w(c)=x(c)y(−c⁻¹)x(c)=[[0,c],[−c⁻¹,0]]`; `w(c)w(1)⁻¹=diag(c,c⁻¹)`; `Ad` on `E` by `c²` | holds | R08 names the generation route |
| §0.2 inner invariance | generator `exp(ad x)`, abelian `L`, `so(8)` half-spin | `ρ∘(ad x)^n=(ad ρx)^n∘ρ`, so `exp(ρx)ρ(y)exp(−ρx)=ρ(exp(ad x)y)` once `ρx` nilpotent (Killing needed; abelian `L`: `Int(L)=1`) | holds | none |
| §0.3 conjugacy from `h` | zero triple; `sl₂` `(H,cE,c⁻¹F)`; `so(8)` `(4,4)`; `f` uniqueness | `h=0⇒e=f=0`; `Ad(diag(√c,1/√c))E=cE`; `(3,3,1,1)` vs `(3,3,1,−1)` not related by an even number of sign changes; `ker(ad e)∩L_(−2)=0` | holds | R03 (generality of the `[L_0,e]=L_2` citation) |
| §1.1 restriction | trivial 2-dim module; `K²` along `(−H,F,E)`; `sl₃` adjoint along minimal/zero triple | weights `2,1,1,0,0,−1,−1,−2` ⇒ `V(2)⊕2V(1)⊕V(0)`; zero triple ⇒ `8V(0)` | holds | none |
| §1.2 `weightFiltration` | zero triple; `V(1)`; adjoint `sl₂`; decreasing convention | zero: `0` for `i<0`, `M` for `i≥0`; `V(1)`: `0,1,2`; adjoint: `1,1,2,2,3`; decreasing: `3,2,2,1,1`; `W_(−2)=KF` not `ad E`-stable | holds | none |
| Headline `finrank_weightFiltration_eq_iff_exists_intertwiner` | `V(2)⊕2V(0)`; `V(1)⊕V(0)`; `V(2)` vs `V(0)⊕V(1)`; zero triple vs nonzero triple on a module with all weights `0`; `M=0,M'≠0`; `L` non-Killing | `d_0=3,d_2=1,m_0=2,m_2=1,W_0=4`; `m_0` from cumulative dims `2−3`; `(1,1,2,2,3)` vs `(0,1,2,3,3)`; all-zero weights force `e',f'` to act by `0`, any linear iso intertwines; `M=0`: dims differ at large `i`; integrality/diagonalisability of `h` needs no hypothesis on `L` (Spectrum.lean section variables) | holds both ways | none |
| §1.4 tensor and dual | `V(1)⊗V(1)`; `V(1)*`; unit | `d=1,2,1`, cumulative `1,1,3,3,4`; `dim W_i(M*)` = `0,1,1,2` at `i=−2..1` = `dim Ann(W_(−i−1)M)`; the misindexed `Ann(W_(−i)M)` gives `0` at `i=−1`; unit: `0` for `i<0`, `K` for `i≥0` | holds | none |
| §2.1 invariant forms | `V(1)`, `V(2)`, `H`-invariance alone | determinant pairing alternating; `tr(H²)=2`; two free parameters under `H` alone | holds | none |
| §2.2 parities and splitting | `sp(4)` `(3,1)`, `(2,2)`; `so(3)` `(2,1)`; `so(4)`; `so(8)` | `γ_n` of opposite/same type ⇒ odd parts even multiplicity in `sp`, even parts even multiplicity in `so`; reflection on `V(n)⊗line` has `det (−1)^(n+1)`, `=−1` exactly for even `n` i.e. odd block size; `so(4)`: `V(1)⊠V(1)` restricted to the diagonal is `V(2)⊕V(0)`, partition `(3,1)` | holds | none |
| §2.3 half-spin maxima | `a=(3,3,1,1)`; `(1,1,1,1)`; `(1,1)`; odd half-spin | `L(ω_r)`: `4,3`; `2,1`; `1,0`; `L(ω_(r−1))`: `3,4`; `1,2`; `0,1`; general: all-plus gives `A`, for `h_II` the even vectors give `A−a_i≤A−a_r` | holds | R09 (minuscule step) |
| `so` headline hypothesis | `n=0,1,2`; `n` odd; `so(4)` `(2,2)`, `(3,1)`; `so(8)` `(4,4)` | `so(2)` abelian: only zero triple; odd `n` ⇒ odd part ⇒ weight `0`; `(2,2)` and `(4,4)` have `ker h=0` and are the very even cases; not very even ⇔ odd part ⇔ `ker h≠0` | holds; proviso exact | R01 adds the half-spin form |
| `sl`, `sp` headlines | `sl₀=sl₁=0`; `sl₃` minimal/regular; `sp(2)=sl₂`; `l=∅` | intertwiner in `GL_n` rescaled to `det 1`; standard spectra `(1,0,−1)` vs `(2,0,−2)`; `sp(2)` jumps `2@0` vs `1,1@±1` | holds | none |
| §3.1 characteristic | `E₆` opposition; `G₂ (2,0)`; zero; principal | `81=3⁴` of `729`; `(2,0)` profile `4,0,2,0,1,0,2`, `d_4=1<d_6=2`; zero profile `(14)`; principal `(2,2)` | holds | R05, R06 (route citations) |
| §3.2 profiles | root counts; `2·ht(θ)`; `a=0`; `G₂ (2,2),(0,1),(1,0)`; `F₄ (2,2,2,2)`; Cartan term | `12,48,72,126,240`; `10,22,22,34,58`; `dim` `14,52,78,133,248`; `2,0,2,0,1,0,1,0,1,0,1`; `4,4,1`; `4,2,1,2`; `F₄` evens `4,4,3,3,3,3,2,2,1,1,1,1`, `F_0=28`; without `r·[m=0]` total `48` | holds | none |
| §3.3 candidates and injectivity | all five types; `E₆` without opposition | `|C_T|=7,28,34,274,245`, distinct profiles equal, injective; `C_(G₂)` is the listed seven; `E₆`: `212` vectors, `123` profiles, `(1,0,0,0,0,0)` and `(0,0,0,0,0,1)` both `46,16` | holds | none |
| §3.4 exceptional headline | `G₂` five classes; zero triple; `so(8)` adjoint | profiles `14`; `4,4,1`; `4,2,1,2`; `4,0,4,0,1`; principal — pairwise distinct; very even pair has equal adjoint filtrations in type `D` | holds | R07 (Layer 8 citation) |
| §3.5 tables | all 15 `F₄` rows; all 4 `G₂` rows; `E₈` principal; nesting | every `F₄` row equals `D_(F₄)` of the DG diagram (Bourbaki order; CH labels `A1+~A2`, `C3(a1)`, `F4(a3)`, `F4(a2)`, `F4(a1)` are DG's `~A2+A1`, `B2+A1`, `~A2+A2`, `C3+A1`, `B4`); `G₂` rows match with DG's node order reversed; `E₈` row equals `D_(E₈)(2,…,2)` in all 59 entries; `4,0,4,…` cannot be nested | holds | none |
| §4.1 headline | `L=0`; `sl₂×sl₂` `(t,0)` vs `(0,t)`; `so(8)`; universe | `L=0` Killing with only the zero triple; adjoint weights `2,0,−2,0,0,0` for both, factor pullback `1,1@±1` vs `2@0`; `Int(L)=∏Int(L_i)` since `exp(ad Σx_i)=∏exp(ad x_i)`; `Type (max u v)` admits `ULift` of `L` and `Kⁿ` | holds | R04 (classical identification) |
| §5.1–5.2 half-integrality | `A₁`, `ν(α)=½`; `ν(α)=⅓`; `Q=0`; `PGL₂`; `λ=3ω` | `ν(ω)=¼`; `⅓` breaks at `μ=α`; `PGL₂` weights `kα` give `k/2`; weights of `L(3ω)` are `±ω,±3ω`, `ν=±¼,±¾` | holds | R11 (docstring) |
| §5.3 patterns | zero space; trivial; `diag(q^½,q^−½)` and its square; `diag(i,−i)` vs `1` | `0`; `δ_0`; `1@±1`; `1,2,1@2,0,−2`; equal patterns, non-conjugate | holds | none |
| §5.4 positive part | `diag(z,z⁻¹)`; `z=i`; `PGL₂` `diag(±z,1)`; torus change | `diag(|z|,|z|⁻¹)`; `r=1`; equal since `|α|` only; `χ'(g r_T(s) g⁻¹)=|χ'(s)|` for `g∈Z_G(s)°` | holds | R02 (docstring/statability) |
| §5.5 recognition | the three Checks | traces `Σ n(i)q^(i/2)`: equal / equal (Weyl image) / `q^½+q^−½` vs `2` | holds | none |

**Checks.** 22 Check blocks, 3 to 5 bullets each (counts per section in the worklist), every definition with at least three; each computed value above agrees with the README.

**Ownership.** Searched main and all open heads with `roadmaps grep` for "very even", "half-spin … separat", "weight pattern", "positive real part", "Jacobson–Morozov", "Int(L)", "zero-inclusive", "weight filtration", "Ciubotaru", "innerAutGroup", and for the orthogonal/symplectic partition classification: no owner other than those cited; FunctionFieldArithmetic cites CH for unrelated statements; NoncompactQuantumSymmetry (open) states the analytic `Ad(G)=Int(𝔤)` (R10). No `Suggested.lean` name coincides with a declaration of another roadmap. Ownership against the board packages index (five packages) checked: none overlaps. The consumer TwistedAutomorphicDescents (open) cites design-stage target names of this roadmap (R10).

**README shape and policy.** Headings as upstream; Examples and Dependencies in every layer; no LaTeX delimiters, no process words, no pull-request numbers, no absolute paths, no `lemma` in Lean (the README's only "lemma" is Schur's); all nine Lean names appear once in the README and every backticked own name in the README is declared.

## Not verifiable

- CH's statement that a Mathematica computation verifies the exceptional separation for `E₆` and `E₇` (CH line 1728–1733): no tables are given; I recomputed the injectivity on `C_(E₆)` and `C_(E₇)` myself (34 and 274 candidates), so the roadmap's claim does not depend on it.
- The published version of CH (Annals) and of DG (LMS J. Comput. Math.) were not opened; locators are to the arXiv versions the manifest records, as the README says.
- Ownership against open pull requests whose files the brief does not provide was not checked beyond the `roadmaps grep` index of 441 pull requests.

## Source issues

- **Misprint** in CH at Appendix, proof of Lemma 10.9, printed page 35 (CH line 1720–1725): the source gives simple roots `±ε₁+ε₂, ε₂−ε₃, …` with neutral elements in ascending coordinates `a₁ ≤ ⋯ ≤ a_r`; it should use descending coordinates, or the simple roots `ε_(i+1) − ε_i`, for the chamber to be dominant (for `(1,1,3,3)` the pairing with `ε₂−ε₃` is `−2`); affects nothing (the two maxima are unchanged).
- **Misprint** in CH at Tables 2–4, printed pages 36–37 (CH line 1734, 1813, 1831): the column header says the entries are filtration dimensions `dim Fil_i`; they are the graded dimensions `dim gr_i` (the principal `F₄` row `4, 0, 4, …` cannot be nested); affects a stated result's reading, not its truth.
- **Gap** in CH at Appendix, proof of Lemma 10.9, printed page 35 (CH line 1731–1733): the source says the `E₆` and `E₇` cases follow from `E₈` because they are Levi subalgebras; equality of the adjoint filtration on the Levi summand does not control the complementary summands, and `E₈`-conjugacy is not Levi-conjugacy, so the cases need their own verification; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "180618265baf68aba518204b1d03fa5a9a69d68c", "job": "REV-PKG-LieHighestWeightPartII", "model": "fable", "worker": "chris-x12"} -->

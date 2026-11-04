# Review of FormalConnectionsOpers (pull request #1056 at 892f8d5)

**Verdict:** needs changes

Gate at this head: every check passed (`build=0`, `depcheck=0`, `stray-files=0`); my own dependency check prints `depcheck: 204 roadmaps, 1417 edges, 0 problem(s)` with no UPWARD, CYCLE or `moved:` line. No change outside the roadmap folder. The two blocking findings are ownership defects the gate does not see: a supplier target re-planned here, and an owned headline that is statable at the pins but absent from `Suggested.lean`.

**Status of the previous review's findings (e2a605f).**

- R01 (AffineLieAlgebras cycle): repaired. README lines 97–101 ("This roadmap consumes nothing from it: §7.5 constructs its completion explicitly"); no supplier row, no `*Needs:*` line names AffineLieAlgebras; §7.5 lines 2104–2113 build the completion `lim_N k[w_i[a] : a < N]` itself.
- R02 (KacMoody cycle): repaired. Lines 102–106 and 1142–1143 make KacMoody a consumer only; no KM8A supplier row.
- R03 (LieGroups cited from a revision pull request): repaired. Lines 302–310 cite Layers 0, 6 and 7 as on main; verified at `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md` lines 233–259 (`lieExp`, derivative the identity, local diffeomorphism), 383–406 (maximal tori, `N_G(T)/T ≃ RootPairing.weylGroup` as a milestone, `lieExp` surjective for compact connected groups) and 407–425 (compact real form as a milestone). The holomorphic exponential chart, the realification comparison and the torus matching are now targets of §4.3 (lines 1314–1329, 1381–1403).
- R04 (Chevalley restriction re-planned): repaired. Lines 312–319 and 1355–1379 import LieHighestWeight Layer 7; the five names exist on main at `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md` lines 981, 989–997, 1066–1067.
- R05 (PadicDifferentialEquationsAndRigidCohomology later in the order): repaired by the other allowed route: §6.2 now owns the cyclic-vector theorem (lines 81–88, 1745–1795) and PadicDifferentialEquationsAndRigidCohomology is listed as a consumer only. The notion moved down into this roadmap; see R02 and R07 below for what that still needs.
- R06 (nonexistent backticked supplier names): repaired. None of the seven dotted names or `Crystalline.Connection` remains; `regularAffinePointHomeomorph` (line 748) matches `TauCeti/Geometry/Toric/Analytic/RegularChart.lean` line 200 with target `(ι → ℂ) × (κ → ℂˣ)`.
- R07 (shape): repaired. Counts at this head: 39 `**Checks.**` lists, 38 `*Needs:*` lines, 9 `### Examples`, 9 `### Dependencies`; every theorem now carries a locator.
- R08 (process narrative): repaired. No "acceptance", Zulip, pull-request or round words remain.
- R09 (design note on the `G(ℂ)` dictionary): unchanged, as expected. Note for the intake: NilpotentOrbits on main (lines 60, 63) links this README by the old fragments `#f2-algebraic-sheaf-connections-and-differential-operators` and `#f4-intrinsic-opers-and-the-dskostant-slice`, and KacMoody at its head (lines 16, 154) by `#f3a-polynomial-loops-full-cocharacters-and-positive-quotients`; the headings are now `## Layer 2: … (F2)`, `## Layer 4: … (F4)`, `## Layer 3A: … (F3A)`, so those fragments are dead. That is the consumers' text, not this folder's.

## R01 (P2) — §2.2 re-plans ComplexComparisonPartII C5.1's algebraic differential-operator and principal-parts interface, and inverts the supply direction

Location: `TauCetiRoadmap/FormalConnectionsOpers/README.md` lines 36–42 ("§2.2 supplies the algebraic operators and all-order principal parts below that prefix"), lines 554–613 (§2.2: "construct all-order principal parts … this is `principalParts_universal`, with the order predicate `IsDifferentialOperator` … the relation module `principalPartsRelations` … `PrincipalParts` … `principalJet`"), lines 830–832 ("The stage order is §2.2's algebraic operators and all-order principal parts, then ComplexComparisonPartII C5.1's analytic operator adapter"); `Suggested.lean` lines 50–106.

Claim: this roadmap owns the characteristic-free order predicate, relation module, principal-parts quotient, universal jet and universal bijection, and ComplexComparisonPartII C5.1 sits above them.

Witness: ComplexComparisonPartII at the head of its pull request (#848, merge-order position 38, one before this roadmap at 39), `TauCetiRoadmap/ComplexComparisonPartII/README.md` line 149: "C5.1 states the characteristic-free order predicate, commutator/order laws, localization and all-order principal parts with their universal property … C5.1 is the single owner of these characteristic-free definitions and their laws. FormalConnectionsOpers F2.2 consumes from C5.1 the order predicate, relation module, principal-parts quotient, universal jet, composition maps and universal property; C5.1 does not consume FormalConnectionsOpers"; lines 2391–2425 state exactly the interface of §2.2 (order predicate by iterated commutators, `P^m = ((A ⊗_k A)/I^(m+1)) ⊗_(A,right) M`, jet `s ↦ 1 ⊗ s`, the bijection with operators of order `≤ m`, composition maps `P^(m+n)(M) → P^m(P^n(M))`, localization, the finite-presentation caveat), with the same `d/dz` and `𝔽_p[z]` Checks. This roadmap consumes C5.1 (its `DifferentialOperatorAnalytification`, line 761), so the object cannot also be supplied upward to C5.1; what the earlier roadmap plans is imported, never planned again. The previous review did not compare the two texts.

Repair: in §2.2 cite ComplexComparisonPartII C5.1 for the order predicate, relation module, quotient, jet, universal bijection, order-transition and composition maps and localization, and keep as this roadmap's targets only what C5.1 leaves to it (line 2395: symbols, the Atiyah sequence and its splitting criterion, the Lie–Rinehart enveloping algebra and PBW, the sheaf form and the comparison with form connections). Rewrite the Scope bullet (lines 36–42) and the Layer 2 stage order (lines 830–832) so that C5.1 is below §2.2, and the `From TauCetiRoadmap.ComplexComparisonPartII` contract to name C5.1's algebraic interface. Delete the `PrincipalParts` section of `Suggested.lean` (lines 50–106) and the module-docstring bullet for F2.2, and remove the five backticked names from §2.2 and the Summary's "universal property of all-order principal parts" end theorem; that headline is C5.1's. If the author believes the ownership should be the other way round, that is a decision for the intake across both pull requests, not a text this roadmap can assert alone.

## R02 (P2) — The cyclic-vector theorem of §6.2 is a statable headline and is absent from `Suggested.lean`

Location: README lines 81–85 ("§6.2 owns the cyclic-vector theorem for finite-dimensional differential modules over a differential field of characteristic zero with nonzero derivation, since no roadmap earlier in the merge order states it"), lines 1750–1758, 1766–1769; `Suggested.lean` docstring lines 24–39 (does not name it).

Claim: the module docstring lists every headline not statable at the pins; F6 is said to be unstatable because "flat principal bundles over `ℂ((t))`, torsors under group schemes and opers are not carriers at the pins".

Witness: the theorem §6.2 owns is the `GL_n` case of the Layer 6 headline (line 1758: "the theorem is the `G = GL_n` case of §6.1"; frenkel-zhu lines 80–85) at the full generality the README states, and every carrier in it exists at the pins. On a scratch copy the following elaborated under `lake env lean` with `sorry` as the only warning:

```lean
def IsDifferentialModuleMap {F : Type u} [Field F] (d : Derivation ℤ F F) {V : Type u}
    [AddCommGroup V] [Module F V] (D : V →+ V) : Prop :=
  ∀ (f : F) (v : V), D (f • v) = d f • v + f • D v

theorem exists_cyclicVector {F : Type u} [Field F] [CharZero F] (d : Derivation ℤ F F)
    (hd : d ≠ 0) {V : Type u} [AddCommGroup V] [Module F V] [FiniteDimensional F V]
    (D : V →+ V) (hD : IsDifferentialModuleMap d D) :
    ∃ v : V, LinearIndependent F (fun i : Fin (Module.finrank F V) => (⇑D)^[i] v) := by
  sorry
```

Its elaborated type is `∀ {F} [Field F] [CharZero F] (d : Derivation ℤ F F), d ≠ 0 → ∀ {V} [AddCommGroup V] [Module F V] [FiniteDimensional F V] (D : V →+ V), IsDifferentialModuleMap d D → ∃ v, LinearIndependent F fun i => (⇑D)^[↑i] v`, which is the README's statement (Deligne, LNM 163, II Lemme 1.3, deligne-lnm163 lines 1367–1401; hypotheses characteristic zero and `dt ≠ 0` at lines 1374–1375). The one-tactic probe does not apply to a statement that is not in the file; the theorem is not one tactic (it is Deligne's exterior-product argument).

Repair: add the two declarations above (or an equivalent with `Derivation ℚ F F`) under a `/-! ## Layer 6 (F6): cyclic vectors -/` section, list the theorem in the docstring's "Stated here" list, and write its backticked name into §6.2's API bullet. The move of this notion down from PadicDifferentialEquationsAndRigidCohomology is recorded in this report (see R07).

## R03 (P3) — Source-cache line numbers used as locators in the README

Location: README lines 1037–1038, 1055, 1059, 1241, 1694, 1700, 1752, 1757, 1759, 1768, 1828, 1869 ("cesnavicius-fedorov line 721", "frenkel-loop line 4816", "frenkel-zhu line 67", "steinberg line 134", "deligne-lnm163 lines 1367–1401", "katz-cyclic lines 38–44", …): thirteen occurrences.

Claim: these are locators into the cited sources.

Witness: they are line numbers of the worker's text extraction of each PDF (the `<source id> line N` form of a review report), not of the published text; a reader of the README has no such file, and a re-extraction renumbers them. The README already carries the theorem, equation and page numbers next to each (for example "§4.2.1, pp. 108–109" at line 1240, "Theorem 1" at line 1694), which resolve: Frenkel §4.2.1 begins on printed p. 108, (4.2-3) and Lemma 4.2.1 on pp. 110–111, Lemma 4.2.2 p. 112, (4.2-13)–(4.2-14) pp. 116–117, (3.5-11)–(3.5-12) pp. 96–98, Lemma 8.3.2 p. 247, Conjecture 10.1.1 p. 310.

Repair: delete the thirteen "<id> line N" fragments and keep the theorem, equation and page locators. While there, cite Iwahori–Matsumoto's Cartan decomposition (line 1807) by Proposition 2.34 (iii) with both subgroups equal to `G(O)` rather than "§2", and note that their group is the Chevalley group of a semisimple algebra over a discretely valued field, so the reductive extension with the central torus is this roadmap's target.

## R04 (P3) — Layer 3A needs Layer 6 targets, and Layer 6 needs Layer 3A: a coarse layer cycle

Location: README lines 1086–1087 (§3A.2 *Needs:* "Layer 6's lattice Grassmannian presentation"), line 1194 (§3A.5 *Needs:* "Layer 6's Cartan decomposition and lattice strata"), lines 1229–1231 (Layer 3A Dependencies: "the lattice-Grassmannian and Cartan-decomposition targets of Layer 6"), line 1862 (§6.3 *Needs:* "§3A.3"), line 1944 (Layer 6 Dependencies: "Layers 1–5").

Claim: Layers are in build order.

Witness: at target level the edges are §3A.2 → §6.3 → §3A.3 → §3A.1 and §3A.5 → §6.3, acyclic, and §3A.6 (lines 1213–1216) states that order; but a layer numbered 3A whose targets need Layer 6 and a Layer 6 whose Dependencies list "Layers 1–5" is a coarse cycle an implementer reading the layer headers cannot resolve. The headline `formalLoop_eq_polynomial_mul_positive` itself does not need the Grassmannian: its proof route is the torsor lane of lines 1040–1053.

Repair: either move the loop-Grassmannian and affine-flag ind-schemes, bounded lattice charts and the complex Cartan decomposition (the first paragraph of §6.3, lines 1799–1808) into Layer 3A as a §3A.0, with §6.3 keeping the Schubert, Borel–Moore and Kazhdan–Lusztig material; or move §3A.5 and the "identify both sides with Layer 6's affine-Grassmannian functor" clause of §3A.2 into Layer 6. Then rewrite the two Dependencies paragraphs.

## R05 (P3) — Check with a wrong series in §3A.2

Location: README lines 1080–1082: "`[[1, t⁻¹ + t⁻² + ⋯], [0, 1]]` with the geometric series `(1 − t)⁻¹ t⁻¹`".

Claim: the displayed entry equals `(1 − t)⁻¹ t⁻¹`.

Witness: `(1 − t)⁻¹ t⁻¹ = t⁻¹ + 1 + t + t² + ⋯` in `ℂ((t))`; the written `t⁻¹ + t⁻² + ⋯` has infinitely many negative powers and is not a Laurent series. The factorization that follows is right: `(1 − t)⁻¹t⁻¹ − t⁻¹ = t⁻¹(t(1 − t)⁻¹) = (1 − t)⁻¹`, positive.

Repair: write the entry as `t⁻¹ + 1 + t + ⋯`.

## R06 (P3) — Check with a wrong annihilator in §1.3

Location: README lines 487–489: "the annihilator of `V[[t]]` is exactly `V^∨[[t]] dt`. Dropping the `dt` shifts the annihilator to `t⁻¹ V^∨[[t]]`".

Claim: with the `dt` dropped the annihilator becomes `t⁻¹V^∨[[t]]`.

Witness: with the residue pairing `⟨v t^i, φ t^j⟩ = φ(v)` iff `i + j = −1` the annihilator of `{i ≥ 0}` is `{j ≥ 0}` whether or not the symbol `dt` is written; with the constant-term pairing `⟨v t^i, φ t^j⟩ = φ(v)` iff `i + j = 0` (the only "dt-less" pairing that changes anything) the annihilator of `{i ≥ 0}` is `{j ≥ 1} = t V^∨[[t]]`. Neither reading gives `t⁻¹V^∨[[t]]`; that would require `i + j = −2`.

Repair: say which pairing the wrong model uses and give its value, `t V^∨[[t]]` for the constant-term pairing.

## R07 (P3) — Downstream claim about PadicDifferentialEquationsAndRigidCohomology that its head does not make; the move must be recorded

Location: README lines 2351–2354 ("PadicDifferentialEquationsAndRigidCohomology §§RD.1.2–RD.1.7 and §RD.6.52a consume §6.2's cyclic-vector theorem").

Claim: that roadmap consumes §6.2.

Witness: at its head (#1002, merge-order position 105) `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md` line 153 reads "This roadmap owns the cyclic-vector theorem over characteristic-zero differential fields with nonzero derivation (§RD.1.2–§RD.1.6) … FormalConnectionsOpers F6 consumes the `F=ℂ` specialization of these differential-module results", and §RD.1.7 (line 2379) states the theorem with Katz's candidates as its own. The theorem now has two owners in two open pull requests, each saying the other consumes it. Since that roadmap is later in the order, owning it here is the correct side of the move; the record of the move is this report, and the intake reconciles the later roadmap.

Repair: write the bullet as a statement of fact about this roadmap ("§6.2 is the owner of the cyclic-vector theorem at this generality; PadicDifferentialEquationsAndRigidCohomology, later in the merge order, states it in §§RD.1.2–RD.1.7 and is to import §6.2"), and keep the sentence that its normal forms, slopes and ramified descent are its own. **Move recorded:** the cyclic-vector theorem over characteristic-zero differential fields with `∂ ≠ 0` moves from PadicDifferentialEquationsAndRigidCohomology §§RD.1.2–RD.1.7 down to FormalConnectionsOpers §6.2.

## Verified sound

**Gate and direction.** Worker's gate at 892f8d5: every check passed. Dependency check run here on this README: `depcheck: 204 roadmaps, 1417 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder: empty. Folder contents: `README.md`, `Suggested.lean`, `metadata.toml`. Merge-order positions read from `ORDER.txt`: KacMoody 2, CrystallineCohomology 19, AlgebraicModuliForArithmeticGeometry 31, ComplexComparisonPartII 38, FormalConnectionsOpers 39, PadicDifferentialEquationsAndRigidCohomology 105; AnalyticToricGeometry is not in the order (it is a folder of the author's own pull request #1187; its PartII is at 144). Both lake manifests (worktree and main checkout) pin the same Tau Ceti and Mathlib revisions.

**Lean.** `Suggested.lean` is unchanged since e2a605f except three section-comment labels. It imports `Mathlib`, `TauCeti.Algebra.AlgebraicGroup.PointsFunctor`, `TauCeti.Algebra.AlgebraicGroup.Reductive.Basic`; no `set_option`, no sorry'd data, `theorem` only, one module docstring, a `local instance` (not a `set_option`). A scratch copy with `#check @name` for all 12 declarations elaborated once under `lake env lean`: every elaborated type carries every binder of its README statement (`[Algebra ℚ R]` on `regularGauge_constantCoeff_bijective`; `reductiveCommHopfAlgProperty ℂ H` on the loop factorization; `IsScalarTower k A M/N` on the principal-parts theorem); the worker's `signatures.md` agrees (0 dropped binders); nothing changed. One-tactic probe on each of the three sorried theorems (`first | rfl | simp | infer_instance | (intros; simp_all) | decide | <one library-lemma attempt>`): all three fail ("simp made no progress", "unsolved goals"); no padding. Statability probe for R02 elaborated with only the `sorry` warning.

**Pinned declarations opened** (Tau Ceti and Mathlib at the worktree manifest). `TauCeti.reductiveCommHopfAlgProperty` = `geometricNormalSubgroupFreeCommHopfAlgProperty k (smoothUnipotentCommHopfAlgProperty (AlgebraicClosure k))` with docstring "smoothness, geometric connectedness, and absence of nontrivial connected normal smooth unipotent closed subgroups after extension to an algebraic closure" (`TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean` lines 70–78): the Lean hypothesis is "connected reductive" as the README says. `TauCeti.zHat.cohomologicalDimensionAt_le_one (hp : p ≠ 0)`, `cohomologicalDimensionAt_eq_one (p) [Fact p.Prime]`, `cohomologicalDimension_eq_one` (`ZHat/CohomologicalDimension.lean` lines 191, 199, 206): the README's nonzero/prime hypotheses are the pin's. `ContinuousMonoidHom.exists_mem_nhds_one_forall_le_ker (f : G →ₜ* Aˣ)` (`NoSmallSubgroups.lean` line 95). `TauCeti.Toric.regularAffinePointHomeomorph` (`RegularChart.lean` line 200, namespace `TauCeti.Toric`, line 66). `TauCeti.AlgHom.mapValue` (`FunctorOfPoints.lean` line 154); `CounitAlgebra` bracket (`Tangent/Lie/Basic.lean` lines 15, 37); the files `FiniteType/CommHopfAlgCat.lean` and `Geometry/Manifold/Gluing.lean` exist. Mathlib: `MvPolynomial.eq_vanishingIdeal_singleton_of_isMaximal` (`Nullstellensatz.lean` line 151), `isMaximal_iff_eq_vanishingIdeal_singleton` (164), `vanishingIdeal_zeroLocus_eq_radical` (file header line 15); `secondCountableTopology_of_countable_cover` (`Topology/Bases.lean` line 922, `[Countable ι]`); `exist_openSubgroup_sub_clopen_nhds_of_one` and `ProfiniteGrp.exist_openNormalSubgroup_sub_open_nhds_of_one` (`ClopenNhdofOne.lean` lines 33, 47); `nhds_basis_clopen` (`Separation/Profinite.lean` line 43); `Algebra.Smooth.exists_span_eq_top_isStandardSmooth` (`Smooth/StandardSmoothOfFree.lean` line 155, `[Smooth R S]`); `Algebra.IsSmoothAt.exists_isStandardEtale_mvPolynomial` (`Smooth/IntegralClosure.lean` line 382); `Matrix.linftyOpNormedAlgebra` (`Analysis/Matrix/Normed.lean`); `GroupLieAlgebra` (`Geometry/Manifold/GroupLieAlgebra.lean` line 56, `TangentSpace% (1 : G)`); `LeftInvariantDerivation` (`Algebra/LeftInvariantDerivation.lean` line 47); `mlieBracketWithin` (`VectorField/LieBracket.lean` line 60); `RootPairing.flip` (`RootSystem/Defs.lean` line 129); `LieRinehartAlgebra` (`Algebra/LieRinehartAlgebra/Defs.lean` line 43); `Matrix.GeneralLinearGroup.map` (`GeneralLinearGroup/Defs.lean` line 187); `HahnSeries.ofPowerSeriesAlg` and `HahnSeries.powerSeriesAlgebra` (`HahnSeries/PowerSeries.lean` lines 212, 217), the latter being the instance the README says the default search finds.

**Sources read at their locators.** frenkel-loop (author page, printed page = PDF page − 14 in the range used): §1.2.6 p. 17 (line 978); §§3.5.3–3.5.4 pp. 90–91 (lines 4059, 4109); §3.5.7 p. 96 (line 4350); (3.5-11) line 4427 and (3.5-12) line 4438, p. 98 (`v ↦ v + ε v′ + 2 v ε′ − ½ ε‴` and the Schwarzian); §4.2.1 p. 108 (line 4816, stated there for simple adjoint `G`; the reductive extension is this roadmap's), (4.2-1) line 4877, (4.2-2) line 4906, (4.2-3) line 4952, Lemma 4.2.1 line 4985 (the `H`-bundle is `ρ∨`-twisted canonical), §4.2.4 p. 112 (line 4991), Lemma 4.2.2 line 5011 (free `N[[t]]` action and canonical representatives, after Drinfeld–Sokolov), §4.2.5 p. 116 with (4.2-13)–(4.2-14) lines 5193–5196; §8.2.1 p. 233 (line 9938), Proposition 8.2.2 line 10011 (Miura isomorphism on the generic locus), §8.2.3 line 10140 with (8.2-7) line 10157, Proposition 8.2.3 line 10208 (image of `Fun Op` = screening kernels); §8.3.2 p. 246 (line 10465), the free `N((t))` action on the moment fibre lines 10505–10506, Lemma 8.3.2 line 10512 p. 247; Conjecture 10.1.1 line 12882 p. 310 and Conjecture 10.1.2 line 12936. frenkel-zhu: Theorem 1 line 67; Remark 1 lines 80–85 (`GL_n` = cyclic vectors, citing Deligne pp. 42–43); lines 107–110 (`r < −1`, `A_r` nilpotent, possibly zero: the README's "leading coefficient at an order below the pole order"); Theorem 4 line 193 (`A_r` nilpotent, `r ≤ −2`, regular point); Lemma 10 line 348 with `r ≤ −1` at line 346 and the pro-unipotent `r ≤ −2`, `Aut⁺` stage at lines 362–364. frenkel-gaitsgory: §4.1 lines 1746–1758 (triples, equivalence `g₂ = g′g₁g` with `∇₁ = Ad_g ∇₂`, `∇′₂ = Ad_{g′} ∇′₁`, exactly §8.1's second bullet); Proposition 4.1.1 line 1764 and its proof lines 1765–1784 (surjectivity of `∇` onto `(𝔤/𝔟)((t)) dt` from the oper condition); (4.2)–(4.4) lines 1790–1798; Lemma 4.3.1 line 1825, Lemma 4.3.2 line 1851; Lemma 4.4.1 line 1880 (co-isotropic); Lemma 4.4.2 lines 1894–1899 (regular groupoid = `Op^reg ×_{pt/G} Op^reg`). drinfeld-tate: §3.2.1 lines 218–221, example (3.1) lines 230–233, §3.2.3 lattices lines 237–238, Theorem 3.3 line 264, Lemma 3.9 line 477, Theorem 3.10 line 486, Theorem 3.11 lines 490–495 (`f(a) = 1 ⊗ a`, `g(a) = a ⊗ 1`, cocycle condition). cesnavicius-presheaf: lines 330–331 (split ⇒ totally isotropic), Theorem 16 line 332, Theorem 17 line 334, Theorem 19 lines 359–369. cesnavicius-fedorov (arXiv 2311.08660v3): Theorem 4.2 lines 721–723 (`G_ad` totally isotropic; a `G`-torsor on `ℙ¹_A` trivial at `∞` is trivial on `𝔸¹_A`), with the diagonal-section and degree-`d` pullback steps at lines 725–736 that §3A.2 restates. steinberg-1965: Theorem 1.9 lines 134–136 (perfect `k`, `dim k ≤ 1` ⇒ `H¹(k, G) = 0` for every connected linear `G`). deligne-lnm163: Lemme 1.3 lines 1367–1401 (PDF pp. 45–46 = printed pp. 42–43), hypotheses `K` of characteristic `0`, `t` with `dt ≠ 0` (lines 1374–1375), the `e + λ t^k f` argument (lines 1378–1401); the companion matrix of a cyclic vector lines 1621–1631 (printed p. 50). katz-cyclic: Theorems 1 and 2 lines 38–44 (`(n−1)!` invertible, `k ⊂` constants with `#k > n(n−1)`, one of the `1 + n(n−1)` translates is cyclic Zariski-locally), proofs pp. 66–67. iwahori-matsumoto (Numdam): §2.1 setting lines 895–911 (a field with a nontrivial discrete non-archimedean valuation; Chevalley group of a complex semisimple Lie algebra), Proposition 2.33 line 1514, Proposition 2.34 lines 1521–1528 (double cosets of two subgroups containing the Iwahori, indexed by `W_1\W̃/W_2`), §1.2 the affine Weyl group as a semidirect product (lines 65, 75, 946–948). Stacks 09CI/09CK/0H90 were read in the previous round and the Lean transcription is unchanged.

**Cross-roadmap citations resolved** (every round, at the current main or head). On main: ReductiveGroups Layers 0, 1, 3A, 6B (line 613, "FormalConnectionsOpers F6 consumes it" at 623), 10, 11 (line 1959, consuming F4.3 at 1964); ReductiveGroupsPartII RG2.5.1 (line 6724); SchemeAndStackFoundations §§1.1, 1.14–1.18 (lines 2071, 2458–2745); AffineMorseLefschetz A4 (line 208); ProfiniteCohomology Layer 1 (line 630) and Layer 11 "cohomological dimension" (line 1739); FormalLaurentPuiseux L1, L2, L3, L7 (lines 70, 112, 140, 315); CharacteristicClasses C5 (line 1060, C5.1 referenced at 1224); ComplexManifolds Milestones 1, 2, 7 (lines 172, 197, 319); LieGroups Layers 0, 6, 7 and LieHighestWeight Layer 7 as under R03–R04; AffineLieAlgebras (lines 55, 59, 449: consumer of F1–F8 and F4.3), NilpotentOrbits (lines 60, 63), GeometricRepresentationCategories (lines 47, 64, consumer of `IsomOp`), SchubertGeometry and ComplexKahlerGeometry (consumers of §2.4). At open heads: CrystallineCohomology CR.1.3 (#857, line 1121; the carrier `∇ : M → M ⊗_B Ω`, curvature, tensor, Hom/dual for `M` finitely generated projective, base change at lines 1255–1300; line 11535 names this roadmap as consumer); ComplexComparisonPartII C−1.1 `complexSchemeAnalytification` (line 774), C0.3 `holomorphicBundleDictionary` (1019), C0.4 (1070), C5.1 (2336) and C5.2; its lines 148, 794 and 2617 confirm F2.4's role, its line 149 and 2393 contradict §2.2 (R01); KacMoody KM8A (#1124, lines 148–154, consumer); PadicDifferentialEquationsAndRigidCohomology (#1002, lines 153, 2248–2398; R07). Ownership by object against main and the open pull requests whose files this brief gives: no other roadmap builds opers, Drinfeld–Sokolov reduction, Tate `R`-modules in Drinfeld's sense, the polynomial/formal loop comparison or the isomonodromy groupoid; the affine Grassmannians of GeometricSatakeAndFusion, PerfectoidQuotients, SchemeKTheoryOperations and IgusaVarieties are the Witt-vector or `B_dR⁺` ones; the cyclic-vector theorem has the second owner recorded in R07; the algebraic principal-parts interface has the earlier owner recorded in R01. Open pull requests not listed with files in the brief were searched only through `roadmaps grep`.

**Headline theorems.** From the Summary (lines 10–18): universal property of all-order principal parts (stated; C5.1's, R01); classification of regular formal connections by the fibre at `t = 0` (stated, `regularGauge_constantCoeff_bijective`); polynomial factorization of formal loops (stated, `formalLoop_eq_polynomial_mul_positive`); Chevalley–Kostant slice and Drinfeld–Sokolov normal form (docstring: not statable, no graded Lie algebra of a pinned group over `R((t))` and no `W`-action on `Sym 𝔥*` at the pins; agreed); Frenkel–Zhu for general `G` (docstring: not statable, no torsors with connection over `ℂ((t))` at the pins; agreed), but its `GL_n` case as owned in §6.2 is statable (R02); Drinfeld–Sokolov Poisson structure with Miura kernels, and the isomonodromy algebroid (docstring: not statable, no completed oper function algebra at the pins; agreed).

**Adversarial table** (sampled targets, headlines and every target a finding touches).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 `⊗^!` witness | `V = W = k((t))`, `Σ t^n ⊗ t^(−n)` | in `(V/t^M V⁺) ⊗ (W/t^N W⁺)` only `n < M` survive; in `V ⊗ (W/t^N W⁺)` all `t^(−n)` survive, infinitely many terms | lies in `⊗^!`, not in the one-sided completion | none |
| §1.2 inverse of `t + t²` | `ψ = t − t² + 2t³` | `ψ + ψ² = t − t² + 2t³ + t² − 2t³ + O(t⁴) = t + O(t⁴)`; truncation `t − t²` gives `t − 2t³ + O(t⁴)` | as stated | none |
| §1.2 contravariance | `φ = 2t`, `ψ = t + t²` | `σ_φσ_ψ(t) = ψ(2t) = 2t + 4t²`; `σ_ψσ_φ(t) = 2ψ = 2t + 2t²`; agrees with FormalLaurentPuiseux L1 `σ_φ∘σ_ψ = σ_(ψ∘φ)` | as stated | none |
| §1.2 chain rule / residue | `f = t⁻¹`, `φ = t + t²`; `φ = t²` | `(f′∘φ)φ′ = −t⁻²(1 − 2t + 3t²)(1 + 2t) = −t⁻² + 1 + O(t)`; `Res = 1`; for `t²`: `Res(t⁻²·2t dt) = 2` | as stated | none |
| §1.3 elementary module / lattice | `R((t))`, `U = t^M R[[t]] ⊂ L = t^N R[[t]]` | `L/U` free of rank `M − N`; `R[t⁻¹]` not open | as stated | none |
| §1.3 residue annihilator | pairing `i + j = −1`; pairing `i + j = 0` | annihilator of `{i ≥ 0}`: `{j ≥ 0}`; `{j ≥ 1} = tV^∨[[t]]` | README's `t⁻¹V^∨[[t]]` wrong | R06 |
| §1.3 topological nilpotence | `t`, `t⁻¹`, `0` on `R((t))` | `t^n R[[t]] ⊂ t^N R[[t]]` for `n ≥ N`; `t^(−n)R[[t]] ⊄ R[[t]]`; `0` not injective | as stated | none |
| §1.3 completed base change | `R = k`, `S = k[x]`, `Σ x^n t^n` | bounded `x`-degree in `S ⊗_k k((t))`; unbounded here | as stated | none |
| §2.1 negative control | `A = k[x,y]/(x,y)²`, `∇ = d + x dy` | `Ω¹` has `k`-basis `dx, dy, x dy`; `Ω¹ ⊗_A Ω¹ = (Ω¹/𝔪Ω¹)^{⊗2}` of dim 4, `Ω² ≃ k·dx∧dy`; curvature `d(x dy) = dx∧dy ≠ 0`; `ξ(x), ξ(y) ∈ (x,y)` so `xξ(y) = 0`, `∇_ξ = ξ` | hypothesis needed, as stated | none |
| §2.1 dual sign | `∇ = d + a dx` on `A` | `∇^∨ = d − a dx`; `∇ ⊗ ∇^∨ = d` on `A`; wrong sign gives `d + 2a dx` | as stated | none |
| §2.2 `principalParts_universal`, `n = 0` | any `k, A, M` | relations `span{a ⊗ m − 1 ⊗ am}`, quotient `≃ M`; order-0 = `A`-linear | holds | R01 (owner) |
| §2.2 relation module vs Stacks `J^(n+1)(A ⊗ M)` | `A ⊗ A = (A ⊗ 1) + J`, `(b ⊗ c)(1 ⊗ m) = (b ⊗ 1)(1 ⊗ cm)` | the left `A`-span of iterated differences on `1 ⊗ m` equals `J^(n+1)(A ⊗_k M)` | transcription exact | R01 (owner) |
| §2.2 `d/dx`, char `p` | `A = k[x]`; `k = 𝔽_p` | `[D, x] = 1`, order 1; `(d/dx)^p x^n = n⋯(n−p+1)x^(n−p) = 0`; `x^n ↦ C(n,p)x^(n−p)` order `p` | as stated | none |
| §2.2 `A = 0`, `A = k` | — | `M = 0`; `k ⊗_k M = M`, relations `a ⊗ m − 1 ⊗ am = 0` | as stated | none |
| §2.3 flatness criterion | `A = k[x,y]`, `∇ = d + yN dx`, `N = [[0,1],[0,0]]` | curvature `N dy∧dx`; `[∂_x + yN, ∂_y] = −N`; `(N dy∧dx)(∂_x, ∂_y) = −N` | signs agree when `Ω¹` free | none |
| §2.3 Bianchi rank one | `F = (∂_x b − ∂_y a) dx∧dy` | `a = y, b = x`: `0`; `a = 0, b = x`: `dx∧dy` | as stated | none |
| §2.4 frame dictionary | `g = h⁻¹` | `g⁻¹dg = h d(h⁻¹) = −(dh)h⁻¹`, so `g⁻¹Ag + g⁻¹dg = hAh⁻¹ − (dh)h⁻¹` | as stated | none |
| `regularGauge` law | symbolic | `gAg⁻¹ − g′g⁻¹ = B ⟺ g′ = gA − Bg`; `(hg)′(hg)⁻¹ = h′h⁻¹ + hg′g⁻¹h⁻¹` | left action; docstring recursion matches | none |
| `regularGauge_constantCoeff_bijective` | `n = 1, A = 1, B = 0, R = ℚ`; `R = 𝔽_p`; `R = ℚ[ε]/ε²`, `A = εI`; `n = ∅`; `R = 0` | `g = g₀e^t`; `g = 1 + t^p` has `g′ = 0`, same constant term as `1` (fails without `[Algebra ℚ R]`); `g = g₀(1 + εt)`; singletons; singletons | holds with the stated hypothesis | none |
| §2.4 smoothness controls | `Spec ℂ[x,y]/(xy)`; `Spec ℂ[x]/x²`; `D(x−1) ⊂ 𝔾_m` | cotangent ranks 2/1; point with `Ω¹ ⊗ κ = ℂdx`, Krull dim 0; complex point `x = 2` | as stated | none |
| §3.1 nonreduced unit | `R = ℂ[ε]/ε²`, `1 + εt⁻¹` | inverse `1 − εt⁻¹`; form `a t^n u` needs `a = ε` (not a unit) or no `t⁻¹` term | not of valuation form, as stated | none |
| §3.1 `exp_1` | `G = 𝔾_m`, `R = ℚ`; `𝔽_p` | `1 + t + t²/2 + ⋯`; `1/p!` absent | characteristic-zero hypothesis needed | none |
| §3.2 descent overlap | `R = k`, `S = k[x]` | `(S ⊗ S)((t)) ∋ Σ x^n y^n t^n ∉ S((t)) ⊗_{R((t))} S((t))` | as stated | none |
| §3.3 infinitesimal gauge | `g = 1 + εx` | `(1 + εx)A(1 − εx) − εx′ = A + ε([x, A] − x′)` | as stated | none |
| §3.4 `𝔾_m` classes over `ℂ` | `g = c t^n e^f`, `f ∈ tℂ[[t]]` | `a ↦ a − n t⁻¹ − f′`; `f′` ranges over `ℂ[[t]]`; classes = (irregular part, residue mod `ℤ`) | as stated | none |
| §3.4 deformation complex | `G = 𝔾_m` | `d : ℂ((t)) → ℂ((t))dt`, kernel `ℂ`, cokernel `ℂ` (residue) | as stated | none |
| §3A.1 non-normality | `SL₂`, `[[1,t],[0,1]]` | `diag(t,t⁻¹)·[[1,t],[0,1]]·diag(t⁻¹,t) = [[1,t³],[0,1]]`; `diag(t,t⁻¹) ∉ G(ℂ[t])` | as stated | none |
| `formalLoop_eq_polynomial_mul_positive` | `G = 1`; `G = 𝔾_m`, `R = ℂ`; `R = ℂ[ε]/ε²`, `u = 1 + εt⁻¹`; `SL₂` geometric-series loop | singleton; `u = t^n w`; polynomial factor `u`, positive factor `1`; `[[1,t⁻¹],[0,1]]·[[1,(1−t)⁻¹],[0,1]]` | holds; the Check's displayed series is wrong | R05 |
| same, hypothesis | `reductiveCommHopfAlgProperty ℂ H` | smooth ∧ geometrically connected ∧ trivial geometric unipotent radical; over `ℂ` split ⇒ `G_ad` totally isotropic (cesnavicius-presheaf lines 330–331) ⇒ Theorem 19 for every `ℂ`-algebra `R` | holds | none |
| §3A.2 injectivity | `t⁻¹ + t` | in `R[[t]]` iff `t⁻¹` is: no | as stated | none |
| §3A.3 semidirect law | `(λ,w)(μ,v)(ν,u)` | both bracketings `(λ + wμ + wvν, wvu)`; factor order `(w,λ)(v,μ) = (wv, v⁻¹λ + μ)` via `t^λ n_w = n_w t^(w⁻¹λ)` | as stated | none |
| §3A.3 `Y/Q^∨` | `𝔾_m`, `SL₂`, `PGL₂`, `GL_n` | `ℤ/0 = ℤ`; `0`; `ℤ(α^∨/2)/ℤα^∨ = ℤ/2`; `det∘λ = t^(Σλ_i)`, `Y/Q^∨ ≃ ℤ` | as stated | none |
| §3A.3 conjugation | `n = [[0,1],[−1,0]]`, `t^λ = diag(t,t⁻¹)` | `n t^λ n⁻¹ = diag(t⁻¹, t) = t^(−λ)` | as stated | none |
| §3A.4 Iwahori | `SL₂` | `[[1,0],[t,1]]`: constant term `1 ∈ B`; `[[1,0],[1,1]]`: constant term lower triangular; `diag(t,t⁻¹)[[1,u],[0,1]]diag(t⁻¹,t) = [[1,t²u],[0,1]]` so `α(λ) = 2` | as stated | none |
| §3A.5 truncation | `(1−t)⁻¹·1 ∈ GL₂(ℂ((t)))` | truncation `1 + t` has `det (1+t)²`, not a unit of `ℂ[t]` | as stated | none |
| §3A.6 `PGL₂` cocharacter | `α^∨/2 : t ↦ [diag(t,1)]` | square `[diag(t²,1)] = [diag(t,t⁻¹)] = α^∨(t)` | as stated | none |
| §4.1 oper condition | `PGL₂`, `ψ = t`, `0`, `ε + t⁻¹` over `ℂ[ε]/ε²` | unit in `ℂ((t))`, not in `ℂ[[t]]`; `0` never; `ε + t⁻¹ = t⁻¹(1 + εt)` unit | as stated | none |
| §4.2 normalization | `[[1,u],[0,1]]` on `[[a,b],[1,−a]]` | `gAg⁻¹ = [[a+u, b − 2au − u²],[1, −a−u]]`, `g′g⁻¹ = [[0,u′],[0,0]]`; `u = −a` gives `[[0, b + a² + a′],[1,0]]`; `SL₂` over `ℚ`: `diag(s,s⁻¹)` scales `ψ` by `s⁻²`, `ψ = 2` not normalizable | as stated | none |
| §4.3 Chevalley checks | `𝔰𝔩₂`, `𝔤𝔩₂`, `𝔰𝔩₃`, `μ₂` | `det ↦ −h²`, `S(𝔥*)^W = ℂ[h²]`; `tr` of degree 1, `ℂ[h₁+h₂, h₁h₂]`; exponents `1, 2`, `1 + 2 = 3` positive roots; `Lie(μ₂) = 0` so all of `ℂ[x]` is `𝔤`-invariant, `G`-invariants even | as stated | none |
| §4.3 normal form over `ℂ[ε]/ε²` | `a = εt⁻¹`, `b = 0` | `a² = 0`, `a′ = −εt⁻²`, `q = −εt⁻²` | as stated | none |
| §4.4 `SL₂`-lifts | gauge `g = diag(√t, 1/√t)` on `[[0,q],[1,0]]` | `gAg⁻¹ = [[0,tq],[t⁻¹,0]]`, `g′g⁻¹ = diag(1/(2t), −1/(2t))`, result `[[−1/(2t), tq],[t⁻¹, 1/(2t)]]`; residue `−½ ∉ ℤ` | as stated | none |
| §5.1 Schwarzian cocycle | `ψ = t + t²` | `ψ′ = 1 + 2t`, `ψ″ = 2`, `ψ‴ = 0`; `{ψ,t} = −(3/2)·4/(1+2t)² = −6/(1+2t)²`; `{at,t} = 0` | as stated | none |
| §5.2 evaluation | rank one, `q = t⁻²`, `N = 2, 5` | `eval_q(q_(−2)) = 1`, others `0`, same map; `q_j ↦ 1` kills no `ker(proj_N)` | as stated | none |
| §5.3 elimination | `n = 2`, diagonal `(a, −a)` | `y₁ = ay₂ − y₂′`; `−y₂″ + (a′ + a² + q)y₂ = 0` | agrees with §4.2's `q + a² + a′` | none |
| §5.4 gauge witness | `g = [[c − ts, −s],[−s + tc, c]]` | `g(0) = 1`; `det = c² − s² = 1`; `gA₀ − A₁g = [[−tc, −c],[ts, s]] = g′` | `gauge(g, A₀) = A₁` | none |
| §5.4 infinitesimal | `ε = t`, `t³` | `tq′ + 2q`; `−½·6 = −3` | as stated | none |
| §6.1 finite monodromy | `G = 𝔾_m`, generator `↦ z` | kernel open ⇒ finite index ⇒ `z` a root of unity; `H¹(ℂ((t)), μ₂) = ℂ((t))ˣ/2 = ℤ/2` by `t` | as stated | none |
| §6.2 cyclic vectors | `D = 0` on `F²`; `F = 𝔽_p(t)`, `V = F^(p+1)` | no cyclic vector; `∂^p` is a derivation killing `𝔽_p[t]` hence `0`, so `D^p v = 0` | both hypotheses needed, as stated | R02 (absent from Lean) |
| §6.2 Katz candidates | `e₀ = (1,t)`, `e₁ = (−t⁻¹,0)`, `D = ∂` | `c(e, t−a) = e₀ + (t−a)(e₁ − De₀)`; `a = 0`: `0`; `a = 1`: `(t⁻¹,1)`, derivative `(−t⁻²,0)`, `det = t⁻² ≠ 0` | as stated | none |
| §6.2 lattice estimate | `∇ = ∂ + t⁻²`, `L = ℂ[[t]]` | `f′ + t⁻²f ∈ ℂ[[t]]` iff `f ∈ t²ℂ[[t]]`: relative dimension `−2` | as stated | none |
| §6.3 vector-field stage | `D = t^(−r)∂` | `ε = −t^(−r) ∈ tℂ[[t]]∂` iff `r ≤ −1`; `∈ t²ℂ[[t]]∂` iff `r ≤ −2` (frenkel-zhu lines 346, 362) | as stated | none |
| §6.3 conjugation formula | `(g⁻¹, 1)` on `(t^(−r)A, t^(−r)∂)` | `(g⁻¹)′g = −g⁻¹g′`, first component `t^(−r)(g⁻¹Ag − (g⁻¹)′g) = t^(−r)gauge(g⁻¹, A)` | as stated | none |
| §6.4 order bound | `A = 0`, `r = −2`; `g = t^λ`; `g = exp(t⁻³x)` | `gauge(t^(−λ), 0) = λt⁻¹`, order `−1 ≥ −2`; gauge of `exp(t⁻³x)` has order `−4` | as stated | none |
| §6.5 cohomology checks | `μ_n`, `𝔾_m` | `ℂ((t))ˣ = ℂˣ × t^ℤ × (1 + tℂ[[t]])`, first and third divisible: `H¹ = ℤ/n`; `H²(μ_n) = Br[n] = 0` (`ℂ((t))` is `C₁`) | as stated | none |
| §7.1 cotangent algebroid | `k[x,y]`, `{x,y} = 1`; `{x,y} = x`; `k[x,y]/(x²,y²)` | `[dx, x dy] = 0 + ∂_y(x)dy = 0`; `[dx,dy] = dx`, `anchor(dy)(x) = −x`; `{x²,y} = 2x ≠ 0 = {0,y}` | as stated | none |
| §7.2 anchor sign | `H_x(A) = Res κ(A,x)` | `{H_x,H_y}(A) = Res κ([A,x],y) − Res κ(x,y′) = Res κ([A,x] + x′, y)` | Hamiltonian field `+∇_ad x` | none |
| §7.2 Heisenberg | `𝔤 = ℂ`, `κ = 1`, `x = t^m`, `y = t^n` | `−Res(t^m · n t^(n−1) dt) = −n δ_(m+n,0)` | as stated | none |
| §7.3 Virasoro | `P_q = 2q∂ + q′ − ½∂³`, `L_n = Res t^(n+1)q` | `Res t^(n+1)P_q(t^(m+1)) = (2(m+1) − (m+n+2))L_(m+n) − ½(m³−m)δ_(m+n,0)`; `c/12 = −½ ⇒ c = −6` | as stated | none |
| §7.3 KdV | `H = Res q²` | `P_q(2q) = 4qq′ + 2qq′ − q‴ = 6qq′ − q‴`; with `+½∂³`: `6qq′ + q‴` | as stated | none |
| §7.4 coisotropy and non-ideal | `L_n = q_(−n−2)`, `I = (q_j : j<0)` | `L_n ∈ I` iff `n ≥ −1`; `m,n ≥ −1`: `L_(m+n) ∈ I` unless `m = n = −1` where the coefficient is `0`; central term `0` for `m ∈ {−1,0,1}`; `{L₂,L₋₂} = 4L₀ − 3 ↦ −3`; `{L₋₁,L₋₂} = L₋₃ = q₁ ∉ I` | as stated | none |
| §7.5 Miura | `A = [[−u,0],[1,u]]`, gauge `[[1,u],[0,1]]` | `a = −u`, `b = 0`: `q = u² − u′`; `(∂−u)(∂+u)f = f″ + (u′ − u²)f` | as stated | none |
| §7.5 screening | `[[1,εx],[0,1]]` on `[[−u,0],[1,u]]` | `[[−u + εx, 2uεx − εx′],[1, u − εx]]`; Miura form iff `x′ = 2ux`; `δu = −x`, `δ(u² − u′) = −2ux + x′ = 0` | as stated | none |
| §7.5 mode dictionary | `w[a] ↦ q_(−a−1)` | coefficient of `t^(−a−1)` in `q′` is `(−a)q_(−a)`, matching `(Tw)[a] = −a w[a−1]` | as stated | none |
| §8.1 `IsomOp` | `𝔾_m`; `(q,q,g)` with `g ∈ N((t))` | arrows `(a, a − dlog g, g)`, automorphisms `ℂˣ`; `gauge(g, A_q) = A_q` forces `u = −a + a = 0`, `g = 1` | as stated | none |
| §8.2 `𝔰𝔩₂` tangent | `∇ = ∂ + f + qe` | `∇_ad(xe) = x′e − xh`; class of `αh + βe` is `(β + α′)e`; `T Op ≃ ℂ((t))` = linearization `δq = δb + δa′` | as stated | none |
| §8.2 `Lie IsomOp` | `y = y_f f + y_h h + y_e e` | `𝔤/𝔟`-component of `∇_ad y` is `(y_f′ + 2y_h)f`; kernel `y_h = −y_f′/2`, rank one | as stated | none |
| §8.2 two-parameter witness | `(1−ηy)(1−εx)(1+ηy)(1+εx)` | `= 1 + εη(yx − yx − xy + yx) = 1 − εη[x,y]` | as stated | none |
| §8.2 anti-homomorphism | `F_x(A) = [x,A]` | `[F_x,F_y](A) = [y,[x,A]] − [x,[y,A]] = −[[x,y],A]`; `𝔾_m`: `0 = 0` | as stated | none |
| §8.3 regular extension | `𝔾_m`, `a, b ∈ ℂ[[t]]` | `dlog g = a − b ∈ ℂ[[t]]dt` ⇒ `g ∈ ℂ[[t]]ˣ` | as stated | none |
| §8.4 critical level | `κ_c = −½ Killing` | Killing `= 2h^∨κ₀` ⇒ `κ_c|_(𝔤_i) = −h_i^∨κ_(0,i)`; `κ₀(h,h) = 2`, `κ₀(h,−) = α` ⇒ `κ₀^∨(α,α) = 2` | as stated | none |

## Not verifiable

- Kazhdan–Lusztig 1988 (Israel J. Math., DOI 10.1007/BF02787119), §4 Lemmas 6 and 8, cited at lines 1811–1815: paywalled; the README records it as uncertified.
- Kazhdan–Lusztig 1980, *A topological approach to Springer's representations*, §2, line 1838: no legal copy found; recorded as uncertified.
- Kostant 1963 (AMS Bull.), Chevalley 1955, Matsushima 1960, Drinfeld–Sokolov 1985 (mathnet), Rinehart 1963: cited without theorem-level checks or behind hosts in no licence class; the README marks each uncertified or cites by locator only.
- Česnavičius–Fedorov: the citation-only fetch failed and wrote a `[[missing]]` entry into `needs-references.toml`; the arXiv id 2311.08660v3 then resolved (lines quoted above), so that entry is superseded.

## Source issues

- **Gap** in frenkel-zhu at §5 Lemma 10, printed page 9: the proof derives the twisted adjoint formula from its brackets with every element of `𝔤(F)` and invokes semisimplicity, while the paper's `G` (page 1) is connected reductive, where bracket identities do not detect central directions; it should be proved by differentiating the semidirect multiplication directly, as §6.3 does; affects the proof.

# Review of ScatteringDiagrams (pull request #1134 at 7a93e00)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/ScatteringDiagrams/README.md` (2415 lines) and `TauCetiRoadmap/ScatteringDiagrams/Suggested.lean` (2704 lines, 293 declarations) at head 7a93e006. The pull request changes only this folder (`git diff --stat origin/main...HEAD` outside the folder: nothing). The mathematics of the sampled sections is in good shape: every seeded locator resolved, the conventions are internally consistent (Convention 3, the velocity `−ρ(γ)`, the exponent `|m(ρ p)|`), and the §7.3 Check values were reproduced by an independent computation. The blocking defects are in the supplier contracts and in the Lean file.

## R01 (P1) — §0.4 builds on a Hopf structure on `U_R(g)` that no pin provides

**Location.** `README.md` §0.4, lines 272–281 ("*completedCoproduct* `Δ̂` … the coproduct `Δ` of `instHopfAlgebra`", "*IsCompletedGroupLike* … the completed forms of `IsGroupLikeElem` and `Bialgebra.IsPrimitiveElem`") and line 243 ("`U⁺=TauCeti.HopfIdeal.augmentation` in `U(𝔣)`"); *Needs* at lines 342–346.

**Claim.** `U_R(g)` carries `instHopfAlgebra`, so `Δ`, the counit, group-like and primitive elements and the augmentation Hopf ideal are supplied by the pins.

**Witness.** At the Mathlib pin f6090c70 no file mentioning `UniversalEnvelopingAlgebra` mentions `HopfAlgebra`, `Bialgebra` or `Coalgebra` (grep over `Mathlib/`); `instHopfAlgebra` exists only for `MonoidAlgebra`/`AddMonoidAlgebra` and `LaurentPolynomial` (`Mathlib/RingTheory/HopfAlgebra/MonoidAlgebra.lean` lines 49, 65). At the Tau Ceti pin 358314d4 the only Hopf instances are `TauCeti.SymmetricAlgebra.instHopfAlgebra` (`TauCeti/Algebra/HopfAlgebra/SymmetricAlgebra/Basic.lean` line 67) and `ConvolutionDual`; `TauCeti.HopfIdeal.augmentation` (`TauCeti/Algebra/HopfAlgebra/HopfIdeal/Augmentation.lean` line 61) needs a `HopfAlgebra R H` instance, which `U(𝔣)` does not have. So `bchElement`, `IsCompletedGroupLike`, `IsCompletedPrimitive` and the group-like description of `Ĝ` in §0.5 rest on an unowned prerequisite written as if supplied.

**Repair.** Own it in §0.4: define `Δ : U_R(g) → U_R(g) ⊗_R U_R(g)` and `ε : U_R(g) → R` by `UniversalEnvelopingAlgebra.lift` of `x ↦ ι x ⊗ 1 + 1 ⊗ ι x` and `x ↦ 0`, prove coassociativity, counitality and that both are algebra maps (the bialgebra laws; antipode from `x ↦ −ι x` on the opposite algebra if wanted), define `U⁺ = ker ε`, and restate the group-like and primitive predicates and the Check `ι⁻¹((U⁺)^{c+1}) = lowerCentralSeries c` against these. Replace the three cited names in *Needs* by `UniversalEnvelopingAlgebra.lift`, `TensorProduct` and the new targets.

## R02 (P2) — `Suggested.lean` states none of the headline theorems; the statable ones are absent

**Location.** `Suggested.lean` lines 42–48 (module docstring: "suggested forms for representative interfaces") and the whole file; `README.md` line 73–76 (Convention 4: the "Lean prototype illustrates selected interfaces").

**Claim.** The file is the roadmap's acceptance test.

**Witness.** The roadmap's headline theorems, read off the README and the pull-request description, are: the universal BCH element and the BCH group (§0.4 *bchElement*, *BCHGroup*), the symmetrization PBW equivalence over commutative ℚ-algebras (§0.4 *pbwSymmetrizationEquiv*), Kontsevich–Soibelman reconstruction (§2.3 *reconstructionEquiv*), existence and uniqueness of outgoing completions (§3.3 *exists_outgoingCompletion*, §3.4 *outgoingCompletion_unique*), theta transport and the probe identity (§5.5 *probeWall_eq_brokenLineSum*, *theta_transport*), the focus-focus product formula (§6.3 *focusFocusTheta_mul*), and the three positivity theorems (§7.2 *ordinaryWall_positiveRepresentative*, §7.5 *polynomialWall_positiveRepresentative*, §7.7 *theta_coefficients_nonnegative*). None of these names occurs in `Suggested.lean` (grep of the 243 italic README names: 180 undeclared, including every one above). Two of them are statable at the pins now: (a) PBW symmetrization: `∃ β : SymmetricAlgebra R g ≃ₗ[R] UniversalEnvelopingAlgebra R g, ∀ d (x : Fin d → g), β (∏ i, SymmetricAlgebra.ι R x i) = (d !)⁻¹ • ∑ σ : Equiv.Perm (Fin d), ∏ i, UniversalEnvelopingAlgebra.ι R (x (σ i))` for a commutative ℚ-algebra `R` and any Lie algebra `g` (`SymmetricAlgebra`, `UniversalEnvelopingAlgebra` and `Equiv.Perm` exist at the pin); (b) the BCH element: with `𝔣 := FreeLieAlgebra ℚ (Fin 2)`, `U := UniversalEnvelopingAlgebra ℚ 𝔣`, `ε := UniversalEnvelopingAlgebra.lift ℚ 0` and `U⁺ := RingHom.ker ε`, the statements `(U⁺ ^ (c+1)).comap (ι ℚ).toLinearMap = lowerCentralSeries ℚ 𝔣 𝔣 c` and `∃ b : 𝔣, exp (ι X) * exp (ι Y) − exp (ι b) ∈ U⁺ ^ (c+1)` (with `IsNilpotent.exp` on the quotient) use only pinned carriers plus simple definitions with real bodies. Instead the file carries 293 declarations of scaffolding (`PositiveDegreeMap.comp`, `DiagramComparison.comp_limitMap`, `cochainRelations`, `BrokenLineData`, …).

**Repair.** Rewrite `Suggested.lean` as the acceptance test: docstring "Scattering diagrams, wall crossing and theta functions: target signatures" saying the README is the roadmap, state (a) and (b) with `sorry`, state the focus-focus product formula on the carrier the file already has if it is kept (`FocusFocus.ModelAlgebra`), and name in the docstring each remaining headline as not statable with the carrier it lacks (the BCH group `Ĝ`, the tropical vertex group, the directed completion `Scat`, theta sections). Delete the catalogue (see R06). Drop Convention 4's "prototype" sentence from the README.

## R03 (P2) — sorry'd data

**Location.** `Suggested.lean` line 237 (`instance truncatedLie_nilpotent … := by sorry`), 443 (`noncomputable def fiberwiseLimit` with `map_id := by sorry`, `map_comp := by sorry`), 451 (`fiberwiseLimitIso … := by sorry`), 607 (`ObjectSection.pullback … := by sorry`), 1817 (`weightZeroUnitAut` with five sorried fields); and the declarations that mention them: lines 456, 462 (`pre_limit_isIso`, uses `fiberwiseLimit`), 611, 654–668 (`pullback_comp_pre`, `ActionIntertwiner.section`, `sectionComparison`), 1829–1856 (`weightZeroUnitAut_mem_ideal_iff`, `exp_logSlab_eq_weightZeroUnitAut`).

**Claim.** The file has no sorry'd data.

**Witness.** The gate's `sorry-data` scanner lists exactly these five; the brief forbids any `def`, `abbrev`, `instance` or `opaque` whose body is `sorry` and anything that mentions one.

**Repair.** Delete them (they are README targets: §0.2 nilpotency of `g≤k`, §0.7 fiberwise limits and section pullback, §4.4 `functionWallAction`), together with the dependents listed; a kept statement about `g≤k` carries `LieRing.IsNilpotent (g ⧸ degreeIdeal D ℒ k)` as a theorem conclusion, not an instance.

## R04 (P3) — imports: 37 `Mathlib.<submodule>` lines, no `import Mathlib`

**Location.** `Suggested.lean` lines 1–37.

**Witness.** Gate rules `imports`, `mathlib-subimports` (37), `no-import-mathlib`; the gate fails on them and the build log carries 37 "consider adding `module`" advisories for the same lines.

**Repair.** Replace lines 1–37 by the single line `import Mathlib`, keeping lines 38–40 (`TauCeti.Algebra.Module.Primitive`, `TauCeti.Analysis.Convex.Polyhedron.Basic`, `TauCeti.Geometry.Toric.Algebraic.Lattice`, all present at the pin).

## R05 (P3) — LaTeX display in the README

**Location.** `README.md` lines 2170–2172 (the recursion `(R)` in §7.3 written as `\[ \sum_{s=0}^{p} … \tag{R} \]`).

**Repair.** Write it as an indented code block in Unicode, for example `Σ_{s=0}^{p} π_{d_2−q,s}(P_1)·C_+(p−s,q) = Σ_{s=0}^{q} π_{d_1−p,s}(P_2)·C_-(p,q−s)` labelled (R) in the prose.

## R06 (P3) — padding in `Suggested.lean`

**Location.** Proved API lemmas restating README targets or following from the library: `finite_degree_decompositions` (72), `sharp_of_positive` (87), `finite_ray_cutoff` (106), `exists_supportedRay` (112), `PositiveDegreeMap.id`/`comp`/`exists_rayImage`/`mapRay`/`mapRay_spec`/`mapRay_mem` (142–200), `AlgFiltration.isRingFiltration` (282), `IsFilteredAlong.ofLinearBound` (340), the `DiagramComparison` laws (491–596), `VerticalLabel.isIso` (624), `GradedCorrespondence.sum_transferLeft`/`lift_transfer_pair`/`CommonLift.subsingleton`/`graph_joint_injective` (737–790), the five `DirectedWallSpaces.*_lie_eq_zero` (1359–1420), `DirectedWall.incoming_of_projection_zero` (1452), `someVector_mem_conormalForms` (1211), `sweep_strictlyOutgoing` (1297), `weightedEvaluation_reindex` (1979), `probeDegree_apply`, `probeLabelRep_component_eq`; the boundary-case theorem `emptyDiagram_one_decoratedType` (2189); and `FocusFocus.leftIdeal_le_faceIdeal`/`rightIdeal_le_faceIdeal` (2548, 2551).

**Witness.** One-tactic probe on a scratch copy: both ideal inclusions close with a single `exact Ideal.span_mono (Set.insert_subset_insert … )`; `pre_initial` does not close by `infer_instance` (not padding). The rest are proved in place or mirror Checks (`emptyDiagram_one_decoratedType` is the §5.2 empty-diagram Check).

**Repair.** Delete them from `Suggested.lean`; the README keeps the statements (this is part of the R02 rewrite).

## R07 (P3) — Lean form: non-`sorry` warnings and docstring

**Location.** `Suggested.lean` lines 1979–1980 (`letI` in a proof: linter `style.haveILetI` fires twice under `lake env lean`), lines 42–48 (module docstring).

**Witness.** `lake env lean TauCetiRoadmap/ScatteringDiagrams/Suggested.lean` exits 0 with 43 `declaration uses 'sorry'` warnings and the two `Try this: let` warnings; the docstring neither carries the "<title>: target signatures" form nor names the unstatable headlines.

**Repair.** `let` instead of `letI` (or delete the lemma under R06); docstring as in R02.

## R08 (P3) — README shape and the italic-name convention

**Location.** `README.md` lines 1–76 and every `### k.n` section.

**Claim.** The README follows the house shape.

**Witness.** There is no `## Exact supplier contracts` (merged into "Conventions and supplier contracts", line 50), no `## How to read the build`, no `### Examples`/`### Dependencies` closing any layer, no `## Downstream consumers`; targets are `*Targets.*` bullet lists with italic "suggested Lean declaration names" (Convention 4, line 73) rather than prose with backticked declared names: 243 italic names, 180 of them undeclared, so the gate's README-identifier check sees none of them. Compare `TauCetiRoadmap/HeegaardFloer/README.md` on main (lines 12, 65, 88, 162, 1171, 1179, 4108).

**Repair.** Add the four headings; rewrite each target as "Define … Prove … (Source, locator). *Needs:* …" with backticks only on names declared in the rewritten `Suggested.lean` and plain prose for the rest; delete Convention 4.

## R09 (P3) — §1.1 cites a declaration absent at the pin and sources that do not prove its foundations

**Location.** `README.md` lines 538–541 ("`Q` has finitely many faces (`PointedCone.FG.finite_face`)"), 553–556 (*Needs*), 557 ("Sources: GHKK Appendix C.1; BRI §§2.2–2.5").

**Witness.** No `finite_face` anywhere in Mathlib f6090c70 (`grep -rn finite_face Mathlib`); `PointedCone.IsFaceOf.trans` does exist (`Mathlib/Geometry/Convex/Cone/Face/Basic.lean` line 145) and `PointedCone.closure` (`Mathlib/Analysis/Convex/Cone/Closure.lean` line 63). GHKK Appendix C.1 (cache 141730d2 lines 4729–4760) is the order-by-order construction and the parallel/perpendicular joint lemma; BRI §§2.2–2.5 define cone complexes; neither proves rational Minkowski–Weyl, exposedness of faces of finitely generated cones or finiteness of faces.

**Repair.** Make finiteness of faces a §1.1 target (or cite the pinned name if the author has one) and give the three polyhedral facts a textbook locator, for example Ziegler, *Lectures on Polytopes*, Theorem 1.3 (Minkowski–Weyl for cones) and §2.1 for faces, with Schrijver, *Theory of Linear and Integer Programming*, §16.2 for the rational form.

## R10 (P3) — MAN Theorem 2.6 is stated for finite initial diagrams

**Location.** `README.md` §3.3 lines 1068–1070 and 1124–1126 ("Finite families are a special case").

**Witness.** MAN cache a42f6730 lines 319–322: "let `D_in` be a *finite* scattering diagram … whose only walls have full affine hyperplanes as their supports". The README's input is order-finite (finitely many active walls at each order) and the extension is only the word "assemble".

**Repair.** Cite KS Theorem 2.1.6 (cache 9c4d34dd line 511) or GHKK Theorem 1.21 for the order-finite case, or state the order-by-order assembly (truncation of the order-`k+1` completion is an outgoing completion of the order-`k` input, hence equivalent to it by §3.4) as its own target.

## R11 (P3) — the BCH ownership split should name the section and the object

**Location.** `README.md` lines 33–37 (Scope: LieGroups "owns analytic local BCH"; §0.4 owns "universal rational BCH polynomials").

**Witness.** `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md` on main (929496d) line 312 states "the BCH series … a formal Lie series in `X, Y`" as its own object before the analytic statement; the universal element `bchElement` of §0.4 is that formal series truncated. A revision of LieGroups now in a pull request plans the formal series in the completed free Lie algebra explicitly, so two owners are about to exist.

**Repair.** In Scope, cite "RepresentationTheory/LieGroups Layer 3" and say in one clause that the formal series itself is owned here as `bchElement` (the truncations `𝔣/lowerCentralSeries c`) and that LieGroups consumes it for the analytic identity.

## Verified sound

**Gate and tooling.** Gate at 7a93e00 as in the worker's record (FAIL: imports, sorry-data, latex/tex, build advisories; `depcheck=0`, `outside-folder=0`, `stray-files=0`). Dependency check run by me: `depcheck: 205 roadmaps, 1651 edges, 0 problem(s)`; no UPWARD or CYCLE line. `lake env lean` of `Suggested.lean`: exit 0 in 25 s, 43 `sorry` warnings, two `letI` warnings (R07). Signature transcript: all 39 "dropped binder" leads are false positives (the instances appear as `inst` binders; `[DecidableEq N]` on `IsPositiveGrading` and `[NormedSpace ℝ V]` on `edgeVectors` are not needed by the types). My own `#check` probe of the 15 declarations the worker's transcript failed to resolve (`FiniteWallDiagram`, `wallBracketNormal`, `DirectedWallSpaces`, `DirectedWall`, `DirectedWall.Incoming`, `OrderFiltration`, `signedFactor`, `DirectedDiagram`, `IsOutgoingCompletion`, `centralStep`, `singleFaceBrokenLines`, `FocusFocus.focusFocusAlgebra`, `positiveMonoidCompletion`, `expDerivation_exists`, `sweep_homotopy`) elaborated; their types match the README carriers (`DirectedWall` has normal in `Λ →+ ℤ`, support a rational affine polyhedron with direction `ker m_ℝ`, label in `wallGroup w m`; `Incoming` is `x + t • i(ρ w) ∈ support` for `t ≥ 0`).

**Pinned declarations opened.** Tau Ceti 358314d4: `TauCeti.IsPrimitive` (`TauCeti/Algebra/Module/Primitive.lean` 48), `exists_eq_zsmul_isPrimitive` (118), `expAd` (`Algebra/Lie/InnerAutomorphism.lean` 107), `expAd_apply_eq_exp_mul_exp_neg` (206), `pbwAssociatedGradedEquiv` (`Algebra/Lie/UniversalEnveloping/PBW/Injective.lean` 222), `heisenberg` (`Algebra/Lie/Heisenberg.lean` 117), `IsIntegralLattice.extend` (`Geometry/Toric/Algebraic/Lattice.lean` 184), `realCharacter` (213), `IsLatticeRational` (`Cone/Basic.lean` 72), `IsLatticeRational.fg_dualSemigroup` (`DualSemigroup/Finiteness.lean` 46), `IsConvexPolyhedron` (`Analysis/Convex/Polyhedron/Basic.lean` 56), `isConvexPolyhedron_setOf_forall` (67), `Toric.Fan` (`Fan/Basic.lean` 83), `Fan.IsSubdivision` (`Fan/Subdivision.lean`). Mathlib f6090c70: `GradedLieAlgebra` (`Algebra/Lie/Graded.lean` 55), `IsRingFiltration`/`IsModuleFiltration`/`IsFiltration` (`RingTheory/FilteredAlgebra/Basic.lean`), `GrpCat.sectionsSubgroup` (`Algebra/Category/Grp/Limits.lean` 44) and `limitCone` (111), `IsNilpotent.exp` and `exp_mul_of_derivation` (`RingTheory/Nilpotent/Exp.lean` 230), `PointedCone.DualFG` (`Geometry/Convex/Cone/DualFinite.lean` 45), `IsFaceOf.trans` (`Face/Basic.lean` 145), `IsGroupLikeElem` (`RingTheory/Coalgebra/GroupLike.lean`), `Bialgebra.IsPrimitiveElem` (`RingTheory/Bialgebra/Primitive.lean`), `MvPolynomial.idealOfVars` and `truncTotal` (`RingTheory/MvPowerSeries/Equiv.lean`), `DirectSum.Decomposition.baseChange`, `SemimoduleCat`, `Comma.initial_snd`, `TopCat.PrelocalPredicate.sheafify`, `subsheafToTypes`, `LieAlgebra.SemiDirectSum`, `LieDerivation`, `DyckWord`, `PowerSeries.rescale`, `AddSubmonoid.NSMulSaturated`, `intrinsicFrontier`, `lowerCentralSeries` (`Algebra/Lie/Nilpotent.lean` 80), `LieRing.IsNilpotent` (260), `FreeLieAlgebra`. Absent: a bialgebra or Hopf structure on `UniversalEnvelopingAlgebra` (R01), `PointedCone.FG.finite_face` (R09).

**Cross-roadmap citations.** AnalyticToricGeometry is `Completed/AnalyticToricGeometry` on main; RepresentationTheory/LieGroups and LieHighestWeight are on main (LieHighestWeight lines 407–454 consume the native PBW for free modules, as the Scope says). No other roadmap is cited; the merge order lists ScatteringDiagrams at line 374 after all suppliers. Ownership greps over main and the 440 open pull requests: "scattering diagram", "broken line", "tropical vertex", "Minkowski–Weyl", "quantum dilogarithm/torus", "cluster algebra", "completed universal enveloping" and "group-like element" occur in no other roadmap; "polyhedral complex" once in TropicalAndBerkovichArithmetic (Berkovich skeleta, a different object); "focus-focus" in IntegrableSystems/CotangentLagrangian (symplectic singularities, not the affine slab). Ownership against open pull requests whose files the brief does not give was not checked.

**Sources, seeded sample.** PET 2c422a0e (OCR): Theorem 8.1 line 756, Corollary 8.1(ii) line 791 (symmetrization formula `n! β(a_1⋯a_n) = Σ_σ …`, "if K contains ℚ"), Theorem 8.2 line 832 (`Δ'∘β = (β⊗β)∘Δ`); abstract lines 10–14 ("over a commutative superring", "new already for Lie algebras"). MAN a42f6730: Definition 2.2 lines 250–261 (incoming = closed under addition by `n_d`, direction `−n_d`), Remark 2.3 271–290, (8) line 300 (`θ = exp(g)^{sgn⟨−γ',m⟩}`, Convention 3), Theorem 2.6 319–322, Lemma 2.9 415–422 (`m_3 = μ`, `d_3 = (m_1⊥∩m_2⊥) + ℝ_{≤0}(n_1+n_2)`, `g_3 = t_1t_2[g_1,g_2]`: the §3.3 Check), Definition 2.10 466–485, Proposition 2.13 548, Theorem 2.14 555–558. GHKK 141730d2: Definition 1.2 lines 709–712 (`p_f(z^m) = f^{⟨n'_0,m⟩}z^m`, `n'_0` the generator of `ℝ_{≥0}n_0 ∩ N°`: the §4.2 exponent `⟨κ(n)n,m⟩`), Definitions 1.4–1.6 723–750, Definition 1.11 794–800, Theorem 1.13 816–818, Definitions 3.1–3.3 and Proposition 3.4 1480–1530, Remark 3.2 1496–1504 (exponent positive, "never need to invert"), Definition-Lemma C.2 4744–4752. BRI 3035608f: Definitions 2.1–2.3 lines 385, 408, 434, §2.8 402–407 (sign = negative of `d/dt γ(t)(n)`), §§2.9–2.11 414–455, Lemma 3.1 491, Lemma 3.2 526, Proposition 3.3 537 (needs the finite decomposition (6), supplied here by finite cutoffs of `g≤k`), Proposition 3.4 550. LMY 88943628: Definition 1.2 229–233 ((m,n) ↔ our (n,m); condition (3) is the §5.1 annihilation condition), Definition 1.3 245–251 (outgoing there means `P − ℝ_{≥0}m ⊆ P`, as §3.4 notes). GS cd80dea1: §2.2 353–398 (monodromy `(1 0; 1 1)`, charts II/III), §2.3 399–429. GHS a55459c0: Definitions 3.1–3.3 1444–1520, Proposition 3.5 1549, Remark 3.6 1562, Lemma 3.7 1581, Proposition 3.16 1768, Theorem 3.19 1879. CPS 5a3b26d3: Proposition 3.2 line 467 (p. 13), Proposition 4.4 615 (p. 18), Definition 4.6 644, Lemma 4.7 657, Lemma 4.9 750. N23 6a898364: (1.18) line 232 (`[X_n,X_n'] = {n,n'}X_{n+n'}`, the opposite sign to the README's, which explains "N23's ordering is the reverse of ours"), Definition 1.10 463, Proposition 1.12 478–483, Proposition 1.14 512–517 (pentagon), Theorem 5.2 2609–2615, Proposition 5.4 2638–2645. NQ c7cd94f5: (2.14) line 166, (2.21) 239–252. BLM db3c9ae1: Definitions 8.1–8.2 and injectivity 2198–2216, Theorem 8.11 2330–2336, Definition 9.3 2833, Theorem 9.5 2844–2857, Corollary 9.8 2919–2931, Theorem 9.9 2960–2967, Definition 9.10 3087, Lemma 9.14 3125–3128, Corollary 5.14 1369–1375, Theorem 5.17 1424–1439, Remark 5.20 1462, Example 5.21 1467, Lemma 5.23 1503–1505, Lemma 5.27 1574–1584, Proposition 5.28 1591, Lemmas 5.31–5.33 1632–1653, Proposition 5.34 1665. RUP 72d39f24: Definition 4.1 854–865, Definition 4.5 959–975. KS 9c4d34dd: Theorem 2.1.6 line 511. GPS (fetched as control, 9b20f77a): Example 1.6 lines 405–416.

**Adversarial table.** One row per statement; values computed on each side.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.1 cutoff-modulus Check | `P={0}∪{a≥b≥1}`, `δ=a`, `T(a,b)=b` | `δ'(T(j,1)) = 1` for all `j`; `δ(j,1)=j` unbounded | no modulus, as claimed | none |
| §0.1 supported rays | `P={0}∪{a≥1,|b|≤a²}`, `w=(1,b)` | `a·w ∈ P` iff `a ≥ |b|`; cutoff `a ≤ k` meets `2k+1` rays | finite per order, infinitely many rays | none |
| §0.1 `P` is a monoid in both Checks | `(a,b)+(a',b')` | `|b+b'| ≤ a²+a'² ≤ (a+a')²`; `b+b' ≤ a+a'` | closed | none |
| §0.2 `g≤k` nilpotent, kernel central | bracket of `k+1` positive-degree elements | degree `≥ k+1 > k`, lies in `F^{k+1}`; `[F^{k+1},g] ⊆ F^{k+2}` | true | none |
| §0.4 Heisenberg Check | `[X,Y]=Z` central | `log(e^Xe^Y) = X+Y+Z/2`, `log(e^Ye^X) = X+Y−Z/2` | true | none |
| §0.4 `e^xe^y = e^ye^ze^x` for `[x,y]=z` central | BCH to degree 2 | both sides `exp(x+y+z/2)` | true | none |
| §0.4 cofinality Checks | `U(ℚx)`, abelian with generators `x_d` | `x² ∈ I²U`, `g_2=0`; `x_d ∈ I^dU`, `x_d ∉ J²` | both true | none |
| §0.4 `ι_c` injectivity | free Lie algebra over ℚ | `𝔣 ∩ (U⁺)^{c+1} = lcs_c` (Magnus) | true, but `U⁺` unowned | R01 |
| §0.5 change-of-degree Checks | `δ ↦ 2δ`; `P={b≤a≤b²}` | `λ(k)=⌊k/2⌋`; `max{a : b≤k} = k²`, reverse `k` | true | none |
| §0.7 non-initial `H` Check | `J=J''=*`, `J'=2` objects, `F'=(Unit,Empty)` | `lim F = *`, `lim F' = ∅` | no map, as claimed | none |
| §0.8 graph Check | `θ(a)=2a` on ℚ | `B^{0,0}(1)=2`, `B^{0,η}(1)=0` | true | none |
| §1.1 homogenization Checks | `0 ≤ −1`; `x≤0 ∧ −x≤−1` in ℝ | cones `ℝ×{0}` and `{(0,0)}`; homogenization of ∅ is `{0}` | true | none |
| §1.1 complexes Check | `{H}`, `{L}`, `{r,{v}}` | faces of a line: itself; faces of a ray: ray and vertex | complexes, `H` has lineality | none |
| §1.1 meeting cells share lineality | face `F = Q∩{ℓ=c}` | `ℓ` vanishes on `lin Q`; a line in `F` is a line in `Q` | true | none |
| §1.2 loop-word Check | `U=ℝ²∖0`, `w` = positive `x`-axis, `ν=dy` | last edge `(1,−1)→(1,1)`: `⟨dy,(0,2)⟩>0` gives `w⁻¹` | word `w⁻¹`, not `1` | none |
| §1.4 coboundary Checks | half-plane `{y≥0}`; segment `p₀p₁` with `dy` | README rule: `(−1)^1·(−dy) = +dy`; `dy∧(−dx) = dx∧dy` at `p₀`, `−dx∧dy` at `p₁`; pairing with `(0,1−2t)`: `−c`; triangles: `1,−1` | agree with Lean `IsInducedOrientation` (`β(u,·)=tα`, `u` inward) | none |
| §2.1 square-loop Check | labels `a` (`dy`), `b` (`dx`) | crossings `b,a,b⁻¹,a⁻¹`; product first-rightmost `a⁻¹b⁻¹ab` | `≠1` iff `ab≠ba` | none |
| §2.3 allowed points without openness | `±δ` | `δ(n)>0` on `N⁺` so `δ ∉ n⊥` | off every wall | none |
| §2.3 sign factorization hypothesis | BRI Prop 3.3 needs finite support | `g≤k` has finite support by finite cutoffs | hypothesis supplied | none |
| §2.4 Heisenberg quotient Check | `g/center` abelian | `e^Xe^Y = e^{X+Y} = e^Ye^X`; originals differ by `Z` | not reflected, needs `R ≠ 0` | none |
| §3.1 bracket normal | `[z^n∂_m, z^{n'}∂_{m'}]` on `z^q` | `(m(ρn')m' − m'(ρn)m)(ρq) z^{n+n'+q}` | matches README and Lean `wallBracketNormal` | none |
| §3.1 parallel normals commute | `m' = cm`, `m(ρn)=m'(ρn')=0` | `μ = c(m(ρn')−m(ρn))m = 0` | bracket `0` (Lean `sameNormal_lie_eq_zero` proved) | none |
| §3.2 Incoming Checks | `𝔡=ℝ_{≥0}e_1`, `𝔡+2e_1`; point support with `ρ(w)=0` | `rec` contains `e_1`; `x+t·0 = x` | incoming, as claimed | none |
| §3.3 two-wall Check | `n=e_1,m=e_2*,n'=e_2,m'=e_1*`, `ρ=id` | `μ = e_1*−e_2*`; support `{0}−ℝ_{≥0}(1,1)` | agrees with MAN Lemma 2.9 | none |
| §3.4 uniqueness route with bounded supports | `n ∉ rec(𝔡)` | some `g_i(n)>0` with `𝔡 ⊆ {g_i ≤ c_i}` | half-space exists | none |
| §4.1 Checks | `ℤ³`, `[z^{e_1}∂_{e_3*}, z^{e_2}∂_{e_1*}]`; `P=ℕe_1`; `T=(a,b)↦a+b`; `T=(2a,b)` | `−z^{e_1+e_2}∂_{e_3*}`; `e_2*(q)=0` on `ℕe_1`; `yx∂_x(x−y) ↦ z² ≠ 0`; `S(e_1*) = ½e_1*` | all as claimed | none |
| §4.2 principal wall spaces satisfy §3.1 | `m=κ(n)ν_n`, `m'=κ(n')ν_{n'}` | `μ = κ(n)κ(n'){n',n}ν_{n+n'}`, integral multiple of `κ(n+n')ν_{n+n'}`; bracket `{n',n}X_{n+n'}` | axiom holds | none |
| §4.2 `P_pr = C_pr ∩ L_pr` | `Σλ_i r(e_i)` integral | second coordinate forces `λ_i ∈ ℕ` | saturated | none |
| §4.2 datum Check | `{e_1,e_2}=1`, `d=(1,2)` | `{e_1,2e_2}=2`, `{e_2,e_1}=−1`; `κ(e_2)=2`; `{−,2e_2}` integral | true | none |
| §4.3 commutator and Checks | `β(e_1,e_2)=1`; `β(n,p)=1`, `G=Ψ_q` | `[z^n,z^{n'}] = (q^β−q^{−β})z^{n+n'}`; `θ(z^p)=z^p+z^{p+n}`; `θ(z^{2p}) = z^{2p}+(q+q⁻¹)z^{2p+n}+z^{2p+2n}` | all true | none |
| §4.3 `Ψ_q` existence | `a_j(q^{2j}−1) = q a_{j−1}` | needs `q^j−q^{−j}` units | unique, as hypothesised | none |
| §4.3 `Ad` formula | `z^n z^p = q^{2r} z^p z^n` | `G(z^n)z^p = z^p G(q^{2r}z^n)`; component `q^{−jr}h_j z^{p+jn}` | true | none |
| §4.3 `k(q)→k`, `q↦1` | field hom | `q−1` a unit maps to `0` | none exists | none |
| §4.4 slab Check | `X^a w^b`, `q=t(1+w)` | `t^a y^{−a} Σ binom(a,j) w^{b+j}` | true | none |
| §5.1/5.6 exponent sign | wall `ν=m`, velocity `−ρ(p)` | `θ^{−sgn⟨m,−ρp⟩}` acts by `f^{sgn(m(ρp))·m(ρp)} = f^{|m(ρp)|}` | never inverted (GHKK Remark 3.2) | none |
| §5.2 one-wall Check | `A=ℚ[x^{±1},t]/(t²)`, right-to-left | `θ^{+1}(x) = x + tx`; velocities `−1,−1` | exactly `x`, `tx` | none |
| §5.3 discriminant Check | walls `x=0,y=0`, `p=(−1,−1)` | backward velocity `(1,1)` through `0` from `{x=y>0}` | joint incidence | none |
| §5.4 facet-equation Check | `{x=0}`, `ν=e_1*` | `side(Q⁻)−side(Q⁺) = −1`: `s(Q⁺) = θ⁻¹s(Q⁻)` | constant family fails | none |
| §5.5 one-wall theta Check | `f=1−z^n`, `m(ρp)=1`, `m(ρn)=0` | `Q_x>0`: `z^p`; `Q_x<0`: `z^p(1−z^n)^1` | as claimed | none |
| §6.3 lattice data | `x,y,w,t ∈ Q`, `S=(a,b−a,h)` | `x+y=t`; `h−a ≥ 0` on `x` (`=1`), `y` (`=0`); `ρS=Tρ`: `T(−1,0)=(−1,1)` | consistent | none |
| §6.3 gluing | `f=1+w`, `f'=1+w⁻¹` | `wf' = f`; `g_f h_II(x₁) = fx₂ = g_{f'}h_III(x₁)`; `y₁ ↦ f⁻¹y₂` both ways | square commutes | none |
| §6.3 `X,Y ∈ A_k`, `XY` | `X=(x₁,fx₂)`, `Y=(fy₁,y₂)` | `α₋(x₁)=fx₂=α₊(fx₂)`; `α₋(fy₁)=y₂`; `XY=(ft,ft)=t(1+W)` | model relation holds | none |
| §6.3 `e` at `k=0` | `S_0=K` | `A_0 = {(u,v) : u(0,w)=v(0,w)} ≅ K[w^±][X,Y]/(XY)` | isomorphism | none |
| §6.3 left injectivity on `a≤0` | `t^r x₁^d w^b` | `R₋,k = K[w^±][x₁,y₁]/(y₁^{k+1})`, `t^r x₁^d = x₁^{r+d}y₁^r ≠ 0` for `r≤k` | injective | none |
| §6.3 transfers and heights | `X^d W^b` from the left | `(fx₂)^d w^b = Σ binom(d,j) w^{b+j}x₂^d`; crossing at `s_j = v+(b+j)u/d`; upper chart `(1+w⁻¹)^d w^d` gives the same terms | as claimed | none |
| §6.3 Checks | `K=ℤ`, `k=2`; `Q=(1,1)` | `XY = t+tW`; `d=1`: weights `1,1`, `s=1,2`; `d=2`: `1,2,1`, `s=1,1.5,2` | all nonzero heights, counts as claimed | none |
| §7.1 ray-factor Check | `log(1+A+B)`, `A=z^{v_1}`, `B=z^{v_2}` | degree `v_1+v_2` term `−AB` | `[u]f_u = −1` | none |
| §7.2 pentagon Check | `{e_1,e_2}=1`, README bracket `{n',n}` | degree 2: both sides `X_1+X_2+½X_{12}`; N23's (1.18) has the opposite sign, so N23 (1.56) transforms to the README's | identity and "reverse ordering" note correct | none |
| §7.2 wall function of `Ψ[tn]^{sκ(tn)}` | action on `z^m` | `(1+q^{tn})^{sκ(tn)⟨tn,m⟩} = ((1+q^{tn})^s)^{⟨κ(tn)tn,m⟩}` | `(1+q^{tn})^s` | none |
| §7.3 diagonal function | independent rank-two scattering computation, cutoff 7, symbolic `a,b,c,d` | `f = 1 + ac·u + (2bd+bc²+a²d)u² + 5abcd·u³`; `[u³]f² = 14abcd+2abc³+2a³cd` | equal to the README | none |
| §7.3 control | `a=c=2`, `b=d=1`, cutoff 8 | `f = 1+4u+10u²+20u³`, `[u³]f² = 120 = binom(10,3)`; GPS Example 1.6: `(1−t_1t_2xy)^{−4}` | agree | none |
| §7.3 `(5,3)` excess | `(3,2)` ray leading coefficient | computed `[x³y²]f_{(3,2)} = abd`; exponent at the bend `|⟨(2,−3),(−5,−3)⟩| = 1`; `y`-axis bend takes `[y](1+cy+dy²)² = 2c` | two-bend weight `2abcd`, the stated excess | none |
| §7.3 lattice tests | `(5,3)`: `Δ=2`, gap `(3,2)`; `(6,4)`: `Δ=2`, `d_2=4<6`, no `a_1/b_1 ∈ (1,3/2)` with `a_1,b_1≤3` | as claimed | none |
| §7.3 (R), (V), Corollary 5.14, Theorem 5.17 | BLM lines 1369–1375, 1424–1439, 1503–1505, 1574–1584 | hypotheses `d_{1,k}≥ka`, `d_{2,k}≥kb`, one-bending, `m=|ad_2−bd_1|` all restated | faithful | none |
| §7.4 lattice-change Check | `m_1=(1,0)`, `m_2=(1,2)`, `m°=(2,2)` | `ℓ=2`; `N₀=ℤ×½ℤ`; `m°⊥∩N₀ = ℤ(1,−1) = m°⊥∩N`, `ind=1`; `r=2`; `ℓ = r·ind` by evaluation at `m°` | as claimed; BLM 9.5 exponent `ℓ/ind=2` | none |
| §7.6 Checks | `Σa^jt^j` at `a=1`; `S(e_2*)=−e_2*` | `t`-adic filtered; `a`-adic not; `exp(−log(1+x)∂)` has function `(1+x)⁻¹` | as claimed | none |
| Headlines (R02) | PBW, BCH statable at pins | carriers `SymmetricAlgebra`, `UniversalEnvelopingAlgebra`, `FreeLieAlgebra`, `lowerCentralSeries`, `IsNilpotent.exp` present | absent from the file | R02 |

**Lean signatures against the README.** `PositiveDegrees` (monoid, `δ`, positivity, finite cutoffs), `PositiveDegreeMap` (monotone modulus, `δ(n) > λ(k) ⇒ δ'(Tn) > k`), `AlgFiltration` (two-sided, antitone, multiplicative, `I⁰=⊤`), `IsFilteredAlong` (`f(I^{c(k)+1}) ⊆ J^{k+1}`), `IsFiltrationRaising` (`F^{k+1}g · I^b ⊆ I^{b+k+1}`), `DirectedWallSpaces` (five axioms of §3.1), `DirectedWall`, `DirectedDiagram` (order-finite, parallel commute as a field), `IsOutgoingCompletion`, `probeDegrees` (`P_ext`, `δ_ext`), `probeWallGroup`, the focus-focus ideals and generator images all agree with the README's generality; `truncatedLie_nilpotent`'s conclusion is the README's but is a sorried instance (R03).

## Not verifiable

- PET Hypothesis 8.1 (cache 2c422a0e lines 732–735): the OCR of these lines is mirrored garbage, so the exact hypothesis of Theorem 8.1 could not be read; the abstract, Theorem 8.1, Corollary 8.1 and Theorem 8.2 were readable and support the symmetrization statement over commutative ℚ-algebras as the README cites it.
- GHS Proposition 3.16 and Theorem 3.19 and N23 §7 (Definition 7.2, Proposition 7.6, Lemmas 7.7–7.8), cited for §§5.4 and 5.6 outside the seeded sample: located, not checked line by line.
- Ownership against open pull requests whose files the brief does not provide was not checked.

## Source issues

- **Misprint** in BLM at Remark 5.20, printed page 34: the source says the one-bending condition for `m = 1` is `|a·d_{2,k} − b·d_{2,k}| = 1`; it should be `|a·d_{2,k} − b·d_{1,k}| = 1` (the quantity of Theorem 5.17); affects nothing.

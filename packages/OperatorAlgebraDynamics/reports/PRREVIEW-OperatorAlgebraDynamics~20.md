# Review of OperatorAlgebraDynamics (pull request #1137 at 53ad990)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` (3604 lines) and `Suggested.lean` (375 lines) at 53ad990. The 1694 lines changed since 2ccd93b were read line by line, and the rest of the roadmap was read again. Both manifests (the branch's and the content repository's) pin Tau Ceti at 2fd255d9; every library claim below was checked there.

**The nine findings of the previous review (r17, at 2ccd93b):**

- **r17 R01 (gate fails on CStarAlgebras): repaired.** Lines 233–238 route the C*-foundations through `gap:cstar-ideals-multipliers`, `gap:cstar-representations`, `gap:cstar-tensor-limits`, `gap:cstar-nuclear-exact` and `gap:toeplitz-extension`, each declared at 535–574 with its CStarAlgebras sections; every *Needs:* and Dependencies line uses the slugs. The worker's gate passes (`depcheck=0`), and my run of the prescribed check gives `244 roadmaps, 2462 edges, 0 problem(s)`. The cited sections exist at the CStarAlgebras head 33ddcef (C1.3 at its line 305, C1.4 380, C1.6 435, C1.7 468, C2.1 544, C2.2 568, C2.3 616, C2.4 643, 2.6 at 695 (tagged C2.AnnHull), C5.1 1112, C5.2 1143, C5.4 1203, C6.1 1272, C6.2 1297, C6.5 1414, C7.1 1455, C8.4 1676).
- **r17 R02 (statable headlines absent): repaired.** `exists_covariantRepresentation_integratedFull` (Lean 107), `injective_integratedFull_regular_of_amenable` (213), `exists_fullGroupCStarAlgebra_equiv_zeroAtInfty_dual` (299) and `exists_fullGroupCStarAlgebra_dual_equiv_zeroAtInfty` (315) are stated on the pinned `FullCrossedProduct`, and the docstring's not-statable list (45–71) names the missing carrier of each remaining headline.
- **r17 R03 (library work planned as targets): repaired.** The "From Tau Ceti" contract (256–421) lists the pinned declarations by file; D1 (603–623), D7 (2829–2863) and D9 (3255–3267) open with what the pin supplies and build only the rest; the false sentence on the abelian second-countable convolution theorem is gone.
- **r17 R04 (gaps on VonNeumannAlgebras): repaired.** The three gap paragraphs are replaced by citations of V11 (447–468), V4.0.Fields (470–482) and V4.0.Decomposition (484–497), which exist on main at VonNeumannAlgebras lines 3150–3250, 1181 and 1279 with the stated content.
- **r17 R05 (restated declarations): repaired.** `IsCovariant`, `convolution`, `integrated_convolution`, `IsKMS`, `kms_invariant` and `kms_entire_identity` are deleted; `exists_integratedOperator` (94) is the L¹ vector-integral form on `CovariantRepresentation`.
- **r17 R06 (unit Check): repaired.** Lines 2105–2112 now read "For nondiscrete G neither … has a unit … Unitality follows discreteness, not compactness", with ℝ, 𝕋 and ℤ as the three instances.
- **r17 R07 (τ^P sign): repaired.** Lines 2937–2945 define `τ^P` as the pinned `perturbed` with generator `δ+i[P,·]`, Gibbs state of `K+P`; the Check at 3013–3018 and the Araki form `Q=−βP` agree with it (recomputed below).
- **r17 R08 (merge order against #1187): not repaired.** The description's revision-dependencies line still reads "#1097, #1771, #1015, #863"; see R03.
- **r17 R09 (A7's Riemann–Lebesgue re-proved): repaired.** Lines 2028–2040 consume `f̂∈C₀(Ĝ)`, `‖f̂‖_∞≤‖f‖₁` and `(f*g)^=f̂ĝ` from A7.CharactersAndUniqueness (BanachAlgebras line 1739 on main) and keep only `(f*)^=conj(f̂)`.

## R01 (P3) — A Tau Ceti declaration is cited under a name that does not exist at the pin

Location: `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` line 1244 (D1 Dependencies): "Tau Ceti `ContRepresentation.IsUnitary`, `ContRepresentation.integratedOperatorL1`, `twistedMonoidAlgebra` …".

Claim: Tau Ceti has a declaration `ContRepresentation.integratedOperatorL1`.

Witness: at the pin 2fd255d9 the only `integratedOperatorL1` is `TauCeti.CStarAction.CovariantRepresentation.integratedOperatorL1` (`TauCeti/Analysis/CStarAlgebra/Action/Covariant/Normed.lean:94`, a `def` in the `CovariantRepresentation` namespace); grep of the whole library for `integratedOperatorL1` finds no `ContRepresentation` form. The README itself cites the right name at lines 315 and 636.

Repair: in line 1244 replace `ContRepresentation.integratedOperatorL1` by `TauCeti.CStarAction.CovariantRepresentation.integratedOperatorL1`, or delete it there, since the "From Tau Ceti" contract already lists it.

## R02 (P3) — The Downstream bullets on OperatorKTheory and CompactQuantumMetricSpaces do not say who builds the discrete abelian twisted algebras those roadmaps use

Location: README lines 3444–3449 ("CompactQuantumMetricSpaces keeps its quantum tori … the twisted group C*-algebra it specializes … is D1.CentralTwists' and D2.CentralTwists' at `L=ℤᵈ`") and 3450–3451 ("OperatorKTheory K7 consumes the crossed products of D1–D2 and the duality of D4"), against the single-owner list at 71–78.

Claim: the consumers reach the discrete abelian `C*(L,c)` through D1.CentralTwists and D2.CentralTwists.

Witness: OperatorKTheory at its head b328ec07 (#866) builds `C*(L,c)` itself: its Scope (README lines 22–25) owns "the twisted group C*-algebra `C*(L,c)` of a discrete abelian group L … built in 7.5 … with its trace, gauge action, universal property", §7.5 at 1815–1830 constructs it on `twistedMonoidAlgebra`, and its Downstream (2327–2330) declares HeisenbergImprimitivity's `C*(D,β)` and CompactQuantumMetricSpaces' quantum tori to be "7.5's `C*(L,c)`". CompactQuantumMetricSpaces at c4343b92 (#1155) cites OperatorKTheory K7.5 for the algebra and its gauge action (its lines 103, 309, 1509) and this roadmap's D2 only for the absorption argument (97). HeisenbergImprimitivity at a9eeb6e (#1149, lines 31–40) also builds `C*(L,c)` and says "no roadmap on main owns the twisted group C*-algebra of a general 2-cocycle", which is true of main's OperatorAlgebraDynamics and false after this pull request.

This roadmap is the owner: it is on main, OperatorKTheory (merge order #10) and HeisenbergImprimitivity are later, and OperatorKTheory's 7.5 already consumes this roadmap's D2 for Fell absorption, so the supply direction cannot be reversed. The repointing of 7.5 and of HeisenbergImprimitivity's Layer 3 belongs to their own reviews. What is wrong here is that the Downstream section hides the fact that three open roadmaps state the same object, so a reader of this README cannot see which citation the consumers must change.

Repair: in the OperatorKTheory bullet (3450–3451) add that K7.5's `C*(L,c)` for discrete abelian L, with its twisted regular representation, trace, gauge action and universal property, is the instance of D1.CentralTwists and D2.CentralTwists at scalar ω and counting Haar measure, consumed from here; in the CompactQuantumMetricSpaces bullet say that it reaches that instance through OperatorKTheory K7.5; in the HeisenbergImprimitivity bullet (3428–3443) say the same of its §3.1. No ownership moves.

## R03 (P3) — An open pull request rewrites this `Suggested.lean`, and no merge order is stated

Re-raised: R08 of the review at 2ccd93b.

Location: the pull request description; its revision-dependencies line names #1097, #1771, #1015 and #863.

Claim: the stated merge order covers the open pull requests that change this roadmap.

Witness: `scratch/overlaps.md` (index of 2026-11-08) reports "#1137 and #1187 conflict in … `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean`, `lake-manifest.json`, `lean-toolchain`". #1187 bumps the Tau Ceti pin to ab00ba392, which is an ancestor of this head's pin 2fd255d9 (`git merge-base --is-ancestor` in the pinned package), and edits main's version of this file, which this pull request replaces wholesale. The description has not changed on this point since the previous review, and the reason it was left is not recorded in the folder.

Repair: state the order in the description: either #1187 merges first and this branch is rebased on it, or this pull request merges first and #1187 drops its OperatorAlgebraDynamics hunk and its stale pin.

## Verified sound

**Gate, dependency check, elaboration, probe.**

- The worker's gate passes every check. My dependency check: `depcheck: 244 roadmaps, 2462 edges, 0 problem(s)`, no UPWARD or CYCLE line. `git diff --stat origin/main...HEAD` outside the folder is empty.
- `lake env lean` on `Suggested.lean` at the head: thirteen `declaration uses sorry` warnings (lines 94, 107, 122, 194, 213, 229, 250, 271, 282, 299, 315, 337, 361), nothing else, 7.9 s. Imports are `Mathlib` and seven `TauCeti.*` modules that exist at the pin; no `set_option`; the two structures and the one `def` have real bodies.
- One-tactic probe on a scratch copy, each `sorry` preceded by `try first | rfl | simp | infer_instance | simp_all | trivial` and `try exact?`: all thirteen keep their `sorry` warning, no `no goals` error, no `Try this` suggestion. Nothing closes in one step.
- `#check` comparison: `scratch/signatures.md` lists the elaborated types of all 16 declarations; I compared each with its README statement (D1 630–635, 657–662, 677–684; D1.CentralTwists 864–873, 908–920; D2 1311–1318; D2.OrbitRepresentations 1378–1380; D2.FreeGroups 1574–1620; D4.Harmonic 2048–2075; D4.LCAWeyl 2175–2187; D6 2770–2790). No binder is lost: every theorem carries the LCH, Borel, Haar/regular, amenability, unitarity and strong-continuity hypotheses its README statement has, and the README's generality equals the Lean's (arbitrary LCH G, possibly degenerate faithful ρ, arbitrary basis cardinality for free groups, arbitrary Hilbert multiplicity for LCA Weyl).

**Headline theorems (item 7).**

| Headline | Status at the pin |
|---|---|
| D1 L¹ integrated form with bound | stated (`exists_integratedOperator`) |
| D1 recovery of the pair (Williams 2.40) | stated (`exists_covariantRepresentation_integratedFull`) |
| D1 ideal exact sequence (Williams 3.19) | stated (`fullCrossedProductMap_exact`) |
| D1 universal property into `M(B)`, `A⋊_id G≅A⊗_max C*(G)` | not statable: no strict extension into `M(B)`, no C*-tensor product (docstring 46–54) |
| D1.CentralTwists projective integrated form | stated (`exists_centralIntegratedOperator`) |
| D2 amenable full = reduced (Williams 7.13) | stated (`injective_integratedFull_regular_of_amenable`) |
| D2.OrbitRepresentations irreducibility | stated (`transitive_commutant_scalar`) |
| D2.FreeGroups Powers partition, simplicity, unique trace | stated |
| D3 Green and symmetric imprimitivity | not statable: no imprimitivity-bimodule carrier (57–58) |
| D4.Harmonic `C*(G)≅C₀(Ĝ)`, `C*(Ĝ)≅C₀(G)` | stated |
| D4.LCAWeyl classification | stated (`lcaWeyl_classification`) |
| D4.Takai | not statable: no tensor product, no dual action (52–54) |
| D5–D6 disintegration, equivalence, `O_n` universal | not statable (59–60); residue family stated (`exists_residue_family`) |
| D7 KMS simplex, Araki perturbations | not statable: no Choquet simplex carrier, no modular operator (61–66) |
| D8–D9 CAR/Weyl, thermodynamic limit | not statable: no CAR/Weyl C*-algebra, no quasi-local algebra (67–71) |

I grepped the pinned Tau Ceti for `Choquet`, `StandardSubspace`/modular conjugation, a CAR or Weyl C*-algebra and a tensor product of C*-algebras: none exists, so the not-statable list is right.

**Pinned library declarations opened** (under `TauCeti/Analysis/CStarAlgebra/` unless another path is given), with what they say:

- `Action/CrossedProduct/Full.lean`: 266 (`FullCrossedProduct : Type (max u v)`), 282 (`of`), 335 (`of_injective`, hypotheses `[μ.InnerRegularCompactLTTop]` and a faithful ρ on `H : Type v`, as the README says at 344–346), 378 (`lift`), 417 (`integratedFull`, on `H : Type (max u v)`), 438 (`norm_le_iff`).
- `Action/Covariant/Basic.lean:33` (`CovariantRepresentation`: unitary, strongly continuous group representation, coefficient representation with no nondegeneracy field), `Integrated.lean:88, 115, 161, 222`, `Normed.lean:94` (`integratedOperatorL1`), `Intertwiner.lean` (`ext_integratedOperator`, `comp_integratedOperator_iff`, `centralizer_range_integratedOperator`), `Nondegenerate.lean` (`dense_span_integratedOperator_iff`), `Regular.lean` (`regular`, `isNondegenerate_regular_coefficient`, `injective_integratedOperator_regular`), `GNS.lean` (`gnsCovariantRepresentation`, `gnsImplementingGroup`, `gnsHamiltonian`), `VonNeumann.lean:89, 127`.
- `Action/Basic.lean:145, 156, 179`, `Action/Hom.lean:36, 105, 273, 293` (`IsInvariant.restrict`, `IsInvariant.subtypeHom`), `Action/Quotient.lean:92`, `Action/Multiplier.lean:45` and `continuous_multiplier_apply_fst`, `eq_multiplier_of_apply_coe`.
- `Action/CrossedProduct/Multiplier.lean` (`coefficientMultiplier`, `groupMultiplier`), `Functoriality.lean` (`Hom.fullCrossedProductMap`), `ApproximateUnit.lean`.
- `Action/Generator/Basic.lean:72`, `Analytic.lean`, `GaussianSmearing.lean`, `Perturbation.lean` (`perturbationCocycle`, `perturbationCocycle_add`, `perturbed`, `generator_perturbed` at 275: generator `I•(mulLeft P − mulRight P) + δ`, that is `δ+i[P,·]`), `Inner.lean` (`selfAdjoint.cstarAction`).
- `Action/KMS/Basic.lean:222` (`IsKMSState`), 231, 303 (`apply_action`, `β ≠ 0`), 349 (`restrict`, with the norm-one hypothesis the README states), `isKMSState_zero_iff`, `isKMSState_comp_iff_of_surjective`; `KMS/Dense.lean` (`isKMSState_iff_of_dense`); `KMS/StateSpace.lean:51, 119, 148` (compactness under `[CStarAlgebra B]`, unital as the README says); `KMS/Rotation.lean`; `KMS/Separating.lean:114`.
- `Action/GroundState/Basic.lean:465` (`of_tendsto_isKMSState`, with the norm-one hypothesis), `GroundState/GNS.lean`; `Action/Gibbs.lean:61, 117, 174` (`isKMSState_perturbed_iff_eq_gibbsState`: Gibbs state of `K+P`).
- `QuantumSpin/LocalAlgebra.lean:130` and `QuantumSpin/Interaction.lean:244, 261`.
- `Representation/Nondegenerate.lean:62, 204, 251, 260, 271` (`continuous_multiplierExtension_apply` needs a uniform norm bound, which unitaries supply).
- `TauCeti/GroupTheory/Amenable/Basic.lean` (`Amenable`, `UCB`), `Abelian.lean:47` (`Amenable.of_commGroup`, an instance for `[CommGroup G] [TopologicalSpace G] [IsTopologicalGroup G]`).
- `TauCeti/Topology/Algebra/PontryaginDual.lean` (`circleEquivPontryaginDualInt`), `TauCeti/Algebra/MonoidAlgebra/Twisted/Basic.lean` (`twistedMonoidAlgebra`, `TwistedMonoidAlgebra.equivOfCoboundary`), `TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean` (`ContRepresentation.IsUnitary`).
- Mathlib: `Analysis/CStarAlgebra/ApproximateUnit.lean:143` (`Filter.IsIncreasingApproximateUnit`, `CStarAlgebra.approximateUnit`), `Analysis/CStarAlgebra/Module/Defs.lean:81` (`CStarModule.star_inner`), `Module/Constructions.lean` (`WithCStarModule.instCStarModuleComplex`), `Analysis/CStarAlgebra/CStarMatrix.lean`, `Multiplier.lean` (`DoubleCentralizer`), `Topology/Algebra/Module/Spaces/PointwiseConvergenceCLM.lean:155`, `MeasureTheory/Measure/Haar/NormedSpace.lean:79` (`AddMonoidHom.continuous_of_measurable`), `Topology/Algebra/Group/OpenMapping.lean:114`, `Logic/Equiv/Fin/Basic.lean:358` (`Nat.divModEquiv`), `Analysis/SpecificLimits/Normed.lean:450` (`Units.oneSub`), `Algebra/Module/CharacterModule.lean`, `Analysis/VonNeumannAlgebra/Basic.lean`, `Analysis/LocallyConvex/WeakOperatorTopology.lean`, `Analysis/CStarAlgebra/GelfandNaimarkSegal.lean`, `Topology/Algebra/PontryaginDual.lean`, `MeasureTheory/Group/ModularCharacter.lean`, `Analysis/Fourier/FourierTransform.lean`. Every other backticked library name in the README (151 of them, extracted by script) resolves to a declaration at the pins; the single miss is R01.

**Cross-roadmap citations resolved** (heads from `roadmaps list`, 2026-11-08):

- On main: VonNeumannAlgebras V1 (477–483, Kaplansky density in strong-star form), V4.0.Fields (1181–1200: fundamental sections, decomposable criterion, unitarity fibrewise, change of measure, zero-extended λ-field), V4.0.Decomposition (1279–1306: reduction of separable C*-representations commuting with the diagonal, uniqueness and transport, naming this roadmap's D5), V8 (2018–2041), V10.ModularTheory (2364–2395: `S=JΔ^(1/2)`, `ΔΩ=Ω`, Tomita's theorem, the natural cone with its self-duality and unique representing vectors), V10.KMS (2459–2475: `F(t)=φ(α_t(x)y)`, `F(t+i)=φ(yα_t(x))` on `0≤Im z≤1`, α=σ^φ iff), V11.UnitizationCharacters (3185), V11.FourierUniqueness (3203) and the inversion/Plancherel/duality paragraph (3233–3246: inversion with `conj(γ(x))`, `Fλ(f)F*=M_f̂`, `‖λ(f)‖=sup|f̂|`, evaluation an isomorphism, rescaling). BanachAlgebras A7.CharactersAndUniqueness (1739) and its AmenableGroups dependency (148–150). AmenableGroups Layers 5, 6, 7 (289, 391, 415). SelfAdjointSpectralTheory SA-B14 (320), SA-B44 (420), SA-B50 (441), SA-B59, SA-B67 (538), SA-B79, SA-B85 (132; lines 747 and 1407 name D5 as consumer), SA-A21 (151). SpinRepresentations (Clifford/exterior, lines 15–16), CompactGroups (Peter–Weyl), OneParameterSemigroups (Completed), FreeProbability F3 (255; line 80 records D6 as owner of finite `O_n`), LieGroupoidsPoisson G0 (259; line 270 names D5 as consumer).
- At open heads: CStarAlgebras 33ddcef (sections listed under r17 R01 above); HilbertModules bbc2ad5 (H2 at 179, H3 at 262); NoncompactQuantumSymmetry a7afa46a (lines 11–19, 133, 176–177, 290–291, 1441–1478: consumes D1, D1.BorelPrefix, D1.TwistedBorel, D3, D4.Harmonic's full-algebra form, D5); QuantumFoundations 824bab8 (15, 24, 55, 726–782, 1102: consumes D8 as this README's Scope says); CStarClassification db5a0c5 (unchanged since r17); OperatorKTheory b328ec07, CompactQuantumMetricSpaces c4343b92 and HeisenbergImprimitivity a9eeb6e as in R02; MetaplecticAutomorphicForms ebe857f (§1.2 "Unitary Stone–von Neumann theorem" at its line 357). #1097 also changes this roadmap and the description orders it first.
- Declared gaps: the five CStarAlgebras slugs and `gap:hilbert-module-induction` are precise (each names its sections and content) and minimal (the Hilbert-space multiplier extension is excluded from `gap:cstar-ideals-multipliers` because the pin has it). The board package has no `design/plan.json`, so they are declared in the README only, as before.

**Sources.**

- `williams-cpcsa-draft31` (cache page = printed page + 12, confirmed on 23 locators): Proposition 2.40 at line 3988 (p. 59: nondegenerate pairs ↔ nondegenerate representations, preserving sums, irreducibility, equivalence), Proposition 3.19 at 6050 (p. 93: `0→I⋊G→A⋊G→A/I⋊G→0` exact), Theorem 2.61 at 4898 (p. 72), Lemma 2.73 at 5134 (p. 76), Proposition 3.1 at 5398 (p. 82: "G locally compact abelian … Fourier transform extends to an isomorphism of C*(G) with C₀(Ĝ)"), Theorem 7.13 at 12297 (p. 199: amenable G, `‖·‖_r` = universal norm, faithful π gives faithful `π̃⋊λ`), Proposition 1.76 at 1562 (p. 24), Lemma 1.78 at 1730 (p. 25), Corollary 1.79 at 1742 (p. 26), Theorem D.3 at 21913 and Lemma D.4 at 21916 (p. 370), Theorem D.11 at 21995 (p. 372: G Polish, H separable metric, Borel homomorphisms continuous), Lemmas D.15–D.16 at 22013/22048, Lemma D.20 at 22158 (p. 375), Theorem D.23 at 22193 (p. 376), Proposition D.28 at 22546 (p. 383), Lemma D.37 at 23101 (p. 391), Lemmas D.42–D.43 at 23289/23304 (p. 395: weak = strong on `U(H)`, topological group, Polish for separable H; Borel iff coefficients Borel), Theorem 4.1 at 6878 (p. 110), Corollary 4.17 at 8204 (p. 129), Theorem 4.22 at 8422 (p. 132), Theorem 4.24 at 8504 (p. 133), Definition 4.26 at 8646 (p. 135), Lemma 4.28 at 8678, Theorem 4.29 at 8788 (p. 137), Theorem 5.9 and Lemma 5.10 at 10032/10051, Theorem 7.1 at 11708, Lemma 7.8 at 12233, Example 7.11 at 12255 (p. 198), Corollary 7.18 at 12490, Definition E.16 at 23770 and Theorem E.17 at 23776 (p. 405), Definition F.1 at 23897 (p. 409), Lemma F.20 at 24316 (p. 417), Theorem F.21 at 24349 (p. 418), Proposition F.26 at 24420 (p. 419), Proposition F.33 at 24642 (p. 423), Proposition I.1 at 27398 (p. 479), Proposition I.21 at 28406 (p. 494), Lemma 1.61 at 1262.
- `arici-mesland2019` lines 103–127: page 3, `T(f_n)=f_(n+1)`, Definition 2.1, relations (3), the extension (4) `0→K(ℓ²(ℕ))→T→C(S¹)→0`, "T_z corresponds to the unilateral shift" (D2.SequenceToeplitz, seeded).
- `delaharpe2007`: Definition 9 at 323–326, Corollary 12(i) at 367–368, Theorem 14 at 423–496, Dixmier remark at 856 (checked in r17, unchanged text).
- Araki, Relative Hamiltonian (Publ. RIMS 9, 1973): fetched through the sources service from the publisher's open archive (EMS Press, `publisher-open`; the service recorded it as `araki1973` in the board manifest; cache `08049dcf…`, cache page = printed page − 164). Proposition 4.1 at line 236 (expansion (4.1) over the simplex `s_i≥0`, `Σs_i≤1/2`, convergence dominated by `e^(‖h‖/2)‖Ψ‖` at 246, membership in the cone, strong continuity along strongly convergent sequences), Definition 4.2 and the sign remark at 307–318, Proposition 4.3 at 323 (the cocycle and `u_t σ_t(x) = σ'_t(x) u_t`), Corollary 4.4 at 385 (cyclic and separating), Proposition 4.5 at 419 (`Ψ(h)(−h)=Ψ`, chain law), Proposition 4.6 at 446 (uniqueness), Proposition 4.8 at 467 (`H_Ψ=−log Δ_Ψ`, formula with `j(h)=JhJ`), Proposition 4.12 at 578 (domain of `exp z(−H_Ψ+h)` for `Re z∈[0,1/2]`, holomorphy, continuity). The README's dictionary "Ψ(h) is Ω^h, H_Ψ is −log Δ_Ψ" matches line 467 and Proposition 4.12.
- The seeded targets with uncertified sources (D2.BoundedSequenceTranslation: Brown–Ozawa 5.1.3; Concrete Cuntz families: Cuntz §1) and the sourceless worked example (saddle flow) were checked by computation in the table.

**Adversarial table.** One row per statement; values computed this round (rows carried from r17 were recomputed where the text changed).

| Statement (README line / Lean) | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `exists_integratedOperator` (Lean 94; README 630) | G=ℤ, counting, `f=δ_0⊗a+δ_1⊗b`; μ=0; f=0 | `Σπ(f(n))U^nξ=π(a)ξ+π(b)Uξ`, bound `(‖a‖+‖b‖)‖ξ‖`; μ=0 gives T=0, bound 0≤0 | holds; measurability by inner regularity on the σ-finite support | none |
| Recovery of the pair (Lean 107; Check 722–726) | H=ℂ, L=0; G trivial, `A=ℂ²`, `L(x,y)=x` | 0 is nondegenerate only on H=0; `π=L`, `U=1` recovers L, `π` nondegenerate | matches Williams 2.40 | none |
| Exact sequence (Lean 122; Check 727–731) | G trivial; `A=ℂ²`, `I=ℂ⊕0`; I=A; I=0 | `0→I→A→A/I`; `C*(G)→C*(G)²→C*(G)` kernel = first summand; I=A: quotient 0, first map onto; I=0: first map from 0 | matches Williams 3.19 | none |
| `CentralCocycle.cocycle` (Lean 153) against `U_sU_t=π̃(ω(s,t))U_(st)` | associativity of `U_rU_sU_t` | `(U_rU_s)U_t=π̃(ω(r,s)ω(rs,t))U_(rst)`, `U_r(U_sU_t)=π̃(α̃_r(ω(s,t))ω(r,st))U_(rst)`; the Lean field is `α_r(ω(s,t)·α_r⁻¹(ω(r,st)a))=ω(r,s)(ω(rs,t)a)` | the law is exactly the one associativity needs; the reversed order `U_(st)π̃(ω)` would need `α̃_(st)` | none |
| ℤ/2 cocycle and cochain (Check 1024–1030) | `ω(a,a)=−1`, `b(a)=i` | `ω^b(a,a)=i·i·(−1)·1=1`; `T_bδ_a=iδ_a`, `(iδ_a)²=−ω(a,a)δ_e=δ_e` | direction ω^b→ω | none |
| Amenable full=reduced (Lean 213; Check 1288–1297) | G=ℤ, ρ=id; F₂, `h=δ_a+δ_(a⁻¹)+δ_b+δ_(b⁻¹)`; `ρ(z)=z⊕0` | multiplication by f̂, norm `sup|f̂|`; trivial character 4 vs `‖λ(h)‖=2√3`; `λ⊕0` has the kernel of λ | amenability needed, degenerate ρ allowed | none |
| `transitive_commutant_scalar` (Lean 229) | `I={p,q}`, ℤ/2 swap; I empty | `(f(p)−f(q))T_pq=0` kills off-diagonal; swap forces `d_p=d_q`; I empty: `ℓ²=0`, T=0=c·id | scalar | none |
| Matrix units `E_ij=M_(1_{i})U^(i−j)` (1707; Check 1747) | `Uδ_n=δ_(n+1)`; opposite shift | `E_ijδ_n=[n=j]δ_i`, `E_ijE_kl=[j=k]E_il`; opposite sign gives `δ_(2i−j)↦δ_i` | rank-one units | none |
| Band identity (1695–1699) | band-N T | `⟨δ_i,M_(f_k)U^kδ_j⟩=f_k(i)[i=j+k]`, sum gives `f_(i−j)(i)=⟨δ_i,Tδ_j⟩` | holds | none |
| No characters (1737–1739; Check 1752) | `p=M_(1_{2ℤ})` | `UpU*=M_(1_{2ℤ+1})=1−p`, `χ(p)=½∉{0,1}` | holds | none |
| Toeplitz corner (1804–1813; Check 1825) | `e=M_(1_[0,∞))` | `eUeδ_n=δ_(n+1)`, `eU⁻¹eδ_0=0`, `1−SS*` onto δ_0, `q(e)=1`, `q(eUe)=z` | matches arici-mesland (3), (4) | none |
| Saddle flow (1856–1888) | `{x>0,|xy|<ε}`; `B(0,δ)` | saturation of `B(0,δ)` is `{|xy|<δ²/2}` (branch `xy=r` meets `(√r,√r)`); the half-axis neighbourhood excludes the origin; +x and +y share quadrant-I branches `r<ε` | T₀, not T₁, not Hausdorff | none |
| D5.Fields varying dimension (2426–2431) | `N(x)={0}` (x<½), `{0,1}` (x≥½) | `E_10e_0=e_1∉span{e_0}`; `1_(x≥½)E_01` maps `H(x)` into `K(x)` | as stated | none |
| D5.Fields Borel condition (2432–2436) | non-measurable `S` | section `1_S(x)e_0` has coordinate `1_S` | hypothesis needed | none |
| Residue Cuntz family (Lean 361; Check 2794–2796) | n=1; n=2, `b_3` | `S_0=Id`; `S_0*b_3=0`, `S_1*b_3=b_1`, `(S_0S_0*+S_1S_1*)b_3=b_3`; `S_i*S_jb_k=[(nk+j)%n=i]b_k` | relations hold; `0<n` guards `/`,`%` | none |
| Fourier iso ℤ/2 (Lean 299; Check 2091) | `f=(f_0,f_1)` | `f̂=(f_0+f_1,f_0−f_1)`; `‖δ_e+δ_a‖=2`, `‖δ_a‖=1`; `(δ_a*δ_a)^=(1,1)` | holds | none |
| `C*(Ĝ)≅C₀(G)` direction (Lean 315; Check 2133) | G=ℤ, `f=z^(−n)∈C(𝕋)` | `t↦∫z^(−n)z^t dν=[t=n]`: canonical unitary at z ↦ `n↦zⁿ`; `s↦ev(s⁻¹)` would give `z^(−n)` | ev as stated | none |
| Dual measure (Check 2120) | ℤ/n, `f=δ_e` | `f̂≡1`, `Σ|f̂|²=n` vs `‖f‖₂²=1`, so `μ̂=(1/n)·counting` | as stated | none |
| Inversion conjugate (Check 2128) | ℤ/3, `f=δ_1` | `(1/3)Σ_χχ(1)conj(χ(x))=[x=1]`; without the conjugate `[x=−1]` | conjugate needed | none |
| LCAWeyl phase (Lean 346; Check 2212) | ℤ/3, `U_1` shift, `V=diag(1,ω,ω²)` | `U_1VU_1*e_t=ω^(t−1)e_t=conj(χ(1))Ve_t`; `VU_1V*=ωU_1` | `conj(χ(s))` right, not symmetric | none |
| V nondegenerate (Check 2218) | `φ_n` approximate identity | `‖V(φ_n)ξ−ξ‖≤sup_(supp φ_n)‖V_χξ−ξ‖→0` | strong continuity suffices | none |
| Takai sign (Check 2266) | ℤ/3, `ρ_1e_t=e_(t−1)` | `Ad ρ_1≠Ad ρ_(−1)` on `ℓ²(ℤ/3)`; equal on ℤ/2 | ℤ/3 detects the sign | none |
| `σ^ω̄_t=τ̄_(−βt)` (2888–2893) | `M_2`, `K=diag(0,1)`, Gibbs `h=e^(−βK)/Z`, `x=E_12` | V10 convention `σ_t(x)=h^(it)xh^(−it)=e^(iβt)E_12`; `τ_(−βt)(E_12)=e^(iβt)E_12`; `τ_(βt)(E_12)=e^(−iβt)E_12` | sign right | none |
| Strip map `z↦−βz+iβ` (2890) | β>0, KMS function G of (a,b) | `F(t)=G(−βt+iβ)=ω(τ_(−βt)(b)a)=φ(α_t(x)y)` with `x=b,y=a`; `F(t+i)=G(−βt)=ω(aτ_(−βt)(b))=φ(yα_t(x))`; `0≤Im w≤1` ↦ `0≤Im z≤β` | matches V10.KMS boundary values | none |
| Araki expansion (2952–2956) | Dyson series of `exp((A+B)/2)Ω`, `A=log Δ`, `AΩ=0` | term `Δ^(½−t_n)QΔ^(t_n−t_(n−1))⋯QΩ`; exponents `(½−t_n, t_n−t_(n−1), …, t_2−t_1)` are n nonnegatives with sum `½−t_1≤½`, a bijection with Araki's region (4.2); `Σ‖Q‖^n(½)^n/n!=e^(‖Q‖/2)` | as stated | none |
| Perturbed vector, finite dimensions (Check 3019–3026) | `M_n`, `Ω=ρ^(1/2)`, `log Δ=L(−βK)−R(−βK)`, `Q=−βP` | `exp((log Δ+Q)/2)Ω=e^(−β(K+P)/2)e^(−βK/2)e^(βK/2)/√Z_K=e^(−β(K+P)/2)/√Z_K`; `‖Ω^Q‖²=Z_(K+P)/Z_K≤‖e^(−βP)‖≤e^(|β|‖P‖)` | Gibbs state of `K+P` | none |
| `log Δ_(Ω^Q)=log Δ_Ω+Q−JQJ` (2964; Check 3026) | `Jx=x*`, `Q=L(q)` | `JL(q)Jx=(qx*)*=xq=R(q)x`; `L(−β(K+P))−R(−β(K+P))=log Δ+L(−βP)−R(−βP)` | holds; matches Araki 4.8 with `H=−log Δ` | none |
| Chain rule (2961) | finite dimensions, `Ω^Q=e^((−βK+Q)/2)/√Z_K` | `(Ω^Q)^(Q')=e^((L(−βK+Q+Q')−R(−βK+Q))/2)e^((−βK+Q)/2)/√Z_K=e^((−βK+Q+Q')/2)/√Z_K=Ω^(Q+Q')`; `Q'=−Q` gives Ω | holds | none |
| Dyson cocycle (2982–2985; Check 3027–3031) | `K=diag(0,1)`, `P=−diag(0,1)` | `u_t=L(e^(−iβt(K+P))e^(iβtK))=Γ_(−βt)`; `=diag(1,e^(iβt))`; `Ad(u_t)∘τ_(−βt)=Ad(diag(1,1))=id=τ^P_(−βt)` | holds | none |
| Perturbation sign (2937–2945; Check 3013) | `K=diag(0,1)`, `P=−diag(0,1)` | pinned `perturbed`: generator `δ+i[P,·]=0`, KMS state the trace `(½,½)` = Gibbs of `K+P=0`; opposite sign gives `diag(0,2)`, weights `(1,e^(−2β))` | consistent with `generator_perturbed` and `isKMSState_perturbed_iff_eq_gibbsState` | none |
| KMS analytic identity (Check 2994–2999) | `K=diag(0,1)`, `a=E_12`, `b=E_21` | `τ_(iβ)(b)=e^(−β)b`; `ω(aτ_(iβ)b)=e^(−β)/(1+e^(−β))=ω(E_22)=ω(ba)`; opposite sign `e^β/(1+e^(−β))` | sign pinned | none |
| Tensor products of KMS states (Check 3035–3042) | Gibbs of `K_1` at β, `K_2` at 2β | density ∝ `exp(−β(K_1⊗1+2(1⊗K_2)))`, KMS for the product dynamics only when `K_2` scalar | same β needed | none |
| Zero temperature (Check 3043–3046) | `K=diag(0,1)`, `diag(0,0,1)`, 0 | weights →`(1,0)`, `(½,½,0)`, normalized trace | `Tr(P₀·)/Tr(P₀)` | none |
| CAR KMS sign (Check 3207–3211) | `h₀=ε`, `a=E_12` | `τ_t(a(f))=a(e^(itε)f)=e^(−itε)a(f)=Ad e^(itK)(E_12)` for `K=diag(0,ε)`; `ω(a*a)=ω(E_22)=1/(e^(βε)+1)` | `S=(1+e^(βh₀))⁻¹` | none |
| Weyl signs (3121; Check 3212–3215) | `V=ℝ²`, `W(se_1)=e^(isx)`, `W(te_2)ψ(x)=ψ(x+t)` | `W(se_1)W(te_2)ψ=e^(isx)ψ(x+t)`, `W(te_2)W(se_1)ψ=e^(is(x+t))ψ(x+t)`; ratio `e^(−ist)=e^(−iσ(f,g))` | product law consistent | none |
| Weyl norm (3133–3149) | `W(−g)W(f)` | `=e^(iσ(g,f)/2)W(f−g)`, so `‖W(f)−W(g)‖=‖W(f−g)−z̄‖=2` by spectrum 𝕋 | holds | none |
| Ising norms (Check 3364–3369) | `Φ({x})=hσ_3`, `Φ({x,x+1})=Jσ_3⊗σ_3`, λ=1, d=2 | `M_λ=|h|+2|J|e^λ`, `M_(λ,2)=|h|+4·2|J|e^λ`; threshold `(½)/(1+8e)=1/(2+16e)` | as stated | none |
| On-site model (Check 3372–3375) | `Φ({x})=hσ_3` | `Z=(2cosh βh)^|Λ|`, `p=log 2cosh βh`; `⟨σ_3⟩=−tanh βh`, `e_Φ=−h tanh βh`; `s=log 2cosh βh−βh tanh βh`; `s−βe_Φ=p` | supremum attained | none |
| GHZ strong subadditivity (Check 3376–3379) | `(|000⟩+|111⟩)/√2` | `S(ABC)=0`, reduced AB and B are `diag(½,½)`-type: `log 2`; `0+log 2≤2log 2` | holds | none |
| Powers partition (Lean 250; Check 1659, 1667–1673) | `F={b}`, `w=ab²`; ℤ, `F={1}`, N=3 | `wbw⁻¹=aba⁻¹`; ℤ: C density ≤½ forces D ≥½ but three disjoint translates force ≤⅓ | two generators needed | none |
| Powers estimate (1589–1597) | `T_j=P_jT_j+(1−P_j)T_jP_j` | each sum `≤‖x‖/√N` by orthogonal ranges; N=1 gives `2‖x‖` | holds | none |
| Gauge action ℤ/2 (Check 1543–1548) | `γ(a)=−1` | `u_a↦−u_a`, `(x+α̂_γ(x))/2=x_0=E(x)`; `u_a↦iu_a`: `(iu_a)²=1≠−1` | fixed algebra ℂ1 | none |
| Twisted trace (Check 1549–1553) | `(ℤ/2)²`, `ω=(−1)^(ba')` | `u²=v²=1`, `uv=−vu`, `C*(G,ω)≅M_2`, `τ=Tr/2` | as stated | none |
| Convolution direction (Check 700–708) | ℤ/3 shift, `f=δ_1⊗e_0`, `g=δ_1⊗e_2` | `(f*g)(2)=e_0α_1(e_2)=e_0`; inverse convention `e_0e_1=0` | displayed convention | none |
| Gram matrix and induced inner product (Checks 810–820) | `M_2`, `x_1=E_11`, `x_2=E_12`; `x_1=−E_12`, `x_2=E_11` | `(x_i*x_j)=ww*` rank one positive; transposed has eigenvalue −1; displayed form gives 0, transposed gives −2 | conventions pinned | none |

**Ownership.** By object: this roadmap is the single owner of the central twisted products and the discrete scalar instance `C*(L,c)` (R02 records the two later claimants), the Borel prefix objects (consumed by NoncompactQuantumSymmetry), the KMS simplex, Araki's perturbations on the standard form (no other roadmap on main or at an open head mentions them; `roadmaps grep` for Araki finds only Araki–Woods in VonNeumannAlgebras), the uniform Roe model `ℓ∞(ℤ)⋊ℤ`, the Powers argument, quantum relative entropy with strong subadditivity and the thermodynamic limit (grep finds only Subfactors' relative entropy of inclusions). D6's finite `O_n` is recorded as this roadmap's by FreeProbability (line 80) and OperatorKTheory (238).

## Not verifiable

- Brown–Ozawa, Proposition 5.1.3; Cuntz 1977, §1; Bratteli–Robinson vols. 1–2 (Lemma 4.1.19–Theorem 4.1.25, §§5.2–5.4, 6.2); Renault, LNM 793; Rudin, Theorems 1.5.1, 1.6.1, 1.7.2 and §2.6: settled as uncertified or not legally readable (Rudin is a Wiley book with no open copy; the service found none), cited by locator. The uniform Roe model, the Cuntz relations, the KMS, Gibbs and perturbation signs were checked by computation above.
- The board package has no `design/plan.json`, so the gap slugs are declared only in the README.
- The repair reports for rounds 18 and 19 are not in the job directory, so whether r17 R08 was marked not actionable could not be read; it is re-raised as R03 on the unchanged description.

## Source issues

- none

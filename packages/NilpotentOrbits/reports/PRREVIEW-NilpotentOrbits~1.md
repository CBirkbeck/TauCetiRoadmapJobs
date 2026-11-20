# Review of NilpotentOrbits (pull request #2628 at 6b6f99a)

**Verdict:** needs changes

**Summary.** The mathematics is correct: every Check and worked example recomputes, and all five statements of `Suggested.lean` are true. Two ownership problems block acceptance. The Lean headlines are now stated over every algebraically closed field of characteristic zero, but every route here runs over ℂ, and this README's own Scope gives the passage to other fields to SpringerResolutionAndCharacteristicCycles. Separately, §0.1 now plans `Ad(G(ℂ)) = Int(𝔤)`, which LieHighestWeightPartII §0.2 already owns. Two further findings: two parts of the headline theorems can be stated at the pins but are missing from `Suggested.lean`, and none of the headline theorems has a source locator. There are also two small corrections and two format notes; nothing is left for a human to decide.

## R01 (P2) — The Lean headlines claim every algebraically closed field of characteristic zero, but the README only plans them over ℂ, and the passage to other fields belongs to another roadmap

An implementer asked to prove `nilpotentConeIdeal_isPrime` or `isIntegrallyClosed_quotient_nilpotentConeIdeal` over a general `K` finds no route to follow.

All five theorems of `Suggested.lean` (lines 72–117) take `[Field K] [CharZero K] [IsAlgClosed K]`. So do Convention 3 (lines 99–102) and the sentences of §2.3 (line 479), §2.4 (line 508), §5.0 (line 680) and §7.2 (line 942) that announce them. Every route, however, runs through a complex group:

- Convention 1 (line 79) fixes `G` over `ℂ`.
- §5.0 (line 675) uses the Kostant slice of FormalConnectionsOpers §4.3, which that roadmap builds for an affine group `G = Spec H` over `ℂ` (its README, line 1627).
- §7.2 (line 935) proves normality "for `G` semisimple over `ℂ`".

No section plans the step from ℂ to `K`, and on main the roadmap was entirely complex. That step is owned elsewhere. SpringerResolutionAndCharacteristicCycles §6.1 (its README, line 639) owns geometric reducedness of this zero fibre "for every split connected reductive G over every characteristic-zero k", by passing through ℂ and this roadmap's §5.0. This README agrees: its Scope (lines 1172–1173) gives that roadmap "the extension of the Springer geometry to other fields", and Downstream consumers (lines 1120–1121) says the same.

The smallest repair is to state the five theorems over `ℂ` (`[LieAlgebra ℂ L]`, with `K` and its two instances dropped) and to say ℂ in Convention 3 and the four sentences above. The forms over other fields then stay with SpringerResolutionAndCharacteristicCycles. The alternative is to keep `K` and add a target with a route from ℂ to `K`. That moves ownership away from SpringerResolutionAndCharacteristicCycles §6.1, and the description should name the move.

## R02 (P2) — §0.1 plans `Ad(G(ℂ)) = Int(𝔤)`, which LieHighestWeightPartII §0.2 already owns

The same comparison would be built twice, by the same route, in two roadmaps.

§0.1 (lines 159–166) asks to prove that `Ad(G(ℂ))` is `TauCeti.intLieAlgebra ℂ 𝔤`, using exponentials of nilpotents in one direction and generation by root subgroups and coroot images in the other. LieHighestWeightPartII (on main) states the same theorem in its §0.2 (its README, line 157) for a connected semisimple `G` over any algebraically closed field of characteristic zero, by the same route. Its Scope (line 7) lists the comparison among the objects it owns. This README never mentions it.

The repair is to replace the proof plan in §0.1 with a citation of LieHighestWeightPartII §0.2, whose statement covers `K = ℂ`, and to add that roadmap to the *Needs:* line and the supplier contracts. LieHighestWeightPartII §0.2's own *Needs:* names only ReductiveGroups and Tau Ceti, so this creates no cycle between sections. The dependency check, run on a copy of this README with that citation added, reports no problem.

There is a related overlap. LieHighestWeightPartII (line 12) says the only difference between its §0.3 and §§2.2 and 2.4 here is that it works over every algebraically closed field of characteristic zero, with `Int(L)`. That is exactly the setting the finiteness headline has now moved into. Restricting the headlines to ℂ, as R01 suggests, keeps the two roadmaps apart.

## R03 (P2) — Two parts of the headline theorems can be stated at the pins but are missing from `Suggested.lean`

The acceptance test covers less than the overview promises, and the module docstring gives a reason for one omission that the file itself refutes.

The first is the subregular stratum. The docstring (lines 27–28) calls it not statable because the closure of an orbit has no carrier "other than an encoding through vanishing ideals". Yet the file's own density theorem (lines 78–89) is stated with exactly that encoding. A statement of the following form elaborates against the pins (checked by elaborating it against the pinned libraries):

- for `[LieAlgebra.IsSimple K L]`, there is an `ad`-nilpotent `e` with `finrank K (ker (ad K L e)) = LieAlgebra.rank K L + 2`;
- every `ad`-nilpotent `x` with that centralizer dimension lies in `MulAction.orbit (TauCeti.intLieAlgebra K L) e`;
- every polynomial function that vanishes on that orbit vanishes at every nilpotent element that is not `IsCentralizerRegular`.

The second is the complete-intersection statement. The overview (lines 18–19) and §5.0 make "generated by a regular sequence of `r` homogeneous invariants" part of Kostant's theorem. The docstring neither states it nor names it as not statable. Mathlib's `RingTheory.Sequence.IsRegular` (`RingTheory/Regular/RegularSequence.lean:147`), which §5.0 already cites, states it. The following elaborates: there is `rs : List (SymmetricAlgebra K (Dual K L))` of length `LieAlgebra.rank K L`, all invariant, with `Ideal.ofList rs = nilpotentConeIdeal K L` and `RingTheory.Sequence.IsRegular _ rs`.

The repair is to add both statements, in the field generality R01 settles, and to remove the subregular bullet from the docstring's list of statements that are not statable.

## R04 (P2) — None of the headline theorems, or the theorems this roadmap owns, has a locator into a source

A reader cannot check that the cited literature supports these statements with these hypotheses, and the project's sourcing contract is not met.

The README has three references. Bertoloni Meli–Imai–Youcis is cited for the unipotent variety and the exponential (§§5.1–5.2). Lehn–Namikawa–Sorger is cited for the slice setup and the non-simply-laced surface types (§§6.1, 8.3). Goodwin–Hille–Röhrle is cited without a locator (§9.2). No locator at all supports the following:

- the finiteness and open-orbit argument (§2.2);
- density of the regular orbit and `dim 𝒩 = dim 𝔤 − r` (§2.3);
- the subregular orbit (§3.1);
- Kostant's reducedness and complete intersection (§5.0);
- the Springer resolution (§7.1);
- normality (§7.2);
- the minimal resolution over a slice (§7.3);
- Brieskorn's ADE identification and the `−2`-curves (§§8.1–8.2);
- the decomposition `C_G(e) = C_G(e, h, f) ⋉ U` (§9.1).

The repair is to give each of these a locator into a source that proves it and to record it in the manifest. The README's own sources point to suitable texts:

- Bertoloni Meli–Imai–Youcis (§2.1, p. 5) cite Jantzen's 2004 notes (§§6.1, 6.2, 6.4) and Kostant 1963 for integrality, dimension and normality of the cone.
- Lehn–Namikawa–Sorger cite Kostant, Slodowy §5.2 and Premet §5 for the slice fibres (p. 4), and Brieskorn and Slodowy §8.7 for the ADE theorem (p. 2).
- Goodwin–Hille–Röhrle §2.2 (Table 1 and Example 2.1, pp. 4–5) states the component-group actions of §9.2 and that the `G₂`, `C₃` and `D₄` curves coincide. It can be cited at that locator.

## C01 — The README does not map the former numbering, which other roadmaps on main still cite

The following roadmaps cite this one as `N0.2`, `N0.3`, `N1`, `N2.1`, `N2.2`, `N2.4`, `N4` and `N5.0`–`N5.2`:

- on main: LieHighestWeightPartII (lines 11–13 and 31–37), LanglandsParameterStacks (lines 21, 87, 441 and 449) and SpringerResolutionAndCharacteristicCycles (lines 15, 128 and 639–692);
- in open pull requests: GlobalShtukasAndFunctionFieldLanglandsPartII and QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups.

Only the description says that `Nk.n` is now `§k.n`. One sentence in the README would keep those citations valid, for example: "Sections cited as `Nk.n` are §k.n here, and `Nk` is Layer k."

## C02 — The description says that no planned mathematics changed, but the head changes the field

The description says: "None of the planned mathematics changed" and "The statements about the Lie algebra alone are stated over any algebraically closed field of characteristic zero, which includes the old setting over ℂ". On main the roadmap was over ℂ throughout, and the head generalises the Lie-algebra statements and all of `Suggested.lean` to every algebraically closed field of characteristic zero (see R01). Once R01 is settled, the text should say which setting the head uses. If the generalisation is kept, for example: "The Lie-algebra statements and the five theorems of Suggested.lean are generalised from ℂ to every algebraically closed field of characteristic zero."

## N01 — Three supplier headings use the wrong namespace

The headings `From TauCetiRoadmap.LieHighestWeight`, `From TauCetiRoadmap.RootSystems` and `From TauCetiRoadmap.LieGroups` (lines 1306, 1314 and 1324) omit the `RepresentationTheory` level where these roadmaps live.

## N02 — Layer 7's Dependencies line omits Layer 2

The line (line 975) says "Layers 1, 3, 5 and 6", but §7.1 needs §2.3, and of Layer 5 only §5.0 is used.

## Verified sound

| Target | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.1 Ad(G(ℂ)) = Int(𝔤) | torus generation | coker(Q^∨⊗ℂˣ → X_*⊗ℂˣ) = (X_*/Q^∨)⊗ℂˣ = 0; true | true; duplicates LieHighestWeightPartII §0.2 (R02) |
| 0.2 Checks | sl₂, gl_n | D²[e,f] = 0 vs [4e,f]+[e,4f] = 8h; I = (I,0) = (0,I) | hold |
| 0.3 orbits | sl₂, e = E₁₂ | ker ad e = ℂe; [𝔤,e] = ⟨e,h⟩; dim O = 3−1 = 2 | holds; Tau Ceti decls present (Adjoint/Orbit.lean) |
| 0.4 component groups | SL₂, PGL₂, sl₃ | C_SL₂(E₁₂) = {±[[1,t],[0,1]]}, A = ℤ/2; PGL₂ connected; dim C(diag(1,1,−2)) = 4 > 2 | holds |
| 1.1 Checks | ℂ[ε]/ε², sl₃ | X² = εI, X⁴ = 0, det X = −ε; ideal of entries of X³ has no degree-2 element, tr X² ∈ radical | hold |
| 1.2 incidence | PGL₂ | fibre Hom(ℂ²/ℓ, ℓ) = O(−1)⊗O(−1) = O(−2); dim 2 | holds; no locator (R04) |
| 2.1 Kostant conjugacy | Tau Ceti JacobsonMorozov.lean:228, ExpAdSubgroup.lean:61 | generators exp ad y, y ∈ ker ad e ⊓ range ad e; SL₂→PGL₂ kernel {±I} | matches README |
| 2.2 Checks | sl₃ triples | (diag(1,−1,0),E₁₂,E₂₁): α₁ = 2, α₂ = −1; sorted (1,0,−1) → (1,1); regular (2,2) | hold |
| 2.3 regular orbit | sl₃, sl₂, L = 0 | E₁₂+E₁₃ rank 1, square 0, type (2,1), centralizer 4 ≠ 2; dim 𝒩 = 6, 2, 0 | holds; no locator |
| 2.4 finiteness | sl₃, L = 0 | orbit dims 0, 4, 6; one orbit {0} | true; Lean over K, route over ℂ (R01) |
| 3.1 subregular | sl₃, sl₂, G₂ | E₁₂ centralizer 4 = r+2, orbit 4 = 6−2; {0} = 2−2; 12 − 2 = 10 | holds; absent from Lean (R03) |
| 3.2 products | sl₂×sl₂ | complement = {0}×𝒩 ∪ 𝒩×{0}, two 2-dim components, codim 2 in dim 4 | holds |
| 4.1 Check | GL₂(ℝ) vs SL₂(ℝ) | gE₁₂g⁻¹ = −E₁₂ ⇒ r = 0, p = −s, det = −s² < 0 | holds |
| 4.2 Checks | gl₃, gl₆, sl₄ | (3,1,1,1)′ = (4,1,1): 18; (2,2,2)′ = (3,3): 18; ranks (2,1) vs (3,0); sl₄ dims 12,10,8,6,0 | hold |
| 5.0 cone ideal | sl₂, sl₃, gl₂ | a²+bc irreducible; tr X², det X of degrees 2, 3, length 2 = r; tr, det cut out the sl₂ cone | holds; no locator |
| 5.1 unipotent scheme | 𝔾_m two reps, SL₂ | J = (t−1); −(t+t⁻¹−2)T = −((t−1)²/t)T; t = 1+ε admitted, then excluded; −I: (T+1)² | holds; MIY22 p. 5 (Springer's reduced U) |
| 5.2 exp/log | u = I+E₁₂+E₂₃; SL₂ | c_u(2) = I+2X+E₁₃ = u²; c_u′(0) = X−E₁₃/2 = log u; det(I+X) = 1−a²−bc = 1 | holds; MIY22 Prop. 2.3 (H reductive, char-0 field) |
| 6.1 slice | sl₂ | S = [[0,1],[t,0]], a²+bc ↦ t; S∩𝒩 = {e}, dim 0 = 1−1; weight on f = 4 | holds; LNS10 §2 p. 3: ρ_t = t²λ_{t⁻¹}, weight 2−d |
| 6.2 sl₃ slice | e = E₁₂ | tr Y² = 6a²+2b; det Y = −2a³+2ab+cd; on 𝒩, cd = 8a³ ⇒ xy+z³ | holds (A₂) |
| 6.2 Check 2 | SL₂, u = I+E₁₂ | Ad(u)(e+tf) = [[t,1−t],[t,−t]] ∉ S for t ≠ 0 | holds |
| 7.1 Springer fibre | sl₃, E₁₂ | im = ⟨e₁⟩, ker = ⟨e₁,e₃⟩; V₁ = ⟨e₁⟩ or V₂ = ⟨e₁,e₃⟩; two ℙ¹ meeting at one flag | holds; no locator |
| 7.2 normality | sl₂, L = 0 | quadric cone, singular locus codim 2; K integrally closed | true; Lean over K, route "over ℂ" (R01) |
| 7.3 restricted resolution | sl₂, e = 0 | zero section of T*ℙ¹: self-intersection deg T*ℙ¹ = −2 | holds |
| 8.1 D₃ Check | D₃ equation | z²+y²z = (z+y²/2)²−y⁴/4 ⇒ x²+u²−y⁴/4, an A₃ equation | holds |
| 8.2 Cartan dets | A_m, D_m, E₆–E₈ | m+1; 4; 3, 2, 1; det(−C_{A_m}) = (−1)^m(m+1); Mathlib `CartanMatrix.E_det` (Cartan/Basic.lean:376): 9−n for n ≥ 3 | hold |
| 8.3 non-simply-laced | B₂/C₂, C₁ | B₂→A₃, C₂→D₃ = A₃; C₁ would give D₂ = A₁×A₁ | holds; LNS10 p. 3 lists A_{2n−1}, D_{n+1}, E₆, D₄ |
| 9.2 diagram action | G₂, C₃, D₄ | G₂: D₄ with S₃; C₃: D₄ with S₂; D₄: trivial | holds; GHR06 §2.2 Table 1, p. 5 |
| 9.3 folding | B₃, E₆ | A₅ fixed-Lie folding gives C₃, not B₃; E₆ orbits {1,6},{3,5},{4},{2} | holds |
| `nilpotentConeIdeal` | L = 0, sl₂ | S(0) = K, ideal 0, quotient K; (a²+bc) | correct object |
| H `finite_orbits_isNilpotent_ad` | L = 0, sl₂ | {{0}}; {0} and 𝒩∖0; ℚ-structure unique | true; route only over ℂ (R01) |
| H density | L = 0, sl₂ | x = 0 regular when L = 0; 𝒩∖0 dense in an irreducible cone | true |
| H `ringKrullDim` | L = 0, sl₂, sl₃ | 0 = 0−0; 2 = 3−1; 6 = 8−2; rank ≤ finrank, so no ℕ junk | true |
| H prime | L = 0, sl₂×sl₂ | (0) ⊂ K prime; quotient a tensor product of domains over algebraically closed K | true |
| H integrally closed | sl₂ | A₁ cone: Cohen–Macaulay hypersurface, singular locus codim 2 ⇒ normal | true |
| H regular sequence (absent) | sl₃; probe | (tr X², det X), length 2 = r; probe elaborates | statable (R03) |
| H Springer, exponential, ADE (not statable) | Tau Ceti pin | no flag-variety scheme or representability in `Fppf/Quotient/Homogeneous/`; no completed surface germs | docstring accepted |

- Source locators checked against the text: 5 (MIY22 §2.1 and Prop. 2.3, p. 5, lines 185–262; LNS10 introduction, pp. 1–3, and §2, pp. 3–4; GHR06 §2.2, pp. 4–5).
- Library declarations opened at the pins: `TauCeti.intLieAlgebra` (InnerAutomorphismGroup.lean:70), `LieAlgebra.IsCentralizerRegular` (Regular.lean:102), `TauCeti.isNilpotent_ad_iff_forall_lift_eval_eq_zero` (InvariantZeroLocus.lean:77), `lieInvariants` (LieModule.lean:171), `TauCeti.expAdSubgroup`, `IsSl2Triple.exists_lieEquiv_apply_eq`, `exists_isSl2Triple_iff_sub_mem`, `exists_isSl2Triple_of_isNilpotent_ad`, `dominantNeutralElements`, `weightedDynkinDiagram_injective`, `exists_mem_intLieAlgebra_smul_mem_dominantNeutralElements`, `vanishingIdeal_setOfPred_isCentralizerRegular_eq_bot`, `mem_closure_orbit_iff_forall_rank_pow_le`, `nilpotentExpUnit_mem_hopfIdealPointsSubgroup_iff`, `lieChevalleyRestrictionIso`, `TauCeti.LieAlgebra.jordanDecomposition`, `IsNilpotent.normedSpace_exp_eq_exp`; Mathlib `CartanMatrix.E_det`, `MvPolynomial.vanishingIdeal_zeroLocus_eq_radical`, `NormedSpace.exp_eq_tsum_rat`, `RingTheory.Sequence.IsRegular`, `LieAlgebra.IsSimple`. All 129 qualified names of the README located at the pins.
- Cross-roadmap citations resolved on main: ReductiveGroups Layers 0–8, 3A, 5P, 6A, 9A.1b, 11C; FormalConnectionsOpers §§2.4, 4.3; LieHighestWeight Layer 7; RootSystems §§5.2, 6.1; ReflectionInvariantTheory §§1, 3; LieGroups Layers 0, 3, 7; CharacteristicClasses §5.1; ComplexKahlerGeometry §3.1 and Layer 1; ComplexComparisonPartII §C-1.1; all present.
- Automatic checks: all passed. Dependency check output: `depcheck: 200 roadmaps, 2202 edges, 0 problem(s)` (with a citation of LieHighestWeightPartII §0.2 added on a copy of the README: 2203 edges, 0 problems).
- Elaboration: `lake env lean` on `Suggested.lean` gives only the five `sorry` warnings. Elaborated signatures were compared with the README statements, and no binder was lost. One-tactic padding probe, decided by reading (none of the five is a library lemma; Loogle and LeanSearch leads checked): no padding. Probe file with the two statements of R03: elaborates.
- Overlap check: read LieHighestWeightPartII, LieHighestWeight, ReductiveGroups, ReflectionInvariantTheory, RealSemisimpleLieGroups, AdoIwasawa, and the consumer SpringerResolutionAndCharacteristicCycles. Shared: `Ad(G) = Int(L)`, owner LieHighestWeightPartII §0.2 (R02); the cone results over other characteristic-zero fields, owner SpringerResolutionAndCharacteristicCycles §6.1 (R01); nothing else.
- Ownership against open pull requests: checked against the open roadmap heads; no open pull request changes this roadmap; the revision touching LieHighestWeightPartII is a reordering and is not a dependency.

Source independence: 10 passages compared with 3 sources (README §§1.1, 5.1, 5.2, 6.1 twice, 7.1, 8.3, 9.2, the overview and the docstring of `nilpotentConeIdeal`, against MIY22 lines 185–262, LNS10 lines 15–133 and GHR06 lines 20–30 and 136–187); no run of more than three shared words beyond forced formulas and type lists. Largest share: MIY22 and LNS10, 2 of 5 locators each. Contents compared with both (MIY22: preliminaries and then Langlands parameters; LNS10: slices, Q-factoriality, simultaneous resolutions, Poisson deformations, types): independent.

Research link: Layer 5's exponential isomorphism is Proposition 2.3 of Bertoloni Meli–Imai–Youcis (2022), used there for the Jacobson–Morozov morphism of Langlands parameters. Layers 6–8 are the slice, Springer and subregular-surface setup that Lehn–Namikawa–Sorger (2010) use for universal Poisson deformations. This rests on the README's references and on MIY22 §2.1 and LNS10 §§1–2.

## Not verifiable

- Kostant 1963, Slodowy 1980 (LNM 815) and Jantzen 2004: not cited by the README; they were named only as pointers found in its sources, and were not opened.

## Source issues

- **Misprint** in MIY22 at §2.1, p. 5: the source says the nilpotent variety is the unique reduced subscheme whose k-points are the nilpotent elements; it should say whose k′-points are, for every extension k′ (k-points do not determine it when k is not algebraically closed); affects nothing.
- **Gap** in MIY22 at Proposition 2.3, proof of (1), p. 5: the source checks bijectivity of exp on k-points before applying Zariski's main theorem; it should check it on points over an algebraic closure, after base change; affects the proof.

## For the human reviewers

- none

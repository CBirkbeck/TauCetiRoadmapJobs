<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2099#issuecomment-6406117089 -->
Review (claude) of d1776cf

Verdict: needs changes

1. **F01** (P2) 3.5's route starts from the prime-field Milnor conjecture, which nothing owns

   **Location.** `README.md` §3.5 (line 1105): "The route chooses `k` the prime field, where `sₙ` is an
   isomorphism by Milnor's computation (Morel, proof of Theorem 1.1 from Theorem 1.3, p. 66, citing
   Milnor)"; `*Needs:*` line 1112–1115.

   **Claim.** The proof of `exists_addEquiv_quotient_fundamentalIdeal_pow` runs Morel's Theorem 1.3 with
   `k` the prime field, whose hypothesis `H1(N)` is that `sₙ(k) : Kₙᴹ(k)/2 → Iⁿ(k)/Iⁿ⁺¹(k)` is an isomorphism
   in every weight (morel line 106, 130–133). For `k = ℚ` this is a theorem of Milnor, used here but
   proved nowhere: it needs both `Kₙᴹ(ℚ)/2` and `Iⁿ(ℚ)/Iⁿ⁺¹(ℚ)` in every weight.

   **Witness.** The only supplier named for it is `K2SymbolsBrauer` §10.32 (at its open head: "For a
   number field `F` … and `n ≥ 3`, `Kₙᴹ(F)` is `(ℤ/2)^{r₁}`"; its Check says "Degree two is excluded").
   Nothing provides the Witt-ring side: `QuadraticFormInvariants` on main has no computation of `W(ℚ)`,
   `Iⁿ(ℚ)` or a residue sequence (grep for `W(ℚ)`, "second residue", "Milnor's exact sequence": no hit), and
   the pinned Tau Ceti `Witt/` directory has no residue map or rational-field computation. `milnor70` is
   uncertified and cited through Morel; a citation is not a supplier. The 𝔽_p case is elementary
   (`I²(𝔽_p) = 0`, `Kₙᴹ(𝔽_p) = 0` for `n ≥ 2`, weight one by `TauCeti.signedDiscrHom`) but is not stated
   either.

   **Repair.** Add a target to Layer 3 before 3.5 (say "3.4a The Milnor conjecture for the prime fields"):
   for `k = 𝔽_p`, `p` odd, and `k = ℚ`, `sₙ(k)` is an isomorphism for every `n`. Route for `ℚ`: the split
   exact residue sequence `0 → W(ℤ) → W(ℚ) → ⊕_p W(𝔽_p) → 0` (second residue maps at every prime, `p = 2`
   included, built with the DVR machinery of 2.7 and the Hensel/Springer decomposition of `W` of a
   complete discretely valued field) and the signature at the real place give `I/I² ≅ ℚˣ/ℚˣ²`,
   `I²/I³ ≅ ℤ/2 ⊕ ⊕_p ℤ/2` and `Iⁿ/Iⁿ⁺¹ ≅ ℤ/2` for `n ≥ 3`; the Bass–Tate sequence (`K2SymbolsBrauer`
   §10.5, `Kₙᴹ(ℚ) → ⊕_p K_{n−1}ᴹ(𝔽_p)`) and §10.32 give the same groups on the `K`-side, and `sₙ` commutes
   with the residues (a stated compatibility). Give it exact hypotheses, three Checks (`n = 1`: squares;
   `n = 2`: `{−1, −1}` and `{p, q}`; `n = 3`: `{−1, −1, −1}` detected at the real place) and a locator
   (Milnor 1970 under the settled key `milnor70` for the statement; a certified text for the residue
   sequence and the computation of `W(ℚ)` is to be fetched through the sources service, for instance
   Milnor–Husemoller, *Symmetric bilinear forms*, Chapter IV, §3, or Lam's *Introduction to quadratic forms
   over fields*, Chapter VI). Then cite it in 3.5's `*Needs:*` in place of the bare "by Milnor's
   computation". Alternatively declare it as a supplier gap on `QuadraticFormInvariants` (its Layer 4
   owns the Witt ring) with a `needs` sentence saying exactly the above; either way the route no longer
   rests on a citation.

2. **F02** (P2) The principal-unit criterion is an end theorem, statable at the pins, and absent

   **Location.** `README.md` line 19–20: "The end theorems are the Hauptsatz, the invariant-zero
   criterion, the three Dittmann–Pop criteria and the openness theorem"; §4.2 (lines 1255–1259);
   `Suggested.lean` docstring lines 16–27 and 29–44.

   **Claim.** The README names three Dittmann–Pop criteria as end theorems: unit reduction (4.1), the
   principal-unit criterion (4.2) and the independent-value criterion (4.3). `Suggested.lean` states 4.1
   and 4.3 (`quadraticPfister_isotropic_tfae_of_independent_values`) and does not state 4.2, nor does
   its docstring name it among the headlines not statable. Every carrier 4.2 needs is already used by
   the stated H8 (`quadraticPfister`, `ValuationSubring`, `HenselianLocalRing`, `IsLocalRing.residue`), so
   it is statable at the pins. The author's package report chose to keep it as a README target because
   it is "a two-line corollary of H8"; the README's own Summary contradicts that choice.

   **Witness.** dp line 264 (Proposition 3.2(1)); README line 20 versus the docstring's list, which
   mentions only "Dittmann–Pop's independent-value criterion" for Layer 4.

   **Repair** (tested: the statement below elaborates on a copy of `Suggested.lean` with only the `sorry`
   warning). Add after H8, in Layer 4:

   ```lean
   /-- **The principal-unit criterion** (Dittmann–Pop, Proposition 3.2(1), pp. 6–7), over a field with a
   henselian valuation ring `O`: if some outer slot of a unit Pfister form `⟨⟨ε⟩⟩_b ⊗ [1, a₀]`, with
   `1 − 4a₀` a unit, reduces to `1`, the form is isotropic over `K`. -/
   theorem not_anisotropic_quadraticPfister_of_residue_eq_one {K : Type u} [Field K]
       (O : ValuationSubring K) [HenselianLocalRing O] {m : ℕ} (ε : Fin m → Oˣ) (a₀ : O)
       (ha₀ : IsUnit (1 - 4 * a₀)) (i : Fin m) (hi : IsLocalRing.residue O (ε i : O) = 1) :
       ¬ (quadraticPfister (fun j => Units.map O.subtype.toMonoidHom (ε j)) (a₀ : K)).Anisotropic := by
     sorry
   ```

   and name it in §4.2 ("State `not_anisotropic_quadraticPfister_of_residue_eq_one`: …") and in the
   docstring's list for Layer 4. The hypothesis `m ≥ 1` of the README is carried by `i : Fin m`. If
   instead the author prefers not to state it, the Summary must stop calling it an end theorem ("the
   two Dittmann–Pop criteria of 4.1 and 4.3, with the principal-unit corollary 4.2"), and the docstring
   must say that 4.2 is a corollary kept in the README; the brief's rule is that a statable headline is
   either stated or not a headline.

3. **F03** (P3) 1.1's comparison bullet drops the nonsingularity clause

   **Location.** `README.md` §1.1 API, line 607: "comparison: with `2` invertible it is isometric to the
   parent's `⟨⟨a₁, …, aₘ, 1 − 4a₀⟩⟩`".

   **Claim.** The parent's form has unit slots (`TauCeti.pfisterForm` takes `Fin m → Kˣ`), so the bullet
   needs `1 − 4a₀ ≠ 0`; the prose sentence above it (line 592) has the clause, the API bullet does not.

   **Witness.** `m = 0`, `K = ℚ`, `a₀ = 1/4`: `quadraticPfister ![] (1/4) = x² + xy + y²/4 = (x + y/2)²`, of
   rank one; `⟨⟨0⟩⟩` is not a parent form.

   **Repair.** "comparison: with `2` invertible and `1 − 4a₀ ≠ 0` it is isometric to …".

4. **F04** (P3) Locator: EKM Example 7.23 is on p. 44

   **Location.** `README.md` §1.1 Checks, line 622: "(EKM, Example 7.23, p. 45)".

   **Claim and witness.** The whole example, including the identity `[c, a] ⊥ [c, b] ≃ [c, a + b] ⊥ ℍ`,
   is at ekm lines 2448–2452, on the page whose printed number is 44 (the page break to 45 is at line
   2463). **Repair.** "p. 44".

5. **F05** (P3) 3.2 asserts the degree-two isomorphism without an owner

   **Location.** `README.md` §3.2, line 1024: "an isomorphism in degrees at most two (Morel, p. 64,
   recalling Milnor)".

   **Claim.** `s₂ : K₂ᴹ(F)/2 ≅ I²/I³` for every field is Milnor's theorem, not a consequence of anything
   stated in Layer 3 before 3.5, and no API bullet or Check of 3.2 carries it; a citation is not a
   supplier. The route of 3.5 does not use it for general `F` (Morel's induction needs only the prime
   field, R01). **Repair.** Cut the clause (3.5 delivers it in every degree), or move it to the new
   prime-field target of R01 where it is needed for `k = ℚ`, `n = 2`.

Reviewed at the pull request's head `d1776cf`: `packages/QuadraticFormInvariantsPartII/README.md`
(1745 lines), `Suggested.lean` (231 lines, 16 declarations), `metadata.toml`, `sources.toml` (9 sources),
against the design `design/README.md` and `design/plan.json` (one declared gap). Pins: the content
checkout's `lake-manifest.json` (Mathlib and Tau Ceti as pinned there). First review; no earlier findings
to re-check.

Two blocking findings (P2), three notes (P3). The mathematics of the ten stated headlines held up
under the adversarial pass; the blocking items are an unowned input of the Milnor-conjecture route
(3.5) and a statable end theorem (the principal-unit criterion) absent from `Suggested.lean`.

## Verified sound

**Principles.** No route-specific shortcut (Layer 4 is stated for every henselian valuation, Layer 2
in every characteristic, Tsen–Lang without finite generation); the parent `QuadraticFormInvariants`
is built on, not re-planned (its Scope on main, lines 62 and 1310, excludes exactly the Hauptsatz,
the Milnor conjecture and function-field methods that this roadmap owns); no copied passage (every
sampled statement is restated); no algorithm; no sorry'd data, no `set_option`, no `lemma`, no
LaTeX delimiter, no pull-request number, no process word (grep counts 0 each).

**Elaboration.** `lake env lean` on `Suggested.lean` from the content checkout, after `lake build` of
the four imported Tau Ceti modules (all built: 2415, 1849, 3331 and 3019 jobs): exit 0, exactly ten
`declaration uses 'sorry'` warnings (lines 69, 78, 100, 110, 120, 145, 160, 176, 197, 220), nothing
else. Binder check: `#check @name` for all 16 declarations in one scratch file; every elaborated
type carries exactly the binders of its README statement (no section `variable`s exist, so nothing
can be dropped); the only universe choice worth noting is `R L : Type u` in H10, justified in
Conventions and sound (the compositum `K ⊗_k R` is a field in the universe of `K`).

**Padding probe.** Each sorried theorem tried with `first | rfl | simp | infer_instance | exact?` on a
scratch copy: none closed (seven `exact?` failures, two "unsolved goals", one heartbeat timeout
inside the probe of H3). The six definitions are each needed by a stated headline. No `example`.

**Dependency check.** `tauceti-roadmap gate --depcheck … --movable` output: `depcheck: 56 roadmaps,
646 edges, 0 problem(s)`. No UPWARD or CYCLE line. Merge order: this roadmap at line 315, its
consumer `LogicAndDefinabilityInNumberTheoryPartII` at 316; every supplier named in `*Needs:*` lines
is on main (`QuadraticFormInvariants`, `ProfiniteCohomology`, `ClassFieldTheory`, `AdicSpaces`,
`RealAlgebraicGeometry`, `SchemeAndStackFoundations`) or earlier in the order (lines 2–116). Note for
the board, not a finding of this package: `RealSurfacePeriodIndex` (accepted design, order line 153)
declares `gap:q2-tsen-lang` on this roadmap's 5.6 and cites it as "Q2.5/transcendental-ci" six
times; that edge runs upward from its side and is not an edge of this README.

**Cross-roadmap citations resolved** (every one, at main or at the open head the tool shows):
`QuadraticFormInvariants` Layers 1, 4, 9 and subsections 7A (line 2180), 7B (2293);
`ProfiniteCohomology` Layers 10–12 (1549, 1739, 2088); `ClassFieldTheory` Layer 6 with
`cd_p_absoluteGaloisGroup_eq_two` (1286: "`cd_ℓ G_K = 2` for `K/ℚ_p` finite and every prime `ℓ`") and
Layer 10 (1552, exactness at `Br K`, 1606); `AdicSpaces` §§1.1–1.3 (270–304); `RealAlgebraicGeometry`
Layer 1 `exists_realClosure` (137); `SchemeAndStackFoundations` §§0.12–0.14 (969, 1032, 1068) with
`Henselization.henselian`, `henselian_smooth_lifting`, §2.11 (3656), §2.15 (3867) with
`etale_galois_comparison`, `etale_cohomology_limits`, `hochschildSerre_galois_covering`, §2.16
`tsen_theorem` (3896–3898); `LocalFieldsRamificationPartII` (accepted design) GF.1 (immediate,
universal property, `henselian_iff`), GF.4 (rank-one Krasner approximation and decompletion), GF.5
(Abhyankar inequality); `GeometryOfNumbersAndQuadraticArithmetic` §6.4 `ExactW0`, `ExactGW0` (2920–2934
at its head); `GeometryOfNumbersAndQuadraticArithmeticPartII` (accepted design) DA.0;
`K2SymbolsBrauer` §§5.4, 5.8, Layer 9, §§10.5, 10.9, 10.32 (540–2422 at its head);
`KTheoryFiniteLocalFields` §3.0 `blochGabberKato` (469), §3.0a `motivicToK` (502);
`MotivesAndAlgebraicCycles` §0.5b (157), §§4.1–4.6 (557–654), §4.14 (814); `ClassicalAdicEtaleCohomology`
§11.2 `field_cohomological_dimension_transcendence` (5132); `AdicCoefficientsAndComparisonsPartII`
(accepted design) PA.6.9 "Prime-to-ℓ alterations of varieties with snc boundary";
`DeligneWeightsAndPurity` §§7.12, 7.15 (2619, 2679). The resolver reports no citation and no Lean name
found nowhere.

**Declared gap.** `gap:rost-cycle-modules`, supplier `MotivesAndAlgebraicCycles` §0.5b, same slug in
`design/plan.json` and in the README's supplier contract; precise (one theory with its named parts),
minimal (that roadmap's README at its head contains neither "cycle module" nor "Rost"; `K3BlochGroups`
only mentions maps of cycle modules, as the author found). Accepted as a contract.

**Library declarations opened at the pins** (file and line): Tau Ceti `pfisterForm`
(`Witt/Pfister/Basic.lean:61`, weights `∏_{i∈S}(−aᵢ)` through `![1, −a 0]`), `pfisterForm_two` (89),
`pfisterFormClass` (154), `pfisterClass` (269), `pfisterClass_mem_fundamentalIdeal_pow` (318),
`fundamentalIdeal_pow_eq_addClosure` (355, `0 < n`); `WittRing` (`Witt/Ring.lean:218`), `wittClass`
(288), `WittRing.dimMod2` (386); `fundamentalIdeal` (`Witt/FundamentalIdeal.lean:56`),
`oneFoldPfisterClass` (89), `fundamentalIdeal_toAddSubgroup_eq_closure_oneFoldPfisterClass` (189);
`signedDiscrHom` (`Witt/Discriminant.lean:308`); `RegularFormClass` (`RegularFormClass/Basic.lean:202`),
`presentedForm` (102, weighted sum of squares), `formClass` (613, takes `Q.Nondegenerate`);
`oneFoldPfister_smul_equivalent_of_mem_unitValueSet` (`Witt/Round.lean:41`), two-fold (55);
`pfisterFormClass_two_tfae` (`Witt/Pfister/Hyperbolic.lean:97`), `pfisterClass_two_eq_zero_iff` (126);
`WittRing.baseChange_pfisterClass` (`Witt/Pfister/BaseChange.lean:37`); `equivalent_of_equivalent_prod`
(`Witt/Cancellation.lean:196`); `IsometryEquiv.exists_extension` (`Witt/Extension.lean:50`); `Represents`
(`Representation.lean:44`, `∃ v, Q v = a`, so `0` is represented), `unitValueSet` (164),
`IsRepresentedBy` (47); `scharlauTransfer` (`Transfer/Basic.lean:48`), `polar_scharlauTransfer` (180),
`WittRing.scharlauTransfer` (`Transfer/Witt.lean:147`, `s ≠ 0`), `scharlauTransfer_baseChange_mul`
(186); `AbsoluteGaloisGroup` (`Galois/AbsoluteGaloisGroup/Basic.lean:312`), `trivialF2`
(`ContCohomology/TrivialF2.lean:87`), `kummerClass` (`GaloisCohomology/MuTwo/Basic.lean:392`, degree
one, `Invertible 2`), `trivialF2TopPairing` (`Cup/TrivialF2/Basic.lean:66`), `TopPairing.cup`
(`Cup/Cohomology.lean:167`, degrees `m, n ↦ m + n`), `galoisRes` (`Restriction.lean:84`), `galoisRes_cup`
(111), `cohomologicalDimensionAt` (`CohomologicalDimension/Basic.lean:146`); `ValuationSpectrum`
(`ValuationSpectrum/Basic.lean:73`), `patchTopology` (`PatchPresentation.lean:96`),
`isClopen_patchTopology_basicOpen` (docstring 48). Mathlib: `QuadraticMap.proj` (`Basic.lean:628`),
`Anisotropic` (1056), `Nondegenerate` (`Radical.lean:115`: radical zero and polar kernel of rank `≤ 1`,
as the Conventions say), `Equivalent` (`IsometryEquiv.lean:46`), `QuadraticForm.baseChange`
(`TensorProduct.lean:127`, under `Invertible (2 : R)` at line 39), `dualProd` (`Dual.lean:38`),
`char_dvd_card_solutions` (`ChevalleyWarning.lean:178`), `Ideal.height_le_spanRank_toENat`
(`KrullsHeightTheorem.lean:279`), `nonempty_sections_of_finite_inverse_system`
(`CofilteredSystem.lean:111`), `HenselianLocalRing.TFAE` (`Henselian.lean:119`), `IsRealClosed`
(`IsRealClosed/Basic.lean:48`), `algebraicClosure` (`AlgebraicClosure.lean:39`, an `IntermediateField`),
`Algebra.trdeg` (`AlgebraicIndependent/Basic.lean:45`), `ValuationSubring.valuation` and `ValueGroup`
(`ValuationSubring.lean:166, 161`), `isLocalRing` instance (144), `AdicCompletion`
(`AdicCompletion/Basic.lean:171`), `HomogeneousLocalization` (`HomogeneousLocalization.lean:279`),
`MvPolynomial.IsHomogeneous` (`Homogeneous.lean:46`).

**Sources: the seeded sample** (all read at the locator; printed page = PDF page − 8 for ekm, + 62 for
morel). 0.6: ekm lines 2873–2874 define `I_qⁿ = Iⁿ⁻¹·I_q` (p. 53) ✓. 1.2: Example 9.3, lines 2831–2838
(pp. 52–53): the norm form of any quadratic algebra is round, `N(x) ≠ 0 ⇒ x` invertible ✓. 1.4:
Proposition 9.8(1), lines 2906–2925 (p. 54), roundness of `⟨⟨a⟩⟩ ⊗ ϕ` with no regularity hypothesis;
Corollary 9.9 (2932) ✓; so H1 holds for singular `[1, a₀]` too, as the docstring says. 1.5: 9.8(2) needs
`ϕ` regular, Corollary 9.10 (2933–2936) ✓. 2.3: Corollary 17.7 (3776–3785, p. 72), Theorem 17.12
(3831–3867, pp. 73–74) with anisotropic `ϕ, ψ` ✓; the README's reflection route replaces EKM's use of
Witt extension 8.3 and is valid (a reflection in `v − u` with `ϕ(v) = ϕ(u)` sends `v` to `u`). 2.4:
Lemma 20.1, Proposition 20.2, Lemma 20.4, Corollary 20.5 (4348–4416, pp. 83–84), Corollary 20.7
(4463–4474), (20.8), Lemmas 20.9, 20.12, Corollary 20.13 (4475–4581, pp. 84–85) ✓. 2.5: Corollary 18.5
(4004–4016, p. 77), arbitrary anisotropic form, finite odd degree ✓; Corollary 18.6 (4018) ✓. 2.7:
Proposition 19.8 (4188–4195, p. 80), Lemmas 19.2, 19.4, 19.5, Proposition 19.7 (4144–4187) ✓. 2.8:
Lemma 20.15, Theorem 20.16 (4613–4649, pp. 86–87) ✓. 3.5: Morel Theorem 1.1 (lines 75–78, p. 65),
Theorem 1.3 (104–114), proof on p. 66 (115–133) ✓; EKM Fact 5.15 (1843, p. 31), Fact 16.2 (3634–3640,
p. 68) ✓; OVV Theorem 4.1 (402, p. 11, characteristic zero) ✓; K2SymbolsBrauer §10.32 ✓ (but see R01).
3.7: Proposition 16.1 (3620–3622, p. 67) and the definition `eₙ(ϕ) = {a₁,…,a_{n−1}}·[F_{aₙ}]` (3617) ✓;
dp Fact 3.1 (242–253, p. 6) ✓. 4.1: dp (∗) (279, p. 7) ✓. 4.2: dp Proposition 3.2(1) (264) ✓ (the README
generalises slot 1 to any slot, sound by symmetry of the bilinear factors). 5.6: EKM §97 definition
(20209–20211, p. 385, strict threshold), Corollaries 97.5–97.6 and Theorem 97.7 (20259–20285, p. 386),
no finite-generation hypothesis ✓. 6.2: dp Claim (311–315, p. 7) and §2 (152–153, p. 4: `K ⊗ k₁,v` a
domain, hence a field) ✓; the README's replacement of the `cd(E′) ≤ dim(E′) + 1` step is necessary
(see Source issues). 6.5: dp Proposition 3.2(3) and proof (269–335, pp. 6–8) ✓. Also checked: dp p. 1
(Kronecker dimension, 34–36), Fact 2.1 (158–159, p. 4), Lemma 3.9 (494–517, p. 11); Jannsen
Theorem 0.4 (86, p. 2, "primary, i.e. `K` separably closed in `F`"), Corollary 0.8 (141–145, p. 4),
Theorems 2.10–2.11 (1034–1052, p. 24); Ojanguren–Panin Theorem A (100, p. 72); EKM Lemma 2.1 (p. 19),
Proposition 2.4, Corollary 2.5 (p. 20), Theorem 4.8 (p. 23), Notation 7.3, Remark 7.4 (p. 40), Examples
7.5–7.6 (p. 41), Lemma 7.15, Proposition 7.19 (p. 43), Propositions 7.29, 7.31 (pp. 45–46), Theorems
8.3–8.5 (pp. 47–48), (8.7) (p. 49), Remark 8.9(3) (p. 50), Lemma 8.16, Remarks 8.17–8.18 (p. 51),
Theorem 23.7 (5444–5457, p. 100), Proposition 22.1 (p. 93), Example 22.2, Proposition 22.4, Theorem
22.5 (p. 94), §101 (p. 402); Morel Definition 2.1, Theorems 2.2 (p. 70), 2.3 (71), 2.11 (76), 2.12 (78),
3.4, Lemmas 3.5–3.9 (84–87), Theorem 3.10 (87), Lemmas 3.11–3.16 and Corollary 3.17 (90–93). Every
page agrees with the README except Example 7.23 (R04).

**Duplication by object.** `roadmaps grep` across main and the open heads: "Tsen–Lang", "Kronecker
dimension", "quadratic Pfister" and "Kato … characteristic two" have no match outside this package;
"Hauptsatz" and "Milnor conjecture" match only the parent's exclusion sentences (main lines 62, 1310)
and the knot-theoretic Milnor conjecture of `CombinatorialHeegaardFloer`; "Jannsen" matches no Hasse
principle; "Dittmann" matches `AlgebraicModuliForArithmeticGeometry` (Proposition 3.8 and Lemma 5.3,
test forms over smooth models, not Proposition 3.2); "Cassels" and "Springer" hits are other theorems
of those names. Kept variants differ in one clause each (`extendScalars` versus `baseChange` under
`Invertible 2`; `quadraticPfister` versus `pfisterForm` by the terminal block; Tsen–Lang versus
`tsen_theorem` by `t = 1` over an algebraically closed field). The real-function-field tranche is
correctly left to `RealSurfacePeriodIndex` PI.0, whose design says so (line 76). Ownership against the
open pull requests named in the brief was checked through the roadmaps tool.

**Shape.** Every definition has an API list and at least three discriminating Checks (0.1: 4, 0.2: 4,
0.4: 4, 0.5: 4, 0.6: 3, 1.1: 4, 2.9: 3, 3.1: 3, 3.3: 4, 3.7: 3, 5.1: 4, 5.7: 4, 6.1: 4); every layer ends
with Examples and Dependencies; every theorem has hypotheses in the sentence and a locator; every
Lean name appears in the README and no backticked own name of the README is undeclared (the only
backticked non-library tokens are roadmap names, `Dual.lean`, `W`, `j_N`). README generality equals
the Lean signatures (checked declaration by declaration in the table).

**Adversarial table** (sampled targets, headlines, and targets the findings touch).

| Statement | Instances tried | Values computed (both sides) | Result | Change |
|---|---|---|---|---|
| `quadraticPfister` (1.1, def) | `m = 0`; `K = 𝔽₂, a₀ = 1`; `ℚ, a₀ = 1/4`; two-fold, `a₀ = (1−b)/4` | `[1, a₀]` at `(1,0),(0,1),(1,1)` = `1, a₀, 1 + a₀`; over `𝔽₂` with `a₀ = 1`: `1, 1, 1`, anisotropic; `a₀ = 1/4`: `(x + y/2)²`, rank 1, `1 − 4a₀ = 0`; weights `pfisterForm ![a, b] = ![1, −a, −b, ab]` (pin line 89), so the two-fold form is `⟨1, −a⟩_b ⊗ [1, (1−b)/4] ≅ ⟨1, −a, −b, ab⟩` | sound; the API bullet overclaims the parent comparison | R03 |
| H1 roundness (1.4) | singular `m = 0`, `a₀ = 1/4`, `c = z²`; `m = 1`, `a₀ = 1/4`, `K = ℚ`; non-Pfister control | `c·(x + y/2)² = (zx + zy/2)²`, isometric by `x ↦ zx, y ↦ zy`; `(x + y/2)² − a(z + w/2)²` has value group that of `⟨1, −a⟩`, round; `3⟨1,1,1⟩ = ⟨3,3,3⟩`, discriminants `27 ≡ 3` versus `1` mod squares, not isometric although `3 = 1 + 1 + 1` | matches 9.3 + 9.8(1); no nonsingularity needed | — |
| H2 isotropic ⇔ hyperbolic (1.5) | `a₀ = 1/4` over `ℚ`; `[1, 0]` over `𝔽₂`; `ℍ ⊥ [1,1]` over `𝔽₂`; `m = 0` | `(x + y/2)²` at `(1, −2)`: `1 − 1 = 0`, isotropic, singular, not `≅ dualProd` (which is nonsingular): hypothesis `1 − 4a₀ ≠ 0` needed; `[1,0](0,1) = 0`, `1 − 0 ≠ 0`, hyperbolic; `ℍ ⊥ [1,1]` isotropic, anisotropic part `[1,1] ≠ 0`, not hyperbolic, so the equivalence is Pfister-specific; `dualProd K (Fin 1 → K)` has dimension `2 = 2^{0+1}` | sound | — |
| 0.6 `I_qⁿ` | `n = 1`; `2` invertible, `n = 2`; `𝔽₂` | `I_q¹ = I_b⁰·I_q = I_q`; `⟨1, −a⟩ ∈ I_q²` iff signed discriminant `(−1)·(−a) = a` is a square; `[1,1]` over `𝔽₂`: polar form alternating, class `0` in `W_b`, class `≠ 0` in `I_q` (anisotropic, dimension 2) | sound, matches ekm 2873–2874 | — |
| 1.2 binary norm forms round | split `a₀ = 0`; `𝔽₂`, `a₀ = 1`; nonreduced `a₀ = 1/4` | `[1,0] = xy`, `G = D = Fˣ`; `[1,1]` over `𝔽₂`: `D = {1} = G`; `(x + y/2)²`: `D = Fˣ²`, each `z²` a similarity factor by scaling | sound; Example 9.3 covers all three | — |
| 2.3 representation theorem | `ψ = [1,1] ⊆ q = [1,1] ⊥ t[1,1]` over `𝔽₂(t)`; `q = ℍ`; `dim ψ = 3 > dim q = 2` | `ψ(T) = T₀² + T₀T₁ + T₁²` is `q(T₀, T₁, 0, 0)`; `ℍ` represents everything but contains no anisotropic binary subform, so anisotropy of `q` is needed (17.12 assumes it); the inequality `dim ψ ≤ dim ϕ` excludes the third | sound | — |
| 2.4 transfer | `E = F`, `s = id`; `E = F(x)`, `[E:F] = 2`, `N x = a`; `F(√c)`, char 2, trace | identity; `s_*⟨1⟩_b = ⟨1, −a⟩_b` (20.9, `n` even), `s_*⟨x⟩_b = 0` (20.12), so `s_*⟨⟨x⟩⟩_b = ⟨1, −a⟩_b` (20.13); trace of a purely inseparable quadratic extension is `0`, transfer along `0` is the zero form, singular; `s(1) = 1, s(√c) = 0` gives `s_*(ℍ_E)` of dimension 4, nonsingular (20.4) | sound; "nonzero functional" is the right hypothesis | — |
| H3 Cassels–Pfister (2.2) | `h = 0`; `Q = ⟨1,1⟩` over `ℚ`, `h = t² + 1`, `h = 3`; isotropic singular `Q = ⟨0, 1⟩`, `h = t²` | `w = 0`; `(t, 1) ↦ t² + 1`; `x² + y² = 3z²` forces `3 ∣ x, y, z`, no solution, so `3 ∉ D(Q_{ℚ(t)})` and the hypothesis fails; `(0, t) ↦ t²` | sound for arbitrary `Q` (17.3, lines 3737–3765) | — |
| H4 Springer (2.5) | `[1,1]`, `𝔽₈` vs `𝔽₄`; `⟨1, t⟩` over `𝔽₃(t)`, `s³ = t`; char 2 odd degree | `x² + x + 1` has no root in `𝔽₈` (`𝔽₄ ⊄ 𝔽₈`), a root in `𝔽₄`; `x² + t y² = 0` with `t = s³` needs `−s` a square in `𝔽₃(s)`, impossible by degree parity; inseparable degree in char 2 is a power of 2, so odd-degree extensions are separable | sound; `[FiniteDimensional K L]`, `Odd (finrank K L)` match 18.5 | — |
| 2.7 odd-divisor specialization | `q = [1,1]`, `F = 𝔽₂`, `f = t² + t + 1`; `f = t²` | `[1,1](t, 1) = t² + t + 1 = f`, so `f ∈ D(q_{F(t)}) = G` by roundness, and `q` over `F(f) = 𝔽₄` is `[1,1]` with `ω² + ω + 1 = 0`: hyperbolic ✓; `t²` has no odd-multiplicity divisor, `t² q ≅ q`, no conclusion | sound; 19.8 needs nondegenerate even dimension ✓ | — |
| 2.8 similarity theorem | `q = [1,1]`, `𝔽₂`, `f = t`; constant `f = c` | `F(t)` at `p = t` has residue field `𝔽₂` where `[1,1]` is anisotropic, so no `a t ∈ G`; degree parity confirms `t ∉ D(q_{𝔽₂(t)})`; `c⁻¹·c = 1 ∈ G` and the divisor condition is empty | sound | — |
| H5 Hauptsatz (2.11) | `n = 0`; `n = 1`, `[1,1]`; `⟨1,1,1,1⟩` over `ℚ`; `⟨1,1⟩` over `ℝ`; `3ℍ` | `2⁰ = 1 ≤ dim` (`Nontrivial V`); even dimension `≥ 2`; `⟨⟨−1,−1⟩⟩` anisotropic, `4 = 2²`; signature `2 ∉ 4ℤ`, so `⟨1,1⟩ ∉ I²(ℝ)`, no contradiction; `3ℍ` has class `0 ∈ Iⁿ`, dimension 6, hyperbolic: the anisotropy hypothesis is what makes the bound bite | sound; `formClass` needs `Nondegenerate` (pin 613), supplied | — |
| `kummerSymbol` (3.1, def) | `n = 0`; degrees | `kummerSymbol 0 a = kummerClass (a 0)` in degree 1; `cup (n+1) 1` lands in `n + 2` (pin 167); left-to-right bracketing is irrelevant for `𝔽₂` coefficients up to the pairing's associativity (`ProfiniteCohomology` Layer 12) | sound | — |
| H6 Milnor, cohomological (3.5) | `n = 0`; `n = 1` over `ℝ`; degree `0` | `I/I² → H¹`: `⟨1, −a⟩ ↦ (a)`, signed discriminant `(−1)·(−a) = a`; `⟨⟨−1,−1⟩⟩ = ⟨1,1,1,1⟩ ↦ (−1)∪(−1)`, Hamilton's quaternions, nonzero; degree `0`: `W/I ≅ ℤ/2 = H⁰` but `⟨2⟩ ∉ ℤ⟨1⟩` in `W(ℚ)`, so Pfister classes do not generate and the statement rightly starts at `n + 1 ≥ 1` | statement sound; route input unowned | R01, R05 |
| 3.7 Pfister invariant | `n = 1` over `𝔽₂`; `e₂(⟨⟨−1, 2⟩⟩)` over `ℚ`; twist | `e₁([1,1]) = 1 ∈ 𝔽₂/℘𝔽₂ ≠ 0`, `e₁([1,0]) = 0`; `⟨1, 1, −2, −2⟩` is `0` at `(1,1,1,0)`: `1 + 1 − 2 = 0`, hyperbolic, invariant `0`, and `2 = 1 + 1`; EKM's `eₙ = {a₁,…,a_{n−1}}·[F_{aₙ}]` (3617) puts the last slot through the étale class, twist `n − 1` | sound | — |
| H7 invariant-zero (3.9) | `n = 0`; `8⟨1⟩` over `ℚ`, `ℚ(i)`, `ℚ₂` | `⟨1, −a⟩` isotropic iff `a ∈ ℚˣ²` iff `(a) = 0`; `(−1)³ ≠ 0` in `H³(ℚ, 𝔽₂)` (real place) and `8⟨1⟩` anisotropic; over `ℚ₂`: dimension `8 ≥ 5`, isotropic, and `H³(G_{ℚ₂}, 𝔽₂) = 0` as `cd₂ = 2` | sound | — |
| 4.1 unit reduction | `𝔽₂((t))`, `[1,1]`; `ℚ₂`, `[1,1]`; `ℚ₂`, `⟨1,1⟩`; `ℤ_(7)` | reduction `[1,1]` over `𝔽₂` anisotropic ⇒ anisotropic over `𝔽₂((t))`; `1 − 4 = −3 ∈ ℤ₂ˣ`, reduction anisotropic, and `[1,1]` is the norm of `ℚ₂(ω)`; `⟨1,1⟩ = [1, 1/2]`, `1/2 ∉ ℤ₂`, reduction `(x+y)²` isotropic yet `−1 ∉ ℚ₂ˣ²`: the integral presentation is the right hypothesis; `2 ≡ 3²` mod 7 but `⟨1,−2⟩` anisotropic over `ℚ`: henselianity needed | sound in every residue characteristic, as claimed beyond dp | — |
| 4.2 principal unit | `⟨⟨1 + t⟩⟩_b ⊗ [1,1]` over `𝔽₂((t))`; `[1, 1 + t]`; `m = 0` | reduction `⟨1,1⟩_b ⊗ [1,1] = [1,1] ⊥ [1,1]`, zero at `(v, v)` since `q(v) + q(v) = 0`; `[1, 1+t]` reduces to anisotropic `[1,1]`: no claim for the terminal slot; `m = 0` has no outer slot (`Fin 0` empty) | sound; statable, absent | R02 |
| H8 independent values (4.3) | `𝔽₂((t))`, `π = (t)`; `π = (t²)`; trivial valuation; `S ≠ S′` | block values of `[1,1] ⊥ t[1,1]` have orders `2·min` and `1 + 2·min`, distinct parity, no cancellation; `v(t²) = v(t)²` is a square, hypothesis fails, and `[1,1] ⊥ t²[1,1] ≅ [1,1] ⊥ [1,1]` is isotropic; `Γ = 1`, every nonempty product is `1 = 1·1`, a square, so `s = 0` and the TFAE collapses to `κ = K`; cosets of `S, S′` differ by `∏_{S △ S′} v(πᵢ) ∉ Γ²`, the hypothesis on the nonempty set `S △ S′` | sound; signs `(−1)^{|S|}` are units | — |
| `IsCi` (5.1, def) | zero polynomial; `X^d`, `N = 1`; `ℝ`; `𝔽₂` | zero polynomial is homogeneous of every degree and vanishes at `e₀`, consistent since `N > dⁱ ≥ 1`; `X^d` in `1 = d⁰` variables is excluded by the strict bound; `∑ xᵢ²` has no real zero for any `N`, `ℝ` is `C_i` for no `i`; `x² + xy + y²` has no zero over `𝔽₂`, so `𝔽₂` is not `C₀` and is `C₁` by Chevalley–Warning | sound; matches ekm 20209–20211 | — |
| H9 Tsen–Lang (5.6) | `t = 0`; `𝔽_p(t)`; `ℂ(x, y)`; `ℝ(t)`; non-finitely-generated `E` | reduces to 5.5; `C₂`; `C₂`; `ℝ` not `C_i`, so no conclusion; any finite set of coefficients lies in a finitely generated subextension of transcendence degree `≤ t`, so finite generation is not needed (97.7 has none) | sound; `Algebra.trdeg F E = ↑t` is the right carrier | — |
| `kroneckerDimension`, `constantField` (5.7, defs) | `𝔽_p`, `ℚ`, `𝔽_p(t)`, `ℚ(t)`, `ℚ̄` | `0, 1, 1, 2, 1` (`ringChar = 0` adds `1`); constant fields `𝔽_p`, `ℚ`, `ℚ̄`; `algebraicClosure (⊥) F` is the relative algebraic closure of the prime subfield (pin 39) | sound | — |
| 6.2 local cd bound | `t = 0`, `E′ = k′ = ℚ`, `v = 2`; real place; `E′ = ℚ(x)`, `v = 3` | `cd₂(ℚ₂^h) = cd₂(ℚ₂) = 2` (same absolute Galois group by GF.4), `H³ = 0`; `H^m(G_ℝ, 𝔽₂) = 𝔽₂` for all `m`, `cd₂ = ∞`, correctly excluded; `cd₂(ℚ(x)) = ∞` (formally real) while `cd₂(ℚ(x)ℚ₃^h) ≤ 2 + 1 = 3` | sound; the source's step is replaced for a reason | — |
| H10 dimension theorem (6.5) | residue char `p`; henselization of `ℚ` at `2`; henselization of `ℚ(x)` at `x` with `ε = (−1, −1)`, `a₀ = 1/2`; `r = 0`; `k` without ordering | 5.8 applies (`e = dim κ < r`, `κ` is `C_{e+1}`, `2^{r+1} > 2^{e+1}`); `−7 ≡ 1 mod 8` so `√−7 ∈ k`, no ordering, hypothesis vacuous and 5.8 concludes; `dim K = 2`, `1 − 4a₀ = −1`, `[1, 1/2] ≅ ⟨1,1⟩`, form `8⟨1⟩`, anisotropic over `K ⊆ ℚ((x))` and over `K·(ℚ̄ ∩ ℝ)`, so hypothesis and conclusion both fail; `r = 0` forces `K` algebraic over `𝔽_p`, which has no nontrivial valuation; `hreal` quantifies over `(R, L, f, g)` and `L` always contains the field `K ⊗_k R`, so it is equivalent to isotropy over every `K k_v` | sound | — |
| Convention `[1, (1−b)/4] ≅ ⟨1, −b⟩` | `b = −1`; `b = 1 − 4a₀` | `x² + xy + y²/2 = (x + y/2)² + y²/4 ≅ ⟨1, 1⟩`; `(x + y/2)² + (a₀ − 1/4)y²`, `a₀ − 1/4 = −b/4`, and `1/4` is a square | sound; pins the minus sign with the parent | — |
| Convention nonsingular vs `Nondegenerate` | `⟨1⟩` on `𝔽₂`; even dimension | radical `0`, polar kernel of rank `1`: `Nondegenerate` (pin 115–117) but singular; an alternating form has even rank, so in even dimension rank `≤ 1` of the kernel forces `0` | sound | — |

## Not verifiable

- `kato82`, `arason75`, `milnor70`: paywalled, settled as uncertified; cited by locator through EKM
  Facts 5.15, 16.2 and Morel pp. 64–66, 77. The statements attributed to them agree with the certified
  texts that quote them. R01 does not depend on reading Milnor: it is about the absence of an owner.
- The design's internal labels (`Q2.k`, `transcendental-ci`) used by `RealSurfacePeriodIndex` and
  `LogicAndDefinabilityInNumberTheoryPartII` were matched to layers by the author's statement that
  Layer `k` keeps index `k`; the labels themselves are not in this README (correctly).

## Source issues

- **Error** in dp at Proposition 3.2(3), proof of the Claim, printed page 7: the source bounds the
  local compositum through `cd(E′) ≤ dim(E′) + 1`, which fails when `E′` is formally real (its `cd₂` is
  infinite); it should bound `cd₂(E′k′_v)` directly by `trdeg(E′/k′) + 2` at finite places; affects
  the proof (repaired in 6.2).
- **Misprint** in dp at Proposition 3.2(2), proof, printed page 7: the source expands `q_{π,ε}` with
  coefficients `∏ πᵢ^{χ(i)}`; it should carry the signs `(−1)^{|χ|}` from `⟨⟨π⟩⟩ = x₁² − π x₂²`; affects
  nothing (units).
- **Misprint** in dp at §3, printed page 6: the source writes the outer factors `⟨⟨aᵢ⟩⟩` as quadratic
  forms `x₁² − a x₂²` also in characteristic two; it should take them as the bilinear forms
  `⟨1, −aᵢ⟩_b` of EKM §9.B, since quadratic forms do not multiply; affects nothing.
- **Misprint** in dp at Lemma 3.9(2), proof, printed page 11: the source says `V_a` contains the
  neighbourhood `V_{E|F}` "of `q_a`"; it should say of the valuation `w`; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d1776cf", "job": "REV-PKG-QuadraticFormInvariantsPartII", "model": "fable", "worker": "fable-rev175"} -->

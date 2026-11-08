<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7660#issuecomment-6720860963 -->
Review (claude) of 0244ac9

Verdict: needs_changes

1. **F01** (P2) §3.1 restates the trace-zero adjoint that ArithmeticGaloisRepresentations §7.2 owns

   Location: `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md` line 42,
   "Layer 3: the adjoint representation of `SL₂` and the detection of the exceptional class"; lines
   523–535, "Define the adjoint representation `ad⁰` of `SL(2, k)` … by `g · X = g X g⁻¹`, built with
   `Rep.ofDistribMulAction`", with the API bullets "conjugation … preserves trace zero, is `k`-linear and
   multiplicative", "the trace form … is a nondegenerate invariant symmetric form, identifying the
   representation with its dual", "a field embedding `k → k'` identifies the base change"; line 156–159,
   "`LieAlgebra.SpecialLinear.sl` … carries no group action; §3.1 adds the conjugation representation";
   `design/plan.json` line 356, target 3.1 `sl2AdjointRep` (`kind: definition`, API `action_apply`,
   `trace_form_nondegenerate`, `baseChange`).

   Claim: this roadmap owns the conjugation representation of `SL(2, k)` on the trace-zero matrices,
   its invariant trace pairing, the self-duality in odd characteristic and its base change.

   Witness: ArithmeticGaloisRepresentations README.md (open pull request #856, a supplier earlier in
   the merge order) §7.2 "Adjoint, trace pairing and Schur's lemma", lines 4489–4505: "it owns the
   trace-zero adjoint and the pairing consequences below"; "define *ContinuousRep.ad* `ρ` on `End_A(M)`
   by conjugation … *ContinuousRep.adZero* `ρ = ker` *endTrace* … the trace pairing is perfect and
   invariant … `ad = A·1 ⊕ ad⁰` exactly when `n ∈ A^×` … Its API is … perfectness, the splitting when
   `n` is invertible … base change". Applied to the tautological representation of the finite group
   `SL(2, k)` on `k²` this is §3.1's object: for `U = 1 + E₁₂` both give `D(e) = e`, `D(h) = h − 2e`,
   `D(f) = f + h − e` (recomputed). §7.7 of the same roadmap, lines 5059–5061, already states
   `H¹(SL₂(F_5), ad⁰)` one-dimensional on this object with Mathlib `groupCohomology`, and §3.2 here cites
   that statement for its source, so the two `ad⁰` are identified without a word saying so. Two
   roadmaps own one object (the overlap rule); the trace-form self-duality and base change bullets are
   AGR §7.2's API restated.

   Repair (tested on `U`, `−1`, `diag(2, 3)` and the characteristic-two Gram matrix, which all still
   discriminate the specialised statement). (1) Line 42: "Layer 3: the detection of the exceptional
   class of `H¹(SL₂(𝔽₅), ad⁰)` by an order-five unipotent subgroup, for the trace-zero adjoint of
   ArithmeticGaloisRepresentations §7.2; protected local residual data, …". (2) Supplier row at line 246:
   add "§7.2 (`ContinuousRep.adZero`: the trace-zero adjoint of a representation with its conjugation
   action, the invariant trace pairing, perfect and splitting `ad = A·1 ⊕ ad⁰` when `2 ∈ A^×`, and base
   change)". (3) §3.1, retitled "The adjoint representation of `SL₂`, specialised": "Let `ad⁰` be the
   trace-zero adjoint of ArithmeticGaloisRepresentations §7.2 for the tautological representation of
   `SL(2, k)` on `k²`, as a representation of the finite group `SL(2, k)` on
   `LieAlgebra.SpecialLinear.sl (Fin 2) k`, the carrier on which ArithmeticGaloisRepresentations §7.7
   computes `H¹(SL₂(F), ad⁰)`. Prove that `−1` acts trivially, so the representation factors through
   `PSL₂(k)`, and that for `k` of odd characteristic the invariants vanish: a trace-zero matrix commuting
   with `U = [[1,1],[0,1]]` and its transpose is zero. The trace form `⟨X, Y⟩ = tr(XY)`, its invariance,
   its nondegeneracy for `2 ∈ k^×` and the base change along `k → k'` are ArithmeticGaloisRepresentations
   §7.2." Keep the four Checks unchanged; `*Needs:*` becomes "ArithmeticGaloisRepresentations §7.2;
   Mathlib `LieAlgebra.SpecialLinear.sl`, `Matrix.SpecialLinearGroup`". (4) Lines 156–159: delete the
   `Rep.ofDistribMulAction` row and the clause "§3.1 adds the conjugation representation" (replace by
   "ArithmeticGaloisRepresentations §7.2 adds the conjugation representation"). (5) `plan.json` target
   3.1: `kind` "theorem", statement as in (3), prerequisites `roadmap:ArithmeticGaloisRepresentations
   §7.2`, `mathlib:LieAlgebra.SpecialLinear.sl`, `mathlib:Matrix.SpecialLinearGroup`; drop the API
   entries `action_apply`, `trace_form_nondegenerate`, `baseChange`; keep `neg_one_acts_trivially`,
   `invariants_eq_bot` and the four tests. (6) §3.2 `*Needs:*` and the Layer 3 Dependencies paragraph
   (line 681): add ArithmeticGaloisRepresentations §7.2. No other target names `sl2AdjointRep`.

One finding, P2, on a passage no repair touched (§3.1, a sampled target): the definition of the
adjoint representation of `SL₂` restates an object that ArithmeticGaloisRepresentations §7.2 owns,
and the Scope claims ownership of it. The round-3 finding is repaired and the repaired passages were
recomputed. Files reviewed: `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md`
(1273 lines), `design/plan.json` (8 layers, 28 targets of which one is the Layer 1 example, 91 tests,
1 gap), `sources.toml` (8 entries).

## Repairs of round 3, finding by finding

- **F01 (§6.2 assumed that failure of clause (4) forces `ζ₅ ∈ F`) — repaired.** README lines
  973–976: "Suppose either that clause (4) holds (…), or that `ζ₅ ∈ F` and there is a nonempty finite
  set `P` of places `v ∤ 5` such that …". Lines 979–984: "If (4) holds this is the parent's §5.2
  `potentiallySemistableCM`. Otherwise `ζ₅ ∈ F` by hypothesis, so `ε̄₅⁻¹` is trivial on
  `G_F = G_{F(ζ₅)}`, and since (4) fails the projective image of `ρ̄(G_F)` is conjugate to `PSL₂(𝔽₅)`.
  The preimage of `PSL₂(𝔽₅)` in `SL₂(k̄)` is `SL₂(𝔽₅)` (a scalar of determinant one is `±1`), and a
  subgroup of `SL₂(𝔽₅)` surjecting onto `PSL₂(𝔽₅)` has even order, so contains the unique involution
  `−1` and is all of `SL₂(𝔽₅`)"; the sentence "for `ζ₅ ∉ F` … which uses only the determinant, gives
  (4)" is gone. The first Check (lines 995–1004) is the `𝔽₅` versus `𝔽₂₅` contrast with the values
  `det(2g) = 4·(−1) = 1`, indices `60` and `120`, `μ² = 2`, `h = diag(1, 2)`, `det(μh) = 4 = −1`,
  `tr(μh) = 3μ ∉ 𝔽₅`, `(μh)² = diag(2, 3)`, order `240`, projective image `PGL₂(𝔽₅)` of order `120`,
  both projective kernels of index `120`. The new second Check (lines 1005–1008) treats the
  order-four determinant through the normalizer of `PSL₂(𝔽₅)`. The third Check restricts imaginary
  quadratic `F` to the alternative (4). §7.5 (lines 1157–1158) now reads "Over the resulting `L`, which
  contains `ζ₅` because `K` does, the protected alternative of Theorem 6.2 applies". `plan.json`
  target 6.2: `statement`, `hypotheses`, `locator.where` (`μ5 ⊂ F` at CaptainSude26 line 267) and the
  tests `lifting_det_order_two`, `lifting_det_order_four`, `lifting_imag_quadratic` carry the same
  text (91 tests, one more than round 3). All values recomputed (table: rows "6.2 …").

The same pattern elsewhere: the only other use of CN23 Lemma 6.1.4 is through the parent's §5.3
`cm_modularity` in Theorem 2.1(b), applied to `A_t[5]` with `𝔽₅`-coefficients and `ζ₅ ∉ K`, the
lemma's own setting (parent README line 1599: "for any CM number field `L` with `ζ₅ ∉ L`"). §8.1
reaches Theorem 6.2 only through §7.5. No other passage argues from the determinant alone (grep for
"determinant" and "(4)" over the README).

## Verified sound

**Principles.** General library: Theorem 6.2 is stated for an arbitrary representation, Theorem 2.5
for every CM field without `ζ₅`, Theorem 8.1 for every CM field; no good-primes-only clause. The
parent EllipticCurveModularityImaginaryQuadratic is imported by section and declaration (26 sections
and 41 backticked names resolved at its head, below), never re-planned; Theorems 2.2–2.4 apply its
§§8.3–8.6 over a CM base and say so. Supply is one-directional (gate below). No copied passage: each
sampled target was compared with the source wording at its locator (the README's sentences are its
own; CaptainSude26's "Steinberg condition" is renamed "unipotent-inertia condition" and the rename
is declared in Conventions). No computational algorithm. The design plans no Lean declaration, so no
`set_option` and no sorry'd data; the README's Lean paragraph (lines 74–83) says `Suggested.lean`
states nothing and names the three headlines and the missing carriers.

**Dependency check**, run as instructed:

```
candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 238 roadmaps, 2367 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every roadmap in a `*Needs:*` line, a Dependencies paragraph or the
supplier contracts is earlier than EllipticCurveModularityImaginaryQuadratic in
`merge-order/ORDER.txt` or on main (EllipticCurves, ClassFieldTheory, SchemeAndStackFoundations,
Chebotarev); ModularityAndLanglandsExtensions and BianchiModularForms occur only as consumers.

**Citation resolver** (run on the README, index of 2026-11-08T10:56:21Z): three leads, `LeHung26,
§4.4` (line 340), `OpenAI26, §9.4` (449), `CaptainSude26, §4` (800), each a manifest source id
followed by a section sign, i.e. a source locator, not a roadmap citation; Lean names found nowhere:
none. **Overlaps** (`scratch/overlaps.md`): no open pull request changes this roadmap, no cited id is
dropped, none is defined only by an open revision; the closest roadmaps in vocabulary are the parent,
CrystallineLocalGlobalCompatibilityCM, ModularityAndLanglandsExtensions,
PotentialModularityAndCompatibleSystems and GlobalGaloisDeformations, all suppliers here. The board
index lists AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory:
unrelated. Ownership by object over main and the 474 open heads (`roadmaps grep`): "protected
place", "unipotent-inertia", "Steinberg-protected" match nothing; "width-three" only a Tate-chart
remark of AlgebraicModularFormsAndSerreWeights (line 706); `H¹(SL₂(𝔽₅), ad⁰)` only
ArithmeticGaloisRepresentations §7.7, which this roadmap cites; "Theorem 3.1.1" of ACC only
PotentialAutomorphyInfrastructure's supplier row (line 210, pointing at AG2.5) and other papers'
theorems; "torus operator" only PotentialAutomorphyInfrastructure §0.11 `ramified_satake_descent`
(ACC Theorem 2.4.8, the Hecke-algebra side), so ACC Theorem 3.1.1 is still owned nowhere and the gap
stands. The adjoint representation of `SL₂` is R01.

**Pins.** `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti
`2fd255d997f47c0b5d834ee416c7015d55444ce5`, equal to `plan.json` `baseline` and to the README (lines
143, 172), confirmed by `git rev-parse` in both package checkouts. Declarations opened (file:line at
the pin): `NumberField.IsCMField` `Mathlib/NumberTheory/NumberField/CMField.lean`:70,
`complexConj` :142, `isConj_complexConj` :148, `ofCMExtension` :510 (hypotheses: `F` totally real,
`K` totally complex, `Algebra.IsIntegral ℚ K`, `IsQuadraticExtension F K`, as §1.1 uses),
`of_isAbelianGalois` :542 (an instance, "totally complex abelian extension of `ℚ`"),
`IsCyclotomicExtension.Rat.isCMField` :564 (needs some `n ∈ S` with `2 < n`, hence the README's "CM or
`ℚ`"); `IsCyclotomicExtension` `Mathlib/NumberTheory/Cyclotomic/Basic.lean`:74;
`NumberField.isTotallyComplex_of_algebra` `…/InfinitePlace/TotallyRealComplex.lean`:229;
`LieAlgebra.SpecialLinear.sl` `Mathlib/Algebra/Lie/Classical.lean`:92 (a `LieSubalgebra`, the kernel of
the trace); `Rep.ofDistribMulAction` `Mathlib/RepresentationTheory/Rep/Basic.lean`:362;
`groupCohomology.map` `…/GroupCohomology/Functoriality.lean`:141 (`noncomputable abbrev map (n : ℕ)`,
induced by `f : G →* H` and `res f A ⟶ B`); `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd`
`…/GroupCohomology/FiniteCyclic.lean`:114 (odd-degree cohomology is the homology of
`A --(ρ(g) − 1)--> A --N--> A`, i.e. `ker N / im(ρ(g) − 1)`, as §3.2 states);
`Matrix.SL2.commutator_eq_top` `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean`:804 (needs
`a ≠ 0`, `a² ≠ 1`, available for `#k ≥ 4`); `TauCeti.ClassFieldTheory.eulerCharacteristic_mixed`
`TauCeti/NumberTheory/ClassFieldTheory/Local/EulerCharacteristic/Theorem.lean`:98;
`TauCeti.ClassFieldTheory.tateDualityPairing_perfect_mixed` declared in
`TauCeti/NumberTheory/ClassFieldTheory/Local/Duality/Perfect.lean`. Tau Ceti at the pin has no
`AutomorphicRep`, `WeilDeligne`, `HodgeTate`, `PotentiallySemistable` or `LocalLanglands`
declaration (grep over `TauCeti/`; the `Automorphic` hits are lattice-level files), so the Lean
paragraph's "not statable" verdict for Theorems 2.5, 6.2 and 8.1 is correct.

**Cross-roadmap citations resolved at the current heads** (line of the cited README):
- EllipticCurveModularityImaginaryQuadratic (#1048): §0.2 535, §0.3 671, §1.1 861, §1.3 958, §2.1
  1014, §2.2 1040, §2.3 1084, §4.1 1259, §4.2 1308, §4.4 1386, §5.1 1436, §5.2 1537 ("`L` is CM", the
  `ℓ = 5` projective-field clause), §5.3 1599 ("any CM number field `L` with `ζ₅ ∉ L`", `ℓ ∈ {3, 5}`),
  §6.1 1643, §6.3 1702, §6.5 1760, §6.6 1803, §7.1 1855, §7.2 1904, §7.4 1981 ("for each `v₀ ∈ S`
  prescribe a nonempty analytic open", `S` any finite set containing the places above `3p`, which is
  what §7.5 uses to add the opens of §7.2), §8.1 2088, §8.3 2141, §8.4 2188, §8.5 2227, §8.6 2285,
  Downstream consumers and boundaries 2352. Names: `solvable_preparation` 683,
  `seed_modular` 697, `hilbert_local_selection` 713 ("given nonempty open subsets `Ω_w ⊂ Y_ρ̄(L_w)` at
  all the finitely many selected places … there is an `L`-point in every `Ω_w`"), `switch_five` 778
  ("`ζ₅ ∉ F` is not a hypothesis"; Tate reduction retained above `2` and `3`; non-CM),
  `auxiliary_local_types` 790, `modular_elliptic_all_coefficients` and its components 676–741,
  `potentiallySemistableCM` 1539, `cm_modularity` 1601, `simultaneous_specialization` 1987, and the
  rest as in round 3 (lines unchanged at this head).
- CrystallineLocalGlobalCompatibilityCM (#1182): §7.5 1447, §8.2–8.5 1489–1560, §8.6 1561, §8.7 1588
  (perfectness with hypotheses `p` odd, `ρ̄_m` absolutely irreducible, `ζ_p ∈ F`, trivial
  `K_S`-action modulo `ϖ`, as §5.1's third API bullet says), §9.1 1616 (clauses (5)–(15), "(10)
  `ζ_p ∈ F` if `S = S_p ∪ R`"), §9.3 1654–1662 (`g = q − 3[F⁺:ℚ] − 1 + |S|` for `T = S`, the `p = 5`
  projective-field exclusion), §9.4 1676, §9.5 1702, §9.6 1722, §9.7 1738, §9.8 1746, §9.9 1766,
  §9.10 1774, §9.11 1794 (solvable preparation with the items §6.1 lists), §9.12 1810.
- AutomorphicGaloisRepresentationsPartII: AG2.0 641 (`AlgHeckeChar.galoisChar` 752), AG2.5 1819
  "Local comparison, monodromy and purity" (characteristic-zero comparisons only, no torsion
  inertial statement), AG2.7 (`IsDecomposedGenericPrime` 3507, `decomposedGenericPrime_local` 3508,
  `IsDecomposedGeneric` 3529).
- PotentialAutomorphyInfrastructure (#1081): §2.1 790 (`genericity_normal_closure_restriction`), §2.3
  820 (`soluble_base_change_and_descent`, parts (1) and (2), `F` and `E` imaginary CM or totally real,
  `rec` compatibility at every finite place), §2.5 842 (`auxiliary_cm_extension_prescriptions`).
- GlobalGaloisDeformations §3.4 440, §3.6 495 (relative tangent space with framing terms at `T`),
  §3.7 566, §5.1 1081, §5.5 1245, §5.6 1282. LocalGaloisDeformationRings §1.10 1430 "Fixing the
  determinant of local lifts", §2.3 1692 "Minimally ramified lifts", §2.5 1723 "Steinberg
  (unipotent-monodromy) lifts", §2.6 1754 "The `q`-tame group", §2.8 1803 "The minimally ramified
  deformation ring", §2.15 1916, §2.16 1935, §2.21 2027, §3.14 2434, §4.14 2665, §4.15 2692, §6.6
  2979 (the foundations layer of that roadmap carries `F.`-prefixed numbers; the plain numbers cited
  here are the Layer 1–6 headings). DeformationAndDerivedPatchingAlgebra §8.1–8.5 1584–1673.
  ArithmeticGaloisDuality R02.2 1175, R02.4.2 3119 (its "Unramified classes are exact annihilators",
  lines 3197–3200, assumes `M` unramified at `v`, the hypothesis §3.5(b) says it drops).
  ArithmeticGaloisRepresentations §4.3 3142 (Dickson, perfectness via `Matrix.SL2.commutator_eq_top`),
  §6.3 4137 (`E_q[ℓ^n]` unramified iff `ℓ^n | v(q)`, `WD ≅ Sp(2)`), §7.2 4489 (R01), §7.7 5025
  (Sylow injectivity, `H¹(SL₂(F_5), ad⁰)` one-dimensional, coefficient change).
  FaltingsFinitenessAndIsogenyTheorems R28.6.2 2688, R28.6.3 2716.
  NeronModelsAndSemistableAbelianVarieties §3.1 1454 (`toric_zero`), §3.12 1901, §5.1 3024.
  GL2ModularityLifting §1.7 419 (`cht_soluble_prescribed_completions`, arbitrary number field).
  GL2AutomorphicRepresentationsAndTransfer R16.3.2 962, R17.4.16 2693.
  AbelianSchemesAndArithmeticModuli A6 2804. PotentialModularityAndCompatibleSystems §2.12–2.16
  764–816. AutomorphicGaloisRepresentations §3.13 2271. ModularityAndLanglandsExtensions §2.29 1272,
  §2.30 1293. SchemeAndStackFoundations §4.13 5644, §4.18 6110. EllipticCurves (main) Layer 4 794,
  Layer 5 1155. ClassFieldTheory (main) Layer 5 921, Layer 11 1684. Chebotarev (main) Layer 10 411.

**Sources: the seeded sample, read at the locators in the cached texts.**
- 1.1: MilneCM Proposition 1.4 (lines 273–287, printed p. 10, marker at 265), the "exactly one
  complex conjugation" remark (289–290), Corollary 1.5 (292–295: a finite composite of CM subfields
  is CM, the Galois closure is CM). LeHung26 Lemma 5.1 (357–360): abelian extension of CM fields,
  descent one cyclic step at a time. The README's route (centrality of `ι`, totally real fixed field,
  `ofCMExtension`) is its own and the two cited facts support it.
- 1.2: LeHung26 318–321 ("decomposed genericity: over `K` for `A_t[5]`, and over `F` for the pairs";
  absolute irreducibility on `G_D ⊂ G_{F(ζ_ℓ)}`). The descent (a)–(b) is proved in full here.
- 2.1: LeHung26 §4.5(1) line 336, §4.6 lines 342–351 ("by [14, Theorem 6.1], `A_t` is modular over
  `K`, hence over `F` by solvable base change, cuspidally since `A_t` is non-CM"), Remark 4.2 lines
  352–355; CN23 Theorem 6.1 lines 4513–4520 (`ζ₅ ∉ F`, condition (2) on `r_{E,5}`).
- 2.2: LeHung26 §4.3 line 292–299, the table 346–349 (rows `V_η →_p V_χ` with `(3, p)`, `V_χ →₃ V_ψ`
  with `(p, 3)`, `V_ψ →_p V₁` with (13)), line 350 (descent and twist); CaptainSude26 Proposition 6.2
  line 634. OpenAI26 Proposition 9.3 and Lemma 9.4 (pp. 26–27) as cited by the parent.
- 2.5: LeHung26 Theorem 1.1 line 86–88 ("every CM number field `K` with `ζ₅ ∉ K`"), §4.6, Lemma 5.1.
- 3.1: CaptainSude26 Lemma 3.1 lines 187–191 (`e, f, h`; `D(e) = e`, `D(h) = h − 2e`,
  `D(f) = f + h − e`).
- 3.2: CaptainSude26 Lemma 3.3 lines 231–241 (index 24, Sylow restriction injective,
  `H¹(⟨U⟩, M) = ker N/(D − 1)M = k[f]`).
- 3.3: CaptainSude26 Lemma 3.1 lines 177–183 (`μ₅ ⊂ F_v`, `ρ̄(τ) = U`, `ρ̄(φ) = 1`, `φτφ⁻¹ = τ^{q_v}`)
  and lines 533–536 (nontrivial unipotent residual inertia iff `v(Δ) ≢ 0 mod 5`; Frobenius made
  trivial by a change of tame lift). The README's definition is the generalisation to any `q_v`
  and any residual Frobenius, re-derived (table).
- 5.1: CaptainSude26 §4 lines 264–289 (`S = S₅ ⊔ R ⊔ P`, `P ≠ ∅`, `P^c ∩ S = ∅`, the three field
  conditions, `ρ̄` onto `SL₂(𝔽₅)` decomposed generic, trivial at `S₅ ∪ R`, Lemma 3.1 form at `P`,
  `π` unramified outside `R ∪ P ∪ S₅^st` with Iwahori invariants there, ordinary conditions at
  `S₅^st`); CN23 §5.6 data (1)–(15) lines 4226–4260.
- 5.2: CaptainSude26 lines 285–289 (`R^BT_v`, `R^△_v`, `R^{ε₅⁻¹, χ_v}_v`, the Steinberg ring at `P`,
  `𝒮_χ`); CN23 line 4361 (the problem `𝒮_χ`).
- 5.3: CaptainSude26 Lemma 4.1 lines 291–302 and proof 306–341 (`S_aux`, `R_aux`, unramifiedness at
  `P^c` as part of ACC 3.1.1, full Iwahori level with trivial character gives `(X − 1)²`, descent
  coefficient by coefficient, Lemma 3.1 over the nonreduced quotient); CN23 Propositions
  5.6.2–5.6.3 lines 4334–4390 (`N` depending only on `[F:ℚ]`; 5.6.3 invokes ACC Theorem 3.1.1);
  ACC23 §3.1 lines 2309–2345 and Theorem 3.1.1 lines 2346–2355, matching the gap text clause by
  clause (`S = S^c`, the condition outside `S`, `R` prime to `p` with imaginary quadratic
  splitting, `Iw_{v,1} ⊆ K_v ⊆ Iw_v`, hyperspecial on `R^c − R`, `T = S − (R^c − R)`, `N` depending
  on `n` and `[F:ℚ]`, `I_R^N = 0`, conclusions (1)–(2) for `σ ∈ W_{F_v}`).
- 6.1: CN23 end of the proof of Theorem 5.2 lines 4433–4509 (the set `V`, `F₀` with Iwahori
  invariants everywhere, unipotent ramification with `q_w ≡ 1`, residue fields larger than `𝔽_p`,
  the degree inequality, three imaginary quadratic composita, `S = S_p ∪ R` when `ζ_p ∈ F`);
  CaptainSude26 Proposition 5.2 proof lines 542–603 (trivial prescriptions above `q` and below `V`,
  CHT Lemma 4.1.2, degree-eight multiquadratic, ACC §6.5.12 helpers, `P` the places above `v` with
  conjugates good and outside `S`).
- 7.1: CaptainSude26 Lemma 5.1 lines 503–519 (`R₀` of order `6p`, étale elliptic cover with torsion
  class of order 3, three nodes of thickness one, the involution fixing one node and acting by `−1`
  on both branches, `xy = s` to `uv = s²`, cycle of three rational components, `I₃`, `f(O) = 1`, `R₀`
  not 2-torsion so `x` étale).
- 7.2: CaptainSude26 Lemma 5.1 lines 520–532 (spreading out, `q ≥ 7` split completely in the chosen
  field and the normal closure of `K`, `q_{A_t} = c s³ h(s)`, `v(s) = k` with `5 ∤ k`, good-reduction
  opens at the other `q`-places including `v^c`).
- 7.4: CaptainSude26 Proposition 5.2 lines 538–571 and 596–603; CN23 Proposition 6.1.5 lines
  4574–4598 (`ρ̄` with `det = ε̄₅` decomposed generic, the partition, `F^avoid`, conclusions
  (1)–(5)); CHT08 Lemma 4.1.2 (printed p. 116).
- Also read: CN23 Theorem 5.2 lines 3849–3872, Lemma 6.1.4 lines 4562–4572 (stated for `r_{E,5}`;
  the order-two case needs `𝔽₅`-coefficients, the order-four case holds generally), Lemma 5.6.4 and
  the Taylor–Wiles selection lines 4397–4409 (the README's "CN23 line 4404"); LeHung26 Remark 1.3.1
  lines 125–130; CaptainSude26 Theorem 1.1 lines 26–30, Proposition 2.3 lines 120–125, Corollary 5.3
  lines 604–609. Printed pages checked against the markers for every locator above. All eight
  manifest entries are in the cache with the recorded SHA-256; every cited work has one key; the
  `cited_for` "1.3" of LeHung26 is `plan.json`'s Layer 1 example target `K60_example`, carried by the
  README's Layer 1 Examples paragraph; no `needs-references.toml` was needed.

**Adversarial pass.** Values by hand or by `calc/adv.py` in the scratch directory (pure Python:
matrix groups by breadth-first generation over `𝔽₅` and `𝔽₂₅ = 𝔽₅[μ]/(μ² − 2)`, cocycle spaces by
consistency along the Cayley graph of `SL₂(𝔽_q)` on `U`, `Uᵀ`, exhaustive normalizer search in
`PGL₂(𝔽₂₅)`, degree enumeration for §5.1).

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 6.2 protected alternative (repaired) | `ζ₅ ∈ F`, (4) fails, coefficients `k̄` | `ε̄₅⁻¹` trivial on `G_F`; projective image `PSL₂(𝔽₅)`; preimage in `SL₂(k̄)` is `{λg : λ² = 1} = ±SL₂(𝔽₅) = SL₂(𝔽₅)`; a subgroup onto `PSL₂(𝔽₅)` has order `60` or `120`, even, contains the unique involution `−1`, so equals `SL₂(𝔽₅)` | sketch valid; hypotheses of §6.1 met | — |
| 6.2 first Check, `𝔽₅` | `⟨SL₂(𝔽₅), diag(1, −1)⟩` | order `240`, determinants `{1, 4}`, projective image `60`; kernel indices `60 ≠ 120` | (4) holds | — |
| 6.2 first Check, `𝔽₂₅` | `μ² = 2`, `h = diag(1, 2)` | `det(μh) = (4, 0) = −1`, `tr(μh) = 3μ`, `(μh)² = diag(2, 3)`, order `240`, determinants `{±1}`, projective image `120` (`SL₂(𝔽₅)` inside: `60`), a trace outside `𝔽₅` | (4) fails with `ζ₅ ∉ F`; the hypothesis `ζ₅ ∈ F` is genuine | — |
| 6.2 second Check, det of order 4 | normalizer of `PSL₂(𝔽₅)` | in `PGL₂(𝔽₂₅)`: order `120` by exhaustive search; in `PGL₂(k̄)`: centralizer trivial (perfect, absolutely irreducible), `N ↪ Aut(A₅) = S₅`, so `N = PGL₂(𝔽₅)`; `[G_F:G] ≤ 120 < 240 = [G_F:H]` | (4) holds for every `k` | — |
| 6.2 third/fourth Checks | `F = ℚ(i)`; split Tate with `5 \| v(q)` | `[ℚ(ζ₅):ℚ] = 4 > 2`; inertia `[[1, v(q)t₅],[0,1]] = 1` since `ε̄₅` is unramified at `v ∤ 5` | correct | — |
| 7.5 application (repaired clause) | `K ∋ ζ₅`, `L ⊇ K` | `ζ₅ ∈ L`; `det A_t[5] = ε̄₅` trivial on `G_L`; image `SL₂(𝔽₅)` kept by linear disjointness and perfectness; `⟨[[1,3],[0,1]], [[1,0],[3,1]]⟩` of order `120`, `⟨[[1,3],[0,1]]⟩` of order `5` | protected alternative applies | — |
| 1.1 intermediate fields | `ℚ(i) ⊂ ℚ(ζ₂₀)`; `ℚ(√5)`; `S = {1, 2}`; `ℚ(√−3) ⊂ ℚ(ζ₁₂)` | fixer of `ℚ(i)` is `{1, 9, 13, 17}` with orders `(1, 2, 4, 4)`, cyclic; `ℚ(i, √5)` fixed by `{1, 9}` (`9 ≡ 4 = 2² mod 5`); `ℚ(√5)` real; `L = K`; `ℚ(ζ₁₂)` abelian | Checks correct; `ofCMExtension`'s four hypotheses in scope (totally real fixed field, totally complex `E`, integral, quadratic) | — |
| 1.1 centrality of `ι` | `φ ∘ σ` an embedding | `conj ∘ φσ = φσ ∘ ι` and `conj ∘ φ = φ ∘ ι` give `φ ∘ σισ⁻¹ = φ ∘ ι`, `φ` injective | `σισ⁻¹ = ι` | — |
| 1.2 descent | `K = F = ℚ`; `1 ⊕ 1` mod 3 at `q = 2`; over `ℚ(ζ₃)` | `F_w = K_v = ℚ_q`; ratio `1 ≠ 2 mod 3`; split primes of `ℚ(ζ₃)` are `≡ 1 mod 3` so ratio `1 = q` | (a), (b) hold; converse fails as the Check says | — |
| 2.1 seed before base change | `K₆₀`; imaginary quadratic `K`; CM `A_t` | fixer `{1, 29}`, `29 ≡ 4 mod 5`, `≡ 2 mod 3`, `K₆₀(ζ₃) = ℚ(ζ₆₀) ∋ ζ₅`; parent §5.1 gives `ζ₅ ∉ F` for imaginary quadratic `K`, strong multiplicity one; CM would allow non-cuspidal base change | hypotheses of CN Thm 6.1(2) supplied by parent §7.4(1) descended by 1.2; PAI §2.3(1) needs `r_ι(π)\|G_F` irreducible, given by non-CM | — |
| 2.2 three lifts over CM `F` | lifting primes `3`, `p > 100`; `h(t)` a square | no lift at `5`, so the `ℓ = 5` clause of parent §5.2 never applies; `χ_{h(t)}` trivial gives `π_E = π_B`; `χ² = 1` keeps the central character trivial | route matches LeHung26's table; descent by PAI §2.3(2) along abelian `F/K` | — |
| 2.5 endpoint | imaginary quadratic `K`; `ℚ(ζ₅)`; `K₆₀` | parent's theorem; excluded (`ζ₅ ∈ K`); applies although `ζ₅ ∈ F` | inputs are Theorems 2.1–2.4 only | — |
| 3.1 `ad⁰` | `U`, `−1`, `diag(2, 3)`, `p = 2` | `D` columns `(1,0,0)`, `(3,1,0)`, `(4,1,1)` in `(e,h,f)`, i.e. `D(h) = h − 2e`, `D(f) = f + h − e`; `Ad(diag(2,3)) = diag(4, 1, 4)`; Gram `[[0,0,1],[0,2,0],[1,0,0]]`, det `−2`; `(D − 1)³ = 0`, `(D − 1)²f = −2e ≠ 0` | computations correct; object owned by AGR §7.2 | R01 |
| 3.2 restriction | `SL₂(𝔽_q)`, `q = 3, 5, 7` | `q = 5`: order `120`, `dim Z¹ = 4`, `B¹ = 3`, `H¹ = 1`, `H¹(⟨U⟩) = 1`; `q = 7`: order `336`, `H¹ = 0`, `H¹(⟨U⟩) = 1`; `q = 3`: order `24`, `H¹ = 0`, `H¹(⟨U⟩) = 0` | bijective at `5` only, as stated | — |
| 3.3 normal form | `ρ̄(φ) = [[a,b],[c,d]]`, `ρ̄(φ)Uρ̄(φ)⁻¹ = U^q` | `q = 11`: 20 solutions, all upper triangular, ratio `a/d = 1`; `q = 7`: 20 solutions, ratio `2 = 7 mod 5`; `φ ↦ φτ^x` adds `dx` to `b` | API bullet 2 at every `q_v`; kernel of `I_v → ℤ₅(1)` has order prime to `5`, image in a `5`-group is trivial | — |
| 3.3 Checks | `M = [[0,−1],[1,−1]]`, `Φ = [[4,1],[0,1]]`, `q = 11`; `q = ϖ⁵` | `M³ = 1`, `ΦMΦ⁻¹ = [[4,1],[4,0]] = M⁻¹ = M¹¹`, `tr M = −1`, `det M = 1`, polynomial `X² + X + 1`; `v(q) = 5` gives trivial inertia | non-protected examples correct; `𝔽₅ˣ` of order 4 has no `ζ₃` | — |
| 5.1 degrees | all multisets of multiples of `4`, each `≥ 8`, summing to `16, …, 44` | `d ≤ 36`: none satisfies (ii); `d = 40`: only `(8⁵)`; `(8, 8, 24)` fails at the `24` (complement `8 < 20`); `d = 44`: `(8⁴, 12)`, `(8, 12³)` | third Check correct, minimum `40` | — |
| 5.1 split at five | `5` split in `E ⊂ F`, `v \| 5` | `v^c \| 𝔭̄ ≠ 𝔭`, so `v ≠ v^c` and `F⁺_v̄ = F_v ⊇ ℚ₅(ζ₅)`, `4 \| e` | every five-adic `v̄` splits | — |
| 5.2 local base | `d = 40`, `t = 10`, `R = ∅`, degrees `8` | `1 + 10·(3 + 8) = 111 = 1 + 3t + 2d`; `Σ[F_v:ℚ₅] = 80 = 2d` | protected places add nothing | — |
| 4.3 presentation (used by 5.2, 5.4) | `(d, t, r) = (2,1,6)`, `(2,3,10)`, `(40,10,111)` | `g = 0, 6, 0`; `r + 4t − d = 8, 20, 111`; `r + 4t = 10, 22, 151`; the `−1 + t` is the `n²\|T\| − 1` frame variables of GGD §3.4 against the global scalar, derived: `g = dim H¹_{𝒮^⊥,T}(ad⁰(1)) − h⁰(ad⁰(1)) + Σ_{S∖T}(dim L_v − h⁰) − 3d − 1 + t` | agrees with CLGC §9.3 | — |
| 5.3 inertial polynomial | full `Iw_v`, trivial character; `Iw_{v,1}`; `Q = ∅` | unit torus operators act as `1`, `P_{v,σ} = (X − 1)²` for `σ ∈ I_v` (`Art⁻¹(I_v) = O_v^×`); at `Iw_{v,1}` they act through `k_v^×`; `Δ_∅ = 1` | route sound modulo the declared gap; `S_aux ∖ (R_aux^c ∖ R_aux) = S ∪ Q` | — |
| 6.1 preparation | `v = v^c`; index-five ramification; `ℚ(ζ₅)` | contradicts unramified at `v^c`; `U⁵ = 1`; only quadratic subfield `ℚ(√5)` | hypotheses necessary; trivial prescriptions below `P` keep `P` split since `v̄` splits in `F` | — |
| 7.1 degeneration | involution on three nodes; `p = 101` | fixed points `1` or `3`; three fixed nodes give two rational curves meeting in `3` points, `p_a = 2`; `2j ≡ m mod 3` has one solution for each `m`; thickness `1 + 1 + 1 = 3 = 2 + 1`; `2n = 606 ≠ 2` | (a)–(d) consistent, `I₃` | — |
| 7.2 local opens | `v(s) = 5, 1, 7`; `q = 5`; `v^c` | `v(Δ_min) = 15, 3, 21`, residues `0, 3, 1 mod 5`; `q = 5` not prime to the coefficient prime; `q` split completely in `K ∋ ζ₅` forces `q ≡ 1 mod 5` so `μ₅ ⊂ K_v` as §7.3 needs | Checks correct; both (a) and (b) are local conditions at distinct places, admitted by parent §7.4 | — |
| 7.4 retained switch | `Σ = ∅`; `Σ` above `2`; split completely | reduces to `switch_five`; conflicts with the Tate condition; `L_{w'} = F_w` so `Ω_w` is meaningful | correct; `hilbert_local_selection` admits finitely many opens | — |
| 8.1 headline | `ℚ(ζ₅)`, `K₆₀`, imaginary quadratic, `ℚ(i, √5)` | only quadratic subfield of `ℚ(ζ₅)` real; fixer `{1, 29}`; `(ℤ/2)²` vs `C₄` | branches consistent with 2.5 and 7.5 | — |
| 2.3 Satake direction | good place `q = 4`, `a = 4` | `T² − 4T + 4 = (T − 2)²`, unitary roots `2/√4 = 1`; `a = 2√q` exists for square `q` (Waterhouse) | shift `s − 1/2` pinned | — |
| 2.4 CM branch | `y² = x³ − x`, `y² = x³ + 1` over `ℚ(ζ₈)` | `i ∈ ℚ(ζ₈)`: isobaric sum; `√−3 ∉ ℚ(ζ₈)`, `ℚ(ζ₈, √−3) = ℚ(ζ₂₄)`: induction | correct | — |
| Conventions: Frobenius | `U` over `𝔽₅`, `q = 11, 7` | `U¹¹ = U`; `U⁷ = [[1,2],[0,1]]`; `7⁻¹ ≡ 3`, `U³ = [[1,3],[0,1]]` | arithmetic Frobenius pinned | — |
| 3.5(b) counting | `#H¹(M) = #H⁰(M)#H⁰(M(1))` | AGD R02.4.2 proves the annihilator statement for unramified `M`; here `M` is ramified at `v`, and the README re-derives it from the Euler characteristic and perfect pairing of Tau Ceti | hypothesis drop justified by the route | — |

**Context and generality.** Every sampled theorem names its field hypotheses; Layer 3 is stated for
odd `p` (`p ≥ 5` where the norm vanishing needs it), Layers 4–6 at `p = 5` with the reason computed
(`H¹(SL₂(𝔽_q), ad⁰) ≠ 0` only at `q = 5` among `3, 5, 7`). Steps taken from inside proofs
(CaptainSude26 Lemma 3.1 at general `q_v` and general residual Frobenius; the `−1 + t` of the
presentation; CN Lemma 6.1.4 beyond `𝔽₅`) were re-derived at the generality restated here.

**Gap.** `acc-torsion-inertial-comparison`: supplier AutomorphicGaloisRepresentationsPartII AG2.5
(earlier in the merge order), a one-sentence `needs`, hypotheses spelled out against ACC23 §3.1
clause by clause (above), needed exactly by 5.3, provided by none of Mathlib, Tau Ceti, AG2.5 at
its head, PotentialAutomorphyInfrastructure (§0.11 is ACC Theorem 2.4.8), any roadmap on main or at
an open head. Same slug in `plan.json` (`gaps[0]`, `neededBy: ["5.3"]`, 5.3's prerequisites) and in
the README (lines 264, 874, 929). Precise, minimal, declared; the acceptance of the next round is
conditional on it.

**Shape and policy.** Summary; Scope and ownership; Conventions with computed witnesses; Exact
supplier contracts (with the gap under Supplier obligations in the required form); How to read the
build; eight layers each ending with Examples and Dependencies; Downstream consumers; References.
Four definitions (3.1, 3.3, 5.1, 5.2) with API lists and 4, 4, 4, 3 Checks; twenty-three theorems
with hypotheses, locator and three or four Checks; `*Needs:*` lines item by item. `plan.json`: 28
targets including the Layer 1 example, 91 tests, the four tests of 6.2 equal to its four Checks.
No pull-request number, date (the References dates are the sources' own), round label, machine
path, LaTeX delimiter, "optional", "deferred", or `lemma` keyword outside source locators (grep).
Elaboration: not available (this lane does not elaborate); the design plans no Lean declaration, so
there is no `#check` comparison and no padding probe. Headline theorems: 2.5, 6.2, 8.1, none statable
at the pins (carriers above), all three to be named in the module docstring as the README's Lean
paragraph says.

## Not verifiable

- The global patching argument of CaptainSude26 Theorem 4.2 and its support propagation through
  CN23 §5.4 are unrefereed; the dimension counts, the dual Selmer formula, the Taylor–Wiles
  detection, the Hecke-side identities and the field conditions were checked against CN23 §5.6 and
  ACC23 §3.1; the patching argument itself was not re-proved.
- Whether a Galois representation with image `⟨SL₂(𝔽₅), μh⟩ ⊂ GL₂(𝔽₂₅)` and `det = ε̄₅⁻¹` exists
  over some CM field is not settled; the repaired Check needs only the group-theoretic contrast.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0244ac96c6e174674a5ec2f94a487a36cfddc7a6", "job": "REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~4", "model": "fable", "worker": "chris-x10"} -->

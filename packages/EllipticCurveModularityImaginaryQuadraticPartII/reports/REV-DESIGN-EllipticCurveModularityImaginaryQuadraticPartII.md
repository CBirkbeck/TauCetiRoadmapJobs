<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7660#issuecomment-6702268484 -->
Review (claude) of 1aeb814

Verdict: needs_changes

1. **F01** (P3) Gap slug absent from the README

   Location: `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md` line 255,
   "**AutomorphicGaloisRepresentationsPartII, AG2.5: the torsion inertial comparison at Iwahori
   places.**" (Supplier obligations).

   Claim: the gap is declared where the intake reads it, with the same slug in `plan.json` and in
   the README.

   Witness: `design/plan.json` `gaps[0].slug = "acc-torsion-inertial-comparison"`, needed by 5.3;
   `grep -n "acc-torsion" design/README.md` returns nothing. The README states the obligation in
   prose but never names the slug, so the intake cannot match the two.

   Repair: in the Supplier obligations bullet write the slug once, as the package form requires:
   "What AutomorphicGaloisRepresentationsPartII must provide (gap:acc-torsion-inertial-comparison): a
   statement of ACC Theorem 3.1.1 (torsion local–global compatibility at Iwahori places away from
   `p`)", keeping the hypotheses already listed. Also name `gap:acc-torsion-inertial-comparison` in
   the `*Needs:*` line of §5.3 in place of "the torsion inertial comparison requested of … (Supplier
   obligations)". Tested on the instance: `plan.json` 5.3 already lists
   `gap:acc-torsion-inertial-comparison` as a prerequisite, so the two files then agree.

2. **F02** (P3) Locator slip: Milne Remark 1.6 states the converse

   Location: README line 292, "complex conjugation of the Galois closure of `L`, which is CM, is
   central in its Galois group (MilneCM, Remark 1.6, p. 10)".

   Claim: Remark 1.6 supplies centrality of complex conjugation in the Galois group of a CM field.

   Witness: MilneCM lines 296–301 (Remark 1.6) say: if `σισ⁻¹` acts on `K` as `ι` for every `σ`, then
   `K` is totally real or CM. That is the converse implication. Centrality for a Galois CM field
   follows from Proposition 1.4(b) (lines 273–278) with the uniqueness of the complex conjugation
   stated at lines 289–290 ("exactly one complex conjugation"): for every embedding `φ` and every
   `σ ∈ Gal`, `φ ∘ σισ⁻¹ = conj ∘ φ`, so `σισ⁻¹ = ι` by uniqueness.

   Repair: replace "(MilneCM, Remark 1.6, p. 10)" by "(MilneCM, Proposition 1.4(b) and the
   uniqueness of complex conjugation following it, p. 10, lines 273–290)"; update the same locator
   in `plan.json` target 1.1 and in the References entry. The route is otherwise correct: the
   Galois closure is CM by Corollary 1.5 (line 292), and the two-element argument above is Mathlib's
   `NumberField.IsCMField.isConj_complexConj` applied to `φ ∘ σ`.

3. **F03** (P3) Check of §3.3 uses a matrix that does not lie in GL₂(𝔽₅)

   Location: README line 594, "Over `𝔽₅` with `q_v = 11`, `ρ̄(τ) = diag(ζ₃, ζ₃⁻¹)` and `ρ̄(φ)` the swap
   matrix give nontrivial inertia that is not unipotent".

   Claim: a negative control for "protected" with coefficients `𝔽₅`.

   Witness: `𝔽₅ˣ` has order 4, so `ζ₃ ∉ 𝔽₅`; `diag(ζ₃, ζ₃⁻¹)` lies in `GL₂(𝔽₂₅)`. Over `𝔽₅` itself the
   order-three inertia must be irreducible: `M = [[0, −1],[1, −1]]` has `M³ = 1` and characteristic
   polynomial `X² + X + 1` (computed), and `Φ = [[4, 1],[0, 1]]` satisfies `ΦMΦ⁻¹ = M⁻¹ = M¹¹`
   (computed), the tame relation for `q_v = 11`.

   Repair: either write "Over `𝔽₂₅`" in that Check, or replace the pair by
   `ρ̄(τ) = [[0, −1],[1, −1]]`, `ρ̄(φ) = [[4, 1],[0, 1]]` over `𝔽₅`, "which satisfy `φτφ⁻¹ = τ¹¹` since
   `τ¹¹ = τ⁻¹`; inertia has order three and is not unipotent". Tested: both matrices have
   determinant `1` and `4` respectively and the relation holds modulo 5.

4. **F04** (P3) Residual value of the Frobenius parameter in the proof route of §3.4

   Location: README line 607, "the free parameters are the entries `a ∈ 𝔪_A`, `b − 1 ∈ 𝔪_A` of
   `N = [[a, b],[−a²/b, −a]]` and `z ∈ 𝔪_A`".

   Claim: the upper-right entry `z` of `ρ_A(φ)` in the basis `(N e₂, e₂)` lies in the maximal ideal.

   Witness: `z` reduces to the upper-right entry `z̄` of `ρ̄(φ)` in the residual basis `(U e₂, e₂)`.
   By the API of §3.3 (README line 579) `z̄` can be removed by a change of tame lift only when
   `q_v ≡ 1 mod p` and `z̄ ∈ 𝔽_p`; for `k = 𝔽₂₅`, `q_v = 11` and `ρ̄(φ) = 1 + ζ E₁₂` with `ζ ∉ 𝔽₅`,
   `z̄ = ζ ≠ 0`, so `z ∉ 𝔪_A`. (For `q_v ≢ 1 mod p` conjugation by `[[1, y],[0, 1]]` does remove it.)

   Repair: write "`z − z̄ ∈ 𝔪_A`, where `z̄` is the residual upper-right entry of `ρ̄(φ)` in the
   basis `(U e₂, e₂)`". The conclusion `R^{□,ψ,uni}_v ≅ O[[x₁, x₂, x₃]]` is unchanged: the three
   coordinates are `a`, `b − 1` and `z − [z̄]`. Tested on the `𝔽₂₅` instance above.

5. **F05** (P3) The planned `Suggested.lean` states non-headline targets

   Location: README lines 74–80, "`Suggested.lean` states … the definition `sl2AdjointRep` (§3.1),
   the finite-group theorem `sl2Five_adjoint_restriction_unipotent_bijective` (§3.2) and the
   field-theoretic theorem `isCMField_of_intermediate_cyclotomic` (§1.1)".

   Claim: these are the roadmap's acceptance tests.

   Witness: the README's headline theorems are Theorems 2.5, 6.2 and 8.1 (Summary, line 17); none is
   statable at the pins (no automorphic representations of `GL₂` over number fields, no global
   deformation rings, no arithmetic locally symmetric spaces in Mathlib `1b1ccf4b` or Tau Ceti
   `2fd255d9`; `grep -rli automorphic TauCeti` returns only modular-form and lattice files). The three
   planned declarations are a definition not needed to state a headline, a lemma on intermediate
   fields and a computation of one finite-group cohomology group of dimension one: under the
   `Suggested.lean` policy (headline theorems only; definitions only to make a headline statable;
   no small computations) a pull-request review will flag them as padding.

   Repair (package stage): state nothing in `Suggested.lean`; its module docstring names Theorems
   2.5, 6.2 and 8.1 and the carriers each lacks; the README's Lean paragraph says the same and keeps
   no backticked name of this roadmap's own (§3.1, §3.2 and §1.1 remain prose targets with their
   Checks). If the package nevertheless keeps §3.2 as the one statable deep input, its docstring must
   say why, and `isCMField_of_intermediate_cyclotomic` is dropped in any case. (Note for that
   option: `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd` needs `[CommGroup G]`; at the pin
   `Subgroup.zpowers_isMulCommutative` exists in `Mathlib/Algebra/Group/Subgroup/ZPowers/Basic.lean`
   line 116, so `⟨U⟩` can be given the instance, or the statement can use
   `Multiplicative (ZMod 5) →* SL(2, ZMod 5)` with `groupCohomology.map`.)

Five findings, all P3, and no P1 or P2: a fix round applies them before the port. Acceptance after
that round is conditional on the declared supplier gap `acc-torsion-inertial-comparison`
(AutomorphicGaloisRepresentationsPartII AG2.5). No blocking finding: no principle is violated, no supply is upward or cyclic, no statement was
refuted by an instance, every sampled locator points at the stated result, and every library
declaration and supplier section cited exists at the pin or at the supplier's current head.

## Verified sound

**Principles.** The roadmap builds the general lifting theorem (Theorem 6.2, arbitrary
representation over any CM field at `p = 5` with a protected place) rather than an elliptic-only
shortcut; no "good primes only". The parent EllipticCurveModularityImaginaryQuadratic is imported
by section and declaration name (41 names resolved at its head #1048, see below) and never
re-planned; Theorems 2.2–2.4 explicitly apply the parent's §§8.3–8.6 over a CM base. Supply is
one-directional (gate below). No source passage is copied: every cited passage was compared with
the README wording. No computational algorithm. The design states no Lean yet; the planned file
has no `set_option` and no sorry'd data.

**Dependency check.** Run as instructed:

```
candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2375 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Merge-order positions of the cited suppliers (ORDER.txt line):
ArithmeticGaloisRepresentations 42, ArithmeticGaloisDuality 43,
AbelianSchemesAndArithmeticModuli 41, NeronModelsAndSemistableAbelianVarieties 47,
DeformationAndDerivedPatchingAlgebra 59, LocalGaloisDeformationRings 74,
GlobalGaloisDeformations 75, GL2AutomorphicRepresentationsAndTransfer 88,
FaltingsFinitenessAndIsogenyTheorems 148, AutomorphicGaloisRepresentationsPartII 154,
AutomorphicGaloisRepresentations 155, GL2ModularityLifting 163,
PotentialModularityAndCompatibleSystems 164, PotentialAutomorphyInfrastructure 181,
CrystallineLocalGlobalCompatibilityCM 182, EllipticCurveModularityImaginaryQuadratic 183; the
candidate is placed at 184, before ModularityAndLanglandsExtensions (now 184), which is cited only
as a consumer. EllipticCurves, ClassFieldTheory, SchemeAndStackFoundations and Chebotarev are on
main (Chebotarev at `Chebotarev/README.md`, Layer 10 at its line 411). BianchiModularForms is
named only under Downstream consumers.

**Pins.** `lake-manifest.json` of the content checkout: Mathlib
`1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti
`2fd255d997f47c0b5d834ee416c7015d55444ce5`, equal to `plan.json` `baseline` and to the README's
supplier contracts.

**Library declarations opened at the pins** (file:line):
`NumberField.IsCMField` CMField.lean:70; `NumberField.IsCMField.complexConj` :142;
`NumberField.IsCMField.ofCMExtension` :510 (hypotheses `[IsTotallyReal F] [Algebra.IsIntegral ℚ K]
[IsTotallyComplex K] [IsQuadraticExtension F K]`, as the README's route uses);
`NumberField.IsCMField.of_isAbelianGalois` :542; `IsCyclotomicExtension.Rat.isCMField` :564 (needs
`∃ n ∈ S, 2 < n`; the README's "CM or ℚ" covers the complement);
`NumberField.isTotallyComplex_of_algebra` TotallyRealComplex.lean:229;
`LieAlgebra.SpecialLinear.sl` Algebra/Lie/Classical.lean:92 (a `LieSubalgebra`, no group action,
as stated); `Rep.ofDistribMulAction` Rep/Basic.lean:362; `groupCohomology.map`
GroupCohomology/Functoriality.lean:141; `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd`
GroupCohomology/FiniteCyclic.lean:114 (`[CommGroup G] [Fintype G]`, odd degree is
`ker N / im(ρ(g) − 1)` as the README says); `Matrix.SL2.commutator_eq_top`
SpecialLinearGroup.lean:804 (needs `a ≠ 0`, `a² ≠ 1`, i.e. `#k ≥ 4`);
`TauCeti.ClassFieldTheory.eulerCharacteristic_mixed` Local/EulerCharacteristic/Theorem.lean:98
(`#H¹ = #H⁰·#H²·p^([F:ℚ_p]·v_p(#A))`); `TauCeti.ClassFieldTheory.tateDualityPairing_perfect_mixed`
Local/Duality/Perfect.lean:280. Mathlib's CMField.lean has no statement on subfields or
composita of CM fields (declarations listed at lines 70–577): Theorem 1.1 is not a duplicate.
Nothing in Mathlib or Tau Ceti defines the conjugation representation of `SL₂` on `sl₂` or a
decomposed-generic predicate.

**Cross-roadmap citations resolved** (at the heads the index gives):
- Parent #1048: all 41 backticked names cited exist (`cyclicCover m` line 960, `characterSystem θ`
  1262, `complexInfinityParameter z` 2250; the rest by exact name, e.g. `switch_five` 778,
  `potentiallySemistableCM` 1537ff, `cm_modularity` 1601, `simultaneous_specialization` 1987,
  `cyclotomic_switch_field` 1519). The parent's §0.3 targets are stated for "imaginary CM" fields
  (CN's term for a CM field), `potentiallySemistableCM` for any CM `L`, `cm_modularity` for any
  CM `L` with `ζ₅ ∉ L`, `simultaneous_specialization` for any number field with the `(3,5)`
  pair's conditions over `F` and `ζ₅ ∈ D` not `F` (lines 1981–2062): exactly what Theorems 2.1,
  2.2 and 7.5 use. The parent's Downstream section (2352–2404) places other CM fields outside
  its scope and records `K₆₀`, as the Scope paragraph says.
- CrystallineLocalGlobalCompatibilityCM #1182: §7.5 (1447), §8.6 (1561), §8.7 (1588, perfectness
  with `ζ_p ∈ F`), §9.1 (1616, clauses (5)–(15) as quoted in the README), §9.3 (1654, requires the
  projective-field exclusion, which Layer 4 replaces), §9.4–§9.12 (1676–1810). §9.7 and §9.9
  consume `AutomorphicGaloisRepresentationsPartII:AG2.5` for the inertial comparison; §9.11
  adds auxiliary places only when `ζ_p ∉ F`; §9.12 carries clause (4).
- AutomorphicGaloisRepresentationsPartII #? (head in index): Layer AG2.5 (lines 1819–2150) states
  Varma's and Caraiani's characteristic-zero comparisons only; its Iwahori mentions are the
  source constructions; no torsion statement, no `P_{v,σ}`; AG2.7 defines
  `IsDecomposedGenericPrime` (3507), `decomposedGenericPrime_local` (3508), `IsDecomposedGeneric`
  (3529); AG2.0 `AlgHeckeChar.galoisChar` (752). A `roadmaps grep` for "Theorem 3.1.1" over main
  and all open heads finds the torsion statement owned nowhere; the gap is precise, minimal and
  correctly placed.
- PotentialAutomorphyInfrastructure §2.1 (790), §2.3 (820: parts (1) base change with
  `r_ι(π)|G_E` irreducible and (2) descent with the character correction, over imaginary CM or
  totally real `E/F` soluble; its second Check is the CM non-cuspidal case the README cites),
  §2.5 (842). GlobalGaloisDeformations §3.4 (440), §3.6 (495: `H¹_dual` conditions at `S∖T`
  only; dimension formula `h¹_rel = |T| − 1 − Σ_{v|∞} h⁰ + Σ_{S∖T}(dim L_v − h⁰) + dim H¹_dual −
  h⁰(M₀(1))`), §3.7 (566), §5.1 (1081), §5.5 (1245), §5.6 (1282).
  LocalGaloisDeformationRings §1.10 (1430), §2.3 (1692), §2.5 (1723: Steinberg lifts for trivial
  residual data and `q ≡ 1`, as the README distinguishes), §2.6 (1754), §2.8 (1803: framed ring
  `O[[X₁,…,X_{d²}]]`, so relative dimension 3 after fixing the determinant), §2.15 (1916), §2.16
  (1935: `dim L − h⁰ = 1`), §2.21 (2027), §3.14 (2434), §4.14 (2665), §4.15 (2692), §6.6 (2979).
  ArithmeticGaloisDuality R02.2 (28), R02.4.2 (3119; "unramified classes are exact annihilators"
  at 3197 with the hypothesis that `M` be unramified, which §3.5(b) removes by counting).
  ArithmeticGaloisRepresentations §4.3 (2998), §6.3 (3965: `E_q[ℓⁿ]` unramified iff `ℓⁿ | v(q)`,
  `WD ≅ Sp(2)`), §7.7 (4835: Sylow injectivity; `H¹(SL₂(𝔽_q), ad⁰) = 0` for odd `q ≠ 5`;
  `H¹(SL₂(𝔽₅), ad⁰)` one-dimensional; coefficient change). FaltingsFinitenessAndIsogenyTheorems
  R28.6.2 (2688), R28.6.3 (2716). NeronModelsAndSemistableAbelianVarieties §3.1 (1454), §3.12
  (1901: `N ≥ 3` invertible, inertia trivial on `A[N]` ⇒ semistable), §5.1 (3024).
  GL2ModularityLifting §1.7 `cht_soluble_prescribed_completions` (411–413).
  GL2AutomorphicRepresentationsAndTransfer R16.3.2 (896), R17.4.16 (2132).
  AbelianSchemesAndArithmeticModuli Layer A6 (2804). PotentialModularityAndCompatibleSystems
  §§2.12–2.16 (764–816). DeformationAndDerivedPatchingAlgebra §§8.1–8.5 (1584–1673).
  AutomorphicGaloisRepresentations §3.13 (1769). ModularityAndLanglandsExtensions §2.29 (1272),
  §2.30 (1293) (consumer). EllipticCurves Layer 4 (793), Layer 5 (1154); ClassFieldTheory Layer 5
  (920), Layer 11 (1683); SchemeAndStackFoundations §4.13 (5643), §4.18 (6109).
- `roadmaps resolve` reports three "citations found nowhere": `LeHung26, §4.4`, `OpenAI26, §9.4`,
  `CaptainSude26, §4`. These are source locators (manifest ids followed by a section sign), not
  roadmap citations: false positives.

**Overlaps.** `scratch/overlaps.md`: no open pull request changes this roadmap, no cited id is
dropped or defined only by an open revision. Ownership against the open heads was checked by
object: "protected place", "width-three"/`I₃` degeneration of the cover family, the restriction
`H¹(SL₂(𝔽₅), ad⁰) → H¹(⟨U⟩, ad⁰)`, composita/intermediate CM fields and the descent of decomposed
genericity match nothing on main or in any open roadmap. The parent and
CrystallineLocalGlobalCompatibilityCM (the two closest in vocabulary) hand nothing to this
roadmap and own none of its objects: the parent's §5.1 `cyclotomic_switch_field` proves
`ζ₅ ∉ F` for imaginary quadratic `K` only, and CLGC §9.3 and §9.12 carry the clause this roadmap
removes.

**Sources: the seeded sample, read at the locators.**
- 1.1: MilneCM Proposition 1.4 (lines 273–287), Corollary 1.5 (292–295), Remark 1.6 (296–301),
  all on p. 10; Remark 1.6 is the converse (R02). LeHung26 Lemma 5.1 line 357 states descent along
  abelian extensions of CM fields; the CM-ness of intermediate fields is used there, as said.
- 2.1: LeHung26 §4.5(1) line 336 (`ρ̄_{A_t,5}` decomposed generic over `K`, absolutely irreducible
  on `G_{K(ζ₅)}`, `A_t` non-CM); §4.6 lines 342–355 ("`A_t` is modular over `K`, hence over `F` by
  solvable base change, cuspidally"); Remark 4.2 line 352 (`K₆₀`, "we do not claim `ζ₅ ∉ F`");
  CN23 Theorem 6.1 line 4513 (CM `F` with `ζ₅ ∉ F`, condition (2) at five).
- 2.4: OpenAI26 §9.4 lines 1192–1212 (p. 27, page marker at 1161; induction if `M ⊄ K`, isobaric
  sum if `M = K`); LeHung26 lines 364–366; CaptainSude26 lines 676–683 (distinct infinity
  characters give cuspidality of the induction).
- 2.5: LeHung26 Theorem 1.1 line 86 ("every CM number field `K` with `ζ₅ ∉ K`"), §4.6 line 342,
  Lemma 5.1 line 357.
- 3.1: CaptainSude26 Lemma 3.1 line 187 (`e, f, h` and `D(e) = e`, `D(h) = h − 2e`,
  `D(f) = f + h − e` at 191).
- 3.3: CaptainSude26 lines 177–183 (`ρ̄(τ) = U`, `ρ̄(φ) = 1`, `φτφ⁻¹ = τ^{q_v}`, `μ₅ ⊂ F_v`) and
  533–536 (split Tate curve: residual inertia nontrivial unipotent iff `5 ∤ v(Δ)`, residual
  Frobenius unipotent, made trivial by a change of tame lift). The README's definition drops
  `μ₅ ⊂ F_v` and `ρ̄(φ) = 1`; the source proves its lemma in its own setting, and the generalised
  statements of §§3.4–3.5 were recomputed below.
- 4.1: CaptainSude26 Lemma 3.3 lines 231–241 (perfectness gives `L ∩ C_N = F`; inflation;
  Sylow index 24; `H¹(⟨U⟩, M) = ker N/(D−1)M = k[f]`; inflation to inertia injective).
- 4.2: CaptainSude26 Lemma 3.4 lines 242–263 (`g = diag(2,3)`, coinvariants the diagonal line,
  degree-one primes, splitting in imaginary quadratic subfields; Taylor–Wiles tangent space of
  dimension two with zero dual condition); AKT23 Lemma A.5 line 3979 carries the `p = 5`
  projective-field hypothesis that this route removes.
- 5.1: CaptainSude26 §4 lines 264–289 (`S = S₅ ⊔ R ⊔ P`, `P ≠ ∅`, `P^c ∩ S = ∅`, the three field
  conditions, surjective `ρ̄` trivial at `S₅ ∪ R`, Iwahori invariants on `R ∪ P ∪ S₅^st`); CN23 §5.6
  data lines 4226–4260 (clauses (5)–(15) as the README quotes them).
- 5.2: CaptainSude26 lines 285–289 (rings at `S₅^cr`, `S₅^st`, `R`, `P`); CN23 line 4361
  (`𝒮_{χ,Q}`).
- 5.3: CaptainSude26 Lemma 4.1 lines 291–300 (surjective `O[Δ_Q]`-algebra map modulo an ideal of
  exponent `δ` independent of level and `χ`; full Iwahori level with trivial character at `P`);
  CN23 Propositions 5.6.2–5.6.3 lines 4334–4390, which invoke ACC Theorem 3.1.1 at 4352 and 4388;
  ACC23 Theorem 3.1.1 line 2346 (hypotheses at 2331–2339: `v ∈ R` prime to `p`, split in an
  imaginary quadratic subfield, `Iw_{v,1} ⊆ K_v ⊆ Iw_v`, hyperspecial at `R^c − R`; conclusion
  (2): characteristic polynomial of `ρ(σ)` equals `P_{v,σ}` for `σ ∈ W_{F_v}`).
- 6.2: CaptainSude26 Theorem 4.2 lines 410–415 (hypotheses (1)–(3)); CN23 Theorem 5.2 lines
  3849–3872 (conditions (1)–(5)); Lemma 6.1.4 lines 4562–4572 (determinant of order 2 or 4 when
  `ζ₅ ∉ F`; the subgroup of `SL₂(𝔽₅)` surjecting onto `PSL₂(𝔽₅)` is all of it).
- 7.1: CaptainSude26 Lemma 5.1 lines 503–532 (`R₀` of order `6p`, `[3p]R₀` two-torsion; three
  nodes of thickness one; the involution exchanges two and fixes one, acting by `−1` on both
  branches; `xy = s` becomes `uv = s²`; cycle of three rational components, type `I₃`; the
  section `(O, 1)`; `q_{A_t} = c s³ h(s)`).
- 7.3: CaptainSude26 lines 533–536.
- 7.4: CaptainSude26 Proposition 5.2 lines 538–603 (preparation over `K⁺` with CHT Lemma 4.1.2,
  trivial prescriptions above `q`, split-Tate and good-reduction opens, ACC §6.5.12 helpers with
  `q` in the splitting prescriptions); CN23 Proposition 6.1.5 lines 4574–4590; CHT08 Lemma 4.1.2
  is cited by its printed locator (p. 116) through GL2ModularityLifting §1.7.
- Also read: CaptainSude26 Theorem 1.1 line 26, Proposition 2.3 lines 120–125, Lemma 3.2 lines
  221–226, proof of Theorem 4.2 lines 416–498 (`g = r − 3d − 1 + t` at 439; `dim R^loc = 1 + 3t + 2d`,
  `dim R_∞ = r + 4t − d`, `dim S_∞ = r + 4t` at 480–481), Corollary 5.3 line 604, Proposition 6.2
  line 634, proof of Theorem 1.1 line 671; LeHung26 Remark 1.3.1 line 125, §4.3 line 292, §4.4
  lines 302–332; CN23 end of the proof of Theorem 5.2 lines 4433–4509, Lemma 6.1.3 line 4545, use
  of Taylor–Wiles primes line 4404; OpenAI26 Proposition 9.3 line 1131 (p. 26), Lemma 9.4 line
  1163 (p. 27). All eight manifest entries are in the cache with the recorded SHA-256; no entry
  is wrong; no `needs-references.toml` was needed.

**Adversarial pass.** Values computed by hand or by the script in the scratch directory
(`calc/adv.py`: cocycle spaces of `SL₂(𝔽_p)` on `ad⁰` by generator consistency, norm sums,
subgroup orders, residue classes).

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Convention: arithmetic Frobenius `φτφ⁻¹ = τ^q` | `U` over `𝔽₅`, `q = 11, 7` | `U¹¹ = U` (`11 ≡ 1`); `U⁷ = U² = [[1,2],[0,1]]`; `7⁻¹ ≡ 3 mod 5` so the geometric direction gives `U³` | pinned | — |
| Convention: `Ad(U)` on `(e,h,f)` | direct product | columns `(1,0,0)`, `(3,1,0) = h − 2e`, `(4,1,1) = f + h − e` | correct | — |
| Convention: trace form | basis `(e,h,f)` | Gram `[[0,0,1],[0,2,0],[1,0,0]]`, det `−2`; zero in char 2 | odd `p` only, as stated | — |
| 1.1 intermediate fields CM | `ℚ(i) ⊂ ℚ(ζ₂₀)`; `S = {1,2}`; `ℚ(√5)`; `ℚ(√−3) ⊂ ℚ(ζ₁₂)` | `Gal(ℚ(ζ₂₀)/ℚ(i)) = {1,9,13,17} ⊂ (ℤ/20)ˣ`, cyclic of order 4, unique middle field `ℚ(i,√5)`; `L = K`; `ℚ(√5)` totally real; `ℚ(ζ₁₂)` abelian | true for `E ⊇ K`, false for arbitrary subfields; the locator slip is R02 | R02 |
| 1.2 descent of genericity | `K = F = ℚ`; `1 ⊕ 1` mod 3 over `ℚ` vs `ℚ(ζ₃)` | witness `2`: ratio `1 ≠ 2, 2⁻¹`; over `ℚ(ζ₃)` split primes are `≡ 1 mod 3`, ratio `1 = q` | (a),(b) hold; converse fails | — |
| 1.3 `K₆₀` | `(ℤ/60)ˣ` | fixer of `ℚ(ζ₁₅+ζ₁₅⁻¹, i)` = `{1, 29}` (computed); `29 ≡ 4 mod 5`, `≡ 2 mod 3`; degree `16/2 = 8` | `ζ₅ ∉ K₆₀`, `K₆₀(ζ₃) = ℚ(ζ₆₀)` | — |
| 2.1 seed before base change | `K₆₀`; imaginary quadratic `K`; CM `A_t` | `cm_modularity` applies over `K₆₀` (`ζ₅ ∉ K₆₀`), not over `F ∋ ζ₅`; for imaginary quadratic `K` both orders give the same `π_{A,F}`; non-CM is the parent's §7.4(3) | hypotheses exactly the parent's §5.3 and PAI §2.3(1) | — |
| 2.2 three lifts and descent | lifting primes; `h(t)` a square; quadratic step | primes `p, 3, p` with `p > 100`: the five-adic clause of `potentiallySemistableCM` never fires; trivial twist gives `π_E = π_B`; `χ_{h(t)}² = 1` so the central character stays trivial | holds over any CM `K` (intermediate fields CM by 1.1) | — |
| 2.3 local comparison | split mult./pot. good/good; `z = i`; `q = 4, a = 4` | factor degrees `1/0/2`; `diag(i,−i)` trace 0, det 1; `T² − 4T + 4 = (T−2)²`, unitary roots `1, 1`; `[K⁺:ℚ]` complex places (`ℚ(ζ₈)`: 2) | correct | — |
| 2.4 CM branch | `ℚ(ζ₈)` with `y² = x³−x`, `y² = x³+1`; `y² = x³−x` over `ℚ(√−3)` | `ℚ(i) ⊆ ℚ(ζ₈)`: sum; `ℚ(ζ₈)·ℚ(√−3) = ℚ(ζ₂₄)`: induction; `ℚ(i) ⊄ ℚ(√−3)`: induction | correct | — |
| 2.5 endpoint | imaginary quadratic `K`; `ℚ(ζ₅)`; `K₆₀` | reduces to `imaginary_quadratic_modularity`; `ℚ(ζ₅)` excluded; `K₆₀` included although `ζ₅ ∈ K₆₀(μ₃ₚ)` | correct; inputs CN Theorems 5.2 and 6.1 only | — |
| 3.1 `sl2AdjointRep` | `U`, `−1`, `diag(2,3)`; left multiplication; `(D−1)³`, `D⁵` | `diag(2,3)` scales `e` by `2·3⁻¹ = 4`, `f` by `4`, fixes `h`; `Uf = E₁₁ + f`, trace 1; `(D−1)²f = −2e ≠ 0`, `(D−1)³ = 0`, `D⁵ = 1` in char 5 | conjugation, not left multiplication | — |
| 3.2 restriction bijective | `SL₂(𝔽_p)`, `p = 3, 5, 7`, generators `U, Uᵀ` | `p=5`: `|G| = 120`, `dim Z¹ = 4`, `dim B¹ = 3`, `dim H¹ = 1`; `N = Σ_{i<5}D^i = 0`, `rank(D−1) = 2`, `dim H¹(⟨U⟩) = 1`; `f`-coordinate of `c(U)` is a nonzero functional on `Z¹` vanishing on `B¹`. `p=7`: `dim H¹(SL₂) = 0`, `dim H¹(⟨U⟩) = 1`. `p=3`: `dim H¹(SL₂) = 0`, `N = (D−1)²` of rank 1, `dim H¹(⟨U⟩) = 0` | bijective at 5, special to 5 | — |
| 3.3 protected | Tate `v(q) = 1, 3, 15`; order-3 inertia; index-5 base change | inertia `[[1, v(q)],[0,1]]`, trivial iff `5 | v(q)`; `U⁵ = 1`; the order-3 example needs `𝔽₂₅` or `[[0,−1],[1,−1]]` with `Φ = [[4,1],[0,1]]` (`ΦMΦ⁻¹ = M⁻¹ = M¹¹`, computed) | definition discriminates | R03 |
| 3.3 Frobenius form | `q = 11` vs `7` | centraliser of `U` is `a(1 + bE₁₂)`; for `q ≢ 1` conjugation by `[[1,y],[0,1]]` kills the upper-right entry, for `q ≡ 1` only a tame-lift change with `b ∈ 𝔽_p` does | normal form only for `q ≡ 1`, as stated | — |
| 3.4 smooth ring | Artinian `A`; `[[ζ₅,1],[0,ζ₅⁻¹]]`; first-order lifts | `(X−1)²` ⇔ `tr N = det N = 0` ⇔ `N² = 0`; `w = 0`, `x = q y` from `ρ(φ)E₁₂ = qE₁₂ρ(φ)`; `δ² = ψ(φ)/q` with a unique root lifting the residual entry (Hensel, `p` odd); `(X − ζ₅)(X − ζ₅⁻¹) ≠ (X−1)²`; `(1+εf)U` trace `2+ε`, `(1+εh)U` trace 2 det 1; minimal ⇔ `ker N²` of rank 2 ⇔ `N² = 0` | smooth of relative dimension 3 for every `q_v`; residual value of `z` misstated | R04 |
| 3.4 Steinberg relation | `q = 11`, `ρ(φ) = diag(11,1)` | `11·12² = 1584 = 12²·11` | holds | — |
| 3.5 tangent line and dual | `μ₅ ⊂ F_v` (`q ≡ 1`), `q ≡ 2 mod 5` | framed tangent `3 = dim L_v + 3 − h⁰` ⇒ `dim L_v = h⁰`; `dim H¹_ur = dim (M^{I})_φ = h⁰`; `Σ_{i<11}D^i = Σ_{i<31}D^i = I`, `Σ_{i<7}D^i ≠ I` (computed); `dim Z¹ = 4`, `dim B¹ = 2`, `h¹ = 2`; `#H¹ = #H⁰·#H⁰(M(1))`, `#H¹_ur(N) = #H⁰(N)`, cup of unramified classes inflated from `H²(Ẑ) = 0`; `q ≡ 2`: `φ` scales `e` by 2, `h⁰ = 0`, `L_v = 0` | (a),(b) for every `q_v`; (c),(d) need `μ₅` as stated | — |
| 4.1 exceptional classes | no protected place; order-2 inertia; `SL₂(𝔽₇)` | `H¹(G × A, M) = H¹(G, M)` since `M^G = 0`; `I_v ↠ ⟨U'⟩` of order 5, a Sylow subgroup of a group of order 120; inflation injective on `H¹`; `H¹(C₂, 𝔽₅) = 0`; `H¹(SL₂(𝔽₇), ad⁰) = 0` | "protected" necessary | — |
| 4.2 Taylor–Wiles primes | `diag(2,3)`; framing `P`; `H_∅ = 0` | `2·3 = 6 ≡ 1`; `Ad(diag(2,3)) = diag(4,1,4)` on `(e,h,f)` (computed), coinvariants the line of `h`; `κ(σg) ≡ κ(σ) + κ(g)` mod `(Ad−1)M` with `κ(g)` spanning `M`; at `w ∈ Q`: `h⁰ = 1`, `h² = 1`, `h¹ = 2 = dim L_w`, so `L_w^⊥ = 0` | detection needs `P` unframed | — |
| 4.3 presentation | `d=1,t=1,r=3`; `d=2,t=3,r=10` | GGD §3.6: `g = t − 1 − 3d + r + 0 − 0`; `g = 0`; `dim R^loc = 1 + 9 + 4 = 14`, `g = 6`, `dim R_∞ = 20 = r + 4t − d`, `dim S_∞ = 1 + 11 + 10 = 22 = r + 4t`; framing `P` adds `4|P|` to both | consistent with CLGC §9.3 | — |
| 5.1 prepared datum | `P = ∅`; `v^c ∈ R`; degrees `(1,1,6)` and `(1⁸)`, `[F⁺:ℚ] = 8`; residue `𝔽₅` | complementary sums `6 > 4` at the degree-one places, `1 < 4` at the degree-six place; `6 > 4` everywhere for `(1⁸)`; clause (15) fails for image `SL₂(𝔽₅)` with `ζ₅ ∈ F` | definition discriminates | — |
| 5.2 problems | `Q = ∅`; `χ = 1`; `d = 1`, one 5-adic place of degree 2 | `dim R^loc = 1 + 3·1 + 2 = 6`; LGDR §2.5 is for trivial residual data | consistent | — |
| 5.3 Hecke condition | Iwahori with trivial vs `χ_v`; pro-`v` Iwahori | torus operators of units act as 1 at full Iwahori level: `P_{v,σ} = (X−1)²`; with `χ_v`: `(X − χ_v(u))(X − χ_v(u)⁻¹)`; ACC 3.1.1 hypotheses at `P`: prime to 5, split in an imaginary quadratic subfield (5.1(i)), `K_v = Iw_v`, hyperspecial at `P^c` (5.1 `P^c ∩ S = ∅`) | route sound modulo the declared gap | — |
| 5.4 prepared lifting | `ζ₅^{±1}` inertia; ordinary vs supersingular; `d = 1` | not a point of the problem; component mismatch excluded; deficit `d = l₀ = q₀` (CLGC §9.10) | consistent | — |
| 6.1 preparation | index-5 ramification at `P`; `v = v^c` ramified; `F = ℚ(ζ₅)` | `U⁵ = 1`; `v = v^c` contradicts "unramified at `v^c`", so `v` splits over `F⁺`; `ℚ(ζ₅)` has only `ℚ(√5)`; `ζ₅ ∈ F` means no auxiliary places (CLGC §9.11, CN line 4499) | hypothesis at `v^c` necessary | — |
| 6.2 lifting | `ζ₅ ∉ F`, det of order 2 or 4; `ζ₅ ∈ F`; imaginary quadratic `F` | `2² = 4 = −1`, `det(2g) = 4·(−1) = 1` in `𝔽₅`; `[G:H] = [F(ζ₅):F] > 1`; a subgroup of `SL₂(𝔽₅)` onto `PSL₂(𝔽₅)` has index ≤ 2 in a perfect group, so equals it | (4) fails iff `ζ₅ ∈ F` and image `SL₂(𝔽₅)` | — |
| 7.1 width three | involution on three nodes; thicknesses; `p = 101`; local quotient | one fixed node (`2(P₀ + jT') = c₀`, `j` unique in `ℤ/3`); `xy = s` with `x, y ↦ −x, −y` has invariants `u = x², v = y²`, `uv = s²`; thickness `2 + 1 = 1 + 1 + 1 = 3`; `R_*` of order `606`, `[303]R_* = a/2`; `(O,1) ∈ C₃(t)(k)` since `f(O) = 1` | `I₃`, `v(q) = 3 v(s)` | — |
| 7.2 auxiliary opens | `v(s) = 1, 5, 7`; `v^c`; `q = 5`; good reduction at `v' ≠ v` | `v(Δ) = 3, 15, 21`; near `O` the fibre is `E³` with `E³[d]` unramified for odd `d ≠ q`, Néron §3.12 gives semistability, toric rank 0 gives good reduction, NOS passes it to the abelian subvariety `A_t` | `5 ∤ k_v` needed; all places above `q` constrained | — |
| 7.3 Tate places | `v(q) = 3, 15`; non-split; good | inertia `[[1,3],[0,1]]` resp. trivial; residual Frobenius `[[1,b],[0,1]]` made trivial by `φ ↦ φτ^x`, `x ≡ −b/v(q)`; non-split: diagonal `−1`, twist of Steinberg has Iwahori vectors | correct | — |
| 7.4 retained switch | `Σ = ∅`; `Σ` above 2; quadratic completion | reduces to `switch_five`; conflicts with the Tate condition at 2; `L_{w'} = F_w` needs complete splitting | correct | — |
| 7.5 protected seed | transvections mod 5; `det` over `ℚ(ζ₅)`; CM | `⟨[[1,3],[0,1]],[[1,0],[3,1]]⟩` has order 120 (computed), one transvection order 5; `c(η) = 2 − η − η⁻¹ = 3`; `det = ε̄₅` trivial on `G_K`; `SL₂(𝔽₅)` perfect excludes an abelian subgroup of index ≤ 2 | image `SL₂(𝔽₅)`, non-CM | — |
| 8.1 headline | `ℚ(ζ₅)`, `K₆₀`, imaginary quadratic, `ℚ(√−1,√5)` | `Gal(ℚ(i,√5)/ℚ) ≅ (ℤ/2)²` vs `ℚ(ζ₅)/ℚ` cyclic of order 4, so `ζ₅ ∉ ℚ(i,√5)`; both branches agree on `K₆₀` by strong multiplicity one | consistent with the parent and Theorem 2.5 | — |

**Context and generality.** Every theorem names its field hypotheses in its statement (CM, `μ₅ ⊂ F`
where used, `ζ₅ ∉ K` in 2.1 and 2.5); the local Layer 3 is stated for odd `p` and the global
Layers 4–6 at `p = 5`, with the reason (`H¹(SL₂(𝔽_p), ad⁰) ≠ 0` only at 5). No statement is
quantified over arbitrary data without a tie to the construction: switch parameters come from the
parent's §7.4, protected places from `ρ̄`, Taylor–Wiles data from §4.2, the auxiliary curve from
§7.5. No hypothesis contains its conclusion. Imported steps taken from inside proofs (CaptainSude26
Lemma 3.1 at general `q_v`, the counting in §3.5(b), the `I₃` fibre) were re-derived at the
generality restated here.

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti,
parent, CLGC, other roadmaps, Supplier obligations), How to read the build, eight layers each
ending with Examples and Dependencies, Downstream consumers, References. Four definitions (3.1,
3.3, 5.1, 5.2) with API lists of 5, 3, 4, 4 bullets and 4, 4, 4, 3 Checks; twenty-four theorems
with hypotheses, a locator and three or four Checks each; `plan.json` has 28 targets, 89 tests,
one gap. No process residue, no pull-request numbers, no LaTeX delimiters, no "optional" or
"deferred", no `lemma`. Elaboration: not available (this lane does not elaborate; the design
declares no Lean yet).

**Gap.** `acc-torsion-inertial-comparison`: supplier AutomorphicGaloisRepresentationsPartII AG2.5,
`needs` one sentence with the hypotheses spelled out in the README; not provided by Mathlib, Tau
Ceti, AG2.5 at its head or any roadmap (grep above); needed exactly by 5.3; the acceptance is
conditional on it.

## Not verifiable

- The global patching steps of CaptainSude26 (Theorem 4.2) are unrefereed. I checked the
  dimension counts, the dual Selmer formula against GlobalGaloisDeformations §3.6 and the
  Taylor–Wiles detection against the cohomology computed above, and the field conditions against
  CN23 §5.6; I did not re-prove the patching argument itself.
- CHT08 Lemma 4.1.2 was cited by its printed page through GL2ModularityLifting §1.7 and not
  re-read; AKT23 Lemma A.5 was read only to confirm the hypothesis this roadmap removes.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1aeb8148aebeb5002a864a0dea0e5873b23d87b5", "job": "REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII", "model": "fable", "worker": "chris-x10"} -->

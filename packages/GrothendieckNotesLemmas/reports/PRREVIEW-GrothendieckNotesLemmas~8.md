# Review of GrothendieckNotesLemmas (pull request #1431 at cded50d)

**Verdict:** needs changes

This is a full review of the repaired head. The folder changed by 322 lines since `3373787`. The
pins are unchanged: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`. The gate passes every check, the
dependency check reports no problem, and `Suggested.lean` elaborates with 32 `sorry` warnings and
nothing else. There are five findings, all P3, so none is blocking:

- R01: one declaration that the previous repair was meant to remove from `Suggested.lean` is
  still there.
- R02 and R04: two routes and one kept variant do not name the pinned declarations they rest on.
- R03: an overlap with CharacterSumsOverFiniteFields is not recorded.
- R05: one Check claims more than its source.

## Status of the previous review's findings (r7 at 3373787)

- **R01 (1.7 power formula at the pins): partly repaired.** The README part is done. Scope
  (lines 78–81) and the Tau Ceti contract (177–179) cite
  `Commute.mul_pow_eq_pow_mul_pow_mul_commutatorElement_pow_choose_two`. 1.7 (322–328) keeps only
  the odd-prime corollary, and its *Needs:* line names the Tau Ceti theorem. The repair also asked
  to delete the corollary from `Suggested.lean`, but it is still there at line 111
  (`mul_pow_prime_of_commute_commutatorElement`); see R01 below.
- **R02 (2.5 is `Ideal.injective_primaryComponent`): repaired.** Scope 82–84 and the contract
  180–181 cite the instance. The target and its declaration are gone, and 2.6–2.12 became
  2.5–2.11. No roadmap cited a Layer 2 id.
- **R03 (two-line consequences in `Suggested.lean`): repaired.** `Module.Flat.pi_iff`,
  `IsAdicComplete.of_isNilpotent` and `Module.IsTorsion.isFiniteLength` are deleted. README 2.1
  (382–392), 2.5 (456–460) and 2.11 (578–589) name the routes, and the docstring (lines 39–45)
  lists all three.
- **R04 (2.6 is formal smoothness): repaired.** 2.6 (471–481) and the Lean signature carry
  `[Algebra.FormallySmooth S T]`, with the locator Stacks, Tag 031K.
- **R05 (locators of 1.2 and 5.3): repaired.** 1.2 now reads "(own statement, from Lucas's
  theorem)" (242–243). 5.3 reads "(Avron–Seiler–Simon 1994, Theorem 4.1) … is an own statement"
  (770–771).
- **R06 (second-hand Schinzel citation): repaired.** The Schinzel entry is dropped. Mordell 1970
  is cited with pages and DOI (73–74, 868–869) and was read this round; see Verified sound.

## R01 (P3) — 1.7 is still stated in `Suggested.lean` although it follows from the pins in two tactics

**Location.** `TauCetiRoadmap/GrothendieckNotesLemmas/Suggested.lean` lines 108–114,
`theorem mul_pow_prime_of_commute_commutatorElement`. README 214–215: "2.5, 2.11 and the
finite-product form of 2.1 follow from the pins in two lines."

**Claim.** The README excludes two-line consequences of the pins from the acceptance test, but
1.7 is one of them and is still stated. The previous repair asked to delete it.

**Witness.** A scratch probe importing `TauCeti.GroupTheory.Commutator` closes the exact
signature, with no `sorryAx` in its axioms:

- `obtain ⟨m, hm⟩ := hp.dvd_choose_self (by norm_num) (hp.two_le.lt_of_ne' hp2)`;
- `rw [hu.mul_pow_eq_pow_mul_pow_mul_commutatorElement_pow_choose_two hv p, hm, pow_mul, hd, one_pow, mul_one]`.

The inputs are Tau Ceti `GroupTheory/Commutator.lean` line 96 and Mathlib `Nat.Prime.dvd_choose_self`
(`Data/Nat/Choose/Dvd.lean` line 38).

**Repair.**

- Delete the declaration from `Suggested.lean` and from the docstring's headline list. Add 1.7 to
  the docstring sentence on statements that follow from the pins, naming the two declarations
  above.
- In README 1.7, write the statement as 2.5 is written ("This follows in two lines from the
  pins: …") without the backticked Lean name. Add `Nat.Prime.dvd_choose_self` to its *Needs:* line
  and to the Mathlib contract.
- In README 214–215, add 1.7 to the list of statements that follow in two lines.

## R02 (P3) — Routes of 2.3 and 2.8 use pinned declarations that the README does not name

**Location.** README 422–427 (2.3): "(own statement; the forward direction is Stacks, Tag 00IK)
… *Needs:* Mathlib `IsNoetherianRing`, `Module.Finite`, `Module.FinitePresentation`." README
515–520 (2.8): "an injective module extends `r ↦ x` along it".

**Claim.** Mathlib proves the forward direction of 2.3, and Tau Ceti proves the key step of 2.8's
forward direction. The README cites neither, although Scope (34–36) says every target names the
statement it completes in its *Needs:* line.

**Witness.**

- Mathlib `Module.finitePresentation_of_finite` (`Algebra/Module/FinitePresentation.lean` line
  119, over `[Ring R] [IsNoetherianRing R]`) is the forward direction of 2.3. `fg_ker` (line 192)
  gives the converse for `Shrink (R ⧸ I)`.
- Tau Ceti `TauCeti.exists_linearMap_apply_eq_iff_forall_smul_eq_zero`
  (`Algebra/Module/Injective/Hom.lean` line 79) is the extension step of 2.8.
- Scratch probes close both signatures from exactly these declarations, with no `sorryAx`. 2.3
  takes six lines; 2.8 takes five, the converse being `(Module.Baer.of_surjective_smul h).injective`.

**Repair.**

- 2.3: write "(own statement; the forward direction is Mathlib's
  `Module.finitePresentation_of_finite`, Stacks, Tag 00IK)". Add
  `Module.finitePresentation_of_finite`, `Module.FinitePresentation.fg_ker` and
  `Shrink.linearEquiv` to its *Needs:* line and to the Mathlib contract.
- 2.8: name `TauCeti.exists_linearMap_apply_eq_iff_forall_smul_eq_zero` in the route and the
  *Needs:* line. Add it to the Tau Ceti contract with its file.

The declarations may stay in `Suggested.lean`, since neither closes in one tactic.

## R03 (P3) — Overlap with CharacterSumsOverFiniteFields §4.1 is not recorded in Scope

**Location.** README 1.3 (256–261) and Scope "Left to other roadmaps" (38–74).

**Claim.** CharacterSumsOverFiniteFields comes earlier in the merge order (line 154, against 398
here). Its open head states, in §4.1, the vanishing `hasseDeriv k (f ^ q) = 0` for `0 < k < q`
over a finite field, together with the Hasse multiplicity criterion. Over `𝔽_q` that vanishing is
the direction of 1.3 from `expand`, because `f ^ q = expand q f`. The open ArithmeticInterpolationDeterminants pull request
(README line 104–106) already divides the Hasse material between the two roadmaps on this basis.
This roadmap's Scope is silent, so the general form does not say how it differs from the special
case owned there.

**Witness.** CharacterSumsOverFiniteFields README (open head) line 1239: "`hasseDeriv k (f^q) = 0`
for `0 < k < q`". Over `𝔽_3`, `X ^ 3 = expand 3 X`, so 1.3 gives `hasseDeriv 1` and
`hasseDeriv 2` of `X ^ 3` equal to `0`.

**Repair.** Add to "Left to other roadmaps": "*The Hasse multiplicity criterion and
`hasseDeriv k (f ^ q) = 0` for `0 < k < q` over a finite field `𝔽_q`*: CharacterSumsOverFiniteFields,
§4.1. Target 1.3 is the characterisation over every commutative ring of characteristic `p`; over
`𝔽_q` that vanishing is its direction from `expand`, since `f ^ q = expand q f`."

## R04 (P3) — 5.2's Binet–Cauchy identity is Tau Ceti's `Matrix.pairMinor_mul` without saying how it differs

**Location.** README 746–748: "Prove `Finset.sum_sum_mul_sub_mul_mul_mul_sub_mul` … (own
statement in this form)". Scope 61–64 records `Matrix.pairMinor_mul` as the `r = 2` case of
Cauchy–Binet, but 5.2 does not mention it.

**Claim.** A kept variant must say in one clause how it differs from the pinned statement. The
first identity of 5.2 is the `2 × 2` Cauchy–Binet formula for the product of the matrix with rows
`a`, `b` and the matrix with columns `c`, `d`. The sum over ordered pairs is twice the sum over
`i < j`.

**Witness.** Tau Ceti `LinearAlgebra/Matrix/Minor.lean` line 127, `pairMinor_mul`, sums over the
increasing pairs of a middle index type with `[Fintype l] [LinearOrder l]`. For `a = c = (1, 0)`
and `b = d = (0, 1)`, its sum is `1` and 5.2's ordered sum is `2 = 2 (1 · 1 − 0 · 0)`.

**Repair.** In 5.2 add: "This is the `2 × 2` Cauchy–Binet formula, Tau Ceti's
`Matrix.pairMinor_mul`, for the matrix with rows `a`, `b` times the matrix with columns `c`, `d`.
It differs in summing over ordered pairs of a finite set of an arbitrary index type, with no
`Fintype` or `LinearOrder`, which doubles the sum over `i < j`." Add `Matrix.pairMinor_mul` to
5.2's *Needs:* line.

## R05 (P3) — 2.1's third Check claims more than Chase's theorem

**Location.** README 399–401: "by Chase's theorem (Chase 1960, Theorem 2.1) … over a non-coherent
ring some power `R ^ ℕ` is not flat although `R` is."

**Claim.** Chase's theorem gives a product of copies of `R` that is not flat, over some index set
that the theorem does not fix. Nothing in the source makes the index set `ℕ`. If `R ^ ℕ` is flat,
the equational criterion only puts every countable subset of a relation module inside a finitely
generated submodule.

**Witness.** In `chase1960` line 141 (printed p. 460), condition (b) is that the direct product of
*any family* of copies of `R` is flat. The proof of (b) ⇒ (c) (lines 151–152) takes the product
indexed by the relation module `K`.

**Repair.** Replace "some power `R ^ ℕ`" with "some power `R ^ A`, for an index set `A` depending
on `R`,".

## Verified sound

**Gate and build.**

- The worker's gate and a rerun at this head both report every check at `0` and `OK`.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds only
  `README.md`, `Suggested.lean` and `metadata.toml`.
- `lake env lean` on `Suggested.lean` gives 32 "declaration uses `sorry`" warnings and nothing
  else. The `module` / `public import Mathlib` header is the one used on main.

**Dependency check** (`--movable`, candidate merge order):
`depcheck: 240 roadmaps, 2430 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
The roadmap consumes no other roadmap, and no gaps are declared or needed.

**One-tactic probe.** Every `sorry` in a scratch copy was replaced by
`first | (rfl; done) | (infer_instance; done) | (decide; done) | (omega; done) | (simp; done) | (simp [*]; done) | ((nontriviality; simp); done) | (aesop; done) | (grind; done) | (ring; done) | (simp [sum lemmas]; ring; done) | (constructor <;> simp; done) | (exact?; done)`.
All 32 declarations fail it, with 32 errors, one per declaration. The short closures found are
those of R01 and R02; they need Tau Ceti imports or several lines.

**Signatures.** A scratch file with `#check @name` for all 32 declarations elaborates with no
error. Each type matches its README statement, and every binder is in the declaration's own
signature, so nothing was lost. Nothing changed against the worker's `signatures.md`. Spot
checks:

- 1.3 and 1.4 carry `[Fact p.Prime] [CharP R p]`.
- 2.3 carries `[Ring R] [Small.{v} R]`.
- 2.4 carries `[DecidableEq κ]`.
- 2.6 carries `[Algebra.FormallySmooth S T]`.
- 2.8 carries `[IsDomain R] [IsPrincipalIdealRing R] [Small.{v} R]`.
- 2.9 uses `Submodule.IsAssociatedPrime` with the radical (Mathlib
  `RingTheory/Ideal/AssociatedPrime/Basic.lean` line 62).
- 4.1 carries exactly `[LocallyCompactSpace X]`, `[R1Space X]`, and
  `[R1Space X] [LocallyCompactSpace Y]`.
- 5.5 carries `[IsAlgClosed k]`, two `IsScalarTower`s and `FiniteDimensional`.

**Library names.** The README backticks 109 Mathlib and Tau Ceti names. A scratch file with
`#check @` of 108 of them elaborates with no error; its one other line, `Spec`, is prose, not a
Lean name. The 109th, `Matrix.pairMinor_mul`, was read at its source line, because its module is
not built.

**Library declarations opened at the pins.**

Mathlib:

- Lucas: `Choose.choose_modEq_prod_range_choose` (`Data/Nat/Choose/Lucas.lean` 89),
  `eq_pow_multiplicity_of_choose_modEq_zero` (138, not 1.1), `Nat.Prime.dvd_choose_pow_iff`
  (`Data/Nat/Multiplicity.lean` 261, the case `n = p ^ e` only).
- Polynomials: `Polynomial.isCoprime_X_sub_C_of_isUnit_sub` (`Algebra/Polynomial/RingDivision.lean`
  294).
- Groups: `Group.IsPerfect` and `Subgroup.isPerfect_iff` (`GroupTheory/IsPerfect.lean` 41, 50; no
  normal-closure statement).
- Flatness: `Module.Flat.of_retract` and `directSum_iff` (`CommSemiring`).
- Tensor products: `TensorProduct.equivFinsuppOfBasisRight` (`LinearAlgebra/TensorProduct/Basis.lean`
  90, no range lemma).
- Kähler differentials: `KaehlerDifferential.mapBaseChange`, `exact_mapBaseChange_map`
  (`RingTheory/Kaehler/Basic.lean` 745, 781) and `H1Cotangent.exact_δ_mapBaseChange`
  (`JacobiZariski.lean` 552). No retraction statement exists.
- Injective modules: `Module.Baer.iff_surjective` (`Algebra/Module/Injective.lean` 85, not 2.8).
- Derivations: `Derivation.leibniz_zpow` (fields only).
- Compact-open topology: `ContinuousMap.continuous_curry` (`Topology/CompactOpen.lean` 450, needs
  `LocallyCompactSpace (X × Y)`), `continuous_uncurry` (471, needs both factors locally compact),
  `Homeomorph.curry` (556).
- Spectral spaces: `PrimeSpectrum.isOpen_of_stableUnderGeneralization_of_isConstructible`
  (`RingTheory/Spectrum/Prime/ConstructibleSet.lean` 167).
- Grothendieck group: `Algebra.GrothendieckGroup` (`GroupTheory/MonoidLocalization/GrothendieckGroup.lean`
  36, no surjectivity lemma).
- Simple modules: `IsSimpleModule.algebraMap_end_bijective_of_isAlgClosed`
  (`RepresentationTheory/AlgebraRepresentation/Basic.lean` 28) and
  `Module.Finite.toModuleEnd_moduleEnd_surjective` (`RingTheory/SimpleModule/Basic.lean` 573).

Tau Ceti:

- Supplier contract: `GroupTheory/Commutator.lean` 96; `Algebra/Module/Injective/Noetherian.lean`
  (`Ideal.injective_primaryComponent`, `[Small.{v} R]`); `RingTheory/AdicCompletion/Nilpotent.lean`
  (`I ^ k • ⊤ = ⊥`); `RingTheory/Length.lean` (`Noetherian`, `KrullDimLE 1`, finite,
  nonzerodivisor in the annihilator); `RingTheory/Flat/Pi.lean` (`CommSemiring`, `Finite ι`);
  `RingTheory/Flat/Extensions.lean` 101 (`CommRing`); `Algebra/Module/Injective/PrincipalIdealRing.lean`
  38, 58; `RingTheory/Derivation/Basic.lean` 57; `RingTheory/Semisimple/Trace/Basic.lean` 109
  (`[CharZero k]`, semisimple).
- Checked and different from every target: `Nat.dvd_choose_add_mul_iff` and
  `Nat.forall_not_dvd_choose_iff` (`Data/Nat/Choose/Digits.lean` 58, 146);
  `Nat.Prime.exists_not_dvd_choose` (`RingTheory/FormalGroup/SymmetricCocycle/Basic.lean` 237);
  `IsAssociatedPrime.comap` (`RingTheory/Ideal/AssociatedPrime/Basic.lean` 141);
  `formallyEtale_iff_bijective_mapBaseChange` (`RingTheory/Kaehler/FormallyEtale.lean` 135);
  `IsSemisimpleModule.exists_forall_smul_eq_ite` (its idempotent has trace `dim S`, which can
  vanish in characteristic `p`, so 5.5's rank-one route is needed); the Hasse derivative files
  (no `expand` statement); `LinearAlgebra/Trace/Idempotent.lean` (characteristic zero, not 5.3).

No other pinned statement was found for any target. The searches went by object across the pinned
Tau Ceti (24,239 files) and Mathlib: Hasse derivatives with `expand`, `IsCoprime (X − C a)`,
`choose` determinants, `IsPerfect` with `normalClosure`, `piRightHom`, `FinitePresentation` with
Noetherian, `rTensor` ranges, `mapBaseChange`, divisibility and injectivity, `IsAssociatedPrime`,
`torsionBy` of `K ⧸ A`, unit `zpow` derivations, `mulLeft` commutators, curry continuity,
`StableUnderGeneralization`, right zeros, Lagrange and Binet–Cauchy, `(P − Q) ^`, Grothendieck
groups, and traces of simple modules.

**Cross-roadmap citations resolved.** `roadmaps resolve` reports none missing. Each citation was
also read at its source.

On main (`eaf17b1`):

- ClassicalArithmeticCompletion §3.6 (line 5447, `IntValuedPolynomials.ringChoose_X_mem` at 5460),
  §3.43 (6596) and §3.57 (7008).
- PadicMeasuresIwasawaAlgebras §6.4 (3845; `compound_mul` at `Suggested.lean` 1036).
- DiophantineApproximationAndTranscendence §2.5 (1217; `plucker_cauchyBinet` at `Suggested.lean`
  84).
- DerivedModuleAlgebra §§0.4, 0.7, 0.8 (815, 949, 1018).
- QuantumEnvelopingAlgebras §0.3 (267).
- OperatorTheory/Majorization MAJ-A26 to MAJ-A31 (173–185).
- GrothendieckEulerForms Layer 0 ("bicartesian characterization" at 194).

At open heads:

- AlgebraicKTheory §1.3 (254) and §4.2 (445).
- StableHomotopyKTheory §3.8 (1069; "the subgroup generated by all perfect subgroups is perfect and
  normal").
- ArithmeticStatisticsPartIV §3.2 (129).
- HomotopyTheoryOfCategories 0.1–0.3 (221, 256, 282) and 8.4 (1041).
- PCurvature cites §3.2 with both Lean names (lines 125, 254, 339), matching Downstream consumers.

**Ownership against open work.** `roadmaps grep` was run over main and all 472 open heads for 16
object patterns, one per target group. The only other owners found are CharacterSumsOverFiniteFields
§4.1 (R03) and Tau Ceti's `Matrix.pairMinor_mul` (R04). The worker's overlap report and this search agree:

- no open pull request changes this roadmap;
- no cited id is dropped;
- the only ids of this roadmap cited elsewhere are PCurvature's §3.2 and
  ArithmeticInterpolationDeterminants' unnumbered pointer to "the general Hasse-kernel targets".

**Sources** (the seeded sample and every locator in the README):

- `stacks-algebra` (cached Stacks algebra chapter; no key in `sources.toml`):
  - Lemma 51.1, Tag 00IK, line 5659, p. 120: a finite module over a Noetherian ring is finitely
    presented. This is 2.3's forward direction.
  - Proposition 89.3, Tag 059K, line 9878, p. 210, (1) ⇒ (2) by a presentation, as 2.2 says.
  - Lemma 119.11, Tag 00PF, line 13488, the closest source cited in 2.11.
  - Lemma 138.9, Tag 031K, line 17350, p. 370: the sequence is split exact for `B → C` formally
    smooth. This is 2.6 exactly.
- `ega3-1` (Numdam) line 462, Chapter 0, Corollaire (9.2.6), printed p. 16 (page header at line
  443): in a Noetherian space, `E` is open iff `E ∩ Y` contains a nonempty open subset of `Y` for
  every irreducible closed `Y` meeting `E`. This is 4.2's route.
- `may-concise` (author's page): Ch. 8 §1, line 2410, p. 57, `F(X ∧ Y, Z) ≅ F(X, F(Y, Z))`; §2,
  line 2435, p. 58, `F(ΣX, Y) ≅ F(X, ΩY)`. Ch. 5 (line 1616) is the compactly generated setting.
  This supports 4.1's non-target remark.
- `chase1960` line 139, Theorem 2.1, printed p. 460 (see R05).
- `mordell1970` (fetched this round from the ICM digital library linked from EuDML; OCR of an
  image-only scan):
  - Lines 13–24: for polynomials of degree at most 4, not all constant, a representation
    `P³ + Q³ + R³ + S³ = Lx + M` with `M ≡ 4 mod 9` is impossible.
  - Line 128, p. 368: "This contradiction establishes the main result". So pp. 365–368 is right.
  - Mordell credits the theorem to Schinzel (lines 18–21) and gives a simpler proof (line 43).
    "Mordell proves" is therefore accurate. "Schinzel's theorem, in Mordell's proof" would credit
    it more precisely; this needs no change.
- Sampled targets marked "own statement" (1.3–1.7, 2.4, 2.8, 2.9, 3.1, 4.1, 5.1) and 5.3 and 5.5
  were recomputed in the table below. The 4.1 proofs:
  - With `X` locally compact: compact neighbourhoods `C ⊆ {x' : curry f x' ∈ B}`, then
    `C × L` compact.
  - With `X` an `R1Space`: a compact `R1` subspace is regular, so closed neighbourhoods inside the
    compact set `K` are compact.
  - Uncurrying: the same argument on the projection of `K` to `X`, with `Y` locally compact.

**Adversarial table.** One row per target, with the values computed on each side.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `p^e ∣ n ↔ ∀ 0<k<p^e, p ∣ n.choose k` | n=0; e=0; (2,1,6); (2,2,6); (2,2,3); p=4 | n=0: `C(0,k)=0`, both true. e=0: `1 ∣ n`, no `k`. `C(6,1)=6` even. `4∤6`, `C(6,2)=15` odd. `4∤3`, `C(3,1)=3` odd. p=4, n=4: `C(4,2)=6`, `4∤6` | true | none |
| 1.2 `(p^a−1).choose k ≡ (−1)^k`, `k ≤ p^a−1` | a=0; (3,1); (2,2); k=p^a; n=4, p=3 | `C(0,0)=1`. `1,2,1 ≡ 1,−1,1`. `1,3,3,1` odd. `C(2,3)=0 ≢ ±1`. `C(4,1)=4 ≡ 1 ≠ 2` | true | none |
| 1.3 kernel of Hasse derivatives | ZMod 3, X³ and X⁴; e=0; k=p^e; zero ring | coefficient of `X^m` in `hasseDeriv k f` is `C(m+k,k) f_{m+k}`, a unit multiple when `p ∤ C`. `3X² = 3X = 0`, `X³ = expand 3 X`. `4X³ = X³ ≠ 0`. e=0: `expand R 1 = id`. `hasseDeriv 3 X³ = 1`. `CharP R p` with `p` prime excludes the zero ring | true | Scope: R03 |
| 1.4 linearity over `expand` | ZMod 2, f=g=X, k=1; k=2; k=0 | Leibniz with `hasseDeriv i (expand f) = 0` for `0<i≤k`: `X² = X² · 1`. k=2: `1` vs `X²·0 = 0`. k=0 identity | true | none |
| 1.5 `IsCoprime (X−C a) q ↔ IsUnit (q.eval a)` | ℤ, a=1, q=X+1; a=0; q=X−C b; zero ring | ⇒ evaluate Bézout: `v(a) q(a) = 1`. ⇐ `q = q(a) + (X−C a)h`. `q(1)=2`, `ℤ[X]⁄(X−1,X+1) ≅ ℤ⁄2`. `(X+1)−X = 1`. `eval a (X − C b) = a − b`. Zero ring: both sides true | true | none |
| 1.6 `det ((i+j).choose i) = 1` | n=0,2,3; indices from 1 | `1`; `2−1 = 1`; `3 − 3 + 1 = 1`; `[[2,3],[3,6]]` gives `3` | true | none |
| 1.7 odd prime, `⁅v,u⁆` central in `⟨u,v⟩`, `⁅v,u⁆^p = 1` | Heisenberg over ℤ and ZMod 3; 𝔖₃; Q₈ | `(uv)²` corner `3 = 4 − 1`; `(uv)³` corner `6 = 9 − 3`; mod 3 all vanish. 𝔖₃: `d = (1 2 3)`, `(uv)³ = 1 ≠ (1 2 3) = u³v³`. Q₈: `d = −1`, `(ij)² = −1 ≠ 1`. `3 ∣ C(3,2) = 3` | true | R01 |
| 1.8 normal closure of a perfect subgroup | ⊥; 𝔄₅×1 in (𝔄₅×𝔄₅)⋊C₂; ⟨(12)⟩ ≤ 𝔖₃; 𝔄₄ ≤ 𝔄₅ | `⁅N,N⁆` is normal and contains `H`, so `N ≤ ⁅N,N⁆`. Order 3600, perfect. `⁅𝔖₃,𝔖₃⁆ = 𝔄₃`. `⁅𝔄₄,𝔄₄⁆ = V₄` | true | none |
| 2.1 `prod_iff` (semiring); finite `Π` | ℤ×ℤ⁄2; ι=∅; Chase | `ℤ⁄2 ⊗ (2·) = 0`. Retract via `of_retract` (`CommSemiring`). `Π_∅ = 0` flat. Chase gives some `R^A`, not `R^ℕ` | true | R05 |
| 2.2 `piRightHom` bijective for f.p. `M` | M=R; ι finite; M=ℚ, `ℤ⁄2ⁿ` | identity; `piRight`; `Π(ℚ⊗ℤ⁄2ⁿ) = 0`, `(1,1,…)` of infinite order, so `ℚ ⊗ Π ≠ 0` | true (059K) | none |
| 2.3 Noetherian ↔ f.g. ⇒ f.p. | ℤ; `k[x₁,x₂,…]`; noncommutative `Ring`; scratch proof | `(xᵢ)` not f.g. Left Noetherian matches left kernels. The probe proof closes from `finitePresentation_of_finite` and `fg_ker` | true | R02 |
| 2.4 range of `rTensor` in coordinates | ℤ, `2•`, ℤ²; f onto; f=0 | `(2,4)` in, `(2,3)` out. Coordinates of `f.rTensor N` are `mapRange f`. Support finite for ⇐ | true | none |
| 2.5 nilpotent ⇒ `IsAdicComplete` (README only) | ℤ⁄4,(2); I=0; ℤ,(p) | `I² = 0` gives `I^2 • ⊤ = ⊥`. ℤ not complete as `ℤ_p` is uncountable | true | none |
| 2.6 retraction of `mapBaseChange` | k→k[t]→k; T=S; k[t]⁄(t²), char ≠ 2 | `k dt → 0`, `H¹ = (t)⁄(t²)`. Isomorphism. `t dt ↦ 0` in `T dt⁄(2t dt)`, `H¹ = (t²)⁄(t⁴)`. Injective by `exact_δ_mapBaseChange` with `H¹ = 0`; split by projectivity | true (031K) | none |
| 2.7 `q • x ∈ P ↔ q ∈ ℤ` | ℤ⊆ℚ, x=1; x=2; ℤ², (1,2); x=0 | `s a + t b = 1` puts `(1⁄b)x ∈ P`. `1⁄2 ∉ ℤ`; `x = 2·1` excluded; `(3⁄2,3) ∉ ℤ²`. x=0: `m=0` would need `IsUnit 0` | true | none |
| 2.8 injective ↔ divisible; quotients | ℚ⁄ℤ; ℤ; ℤ⁄4 over itself; scratch proof | `2·` misses `1` in ℤ. ℤ⁄4 is self-injective, `2·` not onto. `(2)→ℤ⁄2`, `2↦1`, has no extension (`2y = 0`). The probe proof closes | true | R02 |
| 2.9 regularity on `F⁄pF`; `P ∩ A = p` | ℤ,(2),a=3; p=(4); F=ℤ⁄2; ℤ→ℤ⁄4; ℤ→ℤ[i],(5) | `(pB)F = pF`. `3` acts as `1`. `2·2 = 0`. `2` kills ℤ⁄2. `√ann 1 = (2)` over `(2) ≠ (0)`. `5 = (2+i)(2−i)`. `a ∈ P∩A∖p` forces `x ∈ pF`, colon `⊤` | true | none |
| 2.10 `(K⁄A)[t] ≅ A⁄(t)` | ℚ⁄ℤ, t=6; t=0; unit t; k[x,y], t=x | `(1⁄6)ℤ⁄ℤ ≅ ℤ⁄6`. `(K⁄A)[0] = ℚ⁄ℤ ≇ ℤ`. `0 ≅ A⁄A`. `x⁻¹A⁄A ≅ k[y]`, `Ext²(k,A) = k` | true | none |
| 2.11 finite length (README only) | ℤ⁄12; ℤ; ℚ⁄ℤ; k[x,y]⁄(x); field; zero ring | length 3 (`2,2,3`). Infinite chains for the others. `x` is a nonzerodivisor killing `k[x,y]⁄(x)`. `M = 0` | true | none |
| 3.1 `D(u^n) = n • u^(n−1) • D u` | n=0,−1,−2; x and 2 in ℚ[x,x⁻¹] | `D1 = 0` from `D(1·1) = 2D1`. `−x⁻²`, `−2x⁻³`, `0 = 0` | true | none |
| 3.2 commutator; conjugation | k[x], a=x; a ∈ k; u=x in k[x,x⁻¹] | `D(ay) − aDy = yDa`: identity for `a = x`. `x·D(x⁻¹·1) = −x⁻¹ = (D − x⁻¹Dx)1` | true | none |
| 4.1 curry (X l.c. or R1); uncurry (X R1, Y l.c.) | ℚ×[0,1]; ℝ; f = x − y | ℚ×[0,1] is not locally compact, so Mathlib's lemma does not apply. Proofs as above. `curry f 1 0 = 1` | true | none |
| 4.2 openness criterion | Spec ℤ, {(0)}; Spec ℤ∖{(2)}; Sierpiński | No `W` at `(0)`. `W = E` at closed points. `{1}` open and stable; `{0}` not stable. EGA (9.2.6) plus the generic point | true | none |
| 5.1 right zero ↔ meeting ∧ no group quotient | finite group; {1,a,b} left zeros; (ℤ⁄n,·) | Minimal `pM` lies in every `uM`, so `upM = pM` by cardinality, and `M → Perm(pM)` is trivial. `aM={a}`, `bM={b}`; `f a = f a²`. `0` is a right zero | true | none |
| 5.2 Binet–Cauchy; Lagrange (`RCLike`) | (1,0),(0,1); a=b; a=(1,i), b=ia | `2 = 2`. `0`. `Σ conj a b = 2i`: `0 = 2(4−4)`; without `conj`, `8`. Increasing-pair sum `1`, half the ordered sum | true | R04 |
| 5.3 `tr (P−Q)^(2k+1) = tr P − tr Q` | `[[1,0],[0,0]]`, `[[0,0],[1,1]]`; (2),(0); 𝔽₂ | `(P−Q)² = 1`, trace `0`; even powers give `2`. `C = (P−Q)²` commutes with `P`, `Q`, and `(P−Q)C = (P−Q) − PQP + QPQ`. `tr DPQP = tr DPQ = tr DQPQ`. `8 ≠ 2`. `1 = 1 − 0` | true | none |
| 5.4 common denominators | (ℕ,·); Multiplicative ℕ; {1,e} | `0·2 = 0·3`. `1 = 3 − 2`, `−2 = 0 − 2`. `e·e = e·1` | true | none |
| 5.5 simple modules determined by traces | k[X]; `kᵖ` vs 0 over 𝔽̄_p; `L×L` over 𝔽_p(t) | density gives `a` with traces `1` and `0` (rank-one idempotent). `tr X = λ`. `p·a = 0`. `Tr_{L⁄k} = 0` | true | none |
| Conventions | rows 1.3, 1.4, 1.6, 1.7, 2.9, 4.1, 5.2 | `3X² = 0` over ZMod 3; `hasseDeriv 2 X² = 1`; `[[1,1],[1,2]]`; corner `−1`; `√(4) = (2)`; `curry f 1 0 = 1`; `2 = 2` | consistent | none |

**Checks and examples.**

- All 84 Check bullets (three for each of the 28 targets) were recomputed in the rows above. Only
  R05's bullet overstates its source; none is false, vacuous or a restatement.
- The Examples were recomputed:
  - `X⁴ + X⁸ = expand 4 (X + X²)` over ZMod 2.
  - `C(10,k) = 10, 45, 120, 210`, all multiples of 5.
  - `GL₃(𝔽₂)` is simple.
  - `ℤ[√−5]⁄(2, 1+√−5) ≅ 𝔽₂`.
  - `k(t)⁄k[t]` has `t`-torsion `≅ k`.
  - The cross product collects the pairs `i < j`.

**Headline theorems.** All 28 targets are statable at the pins.

- 25 are stated, in 32 declarations.
- Three are named in the docstring as two-line consequences of the pins: the finite form of 2.1,
  2.5 and 2.11.
- 4.1's homeomorphism is named in the docstring as the bundling of its two continuity theorems.
- No stand-in, no `set_option`, and no sorried data.

## Not verifiable

- Avron–Seiler–Simon 1994, Theorem 4.1 (`ass1994`): settled as uncertified (paywalled). The matrix
  identity of 5.3 was recomputed instead.
- Lang, *Algebra*, XVII Corollary 3.8 (5.5's closest source): Springer, no legal open copy. It is
  the same locator that Tau Ceti's `IsSemisimpleModule.nonempty_linearEquiv_of_trace_eq` cites.
- Lucas 1878: the cached `lucas1878` is a JSTOR "Client Challenge" page (`lucas1878` line 5), not
  the paper, although the manifest records it as `certified`. Lucas's theorem was checked against
  Mathlib's statement instead.
- Manifest (not part of the pull request; this review edits no manifest):
  - The Stacks algebra chapter, EGA III₁ and May's *Concise Course* were read from the cache but
    have no key.
  - `mordell1970` was fetched this round from the ICM digital library (institutional).
  - `cited_for` is stale for `stacks-dualizing` (now Scope), `ass1994` (now 5.3) and `polya1915`
    (no longer cited).

## Source issues

- none

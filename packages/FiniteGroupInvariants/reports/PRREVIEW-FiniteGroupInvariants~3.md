# Review of FiniteGroupInvariants (pull request #1708 at a25c898)

**Verdict:** needs changes

## R01 (P1) — The "finite modulo scalars" Jordan theorem is vacuous through the index-0 junk value

**Location:** `TauCetiRoadmap/FiniteGroupInvariants/Suggested.lean:666–668`, "`∃ A : Subgroup B, A.Normal ∧ IsMulCommutative A ∧ A.index ≤ jordanBound n`"; README 10.5, lines 1286–1289.

**Claim:** a subgroup `B ≤ GL_n(F)` with finite image in `PGL_n(F)` has an abelian normal subgroup of index at most `jordanBound n`.

**Witness:** `Subgroup.index` is `Nat.card` of the quotient, so it is `0` for infinite index. For infinite `B`, `A = ⊥` has index `Nat.card B = 0 ≤ jordanBound n`. Take `n = 1`, `F = ℚ`, `B = GL₁(ℚ) ≅ ℚˣ`: `⊥` satisfies the conclusion. A scratch copy proves the stated conclusion for **every** `B ≤ GL (Fin n) F`, without the finite-image hypothesis: for finite `B` by `jordan_exists_abelian_normal_index_le`, for infinite `B` by `⊥`, `Subgroup.index_bot` and `Nat.card_eq_zero_of_infinite`. It closes with no `sorry` of its own.

**Repair:** require finite index in the conclusion, `A.Normal ∧ IsMulCommutative A ∧ A.FiniteIndex ∧ A.index ≤ jordanBound n`, and write "of finite index at most `jordanBound n`" in 10.5. The repaired signature elaborates. On `B = ℚˣ` the repaired form excludes `⊥` (index 0) and is met by `A = B` (index `1 ≤ jordanBound 1 = 1`). Add `B = ℚˣ, A = ⊥` as a negative-control Check. The README route of `finrank_le_jordanBound` counts cosets of this abelian subgroup, so its index must be finite there too.

## R02 (P1) — The Jordan–Zassenhaus route rests on maximal-order results that nothing owns

**Location:** README 9.1, lines 1127–1132, "every full `ℤ[G]`-lattice in `V` contains `|G| · Λ L` for the maximal order `Λ ⊇ ℤ[G]` … the `Λ`-lattices in `V` fall into finitely many classes".

**Claim:** the route's inputs are Mathlib `MonoidAlgebra`, `Module.Free` and Minkowski's convex body theorem (the `*Needs:*` line).

**Witness:** the route also needs three things that are not targets here, not named supplier sections and not pinned declarations:
- a maximal `ℤ`-order `Λ ⊇ ℤ[G]` in `ℚ[G]`;
- `|G| Λ ⊆ ℤ[G]`;
- finiteness of the classes of `Λ`-lattices (Jordan–Zassenhaus for maximal orders).

Neither pin has maximal orders or reduced norms of semisimple algebras. On main, ClassicalArithmeticCompletion §7.21 defines `IntegralOrder.IsMaximalOrder` but proves no existence over a given order, and §7.10 gives the reduced norm. No roadmap on main states Jordan–Zassenhaus. "The maximal order" is also not unique: `ℚ[S₃] ≅ ℚ × ℚ × M₂(ℚ)` has the `GL₂(ℚ)`-conjugates of `ℤ × ℤ × M₂(ℤ)`. This partly repairs the previous review's R06: Kuroda's formula now has its own target and locator.

**Repair:**
- State as the target Jordan–Zassenhaus for `ℤ`-orders in finite-dimensional semisimple `ℚ`-algebras (reiner-maximal-orders, Theorem 26.4).
- Add targets for the existence of a maximal order containing a given order, and for `|G| Λ ⊆ ℤ[G]`.
- Cite ClassicalArithmeticCompletion §7.21 and §7.10 in the `*Needs:*` line and in the supplier contracts.
- Make `jordan_zassenhaus` for `ℤ[Γ]`-lattices its corollary.
- Write "a maximal order".

AbelianVarietiesOverFiniteFields (an open roadmap) states the commutative case, finiteness of `ICM Λ` (its README line 1683). One general statement serves both roadmaps. Check on `ℤ[C₂]` in rank 1: the corollary gives exactly the trivial and sign classes, as 9.1's Check says.

## R03 (P2) — The gate, re-run on this head, refuses every mention of LocalFiniteGroupTheory

**Location:** README lines 29, 146, 320, 322, 355, 440, 478, 499, 506, 514, 516 and 534 (12 hits). The supplier is cited for Hall's theorem (L1) and for the Fitting subgroup, quasisimple groups, components, `E(G)`, `F*(G)` and Bender (L2).

**Claim:** LocalFiniteGroupTheory L1–L2 supply these objects.

**Witness:** this review re-ran the gate with the command in its brief on this head. The result was `statement-hygiene=3 … dropped=12 … FAIL`, under the rule "no name of the project's dropped-names list". That list names LocalFiniteGroupTheory, an other-author pull request whose material the project's roadmaps own themselves. The worker's recorded gate showed `dropped=0`. Its configuration should be checked against the list. With the citation refused, 0.8 (`fitting ⊤ ≤ R(G)`), 1.5's Check and 1.8 (quasisimple) and 2.1's "iff" (Hall's existence theorem) have no supplier.

**Repair:** remove the 12 mentions and own here what is used:
- the Fitting subgroup as the join of normal nilpotent subgroups, with its nilpotence (Fitting's theorem; a textbook locator);
- `IsQuasisimple` (perfect, with simple central quotient);
- Hall's existence theorem for the "iff" in 2.1, or drop that sentence.

Drop components, `E(G)`, `F*(G)` and Bender from the scope, since no target here uses them. Drop the LocalFiniteGroupTheory dependency from the description as well. Check after repair: `S₃` has `F = A₃ ≤ R(S₃) = S₃`, `A₅` has `F = R = ⊥`, and `SL(2,5)` is perfect with simple central quotient `A₅`.

## R04 (P2) — Four statable headline theorems are absent, and the docstring's reason for two is wrong

**Location:** `Suggested.lean:16–26` ("Two headline theorems of the README are not statable at the pins … Both need the `ℤ[Gal(K/ℚ)]`-module structure"). The README targets are 9.3 (Herbrand), 9.4 (Kuroda's list), 7.4 (Bauer's theorem) and 6.5 (the converse half of the classification, which the summary lists as an end theorem).

**Claim:** these four are not statable, or not headlines.

**Witness:** a scratch copy elaborates all four against the pins, with only `sorry` warnings:
- **Herbrand, in the form 9.3 itself cites** (sutherland-18785 line 122, Theorem 24.6): `∃ ε : InfinitePlace K → (𝓞 K)ˣ`, with `Units.map (RingOfIntegers.mapAlgEquiv σ) (ε w) = ε (σ • w)`, `∏ w, ε w = 1`, and `(closure (range ε)).FiniteIndex`. It uses Mathlib's `MulAction Gal(K/k) (InfinitePlace K)` (`Mathlib/NumberTheory/NumberField/InfinitePlace/Ramification.lean:114`) and `NumberField.RingOfIntegers.mapAlgEquiv` (`Mathlib/NumberTheory/NumberField/Basic.lean:227`). No module structure is needed.
- **Kuroda's list:** the seven types are exactly the subgroups of `(ZMod 2)³` of order at most 4 up to permutation (9.4's own Check). So the list says `unitIndex K k₁ k₂ k₃ ∣ 4` for totally real `K`, stated with this file's `unitIndex` under the hypotheses of `classNumber_mul_eq_unitIndex_mul`.
- **Bauer:** for `F F' : IntermediateField ℚ (AlgebraicClosure ℚ)` that are number fields with equal `dedekindZeta`, `normalClosure ℚ F ℚ̄ = normalClosure ℚ F' ℚ̄`.
- **6.5 converse:** every `χ` has an irreducible `Representation ℚ G V` with character `schurIndex ⊥ χ · rationalCharacter G [χ]`.

**Repair:** add these four statements and remove the docstring's claim. If you keep a form of Kubota's infinitude statement out, give its real missing carrier. Checks:
- Herbrand on `K = ℚ`: one place, `ε = 1`, index 2 in `{±1}`, finite.
- Kuroda's list on `ℚ(√2, √3)`: `q = 4`, which divides 4.
- Bauer on `ℚ(√2)` and `ℚ(√3)`: the zeta functions differ at `3^{−s}`, so the hypothesis fails.
- 6.5 converse on the trivial group: the trivial representation, character `1 = 1 · 1`.

## R05 (P2) — `nonempty_division_equiv_orbits` states only that two finite sets have the same size

**Location:** `Suggested.lean:294–296`; README 3.7, lines 614–615, "prove `nonempty_division_equiv_orbits`: the divisions are its orbits".

**Claim:** the divisions are the orbits of the unit action on classes.

**Witness:** for finite types, `Nonempty (α ≃ β) ↔ Nat.card α = Nat.card β` (`Finite.card_eq`). A scratch `example` proves the stated theorem equivalent to `Nat.card (Division G) = Nat.card (orbits)` in one line. It says nothing about which classes form an orbit: on `A₄` any 3-to-3 bijection satisfies it, including one that pairs the division `{1}` with the orbit of the two 3-cycle classes.

**Repair:** state the identification, `divisionSetoid G x y ↔ ∃ u : (ZMod (Monoid.exponent G))ˣ, u • ConjClasses.mk x = ConjClasses.mk y`. This elaborates. The orbit count then follows, and Brauer's lemma (6.2) is already stated as a count. Check on `A₄`: `(123), (132)` give true/true (`u = 5`), and `(123), (12)(34)` give false/false (orders 3 and 2).

## R06 (P2) — 7.2's route claims the inverse-transpose automorphism preserves every conjugacy class

**Location:** README 7.2, lines 940–942, "the inverse-transpose automorphism exchanges the two actions while preserving every conjugacy class, so the permutation characters agree".

**Claim:** `g ↦ (gᵀ)⁻¹` fixes each class of `GL₃(𝔽₂)`.

**Witness:** let `g` be the companion matrix of `x³ + x + 1`, of order 7. Then `gᵀ` is conjugate to `g`, so `(gᵀ)⁻¹` is conjugate to `g⁻¹`, whose characteristic polynomial is the reciprocal `x³ + x² + 1`. Conjugate matrices have equal characteristic polynomials, so the automorphism exchanges the two classes of elements of order 7. The conclusion of 7.2 holds; the stated reason is false.

**Repair:** argue from fixed spaces instead. The fixed lines of `g` correspond to the nonzero functionals fixed by `gᵀ`, and `dim ker(gᵀ − 1) = dim ker(g − 1)`, so both counts equal `2^{dim ker(g−1)} − 1`. Alternatively: `(gᵀ)⁻¹` is conjugate to `g⁻¹`, which fixes the same points as `g`. Check: order 7 gives `dim ker = 0` and `0 = 0`; a transvection gives `dim ker = 2` and `3 = 3`. Add a Check that the automorphism swaps the two order-7 classes.

## R07 (P2) — 5.2 says `φ_k(G) ≠ 0` iff `G` has a generating set of size `k`

**Location:** README 5.2, lines 732–733.

**Claim:** nonvanishing of the Eulerian function detects generating sets of exactly `k` elements.

**Witness:** `G = C₂`, `k = 5`: `φ₅(C₂) = 2⁵ − 1⁵ = 31 ≠ 0`, but `C₂` has no 5-element subset. A tuple may repeat entries.

**Repair:** write "iff `G` is generated by at most `k` elements (equivalently, by some `k`-tuple)". Check on `C₂`: `k = 0` gives `0` and false/false, while `k = 1` and `k = 5` give `1` and `31` and true/true.

## R08 (P3) — Gate `statement-hygiene` (3 hits), and the same choice in `smithInvariants`

**Location:**
- `Suggested.lean:145`: `compositionFactors` is `(…).some`.
- `Suggested.lean:374` and `:380`: `letI` in the signatures of `eulerian_eq_sum_mobiusSub` and `card_faithful_irreducibleCharacters`.
- `Suggested.lean:164–167`: `smithInvariants` takes `h.choose`. The scanner missed it; the rule ("no choice in the body of a def") covers it.

**Claim:** the statements are clean.

**Witness:** the gate lines above, both in the worker's recorded gate and in this review's rerun.

**Repair:** each repaired form elaborates in a scratch copy.
- Replace `compositionFactors`/`compositionLength` by `GroupCompositionSeries.factors_add`: for `N` normal and series `s` of `G ⧸ N`, `t` of `N`, `u` of `G`, `s.factors + t.factors = u.factors`. Keep composition length in README prose. Check on `S₄`, `N = V₄`: `{C₂, C₃} + {C₂, C₂} = {C₂, C₂, C₂, C₃}`.
- Replace `smithInvariants` and its two theorems by one `existsUnique` statement over lists `l` with `l.Pairwise (· ∣ ·)`, entries `> 1` and `A ≃+ Π ZMod (l.get i)`. Check on `ZMod 6`: `[6]` and not `[2, 3]`.
- Write the two sums as `∑ᶠ H : Subgroup G` and `∑ᶠ N : NormalSubgroup G`.

## R09 (P3) — `IsMetacyclic` is defined in `Suggested.lean` and used by nothing

**Location:** `Suggested.lean:196–197`; README 1.2 says the metacyclic theorem "is consumed from Mathlib rather than proved here".

**Claim:** every definition in the file makes a headline statable.

**Witness:** no theorem of the file mentions `IsMetacyclic`; it occurs only on its own definition line.

**Repair:** delete it from `Suggested.lean` and write "metacyclic" in prose in 1.2, because a backticked own name must be declared in the file. The one-tactic probe found no other padding: all 47 theorems resisted `rfl`, `infer_instance`, `simp`, `trivial` and `decide`.

## R10 (P3) — Sampled targets without a locator, and citations of whole works

**Location:** 0.2, 0.5, 0.7, 1.3, 3.6, 3.7, 6.3, 7.1 and 10.1 cite no source. 1.1 cites `huppert-1954` without a Satz or page. 5.1–5.2 cite `hall-1936` as "Eulerian formula". 4.3–4.4 cite `hall-1940` as "isoclinism and stem groups". 5.4 cites `johnson-1971` as "main theorem" and 6.8 cites `gaschutz` the same way. 10.2–10.4 cite `bbnwz` as "class counts". 4.1 cites `guralnick-1982` with no theorem number.

**Claim:** every target carries a locator. The previous review's R13 asked for this; it is partly repaired.

**Witness:**
- 10.1 is Serre §1.3.1, printed p. 4 (serre-bounds lines 189–192). That text is already in the manifest and is not cited there.
- 7.5's Check gives desmit-perlis lines 52–53 for the class-number ratio 2. Those lines only fix `a = −15`; the ratio is at lines 35–36 (numerical) and 72–75 (proof).

**Repair:**
- Cite serre-bounds §1.3.1, p. 4 at 10.1.
- Give a textbook locator (theorem and page) for each of the standard facts listed: Jordan–Hölder, the socle, A-groups, divisions, the rational character basis, almost-conjugacy, the lattice-stability argument.
- Give the Satz for Huppert 1954.
- Give theorem numbers and pages for hall-1936, hall-1940, johnson-1971, gaschutz, bbnwz and guralnick-1982.
- Change 7.5's locator to desmit-perlis lines 72–75.

## R11 (P3) — Supplier contracts with a wrong name, a missing section, or a pinned declaration not cited

**Location:**
- 9.3 cites `NumberField.Units.dirichletUnitTheorem.unitLattice_rank`.
- 7.4's Bauer route uses NumberFieldArithmetic 1.5 (lines 974–975). Scope (line 51), Exact supplier contracts (line 170) and Layer 7's Dependencies (line 1060) list only 1.4 and 2.1–2.3.
- Lines 53 and 171 cite Chebotarev only as "Completed/Chebotarev Layer 10".
- The conventions define `NormalSubgroup G` without mentioning Mathlib's lattice of the same object.

**Claim:** the supplier contracts name what is consumed, exactly.

**Witness:**
- `#check` reports `Unknown constant`. The declaration is `NumberField.Units.unitLattice_rank` (`Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean:384`; the namespace `dirichletUnitTheorem` closes at line 349).
- NumberFieldArithmetic 1.5 is "Totally split in `L` and in the Galois closure" (`Completed/NumberFieldArithmetic/README.md:602`).
- The density theorem is pinned: `NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet` (`TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean:51`).
- `FiniteIndexNormalSubgroup G` (`Mathlib/GroupTheory/FiniteIndexNormalSubgroup.lean:25`, `Lattice` at line 104) is the lattice of normal subgroups when `G` is finite.

**Repair:**
- Rename to `NumberField.Units.unitLattice_rank`.
- Add NumberFieldArithmetic 1.5 to all three lists.
- Cite the pinned Chebotarev declaration under "From Tau Ceti".
- Cite `FiniteIndexNormalSubgroup` in the conventions, saying `NormalSubgroup` is used because the former has no `⊥` and no complete-lattice structure at the pin, and chief series and `mobiusQuo` need both.

## R12 (P3) — "PolynomialGaloisGroups §4.1" exists only at an open revision, which the description does not name

**Location:** README lines 67–72, "is also stated by PolynomialGaloisGroups §4.1 … an implementation of 7.4 may take that direction from §4.1".

**Claim:** the cited section exists.

**Witness:** on main, `Completed/PolynomialGaloisGroups/README.md` has no §4.1 and no Gassmann text. §4.1 "Gassmann's theorem" is defined only at the head of the open revision of PolynomialGaloisGroups (pull request 763, its README lines 576–578). The other open revision (pull request 986) does not define it. The overlap tool's lead says "main and its merge base do" define it; that lead is false. The pull-request description names neither revision.

**Repair:** name pull request 763 in the description's merge-order paragraph, keeping the README sentence as it is (the previous review's prescription). 7.4 remains the owner of both directions until that revision merges. Check: for `H = K` both sides of Perlis' theorem hold, and §4.1 is not needed.

## R13 (P3) — Style: a process word, one symbol for two invariants, a shadowed Mathlib name

**Location and repair:**
- README line 468: "corrected criterion … the uncorrected" is process narrative. Write "both sides of the criterion are true, while '`e(G) = 1` iff not elementary' would fail here".
- `d(G)` is the derived length in 0.6 (line 283) and the lcm of minimal-index orders in 8.2 (line 1080). Rename the second, for example `d_Malle(G)`.
- `IsComplete` (`Suggested.lean:220`) shadows Mathlib's root `IsComplete` (`Mathlib/Topology/UniformSpace/Cauchy.lean:35`) for any consumer that opens the namespace. Rename it `IsCompleteGroup`.
- The Lean section comment says "faithful linear degrees" (`Suggested.lean:396`) where the README heading says "faithful degrees", and `irrDegreeC` is an irreducible degree. Align it.
- 3.4 ("Count subgroups … with the inequalities between them") and 3.5 state no exact target. State each count and the chain `#char ≤ #normal ≤ #classes ≤ #subgroups`; `Q₈` gives `3 ≤ 6 ≤ 6 ≤ 6`.

## Verified sound

### Repair status of the previous review (r1, at 19a7fe9)

| r1 | Passage at this head | Status |
|---|---|---|
| R01 `e(G)` on the trivial group | 1.7: "`e(G) = 1` iff `G` is trivial or not elementary" | repaired; `1`: product 1, elementary, true/true |
| R02 commutator length 1 | 4.1: "`≤ 1` iff every element of `commutator G` is a commutator, and `= 1` iff moreover `G` is nonabelian" | repaired; `C₂`: length 0 |
| R03 derived-length monotonicity | 0.6: "For solvable `G`: … `d(H) ≤ d(G)`; … `d(G ⧸ N) ≤ d(G)`" | repaired; `C₂ ≤ A₅` is now a Check |
| R04 PolynomialGaloisGroups 1C–1D | no small-degree classification claimed; "transitive groups of a given degree and their classification" is not owned (line 78) | repaired |
| R05 build warning | `module` header; build `0` in both gate runs | repaired |
| R06 two unowned arithmetic inputs | Kuroda now in 9.4 (lemmermeyer Theorem 1); Jordan–Zassenhaus route still unowned | partly: R02 above |
| R07 ℚ-valued basis | 6.3: "every `ℚ`-valued function on `G` constant on divisions" | repaired |
| R08 import CharacterTheory §4.4 | Scope bullet 2; `commProb_def'`, `IsCyclic.card_mulAut` consumed | repaired |
| R09 bounded Diederichsen–Reiner | `diederichsen_reiner (p : ℕ) [Fact p.Prime]`, with no bound | repaired |
| R10 statable headlines | `isRationalGroup_iff_forall_mem_range`, `exists_conj_le_range_int` stated | repaired; four more statable: R04 above |
| R11 order-24 witness bound | removed; 1.8 witnesses up to order 3600 | repaired |
| R12 certificate layer | 10.4 is a theorem with a mathematical route | repaired |
| R13 locators | many added (Theorem 1, Lemma 1, p. 145, Theorem 24.6, Isaacs numbers) | partly: R10 above |
| R14 APIs and Checks | 60 Checks blocks, all with ≥ 3 bullets; every layer ends in Examples and Dependencies (33 headings) | repaired |
| R15 padding | `Out(Q₈)`, `μ` values, small degrees, `jordanBound 1` and constructors deleted | repaired; one unused definition remains: R09 above |

The review at 91dc700 (`~2`) also had five findings:
- R01 (Bauer input): repaired; 7.4 now has a Bauer target.
- R02 (`isMetacyclic_of_isZGroup` in Mathlib): consumed from Mathlib, but the definition was left behind (R09 above).
- R03 (locators): partly repaired (R10 above).
- R04 (Serre Remark 2): repaired; line 1242 now reads "records only that no other dimension is expected".
- R05 (overlap with PolynomialGaloisGroups): repaired as prescribed; R12 above only asks the description to name the revision.

### Gate, build, signatures, probes

- **Worker's recorded gate:** `statement-hygiene=3 … build=0 FAIL`.
- **This review's rerun with the brief's command:** `statement-hygiene=3 … dropped=12 … FAIL` (R08 and R03). The outside-folder diff is empty and the folder has no stray file.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives exactly 47 `sorry` warnings, one per theorem, and no other diagnostic.
- **Signatures:** `#check @` of all 93 declarations elaborated. I compared each with the README:
  - no theorem lost a binder; `[Finite G]`, `[CharZero F]`, `[IsAlgClosed F]` and `[FiniteDimensional ℚ V]` are present wherever the README states them;
  - the definitions `characterField`, `schurIndex` and `irrDegreeC` keep `[Finite G]`, and `IsMonomial` keeps `[Fintype G]`;
  - `exists_fixedPointFree_isPrimePow_of_classification` takes `ClassificationStatement.{0}` with `α : Type u_1`. That is sound by `TauCeti.classificationStatement_of_zero` (`TauCeti/GroupTheory/SpecificGroups/CFSG/Classification.lean:67`).
- **One-tactic probe:** a copy with `first | rfl | infer_instance | (simp; done) | trivial | decide` in place of each `sorry` closed 0 of 47.
- **Scratch probes, all elaborated:** the R01 vacuity proof, the R05 cardinality equivalence, and the repaired or added statements of R01, R04, R05 and R08.
- **Dependency check:**

```text
depcheck: 244 roadmaps, 2460 edges, 0 problem(s)
```

No UPWARD or CYCLE line. InductionRestrictionPartII (order line 49) and ArithmeticStatisticsPartV (line 110) precede this roadmap (line 111).

### Headline inventory

The summary's end theorems, and how `Suggested.lean` covers each:
- **Stated:** Jordan–Hölder for chief and for composition series; Huppert; Hall's converse; Brauer's permutation lemma and the rational-character basis; Brauer–Speiser; the forward half of the rational-representation classification; Taketa (with the supersolvable and Taunt implications); Gaschütz; Perlis; Diederichsen–Reiner; Jordan–Zassenhaus; Kuroda's formula; Minkowski's lemma and bound; the class counts in dimensions 2, 3 and 4; Jordan over characteristic zero; Schur's bound; Collins' value.
- **Statable but absent:** Herbrand, Kuroda's list, Bauer, and the converse half of 6.5 (R04).
- **Stated through a stand-in:** 3.7 (R05).
- **Vacuous:** the finite-modulo-scalars corollary (R01).

### Adversarial table (values computed on each side)

Conventions: `1` is the trivial group, `D_n` is the dihedral group of order `2n`, and `μ(H) = μ(H, G)`.

| Statement | Instances | Values: left / right | Result |
|---|---|---|---|
| 0.1 modular law needs normality | `A₄`: `A=⟨(12)(34)⟩ ≤ C=V₄`, `B=⟨(123)⟩` | `A⊔(B⊓C)` order 2 / `(A⊔B)⊓C=A₄⊓V₄` order 4 | sound: non-modular in `Subgroup A₄` |
| 0.2 `chiefFactors_eq` | `C₆` two series; `1` | `{C₂,C₃}` / `{C₃,C₂}`; `∅` / `∅` | sound; the Mathlib `Iso` is perspectivity (`Mathlib/Order/JordanHolder.lean:90`) |
| 0.3 minimal normal `≅ S^k` | `A₅ ≀ C₂` base; `A₄` | `k=2`, `S=A₅`; `V₄`, `k=2`, `S=C₂` | sound |
| 0.4–0.5 composition series, `factors_eq` | `S₄`; `C₁₂`; `A₅×C₂` | `{C₂,C₂,C₃,C₂}`, length 4 = Ω(24); 3 = 3; length 2 vs Ω(120)=5 | sound; solvability needed for the Ω formula |
| 0.5 quotient additivity | `S₄`, `N=V₄` | `2+2` / `4` | sound (R08 restates it over series) |
| 0.6 derived length | `1, C₂, S₃, S₄, A₅`; monotonicity | `0,1,2,3,0`; `C₃≤S₃`: `1≤2` | sound; `D₈` (order 16): class 3, `d=2 ≤ ⌊log₂3⌋+1=2` |
| 0.7 `isMulCommutative_socle` | `S₄`; `A₅`; `1` | `V₄` abelian / true; `A₅` excluded by solvability; `⊥` | sound |
| 0.8 radical | `A₅×C₂`; `SL(2,5)` | `R=C₂`; `R=Z≅C₂` | sound |
| 0.9 invariant factors | `ZMod 6`; `ZMod 2×ZMod 2×ZMod 3`; `1` | `[6]`; `[2,6]`; `[]` with product 1 | sound; uniqueness holds for `l.Pairwise (·∣·)` |
| 1.1 Huppert | `S₃`; `A₄`; `1` | indices 2,3,3,3 all prime / supersolvable; `C₃` index 4 / not; no coatom / true | true/true, false/false, true/true |
| 1.2 metacyclic | `Q₈`; `C₂³`; `A₄` | `⟨i⟩`, quotient `C₂`; cyclic normal ≤ order 2, quotient non-cyclic; normal `1,V₄,A₄` | true, false, false; Mathlib `IsZGroup.isCyclic_commutator` at `ZGroup.lean:146` |
| 1.3 A-groups | `A₄`; `S₄`; `C₂²` | Sylow `V₄,C₃`; Sylow `D₄`; A-group, not Z | true, false, true/not-Z |
| 1.4 rational | `C₃`; `S₃`; `Q₈`; `1` | `g≁g²`; inverse 3-cycles conjugate; `i∼−i`; vacuous | false, true, true, true |
| 1.5 `isAlmostSimple_iff` | `1`; `A₅`; `S₅`; `A₅²` | false / false (Inn `A₅` order 60 ⊄ trivial range); true/true; true/true (`S₅ ≅ Aut A₅`); false/false | sound |
| 1.6 `isComplete_perm_fin` | `n=0,1,3`; `n=2`; `n=6` | complete; centre `C₂`; `|Out|=2` | sound; hypotheses exclude 2 and 6 |
| 1.7 `e(G)` | `1`; `C₃`; `C₆`; `S₃` | product 1, elementary; 3; 6; 1, not elementary | iff true/true in each; Tau Ceti `IsPElementary` at `Elementary.lean:131` |
| 2.1 Hall's converse | `S₄`; `A₅` | complements of orders 3, 8 / solvable; no subgroup of order 15 or 20 / not solvable | sound |
| 3.1 `Out` | `Q₈`; `C₅` | `24/4=6`; `φ(5)=4` | sound |
| 3.6 divisions | `C₃`; `A₄`; `A₅`; `S₄` | 2 of 3 classes; 3 of 4; 4 of 5; 5 of 5 (rational) | sound; equality iff rational both ways |
| 3.7 orbits | `A₄`, `e=6`; `1`, `e=1` | unit 5: `[(123)]↦[(132)]`, 3 orbits = 3 divisions; one unit with `val 0`, `g⁰=1` | statement only a count: R05 |
| 4.1 Guralnick | `S₄`; `A₅`; `C₂` | `|A₄|=12` commutators (Ore), length 1; length 1; length 0 | sound below 96 |
| 4.2–4.4 isoclinism, stem | `Q₈∼D₄`; `C₂∼C₄`; `D₄×C₂` | `G/Z ≅ C₂²`, `G' ≅ C₂`; trivial; centre `C₂²` ⊄ `G'=C₂`, isoclinic to `D₄` | sound; `C₄` maps to stem `1` |
| 5.1 Möbius | `A₄`; `C₂²` normal lattice | `μ(1)=−(1−1−4+0)=4`; `μ(1,G)=−(1−3)=2` | sound |
| 5.2 Hall's formula | `S₃`, `k=2`; `C₂²`, `k=2` | count 18 / `36−9−12+3=18`; 6 / `16−12+2=6` | sound |
| 5.2 "generating set of size k" | `C₂`, `k=5` | `φ₅=31≠0` / no 5-subset | false: R07 |
| 5.3 faithful characters | `S₃`; `S₄`; `C₂²`; `1` | 1 / `3−2+0=1`; 2 / `5−3=2`; 0 / `4−6+2=0`; 1 / 1 | sound |
| 5.4 Johnson | `C₆`; `Q₈`; `1` | 5 / `2+3`; 8 / 8; 0 / empty family, `⨅∅=⊤=⊥` | sound |
| 6.2 Brauer count | `A₄`; `SL(2,3)`; `C₃` | 3 orbits / 3 divisions; 5 / 5 (3a,3b and 6a,6b merge); 2 / 2 | sound |
| 6.3 rational basis | `C₃`; `A₅`; `1` | table `[[1,1],[2,−1]]`, det `−3`; `(6,−2,0,1,1)`; basis `[1]` | sound over ℚ-valued functions |
| 6.4 Schur index | `Q₈` faithful `χ`; `D₄` | `m_ℚ=2 ∣ 2`, `≤2`, realized over `ℚ(i)` with degree 2; `m=1` | sound; `relfinrank A B=[B:A⊓B]` |
| 6.5 rational representations | `Q₈` dimension 4; `C₃` on `ℚ²` | `(4,−4,0,0,0)=2·(2,−2,0,0,0)`; `(2,−1,−1)=1·(χ+χ̄)` | forward half sound; converse statable: R04 |
| 6.6 rational criterion | `S₃`; `C₃`; `A₄` | true/true; false/false (`ω`); false/false | sound |
| 6.7 monomial | `A₄` (solvable A-group); `SL(2,3)`; `A₅` | monomial; solvable and not monomial (no index-2 subgroup); A-group, not solvable, excluded | consistent with all three implications |
| 6.8 Gaschütz | `S₄`; `C₄²`; `1` | socle `V₄ = ⟨(12)(34)⟩^G`, `irrDegreeC=3`; socle `C₂²` not one class / `⊤`; `⊥=⟨1⟩^G` / 1 | sound |
| 7.1 Gassmann class | `C₂²` index-2 subgroups | `h∈H∖K` fixes 2 cosets of `H` / 0 of `K` | not equivalent; sound |
| 7.2 Fano triple | order 7; involution | fixed points 0 / lines 0; 3 / 3 | conclusion sound; route false: R06 |
| 7.3 common quotient | `ℤ²`, `γ=(1,0)` | fixes 0 cosets of `2ℤ×ℤ` / 2 of `ℤ×2ℤ` | neither side holds; sound |
| 7.4 Perlis | `ℚ(i)`, `H=1`, `K=⊤` | zeta differ / `γ=1` fixes 2 vs 1 | false/false |
| 7.4 Bauer | `ℚ(⁸√−15)`, `ℚ(⁸√−240)` | closure degree 32 (desmit-perlis lines 29–32) | sound; statable: R04 |
| 7.5 invariants | `ℚ(√2)`, `ℚ(√3)` | disc 8 / 12, so the zeta functions differ | hypothesis false; sound |
| 8.1 `b` | `C₃≤S₃`; `C₂²` regular | 2 classes → 1 division; 3 divisions of index 2 | sound; matches ArithmeticStatisticsPartV §3.9 Checks |
| 8.3 prime-power degree | `S₂` on 2 points; `C₂²` regular | `(01)` fixed-point-free, order 2; all involutions free | sound |
| 8.3 FKS | `|α|=1` | no element of prime-power order | excluded by `1 < Nat.card α`; fks line 88 requires `|Ω|>1` |
| 9.1 JZ | `ℤ[C₂]` rank 1; rank 0 | 2 classes (±1); 1 | statement sound; route unowned: R02 |
| 9.2 Diederichsen–Reiner | `p=2`; `p=23` | `h=1`: 3 = `ℤ`, sign, `ℤ[C₂]`; `h=3`: 7 | sound (reiner-1957 lines 139–142) |
| 9.3 Herbrand | imaginary quadratic; real quadratic | rank 0 / `1−1=0`; rank 1 / sign character | sound; statable: R04 |
| 9.4 Kuroda | `ℚ(√2,√3)`; `ℚ(i,√2)`; `ℚ(ζ₁₂)` | `4·1 = 4·1`; `2·1 = 2·1` (`ζ₈`); `2·1 = 2·1` (`Q=2`) | sound; factors 4 and 2 not interchangeable |
| 10.1 integral conjugacy | `⟨[[0,2],[½,0]]⟩`; `n=0` | `diag(1,2)` conjugates it to `[[0,1],[1,0]]`; identity | sound |
| 10.2 Minkowski | `m=2`; `M(0..4)` | `−1≡1 mod 2`, order 2; `1,2,24,48,5760` from the Lean formula | `m≥3` necessary; formula matches serre-bounds lines 113–116 |
| 10.3–10.4 counts | `n=2` | `7+2·3=13` ℤ-classes / 10 ℚ-classes | consistent; `710 ≥ 227`, `5760/1152=5` |
| 10.5 Jordan | `SL(2,5)≤GL₂(ℂ)` | index of centre 60 ≤ `J(2)` | sound |
| 10.5 finite modulo scalars | `B=ℚˣ`, `n=1`, `A=⊥` | index 0 ≤ 1 | vacuous: R01 |
| 10.5 Schur | `n=1`; `n=0` | `1 ≤ 4√8 ≈ 11.31`; right side 0 < `J(0)=1` | `n≥1` needed and present |
| 10.5 Collins | `n=71` | `S₇₂` on its standard representation: index `72!` | consistent with Collins' statement |

### Library declarations opened at the pins (Mathlib f6090c7, Tau Ceti 358314d)

- **Mathlib:**
  - `Mathlib/Order/JordanHolder.lean:79` (the `JordanHolderLattice` instance for weakly lower modular lattices), `:90` (`Iso`), `:454` (`jordan_holder`);
  - `Mathlib/RepresentationTheory/Irreducible.lean:29` (`IsIrreducible := IsSimpleOrder`, which excludes `0`);
  - `Mathlib/NumberTheory/NumberField/DedekindZeta.lean:49` (`dedekindZeta`) and `:56` (`dedekindZeta_residue` is the value; the theorem is `tendsto_sub_one_mul_dedekindZeta_nhdsGT`);
  - `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean:384`;
  - `Mathlib/NumberTheory/NumberField/InfinitePlace/Ramification.lean:114`;
  - `Mathlib/NumberTheory/NumberField/Basic.lean:227`;
  - `Mathlib/GroupTheory/FiniteIndexNormalSubgroup.lean:25`;
  - `Mathlib/GroupTheory/SpecificGroups/ZGroup.lean:146`;
  - `Mathlib/Topology/UniformSpace/Cauchy.lean:35`;
  - all other Mathlib names the README cites, by `#check`: 48 resolve, one does not (R11).
- **Tau Ceti:**
  - `TauCeti/RepresentationTheory/CharacterTable/Table.lean:119`, `:182`, `:186`, `:244`;
  - `TauCeti/RepresentationTheory/CharacterTable/Kernel.lean:130`;
  - `TauCeti/RepresentationTheory/CharacterTable/CyclotomicAction.lean:172` and `:201`;
  - `TauCeti/RepresentationTheory/CharacterTable/FrobeniusSchur/Realizability.lean:83`;
  - `TauCeti/RepresentationTheory/CharacterTable/Solvable.lean:219`;
  - `TauCeti/GroupTheory/Elementary.lean:131`, `:144`, `:147`, `:293`;
  - `TauCeti/RingTheory/KrullSchmidt/Indecomposable.lean` (its docstring requires a nonzero module, so the zero lattice is not counted in 9.2);
  - `TauCeti/GroupTheory/SpecificGroups/CFSG/Classification.lean:54` and `:67`;
  - `TauCeti/RepresentationTheory/ProjectiveRepresentation/SchurMultiplier.lean:148`;
  - `TauCeti/RepresentationTheory/CharacterTable/FixedPointCount.lean:151` (consumed through InductionRestriction 2.1, correctly);
  - `TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean:51`.

### Cross-roadmap citations resolved

- **LocalFiniteGroupTheory** (open head): L1 and L2 names are present at its README lines 142–184, but the gate refuses the citation (R03).
- **RepresentationTheory/CharacterTheory on main:** §4.4 (line 760; `fieldOfValues_eq_map_fixedField_stabilizer` at its `Suggested.lean:171`), §4.5 (line 817), Layer 7 (line 1150).
- **RepresentationTheory/InductionRestriction on main:** 2.1 (line 346; `Gassmann.almostConjugate_iff_permutation_equiv` at line 378), 2.2 (line 433; `Gassmann.exists_S16_gassmann_pair`), Layer 5 (line 607), Layer 7 (line 721). 2.1 already proves equal orders and indices, which 7.1 builds on.
- **InductionRestrictionPartII** (open head): §RS.0.1 stem surjectivity, its README lines 313–340.
- **ArithmeticStatisticsPartV** (open head): §3.9 "Malle invariants of a permutation group", lines 1075–1121, with `b(H, G)` as cited.
- **Completed/NumberFieldArithmetic:** 1.4 (line 548, `doubleCosetEquiv` at line 555), 1.5 (line 602), 2.1–2.3. Its Boundaries leave arithmetic equivalence to others (line 2244).
- **Completed/Chebotarev:** Layer 10, line 410.
- **InverseGaloisAndArithmeticFundamentalGroups:** uses `IsSupersolvable` only as a statement helper (lines 4756–4758); the scope sentence is accurate.
- **Downstream consumers:** SatoTateGroups (lines 424, 1790), AdelicImagesAndModularCurves (lines 70, 387) and QuaternionArithmetic (line 98) cite 10.5, 7.1 and 7.3 as stated.
- **Ownership:**
  - No roadmap on main or at the supplied open heads defines chief or composition factors, the socle, the solvable radical, isoclinism of groups, Eulerian functions, Schur indices, Taketa or Gaschütz. The isoclinism hits elsewhere concern slope-isoclinic isocrystals.
  - Mathlib has no supersolvable, A-, almost simple or complete-group predicate.

### Seeded source sample

| Target | Text and locator | Outcome |
|---|---|---|
| 0.2 Jordan–Hölder (chief) | none cited; Mathlib `jordan_holder` and `Iso` opened | statement sound; no locator (R10) |
| 0.5 Jordan–Hölder (composition) | none cited | sound; no locator (R10) |
| 0.7 socle | none cited | sound; no locator (R10) |
| 1.1 supersolvable | huppert-1954 (not obtained), huppert-eg1 VI 9.5 (uncertified), robinson §5.4 (waived) | not verifiable; Satz missing (R10) |
| 1.2 metacyclic | robinson §10.1 (waived); Mathlib names opened | the Mathlib route is verified |
| 1.3 A-groups | none cited | sound; no locator (R10) |
| 3.6 divisions | none cited | sound; no locator (R10) |
| 3.7 cyclotomic orbits | none cited; `IsCyclotomicExtension.autEquivPow` checked | Lean statement weak (R05) |
| 6.3 rational characters | none cited | sound; no locator (R10) |
| 6.7 monomial groups | isaacs 5.12, 5.13, 6.22–6.23 (uncertified) | not verifiable; Taunt needs solvability, and the Lean signature has it |
| 6.8 Gaschütz | gaschutz "main theorem" (waived) | not verifiable; criterion checked on `S₄`, `C₄²`, `1` |
| 7.1 Gassmann | InductionRestriction 2.1 | supplier verified |
| 7.4 Bauer and Perlis | perlis-1977 (uncertified); desmit-perlis lines 24–32 | the equivalence with induced characters and the degree-32 closure verified |
| 8.3 elusive | fks Theorem 1, printed p. 41: fks line 85 (page header) and lines 88–89 (OCR of the authors' scan) | verified: transitive, `|Ω| > 1`, fixed-point-free element of prime-power order; proof by CFSG (lines 90–101) |
| 10.1 lattices | none cited; serre-bounds §1.3.1, p. 4, lines 189–192 supports it | sound; locator missing (R10) |

Also verified:
- lemmermeyer line 102 (Theorem 1) and lines 110–113 (`1/4` real, `1/2` complex); line 15 defines `q(K)`;
- kubota lines 13–21 (seven types, with `q = 1, 2, 4, 2, 4, 4, 2`; infinitely many of each type);
- serre-bounds lines 85–116 (Theorem 1 and the values), lines 131–136 (Remark 2) and line 148 (Lemma 1, printed p. 4);
- reiner-1957 lines 131–142 (printed p. 145, page header at line 117);
- sutherland-18785 line 122 (Theorem 24.6, page 3);
- desmit-perlis lines 14–18 (shared invariants).

## Not verifiable

- huppert-1954: the cached text is the GDZ volume landing page (37 lines of navigation). The sources service found the DOI paywalled and the arXiv search returned HTTP 429. The manifest records it `certified` all the same.
- hall-1940: same, a GDZ volume page; the De Gruyter landing page is in no licence class.
- fks: the cache is also a volume page; the text was read from the authors' scan through the service.
- Uncertified (cited by locator, no text): huppert-eg1, isaacs, perlis-1977, guralnick-1982. One lead: desmit-perlis line 62 attributes `hR = h'R'` to Perlis 1978, not to perlis-1977 as 7.5 does. I cannot check Perlis 1977.
- Waived: robinson, aschbacher, curtis-reiner-1962 (Schur's bound in 10.5), reiner-maximal-orders, karpilovsky, bbnwz (the counts 13/10, 73/32, 710/227 and `|W(F₄)| = 1152` are recalled, not read), gaschutz, johnson-1971, hall-1936, collins.
- The order-96 examples of 4.1 and Kubota's infinitude statement are not reconstructed.
- Ownership was checked against main, the supplied open heads and every open head through `roadmaps grep`. Board-only packages without a supplied head were not searched.

## Source issues

- **Misprint** in lemmermeyer at Proposition 1, printed p. 2 (line 79): the source writes the direct product of class groups with `Cl(k₂)` twice; it should be `Cl(k₁) × Cl(k₂) × Cl(k₃)`; affects nothing.

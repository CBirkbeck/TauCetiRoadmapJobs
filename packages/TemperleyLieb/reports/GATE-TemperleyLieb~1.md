# GATE-TemperleyLieb~1: answers to human review

Head reviewed: `f3fd371`. Repairs committed as `3c903ce2` (not pushed). The points are numbered in
the order they appear in the five reviews. The two comments by kim-em (2026-09-26, 2026-10-19) are
the author's replies and contain no new points. Each claim they made was checked against the head,
under the point it answers.

The roadmap gate failed at `f3fd371` on four independent counts: 86 `sorry`'d data declarations,
an import of `TauCetiRoadmap.FreeProbability.Suggested` (another roadmap's module), two
pull-request-number citations, and two README identifiers with no declaration. So
`TauCetiRoadmap/TemperleyLieb/Suggested.lean` is now an acceptance test, not a catalogue of
signatures. It has three real definitions (`qInt`, `PlanarMatching`, `IsMarkovTrace`), eight
headline theorems stated on Tau Ceti's `TauCeti.TemperleyLieb R δ n`, and two proved examples. Its
docstring lists the headlines that cannot be stated at the pins and the carrier each one lacks.
The Lean signatures that reviewers asked for were `sorry`'d data, which is forbidden in that file.
They now appear as intended-signature blocks in `TauCetiRoadmap/TemperleyLieb/README.md`. That
affects H07, H11, H12, H15 and H17.

## H01 (CBirkbeck) — applied

The repair was already at the head, and I checked it. README Layer 2 (lines 315–339) presents
`TLDiagCat` as the quotient of `FreeSelfDualityCat` by circle centrality. It keeps the bimodule
example over `ℚ × ℚ × ℚ` as a negative test (line 337). Recomputed: `d = (1,2,1)` acts on `M_12` by
`1` on the left and by `2` on the right. The universal property carries the centrality hypothesis
(signature block, lines 359–382).

## H02 (CBirkbeck) — applied

The instance `IsIdempotentComplete (MonoidalQuotient S C I)` is absent. README Layer 7 now states
that it is false and gives the `ℤ/6` test: `3² = 3` in `ℤ/6`, with image ranks `(1,0)` against
`(n,n)`. The layer uses `Karoubi (MonoidalQuotient S C I)` instead (end of the quotient bullet,
after line 713).

## H03 (CBirkbeck) — applied

At the head, README Layer 5 (line 559) fixes half-diagrams as string-surjective `n → k`. The form
is `ū ≫ v = ⟨u,v⟩ · 1_k + …`, so `ū : k → n` and `v : n → k` compose to an endomorphism of `k`.
The README also states the alternative `u ≫ v̄` for injective half-diagrams.

## H04 (CBirkbeck) — applied

README Layer 3 (line 444) states `reflect (f ⊗ g) = reflect g ⊗ reflect f`. It packages horizontal
reflection as a monoidal functor into the monoidal opposite, and it keeps the witness that
`cap ⊗ 𝟙` and `𝟙 ⊗ cap : 3 → 1` are distinct.

## H05 (CBirkbeck) — applied

README Layer 6 (line 636) records Morrison's Proposition 5.1 as a sum over admissible removal
sequences divided by a quantum factorial. It records the loop-value translation `−[2]` ↔ `+[2]`,
and it requires a test diagram with two admissible removal choices.

## H06 (CBirkbeck) — applied

README Layer 3 (line 460) gives the rank-two self-duality without a square root. Recomputed:
`B = [[0,q],[1,0]]` and `B⁻¹ = [[0,1],[q⁻¹,0]]` give `B B⁻¹ = I`, and the circle is
`Σ (B⁻¹)_ij B_ij = q + q⁻¹`. The `A`-specialised form is kept separately, for the Kauffman
braiding only.

## H07 (CBirkbeck) — applied

The predicate is at `V` only: `IsCircleCentral η ε := CirclesCommuteAt (η ≫ ε) V`, in the README
signature block (line 359). The `A = ℚ × ℚ` separating example is at line 384. Propagation to
tensor powers is stated after the block. The stronger all-objects predicate is no longer pinned.
The README says it may be kept under a separate name as a sufficient condition.

## H08 (CBirkbeck) — applied

The README display (line 347) reads `ρ_V⁻¹ ≫ (𝟙_V ⊗ d) ≫ ρ_V = λ_V⁻¹ ≫ (d ⊗ 𝟙_V) ≫ λ_V`. It
starts with the inverse unitors, and it matches `CirclesCommuteAt` in the signature block.

## H09 (CBirkbeck) — applied

README Layer 7 (line 746) consumes `IsFiniteSemisimpleCategory` and its decomposition API from
PivotalSpherical, Layer 3. That definition is on main, in PivotalSpherical README line 362. This
roadmap keeps only the Temperley–Lieb-specific classification.

## H10 (CBirkbeck) — applied

README Layer 5 (line 571) pins the left action as `a • u := (a*) ≫ u`, with the `(TLAlg R δ n)ᵐᵒᵖ`
alternative, and requires the chosen formula to be stated as a defining equation.

## H11 (CBirkbeck) — applied differently

The head had already replaced `PresentedTL` with Tau Ceti's `TauCeti.TemperleyLieb R δ n`. That is
a `RingQuot` over `R`, so it lives in the universe of `R`. README line 506 now states the
comparison as `presentedTLEquiv : TauCeti.TemperleyLieb R δ n ≃ₐ[R] TLAlg R δ n` for `R : Type u`,
with both sides in `Type u` and both equal to `R` at `n = 0`. The comparison itself is `sorry`'d
data, so it is a README target and not a Lean declaration.

## H12 (CBirkbeck) — applied differently

The existence and uniqueness signatures are now README blocks. Lines 359–382 give
`SendsSelfDuality` and `TLDiagCat.lift` / `liftObjIso` / `lift_sendsSelfDuality` / `lift_unique`,
with the same four for `FreeSelfDualityCat`. Lines 409–420 give `TLCat.lift` and its uniqueness
among `R`-linear strong monoidal functors. `Suggested.lean` cannot state them. `TLDiagCat`,
`FreeSelfDualityCat` and `TLCat` have no carrier at the pins, and a `sorry`'d `lift` is forbidden
data. The docstring names these as not statable.

## H13 (CBirkbeck) — applied

README Layer 6 (line 660) asks for Goodman–Wenzl §2's path and block idempotents and its
constant-dimension statement as named lemmas. It makes `δ = 0` (`ℓ = 2`) a separate sub-target,
because the Hom-to-End retractions divide by `δ`.

## H14 (roed-math) — answered

`TauCetiRoadmap/TemperleyLieb/metadata.toml` is present with `topic = "math.QA"`, and the gate's
metadata check passes (`metadata=0`). That file is outside this job's edit scope and needed no
change.

## H15 (CBirkbeck) — applied differently

The intended envelope signatures are in the README block at lines 683–697. Each carries its source
hypotheses as binders:

- `Mat_ C` takes `[Preadditive C] [MonoidalCategory C] [MonoidalPreadditive C]`.
- `Karoubi C` takes `[MonoidalCategory C]`.
- Strong monoidal embeddings `Mat_.embedding C` and `toKaroubi C` pin the tensor and the unit.

The README keeps the empty-category reason why section variables would fail. The Lean
declarations were `sorry`'d instances and are gone.

## H16 (CBirkbeck) — applied

README line 51 says that PivotalSpherical is on main and that its API is not yet in Tau Ceti. No
"still open" wording remains.

## H17 (CBirkbeck) — applied differently

README Layer 7 now carries the reviewer's counterexample itself, from line 713. With
`f ⊗ g = f^(2^m) g^(2^n)` and `I(n,n) = 3^(2^n) ℤ`, `1 = 4` in `ℤ/3`, but whiskering gives `1` and
`16`, which differ in `ℤ/9`. The quotient signature block makes `[MonoidalPreadditive C]` a binder
of the tensor and of `(toMonoidalQuotient S C I).Monoidal`. `[MonoidalLinear S C]` is added where
`S`-linearity of the tensor is promised. The block includes `toMonoidalQuotient_map_eq_zero_iff`.

## H18 (CBirkbeck) — applied

The head already presented no second algebra. This round goes further: every algebraic headline in
`Suggested.lean` is stated on `TauCeti.TemperleyLieb R δ n` itself (lines 89, 121, 129, 141, 153,
162). The README's TemperleyLiebOperatorAlgebras citation (line 513ff.) now names that roadmap's
§A1 as the consumer of the comparison. It no longer uses a pull-request link.

## H19 (CBirkbeck) — applied

The README consume list (lines 156–178) records:

- `TauCeti.TemperleyLieb.markovTrace` at `δ = -(q + q⁻¹)`.
- `TauCeti.TemperleyLieb.jones` at `jonesDelta a = -(a² + a⁻²)`.
- `TauCeti.MarkovEquiv.jonesTrace_eq`.

All three were checked at the pinned Tau Ceti (`TauCeti/Algebra/TemperleyLieb/MarkovTrace.lean`
line 452, and `TauCeti/KnotTheory/TemperleyLieb.lean` lines 85, 135 and 352). The non-goal now
transports them along `presentedTLEquiv`. A proved example in `Suggested.lean` (line 108) checks
that Tau Ceti's trace satisfies `IsMarkovTrace`.

## H20 (CBirkbeck) — applied

README Layer 1 (line 267) keeps the involution and Dyck models here. It assigns generic
noncrossing partitions to RandomMatrices, *Finite combinatorial prerequisite for Milestones 3, 4,
and 6*, realised as in FreeProbability §F2. It names the comparison target
`planarMatchingEquivNoncrossingPairing`. The citation `PR #397` is replaced by roadmap and section
names. The Lean declaration of the comparison needed `import TauCetiRoadmap.FreeProbability.Suggested`,
which the gate refuses, so it is now a README target.

## New `Suggested.lean` contents and mechanical check

Headlines:

- `exists_qInt_eq_zero_iff`: the root-of-unity dictionary, over an algebraically closed field of
  characteristic zero.
- `card_planarMatching`: `Nat.card (PlanarMatching (2k)) = catalan k`.
- `exists_basis_planarMatching`: a basis of the native algebra indexed by `PlanarMatching (2n)`,
  over every commutative ring.
- `existsUnique_isMarkovTrace`.
- `isSemisimpleRing_of_qInt_ne_zero`.
- `isSemisimpleRing_iff_of_charZero`.
- `existsUnique_jonesWenzl`: normalised by `TauCeti.TemperleyLieb.aug f = 1`.
- `IsMarkovTrace.apply_jonesWenzl`: trace `[n+1]`.

Proved examples:

- The crossing pairing of four points is not a `PlanarMatching` and the nested one is, by `decide`.
- Tau Ceti's `markovTrace` is an `IsMarkovTrace`.

Each new name appears in the README (overview line 202, and Layers 0, 1, 4, 5 and 6).

I appended `#check @name` for all 11 declarations to the file, built once and restored the file.
Every elaborated type carries exactly its own binders, and no section `variable` is used anywhere.
`existsUnique_isMarkovTrace` elaborated to `∀ (R) [CommRing R] (δ : R), ∃! tr, IsMarkovTrace R δ tr`
and `isSemisimpleRing_iff_of_charZero` to `∀ (K) [Field K] [CharZero K] (δ) (n), … ↔ (∀ k ∈ Icc 1 n, qInt K δ k ≠ 0) ∨ δ = 0 ∧ Odd n`.
Both match their README statements. The check changed nothing.

## Adversarial pass on added or changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `qInt` (`S` at index `n − 1`) | n = 0, 1, 2, 3 | `S_{-1} = 0`, `S_0 = 1`, `S_1 = δ`, `S_2 = δ² − 1` | `[0]=0`, `[1]=1`, `[2]=δ`, `[3]=δ²−1` | none |
| `exists_qInt_eq_zero_iff` | δ = 0; δ = 2; δ = −2; ζ of order m ≥ 3 | δ=0: ζ=i, `[2](0)=0`. δ=2: `[n]=n≠0`, ζ=1 excluded. δ=−2: `[n]=±n≠0`, ζ=−1 excluded. Order m: `[m]=(ζ^m−ζ^{−m})/(ζ−ζ^{−1})=0` with `ζ≠ζ⁻¹` | holds both ways; char-p negative check: δ=2, `[p]=0` but ζ=1 excluded, so char 0 is needed | none |
| `PlanarMatching` | k = 0, 2, 4, odd k | k=0: 1; k=2: 1; k=4: (01)(23), (03)(12) admitted, (02)(13) rejected (`a=0,b=1`: `σ1=3 ∉ (0,2)`); odd: no fixed-point-free involution | counts 1, 1, 2 = catalan 0, 1, 2 | proved example added |
| `card_planarMatching` | k = 0, 1, 2, 3 | 1, 1, 2, 5 | = catalan | none |
| `exists_basis_planarMatching` | n = 0, 1, 2; trivial ring | n=0,1: algebra `R`, one matching; n=2: basis `{1, e}`, 2 matchings; zero ring: zero module has a basis on any index type | holds | none |
| `IsMarkovTrace` / `existsUnique_isMarkovTrace` | n = 0, 1, 2; Tau Ceti witness | `tr_0 1 = 1`; `tr_1 1 = δ` (axiom needed: `strandIncl` starts at one strand); `tr_2 e = tr_2(strandIncl 1 · e) = tr_1 1 = δ`; Tau Ceti trace satisfies all four fields (proved) | existence not vacuous; uniqueness by normal form | normalisation `tr n 1 = δ^n` in all degrees, noted in the README |
| `isSemisimpleRing_of_qInt_ne_zero` | n = 0, 1; 𝔽₂, δ = 1, n = 2 | `TL_0`, `TL_1` equal `K`; 𝔽₂: `[2]=1`, `TL_2 ≅ K×K` (`e²=e`); general: numerators `[k+j+1]` with `k+j+1 ≤ n` are nonzero, so `gramPoly(δ) ≠ 0` | holds over any field | none |
| `isSemisimpleRing_iff_of_charZero` | n = 2, δ = 0; n = 3, δ = 0; n = 5, δ = 0; δ = 1, n = 3 and 4 | `TL_2(0)`: `e²=0`, not semisimple, RHS false. `TL_3(0)`: `det G_{3,1}=[3]=−1`, semisimple, RHS true (odd). `TL_5(0)`: `[5](0)=1`, `det G_{5,1}=−2≠0`, semisimple, RHS true. δ=1: `[3]=0`, so `det G_{3,1}=0` and `det G_{4,0}=[2]²[3]=0`, RHS false | agrees; char 2: `−2 = 0` breaks n = 5, so char 0 is needed | locator: Ridout–Saint-Aubin Thm 4.7 and the remark after Cor 4.8 (read at source lines 1120 and 1157–1159) |
| `existsUnique_jonesWenzl` | n = 0, 1, 2; δ = 0, n = 2; zero ring | n=0,1: `f=1`; n=2: `f=1−δ⁻¹e`, `ef=e−e=0`, `aug f=1`; δ=0: no `f` and the hypothesis fails (`[2]=0` not a unit); uniqueness `f=ff'=f'` since `ker aug` = ideal generated by the `e_i` | holds | idempotence is implied, but kept in the statement |
| `IsMarkovTrace.apply_jonesWenzl` | n = 0, 1, 2 | `tr 1 = 1 = [1]`; `tr 1 = δ = [2]`; `δ² − δ⁻¹·δ = δ² − 1 = [3]` | holds | invertibility hypothesis kept: without it the division-free argument is unchecked |
| README Layer 2 / 3 signature blocks | binder audit | each block lists `[Category C] [MonoidalCategory C]` (plus the preadditive/linear binders for `TLCat.lift`) as binders of every declaration | matches the reviewers' corrected forms | moved from Lean |
| README Layer 7 quotient negative test | `End 0 / I`, `End 1 / I` | `I(0,0)=3ℤ`: `1 ≡ 4`; `I(1,1)=9ℤ`: `1^2 = 1`, `4^2 = 16 ≢ 1` | tensor does not descend | moved from Lean |

## Ownership, citations, sources

- **Ownership.** I searched for the three kept definitions across main and the open heads
  (`roadmaps grep 'PlanarMatching|IsMarkovTrace|def qInt|existsUnique_jonesWenzl'`). The only other
  hit is `qInt (q : K) (r : ℕ)` in QuantumEnvelopingAlgebras, which is an open PR not in the
  supplier list. It is a different object: a `q`-parametrised quantum integer over a field.
  This roadmap's `qInt` is parametrised by `δ` over any commutative ring, where no `q` need exist.
  The two names live in different namespaces.
- **Citations.** I checked the following against main or the pins:
  - FreeProbability §F2 and `NoncrossingPartition` (main).
  - PivotalSpherical Layer 3 `IsFiniteSemisimpleCategory` (main).
  - SchurWeyl Layer 9 Brauer algebra (main).
  - RandomMatrices "Finite combinatorial prerequisite for Milestones 3, 4, and 6" (open head
    given in the brief).
  - TemperleyLiebOperatorAlgebras §A1 (open head given in the brief).
  - Tau Ceti `e`, `lift`, `lift_e`, `hom_ext`, `strandIncl`, `aug`, `algEquivOfLeOne`,
    `markovTrace*`, `jones`, `jonesDelta`, `MarkovEquiv.jonesTrace_eq` and `BraidGroup`, all at the
    pin.
- **Sources.** I fetched Ridout–Saint-Aubin (arXiv:1204.4505v4) through the sources service and
  read Theorem 4.7 and Corollary 4.8 there. This job may not edit `sources.toml`, so the roadmap
  still has no manifest. No text is missing, and `needs-references.toml` lists nothing.
- **Untrusted text.** One review suggests running
  `python3 .github/scripts/check_roadmap_topics.py`. I treated it as data and did not run it.

## Build and gate

- `lake build TauCetiRoadmap.TemperleyLieb.Suggested`: `Build completed successfully (8981 jobs)`.
  The only warnings are eight `declaration uses 'sorry'`, one per headline.
- Gate summary line:
  `gate TemperleyLieb: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 148 roadmaps, 999 edges, 0 problem(s)`, with no UPWARD or
  CYCLE line. TemperleyLieb is not yet in the merge order, so the check places it after its last
  supplier.

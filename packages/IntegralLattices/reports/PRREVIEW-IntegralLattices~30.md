# Review of IntegralLattices (pull request #617 at d8192ae)

**Verdict:** needs changes

This is an incremental re-review. `TauCetiRoadmap/IntegralLattices/` is identical at `39e8628` and `d8192ae`: `git diff 39e8628 HEAD -- TauCetiRoadmap/IntegralLattices` is empty. The two commits since then change only `TauCetiRoadmap/ClassFieldTheory/` and `TauCetiRoadmap/QuadraticFormInvariants/`.

None of the eight findings of the previous review is repaired, so all eight are raised again below. Each repair is restated so that this comment stands alone. There is no new finding: every citation this roadmap makes into the two changed folders is still valid (see *Verified sound*).

Pins: Mathlib `1b1ccf4` and Tau Ceti `2fd255d`. `lake-manifest.json` is unchanged since `39e8628`. Paths of native declarations are relative to the pinned package.

## R01 (P3) — Gate `outside-folder`: files under `Completed/` change in this pull request

**Location.** `git diff --stat origin/main...HEAD` lists five files under `Completed/`:
- `Completed/LocalFieldsRamification/COMPLETION.md`, `README.md` and `Suggested.lean`;
- `Completed/LocalGaloisGroups/README.md` and `Suggested.lean`.

**Claim.** Besides IntegralLattices, the only folders named as this pull request's own are ClassFieldTheory and QuadraticFormInvariants. The `Completed/` changes lie outside all three. The gate therefore fails, and while it fails this folder cannot be accepted.

**Witness.** My gate run at `d8192ae` prints `outside-folder=9 … FAIL`, with every other scanner at 0. Five of the nine are ClassFieldTheory and QuadraticFormInvariants files. The other four are the three `Completed/LocalFieldsRamification` files and `Completed/LocalGaloisGroups/README.md`.

**Repair.** The pull request's title and description are about LocalFieldsRamification. Do one of the following:
- have `Completed/LocalFieldsRamification` and `Completed/LocalGaloisGroups` named as this pull request's own folders, so that each gets its own review; or
- move those changes to a separate pull request.

Then rerun the gate. `outside-folder` must list only files of named folders.

## R02 (P3) — Two open pull requests rewrite this folder differently, and no merge order is stated

**Location.** The description's revision paragraph: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1410".

**Claim.** #1411 and #1797 also change `TauCetiRoadmap/IntegralLattices/README.md` and `Suggested.lean`, and their heads conflict with this one. Nothing says which is rebased onto which.

**Witness.** `roadmaps overlaps IntegralLattices` (index of 2026-11-09T14:56:29Z) says "#617 and #1411 conflict in" both IntegralLattices files, and "#617 and #1797 conflict in `TauCetiRoadmap/IntegralLattices/README.md`, `TauCetiRoadmap/IntegralLattices/Suggested.lean`".

**Repair.** State in the description which of #617, #1411 and #1797 merges first, and that the others rebase onto it. Do not restate in one what another already changes.

## R03 (P3) — B3: the principal-genus target has no locator, and its route omits the existence input

**Location.** `TauCetiRoadmap/IntegralLattices/README.md:1334–1336`: "The kernel is exactly `C²` because the number of genera, the size of the image, which quadratic reciprocity computes, equals `[C : C²] = #C[2]`".

**Claim.**
- No source is cited for Gauss's principal genus theorem.
- Reciprocity gives only the upper bound `2^{μ−1}` on the number of genera.
- Equality, and hence kernel `= C²`, needs every allowed character tuple to be realized. That is an existence input, and neither the route nor the *Needs* line names one.

**Witness.** Take `Δ = −20`. The reduced forms `(1,0,5)` and `(2,2,3)` represent the residues `{1,4}` and `{2,3}` mod 5. Reciprocity bounds the genera by 2. Exhibiting the second genus needs `(2,2,3)` itself, or a prime `≡ 2, 3 (mod 5)` from Mathlib's `Nat.forall_exists_prime_gt_and_eq_mod` (`Mathlib/NumberTheory/LSeries/PrimesInAP.lean:443`).

**Repair.**
- Add a locator at the claim for negative discriminants, and a source for `Δ > 0`. For example: Cox, *Primes of the form x² + ny²*, Chapter One §3, the theorem that the genera are the cosets of the squares and number `2^{μ−1}`. Record it uncertified, like the README's other Cox citations. Its theorem number could not be checked here.
- Rewrite the route in three steps:
  1. Reciprocity bounds the number of genera by `2^{μ−1}`.
  2. Every allowed character tuple is realized.
  3. With `[C : C²] = #C[2] = 2^{μ−1}` (B4), the kernel is `C²`.
- Add the realizing input to *Needs* and to the B3 row. Use either Mathlib's `Nat.forall_exists_prime_gt_and_eq_mod`, or the native `exists_of_realization` (`TauCeti/NumberTheory/LocalField/QuadraticForm/Realization.lean:113`) together with Global Quadratic Forms `hasseMinkowski_equivalent`.

## R04 (P3) — 4B's proper version rests on an unowned lemma: a determinant `−1` element in every `K_p(L)`

**Location.**
- `TauCetiRoadmap/IntegralLattices/README.md:1800–1802`: "In positive rank every `K_p(L)` contains an element of determinant `−1` (a reflection in a vector of least valuation), so the `g_p` can be taken in `SO(V_p)`".
- The same step appears in the docstring at `Suggested.lean:280–281`.
- 7C's index bullet (`README.md:2682`) reads it off.

**Claim.**
- The lemma is not a target here, not a cited supplier section and not a pinned declaration.
- The native integral-reflection lemma needs a vector of unit norm.
- GeometryOfNumbersAndQuadraticArithmetic 2.4.6 states the lemma (its README line 619 at its open head). But that roadmap is not on main, and it consumes this one (its *Needs* at line 1060 cites "IntegralLattices 2C"). So it cannot be cited from here.

**Witness.** `reflectionOrthogonal_mem_integralOrthogonalSubgroup` (`TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/Integral/SpinorNorm.lean:145`) assumes `‖Q v‖ = 1`. For `⟨3⟩` at 3 and `⟨4⟩` at 2, no vector has unit norm under either normalization. The needed element is the reflection in `e`.

**Repair.**
- Make the lemma an N0 target, with a locator. For a nondegenerate `L` of positive rank and every prime `p`, `p = 2` included: the reflection in a `v ∈ L_p` whose norm `β(v,v)` generates `𝔫(L_p)` lies in `K_p(L)` and has determinant `−1`. It is integral because `2β(x,v) ∈ 2𝔰(L_p) ⊆ 𝔫(L_p)`. For the unit-norm case, cite `reflectionOrthogonal_mem_integralOrthogonalSubgroup`.
- Have 4B, 7C and the docstring of `exists_genusProperClasses_equiv_doubleCoset` cite N0 for the lemma.
- Add the lemma to the N0 dependency row.

## R05 (P3) — Two Checks on genus symbols do not test what they claim

**Location.**
1. `TauCetiRoadmap/IntegralLattices/README.md:971`: "Oddity fusion: `⟨1⟩ ⊕ ⟨3⟩ ≅ ⟨5⟩ ⊕ ⟨7⟩` (3B) has the single symbol `1_4^{−2}`".
2. `README.md:1014–1015`: "`1_1^{−1} 3^{+1}` fails the oddity formula, so both clauses are needed".

**Claim.**
1. Fusion concerns a compartment of consecutive type I constituents. A single rank-2 constituent never exercises it, so this Check also passes for a calculus without fusion.
2. `1_1^{−1}` is not a legal rank-one term: sign `−` forces oddity `±3`. The symbol is rejected before the oddity formula is read, so it does not show that the formula is needed.

**Witness.** `allcock-gal-mark2016` lines 114–134 define fusion on compartments. Line 711 lists the legal rank-one terms as `q^{+1}_{±1}` and `q^{−1}_{±3}`.

**Repair.**
1. Replace the fusion Check with `⟨7⟩ ⊕ ⟨2⟩ ≅ ⟨1⟩ ⊕ ⟨14⟩` over `ℤ₂`.
   - The isometry: `v = e₁ + e₂` has norm 9 (a square), and `w = 2e₁ − 7e₂` has norm `126 = 2·63` with `63/7 = 9`. Also `β(v,w) = 0`, and the change of basis has determinant `−9`, a unit.
   - The symbols `1_7^{+1} 2_1^{+1}` and `1_1^{+1} 2_7^{+1}` differ termwise but share the compartment oddity `8 ≡ 0`.
2. Replace `1_1^{−1} 3^{+1}` by `1_5^{−1} 3^{+1}`:
   - its term is legal, since `5 ≡ −3`;
   - its sign `−` matches `(2|3) = −1`;
   - it fails only the oddity formula, since `1 + 2 = 3 ≢ 5`.

## R06 (P3) — B7: native declarations labelled R, and no *Needs* line

**Location.**
- `TauCetiRoadmap/IntegralLattices/README.md:1627`: "| B7 | M `MeasureTheory.Measure.haar`; L B4, B5, B6; R Restricted Products `RestrictedProductGroup`, `CompactOpenSubgroups`, `integralSubgroup`, `isCompact_integralSubgroup`, `rationalDiagonal` |".
- The B7 paragraph (1509–1582) has no *Needs:* line.

**Claim.** These five are Tau Ceti declarations, so their kind is T. The From Tau Ceti row (477) and the supplier row (535) both say so. B7's prose lists no prerequisites.

**Witness.** At the pin:
- `TauCeti/Topology/Algebra/RestrictedProduct/Basic.lean`: line 59 `RestrictedProductGroup`, 94 `integralSubgroup`, 244 `isCompact_integralSubgroup` and 260 `CompactOpenSubgroups`;
- `Diagonal.lean:62`: `rationalDiagonal`.

**Repair.**
- In the B7 row, write "T `RestrictedProductGroup`, `CompactOpenSubgroups`, `integralSubgroup`, `isCompact_integralSubgroup`, `rationalDiagonal`". Keep "R Restricted Products" only for the change-of-family and away-`S` statements, if B7 uses them.
- Add to B7: "*Needs:* B4, B5, B6; T `RestrictedProductGroup`, `CompactOpenSubgroups`, `integralSubgroup`, `isCompact_integralSubgroup`, `rationalDiagonal`; Mathlib `MeasureTheory.Measure.haar`."

## R07 (P3) — Three `Suggested.lean` declarations are not named in the README

**Location.** In `TauCetiRoadmap/IntegralLattices/Suggested.lean`:
- line 168: `def NikulinGenerator.prime`;
- line 502: `abbrev SO` (namespace `Archimedean`, line 494);
- line 505: `abbrev O`.

**Claim.** Every Lean name must appear in the README. These three occur nowhere in it.

**Witness.** `grep -c` on `README.md` returns 0 for `NikulinGenerator.prime`, for `Archimedean.SO` and for `Archimedean.O`. The README writes `SO(n)` and `O(n)` only as mathematics.

**Repair.**
- In 5B's `padicDiscriminant` paragraph, name `NikulinGenerator.prime` (the prime at which a generator is primary).
- In 7E's target paragraph, name `Archimedean.SO` and `Archimedean.O` as the abbreviations of `Matrix.specialOrthogonalGroup (Fin n) ℝ` and `Matrix.orthogonalGroup (Fin n) ℝ`.

## R08 (P3) — B4 defines "ambiguous" through a "nonsquare class"

**Location.** `TauCetiRoadmap/IntegralLattices/README.md:1428`: "A nonsquare class satisfying this is called ambiguous".

**Claim.** An ambiguous class is any class with `[𝔞_f]² = 1`, squares included. Read literally, the sentence excludes the principal class, which is a square. But the README itself counts the principal class as ambiguous.

**Witness.** By brute force, `!![2,1;1,12]` (principal, `Δ = −23`) has `|O| = 4` and `|SO| = 2`. Its class is `1 = 1²`. Yet `README.md:1605–1606` gives "`h⁺ = 3` and `a = 1`", and calls the principal class of `A₂` ambiguous.

**Repair.** Write "In the nonsquare-discriminant branch, a class satisfying this is called ambiguous".

## Previous findings

- R01 — not repaired: the gate at `d8192ae` prints `outside-folder=9 … FAIL`. `Completed/LocalFieldsRamification/{COMPLETION.md,README.md,Suggested.lean}` and `Completed/LocalGaloisGroups/README.md` still change.
- R02 — not repaired: the description still reads "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1410". #1411 and #1797 still conflict in both IntegralLattices files.
- R03 — not repaired: README.md:1334–1336, "The kernel is exactly `C²` because the number of genera, the size of the image, which quadratic reciprocity computes, equals `[C : C²] = #C[2]`". There is still no locator and no realizing input.
- R04 — not repaired: README.md:1800–1801, "In positive rank every `K_p(L)` contains an element of determinant `−1` (a reflection in a vector of least valuation)". N0 has no such target.
- R05 — not repaired: README.md:971, "Oddity fusion: `⟨1⟩ ⊕ ⟨3⟩ ≅ ⟨5⟩ ⊕ ⟨7⟩` (3B) has the single symbol `1_4^{−2}`", and README.md:1014–1015, "`1_1^{−1} 3^{+1}` fails the oddity formula".
- R06 — not repaired: README.md:1627, "R Restricted Products `RestrictedProductGroup`, `CompactOpenSubgroups`, `integralSubgroup`, `isCompact_integralSubgroup`, `rationalDiagonal`". B7 still has no *Needs:* line.
- R07 — not repaired: `Suggested.lean:168` `def NikulinGenerator.prime`, `:502` `abbrev SO` and `:505` `abbrev O` are still not named in README.md.
- R08 — not repaired: README.md:1428, "A nonsquare class satisfying this is called ambiguous".

## Verified sound

**Gate, dependencies and build.**
- Gate at `d8192ae`: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=9 source-material=0 FAIL`. R01 covers the failure.
- The worker's gate also reports `build=0`.
- Dependency check (`gate --depcheck … --movable`): `depcheck: 236 roadmaps, 2285 edges, 0 problem(s)`. There is no UPWARD and no CYCLE line.
- `lake env lean …/Suggested.lean` exits 0 with 15 `declaration uses sorry` warnings and no other diagnostic. The warnings are at lines 265, 283, 307, 324, 370, 377, 398, 411, 425, 440, 452, 471, 484, 546 and 573.

**`Suggested.lean` checks.**
- One-tactic probe on a scratch copy, replacing each `sorry` by `first | rfl | infer_instance | simp | trivial | decide | aesop`: 15 of 15 theorems fail, each with unsolved goals or with "aesop made no progress"; none closes. No theorem is padding by this test.
- Signatures: the file and the pins are unchanged since the previous review, whose `#check @` comparison of all 36 declarations against the README still applies. `signatures.md` also reports 0 of 36 with a lost section binder.

**The changed folders, as this roadmap uses them.**
- QuadraticFormInvariants retired its alias `hilbertSymbol_productFormula`. This roadmap consumes the Tau Ceti declaration instead: README.md:505 (`TauCeti.hilbertSymbol_productFormula`), and the T entries at 1007, 1148 and 2488.
- These names resolve at the pin:
  - `hilbertSymbol_productFormula`: `TauCeti/NumberTheory/QuadraticForm/Global/ProductFormula.lean:67`, in `namespace TauCeti` (line 59);
  - `TauCeti.ClassFieldTheory.hilbertProductFormula`: `TauCeti/NumberTheory/ClassFieldTheory/Global/Hilbert/Reciprocity.lean:65`;
  - `hilbertSymbol`: `TauCeti/NumberTheory/HilbertSymbol/Basic.lean:47`;
  - `ringClassField` (line 111) and `ringClassArtinEquiv` (line 178), in `TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RingClass/Field.lean`, namespace `TauCeti.ClassFieldTheory` (line 90).
- The changed text describes this roadmap's use consistently with this README (lines 60–61, 142, 484 and 505):
  - QuadraticFormInvariants README.md:1671 and 2747, and its Suggested.lean:40;
  - ClassFieldTheory README.md:1144.
- This roadmap cites no section number of either changed roadmap, only the ownership row at line 128. So the ids ClassFieldTheory retires cannot break a citation here.

**Overlaps and citations.**
- `roadmaps overlaps IntegralLattices` was rerun. It finds no id cited here that an open pull request drops, and no id that only an open revision defines. Its conflicts are R02.
- The 13 leads of `citations.md` are all this roadmap's own declarations, at `Suggested.lean` lines 176, 188, 204, 224, 233, 471, 484, 509, 518, 527, 546, 555 and 573. No cross-roadmap citation is unresolved.
- Cross-roadmap citations, ownership against open pull requests and the source locators are untouched since the previous review. Its record of them stands (OrthogonalTamagawaAndLatticeMass §§0.3–4.2, Root Systems §3.1, DifferentialGeometry 12.1 and 12.4, Rank-24 Layers 3 and 6).
- GeometryOfNumbersAndQuadraticArithmetic was re-read for R04: 2.4.6 is at line 619 of its README, and its consumption of IntegralLattices is at lines 246 and 1060.

**Library declarations opened this round.**
- Tau Ceti:
  - `reflectionOrthogonal_mem_integralOrthogonalSubgroup` (`…/OrthogonalGroup/Integral/SpinorNorm.lean:145`, hypotheses `hpolar` and `‖Q v‖ = 1`);
  - `RestrictedProductGroup`, `integralSubgroup`, `isCompact_integralSubgroup` and `CompactOpenSubgroups` (`Topology/Algebra/RestrictedProduct/Basic.lean:59, 94, 244, 260`), and `rationalDiagonal` (`Diagonal.lean:62`);
  - `exists_of_realization` (`NumberTheory/LocalField/QuadraticForm/Realization.lean:113`).
- Mathlib: `Nat.forall_exists_prime_gt_and_eq_mod` (`NumberTheory/LSeries/PrimesInAP.lean:443`).
- Global Quadratic Forms on main: `hasseMinkowski_equivalent` (its `Suggested.lean:439`).

**Sources read this round.** `allcock-gal-mark2016`, lines 108–136 (oddity fusion on compartments) and lines 706–716 (the legal rank-one and rank-two terms).

**Sample B1–B8.** None of these targets changed. The previous review's locator verification stands:
- B1 and B4 are native;
- B2 cites Cox Theorem 7.7;
- B3's split statements are proved here, and the nonsquare genus target has no locator (R03);
- B5 cites Cox Theorems 2.8 and 2.13 and Cohen §5.6;
- B6 cites Cassels Chapter 13;
- B7 is proved here;
- B8 cites Conway–Sloane (1) and §6.

The values below marked *recomputed* were computed again this round, by brute force over integral `2×2` automorphisms and reduced forms.

**Remark on untouched text** (not a finding, no change asked). README.md:1014 also offers `1_3^{+1} 3^{+1}` for the determinant clause, but `1_3^{+1}` is not a legal term either (`allcock-gal-mark2016` line 711). One legal example that fails only that clause is `1_7^{+1} 3^{−1}` in signature `(1,0)`: here `1 + 6 = 7`, while `det = 3` forces sign `−` at 2 and `+` at 3.

**Adversarial table.** Rows marked *r25* are carried from the previous review (of `39e8628`) for statements the diff leaves untouched. No statement changed, so there is no new statement row.

| Statement | Instances tried | Values computed (left / right) | Result | Change | Basis |
| --- | --- | --- | --- | --- | --- |
| B1 `disc N_L = −4 det L`, content, `Δ` | `A₂`; `U`; `!![3,1;1,4]` | `4−16 = −12 = −4·3`, `c = 2`, `Δ = −3`; `N = 2xy`, `4 = −4·(−1)`, `c = 2`, `Δ = 1`; `4−48 = −44`, `c = 1`, `Δ = −44` | holds | none | recomputed |
| B1 content under sublattices | `⟨2e₁,e₂⟩`, `⟨e₁+e₂,e₁−e₂⟩ ≤ ℤ²` | index 2 and 2; `4x²+y²` (content 1) and `2x²+2y²` (content 2) | holds | none | r25 |
| B2 oriented sign clause | `Δ = 12`: `x²−3y²`, `−x²+3y²`, `3x²−y²` | same unoriented ideal `𝒪₁₂`; `x² ≡ 2 (mod 3)` impossible; `(3, √3) = √3·𝒪`, `N(√3) = −3` | holds | none | r25 |
| B2 sign transport | `x²+y²`, `−x²−y²` | `disc(−f) = disc f = −4`; `det(−G) = det G` in rank 2; 2 proper classes against `|Pic ℤ[i]| = 1` | holds | none | r25 |
| B3 split genus and torus | `Δ = 25`; `Δ = 64` | genera `{1,4}`, `{2,3}`; `(ℤ/5)ˣ/{t² = 1}` of order 2; `(ℤ/8)ˣ² = {1}`: 4 genera, quotient 1 | holds | none | r25 |
| B3 principal genus route | `Δ = −20`: `(1,0,5)`, `(2,2,3)` | reduced forms exactly these two; residues mod 5 `{1,4}` and `{2,3}`; bound `2^{μ−1} = 2`, `[C : C²] = 2`; the lower bound needs `(2,2,3)` or a prime `≡ 2,3 (mod 5)` | statement holds; route incomplete | R03 | recomputed |
| B3 ring class field | `Δ = −23` | reduced forms `(1,1,6)`, `(2,±1,3)`: `3 = [H : K]` | holds | none | recomputed |
| B4 `[O : SO]` | `!![4,1;1,6]`; `!![2,1;1,12]`; `A₂`; `U`; `⟨1⟩²` | `|O| = 2`, `|SO| = 2`; `|O| = 4`, `|SO| = 2`; `12`, `6`; `4`, `2`; `8`, `4` | holds | none | recomputed |
| B4 "ambiguous" | principal class of `Δ = −23` | class `1 = 1²`, `[O : SO] = 4/2 = 2`; README `a = 1` | wording false | R08 | recomputed |
| B4 split and Pell branches | `U`; `⟨1,−2⟩` | `SO = {±1}`, `|O(U)| = 4`; `N(1+√2) = −1`, `N(3+2√2) = 1`, infinite order | holds | none | r25 |
| B5 class counts | `Δ = −23`, `−44`, `25` | 3 reduced; `(1,0,11)`, `(3,±2,4)`: 3; `φ(5) = 4` | holds | none | recomputed |
| B6 points | `Δ = −4`, `12`, `U` | `{±1,±i}`; `±(2+√3)^ℤ`, `N(2+√3) = 4−3 = 1`; `{±1}` | holds | none | recomputed |
| B7 base of the fibration | `Δ < 0`, norm-one torus | `t = s/s̄ ↦ [𝔞]²`; kernel `N(α) = ±1 > 0`, so base `≅ Pic²` | holds | none | r25 |
| B7 volumes | `Δ = −4`; `Δ = 12`; `U` | `2π/4 = π/2`; `log(2+√3) = 1.31696`; `ℚˣ\𝔸^{×,1} ≅ ℤ̂ˣ`, volume 1 | holds | none | recomputed (first two) |
| B8 masses | `A₂`; genus of `!![4,1;1,6]` | `m⁺ = 1/6`, `m = 1/12`; `m⁺ = 3·½ = 3/2`, `m = 1/4 + 1/2 = 3/4 = h⁺/(2w)` against `h/(2w) = 1/2` | holds | none | recomputed |
| 4B double cosets (Lean) | `⟨1⟩`; genus of `!![4,1;1,6]`; `V = 0` | 1 point = 1 class; 2 points = `h`, 3 = `h⁺`; singletons on both sides | holds | R04 (route) | r25 |
| 4B determinant `−1` | `⟨3⟩` at 3; `⟨4⟩` at 2; `U` at 2 | no unit-norm vector in the first two, so the native lemma does not apply, and the reflection in `e` gives `−1`; for `U`, the reflection in `e − f` (norm `−2`) sends `e ↦ f` | holds | R04 | recomputed |
| 5A (Lean) | `E₈²`/`D₁₆⁺`; `⟨2⟩⊕⟨−2⟩`/`U(2)`; rank 0 | `(16,0,0)` on both sides; `q` values `{¼,¾,0}` against `{0,0,½}`; true/true | holds | none | r25 |
| 5B `padicDiscriminant_eq_squareClass_gramDet` | `⟨6⟩` at 3; `U(2)` at 2; `⟨4⟩` at 2; `⟨6⟩` at 2 | 6/6; `−4 = −4`; `4 = 4·1`; `q₂ = q_3^{(2)}(2)`, excluded by `hp` | holds | none | r25 |
| 5B conditions (Lean) | `⟨6⟩`, `⟨−6⟩` at 3; `(8,0,0)`; `(4,0,0)`; `(1,0,q_1^{(2)}(4))` | `6 ≡ 6`; `−6/3 = −2 ≡ 1 (mod 3)`; `E₈`; `4 ≢ 0`; Gauss sum `2e(1/8)`, `|A| = 4` | holds | none | r25 |
| 5B Corollary 1.10.2 (Lean) | `(1,1,0)`; `(2,1,q_1^{(2)}(2))` | `U`; `⟨2⟩ ⊕ U` | holds | none | r25 |
| 5G 1.12.2 (Lean) | `S = 0`; `⟨2⟩ ⊂ U` | right side iff `8 ∣ l₊ − l₋`; complement `⟨−2⟩` realizes `−q` | holds | none | r25 |
| 5G 1.12.4 (Lean) | `(1,0,1,1)`; `(2,0,2,2)`; `S = ⟨2⟩^{t₊}⊕⟨−2⟩^{t₋}` | `⟨2⟩ ↪ U`; `eᵢ + fᵢ` in `U²`; `2t ≤ l` | holds | none | r25 |
| 5G sign of condition 3 | 5B(3) with `−q` | `(−1)^{l₋−t₋}|A| ≡ (−1)^{l−t} discr K` ⇔ `(−1)^{l₊−t₊}|A| ≡ discr K` | holds | none | r25 |
| 5J (Lean) | `(1;1,0,1)`; `(0;1,1,0)`; `(0;2,0,2)` | `⟨2⟩`; `U`; inadmissible (`2 ≢ 0 (mod 4)`) | agrees | none | r25 |
| 6A (Lean) | `U`/`⟨1⟩⊕⟨−1⟩`; `U⊕E₈⊕E₈(−1)`/`U⁹`; `E₈²`/`D₁₆⁺` | parity separates; `(9,9)` on both sides; definite, so `hind` fails | holds | none | r25 |
| 6E (Lean) | Coxeter numbers; root counts | `n = 6`: 7, 10, 12; `n = 7`: 8, 12, 18; `n = 8`: 9, 14, 30; `D₁₆E₈`/`E₈³` 720/720; `A₁₇E₇`/`D₁₀E₇²` 432/432 | holds | none | r25 |
| 7E (Lean) | `n = 0, 1, 2, 3`; `O(1)`; Frobenius control | 1, 1, `2π`, `8π²`; 2; `SO(2)` length `2π` against `2π√2` | holds | none | r25 |
| 3E sign walking | `⟨1⟩⊕⟨4⟩ ≅ ⟨5⟩⊕⟨20⟩` | basis `e₁+e₂`, `−4e₁+e₂` (det 5), norms 5, 20; total oddity 2 and `10 ≡ 2` | holds | none | r25 |
| 3E oddity-fusion Check | `⟨1⟩⊕⟨3⟩`; `⟨7⟩⊕⟨2⟩ ≅ ⟨1⟩⊕⟨14⟩` | single term `1_4^{−2}`; `q(v) = 9`, `q(w) = 126`, `β(v,w) = 0`, det `−9`; oddity `8 ≡ 0` on both sides | Check mislabelled | R05 | recomputed |
| 3G oddity-formula Check | `1_1^{−1}3^{+1}`; `1_5^{−1}3^{+1}` | sign `−` forces `t ≡ ±3`; `5 ≡ −3`, `(2|3) = −1`, `1 + 2 = 3 ≢ 5` | not discriminating | R05 | recomputed |
| 3C, 4B, 4G Checks | `A₂` at 3; `⟨1⟩⊕⟨1⟩` at 5 and 2; `v = (11,2)` | `12/3 = 4`, units 2 against 1; `K₅⁺ ≅ ℤ₅ˣ`; `125 ≡ 0 (mod 25)` | holds | none | r25 |
| 4C | `x²+y²`; `5xy+y²` | quotient of order 2 against `[C : C²] = 1`; `G = ℤ/4`, 2 and 2 | holds | none | r25 |
| 3I exponents | `U`, `⟨1⟩`, `⟨2⟩`, `⟨1⟩⊕⟨2⟩` | `N = 2, 1, 2, 2`; `U`: `2^{−r}·2^{r+2} = 4`; `⟨2⟩`: 8 | holds | none | r25 |
| 7C | `U` at 3; `⟨1⟩⊕⟨1⟩` | `2(1−⅓) = 4/3`; `∏(1 − χ₋₄(p)/p) = 4/π` | holds | none | r25 |
| 6D basis Check | `D₁₅ + h`; `A₁₅ + h` | `4(4 − 15/4) = 1`; `16(4 − 15/16) = 49` | holds | none | r25 |
| 1G, 1H Checks | `u`, `v` at 2; `oddCyclic 3 θ` | Gauss sums 2 and −2, signs 0 and 4; sums `−i√3`, `i√3`, signs 6 and 2 | holds | none | r25 |

## Not verifiable

These items are carried from the previous review. None of their targets changed.
- **Cox, *Primes of the form x² + ny²*.** Theorems 2.8, 2.13, 3.9 and 7.7, and the §3 genus theorem proposed in R03. The book is paywalled and not in the manifest, so the numbering is unchecked.
- **Cohen, GTM 138, §§5.2 and 5.6.** Uncertified in the manifest; not read.
- **Cassels.** *Rational Quadratic Forms*, Chapter 13, and *Geometry of Numbers*, Chapter VIII. Not read.
- **Conway–Sloane, the mass formula paper.** Waived; not read.
- **Kawauchi–Kojima.** Uncertified; not read.
- **Nikulin (1979/1980).** Not in the cache. The "iff" form of Theorem 1.12.4 is unconfirmed at the text, though the iff stated is true (see the 5G rows).
- **Other texts.** O'Meara, Serre, Milnor–Husemoller, Cho, Gan–Yu, Wall, van der Blij and SPLAG were not read.

## Source issues

- none

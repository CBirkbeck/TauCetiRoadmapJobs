# Review of GlobalQuadraticForms (pull request #1200 at 53e2c5d)

**Verdict:** accepted

No findings. This was a full review of `TauCetiRoadmap/GlobalQuadraticForms/README.md` and `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` at `53e2c5d`, covering every passage whether changed or not. The folder is identical to the head the previous review read. Since then, only the pull-request description has changed.

## Verified sound

### The previous review's finding

- **R01 (P3), order with the conflicting #617: repaired.** The description now says: "For the shared `GlobalQuadraticForms` folder, the merge order is #1215 → #1200 → #617. Before merging, #617 rebases onto #1200 and retains all three README changes". That is the stated order and rebase direction the repair asked for.
  - I checked the conflict at #617's head `dec9d6b8`. Its copy of `TauCetiRoadmap/GlobalQuadraticForms/README.md` is byte-identical to main's (`b54415bf`). Its merge base with this head is `8fe2a7be`, which is older than main's ClassFieldTheory commit `df3858aa` that rewrote this folder.
  - A read-only `git merge-tree` of #617 with current main is clean and leaves this folder exactly as on main. So the conflict that the overlap report lists comes from #617's stale base. Once #617 takes main, the folder's only delta is this pull request's three edits, and the stated order keeps them.
  - The generated `merge-order` block still names only #1215, which is already merged as `df3858aa`, and does not name #617. The prose outside the block supplies the order, which is what the overlap rule asks for. Regenerating the block is the worker tool's job; the author has nothing to change.

### Gate, dependency check, build

- The worker's gate and my rerun (`gate … --base origin/main`) both report `OK`, with every counter 0: set_option, sorry-data, imports, statement-hygiene, dropped, readme-ids-missing, layer-ids, target-ids, depcheck, stray-files, outside-folder and source-material. The worker's run also has `build=0`.
- The dependency check, run as the brief specifies, returns:

```text
depcheck: 225 roadmaps, 2087 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or `moved:` line. "Exact supplier contracts" names no roadmap supplier; every input is a Mathlib or Tau Ceti declaration at the pins. The roadmaps named in Scope (Quadratic Form Invariants, Global Number Fields, Number Field Arithmetic, Class Field Theory, Integral Lattices) are ownership attributions, and they are cited in prose, not as links. The roadmap declares no supplier gaps and needs none.
- `lake env lean TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` exits 0 with exactly eight warnings, each `declaration uses 'sorry'`, at lines 53, 70, 78, 86, 95, 113, 122 and 135.
- Outside the folder, `git diff --stat origin/main...HEAD` changes nothing. The folder diff against main is 9 insertions and 4 deletions in `README.md`, matching the description's `roadmap-summary` block.

### Signatures, headlines, padding

- **`#check` probe.** I elaborated a scratch copy with `#check @name` for all eight declarations and compared each type with its README statement. Every declaration keeps `[FiniteDimensional K V]` (and `[FiniteDimensional K W]` where `W` occurs), its `Nondegenerate` hypotheses and, in 6.1, `a ≠ 0`. `K`, `V` and `W` live in independent universes (`u_1`, `u_2`, `u_3`). Section 8.3 uses the instance `invertibleTwo` (`Mathlib/Algebra/CharP/Invertible.lean:125`), as Conventions says. Nothing changed.
- **Headlines.** I listed the README's headlines: the four end theorems of the Summary, plus 4.2, 5.5, 6.1 and 6.2. All eight are stated on native carriers.

  | README | Lean name | Line |
  |---|---|---|
  | 4.2 | `isSquare_of_isSquare_unitAtFinitePlace_of_notMem` | 53 |
  | 5.5 | `hasseMinkowski_isotropic` | 70 |
  | 6.1 | `represents_iff_locallyRepresents` | 78 |
  | 6.2 | `represented_iff_locallyRepresented` | 86 |
  | 6.3 | `hasseMinkowski_equivalent` | 95 |
  | 7.3 | `exists_globalForm_of_isAdmissible` | 113 |
  | 8.1 | `equivalent_iff_globalInvariants_eq` | 122 |
  | 8.3 | `injective_wittRing_baseChange_places` | 135 |

  Three statements in the README are directions or reformulations of these rather than separate headlines:
  - 7.4 and 8.4 are the reverse directions of 8.1 and 6.3, and the module docstring says so for 8.4.
  - The Witt-class half of 8.2 is 8.3.
  - 7.2's form-level conclusion is 7.3 together with `GlobalFormInvariants.IsLocalRealization.equivalent_atFinitePlace`/`…atRealPlace`.

  No headline is forced through a stand-in, and the file defines nothing.
- **One-tactic probe.** In a scratch copy, each `sorry` was replaced by `first | rfl | (simp; done) | infer_instance | decide | exact? | sorry`. All eight reached the fallback `sorry`, so none is padding.
- **Pinned results that come close.** I checked the pinned files near the headlines for an existing proof. `Global/WittLocalization.lean:40` says injectivity is not proved there. `Global/Hyperbolicity.lean:31` and `IntegralLattice/Genus.lean:43` say the same of Hasse–Minkowski for isometry. Four other pinned results are near but none states a headline:
  - `Global/DiagonalApproximation.lean:40` matches local forms at finitely many places only.
  - `Global/RankOne.lean:42` is the rank-one case of 7.2.
  - `Global/LocalWittClass.lean:113` describes local Witt equality by invariants.
  - `Global/IdeleCharacter.lean:238`/`:255` give surjectivity and index two of the idele Hilbert character.
- **Style.** No hits for process words, round labels, LaTeX delimiters, `lemma`, `set_option`, `#eval`/`#print`, or pull-request numbers in the README or the Lean file. `PROGRESS.md`, `STATUS.md` and `metadata.toml` are the generated folder files (`stray-files=0`).

### Seeded source sample (15 targets)

`milne-cft` is the cached version 4.03 text. Printed page = PDF page − 9: PDF 238 carries printed 229, 243 → 234, 244 → 235, 245 → 236, 246 → 237, 260 → 251, 261 → 252, 264 → 255, 265 → 256.

| Target | Locator checked | Result |
|---|---|---|
| 4.1 | Pinned inputs: `Mathlib/FieldTheory/PrimitiveElement.lean:209`; `FieldTheory/IntermediateField/Adjoin/Basic.lean:423` (`AdjoinRoot (minpoly F α) ≃ₐ[F] F⟮α⟯` for integral `α`); `NumberTheory/NumberField/Basic.lean:193`; `RingTheory/DedekindDomain/Ideal/Lemmas.lean:592` (`v ↦ comap e.symm v`, the image prime); `InfinitePlace/Ramification.lean:82`, `:90`; `InfinitePlace/Basic.lean:244`; Tau Ceti `RingTheory/DedekindDomain/AdicValuation/Transport.lean:119`, `:140`; `RingTheory/DedekindDomain/Ideal/Basic.lean:279`. `omeara` 71:19 and 71:19a are uncertified (below). | Each matches the use in item 2. The seven item-3 statements match `SignPrescription.lean:154`, `:191`, `ProductFormula.lean:67`, `:107`, `:117`, `HasseNorm/Quadratic.lean:45` and `PrescribedLocalForms.lean:140`. Each has `K : Type`, the same hypotheses (nonsquare on `S`, negative on `T`, `#S + #T` even; nonsquare `d`), and the same conclusions. |
| 4.2 | `milne-cft` line 10384, VIII Thm 1.1, p. 229; Exercise 1.3, line 10397, p. 229 | Primitive `n`-th root and almost all places. For `n = 2`, `-1 ∈ K` always. The exercise supports the eighth-power Check. |
| 4.3 | line 10629, VIII Thm 3.1, p. 234 | Cyclic `L/K`, global norm iff local norm at all `v`. `K(√d)/K` is cyclic of degree 2 for nonsquare `d`. |
| 5.1 | lines 10698–10710, Prop 3.7(b),(c), p. 236; lines 10772–10778, proof of 3.5(b), p. 237 | The binary case uses 3.7(b) with Thm 1.1. For the ternary case the roadmap correctly names Thm 3.1, where the source misprints 1.1 (Source issues). |
| 5.5 | `omeara` 66:1 uncertified; line 10689, Thm 3.5(b), p. 235 | Supports isotropy over a number field. The higher-rank route matches lines 10788–10804, with `U(x) ≠ 0` added to close the source's gap. |
| 6.1 | `omeara` 66:3 uncertified; line 10694, Cor 3.6, p. 236 | Supports scalar representation. The roadmap's `a ≠ 0` avoids the source's `a = 0` problem in Lemma 3.4. |
| 6.2 | `omeara` 66:3 uncertified | The route was checked against the pinned `Representation.lean:277`, `Witt/Extension.lean:50`, `Witt/Cancellation.lean:196` and `Radical.lean:530`, `:677`. |
| 6.3 | `omeara` 66:4 uncertified; line 11619, Thm 6.3, p. 252 | Local isometry at all places gives global isometry. |
| 7.2 | `omeara` 72:1 uncertified; lines 11745–11778, Thm 6.10 and Prop 6.11, p. 255; lines 11781–11785, p. 256; lines 11792–11807, Thm 6.12, p. 256 | The source's S equals our s times `(-1, d)_v`, whose product over all places is 1, so the product hypothesis transfers. The small-rank clauses match 6.11(a),(b). The real discriminant and sign determine `t` only in rank ≤ 3 (line 11784). |
| 7.3 | `omeara` 72:1 uncertified; lines 11798–11807 | The restated Thm 6.12 conditions, converted to our sign convention, are exactly the clauses of `IsAdmissible` (`Invariants.lean:178`). |
| 7.4 | Thm 6.3 p. 252; Thm 6.10 line 11745, p. 255; Remark 6.6 lines 11677–11692, p. 253 | The conversion `S = ε·(-1, d)` confirms "the same factor `(-1, d)_v` on both sides". |
| 8.1 | `omeara` 66:5 uncertified | Supported by 7.4 and `FormInvariants.lean:193`; holds in rank 0. |
| 8.2 | Thm 6.3 p. 252; Prop 6.2 lines 11574–11575, p. 251 | Applying the theorem to `Q` and `m·H` is valid. The Witt statement follows from it applied to `Q ⊥ (-R)`. |
| 8.3 | Thm 6.3 p. 252, through 8.2 | `TauCeti.WittRing.globalToLocal` (`WittLocalization.lean:167`) has exactly the stated finite and real components. |
| 8.4 | Thm 6.3 p. 252; Remark 6.4 line 11629 | Only the form-level reverse direction is exported. Remark 6.4 concerns `O`, and the `SO` translation is assigned to the consumer, as Orthogonal and Spin Groups on main says (`Completed/OrthogonalSpinGroups/README.md:963–967`). |

### Pinned declarations opened (file and line at Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`)

Of the 169 backticked declaration names in the README that I looked up, 159 resolve directly to a declaration at the pins. The other ten are accounted for: this roadmap's own eight (declared in `Suggested.lean`), `Q.Nondegenerate` (dot notation for `QuadraticMap.Nondegenerate`), and `injective_iff_map_eq_zero`. The last is the `to_additive` form of `injective_iff_map_eq_one`, `Mathlib/Algebra/Group/Hom/Basic.lean:181`. The ones whose content the review depends on:

| Declaration | File:line | What it says |
|---|---|---|
| `GlobalFormInvariants` / `IsAdmissible` | `NumberTheory/QuadraticForm/Global/Invariants.lean:90`, `:178` | The record has no axioms. `IsAdmissible` requires `1 ≤ n`, `p_w ≤ n`, real discriminant `q_w • [-1]`, finite support, `s_v = 1` in rank 1, `s_v = 1` in rank 2 where `d_v = [-1]`, and Hasse product 1. `q_w` is ℕ subtraction, harmless because of `p_w ≤ n`. |
| `globalInvariants`, `isAdmissible_globalInvariants_iff`, `Equivalent.globalInvariants_eq` | `Global/FormInvariants.lean:77`, `:165`, `:193` | Defined in every rank; uses `invertibleOfNonzero` internally. |
| `IsLocallyIsotropic`, `LocallyRepresents`, `LocallyRepresentsScalar`, `LocallyEquivalent` | `Global/Predicates.lean:51`, `:66`, `:85`, `:147` | Conjunctions over finite and real places of genuine localizations. None mentions a global conclusion. |
| `Represents`, `IsRepresentedBy` | `LinearAlgebra/QuadraticForm/Representation.lean:46`, `:49` | `∃ v, Q v = a` (zero vector allowed); an injective isometry. |
| `QuadraticMap.Nondegenerate`, `radical_eq_ker_polarBilin` | Mathlib `LinearAlgebra/QuadraticForm/Radical.lean:115`, `:126` | Radical `⊥` and polar-kernel rank ≤ 1. |
| `hilbertSymbol` | `NumberTheory/HilbertSymbol/Basic.lean:47` | `1` iff `b = x² - a y²` is solvable, as Conventions says. |
| New map line: `hasFiniteMulSupport_hilbertSymbol_unitAtFinitePlace` | `Global/HilbertSymbol.lean:124` | `K : Type*`, any `a b : Kˣ`; finite multiplicative support over finite places. Correctly not marked "in `Type`". |
| New map line: `hilbertSymbol_completion_eq_one_of_isComplex` | `Global/ArchimedeanSymbol.lean:167` | Every symbol over the completion at a complex place is 1; `K : Type*`. |
| `hilbertSymbol_real`, `hilbertSymbol_unitAtRealPlace_eq_neg_one_iff` | `HilbertSymbol/Archimedean.lean:59`; `ArchimedeanSymbol.lean:102` | `-1` iff both are negative at the real place. |
| `hilbertSymbol_productFormula` | `Global/ProductFormula.lean:67` | `K : Type`, marked "in `Type`" ✓. |
| `not_anisotropic_of_isLocallyIsotropic_quaternary` | `Global/Quaternary.lean:137` | Ternary hypothesis over every `L : Type u` on `presentedForm p` with `p.1 = 3`. |
| `not_anisotropic_of_isLocallyIsotropic_of_five_le_finrank` | `Global/HigherRank.lean:87` | Hypothesis on `presentedForm p` over `K` with `p.1 + 1 = finrank`. |
| `presentedForm` | `RegularFormClass/Basic.lean:111` | Diagonal form on `Fin p.1 → K`. |
| `finrank_le_index_range_ideleClassNormMap` | `ClassFieldTheory/Global/IdeleClass/FirstInequality.lean:108` | `K L : Type`, `[IsGalois K L] [IsCyclic Gal(L/K)]`. |
| `exists_sq_sub_mul_sq_iff_forall_completion` | `ClassFieldTheory/Global/HasseNorm/Quadratic.lean:45` | Nonsquare `d`, `a : Kˣ`, all finite and infinite completions. |
| `IsLocalRealization`, `exists_locallyRepresents_prod`, `isAdmissible_ofLocalForms`, `isLocalRealization_ofLocalForms` | `Global/LocalRealization.lean:108`; `PrescribedLocalForms.lean:140`; `LocalRealization.lean:331`, `:309` | Match the descriptions in 4.1 item 3 and 7.2. |
| `globalToLocal`, `globalToLocal_wittClass_formClass` | `Global/WittLocalization.lean:167`, `:188` | `RingHom.pi baseChange` × `RingHom.pi atRealPlace`. |

The section map's "in `Type`" marks agree with the universe of `K` in each file. `Type u` or `Type*` in `Localization`, `Predicates`, `Signature`, `FiniteHasse`, `HasseSupport`, `Classification`, `ComplexPlaces`, `Invariants`, `FormInvariants`, `HilbertSymbol` and `ArchimedeanSymbol`. `Type` in `ProductFormula` and `SignPrescription`.

### Ownership and cross-roadmap citations

- On main, `TauCetiRoadmap/QuadraticFormInvariants/README.md:90–93` and `TauCetiRoadmap/ClassFieldTheory/README.md:203`, `:249` assign Hasse–Minkowski and global classification to this roadmap. So do `Completed/OrthogonalSpinGroups/README.md:68`, `:947`, `:965` and `TauCetiRoadmap/IntegralLattices/README.md:477`, `:916`.
- At open heads: #1691 `GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:15` names this roadmap as owner. #1834 (QuadraticFormInvariantsPartII) owns characteristic two and higher invariants, not global classification. Board packages (K3SurfacesAndSymplecticBoundedness, LogicAndDefinabilityInNumberTheoryPartII line 105, GeometryOfNumbersAndQuadraticArithmeticPartII) consume §5.5.
- No second owner and no shared fully qualified name.
- Classical Arithmetic Completion on main (`README.md:166–172`) consumes the real value, the value 1 at a complex place, and the localized product formula. Its link anchor `#layer-4-global-square-norm-and-approximation-lemmas` resolves to this README's Layer 4 heading. The three edits describe this correctly.
- The downstream line "Orthogonal and Spin Groups consumes 4.3 and 6.1" holds at that roadmap's open revision (#1181, `Completed/OrthogonalSpinGroups/README.md:349`, `:904`, `:919`, `:938`). Main's copy names only 6.3. This is a consumer description, not a dependency.
- Names that other roadmaps cite resolve through the section map:
  - QuaternionArithmetic (#1722, `README.md:288`) and GL2AutomorphicRepresentationsAndTransfer (#931, `README.md:408`) cite `exists_hilbertSymbol_eq_neg_one_iff_pair`; the map line covers it.
  - IntegralLattices (`:477`) cites `equivalent_of_locallyEquivalent`, covered by 8.4.
  - MetaplecticAutomorphicForms (#1063, `README.md:427`) cites the archimedean symbol of 4.4, covered by the map.
- The overlap report lists no dropped id and no id defined only by an open revision. Ownership was checked against every open head the brief lists.

### Adversarial pass

The Hilbert symbols over ℚ were computed with the standard formulas (Serre III.1.2), at 2, 3, 5, 7, 11, 13 and ∞; outside these, both arguments are odd units. G/L means the global side and the local side, and T/F are truth values. No row asks for a change.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Plain vs signed discriminant | `H = ⟨1,-1⟩`, `⟨1,1⟩` | plain `[-1]`, `[1]`; signed `[1]`, `[-1]` | Convention Check correct |
| `i<j` vs `i≤j` Hasse | `H` over ℝ | `s = (1,-1) = 1`; `S = (1,1)(1,-1)(-1,-1) = -1 = s·(-1,d)` | Conversion factor `(-1,d)` correct |
| Real Hasse sign, ℕ subtraction | `q = 0..4`; record `n = 1, p_w = 2` | signs `1,1,-1,-1,1`; det signs `1,-1,1,-1,1`; rank 4, `d=[1]`: `t = 0,2,4` give `1,-1,1`; junk `q = 0` but `2 ≤ 1` is F | 7.2 rank-four claim holds; junk record inadmissible |
| `(-1,3)` Check | ℚ | `-1` at 2 and 3, `+1` at ∞; product 1 | Correct |
| 4.1(1) model in `Type` | `ℚ(∛2)` vs `ℚ[X]/(X³-2)` | Eisenstein at 2; degree 3 both; `(r₁, r₂) = (1,1)` both | Model preserves the field |
| 4.1(2) finite places | conjugation on `ℚ(i)`, `2+i` | at `(2-i)`: residue `4 = 2²` mod 5, square; at `(2+i)`: valuation 1, nonsquare; `σ(2-i) = (2+i)` | Correspondence must follow `σ` |
| 4.1(2) real places | `ℚ(√5)`, `σθ = 1-θ`, `Q = ⟨1,θ,θ⟩` | `w'.comap σ` sends `θ ↦ -0.618`; `p(σQ, w') = 1 = p(Q, w'.comap σ)`; fixed-place model gives 3 | Direction correct |
| 4.1(3) product formula | `(15,2)`, `(-3,-1)` | `-1` at {3,5}; `-1` at {3,∞}; both products 1 | Correct |
| 4.1(3) prescribed second argument | `b=2`, `S={3,5}`; `b=2`, `S={7}` | `a=15` gives `-1` exactly at 3, 5; `2 ≡ 3²` mod 7 so `(a,2)_7 = 1` for all `a` | Nonsquare hypothesis needed |
| 4.1(3) pair | `S={3,5}`, `T=∅`; `S={3}` | `(15,2)` works; odd count impossible by product formula | Parity hypothesis needed |
| 4.2 headline | `ℚ(√2)`, `a=2`; ℚ, `a=-7` | `(√2)² = 2`: T/T. `-7` is a square in ℚ₂ but not in ℚ₃ or ℚ₅, and not at every `p` with `(-7/p) = -1`: hypothesis F, `-7` not a square: F | Finite exceptions cannot hide the obstruction |
| 4.2 eighth power | `16` over ℚ, `S={2}` | `x⁸-16 = (x²-2)(x²+2)(x²+2x+2)(x²-2x+2)`; `(−1/p)(2/p)(−2/p) = 1`; `16 = 2⁴` | Local T, global F |
| 4.3 adapter | `d=5, a=-1`; `d=3, a=-1`; `d=1` | `2² - 5 = -1`: T/T. `(3,-1) = -1` at 2 and 3: F/F (real side solvable). `d=1` is a square, excluded | Correct |
| 5.1 binary | `⟨1,-2⟩` over ℚ and over `ℚ(√2)` | `-det = 2`, nonsquare mod 3: F/F; `√2` gives T/T | Correct |
| 5.1 ternary | `⟨1,-2,-7⟩`; `⟨1,1,-3⟩` | `(2,7) = +1` everywhere, vector `(3,1,1)`: T/T; `(-1,3) = -1` at 2, 3: F/F | Norm reduction correct |
| 5.5 headline | `⟨1,1,-3,-3⟩`; `⟨1,1,1,-3⟩`; zero space; `⟨1,1,1,1,1⟩` | first: `s` is `-1` at {3,∞}, against {2,∞} for `2H` with the same `d=[1]` and signature, so anisotropic at 2, 3, and 3 is not a norm from `ℚ(i)`: F/F. Second: `(1,1,1,1)`: T/T. Zero space: F/F. Positive quintic: F/F at ℝ | Correct, including rank 0 |
| 6.1 headline | `⟨1,1,1⟩` with `a = 7, 3`; `H` | 7: G F (`7 ≡ 7` mod 8), L F at 2 (Milne Prop 6.9(c): `a = -d` and `S = 1 ≠ (-1,-1)_2`). 3: `1+1+1`, T/T. `H` at `((1+a)/2, (1-a)/2)`: T/T | Correct |
| 6.2 headline | `⟨1,1⟩` into `⟨1,1,1⟩`; `⟨7⟩` into `⟨1,1,1⟩`; zero source; rank 3 into 2 | T/T; F/F; T/T; F/F (`finrank_le`) | Direction correct |
| 6.3 headline | `⟨1,1⟩` vs `⟨5,5⟩`; vs `⟨3,3⟩` | `(x+2y)² + (2x-y)² = 5x² + 5y²`, `s` equal: T/T. `s(⟨3,3⟩) = -1` at {2,3}, same `d` and signature: F/F | Discriminant and signature alone insufficient |
| 7.2 | local `⟨3,3⟩` at 2, 3 and `⟨1,1⟩` elsewhere, `R = ⟨1,1⟩`; the same with 3 only | `[1] ≠ [-1]` in ℚ₂ and ℚ₃; product `(-1)(-1) = 1`, realized by `⟨3,3⟩`. Single place: product `-1`, hypotheses F | Product hypothesis discriminates |
| 7.2 correction planes | `a=15`, `b=2` | `d(⟨1,-2⟩) = [-2] = [-450] = d(⟨15,-30⟩)`; `s(P') = (15,2)` is `-1` at {3,5} | Rank and discriminant kept, sign flipped |
| 7.3 headline | records `(2,[1],s=-1@{2,3},p=2)`, `(2,[1],s=-1@{3,5})`, `(1,[1],s=-1@{3,5})`, rank 0 | First admissible, realized by `⟨3,3⟩`. Second: `-1 = 2²` mod 5 forces `s_5 = 1`: F. Third: rank-one clause F. Zero record realized but `1 ≤ 0` F | No junk record accepted |
| 7.4 | `⟨1,1⟩`, `⟨5,5⟩` | equal records, explicit isometry above | Correct |
| 8.1 headline | `⟨1,1,-1⟩` vs `⟨1,2,-2⟩`; `⟨1,1⟩` vs `⟨3,3⟩`; rank 0 vs 0 and vs `⟨1⟩` | `d = [-1] = [-4]`, `s ≡ 1`, `p = 2`: T/T. `s` differs at 2, 3: F/F. T/T; F/F | Includes rank 0 |
| 8.2 | `⟨1,1,-3,-3⟩` vs `2H`; `⟨1,-1,3,-3⟩` | same rank, `d`, signature and real Hasse `-1`; `s` differs at 2, 3: not locally hyperbolic, F/F. Pairs hyperbolic: T/T | Finite Hasse signs needed |
| 8.3 headline | `[⟨1,1,-3,-3⟩]`, `[⟨1,-5⟩]` over ℚ; `[⟨1⟩] - [⟨-1⟩]` over `ℚ(i)`; `[⟨1,1⟩] - [⟨5,5⟩]` | First nonzero at 2 and 3, zero at ℝ (signature 0). Second nonzero at 3 (5 nonsquare mod 3). Third `-1 = i²`, so 0 with empty real factor. Fourth 0 | Kernel and no-real-place case |
| 8.4 | `⟨1,1⟩` vs `⟨5,5⟩`, `⟨3,3⟩` | T/T; F/F | Reverse of 6.3 only |
| New map lines (4.4) | `(15,2)` over ℚ; `(-1,-1)` over `ℚ(i)` | finite support {3,5}, finite product 1; `-1 = i²`, so every symbol is 1, and at the complex place `y = 0`, `x² = b` | Agree with pinned declarations |
| Worked `ℚ(√5)` record | `⟨1,θ,θ⟩` | `d = [θ²] = [1]`; `p = (3,1)`; real Hasse `(1,-1)`; `(θ,-1)_v = 1` off 2, and `(2)` is inert, so the product formula forces `s_(2) = -1`; total `(-1)·1·(-1) = 1` | Matches `Sqrt5.lean:178` |

The standing hypotheses exclude characteristic two, the zero ring and inseparable extensions. Dyadic places occur in the rows above. Empty real-place sets were tested over `ℚ(i)`. Every number field has a finite place, so the local predicates are never vacuous. The only denominators in the routes are 2, a nonzero diagonal weight, and `t` in the branch `t ≠ 0` of 6.1.

## Not verifiable

- `omeara`, *Introduction to Quadratic Forms*, §§58:7, 65:15, 66:1, 66:3, 66:4, 66:5, 71:19, 71:19a, 72:1. The manifest settles this book as uncertified (paywalled publisher copy). I did not request it again. The statements were checked independently against `milne-cft` and the pinned declarations above, but the paragraph numbers are not certified.
- `serre`, *A Course in Arithmetic*, Ch. III §1.2 Thm 1, §2.2 Thm 3, Ch. IV §2.1, §3.2 Thm 8: also settled uncertified. The sign conventions it is cited for were recomputed independently.

## Source issues

- **Error** in milne-cft at VIII Lemma 3.4, printed p. 235 (line 10679): the source says representation of `a` is equivalent to `q - aY²` representing 0, with nonzero vectors; it should exclude `a = 0`, where anisotropic `q` breaks the equivalence; affects a stated result.
- **Misprint** in milne-cft at VIII proof of Theorem 3.5(b), printed p. 237 (line 10777): the source says ranks 3 and 4 follow from Proposition 3.7 with Theorem 1.1; it should be Theorem 3.1, the cyclic Hasse norm theorem; affects the proof.
- **Misprint** in milne-cft at VIII proof of Theorem 3.5(b), printed p. 237 (line 10788): the source says it assumes Theorem 3.1b for `n - 1` variables; it should be Theorem 3.5(b); affects the proof.
- **Gap** in milne-cft at VIII proof of Theorem 3.5(b), printed p. 237 (lines 10790–10803): the source says the approximated value `c` is close to `c_v` on the exceptional set; it should also ensure `c ≠ 0` and `c_v ≠ 0`, needed when the set is empty; affects the proof.
- **Error** in milne-cft at VIII proof of Theorem 6.10, printed p. 255 (line 11755): the source says splitting off `aZ²` multiplies `S` by `(a, d(q₁))`; it should be `(a,a)(a, d(q₁))` for its `i ≤ j` invariant, and the conclusion survives; affects the proof.
- **Error** in milne-cft at VIII §6, Generalities (a), printed p. 256 (lines 11788–11789): the source says a rank-one local triple is realizable when `s = 1`; it should require `s = (-1, d)`, as Proposition 6.11(a) states; affects a stated result.

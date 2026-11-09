# Review of PadicExtensionFamilies (pull request #1713 at c09ab16)

**Verdict:** needs changes

This is a full review: the folder changed by 309 lines since `5e8f0af`. All four findings of the previous review are repaired (see *Previous findings*). Two blocking findings come from the pinned Tau Ceti. First, the Galois slope content can be stated at the pin, although the docstring says it cannot. Second, Mass formula's carriers and Serre's second mass formula are native at the pin, and `Suggested.lean` restates them. The gate passes.

## R01 (P2) — The weighted Galois-mean-slope formula can be stated at the pins; the docstring's reason fails for a Galois extension

- **Location.**
  - `TauCetiRoadmap/PadicExtensionFamilies/Suggested.lean:27–30`: "Its definition as a multiset needs the finiteness of the set of breaks, which is itself a theorem; the pins have the break predicate `UpperJump` but no finite carrier of breaks with multiplicities."
  - README 3.1 and 3.3 (`README.md:1043–1099`).
- **Claim.** For a finite Galois `M/K` no finiteness theorem is needed. The upper breaks are `φ_{M/K}(i)` for the integer lower indices `1 ≤ i ≤ largestLowerJump K M`, with multiplicity `log_p [G_i : G_{i+1}]`. Every one of these is a pinned definition. So the 3.3 weighted formula is statable, and the module docstring lists it, as "the Galois slope content", among the headlines it says are not.
- **Witness.** A scratch file importing `Herbrand.Jump` and `Discriminant.Basic` elaborates with one `sorry` warning. It contains the definition and theorem below, built from `largestLowerJump` (`RamificationGroup.lean:229`), `lowerRamificationGroup`, `Subgroup.relIndex` and `herbrand` (`Herbrand/Basic.lean:258`).

```lean
def galoisArtinSlopeList : List ℝ :=
  (List.range (largestLowerJump K M).toNat).flatMap fun j =>
    List.replicate
      (Nat.log (ringChar 𝓀[K])
        ((lowerRamificationGroup K M ((j + 2 : ℕ) : ℤ)).relIndex
          (lowerRamificationGroup K M ((j + 1 : ℕ) : ℤ))))
      ((herbrand K M ⟨((j + 1 : ℕ) : ℝ),
        Set.mem_Ici.2 (by have := Nat.cast_nonneg (α := ℝ) (j + 1); linarith)⟩ : ℝ) + 1)

theorem discriminantExponent_div_finrank_eq :
    (discriminantExponent K M : ℝ) / Module.finrank K M =
      1 - 1 / (((lowerRamificationGroup K M 1).relIndex (lowerRamificationGroup K M 0) : ℝ) *
          (ringChar 𝓀[K] : ℝ) ^ (galoisArtinSlopeList K M).length) +
        ((ringChar 𝓀[K] : ℝ) - 1) *
          ∑ i : Fin (galoisArtinSlopeList K M).length,
            ((galoisArtinSlopeList K M).get i - 1) /
              (ringChar 𝓀[K] : ℝ) ^ ((galoisArtinSlopeList K M).length - i.1) := by
  sorry
```

- **Repair.**
  - Add this definition (or a `Multiset` version) and the weighted formula to `Suggested.lean` under a `Layer 3` section comment.
  - In README 3.1, add an API bullet: for Galois `M/K` this list is `artinSlopes K M` of 2.2, sorted (Herbrand's theorem, `upperJump_herbrand_iff`). In 3.3, name the theorem.
  - Delete the docstring's general reason. The visible slopes of a non-Galois `L/K` have the same finite index set through `M`: multiplicity `log_p([G : G_{i+1}H]/[G : G_i H])` at `φ_{M/K}(i)`. So either state the 2.4 multiset form and the 2.6 statements as well, or name exactly which carrier each still lacks.
- **Tested.** These are the values each side of the probe statement takes:

  | Instance | List | Right side | `c(M/K)/[M:K]` |
  |---|---|---|---|
  | `ℚ_2(ζ_8)` (lower jumps 1, 3), `t = 1` | `[2, 3]` | `1 − 1/4 + (1/4 + 1) = 2` | `8/4` |
  | `D_4` closure of `ℚ_2(∜2)` (jumps 1, 3, 7) | `[2, 3, 4]` | `7/8 + 1/8 + 1/2 + 3/2 = 3` | `24/8` |
  | closure of `ℚ_5(∛5)` (`largestLowerJump = 0`), `t = 3` | `[]` | `2/3` | `4/6` |
  | unramified quadratic, `t = 1` | `[]` | `0` | `0/2` |

## R02 (P2) — Mass formula's carriers and Serre's second mass formula are native at the Tau Ceti pin; `Suggested.lean` restates them

- **Location.**
  - `Suggested.lean:436–463`: `totallyRamifiedHeight` and `mass_completeness`, whose hypothesis is `∃ c, HasExtensionInvariants K E n 1 c`.
  - `README.md:126–130` and the table row at `:376`: "Mass formula's `totallyRamifiedOfDegree`, `TauCetiRoadmap.MassFormula.wildExponent`, … (its `Suggested.lean`)".
  - The same kind of citation in 0.3 (`:418–431`), 5.4 (`:1423`) and 6.8 (`:1826–1844`).
- **Claim.** These are two owners for one object.
  - On a finite `E`, `totallyRamifiedHeight K E` is the pinned `IntermediateField.wildExponent`. They differ only in the junk value on infinite `E` (0 here, 1 pinned).
  - `∃ c, HasExtensionInvariants K E n 1 c` is membership in the pinned `totallyRamifiedOfDegree K n`.
  - The forward direction of `mass_completeness` is the pinned second mass formula.
  - The README cites roadmap `Suggested.lean` names for declarations that are now pinned under `TauCeti`.
  - The README also uses "wild exponent" for two invariants. 0.1 defines `wildExponent K L := padicValNat p e`, which `Suggested.lean:56` also defines. Convention 6 (`README.md:222–223`) writes the wild exponent as `H`, and the pinned `IntermediateField.wildExponent` is `H = c(L)`.
- **Witness.** In `TauCeti/NumberTheory/LocalField/MassFormula/` at `2fd255d`:
  - `totallyRamifiedOfDegree` (`Basic.lean:111`), `IntermediateField.wildExponent` (`:202`);
  - `IsRepresentativeSet` (`Representative.lean:65`);
  - the second mass formula `IsRepresentativeSet.tsum_one_div_natCard_algEquiv_mul_natCard_residueField_pow_wildExponent` (`Main.lean:89`);
  - `infinite_totallyRamifiedOfDegree_iff` (`Main.lean:100`).
- **Repair.**
  - Delete `totallyRamifiedHeight`. Restate the headline as below; this elaborates against `TauCeti.NumberTheory.LocalField.MassFormula.Main`, with one `sorry` warning.

```lean
theorem mass_completeness (n : ℕ) (hn : 0 < n)
    (S : Finset (IntermediateField K (SeparableClosure K)))
    (hS : ∀ E ∈ S, E ∈ totallyRamifiedOfDegree K n)
    (hpair : ∀ E ∈ S, ∀ F ∈ S, Nonempty (E ≃ₐ[K] F) → E = F) :
    IsRepresentativeSet n (S : Set (IntermediateField K (SeparableClosure K))) ↔
      (∑ E ∈ S, (1 : ℚ) /
        ((Nat.card (E ≃ₐ[K] E) : ℚ) * (Nat.card 𝓀[K] : ℚ) ^ E.wildExponent)) = 1 := by
  sorry
```

  - In 6.8, cite the pinned second mass formula for the forward direction, and `exists_isRepresentativeSet` with positivity for the converse.
  - State the `(n, 1)` cases of `ore_realizability` and `krasner_refined_count` as `E ∈ totallyRamifiedOfDegree K n ∧ E.wildExponent = j`. Keep `HasExtensionInvariants` for `monge_class_count`, and write its discriminant as `E.discriminantExponent`.
  - In the supplier bullet, the table row, 0.3, 5.4 and 6.8, cite the pinned names with their files. Also cite `IntermediateField.discriminantExponent_eq`, `wildExponent_eq_zero_iff` and `discriminantExponent_eq_of_algEquiv` (`Basic.lean:181, 246, 283`). Then delete the `TauCetiRoadmap.MassFormula.*` citations.
  - Rename 0.1's `w` invariant in the README and in Lean, so that "wild exponent" means `H` everywhere.
- **Tested.** Over `ℚ_2`, `n = 2`, the six fields have `IntermediateField.wildExponent` values `1, 1, 2, 2, 2, 2` and `#Aut = 2`. Their mass is `2/4 + 4/8 = 1` (complete). Dropping `ℚ_2(i)` leaves `3/4` (incomplete).

## R03 (P3) — Four locators point at nothing or at the wrong place

- **Location and witness.**
  - `README.md:785`: "`lowerRamificationGroup_one` and `natCard_lowerRamificationGroup_one`". No declaration `lowerRamificationGroup_one` exists at either pin. The cited fact, that `G^u` is a `p`-group for `u > 0`, is `isPGroup_upperRamificationGroup_of_pos` (`Herbrand/PPrimary.lean:78`).
  - `README.md:347`: `AlgHom.fintype`. The instance is `minpoly.AlgHom.fintype` (`Mathlib/FieldTheory/Minpoly/Field.lean:250`; `#check @AlgHom.fintype` fails).
  - `README.md:367` lists `RamificationIndexDomain` under `Herbrand/`. It is at `RamificationGroup.lean:86`.
  - `README.md:936` ("Greve–Pauli, author preprint, §8 in the Galois case"), `:2135` and `Suggested.lean:214`. §8 of the author preprint (p.15) treats Galois groups of one-segment polygons. The Galois-case statement that a slope `−m` gives a jump at `m` is in §4, p.5 (greve-pauli lines 201–206).
- **Repair.** Replace the name at `:785`, write `minpoly.AlgHom.fintype` at `:347`, and move `RamificationIndexDomain` to the `RamificationGroup.lean` row. Cite "§4, p.5" instead of "§8" at `:936` and in the `Suggested.lean:214` docstring. In References (`:2135`), keep §8 only as the one-segment Galois-group source.

## R04 (P3) — 1.5 and 2.2 each split one Checks list around API bullets

- **Location.**
  - 1.5 (`README.md:705–729`): a **Checks.** list, then three API bullets (`:715–719`, starting "The relative base for root differences is the maximal unramified subfield"), then a second **Checks.** list.
  - 2.2 (`:798–820`): a **Checks.** list, the API bullet "The right-limit subgroup is the union…" (`:810–811`), then a second **Checks.** list.
  - In 6.2 (`:1506`), 6.3 (`:1539`) and 6.8 (`:1866`), a blank line splits a Checks list into two lists.
- **Claim.** Each definition should have one API list and one Checks list. Here an API bullet sits inside the tests.
- **Witness.** README shape rule: "Each definition lists its unit tests as a `**Checks.**` bullet list".
- **Repair.**
  - Move `:715–719` and `:810–811` above the first Checks list of their subsection.
  - Merge each pair of Checks lists, and remove the blank lines at `:1506`, `:1539` and `:1866`.

## Previous findings (r7, at `5e8f0af`)

- **R01 (P2, slope-polygon headline missing): repaired.**
  - `Suggested.lean:180–204` defines `slopePolygon := lowerConvexEnvelope …` and states `slopePolygon_eq_of_embeddingOrbitCount_eq`.
  - `:215–225` states the polygon-to-break count `one_add_card_filter_newtonSlopes_eq_relIndex` through `Polynomial.newtonSlopes`.
  - `IsPolygonSegment` is deleted. `residualPolynomial_additive` now takes `IsFiniteFace ((ramificationPolynomial φ α).newtonPolygon v) (-(h : ℝ) / m) k (k + l)`.
  - The README has API bullets for all three (`:889–900`, `:950–958`, `:635–639`).
- **R02 (P3, Newton-polygon contract): repaired.** `README.md:119–125` and the rows `:374–375` name `TauCeti.lowerConvexEnvelope`, `TauCeti.IsFiniteFace`, `TauCeti.FiniteSlopeData`, `TauCeti.IsLowerConvexEnvelope.exists_rat_eq_and_den_dvd_of_isFiniteFace` and nine `Polynomial.*` declarations, with files. All resolve at `2fd255d` (checked with `#check @`).
- **R03 (P3, Hasse–Arf locator): repaired.**
  - Row `:368`: "`hasseArf` (`Herbrand/HasseArf/Abelian.lean` …); … (`Herbrand/HasseArf/PrimeDegree.lean`)".
  - 2.2 (`:793–796`) and 3.1 (`:1051–1053`) cite `hasseArf`, which is at `Abelian.lean:50`.
- **R04 (P3, ψ/φ naming): repaired.**
  - `:292–299`: "the inverse Herbrand function `ψ_{L/K}` … and the Herbrand function `φ_{L/K}`, its inverse … `inverseHerbrand` and `herbrand` respectively".
  - `:746–750` and `:939–943` match.

## Verified sound

### Gate, dependency check, elaboration

- My run of the gate on this head:

```text
gate PadicExtensionFamilies: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

  The worker's run also had `build=0`. There are no changes outside the folder.
- **Dependency check** (`--movable`, content main `f24d841`): `depcheck: 238 roadmaps, 2321 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
  - RamificationOfCompleteDiscretelyValuedFields is line 2 of the merge order; this roadmap is line 396.
  - MassFormula, EtaleMassFormula, NewtonPolygons and ClassFieldTheory are on main.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with exactly 15 warnings, all `declaration uses 'sorry'`.
- **Binder audit.** A scratch copy with `#check @` for all 41 declarations elaborates without error, and the types agree with the worker's `signatures.md`.
  - The seven binder-loss leads are defs that need nothing more: `slopePolygon` drops `ValuativeExtension K L`, and README `:889–892` says the structure on `L` does not enter.
  - The three new theorems carry every binder they use: `[IsGalois K M] [ValuativeExtension L M] [Module.Finite L M] [IsGalois L M]` for `herbrand L M`, and `[Module.Finite K L] [Algebra.IsSeparable K L]`.
- **One-tactic probe.** I replaced each of the 15 proofs by `first | rfl | (simp; done) | infer_instance | decide | (exact Iff.rfl) | (norm_num; done)`. All 15 fail, so there is no padding.
- **Imports.** `import Mathlib` plus nine pinned `TauCeti.*` modules. There is no `set_option` and no sorried data.

### Pinned declarations opened (file:line at `2fd255d`)

- **Newton polygons.**
  - `Polynomial.newtonPolygon` (`NewtonPolygon/Basic.lean:218`); its docstring confirms the orientation "slope `m` ↔ root valuation `−m`".
  - `newtonSlopes` (`Slopes.lean:110`), `card_newtonSlopes` (`:247`), `newtonSlopes_eq_slopeMultiset` (`:151`), `count_newtonSlopes_of_isFiniteFace` (`:194`), `den_dvd_card_newtonSlopes` (`:274`).
  - `newtonPolygon_mul` (`Mul.lean:282`), `newtonSlopes_mul` (`:319`).
  - `newtonSlopes_eq_map_roots_map` (`Roots.lean:123`), `card_filter_roots_le_addValuation` (`:172`).
  - `den_dvd_of_forall_mem_newtonSlopes_eq` (`Ramification.lean:68`).
- **Convex envelopes.**
  - `lowerConvexEnvelope` (`Envelope.lean:159`): ⊤ off admissible input, and the heights of `slopePolygon` are admissible by `isAdmissible_of_forall_gt`.
  - `IsFiniteFace` (`Face.lean:203`), `IsAdmissible` (`Sequence/Basic.lean:156`).
- **Infimum.** Mathlib's `WithTop.instInfSet` (`Order/ConditionallyCompleteLattice/Basic.lean:59`) gives the least discriminant over a nonempty finite set, and `⊤` for an empty one, as 2.4 says.
- **Ramification.**
  - `herbrand`/`inverseHerbrand` (`Herbrand/Basic.lean:258/262`).
  - `lowerRamificationGroupReal` (`RamificationGroup.lean:278`): `G_u = G_{⌈u⌉}`.
  - `hasseArf` (`Abelian.lean:50`), `IsTamelyRamified.ramificationIndex_dvd_card_residueField_sub_one`, `ramificationIndex_tower`, `inertiaDegree_mul_ramificationIndex_sub_one_le_discriminantExponent`.
  - `IsTotallyRamified.isGalois_iff_exists_isPrimitiveRoot` (`TamelyRamified/Galois.lean:74`, as 0.5 cites), `Padic.not_isSquare_five` (`Padic.lean:283`).
- **Sweep.** 84 library names from the README were resolved in one `#check` file.
  - `not_isSquare_five` resolves as `Padic.not_isSquare_five`, under the README's module locator.
  - `AlgHom.fintype` fails, and `lowerRamificationGroup_one` exists in no source at either pin; both are in R03.
  - The other unmatched backticked tokens are notation, LMFDB knowl ids, and roadmap contract names (Mass formula's are in R02; the RamificationOfCompleteDiscretelyValuedFields one is below).

### Cross-roadmap citations resolved

- **RamificationOfCompleteDiscretelyValuedFields §4a.2**, at the head of its open pull request: `README.md:1079–1183` states `ψ_(L/K) = φ_(M/L) ∘ ψ_(M/K)`, independence, the tower law, the subgroup identity and the integral formula. `subgroupOf_upperRamificationGroup` is in its `Suggested.lean:264`, and its Downstream consumers name this roadmap.
- **On main:**
  - EtaleMassFormula §§1.1–1.3 (`README.md:232, 258, 278`);
  - NumberFieldArithmetic 4.2, 5.1–5.3, 5.6, 5.10, 6.3, 6.5;
  - ClassFieldTheory Layers 6–8;
  - PolynomialGaloisGroups Layer 6 `TransitiveGroupLabel` (its `Suggested.lean:140`);
  - LocalFieldsRamification Layers 0–4.
- ArtinRepresentations' citation of this roadmap's 2.7 still resolves.
- The overlaps tool reports no dropped ids and no other open pull request changing this folder.

### Ownership

`roadmaps grep` over main and 469 open heads for ramification polygon, Krasner count, slope content, Galois mean slope, jump set, residual polynomial, Galois root discriminant, indices of inseparability, Herbrand invariant, Ore's condition and Monge finds no second owner:

- EtaleMassFormula (`README.md:37`) hands Krasner's and Monge's counts to this roadmap.
- ComputationalNumberTheory 2.19 `phiResidualPolynomial` is a φ-adic side over `ℤ[X]`, a different carrier; this roadmap excludes Ore–Montes (`:1983–1984`).
- AdmissiblePairsAndPadicHodgeStructures' "jump set" is a filtration jump of a module.

The only second owner found is the pinned Mass formula library (R02).

### Source sample (all targets in the seed)

| Target | Source read | Locator check |
|---|---|---|
| 0.1, 1.1, 3.4 | pinned Tau Ceti | statements as cited (see table above) |
| 0.4 | Mathlib `Algebra.discr_of_matrix_vecMul`; `Padic.not_isSquare_five` | both resolve |
| 0.5 | `TamelyRamified/Galois.lean` | theorem at line 74, as cited |
| 1.4 | pauli-sinclair (arXiv 1504.06671v1) | Lemma 4.7 and Thm 4.8 on p.14, line 1078 ✓. Thm 4.8 runs the recursion from the last segment; the README's reversed list matches |
| 1.4 | greve-pauli (author page) | "Proposition & Definition 4.3" pp.5–6 (invariance of polygon and associated inertia) ✓; Thm 7.4 pp.13–14 (associated inertia divides `[I : K]`, `I ⊆ T ⊆ N`) ✓; Lemma 4.1, 4.2 p.5 ✓ |
| 2.6 | knowl `lf.herbrand_invariant` | the four identities, same normalization ✓ |
| 3.3 | knowl `lf.galois_mean_slope`; jones-roberts §3.6 | definition ✓; formula (2) equals the README's once `t` is the tame degree (Source issues) |
| 4.2 | pagano (arXiv 1810.09975v1) | §1.2 pp.3–4 line 108 ✓; Thms 1.4–1.5 p.6 line 219 ✓; order `≤_ρ` and the classification as in the README |
| 4.2 | miki-1981 (GDZ scan, pages rendered) | Lemma 17 p.111, proof to p.112 ✓; the factor conditions are Lemma 5 (a)–(c), p.101, as in `MikiDecomposition.level`; invariant `I(k)` defined p.112 ✓ |
| 5.1, 5.3 | pauli-roblot (HAL copy of Math. Comp. 70) | Prop. 3.1 on the article's 3rd page and Thm 6.1 on its 7th, as the preprint locators say. Ore's inequality `min(v(b)n, v(n)n) ≤ j ≤ v(n)n` ⇔ `IsOreAdmissible`. The README's `⌊b/p^{a+1}⌋` equals the source's `⌊(b−1)/p^{a+1}⌋` because Ore forces `p^{a+1} ∤ b` |
| 5.4 | values | recomputed (table below) |
| 6.5 | monge-families (arXiv 1109.4617v2); knowl `lf.family_mass` | Lemma 3 p.6 ✓, Definition 1 p.6 ✓, Thm 1 p.11 ✓, `B_{L/K} = Π ρ_i` p.10 ✓; knowl: mass `1/#Aut(L/K_f)`, relative = `f`·absolute for `K = ℚ_p` ✓ |
| 6.7 | monge-count (arXiv 1011.0357v3) | (6) p.3, (7) and Thm 1 p.4, line 208 ✓; `mongeSigma`/`mongeDelta`/`mongeCount` match term by term |
| 6.8 | pinned Mass formula | see R02 |

### Adversarial table (values computed on each side)

| Statement | Instances | Values | Result |
|---|---|---|---|
| 0.1 `w`, `ε`, `ε ∣ q^f − 1` | tower `ℚ_2⊂ℚ_2(√2)⊂ℚ_2(∜2)`; `ℚ_5(∛5)` closure | `w`: `2 = 1+1`; `ε`: `1 = 1·1`; closure `ε = 3 ∣ 5² − 1 = 24` | pass |
| 0.4 square class | bases `(1,√2)`, `(1,2√2)`; cyclic cubic | `disc 8`, `32`, both class `2`; `A_3` gives a square | pass |
| 0.5 tame Galois criterion | `ℚ_5(∛5)`, `ℚ_7(∛7)` | `μ_3 ⊄ ℚ_5` gives `#Aut = 1`; `μ_3 ⊂ ℚ_7` gives `#Aut = 3` | pass |
| 1.1 `v(ρ_1)` = height | `x²−2`; `x⁴−2`; `x⁸−2` | `2 = 3−2+1`; `8 = 11−4+1`; `24 = 31−8+1` | pass |
| 1.2 rams | `x⁴−2`; `x⁸−2`; `x⁴+2x+2` | heights `8,4,8,0` give `(2,4)`; `24,16,24,8,24,16,24,0` give `(2,4,8)`; `(1,1)…(4,0)` gives `(1/3,1/3)` | pass |
| 1.3 `residualPolynomial_additive` | `x⁴−2` faces `[2,4]`, `[1,2]`; `x⁴+2x+2` face `[1,4]` | `A = 1+z²`: exponents `2,4`; `A = 1+z`: `1,2`; `A = 1+z`: `1,4` | pass |
| 1.3 negative control (`0 < h`) | tame `x³−5` face `[1,3]` | `A = z²+3z+3`, `k + j = 2` is not a power of 5 | needed, present |
| 1.4 orbit | `α⁴=2` over `ℚ_4`, `δ` of order 3 | `δ⁻⁴(δ⁴z²+1) = z²+δ²`; `δ⁻⁸(δ⁴z+1) = δ²z+δ` | pass |
| 1.4 associated inertia | `z²+3z+3` over `𝔽_5` | discriminant `2`, a nonsquare, gives `2`; it divides `f(closure) = 2` | pass |
| 1.5 `conjugateBreaks_eq_of_irreducible` | `ℚ_2(∜2)`, `M = D_4` closure, `ξ = α`, `ξ' = α(1+α)` | `v_M(σα−α) = 6,10,6`, `/2 − 1` gives `{2,4,2}`; at `σα = −α`, `v_L(−2/(1+α)) = 4` | pass |
| 1.5 `card_filter_conjugateBreaks_eq_zero` | `ℚ_5(∛5)` in its closure; `ℚ_2(∜2)` | `2 = 3 − 5⁰`; `0 = 4 − 2²` | pass |
| 2.2 / R03 | `p`-group fact | `isPGroup_upperRamificationGroup_of_pos` at `PPrimary.lean:78` | locator fails (R03) |
| 2.3 `discriminantExponent_eq_integral` | `ℚ_2(∜2)`; `ℚ_5(∛5)`; identity | `3·3 + 2·1 = 11`; `2·1 = 2`; `0` | pass |
| 2.4 `slopePolygon_eq_of_embeddingOrbitCount_eq` | `ℚ_2(∜2)`, counts `1` on `[−1,2]`, `2` on `(2,3]`, `4` after | `(u,u') = (2,3)`: `P(2) = 0+3·1 = 3 = c(ℚ_2(√2))`; `(3,4)`: `P(4) = 3+4·2 = 11`, `P(3) = 7` | pass |
| 2.4 least height, not largest | `ℚ_2(ζ_8)`, `(u,u') = (1,2)`, `(2,3)` | `P(2) = 2` (from `ℚ_2(i)`), `P(4) = 2+3·2 = 8`; the max at degree 2 gives chord slope `8/3` | pass |
| 2.4 tame and unramified segments | `ℚ_5(∛5)`, `(0,1)`; unramified quadratic, `(−1,0)` | `P(3) = 0+1·2 = 2`; `P(2) = 0` | pass |
| 2.4 `u > u'`, `u = u'` | any | forces `n = count(u)`, adds `0` | pass |
| 2.4 proof check | `P(x) = ∫(x − min(x,count(v)))dv` | convex, `≤ c(E)` for every `E`, equal at the `count(u)`; slope on `(count u, count u')` is `|[−1,u]| = u+1` | pass |
| 2.5 `one_add_card_filter_newtonSlopes_eq_relIndex` | `D_4`, slopes `{−4,−2,−2}`, `φ_{M/L}(t) = t` (`t ≤ 1`), `1+(t−1)/2` after | `t=1`: `4 = 8/2`; `t=3`: `4 = 4/1`; `t=5`: `2 = 2/1`; `t=7.5`: `1 = 1/1` | pass |
| 2.5, Galois case | `ℚ_2(ζ_8)`, `M = L`, slopes `{−1,−1,−3}` | `t=1`: `4 = #G_1`; `t=2`: `2`; `t=3.5`: `1` | pass |
| 2.5, `t ∈ [−1,0]` | `ℚ_5(∛5)` in its `S_3` closure | `t = 0`: `1+2 = 3 = [C_3 : 1]`; `t > 0`: `1 = 1` | pass |
| 2.5 negative control | `−t` in place of `−φ_{M/L}(t)`, `t = 3` | `1+1 = 2 ≠ 4` | excluded by the statement |
| 2.6 identities | `ℚ_2(ζ_8)` `[1,2]`; `ℚ_2(∜2)` `[2,3]`; `F_{x⁴+2x+2}` | means `⟨1/2,5/4⟩`, rams `(1,3)`; `⟨1,2⟩`, `(2,4)`; `⟨1/6,1/4⟩` | pass |
| 2.6 height identity | five fields | `11 = 3+4·2`, `9 = 3+4·3/2`, `4 = 3+4·1/4`, `5 = 2+3·1`, `31 = 7+8·3` | pass |
| 3.3 weighted formula / R01 probe | `[2,3,4]`; `[]_3^2`; `[]^2` | `3 = 24/8`; `2/3 = 4/6`; `0 = 0/2` | statable (R01) |
| 3.4 `#Aut = [N_G(H):H]` | `S_3`, `H = C_2`; biquadratic | `1`; `4` | pass |
| 4.1 `indexOfInseparability_eq_of_eisenstein` | `X²−2` and `X²−4X+2` (`√2+2`) | auxiliary values `∞,0` and `3,0`, both regularized to `[2,0]` | pass |
| 4.2 Miki | `−1 = (1+√2)²(−3+2√2)` in `ℚ_2(√2)`; `π⁴+4π³+6π²+6π+2` | levels `1,3`, weighted `2<3`; `(a,1,c)`: `4<5`; `(a,b,cb⁻²)`: `4,14,5` fails | pass |
| 4.2 jump sets | `p = e = 2` | `T = {1,3}`, `T* = {1,3,4}`; `{1,2} ↔ ({1},2)`; `{1,3} ↔ ({1,3},(2,1))`, `ρ²(1) = 4 < ρ(3) = 5` | pass |
| 5.1 `ore_realizability` | `ℚ_2`, `n = 2, 4` | `j ∈ {1,2}`; `{1,3,5,6,7,8}`, `j = 2` fails (`v(2) = 1 > 0`), `j = 4` fails (`a = 1 ≠ 2`) | pass |
| 5.3 `krasner_refined_count` / `krasnerCount` | `ℚ_2`, `n = 2`; `ℚ_2(√2)`, `n = 2`; `ℚ_4`, `n = 2` | `2·2¹·½ = 2`, `2·2·1 = 4`; `2, 4, 8`; `6, 8` | pass |
| 5.4 totals | `ℚ_2`, `n = 2, 4, 8`; `ℚ_3`, `n = 3, 9` | `6`; `92`; `5880` (`120+384+768+3584+1024`); `21`; `5085` (`468+3888+729`) | pass |
| 6.4/6.5 masses | `[1]`, `[2]` over `ℚ_2`; `[1]` over `ℚ_4` | `(q−1)^1 q^0 = 1`, `q^1 = 2`; full set `3·4 = 12`, fibre `4/2`, mass `3`; reduced `B = 2`, `2/2 = 1` | pass |
| 6.5 Serre comparison | `ℚ_2`, `e = 2` | `1·2⁻¹ + 2·2⁻² = 1` | pass |
| 6.7 `monge_class_count` | `ℚ_2 (2,1)`; `ℚ_4 (2,1)`; `ℚ_3 (2,1)`; `(1,1)` | `1+3+2 = 6`; `3+7+4 = 14`; `1+1 = 2`; `1` | pass |
| 6.8 `mass_completeness` | `ℚ_2 n=2`; quartic `ℚ_2`; `ℚ_2(√2)`, `ℚ_4`, `n = 2` | `1/2+1/2 = 1`; `1/2+1/4+1/8+1/16+1/32+1/32 = 1`; `1/2+1/4+1/4`; `3/4+1/4` | pass; carriers duplicated (R02) |
| 7.1–7.3 | `ℚ`; `ℚ(√5)`; `ℚ(∜2)`; `ℚ(ζ_5)`; `3.1.23.1` | `1`; `5^{1/2}`; `2^{11/4} ≤ 2^{24/8} = 8`; `5^{3/4}`; `23^{3/6}` | pass |
| `galoisMeanSlopeAt_eq_zero_iff` | `ℚ(√5)` at `5`, `2`; junk `p = 1` | `1/2`, `5 ∣ 5`; `0`, `2 ∤ 5`; `p = 1` excluded by `Fact p.Prime` | pass |

## Not verifiable

- These were not opened this round:
  - Deligne, Appendix A.6 (not obtained from a legal source);
  - Serre, *Local Fields* (Springer, paywalled);
  - Krasner 1966, Ore 1928, Fried 1974 and Serre 1978 (not obtained);
  - Heiermann's MPIM preprint (4.1 is not in the sample).
- The cache line numbers `miki-1981 lines 524, 572` could not be matched: my copy is an image scan, read by page. `pauli-roblot lines 113, 335` refer to an author-preprint extraction; in the HAL copy of the published paper the same results are at lines 137 and 358, on the same article pages.
- Of the LMFDB knowls, only `lf.herbrand_invariant`, `lf.galois_mean_slope` and `lf.family_mass` were read this round.
- The published numbering of Jones–Roberts (J. Symbolic Comput.) was not compared.

## Source issues

- **Misprint** in jones-roberts-2006 at §3.6, formula (2), printed p.8 (arXiv v1): the source says `t = |G/I|`, the unramified degree; it should be `t = |I/I^w|`, the tame degree (closure of `x³−5` over `ℚ_5`: `1/2` versus the true `2/3`); affects nothing.

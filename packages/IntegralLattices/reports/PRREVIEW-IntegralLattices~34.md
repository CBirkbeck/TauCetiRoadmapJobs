# Review of IntegralLattices (pull request #1411 at 5bfdf39)

**Verdict:** needs changes

This is a full review: the folder changed by 328 lines since `8878bc5`. The pins are Mathlib `1b1ccf4` and Tau Ceti `2fd255d`. `README.md` and `Suggested.lean` mean the files in `TauCetiRoadmap/IntegralLattices/`, and `TauCeti/…` paths are in the pinned Tau Ceti.

## R01 (P2) — 3D: O'Meara's fundamental invariants do not classify dyadic lattices

- **Location.** `README.md:950–952`: "The target is the general dyadic classification by O'Meara's fundamental invariants: for each constituent its scale, rank and type, together with the norm groups and weights (O'Meara §93, 93:28 and 93:29)."
- **Claim.**
  - As written, the target says that these invariants determine the isometry class of a `ℤ₂`-lattice. That is false, even for two lattices on one quadratic space.
  - The classification cited compares lattices on one quadratic space. Beyond the fundamental invariants, it imposes conditions on the partial sums `L_(i) = L_1 ⊥ … ⊥ L_i` of the Jordan splittings. The target states neither the hypothesis nor the conditions.
- **Witness.** Take `⟨1⟩ ⊥ ⟨56⟩` and `⟨7⟩ ⊥ ⟨8⟩` over `ℤ₂`.
  - Both have scales `1, 8`, ranks `1, 1`, types I, I, and norm groups `ℤ₂, 8ℤ₂`.
  - Both have determinant 56, and the Hasse invariants agree: `(1,56)₂ = (7,8)₂ = 1`.
  - They are not isometric. The native `equivalent_toBilin'_diagonal_two_pow_mul_iff_of_three_le` (`TauCeti/NumberTheory/Padics/BilinearForm/BinaryDiagonal.lean:160`) would need `1·7` to be a square.
- **Repair.**
  - State the target with the hypotheses of 93:28: `L` and `K` lie on one quadratic space and have Jordan splittings of the same type with the same norm groups and weights.
  - Add its conditions on the partial sums `L_(i)`, `K_(i)`. For the pair above they fail at `i = 1`, where `d L_(1) / d K_(1) = 7` is not a square.
  - Add the pair as a negative-control Check.

## R02 (P2) — 7C: the milestone's only target has no statement

- **Location.**
  - `README.md:2929–2930`: "the dictionary to the Conway–Sloane local mass `m_p` at odd `p`, in their section 12, including every factor of 2."
  - `README.md:2942–2943`: "The targets of this milestone is the Conway–Sloane dictionary at odd `p`".
- **Claim.**
  - Everything else in 7C is consumed, and the stabilizer index belongs to N0. So the one target that OTM's 7H reads off 7C is a pointer into a waived text.
  - The README states the good-prime identity `std_p = α_p⁻¹` and the `ε` translation. At an odd `p ∣ det L`, where the dictionary must carry the determinant factor and the Jordan cross terms, it states no equation, so an implementer cannot tell what to prove.
  - "The targets … is" is also a grammar slip.
- **Witness.** The native `localDensity_fromBlocks_smul` (`TauCeti/NumberTheory/IntegralLattice/LocalDensity/FromBlocks.lean:148`) and a direct count both give `α₃(⟨3⟩) = 6`, `α₃(⟨1⟩ ⊕ ⟨3⟩) = 12` and `α₃(⟨1⟩ ⊕ ⟨9⟩) = 36`. The good-prime rule `m_p = α_p⁻¹` would give `1/6`, `1/12` and `1/36`, so the bad-prime equation is a different one.
- **Repair.**
  - State the equation. For example: `m_p(L) = p^{v_p(det L)·(n+1)/2} · α_p(L)⁻¹` for odd `p` and nondegenerate `L` of rank `n`, which is the README's `std_p = α_p⁻¹` when `p ∤ det L`.
  - It gives `1/2`, `√3/4` and `3/4` on the three lattices above. Those values are Conway–Sloane's `1/2` per rank-one constituent times the cross factor `(q'/q)^{1/2}`. This is my reading of their product formula, and the text is waived, so confirm the factor there.
  - Add the three lattices as Checks, and write "The target of this milestone is".

## R03 (P3) — N0: the native reflection lemma is read on `Q = B/2`, but `K_p(L)` is defined on `L.norm = B(x, x)`

- **Location.**
  - `README.md:1786`: "Fix `B` and `Q = B/2` on `V` for the Clifford and spinor conventions".
  - `README.md:1820–1822`: "When `Q(v) = β(v, v)/2` is a `p`-adic unit it is Tau Ceti's `reflectionOrthogonal_mem_integralOrthogonalSubgroup`, whose unit-norm hypothesis fails for … `⟨1⟩` … at `2`".
  - `README.md:1845–1846`: "Here `Q(v) = 1` is a unit, so this instance is native."
- **Claim.**
  - The native `localStabilizer` is a subgroup of `orthogonalGroup (L.norm.baseChange ℚ_[p])`, with `L.norm = B(x, x)`. The same form underlies `orthogonalCompactOpens`, `localSpinorNormImage` and the 4B docstring in `Suggested.lean`.
  - On that form, the lemma's hypothesis `‖Q v‖ = 1` asks for `β(v, v)` to be a unit. The README therefore has the native and non-native instances the wrong way round.
- **Witness.**
  - `TauCeti/NumberTheory/IntegralLattice/Localization/Stabilizer.lean:18, 97`, `TauCeti/LinearAlgebra/IntegralLattice/Norm.lean:78` and `…/OrthogonalGroup/Integral/SpinorNorm.lean:145`.
  - `⟨1⟩` at 2: `L.norm(e) = 1`, so the lemma applies.
  - `U` at 2: `L.norm(e + f) = 2`, so it does not.
- **Repair.**
  - State N0 on `L.norm`, as 4B and `Suggested.lean` already do. The native case is then "`β(v, v)` is a unit", and it fails for `⟨3⟩` at 3 and for `⟨4⟩` and `U` at 2.
  - Move the `U`-at-2 Check to the cases proved here, and add `⟨1⟩` at 2 as a native instance.
  - Alternatively, keep `Q = B/2` and say that the lemma is applied to `B/2` and then carried to `O(L.norm)`, which has the same elements.

## R04 (P3) — Supplier contracts: consumed declarations without a row, and a row naming milestones that do not consume it

- **Location.**
  - §*From Mathlib* (`README.md:401–428`).
  - `README.md:538`: "| 4B, 4C, 4F, B7 | Orthogonal and Spin Groups | 0C, 2C, 2F; `orthogonalBaseChangeReal`, `spinorNorm_reflection` |".
- **Claim.**
  - These declarations are named in *Needs* lines or Dependencies rows but have no row in §*Exact supplier contracts*:
    - M `jacobiSym.quadratic_reciprocity` and `Nat.forall_exists_prime_gt_and_eq_mod`, consumed by B3 (`README.md:1413`, `1762`);
    - M `MeasureTheory.Measure.haar`, consumed by B7 (`1698`);
    - M `IsCompl`, consumed by 5F (`2332`);
    - M `volume.toSphere`, consumed by 7E (`3026`);
    - T `SameGenus.exists_isometry`, consumed by 4B (`1979`, `2183`).
  - Conversely, the Orthogonal and Spin Groups row names consumers that do not consume it:
    - 4F is native, with "no prerequisites here" (`2188`);
    - B7's *Needs* line (`1696–1698`) has no Orthogonal and Spin Groups item;
    - its two declarations appear in no *Needs* line.
- **Witness.** The declarations exist at the pins: `Mathlib/NumberTheory/LegendreSymbol/JacobiSymbol.lean:423`, `Mathlib/NumberTheory/LSeries/PrimesInAP.lean:443` and `TauCeti/NumberTheory/IntegralLattice/ClassNumber.lean:133`. #617's copy of this folder carries the missing Mathlib row (its `README.md:430`).
- **Repair.**
  - Add a §*From Mathlib* row for the five Mathlib declarations, and add `SameGenus.exists_isometry` to the genus row of §*From Tau Ceti*.
  - In the Orthogonal and Spin Groups row, do one of two things:
    - name the two declarations in the *Needs* lines that use them (for example `spinorNorm_reflection` in N1 or 4C, and `orthogonalBaseChangeReal` for `θ_∞` in 4C);
    - or drop them, together with the consumers 4F and B7.

## R05 (P3) — `LocallyCarries` has no Check, and Layer 8 lacks its closing sections

- **Location.**
  - `Suggested.lean:249`: `def LocallyCarries`.
  - `README.md:1965`: "(`LocallyCarries`, on the images of the localizations in `V_p`)".
  - `README.md:3149`: Layer 8's Dependencies table, which has no heading, and no `### Examples` section.
- **Claim.**
  - `LocallyCarries` is the definition that pins both 4B bijections, and no Check exercises it in either direction.
  - Layer 8 ends with a bare table instead of the `### Examples` and `### Dependencies` sections that every layer has.
- **Witness.**
  - Take `L = ℤ²` with `x² + y²` and let `M` be the 5-neighbour of 4G, with basis `(3/5, −4/5)`, `(−4/5, −3/5)`. Let `σ` be the rational matrix with those columns; it has determinant `−1`.
  - `LocallyCarries L M σ` holds.
  - The identity fails at 5, since `(3/5, −4/5) ∈ M_5 ∖ L_5`.
- **Repair.**
  - Add a Check to 4B:
    - `σ`, and `σ·diag(1, −1)` of determinant `+1`, both carry `L` to `M`, while the identity adele does not;
    - both double cosets are the single point of the genus of `x² + y²`.
  - Add `### Examples` and `### Dependencies` headings to Layer 8.

## R06 (P3) — The branch still conflicts with main in both files (previous R11, not repaired)

- **Location.** `git merge-tree --write-tree origin/main HEAD`; the merge base is `eaf17b1`.
- **Claim.**
  - Since the merge base, main (`3090489`) has taken `47fc6a3` (#1239) into this folder. The head has not been rebased, so the pull request cannot merge as it stands.
  - The description's order rule is written about ClassFieldTheory: "whichever of the three merges first, the other two are rebased onto it". #617 also changes this folder and conflicts with this head there.
- **Witness.**
  - `git merge-tree` reports "CONFLICT (content): Merge conflict in TauCetiRoadmap/IntegralLattices/README.md", and the same for `Suggested.lean`.
  - `roadmaps overlaps IntegralLattices` reports that #617 and #1411 conflict in both files.
- **Repair.**
  - Rebase onto main, resolving toward this head.
  - Say in the description that the #617/#1215 order rule covers this folder too.

## R07 (P3) — The label 5H disappears while PeriodsAndSpecialValues cites it

- **Location.**
  - `README.md:135`: the IntegralLatticesPartII row, which names "the uniqueness of primitive embeddings (Theorem 1.14.4)" without a label.
  - The Nikulin entry of the References (`README.md:3543–3551`).
- **Claim.**
  - Main's README labels Theorem 1.14.4 as 5H in its References; this head drops the label and gives no old → new mapping.
  - PeriodsAndSpecialValues, which is open, cites "IntegralLattices Layer 5 milestones 5G–5H". After this merges it has nothing to follow.
- **Witness.** On main, `TauCetiRoadmap/IntegralLattices/README.md:3038` reads "Theorem 1.14.4 (5H)". At this head `grep -c 5H README.md` gives 0. The citation is PeriodsAndSpecialValues `README.md:1590`.
- **Repair.** Write "(Theorem 1.14.4, label 5H)" in the IntegralLatticesPartII row at `README.md:135`, so that the citing roadmap can follow the label to its owner.

## Previous findings (review of `8878bc5`)

- **R01 — repaired.** `README.md:1572–1610` defines Gauss-reduced forms and `ρ`. It states the three facts (`ρ` permutes the reduced forms, every class contains one, and proper equivalence of reduced forms is equality of `ρ`-cycles), with Checks at `Δ = 12` and `Δ = 8`. I recomputed both, and added `Δ = 5`.
- **R02 — repaired.** `README.md:1380–1398` gives the three steps, with the Cox §3.B locator at `1400`. The native field case is at `1400–1411` and in row `485`, and B3's Dependencies row at `1762` names everything. The missing §*From Mathlib* row is now R04.
- **R03 — repaired.**
  - Row `469` names the native moves.
  - 3D's *Needs* (`940–953`) and 3E's (`992–995`) name them.
  - 3E's two targets are now the converse and the canonical form (`982–990`).
- **R04 — repaired.** 6F is native at `2601–2622`, in row `456`, in the native list at `512` and in the Dependencies row at `2680`, and it carries the coset Check.
- **R05 — repaired.**
  - N0 owns the improper element (`1812–1851`), with the `⟨4⟩` and `U` Checks.
  - 7C (`2867–2868`) and 4B (`1972–1973`) cite N0.
  - The convention slip in that new text is R03.
- **R06 — repaired.** `README.md:1882–1890` states the order-4 case for rank `≥ 3` and isotropic planes, and marks `⟨1⟩ ⊕ ⟨1⟩` at 3 as the case where the two definitions agree.
- **R07 — repaired.**
  - (a) "Ambiguous" is defined at `1521–1524`.
  - (b) The witness at `3331–3333` now uses `3 + 2√2`.
  - (c) The `Δ = −4` transport Check is at `1354–1358`.
- **R08 — repaired.** The T row is at `505` and the Differential Geometry row at `537`. LieGroups is reduced to a parenthesis that consumes nothing (`3025`).
- **R09 — repaired.**
  - The Root Systems row is gone.
  - B7's names are relabelled T and it has a *Needs* line (`1696–1698`, `1766`).
  - The 5B row (`2443`) and the Global Quadratic Forms row (`535`) carry `exists_globalForm_of_isAdmissible` and N0.
- **R10 — repaired.** `NikulinGenerator.prime` is named at `2291`, and `Archimedean.SO` and `Archimedean.O` at `3003–3005`.
- **R11 — not repaired.** It is R06 here. No repair report marks it as not actionable.

## Verified sound

**Gate, dependency check, build, signatures and probe.**
- **My gate run (`--base origin/main`).** Every scanner is 0 except `outside-folder=5`, and all five files are in `TauCetiRoadmap/ClassFieldTheory/` and `TauCetiRoadmap/QuadraticFormInvariants/`, which are this pull request's own folders.
- **The one other changed file.** `Completed/LocalGaloisGroups/Suggested.lean` (4 lines) is listed in the gate configuration's `outside_folder_allow`. It is ClassFieldTheory's adaptation of a consumer and does not touch this roadmap.
- **Dependency check.** Output: `depcheck: 236 roadmaps, 2286 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
  - All four roadmap suppliers are on main: Global Quadratic Forms, Restricted Products, Orthogonal and Spin Groups, Differential Geometry. That is all a roadmap already on main may consume.
- **Build.** `lake env lean` on `Suggested.lean` exits 0 with 15 warnings, all "declaration uses `sorry`".
- **Signatures.** I elaborated all 36 `#check @name` in one copy, with 0 errors, and compared each type with its README statement.
  - The binders are all present: 4B proper carries `[FiniteDimensional ℚ V]`, both 4B theorems carry `[L.IsNondegenerate]`, 5A carries both evenness hypotheses, and 5G carries `S.sigPos ≤ lp`.
  - The generality matches the README: "in any two ambient spaces" for 5A and 6A.
- **Padding probe.** I replaced each `sorry` by `first | rfl | simp | infer_instance | decide | omega | aesop | trivial`. All 15 fail. `Suggested.lean` is unchanged since `8878bc5`.

**Names and citations.**
- **README tokens.** I resolved 780 backticked identifier tokens against an index of the pinned Mathlib and Tau Ceti declarations and `Suggested.lean`.
  - Every Lean name resolves except six, and those six resolve on main:
    - Global Quadratic Forms `Suggested.lean:439, 516, 544` (`hasseMinkowski_equivalent`, `exists_globalForm_of_isAdmissible`, `equivalent_of_locallyEquivalent`);
    - Orthogonal and Spin Groups `Suggested.lean:420, 1025`;
    - Differential Geometry `Suggested.lean:3266` (`integral_riemannianVolume_eq_integralDensity`).
  - The field `le_dual` is at `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:73`.
  - `Suggested.lean`'s 92 docstring tokens all resolve. The 13 "found nowhere" leads of `roadmaps resolve` are `Suggested.lean` declarations.
- **Sections resolved on main.**
  - Global Quadratic Forms 6.3 (its README 723) and 7.3 (848).
  - Orthogonal and Spin Groups 0C, 2C and 2F (368, 684, 717).
  - Differential Geometry 12.1 and 12.4 (915, 923).
  - Restricted Products Layers 0–3 (248, 268, 305, 361) and Global Number Fields Layer 11 (571).
  - Rank-24 lattice constructions Layers 3 and 6 (223, 312).
  - Theta Series Layers 1, 2 and 8 (423, 484, 942) and LieGroups Layer 2 (356).
- **Declarations opened at the pins.**
  - `Padics/BilinearForm/BinaryDiagonal.lean:92, 139, 160`, `MixedSignWalking/Basic.lean:164, 175`, `MixedSignWalking/EvenLower.lean:90, 101`, `Padics/BilinearForm/Basic.lean:40` and `Unimodular.lean:69`.
  - `D8Plus/Isometry.lean:292` and `TypeD/Plus.lean:72`.
  - `Riemannian/Induced.lean:62` and `VolumeDensity/Volume.lean:82, 93`.
  - `GenusCharacter/PrincipalGenus.lean:79, 150`, `Independence.lean:97`, `AmbiguousClassNumber.lean:133`, `Orders/Maximal.lean:162` and `QuadraticOrder/Field.lean:116`.
  - `Integral/SpinorNorm.lean:145`, `Localization/Stabilizer.lean:18, 97, 119, 215`, `ClassNumber.lean:120–137`, `LocalDensity/FromBlocks.lean:134, 148` and `LocalDensity/Diagonal.lean:136`.
  - `TypeE/WeylGroup.lean:210` and `Unit.lean:59`.
  - Mathlib `QuadraticForm/Basic.lean:153` and `HaarToSphere.lean:52`.

**Ownership and overlaps.**
- **Duplication search.** `roadmaps grep` over 458 open heads and main found the objects of `Suggested.lean` only in this folder and in #617's copy of it:
  - `IsPrimitiveEmbedding`, `NikulinExistenceConditions`, `EvenLatticeWithInvariants`, `exists_evenLattice`, `sameGenus_iff_of_isEven`;
  - `LocallyCarries`, the double-coset theorems, the 6A, 6E and 7E names, `NikulinDecomposition` and `padicDiscriminant`.
- **Consumers.** K3Surfaces (#1285, its README 190), FourManifolds (#936, 811 and 3089) and EnriquesSurfaces (#1286, 246 and 259) cite ids that exist here.
- **Milestone ids.** The 51 ids are identical on main and at this head; the one dropped label is R07.
- **Overlaps.** No id cited here is dropped by an open pull request, and none is defined only by an open revision. #1187 changes this folder only through a Tau Ceti bump.

**Sources.**
- `allcock-gal-mark2016`:
  - Lemma 4.2 at line 552 (p. 12), Lemma 4.3 at 621 (p. 14), Theorem 4.4 at 672 (p. 15, proved in §7 at line 1000) and Theorem 5.1 at 686 (p. 16);
  - Lemma 5.2 at 760 (p. 17, continuing to p. 18) and Lemma 6.1 at 808 (p. 19);
  - Theorems 6.2 and 6.3 at 849 and 864 (p. 20) and Corollary 6.4 at 917 (p. 21);
  - "signway" is their term (line 160). All match 3E as stated.
- `voight2023`: Definition 3.10 at line 230 (p. 5), Lemma 3.12 at 245 (p. 6), and Proposition 3.13(iii) with `p² ∣ Q(v)` at 261. These match 4G.
- `boya-sudarshan-tilma2003`: equations (6.1)–(6.5) at lines 643–669 (pp. 16–17), with `−Tr[λ²] = 2` at 655 and (6.9) at 684. These match 7E.

**Seeded sample B1–B8.** I checked each statement against computed values; they are in the table below.
- B1, B4 and the `Δ < 0` part of B5 are native.
- B2's sign transport, B3's three steps and split branch, B5's cycle theorem, B6, B7 and B8 hold on every instance tried.
- None of the sampled locators can be checked against a text: they are in Cox, Cohen, Cassels and Conway–Sloane 1988 (see *Not verifiable*).

**Adversarial table.** The values are exact, or brute-force counts in scripts: integral automorphisms of 2×2 Gram matrices with entries bounded by 6, reduced forms, local density counts modulo `3ʳ`, and `ρ`-steps.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| B1 norm form, content, Δ (native) | `A₂`; `⟨2e₁,e₂⟩ ≤ ℤ²`; `!![3,1;1,4]` | `2x²−2xy+2y²`, content 2, Δ = −3, `disc N = −12`; `4x²+y²` content 1; `3x²+2xy+4y²` content 1, Δ = −44 | pass | none |
| B2 sign transport | `⟨−1⟩⊕⟨−1⟩` | `−x²−y² ↦ x²+y²`, det 1, Δ = −4, content 1, `|O|` = 8 on both sides by brute force | pass | none |
| B2 oriented narrow map (native) | Δ = 12: `(1,0,−3)`, `(−1,0,3)` | both give `𝔞 = 𝒪₁₂`; `(y,−x)` gives `3x²−y²` with ideal `√3·𝒪₁₂`, `N(√3) = −3`; `N(2+√3) = +1` | pass | none |
| B3 steps 1–3, fundamental | Δ = −20 | reduced forms `(1,0,5),(2,2,3)`; tuples `(+,+)`, `(−,−)`; μ = 2, `2^{μ−1} = 2 = [C:C²]` | pass | none |
| B3 step 1, non-fundamental | Δ = −36 | reduced forms `(1,0,9),(2,2,5)`; `(2,2,5)` gives `(−,+)`; Kronecker character `= δ`; image `{δ = +}`; `ker Φ = 1 = C²` | pass | none |
| B3 split branch | m = 5, 8 | 4 classes, genera `{1,4},{2,3}`, torus quotient of order 2; m = 8: 4 genera, torus trivial | pass | none |
| B4 `|O|`, `|SO|` (native) | `A₂`, `I₂`, `U`, `!![4,1;1,6]`, `!![2,1;1,12]`, `!![3,1;1,4]` | brute force: 12/6, 8/4, 4/2, 2/2, 4/2, 2/2 | pass | none |
| B5 reduced forms, Δ < 0 (native) | Δ = −3, −4, −23, −44 | `(1,1,1)`; `(1,0,1)`; `(1,1,6),(2,±1,3)`; `(1,0,11),(3,±2,4)` | pass | none |
| B5 cycle target | Δ = 12, 8, 5 | 12: `(1,2,−2)↔(−2,2,1)`, `(−1,2,2)↔(2,2,−1)`, r = 2 at each step; 8: `(1,2,−1)↔(−1,2,1)`; 5: `(1,1,−1)↔(−1,1,1)`, `h⁺ = 1` | pass | none |
| B5 reduction step | general `(a,b,c)`, `r = 2cs−b` | substitution gives `(c, 2cs−b, a−bs+cs²)` and `4c(a−bs+cs²) = r²−Δ`; determinant of the substitution 1 | pass | none |
| B6 `T_L(ℤ)` | `x²+y²`, `x²−3y²`, `U` | `{±1,±i}`; `±(2+√3)^k`; `{±1}` | pass | none |
| B7 quotient volumes | Δ = −4, 12; `U` | `2π/4 = π/2`; `log(2+√3) ≈ 1.3170`; modulus-one quotient `ℤ̂ˣ` of volume 1, full quotient infinite | pass | none |
| B7 base is `C²` | genus of `!![4,1;1,6]` | `u/ū ↦ [𝔞]²`; `#C² = 3 = h⁺(gen)` | pass | none |
| B8 `m⁺ = h⁺/w` | `A₂`; genus of `!![4,1;1,6]` | `1/6`, `m = 1/12 = 1/|O(A₂)|`; `m⁺ = 3/2`, `m = 1/4+1/2 = 3/4`, while `h/(2w) = 1/2` | pass | none |
| 4B classes (Lean) | rank 0; `⟨1⟩`; genus of `!![4,1;1,6]` | one point each side; `K_p = {±1}`, one point = h; two points = h | pass | none |
| 4B proper (Lean) | genus of `!![4,1;1,6]`; `⟨1⟩⊕⟨1⟩` | three points = `h⁺`; `K₅⁺ ≅ ℤ₅ˣ ≠ SO(V₅) ≅ ℚ₅ˣ`, one point | pass | none |
| `LocallyCarries` | `ℤ²`, its 5-neighbour, `σ` of det −1 | holds for `σ` and `σ·diag(1,−1)`; fails for `1` at p = 5 | no Check | R05 |
| N0 improper element | `⟨4⟩` at 2; `U` at 2; `⟨1⟩⊕⟨2⟩` at 3 | `s_e = −1`; `s_{e+f}(e) = −f`; `e₁ − (2/3)(e₁+e₂) ∉ L₃` | pass | none |
| N0 native case | `L.norm = B(x,x)` | `⟨1⟩` at 2: `L.norm(e) = 1`, a unit; `U` at 2: `L.norm(e+f) = 2`, not a unit | reversed | R03 |
| N1 Checks | `⟨1⟩⊕⟨1⟩` at 3 and 2; `⟨1⟩⊕⟨−1⟩` | `{1,2}(ℚ₃ˣ)²`, order 2; `{1,2,5,10}`, index 2; every square class | pass | none |
| 4C rank 2 | `x²+y²`; `5xy+y²` | image at 2 is `⟨5⟩(ℤ₂ˣ)²`, so `J/(ℚˣJ_L)` has order 2 against `[C:C²] = 1`; `G = ℤ/4`, `G/(G[2]G²)` of order 2 `= C/C²` | pass | none |
| 3D target | `⟨1⟩⊥⟨56⟩` and `⟨7⟩⊥⟨8⟩` over `ℤ₂` | det 56 and 56; Hasse 1 and 1; types I, I; not isometric, since `7` is not a square | false as stated | R01 |
| 3D and 3E moves | `⟨1⟩⊕⟨4⟩`; `⟨1⟩⊕⟨14⟩` | `diag(5,20)`; norms 15 and 210, `15 ≡ 7`, `105 ≡ 1 (8)`; compartment oddity 0 on both sides | pass | none |
| 3G oddity formula | `⟨3⟩`; `⟨5⟩`; the symbol `1_5^{−1}3^{+1}` | `1+2 = 3`; `1+4 = 5`; `3 ≢ 5` | pass | none |
| 5A (Lean) | `E₈²`/`D₁₆⁺`; `⟨2⟩`/`⟨10⟩`; `I₈`/`E₈` | `(16,0,0)` and `A = 0`; `|A|` 2 against 10; `I₈` is excluded by evenness | pass | none |
| 5A, odd Check | `⟨1⟩⊕⟨5⟩` and `!![2,1;1,3]` | `b` on generators `{1/5,4/5}` against `{2/5,3/5}` | pass | none |
| 5B `padicDiscriminant_eq_squareClass_gramDet` | `⟨6⟩` at 3; `⟨2⟩`, `⟨10⟩` at 2 | 3-part `q = 1/3` gives θ = 2, `realizationDet` 6 = `gramDet` 6; ratio 5, excluded by `HasCyclicTwoSummand` | pass | none |
| 5B `exists_evenLattice_iff` | `(1,0,q₁⁽²⁾(2))`, `(1,0,q₁⁽³⁾(3))`, `(0,0,0)`, `(0,2,q₁⁽³⁾(3))` | all hold, `⟨2⟩`; sign `6 ≠ 1`, no lattice; all hold, the zero lattice; `−2 ≡ 6`, `A₂(−1)` | pass | none |
| 5B `exists_evenLattice_of_lt` | `(0,2,q₁⁽³⁾(3))` | `1 < 2`; realized by `A₂(−1)` | pass | none |
| 5G, Theorem 1.12.2 | `S = ⟨2⟩` in `(1,1)` | `e+f ∈ U`; complement `⟨−2⟩` with `q = −1/4 = −q_S` | pass | none |
| 5G, Theorem 1.12.4 | `(5,0,8,0)`; `(1,0,1,1)`; `(0,0,l₊,l₋)` | `10 > 8`, and `⟨2⟩⁵ ⊄ E₈` (complement rank 3 < 5); `⟨2d⟩ ⊂ U`; `l₊ ≡ l₋ (8)` | pass | none |
| 5J (Lean) | `(1;1,0,1)` | `⟨2⟩`: `1 ≡ ±1 (8)`, `a = 1 ≤ 1`, `1+0+1` even | pass | none |
| 6A, even and odd (Lean) | `U⊕E₈⊕E₈(−1)`/`U⁹`; `U⊕⟨1⟩`/`I_{2,1}`; `U`/`⟨1⟩⊕⟨−1⟩` | `(9,0,9)`; `(2,0,1)`; parities differ | pass | none |
| 6A, odd step | `u = w'+((ε−a')/2)v`, `y = v−εu` | `u² = a'+(ε−a') = ε`; `B(y,u) = 1−ε² = 0`; `y² = −2ε+ε = −ε` | pass | none |
| 6E (Lean) | `D₁₆E₈`/`E₈³`; `A₁₇E₇`/`D₁₀E₇²`; Coxeter numbers | `480+240 = 720`; `306+126 = 180+252 = 432`; `n+1 ≠ 2n−2` for `n ≥ 4` | pass | none |
| 6E, Leech (Lean) | any row | Leech minimum 4; every row has at least 48 roots | pass | none |
| 7C dictionary | `⟨3⟩`, `⟨1⟩⊕⟨3⟩`, `⟨1⟩⊕⟨9⟩`, `3·I₂` at 3 | `α₃` = 6, 12, 36, 72, by count and by the native `p^{v(c)·C(n''+1,2)}·α(A)·α(B)`; proposed `m₃` = 1/2, √3/4, 3/4, 3/8 | unstated | R02 |
| 7C unramified (native) | `U` at 3; `I₂` at 3 | `ε = +`, `α = 4/3`; `ε = −`, `α = 8/3`; both equal the counts | pass | none |
| 7E `soEuclideanMeasure_univ` | n = 0, 1, 2, 3 | 1, 1, `2π`, `8π² = 2π·4π`; the Frobenius metric gives `2π√2` | pass | none |
| 7E `oEuclideanMeasure_eq_orthogonalGroupMeasure` | n = 0, 1, 2 | `dirac 1`; counting measure of mass 2; `4π` | pass | none |
| 9B | the basis variants of `!![2,1;1,12]` | `!![2,3;3,16]`; three Gram matrices of one lattice sum to `3/4` and miss a class | pass | none |
| 1H and 1I Checks | `oddCyclic 3 θ`, θ = 1, 2; `⟨2⟩`, `⟨−2⟩` | Gauss sums `−i√3`, `i√3`, so 6 and 2; `1+i` gives 1; `1−i` gives −1 | pass | none |
| 4G neighbour | `v = (11,2)`, p = 5 | `125 ≡ 0 (25)` and `≡ 25 (50)`; `(3/5,−4/5) = (5,0) − 2·(11/5,2/5)` | pass | none |

## Not verifiable

- **Cox, *Primes of the form x² + ny²*.** It is cited for B2 (Theorem 7.7, p. 137), B3 (§3.B, Theorem 3.15), B4 (Theorem 3.9, p. 50), and B5 and B7 (Theorems 2.8 and 2.13, pp. 27 and 29). The sources service found no legal source for this Wiley book, and the manifest has no key for it.
- **Cohen, GTM 138, §§5.2 and 5.6** (B2, B5, B7): the manifest records it as uncertified.
- **Cassels, *Rational Quadratic Forms*, chapter 13** (B4, B6), and ***An Introduction to the Geometry of Numbers*, chapter VIII** (2F): neither is in the cache; both are cited as uncertified.
- **Conway–Sloane 1988** (B8, 7A, 7C): waived. The Conway–Sloane values in R02 are my reading of their product formula and were not checked against the text.
- **O'Meara** (every numbered locator, including 93:28–29 and 92:5). Springer, not in the cache. The witness of R01 rests on the native gap-8 theorem, not on O'Meara's text.
- **Not in the cache, so their numbering is unchecked:**
  - Nikulin 1979: 1.3.3, 1.8.1–1.8.2, 1.9.1, 1.9.4, 1.10.1–1.10.2, 1.11.2–1.11.3, 1.12.2–1.12.4, 1.15.1–1.15.2, 1.16.3, 3.6.2;
  - Serre V.1.4.3, V.2.2 and VII.6.6;
  - Milnor–Husemoller, SPLAG, Cho, Gan–Yu, Wall, van der Blij, Ebeling, Kitaoka and Kneser;
  - Kawauchi–Kojima, recorded as uncertified.

## Source issues

- none

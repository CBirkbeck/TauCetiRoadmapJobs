# Review of Rank24LatticeConstructions (pull request #2632 at b9c5765)

**Verdict:** needs changes

**Summary.** The mathematics checks out. An independent recomputation of all 23 glue subgroups reproduces every order, isotropy, shortest-norm bound and root count, and every Check and worked example (including the `A₅⁴ D₄` triality correction and the `K^∨/K` values) is true. One finding: the summary names the structure of `K^∨/K` as a headline theorem. It is statable at the pins and not proved there, yet `Suggested.lean` omits it, and its docstring says all of the Leech headline is already in Tau Ceti. There are three small corrections and one format note, none blocking. The human reviewers have to decide on reuse of the generator table and on the fact that SPLAG could not be read.

## R01 (P2) — The headline “`K^∨/K` is elementary abelian of order 4 with the class of `s` isotropic” is statable at the pins but absent from `Suggested.lean`

The README's third headline bullet (lines 22–26) opens with “Then `K^∨/K` is elementary abelian of order 4 with the class of `s` isotropic”. §6.1 states the full result: a basis `[2e_∞], [s]`, the quadratic values, the pairing, and uniqueness of the two isotropic order-2 subgroups. As it stands, the acceptance test checks nothing of Layer 6. The module docstring's list of headlines (lines 20–22) silently drops this part, and lines 24–30 then say that every headline is statable and that “all of (3)” is a theorem of the pinned Tau Ceti. At the pin, `BinaryGolay.natCard_discriminantGroup_constructionBLattice` (`ConstructionB/Golay.lean:97`) gives order 4, and `leechShiftClass`, `two_nsmul_leechShiftClass` and `isIsotropic_leechShiftSubgroup` (`Rank24/Leech/Basic.lean:153, 168, 204`) cover the class of `s`. Nothing at the pin says the group has exponent 2, names the class of `2e_∞`, or classifies the isotropic subgroups. Both statements below elaborate at the pins, with `import TauCeti.LinearAlgebra.IntegralLattice.Rank24.Leech.Basic` added and `open TauCeti` as in the file:

```lean
theorem two_nsmul_discriminantGroup_constructionBLattice
    (x : BinaryGolay.constructionBLattice.DiscriminantGroup) : 2 • x = 0

theorem isIsotropic_iff_of_natCard_eq_two
    (H : AddSubgroup BinaryGolay.constructionBLattice.DiscriminantGroup) (hH : Nat.card H = 2) :
    (BinaryGolay.constructionBLattice.discriminantQuadraticModule
        BinaryGolay.isEven_constructionBLattice).IsIsotropic H ↔
      H = leechShiftSubgroup ∨
        ∃ hx : (Pi.single 0 2 : Fin 24 → ℚ) ∈ BinaryGolay.constructionBLattice.dualCarrier,
          H = AddSubgroup.zmultiples (Submodule.Quotient.mk ⟨_, hx⟩)
```

The smallest repair is to state these two theorems (with `sorry`) under a `Layer 6` section comment, list §6.1 in the docstring's headline (3), and update the description's count of six theorems. If the author instead regards §6.1 as a supporting target, the alternative is to drop its sentence from the summary's headline bullet.

## C01 — Two locators into Conway–Sloane 1982 point at text that does not contain the statement they support

§2.2 (line 188) cites “Conway–Sloane 1982, §2” for the claim that `H_r` is isotropic and equal to `H_r^⊥`. That section (CS82 lines 77–253) introduces the component lattices, glue vectors, glue words and the automorphism-group orders `g₀, g₁, g₂`. It says nothing about isotropy or self-orthogonality of the glue group. Chenevier 2020 states what is needed. §5.1(a) defines a Lagrangian, and §5.1(c) proves that the overlattice is unimodular exactly when the subgroup is Lagrangian and has no new roots exactly when it contains no root (Che20 lines 1068–1071 and 1088–1092). §5.3 applies this to Niemeier lattices, with `|res R| = |I|²` (Che20 lines 1121–1124). In the same way, §2.1 (line 159) cites “§2 and Table V” for the order of `H`, but Table V (CS82 lines 355–420) lists the generators and `N₂`, not the order of the glue group. The order follows from the generators. Citing Chenevier §5.1 and §5.3 for §2.2, and saying for §2.1 that Table V supplies the generators, would make both locators accurate.

## C02 — `Suggested.lean` says Tau Ceti proves the headline statements for the four code-identified rows, but at the pin those proofs are about other lattices

Lines 31–33 of the module docstring say Tau Ceti proves the other statements of (1) and (2) row by row, “separately for the four rows identified with codes”. The description repeats this. For those four rows the pin proves unimodularity and the root sublattice only for separately glued model lattices: `a1TwentyFourthLattice`, `a2TwelfthLattice`, `d4SixLattice` and `a11d7e6Lattice` (`Rank24/A1TwentyFour.lean:360, 376`, `Rank24/A2Twelfth.lean:367, 383`, `Rank24/D4Six/Lattice.lean:101, 126`, `Rank24/A11D7E6.lean:305, 321`). It does not prove them for `RootfulNiemeierType.lattice r`. For `A₂¹²` the shortest-norm bound is stated only for `a2TwelfthGlueSubgroup` (`Rank24/A2Twelfth.lean:300`). Under the docstring's wording, a reader would think the four table lattices are already done. These are exactly what OrthogonalTamagawaAndLatticeMass takes from Layer 3. One clause naming the separately glued models would fix both texts.

## C03 — Five of the six theorems in `Suggested.lean` follow from pinned theorems by a case split on the row, and `isUnimodular_lattice` is one term on top of `natCard_glueSubgroup`

Elaborated at the pins, `natCard_glueSubgroup` and `isLagrangian_glueSubgroup` each closed with a single `cases r <;> first | exact … ` over `RootfulNiemeierType.natCard_glueSubgroup_of_ne` / `isLagrangian_glueSubgroup_of_ne` (`Rank24/Glue/EnumeratedRows.lean:205, 212`) and the four row theorems of `Rank24/Glue/IdentifiedRows.lean` (lines 94–112, 140–148, 266–280, 328–345). `isUnimodular_lattice` is the one term `(isUnimodular_lattice_iff r).mpr (natCard_glueSubgroup r)` (`Rank24/Niemeier.lean:169`). `image_vectorsOfNorm_two_lattice` and `span_vectorsOfNorm_two_lattice` are one term each from a uniform shortest-norm bound, through `DynkinType.image_vectorsOfNorm_gluedLattice_eq` and `DynkinType.span_vectorsOfNorm_two_gluedLattice`. That bound is itself a case split, plus the `A₂¹²` transfer the README describes in §2.3. As an acceptance test the six statements therefore ask an implementer for an assembly of pinned results. The docstring already calls them uniform forms of row-by-row theorems. One sentence saying that each follows by case analysis on the row from the named pinned theorems would stop readers taking them for open mathematics. The finite eliminator of §3.3 is of the same kind: it is the case analysis on the 23-constructor type, and the text could call it a convenience lemma.

## N01 — Three links end in a stray apostrophe

Lines 584, 590 and 592 read `[RootSystems](…)'`, `[ThetaSeries](…)' Layer 8` and `[CFSGBasicProperties](…)'`. Rendered, the possessive reads as a stray quote mark. “belongs to RootSystems”, or “ThetaSeries, Layer 8”, would read cleanly.

## Questions for the author

- Is Construction B in *SPLAG* Chapter 7 §5, as cited in Layer 6 and §6.1 (lines 478, 491), or in Leech–Sloane's Chapter 5? I could not open *SPLAG* (the publisher's copy is paywalled), and I am not sure which chapter treats it.

## Verified sound

| statement | instances tried | values computed (README side / independent side) | result |
| --- | --- | --- | --- |
| §2.1 order of `H_r` | all 23 rows | recomputed orders (2, 2, 1, 5, …, 729, 4096) equal the table column in all 23 rows | holds |
| §2.1 Check, cyclic `D` reading | rows 1,2,5,7,9,13,14,18,19 | Klein vs `ℤ/4` orders 2/4, 2/4, 4/16, 4/8, 8/64, 20/40, 16/128, 72/144, 64/2048; all nine differ | holds |
| §2.1 Check, `D₆⁴` | even vs all perms | 16 / 64; `[1100]` has `μ = 3/2+3/2 = 3`, odd; all-perms span not isotropic | holds |
| §2.1 Check, `D₄⁶` | additive vs `𝔽₄` span | 32 / 64; `[222222]` not in the additive span | holds |
| §2.2 Lagrangian | all rows; `A₂₄` Check | order of H squared equals order of A_R in 23/23; isotropic in 23/23; `A₂₄`: `H^⊥ = {0,5,10,15,20} = H`, `μ[1] = 24/25` | holds |
| §2.3 `μ ≥ 4` | all rows; `A₁₇E₇`, `A₁₁D₇E₆` | min `μ` over nonzero `w`: 6 (`D₂₄`), 4 elsewhere, vacuous for `E₈³`; `k[111]`: `μ = 6` iff `k ≡ 5,7`; Klein `[202]` gives 3 | holds |
| §3.1 unimodular | `A₂₄`, `E₈³` | `25/5² = 1`; `E₈³`: `H = 0`, `N = R` | holds |
| §3.2 no new roots | `D₈`+spinor; root counts | `μ = 2` gives `E₈`, 240 vs 112; pairs at `h` = 30,18,12,10,6 (five pairs) | holds |
| §3.3 names, eliminator | all 23 constructors | case analysis on the inductive type; no locator needed | holds (C03) |
| §4.1 `A₂¹²` ↔ ternary Golay | `p`, `ε` vs pin | `p`, signs `[1,−1,−1,1,1,1,1,−1,−1,1,−1,1]` match `A2Twelfth.lean:112,121`; image `j` is `ε_j·w_{p j}`; weight 6 gives `μ = 4` | holds |
| §5.1 item 1 | rotations, rows 9,12,15,17,19–23; `D₆⁴` perms | every block rotation preserves `H`; exactly the 12 even perms preserve `D₆⁴`'s `H` | holds |
| §5.1 item 2, `A₅⁴D₄` | `ρ`, `ρ∘τ`, `ρ∘τ'`, `ρ⁻¹∘τ'` | `ρ[33001] = [30301] ∉ H`; preserves `H`: `ρ`+`τ` yes, `ρ`+`τ'` no, `ρ⁻¹`+`τ'` yes; `τ` = `ω²` on labels | holds |
| §5.2 code automorphisms | `A₂¹²` signs | conjugated permutation acts by `ε_jε_{σj} = ±1`; `−1` on `A₂` induces `−1` on glue | holds |
| §6.1 `K^∨/K` | `2e_∞`, `s`, sum | `B` = 2, 4, `−3/2`; `q` = 0, 0, 1/2; `4e_∞, 𝟙 ∈ K`; exponent 2 | holds, absent from Lean (R01) |
| Layer 6 congruence model | `s`, `𝟙/2`, `(2,2,0…)`, `(2,0…)` | `∑a` = 20, 24, 8, 4 (mod 8: 4, 0, 0, 4); norms 4, —, 4, —; membership as stated | holds |
| Leech headline | at the pin | `isEven/isUnimodular/isPosDef/finrank_leechLattice` (`Leech/Basic.lean:285–304`), `minimum_leechLattice`, `vectorsOfNorm_two_leechLattice` resolve | at pin |
| Lean headline signatures (6) | elaborated types vs README | each type matches §2.1, §2.2, §2.3, §3.1, §3.2 (two); no lost binder; `IsLagrangian` = isotropic ∧ bilinear Lagrangian (`Quadratic.lean:727`) | holds |
| C02 docstring sentence | pin declarations for four rows | unimodular/root theorems only for model lattices; `A₂¹²` bound only for `a2TwelfthGlueSubgroup` | correction |

Overlap check: read OrthogonalTamagawaAndLatticeMass (open), IntegralLattices (main and its open revision), LevelOneAutomorphicFormsForClassicalGroups (open), BoundsOnCodes (open), LatticePackingsAndPerfectForms, AlgebraicCodingTheory, ThetaSeries and CFSGBasicProperties (main). Owners of the shared objects: the 23 row lattices and the Leech lattice belong to this roadmap on Tau Ceti's carriers, and each of the others cites it. Pairwise non-isometry belongs to IntegralLattices 6E, the rank-24 theta identities to ThetaSeries Layer 8, and the codes and Construction A to AlgebraicCodingTheory. Nothing is owned twice, and no id cited by another roadmap is dropped (all cite Layers 3–6, which keep their headings).

- Source locators checked against the text: Conway–Sloane 1982 §2, §3 and Table V (all 23 generator rows and `N₂` values match), Chenevier 2020 §3.1, §5.1, §5.3.
- Library declarations opened at the pin: 257 backticked names elaborated by `#check` (all resolve; the other tokens are symbols, file names or this roadmap's own names); 49 cited file paths exist; key definitions read at `Rank24/Niemeier.lean:77–206`, `Rank24/Leech/Basic.lean:58–308`, `Rank24/A2Twelfth.lean:112–150`, `FiniteBilinearModule/Quadratic.lean:610, 727`, `LinearAlgebra/Monomial.lean:51`.
- Cross-roadmap citations resolved: 7 relative links resolve on main; Layer 6 anchor used by CFSGBasicProperties unchanged.
- Dependency check: `depcheck: 200 roadmaps, 2197 edges, 0 problem(s)`.
- Automatic checks re-run at this head: all zero, OK.
- Elaboration: `Suggested.lean` gives six `sorry` warnings and nothing else; R01's two statements elaborate at the pins.
- The 23 subgroups and the variant Checks were recomputed independently of Tau Ceti.

Source independence: 9 passages compared with 2 sources (CS82 lines 83–91, 98–105, 262–264, 428–433, 434–435; Che20 lines 657–670, 1068–1071, 1088–1092, 1121–1124) against Conventions 4–6, the Layer 2 opening and Examples, §2.2 and the `Suggested.lean` docstrings. None share wording beyond standard terms. Largest share: *SPLAG*, 11 of 19 locator sites in the text (not readable). On contents, Layers 2–5 all cite one section (Ch. 16 §1), and Ch. 4, 7 and 10 are cited out of order in Conventions and Layer 6. No run of chapters is mirrored, so the arrangement is independent as far as the cited chapter numbers show; the order of §§2–5 is forced by the *Needs:* lines (§3.1←§2.1, §3.2←§2.3, §5.2←§4.1).

Research link: the 24 lattices and their glue codes are the input to Chenevier's characteristic masses of Niemeier lattices (Chenevier 2020, §5.3, built on the Conway–Sloane table). Through the Leech lattice they feed the Conway groups and the lattice-packing results consumed downstream. This rests on the README's References and Downstream consumers and on Che20 §5.3.

## Not verifiable

- *SPLAG* (Conway–Sloane 1999), Ch. 4 §§3, 6–8, Ch. 7 §5, Ch. 10, Ch. 16 §1 and Table 16.1: publisher DOI paywalled, no legal open copy found by the sources service.
- Niemeier 1973 (§3.1): publisher DOI paywalled according to the sources service.
- Wilson 2009 §5.4 (Layer 6) and Ebeling 2013 Ch. 1 and 3 (§4.1, §5.1, §5.2): publisher copies paywalled.

## Source issues

- none

## For the human reviewers

- Reuse: the generator column of the Layer 2 table (README lines 119–141) reproduces the 23 generator entries of Conway–Sloane 1982 Table V (CS82 lines 358–379), in its notation and row order. The columns `h`, `A_R`, span mode and order of `H` do not appear in Table V.
- Not tested: *SPLAG*, the source with the largest share of locators (11 of 19), could not be read legally, so its wording and table of contents were not compared.
- Scope fact: once the six `Suggested.lean` statements are assembled from pinned theorems (C03), the roadmap's remaining targets are §3.3, §4.1, §5.1, §5.2 and §6.1.

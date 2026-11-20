# Review of Rank24LatticeConstructions (pull request #2632 at 4e0bd8d)

**Verdict:** accepted

**Summary.** Accepted, with no findings. All 23 glue subgroups were rebuilt from the printed patterns: every order, isotropy, Lagrangian count, shortest-norm bound and root count in the table holds, all 15 Checks recompute, and the three code identifications (binary Golay, ternary Golay, hexacode) hold against the pinned generators with the displayed permutations, signs and scalings. The eight Lean statements elaborate with `sorry` as the only warning, none closes in one tactic, and both `K^∨/K` statements are true. There are two small corrections and one format note, none blocking. The human reviewers still decide on the reuse of the Conway–Sloane generator column and on *SPLAG*, which could not be read.

## C01 — In §4.1, "a bare field-monomial equivalence of `(ℤ/3)^12` is not an isometry of quadratic modules" reads as a false statement

A reader takes the sentence in §4.1 (README lines 351–353) to say that some monomial map of `(ℤ/3)^12` fails to preserve the `A₂¹²` discriminant form. None does: the nonzero scalars of `ℤ/3` are `±1`, and both nonzero `A₂` labels have shortest norm `2/3`, so every permutation with scalars preserves `q(w) = ∑ μ(wᵢ)/2 mod ℤ`. The first half of the same sentence says exactly this about the signs. What the sentence can truthfully mean is that a linear equivalence, as an object, carries neither the proof that it preserves the form nor a lift to the root lattices.

The smallest change: "a bare monomial equivalence of `(ℤ/3)^12` carries no proof that it preserves the quadratic form and no lift to the root lattices, so the statement is made for the isometry".

## C02 — §5.2 states the `A₂¹²` half for coordinate permutations only, while its `D₄⁶` analogue is for monomial automorphisms

§5.2 (README lines 440–444) quantifies over permutations `σ` of `Fin 12` that carry `TernaryGolay.code` onto itself. The symmetries of a ternary code also include sign changes, and the pinned `D₄⁶` statement cited in the same paragraph, `d4SixHexacodeAutIsometry`, is stated for every `monomialEquiv u σ` in `monomialAut (Hexacode.code ω)` (`TauCeti/LinearAlgebra/IntegralLattice/Rank24/D4Six/CodeAutomorphism.lean:177`). A sign costs nothing here: `−1` on an `A₂` component is an isometry of its root lattice and induces `−1` on `ℤ/3`, and the statement already allows the isometry to act on each component by `±1`. Already `u ≡ −1`, `σ = id` is an automorphism the present statement does not cover.

The statement would be at its natural generality as: for every `u : Fin 12 → (ℤ/3)ˣ` and `σ` with `monomialEquiv u σ` carrying `TernaryGolay.code` onto itself, there is an isometry of `N_{A₂¹²}` whose induced action on glue words, read in Golay coordinates, is `monomialEquiv u σ`. The permutation case is then the instance `u ≡ 1`.

## N01 — The last sentence of §2.1 uses `|H|` for two different numbers

"With `|H|² = |A_R|` it gives `|H_r|² = |A_R|`" (README line 161) reads as a tautology until one sees that the first `|H|` is the displayed table entry and the second the order of the generated subgroup. "With (displayed order)² = `|A_R|`" would say it.

## Verified sound

| statement | instances tried | values computed (README / independent) | result |
| --- | --- | --- | --- |
| Layer 2 table, all 23 rows | span of expanded patterns, each row | rank 24; roots 1104,…,48 = 24h; `\|H\|` = 2,2,1,5,4,6,4,8,8,13,12,9,20,16,27,32,49,72,64,125,256,729,4096; `\|H\|²=\|A_R\|` all | holds |
| §2.1 `natCard_glueSubgroup` | wrong models: cyclic even `Dₙ`; all permutations for `D₆⁴`; additive `D₄⁶` | cyclic: 4,4,16,8,64,40,128,144,2048 in rows 1,2,5,7,9,13,14,18,19 (all differ); `D₆⁴` all perms 64, contains `[1100]` μ=3; `D₄⁶` additive 32, lacks `[222222]` | holds; Checks true |
| §2.2 `isLagrangian_glueSubgroup` | `A₂₄`; every row | `H = H^⊥ = {0,5,10,15,20}`; isotropic and `\|H\|²=\|A_R\|` in all 23 rows; pinned `IsLagrangian` = quadratic isotropy ∧ bilinear Lagrangian (`Quadratic.lean:727`) | holds |
| §2.3 `four_le_sum_glueMinimum…` | min μ over nonzero `H_r`, every row | 6 for `D₂₄`, 4 for the other 21 nontrivial rows; `A₁₇E₇` multiples 4,4,6,4,4; `A₁₁D₇E₆` μ=6 at k=5,7 else 4; Klein `D₇` gives 3 | holds, bound attained |
| §3.1 `isUnimodular_lattice` | `A₂₄`; `E₈³` (trivial `H`) | 25/5² = 1; `\|H\|=1=\|A_R\|`; pin `isUnimodular_lattice_iff` reduces to §2.1 (`Niemeier.lean:169`) | holds |
| §3.2 both theorems | `D₈` + spinor (negative control); root-count pairs | spinor μ=2 gives 240 ≠ 112 roots; pairs 720, 432, 288, 240, 144 recomputed; pinned criteria need `n < r`, `2 < r` with r=4 (`GlueAlphabet/Roots.lean:65`) | holds |
| §4.1 and Layer 4 intro | `p`, `ε` on all 729 words; without signs | image = pinned ternary Golay code (min weight 6); without `ε` the image is not the code | holds |
| Layer 4 Example `A₁²⁴`; Layer 2 Example `D₄⁶` | displayed permutation; scalings `[ω,ω,1,ω²,ω²,1]` | image = pinned binary Golay code (weights 0,8,12,16,24); image = pinned hexacode, without scalings not | holds |
| §5.1 item 1 | block rotation on rows 9,12,15,17,19,20,21,22,23; all 24 perms on `D₆⁴` | `H` preserved in all nine; `D₆⁴`: 12 even preserve, 0 odd preserve; `[1023] ∉ H` | holds |
| §5.1 item 2 | `ρ`, `ρ⁻¹` with identity, `τ`, `τ⁻¹` on `D₄` | preserved: `ρ∘τ`, `ρ⁻¹∘τ⁻¹`; not: `ρ`, `ρ⁻¹`, `ρ∘τ⁻¹`, `ρ⁻¹∘τ`; `ρ[33001]=[30301]∉H`; `τ` = multiplication by `ω²` | holds |
| §5.2 | permutation of `A₁`, signed permutation of `A₂` | both are lattice isometries inducing the stated action; ternary half narrower than the monomial form | holds; C02 |
| Layer 6 intro | `s`, `2s`, `B(s,K)`, index, model | `B(s,s)=4`; `2s` sum 20, mod 2 = 𝟙 ∈ C; `B(s,x)=∑xᵢ/4−x₀`; index 2, disc 4; `∑aᵢ=20≡4`, `∑aᵢ²=32` | holds |
| §6.1 exponent 2 | `[2e₀]`, `[s]`, `[𝟙/2]`; wrong model `ℤ/4` | `4e₀`, `2s`, `𝟙` all in `K`; `2e₀ ∉ K`; `s+2e₀=𝟙/2`: three distinct nonzero classes of order 2 | holds |
| §6.1 isotropic iff, both directions | the three subgroups of order 2 | `B` = 2, 4, 3 so `q` = 0, 0, 1/2; pin's `q` is `B(x,x)/2` (`Discriminant/Quadratic.lean:87`), `IsIsotropic` quadratic (`Quadratic.lean:610`); `b([2e₀],[s]) = −3/2 ≡ 1/2` | holds |
| §6.1 Checks and Layer 6 Examples | `𝟙/2`, `(2,2,0,…)`, `(2,0,…)` | norm 3 (odd glue); `∑a=24≢4`; `∑a=8`, norm 4; `∑a=4≢0` | holds |
| C01 sentence | scalars of `ℤ/3` on `A₂` labels | μ([1]) = μ([2]) = 2/3, so every monomial map preserves `q` | wording, C01 |
| one-tactic probe, 8 theorems | `simp`, `rfl`, `infer_instance`, `exact` with one pinned lemma | none closes; the six row-index theorems need the five-way case split the docstring names | not padding |

- Source locators checked against the text: Conway–Sloane 1982 §2 (CS82 lines 77–105), §4 and Table V (CS82 lines 355–421, 427–433: the readable generator entries and all 23 root counts agree with the README table, in the same order); Chenevier 2020 §3.1 heading, §5.1 (a), (c) and §5.3 (Che20 lines 657, 1065–1071, 1081–1092, 1118–1124).
- Library declarations: all 240 backticked library names of the README resolve to a declaration at the pins; read at the pin: `Niemeier.lean:84–206`, `Glue/Table.lean:277`, `Glue/IdentifiedRows.lean:94–344`, `Quadratic.lean:568–733`, `Leech/Basic.lean:58–237`, `Leech/Minimum.lean:98–189`, `ConstructionB/Basic.lean:64`, `ConstructionB/Golay.lean:42–99`, `A2Twelfth.lean:112–145, 300, 490`, `A1TwentyFour.lean:127`, `D4Six/Glue.lean:120–138`, `D4Six/CodeAutomorphism.lean:177`, `TypeD/Triality.lean:330`, `Hexacode/Basic.lean:43`, `TernaryGolay.lean:38`. The 39 file and directory paths checked from the scope table and the contracts exist. None of the eight targets is declared at the pin; the pinned files read contain no `sorry`.
- Cross-roadmap citations resolved: 7 links (CFSGBasicProperties, IntegralLattices 6E at its README line 2558, LatticePackingsAndPerfectForms line 145, ThetaSeries Layer 8 with 8C–8D, RootSystems, the two completed foundations). Inbound citations (CFSGBasicProperties, IntegralLattices, LatticePackingsAndPerfectForms on main; OrthogonalTamagawaAndLatticeMass, LevelOneAutomorphicFormsForClassicalGroups, the open heads of IntegralLattices and CFSGBasicProperties) name Layers 3 and 6, which keep their numbers; the Layer 6 heading that CFSGBasicProperties links to is unchanged.
- Dependency check: `depcheck: 200 roadmaps, 2197 edges, 0 problem(s)`; no UPWARD or CYCLE line. Every `*Needs:*` line names only this roadmap's sections and pinned Tau Ceti declarations.
- Automatic checks re-run at this head: every count zero. No file changes outside the folder.
- Elaboration: `Suggested.lean` gives eight `sorry` warnings and nothing else. The elaborated type of each declaration was compared with its README statement; the file has no `variable`, and no binder is lost.
- Previous review (same head): it had no findings, corrections or notes, so nothing was owed; its table was recomputed here independently.
- Pull-request description against the head: 15 Checks (3, 1, 2, 1, 2, 1, 2, 3 per section), eight theorems, two Tau Ceti imports, the pin-coverage paragraph and the list of changed statements all agree with the head; it says that the roadmap on main is revised and that `Suggested.lean` is rewritten.

Overlap check: read OrthogonalTamagawaAndLatticeMass, IntegralLattices (main and open revision), LevelOneAutomorphicFormsForClassicalGroups, BoundsOnCodes, LatticePackingsAndPerfectForms, AlgebraicCodingTheory, ThetaSeries, and also CFSGBasicProperties and ThetaInvariantsOfEuclideanLattices; nothing shared. The 23 row lattices and the Leech construction are owned here and cited by the others by layer; automorphism orders (OrthogonalTamagawaAndLatticeMass §4.2), the Conway groups (CFSGBasicProperties P2-L), separation by root systems (IntegralLattices 6E), theta identities (ThetaSeries 8C–8D) and perfect Golay codes (BoundsOnCodes §2.2–2.3) are owned there and excluded in the scope section here.

Source independence: 9 passages compared with 2 sources (Conventions 5 and 6, the Layer 2 introduction, §2.1 and the References entry against CS82 lines 77–105, 355–357, 427–433; §2.2, Convention 1, §3.2 and the References entry against Che20 lines 1065–1071, 1081–1092, 1118–1124), none shared beyond standard terms and formulas; largest share *SPLAG*, 11 of 20 locator sites, text and contents not readable; contents compared by the chapter numbers the README cites only: Layers 2–5 draw on Chapter 16 (with Chapter 4) and Layer 6 on Chapters 7 and 10, so the layer order is not the chapter order.

Research link: the 23 glued lattices with their glue codes and the Leech lattice are Niemeier's 1973 list in the Conway–Sloane (1982) form; Chenevier (2020, §5.3) takes exactly these Lagrangians as input for the characteristic masses of Niemeier lattices. Rests on the README's References and on CS82 §4 and Che20 §5.3, both read.

## Not verifiable

- *SPLAG* (Conway–Sloane 1999): Chapter 4 §§3, 6–8, Chapter 7 §5, Chapter 10, Chapter 16 §1 and Table 16.1, cited in Conventions 5, Layer 2, §§2.1, 2.3, 3.1, 3.2, 4.1, 5.1, 5.2, Layer 6 and §6.1; recorded as paywalled, no legal open copy.
- Niemeier 1973 (§3.1), Wilson 2009 §5.4 (Layer 6) and Ebeling 2013 Chapters 1 and 3 (§§4.1, 5.1, 5.2): recorded as paywalled.
- CS82 Table V, row `A₂₄`: the generator entry is illegible in the extracted text; the other entries were read.

## Source issues

- none

## For the human reviewers

- Reuse: the generator column of the Layer 2 table (README lines 119–141) carries the 23 generator entries of Conway–Sloane 1982 Table V (CS82 lines 358–379), in its notation and row order; the table is already on main in this form.
- Not tested: *SPLAG*, the source with the largest share of locators (11 of 20 sites), could not be read legally; its wording and table of contents were not compared.
- Scope fact: the `Suggested.lean` docstring (lines 46–51) says the six Layer 2–3 statements follow from pinned row theorems by case analysis; the roadmap's other new targets are §3.3, §4.1, §5.1, §5.2 and §6.1.

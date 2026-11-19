# Review of ModularCharactersAndBlocks (pull request #2534 at c59fc36)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** accepted

**Summary.** Accepted, with no findings. This head repairs both findings of the previous review. The Brauer character over algebraically closed fields, its recognition and its projective pairing are now imported from GL2AutomorphicRepresentationsAndTransfer §R17.5.11, and §2.1 is stated as their extension. The §3.1 route now gives `Φ_P(g) φ_U(g⁻¹)`. All five earlier small corrections and both format notes are also repaired. The sampled locators, the computed checks and the elaborated signatures agree with the statements. Two small corrections (a definition that no stated theorem uses, and a misleading reason in the module docstring) and one format note remain, none blocking. The human reviewers have two licence questions to decide.

## C01 — `blockCharacters` is declared in `Suggested.lean`, but no stated theorem uses it, so the acceptance test cannot catch a wrong body

`Suggested.lean` keeps only the definitions that its headline statements need. `blockCharacters` (line 267) appears nowhere else in the file. If its body were wrong (the wrong action of `b`, or complex characters in place of `K`-valued ones), every declaration would still elaborate and nothing would fail. Its two README Checks (lines 784–790) live only in prose.

The smallest repair would state one result of §4.2 about it at a splitting system, under the hypotheses of `exists_blockIdempotent_iff_centralCharacter_congr`. Any of these would do: for a block idempotent `e_B` of `O[G]`, the character of an irreducible `K`-representation lies in `blockCharacters e_B` exactly when it does not vanish at `e_B`; or the sets `blockCharacters e_B` over a complete family of block idempotents partition the irreducible `K`-characters; or Osima's linkage criterion. If the definition is kept only because ModularCharactersAndBlocksPartII cites the name, the module docstring could say so instead.

## C02 — The module docstring's reason for not stating the spanning half of the basis theorem points to something the pins do not lack

The docstring (lines 34–37) says the spanning half "needs a complete family of simple modules indexed together with the `p`-regular classes". Nothing of the kind is missing. `brauerCharacter` is now defined. A complete family can be written as `card_simpleModules_eq_card_pRegularClasses` writes one. Spanning needs no indexing by classes. The real situation is that spanning follows from the two stated headlines by counting dimensions. That count gives as many simple modules as `p`-regular classes. `linearIndependent_brauerCharacter` makes their Brauer characters independent. By §2.1 these are class functions, and the class functions on the `p`-regular classes have exactly that dimension. A reader of the docstring would conclude that the theorem cannot be stated at the pins. Suggested wording: "not stated separately: it follows from `card_simpleModules_eq_card_pRegularClasses` and `linearIndependent_brauerCharacter` by counting dimensions". Alternatively, state it.

## N01 — The *Needs:* lines of §2.1 and §2.3 point at each other

§2.1's *Needs:* line (lines 348–350) lists §2.3 for linear independence over fields that are not algebraically closed. §2.3's *Needs:* line (line 456) lists all of §2.1. Line 338 explains that §2.3 uses only recognition over algebraically closed fields. §2.3's line could say exactly that: "recognition over algebraically closed fields (§2.1, from GL2AutomorphicRepresentationsAndTransfer §R17.5.11)".

<details><summary>What was checked</summary>

- **Automatic checks.** The automatic checks all passed at this head. The check that every supplier this roadmap cites comes earlier in the merge order, with no cycle between roadmaps, was rerun here: across 200 roadmaps and 2201 supplier edges it finds no problem. No supplier is cited upward, there is no cycle, and this roadmap does not need to move in the merge order. `Suggested.lean` elaborates with exit code 0; its 15 warnings are all `declaration uses sorry`.
- **Earlier findings.** All repaired:
  - **R01 (ownership).** Lines 303–312 and Scope lines 1394–1400 now make §R17.5.11 the owner over algebraically closed fields, with §2.1 as the extension. The supplier contract is at lines 1602–1613. The family index matches main, and there it says this roadmap imports from §R17.5.11. On main, §R17.5.11's *Needs:* line says the pairing is owned there.
  - **R02 (route).** Line 569 now reads `Φ_P(g) φ_U(g⁻¹)`, followed by the substitution `g ↦ g⁻¹`.
  - **C01.** `IsAlgClosed` has been dropped from `linearIndependent_brauerCharacter`, and its docstring updated.
  - **C02.** The milestone map is restored (lines 53–54).
  - **C03.** The GlaubermanZStar entry is corrected (lines 1388–1390).
  - **C04.** The locator now reads p. 235 (lines 1001, 1014), and Theorem 12.4.5 is cited (line 1003).
  - **C05.** The pull-request description is corrected.
  - **N01.** `card_eq_pow_blockDefect` is named at line 1013.
  - **N02.** Line 328 is reworded.
- **Not verifiable.** Navarro and Serre are uncertified and cited by locator. The AxiomMath/CFSG files were not opened.
- **Checks set aside.** None.

</details>

## Verified sound

| Row | Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- | --- |
| A01 | 0.1 sections (Webb 9.3.4, p. 146; Martínez p. 3) | `S₃`, `p = 2`; `C₆` | sections `{1, r, r²}`, `{t₁, t₂, t₃}`; `3 = 2 + 1` classes; `g³ g⁴ = g⁷ = g` | Pass | none |
| A02 | 0.2 blocks (Webb 12.1.1–12.1.3, pp. 227–228; Martínez 2.11, p. 15) | `𝔽₃[C₂]`; `𝔽₂[C₃] → 𝔽₄[C₃]` | `(−(1+t))² = 2 + 2t = −(1+t)`; `(1+α²r+αr²) + (1+αr+α²r²) = r + r²` | Pass | none |
| A03 | 0.3 cores, `pPrimeCore` | `S₃`, `A₄`, `H = ⟨(12)⟩`, `p = 3` | `O_{2'}(S₃) = C₃`, `O_{3'}(S₃) = 1`; `O_{3'}(A₄) = V₄`; `pPrimeCore 3 H = H`, `pPrimeCore 3 ⊤ ⊓ H = 1` | Pass | none |
| A04 | 1.1 system at every place (Webb §9.4, p. 148; 10.1.1, p. 170) | `e = 3, p = 7`; `e = 1, p = 5` | `2³ = 8 ≡ 1`, `4³ = 64 ≡ 1 mod 7`; `|μ(ℚ)| = 2`, `|μ(ℚ₅)| = 4` | Pass | none |
| A05 | 1.2 lattices (Webb 9.4.8, p. 153; Martínez 1.7–1.8, p. 4) | `C₂`, `p = 2`, `O = ℤ₂` | `O[C₂] ↦` non-split regular, `O(1+t) ⊕ O(1−t) ↦ k ⊕ k`; both class `2` | Pass | none |
| A06 | 1.3, `existsUnique_blockIdempotent_map_residue` (Webb 9.4.3, 9.4.5) | `ℤ₂[C₃]`; `ℤ_(7)[C₃]` | `((1+r+r²)/3)² = (1+r+r²)/3`, reduces to `1+r+r²`; non-complete `ℤ_(7)`: 3 blocks over `𝔽₇`, `ζ₃ ∉ ℚ₍₇₎` | Pass | none |
| A07 | `brauerCharacter` (Webb §10.1, p. 170; 10.1.3) | `C₃/𝔽₄`, `τ(α) = ζ₃`; trivial `𝔽₂²`; `p`-singular | values `1, ζ₃, ζ₃²`; multiplicity `2` gives `2`, trace `0`; value `0` | Pass | none |
| A08 | `linearIndependent_brauerCharacter` (Webb 10.2.2, p. 176) | `C₃` over `𝔽₄`, over `𝔽₄(T)`, over `𝔽₂` | Vandermonde of `1, ζ, ζ²` nonzero (same for `𝔽₄(T)`); over `𝔽₂` no `τ` exists (`|μ₃(𝔽₂)| = 1 ≠ 3`) | Pass | none |
| A09 | §2.1 route over non-closed `k` via §2.3 | `e'` against `m` | `e'` = lcm of `p`-regular orders, divides `m` by `hdvd`; `k` then contains `ζ_{e'}` and splits `G` | Pass | N01 |
| A10 | 2.4, `span_decompositionRows_eq_top` (Webb 10.2.4, p. 178) | `S₃`, `p = 3`; `ℤ_(7)`, `C₃` | rows `(1,0), (0,1), (1,1)` span `ℤ²`; Cartan columns index `3`; 2 against 3 simples | Pass | none |
| A11 | 3.1 pairing and route (Webb 10.2.1, pp. 174–175) | `S₃`, `p = 2`; `C₃`, `P` the `α`-module, `U` trivial | `⟨Φ₁, φ₁⟩ = 6/6 = 1`, `⟨Φ₁, φ_std⟩ = 0`; `Φ_P(r) φ_U(r⁻¹) = ζ₃` = true value | Pass | none |
| A12 | `cartanMatrix_eq_transpose_mul_decomposition` (Webb 9.5.4, 9.5.6) | `S₃`, `p = 3`; `C₄/ℤ₂` | `DᵀD = [[2,1],[1,2]]`; non-splitting: `DᵀD = [6] ≠ C = [4]` | Pass | none |
| A13 | 4.1 `e_χ` (Webb 3.6.2, p. 42) | `C₂/ℚ₂`; `C₃` | `e₊e₋ = (1 − t²)/4 = 0`, sum `1`; `∑_j e_j = 1` since `∑_j ζ^{−j} = 0` | Pass | none |
| A14 | `blockCharacters` (§4.2) | `S₃/ℤ₂[ζ₃]`; `C₃/ℤ₂` | `(1+r+r²)/3` acts `1, 1, 0` on `1, sgn, std`; `(2−r−r²)/3` acts `0, 0, 1`; `C₃/ℤ₂` gives `(2, −1, −1)` | Pass; no theorem uses it | C01 |
| A15 | §4.2 Osima linkage | `S₃`, `p = 2, 3` | `p = 2`: sums `3, 0, 0`; `p = 3`: `2 + 3·0 = 2`; summing over all of `G` gives `0` | Pass | none |
| A16 | `exists_blockIdempotent_iff_centralCharacter_congr` (Martínez 2.1, 2.12) | `S₃`, `M ∋ 2`; `C₄/ℤ₂` | `−6 ∈ M`, `−3 ∉ M`; non-splitting: difference `1 ∉ 2ℤ₂` but single block | Pass | none |
| A17 | 5.2 orthogonality (Sambale 1.14, p. 16) | `C₂`, `p = 2`; `S₃`, `p = 3` | `Q*Q = diag(2,2)`, `|det|² = 4`; `det Q = −3`, `Q*Q = diag([[2,1],[1,2]], 3)` | Pass | none |
| A18 | 6.3 Brauer pairs (Craven 2.6–2.12, pp. 22–25) | `S₃`, `p = 2`, `Q = ⟨t⟩` | `Br_Q(1+r+r²) = 1`, a `B₀`-pair; `Br_Q(r+r²) = 0` | Pass | none |
| A19 | `brauerProjection_mul` | `S₃`, `p = 2`, `P = ⟨t⟩` | `x = r + r²`: `Br(x²) = 0 = Br(x)²`; `x = r`, `y = r²`: `1` against `0` | Pass | none |
| A20 | `isDefectGroup_conj`, `isDefectGroup_iff_sylow_of_augmentation_ne_zero` | `S₃`, `p = 2` | `B₀`: augmentation `3 = 1`, defect groups are the three Sylow `⟨t⟩`; `r + r²`: augmentation `0`, defect group `1` | Pass | none |
| A21 | `blockDefect`, `card_eq_pow_blockDefect` | `S₃`, `p = 2`; `C_p` | `{d : 2 = 2^d} = {1}`; `r + r²`: `0`; `C_p`: `1` (the model `|D|` gives `p`); not closed by `simp` | Pass | none |
| A22 | §6.2 `O`-form, direct products | `ℤ₂[S₃]`; `S₃ × C₂`, `p = 3` | `(2−r−r²)/3 = Tr_1((1−r)/9)`; unit `1/3` against `6ℤ₂`; defect `1 + 0` | Pass | none |
| A23 | `brauer_first_main` (Webb 12.6.4, p. 250; Martínez 4.10, p. 27) | `S₃`, `p = 2`, `D = ⟨t⟩`; `S₅`, `p = 3` | `brauerCorrespondent D (1+r+r²) = 1`; `Br_D(r+r²) = 0`; `S₅`: `(1 ± s)/2`, `s` eigenvalues `1,1,1,−1` | Pass | none |
| A24 | `sum_sameBlock_mul_conj_eq_zero` | `S₃`, `p = 2`, `B₀` | `g = 1`, `h = (12)`: `1 − 1 = 0`; `p`-parts conjugate (`g = 1`, `h = r`): `2 ≠ 0` | Pass | none |
| A25 | `brauer_third_main_local` (Sambale 1.15, p. 17) | `S₃`, `p = 2`, `P = H = ⟨t⟩`; `P = 1` | `Br_P(e₀) · 1 = 1 ≠ 0`, augmentation `1`; `P = 1`: `e₀ b ≠ 0` iff `b = e₀` | Pass | none |
| A26 | `mem_pPrimeCore_iff_forall_principalBlock` | `S₃`, `p = 2, 3`; `A₄`, `p = 3` | `ker 1 ∩ ker sgn = C₃`; `std` faithful gives `1`; `A₄`: `B₀ = {1, λ, λ²}`, intersection `V₄` | Pass | none |
| A27 | `complete_blockIdempotents_unique`, `card_simpleModules_eq_card_pRegularClasses` | `𝔽₃[C₂]`; `S₃`, `p = 2, 3` | families `(e₊, e₋)`, `(e₋, e₊)`: swap; `2 = 2` both primes; `exact?` finds only itself | Pass | none |
| A28 | 8.1 normal `p`-subgroups (Martínez 1.14, 8.2–8.5; Sambale 1.23) | `S₃`, `p = 3`, `N = C₃` | `1 ↦ e₊ + e₋`, two blocks; `G/C_G(N) = C₂`, not a `3`-group, so 1.23 does not apply | Pass | none |
| A29 | 8.4 interfaces, milestone map | GlaubermanZStar head against lines 53–54 | head cites `§0.3, M1, M2, M4, M5, M7, M8`; map `Mk ↦ Layer k`, block-section orthogonality to §7.2 | Pass | none |
| A30 | module docstring, spanning half | count against independence | `#IBr = #p`-regular classes `= dim`; independence then gives span | Reason misleads | C02 |
| A31 | ownership of the Brauer character | GL2Auto main 2945–2956 against head 303–312, 1394–1400 | §R17.5.11: algebraically closed, pairing "owned here"; head imports it, owns the extension | Pass | none |

- Source locators checked against the text: 89 (webb 37, martinez 33, sambale 13, craven 6). The Webb offset is +7 throughout, Martínez −8 and Craven −6; Sambale's printed pages equal the PDF pages. All support the statements as written.
- Library declarations opened at the pins:
  - `TauCeti.IsPrimitiveIdempotent` (`RingTheory/Idempotents/Primitive/Basic.lean:89`), with field `ne_zero`;
  - `card_eq_card_of_isPrimitiveIdempotent` (`Decomposition.lean:199`), which gives cardinality, not equality;
  - `relNorm_comp_norm` (`RelativeNorm.lean:122`), `relNorm_apply_of_forall_apply_eq` (`:184`) and `relNormInvariants` (`:204`);
  - `Representation.mem_ker_iff_char_eq` (`CharacterTable/Kernel.lean:115`);
  - `IsAdicComplete.henselianRing` (Mathlib `RingTheory/Henselian.lean:154`);
  - `Representation.character` (Mathlib `RepresentationTheory/Character.lean:56`).

  The libraries define no Brauer character, defect group, block idempotent or `p`-core.
- Mathlib pull request #39771 at head `2a0f648`: `def pCore (p : ℕ) (H : Subgroup G) : Subgroup G`, as §0.3 says. The pull request is open; the repository README asks a roadmap to follow such a shape.
- Cross-roadmap citations resolved on main (`faef063`):
  - GL2AutomorphicRepresentationsAndTransfer §R17.5.11 (2943) and §R17.5.12 (2958); no citation of this roadmap there, so no cycle;
  - OddOrderTheorem §1.1 (316–334; the contract matches);
  - ArithmeticGaloisDuality §R02.4.4, target at 3650;
  - CharacterTheory §§3.5, 4.3, 4.5 (497, 741, 817);
  - InductionRestriction Layer 6 (661);
  - ModularInduction Layers 0, 1, 3 (174, 202, 257);
  - SemisimpleAlgebras Layers 0–2 (169–212; kept by its open revision);
  - QuiverRepresentations Layer 3 (507);
  - GrothendieckEulerForms Layers 2 and 4 (352, 602);
  - RamificationOfCompleteDiscretelyValuedFields §4a.3.
- Open heads read: ModularCharactersAndBlocksPartII `765678c` (lines 1577–1590, 1660–1675, 1803–1860; namespace `…PartII`, so no shared fully qualified name) and GlaubermanZStar `d642d3e` (lines 48–55, 93, 143–155; its Lean file does not use `pPrimeCore`).
- Automatic checks: all passed at this head. The dependency check output is `depcheck: 200 roadmaps, 2201 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` exits with code 0, with 15 warnings, all `declaration uses sorry`. A scratch copy with `#check @` for all 25 declarations shows no lost binder; every type matches its README statement. The one-tactic probes (`simp` on `card_eq_pow_blockDefect` and `brauerProjection_mul`, `exact?` on `complete_blockIdempotents_unique`) do not close.
- Change outside the folder: none against `origin/main`. The family index equals main's.

Overlap check: read ModularCharactersAndBlocksPartII, GlaubermanZStar and SemisimpleAlgebras (open), ModularInduction, CharacterTheory, OddOrderTheorem and GL2AutomorphicRepresentationsAndTransfer (main). LocalFiniteGroupTheory has no checkout here; the search tool shows its README line 44 excluding Brauer characters and blocks. Shared objects and their owners:
- `π`-cores: OddOrderTheorem §1.1, cited by §0.3.
- The Brauer character over algebraically closed fields, its recognition, the pairing and linear independence: GL2AutomorphicRepresentationsAndTransfer §R17.5.11. This roadmap owns the extension to other fields.
- `blockCharacters`, `IsDefectGroup`, the defect and the Brauer correspondent: this roadmap; PartII cites them.
- The decomposition map: a kept variant of ArithmeticGaloisDuality §R02.4.4, with the difference stated.

Source independence: 89 locators checked, plus 7 further passages compared against 4 sources (webb, martinez, sambale, craven). The passages are the §3.1 route against webb lines 7394–7418; the §4.2 Osima route against martinez lines 512–565; the §8.2 covering against martinez line 1710; the §6.3 route against craven lines 823–870; §7.3 against sambale line 478; the §2.1 definition against webb line 7159; and `IsDefectGroup` against sambale line 350. No wording is shared beyond forced formulas and short statements; the longest common run is 4 words ("lifts to a projective", webb line 7398). The largest share is webb, about 52 of 112 source citations. Contents compared with webb Chs. 9–12: independent. Layers 0, 5, 7.2–7.3 and 8 have no Webb chapter; Layer 2 joins Webb §9.3 with Ch. 10; Layer 3 joins §9.5 with §10.2; the *Needs:* lines force the order of Layers 4–7.

Research link: Layers 4–7 (defect groups, generalized decomposition numbers, Brauer's three main theorems) are the block-theoretic base of Sambale's research monograph on block invariants (Sambale, LNM 2127, 2014, Ch. 1). §8.4 supplies GlaubermanZStar's route to Glauberman's `Z*` theorem (1966). This rests on the README and on `sambale` Ch. 1.

## Not verifiable

- Navarro (`navarro`), Theorem 6.10, and Serre (`serre`), Part III §§15.2 and 16.1: both settled as uncertified and cited by locator.
- The two AxiomMath/CFSG files named under References (lines 1648–1650) were not opened.

## Source issues

- **Error** in webb at §9.4, p. 148: the source says that if `F` contains a primitive `m`-th root of unity, `m` the exponent of `G`, then so do `R` and `k`; it should say only the `p'`-part of `m`, since no primitive `m`-th root exists in characteristic `p` when `p ∣ m`; affects nothing.

## For the human reviewers

- Licence: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:1648–1650` names two files of the public repository AxiomMath/CFSG as proof sources for §§7.2–7.3. The declarations of `Suggested.lean` were not compared with that repository, and its licence was not read.
- Licence: `martinez` (course notes, Firenze 2024) and `craven` (lecture notes, 2008) are unpublished notes read from their authors' pages. The published sources `webb` and `sambale` carry most locators.

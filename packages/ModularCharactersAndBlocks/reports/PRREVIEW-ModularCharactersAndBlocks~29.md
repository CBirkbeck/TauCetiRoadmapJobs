# Review of ModularCharactersAndBlocks (pull request #2534 at bc7019d)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** needs changes

**Summary.** Needs changes, for two findings. First, once this merges the Brauer character and its projective pairing would have two owners: GL2AutomorphicRepresentationsAndTransfer §R17.5.11 on main still says it owns them, while this README claims them and says §R17.5.11 imports them from here. Second, the new route in §3.1 gives the complex conjugate of the lifted character's value at a `p`-regular element. There are also five small corrections and two format notes. The human reviewers have two licence questions (Axiom proof sources, unpublished lecture notes).

## R01 (P2) — The Brauer character and its projective pairing would have two owners, and the README says §R17.5.11 imports them when it does not

This roadmap now claims the Brauer character for any identification `τ`, its recognition of composition factors, the linear independence of `IBr(G)` and the projective/Brauer pairing (Scope and ownership, line 1382; §§2.1, 3.1). GL2AutomorphicRepresentationsAndTransfer is on main, and no open pull request revises it. Its §R17.5.11 still defines `Br_r` over an algebraically closed field for a fixed `τ`, with additivity, lattice agreement, recognition and the pairing. Its *Needs:* line (`TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:2954`) ends "Modular characters and their projective pairing are owned here." So after the merge two roadmaps on main would each plan the same object, and an implementer could not tell which definition is canonical. Three sentences in this pull request say the opposite of main:
- the Downstream consumers entry (lines 1376–1377): "§R17.5.11 imports these from §§2.1 and 3.1, with `brauerCharacter p τ` as its `Br_r`, instead of defining them";
- the Summary (lines 14–15);
- the edited family-index bullet (`TauCetiRoadmap/RepresentationTheory/README.md:137–139`), which says §R17.5.11 "imports its Brauer characters".

There are two ways to repair it; the author chooses:
- **Keep the ownership here.** Revise GL2AutomorphicRepresentationsAndTransfer §R17.5.11 in a companion pull request so that it imports `brauerCharacter` and the pairing from §§2.1 and 3.1, and drop its "owned here" clause. Name that pull request in this description so the two merge together. That edge creates no cycle: this roadmap cites §R17.5.12 only as a scope deferral.
- **Keep §R17.5.11 as the owner.** Restore the import from §R17.5.11, and state §2.1 as the extension to non-closed fields, saying in one clause how it differs.

## R02 (P2) — The §3.1 route gives the conjugate of the lifted character's value at a `p`-regular element

The route sentence in §3.1 (line 556) says the lifted character of `P ⊗ U*` has value `Φ_P(g⁻¹) φ_U(g)` at a `p`-regular `g`. In fact the character of `P ⊗ U*` at `g` is `Φ_P(g) φ_{U*}(g) = Φ_P(g) φ_U(g⁻¹)`, the complex conjugate. Webb's proof of Proposition 10.2.1 (`webb` lines 7404–7418, pp. 174–175) evaluates at `g⁻¹`: the value there is `φ_P(g⁻¹) φ_U(g)`. An implementer who follows the sentence pointwise gets a false identity, even though the dimension formula, summed over `G`, is unaffected.

Counterexample: take `C₃` at `p = 2` over `𝔽₄`, let `P` be the projective module on which `r` acts by `α`, let `U` be trivial, and let `τ(α) = ζ₃`. Then `P ⊗ U* = P` has character `ζ₃` at `r`, but the sentence gives `Φ_P(r⁻¹) φ_U(r) = ζ₃²`. Fix: write "at a `p`-regular `g` its value is `Φ_P(g) φ_U(g⁻¹)`", or "its value at `g⁻¹` is `Φ_P(g⁻¹) φ_U(g)`".

## C01 — `linearIndependent_brauerCharacter` is attached to a more general statement than the Lean form proves

The §2.1 bullet (line 317) names `linearIndependent_brauerCharacter` for any field `k` of characteristic `p` that contains a primitive `m`-th root of unity and splits `G`. The Lean signature (`Suggested.lean:109–110`) assumes `[IsAlgClosed k]`. Either say in the bullet that the Lean form is the algebraically closed case, or drop `IsAlgClosed` from the Lean. The README's general statement is true. The splitting hypothesis is also redundant: `τ` forces `rootsOfUnity m k` to have `m` elements, so `e' ∣ m`, and §2.3 then makes `k` split `G`.

## C02 — The pull request drops the `M0`–`M8` milestone mapping, which GlaubermanZStar still cites

Main's README (line 285) maps the former milestones `M0`–`M8` to Layers 0–8, with block-section orthogonality in §7.2. The head drops that sentence, and the description does not mention the removal. GlaubermanZStar, at its open head, cites `M1`, `M2`, `M4`, `M5`, `M7` and `M8` (its README lines 52, 112, 791, 830, 849, 937); those citations stop resolving. Restore the one-sentence mapping (it can sit in the Scope section), or renumber GlaubermanZStar's citations.

## C03 — The Downstream consumers entry misstates where GlaubermanZStar takes its `2'`-core

Lines 1370–1371 say GlaubermanZStar "takes the `π`-cores from OddOrderTheorem §1.1, as this roadmap does (§0.3)". At its open head, GlaubermanZStar's README (lines 48 and 93) says "ModularCharactersAndBlocks §0.3 owns the `2'`-core `O(G) = pPrimeCore 2 G`". It also uses `pPrimeCore 2 G`, the signature this pull request replaces with `pPrimeCore p ⊤`. Say instead that GlaubermanZStar cites §0.3, which reads the cores from OddOrderTheorem §1.1, or update GlaubermanZStar together with this change.

## C04 — Webb's remark on defect groups over `O` and `k`, and his definition of the defect, are on p. 235, not p. 236

§6.2 cites "Webb, §12.3, p. 236" twice: for the definition of defect groups over `O` and over `k` (line 985) and for the defect (line 996). Both are on printed p. 235 (`webb` lines 9918–9932). Webb's Theorem 12.4.5 (p. 241), stated over a discrete valuation ring, also gives the minimal-trace characterization over `O` that the bullet proves by Nakayama's lemma, and would be the natural citation for it.

## C05 — The description's sentence about ModularCharactersAndBlocksPartII describes an earlier head

The description says PartII needs "`IsDefectGroup` in place of its `IsBlockDefectGroup`". At PartII's open head there is no `IsBlockDefectGroup`. It already uses `IsDefectGroup` and `blockCharacters` and cites this roadmap's §§4.2, 6.2 and 7.1 (its README lines 870 and 1670–1675). It also writes the defect as `d(B)` and the Brauer correspondent in words, not by the names `blockDefect` and `brauerCorrespondent`. Suggested wording: "these are the base notions that ModularCharactersAndBlocksPartII cites from §§4.2, 6.2 and 7.1".

## N01 — `card_eq_pow_blockDefect` is declared in `Suggested.lean` but named nowhere in the README

Name it in the `blockDefect` bullet of §6.2, which already says the defect is "well defined by `isDefectGroup_conj`".

## N02 — In §2.1 the letter `m` stands for both the integer and the maximal ideal

Line 311 reads "`X^m − 1` is separable modulo `m` because `m` is a unit of `O`". Write "modulo the maximal ideal" there, or rename the integer.

## Verified sound

| Row | Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- | --- |
| A01 | 0.2 block idempotents (Webb 12.1.1–12.1.2, p. 227; Martínez Thm 2.11, p. 15) | `𝔽₂[S₃]`, `𝔽₃[C₂]` | `(1+r+r²)+(r+r²) = 1`, product `2+2r+2r² = 0`; `(2+2t)² = 8+8t = 2+2t` in `𝔽₃` | Pass | none |
| A02 | 1.1 splitting system at every place (Webb §9.4, p. 148; Lemma 10.1.1, p. 170) | `e=3, p=7`; `e=1, p=5` | two places over 7, `ζ₃ ↦ 2, 4` (`8 ≡ 64 ≡ 1 mod 7`); `ℚ` has 2 roots of unity, `ℚ₅` has 4 | Pass | none |
| A03 | 1.3 / `existsUnique_blockIdempotent_map_residue` (Webb 9.4.3 p. 149, 9.4.5 p. 151) | `ℤ₂[C₃]`, `ℤ₂[C₂]` | `((1+r+r²)/3)² = (1+r+r²)/3`, reduces to `1+r+r²`; `(1±t)/2 ∉ ℤ₂[C₂]`, unique block `1` both sides | Pass | none |
| A04 | `brauerCharacter` (Webb §10.1, Prop 10.1.3, pp. 170–171) | `C₃/𝔽₄`, `τ(α)=ζ₃`; `V = 0`; `t ∈ C₂`, `p = 2` | values `1, ζ₃, ζ₃²`, dual `1, ζ₃², ζ₃`; `V=0`: all multiplicities 0, value `0 = dim`; `p`-singular: `0` | Pass | none |
| A05 | `linearIndependent_brauerCharacter` (Webb 10.2.2, p. 176) | `C₃/𝔽̄₂`; `S₃`, `p=2`; two trivial copies; zero rep | Vandermonde of `1, ω, ω²` ≠ 0; `det[[1,1],[2,−1]] = −3`; copies excluded by `hnoniso`; zero rep excluded (`IsSimpleOrder` extends `Nontrivial`) | Pass; Lean narrower than README | C01 |
| A06 | §2.1 reduction route, `red : ℤ[ζ₃] → 𝔽₄` | `𝔽₄`, `r ↦ α`, over `𝔽₂` | Brauer value `ζ₃+ζ₃² = −1 ↦ 1`; trace `α+α² = 1` | Pass | none |
| A07 | §2.2 count (Webb 9.3.6, p. 147; Martínez 1.9, p. 5) | `S₃` at 3; `S₃/𝔽₂`; `C₃/𝔽₂` | 2 simples vs 2 classes; 2 vs `{1}`, `{r, r²}`; non-split `C₃`: 2 simples vs 3 classes | Pass | none |
| A08 | §4.1 `e_χ` (Webb 3.6.2, p. 42) | `C₂/ℚ₂` | `e± = (1±t)/2`, `e₊e₋ = (1−t²)/4 = 0`, sum `1` | Pass | none |
| A09 | `blockCharacters` | `S₃/ℤ₂[ζ₃]`, `b = (1+r+r²)/3, (2−r−r²)/3, 0, 1` | actions on `1, sgn, std`: `(1,1,0)`, `(0,0,1)`; `b = 0`: none; `b = 1`: all three | Pass | none |
| A10 | §4.2 Osima linkage | `S₃` at 2 and 3 | `p=2`: `1·sgn` sum `3`, `1·std` sum `2−1−1 = 0`; `p=3`: `1·std` sum `2+3·0 = 2`; summing over all of `G` gives `0` for every pair | Pass | none |
| A11 | `exists_blockIdempotent_iff_centralCharacter_congr`, `SameBlock` (Sambale Def 1.6, p. 15) | `S₃`, `M ∋ 2` and `M ∋ 3` | transpositions: `sgn − 1 = −6 ∈ M`, `std − 1 = −3 ∉ M` at 2; `−3, −3 ∈ M` at 3 | Pass | none |
| A12 | §4.3 principal block (Sambale Def 1.2, p. 14) | `𝔽₂[S₃]` | augmentation `3 = 1` for `1+r+r²`, `2 = 0` for `r+r²` | Pass | none |
| A13 | §5.1 generalized decomposition numbers (Sambale Def 1.9, p. 15) | `S₃`, `p=3`, `u=r`; `C₃`, `p=3` | `d^r = (1, 1, −1)`; `d^r_{χ_j} = ζ₃^j ∉ ℕ` | Pass | none |
| A14 | §5.2 orthogonality (Sambale 1.14, p. 16) | `S₃` at 3; `C₂` at 2 | `Q*Q = diag([[2,1],[1,2]], 3)`, `det Q = −3`; `C₂`: `diag(2,2)`, `|det Q|² = 4` | Pass | none |
| A15 | §6.1 relative traces (Webb 11.3.1, pp. 194–195; 12.4.1, p. 238) | `S₃/𝔽₂`, `P = ⟨t⟩` | `Tr_1^P(r) = r + r²`; `Tr_1^P(1) = 2 = 0` | Pass | none |
| A16 | `brauerProjection_mul` (Webb 12.5.4, p. 246; Martínez 4.1, p. 23) | `S₃`, `p=2`, `P = ⟨t⟩` | invariant `x = r+r²`: `Br(x²) = 0 = Br(x)²`; `x=r`, `y=r²`: `Br(xy) = 1`, `Br(x)Br(y) = 0` | Pass | none |
| A17 | §6.2 defect groups over `O` | `ℤ₂[S₃]` | `(1+r+r²)/3 = Tr_{⟨t⟩}((1+r+r²)/9)`; `Tr_1` coefficient at 1 in `6ℤ₂`, against unit `1/3`; `(2−r−r²)/3 = Tr_1((1−r)/9)` | Pass | none |
| A18 | `isDefectGroup_conj`, `isDefectGroup_iff_sylow_of_augmentation_ne_zero` (Webb 12.5.2, p. 244; Sambale 1.5, p. 14) | `S₃`, `p=2` | `B₀`: maximal `p`-subgroups with `Br ≠ 0` are the three `⟨t⟩`, the Sylows; `r+r²`: only `1` | Pass | none |
| A19 | `blockDefect`, `card_eq_pow_blockDefect` | `S₃`, `p=2`; `C_p` | `B₀`: `{d : 2 = 2^d} = {1}`, sup `1`; `r+r²`: `0`; `C_p`: `1` (the model `|D|` gives `p`) | Pass | N01 |
| A20 | §6.2 direct products | `S₃×C₂` at 3; `C₃×C₃/𝔽₂` | two blocks with three characters each, defect `1+0`; `𝔽₄ ⊗ 𝔽₄ ≅ 𝔽₄ × 𝔽₄`: `e ⊗ e` is two blocks | Pass | none |
| A21 | `brauer_first_main`, `brauerCorrespondent` (Webb 12.6.4, p. 250; Martínez 4.10, p. 27) | `S₃`, `p=2`, `D = ⟨t⟩`; `D = 1`; `S₃`, `p=3`, `D = C₃` | `Br_D(1+r+r²) = 1` (coefficient 1 at `1`, 0 at `t`), a block of `k[C₂]` with defect `C₂`; `Br_D(r+r²) = 0`; `D=1`: identity | Pass | none |
| A22 | §7.2 second main theorem (Sambale 1.13, Prop 1.11, p. 16) | `S₃`, `p=2`, `u = (12)` | `d^u = (1, −1, 0)`, nonzero only on `B₀ = {1, sgn}` | Pass | none |
| A23 | `sum_sameBlock_mul_conj_eq_zero` (Martínez Cor 2.4, p. 11) | `S₃`, `p=2`, `g=1`, `h=(12)` | `1·1 + 1·(−1) = 0` over `{1, sgn}` | Pass | none |
| A24 | §7.3 / `brauer_third_main_local` (Sambale 1.15, p. 17; Martínez 5.9, p. 35) | `S₃`, `p=2`, `P = H = ⟨t⟩` | `Br_P(1+r+r²) = 1`; product with block `1` of `k[P]` is `1 ≠ 0`, augmentation `1` | Pass | none |
| A25 | §8.1 normal `p`-subgroups (Martínez 1.14, p. 6; 8.2, 8.4, 8.5, pp. 51–52; Sambale 1.23, p. 18) | `S₃`, `p=3`, `N = C₃` | single block maps to `1 = e₊ + e₋` in `𝔽₃[C₂]`, two blocks | Pass | none |
| A26 | `mem_pPrimeCore_iff_forall_principalBlock` with `pPrimeCore p ⊤` | `S₃` at 2, 3; `A₄` at 3 | `ker 1 ∩ ker sgn = C₃ = pPrimeCore 2 ⊤`; `std` faithful, `1 = pPrimeCore 3 ⊤`; `A₄`: `V₄` | Pass | none |
| A27 | `pPrimeCore` relative to a subgroup | `H = ⟨(12)⟩ ≤ S₃`, `p = 3` | `pPrimeCore 3 H = H` (order 2, normal in `H`); `pPrimeCore 3 ⊤ ⊓ H = 1` | Pass | none |
| A28 | §3.1 route, lifted character of `P ⊗ U*` | `C₃`, `p=2`, `𝔽₄`, `P` the `α`-module, `U` trivial | true value at `r`: `ζ₃`; README's `Φ_P(r⁻¹) φ_U(r) = ζ₃²` | Fail | R02 |
| A29 | ownership of the Brauer character | GL2Auto main README:2954 against this README:1382 | both say they own it; no open revision of GL2Auto | Fail | R01 |
| A30 | Webb §12.3 locator | printed page of `webb` lines 9918–9932 | p. 235, cited p. 236 | Fail | C04 |
| A31 | milestone mapping | main README:285 against head | main maps `M0`–`M8`, head lacks it; GlaubermanZStar cites `M1, M2, M4, M5, M7, M8` | Fail | C02 |

- Previous findings: the previous review (of #1775 at `8379fba`) had none, so there was nothing to check for repair.
- Source locators checked against the text: 88 (Webb 43, Martínez 32, Sambale 13). All support the statements as written except Webb §12.3 (C04).
- Library: `Representation.IsIrreducible` is `IsSimpleOrder (Subrepresentation ρ)` (`Mathlib/RepresentationTheory/Irreducible.lean:29`; `IsSimpleOrder` extends `Nontrivial`, `Mathlib/Order/Atoms.lean:605`). `Representation.character` takes no finiteness hypothesis. Mathlib PR #39771 at its head defines `Subgroup.pCore (p : ℕ) (H : Subgroup G) : Subgroup G`, as §0.3 says.
- Cross-roadmap citations resolved on main:
  - OddOrderTheorem §1.1 (README:316–334; the contract matches its API);
  - GL2AutomorphicRepresentationsAndTransfer §R17.5.11 (2943) and §R17.5.12 (2958);
  - ArithmeticGaloisDuality §R02.4.4, target at 3650;
  - CharacterTheory §§3.5, 4.3, 4.5 (497, 741, 817);
  - InductionRestriction Layer 6 (661);
  - ModularInduction Layers 0, 1, 3 (174, 202, 257);
  - SemisimpleAlgebras Layers 0–2 (169–212);
  - QuiverRepresentations Layer 3 (507);
  - GrothendieckEulerForms Layers 2, 4 (352, 602);
  - RamificationOfCompleteDiscretelyValuedFields §4a.3 (119).
- Open heads read: GlaubermanZStar `d642d3e` (lines 48, 52, 93, 791, 849); ModularCharactersAndBlocksPartII `765678c` (lines 870, 1017–1021, 1665–1675); LocalFiniteGroupTheory `0c409c9` (lines 77–95).
- Dependency check (`--movable --pr 2534`): `depcheck: 200 roadmaps, 2200 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. The roadmap is on main and consumes only Mathlib, Tau Ceti and roadmaps on main.
- Elaboration of `Suggested.lean`: exit 0, 15 warnings, all `declaration uses sorry`. A scratch copy with `#check @` for the nine new or changed declarations shows no lost binder. Each type matches its README statement, except `linearIndependent_brauerCharacter` (C01). No `set_option`, no sorry'd data, single `import Mathlib` plus `TauCeti.*` modules.
- Change outside the folder: only the family index (`TauCetiRoadmap/RepresentationTheory/README.md:134–140`), the parent index of this nested roadmap and part of this pull request.

Overlap check: read ModularCharactersAndBlocksPartII, GlaubermanZStar, SemisimpleAlgebras, LocalFiniteGroupTheory, ModularInduction, CharacterTheory, OddOrderTheorem and GL2AutomorphicRepresentationsAndTransfer. The objects shared and their owners:
- `π`-cores: owner OddOrderTheorem §1.1 (main). This roadmap now cites it; LocalFiniteGroupTheory (open draft) also plans them, and that is its own matter.
- Brauer character and projective pairing: two owners, this roadmap and GL2AutomorphicRepresentationsAndTransfer §R17.5.11 (R01).
- `blockCharacters`, `IsDefectGroup`, the defect and the Brauer correspondent: owner this roadmap. PartII cites them.
- Decomposition map: kept variant of ArithmeticGaloisDuality §R02.4.4, with the difference stated (unchanged from main).

Source independence: 94 passages compared (the 88 sampled locators and 6 further passages: the §2.1 definition and independence route, the §3.1 route, the §4.2 Osima route, the §6.2 `O`-form and the `blockCharacters` docstring) with 3 sources; none shared beyond forced formulas. Largest share `webb`, about 51 of 111 locators. Contents compared with `webb`: independent. Layers 5, 7.2–7.3 and 8 have no Webb chapter, Layer 2 joins Webb §9.3 with Ch. 10, and the order of Layers 4–7 is forced by the *Needs:* lines (blocks, then defect groups, then the main theorems).

Research link: Layers 4–7 (defect groups, generalized decomposition numbers, Brauer's three main theorems) are the block-theoretic base of Sambale's research monograph on block invariants (Sambale, LNM 2127, Ch. 1). §8.4 supplies GlaubermanZStar's route to Glauberman's `Z*` theorem (1966). This line rests on the README and on `sambale` Ch. 1.

## Not verifiable

- Navarro (`navarro`), Theorem 6.10, and Serre (`serre`), Part III §§15.2 and 16.1: settled as uncertified and cited by locator.
- Craven's Brauer-pair locators (§6.3) were outside the seeded sample and were not opened.
- The two AxiomMath/CFSG files named under References were not opened.

Automatic checks set aside as false positives: the TeX-syntax scanner flagged README lines 1015–1016 in the direct-products bullet of §6.2. There a single code span (`e_{B₁} ⊗ e_{B₂}`) runs across a line break; Markdown keeps it one code span, so the subscripts are inside code.

## Source issues

- **Error** in webb at §9.4, p. 148: the source says that if `F` contains a primitive `m`-th root of unity, `m` the exponent of `G`, then so does the residue field `k`; it should say only the `p'`-part of `m` (no primitive `m`-th root exists in characteristic `p` when `p ∣ m`); affects nothing.

## For the human reviewers

- Licence: `README.md:1610–1612` names two files of the public repository AxiomMath/CFSG as proof sources for §§7.2–7.3. The declarations of `Suggested.lean` were not compared with that repository, and its licence was not read.
- Licence: `martinez` (course notes, Firenze 2024) and `craven` (lecture notes, 2008) are unpublished notes read from their authors' pages; the published sources `webb` and `sambale` carry most locators.

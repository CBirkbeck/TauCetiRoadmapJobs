<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16826#issuecomment-6899716803 -->
Red team round 1 pass a (claude) of 07ba40c

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) two proof routes defer to the source, and three inputs are named by the source's numbering

   - **Location.** `packages/ModularCharactersAndBlocksPartII/README.md:851–853` ("Route: as in the
     source, from Lemma 2 and the orthogonality relations for `A × C`, with Lemma 3 (c) for the kernel
     statement"); `README.md:929` ("Route: as in the source, by induction on `|S|`"); `README.md:813–814`
     ("and Lemma 2 turns the norm identity into").
   - **Claim.** These routes name their inputs.
   - **Witness.** The README has no "Lemma 2" or "Lemma 3": they are glauberman line 266 and line 287,
     which the roadmap states as §3.1 and §1.2. A route "as in the source" names no target; the
     `*Needs:*` lines (§§1.2, 3.1, 3.2) already give the owners.
   - **Repair.**
     - `README.md:813–814`: replace "and Lemma 2 turns the norm identity into" by "and §3.1 turns the
       norm identity into".
     - `README.md:851–853`: replace the sentence by "Route: the description of the classes in the coset
       of `a` (§3.1) and the orthogonality relations for `A × C` (CharacterTheory §3.6) give (a) and
       the character in (b); the kernel statement uses the coset statement of §1.2."
     - `README.md:929`: replace "Route: as in the source, by induction on `|S|`" by "Route: induction
       on `|S|`" (the rest of the sentence already lists §§4.2, 3.4 (b), 2.2, 3.2).
     - Tested on the instance: after the edit every route input of §§3.2, 3.4, 4.3 is a section listed
       in that target's `*Needs:*` line.

2. **F02** (P3) two locators for Glauberman's Theorem 4 point at part (c)

   - **Location.** `README.md:926–927` ("(glauberman line 543, Theorem 4 (b), (c))") and
     `README.md:970` ("(glauberman line 543, Theorem 4, line 601, Corollaries 7–8").
   - **Claim.** Theorem 4, and its part (b), are at line 543.
   - **Witness.** glauberman line 537 is the head of Theorem 4, line 542 is part (b), line 543 is part
     (c). The README's own reference list (`README.md:1748`) says "Theorem 4 (line 537".
   - **Repair.** `README.md:926–927`: "(glauberman line 542, Theorem 4 (b), (c))". `README.md:970`:
     "(glauberman line 537, Theorem 4, line 601, Corollaries 7–8".

3. **F03** (P3) the title lower-cases a proper name and the part numeral

   - **Location.** `README.md:1` ("# Roadmap: modular characters and blocks, part ii — the glauberman
     correspondence and heights of characters").
   - **Claim.** The heading is the roadmap's title.
   - **Witness.** `Suggested.lean:9` has "Modular characters and blocks, Part II"; the sibling titles
     read "…, Part II" (AnalyticNumberTheoryPartII, InverseGaloisAndArithmeticFundamentalGroupsPartII)
     and keep proper names capitalised (FiniteGroupExtensionSplitting: "Gaschütz").
   - **Repair.** `README.md:1`: "# Roadmap: modular characters and blocks, Part II — the Glauberman
     correspondence and heights of characters".

Three P3 findings (R01–R03). No P1 or P2 finding survived verification: every Lean statement was
instantiated on the cases below and held, every cross-roadmap citation resolved at the cited head,
and every certified locator was read at its line.

## The pass: declarations of `Suggested.lean`

All 20 declarations carry their binders in their own signatures (no `variable` block); the
elaborated types in the worker's signature file were compared with the README statements, with no
difference. No Lean was run in this pass.

| Declaration (README §) | Instances tried, values on each side | Result |
|---|---|---|
| `invariantIrreducibleCharacters` (1.1) | `C₃` on `C₇`, `r ↦ r²`: only `1` invariant; `C₃` on `Q₈`: `{1, χ₂}`, 2; `S = 1`: all of `Irr(Γ)`. Convention `χ(s • g) = χ(g)` for all `s` equals the fixed set of `χ(s⁻¹ • g)` | holds |
| `existsUnique_canonicalExtension` (2.2) | `S = 1`: `ψ = χ`; `Γ = 1`: `ψ∘inl = 1` forces `ψ` linear, `det = ψ = 1` on `S`, so `ψ = 1`; `SL(2,3)`: `χ̂(a) = −1`, the twists have `det = λ² ≠ 1`. Uniqueness: `det(χ̂λ)|_S = λ^{χ(1)}`, `gcd(χ(1), |S|) = 1` | holds; no solvability needed |
| `canonicalExtension_values` (2.3) | `SL(2,3)`: values `2, −2, 0, −1, 1`; `χ̂ω` has `−ω`; `C₂` trivially on `C₃`: `ℚ(ζ₃)` both sides, `χ̂(s) = 1` | holds |
| `gallagher_bijOn` (2.4) | `N = G`: `{θ}` both sides; `N = 1`, `G = C₂`, `η = sgn`: permutation of `Irr(G)`; `Q₈` over `Z`, faithful `θ`: no `η` exists (1 against 4) | holds |
| `ncard_invariantIrreducibleCharacters` (4.4) | `SL(2,3)`: 2, 2, 2; `3^{1+2}` with the involution: 3, 3, 3; `C₇ ⋊ C₃` with inversion of `C₇`: 3, 3, 3; non-coprime `C₂` on `S₃`: 3 classes against 2 (excluded by `hcop`) | holds |
| `existsUnique_restrict_pairing_not_dvd` (4.5) | `S = 1` (a `p`-group for each `p`): `m = 1`; `SL(2,3)`: `[χ₂|_C, sgn] = 2 ≡ −1 (3)`, `[χ₂|_C, 1] = 0`; `3^{1+2}`, `p = 2`: `3 ≡ 1`; swap on `C₂ × C₂` (non-coprime): two candidates | holds |
| `IsGlaubermanFamily` (4.5) | `T = ⊥`: law says `π(Γ,1)χ = χ` invariant; `T = S`: needs `π(C,1) = id`, forced by the `p`-group law at the trivial group; `C₆`, `T = C₃`: both factors fixed. Universes: `C_Γ(T) : Type u`, `T, S⧸T : Type v` | determines the family on `Irr_S(Γ)` |
| `exists_isGlaubermanFamily`, `.apply_eq` (4.5) | `C₁₅` on `Q₈ × C₁₁`: both series give `sgn ↦ χ₂ × 1`; induction through `T` of prime index stays in `(u, v)` | holds |
| `.restrict_pairing_ne_zero`, `.adjoin_range_eq` (4.6) | `SL(2,3)`: `2 ≠ 0`, `ℚ = ℚ`; swap on `C₃ × C₃`: `(ψ_a × ψ_a)* = ψ_{2a}`, pairing 1, `ℚ(ζ₃)` both sides | holds |
| `.exists_sign_of_isCyclic` (4.5) | `SL(2,3)`: `χ̂(a) = −1`, `χ̂(−a) = 1`, `ε = −1`, `χ₂* = sgn`; `S = 1`: `a = 1`, `ε = 1`; `inr a` and `inl t` commute for `t ∈ C` | holds |
| `.index_mul_degree_eq` (5.1) | `SL(2,3)`: `4 · 1 = 2 · 2`; `3^{1+2}`: `9 · 1 = 3 · 3`; `θ = 1`, `C ≠ Γ`: `q = |Γ : C|` (reverse divisibility false) | holds |
| `IsBlockDefectGroup` (Conventions) | `S₃`, `p = 2`, `e = 1 + r + r²`: `⟨t⟩` yes, `1` fails maximality only; `e = r + r²`: `1`; `S₄`, `p = 3`, `χ₃`: reduced coefficients `0, 2, 1, 0, 1`, zero on `C_G(⟨(123)⟩)`, defect group `1` | holds |
| `blockCharacters` (Conventions) | `(1 + r + r²)/3` over `ℤ₂[ζ₃]`: `{1, sgn}`; `b = 1`: all; `b = 0`: `∅`; `ℤ₂[C₃]`, `(2 − r − r²)/3`: one character `2, −1, −1` | holds |
| `brauer_height` (6.2) | `p ∤ |G|`: `a = d = 0`; `S₃`, `p = 2`: degrees `1, 1` (`a − d = 0`), `2` (`a − d = 1`); `A₅`, `p = 2`: `1, 3, 3, 5`; `C₃` over `ℤ₂` (no `ζ`): degree 2 with `a − d = 0`, excluded by `hζ` | holds; `a − d` never truncates |
| `fongReynolds`, `existsUnique_fongReynolds` (7.4) | `S₃`, `N = C₃`, `p = 2`, `b = {λ}`: `T = C₃`, `{λ} ↦ {std}`, defect `1 ↦ 1`; `p = 3`: `T = S₃`, identity; `S₄`, `V₄`, `p = 3`: `T = D₈`, two blocks to the two degree-3 characters. Uniqueness from injectivity of `B ↦ B^G` | holds |
| `reynolds_heights` (8.3) | `SL(2,3)`, `p = 2`: `{0, 1}` both sides; `A₄`: `{0}`; `D × H`: `ν(ξ(1))`; `D = 1`: `{0}` | holds |
| `reynolds` (8.4) | `D₈`: height 1 occurs, nonabelian; `A₄`, `p = 2`: all 0, `V₄` abelian; defect zero: true ↔ true | holds |

## Verified sound

- **Declarations read:** 20 of 20 (4 definitions, 16 theorems); a single `import Mathlib` plus three
  `TauCeti.*` modules, each used and present at the pin; no `set_option`, no `lemma`, no sorry'd
  data, no `True` placeholder, no `#eval`. Padding probe: none follows from one tactic or one
  pinned lemma; neither pinned library has Gallagher's correspondence, a Glauberman correspondence,
  a defect group or a height.
- **Headlines:** the README's end theorems (`README.md:24–34`) are the 16 theorems; each is stated.
  The three cited-not-proved propositions (§5.2, §§9.1–9.2) are named in the module docstring.
- **Targets read:** 35 of 35 (§§1.1–9.2), with Conventions and the supplier contracts.
- **Checks tested:** every Check of §§1.1–9.2 and every Conventions witness recomputed (about 110
  bullets); none false, none vacuous. Each definition has at least three discriminating Checks.
- **Locators verified (certified sources):** glauberman 24, martinez 43, reynolds 8, sambale 6,
  hartley-turull 5, mnst 4, ruhstorfer 3, geck 2, spath-vallejo 2, kessar-malle 1; 98 in all, two
  wrong (R02).
- **Sibling citations checked:** ModularCharactersAndBlocks at its open head (Conventions and the 20
  cited sections exist; the 7 cited names exist; §6.2 states the Brauer-projection form over a
  splitting field, §7.2 the second main theorem at the system of §1.1, §8.2 covering for any normal
  subgroup); InverseGaloisAndArithmeticFundamentalGroups IG.3.4 *Conjugacy of coprime complements*
  (same hypotheses: coprime, `N` or `G/N` solvable, conjugate by an element of `N`);
  CharacterTheory §§2.1, 3.5, 3.6, 4.3, 4.4, 4.5 and `fieldOfValues_eq_map_fixedField_stabilizer`;
  InductionRestriction Layers 1, 2, 5, 7; FiniteGroupInvariants §6.2 (named as not owned).
- **Pinned names:** all 89 library names backticked in the README exist at the pins, in the files
  the README names where it names one.
- **Ownership:** no roadmap on main or open states the Glauberman correspondence, Gallagher's
  correspondence, heights, Fong–Reynolds or Reynolds' theorem. The base states domination for
  normal `p`-subgroups only (§8.1) and no height, Osima formula or Min–Max theorem.
- **Declared gap** `gap:clifford-multiplicity-dvd-index`: same slug in `design/plan.json` and at
  `README.md:501`; precise; not provided at the pins (`FDRep.clifford_restrict_dvd_finrank` gives
  `dim V ∣ dim W`, not the divisibility by the index) nor in InductionRestriction Layer 7.
- **Policy:** the pull request changes only the package folder; no pull-request number or process
  wording in the README or docstrings.
- **Dependency check:** `depcheck: 246 roadmaps, 2245 edges, 0 problem(s)`.

Source independence: 10 passages compared with 5 sources (glauberman, martinez, reynolds, mnst, ruhstorfer), none shared beyond formulas and standard names; largest share martinez, 40 of 101 locators; contents compared with martinez: independent (Layer 6 draws on Lectures 2–3, Layer 7 on Lectures 3, 4, 7, 8, 9, Layer 8 on Lectures 8–9). Layers 2–4 run in the order of glauberman §§2–4, which the `*Needs:*` lines force (Layer 3 needs §§2.2–2.4, Layer 4 needs §§3.2, 3.4); their scopes differ (Lemma 3 is in Layer 1, §4.5 is the roadmap's own, Theorem 5 (e) is in Layer 5). No table, figure or list is reused.

## Not verifiable

- The locators into `isaacs`, `isaacs-1973`, `navarro-1998`, `navarro-2018` and `feit` (15 in all):
  uncertified sources, cited by locator only. Several are chapter-level ("isaacs, Chapter 13",
  "navarro-2018, Chapter 2", "navarro-1998, Chapter 3", "feit, Chapter IV").
- The uniqueness formulation of §4.5 rests, among read sources, on spath-vallejo line 118 only
  (which asserts uniqueness without proof); the README's own route (induction through a normal
  subgroup of prime index) was checked by hand and is sound.
- Elaboration: no Lean was run; the comparison used the worker's elaborated signatures.
- Ownership against open pull requests was checked only for those whose files the brief lists.

## Source issues

- **Misprint** in martinez at §3.2, printed page 18 (line 725): the source says height zero characters are those whose degree `p`-part equals the numerical defect `d(B)`; it should be those whose degree `p`-part equals `p^{a−d(B)}`; affects nothing.

## For the human reviewers

- **Licence.** `martinez`, the source with the largest share (40 of 101 locators), is unpublished
  course notes read from the author's page (`sources.toml`, `licence_class = "author-page"`); the
  main results also carry refereed locators (reynolds, sambale).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "07ba40c1fc7bd6b5adf18fddce1342eaf2019a1b", "job": "RT-ModularCharactersAndBlocksPartII~1a", "model": "fable", "worker": "chris-x80"} -->

# Review of GrothendieckTeichmuller (pull request #1058 at 2742151)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 2742151. The folder is unchanged and stays settled. This round checks the pull request's title and description against the head: two of the description's sentences are contradicted by it.

## R01 (P3) — The description's sources sentence gives Ihara 1994 the wrong role

**Location:** Pull-request description, paragraph 3: "Sources: Drinfeld 1990, Ihara 1991 and 1994, Lochak–Schneps 1994, Schneps 1997 and Guillot 2014 for the definitions and theorems; Harbater–Schneps 2000, … for the scope".

**Claim:** The head cites Ihara 1994 only for an excluded statement, not for any definition or theorem of the roadmap. It also uses Harbater–Schneps 2000 as a source for a theorem (4.5), not only for the scope.

**Witness:** Ihara 1994's only citation is README:47, "The homomorphism `Gal(ℚ̄/ℚ) → GT̂` (Ihara 1994; …)", in a Scope sentence that ends "are not in this roadmap" (:53). README:631 gives "Harbater–Schneps 2000, §0" as a source of 4.5.

**Repair:** Replace the sentence with: "Sources: Drinfeld 1990, Ihara 1991, Lochak–Schneps 1994, Schneps 1997 and Guillot 2014 for the definitions and theorems, with Ribes–Zalesskii 2010 and Herfort–Ribes 1985 for centralizers in free profinite groups (0.1) and Harbater–Schneps 2000 for `GT̂` as a group of automorphisms of `F̂₂` (4.5); Ihara 1994, Belyi 1979, Harbater–Schneps 2000, Hoshi–Minamide–Mochizuki 2022, Bar-Natan 1998, Brown 2012 and 2014, Hatcher–Lochak–Schneps 2000 and Grothendieck 1984 for the scope; Grothendieck's Montpellier notes (folder 145) for a remark in 4.3; Lochak–Schneps 2006, Mel'nikov 1978 and Jarden–Lubotzky 1992 for the Research context." Every source in this sentence appears at the head in the role it is given: README :211–213, :631, :47–84, :605, :669–681.

## R02 (P3) — The description puts the pentagon relation (III) in Layer 3; the head defines it in Layer 2

**Location:** Pull-request description, paragraph 1: "Layer 2 the six generators `x_{ij}` of the pure braid group `P₄` and its profinite completion `P̂₄`; Layer 3 Drinfeld's relations (I), (II) and the pentagon (III), the monoid `GT̂^{mon}` and the groups `GT̂ ⊆ GT̂₀`".

**Claim:** Relation (III) is defined in Layer 2. Layer 3 defines (I) and (II), imposes (III) in `IsGT` and proves the five-term form of (III).

**Witness:** README:430–432: "### 2.4 Relation (III)" and "Define `RelIII f` as relation (III) of the Conventions". README:455: "### 3.1 Relations (I) and (II)". README:186–188: "Layer 2 gives the six generators … and relation (III)".

**Repair:** Replace the two clauses with: "Layer 2 the six generators `x_{ij}` of the pure braid group `P₄`, its profinite completion `P̂₄` and the pentagon relation (III) there; Layer 3 Drinfeld's relations (I) and (II), the monoid `GT̂^{mon}` cut out by (I)–(III), the groups `GT̂ ⊆ GT̂₀` and the five-term form of (III);". This matches §§2.4, 3.1, 3.3 and 3.5 at the head.

## Previous findings

- none: the review of 2742151 raised no finding. Its only bullet accounted for an earlier report's R01, which was repaired at 2742151 and has not changed since.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Title vs README:1 | title string | "the profinite Grothendieck–Teichmüller group" on both sides | holds | none |
| Para 1, "adds the roadmap" | `origin/main...HEAD` on the folder | Not on main. 1020 insertions, 0 deletions, 43 Lean declarations added, 0 removed | holds | none |
| Para 1, the five end theorems | README Summary :7–12; `Suggested.lean` | 3.3 `isUnit_iff_bijective_beta`, 3.4 `isGT0_iff`, 4.1 `GTHat.isGT0`, 4.2 `GTHat.injective_mk_betaEquiv`, 4.5 `GTHat.isClosedEmbedding_betaEquiv`: 5 of 5 stated | holds | none |
| Para 1, action `x ↦ x^λ`, `y ↦ f⁻¹ y^λ f`, and the composition law (the review the author asks for) | `(−1,1)·(1,x)` | Product `= (−1, β_{−1,1}(x)) = (−1, x⁻¹)`. `β_{−1,1}∘β_{1,x}`: `x ↦ x⁻¹`, `y ↦ x y⁻¹ x⁻¹`. `β_{−1,x⁻¹}`: `x ↦ x⁻¹`, `y ↦ x y⁻¹ x⁻¹` | holds; Lean `beta` :91 agrees | none |
| Para 1, layer of (III) | README §2.4, §3.1 | `RelIII` is defined at :432 (Layer 2); §3.1 covers (I) and (II) only | contradicted | R02 |
| Para 2, the three supplier citations | BelyiMaps on main and #1791; #850 head | §12.8 at main :4880 and #1791 :4080. §IG.1.2 at #850 :1026. §IG.5.1 at #850 :5424 | holds | none |
| Para 2, the Scope exclusions | README :47–74 | `Gal → GT̂`, `Out♯ₙ`, `Out(Πₙ)` :47–53. `GT(k)`, `GRT(k)` :58. Motivic :64–73. Positive genus :74 | holds | none |
| Para 3, the three Tau Ceti "bottom rungs" | pin 2fd255d9 | `zpowHat` `ZHat/Pow.lean:83`. `pureSubgroup` `Braid/Basic.lean:504`. `ContinuousOut` `ContinuousAut/Basic.lean:311` | holds | none |
| Para 3, "nothing is consumed from another roadmap" | README :179; depcheck | :179 says this verbatim. depcheck: 0 problems | holds | none |
| Para 3, the sources sentence | grep of each source in the README | Ihara 1994: 1 hit, :47 (Scope). Harbater–Schneps: :49 (Scope) and :631 (4.5 *Source*) | contradicted | R01 |
| Para 4, headline list "1.4, 2.2, 3.3, 3.4, 4.1, 4.2, 4.5" | docstring :26–36 | 7 sections, 8 theorems. 3.5 is named as not stated (:38) | holds | none |
| Para 4, real bodies; "χ is a README target only" | gate; grep | `sorry-data=0`. 0 Lean declarations named `chi` or `χ` | holds | none |
| Para 4, "only warnings are the 15 `sorry`s" | `lake env lean` | 15 theorems with `sorry` (:102–288). 15 warnings, all "declaration uses `sorry`". 0 errors | holds | none |
| Headline 3.3, cited in para 1, at `c = (−1, 1)` | `c` in `GT̂^{mon}` | `c·c = (1, β_c(1)) = (1, 1)`, so `c` is a unit. `β_c∘β_c` fixes `x` and `y`, so `β_c` is bijective. Both sides are true | consistent | none |
| Headline 4.2, cited in para 1, at `c` vs `1` | abelianization `ẑ²` | `β_c = −id`, `β_1 = id`, inner `= id` on `ẑ²`; `(1,0) ↦ (−1,0) ≠ (1,0)` (`−1 ≠ 1` in `ℤ₃`): classes differ | consistent | none |

The rows for statements this change leaves untouched stand as in the previous review, of 2742151.

- **Scope of the change.** The folder diff since 2742151 is empty. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Gate.** Rerun at this head: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's run adds `build=0`.
- **Dependency check.** Output: `depcheck: 245 roadmaps, 2206 edges, 0 problem(s)`. It has no UPWARD, CYCLE or moved line.
- **Elaboration.** `lake env lean` on `Suggested.lean`: exit 0, 15 `sorry` warnings, 0 errors. Pins: Tau Ceti 2fd255d9, Mathlib 1b1ccf4b.
- **Library declarations opened:** 5 at the Tau Ceti pin: `Pow.lean:83`, `Braid/Basic.lean:504` and `:528`, `ContinuousAut/Basic.lean:311`, `Congruence.lean:81`.
- **Cross-roadmap citations resolved:** the description has 3. The overlaps tool finds no dropped id, no id defined only by an open revision, and no other pull request that changes this roadmap.
- **Seeded sample.** It falls in no changed passage, because the folder is unchanged. Its rows stand as in the review of 2742151.
- Remark: the description also does not mention the five-term form of (III) (§3.5). This is an omission, not a contradiction; the R02 replacement covers it.

Overlap check: read ProfiniteArithmetic, ProfiniteProPGroups and PeripheralActions (main, `Completed/`), ProfiniteArithmetic (#775) and InverseGaloisAndArithmeticFundamentalGroups (#850). PeripheralActions :576 and :645 name the Grothendieck–Teichmüller relations but build none of them. BelyiMaps §12.8 owns the outer Galois action. ProfiniteArithmetic and Tau Ceti own `ẑ`, `x ^ᶻ a` and `ContinuousOut`. This roadmap alone owns `GT̂`, `Param`, `β` and relations (I)–(III).

Source independence: changed passages only, and there are none: 0 passages compared, since the folder is unchanged since 2742151. No layer was added, removed or reordered, so the arrangement was not compared again. Largest share of locators: Schneps 1997, 17 README lines.

## Not verifiable

- No new items. Mel'nikov 1978 (no legal copy) and the source-version limits recorded by earlier reviews still stand. They concern untouched text.

## Source issues

- none

## For the human reviewers

- README:605–606 cites Grothendieck's unpublished working notes (Montpellier archive, folder 145, p. 35, grothendieck.umontpellier.fr) for a remark in 4.3. No target rests on them.
- Not tested this round: wording and arrangement were compared on changed passages only, and there were none. Schneps 1997 holds the largest share of locators (17 README lines) and was not reopened.

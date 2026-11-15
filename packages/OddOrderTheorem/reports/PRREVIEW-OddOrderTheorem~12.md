# Review of OddOrderTheorem (pull request #1777 at f65b2b3)

**Verdict:** accepted

Incremental re-review of 0 changed lines since b3bd1fe. The folder is unchanged; this round read the pull request's title and description, rewritten since the previous review, against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "Suppliers: FiniteGroupInvariants (§0.2, §0.3, §2.1 …) and InverseGaloisAndArithmeticFundamentalGroups (IG.3.4 …; IG.4.3 …) are still open and merge first; CharacterTheory, InductionRestriction and FiniteGroupExtensionSplitting … are on main"; LocalFiniteGroupTheory is no longer named.
- R02 — repaired: "`Suggested.lean` states six headline theorems, each admitted with `sorry`", with the six names; the "five admitted targets" sentence is gone.
- R03 — repaired: "Its four definitions are `IsMinimalOddSimple`, the Dade data `DadeDatum`, the supported class functions `supportedClassFunctions` and the predicate `IsDadeExtension`"; coherence and `σ` primes are listed as not statable.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `appendixC_prime_le` (description: "whose signature fixes the finite-field action conventions") | `(p, q) = (3, 2)`, `(2, 3)`, `(5, 3)`, `p = q` | `(3,2)`: `8/2 = 4`, `gcd(4, 2) = 2`, `hcop` fails. `(2,3)`: `7/1 = 7`, `gcd(7,1) = 1`, `2 ≤ 3`. `(5,3)`: `124/4 = 31`, `gcd(31,4) = 1`, `5 ≤ 3` false: asserts no configuration. `p = q`: quotient `≡ p ≡ 1 (mod p − 1)`, `p ≤ p` | non-vacuous, consistent | none |
| `even_natCard_of_nonabelian_simple`, `isSolvable_of_odd_natCard` (description: "the three forms") | `C₃`, `A₅`, trivial group, `S₃` | `C₃`: simple, order 3, commutative, so hypothesis fails. `A₅`: order 60, even. Trivial group: order 1 odd, solvable. `S₃`: order 6, not odd, solvable anyway | correct | none |
| description "six headline theorems … four definitions" | elaboration and declarations of `Suggested.lean` | description: 6 and 4; file: `sorry` warnings at lines 52, 55, 59, 118, 128, 144 (6); definitions at lines 44, 71, 87, 105 (4) | agree | none |
| description "module docstring names … not statable" | docstring lines 19–28 | description: five-type theorem with supporting pair, type-I Frobenius, all-type-I exclusion, coherence (5.6), (6.3), (6.8), Thompson transitivity, proper-subgroup `p`-length; docstring: (8.8), (12.7), (12.17), (5.6), (6.3), (6.8), BG 7.6, BG 10.6 | agree | none |
| description "Suppliers" paragraph | README supplier headings (lines 160–206); main; open heads | description: FiniteGroupInvariants and InverseGaloisAndArithmeticFundamentalGroups open, three on main; README: the same five; FiniteGroupExtensionSplitting §2.4 and §3.1 on main, CharacterTheory and InductionRestriction on main under RepresentationTheory; the other two open, not on main | agree | none |

The rows for the untouched statements stand as in the previous review, of `b3bd1fe`.

- Gate (`gate … --base origin/main`): every counter `0`, `OK`, exit 0; the worker's run with the targeted build reports `build=0 OK`.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/OddOrderTheorem/Suggested.lean` exits 0; the six `sorry` warnings are the only output. The file is byte-identical to the one probed before (`#check @` comparison, one-tactic probe, headline audit), so those results stand.
- Folder diff since b3bd1fe: empty. Changes outside the folder against `origin/main`: none. Folder contents: `README.md`, `Suggested.lean`, `metadata.toml`.
- Cross-roadmap citations resolved this round (5): FiniteGroupInvariants §0.2, §0.3, §2.1 with `exists_mulEquiv_pi_of_isMinimalNormal` and `exists_isHallFor_of_isSolvable` at its open head (README lines 275, 298, 626); InverseGaloisAndArithmeticFundamentalGroups targets *Conjugacy of coprime complements*, *The Fitting subgroup*, *Fitting supplements for solvable groups* at its open head; FiniteGroupExtensionSplitting §2.4, §3.1 on main (lines 491, 619). The three leads of `citations.md` are a structure field and two supplier headings, as before.
- Description sentences checked against the head, all consistent: the title; the summary block (five types and supporting pairs, Appendix C, arbitrary universes, GlaubermanZStar and Bender–Suzuki consumers at README lines 1630–1638); the layer list (Layers 0–6); the §5.2–§5.5 endgame; Layer 2's independence (README lines 47–49); the exclusions (lines 91–93); "Adds the roadmap" (not on main: 58 headings, 10 declarations added, none removed); the depends-on block names the two open suppliers.
- Seeded sample and source locators: no sampled target lies in a changed passage (there is none); the README flags no locator as unverified.
- Overlap check: read LocalFiniteGroupTheory, GlaubermanZStar, FiniteGroupInvariants, ModularCharactersAndBlocks, CharacterTheory, FiniteGroupExtensionSplitting; nothing shared (GlaubermanZStar cites OddOrderTheorem F2 §2.4 as owner of the Dade isometry; no open pull request changes this roadmap or drops an id it cites).
- Source independence: changed passages only; 0 passages compared with 0 sources (the folder did not change); largest share and arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- Bender–Glauberman 1994 and Peterfalvi 2000: settled as `uncertified`; nothing in this round depends on their text.

## Source issues

- none

## For the human reviewers

- **Not tested.** The two books cited most (BenderGlauberman1994, Peterfalvi2000) are `uncertified`: no review compared the README's wording or arrangement with their printed text, only with the math-comp transcriptions (`MC-BG*`, `MC-PF*`).
- **Licence.** The README's References cite the `math-comp/odd-order` formalisation as a provenance source; whether its licence permits that use is a human's reading. The names in `Suggested.lean` differ from math-comp's.

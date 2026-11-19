# Review of ModularCharactersAndBlocks (pull request #2534 at 7a37125)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** accepted

**Summary.** Accepted, with no findings: this is an incremental re-review of the 32 lines changed since `c59fc36`. The new statement `blockCharacters_partition` is true as written (checked on `S₃`, on `C₃`, in residue characteristic `0` and for the zero-dimensional representation), agrees with its README bullet and with Martínez at the cited locators, and the corrected docstring reason for the spanning half is right. The title and description agree with this head. One format note is carried over, not blocking; the two licence questions for the human reviewers stand.

## N01 — The *Needs:* lines of §2.1 and §2.3 still point at each other

§2.3's line (README line 456) lists all of §2.1, while §2.1 lists §2.3 for linear independence over a field that is not algebraically closed. §2.3 uses only recognition over algebraically closed fields, which is imported; its line could say "recognition over algebraically closed fields (§2.1, from GL2AutomorphicRepresentationsAndTransfer §R17.5.11)".

## Previous findings

The previous report had no findings (R); its two small corrections and its format note are accounted for here.

- C01 — repaired: `blockCharacters_partition` (`Suggested.lean` line 279, README §4.2 line 728) states nonemptiness and exactly-one-block membership for `blockCharacters e_B`, so the definition's body is now tested.
- C02 — repaired: the module docstring (lines 34–37) now says the spanning half is "not stated separately" and follows from the count and linear independence "by counting dimensions".
- N01 — not repaired: §2.3's *Needs:* line (README line 456) still reads "§2.1; Mathlib `littleWedderburn`, …"; written again above as N01.

## Verified sound

| Row | Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- | --- |
| B01 | `blockCharacters_partition`, existence and uniqueness (martinez 2.1 p. 9; 2.11, 2.12(i) p. 15) | `S₃` over `ℤ₂[ζ₃]` | `(1+r+r²)/3` acts `1, 1, 0` on `1, sgn, std`; `(2−r−r²)/3` acts `0, 0, (2+1)/3 = 1`: each character in exactly one set | Pass | none |
| B02 | same, nonemptiness | `C₃` over `ℤ₂[ζ₃]`; `G = 1` | three blocks `e_j`, one character each; `G = 1`: one block `1`, set `{1}` | Pass | none |
| B03 | same, hypotheses admitted by the signature | residue characteristic `0` (`ℂ[[t]]`); `p ∤ |G|` | `|G|` a unit, every `e_χ ∈ O[G]`: blocks ↔ characters, sets are singletons | Pass | none |
| B04 | same, junk values | `n = 0`; `O` non-splitting (`ℤ₂`, `C₃`) | zero module not irreducible (`IsSimpleOrder` needs two subrepresentations), so no `b = 1` on it; `ℚ₂` has no primitive cube root: `hζ` excludes it | Pass | none |
| B05 | same, uniqueness in general | any `G` | `1 = ∑ ρ(e_B)`, each `ρ(e_B)` an idempotent scalar (`K` splits `G`), orthogonal: exactly one is `1`; equal characters in characteristic `0` give isomorphic `ρ` | Pass | none |
| B06 | module docstring, spanning half | count against independence | `#simples = #p`-regular classes `= dim` of class functions on `p`-regular elements; independent family of that size spans | Pass | none |

The rows for the untouched statements stand as in the previous review, of `c59fc36`.

- Source locators checked against the text: 3 (martinez lines 365–366, Definition 2.1, pdf 17 = p. 9; lines 648–654, Theorem 2.11, and 663–665, Theorem 2.12(i), pdf 23 = p. 15). They support the partition as stated.
- Library declarations opened at the pin: `Representation.IsIrreducible` (Mathlib `RepresentationTheory/Irreducible.lean:29`, `IsSimpleOrder (Subrepresentation ρ)`, which excludes the zero module).
- Cross-roadmap citations resolved: ModularCharactersAndBlocksPartII (open head) cites `blockCharacters` from §4.2 and declares no `blockCharacters_partition`; GlaubermanZStar (open head) cites §0.3 and writes `pPrimeCore 2 G` (its README lines 48, 93, 145, 360), as the description says. The name `blockCharacters_partition` occurs in no other roadmap folder of this checkout.
- Dependency check output: `depcheck: 200 roadmaps, 2201 edges, 0 problem(s)`. No upward citation, no cycle.
- Elaboration: `Suggested.lean` exits 0 with 16 warnings, all `declaration uses sorry`; a single `import Mathlib` plus seven `TauCeti.*` modules, no `set_option`. The new theorem carries all its binders in its own signature (read in the elaborated goal). On a scratch copy, `first | rfl | simp | infer_instance | exact?` does not close it.
- Automatic checks: all passed at this head. No change outside the folder against the base.
- Pull-request text: title and description read against this head. The seven added declarations (including `blockCharacters_partition`), the restated `pPrimeCore`, the added supplier OddOrderTheorem §1.1, the reordering of sections and the kept `M0`–`M8` mapping (README line 53) are all stated; GL2AutomorphicRepresentationsAndTransfer §R17.5.11 was already a supplier on main. Nothing to correct.

Overlap check: read ModularCharactersAndBlocksPartII and GlaubermanZStar (open) for the changed passage; ModularInduction, CharacterTheory, OddOrderTheorem (main) as in the previous review. Shared objects and owners unchanged: `π`-cores, OddOrderTheorem §1.1; the Brauer character over algebraically closed fields, GL2AutomorphicRepresentationsAndTransfer §R17.5.11; `blockCharacters`, `IsDefectGroup`, the defect and the Brauer correspondent, this roadmap. The new statement has no second owner.

Source independence: changed passages only; 3 passages compared with 1 source (the §4.2 bullet and the theorem docstring against martinez lines 365–366 and 648–665; the module docstring's spanning-half reason, which has no source), none shared; largest share webb, 52 of 107 locators, as in the previous review; the diff adds, removes or reorders no layer, so the contents were not compared again.

Research link: Layers 4–7 (blocks, defect groups, generalized decomposition numbers, Brauer's three main theorems) are the base of Sambale's monograph on block invariants (Sambale, LNM 2127, 2014, Ch. 1); §8.4 supplies GlaubermanZStar's route to Glauberman's `Z*` theorem. Rests on the README and on `sambale` Ch. 1.

## Not verifiable

- Navarro (`navarro`), Theorem 6.10, and Serre (`serre`), Part III §§15.2 and 16.1: settled as uncertified, cited by locator; untouched by this change.
- The shape of `Subgroup.pCore` in the open Mathlib pull request that §0.3 follows: not re-read this round.

## Source issues

- none

## For the human reviewers

- Licence: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:1650–1651` names two files of the public repository AxiomMath/CFSG as proof sources for §§7.2–7.3. `Suggested.lean` was not compared with that repository and its licence was not read.
- Licence: `martinez` (course notes, Firenze 2024) and `craven` (lecture notes, 2008) are unpublished notes on their authors' pages; the published `webb` and `sambale` carry 68 of the 107 locators.

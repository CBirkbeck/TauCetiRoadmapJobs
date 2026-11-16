# Review of ArithmeticKTheoryPartII (pull request #2433 at 9808b5b)

**Verdict:** needs changes

## R01 (P3) — §7.7 uses the Artin-class vanishing that the README now assigns to CyclotomicClassGroupsAndStickelberger §0.5, without citing it

**Location** `TauCetiRoadmap/ArithmeticKTheoryPartII/README.md` line 945 (§7.7 *Needs:*): "ClassFieldTheory Layers 11 and 13 (Frobenius normalization of the Artin map); IntegralIwasawaTheory §§3.1, 7.4." The route at line 935: "its Artin image under `TauCeti.ClassFieldTheory.hilbertClassArtinEquiv` is trivial and it splits completely in H_q".

**Claim** The previous R01 repair (iii) asked for CyclotomicClassGroupsAndStickelberger §0.5 in the *Needs:* lines of §7.3 and §7.7. §7.3 has it; §7.7 does not, although its route uses exactly the fact that line 15 now says §0.5 owns.

**Witness** README line 15: "CyclotomicClassGroupsAndStickelberger §0.5 owns the class-field facts of the prime of ℚ(ζ_(p^n)) above p: vanishing of its ideal and Artin classes". Line 945 names no such supplier; the Layer 7 Dependencies (line 953) do.

**Repair** In line 945 replace "ClassFieldTheory Layers 11 and 13 (Frobenius normalization of the Artin map); IntegralIwasawaTheory §§3.1, 7.4." by "ClassFieldTheory Layers 11 and 13 (Frobenius normalization of the Artin map); CyclotomicClassGroupsAndStickelberger §0.5 (vanishing of the Artin class of the prime above p); IntegralIwasawaTheory §§3.1, 7.4." Tested at q=37: §0.5 gives [P]=0, hence 37 primes above 37 in H₃₇, the torsor the route starts from.

## Previous findings

- R01 — partly repaired: the gap is gone from the README and `design/plan.json`; lines 15, 153, 159, 850, 858, 866, 953 cite IntegralIwasawaTheory §2.3 and CyclotomicClassGroupsAndStickelberger §0.5; the §7.7 *Needs:* line (945) was not extended (R01 above).

## Verified sound

| Statement | Instances | README side | Supplier / source side | Result |
|---|---|---|---|---|
| Contract, CyclotomicClassGroupsAndStickelberger §0.5 (line 159) | q=3; q=37; control ℚ(√−5), p=2 | q=3: A=0, both fields K₃. q=37: A=ℤ/37, [P]=0, A/⟨[P]⟩=A, P splits into 37 primes. Control: [𝔭₂]≠0, quotient 0≠ℤ/2 | §0.5 on main (README line 209): `P_r=(1−ζ_(p^r))`, ideal and Artin class vanish, split quotient has group `A_r`; its third Check is the same control | agrees |
| Contract, IntegralIwasawaTheory §2.3 and nesting (line 153) | q=37 → 37²; q=3 → 9 | H₃₇K₁₃₆₉/K₁₃₆₉ abelian, degree dividing 37, unramified (K totally complex, no real place), so inside H₁₃₆₉; H₃=K₃⊂H₉=K₉ | §2.3 on main (line 330): `unramifiedModule`, `unramifiedModule_classGroupLimit`, conjugation and norm compatibility; fields in one fixed closure (Conventions, line 20) | agrees |
| §7.3 route sentence (line 858) and D_q≅Gal(K_q/ℚ) | q=3; q=37 | q=3: G₃=D₃=C₂. q=37: decomposition group of a prime of H₃₇ above 37 meets A trivially (P split), order 36=[K₃₇:ℚ] | §0.5 split-at-p equivalence; FGV lines 2064–2072 (Lemma 7.12 uses a prime of ℘(q)^c) | holds |
| §7.2 *Needs:* (line 850), nested p-Hilbert fields | p=3, n=1,2 | class numbers of K₃, K₉ are 1: tower constant, Γ=Gal(K_∞/ℚ) at these levels | maximality in §2.3, as derived in line 153 | holds |
| R01: §7.7 route (line 935) | q=37 | uses [P]=0 ⇒ 37 primes, one c-fixed (A⁺=0) | owner named in line 15 is §0.5; line 945 omits it | citation missing |

Rows for the untouched statements stand as in the previous review, of `ab2c76b`.

- Cross-roadmap citations resolved for the changed text: CyclotomicClassGroupsAndStickelberger §0.5 and IntegralIwasawaTheory §2.3, both on main and both earlier in the merge order (positions 36 and 31); no mention of the retired gap remains in the README.
- Declared gaps: 12 slugs, identical in `design/plan.json` and the README; `cyclotomic-p-class-fields` is absent from both.
- Gate at 9808b5b: every check OK (the worker's run, and rerun). Dependency check: `depcheck: 252 roadmaps, 2396 edges, 0 problem(s)`. Nothing changed outside the folder.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ArithmeticKTheoryPartII/Suggested.lean` gives the 4 `sorry` warnings only; the file is unchanged since `ab2c76b`, so the signature comparison and the one-tactic probes of the previous review stand.
- Pull request text: title and description read against this head; no sentence is contradicted. The change adds one supplier, on main, which the description's supplier lists (open pull requests only) do not enumerate.
- Source locators: the changed passages add no source locator; the §7.3 sentence was read beside FGV lines 2040–2072.
- Seeded sample: none of the 15 sampled targets lies in a changed passage; they stand as checked at `ab2c76b`.

Overlap check: read ArithmeticKTheory, KTheoryFiniteLocalFields, BorelRegulators, StableHomotopyKTheoryPartII, GeneralAlgebraicKTheoryPartII (open), StableHomotopyKTheory, CyclotomicClassGroupsAndStickelberger, GeneralAlgebraicKTheory (main); third list empty. Shared objects and owners as in the previous review; the cyclotomic prime above p with its split-at-p equivalence is owned by CyclotomicClassGroupsAndStickelberger §0.5 and is now cited (one *Needs:* line outstanding, R01); the maximal unramified abelian p-extensions are owned by IntegralIwasawaTheory §2.3, cited.

Source independence: changed passages only; 4 passages compared with 1 source (FGV lines 2040–2072) and with the two cited supplier sections, none shared; largest share FGV, 96 of 108 locators; the diff adds, removes or reorders no layer, so the contents comparison of the previous review stands: independent.

## Not verifiable

- charney1987, §4 and Corollary 4.5 (§8.4): recorded as uncertified and not read; untouched by this change.

## Source issues

- none

## For the human reviewers

- none

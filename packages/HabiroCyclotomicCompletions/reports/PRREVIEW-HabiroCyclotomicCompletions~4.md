# Review of HabiroCyclotomicCompletions (pull request #1314 at 1def8f9)

**Verdict:** needs changes

## R01 (P3) — The stated library pins are older than the Tau Ceti API the README now cites

**Location:** TauCetiRoadmap/HabiroCyclotomicCompletions/README.md:143: "The library interfaces are Mathlib `6b7abb3` and Tau Ceti `a91d3aa`."
**Claim:** The merge of main moved the pins. Lines 168 and 174–177 now cite Tau Ceti declarations that do not exist at `a91d3aa`, so the README contradicts itself.
**Witness:** `lake-manifest.json` at this head pins mathlib `1b1ccf4b08` and TauCeti `2fd255d997`. At `a91d3aa`, `TauCeti/Algebra/Polynomial/Coeff/List.lean:61` defines `TauCeti.Polynomial.ofCoeffList`, and `ofCoeffList_reverse_concat` does not exist.
**Repair:** "The library interfaces are Mathlib `1b1ccf4` and Tau Ceti `2fd255d`."

## R02 (P3) — The division identities are credited to Mathlib's `Polynomial.ofCoeffList`

**Location:** TauCetiRoadmap/HabiroCyclotomicCompletions/README.md:849–851: "after applying `Polynomial.ofCoeffList` to the reversed list. The quotient/remainder identities of that supplier identify the finite monic decomposition"
**Claim:** After the rename, "that supplier" means Mathlib's `Polynomial.ofCoeffList`, which has no `/ₘ` or `%ₘ` identities. The table row at line 159 still lists `ofCoeffList` as Tau Ceti API.
**Witness:** `Mathlib/Algebra/Polynomial/CoeffList.lean` has no `modByMonic` or `divByMonic` lemma. The identities are in Tau Ceti, at `TauCeti/Algebra/Polynomial/Coeff/List.lean:376,390`.
**Repair:** At line 850, write "Tau Ceti's `TauCeti.Polynomial.ofCoeffList_reverse_divByMonicList` and `TauCeti.Polynomial.ofCoeffList_reverse_modByMonicList` identify the finite monic decomposition". In the line-159 cell, write "Descending coefficient lists read through Mathlib's `Polynomial.ofCoeffList` after reversal, `TauCeti.Polynomial.divModByMonicList`, and its monic quotient/remainder identities for the finite digit comparisons in §2.2". Both names resolve at the pin.

## Previous findings

- R01 — repaired: Suggested.lean:147 now has `[WithIdeal B] (hI : (WithIdeal.i : Ideal B) = Ideal.span {(p : B)})` and no `letI`. The `HasSum` elaborates with the topology of `WithIdeal.instUniformSpace`. The gate reports statement-hygiene 0.

## Verified sound

| Statement | Instances | Left side computed | Right side computed | Result |
| --- | --- | --- | --- | --- |
| `close_root_taylor_reexpansion` (changed signature) | B=ℤ₂, p=2, n=1, n′=2, ζ=1, ζ′=−1, x=q², M=1 | Σ_r C(j+r,j)c_{j+r}(−2)^r at j=0,1,2: 1−4+4=1; 2−4=−2; 1 | Taylor coefficients of q² at −1: (1,−2,1) | Equal; (−2)¹∈(2) |
| same, negative control | B=ℤ₃, p=3, ζ=1, ζ′=−1 | (−2)^M ∉ 3ℤ₃ for every M≥1 | `hclose` fails | The unit shift is excluded, matching the §3.3 Check |
| same, degenerate shift | ζ′=ζ, any B, M=1 | Only r=0 survives: c_j | Coefficient j at ζ′=ζ: c_j | Equal; 0¹∈(p) |
| same, p a unit | B=ℤ₂, p=3 | span{3}=⊤, so IsHausdorff ⊤ needs ⋂⊤ⁿ=0 | That forces B=0 | ℤ₂ is excluded; only the zero ring remains, where the statement is trivial |
| §2.2 list contract: first residual of 2−q | t=[−1]; l=[−1,2] and l=[0,0,−1,2] | `divModByMonicList`: quotient −1, remainder 1 in both cases | README: residual at index one is 1 = −(−1) | Agree; leading zeros give the same result |
| §2.2 next index | t=[0,−1], l=[1] | quotient 0, remainder 1 | README: residual at index two is 0 = −0 | Agree |
| §2.2 third digit of F² | t=[0,0,−1], l=[1,−1,−3,5] | quotient 1, remainder 6−3q−q² | README: normalized digit 6−3q−q²; the candidate differs by q³−1 | Agree |
| `ofCoeffList_reverse_concat` (README:174–175) | l, a arbitrary | Pinned type: `ofCoeffList (l ++ [a]).reverse = ofCoeffList l.reverse * X + C a` | README formula, word for word | Agree |
| Divisor of `divModByMonicList t l` (README:176–177) | t=[0,…,0,−1] of length n+1 | X^(n+1)+ofCoeffList [−1,0,…,0] = X^(n+1)−1 | README: divisor q^(n+1)−1 | Agree |
| Stated pins (R01) | README:143 against `lake-manifest.json` | Manifest: mathlib 1b1ccf4, TauCeti 2fd255d | README: 6b7abb3, a91d3aa | Mismatch |
| Supplier of the division identities (R02) | Mathlib `CoeffList.lean` against Tau Ceti `List.lean` | Mathlib: 0 `/ₘ` or `%ₘ` lemmas | Tau Ceti: lines 376 and 390 | Misattributed |

Rows for untouched statements stand as in the previous review, of `5ebc7e3`.

- Gate, rerun at 1def8f9: every count is 0 and the result is OK (the worker's run also has build=0). Elaboration with `lake env lean` gives the 17 `sorry` warnings and nothing else. The file imports only `import Mathlib`.
- Library at the new pins: `#check` resolves all 59 Mathlib and Tau Ceti names the README cites. The control `TauCeti.Polynomial.ofCoeffList` is unknown, so the rename was needed. Opened: AdicTopology.lean:237,245,251; AdicCompletion/Basic.lean:57; Mathlib CoeffList.lean:182; Tau Ceti List.lean:73,308,376,390.
- Signature: `#check @close_root_taylor_reexpansion` with explicit instances shows `IsAdicComplete (span {p})`, `[WithIdeal B]`, `hI` and the positive closeness exponent.
- Sources for §3.3, whose statement changed: reopened H line 250 (Prop. 3.1, p. 1132), H lines 450–464 (Lemma 5.1, pp. 1136–1137), G line 174 (eq. (7), p. 4) and G line 207 (eq. (9), p. 5). All four support the statement at a p-adically complete target. The other seeded targets lie outside the changed passages.
- Citations: HabiroRings README:942,953 and HabiroNumberFields README:15,666 cite §3.3 by section number, which the change leaves in place. Depcheck: `depcheck: 245 roadmaps, 2206 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Outside the folder: `git diff --stat origin/main...HEAD` outside the folder is empty. The outside-folder files in the change set come from the merge of main.
- Pull request text: checked the title, the summary block, the approach paragraph, the coefficient-list and adic-topology sentences, the dependency and validation claims, and the folder contents. None is contradicted at this head, and no change is left unstated.

Overlap check: read HabiroNumberFields (scope and §2.3) and HabiroRings (its citations of §3.3) at their heads. HabiroNahmSeries, HabiroCohomologyFoundations and HabiroCohomologyFoundationsPartII stand as in the previous review: none cites §2.2 or §3.3. The generic close-root re-expansion belongs to this roadmap. HabiroNumberFields §2.3 keeps only the arithmetic specialization. Nothing else is shared.

Source independence: changed passages only. Compared 4 passages (the Tau Ceti supplier bullet, the coefficient-list paragraph, the §2.2 list paragraph, the `close_root_taylor_reexpansion` signature) with 2 sources, H and G; they share no wording. The convention sentence at README:172–173 shares about 9 words with the pinned Apache-licensed Tau Ceti docstring (List.lean:22–24); the convention forces that wording. Largest share: H, 34 of 65 locators, unchanged by this diff. No layer was added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- H₀ (arXiv math/0209324v1), proof of Lemma 3.1, p. 7, cited by the changed §2.2 paragraph: the cache holds only the journal text of H. The change left this locator and its claim as they were, and the locator was not reopened.

## Source issues

- none

## For the human reviewers

- none

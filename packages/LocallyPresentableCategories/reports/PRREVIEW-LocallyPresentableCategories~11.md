# Review of LocallyPresentableCategories (pull request #1926 at 7c83474)

**Verdict:** needs changes

## R01 (P3) — Scope and Downstream consumers defer to HigherToposTheory, which no longer exists

**Location:** `README.md` line 83, "are HigherToposTheory's Layer F1 (§§F1.1, F1.3, F1.6)"; line 85, "and HigherToposTheory Layer L7"; line 986, "HigherToposTheory (Layer F1) consumes …". Description, *Scope*: "stay with HigherToposTheory (Layer F1)", "and HigherToposTheory (L7)".

**Claim:** These lines name a roadmap that is neither on main nor in an open pull request. The 1-categorical objects deferred there are now planned by ModelCategories. The ∞-categorical ones are planned by PresentableInfinityCategories and AccessibleInfinityCategories.

**Witness:** `roadmaps show HigherToposTheory` prints "no roadmap HigherToposTheory on main or in an open roadmap pull request"; its pull request closed on 2026-11-13. ModelCategories covers these objects in §1.2 (Lurie's four conditions), §§1.3–1.5, §5.1 and Layer 6.

**Repair:** Replace README lines 81–86 with:

```text
- *Lurie's form of presentability, weakly saturated classes, the small object argument in a
  presentable category, accessible subcategories and combinatorial model categories* are
  ModelCategories' (§1.2, §1.3, §§1.4–1.5, §5.1 and Layer 6).
- *Presentable and accessible ∞-categories* are EnhancedDerivedSheaves §E0.8 and Layer
  E5:presentability, PresentableInfinityCategories (Layer 1) and AccessibleInfinityCategories
  (§4.1); the ∞-categorical `Ind_κ` is BordismFormalGroups §F6.5. Nothing here is about
  ∞-categories.
```

Replace lines 986–987 with: "ModelCategories consumes Mathlib's `CategoryTheory.Presentable` directly; its statements about presentable categories use the carriers named here." In the description, replace the two HigherToposTheory sentences with: "Lurie's presentability, weakly saturated classes, the small object argument, accessible subcategories and combinatorial model categories stay with ModelCategories (§§1.2–1.5, §5.1, Layer 6). ∞-categorical presentability stays with EnhancedDerivedSheaves (§E0.8, Layer E5:presentability), PresentableInfinityCategories and AccessibleInfinityCategories, and the ∞-categorical `Ind_κ` with BordismFormalGroups §F6.5." Tested: with the README edits applied to a scratch copy, the dependency check reports `0 problem(s)`, and the copy no longer mentions HigherToposTheory.

## R02 (P3) — The Review paragraph points to a Theorem 1.66 citation the head no longer makes

**Location:** description, *Review*: "Theorem 1.46, Theorem 1.66 (in particular its left-adjoint half), Theorem 2.26, Corollary 2.47 and Definition 3.34 / Theorem 3.36 were not checked against the text."

**Claim:** The head cites Theorem 1.66 only for the right-adjoint half of 1.4. The left-adjoint half, `isLeftAdjoint_iff`, is cited to the special adjoint functor theorem.

**Witness:** README lines 330–332: "(Adámek–Rosický, Theorem 1.66); and `isLeftAdjoint_iff` … (the special adjoint functor theorem, `C` being co-wellpowered)". `Suggested.lean` docstrings, lines 126 and 132, cite them the same way.

**Repair:** Replace "Theorem 1.66 (in particular its left-adjoint half)" with "Theorem 1.66 (cited for the right-adjoint half of 1.4 only)".

## R03 (P3) — The Sources list leaves out four locators the head cites

**Location:** description, *Sources*: "Kelly, … TAC Reprints 10: Theorems 5.35, 6.5, 6.11 and 6.23, Propositions 6.13 and 6.21, Corollary 6.22." "Wilson, arXiv:1909.09333v1: Theorems 1.2 and 1.4." "Cited by locator only" names three works.

**Claim:** The list omits four locators the head cites:
- Kelly §3.5 (pp. 44–45), on which the 5.5 route rests;
- Kelly §6.3, p. 120;
- Wilson §1;
- Makkai–Paré 1989, ch. 5, a paywalled book.

**Witness:** README line 910, "(Kelly, §3.5, pp. 44–45, dualised)"; line 935, "(Kelly, §3.5)"; line 666, "(Kelly, §6.3, p. 120)"; line 537, "as recalled in Wilson 2020, §1"; line 1004, "(Makkai–Paré 1989, ch. 5; …)".

**Repair:** Replace the Kelly and Wilson bullets with "- Kelly, *Basic concepts of enriched category theory*, TAC Reprints 10: §3.5 (pp. 44–45), Theorems 5.35, 6.5, 6.11 and 6.23, Propositions 6.13 and 6.21, Corollary 6.22, and the definition on p. 120 (§6.3)." and "- Wilson, arXiv:1909.09333v1: §1, Theorems 1.2 and 1.4." Under "Cited by locator only", add "- Makkai–Paré 1989: ch. 5."

## Previous findings

- None. The review of `7c83474` accepted the folder and raised no finding. The R01–R04 it listed were the findings of the review of `9deea52`, and all were repaired.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.4 `isLeftAdjoint_iff` (R02) | `Type w ⥤ Type w`: `ℕ × −`; `X ↦ X × X`; constant `∅` | `ℕ × −` preserves colimits and is left adjoint to `(−)^ℕ`: both true. `(1⊔1)²` has 4 points, `1²⊔1²` has 2: both false. Colimits of `∅` are `∅`, right adjoint constant `1`: both true | sound | none |
| 1.4 `isRightAdjoint_iff` (R02) | `(−)^ℕ`; constant `∅`; constant `1` | `(−)^ℕ` preserves limits and is ℵ₁-accessible: both true. Empty limit `1 ↦ ∅`: both false. Constant `1` preserves limits, is accessible, left adjoint constant `∅`: both true | sound | none |
| 5.5 `generates_iff_essSurj`, Kelly §3.5 stages (R03) | `R = Type w`, `i = {2}`, `D = {Discrete (Fin 2), Discrete PEmpty}` | `I₀` = sizes `{2}`, `I₁ = {1,2,4}`, `I₂ = {1,2,4,8,16}`, `Iₙ = {2^k : k ≤ 2ⁿ}`, so `I_ω` = powers of 2 (Kelly's `I_ρ`, `ρ = ℵ₀`). Size 3 is missing: `Generates` false. Inclusion of the powers of 2 is full, product-closed and not essentially surjective: right side false | sound | none |

The rows for the other statements stand as in the previous review, of `7c83474`. The folder, `lake-manifest.json` and the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`) are unchanged.

- **Change and gate.** The folder changed by 0 lines, and `git diff --stat origin/main...HEAD` outside the folder is empty. The gate, rerun on `7c83474`, gives 0 on every check and `OK` (the worker's gate also gives `build=0`); `lake env lean` on `TauCetiRoadmap/LocallyPresentableCategories/Suggested.lean` exits 0 with 27 warnings, all `sorry`.
- **The description's elaboration claims, checked on a scratch copy.** With `autoImplicit false` the copy elaborates with no unknown identifier; each of the 27 theorems fails `first | rfl | infer_instance | simp` (27 errors); `#print axioms` on the 21 definitions shows no `sorryAx`. The 27 theorems, the pins, "the two restriction functors" (`restrict`, `restrictInverting`) and the three "Not stated" items match the head.
- **Dependency check.** `depcheck: 245 roadmaps, 2210 edges, 0 problem(s)`, the same before and after the R01 edit (an earlier run on the unedited README gave 2206 edges, before the open-PR index refreshed). The roadmap is line 412 of the merge-order candidate and is absent from the board's `merge-order/ORDER.txt`, as the description says.
- **Sources (locators checked: 36 listed plus 4 unlisted).** All 36 locators in the description's two lists occur in `README.md` or `Suggested.lean`; the 4 others are R03. Kelly, TAC Reprints 10, §3.5, pp. 44–45 was read: it builds the closure transfinitely, gives `= A_ρ` when every shape has fewer than `ρ` objects, and proves the closure small. This supports README 5.5, since fewer morphisms implies fewer objects.
- **Cross-roadmap citations resolved (8).** On main `9573ec4`: EnhancedDerivedSheaves §E0.8 (line 376) and E5:presentability (line 174), BordismFormalGroups §F6.5 (line 1526). ClassifyingTopoi at `0e6bf1d` consumes 1.5 (its 3.5 and the Examples of Layer 3) and 3.1 and 3.5 (Examples) at lines 283–285 and 1208, matching Downstream consumers. GrothendieckTopoi at `6b3158d` is unchanged. HigherToposTheory is absent (R01).
- **Overlap check:** read ModelCategories (`ac5fe3a`), PresentableInfinityCategories, AccessibleInfinityCategories and PresheavesAndCompletions (`7e04598`), ClassifyingTopoi (`0e6bf1d`), ToposTheoreticBridges (`1c43589`) and OrthogonalFactorization (`d6490d0`, unchanged); nothing shared. ModelCategories §1.2.1 (Lurie's characterisation of `IsLocallyPresentable`) and §5.1 (accessible subcategories of a presentable category) are not targets here; the three ∞-categorical Parts use 1-categorical presentability in Checks only; ToposTheoreticBridges uses Mathlib's `IsIdempotentComplete`, does not restate 1.7 and is not a consumer. `overlaps.md` lists no dropped id and no revision-only id.
- **Source independence:** changed passages only, as the folder changed by 0 lines. One passage compared, README 5.5 lines 905–910 against Kelly, TAC Reprints 10, §3.5, pp. 44–45: at most 3 consecutive words shared ("the repletion of"). Largest share Kelly (TAC Reprints 10), 40 of 106 locator tokens. The arrangement was not compared again, since no layer was added, removed or reordered.

## Not verifiable

- Adámek–Rosický 1994: Theorems 1.46, 1.66, 2.26, Corollary 2.47, Definition 3.34 and Theorem 3.36, which the description lists as unchecked. The book is paywalled and not in the sources cache.
- Makkai–Paré 1989, ch. 5 (R03): AMS Contemp. Math. 104 is paywalled and not in the cache.
- Gabriel–Ulmer 1971, Satz 7.13, and Adámek–Borceux–Lack–Rosický 2002, Theorems 2.4 and 5.5: paywalled, not re-fetched, as in the previous reviews.

## Source issues

- none

## For the human reviewers

- Not tested: Adámek–Rosický 1994 (paywalled, unread) carries 22 of 106 locator tokens, the second-largest share after Kelly's 40. Its theorem numbers in 1.1–1.5, 2.1, 3.2 and 3.5 rest on the author's citation, and the description asks a reader of the book to check them.

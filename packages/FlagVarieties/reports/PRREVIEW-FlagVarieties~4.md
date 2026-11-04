# Review of FlagVarieties (pull request #1762 at 77cc723)

**Verdict:** accepted

🤖 Independent AI review (incremental re-review of 52 changed lines since 997db0b). Two findings, both P3, none blocking. All four findings of the previous review are repaired, the gate passes, the dependency check is clean, `Suggested.lean` elaborates under the renamed namespace with only its two `sorry` warnings, and every changed statement was recomputed on its instance (table below). The two notes are a `*Needs:*` item that the §2.1 route no longer uses and a docstring name that exists nowhere.

## R01 (P3) — §2.1's `*Needs:*` line still lists Chevalley constructibility, which the route now consumes from the supplier

**Location:** `TauCetiRoadmap/FlagVarieties/README.md:153` ("*Needs:* ReductiveGroups 7/7b Bruhat and root-cell inputs, Chevalley constructibility, 0.1."), against `:147` ("This is the theorem supplied by `gap:standard-parabolic-scheme`; its proof uses constructibility of the finite Bruhat-cell union").

**Claim:** The target's statement and route need Chevalley constructibility.

**Witness:** After the repair, §2.1 consumes `P_J(k) = B(k) W_J B(k)` as the supplier's theorem (line 147) and proves nothing by constructibility itself; the closedness argument that used it was deleted from this head (the change set removes the "constructible subgroup … therefore closed" paragraph). A `*Needs:*` line lists what the statement and the route need; this item now belongs to the supplier's proof and blocks an implementer behind an unrelated input.

**Repair:** Line 153: "*Needs:* `gap:standard-parabolic-scheme`, ReductiveGroups 7/7b Bruhat and root-cell inputs, 0.1." (The Layer 2 Dependencies line already reads this way.)

## R02 (P3) — The module docstring names `standardParabolicOrderIso`, a declaration that exists nowhere

**Location:** `TauCetiRoadmap/FlagVarieties/Suggested.lean:17` ("the actual reductive-group `TitsSystem` and its `standardParabolicOrderIso`/scheme bridge").

**Claim:** The missing carrier for headline 1 is a declaration of this name.

**Witness:** `standardParabolicOrderIso` and `standardParabolic` occur nowhere in the pinned Tau Ceti `358314d4` (grep of `TauCeti/`), nowhere in the README, and the gap that owns the statement (`gap:tits-standard-parabolic`, README line 63) describes it as "the subgroups containing `B` are exactly the `B W_J B`, for a unique `J`" without a name. The docstring should say which carrier is missing, not invent its name.

**Repair:** Line 17: "the actual reductive-group `TitsSystem` on `G(k)`, the `B W_J B` classification of subgroups containing `B`, and the scheme bridge `P_J`."

## Previous findings

- R01 — repaired: line 7 "order isomorphism from subsets of S to smooth closed subgroup schemes of G containing B; in characteristic zero, to all closed subgroup schemes"; §2.2 lines 157–159 "any smooth closed subgroup `Q` … `Set S ≃o {Q : smooth closed subgroup scheme of G | B ⊆ Q}`" with `eq_of_quotientPointsSubgroup_eq` invoked on two reduced quotients; the `F⁻¹(B)` negative control is in §2.1's Checks (line 151).
- R02 — repaired: line 179 "Conjugate them inside `P_K` by `gap:borel-conjugacy-connected`"; line 145 `P_J(k) = B(k) W_J B(k)` attributed to `gap:standard-parabolic-scheme` (line 147); line 189 cites the §3.1 bridge and Milne Cor. 17.49; lines 53 and 85 cite `CharZero.lean:148` (the theorem is at line 148 at the pin, re-read).
- R03 — repaired: `gap:parabolic-pointwise-normalizer` is gone from the contracts table (line 47), the gap list (lines 57–75), §3.2's `*Needs:*` (line 191) and the Layer 3 Dependencies (line 199); §3.2 derives self-normalization from the §3.1 bridge with `K = J`; §2.1 names the supplier as the single owner of `P_J(k) = B(k) W_J B(k)` (residue: R01 above).
- R04 — repaired: line 21 names `conjugate_eq_of_borel_le`; §1.1 has a three-item `**Checks.**` list (line 123); §0.1's Checks has three items (line 87); "How to read the build" (line 79) describes Layers 0–6; `## References` (line 286); "cited by locator only (uncertified)" (line 301); docstring title "Flag varieties: target signatures" (Lean line 10); namespace `TauCetiRoadmap.FlagVarieties` (Lean line 36).

## Verified sound

**What was read.** The whole README (302 lines) and `Suggested.lean` (68 lines) at 77cc723f; the change set (24 insertions, 28 deletions, two files, nothing outside the folder); the worker's gate, citations and signature files; the previous report. Pins: Tau Ceti `358314d4`, Mathlib `f6090c70` from the worktree's `lake-manifest.json`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FlagVarieties'` is empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml`. The changed passages contain no LaTeX delimiters, process words, pull-request numbers, `set_option`, sorry'd data, `lemma`, algorithms or copied passages (the new §3.2 sentence and the Checks are the author's words; compared with Milne lines 15075–15084).

**Gate and dependency check.** Worker's gate at 77cc723: every counter 0, `OK`. The dependency check run as instructed (`--movable`, candidate order, main content) printed exactly

```text
depcheck: 204 roadmaps, 1657 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. FlagVarieties is at position 104 of the candidate order, directly after ShimuraData (103). The diff adds no supplier citation; the suppliers it touches resolve as in the previous report (ReductiveGroups 7/7b on main, ShimuraData §3.8 at its open head), and the one `roadmaps resolve` lead (`HopfIdeal.IsParabolicOverAlgClosed`, README line 31) is the declared `gap:parabolic-predicate` (line 67), not a phantom.

**Declared gaps.** Ten after the repair (the redundant eleventh is removed), each one sentence with hypotheses under `### From TauCetiRoadmap.ReductiveGroups`, unchanged in wording from the previous report's check except for the deletion. The brief records no readable `design/plan.json`, so the `gaps` list the intake reads could not be compared; as before, this is the board's to add at intake.

**Elaboration and signatures.** `lake env lean TauCetiRoadmap/FlagVarieties/Suggested.lean` from the worktree: exit 0, two warnings (`sorry` at lines 49 and 59), 3.8 s; `open CategoryTheory TauCeti` and the renamed namespace resolve every name. A scratch copy with `#check @name` for all three declarations elaborated; the three types are identical to the previous report's (`standardWeight : {n} → Set (Fin n) → Fin (n+1) → ℤ`; `exists_unique_standardWeight_eq` with `[Field k] [IsAlgClosed k]`, `I ≤ definingHopfIdeal k (n+1)`, `[IsReduced …]`, `∃! J : Finset (Fin n)`; `conjugate_eq_of_borel_le` with `[IsAlgClosed k]`, geometric connectedness, `IsBorelOverAlgClosed`, `P ≤ B`, `Q ≤ B`, `Q = P.conjugate g`), and each matches its README statement (lines 119, 21). One-tactic probe on scratch copies: `simp` makes no progress on either sorried theorem; `simp_all` leaves the GL goal unchanged and `exact (HopfIdeal.conjugate_one P).symm ▸ hconj.symm` is a type mismatch on the Borel theorem; no padding. The `standardWeight` values `(0,−1,−2)`, `(0,0,−1)`, `(0,−1,−1)`, `(0,0,0)` at `n = 2` and `(0)` at `n = 0` elaborated (`ext i; fin_cases i <;> simp <;> decide`). No Lean process left running. `roadmaps grep --lean-only` finds `namespace TauCetiRoadmap.FlagVarieties` only in this pull request.

**Pinned declarations opened** (Tau Ceti `358314d4`): `smoothCommHopfAlgProperty_of_charZero` `Smooth/CharZero.lean:148` (`[CharZero k]`, `[Algebra.FiniteType k H]`); `exists_conjugate_eq_of_isBorelOverAlgClosed` `Borel/Conjugation.lean:161` (with `hcontain`, as `gap:borel-conjugacy-connected` says); `eq_of_quotientPointsSubgroup_eq` `HopfIdeal/Points/Separation.lean:84` (finite type and reduced on both quotients); `UpperTriangular.weights` `UpperTriangular/Basic.lean:66` (`n − 1 − i`) and `definingHopfIdeal` `:112` (the weight ideal of `weights`); `weightParabolicRelationSet` `Weight/Parabolic/Basic.lean:54` (`X_ij` with `w i < w j`) and `weightParabolicDefiningHopfIdeal` `:143`. No `standardParabolic*` at the pin (R02).

**Source audit of the changed locators.** Milne, *Algebraic Groups* (2017), cache id 503f1a7d, printed page = marker page − 12. Corollary 17.49 at lines 15075–15084 (marker 379, printed 367): "`P` a subgroup variety containing a Borel ⇒ `P` connected and `P = N_G(P)`", proof by conjugating `B` and `xBx⁻¹` inside `P` and the normalizer theorem 17.48 (line 15049), which is the §3.2 route verbatim in structure; the smoothness hypothesis is `P_J`'s (supplied smooth by `gap:standard-parabolic-scheme`). Theorem 21.91 at lines 18691–18701 (printed 453–454): "every parabolic subgroup `P` of `G` containing `B`", a parabolic being a subgroup variety, which is now the README's generality (smooth). The seeded sample's other locators are unchanged since the previous report and were not re-read. Humphreys and Bourbaki: Not verifiable, as before.

**Adversarial values.** Rows A–H are new for the changed statements; finite computations are a fresh enumeration of `GL₃(𝔽₂)` (168 elements) with `P_J` the block upper triangular group of `standardWeight J`. Rows 01–25 of the previous report (PRREVIEW-FlagVarieties~3) cover the untouched statements and are carried forward unchanged.

| Statement | Instances tried | Values on each side | Result / change |
| --- | --- | --- | --- |
| A. Headline 1 with smoothness (7) | `SL₂`, char `p`: `B`, `G`, `F⁻¹(B)`; char 0 | smooth subgroups `⊇ B`: `{B, G}` vs `{∅, S}` (2 = 2); `F⁻¹(B)` has ideal `(c^p) ⊊ (c)`, `c` nilpotent, excluded; char 0: Cartier makes every closed subgroup smooth, so "all" is right | correct both clauses |
| B. §0.1 Checks (87) | `GL₃(𝔽₂)`; `μ_p` vs `1`; `F⁻¹(B)` | `|B| = 8`, `|P_{s₁}| = 24`, `B ⊆ P_{s₁}` true, `8 ∣ 24`; `μ_p(k̄) = 1 = 1(k̄)`, lengths `p` vs 1; `F⁻¹(B)(k) = B(k)`, ideals differ | three discriminating Checks |
| C. §1.1 Checks (123) | `standardWeight ∅` vs `weights 3`; `n = 0`; four `J` | forbidden sets of `(0,−1,−2)` and `(2,1,0)` both `{(1,0),(2,0),(2,1)}`; `n = 0`: `Fin 1 → ℤ`, value `0`; adjacent forbidden entries `∅ ↦ {(1,0),(2,1)}`, `{0} ↦ {(2,1)}`, `{1} ↦ {(1,0)}`, `S ↦ ∅`, pairwise distinct | all three true |
| D. §2.1 `P_J(k) = B(k) W_J B(k)` and control (145, 151) | four `J` on `𝔽₂`; `F⁻¹(B)` | `|P_J| = 8, 24, 24, 168`; `|W_J| = 1, 2, 2, 6`; `F⁻¹(B) ⊇ B` with `(c^p) ⊆ (c)`, same points, nonreduced | supplier equality and negative control consistent |
| E. §2.2 order isomorphism (157–159) | `GL₃(𝔽₂)` poset; `SL₂` char `p` | four smooth `Q ⊇ B` ↔ four subsets, `8 < 24, 24 < 168`, `A ⊄ C`; both quotients reduced (smooth) so `Separation.lean:84` applies; `F⁻¹(B)` excluded | no false member |
| F. §3.2 from the §3.1 bridge (189) | every `g ∈ GL₃(𝔽₂)` normalizing `P_J`, four `J` | for each such `g` some `p ∈ P_J` has `pg ∈ N(B)`; `|N(B)| = 8 = |B|`; `|N(P_J)| = 8, 24, 24, 168 = |P_J|` | derivation holds on every instance; matches Milne 17.49 |
| G. §3.1 bridge with the gap (179) | `K = J` (row F); `J ≠ K` | `gP_Jg⁻¹ = P_K` forces `pg ∈ B(k)`, so `P_K = (pg)P_J(pg)⁻¹ = P_J` and `J = K` by row E's injectivity | uniqueness of type sound |
| H. Lean rename (34, 36) | elaboration; `#check` of three names | exit 0, two `sorry` warnings; types identical to r3 | no binder lost |
| 01–25 | as in PRREVIEW-FlagVarieties~3 | as recorded there | carried forward; statements untouched |

**Headline inventory** (unchanged from the previous report): headline 1 in `GL_{n+1}` form (`exists_unique_standardWeight_eq`), the uniqueness half of headline 2 (`conjugate_eq_of_borel_le`), headlines 3–5 and the general form of 1 named in the docstring as not statable (no parabolic predicate, no `P_J`, no represented quotient at the pin), which I confirmed by grep at the pin.

## Not verifiable

- **Humphreys, *Linear Algebraic Groups*:** paywalled; not in the sources cache. Cited by locator alone (uncertified), as the README now states.
- **Bourbaki, *Lie*, Ch. IV §2.5 Theorem 3** (in `gap:tits-standard-parabolic`): paywalled; not in the cache. Cited by locator alone.
- **`plan.json`:** no design or package on the board, so the `gaps` list the intake reads could not be compared with the README's ten slugs.
- Ownership against open pull requests was checked only through the roadmap service's index of 2026-11-04 (namespace and `standardWeight` grep); the full ownership pass is the previous report's.

## Source issues

- none new (the two Milne misprints at Proposition 7.15 and Corollary 17.49 are recorded in PRREVIEW-FlagVarieties~3; the 17.49 citation of 17.10 for Borel conjugacy, line 15083, is unchanged and does not affect the README's route, which cites 17.9(b)).

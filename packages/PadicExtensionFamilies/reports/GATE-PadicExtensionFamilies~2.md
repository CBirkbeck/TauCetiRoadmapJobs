# GATE-PadicExtensionFamilies~2: answers to human review

One comment (0stellensatz, 2026-11-04T12:11:25Z). It asks for confirmation of the move of §0.6 to the new roadmap EtaleMassFormula, lists four edits, and says that EtaleMassFormula then has to merge first. The previous answer (GATE~1, H01) made the move conditional on two things: the new roadmap being open as a new-folder pull request, and three properties of its text. Both now hold, so the edits are applied in commit `25a7dd42`. The comment addresses the author, and the decision to merge stays with the author.

Conditions from GATE~1, checked against EtaleMassFormula at its open head `01e6554` (read with `roadmaps show EtaleMassFormula`):
- **Weighted form.** Its §1.2 states the identity in `ℝ≥0∞` "with each class weighted by any function of its K-isomorphism class". Its §2.2 derives `d(L/K) = f · d(L/K_f)` from the tower law.
- **Bijection and automorphism count are targets.** §1.1 is the class–orbit bijection, inseparable classes included. §1.2 gives `#Aut_K(L) = #Aut_{K_f}(L) · #Stab([L])` and the orbit size `f/#Stab([L])`.
- **No citation back into this roadmap.** Its Checks restate `7`, `10` and `14` without citing 6.7 or 5.3. Its *Needs* lines cite only LocalFieldsRamification, MassFormula and Mathlib. PadicExtensionFamilies appears only in its "does not own" list.

It is a new-folder pull request by another author, so this roadmap may consume it.

## H01 (0stellensatz) — applied differently

§0.6 (old README lines 458–499: the classification, the automorphism count, the identity and four Checks) is **deleted**, not turned into a citation stub. The house rule is that a target owned elsewhere is deleted and listed under Scope. Its content now lives in three places:
- the notation `K_f`, `𝒯(K_f, n/f)`, the transport action and `Stab([L])` became Convention 13, "as in EtaleMassFormula §1.1";
- the "Owned here" Layer 0 bullet no longer claims the classification;
- "Consumed, not redefined" gained a paragraph citing EtaleMassFormula §1.1 (bijection), §1.2 (automorphism count and weighted identity) and §1.3 (subfield form).

Uses elsewhere in the README that pointed at §0.6:
- **Layer 0 Examples:** now cites EtaleMassFormula §1.1 for `14 → 10` orbits.
- **6.8 Check:** "the `14` classes of 0.6's check" became a self-contained count (`16` square classes less the trivial class and the unramified one).
- **Explicit scope exclusions:** the bullet now names Étale mass formula as the owner.

`Suggested.lean` declared nothing for §0.6 and is unchanged.

## H02 (0stellensatz) — applied differently

The *Needs* lines of 6.3, 6.5 and 6.7 now cite the section of EtaleMassFormula that each one actually uses, instead of §1.2 for all three:
- **6.3** `0.6` → `EtaleMassFormula §1.1`. It uses the class–orbit bijection, and the prose became "the restriction of the class–orbit bijection of EtaleMassFormula §1.1".
- **6.5** `0.6` → `EtaleMassFormula §1.2`. It uses the orbit size `f/#Stab` to get `f B(L/K_f)/#Aut(L/K)`, and the prose "by §0.6" became "by the automorphism count and orbit size of EtaleMassFormula §1.2".
- **6.7** `§0.6` → `EtaleMassFormula §§1.1–1.2`. Monge's count `N_K(e, f)` counts `K`-classes as orbits, which needs both the bijection and the stabilizer count.

## H03 (0stellensatz) — applied

The "Not owned here" bullet that read "the étale generalization is not specified anywhere" (false once EtaleMassFormula exists) is split in two:
- Serre's formula, the Eisenstein region and Haar measure stay with Mass formula;
- a new bullet links [Étale mass formula](../EtaleMassFormula/README.md), Layers 1–3, for the étale (Bhargava) mass formula and for the classification by unramified part with its automorphism count.

## H04 (0stellensatz) — applied

The roadmap suppliers list in "Exact supplier contracts" has a list, not a table, so the new entry is a bullet: "Étale mass formula, Layer 1". It states what is assumed of each section:
- the bijection onto `𝒯(K_f, n/f)/Gal(K_f/K)`, inseparable extensions included (§1.1);
- `#Aut_K(L) = #Aut_{K_f}(L) · #Stab([L])`, the orbit size `f/#Stab([L])`, and the weighted identity in `ℝ≥0∞` for every weight invariant under `K`-isomorphism (§1.2);
- the subfield form (§1.3).

It names its consumers, 6.3, 6.5 and 6.7.

## H05 (0stellensatz) — answered

Yes, EtaleMassFormula must now merge before this roadmap.
- **No cycle.** Its suppliers (MassFormula, LocalFieldsRamification Layer 2, Tau Ceti `Unramified/Factorization.lean`, Mathlib) are all on main or at the pins. It cites nothing from this roadmap, so the new edge points downward.
- **Not yet in the merge order.** EtaleMassFormula is not in `ORDER.txt`, where this roadmap is line 374. At intake it must be placed above PadicExtensionFamilies.
- **Depcheck did not flag it.** It reported no problem for the new edge (output below). That looks like it does not see that roadmap yet, so it should not be read as a check of the ordering.
- **If the author keeps §0.6 here instead**, revert commit `25a7dd42`, and #1792 must then cite this roadmap's §0.6.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Weighted identity as stated in the new supplier bullet, `w = 1` | `K = ℚ_2`, `n = 4`, `f = 2` | RHS `(1/2)·14·(1/2) = 7/2`; LHS: 6 fixed classes, `#Aut_K = 2·2`, give `6/4`; 4 moved orbits, `#Aut_K = 2·1`, give `4/2`; `3/2 + 2 = 7/2` | holds | none |
| same, `w = q^{-v_K(disc)}` (`K`-invariant) | `K = ℚ_2`, `n = 2`, `f = 1` | 2 classes with `d = 2` and 4 with `d = 3`, all with `#Aut = 2`: `2·(1/2)·2^{-2} + 4·(1/2)·2^{-3} = 1/2`; with `f = 1` the two sides are literally equal | holds | none |
| Orbit size `f/#Stab` (bullet; 6.5 prose) | `ℚ_2(ζ_12) = ℚ_4(√−1)`; `ℚ_2(∜−3)` | `2/2 = 1` class; `2/1 = 2` classes; `#Aut_{ℚ_2} = 4 = 2·2` and `2 = 1·2` | holds | none |
| Layer 0 Examples: `14` relative classes form `10` orbits, equal to `N_2(2,2)` of 6.7 | `ℚ_4`, Frobenius `√−3 ↦ −√−3` | `6` fixed classes plus `8/2 = 4` pairs give `10`; 6.7 lists `N_2(2,2) = 10`; degree total `48 + 10 + 1 = 59` matches 6.7's `59` | holds | rewritten |
| 6.8 Check: `14` ramified quadratic classes of `ℚ_4` | `ℚ_4^×/ℚ_4^×²` | order `2^{2+[ℚ_4:ℚ_2]} = 16`; minus trivial and unramified gives `14`; Krasner counts `6 + 8` at `j = 1, 2`, mass `6/(2·4) + 8/(2·16) = 3/4 + 1/4 = 1` | holds | rewritten |
| Convention 13 action `τ·[L]` | `f = 1` (trivial group); `f = 2` with the moved class `ℚ_4(√(√−3))` | `f = 1`: the action is trivial and the orbit set is `𝒯(K, n)`; `f = 2`: `τ` sends it to `ℚ_4(√(−√−3))`, a different `ℚ_4`-class, the same `ℚ_2`-class | consistent with §1.1 of the supplier | added |
| 6.3 bijection restricted to families | `f = 1` | orbit set is `𝒯(K, n)` itself, so the bijection is the identity on classes | holds | citation changed |

Elaborated signatures: no `#check` pass was rerun because `Suggested.lean` is unchanged, so the 39 elaborated types in the scratch `signatures.md` still apply. The six declarations flagged there as having lost a section binder were not raised in this comment and were not revisited.

Ownership against open pull requests: checked. The classification and the automorphism count now have exactly one owner, EtaleMassFormula, at the open head `01e6554`. `roadmaps resolve` on the edited README reports no unresolved EtaleMassFormula citation. Sources: nothing new was cited, and no reference request was filed.

## Build and gate

- `lake build TauCetiRoadmap.PadicExtensionFamilies.Suggested`: `Build completed successfully (9037 jobs).` The only warnings are `declaration uses 'sorry'`.
- Gate: `gate PadicExtensionFamilies: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck:

  ```text
  depcheck: 203 roadmaps, 1656 edges, 0 problem(s)
  ```

  There is no UPWARD and no CYCLE line. See H05 for the caveat that EtaleMassFormula is absent from the merge order.

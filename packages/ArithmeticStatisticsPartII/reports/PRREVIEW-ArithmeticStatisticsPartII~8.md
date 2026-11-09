# Review of ArithmeticStatisticsPartII (pull request #1173 at 8e2b31a)

**Verdict:** accepted

🤖 Independent AI review, incremental re-review of the 4 lines changed since d0a1680 (two locators in `TauCetiRoadmap/ArithmeticStatisticsPartII/README.md`; `Suggested.lean` is untouched). No finding remains and the gate passes. This roadmap folder is ready for a human's final approval.

## Previous findings

- R01 — repaired: `README.md:1882` now reads “§4.2, the definition of specialness, its two listed properties and Theorem 4.2, p.20, with proof pp.20–22.” The proof opens at ref-16 line 983 (p. 20) and closes at line 1134 (p. 22).

## Verified sound

**The two changed passages.**

- `README.md:1882`, **Special integral representatives**: the proof range is now pp. 20–22. ref-16 line 980 states Theorem 4.2 on p. 20, line 983 opens the proof, line 1078 is the marker of page 22, and line 1134 closes the proof after display (33). Section 4.3 starts at line 1141, still on p. 22, so the range does not overshoot.
- `README.md:1844`, **Quartic monicization**: the locator changed from “§1.2, pp.3–4” to “§1.3, p.4”. This change was not requested by the previous review, and it is correct. §1.2 (ref-16 lines 88–107) is background on coverings and never mentions monicization. §1.3 starts at line 108 on p. 3, and the definition `f^mon = f₀⁻¹·f(x, f₀y)`, the quadratic twist by `Q(√f₀)`, the Jacobian `E_{f₀²I, f₀³J}` and the identification of two-torsion schemes are all at lines 150–155, on p. 4. The second half of the locator, §3.1, p. 13, is unchanged and holds (lines 607–629: the two-torsion identification through the norm-one torus of `K_{f^mon}`).
- No other [16] locator in the README uses the old “§1.2, pp.3–4” form, so the change leaves no inconsistent sibling.

**Gate** (independent rerun on this head; the worker's run with the build is identical and ends `build=0 OK`):

```text
gate ArithmeticStatisticsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

**Dependency check** (the brief's command, real order, `--movable`): `depcheck: 236 roadmaps, 2274 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line. The diff against main outside the folder is empty, and the worktree is clean.

**Elaboration.** `lake env lean` on `Suggested.lean` gives exactly nine `sorry` warnings (lines 152, 162, 173, 180, 189, 198, 205, 229, 243) and nothing else, the same as at d0a1680. The file is byte-identical to the one the previous review read, so its `#check @` comparison of all 26 signatures and its one-tactic probes carry over unchanged; the worker's signature listing reports 0 lost binders.

**Adversarial table.** The diff changes no statement. The one row computed this round is for the target whose locator changed, checked against what the newly cited page says; the rest are carried from the previous report (pull request #1173 at d0a1680), which holds their values.

| Statement | Instances and computed values | Result |
|---|---|---|
| Quartic monicization (§1.12), against ref-16 p. 4 | 2000 random integer tuples `(a,b,c,d,e)` in [−9,9], including `a = 0`: `I(f^mon) = a²I(f)`, `J(f^mon) = a³J(f)`, `4I³ − J²` scales by `a⁶`, and `f(x, ay) = a·f^mon(x,y)` at two points each: 0 violations. Source p. 4 gives the Jacobian `E_{f₀²I, f₀³J}`, the same weights. `f = 2x⁴ − 2y⁴`: `I = −48 → −192`, `Δ = −16384 → −1048576`, and independently `256a³e³` gives −16384 and −1048576. `a = 0`: tuple `(1,b,0,0,0)` has `I = J = 0`, so `Δ = 0`. | Holds |
| Special integral representatives (§1.12) | Locator only changed. Statement rows carried: specialness bullets 1–3 (200 + 100 + 100 trials), the Checks at p = 5 with minor gcds (5, 25, 125) and (25, 625, 15625), and the factor-3 pair with gcds (9, 0, 0). | Hold (previous report) |
| `orbit_bijection_embedding`, both directions | Carried: 300 random `(γ, f)` forward; all 20 matrices of SL₃(ℤ) with entries in [−2,2] fixing `A₁` are `det(γ)Sym²(γ)`. | Holds (previous report) |
| `fibre_card_le` | Carried: `27·Cubic.discr = 4I³ − J²` on 300 random f; `x³ + y³ = 1` forces N ≥ 2. | Holds (previous report) |
| §1.8 column-convention, swap, uniqueness and sign Checks | Carried: `r = −2` for `γ = (1 1; 0 1)`; `f = x³y + xy³ + y⁴` has `I = −3`, `J = −27`, `4I³ − J² = −837`. | Hold (previous report) |
| `MvPolynomial.linearSubst` contract | Carried: `linearSubst (M * N) = (linearSubst N).comp (linearSubst M)`, a right action. | Holds (previous report) |
| All other statements (§§1.1–1.7, 1.9–1.16; the field-level headlines) | Unchanged since 30098d6; rows carried through the previous report (brute force over 𝔽₅, 𝔽₇, 𝔽₁₁ with 0 violations). | Hold (previous report) |

**Sources sample.** ref-16 is arXiv v1, the version the reference list cites. Of the fifteen seeded targets, the diff touches only §1.12 passages, which are outside the sample; the sampled targets' locators are untouched and were verified in the earlier reports. Lines of ref-16 read this round: 88–200 (§§1.2–1.3, pp. 2–4), 204–210 (p. 5), 602–632 (§3.1, p. 13), 978–986, 1074–1080 and 1126–1142 (§4.2, pp. 20–22).

**Library declarations.** None is touched by the diff. The four opened at the pins in the previous report (`linearSubst`, `linearSubst_one`, `linearSubst_mul` in Tau Ceti `TauCeti/RingTheory/MvPolynomial/LinearSubst.lean` at :74, :205, :210; Mathlib `Cubic.discr`) stand, since the pins did not move.

**Ownership, citations and overlaps.** The diff adds no cross-roadmap citation, no name and no section number. The overlap report lists no other pull request changing this roadmap, no dropped id and no id only an open revision defines. The citation resolver's 22 leads are this roadmap's own declarations in `Suggested.lean`, as in the previous report. The pull-request description is unchanged in substance: its `**Depends on**` list is present and the previous R03 repair stands.

## Not verifiable

- ref-17 (O'Dorney) and ref-5 (Gan–Gross–Savin): unchanged from the earlier reports; no passage citing them changed.
- A `sorry` build checks elaboration, not truth; the limits recorded in the previous report (the converse of the orbit bijection tested only on matrices with entries in [−2,2]) are unchanged.

## Source issues

- **Misprint** in ref-16 at §1.3, p. 5 (line 208): the source says the monicization's fifth coefficient is a³ times d; it should be a³ times e, as its own bound on the next line and the definition on p. 4 give; affects nothing.

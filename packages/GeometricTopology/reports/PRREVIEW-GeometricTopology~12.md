# Review of GeometricTopology (pull request #903 at fddb9ef)

**Verdict:** accepted

This is an incremental re-review of the 3 lines changed since `6f8b64f`: `Suggested.lean:1` gains the line `module`, and the supplier heading at `README.md:387` is reverted to `### From TauCetiRoadmap.HopfRinow`. Nothing changed outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GeometricTopology'` is empty). Both repairs the r10 report asked for are made and the worker's gate now passes with `build=0`; a rerun of the gate with the build on this head prints every counter zero and `OK`. Two P3 notes remain, one of them new: the bare `module` line silences the Lake advisory but makes the 17 headline theorems invisible to importers (R01), and the 25 companion files are unchanged (R02). Neither blocks.

## R01 (P3) — Bare `module` header makes every headline theorem module-private

**Location:** `TauCetiRoadmap/GeometricTopology/Suggested.lean:1–16`, "module" then "import Mathlib" and 15 "import TauCeti.…" lines, with no `public` anywhere in the file.

**Claim:** in a `module` file, imports and declarations are private to the module unless marked `public`. With the header as it stands the 17 statements elaborate (17 `declaration uses sorry` warnings, nothing else) but are not exported: the built public olean `Suggested.olean` is 4,128 bytes against 83,168 bytes for `Suggested.olean.private`, and a scratch importer (`import TauCetiRoadmap.GeometricTopology.Suggested` followed by `#check @TauCetiRoadmap.GeometricTopology.<name>` for each of the 17 names, elaborated with `lake env lean` at this head) reports 17 `Unknown identifier` errors, one per headline; a `module` importer using `import all` sees all 17, confirming they exist only as module-private declarations. The acceptance test is still stated, so the mathematics is unchanged, but no file can name the theorems it states, which is not the form the one module-system `Suggested.lean` on main uses: `TypeAHeckeAlgebras/Suggested.lean:6–12, 35` (`module`, six `public import` lines, `public section`). The r10 report's witness for its repair ("13 of the 123 `Suggested.lean` files begin with `module` followed by `import Mathlib`") was wrong: at `fa41b374` no `Suggested.lean` under `TauCetiRoadmap/` or `Completed/` begins with `module` (its grep matched the word "module" inside docstrings); the author is not at fault for following it.

**Witness:** `Suggested.olean` 4,128 B vs `Suggested.olean.private` 83,168 B in the worktree's build directory after the gate's build; scratch importer: 17 errors `Unknown identifier TauCetiRoadmap.GeometricTopology.annulus_conjecture` … `…manolescu_triangulation_conjecture_false`.

**Repair:** make the imports and the section public: lines 2–16 become `public import Mathlib` and `public import TauCeti.…` (same modules, same order), and the line `public section` is inserted before `namespace TauCetiRoadmap.GeometricTopology` at `Suggested.lean:58` (no `end` is needed). Tested on this head: a scratch copy with exactly those changes and `#check @<name>` appended for the 17 declarations elaborates with `lake env lean` at the pins, exit 0, 17 `declaration uses sorry` warnings and no other diagnostic, and prints the 17 signatures identical to the worker's `signatures.md`. The gate's import scanner accepts the form (its import pattern is `(?:public\s+)?import`, and `mathlib-subimports`/`no-import-mathlib` use the same optional prefix), so `imports=0` is unaffected. Retest after the change: `lake build TauCetiRoadmap.GeometricTopology.Suggested`, then the scratch importer above prints 17 signatures and no error. Style only; it does not block.

## R02 (P3) — Companion Lean files keep forbidden commands, submodule imports and a contradicting ownership claim

**Location:** `TauCetiRoadmap/GeometricTopology/ExchangeFamily.lean`, `RealAlgebraicRealization.lean`, `SimplicialLinks.lean` (`#print axioms`); `LeeFrobenius.lean:1–4` and 13 further companions (`import Mathlib.<submodule>`); `LeeFrobenius.lean:14–15` ("GT6 owns the deformation and its filtered comparison") against `README.md:123–125` (the Lee deformation of Khovanov homology is GeometricTopology, Part II's).

**Claim:** the 25 companion files are byte-identical to `6f8b64f` (`git diff --stat 6f8b64f..HEAD` lists only `README.md` and `Suggested.lean`). The brief's Lean form rules apply to every listed `.lean` file; the gate's scanners cover `Suggested.lean` only, so they do not catch these.

**Witness:** `grep -c '#print axioms'` gives 12, 7 and 5 on the three files named (24 commands); `grep -l '^\(public \)\?import Mathlib\.'` matches 14 files with 37 such lines; no companion file's name occurs in `README.md` (0 matches for all 25 stems).

**Repair:** delete the 25 companion files (the README keeps their targets and Checks; a headline among them that is statable goes into `Suggested.lean` under its rules). If they are kept, delete every `#print axioms`, replace the submodule imports by the single `import Mathlib`, and align `LeeFrobenius.lean:14–15` with `README.md:123–125`. Retest: both grep counts are zero and each remaining file still elaborates with `lake env lean`. Same form finding as r6–r10; it does not block.

## Previous findings

- R01 — **repaired:** `Suggested.lean:1` is now `module`; the worker's gate on this head reports `build=0 … OK`, and my rerun with the build prints the same line (`real 0m7.6s`, nothing to compile). The repair introduced the visibility problem reported as R01 (P3) above.
- R02 — **not repaired:** the 25 companion files are unchanged (`#print axioms` count 24, `Mathlib.<submodule>` import lines 37, `LeeFrobenius.lean:14–15` unchanged). Repeated as R02 (P3) above.
- R03 — **repaired:** `README.md:387` reads `### From TauCetiRoadmap.HopfRinow`, matching the other supplier headings at lines 378, 393 and 402 and the namespace at `Completed/HopfRinow/Suggested.lean:12`; `roadmaps resolve` on the README at this head reports no citation and no Lean name found nowhere.

## Verified sound

**The gate.** The worker's gate at `fddb9ef` has all 27 counters zero including `build=0`. Rerun by me at this head with `--build` (the shared Lake packages directory `315a2ceb011d417c` at Mathlib `f6090c70` / Tau Ceti `358314d4`, matching `lake-manifest.json`; 8,547 of 8,547 Mathlib oleans present; no other `lake build` running): identical line, `OK`, 7.6 s. `lake env lean` of the repaired scratch copy (R01) gives 17 `declaration uses sorry` warnings and nothing else; the head file itself was built by the gate with the same 17 warnings.

**Dependency check** (rerun on this head):

```text
depcheck: 204 roadmaps, 1392 edges, 0 problem(s)
```

No `UPWARD`, `CYCLE` or `moved:` line. HopfRinow is archived under `Completed/` on main, so citing it is allowed; the heading prefix `TauCetiRoadmap.` is the name of its namespace (`Completed/HopfRinow/Suggested.lean:12`).

**The changed heading and what cites it.** `Completed/HopfRinow/README.md` on main (`fa41b374`) has `### Layer 1: the geodesic equation, the flow, and the exponential map` (line 264), `### Layer 2: normal neighbourhoods, the Gauss lemma, and minimizing geodesics` (line 427) and `### Layer 3: the Hopf–Rinow equivalence` (line 451), so the three clauses of `README.md:389–391` cite the right layers. The eight mentions of HopfRinow in the README (lines 101, 387, 602, 632, 656, 799, 2065, 2188) all write the bare name `HopfRinow` or the heading now reverted, consistent with main's usage (`OptimalTransport/README.md:903`, `GeometricCurrents/README.md:18`); the consumers are in §1.5 (602, 632, 656), §7.1 (2065) and the Layer 7 Dependencies (2188), none of them seeded and none changed.

**The `module` line.** Elaboration of the head file is unchanged in content: the 17 signatures printed by the worker's `signatures.md` (elaborated inside the module, where private names resolve) equal those printed by my repaired copy, name for name, including every instance binder (`T2Space`, `SecondCountableTopology`, `Orientable`, `CompactSpace`, `SimplyConnectedSpace`) and the universe `u_1`. The file has no `variable` block, so no binder can have been dropped. The worker's two parser artifacts (`#check @,` at `SignatureCheck.lean:202` and `#check @TauCetiRoadmap.GeometricTopology.` at line 214, from a stray `,` and the word "structure" in docstrings) are not declarations; the file declares exactly 17 theorems, agreeing with `README.md:20–22` ("fourteen … together with three").

**Padding.** No statement was touched, so the r10 one-tactic probe stands (15 `exact?` failures, 2 unsolved goals after `simp`; nothing closes). No new declaration was added.

**Seeded sample.** The fifteen seeded sections are at `README.md:670` (1.6), 885 (2.3), 997 (3.2), 1033 (3.3), 1327 (4.6), 1443 (4.8), 1524 (4.10), 1617 (4.13), 1766 (5.3), 1978 (6.4), 2067 (7.2), 2204 (8.1), 2611 (10.2), 2736 (11.3), 2783 (11.4). The diff changes only line 387; none of the seeded sections contains or cites the changed passage, so there is nothing of the sample to recheck this round; their locator verification from the r8–r10 reports stands.

**Ownership and duplication.** No construction, carrier or target was added; the r8 ownership search stands. Ownership against open pull requests outside the brief's checkouts was not re-searched this round.

**Adversarial table.** Two rows were computed this round (the two changed passages); the rows for untouched statements are carried from the r10 report (which carried r9 and r8), as marked.

| Statement | Instances | Values on each side | Result; change |
|---|---|---|---|
| `module` header (`Suggested.lean:1–16`): are the 17 headlines still stated, and are they exported? | head file; plain importer; `import all` importer; repaired copy (`public import` ×15, `public section`) | head: 17 `sorry` warnings, 0 errors; public olean 4,128 B vs private 83,168 B; plain importer: 17 unknown identifiers of 17; `import all` from a `module` file: 17 of 17 resolve; repaired copy: 17 `sorry` warnings, 0 errors, 17 `#check` signatures equal to `signatures.md`; gate import regex `(?:public\s+)?import` | stated and elaborating; not exported: R01 (P3) |
| HopfRinow heading (`README.md:387`) and its consumers (`101`, `602`, `632`, `656`, `799`, `2065`, `2188`) | prefix vs namespace; the three layer citations; the point and identity embeddings | `TauCetiRoadmap.HopfRinow` = `Completed/HopfRinow/Suggested.lean:12`; other `### From TauCetiRoadmap.*` headings at 378, 393, 402 use the same prefix; Layer 1 (line 264) = geodesic equation, flow, exponential map; Layer 2 (427) = normal neighbourhoods, Gauss lemma; Layer 3 (451) = Hopf–Rinow; `{p} ⊂ M`: tube = `exp_p` of a ball, a Layer 2 normal neighbourhood; `id : M → M`: normal rank `0`, tube `M`; `resolve`: 0 missing; depcheck: 0 problems | correct; R03 repaired, no change |
| `sphere_theorem` (`Suggested.lean:121–128`) | as in the r10 report | `π₂(S² × S¹) = ℤ`; `S² × ℝ` non-compact; `π₂(ℝ³) = π₂(ℝP³) = 0` vacuous; `S¹ × ℝP²` irreducible with `π₂ = ℤ`, so `Orientable` necessary and present; free = based null-homotopy for `S²` (carried from the r10 report) | no change |
| `waldhausen_theorem` (`Suggested.lean:156–164`) | as in the r10 report | `T³`, `GL(3,ℤ)`; `L(7,1) ≃ L(7,2)` not homeomorphic, excluded by the Haken predicate; `S¹ × S²` excluded by `IsSphereBoundsBall` (carried from the r10 report) | no change |
| `moise_triangulation` (`Suggested.lean:190–191`) | as in the r10 report | `TriangulationConjecture 3` at `TriangulationConjecture.lean:74` quantifies over compact `T2` charted spaces on `ℝ³`; `M = ∅`, disconnected `M`; pin proves only `n = 0` (line 97) (carried from the r10 report) | no change |
| Cerf docstring (`Suggested.lean:46–49`) | `π₀` of a homotopy equivalence; `O(4)` | two components of `O(4)`, bijection on `π₀` (carried from the r10 report) | no change |
| 2.3 annulus locator (`README.md:892–899`) | Kirby's `n` vs README's `n + 1` | `n ≥ 6`, `n = 5`, `2ⁿ`-fold covers (carried from the r10 report) | no change |
| 4.8 Turaev genus locator (`README.md:1460–1466`) | trefoil `#` mirror trefoil | `g_T = (2 + 6 − 8)/2 = 0`, span `6 = c` (carried from the r10 report) | no change |
| 10.2 Palmeira Check (`README.md:2623–2628`) | Calegari 4.38 hypotheses | `S² × S¹` universal cover `S² × ℝ ≠ ℝ³` (carried from the r10 report) | no change |
| 8.1 Checks (`README.md:2233–2241`) | trefoil group; `S¹ × ℝP²`; granny vs square | `S₃` quotient; two-sided `ℝP²`; `σ = −4` vs `0` (carried from the r10 report) | no change |
| 17 headlines in `Suggested.lean` | each elaborated and probed | 17 `sorry` warnings, 0 errors; probe: 15 `exact?` failures, 2 unsolved after `simp`; `14 + 3 = 17` agrees with `README.md:20–22` (probe carried from the r10 report; elaboration redone this round) | no change |
| 1.5 radius function, nesting, unit-circle tube, pinned constant-radius theorem (`README.md:647–663`, `254–256`) | circles of radius `1/n` at `(3n,0)`; `δ' = 1/4 ≤ 1/2`; `ε ≤ 1` | inward normals of length `1/n < ε` collide; annuli `(3/4, 5/4) ⊂ (1/2, 3/2)`; `(x, −x) ↦ 0` for `ε > 1`; hypotheses compact, `C²`, injective differential (carried from the r10 report) | no change |
| 1.7 compact comparison and Checks (`README.md:715–745`) | `|x|` on `[−1,1]`; `K = ∅`; `x ↦ x³` | values `1, 0, 1`; `0` cells; `6x ≠ 0` off `0` (carried from the r10 report) | no change |
| 4.6 substitution, trace formula, skein conventions (`README.md:1328–1386`) | `N = 2`, `q = 2`; trefoil `σ₁³` | `67/256` both sides; `P(T) = 2v² − v⁴ + v²z²`; `tr(σ⁻¹) = 5/8` (carried from the r10 report) | no change |
| 4.5 Jones, 4.8 MFW, 4.10 two-bridge, 4.2 closures, 4.4 Alexander, 4.3/6.2 signs, 4.7 colourings (`README.md:1192–1544`) | as in the r10 report | `V(T) = t + t³ − t⁴`; spans `1, 2`; `2·3 ≡ 1 (5)`; `1212` non-planar; `Δ(−1)` odd; `σ(3₁) = −2`; Arf `1, 1, 0` (carried from the r10 report) | no change |
| 1.8 genus, 1.4/3.3 disc theorem, 3.1 topologies (`README.md:556–560`, `773–778`, `980–985`, `1049–1066`) | torus; `x ↦ ±x`; `f_k = θ + k⁻² sin kθ` | `(2−0−0)/2 = 1`; orientation clause at Palais line 78; `C¹` not `C²` (carried from the r10 report) | no change |
| 5.1–5.4 exterior, fillings, Property P/R, Moser (`README.md:1708–1828`) | empty link; unknot `p/q`; `T(2,3)` at `5, 6, 7` | `∂X = ∅`; `L(p,q)`; `L(5,4)`, `L(2,1) # L(3,1)`, `L(7,2)` (carried from the r10 report) | no change |
| 6.1–6.4 concordance, averaged signature, Freedman (`README.md:1879–1999`) | trefoil vs mirror; `ω = e^{±iπ/3}`; Whitehead double | `σ = −2 ≠ 2`; mean `−1`; `Δ = 1`, `τ = 1` (carried from the r10 report) | no change |
| 7.1–7.4 (`README.md:2047–2167`) | genus-2 surface; Gieseking; Weeks | `4π`; `v₃ = 1.0149…`; `0.9427… < 1.0149… < 2.0298…` (carried from the r10 report) | no change |
| 8.2, 8.4–8.6 (`README.md:2259–2429`) | `S¹ × S²`; trefoil exterior; `T³`; Poincaré sphere | prime not irreducible; multiplicities `2, 3`; `0` tori; `|π₁| = 120` (carried from the r10 report) | no change |
| 9.1–9.2 (`README.md:2475–2518`) | `L(1,q)`; `T³`; Poincaré sphere | genus `0`; `3 = rank ℤ³`; `g = 2 = rank` (carried from the r10 report) | no change |
| 11.1, 11.3–11.5 (`README.md:2663–2799`) | one edge; `ΣP`, `Σ²P`; `n = 5, 0, 4`; dunce hat | `∂e ∗ ∅ = S⁰`; vertex link not a manifold; `E₈`; no free face but contractible (carried from the r10 report) | no change |

## Not verifiable

- Turaev 1987 (L'Enseignement Math.), Waldhausen 1968, Papakyriakopoulos 1957, Moise 1952, Bing 1959, Palmeira 1978, Quinn 1982, Lickorish Chapter 5: as in the r8–r10 reports, cited by locator only; none of their passages is touched by this change set.

## Source issues

- none

# Review of ExplicitCharacterSumsAndSieves (pull request #1948 at b701b75)

**Verdict:** accepted

This is an incremental re-review of the 6 lines (3 insertions, 3 deletions, all in `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/README.md`) changed since the previous review read `d6d076d`. The change is the one sentence at README lines 112–114 that the previous review's sole finding asked for. Nothing changed outside the folder, nothing changed in `Suggested.lean`, the gate passes, the dependency check is clean, and the file elaborates with `sorry` as its only warning. No finding remains, new or carried forward.

## Previous findings

- R01 — repaired: README lines 112–114 now read "This roadmap stops at the iterated van der Corput inequality of Layer 1, the first and second derivative counts of Layer 2, the Pólya–Vinogradov inequalities of Layer 3, the Burgess inequalities for a prime modulus of Layer 4 and the sieve bounds of Layer 5." The repair introduced no new problem: see the consistency checks below.

## Verified sound

### The changed passage (README lines 112–114)

I read the sentence against everything in the folder that it describes or that describes the same objects.

- **Layer 1.** Its only section is `### 1.1 the iterated van der Corput inequality` (README line 548, layer heading line 544); its only target is `iterated_vanDerCorput` (`Suggested.lean` line 96). The sentence now names exactly that. It agrees with Scope lines 62–63 ("Arias de Reyna's iterated inequality (§1.1), which assumes no derivative bound at all") and with the module docstring (`Suggested.lean` lines 16–19), which gives every derivative test for exponential sums to ExplicitZetaBounds. The contradiction the previous review found is gone.
- **Layer 2.** "the first and second derivative counts": §2.2 is "the first derivative test" and §2.3 "Huxley's reduction and the second derivative test" (lines 619, 647), whose targets `first_derivative_test_points` and `second_derivative_test_points` count integer points near a curve. The end-theorem list (line 27) and the docstring (lines 20–21) call them the derivative tests for integer points near a curve; "counts" is the same object, so no new inconsistency.
- **Layers 3, 4, 5.** The sentence's names are the layer headings: "explicit Pólya–Vinogradov inequalities" (line 694), "explicit Burgess inequalities for a prime modulus" (line 959), "explicit sieve upper bounds" (line 1272).
- **Part II items.** The first Part II bullet, Arias de Reyna's `d`-th derivative estimate "built on §1.1" (lines 116–117), is consistent with the stop point now stated. The bullet is untouched.
- **No other text cites the changed sentence.** A grep for "derivative test" in the README (lines 27, 57–58, 118, 151, 253, 619, 647, 658, 686) finds every remaining use attached to Layer 2 counts, to ExplicitZetaBounds, or to Part II's `k ≥ 3` test; none says Layer 1 contains a derivative test.
- **No process words, no pull-request numbers, no paths** in the new lines (the gate's `round-labels`, `prnum`, `private-paths` and `residue` counters are 0).

### Gate, dependency check and elaboration (rerun at this head)

- **Gate.** `gate ExplicitCharacterSumsAndSieves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (the targeted build of `TauCetiRoadmap.ExplicitCharacterSumsAndSieves.Suggested` included).
- **Dependency check** (`--movable`): `depcheck: 237 roadmaps, 2424 edges, 0 problem(s)`. No `UPWARD`, `CYCLE` or `moved:` line. The merge order lists this roadmap at line 268 and its suppliers before it: AnalyticNumberTheoryPartI (51), SieveMethodsAndPrimePatterns (54), CharacterSumsOverFiniteFields (157), ExplicitZetaBounds (265), ExplicitPrimeCounting (266).
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/Suggested.lean` exits 0 in 10 s; the only output is 19 `declaration uses 'sorry'` warnings, one per theorem, as before.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty.
- **`Suggested.lean`** is byte-identical to the file the previous review read (the diff between `d6d076d` and this head touches only the README), so its 42 elaborated signatures, the padding probe and the headline list of the previous review stand unchanged: 23 `def`s with real bodies, 19 sorried theorems, all 19 headlines of README lines 24–36 stated, single `import Mathlib`, no `set_option`, no `lemma`.

### Seeded sample, where it falls in the changed passage

The changed sentence names §1.1, the first sample target in Layer 1; I rechecked it in full. The other sample targets (0.1, 0.2, 0.4, 2.3, 3.5, 3.6, 4.4, 5.3, 5.6, 6.3, 6.5, 6.7, 6.9, 6.10) are untouched since the previous review, which verified each at its locator (its table under "Seeded sample"), and the sentence names their layers only by heading.

| Target | Locator and what I checked at this head |
|---|---|
| 1.1 | ariasdereyna2024 Theorem 7 at lines 398–404: `f : (X, X+Y] → ℝ`, `H₁ + ⋯ + H_d ≤ Y`, bound `B · max(H₁^{−1/2}, …, H_d^{−1/2^d}, B^{−1/2^d} T_d^{1/2^d})`, `T_d = (Y H₁⋯H_d)⁻¹ Σ_a |Σ_{n ∈ I(a)} e(f_a(n))|`, `1 ≤ a_r ≤ H_r − 1`; the constant `B = 2 + 2√2` with `4/H + 4T ≤ max(B²/H, BT)` at lines 384–391; the `d = 1` step `|E(f)|² ≤ 4/H₁ + 4T₁` at lines 405–415. The README statement (lines 550–560) matches, with the domain `(X, X + Y − Σ a_r]` of line 394. |

### Adversarial table

Row 28 is the changed statement. Rows 1–27 are carried forward from the previous report (review of `d6d076d`), whose statements this head leaves untouched; their values are as recorded there.

| # | Statement | Instances | Values (left / right) | Result |
|---|---|---|---|---|
| 1–27 | the 19 headlines, §3.5's rounded forms, §4.1's refinements and tuple counts, §5.5's sifted form and control, 6.1–6.10 | as in the previous report's rows 1–27 | as in the previous report's rows 1–27 (for example row 1: max `M_χ`/bound `0.7458` over 1815 primitive `χ`, `q ≤ 100`; row 14: `iterated_vanDerCorput` max ratio `0.340` over 1500 phases, `1 / 3.414` at `d = 1`) | true, unchanged |
| 28 | README lines 112–114: the stop points of Layers 1–5 | each named object against the layer headings and targets of this head | Layer 1: 1 section, 1 target (`iterated_vanDerCorput`, line 96), 0 derivative tests / "iterated van der Corput inequality"; Layer 2: targets `first_derivative_test_points`, `second_derivative_test_points` / "first and second derivative counts"; Layer 3 heading line 694 / "Pólya–Vinogradov inequalities"; Layer 4 heading line 959 / "Burgess inequalities for a prime modulus"; Layer 5 heading line 1272 / "sieve bounds" | agrees |
| 29 | §1.1 constant `B = 2 + 2√2` (the target the sentence names), recomputed | `(B² − 4)(B − 4)`; `H = 1`, `T = 6` with `B = 2 + 2√2` and `B = 4.5`; `d = 1`, `H₁ = Y = 2`, `f ≡ 0` | `16.000`; `28 ≤ max(23.31, 28.97)` and `28 > max(20.25, 27)`; `1 ≤ B max(2^{−1/2}, B^{−1/2}·(1/4)^{1/2}) = 3.414` | true, as the Checks say |

### Citations and ownership

- `scratch/citations.md`: no cross-roadmap citation and no Lean name of this README is found nowhere.
- `scratch/overlaps.md`: no other open pull request changes this roadmap; no id this README cites is dropped by an open pull request; no cited id is defined only by an open revision. The closest roadmaps in vocabulary (ExplicitMultiplicativeFunctions, ExplicitNumberFields, ExplicitZetaBounds, ExplicitPrimeCounting, SieveMethodsAndPrimePatterns) were compared for ownership in the previous review; the changed sentence introduces no new object and no new citation, so that comparison stands.
- The sentence cites no supplier; the roadmap's supplier citations (AnalyticNumberTheoryPartI §§0.5, 0.8, 0.19, 0.20, 1.5a; SieveMethodsAndPrimePatterns §§1.1, 1.3, 1.6, 2.9, 5.2; CharacterSumsOverFiniteFields §4.7; ExplicitZetaBounds §§4.1–4.5, 6.5; ExplicitPrimeCounting §0.1) are unchanged since the previous review resolved each at its head.

### Remarks on untouched text (no change requested)

- None. I found nothing in the untouched text that the previous review passed and that this change makes wrong.

## Not verifiable

- As in the previous review, the uncertified citations (greaves2001, montgomeryvaughan2007, montgomeryvaughan1973, frolenkovsoundararajan2013, bordelles2012, filaseta1990, trevino2015kth, bachmanrachakonda2001, siebert1976, rieselvaughan1983) and the waived vanlintrichert1965 are cited by locator alone. None is touched by this change.

## Source issues

- none

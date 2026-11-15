# Review of PeriodsAndSpecialValues (pull request #1496 at 8f85555)

**Verdict:** accepted

:robot: Independent AI incremental re-review of the 12 changed lines since 723667b (10 inserted, 2 deleted): one README sentence and the header and closers of `Suggested.lean`. No finding. This review changes no pull-request file.

## Findings

None.

## Previous findings

The previous report (`packages/PeriodsAndSpecialValues/reports/PRREVIEW-PeriodsAndSpecialValues~7.md`, of 723667b) had no finding of its own, so there is nothing to account for here.

## Verified sound

**The changed passages.**
- `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:37` now ends “BorelRegulators §§2.1–2.3, 5.3–5.4, 6.0a–6.3”. The only change to the README is the insertion of “5.3–5.4,”. It now agrees with the Scope bullet (line 29), the contract heading (line 142), the PS.3.3a `*Needs:*` line (line 915) and the Layer PS.3 Dependencies (line 924).
- `TauCetiRoadmap/PeriodsAndSpecialValues/Suggested.lean:1–3` read `module`, blank, `public import Mathlib`. Line 42 opens `@[expose] public section`, and two `end`s (lines 243, 245) close it and the `noncomputable section`. No declaration, docstring or statement changed.
- The pull request's title and description were read against this head. No sentence is contradicted, and the two changes need no statement there: the description names no BorelRegulators section and does not describe the import line.
- `git diff --stat origin/main...HEAD` outside the roadmap folder is empty.

### Computed adversarial table

The diff changes no statement, so the rows cover the header change, the statement the changed README sentence cites, and the seeded sample.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Header change (`Suggested.lean:1–3, 42, 243, 245`) | `lake env lean`; section nesting | exit 0, 13 `sorry` warnings, 0 other diagnostics; 2 sections + 1 namespace opened, 3 closed | elaborates | Retain |
| All 38 declarations under the module header | `#check @name` in a scratch copy, compared with the worker's signature list | 38 of 38 identical after whitespace normalisation; no binder lost | no drift | Retain |
| One-tactic probe on the 13 theorems | `first \| rfl \| simp \| infer_instance \| norm_num` in a scratch copy | 13 of 13 “unsolved goals” (lines 70, 76, 92, 105, 121, 127, 151, 157, 192, 198, 213, 229, 238) | no padding | Retain |
| README:37's citation, BorelRegulators §5.4 (zeta covolume), as PS.3.3a uses it | F = ℚ, n = 2 (d = 0, N = 1); F = ℚ(i), n = 2 (d = 1, N = 2, Δ = 4) | ℚ: R_Bo = 1 (rank 0) against π^(0−2)·ζ(2) = 1/6, ratio 6 ∈ ℚ; ζ*(−1) = −1/12 ∈ ℚˣ. ℚ(i): √4·π^(1−4)·ζ_F(2) = 2·1.5068/31.006 ≈ 0.0972, the supplier's 2ζ_F(2)/π³ | consistent with README:889–910 | Retain |
| README:37's citation, BorelRegulators §5.3 (rank of the lattice) | n = 2j−1, j = 2, 3 | j = 2: rank r₂ = d₂; j = 3: rank r₁ + r₂ = d₃; for ℚ this gives 0 and 1, matching K₃(ℤ) ⊗ ℚ = 0 and K₅(ℤ) ⊗ ℚ = ℚ | consistent | Retain |
| `hoffmanDim` (body now exposed) | N = 0,…,7 against 1/(1 − t² − t³) | recursion gives 1, 0, 1, 1, 1, 2, 2, 3; series coefficients d_N = d_(N−2) + d_(N−3) give the same | correct | Retain |
| Sample: residue coordinates (README:1969) | R = diag(1,−1,2,−6)·D | diagonal of R is (1, 1, 2, 6), det R = 12; D has diagonal (1, −1, 1, −1), det D = 1; v₃(12) = 1, v_p(12) = 0 for p ≥ 5 | as written | Retain |
| Sample: fixed-fibre map (README:1956) | Park locators, printed page = text page + 419 | Def 4.8 Park line 1173 and Rem 4.9 line 1180, p. 442; Thm 4.11 line 1233, p. 443 (v_p(γ) ≤ 1/(p−1), v_p(ℏ) > 0); Cor 4.12 line 1345, p. 445 (smooth complete intersection); Prop 5.2 line 1568, p. 449 | all as cited | Retain |

The rows for every untouched statement stand as in the previous review, of `723667b`.

**Counts.**
- Gate, rerun at this head: `gate PeriodsAndSpecialValues: set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's gate, including the targeted build, reports `build=0 OK`.
- Elaboration at the pins (Mathlib `1b1ccf4b`, Lean `v4.36.0-rc2`): 13 `declaration uses sorry` warnings and nothing else.
- Dependency check, output in full: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line. Merge-order positions: MotivesAndAlgebraicCycles 96, BorelRegulators 314, PeriodsAndSpecialValues 335.
- Cross-roadmap citations resolved: 1 changed. BorelRegulators at its open head `c564441` has §5.3 (README line 639) and §5.4 (line 661), with §§2.1–2.3 at lines 246–286 and §§6.0a–6.3 at lines 723–816. Its Downstream consumers (line 847) name PS.3.3a for §§5.3–5.4.
- Source locators checked against the text: 7 (Park Definition 4.8, Remark 4.9, Theorem 4.11, Corollary 4.12, Proposition 5.2; SH Lemma 4.8 at SH line 271; SG Lemma 5.6 at SG line 1082, with p > dim V). The README flags no locator as unverified.
- Headlines: the 13 stated theorems are unchanged, and the module docstring (lines 18–31) still names the PS.0–PS.9 headlines that are not statable, each with its missing carrier.
- Overlaps tool: no other open pull request changes this roadmap, no cited id is dropped, and none is defined only by an open revision. The diff adds no object and no declaration name.
- Remark on untouched text: README:144 and README:893 also name BorelRegulators §1.1 (the coordinate measure), which the section lists at lines 29, 37 and 142 do not include. §1.1 exists at the supplier's head (line 170).

Overlap check: read NoncommutativeAndEquivariantIwasawa, BorelRegulators, Polylogarithms, KatoEulerSystems, PadicHodgeRegulators (open) and AnalyticNumberTheoryPartII, PolylogarithmFunctions, ClassicalArithmeticCompletion (main); the results-and-headings list is empty. The rational Fukaya–Kato fundamental object and zeta isomorphism: NoncommutativeAndEquivariantIwasawa §7.9, with this roadmap owning the Burns–Flach orientation and the ETNC predicate. Borel's zeta covolume: BorelRegulators §5.4, with this roadmap owning its reading in the fundamental line. The classical polylogarithms: PolylogarithmFunctions, which excludes multiple zeta values and names this roadmap for them. Modular period lines: ModularSymbolsPadicLFunctions §1.1, cited by both this roadmap and KatoEulerSystems. Nothing else is shared.

Source independence: changed passages only; the 2 changed passages cite no source and contain no prose from one, and the 2 sampled passages were compared with 3 sources (Park, SH, SG), none shared beyond forced terms of three words; largest share Deligne, about 30 of 96 locators by a pattern count; the diff adds, removes or reorders no layer, so the contents were not compared again.

## Not verifiable

- BG is settled as uncertified and Tate-legal as waived; neither text was read.
- BorelRegulators, NoncommutativeAndEquivariantIwasawa and the other open suppliers were read at their open heads, not on main; their section numbers may move before they merge.
- The mathematics of the untouched targets is inherited from the earlier reviews; this review did not audit it again.

## Source issues

- none

## For the human reviewers

- none

# Review of GeometryOfNumbersAndQuadraticArithmeticPartII (pull request #1691 at d2dcdc7)
**Verdict:** needs changes

Incremental re-review of 2 changed lines since 8b6e704 (the §2.5 proof plan), plus the pull request's title and description. The reworded passage and the description are sound; the one finding is the gate's.

## R01 (P3) — `[Fintype]` beside `[Field]` in two theorem signatures (gate: statement-hygiene)

**Location:** `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmeticPartII/Suggested.lean:54`, `:84`, `:85` — `[Field k] [Fintype k] [CharP k 2]` (`arf_trace_classifies`); `[Field k] [Fintype k]` and `[Field l] [Fintype l]` (`arf_scalar_extension`).

**Claim:** The gate fails with `statement-hygiene=3`: a finite field is stated with `[Finite k]`, not `[Fintype k]`. Neither statement uses the `Fintype` data (the sums run over `Fin n`, `Fin m`; `Algebra.trace` and `Module.finrank` need none).

**Witness:** Gate at d2dcdc7: `line 54: P3 [Fintype k] beside [Field k]`, `line 84` likewise, `line 85: [Fintype l] beside [Field l]`; final word `FAIL`.

**Repair:** Replace `[Fintype k]` by `[Finite k]` on lines 54 and 84 and `[Fintype l]` by `[Finite l]` on line 85; nothing else changes. Tested on a scratch copy: it elaborates with the four `sorry` warnings only (lines 53, 83, 111, 124).

## Previous findings

- none — the previous report (of 8b6e704) raised no finding; its single carried item (the scalar-extension headline) was already recorded there as repaired and `arf_scalar_extension` is unchanged at this head.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §2.5 henselian quadratic rigidity (reworded proof plan; seeded target) | (ℤ₂,(2)); (𝔽₂[ε]/ε²,(ε)); J=0 | Lq₀..₃ of source and of 𝔽₂: ℤ/2,0,ℤ/2,0 on both sides in the first two; identity map for J=0 | Pass; none |
| §2.5 hypothesis needed | (ℤ,(2)), not henselian | Lq₀(ℤ)=ℤ (signature/8) against Lq₀(𝔽₂)=ℤ/2; orders ∞ ≠ 2 | Pass; henselian hypothesis is used |
| §2.5 quadratic, not symmetric | (ℤ₂,(2)) symmetric degree 0 | Ws(ℤ₂) order 16 (kernel of the residue on the order-32 W(ℚ₂)); Ws(𝔽₂) order 2 | Pass; statement is rightly Lq only |
| §2.5 plan: reduction to H, split injections | A=ℤ[x], I=(2); smooth H-algebra B with B→Ĥ | H/2H=Ĥ/2Ĥ=𝔽₂[x]; B→Ĥ→H/2H lifts to B→H by smooth lifting, so H→B splits; Ĥ Noetherian and 2-complete, so §2.4 applies | Pass; same route as before the rewording, steps in a different order |
| §2.5 plan: regularity input (gap) | Stacks 15.51.14, 15.51.15 | G-ring A, any ideal: A→A∧ regular (Stacks line 6108); henselization of (A,I) a G-ring (Stacks line 6128); ℤ[x] is finite type over ℤ | Pass; contract wording at README line 85 matches |
| `arf_scalar_extension` with `[Finite]` (R01) | B=x²+xy+y², 𝔽₂→𝔽₄; n=0 | Tr(1)=0 on the left, 2·Tr(1)=2·1=0 on the right; empty sum 0=0 | Pass; the repair leaves the statement's content unchanged |
| `arf_trace_classifies` with `[Finite]` (R01) | H⊥H, B⊥H over 𝔽₂ | traces (0,0),(1,0); Lagrangian of dimension 2 in the 4-space: exists, does not (zero counts 10, 6) | Pass; unchanged content |

Rows for the untouched statements stand as in the previous review, of `8b6e704`.

- Source locators checked against the text (3, all in the changed passage's citations): CDHHLMNNS-III-v4 Remark 2.3.8, p. 44, line 2023; CMM Remark 5.6, p. 39, lines 1659–1674; CMM Theorem 3.15, p. 21, line 892. Plus Stacks lines 6106 and 6126 for the gap. Each supports the passage as written.
- Pull request text (step 8): title and every prose sentence and summary-block claim read against the head — new roadmap, three files, four theorems, 48 headings; §1.1 two-periodic table (README line 207), parity target `(ℤ/2)^I/Δ` (line 411), Eisenstein quadratic rows 0, 0, ℤ/2, ℤ/4 with A=ℤ/4, consumers (line 640), native tensor product in `arf_scalar_extension`. No sentence is contradicted and the 2-line rewording changes nothing they describe.
- Gate, rerun at d2dcdc7: every counter 0 except `statement-hygiene=3` (R01); `FAIL`. Outside-folder diff: empty; worktree clean.
- Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration of `Suggested.lean`: `sorry` the only warning, at lines 53, 83, 111, 124. Elaborated signatures compared with README §0.4 and §4.1: no binder lost.
- Cross-roadmap citations: resolver against main and the open heads reports none unresolved; the changed passage cites only §2.4, GeometryOfNumbersAndQuadraticArithmetic §6.8a and SchemeAndStackFoundations §§0.12–0.15, 0.21, as before the rewording.
- Declared gaps: the changed passage names `gap:henselian-pair-completion-regular` once, with the same slug and scope as README line 85; the other three are untouched.
- Remark (untouched text, no change asked): QuadraticFormInvariantsPartII, open and earlier in the merge order, treats the Arf invariant over arbitrary characteristic-two fields (its Layers 0 and 3); §0.4 here states only the finite-field absolute-trace coordinate and degree law and declares no name it shares.

Overlap check: read HermitianKTheoryOfPoincareCategories, QuadraticFormInvariantsPartII, GeometryOfNumbersAndQuadraticArithmetic (open list), GlobalQuadraticForms, QuadraticFormInvariants (main); third list empty; the changed passage adds no object; owners as in the review of 8b6e704, with the Arf remark above.

Source independence: changed passages only — 1 passage compared with 2 sources (CMM lines 1659–1674, CDHHLMNNS-III-v4 lines 2023–2029), none shared (longest common run 4 words, a standard phrase); largest share CDHHLMNNS-III-v4, 52 of 76 source-id mentions; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- Wall-1973, Lam-2005, Scharlau-1985: settled as uncertified, cited by locator only; none is cited by the changed passage.

## Source issues

- none (new this round; the seven entries of the previous report stand).

## For the human reviewers

- **Scope.** README §5.5 gives the Eisenstein quadratic L-groups as 0, 0, ℤ/2, ℤ/4, differing from CDHHLMNNS-III-v4 Example 2.3.14 (line 2202); no refereed source I know of states the corrected values, which rest on this roadmap's own computation.
- **Conditional contracts.** Four supplier gaps are declared (README lines 55, 57, 71, 85); any later acceptance is conditional on them.

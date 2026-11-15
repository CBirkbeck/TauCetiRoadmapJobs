# Review of HilbertModularSurfaces (pull request #1730 at 7b8a46f)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 7b8a46f; this round reads the pull request's title and description against the head, and the gate, which now fails one check. Four findings, all P3. README abbreviates `TauCetiRoadmap/HilbertModularSurfaces/README.md`, Lean abbreviates `TauCetiRoadmap/HilbertModularSurfaces/Suggested.lean`.

## R01 (P3) — The §1.5 table promises a `Γ₀(𝔑)_𝔟` row it does not contain

**Location:** README:667–673, "Every cusp of `Γ₀(𝔑)_𝔟`, `Γ₀¹(𝔑)_𝔟`, `Γ₁¹(𝔑)_𝔟`, and of `Γ₁(𝔑)_𝔟` for squarefree `𝔑`, is of type `G(M, V)` … with (Assaf et al., Proposition 3.3.8 …)", then a table with rows for `Γ₀¹`, `Γ₁¹`, `Γ₁` only.

**Claim:** The sentence names four groups; the table gives three. The `Γ₀` type is explicit only at level one (README:690–691) and is otherwise the abstract stabilizer data of HilbertModularForms §1.4. Carried from the previous review (its R01); the folder has not changed.

**Witness:** `assaf` lines 481–485 and 551–557: `M = 𝔰⁻²𝔟⁻¹𝔑(𝔑 + 𝔐²)⁻¹`, `v ≡ 1 mod 𝔐 + 𝔑/𝔐`. `ℚ(√5)`, `𝔑 = 𝔭₂²`, `𝔐 = 𝔭₂`: `V = ⟨φ⁶⟩`, index 3 in `⟨φ²⟩`; no row yields it.

**Repair:** Add the row `| Γ₀(𝔑)_𝔟 | 𝔰⁻²𝔟⁻¹𝔑(𝔑 + 𝔐²)⁻¹ | {v ∈ R^×_{>0} : v ≡ 1 mod 𝔐 + 𝔑/𝔐} |` (Proposition 3.3.8(a); the source prints the modulus as `𝔐 + 𝔐/𝔑`, a misprint). On the instance it gives `⟨φ⁶⟩` (`φ³ ≡ 1 mod 2`); at squarefree level the modulus is `R` and it gives `R^×_{>0}`, agreeing with the Check at README:704–706.

## R02 (P3) — `CuspDatum.period` chooses its basis (gate: `statement-hygiene`, 2 hits)

**Location:** Lean:128–130, "`if h : ∃ x y : F, IsOriented v₁ v₂ x y ∧ Submodule.span ℤ {x, y} = D.M ∧ IsReduced v₁ v₂ (x / y) then hjPeriod v₁ (h.choose / h.choose_spec.choose) else []`".

**Claim:** The definition's value as a list depends on `Classical.choose`; only its `Cycle` is determined. The gate reports `h.choose` and `h.choose_spec.choose` at line 128 (P3 each, one definition) and fails.

**Witness:** `ℚ(√3)`, `M = √3·R`: the reduced oriented bases `(3 + √3, 3)` and `(3, 3 − √3)` have quotients `(3+√3)/3` and `(3+√3)/2`, with periods `[2, 3]` and `[3, 2]`; `period` may return either.

**Repair:** Take the basis as an argument. Replace `period` by

```lean
/-- `(x, y)` is an oriented basis of the lattice of `D` with reduced quotient `x / y`. -/
def IsReducedBasis (v₁ v₂ : F →+* ℝ) (D : CuspDatum F) (x y : F) : Prop :=
  IsOriented v₁ v₂ x y ∧ Submodule.span ℤ {x, y} = D.M ∧ IsReduced v₁ v₂ (x / y)

noncomputable def resolutionCycle (v₁ : F →+* ℝ) (x y : F) : List ℤ :=
  (List.replicate D.repetition ((hjPeriod v₁ (x / y)).map fun b => -b)).flatten
```

and add `{x y : F} (hxy : D.IsReducedBasis v₁ v₂ x y)` to `cycleIntersectionMatrix_negDef` (conclusion on `D.resolutionCycle v₁ x y`), and `{x y x' y' : F} (hxy : D.IsReducedBasis v₁ v₂ x y) (hxy' : E.IsReducedBasis v₁ v₂ x' y')` to `period_dual` (sums over `hjPeriod v₁ (x / y)` and `hjPeriod v₁ (x' / y')`). A scratch copy with exactly these changes elaborates with `sorry` the only warning. In README:840–842 replace the bullet by: "`CuspDatum.IsReducedBasis` holds for some basis of every datum; the Cycle of `hjPeriod v₁ (x / y)` is the same for every such basis, and `CuspDatum.resolutionCycle` changes by a cyclic relabelling"; add `IsReducedBasis` to §2.3. On the witness both bases give digit-sum `(2−3)+(3−3) = −1` and the matrix `(−2, 2; 2, −3)` or its relabelling, determinant 2.

## R03 (P3) — The description counts 47 milestones; the head has 48

**Location:** pull request description, "`TauCetiRoadmap/HilbertModularSurfaces/README.md`: the roadmap, 8 layers and 47 milestones."

**Claim:** The head has 8 layers (0–7) and 48 numbered sections.

**Witness:** Numbered `### k.n` headings in README: 5 (Layer 0) + 5 + 7 + 11 + 9 + 3 + 5 + 3 (Layer 7) = 48.

**Repair:** "`TauCetiRoadmap/HilbertModularSurfaces/README.md`: the roadmap, 8 layers and 48 numbered sections."

## R04 (P3) — The description calls the classification worked examples; the head proves it in Layer 6

**Location:** pull request description, "… the Kodaira sets, and the LMFDB hmsurface record, with the small-discriminant classification as worked examples."

**Claim:** At the head the classification is a layer of theorems, not a set of examples; the summary block above the sentence already says so ("Its top layers establish the level-one Kodaira classification").

**Witness:** README:21–22 "proved as geometric classification theorems, including the complete level-one list"; README:1694 "6.3 The smallest discriminants are rational", :1707 "6.4 The classification for D ≤ 500", :1722 "6.5 General type beyond the table".

**Repair:** "… the Kodaira sets, the level-one Kodaira classification (rationality for `D ∈ {5, 8, 13, 17}`, the classification for `D ≤ 500`, general type for `D > 500`), and the LMFDB hmsurface record; individual small-discriminant surfaces are worked examples."

## Previous findings

- R01 — not repaired: README:667–673 is unchanged; the table still has rows for `Γ₀¹(𝔑)_𝔟`, `Γ₁¹(𝔑)_𝔟` and `Γ₁(𝔑)_𝔟` only. Written again as R01 above.

Nothing was settled as not actionable; nothing is re-raised.

## Verified sound

| Statement | Instances and computed sides | Result |
|---|---|---|
| §1.5 `Γ₀` type (R01) | `ℚ(√5)`, `𝔑 = 𝔭₂²`, `𝔐 = 𝔭₂`: modulus `𝔐 + 𝔑/𝔐 = 𝔭₂`; `φ² = φ + 1`, `φ³ = 2φ + 1 ≡ 1 mod 2`; `V = {φ^{2k} : 3 ∣ 2k} = ⟨φ⁶⟩`. Squarefree `𝔑`: modulus `R`, `V = ⟨φ²⟩`. | Proposed row right; table lacks it. |
| `CuspDatum.period` (R02) | `ℚ(√3)`, `M = √3R`: `w = (3+√3)/3 ≈ 1.577`, conjugate `0.423`; `⌈w⌉ = 2`, `w₁ = 1/(2 − w) = (3+√3)/2 ≈ 2.366`, conjugate `0.634`; `⌈w₁⌉ = 3`, `w₂ = w`. Orientations `6√3 > 0` for both bases. | `[2,3]` or `[3,2]`: choice-dependent list, one Cycle. |
| `cycleIntersectionMatrix_negDef` (R02) | `M = R ⊂ ℚ(√5)`, `w = (3+√5)/2`: period `(3)`; `k = 1`: `(2 − 3) = (−1)`; `k = 2`: `(−3, 2; 2, −3)`, `−M` has minors `3`, `5`. `√3R`, `k = 1`: `(−2, 2; 2, −3)`, minors `2`, `2`. | Negative definite on both sides of the repair. |
| `period_dual` (R02) | `ℚ(√3)`, `D.M = R`, basis `(2+√3, 1)`: `w ≈ 3.732`, conjugate `0.268`, period `(4)`, sum `4 − 3 = 1`. `β = √3`, `N(β) = −3 < 0`, `E.M = √3R`: period `(2, 3)`, sum `−1 + 0 = −1`. | `1 = −(−1)`; independent of the basis chosen. |
| R03 count | Per layer 5, 5, 7, 11, 9, 3, 5, 3. | 48, not 47. |

The rows for every other statement stand as in the previous review, of 7b8a46f.

- Gate at this head: every check zero except `statement-hygiene=2` (R02); build passes; result `FAIL`. No file changed outside the folder (`git diff --stat origin/main...HEAD` outside it is empty).
- Dependency check, run on this head: `depcheck: 244 roadmaps, 2232 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean` on Lean gives exactly four `declaration uses sorry` warnings (Lean:86, 145, 152, 175) and nothing else. The R02 repair was elaborated on a scratch copy: four `sorry` warnings, no error.
- Source lines read this round: `assaf` 479–487 (Proposition 3.3.8(a)–(b)) and 549–558 (proof, case (a)). No seeded target lies in a changed passage (the folder did not change); no README locator is marked unverified.
- Cross-roadmap citation resolved this round: HilbertModularForms §1.4 "Cusps" exists at the head of its pull request (README line 583). `overlaps.md` lists no dropped id, no second copy, no other pull request changing this folder; all 22 leads of `citations.md` are this roadmap's own declarations (present in Lean) or LMFDB knowl names, not missing citations.
- Pull request text otherwise checked against the head: title; the summary block (every nonzero level, narrow classes, `Γ₀` and `Γ₀¹`, `Γ₁` and full-level cusp theory at README:544 and :709, arbitrary multiplier order at README:48–49, the two-form comparison §4.8, the deferral from HilbertModularForms at README:2035–2038); `metadata.toml` is `topic = "math.AG"`; the file adds 16 declarations as listed.
- Remark, no change asked: the description's sentence "Builds on the sibling drafts #1724 (HilbertModularForms)" names one of the six open suppliers the README consumes; the generated `depends-on` block below it lists all six.
- Overlap check: read HilbertModularForms (Layer 1 at its head); the groups, their cusps and form spaces are HilbertModularForms', cited at README:77–80; SiegelModularForms, QuaternionArithmetic, BianchiModularForms, ShimuraCompactifications and NoncongruenceModularForms were not re-read this round (unchanged folder; nothing shared in the previous reviews).

Source independence: changed passages only: the folder has 0 changed lines, so 0 passages compared this round; the arrangement was not compared again (no layer added, removed or reordered) and the largest-share count was not recomputed.

## Not verifiable

- van der Geer (1988) and Prestel (1968): settled uncertified in the manifest; cited by locator only. Nothing new this round.

## Source issues

- **Misprint** in assaf at Proposition 3.3.8(a), preprint p. 10, line 485: the source prints the modulus of v ≡ 1 as 𝔐 + 𝔐/𝔑; it should be 𝔐 + 𝔑/𝔐, as the proof's min(f, e − f) at line 556 shows; affects nothing.

## For the human reviewers

- none

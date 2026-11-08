# Review of SmoothBanachRepresentations (pull request #1145 at ff2225b)
Folder: `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/`

**Verdict:** needs changes

:robot: Incremental AI re-review of the 13 lines changed since 22e3c68. Three of the four previous findings are repaired, and the gate now passes with the build. Two P3 findings remain and neither is blocking. One is the family-index finding carried from earlier rounds. The other is new: the rewritten consumer list names OperatorKTheory, an earlier and independent roadmap, as a user of §8.1.

## R01 (P3) — The family index still has no entry, and the companion pull request has no stated order

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:11` (“## The roadmaps”). The brief makes the family index part of this pull request. At this head the index has 14 bullets and none links `SmoothBanachRepresentations/README.md`.

**Claim:** The index says it is “the index and the map of how they fit together” (its :5), so it lists every roadmap of the family. This is carried from the previous report's R04, and from R01 before that. No repair report marks it not actionable.

**Witness:** `grep SmoothBanach TauCetiRoadmap/RepresentationTheory/README.md` at ff2225b returns nothing. The open RepresentationTheory pull request #1146 (head e5e8364) adds the bullet at its :55 and the sentence at :118–121. This pull request's description names #1143, #1015 and #1037. It does not name #1146.

**Repair:** Do one of the following. Either move #1146's bullet and its :120 sentence into this pull request, and close #1146. Or add one line to this pull request's description: “#1146 adds the family-index entry for this roadmap and merges after this pull request, because its link points into this folder.”

## R02 (P3) — OperatorKTheory is listed as a consumer of §8.1, but it is an earlier roadmap that never cites this one

**Location:** `README.md:521`, “[OperatorKTheory K3] uses the inverse-closed Fréchet star-algebra input of §8.1 and owns the K₀/K₁ comparison.” Also `README.md:494`, “the dense inverse-closed Fréchet star-algebra input of OperatorKTheory K3”.

**Claim:** The rewritten list says that K3 consumes §8.1. OperatorKTheory is at line 9 of the merge order, and this roadmap is at line 67. Read literally, the bullet describes a supply edge running upward. In fact K3 §3.5 is stated for arbitrary dense inverse-closed Fréchet subalgebras and depends on nothing here. §8.1 supplies an instance of K3's hypotheses; it is not an input K3 uses. The other three bullets (M0, CompactQuantumMetricSpaces, QuantitativeOrbitMethod) are genuine consumers, all later in the order.

**Witness:** At OperatorKTheory's head (c0a811d6), `SmoothBanachRepresentations` occurs 0 times. Its §3.5 (:696–715) assumes a metrizable complete locally convex *-algebra, continuously and densely embedded in A and inverse-closed at matrix level. Its Check at :717 proves `C^∞(𝕋)⊆C(𝕋)` directly.

**Repair:** Delete the bullet at :521 and put this sentence after the list: “§8.1's smooth algebras of C*-algebra actions satisfy the hypotheses of OperatorKTheory K3 §3.5, which states the K₀/K₁ comparison for arbitrary dense inverse-closed Fréchet star subalgebras and does not depend on this roadmap.” At :494, write “OperatorKTheory K3 §3.5”. I checked the sentence against K3 §3.5's hypotheses at :701–707, for complex C*-algebras A:
- dense complete Fréchet subalgebra: §8.1 :488;
- continuous multiplication: :488;
- continuous star: :490;
- matrix inverse closure and the unitization comparison: :492.

The rotation action on C(𝕋) gives K3's own Check, `A∞=C^∞(𝕋)`.

## Previous findings

- R01 — repaired: `README.md:11`: “consumes Layers 0–4, read on a complex Hilbert space, for the integrated operators, Gårding space, smooth vectors, mixed-word domains and derived Lie and enveloping actions … skew-symmetry …, Nelson's operator, analytic vectors, and the elliptic and central closures”. M0 is restored as a consumer at :518.
- R02 — repaired: `Suggested.lean:1–3` is now `module`, a blank line, then `import Mathlib`. The gate rerun with `--build` gives `build=0 … OK`.
- R03 — repaired: `README.md:506`: “with the left rotations (α_t f)(x)=f(x−t) of §1.4 … Df=−i·exp(ix) and D(f*)=i·exp(−ix)=(Df)* … −(Df)* would give −i·exp(−ix) instead.” The values are recomputed in row 3 below.
- R04 — not repaired: the family index at this head has no bullet for this roadmap, and the description does not name #1146. This report carries it as R01.

## Verified sound

Head `ff2225b60d8b95f217c7fc8a7a8e40a59572445a`, worktree clean, main `eaf17b1`. Against 22e3c68, only the folder's `README.md` (+8/−3) and `Suggested.lean` (+2) changed. The outside-folder diff against `origin/main` is empty. The pins have not moved since the previous report: Mathlib 1b1ccf4, Tau Ceti 2fd255d. This review changed no file in the worktree.

### Gate, dependency direction and Lean

- The gate was rerun by this review with the candidate order and `--build`. Every scanner is at 0, including `depcheck=0`, `build=0` and `imports=0`, and the result is `OK`. The `module` line before `import Mathlib` passes the import rule.
- The movable dependency check printed exactly:

```text
depcheck: 239 roadmaps, 2366 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or moved line. The diff adds no `*Needs:*` edge. All of its new cross-roadmap links are in Downstream consumers.
- `lake env lean` on `Suggested.lean` gives seven “declaration uses `sorry`” warnings (lines 94, 103, 115, 134, 147, 164, 182) and nothing else.
- A scratch copy with `#check @name` for all 12 declarations elaborated. All 12 types match the worker's signature file, whitespace-normalised, so the `module` header changed no type. The six defs keep only the binders their bodies use, as recorded before. All seven theorems carry the full section context.
- One-tactic probe on a scratch copy, with `first | rfl | infer_instance | fun_prop | simp` in place of each `sorry`: 7 of 7 fail (“`simp` made no progress” ×4, “unsolved goals” ×3). No padding.
- Headline theorems, from the module docstring and README: smoothing (`isSmoothLieVector_smear`), density (`dense_smoothLieVectors`), the scalar parametrix (`scalarParametrix`), vector and function Dixmier–Malliavin (`dixmierMalliavin`, `dixmierMalliavin_function`), smooth lifting (`smooth_lift`) and inverse closure (`smooth_inverse`). All seven are stated. The docstring says these are not statable at the pins, and names the missing carrier for each: the mixed-word Fréchet topology and finite-regularity criterion, the continuous Lie/enveloping action, smooth-topology approximation, topological exactness, the smooth tensor comparison and holomorphic closure. None of this changed.

### Adversarial computations on the changed statements

| # | Statement | Instances and values | Result |
|---|---|---|---|
| 1 | :11, M0 consumes Layers 0–4 for π(f), the Gårding space, smooth vectors, mixed-word domains and the derived Lie and enveloping actions | M0 at 70440b4: :20, :94 and item 1 at :729–737 consume exactly these; *Needs:* at :789 lists SBR Layers 0–4. In this README they are §1.3 π(f), §3.3 π(f)v∈E∞, §4.1 density, §0.3 mixed words, §§3.1–3.2 dπ and the enveloping action. The Gårding subspace is the span of the π(f)v (Casselman p.1). | True |
| 2 | :11, M0 owns skew-symmetry, Nelson's operator, analytic vectors and the elliptic and central closures; Layers 0–4 state none of them | M0 :20 has the same four-item list, 4 of 4 matching. M0 :738–786 proves them. This README mentions “Nelson”, “analytic” or “elliptic” only at :11. “skew” occurs at :38 (a convention remark) and :506 (the wrong model of a Check), and neither states the adjoint law. Unitary case: (π(t)f)(x)=f(x−t) on L²(ℝ) is a `ContRepresentation ℂ ℝ L²` with continuous orbits and ‖π(t)‖=1. | True |
| 3 | :506, star law with (α_t f)(x)=f(x−t) | f=e^{ix}: α_t f=e^{−it}e^{ix}, so Df=−i e^{ix}. f*=e^{−ix}: α_t f*=e^{it}e^{−ix}, so D(f*)=i e^{−ix}. (Df)*=conj(−i)e^{−ix}=i e^{−ix}, equal to D(f*). −(Df)*=−i e^{−ix}≠D(f*). With f(x+t): Df=i e^{ix}, D(f*)=−i e^{−ix}=(Df)*, and −(Df)*=i e^{−ix}. All four values flip sign and the star law still holds. | True, and it discriminates the star law from the skew law |
| 4 | :506 against §1.4 (:148), `L_g f(x)=f(g⁻¹x)` | On S¹=ℝ/2πℤ with g=t, g⁻¹x=x−t, so L_t f(x)=f(x−t). Casselman p.1 uses the same convention, π(y)π(f)=π(L_y f) with L_y f(z)=f(y⁻¹z). | Consistent |
| 5 | :506 against Conventions :38 and §8.1 :490, `dα(X)(a*)=(dα(X)a)*` | Same law. With E=C(S¹), X=∂_t and a=e^{ix}, both sides are i e^{−ix} (row 3). | Consistent |
| 6 | :506 against Check 4 (:505) under the stated rotation | D e^{ix}=−i e^{ix}. D²(e^{2ix})=(−2i)²e^{2ix}, which is −4 at 0. Leibniz gives −1+2(−i)(−i)−1=−4. The derivation rule gives −1−1=−2. Check 4 involves only squares, so it does not depend on the direction. | Consistent |
| 7 | :518, M0 item 1 uses Layers 0–4 in the unitary case | M0 item 1, :729–795. Merge order: M0 at line 150, after SBR at line 67. | True, downward |
| 8 | :519, CompactQuantumMetricSpaces §4.5 uses §2.1, §3.1 and §8.1 | Its head 9647ef86: §4.5 heading :1095; *Needs:* at :1106–1108 lists SBR §2.1, §3.1 and §8.1; supplier list at :268–272; Dependencies at :1151. Merge order line 207. | True, downward |
| 9 | :520, QuantitativeOrbitMethod §§0.2 and 0.6 use §2.1, §§3.1 and 3.4, and §6.1 | Its head 70c9a0e0: supplier contract at :125 names §2.1, §§3.1 and 3.4, and §6.1, “used in §0.6”. §0.2 *Needs:* (:244) names §2.1; §0.6 *Needs:* (:328) names §3.4. This README's :393 identifies the Gårding domain with E∞. Merge order line 285. | True, downward |
| 10 | :521, OperatorKTheory K3 uses §8.1 | Its head c0a811d6: 0 occurrences of SBR. K3 §3.5 (:696–715) is abstract. Merge order line 9, before line 67. | Misdescribed; R02 |
| 11 | `Suggested.lean:1`, `module` header | Gate `build=0`. Seven `sorry` warnings only. 12 of 12 types unchanged. | Sound |
| 12 | Headlines in `Suggested.lean`, statements unchanged | One-tactic probe fails on 7 of 7. | Stand |

Every other row stands as recorded in the previous report (its rows 1–10) and in the reports before it. The diff leaves those statements untouched, and the pins are unchanged.

### Library declarations reopened at the pins

- `ContRepresentation` at `Mathlib/RepresentationTheory/Continuous/Basic.lean:55`, and `ContIntertwiningMap` at :81.
- `contDiffAt_ringInverse` at `Mathlib/Analysis/Calculus/ContDiff/Operations.lean:779`, under `[HasSummableGeomSeries R]`.
- `ContDiffAt.comp_contMDiffAt` at `Mathlib/Geometry/Manifold/ContMDiff/NormedSpace.lean:84`.

These are the inputs that §8.1 and the headline `smooth_inverse` name. The other 14 declarations in the supplier contracts were resolved at these same pins by the previous report.

### Cross-roadmap citations resolved this round

| Citation | Resolved passage | Result |
|---|---|---|
| NoncompactQuantumSymmetry M0 and its anchor (:11, :518) | Head 70440b4, heading :648 “Layer 3: M0 — Smooth vectors, compact types and semisimple representation bridges”. GitHub's slug is `layer-3-m0--smooth-vectors-compact-types-and-semisimple-representation-bridges`, which matches. “item 1” is at :729. | Resolves |
| CompactQuantumMetricSpaces §4.5 (:519) | Head 9647ef86, :1095 “4.5 Derivative seminorms on compact connected Lie groups” | Resolves |
| QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups §§0.2, 0.6 (:520) | Head 70c9a0e0, :234 “0.2 Representation Sobolev scales” and :324 “0.6 The Sobolev operator algebra” | Resolves |
| OperatorKTheory K3 (:494, :521) | Head c0a811d6, :533 “K3. Bott periodicity, boundary maps, and products”, with §3.5 at :696 | Resolves; the consumer wording is R02 |
| Relative links | `../../<Name>/README.md`, taken from the folder, reaches `TauCetiRoadmap/<Name>/README.md` for all four, which matches each head's layout | Resolve |

`roadmaps grep SmoothBanachRepresentations` over the 466 open heads and main finds:
- consumers: M0, CompactQuantumMetricSpaces and QuantitativeOrbitMethod, all three listed;
- suppliers that mention this roadmap's scope: AutomorphicFormsOnReductiveGroups :7 and :1312, CompactGroups :23 and :1289, NoncommutativeGeometry's revision :22, :58 and :1257, and BanachAlgebras on main :1627;
- the family-index pull request #1146 (R01).

AutomorphicFormsOnReductiveGroups :1312 gives M0 the Hilbert smooth/analytic comparisons, which agrees with :11. No passage gives a second owner to anything the diff assigns.

### Ownership against open work

The overlap tool, rerun, reports no other pull request changing this roadmap and no dropped or revision-only ids. It lists the same five closest roadmaps (AutomorphicFormsOnReductiveGroups, NoncommutativeGeometry, SpectralManifolds, CompactGroups, AutomorphicSpectralTheoryPartII). The diff moves no ownership: the adjoint statements were already M0's at its head.

### Seeded source sample

Where the diff falls in the sample:
- 1.4, cited by the repaired Check: no external locator. Its convention matches Casselman p.1 (row 4).
- 3.1, 3.4 and 6.1, named in the new consumer bullets: what each bullet attributes to them is checked in rows 8–9. §6.1's locator, Casselman Proposition 6.1, p.13, was reread in the text from Casselman's author page. For v∈V∞ and the fixed identity neighbourhood Ω on which exp is a diffeomorphism, it gives a finite sum v=Σπ(f_j)v_j with f_j∈C_c∞(Ω) and v_j∈V∞. Taking Ω inside a smaller neighbourhood gives the arbitrary-U form that §6.1 states. Casselman p.1 defines the Gårding subspace as the span of the π(f)v, which supports “Gårding space” at :11.
- 8.1: no external locator. Its library inputs are above.

The other sampled targets (0.1–0.3, 1.2, 1.3, 1.5, 3.2, 7.2–7.4) lie outside the diff and were not reread. Their locator checks stand as earlier rounds recorded them.

## Not verifiable

- Dixmier–Malliavin, *Factorisations de fonctions et de vecteurs indéfiniment différentiables* (1978): no legal readable copy, as in earlier rounds. The README labels its locators uncertified, and nothing in the diff depends on it.
- The five board packages listed in the brief are unrelated arithmetic and logic packages; their contents were not fetched.

## Source issues

- **Misprint** in Casselman, *The theorem of Dixmier & Malliavin* (revision of 24 January 2016) at Proposition 6.1, p.13 (proof): the source says π(µ0)α0 = v + π(µ1)v, and with α1 = v this gives v = π(µ0)α0 + π(µ1)α1; it should be v = π(µ0)α0 − π(µ1)α1, or µ1 replaced by −µ1; affects nothing.

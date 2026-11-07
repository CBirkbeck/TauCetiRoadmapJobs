# Review of SmoothBanachRepresentations (pull request #1145 at 2e5d798)
Folder: `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/`

**Verdict:** needs changes

This is an incremental re-review of the 8 lines changed since ff2225b. Two P3 findings remain and neither is blocking:
- R01 is carried from the previous report: the family index still has no entry for this roadmap.
- R02 is new: the asterisks added in §8.1 and its new Check render as Markdown emphasis. On GitHub this deletes the star hypothesis and garbles the computed values.

## R01 (P3) — The family index still has no entry, and the companion pull request has no stated order

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:11` (“## The roadmaps”). The brief makes the family index part of this pull request. At this head the index has 14 bullets, and none links `SmoothBanachRepresentations/README.md`.

**Claim:** The index calls itself “the index and the map of how they fit together” (:5), so it lists every roadmap of the family. This finding is carried from the previous report's R01, which carried R04 and R01 before it. The head commit does not address it, and I have no repair report that marks it not actionable.

**Witness:** `grep SmoothBanach TauCetiRoadmap/RepresentationTheory/README.md` at 2e5d798 returns nothing. Pull request #1146 (head e5e8364) adds the bullet at its :55 and a sentence at :119–122. Its link target, `SmoothBanachRepresentations/`, does not exist at that head. This pull request's description does not name #1146.

**Repair:** Choose one:
- move #1146's bullet and its :120 sentence into this pull request, and close #1146; or
- add this line to the description: “#1146 adds the family-index entry for this roadmap and merges after this pull request, because its link points into this folder.”

## R02 (P3) — Unescaped `*` in the new §8.1 paragraph and Checks renders as emphasis and removes the star hypothesis

**Location:**
- `README.md:494`: “by *-automorphisms of a complex C*-algebra A”.
- `README.md:507`: “so (dα(E₁₂))*=E₂₁, while dα(E₁₂*)=dα(E₂₁)=−E₂₁”.
- `README.md:506`, the companion star-law Check, has the same defect: “D(f*)=i·exp(−ix)=(Df)*, the star law. The Hilbert skew-adjoint sign −(Df)* would give”. This line dates from before ff2225b, and earlier rounds missed it.

**Claim:** Under CommonMark's flanking rules (spec §6.2), each of these pairs of `*` opens and closes emphasis. GitHub renders the text between them in italics and drops both asterisks:
- At :494 the displayed hypothesis becomes “by -automorphisms of a complex C-algebra A”. This hides the very star-preserving condition that this head adds.
- At :507 the display reads “(dα(E₁₂))=E₂₁, while dα(E₁₂)=dα(E₂₁)=−E₂₁”. Together with “dα(E₁₂)=E₁₂” earlier in the line, the rendered Check asserts three incompatible values.

**Witness:** A CommonMark renderer (markdown-it, commonmark mode) puts emphasis on these spans:
- :494: `<em>-automorphisms of a complex C</em>`;
- :507: `<em>=E₂₁, while dα(E₁₂</em>`;
- :506: `<em>, the star law. The Hilbert skew-adjoint sign −(Df)</em>`.

**Repair:**
- At :494, write `\*-automorphisms`, `C\*-algebra` and `dense \*-subalgebra`. ClassicalGroups on main already writes `C\*-algebra` this way.
- At :507, put `(dα(E₁₂))*=E₂₁`, `dα(E₁₂*)=dα(E₂₁)=−E₂₁` and `dα(E₂₁)=−iE₂₁=(iE₁₂)*` in code spans.
- At :506, put `D(f*)=i·exp(−ix)=(Df)*` and `−(Df)*` in code spans.

I tested this repair on a scratch copy. The three repaired lines render with no emphasis, and every asterisk is visible. Line :523 already renders correctly.

## Previous findings

- R01 — not repaired: `TauCetiRoadmap/RepresentationTheory/README.md` at 2e5d798 still has 14 bullets and no link to `SmoothBanachRepresentations/README.md`. The description names #1143, #1015 and #1037, but not #1146. Carried as R01.
- R02 — repaired: :523 now reads “[OperatorKTheory K3 §3.5] is not a consumer: it states the K₀/K₁ comparison for arbitrary dense inverse-closed Fréchet star subalgebras of C*-algebras”. The consumer bullet is gone, and :494 cites “OperatorKTheory K3 §3.5” together with its hypotheses. The repair's new text has the rendering defect R02.

## Verified sound

Head `2e5d7985d1cd69b6428e42278798457565862a0d`, worktree clean, main `eaf17b1`.
- Against ff2225b, only the folder's `README.md` changed (+4/−4). `Suggested.lean` and `lake-manifest.json` are unchanged.
- The pins are Mathlib 1b1ccf4 and Tau Ceti 2fd255d.
- The outside-folder diff against `origin/main` is empty.
- This review changed no file in the worktree or in the board manifest.

### Gate, dependency direction and Lean

- **Gate**, rerun with the candidate merge order and `--build`: every scanner reports 0, including `depcheck=0`, `build=0`, `statement-hygiene=0` and `outside-folder=0`, and the result is `OK`. Run without `--order`, the gate prints `depcheck: NOT IN ORDER: SmoothBanachRepresentations` against the configured order. That is the placement the worker makes on submission, not a finding.
- **Movable dependency check** output:

```text
depcheck: 239 roadmaps, 2427 edges, 0 problem(s)
```

  It prints no UPWARD, CYCLE or moved line. The diff adds no `*Needs:*` edge. Its one new cross-roadmap citation, OperatorKTheory, is at line 10 of the candidate order; this roadmap is at line 70.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives exactly seven warnings, all “declaration uses `sorry`” (:94, :103, :115, :134, :147, :164, :182).
- **Signatures:** a scratch copy with `#check @name` for all 12 declarations elaborated. All 12 types are identical, whitespace-normalised, to the worker's signature file. The six defs keep only the binders their bodies use, as recorded before; the seven theorems carry the full context. Nothing changed.
- **One-tactic probe:** in a scratch copy, each `sorry` was replaced by `first | rfl | infer_instance | fun_prop | simp`. It fails on 7 of 7: “`simp` made no progress” at :98, :106, :169 and :187, and “unsolved goals” at :128, :141 and :153. There is no padding.
- **Headline theorems:** `isSmoothLieVector_smear`, `dense_smoothLieVectors`, `scalarParametrix`, `dixmierMalliavin`, `dixmierMalliavin_function`, `smooth_lift` and `smooth_inverse`. All seven are stated. The module docstring names the carriers that are not statable at the pins. Unchanged.

### Adversarial computations on the changed statements

| # | Statement | Instances and values | Result |
|---|---|---|---|
| 1 | :494, A∞ is metrizable, complete, Hausdorff and locally convex, by §2.1 | §2.1 (:199) proves this. With dim 𝔤=n, there are Σ_(j≤m) n^j words of length ≤m: m+1 for 𝕋 (n=1), and 1+3+9=13 at m=2 for SU(2) (n=3). That gives countably many seminorms, so the topology is metrizable. p₀=‖·‖ separates points. | True |
| 2 | :494, A∞ is dense, by §4.1 | `dense_smoothLieVectors` (:292) assumes `HasContinuousOrbits`. A *-automorphism of a C*-algebra is isometric, so §8.1's hypothesis “bounded linear algebra automorphisms” (:488) holds. On C(𝕋), trigonometric polynomials lie in A∞, and their Fejér means converge uniformly. | True |
| 3 | :494, continuous multiplication and star | Multiplication is the Leibniz estimate (:488), and star is :490. For real X, A_w(a*)=(A_w a)*, and the C*-star is isometric, so p_m(a*)=p_m(a). With f=e^{ix}: p₁(f)=1+1=2=p₁(f*). | True |
| 4 | :494, inverse closure at every matrix level and after unitization | `smooth_inverse` (:492). For f=2+e^{ix} on C(𝕋): \|f\|≥1. At x=0, f=3 and Df=−i, so D(1/f)(0)=−f⁻²Df=i/9. The rule −a⁻¹dα(X)(a)a⁻¹ gives −(1/3)(−i)(1/3)=i/9. For matrices, M_n(A) with α⊗id. For nonunital C₀(ℝ) with translations, Ã∞=C₀(ℝ)∞⊕ℂ. | True |
| 5 | :494 against K3 §3.5's hypotheses | OperatorKTheory head 5dbc4acd, :785–791. It asks for a dense subalgebra that is metrizable, complete, Hausdorff, locally convex and complex, with continuous multiplication and continuous star, an injective continuous dense *-map into A, inverse closure, and inverse-closed unitization. Each is matched by rows 1–4. K3's Check at :805 is the case G=𝕋. Trivial G gives A∞=A and p_m=‖·‖. | True |
| 6 | :494 and :523, “K3 §3.5 does not depend on this roadmap”; “not a consumer” | `SmoothBanachRepresentations` occurs 0 times at OperatorKTheory 5dbc4acd. `roadmaps grep` finds no hit in OperatorKTheory's pull request. Its *Needs:* (:781–783) names only its own K3, K2, AlgebraicKTheory and Mathlib. | True |
| 7 | :507, conjugation by diag(e^t,1) on M₂(ℂ) does not preserve the star | α_t(E₁₂)=e^tE₁₂, so dα(E₁₂)=E₁₂. α_t(E₂₁)=e^{−t}E₂₁, so dα(E₂₁)=−E₂₁. Then (dα(E₁₂))*=E₂₁≠−E₂₁=dα(E₁₂*). At t=1: α(E₁₂)*=eE₂₁ but α(E₁₂*)=e^{−1}E₂₁. It is an algebra automorphism, and diag(e^s,1)diag(e^t,1)=diag(e^{s+t},1). | True; the values are right |
| 8 | :507, conjugation by the unitary diag(e^{it},1) | dα=[iE₁₁,·]: [iE₁₁,E₁₂]=iE₁₂ and [iE₁₁,E₂₁]=−iE₂₁. (iE₁₂)*=−iE₂₁=dα(E₁₂*). | True |
| 9 | :507 against Check 2 (:503) and Conventions (:38) | Check 2 uses the same diag(e^t,1) on M₂(ℝ), where a=I+E₁₂ has derivative E₁₂, which agrees with row 7. :38's law `dπ(X)(a*)=(dπ(X)a)*` is the law tested. | Consistent |
| 10 | :511, Examples | Row 7 against row 8 separates star-preserving from merely algebraic actions. | Consistent |
| 11 | Rendering of :494, :506 and :507 | Emphasis spans are given under R02. | R02 |
| 12 | `smooth_inverse`, whose Lean statement is unchanged | The probe fails (“`simp` made no progress”, :187). The type is identical to the signature file. | Stands |

The previous report's rows 1–12, and the rows of the reports before it, still stand for every statement the diff leaves untouched: the seeded targets 0.1, 0.2, 1.1, 1.3, 1.5, 3.1, 3.3, 3.4, 5.1, 7.2, 7.2a, 7.3 and 7.4, and the other six headline theorems. The pins are unchanged.

### Cross-roadmap citations resolved this round

| Citation | Resolved passage | Result |
|---|---|---|
| OperatorKTheory K3 §3.5 (:494, :507, :523) | The checkout moved during this review from c0a811d6 to 5dbc4acd. At 5dbc4acd, :603 is “## K3. Bott periodicity, boundary maps, and products” and :779 is “### 3.5 Dense inverse-closed Fréchet subalgebras”. The hypotheses paragraph is unchanged from c0a811d6, and :797 gives the K₀/K₁ isomorphism. | Resolves |
| Relative link `../../OperatorKTheory/README.md` | From the folder, it reaches `TauCetiRoadmap/OperatorKTheory/README.md`, which is that head's layout. | Resolves |
| Consumers at :519–521 | Unchanged by the diff. Resolved in the previous report: M0 at 70440b4, CompactQuantumMetricSpaces §4.5 at 9647ef86, QuantitativeOrbitMethod §§0.2, 0.6 at 70c9a0e0. All three are later in the order (lines 153, 210 and 288). | Stand |

`roadmaps grep --fixed SmoothBanachRepresentations` finds the same set as last round: NoncompactQuantumSymmetry, AutomorphicFormsOnReductiveGroups, CompactGroups, NoncommutativeGeometry, CompactQuantumMetricSpaces, QuantitativeOrbitMethod, the family index (#1146) and one passage on main. OperatorKTheory is not among them.

### Ownership against open work

I reran `roadmaps overlaps`. No other pull request changes this roadmap, and it lists no dropped or revision-only ids. The closest roadmaps are the same five as before. The diff assigns no new ownership: it withdraws a consumer claim and records an application of K3 §3.5, which K3 owns.

### Seeded source sample

The changed passage at :494 names §2.1 and §4.1. Their locator, Casselman p.1, was reread in the text from the author's page:
- extraction lines 11–20 give the iterated domains V^(n) and the Fréchet seminorms ‖π(X)v‖_ρ;
- line 36 gives density through a Dirac sequence;
- line 37 defines the Gårding subspace.

This supports what :494 attributes to §2.1 and §4.1. §8.1 carries no external locator; its library inputs `contDiffAt_ringInverse` and `ContDiffAt.comp_contMDiffAt` were opened at the pins in the previous report. The other sampled targets lie outside the diff, and their checks stand as earlier rounds recorded them.

## Not verifiable

- Dixmier–Malliavin, *Factorisations de fonctions et de vecteurs indéfiniment différentiables* (1978): no legal readable copy, as in earlier rounds. The README labels these locators uncertified, and the diff does not touch them.
- The three board packages in the brief's index (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) are unrelated to this roadmap. Their contents were not fetched.

## Source issues

- none

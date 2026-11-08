# Review of SmoothBanachRepresentations (pull request #1145 at 2b062ae)
Folder: `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/`

**Verdict:** needs changes

This is an incremental re-review of the 14 lines changed since 2e5d798. Only the folder's `README.md` changed. One finding remains, R01 (P3), carried from the previous report. It is not blocking. The repair of the previous R02 is correct and introduces nothing new.

## R01 (P3) — The family index still omits this roadmap, and its scope paragraph excludes what this roadmap covers

**Location:** this pull request's own family index, `TauCetiRoadmap/RepresentationTheory/README.md`:
- `:11` “## The roadmaps” has 14 bullets, and none links `SmoothBanachRepresentations/README.md`;
- `:129–131` reads: “The analytic representation theory stops at compact groups (Peter-Weyl, compact Frobenius-Schur): no infinite-dimensional unitary representations of noncompact groups”.

**Claim:**
- The index calls itself “the index and the map of how they fit together” (:5). It lists all 14 other subfolders of the family, but not this one.
- Its scope boundary at :129–131 excludes infinite-dimensional unitary representations of noncompact groups for every roadmap in the family. That contradicts this roadmap's own scope. Its README :11 says “Layers 0–4 cover unitary actions as a special case”, and NoncompactQuantumSymmetry M0 consumes them for strongly continuous unitary representations of noncompact Lie groups.
- This is carried from the previous report's R01, which itself carried two earlier findings. The head commit touches only the folder README. I found no repair report that marks this finding not actionable.

**Witness:**
- Grepping `](<dir>/README.md)` in the index for each of the 15 subfolders matches 14 of them; `SmoothBanachRepresentations` gives 0.
- Pull request #1146 (head e5e8364) adds the bullet at its :55 and rewrites the scope bullet at :119–123. Its link target does not exist at that head.
- This pull request's description names #1037, #1015 and #1143, but not #1146.

**Repair:** Choose one:
- Move #1146's :55 bullet and its :119–123 scope bullet into this pull request's `TauCetiRoadmap/RepresentationTheory/README.md`, the scope bullet replacing :129–134, and close #1146. Afterwards the grep matches 15 of 15, and the scope bullet no longer excludes the unitary case that Layers 0–4 cover.
- Or add this line to the description: “#1146 adds the family-index entry and scope change for this roadmap and merges right after this pull request, because its link points into this folder.”

## Previous findings

- R01 — not repaired: `TauCetiRoadmap/RepresentationTheory/README.md` at 2b062ae still has 14 bullets under “## The roadmaps” and none for `SmoothBanachRepresentations`. The description still does not name #1146. Carried as R01.
- R02 — repaired: :494 now reads “by \*-automorphisms of a complex C\*-algebra A … a dense \*-subalgebra”. :506 and :507 put `D(f*)=i·exp(−ix)=(Df)*`, `−(Df)*`, `(dα(E₁₂))*=E₂₁` and `dα(E₁₂*)=dα(E₂₁)=−E₂₁` in code spans. A CommonMark render shows no emphasis.

## Verified sound

**Head and diff.**
- Head `2b062ae505828ba60173c0b87dbbb6110aa0d769`, worktree clean, main `eaf17b1`.
- Against 2e5d798, only the folder `README.md` changed (+7/−7), at :173, :395, :490, :494, :506, :507 and :523.
- `Suggested.lean` is unchanged.
- The diff against `origin/main` outside the folder and the family's own files is empty.
- This review changed no file in the worktree or the board manifest.

**Gate.** I reran it with `--order` set to the candidate merge order and with `--build`:
- every scanner reports 0, including `build=0`, `statement-hygiene=0`, `depcheck=0`, `outside-folder=0` and `stray-files=0`;
- the result is `OK`, the same as the worker's gate file.

**Dependency check** (`--depcheck … --movable`, candidate order):

```text
depcheck: 239 roadmaps, 2427 edges, 0 problem(s)
```

- There is no UPWARD, CYCLE or moved line, and the diff adds no `*Needs:*` edge.
- In the candidate order, OperatorKTheory is at line 10, AutomorphicFormsOnReductiveGroups at 69 and this roadmap at 70. Its consumers NoncompactQuantumSymmetry, CompactQuantumMetricSpaces and QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups are at 153, 210 and 288.

**Elaboration.** `lake env lean` on `Suggested.lean` gives exactly seven warnings, all “declaration uses `sorry`”, at :94, :103, :115, :134, :147, :164 and :182.

**Signatures.** I elaborated a scratch copy with `#check @name` for all 12 declarations:
- After removing the namespace prefix and renaming universe and instance binders, all 12 types are identical to the worker's signature file.
- Of the six declarations the signature file flags as having lost section binders, five are defs and one is an abbrev. Each keeps the binders its body uses, as in previous rounds.
- The seven theorems keep the full context (`hFD`, `hLie`, `hManifold`, `hT2`, `hBoundary`, `hBorel`, `hLC`, and `hComplete` where it is not omitted).
- Nothing changed.

**One-tactic probe.** In a scratch copy, each `sorry` was replaced by `first | rfl | infer_instance | fun_prop | simp`. It fails on all 7 theorems:
- “`simp` made no progress” at :98, :106, :169 and :187;
- “unsolved goals” at :128, :141 and :153.

There is no padding.

**Headline theorems.** All seven are stated: `isSmoothLieVector_smear`, `dense_smoothLieVectors`, `scalarParametrix`, `dixmierMalliavin`, `dixmierMalliavin_function`, `smooth_lift` and `smooth_inverse`. The module docstring names the headlines that cannot be stated at the pins and the carrier each lacks: the mixed-word Fréchet topology, the completed locally convex tensor, the distribution-to-smooth-dual interface and the Banach-algebra holomorphic calculus. The diff changes none of this.

**Rendering.** I parsed the README with markdown-it 3.0.0 in its CommonMark preset:
- At this head, the only emphasis spans are the 21 `*Needs:*` labels and the three reference titles.
- At 2e5d798 the parser also found the three spans R02 reported, at :494, :506 and :507.
- Every asterisk in the seven changed lines appears in the rendered HTML, as `*-automorphisms`, `C*-algebra`, `*-subalgebra` or inside `<code>`.
- No code span contains a `\*`.

### Adversarial computations on the changed statements

| # | Statement | Instances and values | Result |
|---|---|---|---|
| 1 | :173, on S₃ with counting measure, `δ_s*δ_t=δ_(st)` | Under the convention at :30, `(δ_s*δ_t)(x)=Σ_y δ_s(y)δ_t(y⁻¹x)=δ_t(s⁻¹x)`, which is nonzero only at x=st. Composing right to left, (12)(23)=(123) and (23)(12)=(132): two different 3-cycles. Composing left to right swaps the two, and they still differ. | True. The code span changes no value. |
| 2 | :395, `dixmierMalliavin_function`: φ is `Σ_j f_j*h_j` with tsupport(f_j)⊆U and tsupport(h_j)⊆tsupport(φ) | The Lean conclusion `φ x = ∑ j, ∫ y, f j y * h j (y⁻¹ * x) ∂μ` is the :30 convolution, summed over `Fin n`. On the trivial group of mass 2 with φ(1)=c, take n=1, f=1/2 and h=φ; then (f*h)(1)=(1/2)·c·2=c, which is Check :404. On S₃ with counting measure, U={e} and φ=δ_(12), take f=δ_e and h=δ_(12). Then f*h=δ_(12), tsupport(h)={(12)}⊆tsupport(φ) and tsupport(f)={e}⊆U. For φ=0, n=0 works. | True. The prose and the Lean statement agree. |
| 3 | :490, isometry “follows from the C\*-algebra specialization” | An injective \*-homomorphism between C\*-algebras is isometric. Conjugation by the unitary diag(e^{it},1) gives ‖uE₁₂u\*‖=‖E₁₂‖=1. Conjugation by diag(e^t,1) gives ‖α_t(E₁₂)‖=e^t≠1, and that action is not a \*-action (row 6). So the hypothesis is not imposed in general. | Consistent |
| 4 | :494, A∞ satisfies the hypotheses of OperatorKTheory K3 §3.5 | Only escapes changed. I reread K3 §3.5 at head 5dbc4acd, :779–791: it asks for a metrizable, complete, Hausdorff, locally convex complex space with continuous multiplication and star, an injective continuous dense \*-map, and inverse closure at every matrix size and of the unitization. Rows 1–5 of the previous report match these one by one: 1+3+9=13 words at m=2 for SU(2); p₁(e^{ix})=2=p₁(e^{−ix}); D(1/(2+e^{ix}))(0)=i/9. | True |
| 5 | :506, star law on C(S¹) with (α_t f)(x)=f(x−t) | f=e^{ix}: α_t f=e^{−it}e^{ix}, so Df=−ie^{ix} and Df(0)=−i. f\*=e^{−ix}: α_t f\*=e^{it}e^{−ix}, so D(f\*)=ie^{−ix} and D(f\*)(0)=i. (Df)\*(0)=conj(−i)=i, which equals D(f\*)(0). The skew-adjoint sign −(Df)\*(0)=−i does not. With f(x+t): Df(0)=i and D(f\*)(0)=−i=conj(i). | True. Both directions are as stated. |
| 6 | :507, diag(e^t,1) on M₂(ℂ) | α_t(E₁₂)=e^tE₁₂ and α_t(E₂₁)=e^{−t}E₂₁, so dα(E₁₂)=E₁₂ and dα(E₂₁)=−E₂₁. Then (dα(E₁₂))\*=E₂₁≠−E₂₁=dα(E₁₂\*). It is an algebra action, since diag(e^s,1)diag(e^t,1)=diag(e^{s+t},1). | True |
| 7 | :507, unitary diag(e^{it},1) | dα=[iE₁₁,·]: [iE₁₁,E₁₂]=iE₁₂ and [iE₁₁,E₂₁]=−iE₂₁. (iE₁₂)\*=−iE₂₁=dα(E₂₁)=dα(E₁₂\*). | True |
| 8 | :523, “OperatorKTheory K3 §3.5 is not a consumer” | `SmoothBanachRepresentations` occurs 0 times in OperatorKTheory at 5dbc4acd. Its §3.5 *Needs:* (:781–783) names only K3 3.1–3.2, K2, AlgebraicKTheory 0.3–0.4 and Mathlib. | True |
| 9 | Rows 5–7 against Conventions :38 and Check :503 | :38's law `dπ(X)(a*)=(dπ(X)a)*` is the law tested in rows 5–7. Check :503 uses the same diag(e^t,1) on M₂(ℝ), and its derivative E₁₂ of I+E₁₂ agrees with row 6. | Consistent |
| 10 | `dixmierMalliavin_function` and `smooth_inverse` in Lean (unchanged) | The one-tactic probe fails at :153 and :187. The types are identical to the signature file. | Stand |

Rows from earlier reports still stand for every statement the diff leaves untouched. These include the previous report's rows 1–12 and the full seeded-target tables of the third to fifth reports. They cover:
- the seeded targets 0.1, 0.2, 1.1, 1.2, 1.3, 2.1, 3.3, 4.1, 7.1, 7.2, 7.2a, 7.3 and 7.4;
- the other five headline theorems.

The pins are unchanged (Mathlib 1b1ccf4, Tau Ceti 2fd255d).

### Cross-roadmap citations resolved this round

| Citation | Resolved passage | Result |
|---|---|---|
| OperatorKTheory K3 §3.5 (:494, :507, :523) | Not on main; it is an open new-roadmap pull request at head 5dbc4acd, line 10 of the order. :603 is “## K3. Bott periodicity, boundary maps, and products” and :779 is “### 3.5 Dense inverse-closed Fréchet subalgebras”. | Resolves, earlier in the order |
| Relative link `../../OperatorKTheory/README.md` | From the folder this reaches `TauCetiRoadmap/OperatorKTheory/README.md`, which is that head's layout. | Resolves |
| All README citations | `roadmaps resolve` against main eaf17b1 and 468 open heads finds no cross-roadmap citation and no Lean name that fails to resolve. | Resolves |

### Ownership against open work

I reran `roadmaps overlaps`:
- no other open pull request changes this roadmap;
- no id it cites is dropped by an open pull request or defined only by an open revision;
- its five closest roadmaps are unchanged: AutomorphicFormsOnReductiveGroups, NoncommutativeGeometry, SpectralManifolds, CompactGroups and AutomorphicSpectralTheoryPartII.

The diff assigns no ownership. It only escapes asterisks and adds code spans.

### Seeded source sample (targets in the diff)

- **6.1** (:395, locator Casselman Proposition 6.1, p.13). `casselman2016` lines 645–649 state that any smooth vector of a continuous Fréchet representation is a finite sum of π(f_j)v_j, with f_j smooth and compactly supported in a fixed exponential neighbourhood Ω and v_j smooth. Shrinking Ω inside a given U gives the README's prescribed first-factor support. The vector statement, the finite sum and the smooth inner vectors are supported as written. The function-support refinement is the roadmap's own fixed-support route; the README says so at :370 and :529.
- **1.5** (the Check at :173): this is a computation with no external locator, and row 1 verifies it.
- **2.1 and 4.1**, named at :494: `casselman2016` lines 11–20 (iterated domains and the seminorms ‖π(X)v‖_ρ) and line 36 (density through a Dirac sequence) support what :494 attributes to them.
- `casselman2016` lines 609–614 (Lemma 5.1): the alternating series of positive coefficients bounded by any given A_m, with test functions of arbitrarily small support. Line 527 already accounts for the sign convention.

## Not verifiable

- Dixmier–Malliavin, *Factorisations de fonctions et de vecteurs indéfiniment différentiables* (1978): no legal readable copy, as in earlier rounds. The README labels these locators uncertified (:529), and the diff does not touch them.
- The three board packages in the brief's index (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) are unrelated to this roadmap. Their contents were not fetched.

## Source issues

- **Misprint** in casselman2016 at proof of Proposition 6.1, printed p.13 (lines 652–658, 661–668): the source says the series uses coefficients α_n with no alternating sign; it should carry `(−1)^n α_n`, as Lemma 5.1 (line 613) does; affects the proof.
- **Misprint** in casselman2016 at proof of Proposition 6.1, printed p.13 (lines 669–672): the source says π(μ₀)α₀=v+π(μ₁)v with α₁=v gives v=π(μ₀)α₀+π(μ₁)α₁; it should be v=π(μ₀)α₀−π(μ₁)α₁, or μ₁ replaced by −μ₁; affects nothing.

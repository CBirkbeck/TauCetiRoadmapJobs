# GATE-Subfactors~2: answers to the review of `6e29691`

One review, by CBirkbeck, with nine findings F01–F09, numbered H01–H09 here. Repairs are in
commit `bbba04ce`, which touches only `TauCetiRoadmap/Subfactors/README.md` and
`TauCetiRoadmap/Subfactors/Suggested.lean`. The review text supplied to this job breaks off inside
its "Verified sound" table, which contained no further findings.

## H01 (CBirkbeck) — applied differently

The cycle is real. With the supplier written as a `*Needs:*` line, the depcheck reports `UPWARD:
Subfactors (#216) -> TemperleyLiebOperatorAlgebras (#237)` and `not movable`, because
CategoricalOperatorAlgebras (#236) consumes Subfactors. The suggested repair edits
CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras, which are outside this job.

The notion moves down instead, and Subfactors no longer consumes TemperleyLiebOperatorAlgebras:
- New Layer 3.1–3.3 in `TauCetiRoadmap/Subfactors/README.md` states as targets here the analytic
  adjoint, Jones's positivity theorem (both directions), the positive Jones quotients `Q_n` and
  their C*-tower.
- It cites only TemperleyLieb Layers 4–7 (an open new-folder roadmap with no order constraint) for
  the algebra: `existsUnique_isMarkovTrace`, `existsUnique_jonesWenzl`,
  `IsMarkovTrace.apply_jonesWenzl` and Goodman–Wenzl.
- The old line 49 ("TemperleyLiebOperatorAlgebras A1–A5 … supplies …") is gone.
- TemperleyLiebOperatorAlgebras is now listed under Downstream consumers.

The resulting direction is Subfactors (217) → CategoricalOperatorAlgebras (237) →
TemperleyLiebOperatorAlgebras (238). That is acyclic and agrees with the merge order. A6 of
TemperleyLiebOperatorAlgebras still consumes CA1a/CA2a, which is fine. TemperleyLiebOperatorAlgebras
A3–A5 now duplicate Subfactors Layer 3. That roadmap, being later, should consume Layer 3; that
edit is outside this job.

## H02 (CBirkbeck) — applied differently

Confirmed: a `*Needs:*` line naming HilbertModules gives `UPWARD: Subfactors (#216) ->
HilbertModules (#239)` and `not movable`. The only thing used from H1–H3 was the sentence
"Compare with H3's interior C*-tensor product" (old S1) and the supplier bullet at old line 56.
Both are deleted, and no H1–H3 theory is duplicated: Layer 1 builds Connes fusion from
VonNeumannAlgebras V10–V11 alone. The comparison is assigned to HilbertModules, as a consumer, in
Scope and ownership and in Downstream consumers. Moving Subfactors after HilbertModules is
impossible for the same cycle reason as H01.

## H03 (CBirkbeck) — applied

The Conventions line changed from "II₁ factors with separable predual" to "No separable predual is
assumed". Separability is now stated only in two places: Layer 9.2 (local quantisation,
generation, and Popa's theorem for separable II₁ factors) and Layer 10.3 (type III S on separable
`H₀`, Burns, Lemma 3.4.1).

The pattern was repaired too: Layer 10.1 dropped "separable", since Penneys, *A planar calculus for
infinite index subfactors*, §3, assumes only a II₁ factor. Pimsner–Popa, Theorem 4.4 (`pimsner-popa`
line 1000) likewise assumes no separability.

The uncountable example was added as Checks in 2.1, 2.2 and 2.3 rather than as Lean:
- `A = ⊗_I (M₂, tr)` with I uncountable;
- index 4 and `τ(e) = 1/4`;
- basis `√2E_ij` with `Σbb* = 4·1`, and the reconstruction `Σ b E_N(b*x) = x` was computed.

## H04 (CBirkbeck) — applied

`Suggested.lean` is rewritten. `JonesProjectionFamily`, `scaledGenerator*`, `jonesAction*`,
`Shading`, `shadedBox`, `GradedCarrier`, `RigidWeight`, `JonesIndexValues`, the whole
`SubfactorsEntropyPrototype` namespace and the zero-family stand-in are all removed. The file now
states the headline that is statable at the pins:
- `markovTrace_nonneg_iff`: for `δ > 0` and any conjugate-linear star-ring structure on
  `TauCeti.TemperleyLieb ℂ δ n` fixing the generators (exactly one exists for real δ), the value
  `0 ≤ markovTrace q hq (star x * x)` holds for all n, x exactly when
  `δ ∈ jonesLoopParameters = {2cos(π/m) : m ≥ 3} ∪ [2,∞)`. Necessity is Penneys UQSL Ch. 4,
  Theorem 4.3.17 (`penneys-uqsl` line 368).
- `markovTrace_nonneg_iff_lt_floor`: the first bad level, `n < ⌊π/arccos(δ/2)⌋₊`, from Lemma 4.3.8
  (`penneys-uqsl` line 230).

The docstring lists, for each headline that cannot be stated, the missing carrier: Jones index
restriction, realisation, fusion and basis theory, entropy, compactness and principal graphs,
planar reconstruction and Burns, Popa and ADE, and infinite-index cones. The zero family at
`d = 1/2` no longer appears anywhere. At `δ = 1/2` the theorem's left side is false, since
`T_2(f_2) = −3/4`.

## H05 (CBirkbeck) — applied

All seven named declarations are deleted, together with every other prototype declaration: old
lines 36, 47, 62, 132, 170, 175 and 185. None is proved in place. The d = 4 projection calculation
and the identity-entropy value 0 survive as README Checks (2.3, 3.4, 2.6).

## H06 (CBirkbeck) — applied

Old S7, lines 652–656 ("trace evaluation algorithms … prove terminating reductions evaluate closed
diagrams"), are replaced by Layer 7.4. That section asks for three things: trains span every box
space, closed diagrams lie in the span of the empty diagram, and the relations with a faithful
positive trace determine the planar algebra up to isomorphism. Neither an algorithm nor
termination is a deliverable. The circle values δ and δ² are a Check in 7.4.

## H07 (CBirkbeck) — applied

The README is reshaped into the standard form:
- Summary, Scope and ownership, Conventions, Exact supplier contracts (From Mathlib, From Tau Ceti,
  and the four supplier roadmaps plus TemperleyLieb), and How to read the build;
- Layers 1–10 with `### k.n` subsections;
- a `**Checks.**` list of at least three Checks per subsection, a `*Needs:*` line for every target,
  and Examples and Dependencies for every layer;
- Downstream consumers and References with per-target locators.

The S1 Checks are the ones the review asked for: `⟨i·1,1⟩ = −i` versus `+i`; the zero
correspondence and `H ⊗_N 0 = 0`; and for `ρ = diag(1/5,4/5)` the isometric `R_ξ` against the
rejected map that doubles the norm of `E₂₁ρ^(1/2)`.

The pull-request links `TemperleyLieb #58` and `PivotalSpherical #57` are replaced by roadmap names
and layers; PivotalSpherical is no longer needed. Layer numbers equal the old S numbers, and
"How to read the build" records that 2.6 is the section consumers cite as S2a. Existing citations
therefore still resolve: CategoricalOperatorAlgebras S1–S2 and S5–S9, FactorRigidity S1–S2, and
TypeAHeckeAlgebras S2a.

## H08 (CBirkbeck) — applied differently

Burns locators were checked against arXiv:1111.1362v1 and corrected:
- The annular tangle `TJ` is defined inside Definition 2.2.9, printed p. 34 (`burns` lines
  1524–1535). Its properties are Remarks 2.2.10 (`burns` line 1536). 2.2.43 is a Lemma (`burns`
  line 2804).
- Φ and Φ′ are cited as Definitions 2.2.7 and 2.2.9, in §2.2.1 rather than "§2.2.2"
  (`burns` lines 1508, 1524).
- §3.4 runs over printed pp. 116–121 (Lemma 3.4.1 at `burns` line 6225, Theorem 3.4.9 at line
  6407).
- The reciprocal repair to Theorem 2.2.40 is kept, and its witness `a = 5/4`, `δ_sph = 2` gives
  rigid value 5/2, not 8/5. That matches the proof at `burns` lines 2704–2705.

Locators now sit at each target. Other locators were also verified:
- Pimsner–Popa 2.2, 4.4, 4.5 and 4.6 (`pimsner-popa` lines 566, 1000, 1132, 1158);
- Penneys 3.18, 3.28, 4.20 and 4.28, with Remark 4.21's symmetry hypothesis
  (`penneys-infinite` lines 967, 1144, 1501, 1569, 1523);
- Bigelow–Penneys 1.1–1.3 (`bigelow-penneys` lines 123–147);
- Coles–Huston–Penneys–Srinivas, Lemma 3.12, Theorem 5.1 and Corollary 5.2 (`chps` lines 655,
  1933, 2012);
- Jones–Penneys, Theorems 3.33 and 4.1 (`jones-penneys` lines 1318, 1334);
- Jones, Theorems 4.2.1 and 4.3.1 (`jones-planar` lines 2747, 3415);
- Kosaki, Theorems 3.7 and 3.8 (`kosaki-url` lines 1539, 1640). The `pages.uoregon.edu` file is
  Kosaki's lecture notes.

The unverifiable Longo–Roberts and Hiai citations were dropped rather than kept by memory. The
Burns citation for fusion was corrected to §2.1.2, Definition 2.1.15 (`burns` line 422).

Not done: `sources.toml`. This job may edit only `README.md` and `Suggested.lean`, so the manifest
with its 16 entries must be written by a job that may edit it. Popa, Acta Math. 172 resolves only
to a paywall and is marked in the README as cited by locator, `uncertified`. The JSW and GJS arXiv
PDFs have glyph-name text layers and OCR is unavailable, so their theorem numbers were not
re-verified. No text is missing, so no `needs-references.toml` was written.

## H09 (CBirkbeck) — applied

The new file has the following form:
- one module docstring, "Subfactors: target signatures";
- `namespace TauCetiRoadmap.Subfactors` and a `/-! ## Layer 3: … -/` section comment;
- a docstring on each of the three declarations;
- `theorem` only, a single `import Mathlib` plus `TauCeti.Algebra.TemperleyLieb.MarkovTrace`, and
  no `set_option`.

All three names (`jonesLoopParameters`, `markovTrace_nonneg_iff`,
`markovTrace_nonneg_iff_lt_floor`) appear in README §3.2 and in the Summary. No other name of this
roadmap's own is backticked in the README.

## Signature check

`#check @jonesLoopParameters`, `#check @markovTrace_nonneg_iff` and
`#check @markovTrace_nonneg_iff_lt_floor` were appended temporarily, elaborated in one build, and
removed. Every binder survives in the elaborated types: `0 < δ`; `δ < 2` and `δ ∉
jonesLoopParameters` for the second theorem; `q`, `hq`, the `StarRing` and `StarModule ℂ`
instances (as a family over n in the first theorem, at level n in the second) and `he`. Nothing
needed to change.

## Ownership

The TL positivity theorem, `Q_n` and the C*-tower are also planned in TemperleyLiebOperatorAlgebras
A3–A5 (open, later in the order). This roadmap takes ownership under the move-down rule; see H01.
No Lean declaration here shares a fully qualified name with a readable roadmap: that roadmap's
declarations live in `TauCetiRoadmap.TemperleyLiebOperatorAlgebras` and use different names.
Ownership against the open pull requests was checked with `roadmaps grep` for TL positivity, Jones
index, fusion and planar algebras.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values | Result / change |
|---|---|---|---|
| `markovTrace_nonneg_iff` | δ=1/2; δ=1 (m=3); δ=√2; δ=2; δ=0; n=0 | 1/2: `T_2(f_2)=δ²−1=−3/4`, 1/2∉set; 1: Q_n=ℂ, admissible; √2: `[3]=1>0`, `[4]=0`; 2: `[r]=r>0`; 0: forms ≥0 but 0∉set; n=0: `T_0(x̄x)=|x|²` | true; `0<δ` is necessary (δ=0 counterexample, a 3.2 Check) |
| star hypothesis | δ non-real | `e²=δe` and † give `(δ−δ̄)e=0`, contradicting `e_ne_zero_two` | unique star exists iff δ real (3.1 Check) |
| `markovTrace_nonneg_iff_lt_floor` | δ=1/2; δ slightly below √2; n=0,1 | 1/2: θ=arccos(1/4)≈1.318, π/θ≈2.38, k=2, fails at n=2 ✓; below √2: k=3, `T_2(f_2)>0`, `[4]=δ(δ²−2)<0`; θ<π/2 ⇒ k≥2, `T_1=δ|x|²≥0` | true; inadmissibility excludes integer π/θ |
| `jonesLoopParameters` vs index | m=3,4,5,6 | δ²=1, 2, (3+√5)/2≈2.618, 3; 2.5 excluded (between m=4 and 5) | agrees with 3.5's index set |
| 2.2 basis | `A⊂A⊗M₂`, uncountable I | `Σ(√2E_ij)(√2E_ji)=4·1`; `x=a⊗E_kl` reconstructed | Check added (H03) |
| 2.2 Pimsner–Popa constant | `N₀⊗M₂⊂N₀⊗M₂⊗M₂`, P maximally entangled | `E_N(P)=1/4`; `1⊗E₁₁` gives only 1/2 | sharp at `[M:N]⁻¹` |
| 2.2 local index | diagonal corner, t | `(1−t)·t·(t⁻¹+(1−t)⁻¹)=1=[pRp:Np]` | consistent |
| 2.4 distortion | diagonal corner | left dims `t⁻¹, (1−t)⁻¹`, right dims `t, 1−t`, `d=1` each, ratios `t⁻²≠(1−t)⁻²` | non-extremal; first draft's `t/(1−t)` corrected before commit |
| 2.5 minimal index | diagonal corner; t=1/2; `R⊂R⊗M₂`, h=diag(2/5,8/5) | `c=2√(t(1−t))`, `E_N(h_0)=1`, `Ind(E_0)=4` versus `[M:N]=1/(t(1−t))`; t=1/2: `h_0=1`; `Ind(E_h)=4·25/16=25/4`, wrong `[M:N]tr(h)=4` | consistent with `d(X)=2` |
| 2.6 entropy | ℂ⊂ℂ²; `N⊂N⊗M₂`; corner t; identity | `η(t)+η(1−t)`; `2·½·log4=log4` with relative commutant M₂ (shows why Cor 4.6 needs its window); `2η(t)+2η(1−t)`, at t=½ `log4`; 0 | consistent with Pimsner–Popa 4.4–4.6 |
| 3.3 quotient dims | δ=√2 | `dim Q_2=1+1=2`, `dim Q_3=2²=4`, `dim TL_3=5` | consistent |
| 3.4 trace pullback | `N⊂N⊗M₂`, δ=2 | `τ(2e₁)=1/2=δ⁻²·T_2(e)=¼·2` | consistent |
| 4.1 tensor-leg square | parameters | ℂ⊂M₄: 1/16; M₄⊂M₈: 1/4; `A_1∩B_0=M₂⊗1⊗1` | symmetric but not commuting, unequal parameters |
| 4.3 corner | d=9/2; d=4 | t=1/3: 3+3/2=9/2; t=1/2 gives `N⊗M₂` model | consistent |
| 6.2–6.4 Burns example | w=diag(4,¼) | `tr w^(±½)=5/4`; `h=diag(2/5,8/5)`, `E_N(h)=1`; `h·w=diag(8/5,2/5)`; rigid value 5/2 vs printed 8/5 | proof value used (H08) |
| 9.3 ADE indices | A_3, D_4, E₆ | 2; `4cos²(π/6)=3`; `2+√3` | consistent |
| 10.1 cones | `H=L²(A)`; coarse | `Q_n=JAJ∩A=ℂ`; coarse `P_1=0`, `Q_1=A^op⊗̄A`; `Q̂_0⁺=[0,∞]` (`penneys-infinite` line 1008) | consistent |

## Build and gate

- `lake build TauCetiRoadmap.Subfactors.Suggested`: `Build completed successfully (8981 jobs)`.
  The only warnings are two `declaration uses 'sorry'`, at lines 65 and 80.
- Gate: `gate Subfactors: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0
  residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0
  forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0
  layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0
  source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 162 roadmaps, 1153 edges, 0 problem(s)`. There are no
  UPWARD, CYCLE or moved lines.
- With the old prose suppliers written as `*Needs:*` lines, the check reports UPWARD for both
  TemperleyLiebOperatorAlgebras and HilbertModules. The `0 problem(s)` at `6e29691` therefore came
  from prose the tool does not parse, not from a correct direction; see H01 and H02.

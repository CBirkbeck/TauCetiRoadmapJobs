# Review of BanachSpaces (pull request #2249 at 49a457d)

**Verdict:** needs changes

## R01 (P2) — Layers are the source's sections; the scope is chapter coverage

**Location:** `TauCetiRoadmap/BanachSpaces/README.md:20` "The principal source is Jan van Neerven's *Functional Analysis*, Chapter 1"; headings 163–586, "## BN1. Banach spaces: definition and general properties" … "## BN8. Bounded operators: first examples".

**Claim:** The layers reproduce the source's section titles, and the scope is defined as covering that chapter, which violates the binding organisation principle. As a result, BN1, BN2.1–2.2, BN4.1–4.2, BN5, BN6.2–6.3 and BN7.2 are whole sections that only restate Mathlib (README:49–52 calls them "library inputs").

**Witness:** vanNeervenFA lines 21–33 (table of contents): 1.1.a "Definition and General Properties", 1.1.b "Subspaces, Quotients, and Direct Sums", 1.1.c "First Examples", 1.2.c "First Examples", 1.3, 1.4, 1.5.a "The Riemann Integral", 1.5.b "The Bochner Integral". The README's layer titles match these one for one.

**Repair:** Organise the layers backwards from the targets and name each one by its mathematics:
- Layer 1, operator limits and compactness criteria: BN4.3, BN6.1, BN2.3.
- Layer 2, scalar measures with the variation norm: BN3.4.
- Layer 3, Riemann sums and distance-test measurability: BN7.1, BN7.3.1.
- Layer 4, multipliers, kernel operators and the Volterra norm: BN8.2–8.7.

Delete BN1, BN2.1–2.2, BN4.1–4.2, BN5, BN6.2–6.3 and BN7.2, and list their Mathlib and Tau Ceti names once under Scope. Delete the source-coverage sentences at README:20–22, 60–62, 535–536, 720 and 727.

## R02 (P2) — `set_option` in Suggested.lean

**Location:** `TauCetiRoadmap/BanachSpaces/Suggested.lean:49` `set_option autoImplicit false`.

**Claim:** The file contains a `set_option`, which is a binding-rule violation and fails the gate.

**Witness:** gate.md, set_option (1): "line 49: set_option autoImplicit false".

**Repair:** Delete line 49. A scratch copy without it (and with R06 and R09 applied) elaborates with `sorry` warnings only.

## R03 (P2) — Tau Ceti suppliers taken from a revision beyond the pin

**Location:** `README.md:145–146` "The following further interfaces are present at Tau Ceti revision `396c3bd…`, beyond the dependency pin". BN3.4, BN6.3, BN7.1.3, BN8.4 and BN8.6 rely on that table.

**Claim:** Several consumed declarations do not exist at the pinned Tau Ceti (2fd255d). The same table also lists two modules as newer when they are already at the pin.

**Witness:** At 2fd255d:
- Absent: `integralOperatorLp`, `VectorMeasure.regularSubmodule`, `lp.tendsto_diagonalTruncation_apply`, `TauCeti/Topology/UniformSpace/Ascoli.lean`, `VectorMeasure/RiemannSums.lean`.
- Already present: `MeasureTheory/Function/Lp/Multiplication.lean` (`multiplicationOperator` at line 46) and `MeasurableSpace/Finpartition.lean`.

**Repair:**
- Delete the 396c3bd table, its links and the phrase "at the newer revision" (README:711).
- BN3.4: cite BanachSpaceTheory B5 (on main) for the regular-measure normed submodule.
- BN6.3: keep only `EquicontinuousOn.tendsto_uniformOnFun_iff_pi'` and `LipschitzWith.uniformEquicontinuous`.
- BN7.1.3: state the interval-sum comparison as a target here.
- BN8.4: state the L∞-kernel operator, with both Schur bounds equal to `μ(K)‖k‖∞`, as a target here.
- BN8.6: use `lp.hasSum_single`.
- Cite Multiplication and Finpartition at the pin.

## R04 (P2) — Second owner of the square-integrable kernel operator

**Location:** `README.md:648–649` "For k∈L²(μ×μ) it defines an operator on L²(μ) with ‖T_k‖≤‖k‖_2"; `Suggested.lean:268` `exists_l2KernelOperator`.

**Claim:** AutomorphicSpectralTheory, which comes earlier in the merge order, already owns this object. README:43 also says Hilbert–Schmidt kernels are not constructed anywhere, which is incorrect.

**Witness:** AutomorphicSpectralTheory §0.8 "Measurable Hilbert–Schmidt kernels" (open head, merge order 96 < 408) provides `kernel_apply` (the a.e. formula) and `kernel_norm` (Hilbert–Schmidt norm `‖K‖₂`) on σ-finite standard Borel spaces. A compact metric K with a finite Borel measure is such a space.

**Repair:**
- In BN8.4 and Scope, cite AutomorphicSpectralTheory §0.8 (`kernel_apply`, `kernel_norm`), using ‖T‖ ≤ ‖T‖_HS.
- Delete `exists_l2KernelOperator` from Suggested.lean.
- Keep at most the real-scalar case here, with one clause saying how it differs.

## R05 (P2) — "Scalar measurability agrees with strong measurability" is false as written

**Location:** `README.md:548–549` "Scalar measurability agrees with strong measurability."

**Claim:** For X-valued functions, scalar (weak) measurability does not imply strong measurability unless the range is separable.

**Witness:** Take f:[0,1]→ℓ²([0,1]), f(t)=e_t.
- Each x*∘f is nonzero only on a countable set, so it is Borel.
- The range is uncountable and √2-separated, so f is not strongly measurable.

**Repair:** Replace the sentence with: "For 𝕂-valued functions, measurability and strong measurability agree (vanNeervenFA, remark after Definition 1.46, p. 25, line 1718); for X-valued functions use Theorem 1.47."

## R06 (P3) — Imports fail the gate

**Location:** `Suggested.lean:7–23` `public import Mathlib.Analysis.Convex.TotallyBounded` … `public import TauCeti.MeasureTheory.VectorMeasure.ScalarIntegral`.

**Claim:** The gate fails three import checks: imports, mathlib-subimports and no-import-mathlib.

**Witness:** gate.md lists 14 `Mathlib.<submodule>` imports and "no `import Mathlib` line".

**Repair:** Replace lines 7–23 with the single line `public import Mathlib`. The three `TauCeti.*` modules are used only by the examples that R09 deletes. The tested copy elaborates.

## R07 (P3) — LaTeX and TeX syntax in the README

**Location:** `README.md:70` "Work over $\mathbb K=\mathbb R$ or $\mathbb C$" (gate: 460 latex hits and 43 tex hits).

**Claim:** The README uses LaTeX delimiters and TeX commands outside code spans.

**Witness:** gate.md, sections latex (460) and tex (43).

**Repair:** Use Unicode or code spans throughout:
- Line 70: "Work over `𝕂 = ℝ` or `ℂ`".
- Lines 226–229: an indented code block `max_i ‖x_i‖ ≤ N(x) ≤ Σ_i ‖x_i‖ ≤ |I|·N(x)`.
- Line 286: "`Σ_{A∈𝒫} |m(A)|`".

## R08 (P3) — Stray file Coverage.md

**Location:** `TauCetiRoadmap/BanachSpaces/Coverage.md`.

**Claim:** This is not a roadmap file. It is also a section-by-section index of a source, keyed to a TeX file that is not public.

**Witness:** gate.md stray-files; Coverage.md:9–10 "The source is `ch01-BanachSpaces.tex` in the supplied archive".

**Repair:** Delete it; sources are the README's references. Also drop the links to it at README:18 and 740.

## R09 (P3) — Padding in Suggested.lean

**Location:** `Suggested.lean`:
- lines 66–93: five `example`s;
- lines 128–146: the BN6.3 `example`;
- line 228: `multiplier_ae`;
- line 233: `norm_multiplier_le`.

**Claim:** Each of these restates a pinned lemma or follows from the library in one tactic.

**Witness:**
- Each example is an `exact` or `inferInstance` of pinned declarations.
- Probe: `multiplier_ae` closes by `exact ContinuousLinearMap.coeFn_holder (r := p) _ m f`.
- Probe: `norm_multiplier_le` closes by one `exact` combining `le_opNorm`, `norm_holderL_le` and `opNorm_lsmul_le`.

**Repair:** Delete them from `Suggested.lean`; the README keeps the statements.

## R10 (P3) — No target has a source locator

**Location:** Throughout `README.md`. For example, at 341–347 (BN4.3) "Let T_n:X→Y be bounded operators, Y Banach, and ‖T_n‖≤M" carries no theorem or page. There is no References section.

**Claim:** No claim in the README is tied to a theorem number or page.

**Witness:** BN4.3 is Proposition 1.19 (vanNeervenFA line 1074, p. 12), yet the README names no numbered result anywhere.

**Repair:** Add a locator at each claim:

| README target | vanNeervenFA locator |
| --- | --- |
| BN1.2 | Prop. 1.3, p. 3 |
| BN3.4 | Ex. 1.12, p. 9 |
| BN4.3 | Prop. 1.19, p. 12 |
| BN4.5 | Prop. 1.21, p. 13 |
| BN5.4 | Lemma 1.39 and Thm 1.38, p. 20 |
| BN6.1–6.3 | Props 1.40–1.42, pp. 21–22 |
| BN7.1 | Prop. 1.43, p. 23 |
| BN7.3 | Thm 1.47, p. 25; Defs 1.49–1.50 and Prop. 1.51, pp. 26–27 |
| BN8.2–8.5 | Exs 1.28–1.31, pp. 15–17 |
| BN8.5, ‖V‖ = 2/π | Ex. 8.13, pp. 282–283 |

Add `## References` citing arXiv:2112.11166v8.

## R11 (P3) — No Checks

**Location:** The README contains no `**Checks.**` list anywhere.

**Claim:** None of the definitions has Checks: the product norm N (BN2.3), the variation norm (BN3.4), the tagged sum and mesh (BN7.1), M_m (BN8.3), T_k (BN8.4) and V (BN8.5).

**Witness:** The only occurrence of "checks" is README:16, which is prose about Suggested.lean.

**Repair:** Add at least three Checks per definition. Examples:
- Variation norm: `δ₀+iδ₁` has norm 2, against max(‖Re‖,‖Im‖)=1 and total mass √2. `δ₀−δ₁` has norm 2, against total mass 0.
- M_m: for μ=∞·δ_pt and m=1, ‖M_1‖ is 0 on L¹ but 1 on L∞.
- V: the input f≡1 gives ratio 1/√3, the input cos(πt/2) gives 2/π, and the kernel bound gives 1/√2.

## R12 (P3) — The README is not in roadmap form

**Location:** `README.md:1` "# Banach spaces"; the headings "## Existing library interfaces" (115) and "## Sources and API alignment" (735).

**Claim:** The README is missing the following:
- `**Summary.**` and a list of headline theorems;
- `## Exact supplier contracts` and `## How to read the build`;
- `## Layer k:` headings with `### k.n` subsections;
- `### Examples` and `### Dependencies` in each layer;
- `## Downstream consumers` and `## References`.

None of the 19 `Suggested.lean` names appears in the README.

**Witness:** Grepping the README for each of the 19 declaration names gives 0 hits each.

**Repair:**
- Retitle as `# Roadmap: banach spaces` and add a Summary naming the headline theorems.
- Add supplier contracts From Mathlib, From Tau Ceti, and From TauCetiRoadmap.BanachSpaceTheory, BanachAlgebras, BochnerSpaces and AutomorphicSpectralTheory.
- Name each `Suggested.lean` declaration at its target.

## R13 (P3) — The Suggested.lean module docstring has the wrong form

**Location:** `Suggested.lean:26–30` "# Banach spaces: suggested interfaces … These are representative suggested interfaces, not an exhaustive checklist."

**Claim:** The docstring does not describe an acceptance test, does not say which headline is not statable, and contains process text: "the newer Schur integral-operator implementation" (line 41). README:15–17 has the same framing.

**Witness:** The docstring is quoted in the Location.

**Repair:** Replace it with:

"# Banach spaces: target signatures. The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline theorems against the pinned APIs. Not statable at the pins: the normed-space structure on `VectorMeasure S 𝕜` with the variation norm (no normed-group instance on `VectorMeasure`); its completeness is stated as `exists_variation_limit`."

## R14 (P3) — Library names that do not exist at the pin

**Location:** `README.md:125` "`UniformSpace.Completion` and `NormedSpace.toComplₗᵢ`"; README:139 "`lpPairing`".

**Claim:** Neither name resolves at the pinned Mathlib.

**Witness:**
- `#check @NormedSpace.toComplₗᵢ` gives "Unknown constant"; the declaration is `UniformSpace.Completion.toComplₗᵢ` (Completion.lean:49).
- Bare `lpPairing` is unknown; the declaration is `ContinuousLinearMap.lpPairing` (Holder.lean:149).

**Repair:** Use the full names `UniformSpace.Completion.toComplₗᵢ` and `ContinuousLinearMap.lpPairing`.

## R15 (P3) — Process words and pull-request numbers in the README

**Location:**
- `README.md:15–17` "This README is the definitive specification … not an exhaustive checklist";
- README:159 "brought into an earlier checkout";
- README:739 "The supplied `ch01-BanachSpaces.tex`";
- README:742–759: Mathlib PRs #42003, #43465, #42103, #45112 and a Zulip link.

**Claim:** The README contains process narrative and pull-request references.

**Witness:** The quoted lines.

**Repair:** Delete these passages, and cite only pinned declarations and the published source.

## R16 (P3) — BN8.6 redefines the right shift that BanachSpaceTheory B1 owns

**Location:** `README.md:715–716` "For 1<p<∞, let R be the right shift, with zero inserted at coordinate zero."

**Claim:** The README defines this operator again instead of citing its owner.

**Witness:** BanachSpaceTheory README:66 (on main), B1: "define the right and left shifts R_p,L_p on ℓᵖ" for 1≤p<∞.

**Repair:** Replace the sentence with "For 1<p<∞, use BanachSpaceTheory B1's right shift R_p."

## R17 (P3) — The pull-request text omits this roadmap

**Location:** The title "Add roadmap BochnerSpaces", and the description "This PR is a first step: a roadmap for Bochner spaces, covering Chapter 1 of Volume 1."

**Claim:** The pull request also adds a second new roadmap, BanachSpaces (4 files, 1369 lines), but the title and description never mention it.

**Witness:** The worker's computed change: the folder `TauCetiRoadmap/BanachSpaces/` is not on `origin/main`, and the pull request adds it.

**Repair:** Change the title to "Add roadmaps BochnerSpaces and BanachSpaces". Add to the description: "It also adds a new roadmap, BanachSpaces (scalar measures with the variation norm, operator limits from dense subspaces, Riemann sums on compact metric spaces, multipliers, kernel operators, the Volterra norm 2/π), which cites BochnerSpaces BS1–BS3 and BS7.1."

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: Scalars and spaces | Notation p. xxi (line 482); §1.1 p. 2 | Source: 𝕂∈{ℝ,ℂ}, X,Y Banach by default. README: 𝕂=ℝ/ℂ, completeness explicit | supported, more general | locator (R10) |
| Conventions: Native objects | Def. 1.4 (line 685), Def. 1.17 (line 1037), Def. 1.23 (line 1122) | Isometry = norm-preserving linear map; ⟨x,x*⟩=x*(x); contraction ‖T‖≤1. README identical | supported | locator |
| Conventions: Series | Definitions and Prop. 1.3, p. 3 (line 622) | Source: partial sums Σ_{n≤N}, absolute = Σ‖x_n‖<∞. README: `range n` partial sums, `Summable ‖x‖` | supported | locator |
| Conventions: Products and equivalent norms | §1.1.b p. 6, (1.1); Def. 1.32 (line 1332); ℓ¹ norm on 𝕂² at x=(1,1) | max 1 ≤ N 2 ≤ Σ 2 ≤ \|I\|N 4 | supported | locator |
| Conventions: Compactness and convergence | App. D p. 731; Props 1.40–1.42 | Relatively compact = closure compact; convex combinations λ_j∈[0,1] (real hull). README same | supported | locator |
| Conventions: Measures and integration | Defs 1.46–1.50, Prop. 1.51, pp. 25–27 | Source: strongly measurable with ∫‖f‖<∞. README: `StronglyMeasurable f ∧ Integrable f μ`; equivalent | supported | locator |
| `exists_variation_limit` | S=ℕ, m_n=Σ_{k≤n}2^{-k}δ_k; S=∅ | \|m_n−m_k\|(ℕ)≤2^{1−min(n,k)}; limit Σ2^{-k}δ_k at distance 2^{-n}; ∅: all zero | true | none |
| `exists_strongLimit_of_dense` | ℓ², T_n=P_n, D=finite supports | ‖P_n‖=1, P_n x→x on D; T=I, ‖I‖=1≤liminf=1; matches Prop. 1.19 | true | none |
| `isCompact_closure_iff_approx` | X=c₀₀⊂ℓ² (incomplete), A={Σ_{k≤n}2^{-k}e_k} | Right side holds with finite K; closure of A in c₀₀ not compact | true; completeness needed | none |
| `exists_fine_borel_partition` | K=[0,1], δ=0.3; K=∅ | Four quarter cells, diam 0.25<0.3; ∅: empty partition | true | none |
| `norm_taggedSum_sub_integral_le` | K={0,1}, ν=δ₀+2δ₁, P={K}, tag 0, η=‖x−y‖ | Error ‖3x−(x+2y)‖=2‖x−y‖ ≤ ην(K)=3‖x−y‖ | true | none |
| `taggedSums_converge` | Same K, δ<1 | Only partition {{0},{1}}: R=x+2y=∫f exactly | true | none |
| `stronglyMeasurable_iff_distance_tests` | f(t)=e_t∈ℓ²([0,1]); f=0 | e_t: both sides false (no separable D⊇{e_t}); f=0: D=⊥, both true | true | none |
| `norm_scalarIntegral_eq_one` | μ=δ₀; μ=∞·δ_pt | δ₀: f=1_{0}, \|∫f\|=1=‖f‖₁, norm 1. ∞·δ: hypothesis fails, L¹=0, norm 0 (Ex. 1.28) | true | none |
| `norm_multiplier` | μ=∞·δ_pt (not σ-finite), m=1, p=1 | ‖M_1‖=0 on L¹ vs ‖1‖∞=1: equality fails, so `SigmaFinite` is needed | true | none |
| `norm_multiplier_top` | μ=∞·δ_pt, p=∞; μ=0 | ‖M_1 1‖∞=1=‖1‖∞; μ=0: 0=0 | true | none |
| `exists_continuousKernelOperator` | K={pt}, ν=cδ, k≡a | ‖T‖=c\|a\|=ν(K)‖k‖∞ (equality) | true | none |
| `exists_l2KernelOperator` | K={pt}, ν=cδ, k≡a | ‖T‖=c\|a\|; ‖k‖_{L²(ν×ν)}=c\|a\| (equality) | true; owned elsewhere | R04 |
| `exists_volterra_continuous` | f≡1; s,t∈[0,1] | Vf(s)=s, ‖Vf‖∞=1=‖f‖₂ (bound attained); \|s−t\|≤√\|s−t\| | true | none |
| `norm_volterra_l2` | f=cos(πt/2); f≡1; kernel 1_{t<s} | Ratio (2/π)·√(1/2)/√(1/2)=2/π; f≡1: 1/√3≈0.577; HS bound 1/√2≈0.707; Ex. 8.13 eigenvalues sup 2/π | true | none |
| README:548 "Scalar measurability agrees …" | f(t)=e_t, Borel [0,1] | x*∘f Borel for every x*; range non-separable, so not strongly measurable | false as written | R05 |
| `multiplier_ae`, `norm_multiplier_le` | One-tactic probe on scratch copy | Both close (single `exact`), no error | padding | R09 |
| BN8.6 shift examples | ℓ¹, x=e₀, functional (1,1,…)∈ℓ∞ | ⟨Rⁿe₀,1⟩=1 for all n, so not weakly null at p=1; README's 1<p<∞ correct | true | R16 (owner only) |
| BN2.3 / BN4.4 diagonal norms | PiLp p, T₁=2, T₂=3 on 𝕜 | ‖T₁⊕T₂‖=3=max; sum bound 5 | true | none |

- Source: vanNeervenFA (arXiv:2112.11166v8) §§1.1–1.5 read in full (Definition 1.1 to Proposition 1.51), plus Notation p. xxi, App. D p. 731 and Ex. 8.13 pp. 282–283. Every README claim matches its result.
- Library: 46 `#check`s at the pins; `NormedSpace.toComplₗᵢ` and bare `lpPairing` unknown. Tau Ceti 2fd255d inspected for 12 cited modules: 5 cited names are absent, present only at 396c3bd.
- Cross-roadmap citations: 13 resolved. BanachSpaceTheory B1, B3, B5 (main); BanachAlgebras §3.1 (main, anchor resolves); OperatorTheory and OperatorIdeals (main); BochnerSpaces BS1.1, BS1.3, BS1.5, BS2, BS3.1–3.3, BS7.1 (this pull request).
- Dependency check: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`. BochnerSpaces cites nothing from this roadmap, and nothing outside the two folders changed.
- Gate (worker's run at 49a457d) fails: set_option 1, latex 460, tex 43, imports 1, mathlib-subimports 14, no-import-mathlib 1, stray-files 1. The build passes.
- Elaboration: `lake env lean Suggested.lean` gives 16 `sorry` warnings and nothing else. A copy with R02, R06 and R09 applied gives 14 `sorry` warnings and nothing else.
- Signatures: all 19 elaborated types compared with the README. Only `taggedSum` drops `[MetricSpace K] [CompactSpace K] [BorelSpace K]`, which is harmless because its body needs none of them; no change.
- Headlines: the BN3.4 completeness, BN4.3, BN7.1, BN7.3.1, BN8.2–8.5 and Volterra 2/π headlines are all stated. The normed structure on `VectorMeasure` is not statable without sorried instance fields.

Overlap check: read BanachSpaceTheory (main and its open revision), MarkovChainsAndRenewal, StandardDistributions. Owners of shared objects:
- BanachSpaceTheory B5 owns the interval L∞[0,1] multiplier norms, Volterra on C[0,1] and the regular-measure space M(K). BN8.3, BN8.5 and BN3.4 cite it as a kept variant (the BN3.4 citation is fixed by R03).
- B1 owns SOT/WOT and R_p (R16).
- AutomorphicSpectralTheory §0.8 owns L² kernels (R04).
- MarkovChainsAndRenewal and StandardDistributions share nothing.

## Not verifiable

- Coverage.md's "supplied archive `JvN - Functional Analysis.gz`" and its SHA-256 values: the archive is not public. I read the arXiv v8 PDF instead.
- The Mathlib pull requests cited at README:742–759 are outside the pins and were not read (R15 removes them).

## Source issues

- none

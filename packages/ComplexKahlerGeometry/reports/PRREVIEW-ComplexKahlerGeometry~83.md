# Review of ComplexKahlerGeometry (pull request #1234 at a6ec295)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/ComplexKahlerGeometry/` at `a6ec295`, the head the previous review also read. Every passage was reviewed, not only the K7.1 sentence that the last rounds changed. The mathematics holds up under the adversarial pass, and every sampled locator checks out at the text. The defects are about who owns what:
- three suppliers are not on main;
- seven planned targets are already proved at the pinned Tau Ceti;
- two headline theorems that can be stated at the pins are missing from `Suggested.lean`;
- the ℂPⁿ comparison still has a second owner in three open AlgebraicTopology heads.

## Previous findings

- **R01 (P2, second owner of the ℂPⁿ model comparison) — not repaired.** `README.md:2101–2102` still reads "This roadmap is the single owner of that comparison". The description's merge-order lines still name only #1186 and #1398. `roadmaps grep` still finds the competing clause at #1797 `:1401`, #1807 `:1211` and #1854 `:1077`. It is carried below as R06.
- **R02 (χ(ℂPⁿ) on `Projectivization`) — repaired.** `:2103–2108` reads "On `Projectivization ℂ (Fin (n+1) → ℂ)` the pins give no `TauCeti.FiniteCWType` instance … the comparison alone supplies the instance (`Homeomorph.finiteCWType`) and the value n+1 (`Homeomorph.eulerChar_eq`)". I re-ran the probe: the transport proof elaborates, and `infer_instance` fails on `Projectivization`.

## R01 (P2) — Three suppliers are not on main: GlobalHolomorphicFunctions, VariationalMethods and UnboundedOperators

**Location.** `README.md:264–267`: "consume [GlobalHolomorphicFunctions §0.3]…'s compact-support operator … and consume [GH0's finite-rank Runge operator] (GlobalHolomorphicFunctions Layer 2, §2.5)". The same edges appear at `:35–36`, `:286`, `:302–307`, `:489–510`, `:930–932`, `:1363`, `:1430–1449`, `:1543–1545`, `:2730–2736`, `:2742` and `:2750–2756`.

**Claim.**
- ComplexKahlerGeometry is on main, so it may consume only the pins and roadmaps on main.
- These three roadmaps exist only as open new-roadmap pull requests.
- This pull request adds two such edges: `:286` (Parameter Cauchy–Green) and `:489–497` (K3.MeromorphicGermField).
- `:490` cites "Layer 4, §4.1" for the local Laurent decomposition. At #992 §4.1 is the prescription of principal parts; the decomposition is §0.4.
- The dependency check printed `0 problem(s)` with no line for these edges, so I report them from the rule itself.

**Witness.** `git ls-tree origin/main TauCetiRoadmap/` (`3090489`) contains no `GlobalHolomorphicFunctions`, no `VariationalMethods` and no `OperatorTheory/UnboundedOperators`. They exist at #992 (§0.3 `:656`, §0.4 `:735`, §2.5 `:1327`, §4.1 `:1714`, §7.4 `:2400`), #1028 (§5.1 `:839`) and #1027.

**Repair.** No `Consume`, `*Needs:*` or order sentence may name these roadmaps as suppliers. Handle each edge as follows:
- **GH §0.3.** Cite Tau Ceti's Cauchy transform (R03).
- **GH2 Laurent coefficients.** Cite Tau Ceti's `circleLaurentCoeff` (`TauCeti/Analysis/Complex/Laurent/Basic.lean:49`) together with `coeff_principalPart_succ_eq_circleIntegral`. Turn the comparison with GH's coefficients into a deferral that GlobalHolomorphicFunctions states.
- **GH5.1.** Derive `H²_dR(Ω;ℂ)=0` from K2's own solver: with `∂̄_z u=h/(2i)`, `d(u dz)=h dx∧dy`.
- **GH0's finite-rank Runge bound** `sup_K|f−A f|≤ε sup_L|f|`: state it as a K2 target with its hypotheses (Runge compact `K`, compact neighbourhood `L`, fixed points, weights and outputs).
- **VariationalMethods §2.3, V3–V5.2, §5.1, V3.1 and UO-D06.** State as K5a targets the closed-form representation, the compact-pair represented operator and its compact-resolvent eigenbasis that K5a uses.

Test of the GH5.1 step: for `h=1` on ℂ, `u=z̄/(2i)` gives `d(u dz)=(1/(2i))·2i dx∧dy=dx∧dy`.

## R02 (P2) — K1 plans four targets that the pinned Tau Ceti already proves

**Location.**
- `README.md:115–129`: "Reindex `Fin (2 * finrank ℂ E)` to `Fin (finrank ℝ E)` … and prove every chart sign … is positive. … K1 also proves … that every local biholomorphism is `IsOrientationPreservingAt`".
- `:39–40` and `:159–169`: the joint holomorphic implicit map, with "chart and local-uniqueness adapters" that K1 owns.
- `:155–156`: "K1 proves that coefficient conjugation is semilinear".
- `:197`: "Prove equivalence of `N_J=0` and involutivity of both eigenbundles".

**Claim.** Each of these is planned as K1's own work, but each exists at the Tau Ceti pin `2fd255d` with the same hypotheses. A pinned object is cited, not planned again.

**Witness.**
- `complexOrientationLift` (`TauCeti/Geometry/Manifold/Complex/Orientation.lean:297`), with chart signs `1` (`:311`).
- `IsLocalDiffeomorphAt.isOrientationPreservingAt_complexManifoldOrientation` (`:359`).
- `exists_jointImplicitFunction_of_eventually_differentiableAt` (`TauCeti/Analysis/Complex/ImplicitFunction.lean:57`) and its manifold form `…_mdifferentiableAt` (`TauCeti/Geometry/Manifold/Complex/ImplicitFunction.lean:52`).
- `SmoothForm.mapCoeff_conj_smul` (`…/DifferentialForm/MapCoeff.lean:322`).
- `isInvolutiveComplexDistribution_eigenspace_I_iff` and `…_neg_I_iff` (`…/AlmostComplex/Eigenbundle.lean:96`, `:149`).

**Repair.** Cite these six declarations, with their files, in K1 and in the Conventions. Delete "K1 owns …" and "K1 also proves …" for them. Keep only what the pin lacks:
- the eigenbundles as smooth subbundles of SBC B2's complexification;
- the `N′=N/4` variant;
- holomorphic submanifolds and normal sequences.

Test: the README Check `G(z,v)=v²−z` at `(1,1)` follows from the pinned `:57`, since `∂₂G=2` is invertible and the theorem gives `ψ(1,0)=1`, `G(z,ψ(z,w))=w` and local uniqueness.

## R03 (P2) — "Parameter Cauchy–Green" is a pinned theorem

**Location.** `README.md:284–295`: "Prove the following lemma for this solver. … The map `(p,q,z) ↦ T(χ f(p,q,·))(z)` is jointly `C^∞`; … `∂̄_{q_j} T(χ f) = T(χ ∂̄_{q_j} f)`".

**Claim.** Every clause is in Tau Ceti at `2fd255d`, proved by the README's own route: convolution of the locally integrable kernel after `ζ=w−z`, and differentiation under a fixed compact support. GlobalHolomorphicFunctions #992 `:2442` also says the parameter smoothness "are Tau Ceti's".

**Witness.** In `TauCeti/Analysis/Complex/Pompeiu/Parameter.lean`:
- `contDiffOn_integral_sub_inv_smul_with_param` `:75`;
- `hasFDerivAt_…_with_param` `:124`;
- `conjWirtingerDeriv_…_with_param` `:158`;
- `differentiableAt_…_with_param` `:182`.

In `Pompeiu/Basic.lean`: `…conjWirtingerDeriv_integral_sub_inv_smul_apply_one` `:261` and `differentiableOn_integral_sub_inv_smul_compl` `:286`.

**Repair.** Replace the paragraph with a citation of these six declarations and their hypotheses:
- an open parameter set `s`;
- a fixed compact `k` outside which `g p` vanishes;
- `ContDiffOn ℝ n ↿g (s ×ˢ univ)`, with `n ≥ 1` for the Wirtinger clauses.

Apply them in parameter charts, with `s` a chart of `P` times `Q`.

Test: for `g(q,z)=χ(z)q̄`, `:158` gives `∂̄_q T=T(χ)≠0`. So holomorphy in `q` needs holomorphic input, as `:182` assumes and the README states.

## R04 (P2) — The K5a delta-series failure and the K7.1 OnePoint biholomorphism are pinned

**Location.**
- `README.md:1087–1089`: "Own the literal delta-series failure … With a compact smooth test equal near0 to `1/(1+2x)` … prove `⟨δ^(n)/n!,φ⟩=2^n`".
- `:2111–2114`: "Upgrade the existing equivalence `OnePoint.equivProjectivization ℂ` to a homeomorphism and a biholomorphism".

**Witness.**
- `TauCeti.exists_testFunction_normalized_delta_derivative_eq_two_pow` and `not_tendsto_sum_normalized_delta_derivative` (`TauCeti/Analysis/Distribution/DeltaSeries.lean:68`, `:97`).
- `OnePoint.diffeomorphProjectivization` (`TauCeti/Geometry/Manifold/Instances/OnePoint/Projectivization.lean:140`): a `C^n` diffeomorphism for every `n`, including ω.

**Repair.** Cite both. The import clash of `:2075–2077` restricts Lean files only, not README citations. Keep only the comparison of Tau Ceti's `OnePoint.instChartedSpace` with ComplexManifolds Milestone 3's atlas, if the two differ.

Test:
- `φ=1/(1+2x)` near 0 gives `⟨δ^(n)/n!,φ⟩=(−1)^n(−2)^n=2^n`, the pinned value.
- `t=2↦[2:1]` reads 2 in the chart at coordinate 1 (`:66`), and `∞↦[1:0]` reads 0 in the chart at coordinate 0 (`:73`).

## R05 (P2) — Two headlines that can be stated at the pins are absent: the Frölicher inequality and the de Rham–Hodge theorem

**Location.** `Suggested.lean:85–88`: "the Frölicher spectral sequence and the Iwasawa-manifold computation (K8): … the filtered type complex … and the Iwasawa quotient are constructions of K8". The theorems themselves are at `README.md:2598–2600` (Frölicher) and `:1470–1472` (Hodge).

**Claim.**
- `b_k ≤ Σ_(p+q=k) h^(p,q)` is K8's end theorem (demailly-agbook line 15950, VI (11.2), p. 322). It needs only `deRhamCohomology` and the file's `DolbeaultCohomology`.
- K5a's real de Rham–Hodge theorem needs the pinned `SmoothForm.codifferential` (`…/Riemannian/Codifferential.lean:88`).
- RiemannianGeometry `:90–94`, HeegaardFloer `:166–170` and SmoothBundlesConnections `:63` on main all consume the Hodge theorem from here.
- The docstring neither states these two theorems nor names them as not statable.

**Witness.** I appended the two statements below to a copy of the file, adding `import TauCeti.Geometry.Manifold.Riemannian.Codifferential`. It elaborates with 27 `sorry` warnings and no error.

**Repair.** Add the following, and name both in README K8 and K5a.

```lean
-- in section CompactKahlerComplex (T2Space, CompactSpace; no Kähler hypothesis)
/-- **The Frölicher inequality** (Demailly, Chapter VI, (11.2)). -/
theorem finrank_deRhamCohomology_le_sum_dolbeault (k : ℕ) :
    Module.finrank ℝ (deRhamCohomology 𝓘(ℝ, E) M k) ≤
      ∑ p ∈ Finset.range (k + 1), Module.finrank ℂ (DolbeaultCohomology E M p (k - p)) := by
  sorry

open Bundle in
/-- **The de Rham–Hodge theorem** on a compact oriented Riemannian manifold. -/
theorem finrank_deRhamCohomology_eq_finrank_harmonic {E H M : Type*} [NormedAddCommGroup E]
    [NormedSpace ℝ E] [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [I.Boundaryless] [TopologicalSpace M] [T2Space M] [CompactSpace M] [ChartedSpace H M]
    [IsManifold I ∞ M] [Bundle.RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)] {m k l : ℕ}
    (hm : Module.finrank ℝ E = m) (o : TauCeti.Manifold.Orientation I M (Fin m))
    (hkl : k + 1 + l = m) :
    Module.finrank ℝ (deRhamCohomology I M (k + 1)) =
      Module.finrank ℝ ↥(LinearMap.ker (mextDerivₗ I (F := ℝ) (k + 1)) ⊓
        LinearMap.ker (SmoothForm.codifferential o hkl)) := by
  sorry
```

Then restrict the docstring's K8 item to the spectral sequence and its pages.

Test:
- On the Iwasawa manifold, `4 ≤ 3+2`.
- On `S¹`, `b₁=1` matches the line of harmonic 1-forms `c·dθ`. Without `codifferential`, the closed 1-forms on `S¹` form an infinite-dimensional space.

## R06 (P2) — The ℂPⁿ model comparison still has a second owner, and no merge order is stated

**Location.** `README.md:2101–2103`: "This roadmap is the single owner of that comparison and of the transport of `cwComplex` and its characteristic maps in K7.2: AlgebraicTopology Stage 4.6 supplies only the generic quotient topology". The pull-request description's merge-order lines are the other half of this finding.

**Claim.** The folder side is correct. The other side is not:
- Three open AlgebraicTopology heads still own the homeomorphism and the transported cells.
- #1807 and #1854 rewrite this roadmap's K7 to consume them.
- #1807, #1808 and #1854 conflict with this head, and no order between them and this pull request is stated.

**Witness.** `roadmaps grep --fixed --readme-only 'CW structure and characteristic maps along it'` finds AlgebraicTopology at #1797 `:1401`, #1807 `:1211` and #1854 `:1077` ("ComplexKahlerGeometry K7 consumes"). `overlaps.md` lists the #1807, #1808 and #1854 conflicts in this folder.

**Repair (description).** Add: "#1797, #1807, #1808 and #1854 rebase on this pull request. Each replaces its AlgebraicTopology Stage 4 item 6 ownership of the homeomorphism with `Projectivization ℂ (Fin (n+1) → ℂ)` and of the transported cells with citations of ComplexKahlerGeometry K7.1 and K7.2. #1807, #1808 and #1854 drop their ComplexKahlerGeometry hunks."

Test: after the rebases, the grep finds no head.

## R07 (P3) — The README is not in house shape, and two LaTeX macros remain

**Location.**
- `README.md:1` "# Complex manifolds, Dolbeault theory, and Kähler geometry"
- `:10` "## Conventions and suppliers"
- `:110` "## K1. …"
- `:2728` "## Order and references"
- `:134` "`dφ=φ_z dz+φ_{\bar z}d\bar z`"
- `:299` "`int K_{j+1}\setminus K_{j-1}^+`"
- `:2076` "until one copy is removed"

**Claim.** The README departs from the house shape in these ways:
- There is no `# Roadmap:` title and no `**Summary.**`.
- Scope, conventions and supplier contracts share one section.
- There is no `## How to read the build`.
- Layers are headed `## K1.` rather than `## Layer K1: …`.
- No layer ends with `### Examples` and `### Dependencies`.
- K1, K2, K3, K4, K5a, K5b and the start of K6.1 have no `*Needs:*` line.
- There is no `## Downstream consumers` and no `## References` section.

The file also contains two LaTeX macros and one process phrase.

**Witness.** `grep -c '^### Dependencies'` returns 0, as does `grep -c '^### Examples'`. `grep -c '^\*Needs:\*'` returns 9, and none of those lines falls before `:893`.

**Repair.**
- Retitle the README `# Roadmap: complex manifolds, Dolbeault theory, and Kähler geometry` and add a **Summary.**
- Split `:10–108` into `## Scope and ownership`, `## Conventions` and `## Exact supplier contracts`, one subsection per supplier.
- Move `:2738–2811` into `## How to read the build` and per-layer `### Dependencies`.
- Add `### Examples` (the existing Checks' worked cases) and `*Needs:*` lines to the subsections listed above.
- Split `:2728` into `## Downstream consumers` and `## References`.
- Write `φ_z̄ dz̄` at `:134–135` and `int K_(j+1) ∖ K_(j−1)^+` at `:299`.
- Rephrase `:2076` timelessly: "at the pins both libraries declare it".

## R08 (P3) — Two locators: the rational quartic has none, and (2.7) does not give regularity or dimension

**Location.**
- `README.md:2347–2400` (K7.2.RationalQuartic) has no source locator and is not marked as this roadmap's own example.
- `:516–518`: "a regular local ring of Krull dimension `finrank ℂ E`, and … a factorial domain (Demailly, Chapter II, (2.7) and (2.10))".

**Witness.** demailly-agbook line 3872, (2.7): "the ring O_n is Noetherian", and nothing on regularity or Krull dimension. Line 3931, (2.10): O_n is factorial. The Lean docstring (`Suggested.lean:270–271`) already limits (2.7) to Noetherianity.

**Repair.**
- Mark the quartic as "this roadmap's own worked example", or cite a textbook locator for it.
- Rewrite `:517` as "(Demailly, Chapter II, (2.7) for Noetherianity and (2.10) for factoriality; regularity and Krull dimension `n` are this roadmap's own deduction from the `n` coordinate generators of 𝔪 and the prime chain `(0)⊂(z₁)⊂⋯⊂(z₁,…,z_n)`)".

Test at `n=2`: the quotients `ℂ{z₁,z₂}`, `ℂ{z₂}` and `ℂ` are domains, the chain has length 2, and 𝔪 has 2 generators.

## R09 (P3) — `complexBesselSymbol_temperate` is an API lemma, not a headline

**Location.** `Suggested.lean:310–318`: "The complex-order Bessel symbol has temperate growth for every complex order". `complexBesselSymbol` exists only to state this lemma.

**Claim.** `Suggested.lean` is an acceptance test of the roadmap's end theorems. Temperate growth of an explicit symbol is a step on the way to K5a's Hilbert scale, not a result the roadmap is built to reach.

**Witness.** `|complexBesselSymbol n z ζ|=(1+‖ζ‖²)^(Re z/2)`, a polynomially bounded smooth function. No other declaration uses `complexBesselSymbol` (`grep` finds only `:312` and `:318`).

**Repair.** Delete both declarations from `Suggested.lean`. Drop the backticks around `complexBesselSymbol`/`complexBesselSymbol_temperate` at `README.md:1204`, `:1206` and `:1560`, keeping the prose and the Checks.

## Verified sound

**Gate.** The worker's run and my re-run both show every scanner at 0 and `OK`. The worker's run also has `build=0`. The dependency check (`--movable`) printed exactly `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line; R01 records edges it does not see. `git diff --stat origin/main...HEAD` outside the folder is empty. `PROGRESS.md`, `STATUS.md` and `metadata.toml` are the generated roadmap files.

**Lean.**
- `lake env lean` on `Suggested.lean` exits 0 with exactly 25 `declaration uses sorry` warnings.
- `#check @name` for all 33 declarations elaborates.
- The four leads in `signatures.md` (the three Dolbeault definitions and `lefschetzMap`) are general definitions that need no compactness or finiteness binder. Every theorem keeps its binders: `[T2Space M] [CompactSpace M]` and `FiniteDimensional ℂ E` on the K5b/K6.1 statements, and `[I.Boundaryless]` and compactness on `hard_lefschetz` and `even_finrank_…`.
- One-tactic probes on copies of the file closed nothing: `simp`, `fun_prop`, `infer_instance` and `aesop` each left 25 `sorry`s and produced no error.
- The import-clash claim of `:2075–2077` holds. `import Mathlib` followed by `import TauCeti.Topology.Algebra.Projectivization` fails with "environment already contains 'Projectivization.instTopologicalSpace._aux_1'".

**Library names.** I opened these at the pins (Mathlib from the manifest, Tau Ceti `2fd255d`) and found every one:
- 32 K3 stalk and meromorphic-germ names;
- about 75 other cited Tau Ceti names (type calculus, Nijenhuis, stars, codifferential, fundamental classes, spectral sequence, ℂPⁿ atlas and cells);
- 38 cited Mathlib names, including `MontelSpace` (`Mathlib/Analysis/LocallyConvex/Montel.lean:46`), `ContinuousLinearEquiv.toCompactConvergenceCLM` (`:104`), `Projectivization.instTopologicalSpace` (`Mathlib/Topology/Algebra/Projectivization.lean:44`; Tau Ceti `:90`) and `IsRegularLocalRing`.

At the pin, the Hodge Laplacian, the Dolbeault complex and the complex de Rham complex are absent, so K2 and K5a rightly plan them.

**Cross-roadmap citations.**
- VariationalMethods §5.1 is `:839` at #1028, and `CompactFormPair.operatorDomainV` is its `Suggested.lean:185`. This resolves the citation tool's one lead (an R01 edge).
- GlobalHolomorphicFunctions sections are as quoted in R01.
- RiemannianGeometry `:90–94`, HeegaardFloer `:166–170` and SmoothBundlesConnections `:60–63` on main consume K5a, so K5a owns the real Hodge theorem.
- AbelianSchemesAndArithmeticModuli is not on main. The README owns only the unimodular normal form (`:2435–2447`) and consumes nothing from it.
- CalibratedGeometry #946 defines `IsKahlerMetric` (`Suggested.lean:227`). As an open roadmap, the duty to cite this one, which is on main, is #946's.
- `overlaps.md` reports no dropped id and no id defined only by a revision.

**Sources (seeded sample).**
- demailly-agbook:
  - I (3.1) p. 20 (line 879);
  - II (2.1) (line 3794), (2.3)–(2.4) with uniqueness (lines 3804–3817), (2.7) (line 3872), (2.10) (line 3931), (3.19) (line 4286), (4.2) (line 4399), (4.22) (line 4742), (4.29) (line 4842) and (4.31) (line 4929);
  - IV (4.11)–(4.12) p. 204, (4.15) p. 205, (10.8) p. 225, (11.3)–(11.6) pp. 227–228 and (16.8) p. 249;
  - V (6.6) p. 260, (6.7) and the π₁ construction p. 261, (8.2), (9.2) and (9.5) pp. 264–265, and (15.10) (line 13812);
  - VI (3.1)–(3.5) p. 291, Theorem 3.9 p. 292, (4.4) p. 297, (5.2)–(5.3) p. 300, §7 p. 309, (7.2) p. 309, (7.3) p. 310, (8.5)–(8.8) pp. 311–312, (8.12) and (8.17) p. 313, (9.1) p. 314, (10.1)–(10.2) p. 317 and (11.1)–(11.3) pp. 322–323.
- ballmann-kahler: Theorem 4.17 at printed pp. 47–48 (PDF 53–54), and Examples 4.10(5), (4.12)–(4.14), at printed pp. 43–44.
- knutson-borel-weil §1 p. 1 (lines 12–54).
- berwick-evans-tripathy §2.1 Remark 2.1 p. 6 (lines 287–292).
- sakane-parallelisable pp. 188–189 (lines 102–115). The lattice step cites Raghunathan Corollary 1 p. 31 and Theorem 1.13 p. 23, exactly as the README does.
- angella-iwasawa §§4.1–4.2 p. 13 (lines 693–724): `b₁=4`, `h^(1,0)=3` and `h^(0,1)=2`.
- Parameter Cauchy–Green, K3.MeromorphicGermField and K5a.SmoothSectionMontel carry no external locator. The first is pinned (R03), the second consists of pinned names, and the third is marked as this roadmap's own. K7.2.RationalQuartic is R08.

**Adversarial pass.** 60 rows, each computed this round. Two fail (R01, R06). Two flag statements that are true but absent from `Suggested.lean` (R05). Four flag statements that are true but already proved at the pin (R02–R04). Every other row passes.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Parameter Cauchy–Green `:284–295` | `g=χ(z)p`; `g=χ(z)q̄`; `k=tsupport χ` | `∂_p T(χp)=Tχ=T(∂_p g)`; `∂̄_q T(χq̄)=Tχ≠0`; holomorphic off `k` | True; pinned, R03 |
| K3.HolomorphicStalk Weierstrass `:442–450` | `f=w²−z`; `f=w³` divided by it; `f(0,0)≠0` | `u=1`, `a=(−z,0)`; `w³=w(w²−z)+zw`, `r=zw` of degree `1<2`; `d=0`, `u=f` | Pass |
| K3.MeromorphicGermField `:455–505` | `e(z)=2z` at 0 | `1/z↦1/(2z)`, which returns to `1/w` along `w↦w/2`; `1+z↦1+2z`, value 1 on both sides | Pass; GH edge is R01 |
| K4.ComponentwiseFiniteRankAssembly `:692–739` | `ℂ⊔ℂ` with ranks 0, 2; empty base | fibres `0` and `ℂ²`, so no single `F`; zero objects | Pass |
| K4 monodromy `:754–757` | `d−a dz/z` | parallel sections `cz^a`, `M(γ)=e^(2πia)`; the inverse convention gives `e^(−2πia)` | Pass |
| K5a.SmoothSectionMontel `:1101` | `M` a point; `C⁰([0,1])` | sections `=F`, where closed bounded sets are compact; `sin(nπx)` has no convergent subsequence, so all derivative seminorms are needed | Pass |
| K5b.0 `:1581–1621` | `H=I`; Demailly p. 300 | `|dz|²=2`, `dz♯=2∂_z`; Demailly's metric `2Σ(dx²+dy²)` gives `|dz|=1`, a factor-2 rescaling; `∂̄*=−*∂*` is free of normalization | Pass |
| K5b Checks `:1665–1674` | `f dz̄`; `*dz` | `∂̄*(f dz̄)=−2∂_z f`; `Δ_∂̄g=−½Δg`, symbol `½|ξ|²`; `*dz=dy−i dx=−i dz` | Pass |
| K5b.1 / `finrank_dolbeaultCohomology_serre` | ℂP¹; Hopf; elliptic curve with `p=2>n` | `1=1`, `0=0`; `h^(0,1)=1=h^(2,1)`; without `hp`, `h^(2,0)=0≠1=h^(0,1)` | Pass |
| K6.0 normal coordinates `:1686–1714` | linear term `a_(lm̄n)` of `H` | `dω(p)=0` ⇔ `a` symmetric in `l,n`; `c_(mln)=−a_(lm̄n)` kills `dH(0)`; `Γ′=−Γ+Γ=0` | Pass |
| K6.0 Check | `H=diag(1+z₂+z̄₂,1)` | `dω(0)=(i/2)(dz₂+dz̄₂)∧dz₁∧dz̄₁≠0` | Pass |
| K6.0.PlanarHodge `:1753–1772` | `P dx+Q dy`; `h dx∧dy`; wrong `*dx=−dy` | `δα=−(P_x+Q_y)`; `δ(h dx∧dy)=h_y dx−h_x dy`; the wrong star gives `dx∧*dx=−dx∧dy`; Demailly's sign `(−1)^(mp+1)` equals Tau Ceti's `(−1)^(m(k+2)+1)` (`:88`) | Pass |
| K6.0.PlanarLaplacian `:1774–1802` | `u=|x|³`; `h=x²+y²`; `x dx+y dy` | `Δ_H u=−6|x|`; `Δ_H h=−4`, Mathlib `Δh=4`; `δ=−2`, `d=0` | Pass |
| K6.1.RelativeIntegration `:1974–2046` | `(ψdx,Ψ|_U)`; `(dx,0)`; `K=[−1,1]`, `[−3,3]`; `S¹` | `1−(1−0)=0`, the wrong sign gives 2; `d(dx,0)=(0,dx|_U)`; relative pairing 1 for both `K`; `∫dθ=2π` | Pass |
| Fubini–Study `:2149–2215` | `w=(1,i)/√2`; `z=(1,0)`; `c=2`; `diag(1,2)` | `h(e₁,e₂)=i/(8π)` (transposed: `−i/(8π)`); `H_z(v,v)=1/π`; `|c|⁴=16` cancels; `4/π≠1/π` | Pass |
| K7.2.TautologicalIncidence `:2276–2345` | overlap `i,k`; `d=2`, `k=1`; `k=−1` | `a′=az_k`, `z′_i=1/z_k`, `z′_j=z_j/z_k`; `(t·F)=t⁻¹F`; `F(v)=tF(tv)→0` | Pass |
| K7.2.RationalQuartic `:2347–2400` | `n=1,2,3` | image `(a,b,0,c,d)`; pair sums of `{0,1,3,4}` cover `0..8`, `9=4·2+1`, kernel `x₀x₃−x₁x₂`; `n=3` covers `0..12`; charts `(z,z³,z⁴)`, `(u⁴,u³,u)` | Pass; locator is R08 |
| K7.FlatDegreeZero `:2477–2549` | `ρ=exp(aλ)`; `τ=i`, `(−1)^m`; two unitary characters | `u=α`, `v=αx−βy`, `a=α+iβ` recovered; `exp(πix)` gives `−1` and `1`; `|e^(aλ)|=1` on `1,τ` ⇒ `a=0` | Pass |
| K7.FlatDegreeZero curvature step | flat `ω=dx∧dy` | `F_(h′)=F_h−∂∂̄u`; `i∂∂̄u=(Δ_flat u/2)ω=−(Δ_d u)ω/2`; `u=−2Gφ` gives `iF_(h′)=0` | Pass |
| K8.NilpotentCentralReduction `:2634–2697` | `H₃(ℤ)`; Iwasawa | `log(1,1,1)=X+Y+½Z`; `Γ∩A≅ℤ`, `Γ̄≅ℤ²`; `Γ∩A=ℤ[i]` | Pass |
| K8 Frölicher reindexing `:2591` | `E₁^(1,0)` | native `(3,−2)→(5,−3)`, which is `E₁^(2,0)` | Pass |
| K8 Iwasawa Check `:2701–2703` | `dφ₃=−φ₁∧φ₂` | `d₁[φ₃]=−[φ₁∧φ₂]≠0`; `3+2=5>4` | Pass |
| Hopf diamond `:2551–2565` | weights | holomorphic weights `2^(d+1)`, Laurent `2^(1−m−n)`, none equal to 1, so `h^(1,1)=0` | Pass |
| K2 Check `:353–355` | `dz̄/z̄` on ℂ× | `=∂̄log|z|²`; `∮=−2πi` | Pass |
| K3 node and cusp `:610–614` | `t↦(t(t²−1),t²−1)`; `(t³,t²)` | `z²=t²(t²−1)²=w²+w³`; `t=±1↦0`; `t⁶=t⁶` | Pass |
| K4 Chern Checks `:749–753` | `h=e^(−|z|²)`; `g=e^z` | `A=−z̄dz`, `(i/2π)F=(1/π)dx∧dy`; `A′=A+dz` | Pass |
| K4.P Checks `:901–924` | point; `ℝP²`; `S¹`; `S²` | segment `0→⋯→0`, `exp(2πi·)` kernel ℤ; Bockstein injective; `H¹(S¹;ℂ)=ℂ`; `H¹(S²;ℤ/2)=0` misses `O(k)` | Pass |
| K5a Bessel Checks `:1560–1578` | `z=0,2,it`, `‖ζ‖=2`; delta | `1`; `5` (wrong model: 3); modulus 1; `δ∈H^s` iff `s<−n/2` | Pass |
| `newlander_nirenberg` | `n=0`; `ℂ` with `J=i` | discrete `M`, `φ` constant; `φ=id` | Pass |
| `dolbeault_grothendieck_polydisc` | `n=0`; `r≤0`; `f dz̄` on a disc | degree ≥1 forms vanish; empty polydisc; `∂̄u=f` | Pass |
| `exists_mixed_parameter_dbar_solution` | `u=z̄`; `u=z`; `Ω=∅` | `(1+i(−i))/2=1`; `(1+i·i)/2=0`; vacuous | Pass |
| `weierstrass_preparation(_unique)` | `w²−z`; `n=0` | `u=1`, `a=(−z,0)`; `f=u·w^d`; `u′P′=P` forces `u′=1` | Pass |
| `weierstrass_division` | `w³` by `w²−z` | `q=w`, `r₁=z`, `r₀=0` | Pass |
| `ruckert_nullstellensatz` | `k=0`; `f=z²`, `g=z` | `g≡0`, `m=1`; `m=2` | Pass |
| `oka_coherence` | `(z₁,z₂)`; `k=0` | relations generated by `(z₂,−z₁)`; `m=0` | Pass |
| `cartan_coherence_reducedIdeal` | `(zw)²`; `z²` | generators `zw` and `z`, not the squares | Pass |
| `riemann_extension` | `1/z`; `sin z/z`; `k=0` | excluded by `hbdd`; extends by 1; `U=∅` | Pass |
| `isRegularLocalRing_holomorphicStalk` | `E=0`; `E=ℂ` | field, dimension 0; `𝔪=(z)`, dimension 1 | Pass |
| `uniqueFactorizationMonoid_holomorphicStalk` | `w²−z³` | irreducible: `±z^(3/2)∉ℂ{z}` | Pass |
| `hartogs_extension_across_point` | ℂ; ℂ² | `1/z` excluded by `2≤finrank`; extension across 0 | Pass |
| `finiteDimensional_dolbeaultCohomology` | `M=ℂ` | `H^(0,0)` = entire functions, infinite-dimensional; compactness present | Pass |
| `del_delBar_lemma` | Kähler form of `ℂ/Λ`; `p+1>n` | `∫ω>0`, so not exact; `α=0`, `γ=0` | Pass |
| `finrank_deRhamCohomology_eq_sum_dolbeault` | ℂP¹ `k=2`; `ℂ/Λ` `k=1`; Iwasawa | `1=0+1+0`; `2=1+1`; `4<5`, so Kähler is needed | Pass |
| `finrank_dolbeaultCohomology_symm` | Hopf | `h^(0,1)=1≠0=h^(1,0)`, not Kähler | Pass |
| `even_finrank_deRhamCohomology_odd` | Kodaira–Thurston; annulus | `b₁=3`, `N_J≠0`; `b₁=1` with boundary | Pass |
| `lefschetzMap`, `hard_lefschetz` | `j=0`; ℂP²; `S²×S²` | identity; `1↦[ω]²`, `∫=1`; `2ab≠0`, `σ₁²=0`; degree `2n−k` | Pass |
| `finrank_dolbeaultCohomology_complexProjectiveSpace` | `n=0`; `n=1`, `p=q=2` | `1`; `h^(2,2)(ℂP¹)=0` by `p≤n` | Pass |
| `finrank_deRhamCohomology_complexProjectiveSpace` | `n=2` | `1,0,1,0,1`, `χ=3` | Pass |
| `integralCupPow`, ring | `n=0`; `S²∨S⁴`; `u=2g` | `u=0`, `u⁰` generates ℤ; `u²=0` fails at `k=2`; `m↦2mg` not onto | Pass |
| `finrank_dolbeaultCohomology_riemannSurface` | two elliptic curves; ℂP¹ | `2=2`, `4=2·2`; `0=0` | Pass |
| `IsKahler`, `polydisc` | `(ℂ,dx∧dy,i)`; `r=−1`; `n=0` | `ω(v,iv)=|v|²`, closed, `N=0`; empty; a point | Pass |
| Frölicher inequality (absent) | Iwasawa; Hopf; torus | `4≤5`; `1≤1`; `2n=2n`; probe elaborates | Statable, R05 |
| de Rham–Hodge theorem (absent) | `S¹`; without `d*` | `b₁=1=dim{c dθ}`; closed 1-forms infinite-dimensional; probe elaborates | Statable, R05 |
| R01 edges | `git ls-tree origin/main` | 0 entries for the three folders; §4.1 at #992 is the prescription of principal parts | Fail, R01 |
| R01 repair (GH5.1) | `h=1` on ℂ | `u=z̄/(2i)`, `d(u dz)=dx∧dy` | Repair holds |
| R02 orientation and implicit map | `z↦2z`; `v²−z` at `(1,1)` | det `4>0`, matching pinned sign 1 (`:311`); pinned `:57` gives `ψ(1,0)=1` | Pinned, R02 |
| R04 delta series | `φ=1/(1+2x)` | `(−1)^n(−2)^n=2^n`; pinned `:68`, `:97` | Pinned, R04 |
| R04 OnePoint | `t=2`; `∞` | `[2:1]` reads 2 (`:66`); `[1:0]` reads 0 (`:73`) | Pinned, R04 |
| K7.1 χ transport `:2103–2108` | `n=0,1,2` | `χ=1,2,3`; the probe's `Homeomorph.finiteCWType` and `eulerChar_eq` proof elaborates; `infer_instance` on `Projectivization` fails | Pass |
| R06 ownership | `roadmaps grep` | hits at #1797 `:1401`, #1807 `:1211`, #1854 `:1077` | Fail, R06 |

## Not verifiable

- Bott–Tu, Hörmander (ALPDO I), Griffiths–Harris, Wells, Webster and Raghunathan are settled as uncertified, so their locators were not opened. Raghunathan's two steps were checked as Sakane cites them.
- Hörmann–Steinbauer and Łojasiewicz are in the cache but not in the sample, and were not opened.
- #1797, #1807, #1808 and #1854 were read only through `roadmaps grep`. The brief gives no checkout for them.
- Ownership against all open pull requests was checked by object only for the 25 headline names (`roadmaps grep --lean-only`), the real Hodge theorem and the ℂPⁿ comparison.
- The table rows check instances; they are not proofs.

## Source issues

- **Misprint** in demailly-agbook at Chapter VI, §5.1, p. 300: the source says the vectors ∂/∂z_j form an orthonormal basis of the cotangent space T*_xX; it should be the tangent space T_xX (the covectors dz_j are the orthonormal basis of T*_xX); affects nothing.

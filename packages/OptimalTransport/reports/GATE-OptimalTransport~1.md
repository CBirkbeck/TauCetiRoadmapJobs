# GATE-OptimalTransport~1: answers to the review of PR #950 at `10d59fd`

One review comment (CBirkbeck, 2026-10-28) with thirteen findings F01–F13, numbered H01–H13 in
order. Repairs are in commit `48ffacf` (one commit on top of `10d59fd`, not pushed).

## H01 (CBirkbeck) — applied

`TauCetiRoadmap/OptimalTransport/Suggested.lean`: the local `wassersteinEDist_top` (old line 160)
is deleted along with every other local duplicate of a Tau Ceti declaration. The README now
consumes `TauCeti.wassersteinEDist_top`, which carries `hd : Measurable fun z ↦ edist z.1 z.2`
(`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Basic.lean:165` at the build pin and `:194`
at main's pin). The same hypothesis is added at the other two places the README states the
identity: the generality contract item 5 and Pinned conventions. Layer 3.6 now reads "For a
jointly measurable ground distance, prove …". The witness is checked against Mathlib's
`eLpNorm` definition (`Mathlib/MeasureTheory/Function/LpSeminorm/Defs.lean:87`: ∞ unless
AE strongly measurable) and kept as a negative-control Check in Pinned conventions and in
Layer 3 Examples. On the two-point discrete space with the trivial σ-algebra the only null set
is ∅, so the `eLpNorm` side is ∞ and the essential supremum is 1. With the full σ-algebra and
marginals δ₀, δ₁ both sides are 1.

## H02 (CBirkbeck) — applied

Agueh–Carlier Definition 3.2 requires `μ(A) = 0` for Borel `A` of Hausdorff dimension **less than
or equal to** `d − 1` (agueh-carlier line 617; uniqueness Proposition 3.5 at agueh-carlier
line 650; existence Proposition 2.3 at agueh-carlier line 394). Layer 12.7 changes from
"less than `n-1`" to "at most `n-1`", with both locators. The two-segment counterexample is a
new Layer 12 Check. Every coupling `(s,t)` of the two segment laws has `⟨(s,0),(0,t)⟩ = 0`, so
the midpoint objective is `E(s²+t²)/4 = 1/6` for every coupling. The couplings `t = s` and
`t = −s` therefore give two different barycenters, and each segment carries mass 1 on a set of
dimension 1, which the corrected predicate excludes. The repaired statement is now a
`Suggested.lean` headline, `existsUnique_isMinOn_sum_wassersteinEDist_sq_of_dimH_le`. Tau Ceti at
main's pin proves uniqueness only for an absolutely continuous input
(`Wasserstein/Barycenter/Uniqueness/Euclidean.lean:75`), so this statement is still open.

## H03 (CBirkbeck) — applied

Layer 11.2: "Prove the general form, and restrict to `μ ∈ P₂(X)` before…" becomes: prove the
change-of-reference identity for finite measures with `∫d(x,x₀)²dμ < ∞`. Under that bound,
`r log r ≥ r log s + r − s` with `s = Z_a⁻¹e^{−a d²}` makes the negative part of `ρ log ρ`
integrable, so the right side is a well-defined sum. The heavy-tailed witness is written in as
the counterexample to the unrestricted identity. Its values were computed: mass 1;
`Ent = −∫₁^∞ (u + 2 log u)u⁻² du = −∞`; infinite second moment; KL = ∞; and Mathlib evaluates
`⊥ + ⊤` to `⊥` (`EReal.bot_add`). The mass correction is kept, and both proposed Checks are
added: for `μ = 2m_a` each side is `2 log 2 − 1`, and for `μ = m_a` each side is 0.

## H04 (CBirkbeck) — applied

Layer 8.5 now uses `|Dγ|(J_{t,h})/|h|` with `J_{t,h} = [min(t,t+h), max(t,t+h)]`. The text notes
that Abedi–Li–Schultz Theorem 3.3 and equation (3.6) write the ordered interval
(abedi-li-schultz line 963), and it records the `γ(t) = t` witness: the speed and both repaired
quotients are 1, while the ordered quotient is 0 for `h < 0`. The repaired two-sided limit
holds a.e. by Lebesgue differentiation of the finite measure `∫|Dγ| dπ̃` on both one-sided
intervals. The càdlàg-representative convention (Remark 2.20, abedi-li-schultz line 857) is now
stated before the all-time evaluation identity.

## H05 (CBirkbeck) — applied differently

Applied:
- **Duplicates removed from `Suggested.lean`.** All 26 local stand-ins are deleted. The new
  README section "Exact supplier contracts / From Tau Ceti" cites by name and file
  `TauCeti.IsCoupling`, `TauCeti.Coupling`, `TauCeti.transportCost`, `TauCeti.IsOptimalCoupling`,
  `TauCeti.IsKantorovichOptimalTransportMap`, `TauCeti.wassersteinEDist`,
  `TauCeti.wassersteinEDist_top`, `TauCeti.HasFiniteMoment`, `Matrix.exists_sinkhorn_scaling`
  and `TauCeti.riemannianVolume`. Pinned conventions now name `TauCeti.IsCoupling` and
  `TauCeti.transportCost` instead of the local spellings.
- **Mathlib data processing.** Mathlib at both pins proves
  `InformationTheory.klDiv_map_le`, `klDiv_trim_le` and `klDiv_comp_right_le`
  (`Mathlib/InformationTheory/KullbackLeibler/DataProcessing.lean:159,179,185`, finite
  measures). "Data processing" is removed from the build lists in Exact supplier contracts and
  Layer 11.1, which now consume these lemmas.
- **Layer 6.6 area formula.** It now extends GeometricMeasureTheory G2's Lipschitz area formula
  (on main) to approximately differentiable gradients of convex functions, and G2 is listed as
  a supplier. The "length/geodesic-space infrastructure" built here is re-attributed to
  Hopf–Rinow Layer 4.
- **Pattern repair.** Ownership against PDE was rechecked. PDE on main has renumbered its Lanes
  into Layers, so every "Lane A.1/A.6/A.7/F/F.26" citation now reads §1.1 (A1), §1.6 (A6),
  §1.7 (A7), §6.3 (F26). Local VMO now builds only the domain-local version on top of PDE
  §2.4 (B11).

Disputed:
- **Deleting supplied targets from Layers 0–5 and 12–13.** Tau Ceti's optimal-transport library
  is this roadmap's own implementation: `STATUS.md` and `PROGRESS.md` record those
  declarations as this roadmap's landed targets, and `STATUS.md` indexes coverage by layer
  item. Deleting implemented targets would erase their specification and break that indexing.
  Scope and ownership now states the relationship explicitly instead.
- **Citing StochasticCalculus S1.2 for the Wiener law.** StochasticCalculus is an open PR
  (#1030), not on main. A revision of a roadmap on main may not name it as a supplier, and
  ownership between a roadmap on main and an open one is settled by the open one citing the one
  on main. Layer 13.12 keeps the Brownian law.

## H06 (CBirkbeck) — applied differently

The two suggested headlines are already proved at main's Tau Ceti pin `2fd255d`, so stating them
as `sorry` would restate library theorems:
- population barycenter existence: `TauCeti.WassersteinSpace.exists_isFrechetBarycenter`,
  `Wasserstein/PopulationBarycenter.lean:301`, on proper metric spaces;
- finite entropic GW existence and the zero-temperature limit:
  `TauCeti.exists_isMinOn_entropicGromovWassersteinObjective` (`GromovWasserstein/Entropic.lean:133`)
  and `TauCeti.exists_isMinOn_gromovWassersteinObjective_tendsto_subseq` (`:226`).

`Suggested.lean` is rewritten as an acceptance test of six headlines that are unproved at the
pins, each source-checked:
1. Gangbo–McCann (gangbo-mccann line 308, conditions at lines 284–293).
2. Caffarelli's interior Hölder regularity (de-philippis-figalli-survey line 1190).
3. McCann's Riemannian theorem, on Mathlib's `IsRiemannianManifold` and Tau Ceti's
   `riemannianVolume`.
4. Agueh–Carlier with the corrected predicate.
5. The Gaussian barycenter fixed point (agueh-carlier line 1197; alvarez-esteban-et-al
   line 625).
6. Nutz's Schrödinger potentials (nutz line 641).

The generic postponement is replaced by a per-headline list of the carrier each unstated
headline needs. Its single-line `import Mathlib` is followed only by Tau Ceti modules whose paths
are identical at both Tau Ceti pins (see Pins below).

## H07 (CBirkbeck) — applied

Deleted:
- Layer 13.9: "a real-arithmetic iteration with certified residual and objective-gap bounds;
  log-domain stabilization …";
- Layer 16.5: "executable finite examples … floating-point wrapper";
- Layer 15.9: "certified objective/lower-bound calculations".

They are replaced by exact Checks of the theorems. The proposed check is added to Layer 13
Examples: `K = [[2,1],[1,2]]` gives `Δ(K) = log 4`, and
`tanh(log 4/4) = (√2 − 1/√2)/(√2 + 1/√2) = 1/3`.

## H08 (CBirkbeck) — applied

Layer 15.10 now writes the GW barycenter problem out, matching Tau Ceti's implementation at
main's pin (`GromovWasserstein/Barycenter.lean`, the fixed-law Peyré–Cuturi–Solomon form):
- **Setting:** finite exponent `1 ≤ p < ∞`, scalar measured kernels on finite carriers, weights
  summing to one, and a prescribed barycenter carrier with law `μ`.
- **Objective:**
  `∑_j w_j (∑ |ω(i,i') − ω_j(k,k')|^p π_j(i,k) π_j(i',k') + ε klDiv π_j (μ⊗ν_j))`, which at
  `ε = 0` is `∑ w_j GW_p^p` with no factor 1/2.
- **Claimed:** existence, and optimality of each positive-weight coupling.
- **Not claimed:** uniqueness, a `p = ∞` objective, or existence over the free-carrier quotient.

Checks added: the one-point kernels 0 and 2 give `(|z|+|z−2|)/2` at `p = 1`, minimized on all of
`[0,2]`, and `(z−1)²+1` at `p = 2`, with unique minimizer 1. The unpowered objective
`∑ w_j GW_2` is minimized on `[0,2]` even at `p = 2`.

## H09 (CBirkbeck) — applied

`exists_sinkhorn_scaling` is deleted from `Suggested.lean`. Layer 13.8 and the From Tau Ceti
supplier list cite `Matrix.exists_sinkhorn_scaling`, at `TauCeti/Data/Matrix/Scaling.lean:922`
at the build pin and `TauCeti/Data/Matrix/Scaling/Basic.lean:894` at main's pin. The module moved
between the pins, so `Suggested.lean` does not import it.

## H10 (CBirkbeck) — applied differently

Applied:
- **Top-level shape.** A **Summary.** opening; `## Scope and ownership`, with an ownership list
  by roadmap and section; `## Conventions` (generality contract and pinned conventions);
  `## Exact supplier contracts`, split into From Mathlib, From Tau Ceti and From other roadmaps;
  `## How to read the build`; and a new `## Downstream consumers` (RandomMatrices,
  StandardDistributions, VonNeumannAlgebras, read from main).
- **Layers and targets.** Every layer is a `## Layer k` heading. All 141 numbered items are
  `### k.n <title>` targets with unchanged numbers, so "Layer k, item n" references and the
  coverage ids in `STATUS.md` stay valid.
- **Examples and Dependencies.** Every layer ends with `### Examples` (new computed Examples for
  Layers 2, 6, 7, 9 and 16) and `### Dependencies`.
- **Cyclical monotonicity Checks.** The proposed Checks are in Layer 2 Examples: the empty family
  `0 ≤ 0`, the diagonal swap `0 ≤ 2`, the anti-diagonal failure `2 ≤ 0`, plus an
  infimal-versus-supremal `c`-transform Check.
- **`Suggested.lean`.** Its module docstring is rewritten as an acceptance test, and all six
  declaration names appear in the README.

Not done in this revision: a target-level `*Needs:*` line and three Checks for each of the
roughly 80 definitions across 141 targets. Dependencies are given per layer instead. Doing it
per target amounts to rewriting the whole of this long-established roadmap, which goes beyond
repairing this revision.

## H11 (CBirkbeck) — applied differently

Locators added at the statements this revision touches and at both of the review's examples:
- **Layer 2.4:** Villani 2009 Theorem 5.10 (i),(iii). Uncertified: the book is paywalled, and
  the service recorded it so.
- **Layer 13.13:** the survey's Informal Statement 5.1 (leonard line 1393) defers to Léonard
  2012. The README now cites that paper's Proposition 3.4 and Theorems 3.6–3.7
  (leonard-2012 lines 730, 770, 797), with its fixed initial law and converging endpoint
  marginals, and the reference is added.
- **Layer 11.10:** rewritten as a definite statement. Its heat-flow identification is routed
  through Layer 14.6–14.7 with Ambrosio–Gigli–Savaré, Theorem 9.3 (ags-calculus-heat-flow
  line 3632), and the reference is added. Erbar 2010 has no legal copy (Project Euclid lists
  no PDF), so it is not cited.
- **Other new locators:** Gangbo–McCann Theorem 1.2; De Philippis–Figalli survey Theorem 3.3;
  Agueh–Carlier Propositions 2.3 and 3.5, Definition 3.2, Theorems 5.1 and 6.1, Remark 5.2;
  Álvarez-Esteban et al. Theorem 4.2 and Corollary 4.5; Abedi–Li–Schultz Theorem 3.3,
  equation (3.6) and Remark 2.20.

The Brownian normalization Check (`γ(t) = 2t`: kinetic action 2, endpoint rate 2, and 4 without
the half) is in Layer 13 Examples.

Not done: a locator for every remaining target, and `sources.toml`. This job may edit only
README.md and Suggested.lean. The sources fetched this round (agueh-carlier, abedi-li-schultz,
leonard, leonard-2012, nutz, de-philippis-figalli-survey, gangbo-mccann, alvarez-esteban-et-al,
ags-calculus-heat-flow, and villani-oton as uncertified) need recording in the manifest by the
job that owns it. No text is missing: there is no `needs-references.toml`.

## H12 (CBirkbeck) — applied

The two-line code span in Layer 15.8 is split into three single-line spans, one per inequality,
with the content unchanged. The gate now reports `tex=0`.

## H13 (CBirkbeck) — applied

The sentence containing "catalogue" (old README line 50) is replaced by a positive statement of
scope: what the roadmap owns, and which variants are outside it while still extending its APIs.
The gate now reports `residue=0`.

## Build and gate

`lake build TauCetiRoadmap.OptimalTransport.Suggested`: **Build completed successfully (9010
jobs)**. The only diagnostics are six "declaration uses `sorry`" warnings, at
`Suggested.lean:58, 82, 107, 132, 149, 171`.

Gate: `gate OptimalTransport: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0
sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0
lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0
round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0
dirty=0 outside-folder=0 source-material=0 OK`

Dependency check (`gate --depcheck … --movable --pr 950`), exact output:

```
depcheck: 235 roadmaps, 2267 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

## Signature check

`#check @name` for all six declarations was appended to a temporary copy of `Suggested.lean`
and elaborated in one build; the file was then restored. Each elaborated type carries all of its
binders in its own signature, with no section `variable`s. Each type was compared with its README
statement:
- Layer 5.8 states the finite-value case.
- Layer 6.8 states the Hölder part, on bounded open `X` and bounded open convex `Y`.
- Layer 7.3 states map-and-uniqueness without the exponential formula.
- Layers 12.7, 12.8 and 13.3 have the same hypotheses.

The check led to two changes:
- **Weights.** "Normalized positive weights" in 12.7 became "nonnegative, with the
  vanishing input of positive weight", matching the Lean.
- **Smoothness.** `IsManifold I ⊤ M` was found to mean *analytic* in `ℕ∞ω`; it was corrected to
  `(⊤ : ℕ∞)`, i.e. C^∞.

## Adversarial pass

| Statement | Instances | Values computed | Result / change |
|---|---|---|---|
| W∞ = inf ess sup (conv., 3.6) | two points, trivial σ-alg.; two points, full σ-alg., δ₀,δ₁; one point | ∞ vs 1; 1 = 1; 0 = 0 | hypothesis added; first instance kept as negative control |
| Agueh–Carlier ∃! (12.7, Lean) | n=0; n=1; n=2 two segments; zero weight on vanishing input; one input of weight 1 | n=0: `dimH {0} = 0 ≤ 0` forces `μ_j univ = 0`, vacuous; n=1: atomless input, 1-D barycenter unique by quantile averaging; segments: objective 1/6 for t=s and t=−s, two barycenters, excluded by "≤ 1"; zero weight: segments plus a weight-0 AC input stay non-unique, so `w j ≠ 0` is needed; single input: objective `W₂(ν,μ)²` vanishes only at μ | predicate fixed to "at most"; `hj` kept |
| Change of reference (11.2) | μ=2m_a; μ=m_a; μ=0; heavy tail | `2log2−1` both sides; 0=0; `klDiv 0 m_a = 1`, RHS 0+0+0+1−0=1; LHS ∞, RHS ⊥+⊤=⊥ | moment hypothesis added; Checks added |
| BV speed (8.5) | γ(t)=t, h=±0.1; jump mixture of Example 1.1 | quotients 1,1 (J), ordered gives 0 for h<0; ∫∣Dγ^{(α)}∣(J)/∣h∣ dα = 1 = W₁ speed | interval J_{t,h} adopted |
| Gangbo–McCann (Lean) | d=0; h=x², U[0,1]→U[0,2]; h=∣x∣; Cauchy→U[0,1] with h=x² | trivial; T=2x unique; translation and reflection both cost 1 (H1/H3 needed); every coupling costs ∞, so all optimal (hfin needed) | stated with hfin, H1–H3; x² checked against the cone condition (∣p+v∣² ≤ ∣p∣² for ∣v∣ ≤ 2∣p∣cos(θ/2)) |
| Caffarelli (Lean) | n=1, X=(0,1), Y=(0,2), f=1, g=1/2; X=(−1,1), Y=(−2,−1)∪(1,2) | T=2x Lipschitz; monotone map jumps at 0, no Hölder version on [−1/2,1/2] | convexity of Y kept |
| McCann (Lean) | M=ℝⁿ; S¹ with ν Dirac; μ=δ_x, ν two atoms | exp_x(−∇φ)=∇u (Brenier); T≡y; no map exists, so μ ≪ vol is needed | stated; smoothness corrected to C^∞ |
| Gaussian (Lean) | n=1: N(0,1),N(0,4) weights ½; N(0,1),δ₀ weights ½; δ₀ alone | S=(3/2)√S gives S=9/4 (std 1.5 = quantile mean); S=½√S gives S=1/4 (std ½); S=0 not PD, so the PD-input hypothesis is needed | stated with one PD positive-weight input |
| Nutz potentials (Lean) | X=Y={0,1}, R=μ⊗ν; R diagonal | π*=R, φ=ψ=0, unique up to (a,−a); diagonal: φ_i+ψ_i=0 independently, two constants, so `μ.prod ν ≪ R` is needed | equivalence hypothesis kept |
| GW barycenter (15.10) | one-point kernels 0, 2 | p=1: min 1 on [0,2]; p=2: (z−1)²+1, min at 1; unpowered at p=2: [0,2] | no uniqueness claim; powered objective fixed |
| Sinkhorn contraction | K=[[2,1],[1,2]] | Δ=log 4, tanh(log 4/4)=1/3 | Check added |
| Brownian normalization | γ(t)=2t | ½∫∣γ̇∣²=2, ∣2∣²/2=2; without ½: 4 | Check added |
| Cyclical monotonicity | n=0; diagonal; anti-diagonal, c=(x−y)² | 0≤0; 0≤2; 2≤0 false | Checks added |
| c-transform | X=Y={0,1}, c=∣x−y∣, φ=(0,1) | infimal φᶜ=(0,−1), contact {(0,0),(1,0),(1,1)}; supremal gives φᶜ(1)=1, violating φ(1)+φᶜ(1)=2>0 | Check added |
| Finite duality | μ=δ₀, ν=U{0,1}, c=∣x−y∣ | primal ½; dual φ(0)=0, ψ=(0,1) gives ½, feasible | Check added |
| Monge–Ampère examples (6) | ∣x∣²/2; ∣x∣ on ℝ²; U[0,1]→U[0,2] | MA=Leb; MA=πδ₀ with det D²u=0 off 0; 1=(½)·2 | Checks added |
| Displacement examples (9) | δ₀→δ₂; V=x²/2; W=x² | W₂(δ₀,δ_{2t})=2t; 2t² equals the pinned bound, while no-½ gives 2t² ≤ 4t²−2t, false at t=½; energy 0, remainder 4−4=0 | Checks added |
| Finite API example (16) | δ₀,δ₂, c=(x−y)²; law ½δ₀+½δ₂ | cost 4; W₂=2; barycenter 1, radius 1 | Check added |

## Ownership, citations and pins

- **Citations.** `roadmaps resolve` on the edited README and on its merge with main: no
  cross-roadmap citation found nowhere. The tool does not check Lean names outside the roadmaps,
  so every Tau Ceti and Mathlib name added was checked by hand at main's pins (files above).
  Cross-roadmap citations were checked on main: GeometricMeasureTheory G2 (README:148),
  RiemannianGeometry R4.6 (R4 at README:629; the cut-locus paragraph at :725–:740 names OT
  Layer 7 as consumer), PDE §1.1/§1.6/§1.7/§2.4/§6.3, `Completed/HopfRinow` Layers 1–4,
  `Completed/OneParameterSemigroups` Part A, and the three downstream consumers.
- **Ownership.** No new carrier is introduced: every `Suggested.lean` declaration is a theorem
  on Tau Ceti and Mathlib carriers, and none reuses a fully qualified name of another roadmap.
  The only ownership edge moved is the area formula, now consumed from G2, which is on main and
  does not consume this roadmap. The closest open roadmap in vocabulary, StochasticCalculus, is
  answered under H05.
- **Pins.** This worktree builds against Tau Ceti `a91d3aa` / Mathlib `6b7abb3`, older than
  main's manifest (`2fd255d` / `1b1ccf4`). The Entropic, Existence, FrechetMean, Scaling, Gaussian
  and Quantile modules moved between the two pins. `Suggested.lean` therefore imports only
  Coupling, Cost.Basic, Monge, Wasserstein.Basic and Riemannian VolumeDensity.Volume, whose paths
  and declarations are identical at both. Carriers that exist only at main's pin (relaxed
  partial-transport cost, MTW predicates, curvature-dimension, the GW space, Boltzmann entropy,
  universal kernels) are named in the docstring as what the corresponding headlines need. After
  rebasing onto main, the FKM, partial-regularity, Borel-duality, JKO, Sinkhorn-divergence and
  GW headlines become statable.
- **Merge with main.** `git merge-tree HEAD origin/main` merges cleanly. Item 11.9 keeps its
  original line indentation so that main's `Completed/OneParameterSemigroups` link change
  applies, and in the merged tree every Hopf–Rinow and one-parameter-semigroups link points to
  `Completed/`.
- **Untrusted text.** Nothing in the review asked for actions outside this job; no suspicious
  passages.

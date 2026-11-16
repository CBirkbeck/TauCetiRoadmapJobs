<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17485#issuecomment-6908128774 -->
Red team round 2 pass b (claude) of dd92fd4

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) Pinned Tau Ceti flow API used in targets but not cited

   **Location.** README §8.5 API, line 704: "a homeomorphism h carries it to the locally maximal set
   h(Λ) of the conjugate flow t ↦ h ∘ g^t ∘ h⁻¹"; §7.2 API, line 543; §8.3, line 655 (the time τ_Λ);
   `## Exact supplier contracts`, `### From Tau Ceti`.

   **Claim.** The supplier contracts list what the pinned libraries provide and the roadmap consumes.

   **Witness.** At the Tau Ceti pin, `TauCeti/Dynamics/Flow/Conjugacy.lean:58` has `Homeomorph.conjFlow`
   (`toFun t y := e (φ t (e.symm y))`), and `TauCeti/Dynamics/Flow/ClosedOrbit.lean:100, 140` has
   `Flow.periods` and `Flow.minimalPeriod` with `Flow.minimalPeriod_pos_iff`. The README names none.
   `Flow.stableSet` (`Stable.lean:61`, convergence to a point) is a different object from W^s_δ.

   **Repair.** Add to `### From Tau Ceti`, after the `TauCeti.globalFlow` bullet:

   > - `Homeomorph.conjFlow` (`TauCeti/Dynamics/Flow/Conjugacy.lean`): the flow t ↦ e ∘ φ^t ∘ e⁻¹ transported along a homeomorphism e; the conjugate flows of §§1.3, 2.1, 2.2, 7.2 and 8.5 are this flow. `Flow.periods`, `Flow.minimalPeriod`, `Flow.minimalPeriod_pos_iff` (`TauCeti/Dynamics/Flow/ClosedOrbit.lean`): the closed subgroup of return times of a point of a real flow and its least positive element, which is 0 exactly at rest points and at points that never return; the periods of §§6.6, 8.3 and 10.4 are these, and τ_Λ of §8.3 is a positive lower bound of `Flow.minimalPeriod` over the periodic points of Λ, which this roadmap proves. Tau Ceti's `Flow.stableSet` (`TauCeti/Dynamics/Flow/Stable.lean`), the points whose trajectories converge to a given point, is not the set W^s_δ(x) of §6.5, whose points are asymptotic to the moving orbit of x, and is not consumed.

   In §8.5 line 704 replace "the conjugate flow t ↦ h ∘ g^t ∘ h⁻¹" by "the conjugate flow
   t ↦ h ∘ g^t ∘ h⁻¹ (`Homeomorph.conjFlow`)", and add `Homeomorph.conjFlow` to §8.5's `*Needs:*` and
   "Tau Ceti's conjugate flows and periods of flows" to the list of the third Scope paragraph
   ("Already in the library …"). Tested on the instance: for the cat-map suspension of §8.3's sixth
   Check, `Flow.minimalPeriod` is 1 at every point of γ₀ and τ_Λ = 1, as the Check says.

2. **F02** (P3) `HasLowerGibbsProperty` sits under "Supplied notions, restated"

   **Location.** `Suggested.lean` lines 55 and 164–170: the comment `/-! ## Supplied notions, restated -/`
   governs `section MetricNotions`, whose last declaration is `HasLowerGibbsProperty`, "The lower Gibbs
   property of a flow-invariant probability at scale `ε` (README §5.1)".

   **Claim.** The section comments follow README order and the block holds only what
   ClassicalErgodicTheory and GeometryOfNumbersAndQuadraticArithmetic own.

   **Witness.** README §5.1 (line 310) defines it as this roadmap's own (Scope, line 7: "lower Gibbs
   bounds for flows … (Layer 5)"); the module docstring's list of restated names (lines 13–19) omits
   it, correctly. The first Layer 5 comment is at line 209.

   **Repair.** Move the declaration, unchanged, out of `section MetricNotions` to just after
   `/-! ## Layer 5: Bowen's uniqueness criterion under weak specification -/`, in its own section:

   ```lean
   section LowerGibbs

   variable {X : Type*} [PseudoMetricSpace X] [MeasurableSpace X]

   /-- (docstring unchanged) -/
   def HasLowerGibbsProperty (ϕ : Flow ℝ X) (F : C(X, ℝ)) (ν : ProbabilityMeasure X) (ε : ℝ) :
       Prop :=
     …

   end LowerGibbs
   ```

   Its elaborated type mentions `PseudoMetricSpace X` and `MeasurableSpace X` only, so the binders
   above are the ones it keeps; check with `#check @HasLowerGibbsProperty` after the move.

Two P3 findings (S01, S02). No P1 or P2. All eight round-1 findings are repaired at this head and
no repair introduced an error. The whole of `packages/HyperbolicDynamicsAndThermodynamicFormalism/README.md`
(1027 lines) and `packages/HyperbolicDynamicsAndThermodynamicFormalism/Suggested.lean` (714 lines)
was read. No Lean was run (read-only pass); elaborated types were taken from the job's
`signatures.md` and compared with the README statements.

Dependency check, as run:

    depcheck: 250 roadmaps, 2366 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

## Round 1 findings: state at this head

| Id | State | Witness at `dd92fd4` |
|---|---|---|
| 1a/F01 (P1), Rauch bound credited with an upper bound | repaired | README §9.3 (line 798): "(ii) Upper bound: … \|J_T(t)\| ≤ \|w\| sinh(a(T − t))/sinh(aT) ≤ e^(−at)\|w\| on [0, T]"; R4.1 is now used only in (iii) and (iv), as a lower bound for a field vanishing at 0. Recomputed below (rows 9.3). |
| 1a/F02 and 1b/F01 (P2), Layer 9 unclassified in the docstring | repaired (applied differently) | `Suggested.lean` lines 39–45: "The other Anosov statements of README Layer 9 … are examples that check the definitions of README Layer 7 on explicit systems, not headline theorems, and are not stated". The README Summary calls all three "the examples"; I do not re-raise. |
| 1a/F03 (P3), "f-invariant subset" | repaired | README §8.4 (line 675): "iff every subset S ⊆ U with f(S) = S is contained in Λ … Forward invariance f(S) ⊆ S does not suffice (first Check)". Sink Check: S = U has f(S) ⊆ S, S ⊄ {p}. |
| 1b/F02 (P3), Lemma 2.10 cited for a statement it does not make | repaired | README §2.2 (line 232): own proof "with τ + T₀ in place of τ" and "The statement used by the uniqueness proof is a different one … (ClimenhagaThompson2016, Lemma 2.10, lines 448–463)". Example recomputed: 0.8 + g ≤ 0.8 + 3 < 4. |
| 1b/F03 (P3), `CompactSpace M` where Λ compact suffices | repaired | `Suggested.lean` lines 540 and 594: `[SigmaCompactSpace M]`; README §§10.2–10.3: "a manifold M of the Conventions (Hausdorff and σ-compact, not necessarily compact; Λ is compact by definition)". Elaborated types of the four theorems carry `SigmaCompactSpace M`. |
| 1b/F04 (P3), FH2019 section locators | repaired | FH2019 occurs twice: README §7.2 (line 537) "FH2019, Chapter 5, for hyperbolic sets of flows, and Chapter 8, for Anosov flows", and the References. |
| 1b/F05 (P3), wording of the closing lemma | repaired | README §6.2 (line 390): "there are η > 0 and R ∈ ℕ such that every y with d(f^m y, y) < η for some m ≥ R has a point z"; §6.6 the same with R > 0. |

New text introduced by the repairs was recomputed (§9.3 steps (i)–(v), §8.4 API, §2.2 short
segments, §§10.2–10.4 on σ-compact M): no error found.

## The pass: record

Lean context abbreviations: CM = `[MetricSpace X] [CompactSpace X] [Nonempty X] [MeasurableSpace X] [BorelSpace X]`;
MF(σ) = finite-dimensional model, `[MetricSpace M] [IsManifold I ∞ M] [I.Boundaryless] [SigmaCompactSpace M]`,
`RiemannianBundle` with `IsContinuousRiemannianBundle`; `hd` = `edist = min 1 (riemannianEDist I ·)`.

### `Suggested.lean` declarations (50)

| Declaration | Context | Instances and values computed | Result |
|---|---|---|---|
| `countablePartitionEntropy`, `iteratedPartitionLabel`, `partitionEntropyRate`, `measureEntropy` | `[MeasurableSpace X]` | bodies compared token by token with the supplier's file at its open head (same four bodies); point mass: H = 0, rate 0 | agree |
| `invariantProbabilities`, `flowInvariantProbabilities` | same; `[TopologicalSpace X]` | supplier's flow version is over a general time monoid; at τ = ℝ identical | agree |
| `pressureNetSum`, `topologicalPressure`, `flowTopologicalPressure` | `[UniformSpace X]` | one point, φ = 0: net sum 1 at {pt}, growth rate 0 = entropy; full 2-shift, φ = c: log 2 + c | agree with supplier §§5.4–5.5 |
| `IsEquilibriumState`, `IsFlowEquilibriumState` | uniform + measurable | one point: 0 + φ(pt) = P; supplier bodies identical | agree |
| `IsGibbsMeasure` | pseudometric | 2-shift, φ = 0, ε = 1/2: 2^(−(n+2)) · 2^n = 1/4; swap: 1/2 · 1 | matches supplier §8.4 (quotient form, equal) |
| `HasBowenProperty`, `IsExpansiveFlow`, `HasFlowBowenProperty` | pseudometric | bodies identical to the supplier's | agree |
| `HasLowerGibbsProperty` | pseudometric, measurable | periodic orbit, period p: (2s_ε/p)·e^(−2p max\|F\|) > 0; opposite sign on the suspension: ~4^(−t) → 0, excluded | sound; misplaced (S02) |
| `HasWeakSpecification` | pseudometric | k = 0: needs a point, false on ∅; j-th start Σ_(l<j)(n_l + g_l): j = 2 gives n₁ + g₁ = N₁ + τ₁; swap: τ = 1 works, common τ fails (1 + τ even and odd) | = README §2.2 |
| `HasFlowWeakSpecification` | pseudometric | segment of length 0: one time; roof-one suspension: no common τ (distances to ℤ and ½ + ℤ sum to ½) | = README §2.2 |
| `upperSemicontinuousOn_measureEntropy_of_isExpansiveFlow` | compact metric, Borel | period-1 orbit: g¹ = id, entropy ≡ 0, u.s.c.; X = ∅: no probabilities, vacuous | true |
| `existsUnique_isEquilibriumState_of_hasWeakSpecification` | CM | one point: all four conclusions; identity of two points: expansive, but no weak specification (second segment unreachable), excluded; swap: ν = (½, ½), Gibbs K = 2, ergodic not mixing | true |
| `existsUnique_isFlowEquilibriumState_of_hasFlowWeakSpecification` | CM | periodic orbit: time measure, lower Gibbs at every ε (ε above the diameter: mass 1); identity flow of two points: no weak specification | true |
| `HasHyperbolicLocalProductStructure` | pseudometric | 2-shift: e(2^(−k)) = 2^(1−k), c = 1, ρ = ½; irrational rotation: (A3) fails (isometry on the δ-ball); empty type: holds | = README §6.1 |
| `HasFlowHyperbolicLocalProductStructure` | pseudometric | period-1 orbit, δ = 0.6, z = g^0.45 x: v = 0.45 and −0.55, uniqueness fails; δ₀ = ¼ works; irrational flow: no v, (F2) fails | = README §6.5 |
| `…_of_hasHyperbolicLocalProductStructure` (§6.8(a)) | CM | swap: `Finite X`; 2-shift: log 2 > 0; monotone shift: `htrans` fails at U = {x₀ = 1}, V = {x₀ = 0}, and it has two measures of maximal entropy | true; forward `htrans` needed |
| `…_of_hasFlowHyperbolicLocalProductStructure` (§6.8(b)) | CM | periodic orbit; suspension of the monotone shift excluded by `htrans` | true |
| `IsHyperbolicSet` | manifold, continuous metric | diag(2, ½) at 0: C = 1, ρ = ½; identity in dimension ≥ 1: forces E^s = E^u = 0, false; Λ = ∅: true | = README §7.1 |
| `flowGenerator`, `IsFlowHyperbolicSet` | same | constant field on 𝕋²: E^s = E^u = 0 forces dim 1, false; rest point excluded by `≠ 0`; a flow not differentiable in x gives junk `mfderiv = 0`, but every theorem using it assumes `ContMDiff … 1` | = README §7.2 |
| `hadamardPerronBox`, `hadamardPerronGraph`, `IsHadamardPerronFamily` | inner product space | K = ⊥: graph {0}, (ii) empty, (iii) holds since ‖Df‖ ≤ ρ + δ < ρ' < ν; K = ⊤: graph = box; (iii) at L + 1 is README's f_(n−L)(z_L) = z_(L−1) | = README §8.1 |
| `exists_isHadamardPerronFamily` | same | linear maps: φ = 0; (ii) strict since ‖y − z‖ ≤ √(1 + γ²)\|Δx\| < (1 + γ)\|Δx\|; uniqueness from (i), (ii) of φ' and (iii) of φ with C = 2; cone clause: δ(1 + γ)² < γ(μ − ρ) follows from `max 1 ρ' < μ'`; f = Id, μ = ρ excluded by `hμ` | true as typed |
| `IsLocallyMaximal`, `IsFlowLocallyMaximal` | topological | sink: only ∅, {p}; −Id, Λ = {(1, 0)}: vacuous for f, fails for f²; cat suspension: integer vector of length < 0.905 is 0 | = README §§8.4–8.5 |
| `hasHyperbolicLocalProductStructure_of_isLocallyMaximal` | MF(σ), `hd` | Λ = ∅: holds; δ ≥ 1: y = x since d ≤ 1; {p} ∪ O not locally maximal, excluded | true |
| `hasFlowHyperbolicLocalProductStructure_of_isFlowLocallyMaximal` | MF(σ), `hd`, C¹ flow | periodic orbit: singleton strong sets, unique v when 2δ < period | true |
| `IsBasicSet`, `IsFlowBasicSet`, `IsFlowAttractor` | manifold | ∅ excluded by `Nonempty`; two fixed points: not transitive; attracting circle: U = {\|r\| < ¼} works, U = {\|r\| < ½} has ⋂ g^t(U) = U ≠ Λ | = README §10.1 |
| `existsUnique_isEquilibriumState_of_isBasicSet` | MF(σ), Borel, `hd` | diag(2, ½) on ℝ², Λ = {0}: δ₀, Gibbs product 1 at P = φ(0); cat map, φ = −log λ_u: P = 0, Haar | true |
| `existsUnique_isFlowEquilibriumState_of_isFlowBasicSet` | same, C¹ flow | periodic orbit: P = (1/p)∫F; time-t clause false for point masses of g¹, which are not flow invariant: the clause quantifies over `flowInvariantProbabilities` only; rescaling: h scales by a, ∫aF by a | true |
| `pos_coverEntropy_of_isFlowBasicSet`, `pos_coverEntropy_of_isBasicSet` | MF(σ) | periodic orbit: first disjunct, entropy 0; cat suspension: log((3 + √5)/2); no `hd` needed: entropy of a compact set depends on its topology only | true |
| `toralEndomorphism`, `isEquilibriumState_toralEndomorphism_zero_iff` | — | d = 0: det of the empty matrix 1, no roots, both sides true; shear (1 1; 0 1): root 1, excluded; cat: Haar entropy = h_top = 0.9624 | true |
| `flowUnstableSubspace`, `unstableJacobian`, `geometricPotential` | manifold | E^u = 0: empty Gram determinants 1, λ_t = 1, φ^u = 0; cat suspension, Sol-type metric: Gram ratio e^(2at), λ_t = e^(at), φ^u = −a | = README §11.1 |
| `srb_of_isFlowAttractor`, `srb_of_isFlowBasicSet_univ` | compact, smooth metric, C² flow and generator, `hd` | circle flow: φ^u = 0, μ⁺ the time measure, every point generic; cat suspension with the conformal factor e^(2u(s)): density e^(3u(s)) not invariant, μ⁺ still the product measure; an invariant ν ≪ m is generic-a.e. for μ⁺, so ν = μ⁺ | true |

### README targets (bold or named), by section

| Statement | Instances and values | Result |
|---|---|---|
| Conventions | doubling map: B₂(0, ⅛) half-width 1/16; 2-shift B_n(x, ½) fixes x₋₁…x_n; monotone shift: T^n(U) ⊆ U for n ≥ 0; disjoint ε-balls give d ≥ ε, maximal family 2ε-spanning | hold |
| 1.1 | Γ_ε = ⋂ T^n(B̄_(2n+1)(T⁻ⁿx, ε)): y with its only 1 at −1 is excluded at n = 1 and admitted by the other translate; ℚ: closed, not compact | holds |
| 1.2 | 2-shift at {d ≤ ¼}: 2^(n+2) cover elements, rate log 2; compactified shifts: Φ_ε(∞) has entropy ≥ m log 2 | holds |
| 1.3 | Γ_ε(x; g^t, d_\|t\|) = Γ_ε(x); orbit arc has entropy 0; identity flow on a circle: fixed points not isolated | holds |
| 2.1 | flow mixing ⇔ time-t map mixing: g^s(U) ⊇ W_(s₀) for s near s₀, finitely many s₀ cover [0, t]; period-p orbit: g^p = id | holds |
| 2.2 | supplier's specification ⇒ strong: intervals [s_j, s_j + n_j], gaps exactly M, p = s_k + n_k + M; fails on ∅ (k = 0); full shift at 2^(−m): τ ≥ 2m needed, 2m + 1 suffices; irrational rotation: one y, no accumulation | holds |
| 3.1 | ergodic case from the source theorem; non-ergodic by decomposition; inf_n H(ξⁿ)/n continuous at ν termwise | holds |
| 4.1 | (aF)₁ along g_a is F_a; F = c: 2h + c against 2h + 2c; point masses on a period-1 orbit | holds |
| 5.1 | t ≤ T₀: exponent changes by ≤ T₀(\|P\| + max\|φ\|), the stated 2T₀ is safe; ∫φ − tP ≤ log K | holds |
| 5.2, 5.3 | scales: ρ ∈ (5δ, ε/8], γ ∈ (4δ, ε/4], so r ≤ ε/8 with δ < r/5; n < N(M): factor e^(−2N(\|P\| + max\|φ\|)) | hold |
| 6.1–6.4 | f^k: W^s_(δ')(x; f^k) ⊆ W^s_(δ*)(x; f) by uniform continuity; isolated point p: f^(n+1)p = p; gluing time mM + (mL_j − r_j − n_j) + r_(j+1) ∈ [mM, mM + 2m − 1] (r_j + n_j = 0 gives the term m); Bowen bound 2C(cδ)^θ/(1 − λ^θ); 1/(m+1) + … + 1/(n+m) unbounded | hold |
| 6.5–6.8 | Fibonacci Check: n·e_v = −0.0293, \|y\| = 0.0474 (k = 6), A^(k/2)y = (0.7236, 0.4472) ≡ (−0.2764, 0.4472), norm 0.5257, min max(2h, 0.526e^(−ah)) = 0.428; ℓ = 0.1000, e^(av) = 1.101; conjugacy by s³: d = \|v\|³ | hold |
| 7.1–7.7 | Gram (2 1; 1 1): K₁K₂ = (3 + √5)/2; Jordan block: 2^n\|Jⁿ(0, 1)\| = √(4n² + 1); conjugated block norm (√65 + 1)/16 = 0.566; adapted series: ‖Df v‖² ≤ λ'²‖v‖² | hold |
| 8.1–8.3 | cone step as above; corner Check: \|v\| = \|Bv\|, \|B²v\|/\|v\| = 0.7647; time change: ratio e^(−3a) = 0.0557, e^(3a) = 17.9 | hold |
| 8.4–8.7 | c = (4/5, 3/5): Ac ≡ (1/5, 2/5), A²c = c, distance √5/5 = 0.447 > ¼; (5 + √5)/8 = 0.905 < 1; §8.6(a): m sets of diameter → 0 cover K; θ = α log λ⁻¹/(α log L + log λ⁻¹), cat map ½ | hold |
| 9.1–9.2 | E^u ∋ (1, 0.618); n = 0: point; return time ∫ ds/h = c + (R − c) = R; R ≡ 1, c = ½: h = 2/(1 + ρ) | hold |
| 9.3 | ff'' ≥ a²f² from f' ≤ \|D_tJ\|; sinh(a(T − t))/sinh(aT) ≤ e^(−at) since e^(−a(T+t)) ≤ e^(−a(T−t)); K = −4: 0.3240 ≤ 0.4434, Rauch lower bound 0.2874; (v): L = −Q⁻¹P, C = √(1 + B²); dim E^s + dim E^u + 1 = 2 dim M − 1 | holds |
| 10.1–10.4 | signed-time transitivity plus dense periodic points: p ∈ f^(kq+n)(U) ∩ V; Brouwer map: u − h_(z(u))(y^cs) = h_(z(u))(k(u)) − h_(z(u))(y^cs), small; monotone horseshoe: removing N leaves itineraries without the word 1, 0 | hold |
| 11.1–11.3 | φ'^u = −a − 0.2π cos(2πs) = φ^u − L_g u; dimensions dim E^s + q(n − q), q, 1 sum to n + q(n − q); graph transform (C + DL)(A + BL)⁻¹; ratio √(1 + b²e^(−4aT))/√(1 + b²), 0.99504 at b = 0.1 | hold |
| 11.4–11.6 | P(φ^u) = −(1/p) log λ_p < 0 for a saddle orbit; E with spacing 3.9δ: y at 2.196δ > 2.01δ; √5 ε > 2ε; a.c. invariant measure equals μ⁺ by Birkhoff | hold |

## Verified sound

- **Declarations read:** 50 of 50, each against its README statement and its elaborated type. The
  nine "dropped binder" leads are benign: seven definitions that do not use `[MeasurableSpace X]`
  (one also not `[UniformSpace X]`), and `hadamardPerronGraph`, `flowUnstableSubspace`, which do not
  use finite dimensionality. Every `sorry`'d theorem keeps `Nonempty`, `CompactSpace`,
  `SigmaCompactSpace`, `BorelSpace` and the Riemannian binders its statement needs.
- **Targets read:** all sections of Layers 1–11 (45 numbered sections), with every Check
  recomputed or tested: 189 Checks, none false, none vacuous; every section has at least three.
- **Locators verified against the cached texts:** 34 line ranges, in ClimenhagaThompson2016 (lines 140–147,
  295–303, 355–375, 448–463, 504–535, 1251–1253, 1489, 1661–1669, 1687–1690, 1717–1724, 1880–1887,
  1908–1910, 1955, 1963–1965), ClimenhagaPesin2016 (1822–1855), BowenRuelle1975 (10–34, 92–108,
  163–165, 190–199, 272–277, 324–325, 346–366, 377–384, 402–413, 421–422, 470–472, 681–683,
  702–704, 718–720, 740–741) and BowenPeriodicPoints1971 (66–83, 96–104, 387–392, 421–426). All
  support the claims as stated.
- **Sibling citations checked at their current versions:** 23 sections and 14 declaration names. ClassicalErgodicTheory at the head
  of its open pull request: Conventions, §§0.3, 1.4, 3.4, 5.2–5.5, 6.2, 6.4, 7.3, 8.1, 8.2, 8.4,
  8.5, with the names `IsExpansive`, `IsTopologicallyMixing`, `IsGibbsMeasure`, `HasSpecification`,
  `HasFlowSpecification`, `HasBowenProperty`, `IsExpansiveFlow`, `HasFlowBowenProperty`,
  `flowInvariantProbabilities`, `toralEndomorphism`; its `HasSpecification` and
  `HasFlowSpecification` bodies were read, and README §2.2's comparison (gaps exactly M, the
  vacuous empty list, the period p + τ never an integer for p = n + ½, ε < ½) holds for them.
  GeometryOfNumbersAndQuadraticArithmetic §4.2; ProbabilisticAndMetricNumberTheory §4.1
  (`birkhoff_pointwise`, `birkhoff_pointwise_ergodic`); ArithmeticDynamics §2.7; GeometricCurrents
  G6; GeneralizedCohomology G4.0b, which is on main (README lines 939 and 1082–1160 there) and owns
  the "smooth graph-chart upgrades on TopK T1.5's existing finite real/complex Grassmannian
  carriers", the carrier being the pinned `TauCeti.finiteGrassmannian`
  (`TauCeti/Topology/Grassmannian/Basic.lean:52`), so the overlap lead "only an open revision
  defines G4.0b" is a false positive and the citation is no dependency; RiemannianGeometry R2
  (`exists_jacobi_initial_data`) and R4.1 (`rauch_norm_ge_of_sectional_le`, a lower bound, used as
  one).
- **Pinned declarations:** every Mathlib and Tau Ceti name of the supplier contracts was found at
  the pins (104 backticked names, each matched to a declaration by its final component; about 65
  opened in their files), and the hypotheses the README attaches were read for
  `AddAction.IsTopologicallyTransitive`, `Dynamics.IsDynNetIn`,
  `Dynamics.coverEntropyEntourage_finite_of_isCompact_invariant`,
  `SmoothPartitionOfUnity.exists_isSubordinate`, `ContMDiff.iff_comp_isImmersion`,
  `DifferentiableOn.dense_compl_image_of_dimH_lt_finrank`, `TauCeti.brouwerFixedPoint_closedBall`,
  `TauCeti.nonempty_contMDiffRiemannianMetric`, `TauCeti.isCompleteVectorField_of_compactSpace`,
  `TauCeti.riemannianVolume`, `TauCeti.isSmoothEmbedding_coe_sphereBundle`,
  `TauCeti.finiteGrassmannian.graphChart`.
- **Ownership against open work** (by object, with `roadmaps grep`): Hadamard–Perron, hyperbolic
  sets, local product structure, weak specification, entropy-expansiveness, SRB and Bowen–Margulis
  measures, the geometric potential, adapted metrics, the connection map and the Sasaki metric have
  no other owner on main or at an open head. ClassicalErgodicTheory places uniformly hyperbolic
  smooth dynamics outside its scope. No declaration of `Suggested.lean` has the fully qualified
  name of a declaration of a readable roadmap (the restated notions live in this roadmap's
  namespace).
- **Declared gap** `connection-map-jacobi-derivative`: precise, minimal (no roadmap or pin has the
  connection map or the derivative of the geodesic flow), and declared with the same slug in
  `design/plan.json` and in the README.
- **Policy:** the pull request changes only the package folder; no pull-request numbers or process
  words in the README or docstrings; `theorem` throughout; no `set_option`, `#eval`, `True`
  placeholder or sorry'd data; every Lean name is in the README and every backticked name of the
  roadmap's own is declared; no padding found by the one-tactic probe.
- **Headlines:** Bowen's criterion for maps and flows, §6.8(a)–(b), the Hadamard–Perron theorem,
  local product structure for maps and flows, Bowen's theorem, the Bowen–Ruelle theorem with its
  invariances, positivity of entropy, Haar measure as Bowen's measure, upper semicontinuity of
  entropy for expansive flows and both SRB statements are stated; the two that are not statable
  (§§8.2–8.3, §9.3) are named in the module docstring with the missing carrier.
- **A supplier statement that a Check here refutes, not consumed.** README §6.6's fifth Check (the
  roof-one suspension of the monotone shift: no isolated points, a dense ℝ-orbit, and no dense
  forward orbit, since the forward orbit of a switch point accumulates only on the orbit of 1^ℤ)
  contradicts ClassicalErgodicTheory §5.5's claim that on a compact metric space without isolated
  points transitivity of the ℝ-action is equivalent to a dense forward orbit. The README does not
  use that claim (lines 9, 28, 92), so nothing changes here.

Source independence: 18 passages compared with 4 sources, none shared beyond formulas and axioms that can be written in one way only; largest share BowenRuelle1975, 48 of 148 locators; contents compared with BowenRuelle1975 (Sections 1–5 and Appendix): independent. Its Section 2 (symbolic dynamics) is not used; Layers 1–9 have no counterpart; Layer 10.3 reaches its Section 3 by another route; the order inside Layer 11 is forced by the `*Needs:*` lines (11.3 needs 11.2, 11.4 needs 11.3, 11.5 needs 11.4, 11.6 needs 11.5). The seven uncertified texts were not compared.

## Not verifiable

- Walters1982, Bowen1975, FH2019, KatokHasselblatt1995, Newhouse1989, BowenWalters1972 and
  HirschPalisPughShub1970 are uncertified: their locators were not read against the text.
- Elaboration: no Lean was run in this pass. The types compared are those of the job's
  `signatures.md`; S02's repair moves one definition and needs one `#check`.
- That `hd` is satisfiable for a merely continuous Riemannian metric (the truncated distance is a
  metric inducing the manifold topology) is the README's claim (Conventions); if it failed the
  theorems would be vacuous, not false. Not checked against a pinned statement.
- ClassicalErgodicTheory was read at the head of its open pull request and may change before it
  merges.

## Source issues

- **Misprint** in ClimenhagaThompson2016 at Section 2.5, the sentence after (2.12), printed page 8: the source says the two-sided set is the intersection over t of the time-t image of the order-2t Bowen ball centred at x; it should be centred at the time −t image of x; affects nothing.
- **Misprint** in ClimenhagaPesin2016 at Section 11.1 and Theorem 11.1, printed page 40: the source says the maps are given for n ≤ 0 while the family of graphs and clause (i) run over all integers; it should give the maps for every integer; affects a stated result.
- **Misprint** in ClimenhagaPesin2016 at Theorem 11.1, printed page 40: the source says the graphs are over all of ℝ^k and clause (i) intersects with an undefined set indexed by n + 1; it should be the ball of radius r₀ and the box; affects nothing.
- **Gap** in ClimenhagaPesin2016 at Theorem 11.1(iii), printed page 40: the source says the clause through inverses of maps not assumed invertible; it should speak of backward sequences of preimages in the box; affects a stated result.
- **Gap** in ClimenhagaPesin2016 at Theorem 11.1, printed page 40: the source says the family is unique without requiring the graphs to pass through the origin; it should require it, since with no expanding factor and identity maps every constant family qualifies; affects a stated result.

## For the human reviewers

- **Scope.** The flow axioms (F2), (F3) of README §6.5 and §§6.6–6.8(b) derived from them are in no cited refereed source in this abstract form; README line 439 says they are the roadmap's own analogue.
- **Scope.** ClassicalErgodicTheory, supplier of Layers 1–6 and 10, is an open pull request of another author and is absent from `merge-order/ORDER.txt`; the dependency check reports 0 problems.
- **Declared gap.** `design/plan.json` still declares `gap:sphere-bundle-embedding` (TangentialBordism §2.3), which the README no longer uses (`ContMDiff.iff_comp_isImmersion` supplies it); earlier repairs could not edit the plan. The intake would announce an unneeded gap.
- **Not tested.** Seven uncertified texts (KatokHasselblatt1995 17 mentions, Bowen1975 4, the others 2–3 each) were cited by locator only; wording and arrangement were not compared with them.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "dd92fd45bd1a319b5d501ba6f698fb5cc34b6084", "job": "RT-HyperbolicDynamicsAndThermodynamicFormalism~2b", "model": "fable", "worker": "chris-x81"} -->

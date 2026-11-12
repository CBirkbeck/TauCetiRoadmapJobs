# Review of GeneralizedCohomology (pull request #1807 at afdd14a)

**Verdict:** accepted

This is an incremental re-review of the 63 README lines changed since 3f935aa (48 insertions, 15 deletions). `Suggested.lean` is byte-identical to the version reviewed then. This report raises no new finding, and all four previous findings are repaired.

## Previous findings

- R01 — repaired: `README.md:304`, “requires `Nonempty F` and `∀ b, Nonempty (E b)`”. Lines 2466–2477 transport an arbitrary projection to `Bundle.TotalSpace F E`, derive nonempty fibres from the charts when F is nonempty, and supply the empty chart when F is empty.
- R02 — repaired: `README.md:2814`, “π₀ Map(CP⁰,Y)=H²(CP⁰;ℤ)=0 is a singleton … The component tower is 0←ℤ←id ℤ←id⋯ … Its limit consists of (0,a,a,…)”. The skeletal repetition in dimensions 2m and 2m+1 is also stated.
- R03 — repaired: `README.md:2704–2712`. The repeated defining law is gone. The section now has three cover/truncation Checks (k = 0, 1, −1), three holim Checks (identity, zero and ×2 bonds) and three structured-P0 Checks (S, H𝔽₂, the free ring), each with computed values.
- R04 — repaired: `README.md:491`, “## Layer 1: Reduced, relative and multiplicative theories”, and likewise for Layers 2–5. A table at lines 483–489, headed “Former heading and numbering”, maps each former G-heading to its layer. See the overlap paragraph below for the anchors this drops.

## Verified sound

### Gate, dependency check and elaboration

- **Push gate.** I ran it at this head with `--build`. Every check reports 0, and the targeted build `TauCetiRoadmap.GeneralizedCohomology.Suggested` passes (`build=0`). The CLI run without the PR's folder list reports `outside-folder=26`. Those 26 paths are exactly README.md and Suggested.lean of the 13 sibling folders that the brief names as this pull request's own. `git diff --stat origin/main...HEAD` excluding the fourteen folders is empty. The worker's gate at this head reports every check passing.
- **Dependency check:**

```text
depcheck: 236 roadmaps, 2160 edges, 0 problem(s)
```

  There is no UPWARD or CYCLE line. The changed passages add no `*Needs:*` edge and no supplier: the new citations are Tau Ceti's gap charts, Mathlib's `Bundle.TotalSpace`, and the texts Lurie HA, Schwede and Hatcher.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/GeneralizedCohomology/Suggested.lean` exits 0 with exactly seven `declaration uses 'sorry'` warnings (lines 80, 96, 134, 155, 173, 189, 204) and nothing else.
- **Signatures.** A scratch copy runs `#check @` on all ten declarations (seven theorems, `subsetPair`, `subsetPairInclusion`, `IsConnectedPair`). No binder is lost.
  - `homotopyExcision` keeps `[T2Space X]`, the CW instance, `hAB`, `hC`, `hA`, `hB`.
  - `numerableFiberBundle_hurewicz` keeps `t`, `ρ : PartitionOfUnity ι B` (on all of B) and `hρ`.
  - `homologyComparison` keeps both `IsExtraordinaryEilenbergSteenrod` instances and `hpt`.
  - `rationalHurewicz` keeps `hconn`.

  The elaborated types match the README statements, as at 3f935aa.
- **One-tactic probe.** The same copy replaces each `sorry` with `first | rfl | infer_instance | assumption | trivial | (simp; done) | exact?`. All seven fail: six with “`exact?` could not close the goal”, and `stableStem_isOfFinOrder` with a heartbeat timeout. No padding.

### R01: the pinned supplier and the new G3.5 branch

The supplier is `PartitionOfUnity.gapTrivialization`, and its hypotheses match the README's statement of them:

- `TauCeti/Topology/FiberBundle/GapTrivialization.lean:34` carries `[Nonempty F] [∀ b, Nonempty (E b)]`. The definition is at `:73`, `gapTrivialization_baseSet` at `:78`, `subset_iUnion_gapTrivialization_baseSet` at `:118` and `locallyFinite_gapTrivialization_baseSet` at `:125`.
- The instances are really used: `TauCeti/Topology/FiberBundle/Trivialization.lean:73` and `:78` take `Classical.choice` of both to make `Trivialization.iUnion` total.
- The README contract at line 304 states exactly these instances, the topology on `Bundle.TotalSpace F E` (`Mathlib/Data/Bundle.lean:57`), and subordination to the charts' base sets.

Checks of the new route:

- **Transport.** The bijection (b,z)↦z commutes with the projections because z ∈ E_b means p(z)=b. Mathlib transports charts along a homeomorphism with `Trivialization.compHomeomorph` (`Mathlib/Topology/FiberBundle/Trivialization.lean:613`).
- **Nonempty fibres.** Every b lies in a chart base set because Σρ_i(b)=1 forces some ρ_i(b)>0 and tsupport ρ_i ⊆ baseSet_i. Then e.symm(b,v) lies over b by `Trivialization.proj_symm_apply` (`:463`).
- **Empty fibre.** For F=∅, any z would give e(z) ∈ B×∅, so Z=∅. Each chart is then the unique map between the empty spaces p⁻¹(V_n) and V_n×∅.
- **Scope bullet.** Line 74 now says that G3.5 supplies the empty-fibre case. This agrees with `numerableFiberBundle_hurewicz`, which allows empty F.

### New source locators, checked against the cached texts

| Locator in the change | Text inspected | Result |
| --- | --- | --- |
| Lurie, *Higher Algebra*, Props 7.1.3.15 and 7.1.3.18, pp. 1218–1219 (line 2624) | LurieHA line 46729 (p. 1218): truncation τ≤n, n≥0, of a connective E_k-algebra over a connective E_(k+1)-ring is an E_k-algebra with the same underlying module. Line 46757 (p. 1219): discrete E_k-algebras for k≥2 are commutative π₀R-algebras. | Supports “structured truncation and discrete algebras” for connective commutative rings, as G3.8 restricts. |
| Schwede, *Symmetric spectra*, Ch. II, Thms 8.1 and 8.3, pp. 295–297 (Check at 2706) | SchwedeSymSpec line 11064 (Chapter II); line 15660 (Thm 8.1, p. 295): ⟨n⟩ is a right adjoint, (n−1)-connected cover. Line 15745 (Thm 8.3, pp. 296–297): P_n is a left adjoint, (n+1)-coconnected. | τ_(≥k) = ⟨k⟩ and τ_(<k) = P_(k−1) match the Checks. |
| Hatcher, *Algebraic Topology*, §3.F, pp. 312–313 (Check at 2709) | HatcherAT line 13584 (p. 312, telescope); lines 13660–13667 (p. 313): δ(g)_i = g_i − α_(i+1)(g_(i+1)), with lim¹ its cokernel. | The sign convention is the one the ×2 Check uses. |
| Hatcher, Corollary 4J.4, p. 474 (Check at 2710) | HatcherAT line 20409 (p. 474): π_(n+1)(Sⁿ)=ℤ/2 for n≥3. | Supports π₁S=ℤ/2. |
| Hatcher, Example 0.6, pp. 6–7; Theorem 3.19, p. 220 (Check at 2814) | HatcherAT line 453 (pp. 6–7): CPⁿ has one cell in each even dimension ≤2n. Line 9541 (p. 220): H*(CPⁿ;ℤ)=ℤ[α]/(α^(n+1)), |α|=2. | Supports the stages and the bijective restrictions for m≥1. |

All three works are listed under References: HA at line 5004, HatcherAT, and Schwede.

**Seeded sample.** None of the fifteen sampled sections falls in the changed passages; only the five layer headings above them changed. The previous report verified G1.1, G1.3, G1.5, G2.9, G2.10, G5.0 and G5.4 at their locators. I spot-checked three sampled sections outside the diff; all agree, and none of these checks is a finding:

- G3.1: HatcherAT line 19285 (Theorem 4E.1, p. 448) and line 19338 (Theorem 4E.2, p. 449); CohenBMH line 10035 (Theorem 10.3, p. 282).
- G3.2: CohenBMH line 10334 (Theorem 10.16, p. 290, for finite CW pairs, as the README says).
- G4.3: CohenBMH line 11933 (Theorem 10.40, p. 330, connective E and a connected base); HatcherAT line 19035 (Corollary 4D.9, p. 441).

**Citations and Lean names.** `roadmaps resolve` on the head README finds no unresolved cross-roadmap citation or Lean name. I opened the Lean names new in the change at the pins: `Bundle.TotalSpace` and the four gap-chart declarations above. The gap declarations are also consumed by TopologicalKTheory (a sibling folder, for vector bundles). Both roadmaps cite Tau Ceti, so there is no second owner. The structured-P0 construction occurs only in this roadmap.

### Overlaps

- **Conflicting heads.** #1187, #1808 and #1854 conflict with this head in shared folders. The description fixes the order “`GeneralizedCohomology`: this pull request → #1808 → #1854 → #1187 (pin bump)”, so these are not unannounced conflicts.
- **Ids this README cites.** With the PR context, no cited id is dropped and none is defined only by an open revision. The unqualified run reads main's README and reports SpinGeometry `#g1-negative-metric-…` and BordismFormalGroups `#f65-…`. Neither anchor occurs at this head; its only anchor links are the two GeometricTopology `#113-…` links at lines 3515 and 4770.
- **Ids this pull request drops.** The overlap check still lists the three former layer anchors:
  - `#g2-a-concrete-spectral-model-and-represented-theories`: DGFloer main 743, and #1212.
  - `#g4-generalized-lerayhirsch-thom-and-euler-theory`: DGFloer main 834; RiemannianGeometry main 778 and 1214; #1187; #1506.
  - `#g5-finite-duality-thom-spectra-and-rational-hurewicz`: SpinGeometry main 181, and #1674.

  The overlap check never accepts a mapping for a heading anchor (its `mapped` returns False for anchors). The one way to keep these fragments under the `## Layer k:` form is `<a id=…>`, and the gate's process-residue rule refuses that. The gate's layer-id rule asks for `Layer N: title`. The README gives the old → new numbering in the form the brief prescribes: a table whose header names the former numbering, one row per layer. Every citing passage names its target by a G-subsection id that this head keeps: G2.10 (line 1290), G4.0b (line 2832) and G5.5 (line 3940). By the brief's rule this is not a finding. The fragments of those five links on main will open the README at its top until their roadmaps relink.
- **Mapping-table links.** The links resolve: GitHub's slug of each new heading equals the table's fragment. For example, “Layer 4: Generalized Leray–Hirsch, Thom and Euler theory” slugs to `layer-4-generalized-lerayhirsch-thom-and-euler-theory`, and the five headings are at lines 491, 745, 2265, 2827 and 3494.

**Remark on untouched text.** G3.8's main text cites Schwede Theorems 8.1 and 8.3 at pp. 295–296, while the new Check cites pp. 295–297. Theorem 8.3's list of properties continues onto p. 297, so both ranges cover it.

### Headline inventory (unchanged since 3f935aa)

- **Stated:** `kanQuillen_modelCategory`, `sSetTopAdj_unit_weakEquivalence`, `homotopyExcision` (with `subsetPair`, `subsetPairInclusion`, `IsConnectedPair`), `numerableFiberBundle_hurewicz`, `homologyComparison`, `stableStem_isOfFinOrder` and `rationalHurewicz`.
- **Named in the module docstring as not statable, with the carrier each lacks:** the stable model and category, and the sequential comparison; Freudenthal; Brown representability; the Milnor sequence; Leray–Hirsch/Thom; Spanier–Whitehead duality; the stable rational Hurewicz isomorphism. The change touches none of them.

### Adversarial computations

The first 18 rows are new. They give computed values for every statement the diff adds or changes. The remaining 101 rows are carried unchanged from the previous report, marked (r60), for statements the diff leaves untouched. The five r60 rows on G3.5's imported chart, G3.8's holim, cover/truncation and P0, and G3.10's skeletal tower are superseded by new rows.

| Statement / convention | Instances tried | Values on the two sides or competing models | Result / change |
| --- | --- | --- | --- |
| Supplier contract `gapTrivialization` (README 304) | F=∅, B={*}; F={*}, E_*={*} | Elaborated variables `[Nonempty F] [∀ b, Nonempty (E b)]`, both used by `Classical.choice`. F=∅: `Nonempty F` fails. F={*}: both hold. | Pass; contract states both hypotheses. |
| G3.5 transport (b,z)↦z | Trivial Z=B×F; double cover z↦z² of S¹ | Trivial: (b,(b,v))↦(b,v)↦(b,(b,v)). Cover: E₁={1,−1}; (1,−1)↦−1↦(p(−1),−1)=(1,−1). proj(b,z)=b=p(z). | Pass; homeomorphism over B. |
| G3.5 nonempty fibres from charts | S¹ two-arc cover, F={0,1}; any b | Σρ_i(b)=1 ⇒ some ρ_i(b)>0 ⇒ b∈baseSet_i; e_i.symm(b,0) has proj b. With ρ only on s⊊B this would fail, but G3.5 and the Lean headline use ρ on all of B. | Pass. |
| G3.5 empty-fibre branch | F=∅: B={*}, ρ=(1); B=ℝ, ρ₁+ρ₂=1 | Z=∅, since e(z)∈B×∅=∅. Charts p⁻¹(V_n)=∅ ≃ V_n×∅=∅. For ℝ: V₁={ρ₁≠ρ₂}, V₂={ρ₁,ρ₂>0}, both charts ∅→∅. | Pass; gap cover unchanged. |
| Check ∅→{*}, F=∅ | ρ=(1) | gap({1})=max(0,1−0)=1; φ₁=1, φ_n=0 for n≠1; W₀=∅, W_n={*} for n≥1; f=Σkφ_k=1; {f<1}=∅⊆W₀; {f<n}={*}⊆W_(n−1) for n≥2. | Pass. |
| Check {*}→{*}, F={*} | ρ=(1) | Same φ, W, f; the chart {*}→{*}×{*} is bijective with inverse (*,*)↦*; instances exist. | Pass; exercises the supplier branch. |
| G3.8 cover/truncation, k=0 | E=Σ⁻¹Hℤ∨Hℤ∨ΣHℤ | π_(−1,0,1): E (ℤ,ℤ,ℤ), τ≥0 (0,ℤ,ℤ), τ<0 (ℤ,0,0). Each degree is short exact: 0→ℤ→ℤ; ℤ→ℤ→0; ℤ→ℤ→0. [S,τ≥0E]=ℤ=[S,E]. | Pass; directions as stated. |
| G3.8, k=1 | Same E | τ≥1 (0,0,ℤ), τ<1 (ℤ,ℤ,0); the cutoff “<0” would give (ℤ,0,0). | Pass. |
| G3.8, k=−1 | Same E | τ≥−1=E (ℤ,ℤ,ℤ), τ<−1=0; a strict “>−1” would give (0,ℤ,ℤ). | Pass; matches Schwede ⟨k⟩ and P_(k−1). |
| holim, identity tower HA | A=ℤ | δ(a)_r=a_r−a_(r+1): kernel = constants ≅ℤ; cokernel 0 (a₀=0, a_(r+1)=a_r−b_r). π₀=ℤ, π₋₁=0; ∏HA would give π₀=∏ℤ. | Pass. |
| holim, zero tower | A=ℤ | δ=id: kernel 0, cokernel 0, so holim≃0 while terms equal those of the identity tower. | Pass. |
| holim, ×2 tower Hℤ | b=(1,0,1,0,…) | lim=∩2^rℤ=0. Φ(b)=Σ2^r b_r∈ℤ₂ kills im δ (Φ(δa)=a₀∈ℤ) and its kernel is im δ (a_r=Σ_(s≥r)2^(s−r)b_s are integers). Φ(1,0,1,…)=Σ4^j=−1/3∉ℤ. π₋₁=ℤ₂/ℤ≠0; the levelwise inverse limit is 0. | Pass. |
| P0 S | Sphere ring | π₀S=ℤ, π₁S=ℤ/2; P0S=Hℤ: π₀ identity 1↦1, π₁ ℤ/2→0. The identity model keeps ℤ/2; the zero model sends 1↦0. | Pass. |
| P0 H𝔽₂ | H𝔽₂ | π₀=𝔽₂, π_(n≠0)=0, unit 1↦1; an “all-ℤ” model gives π₀=ℤ. | Pass. |
| P0 of the free ring | R=Sym(K₀), K₀≃S | π₀R=⊕H₀(BΣ_n)=ℤ[t], t^a t^b=t^(a+b); Map_CAlg(R,Hℤ)≃Ω^∞Hℤ≃ℤ discrete; ring maps ℤ[t]→ℤ are t↦a. | Pass; agrees with G3.8's mapping theorem. |
| G3.8 Lurie citation | R=S, k=∞, n=0 | 7.1.3.15(3): τ≤0 of a connective E∞-ring is E∞ with the same underlying spectrum; 7.1.3.18: discrete E∞ ↔ commutative π₀R-algebras. | Pass; connectivity hypothesis kept. |
| G3.10 CP∞ Check | CP^m, m=0,1,2,…; K(ℤ,2) | H²: 0, ℤ, ℤ, …; restriction ℤ→0, then id; lim={(0,a,a,…)}≅ℤ; H¹=0 ⇒ lim¹=0; skeleta X^(2m)=X^(2m+1)=CP^m. [CP∞,K(ℤ,2)]=ℤ. | Pass; R02 repaired. |
| Layer mapping table | Five rows | Slugs of the five headings equal the table fragments; the cited G-ids G2.10, G4.0b and G5.5 exist at lines 1290, 2832, 3940. | Pass; anchor fragments under Overlaps. |
| G1.1 reduced theory and empty wedge | Hℤ, empty family; two S¹ summands | H̃¹(*) = 0 = empty product; H̃¹(S¹∨S¹) = ℤ² = ℤ×ℤ. | Pass; a direct-sum cohomology axiom would fail for infinite families. (r60) |
| G1.1 arbitrary wedge and homology | Countably many S¹ | H̃¹ = ∏ℕℤ, containing (1,1,…); H̃₁ = ⊕ℕℤ, which excludes that vector. | Pass; sum/product are distinguished. (r60) |
| G1.1 native axioms and theory morphisms | Identity Hℤ; zero theory | Boundary square is δ = δ; all four extraordinary axioms hold with groups 0 in the zero theory. No dimension axiom is required. | Pass; no vacuous coefficient nonzero assumption. (r60) |
| G1.2 reduced/unreduced and pairs | ∅, *, S⁰; (D¹,S⁰) | 0 = H̃*(∅₊); H⁰(*) = ℤ⊕0; H⁰(S⁰) = ℤ² = ℤ⊕ℤ; H¹(D¹,S⁰) = ℤ = H̃¹(S¹). | Pass. (r60) |
| G1.3 mapping cones | f = id S¹; S¹ → * | C_id is contractible, reduced groups 0; C_(S¹→*) = S², H̃² = ℤ. | Pass; the cone is determined by the actual map. (r60) |
| G1.3 ordered MV | Two arcs covering S¹; cover (X,∅) | (a,b) ↦ (a−b,a−b), cokernel ℤ = H¹(S¹); empty-overlap connecting map 0. | Pass. (r60) |
| G1.3 cover swap | Generator represented by (1,0) modulo diagonal | Swapping the ordered restriction difference negates the connecting class: +1 ↦ −1. | Pass with the stated normalization. (r60) |
| G1.4 external product and twist | S¹∧S¹; S²∧S² | Generator×generator = sphere generator; twist degrees −1 = (−1)¹ and +1 = (−1)⁴. | Pass. (r60) |
| G1.4 suspension and unit | Degree-one a and suspension of 1; coefficient 1, zero ring | a×σ1 = −σ(a×1); 1·a = a; over the zero ring both sides are 0. | Pass. (r60) |
| G1.5 unique smash lift | X=Y=S¹ | H̃²(T²)=ℤ, H̃²(S¹∨S¹)=0; collapse pullback ℤ→ℤ is degree +1. | Pass; uniqueness also uses splitting in the preceding degree. (r60) |
| G1.5 zero-dimensional/disconnected input | X=S⁰; Y=S¹ | H̃¹(X×Y)=ℤ²; wedge restriction projects to one ℤ; its kernel is the other ℤ=H̃¹(X∧Y). | Pass. (r60) |
| G1.5 compactification | U=V=ℝ; U=∅ | (ℝ²)⁺ = S² = S¹∧S¹; ∅⁺ is a point and its smash is a point. A disjoint added point leaves ℝ² noncompact. | Pass. (r60) |
| G1.6 boundary signs | (D¹,S⁰), a=1; (S¹×D¹,S¹×S⁰), a=x | δ(1·e)=δe; δ(x×e)=−x×δe, while δe·x=−x·δe. | Pass in both left and right action identities. (r60) |
| G1.7 sphere shift | Hℤ, n=0,1,2; KU on S¹ | H̃^q(Sⁿ)=ℤ if q=n and 0 otherwise; KU^q(S¹)=KU^q(*)⊕KU^(q−1)(*). | Pass, including S⁰. (r60) |
| G1.7 circle multiplication | Augmentation-zero generator ε on S¹ | ε²=0; (a+bε)(c+dε)=ac+(ad+bc)ε in even coefficient degrees. | Pass; no spurious ε² term. (r60) |
| Cone/ordinary suspension convention | Two-term cone on the identity of ℤ | Acyclic cone has differential ±1; changing the cone-pair boundary changes σ to −σ. Moving suspension past degree n contributes (−1)^n, giving signs +,−,+ for n=0,1,2. | Pass with the README's fixed comparison; maps, not only abstract groups, are specified. (r60) |
| G2.1 Kan–Quillen classes | ∂Δ[1]→Δ[1]; Δ[1]→Δ[0] | First map: two components → one, so cofibration but not weak equivalence. Second: contractible → point is weak equivalence; Δ[1] is not Kan. | Pass; not all weak equivalences are fibrations. (r60) |
| G2.1 realization unit headline | Δ[0], Δ[1], simplicial circle | π₀ unit is 1→1; interval higher groups 0→0; circle π₁ map ℤ→ℤ is identity under realization comparison. | Pass; triangle identity gives the proof route once counit is supplied. (r60) |
| G2.2 sphere modules/block actions | Sphere levels 0,1,2 | S₀=S⁰, S₁=S¹, S₂=S²; transposition on S₂ has degree −1. Unit action has degree +1. | Pass; trivial permutation actions would fail. (r60) |
| G2.3 stable equivalences | λ:F₁S¹→S; Hℤ→0 | λ is stable, with true π₀ ℤ→ℤ; Hℤ→0 sends ℤ→0 and is not stable. | Pass; stable equivalence is not raw-colimit isomorphism. (r60) |
| G2.4 shifts/triangles | ΣHℤ; cofiber of 2:Hℤ→Hℤ | π₁ΣHℤ=ℤ=π₀Hℤ, π₀ΣHℤ=0; cofiber has π₀=ℤ/2, π₁=ker2=0. | Pass; homology/cohomology grading and triangle shift agree. (r60) |
| G2.4 derived products and modules | ∏Hℤ; unit sphere algebra | π₀∏Hℤ=∏ℤ, not ⊕ℤ; S-modules are spectra and the action of 1 is identity. | Pass. (r60) |
| G2.5 suspension adjunction | X=S⁰, E=Hℤ and Σ⁻¹Hℤ | [Σ∞S⁰,Hℤ]=ℤ=π₀Hℤ; [S,Σ⁻¹Hℤ]=0. Shifting source once gives π₁Hℤ=0. | Pass. (r60) |
| G2.5 Freudenthal | X=S¹ (k=1); X=S² (k=2) | π₁S¹=ℤ→π₂S²=ℤ is onto; π₂S²=ℤ→π₃S³=ℤ is iso; π₃S²=ℤ→π₄S³=ℤ/2 is onto, not injective. | Pass; endpoint is not overclaimed. (r60) |
| `subsetPair`, `subsetPairInclusion` | s=t={*}; empty s; identity inclusion | Based pair is (*,*), all relative sets singleton; no a:s exists when s=∅; identity sends the relative constant class to itself. | Pass; basepoint stays in s and target is (t′,s′). (r60) |
| `IsConnectedPair` | (D¹,{0}); (S¹,{*}); (two points,one point) | First is m-connected for every m; second is 0-connected but π₁=ℤ prevents 1-connectivity; third fails the path condition already at m=0. | Pass; π₀ coverage is not lost. (r60) |
| `homotopyExcision` | m=n=0; all spaces a point; two discs in S² | Bounds i+1<0 or =0 are false; point maps are singleton bijections. For disc pair C=S¹, m=n=1 and relative degree 2 gives ℤ→ℤ, onto. | Pass; connected intersection excludes the disconnected circle-decomposition trap. (r60) |
| G2.5 sphere stem/indices | n=0,1; complex rank1; quaternionic rank1 | π₀S=ℤ, π₁S=ℤ/2; real degrees of Thom fibres are 2 and 4, so loop corrections are 1 and 3. | Pass; rank jumps are not single suspensions. (r60) |
| G2.6 semistability | F₁S¹, S, Hℤ | Naive/true π₀: ⊕ℕℤ versus ℤ; ℤ versus ℤ; ℤ versus ℤ. Hℤ's other stable degrees are 0. | Pass. (r60) |
| G2.7 HA/represented theories | A=0, ℤ, 𝔽₂; S⁰ | π₀HA=A and π_n=0 for n≠0; H_A⁰(S⁰)=A², reduced value A. A=0 gives the zero spectrum. | Pass; ordinary and reduced values differ. (r60) |
| G2.8 Γ/group completion | Finite sets, π₀=ℕ; zero input | Group completion ℕ→ℤ sends n↦n; zero monoid gives 0. Multiplication of cardinalities sends (2,3)↦6. | Pass; additive completion alone would not specify multiplication. (r60) |
| G2.8 free commutative algebra/localization | Free algebra on S; invert 2 in Hℤ | π₀ is ℤ[t]; π₀ after inversion is ℤ[1/2], with 2·(1/2)=1. | Pass; integral coefficients have not been silently rationalized. (r60) |
| G2.9 classifiers | G=1, ℤ, S¹ | B1≃*, Bℤ≃S¹ with π₁=ℤ, BS¹≃CP∞ with π₂=ℤ and π₁=0. | Pass; treating S¹ as discrete gives the wrong homotopy degree. (r60) |
| G2.9 clutching and gauge | G=S₃, C₂; bundle over S¹; trivial bundle over * | Unframed classes are 3 conjugacy classes for S₃ and 2 for C₂; actual gauge transformations over * number 6 and 2. | Pass; gauge maps, components and conjugacy orbits are distinct. (r60) |
| G2.10 mapping fibres | id S¹; *→S¹; ∅→S¹; X→* | Fibres respectively contractible, ΩS¹ with π₀=ℤ, empty, and X. | Pass; contraction is not asserted over the target. (r60) |
| Hurewicz–Dold headline | Empty fibre; Möbius line; product projection | Empty initial-lift data force empty test source; lift exists uniquely. Product lift (a,t)↦(h(a,t),v(a)) works. Möbius fibre is ℝ despite global twisting. | Pass without compactness or global triviality. (r60) |
| G2.11 enriched/diagram models | Discrete one-object category; walking isomorphism | Inclusion has singleton→singleton mapping equivalences and is essentially surjective, but object counts 1→2. | Pass; Dwyer–Kan equivalence is not objectwise isomorphism. (r60) |
| G2.11 Joyal/core/marked fibrations | N[1]; groupoid BC₂ | Core of N[1] has two points and no nonidentity edge; core of BC₂ has the nonidentity involution. Over a point Cartesian edges are precisely these equivalences. | Pass. (r60) |
| G2.11 Joyal versus Kan weak equivalence | Δ[1]→N(walking isomorphism) | Both realizations contractible, but source has 1→0 Hom empty and target has one inverse arrow. | Pass; not a categorical equivalence. (r60) |
| G2.11 straightening/variance | Identity [1]→[1] | Both fibres are *, and transported map *→* is identity. For opposite variance the base arrow is reversed. | Pass for the stated coCartesian/Cartesian conventions. (r60) |
| G2.11 coherent pushout | Two intervals glued end-to-start | Simplicial pushout has 2 nonidentity edges; its ∞-categorical colimit Δ[2] has the additional composite 0→2. | Pass; ordinary pushout is not used without localization. (r60) |
| G2.11 stability | Spectra; pointed spaces at S⁰ | Σ⁻¹ΣS=S; S⁰→ΩS¹ has 2 source components versus ℤ target components. | Pass; pointed spaces are not declared stable. (r60) |
| G2.11 quotients | D=C; D=0; finite spectra modulo rationally zero ones | Quotients 0 and C; π₀ End(S) after killing torsion is colim(ℤ→2ℤ→3ℤ→⋯)=ℚ. | Pass; integral endomorphisms do not survive unchanged. (r60) |
| G2.11 Ind/idempotents | Zero stable category; even-Euler finite spectra | Ind(0)=0; χ(S)=1 excludes S from the latter C, while χ(S⊕ΣS)=0 and S is a retract. | Pass; compact need not mean originally representable. (r60) |
| G2.11 monoidal/LM/relative adjoints | Unit algebra S; identity base map | LM fibre over S is Mod_S=Sp; extension/restriction along id_R are both identity and unit/counit act as 1. | Pass on unit and variance. (r60) |
| G3.1 Brown and disconnected extension | H̃¹ on S¹; H̃⁰ on S⁰ | [S¹,K(ℤ,1)]=ℤ; [S⁰,ΩK(ℤ,1)]=ℤ, whereas a connected representing space would give a singleton on S⁰. | Pass; loop extension is necessary. (r60) |
| G3.2 representing spectrum/operations | Hℤ; identity operation; ×2 | Degree-zero maps Hℤ→Hℤ act by n↦n or n↦2n on ℤ; ordinary representing levels K(ℤ,n) have π_n=ℤ. | Pass; maps are not fixed by bare group isomorphisms. (r60) |
| G3.3 comparison headline | Identity Hℤ; ×2; infinite disjoint points | Identity induces id on ℤ and ⊕ℤ; ×2 fails the point-isomorphism hypothesis already on ℤ. | Pass, including arbitrary cell sets. (r60) |
| G3.3 opposite target | Cochain boundary on (D¹,S⁰) | Homology arrow H_i(X,A)→H_(i−1)(A) becomes H^(i−1)(A)→H^i(X,A); ℤ²→ℤ is the endpoint difference. | Pass; products replace coproducts in the opposite category. (r60) |
| G3.4 Milnor and tower sign | Constant ℤ tower; ×2 tower | δ(a)_n=a_n−a_(n+1), kernel diagonal ℤ, cokernel0; for ×2, kernel0 and cokernel ℤ₂/ℤ. | Pass; sign agrees with imported tower algebra. (r60) |
| G3.4 factorial telescope | ℤ ←2 ℤ ←3 ℤ ←4 ⋯ | lim=0; lim¹=Ext¹(ℚ,ℤ)≠0; telescope homology colimit is ℚ. | Pass; inverse and direct directions differ. (r60) |
| G3.5 increasing open cover | (−n,n) covering ℝ; equal weights 1/2,1/2 | Telescope and union both contractible. Gaps of singletons0, gap of pair1/2, hence φ₂=2·1/2=1. | Pass for the gap weights; no renormalizing denominator needed. (r60) |
| G3.5 exhaustion | Weights supported in sizes1 and3, values1/2 each | f=2; f<3 forces some positive weight at index<3 and hence membership in W₂. | Pass; finite unions have the required cover property. (r60) |
| G3.6 phantoms | S_ℚ→ΣHℤ; finite P; HF_p coefficients | Stage groups [S,ΣHℤ]=0, but maps from telescope include Ext¹(ℚ,ℤ)≠0; finite-source phantom group0; finite tower groups give lim¹0. | Pass; no uniqueness inferred from finite stages alone. (r60) |
| G3.7 compactness | P=S; P=∨ℕS | [S,∨Hℤ]=⊕ℤ; [∨S,∨Hℤ]=∏_n⊕_mℤ contains the diagonal basis family, absent from ⊕_m∏_nℤ. | Pass; infinite wedge is not compact. (r60) |
| G3.7 finite-source formula | X=S⁰, E=Hℤ, degree0/1 | colim π_k E_k=ℤ; colim π_k E_(k+1)=0; these equal π₀E and π₋₁E. | Pass; minus sign in cohomological degree. (r60) |
| G3.8 smash connectivity | Σ^aS, Σ^bS; a=−1,b=2 | Smash is Σ^(a+b)S=ΣS, with first nonzero group π₁=ℤ on both sides. | Pass for integer, not just nonnegative, cutoffs. (r60) |
| G3.8 unbounded convergence | E=∨_(j∈ℤ)Σ^jHℤ | Each fixed π_n=ℤ eventually stabilizes in either cutoff tower; lim¹ in that fixed degree is0, so both comparison maps give ℤ→ℤ. | Pass; no bounded-below assumption needed. (r60) |
| G3.9 localization/completion | Hℚ; Hℤ; H𝔽₂; p=2,3 | Hℚ completed at p is0; Hℤ gives Hℤ_p; H𝔽₂ is unchanged at2 and becomes0 at3. | Pass; not ordinary tensor completion for arbitrary spectra. (r60) |
| G3.10 nonabelian lim¹ | Constant S₃ tower, identity bonds | Choose g_(n+1)=g_n h_n recursively to move h to identity; orbit set has one element, although S₃ has six elements and is nonabelian. | Pass; additive cokernel is used only after abelian comparison. (r60) |
| G4.0 quaternionic carrier/charts | HP⁰, HP¹; v=(v₀,0) | HP⁰=*; HP¹ has affine ℍ plus one point; (v₀,0)=(1,0)·v₀ for unit v₀. | Pass; right-action convention matters. (r60) |
| G4.0 homogeneous ratio | v_i q and v_k q | (v_i q)(v_k q)⁻¹=v_i v_k⁻¹; reversing order would conjugate the ratio and fail invariance for noncommuting i,j. | Pass. (r60) |
| G4.0 dimensions | Sp0,Sp1,Sp2; Grℍ(0,2),Grℍ(1,2) | N(2N+1)=0,3,10; 4r(N−r)=0,4; 1-frame dimension7=S⁷. | Pass at rank0 and1. (r60) |
| G4.0 quaternionic orientation | Rank1 and2 | Complex-induced basis (1,i,j,−k) has determinant−1 against direct basis; for two blocks determinant(+1)=(−1)². | Pass; carried into G4.5/G5.0. (r60) |
| G4.0 stereographic derivative | w=0, tangent h | Derivative of (4w+(‖w‖²−4)v)/(‖w‖²+4) is h, not 2h; outward-first orientation at −v gives degree−1 before the specified reflection. | Pass at the pin. (r60) |
| G4.1 relative Leray–Hirsch | Point/empty base; fibre (D¹,S⁰); X×CP¹ | Groups A shifted by1, 0, and H*(X)⊕H*−2(X), respectively; map sends (a,b) to a+bx. | Pass. (r60) |
| G4.1 need for global basis classes | Hopf S¹→S³→S² | Fibre H¹=ℤ, but H¹(S³)=0, so no extending degree-one basis class; the invalid predicted H¹=ℤ is excluded. | Pass; numerability alone is insufficient. (r60) |
| G4.2 Thom space | Rank0 over B; rank1 over*; empty B | Th0=B₊, Thℝ=S¹, Th over∅=*; reduced cohomology gives H*(B), shiftedℤ,0. | Pass. (r60) |
| G4.3 orientations/Thom iso | Trivial line; Möbius line; zero coefficients | Trivial real line has integral generators±1; Möbius has no coherent integral generator but has unique mod2 class; zero theory has 0→0. | Pass; fibrewise normalization is required. (r60) |
| G4.4 Euler/relative square | Trivial positive-rank bundle; TS²; rank0 | Euler0; Euler pairs toχ(S²)=2; rank0 Euler1. Relation u²=e·u gives0 for trivial line, not u²=u. | Pass; positive-rank condition on a nonvanishing section matters. (r60) |
| G4.5 complex orientation | Tautological γ and γ* on CP¹ | ⟨c₁γ,[CP¹]⟩=−1, ⟨c₁γ*,[CP¹]⟩=+1; x=e(γ*) therefore maps to +h. | Pass; same sign in MU→Hℤ. (r60) |
| G4.5 quaternionic characteristic classes | Rank1 restricted to circle torus | Roots x,−x give c₂=−x²; p₁=−2c₂=2x²; direct-real Euler=−c₂=x². | Pass with (1,i,j,k) orientation. (r60) |
| G4.5 projective relation | CP⁰,CP¹; HP¹; real mod2 case | ℤ[x]/(x)=ℤ; ℤ[x]/(x²), |x|2; ℤ[a]/(a²), |a|4; H*(RP¹;𝔽₂)=𝔽₂[t]/(t²). | Pass with the respective orientation hypotheses. (r60) |
| G4.6 low-rank GL | k=0,1,2,3,4 | π₁=0,0,ℤ,ℤ/2,ℤ/2; π₃=0,0,0,ℤ,ℤ²; π₀ trivial only at k0. | Pass. (r60) |
| G4.6 conjugation and stabilization | Reflection in GL2; Spin3→Spin4→Spin5 | Conjugation sends n↦−n; π₃ maps n↦(n,n)↦2n. Reflection at rank4 swaps (a,b). | Pass; semidirect product is not a direct product. (r60) |
| G4.6 disconnected source | S⁰→GL1; clutching over S¹ | Map classes form (ℤ/2)² of size4; bundle classes number2. | Pass; the two constructions are distinguished. (r60) |
| G5.0 Spin ranks/classifier | Native Spin0; Spin1; Spin2; stable BSpin | Native Spin0=1, Spin1=C₂, Spin2=S¹; stable π1,2,3=0, π4=ℤ. | Pass; geometric rank0 μ₂ is a separate branch. (r60) |
| G5.0 sum orientation coherence | k=0,1,2,3 | ε_k=1,1,−1,−1; ε_k ε_(k+1)(−1)^k=1 in all four cases. | Pass; interleaving sign is retained. (r60) |
| G5.0 inverse and obstruction | Oriented Spin ξ; nonoriented Möbius class | w₂(−ξ)=0+0=0 for Spin; formal inverse formula includes w₁² otherwise and cannot be omitted universally. | Pass in the oriented domain. (r60) |
| G5.0 coefficient/Hopf normalization | S⁴ and degrees1–8 | BSpin groups0,0,0,ℤ,0,0,0,ℤ; Spin4 ℤ²→Spin5 ℤ is addition; Hopf c₂ pairing+1 on the specified sphere class. | Pass; all-CW statement retains mapping-space lim¹. (r60) |
| G5.1 finite duality | S, ΣS, S∨ΣS; E=Σ⁻²Hℤ | Duals S,Σ⁻¹S,S∨Σ⁻¹S; D(ΣS)∧E=Σ⁻³Hℤ=F(ΣS,E). | Pass without connective E. (r60) |
| G5.2 Atiyah duality | *, S¹⊂ℝ²; empty manifold | Duals S, S∨S⁻¹,0; Σ⁻²Th(ν_S¹)=Σ⁻²(S²∨S¹)=S∨S⁻¹. | Pass; framing is not assumed generally. (r60) |
| G5.3 Thom diagrams | Trivial rank-i bundles over*; empty bases | hocolim Σ⁻ⁱΣ∞Sⁱ=S with π₀ℤ; empty bases yield0. | Pass; coherent stabilization determines maps. (r60) |
| G5.3 coefficient hypotheses | MO/ℤ, MO/𝔽₂, MSO/ℤ | Degree-zero pairs: ℤ/2 versusℤ (excluded); 𝔽₂=𝔽₂; ℤ=ℤ. | Prior R02 repaired. (r60) |
| G5.4 canonical maps | S→MO→H𝔽₂; MU→Hℤ | π₀ maps ℤ→ℤ/2→𝔽₂ reduce mod2; MU→Hℤ acts ℤ→ℤ by identity and π₂ℤ→0. | Pass. (r60) |
| G5.4 real/complex/quaternionic indices | KU degree2; KO degree4,8; quaternionic line | β invertible in KU; a²=4b in KO; [ℍ] forgets to real rank4 and complex rank2. | Pass; realification and complexification are not identity on ranks. (r60) |
| G5.5 Clifford generators | Displayed 2×2 e₁,e₂ | e₁²=e₂²=I; e₁e₂=diag(−i,i)=−e₂e₁; grading conjugates each to its negative. | Pass. (r60) |
| G5.5 mixed neutral module | Λ(ℝ)=ℝ⊕ℝ | (ε+ι)²=+I, (ε−ι)²=−I, anticommutator0; algebra dimension4=dim M₂ℝ. | Pass; wrong sign generator excluded. (r60) |
| G5.5 complexification/real CFC | Orthogonal v,w; z=v+iw; A=ℝ | Hilbert norm√2 versus Taylor norm1; for v+iv both√2. A-module operators reduce to real Hilbert bounded/compact operators. | Pass; √2 bound is attained. (r60) |
| G5.5 operator level versus classifier | Level0; real levels1 and4 | Level0 has2 points; ample degree0 classifier has π₀ℤ; π₀K_op,1=KOⁱ(*), i=1, is0, while π₀K_op,4=ℤ. | Pass; reversed degree would give ℤ/2 at1. (r60) |
| G5.5 sign coherence | p=q=r=1; general parity | 1+2=2+1≡1; both expressions reduce to pq+pr+qr. | Pass. (r60) |
| G5.5 configuration | 2₊, dimensions(1,1); equal nonorthogonal lines | Segal map(1,1)→(1,1); orthogonal fold dimension2, wrong equal-line fold dimension1. | Prior R05 repaired. (r60) |
| G5.5 Hermite embedding | h₀,h₁,h₂ | Norm squares1,1,1; parities even,odd,even; ⟨h₀,h₂⟩=0 from 2∫x²e⁻ˣ²−∫e⁻ˣ²=0. | Prior R05 repaired; z→h₂ has correct parity. (r60) |
| G5.5 MU orientation | π₀,π₂; γ* over CP¹ | Maps id_ℤ, zero, and pairing+1 respectively; opposite orientation gives−1. | Prior R05 repaired. (r60) |
| Stable-stem headline G5.6 | n=0,k=3; n=1,k=4; excluded Hopf degree | π₄S³=ℤ/2 and π₆S⁴=ℤ/2 are torsion; π₃S² containsℤ but k≥n+3 excludes it. | Pass; no positive stable free summand. (r60) |
| Rational Hurewicz headline G5.6 | k=0; k=1,X=S¹; k=2,X=S² | Bounds0 give no claim; degree1 mapℤ→ℚ spansℚ; degree2 mapℤ→ℚ has kernel0. At degree3 only surjectivity to H₃S²=0 is asserted. | Pass; Hopf π₃S²=ℤ does not violate an unasserted injection. (r60) |
| G5.6 nonabelian degree1 | X=BS₃ and BC₂ | H₁(−;ℚ)=0 in both cases; image span0=whole target; no assertion that π₁ itself is abelian or injects. | Pass. (r60) |
| G5.6 stable rational spectral result | E=S, Σ⁻¹Hℤ, H𝔽_p | Rational π₀S=ℚ=H₀(S;ℚ); shifted Hℤ hasℚ in degree−1 on both sides; H𝔽_p rationalizes to0. | Pass; full spectral statement remains in README. (r60) |
| G5.7 Borel/coherent families | Trivial torus; free S¹ action on itself; trivial action on* | Bases *, contractible, CP∞ respectively; integral Borel ring of* isℤ[x], |x|2, notℤ alone. | Pass. (r60) |
| G5.7 support duality | Compact U; U=ℝ,d=1 | Compact-support cochains equal F(R∧U₊,R); onℝ they areΣ⁻¹R, matchingΣ⁻¹P_R(ℝ), since P_R(ℝ)≃R. | Pass; noncompact support is not omitted. (r60) |
| G5.7 sections and extension space | Split triangle; A=0 | Zero connecting map admits constant nullhomotopy and B≃A⊕C; when A=0 the section space is contractible. | Pass; nullhomotopies are data, not a mere equality of classes. (r60) |

## Not verifiable

These sources are settled as uncertified (paywalled) and are cited by their locators. I did not request them again:

- ABSClifford §11
- McDuffSegal §4
- SegalCategories §§1–4
- JoachimKO §§2–4
- QuillenHA Ch. II §3

None of the changed passages relies on them. Every locator added by the change was read in a cached legal text (table above). The computed examples do not certify the proofs of the large constructions; those remain the roadmap's work.

## Source issues

- **Misprint** in LurieHA at Proposition 7.1.3.18, printed p. 1219 (LurieHA line 46757): the source says A ↦ π₀A gives an equivalence from all E_k-algebras over R; it should be from the discrete ones of Definition 7.1.3.17, as its proof uses; affects nothing.
- **Misprint** in SchwedeSymSpec at the paragraph after Theorem 8.3, printed p. 297 (SchwedeSymSpec line 15771): the source says the target Y is (n+1)-connected; it should be (n+1)-coconnected; affects nothing.

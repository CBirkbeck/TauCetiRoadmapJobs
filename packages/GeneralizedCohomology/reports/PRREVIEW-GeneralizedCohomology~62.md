# Review of GeneralizedCohomology (pull request #1807 at 8d98b44)

**Verdict:** accepted

This incremental re-review covers 0 changed lines since afdd14a. `TauCetiRoadmap/GeneralizedCohomology/README.md` and `TauCetiRoadmap/GeneralizedCohomology/Suggested.lean` are byte-identical to the versions the previous report accepted, and so are `lake-manifest.json` and `lean-toolchain`. The four commits since then change only five files, in four sibling folders of this pull request:

- `TauCetiRoadmap/BordismFormalGroups/README.md`
- `TauCetiRoadmap/ClassifyingSpaces/README.md`
- `TauCetiRoadmap/RigidAnalyticGeometry/README.md`
- `TauCetiRoadmap/RigidAnalyticGeometry/Suggested.lean`
- `TauCetiRoadmap/TopologicalKTheory/README.md`

I checked each of them where this README relies on it. This report raises no finding.

## Previous findings

- none: the previous report raised no finding of its own. The four findings it accounted for (R01–R04 of the round before) remain repaired here, because the README is unchanged. Their passages are still in place:
  - the `gapTrivialization` contract at `README.md:304`, “requires `Nonempty F` and …”;
  - the CP⁰ stage of the G3.10 Check at line 2814;
  - the G3.8 Checks at lines 2704–2712;
  - the `## Layer k:` headings at lines 491, 745, 2265, 2827 and 3494, with the former-numbering table at lines 483–489.

## Verified sound

### Gate, dependency check and elaboration

- **Push gate.** The worker's gate at this head reports every check passing (`build=0`). I ran it myself with `--build`. Every check reports 0 and the targeted build passes (`build=0`), except `outside-folder=26`. Those 26 paths are exactly the README.md and Suggested.lean of the 13 sibling folders that the brief names as this pull request's own. `git diff --name-only origin/main...HEAD` lists 28 files in 14 folders, and `git diff --stat` that excludes the 14 folders is empty.
- **Dependency check:**

```text
depcheck: 236 roadmaps, 2160 edges, 0 problem(s)
```

  There is no UPWARD or CYCLE line.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/GeneralizedCohomology/Suggested.lean` exits 0. It prints exactly seven `declaration uses 'sorry'` warnings (lines 80, 96, 134, 155, 173, 189, 204) and nothing else.
- **Signatures.** A scratch copy runs `#check @` on all ten declarations: seven theorems, plus `subsetPair`, `subsetPairInclusion` and `IsConnectedPair`. The elaborated types are identical to those of the previous round, and no binder is lost:
  - `homotopyExcision` keeps `[T2Space X]`, the CW instance, `hAB`, `hC`, `hA` and `hB`;
  - `numerableFiberBundle_hurewicz` keeps `t`, `ρ` and `hρ`;
  - `homologyComparison` keeps both `IsExtraordinaryEilenbergSteenrod` instances and `hpt`;
  - `rationalHurewicz` keeps `hconn`.

  The entries `C`, `and` and `of` in the worker's signature list are not declarations. They are docstring words that the listing parsed as declarations: “instance `C := Dᵒᵖ`” at line 29, “structure and” at line 91 and “theorem of CharacteristicClasses” at line 92.
- **One-tactic probe.** A scratch copy replaces each `sorry` with `first | rfl | infer_instance | assumption | trivial | (simp; done) | exact?`. All seven fail: six with “`exact?` could not close the goal”, and `stableStem_isOfFinOrder` with a heartbeat timeout. Nothing is padding.
- **Library near-matches.** No candidate in the near-match list states a headline. The lists for `kanQuillen_modelCategory` and `sSetTopAdj_unit_weakEquivalence` contain only Mathlib's `cofibrations_eq`, `fibrations_eq` and `sSetTopAdj` API, which the statements consume.

### The change outside the folder, against what this README relies on

TopologicalKTheory is the only changed supplier this README cites by content: its supplier contract is at README lines 394–402, and its *Needs:* lines are at 3113, 3474, 3492, 3652, 3932, 4907 and 4926.

- **What changed.** The TopologicalKTheory change adds:
  - a Tau Ceti sphere-group contract (TopologicalKTheory README lines 128–144);
  - the fibre argument of T1.5a (lines 450–471), with an m=0 caveat in its r=1 Check (line 501);
  - Tau Ceti's sphere connectivity as T7.1's stable-range input (lines 1578–1583);
  - four Checks of T2.5's signed unit-derivative coefficient;
  - spacing.
- **The cited ids are all kept:** T1 (line 287), T1.5 (item 5, line 369), T1.5a (443), T1.6a–T1.6d (538, 708, 800, 850), T7 (1471), T7.0 (1473), and T7.1's Bott equivalence and coefficient ring (lines 1849–1882).
- **What this README consumes is unchanged in meaning:** first Stiefel groups, the BO/BSO classifiers, the shear inverse, the eightfold Bott equivalence ℤ×BO → Ω⁸(ℤ×BO) and the KO coefficient ring. The change only says where T1.5a's and T7.1's sphere inputs come from.
- **The newly cited Tau Ceti declarations exist at the pin:**
  - `TauCeti.subsingleton_homotopyGroup_sphere_of_lt` (`TauCeti/AlgebraicTopology/Sphere/HomotopyGroup.lean:66`; finrank n+1, `Nat.card N < n`);
  - `TauCeti.homotopyGroupSphereAddEquiv` (`:110`; an orthonormal basis indexed by `Fin (n+3)` gives π_(n+2)(S^(n+2)) ≅ ℤ, which is TopologicalKTheory's “m ≥ 2, basis indexed by `Fin (m+1)`”).
- **BordismFormalGroups** changes only F1.5's p-typical isomorphism text and the v_n-map lemma locators. Its handover list at lines 96–105 still sends F6.5's enriched, quasicategorical and monoidal foundations to G2.11, which agrees with this README at lines 1361, 2014, 2147 and 4930.
- **ClassifyingSpaces and RigidAnalyticGeometry** do not cite this roadmap (0 occurrences of “GeneralizedCohomology”), and this README cites neither of them.

No passage of this README is made wrong by the change.

### Seeded sample

None of the fifteen sampled sections falls in a changed passage. I reread nine of them at their locators in the cached texts. Hatcher's PDF pages run nine ahead of the printed ones, and Schwede's run one ahead.

| Section | Text inspected | Result |
| --- | --- | --- |
| G1.2 | HatcherAT line 7027 (printed p. 161): unreduced h_n(X) as the reduced theory of X₊, splitting off h_n(point). Line 8784 (p. 202): the same for cohomology. | Supports the stated comparisons. |
| G1.7 | HatcherAT line 19297 (p. 448): reduced cohomology theories carry natural suspension isomorphisms hⁿ(X) ≅ hⁿ⁺¹(ΣX). | Supports r-fold suspension for Ẽⁿ(S^r). |
| G2.6 | HSS line 2904 (Definition 5.6.1, p. 61); line 2907 (F₁S¹ not semistable, Ω-spectra semistable); line 2915 (Proposition 5.6.2: Hom(F₁S¹,KX) and R∞K criteria). | Matches. |
| G3.4 | HatcherAT line 13729 (Theorem 3F.8, p. 314): the lim¹ sequence for a CW complex that is an increasing union of subcomplexes, for any cohomology theory. | Matches “for CW unions”. |
| G3.7 | SchwedeSymSpec line 13539 (Lemma 5.6, p. 257): homological functors on sequential homotopy colimits. Line 15467 (Theorem 7.4, p. 292): finite spectra. | Matches. |
| G3.9 | SchwedeSymSpec line 15958 (Theorem 9.2, p. 300; R a subring of ℚ, which S⁻¹ℤ is); line 16117 (§9.3, p. 303); line 16150 (Theorem 9.9, p. 304). | Matches. |
| G4.1 | HatcherAT line 18645 (Theorem 4D.1, p. 432); line 19006 (Theorem 4D.8, p. 441: relative Leray–Hirsch for bundle pairs with a free fibre). | Matches. |
| G4.4 | HatcherAT lines 19135–19144 (p. 444): the Euler class as (p*)⁻¹j*(c), with Φ(e) = c⌣c. | Matches. |
| G4.5 | HatcherVBKT line 3011 (Theorem 3.1, p. 77) and line 3032 (Theorem 3.2, p. 78). | Matches. |
| G2.8 | MMSS line 2473 (Definition 18.2, p. 53), line 2477 (Theorem 18.3, p. 53: very special Γ-spaces are the fibrant ones), line 2513 (Proposition 18.8, p. 54). | Matches. |
| G2.11 | LurieHTT line 40160 (Definition A.3.2.16: excellent model categories, (A1)–(A4)); line 17500 (Proposition 5.2.7.12: functors out of a localization are those inverting S). | Matches the uses at README lines 1391 and 1938. |

The remaining sampled sections were passed by earlier rounds and are untouched: G1.3 and G5.4 at their locators, and G3.5 and G3.10 with computed rows in the previous report.

### Citations, ownership and overlaps

- **Citations.** `roadmaps resolve` finds no unresolved cross-roadmap citation or Lean name in this README. Ownership is unchanged since the previous round; no changed passage states a new object.
- **Conflicting heads.** #1187, #1808 and #1854 conflict with this head in shared folders. The description fixes the order “`GeneralizedCohomology`: this pull request → #1808 → #1854 → #1187 (pin bump)”, so these conflicts are announced.
- **Ids this README cites.** The overlap list finds no cited id that an open pull request drops, and no id defined only by an open revision.
- **Ids this pull request drops.** It still lists the three former layer anchors:
  - `#g2-…`, cited by DGFloer on main and #1212;
  - `#g4-…`, cited by DGFloer and RiemannianGeometry on main, #1187 and #1506;
  - `#g5-…`, cited by SpinGeometry on main and #1674.

  The README gives the old → new numbering in the brief's form: the table at lines 483–489, headed “Former heading and numbering”. The overlap tool never accepts a mapping for a heading anchor. Each citing passage names a G-subsection id that this head keeps (G2.10, G4.0b, G5.5), so this is not a finding.

### Adversarial computations

The first five rows are new. They give computed values for the supplier statements that the change outside the folder touches and that this roadmap consumes. The remaining 119 rows are carried unchanged from the previous report for the statements of this folder, all untouched; each is marked (r61) or (r60; carried in r61).

| Statement / convention | Instances tried | Values on the two sides or competing models | Result / change |
| --- | --- | --- | --- |
| TopK T1.5a first Stiefel groups, consumed by G4.6 and G5.0 | V₂(ℝ³), V₂(ℝ⁴), r = 1 | V₂(ℝ³) ≅ SO(3): m = 1 is odd, the boundary degree is 1−(−1)¹ = 2, so π₁ = ℤ/2, as G4.6's π₁(GL₃) = ℤ/2. V₂(ℝ⁴): m = 2, degree 1−(−1)² = 0, so π₂ = ℤ. r = 1, m ≥ 1: S^m with π_m = ℤ. m = 0 gives S⁰, excluded by m ≥ 1. | Pass (new). |
| Tau Ceti sphere connectivity now feeding T1.5a and T7.1 | n = 0, 1, 2 in `subsingleton_homotopyGroup_sphere_of_lt`; index of `homotopyGroupSphereAddEquiv` | n = 0: no k < 0, so S⁰'s two components are not claimed connected. n = 1: π₀(S¹) is a singleton. n = 2: π₀ and π₁ of S² are singletons. A basis indexed by `Fin (n+3)` gives π_(n+2) ≅ ℤ, which is m ≥ 2 with basis `Fin (m+1)`. | Pass at the pin (new). |
| TopK T7.1 stable range, consumed by G5.0 | n = 2, 3 | π_i O(n) → π_i O is bijective for i ≤ n−2 and onto at i = n−1. n = 2: π₀ ℤ/2 → ℤ/2 is bijective; π₁ SO(2) = ℤ → ℤ/2 is onto but not injective, so the bound is sharp. n = 3: π₁ ℤ/2 → ℤ/2 is bijective; π₂ 0 → 0 is onto. | Pass (new). |
| TopK T7.1 coefficient ring, consumed by G5.4 | KO₀ to KO₈ | ℤ[η,a,b^±]/(2η,η³,ηa,a²−4b) with \|η\| = 1, \|a\| = 4, \|b\| = 8 gives ℤ, ℤ/2, ℤ/2, 0, ℤ, 0, 0, 0, ℤ, which is the Bott table. c(a) = 2u² and c(b) = u⁴ give c(a²) = 4u⁴ = c(4b). c(r(u²)) = u² + conj(u²) = 2u² = c(a). | Pass. A relation a² = b would give 4u⁴ ≠ u⁴ (new). |
| TopK T7.1 Bott map ℤ×BO → Ω⁸(ℤ×BO), consumed by G5.0 and G5.4 | π₀ | KO⁰(pt) = ℤ → π₈(ℤ×BO) = KO⁻⁸(pt) = ℤ, n ↦ nb, is bijective. The wrong model “product with a² = 4b” gives n ↦ 4n, which is not an equivalence. | Pass. The contract fixes b (new). |
| Supplier contract `gapTrivialization` (README 304) | F=∅, B={*}; F={*}, E_*={*} | Elaborated variables `[Nonempty F] [∀ b, Nonempty (E b)]`, both used by `Classical.choice`. F=∅: `Nonempty F` fails. F={*}: both hold. | Pass; contract states both hypotheses. (r61) |
| G3.5 transport (b,z)↦z | Trivial Z=B×F; double cover z↦z² of S¹ | Trivial: (b,(b,v))↦(b,v)↦(b,(b,v)). Cover: E₁={1,−1}; (1,−1)↦−1↦(p(−1),−1)=(1,−1). proj(b,z)=b=p(z). | Pass; homeomorphism over B. (r61) |
| G3.5 nonempty fibres from charts | S¹ two-arc cover, F={0,1}; any b | Σρ_i(b)=1 ⇒ some ρ_i(b)>0 ⇒ b∈baseSet_i; e_i.symm(b,0) has proj b. With ρ only on s⊊B this would fail, but G3.5 and the Lean headline use ρ on all of B. | Pass. (r61) |
| G3.5 empty-fibre branch | F=∅: B={*}, ρ=(1); B=ℝ, ρ₁+ρ₂=1 | Z=∅, since e(z)∈B×∅=∅. Charts p⁻¹(V_n)=∅ ≃ V_n×∅=∅. For ℝ: V₁={ρ₁≠ρ₂}, V₂={ρ₁,ρ₂>0}, both charts ∅→∅. | Pass; gap cover unchanged. (r61) |
| Check ∅→{*}, F=∅ | ρ=(1) | gap({1})=max(0,1−0)=1; φ₁=1, φ_n=0 for n≠1; W₀=∅, W_n={*} for n≥1; f=Σkφ_k=1; {f<1}=∅⊆W₀; {f<n}={*}⊆W_(n−1) for n≥2. | Pass. (r61) |
| Check {*}→{*}, F={*} | ρ=(1) | Same φ, W, f; the chart {*}→{*}×{*} is bijective with inverse (*,*)↦*; instances exist. | Pass; exercises the supplier branch. (r61) |
| G3.8 cover/truncation, k=0 | E=Σ⁻¹Hℤ∨Hℤ∨ΣHℤ | π_(−1,0,1): E (ℤ,ℤ,ℤ), τ≥0 (0,ℤ,ℤ), τ<0 (ℤ,0,0). Each degree is short exact: 0→ℤ→ℤ; ℤ→ℤ→0; ℤ→ℤ→0. [S,τ≥0E]=ℤ=[S,E]. | Pass; directions as stated. (r61) |
| G3.8, k=1 | Same E | τ≥1 (0,0,ℤ), τ<1 (ℤ,ℤ,0); the cutoff “<0” would give (ℤ,0,0). | Pass. (r61) |
| G3.8, k=−1 | Same E | τ≥−1=E (ℤ,ℤ,ℤ), τ<−1=0; a strict “>−1” would give (0,ℤ,ℤ). | Pass; matches Schwede ⟨k⟩ and P_(k−1). (r61) |
| holim, identity tower HA | A=ℤ | δ(a)_r=a_r−a_(r+1): kernel = constants ≅ℤ; cokernel 0 (a₀=0, a_(r+1)=a_r−b_r). π₀=ℤ, π₋₁=0; ∏HA would give π₀=∏ℤ. | Pass. (r61) |
| holim, zero tower | A=ℤ | δ=id: kernel 0, cokernel 0, so holim≃0 while terms equal those of the identity tower. | Pass. (r61) |
| holim, ×2 tower Hℤ | b=(1,0,1,0,…) | lim=∩2^rℤ=0. Φ(b)=Σ2^r b_r∈ℤ₂ kills im δ (Φ(δa)=a₀∈ℤ) and its kernel is im δ (a_r=Σ_(s≥r)2^(s−r)b_s are integers). Φ(1,0,1,…)=Σ4^j=−1/3∉ℤ. π₋₁=ℤ₂/ℤ≠0; the levelwise inverse limit is 0. | Pass. (r61) |
| P0 S | Sphere ring | π₀S=ℤ, π₁S=ℤ/2; P0S=Hℤ: π₀ identity 1↦1, π₁ ℤ/2→0. The identity model keeps ℤ/2; the zero model sends 1↦0. | Pass. (r61) |
| P0 H𝔽₂ | H𝔽₂ | π₀=𝔽₂, π_(n≠0)=0, unit 1↦1; an “all-ℤ” model gives π₀=ℤ. | Pass. (r61) |
| P0 of the free ring | R=Sym(K₀), K₀≃S | π₀R=⊕H₀(BΣ_n)=ℤ[t], t^a t^b=t^(a+b); Map_CAlg(R,Hℤ)≃Ω^∞Hℤ≃ℤ discrete; ring maps ℤ[t]→ℤ are t↦a. | Pass; agrees with G3.8's mapping theorem. (r61) |
| G3.8 Lurie citation | R=S, k=∞, n=0 | 7.1.3.15(3): τ≤0 of a connective E∞-ring is E∞ with the same underlying spectrum; 7.1.3.18: discrete E∞ ↔ commutative π₀R-algebras. | Pass; connectivity hypothesis kept. (r61) |
| G3.10 CP∞ Check | CP^m, m=0,1,2,…; K(ℤ,2) | H²: 0, ℤ, ℤ, …; restriction ℤ→0, then id; lim={(0,a,a,…)}≅ℤ; H¹=0 ⇒ lim¹=0; skeleta X^(2m)=X^(2m+1)=CP^m. [CP∞,K(ℤ,2)]=ℤ. | Pass; R02 repaired. (r61) |
| Layer mapping table | Five rows | Slugs of the five headings equal the table fragments; the cited G-ids G2.10, G4.0b and G5.5 exist at lines 1290, 2832, 3940. | Pass; anchor fragments under Overlaps. (r61) |
| G1.1 reduced theory and empty wedge | Hℤ, empty family; two S¹ summands | H̃¹(*) = 0 = empty product; H̃¹(S¹∨S¹) = ℤ² = ℤ×ℤ. | Pass; a direct-sum cohomology axiom would fail for infinite families. (r60; carried in r61) |
| G1.1 arbitrary wedge and homology | Countably many S¹ | H̃¹ = ∏ℕℤ, containing (1,1,…); H̃₁ = ⊕ℕℤ, which excludes that vector. | Pass; sum/product are distinguished. (r60; carried in r61) |
| G1.1 native axioms and theory morphisms | Identity Hℤ; zero theory | Boundary square is δ = δ; all four extraordinary axioms hold with groups 0 in the zero theory. No dimension axiom is required. | Pass; no vacuous coefficient nonzero assumption. (r60; carried in r61) |
| G1.2 reduced/unreduced and pairs | ∅, *, S⁰; (D¹,S⁰) | 0 = H̃*(∅₊); H⁰(*) = ℤ⊕0; H⁰(S⁰) = ℤ² = ℤ⊕ℤ; H¹(D¹,S⁰) = ℤ = H̃¹(S¹). | Pass. (r60; carried in r61) |
| G1.3 mapping cones | f = id S¹; S¹ → * | C_id is contractible, reduced groups 0; C_(S¹→*) = S², H̃² = ℤ. | Pass; the cone is determined by the actual map. (r60; carried in r61) |
| G1.3 ordered MV | Two arcs covering S¹; cover (X,∅) | (a,b) ↦ (a−b,a−b), cokernel ℤ = H¹(S¹); empty-overlap connecting map 0. | Pass. (r60; carried in r61) |
| G1.3 cover swap | Generator represented by (1,0) modulo diagonal | Swapping the ordered restriction difference negates the connecting class: +1 ↦ −1. | Pass with the stated normalization. (r60; carried in r61) |
| G1.4 external product and twist | S¹∧S¹; S²∧S² | Generator×generator = sphere generator; twist degrees −1 = (−1)¹ and +1 = (−1)⁴. | Pass. (r60; carried in r61) |
| G1.4 suspension and unit | Degree-one a and suspension of 1; coefficient 1, zero ring | a×σ1 = −σ(a×1); 1·a = a; over the zero ring both sides are 0. | Pass. (r60; carried in r61) |
| G1.5 unique smash lift | X=Y=S¹ | H̃²(T²)=ℤ, H̃²(S¹∨S¹)=0; collapse pullback ℤ→ℤ is degree +1. | Pass; uniqueness also uses splitting in the preceding degree. (r60; carried in r61) |
| G1.5 zero-dimensional/disconnected input | X=S⁰; Y=S¹ | H̃¹(X×Y)=ℤ²; wedge restriction projects to one ℤ; its kernel is the other ℤ=H̃¹(X∧Y). | Pass. (r60; carried in r61) |
| G1.5 compactification | U=V=ℝ; U=∅ | (ℝ²)⁺ = S² = S¹∧S¹; ∅⁺ is a point and its smash is a point. A disjoint added point leaves ℝ² noncompact. | Pass. (r60; carried in r61) |
| G1.6 boundary signs | (D¹,S⁰), a=1; (S¹×D¹,S¹×S⁰), a=x | δ(1·e)=δe; δ(x×e)=−x×δe, while δe·x=−x·δe. | Pass in both left and right action identities. (r60; carried in r61) |
| G1.7 sphere shift | Hℤ, n=0,1,2; KU on S¹ | H̃^q(Sⁿ)=ℤ if q=n and 0 otherwise; KU^q(S¹)=KU^q(*)⊕KU^(q−1)(*). | Pass, including S⁰. (r60; carried in r61) |
| G1.7 circle multiplication | Augmentation-zero generator ε on S¹ | ε²=0; (a+bε)(c+dε)=ac+(ad+bc)ε in even coefficient degrees. | Pass; no spurious ε² term. (r60; carried in r61) |
| Cone/ordinary suspension convention | Two-term cone on the identity of ℤ | Acyclic cone has differential ±1; changing the cone-pair boundary changes σ to −σ. Moving suspension past degree n contributes (−1)^n, giving signs +,−,+ for n=0,1,2. | Pass with the README's fixed comparison; maps, not only abstract groups, are specified. (r60; carried in r61) |
| G2.1 Kan–Quillen classes | ∂Δ[1]→Δ[1]; Δ[1]→Δ[0] | First map: two components → one, so cofibration but not weak equivalence. Second: contractible → point is weak equivalence; Δ[1] is not Kan. | Pass; not all weak equivalences are fibrations. (r60; carried in r61) |
| G2.1 realization unit headline | Δ[0], Δ[1], simplicial circle | π₀ unit is 1→1; interval higher groups 0→0; circle π₁ map ℤ→ℤ is identity under realization comparison. | Pass; triangle identity gives the proof route once counit is supplied. (r60; carried in r61) |
| G2.2 sphere modules/block actions | Sphere levels 0,1,2 | S₀=S⁰, S₁=S¹, S₂=S²; transposition on S₂ has degree −1. Unit action has degree +1. | Pass; trivial permutation actions would fail. (r60; carried in r61) |
| G2.3 stable equivalences | λ:F₁S¹→S; Hℤ→0 | λ is stable, with true π₀ ℤ→ℤ; Hℤ→0 sends ℤ→0 and is not stable. | Pass; stable equivalence is not raw-colimit isomorphism. (r60; carried in r61) |
| G2.4 shifts/triangles | ΣHℤ; cofiber of 2:Hℤ→Hℤ | π₁ΣHℤ=ℤ=π₀Hℤ, π₀ΣHℤ=0; cofiber has π₀=ℤ/2, π₁=ker2=0. | Pass; homology/cohomology grading and triangle shift agree. (r60; carried in r61) |
| G2.4 derived products and modules | ∏Hℤ; unit sphere algebra | π₀∏Hℤ=∏ℤ, not ⊕ℤ; S-modules are spectra and the action of 1 is identity. | Pass. (r60; carried in r61) |
| G2.5 suspension adjunction | X=S⁰, E=Hℤ and Σ⁻¹Hℤ | [Σ∞S⁰,Hℤ]=ℤ=π₀Hℤ; [S,Σ⁻¹Hℤ]=0. Shifting source once gives π₁Hℤ=0. | Pass. (r60; carried in r61) |
| G2.5 Freudenthal | X=S¹ (k=1); X=S² (k=2) | π₁S¹=ℤ→π₂S²=ℤ is onto; π₂S²=ℤ→π₃S³=ℤ is iso; π₃S²=ℤ→π₄S³=ℤ/2 is onto, not injective. | Pass; endpoint is not overclaimed. (r60; carried in r61) |
| `subsetPair`, `subsetPairInclusion` | s=t={*}; empty s; identity inclusion | Based pair is (*,*), all relative sets singleton; no a:s exists when s=∅; identity sends the relative constant class to itself. | Pass; basepoint stays in s and target is (t′,s′). (r60; carried in r61) |
| `IsConnectedPair` | (D¹,{0}); (S¹,{*}); (two points,one point) | First is m-connected for every m; second is 0-connected but π₁=ℤ prevents 1-connectivity; third fails the path condition already at m=0. | Pass; π₀ coverage is not lost. (r60; carried in r61) |
| `homotopyExcision` | m=n=0; all spaces a point; two discs in S² | Bounds i+1<0 or =0 are false; point maps are singleton bijections. For disc pair C=S¹, m=n=1 and relative degree 2 gives ℤ→ℤ, onto. | Pass; connected intersection excludes the disconnected circle-decomposition trap. (r60; carried in r61) |
| G2.5 sphere stem/indices | n=0,1; complex rank1; quaternionic rank1 | π₀S=ℤ, π₁S=ℤ/2; real degrees of Thom fibres are 2 and 4, so loop corrections are 1 and 3. | Pass; rank jumps are not single suspensions. (r60; carried in r61) |
| G2.6 semistability | F₁S¹, S, Hℤ | Naive/true π₀: ⊕ℕℤ versus ℤ; ℤ versus ℤ; ℤ versus ℤ. Hℤ's other stable degrees are 0. | Pass. (r60; carried in r61) |
| G2.7 HA/represented theories | A=0, ℤ, 𝔽₂; S⁰ | π₀HA=A and π_n=0 for n≠0; H_A⁰(S⁰)=A², reduced value A. A=0 gives the zero spectrum. | Pass; ordinary and reduced values differ. (r60; carried in r61) |
| G2.8 Γ/group completion | Finite sets, π₀=ℕ; zero input | Group completion ℕ→ℤ sends n↦n; zero monoid gives 0. Multiplication of cardinalities sends (2,3)↦6. | Pass; additive completion alone would not specify multiplication. (r60; carried in r61) |
| G2.8 free commutative algebra/localization | Free algebra on S; invert 2 in Hℤ | π₀ is ℤ[t]; π₀ after inversion is ℤ[1/2], with 2·(1/2)=1. | Pass; integral coefficients have not been silently rationalized. (r60; carried in r61) |
| G2.9 classifiers | G=1, ℤ, S¹ | B1≃*, Bℤ≃S¹ with π₁=ℤ, BS¹≃CP∞ with π₂=ℤ and π₁=0. | Pass; treating S¹ as discrete gives the wrong homotopy degree. (r60; carried in r61) |
| G2.9 clutching and gauge | G=S₃, C₂; bundle over S¹; trivial bundle over * | Unframed classes are 3 conjugacy classes for S₃ and 2 for C₂; actual gauge transformations over * number 6 and 2. | Pass; gauge maps, components and conjugacy orbits are distinct. (r60; carried in r61) |
| G2.10 mapping fibres | id S¹; *→S¹; ∅→S¹; X→* | Fibres respectively contractible, ΩS¹ with π₀=ℤ, empty, and X. | Pass; contraction is not asserted over the target. (r60; carried in r61) |
| Hurewicz–Dold headline | Empty fibre; Möbius line; product projection | Empty initial-lift data force empty test source; lift exists uniquely. Product lift (a,t)↦(h(a,t),v(a)) works. Möbius fibre is ℝ despite global twisting. | Pass without compactness or global triviality. (r60; carried in r61) |
| G2.11 enriched/diagram models | Discrete one-object category; walking isomorphism | Inclusion has singleton→singleton mapping equivalences and is essentially surjective, but object counts 1→2. | Pass; Dwyer–Kan equivalence is not objectwise isomorphism. (r60; carried in r61) |
| G2.11 Joyal/core/marked fibrations | N[1]; groupoid BC₂ | Core of N[1] has two points and no nonidentity edge; core of BC₂ has the nonidentity involution. Over a point Cartesian edges are precisely these equivalences. | Pass. (r60; carried in r61) |
| G2.11 Joyal versus Kan weak equivalence | Δ[1]→N(walking isomorphism) | Both realizations contractible, but source has 1→0 Hom empty and target has one inverse arrow. | Pass; not a categorical equivalence. (r60; carried in r61) |
| G2.11 straightening/variance | Identity [1]→[1] | Both fibres are *, and transported map *→* is identity. For opposite variance the base arrow is reversed. | Pass for the stated coCartesian/Cartesian conventions. (r60; carried in r61) |
| G2.11 coherent pushout | Two intervals glued end-to-start | Simplicial pushout has 2 nonidentity edges; its ∞-categorical colimit Δ[2] has the additional composite 0→2. | Pass; ordinary pushout is not used without localization. (r60; carried in r61) |
| G2.11 stability | Spectra; pointed spaces at S⁰ | Σ⁻¹ΣS=S; S⁰→ΩS¹ has 2 source components versus ℤ target components. | Pass; pointed spaces are not declared stable. (r60; carried in r61) |
| G2.11 quotients | D=C; D=0; finite spectra modulo rationally zero ones | Quotients 0 and C; π₀ End(S) after killing torsion is colim(ℤ→2ℤ→3ℤ→⋯)=ℚ. | Pass; integral endomorphisms do not survive unchanged. (r60; carried in r61) |
| G2.11 Ind/idempotents | Zero stable category; even-Euler finite spectra | Ind(0)=0; χ(S)=1 excludes S from the latter C, while χ(S⊕ΣS)=0 and S is a retract. | Pass; compact need not mean originally representable. (r60; carried in r61) |
| G2.11 monoidal/LM/relative adjoints | Unit algebra S; identity base map | LM fibre over S is Mod_S=Sp; extension/restriction along id_R are both identity and unit/counit act as 1. | Pass on unit and variance. (r60; carried in r61) |
| G3.1 Brown and disconnected extension | H̃¹ on S¹; H̃⁰ on S⁰ | [S¹,K(ℤ,1)]=ℤ; [S⁰,ΩK(ℤ,1)]=ℤ, whereas a connected representing space would give a singleton on S⁰. | Pass; loop extension is necessary. (r60; carried in r61) |
| G3.2 representing spectrum/operations | Hℤ; identity operation; ×2 | Degree-zero maps Hℤ→Hℤ act by n↦n or n↦2n on ℤ; ordinary representing levels K(ℤ,n) have π_n=ℤ. | Pass; maps are not fixed by bare group isomorphisms. (r60; carried in r61) |
| G3.3 comparison headline | Identity Hℤ; ×2; infinite disjoint points | Identity induces id on ℤ and ⊕ℤ; ×2 fails the point-isomorphism hypothesis already on ℤ. | Pass, including arbitrary cell sets. (r60; carried in r61) |
| G3.3 opposite target | Cochain boundary on (D¹,S⁰) | Homology arrow H_i(X,A)→H_(i−1)(A) becomes H^(i−1)(A)→H^i(X,A); ℤ²→ℤ is the endpoint difference. | Pass; products replace coproducts in the opposite category. (r60; carried in r61) |
| G3.4 Milnor and tower sign | Constant ℤ tower; ×2 tower | δ(a)_n=a_n−a_(n+1), kernel diagonal ℤ, cokernel0; for ×2, kernel0 and cokernel ℤ₂/ℤ. | Pass; sign agrees with imported tower algebra. (r60; carried in r61) |
| G3.4 factorial telescope | ℤ ←2 ℤ ←3 ℤ ←4 ⋯ | lim=0; lim¹=Ext¹(ℚ,ℤ)≠0; telescope homology colimit is ℚ. | Pass; inverse and direct directions differ. (r60; carried in r61) |
| G3.5 increasing open cover | (−n,n) covering ℝ; equal weights 1/2,1/2 | Telescope and union both contractible. Gaps of singletons0, gap of pair1/2, hence φ₂=2·1/2=1. | Pass for the gap weights; no renormalizing denominator needed. (r60; carried in r61) |
| G3.5 exhaustion | Weights supported in sizes1 and3, values1/2 each | f=2; f<3 forces some positive weight at index<3 and hence membership in W₂. | Pass; finite unions have the required cover property. (r60; carried in r61) |
| G3.6 phantoms | S_ℚ→ΣHℤ; finite P; HF_p coefficients | Stage groups [S,ΣHℤ]=0, but maps from telescope include Ext¹(ℚ,ℤ)≠0; finite-source phantom group0; finite tower groups give lim¹0. | Pass; no uniqueness inferred from finite stages alone. (r60; carried in r61) |
| G3.7 compactness | P=S; P=∨ℕS | [S,∨Hℤ]=⊕ℤ; [∨S,∨Hℤ]=∏_n⊕_mℤ contains the diagonal basis family, absent from ⊕_m∏_nℤ. | Pass; infinite wedge is not compact. (r60; carried in r61) |
| G3.7 finite-source formula | X=S⁰, E=Hℤ, degree0/1 | colim π_k E_k=ℤ; colim π_k E_(k+1)=0; these equal π₀E and π₋₁E. | Pass; minus sign in cohomological degree. (r60; carried in r61) |
| G3.8 smash connectivity | Σ^aS, Σ^bS; a=−1,b=2 | Smash is Σ^(a+b)S=ΣS, with first nonzero group π₁=ℤ on both sides. | Pass for integer, not just nonnegative, cutoffs. (r60; carried in r61) |
| G3.8 unbounded convergence | E=∨_(j∈ℤ)Σ^jHℤ | Each fixed π_n=ℤ eventually stabilizes in either cutoff tower; lim¹ in that fixed degree is0, so both comparison maps give ℤ→ℤ. | Pass; no bounded-below assumption needed. (r60; carried in r61) |
| G3.9 localization/completion | Hℚ; Hℤ; H𝔽₂; p=2,3 | Hℚ completed at p is0; Hℤ gives Hℤ_p; H𝔽₂ is unchanged at2 and becomes0 at3. | Pass; not ordinary tensor completion for arbitrary spectra. (r60; carried in r61) |
| G3.10 nonabelian lim¹ | Constant S₃ tower, identity bonds | Choose g_(n+1)=g_n h_n recursively to move h to identity; orbit set has one element, although S₃ has six elements and is nonabelian. | Pass; additive cokernel is used only after abelian comparison. (r60; carried in r61) |
| G4.0 quaternionic carrier/charts | HP⁰, HP¹; v=(v₀,0) | HP⁰=*; HP¹ has affine ℍ plus one point; (v₀,0)=(1,0)·v₀ for unit v₀. | Pass; right-action convention matters. (r60; carried in r61) |
| G4.0 homogeneous ratio | v_i q and v_k q | (v_i q)(v_k q)⁻¹=v_i v_k⁻¹; reversing order would conjugate the ratio and fail invariance for noncommuting i,j. | Pass. (r60; carried in r61) |
| G4.0 dimensions | Sp0,Sp1,Sp2; Grℍ(0,2),Grℍ(1,2) | N(2N+1)=0,3,10; 4r(N−r)=0,4; 1-frame dimension7=S⁷. | Pass at rank0 and1. (r60; carried in r61) |
| G4.0 quaternionic orientation | Rank1 and2 | Complex-induced basis (1,i,j,−k) has determinant−1 against direct basis; for two blocks determinant(+1)=(−1)². | Pass; carried into G4.5/G5.0. (r60; carried in r61) |
| G4.0 stereographic derivative | w=0, tangent h | Derivative of (4w+(‖w‖²−4)v)/(‖w‖²+4) is h, not 2h; outward-first orientation at −v gives degree−1 before the specified reflection. | Pass at the pin. (r60; carried in r61) |
| G4.1 relative Leray–Hirsch | Point/empty base; fibre (D¹,S⁰); X×CP¹ | Groups A shifted by1, 0, and H*(X)⊕H*−2(X), respectively; map sends (a,b) to a+bx. | Pass. (r60; carried in r61) |
| G4.1 need for global basis classes | Hopf S¹→S³→S² | Fibre H¹=ℤ, but H¹(S³)=0, so no extending degree-one basis class; the invalid predicted H¹=ℤ is excluded. | Pass; numerability alone is insufficient. (r60; carried in r61) |
| G4.2 Thom space | Rank0 over B; rank1 over*; empty B | Th0=B₊, Thℝ=S¹, Th over∅=*; reduced cohomology gives H*(B), shiftedℤ,0. | Pass. (r60; carried in r61) |
| G4.3 orientations/Thom iso | Trivial line; Möbius line; zero coefficients | Trivial real line has integral generators±1; Möbius has no coherent integral generator but has unique mod2 class; zero theory has 0→0. | Pass; fibrewise normalization is required. (r60; carried in r61) |
| G4.4 Euler/relative square | Trivial positive-rank bundle; TS²; rank0 | Euler0; Euler pairs toχ(S²)=2; rank0 Euler1. Relation u²=e·u gives0 for trivial line, not u²=u. | Pass; positive-rank condition on a nonvanishing section matters. (r60; carried in r61) |
| G4.5 complex orientation | Tautological γ and γ* on CP¹ | ⟨c₁γ,[CP¹]⟩=−1, ⟨c₁γ*,[CP¹]⟩=+1; x=e(γ*) therefore maps to +h. | Pass; same sign in MU→Hℤ. (r60; carried in r61) |
| G4.5 quaternionic characteristic classes | Rank1 restricted to circle torus | Roots x,−x give c₂=−x²; p₁=−2c₂=2x²; direct-real Euler=−c₂=x². | Pass with (1,i,j,k) orientation. (r60; carried in r61) |
| G4.5 projective relation | CP⁰,CP¹; HP¹; real mod2 case | ℤ[x]/(x)=ℤ; ℤ[x]/(x²), |x|2; ℤ[a]/(a²), |a|4; H*(RP¹;𝔽₂)=𝔽₂[t]/(t²). | Pass with the respective orientation hypotheses. (r60; carried in r61) |
| G4.6 low-rank GL | k=0,1,2,3,4 | π₁=0,0,ℤ,ℤ/2,ℤ/2; π₃=0,0,0,ℤ,ℤ²; π₀ trivial only at k0. | Pass. (r60; carried in r61) |
| G4.6 conjugation and stabilization | Reflection in GL2; Spin3→Spin4→Spin5 | Conjugation sends n↦−n; π₃ maps n↦(n,n)↦2n. Reflection at rank4 swaps (a,b). | Pass; semidirect product is not a direct product. (r60; carried in r61) |
| G4.6 disconnected source | S⁰→GL1; clutching over S¹ | Map classes form (ℤ/2)² of size4; bundle classes number2. | Pass; the two constructions are distinguished. (r60; carried in r61) |
| G5.0 Spin ranks/classifier | Native Spin0; Spin1; Spin2; stable BSpin | Native Spin0=1, Spin1=C₂, Spin2=S¹; stable π1,2,3=0, π4=ℤ. | Pass; geometric rank0 μ₂ is a separate branch. (r60; carried in r61) |
| G5.0 sum orientation coherence | k=0,1,2,3 | ε_k=1,1,−1,−1; ε_k ε_(k+1)(−1)^k=1 in all four cases. | Pass; interleaving sign is retained. (r60; carried in r61) |
| G5.0 inverse and obstruction | Oriented Spin ξ; nonoriented Möbius class | w₂(−ξ)=0+0=0 for Spin; formal inverse formula includes w₁² otherwise and cannot be omitted universally. | Pass in the oriented domain. (r60; carried in r61) |
| G5.0 coefficient/Hopf normalization | S⁴ and degrees1–8 | BSpin groups0,0,0,ℤ,0,0,0,ℤ; Spin4 ℤ²→Spin5 ℤ is addition; Hopf c₂ pairing+1 on the specified sphere class. | Pass; all-CW statement retains mapping-space lim¹. (r60; carried in r61) |
| G5.1 finite duality | S, ΣS, S∨ΣS; E=Σ⁻²Hℤ | Duals S,Σ⁻¹S,S∨Σ⁻¹S; D(ΣS)∧E=Σ⁻³Hℤ=F(ΣS,E). | Pass without connective E. (r60; carried in r61) |
| G5.2 Atiyah duality | *, S¹⊂ℝ²; empty manifold | Duals S, S∨S⁻¹,0; Σ⁻²Th(ν_S¹)=Σ⁻²(S²∨S¹)=S∨S⁻¹. | Pass; framing is not assumed generally. (r60; carried in r61) |
| G5.3 Thom diagrams | Trivial rank-i bundles over*; empty bases | hocolim Σ⁻ⁱΣ∞Sⁱ=S with π₀ℤ; empty bases yield0. | Pass; coherent stabilization determines maps. (r60; carried in r61) |
| G5.3 coefficient hypotheses | MO/ℤ, MO/𝔽₂, MSO/ℤ | Degree-zero pairs: ℤ/2 versusℤ (excluded); 𝔽₂=𝔽₂; ℤ=ℤ. | Prior R02 repaired. (r60; carried in r61) |
| G5.4 canonical maps | S→MO→H𝔽₂; MU→Hℤ | π₀ maps ℤ→ℤ/2→𝔽₂ reduce mod2; MU→Hℤ acts ℤ→ℤ by identity and π₂ℤ→0. | Pass. (r60; carried in r61) |
| G5.4 real/complex/quaternionic indices | KU degree2; KO degree4,8; quaternionic line | β invertible in KU; a²=4b in KO; [ℍ] forgets to real rank4 and complex rank2. | Pass; realification and complexification are not identity on ranks. (r60; carried in r61) |
| G5.5 Clifford generators | Displayed 2×2 e₁,e₂ | e₁²=e₂²=I; e₁e₂=diag(−i,i)=−e₂e₁; grading conjugates each to its negative. | Pass. (r60; carried in r61) |
| G5.5 mixed neutral module | Λ(ℝ)=ℝ⊕ℝ | (ε+ι)²=+I, (ε−ι)²=−I, anticommutator0; algebra dimension4=dim M₂ℝ. | Pass; wrong sign generator excluded. (r60; carried in r61) |
| G5.5 complexification/real CFC | Orthogonal v,w; z=v+iw; A=ℝ | Hilbert norm√2 versus Taylor norm1; for v+iv both√2. A-module operators reduce to real Hilbert bounded/compact operators. | Pass; √2 bound is attained. (r60; carried in r61) |
| G5.5 operator level versus classifier | Level0; real levels1 and4 | Level0 has2 points; ample degree0 classifier has π₀ℤ; π₀K_op,1=KOⁱ(*), i=1, is0, while π₀K_op,4=ℤ. | Pass; reversed degree would give ℤ/2 at1. (r60; carried in r61) |
| G5.5 sign coherence | p=q=r=1; general parity | 1+2=2+1≡1; both expressions reduce to pq+pr+qr. | Pass. (r60; carried in r61) |
| G5.5 configuration | 2₊, dimensions(1,1); equal nonorthogonal lines | Segal map(1,1)→(1,1); orthogonal fold dimension2, wrong equal-line fold dimension1. | Prior R05 repaired. (r60; carried in r61) |
| G5.5 Hermite embedding | h₀,h₁,h₂ | Norm squares1,1,1; parities even,odd,even; ⟨h₀,h₂⟩=0 from 2∫x²e⁻ˣ²−∫e⁻ˣ²=0. | Prior R05 repaired; z→h₂ has correct parity. (r60; carried in r61) |
| G5.5 MU orientation | π₀,π₂; γ* over CP¹ | Maps id_ℤ, zero, and pairing+1 respectively; opposite orientation gives−1. | Prior R05 repaired. (r60; carried in r61) |
| Stable-stem headline G5.6 | n=0,k=3; n=1,k=4; excluded Hopf degree | π₄S³=ℤ/2 and π₆S⁴=ℤ/2 are torsion; π₃S² containsℤ but k≥n+3 excludes it. | Pass; no positive stable free summand. (r60; carried in r61) |
| Rational Hurewicz headline G5.6 | k=0; k=1,X=S¹; k=2,X=S² | Bounds0 give no claim; degree1 mapℤ→ℚ spansℚ; degree2 mapℤ→ℚ has kernel0. At degree3 only surjectivity to H₃S²=0 is asserted. | Pass; Hopf π₃S²=ℤ does not violate an unasserted injection. (r60; carried in r61) |
| G5.6 nonabelian degree1 | X=BS₃ and BC₂ | H₁(−;ℚ)=0 in both cases; image span0=whole target; no assertion that π₁ itself is abelian or injects. | Pass. (r60; carried in r61) |
| G5.6 stable rational spectral result | E=S, Σ⁻¹Hℤ, H𝔽_p | Rational π₀S=ℚ=H₀(S;ℚ); shifted Hℤ hasℚ in degree−1 on both sides; H𝔽_p rationalizes to0. | Pass; full spectral statement remains in README. (r60; carried in r61) |
| G5.7 Borel/coherent families | Trivial torus; free S¹ action on itself; trivial action on* | Bases *, contractible, CP∞ respectively; integral Borel ring of* isℤ[x], |x|2, notℤ alone. | Pass. (r60; carried in r61) |
| G5.7 support duality | Compact U; U=ℝ,d=1 | Compact-support cochains equal F(R∧U₊,R); onℝ they areΣ⁻¹R, matchingΣ⁻¹P_R(ℝ), since P_R(ℝ)≃R. | Pass; noncompact support is not omitted. (r60; carried in r61) |
| G5.7 sections and extension space | Split triangle; A=0 | Zero connecting map admits constant nullhomotopy and B≃A⊕C; when A=0 the section space is contractible. | Pass; nullhomotopies are data, not a mere equality of classes. (r60; carried in r61) |

## Not verifiable

These sources are settled as uncertified (paywalled) and are cited by their locators. I did not request them again:

- ABSClifford §11
- McDuffSegal §4
- SegalCategories §§1–4 (G2.8 cites §1 alongside MMSS, whose §18 I read)
- JoachimKO §§2–4
- QuillenHA Ch. II §3

The change touches none of these citations. The computed rows do not certify the proofs of the large constructions; those remain the roadmap's work.

## Source issues

- none

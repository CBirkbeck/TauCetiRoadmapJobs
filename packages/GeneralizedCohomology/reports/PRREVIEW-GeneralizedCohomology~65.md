# Review of GeneralizedCohomology (pull request #1807 at 89357f3)

**Verdict:** accepted

Incremental re-review of the 131 lines of `TauCetiRoadmap/GeneralizedCohomology/README.md` changed since `3f935aa`; `Suggested.lean` is unchanged. No finding.

## Previous findings

- R01 — repaired: README 2469–2481 transports a projection p:Z→B to `Bundle.TotalSpace F E`, derives fibre nonemptiness from the covering charts when F is nonempty, and treats F=∅ by the empty chart; the contract at 306–309 states both instances.
- R02 — repaired: README 2818: “π₀ Map(CP⁰,Y)=H²(CP⁰;ℤ)=0 is a singleton … the first restriction ℤ→0 is not injective, and only restrictions between positive stages are bijections.”
- R03 — repaired: README 2706–2716 replaces the restated law by nine computed Checks: three for cover and truncation (k=0,1,−1), three for holim (identity, zero and ×2 towers), three for P0 (S, H𝔽₂, free ring).
- R04 — repaired: the five headings read `## Layer k: <title>` (README 495, 749, 2269, 2831, 3498), with a table at 487–493 from each former heading to its Layer anchor.

## Verified sound

| Statement (changed passage) | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| G3.5 empty-fibre branch (2476–2480) | ∅→{*}, F=∅, partition (1); ∅→∅ | Gap of the one-element set 1−0=1, φ₁=1·1=1, φ₀=0·gap=0; V₁={*}, p⁻¹(V₁)=∅={*}×∅; f=Σkφ_k=1, {f<2}={*}⊆W₁. Empty base: all sets ∅. | Pass; no pinned instance is used. |
| G3.5 nonempty branch and transport (2469–2476) | {*}→{*}, F={*}; Möbius band over S¹, F=ℝ | (b,z)↦z and z↦(p(z),z) compose to identities both ways; chart inverse of (b,v) lies in E_b, so E_b≠∅; Möbius fibres ℝ≠∅ with two arcs, V₁∪V₂=S¹. | Pass; both instances of the pinned signature are supplied. |
| Supplier contract for `PartitionOfUnity.gapTrivialization` (306–311) | The pinned variable block | `[TopologicalSpace (TotalSpace F E)] [Nonempty F] [∀ b, Nonempty (E b)]` at `TauCeti/Topology/FiberBundle/GapTrivialization.lean:32–34`; the definition at `:73`. README states the same three. | Pass. |
| G3.8 cover/truncation Checks (2708–2710) | E=Σ⁻¹Hℤ∨Hℤ∨ΣHℤ, k=0, 1, −1 | π in degrees (−1,0,1): k=0 cover (0,ℤ,ℤ), truncation (ℤ,0,0); k=1 (0,0,ℤ), (ℤ,ℤ,0); k=−1 (ℤ,ℤ,ℤ), (0,0,0). Each pair sums to (ℤ,ℤ,ℤ). | Pass; a swapped direction or a strict cutoff changes a listed value. |
| G3.8 holim Checks (2711–2713) | Identity, zero and ×2 towers | δ(a)_r=a_r−f(a_(r+1)): identity gives ker A, coker 0; zero gives δ=id, ker=coker=0; ×2 gives ker 0, coker ℤ₂/ℤ via Σ2^r b_r, δ(a)↦a₀∈ℤ; (1,0,1,…)↦Σ4^j=−1/3∉ℤ. | Pass; the ordinary inverse limit gives 0 in the third case. |
| G3.8 structured P0 Checks (2714–2716) | S, H𝔽₂, free commutative ring on S | π₀: ℤ, 𝔽₂, ⊕_n π₀(S_hΣn)=ℤ[t]; π₁S=ℤ/2↦0; ring maps to Hℤ = Ω^∞Hℤ = ℤ, discrete, t↦a; t↦0 and t↦1 differ, both unital. | Pass. |
| G3.10 CP∞ Check (2818) | Stages m=0,1,2; odd skeleta | H²: 0,ℤ,ℤ; H¹: 0,0,0; tower 0←ℤ←ℤ, limit {(0,a,a,…)}=ℤ, lim¹ of the zero tower 0; X^(2m)=X^(2m+1)=CP^m repeats each term once, same limits. | Pass. |
| Conventions: CW structure on k(X×Y) (130–135) | X=Y=S¹; X=*, Y arbitrary | S¹×S¹: product cells 1,2,1, χ=0, locally compact so k(X×Y)=X×Y; *×Y has Y's cells. Hatcher's CW complexes are Hausdorff, as the sentence requires. | Pass; agrees with AlgebraicTopology §4.5. |
| AlgebraicTopology renumbering (36 citing lines) | Each cited stage opened at this head | 4.5 Kelley product CW, pair quotient and mapping cone (README 1768, 1790, 1799); 4.8 coreflection and suspension–loop adjunction (1975); 4.9 realization product (2046); 4.10 CW approximation (2081); 8.11a loop CW type and interval product (4728, 4798); 8.11b EM loops (4852). | Pass; every *Needs:* line agrees with its Dependencies paragraph. |
| Layer heading table (487–493) | Five link targets | Slugs of the five headings: `layer-1-reduced-relative-and-multiplicative-theories`, `layer-2-a-concrete-…`, `layer-3-brown-…`, `layer-4-generalized-lerayhirsch-…`, `layer-5-finite-duality-…`; each equals its link. | Pass. |

The rows for untouched statements stand as in the previous review, of `3f935aa`.

- Source locators checked against the text: 7. HatcherAT line 22693 (Theorem A.6, p. 524), line 453 (Example 0.6, pp. 6–7), line 9541 (Theorem 3.19, p. 220), line 13665 (§3.F, pp. 312–313), line 20409 (Corollary 4J.4, p. 474); LurieHA line 46729 and line 46757 (Propositions 7.1.3.15 and 7.1.3.18, pp. 1218–1219). The seeded sample falls in the changed passages only at G1.3, G1.5 and G2.5 (stage numbers), covered by the renumbering row.
- Library declarations opened at the pin: `PartitionOfUnity.gapTrivialization` with its variable block, `TauCeti/Topology/FiberBundle/GapTrivialization.lean:32–34` and `:73`.
- Cross-roadmap citations resolved: 36 lines citing AlgebraicTopology Stages 4.4, 4.5, 4.8, 4.9, 4.10, 8.11a and 8.11b, against `TauCetiRoadmap/AlgebraicTopology/README.md` at this head, whose lines 997–1027 read Stage k item m as §k.m.
- Gate: every check passes (the worker's record; my run agrees, its 24 `outside-folder` lines being the sibling folders the pull request owns). The diff outside those folders is empty.
- Dependency check: `depcheck: 244 roadmaps, 2252 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `TauCetiRoadmap/GeneralizedCohomology/Suggested.lean`: exit 0, seven `sorry` warnings, nothing else; the file is byte-identical to the one read at `3f935aa`, so the signature and one-tactic probes of that review stand.
- The pull request's text: the GeneralizedCohomology paragraph and the ownership sentences naming §4.9 and §4.10 agree with this head; the change adds or drops no supplier, section id or Lean declaration, and “rewritten in the house shape” covers the `## Layer k:` headings.
- Remarks on text outside the change: main's SpinGeometry line 486, DGFloer line 743 and RiemannianGeometry lines 964 and 1406 link to the former `#g2-…`, `#g4-…`, `#g5-…` anchors; the G-ids they name are unchanged and the table gives the destination. README 2933 attributes `ordinaryPairQuotient` to AT4.4, where AlgebraicTopology line 5391 lists it under §4.5.

Overlap check: read SimplicialCategories (#2269), Straightening (#2270), BordismFormalGroups, StableHomotopyKTheory, TangentialBordism; the Bergner model structure and marked straightening are shared with #2269 and #2270, owner GeneralizedCohomology G2.11 (taken from BordismFormalGroups F6.5, both on main), which the open roadmaps cite; nothing else shared.

Source independence: changed passages only; 7 passages compared with 2 sources (HatcherAT, LurieHA), none shared beyond a forced statement of under a dozen words; largest share HatcherAT, about 21 of roughly 100 page locators; the diff adds, removes and reorders no layer, so the contents were not compared again.

## Not verifiable

- ABSClifford, McDuffSegal, SegalCategories, JoachimKO and QuillenHA remain settled as uncertified (paywalled); none is cited by a changed passage.

## Source issues

- none

## For the human reviewers

- none

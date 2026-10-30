# GATE-QWittVectors~11 — answers to human review of 74b3029

Repairs are committed as 65c0d99 on top of 74b3029 (not pushed). The review's four findings F01–F04 are H01–H04 below. The quoted review was cut off inside its "Not verifiable" section; nothing after that point could be numbered.

## H01 (CBirkbeck) — applied

`TauCetiRoadmap/QWittVectors/README.md`: a new `### From TauCetiRoadmap.KTheoryFiniteLocalFields` subsection (line 86) imports that roadmap's series groups `𝕎_N(R)` and `𝕎(R)` (from its Conventions), its Verschiebung t↦tⁿ, its Teichmüller class (1−at)⁻¹, and the quotient `𝕎_(mn)(R)/V_n𝕎_m(R)` (§5.16a). It also says that the coordinate carrier, γ_N, its four compatibilities and the restriction limit stay in §1.4a, because they need §1.3's coordinate ring. In §1.4a (lines 239, 241), U_N(R) for N≥1 and U_∞(R) are now identified with the supplied 𝕎_N(R) and 𝕎(R). U_0 is trivial and stays local, and so does the extension to nonunital rings through the unitization kernel. The quotient API bullet (old line 247) and its m=1, n=2 Check (old line 258) are deleted. In Downstream consumers, the KTheoryFiniteLocalFields entry and the clause "the general coordinate ring and comparison have the same owner here" (old line 1405) are deleted. Scope (line 9), the §1.4a *Needs:* line and Layer 1 Dependencies now cite KTheoryFiniteLocalFields Conventions.

Note for KTheoryFiniteLocalFields, outside this pull request. At its head afe02e8, §5.16a still constructs γ_N with all its compatibilities and calls this "the outbound contract for QWittVectors §§1.1–1.5". That is an upward citation: in the merge order it is at line 67 and QWittVectors at line 186. That roadmap needs to cut §5.16a down to its own series model and quotient calculation; its Conventions line 28 already assigns the series group to it and general big Witt theory to QWittVectors.

## H02 (CBirkbeck) — answered

The finding is correct. `packages/QWittVectors/design/plan.json` lists exactly seven gap slugs: cyclotomic-contract, ordinary-derham, cohomology-completion, prismatic-frobenius, pd-presentation, dga-bockstein, dga-quotient. `framed-skew-product` is not among them. PrismaticCohomologyPartII at 45495a1 states `QDeRham.skewDGA` (§5.18) only "for a framed q-PD datum (P,S,J) over D flat over Z_p[[q−1]]", so the arbitrary-base product is not supplied. This job may edit only README.md and Suggested.lean, so the slug was not added. The worker or a maintainer must add `framed-skew-product` (supplier PrismaticCohomologyPartII, needs = the README line 122 contract) to the plan's `gaps` before acceptance. The README text needs no change.

## H03 (CBirkbeck) — answered

Confirmed again at the new head: the failure is environmental. `lake build TauCetiRoadmap.QWittVectors.Suggested` was run twice and failed both times, with 42 and 87 error lines. Every error is a missing Mathlib `.olean` ("failed to open file … .olean"), and none is in `TauCetiRoadmap.QWittVectors.Suggested`. The branch's `lake-manifest.json` pins Mathlib 6b7abb3c, while the shared packages directory was checked out at f6090c70. Its reflog shows checkouts switching between those two revisions at 17:11, 17:19, 17:26, 17:29, 17:29 and 17:30 UTC. The only change to Suggested.lean here is one section comment, so it elaborates exactly as at 2a7475f, whose targeted build passed. Once the shared packages directory was back on the pin 6b7abb3c, and no other build was running, the targeted build at head 65c0d99 passed: `Build completed successfully (8976 jobs)`, exit 0.

## H04 (CBirkbeck) — applied

The Layer 1 title "Big Witt rings and shared homological algebra" is now "Big Witt rings and arithmetic fracture", at README line 144 and in the Suggested.lean line 65 section comment. The same leftover appeared in two other places, and both are fixed. "How to read the build" (line 142) dropped "the supplied Koszul convention" from Layers 1–2. Layer 1 Dependencies (line 323) dropped DerivedModuleAlgebra §0.K.1, §§1.1, 1.5, 1.8, DGAInfinity Layers 0–1 and AInfCohomology §§AI.1.4, AI.1.7. No *Needs:* line in §§1.1–1.8 cites any of them; they belonged to the deleted §§1.9–1.11.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| U_N(R) = supplied 𝕎_N(R), N≥1 | N=0, N=1 over ℤ | N=0: R[t]/(t)=R, so the constant-one units are {1}, and the supplied group needs N≥1, so U_0 stays local; N=1: U_1={1+at}≅(ℤ,+) and γ_1(a)=1+at | agree |
| U_∞ = supplied 𝕎(R) | ℤ | both are 1+tℤ[[t]]; γ_∞(τ(a))=(1−at)⁻¹ in both | agree |
| V_n = supplied t↦tⁿ (N=mn, L=m) | m=2,n=2,x=(1,1) | γ_2(x)=1+t+2t², substituted gives 1+t²+2t⁴; γ_4(0,1,0,1)=(1−t²)⁻¹(1−t⁴)⁻¹=1+t²+2t⁴ mod t⁵ | agree |
| Quotient follows from the supplied quotient (deleted bullet) | m=1,n=2 over ℤ; n=1 | coordinates: V_2(a)=(0,a), quotient ≅ℤ via x_1; series: (1+at+bt²)(1+ct²)=1+at+(b+c)t², class a; γ_2(x_1,x_2)=1+x_1t+(x_1²+x_2)t², t-coefficient x_1; n=1: both quotients 0 | agree, so no separate target is needed |
| Nonunital U_N as kernel of U_N(ℤ⋉R)→U_N(ℤ) | R=ℤ | ℤ⋉ℤ≅ℤ×ℤ via (n,r)↦(n,n+r); U_N(ℤ×ℤ)=U_N(ℤ)², kernel of the first projection ≅U_N(ℤ)=𝕎_N(ℤ) | consistent with the supplied group |
| Layer 1 Dependencies equals the union of §§1.1–1.8 *Needs:* | each Needs line | the removed items occur in no Needs line from 1.1 to 1.8 | removed |
| Layer 1 title | the subsections | §§1.1–1.6 are big Witt; §1.8 is finite-prime fracture; no other homological target | title matches |

## Ownership, citations, signatures

- The series group is owned by KTheoryFiniteLocalFields: its Conventions line 28, checked at the head afe02e8 of its open pull request through `roadmaps show`. γ_N is owned here because its source is §1.3's coordinate ring. KTheoryFiniteLocalFields is a permitted supplier (merge order line 67).
- `roadmaps resolve`: cross-roadmap citations found nowhere: none. The 11 Lean-name leads are this roadmap's own declarations and supplier names, as before.
- `#check @name`: not re-run. Elaboration needs the same broken packages directory. The four declarations are byte-identical to 74b3029, and their elaborated types in `signatures.md` match the README statements of §1.1, §1.2 and §8.1 with no dropped binders. Nothing changed.

## Build and gate

- `lake build TauCetiRoadmap.QWittVectors.Suggested`: **passed** at head 65c0d99, exit 0, `Build completed successfully (8976 jobs)`. The only diagnostics are two `declaration uses 'sorry'` warnings (Suggested.lean lines 82 and 102). The earlier failures came from missing Mathlib `.olean` files: the shared packages directory had been switched from the pin 6b7abb3c to f6090c70 (last switch at 17:53 UTC), and the build passed once it was back on 6b7abb3c.
- Gate: `gate QWittVectors: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 210 roadmaps, 1446 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line; the one new edge is QWittVectors → KTheoryFiniteLocalFields.

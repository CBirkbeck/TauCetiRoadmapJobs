# Review of CharacteristicClasses (pull request #1807 at e65eef3)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 35d5208. `TauCetiRoadmap/CharacteristicClasses/` is byte-identical between 35d5208 and e65eef3. The four commits in between change only sibling folders of this pull request: BordismFormalGroups, ClassifyingSpaces, RigidAnalyticGeometry and TopologicalKTheory. So this review checks every citation this roadmap makes into those four folders against their new text, re-runs the gate, the dependency check and the elaboration, and recomputes the statements whose supplier text changed. No finding.

## Previous findings

- The previous report (PRREVIEW-CharacteristicClasses~69) raised no finding, so nothing is carried. The two r68 findings it recorded as repaired stay repaired, because the text is unchanged. R01 (r68): `README.md:2802–2814` still reads "the Thom map of the dual-Koszul class of ν followed by the open extension". R02 (r68): `README.md:1520–1526` still reads "a closed 2m-form Ψ … on the simplicial manifold N(G;G/T) whose restriction to the fibre G/T has nonzero integral".

## Verified sound

**Gate and dependency check.**
- The worker's gate at e65eef3 (`scratch/gate.md`) passes every check, including `build=0`.
- My re-run of the gate reports only `outside-folder=26`. These are the README and `Suggested.lean` of each of the 13 sibling folders that the brief names as this pull request's own, so this is not a finding. Every other counter is 0.
- `git diff --stat origin/main...HEAD` outside the 14 listed folders is empty.
- `git diff --stat 35d5208 HEAD` touches 6 files:
  - `BordismFormalGroups/README.md`
  - `ClassifyingSpaces/README.md` and `ClassifyingSpaces/Suggested.lean`
  - `RigidAnalyticGeometry/README.md` and `RigidAnalyticGeometry/Suggested.lean`
  - `TopologicalKTheory/README.md`

  `lake-manifest.json` is untouched, so the pins are the same as in r69.
- The dependency check prints:

      depcheck: 236 roadmaps, 2163 edges, 0 problem(s)

**Lean.**
- `lake env lean` on `TauCetiRoadmap/CharacteristicClasses/Suggested.lean` gives five `declaration uses sorry` warnings (lines 149, 173, 189, 213, 245) and nothing else.
- I ran a scratch copy with `#check @name` for all five theorems. The elaborated types match `scratch/signatures.md` and the README statements compared in r68:
  - C2.1 uniqueness: fibrewise ±g against the orientation.
  - C2.1 existence: an `IsThomClass` for an oriented bundle.
  - C2.2: `[T2Space B]`, a CW structure on `univ`, no cells above the rank, `2 ≤ finrank`, the iff with a continuous nowhere-zero section.
  - C2.3: `FiniteCWType M`, `hE : finrank = n+1`, the orientation compatibility hypothesis.
  - C7.3a: `1 ≤ k`.

  No binder is lost.
- The `signatures.md` entries `ContMDiffConstSMul` and `of` are words inside docstrings, as before.
- The headline list, the not-statable list and the one-tactic probe stand from r68, because the statements and the pins are unchanged. The headlines are C2.1 (two theorems), C2.2, C2.3 and C7.3a. The not-statable list covers C2.1 Thom isomorphism, C2.2 Gysin, C3.4/C3.6, C4.2, C5.2, C5a.1, C5a.5 and C6.3–C6.5.

**Citations into the four changed sibling folders (13 resolved at this head).**
- **TopologicalKTheory T1.5a** (`TopologicalKTheory/README.md:443–486`). It is cited at `README.md:172`, 650–653 (C1.1d), 1080, 1772, 1978 and 1981. It still supplies:
  - the last-vector sphere fibration;
  - π₁(SO(n)) = 0, ℤ, ℤ/2 for n ≤ 1, n = 2, n ≥ 3;
  - the relative triple (SO(n), SO(k+1), SO(k)).

  The diff only adds that the sphere fibres' connectivity and π_m are Tau Ceti's. I checked both declarations at the pinned `TauCeti/AlgebraicTopology/Sphere/HomotopyGroup.lean`:
  - `TauCeti.subsingleton_homotopyGroup_sphere_of_lt` (line 66): `finrank E = n+1`, `Nat.card N < n`;
  - `TauCeti.homotopyGroupSphereAddEquiv` (line 110): an orthonormal basis on `Fin (n+3)`.

  Neither changes what C1.1d consumes.
- **TopologicalKTheory T3.4** (`TopologicalKTheory/README.md:1099–1110`). It is cited by C6.3 at `README.md:2741`. The coneBoundary sign is rewritten from "signs(−0,+1)" to "sign − at 0 and + at 1", which means the same thing. The new text adds that reversing the cone parameter negates the boundary, which C6.3 also states (`README.md:2747–2748`).
- **TopologicalKTheory T4.8, T5 items 1, 3 and 5, T6.4 and T7.4** (the doubled-space kernel formula, `TopologicalKTheory/README.md:1891–1896`). The diff changes only spacing in these items. C6.3's "kernel comparison of TopK T7.4" (`README.md:2699`) and C6.4–C6.5's dual-Koszul pushforward still resolve.
- **TopologicalKTheory T1, T1.3–T1.4, T1.5, T1.6 and T1.6a.** These are cited at `README.md:76–87`, 172, 414–435, 524–549, 1076–1090, 1101, 1560, 1876–1935, 2181, 2923–2995 and 3113–3116. Their items keep their numbers and claims; the diff changes only spacing ("rank 0", "time 0").
- **ClassifyingSpaces** (`README.md:58`, 184, 1079): the weak-topology countable join of a discrete group. It is still owned there (`ClassifyingSpaces/README.md:12`, 112: `TauCeti.indexedJoin`, `TauCeti.universalGSpace G`). The pinned `indexedJoin` is a realized simplicial complex (`TauCeti/AlgebraicTopology/SimplicialComplex/Join/Indexed.lean`), so "weak topology" is right.
- **AlgebraicTopology Stage 8.8b**, cited by C1.5a (`README.md:200`, 1004–1005, 1025, 1089). The ClassifyingSpaces commit narrows what it says Stage 8.8b compares, to Milnor's model only. C1.5a needs only the bar model's normalized pointed interface. `AlgebraicTopology/README.md:2810–2818` states it: for a Hausdorff CW K(G,1) Z with κ_Z, it gives a pointed c_G: Z → Bπ, identity on G, a pointed homotopy equivalence by 8.5. `AlgebraicTopology/README.md:3275` and `ClassifyingSpaces/README.md:1199–1201` both name this roadmap as the consumer of that ℤ/2 model. The citation resolves.
- **BordismFormalGroups and RigidAnalyticGeometry.** This README cites neither. The only added or removed lines in the four sibling diffs that mention this roadmap are the ClassifyingSpaces downstream-consumer sentence above, which is unchanged in substance.
- `scratch/citations.md` lists nothing unresolved.
- `scratch/overlaps.md` lists no dropped id and no id defined only by an open revision. #1808 and #1854 conflict in this folder; the description's `merge-order` block fixes "**this pull request** → #1808 → #1854" for `CharacteristicClasses`. The description's sentence "CharacteristicClasses receives the comparisons with infinite projective spaces" matches C1.5a.
- No new object or supplier enters this folder, so the ownership checks of r67–r69 stand.

**Seeded sample.** None of the 15 sampled targets (C1.3, C2.1, C2.3, C2.3a, C2.5, C3.1, C3.3, C4.1, C5.1, C5.2, C5.4, C6.3, C6.4, C7.3a, C7.AdjointHopfObstruction) falls in a changed passage. Their locators stand as verified in r67–r69.
- I re-read C6.3, whose supplier T3.4 changed. In `hatcher-vbkt`, Proposition 4.2 is at line 4220 (printed p. 110). Proposition 4.3 is at line 4237 (p. 110, the image of ch on K̃(S²ⁿ)). Proposition 4.5 is at line 4266 (printed p. 111, line 4256 header): rational ch is an isomorphism for finite cell complexes, by cell induction from the spheres (lines 4268–4270). This agrees with `README.md:2754–2757`.
- C1.3, C6.4, C7.3a and C7.AdjointHopfObstruction cite TopK T1 or T5 only for items whose claims did not change (above).

**Adversarial table.** New rows have values computed this round for every statement whose supplier text changed. Rows marked r69 are carried from PRREVIEW-CharacteristicClasses~69 (and through it from r68/r67) for statements this head leaves untouched.

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| C1.1d π₂(SO(k))=0, via TopK T1.5a | k=2, 3, 4, 5 | π₂(SO(2))=π₂(S¹)=0 (cover ℝ); π₂(SO(3))=π₂(S³)=0 by SU(2)→SO(3); k=4: π₂(S³)=0 since 2<3 in `subsingleton_homotopyGroup_sphere_of_lt` (n=3), so π₂(SO(3))→π₂(SO(4)) onto, 0; k=5: 2<4, same | holds | none |
| C1.1d π₁(SO(k)) input | k=1, 2, 3 | 0, ℤ, ℤ/2, matching T1.5a (`TopologicalKTheory/README.md:474–476`) and `TauCeti.specialOrthogonalGroupFundamentalGroupMulEquiv` (n≥3) | holds | none |
| C1.5a RP∞ via AT8.8b | Z=RP∞, G=ℤ/2 | π₁=ℤ/2, π_k=0 for k≥2 (S^∞ contractible); c_G identity on π₁, so weak equivalence, homotopy equivalence by AT8.5; H¹(RP∞;ℤ/2)=Hom(ℤ/2,ℤ/2)=ℤ/2, one nonzero class | holds | none |
| C1.5a CP∞ via AT8.10 | S¹→S^∞→CP∞ | π₂(CP∞)≅π₁(S¹)=ℤ, generated by CP¹; Hurewicz gives H₂=ℤ; f_h sends it to +1 | holds | none |
| C6.3 endpoint normalization, TopK T3.4 sign − at 0, + at 1 | γ∈K^(−1)(I,∂I); reversed parameter | ch(u⁻¹)ch(γ)=(−v⁻¹)(−U_R v)=U_R=ch¹(δ_K(0,1)); reversed: −U_R on both δ_K and δ_H | holds; consistent with the new T3.4 wording | none |
| C6.3 Checks | point; S²; S¹ | Hper^n(pt)=ℚv^(−n/2) (n even), 0 (n odd); K⁰(S²)⊗ℚ=ℚ²=H⁰⊕H²v; K¹(S²)=0=Hper¹(S²); Hper^(−1)(S¹)=H¹(S¹)v=ℚ=K^(−1)(S¹)⊗ℚ | hold | none |
| C6.5 and its three Checks (r69) | point in ℂ; CP¹⊂CP²; a line ν | (1−e^(−x))/x=1 at x=0; ch(1−[O(−1)])=h−h²/2=f_H(1−η/2); ch(a)(1−e^(−x)) both sides | hold | none |
| C2.6 Euler-integral input (r69) | SU(2), U(3) | ∫Ψ₀=χ(S²)=2, χ(Fl(ℂ³))=6 | holds | none |
| C5.3 disconnected G (r69) | O(2) | invariants ℚ[e]^(ℤ/2)=ℚ[e²]=ℚ[p₁] | holds | none |
| C6.4 statement and Checks (r69) | rank 1 both conventions; rank 0 | (1−e^x)/x=−1−x/2−x²/6=−e^x·Td⁻¹; (1−e^(−x))/x=1−x/2+x²/6; 1 | holds | none |
| C2.4 embedding Gysin (r69) | diagonal of S²; point in Sⁿ | Δ*Δ_!(1)=e(TS²)=2=χ(S²); i*i_!(1)=0 | holds | none |
| C7.3a `not_exists_isImmersion_realProjectiveSpace` (r69) | k=1, 2 | k=2: w(RP⁴)=1+a+a⁴, w̄₃=a³≠0 against normal rank 2; 2^(k+1)−2≥2 | holds | none |
| C2.1 (two theorems), C2.2, C2.3 (r69) | as in r68 | u=±g, (1,−1); TS²: 2≠0; S², T², S³: 2, 0, 0 | hold | none |
| C1.1a, C1.2a, C1.4, C1.5, C2.5, C3.3, C4.3, C5.4, C5.5, C6.1, C6.2, C7.1, C7.2, C7.3, C7.5 (r69) | as in r68 | e.g. C3.3: p₁(CP²)=3h²; C7.1: L₃[CP⁶]=945/945=1; C6.2: ch₂(TCP²)=3h²/2 | hold | none |
| C1.1b, C1.3, C1.5a, C2.3a, C3.1, C3.2, C3.4a, C3.5, C3.6, C4.1, C4.2, C5.1, C5a.1–C5a.3 (r69, from r67) | as in r67 | e.g. C5.1: tr ad(e₁)²=−8, λ=1/4; C3.5: c₁(TCP²)=3h odd | hold | none |

**Remark (no change asked of this folder).** I noticed this while resolving the AT8.8b citation. The ClassifyingSpaces text rewritten at this head says the K(π,1) classification of pointed maps is owned there, "not in the algebraic-topology roadmap", and that the nerve–Milnor comparison is AlgebraicTopology's 8.8a/8.8b (`ClassifyingSpaces/README.md:75–88`). `AlgebraicTopology/README.md:94–102` and 2831–2860 assign both the other way round. That is for those two folders' reviews. C1.5a consumes only the normalized pointed interface, which AT8.8b states at this head whichever way that is settled.

## Not verifiable

- C2.4 and C2.5 (Bott–Tu §6), C3.3 (Milnor–Stasheff Theorem 15.3), and the Milnor–Stasheff §4 half of the C7.3a docstring. These are uncertified sources, cited by locator and not read. None is in a changed passage.
- No README locator is flagged as unverified.

## Source issues

- none

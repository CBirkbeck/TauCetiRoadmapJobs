# Review of SchemeKTheoryOperations (pull request #1229 at 1dfb7dd)

**Verdict:** accepted

## Previous findings

- R01 — repaired: README lines 3059, 3065, 3069 and 3168 now use an arbitrary field, distinguish Borel–Serre's algebraically closed scope, and compute the real conic's residue-weighted Todd degree.
- R02 — repaired: README lines 1302, 1712 and 1788 name existing supplier sections; §4.11 assigns finite Witt schemes to SchemeAndStackFoundations, formal Witt geometry to §3.8, and coefficient reconstruction to EnhancedDerivedSheaves.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §7.4 GRR over a field | Spec ℂ → Spec ℝ, structure sheaf | K-transfer rank = 2; Chow pushforward degree = [ℂ:ℝ] = 2; both Todd classes = 1 | agree | field restriction repaired |
| §7.4 GRR realization | Line i:P¹ → P² over 𝔽₂; H³=0 | (1−e⁻ᴴ)(1+3H/2+H²) = H+H² = i_*(1+h) | agree over rational Chow groups | broader field scope tested |
| §7.4 Hirzebruch and curve consequence | P¹ over 𝔽₂, O(−2) | χ=0−1=−1; degree of (1−2H)(1+H)=−1; deg D+1−g=−2+1=−1 | agree | broader field scope tested |
| Layer 7 conic Check | C: x²+y²+z²=0 over ℝ | χ(O_C)=1−0=1; T_C=O_C(1), deg c₁=2; Todd degree=2/2=1; unweighted count gives 1/2 | distinguishes residue degree | new Check verified |
| §4.11 finite Witt carrier | R=𝔽₂; n=1,2 | W₁(R)=𝔽₂; W₂(R)=ℤ/4; units reducing to 1 are {1,3}, cardinality 2 | supplier matches | precise supplier citation |
| §4.11 coefficient reconstruction | Compatible rank-one tower ℤ/2ⁿ; zero tower | Rlim ℤ/2ⁿ=ℤ₂, reduction modulo 2ᵐ=ℤ/2ᵐ; Rlim 0=0 | supplier matches | E4.2/E4.5 resolved |
| §1.7 amplitude refinement cited by §4.11 | 𝔽₃[0], amplitude [0,0] | Map has three discrete elements; core π₁=𝔽₃×=ℤ/2, hence core truncation bound 1, not 0 | roadmap retains extra degree | none |
| Layers 3–4 dependency repairs and §7.4 supplier | 23 distinct section/layer identifiers in the two suppliers | 23 resolve on main; missing identifiers=0; dependency problems=0 | agree | malformed identifiers replaced |

Untouched statement rows stand as in the previous review of `91f9d39`.

- Source locators checked: 5 across 3 sources—Borel–Serre §1, p.97 and §7, p.113 (lines 45–48, 643–669); Weibel II.8.10, PDF p.163 (lines 8661–8674); BS17 §4 opening and proof of Theorem 11.2(2), pp.46–47 (lines 698–700, 2151–2186).
- Pinned declarations opened: 3—`TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Stable.lean:79`, `TauCeti/AlgebraicGeometry/Frobenius/Perfect.lean:69`, `Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean:158`; five scratch `#check @name` signatures match the README, with no lost binders.
- Supplier identifiers resolved: 23 in EnhancedDerivedSheaves and SchemeAndStackFoundations on main; the latter's §5.8 projective hypothesis covers proper maps between quasi-projective varieties. Citation resolver reports zero missing cross-roadmap citations.
- Gate: every check passed; dependency output: `depcheck: 240 roadmaps, 2179 edges, 0 problem(s)`.
- Targeted build passed; standalone elaboration and signature probe each report only three `sorry` warnings. Lake additionally emits its Mathlib import-module advisory.
- Pull-request title, prose and `roadmap-summary` agree with this head's addition; zero removed headings/declarations, zero added/dropped supplier roadmaps, zero changes outside the folder.
- Overlap check: read GeneralAlgebraicKTheory, KTheoryFiniteLocalFields, KTheoryLowDegrees, MotivicEtaleKTheory, SchemeKTheoryOperationsPartII, EnhancedDerivedSheaves, SchemeAndStackFoundations and AlgebraicKTheory; categorical K-machines belong to GeneralAlgebraicKTheory, classical ring K-theory to AlgebraicKTheory, enhanced reconstruction to EnhancedDerivedSheaves, finite Witt schemes and geometric GRR to SchemeAndStackFoundations, ordinary scheme K-theory and universal higher Chern classes here, arithmetic instances to their consumers, and formal-support extensions to Part II.
- Source independence: changed passages only; 5 mathematical prose passages compared with 3 sources, no copied expression or reused material; largest share Weibel, 209 of 684 inline citation links. No layer was added, removed or reordered; the contents comparison stands as in the review of `91f9d39`.

## Not verifiable

- Inherited access limits from `91f9d39`: TT90, Soulé's operations paper, GS99, Riou and Geisser were not obtained through the sources service; no new assertion here relies on guessing their contents.
- Quillen, Schlichting, Zhang.2021 and LiLiu.2021 were not reopened; the Quillen edit correctly identifies a University of Rochester faculty host, whose licence class the service still reports as unknown.
- Gillet.1981 remains settled as uncertified. Borel–Serre is now verified from Numdam; all newly added source locators were readable.

## Source issues

- **Misprint** in BS17 at proof of Theorem 11.2(2), assertion (1), p.47, line 2167: the source says the fixed-amplitude perfect core is (b−a)-truncated; it should be (b−a+1)-truncated, while mapping spaces are (b−a)-truncated; affects the proof.

## For the human reviewers

- **Licence.** TT90 is linked at a personal site (README line 3206); the previous sources-service search assigned no licence class and found no other source. The copy's status remains unsettled.
- **Licence.** Quillen (a third party's university page), Schlichting (another author's university page), GS99 (web archive of a preprint server), Zhang.2021 (a university archive) and Schneider (a seminar's book-chapter copy) have hosts not classified here.

